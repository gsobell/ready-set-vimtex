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

in_file = './Ultisnips/tex.snippets'  
out_file = './README.md' 
read_me = './README-head.md' 
markdown_table = "| Trigger | Name | Plaintext | LaTeX | Flags | Context | \n| --- | --- | --- | --- | --- | --- |"


def parser(in_file, out_file):
    global markdown_table
    with open(in_file, 'r') as f:
        lines = f.readlines()
    snips = []
    new = []
    par = ''
    inside = False
    for k, line in enumerate(lines):
        line = line.strip()
        if not line or line[0] == "#":
            continue
        elif ("snippet" in line) and not ("endsnippet" in line):
            if "context" in lines[k - 1]:
                context = lines[k - 1].split()
                new = [context[1]]
            else:
                new = [None]
            new.extend([line.split(" ")[1], line.split('"')[1], line.split(" ")[-1]])
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

    for snip in snips:
        context, trigger, name, flags, body  = snip
        latex = re.sub(r'\$\d', '', body)
        if context:
            markdown_table += f'\n| {trigger} | {name} | {body} | $$ {latex} $$ | {flags} | {context} |'
        else:
            markdown_table += f'\n| {trigger} | {name} | {body} | {latex} | {flags} | None |'

    with open(read_me, 'r', encoding='utf-8') as file:
        head = file.read()
    with open(out_file, 'w') as output:
        output.write(head + "\n" +markdown_table)
    print(f"Success! {out_file} generated.")

parser(in_file, out_file)
