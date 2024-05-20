#! /usr/bin/python 
"""
parsnip - parse snippets
Copyright (C) 2024 gsobell

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
"""
import re
in_file = './UltiSnips/tex.snippets'  
out_file = './README.md' 

def parser(in_file, out_file):
    head_file = './head.md' 
    tail_file = './tail.md' 
    header = "| Trigger | Name | LaTeX | Flags | Context | \n| --- | --- | --- | --- | --- |"
    with open(in_file, 'r') as f:
        lines = f.readlines()
    snips = []
    new = []
    par = ''
    inside = False
    for k, line in enumerate(lines):
        line = line.strip()
        if not line:
            continue
        elif line[0] == "#" and lines[k - 1].strip() == '' and lines[k + 1].strip() == '':
            snips.append([None, None, line, None, None]) # section title
        elif ("snippet" in line) and not ("endsnippet" in line):
            if "context" in lines[k - 1]:
                context = lines[k - 1].split()
                new = [context[1]]
            else:
                new = [None]
            new.extend([line.split(" ")[1], line.split('"')[1], line.split(" ")[-1]])
            if '"' in  new[-1] or new[-1] == new[0]:
                new[-1] = None
            # ^^ needs to be fixed, incorrect when no flags present.
            inside = True
        elif "endsnippet" in line:
            new.append(par)
            snips.append(new) 
            new = []
            par = ''
            inside = False 
        elif inside:
            par += line

    markdown_table = ''
    for snip in snips:
        context, trigger, name, flags, latex = snip
        if not trigger:
            markdown_table += "\n"+ "#" + name + "\n" + header
            continue
        latex = re.sub(r'\$\d', ' ', latex)
        if context:
            markdown_table += f'\n| {trigger} | {name} |  $${latex}$$ | {flags} | {context} |'
        elif "begin" in latex:
            #latex = re.sub(r'\n', '<br>', latex)
            markdown_table += f'\n| {trigger} | {name} | `{latex}` | {flags} | None |'
        else:
            markdown_table += f'\n| {trigger} | {name} | {latex} | {flags} | None |'

    with open(head_file, 'r', encoding='utf-8') as file:
        head = file.read()
    with open(tail_file, 'r', encoding='utf-8') as file:
        tail = file.read()
    with open(out_file, 'w') as output:
        output.write(head + "\n" +markdown_table + "\n" + tail)
    print(f"Success! {out_file} generated.")

parser(in_file, out_file)
