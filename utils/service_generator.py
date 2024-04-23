import sys

with open ('template/template.service', 'r') as f:
    template = f.read()
    template = template.replace('%%TARGET%%', sys.argv[1])