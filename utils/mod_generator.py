import sys

INDICATOR = sys.argv[3]
ACTION = sys.argv[1]

COMMENT = INDICATOR + ACTION

with open ('template/mod_template.sh', 'r') as f:
    template = f.read()
    template = template.replace('%%INDICATOR%%', INDICATOR)
    template = template.replace('%%ACTION%%', ACTION)
    template = template.replace('%%COMMENT%%', COMMENT)

with open ('mod.sh', 'w') as f:
    f.write(template)
