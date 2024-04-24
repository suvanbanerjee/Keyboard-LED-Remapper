import sys

with open ('template/template.service', 'r') as f:
    template = f.read()
    template = template.replace('%%DESC%%', sys.argv[3]+sys.argv[1])

with open (sys.argv[3]+'.service', 'w') as f:
    f.write(template)