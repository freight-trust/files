#!/bin/bash -e

echo ">>>>>>>> LETS GO >>>>>>>>>>>>>>>>>"
echo -ne '#####                     (33%)\r'
sleep 1
echo -ne '#############             (66%)\r'
sleep 1
echo -ne '#######################   (100%)\r'
echo -ne '\n'


mkdir .github
cd .github
curl https://raw.githubusercontent.com/freight-chain/boilerplate/master/.github/ISSUE_TEMPLATE/feature_request.md --output feature_request.md
curl https://raw.githubusercontent.com/freight-chain/boilerplate/master/.github/ISSUE_TEMPLATE/bug_report.md --output bug_report.md 
touch action.yaml
cd -
curl https://raw.githubusercontent.com/freight-chain/boilerplate/master/.codeclimate.yml --output .codeclimate.yml
curl https://raw.githubusercontent.com/freight-chain/boilerplate/master/VERSIONING.md --output VERSIONING.md
curl https://raw.githubusercontent.com/freight-chain/boilerplate/master/CONTRIBUTING.md --output CONTRIBUTING.md
curl https://raw.githubusercontent.com/freight-chain/boilerplate/master/BUILDING.md --output BUILDING.md
curl https://raw.githubusercontent.com/freight-trust/legal/master/src/terms-of-service.md --output TERMS_OF_SERVICE.md
curl https://raw.githubusercontent.com/freight-trust/legal/master/src/disclaimer.md --output DISCLAIMER.md
curl https://raw.githubusercontent.com/freight-trust/legal/master/src/data-breach-response-policy.md --output DATA_BREACH_RESPONSE.md

# COMPLIANCE
curl https://gitlab.com/fr8/omnibus/-/raw/prod/preview-src/corporate/ccpa.md.adoc --output ccpa.adoc

# CORP
curl https://gitlab.com/fr8/omnibus/-/raw/prod/preview-src/corporate/irp.adoc --output incident-response-plan.adoc
curl https://gitlab.com/fr8/omnibus/-/raw/prod/preview-src/corporate/defects.adoc --output responsible-disclosure.adoc
curl https://gitlab.com/fr8/omnibus/-/raw/prod/preview-src/corporate/document-retention-policy.adoc --output document-retention.adoc


## LICENSE
curl https://raw.githubusercontent.com/freight-trust/legal/master/src/used/MPL-2.0.jsonld --output MPL-2.0.jsonld
curl https://raw.githubusercontent.com/freight-trust/legal/master/src/used/MPL-2.0 --output LICENSE

# <!-- GPG -->
curl https://gitlab.com/fr8/omnibus/-/raw/prod/preview-src/corporate/6F6EB43E.asc --output 6F6EB43E.asc

# SETUP LINTS
touch .prettierrc.json
cat << EOF > .prettierrc.json
{
  "trailingComma": "es5",
  "tabWidth": 4,
  "semi": false,
  "singleQuote": true
}
EOF

touch .textlintrc.json
cat << EOF > .textlintrcc.json
{
    "rules": {
        "no-start-duplicated-conjunction": {
            "interval" : 2 // interval of sentences
        }
    }
}
EOF

touch .codecov.yaml
cat << EOF > .codecov.yaml
coverage:
  parsers:
    javascript:
      enable_partials: yes
comment: false
EOF

# 
source ~/.bashrc
# echo {}> .prettierrc.json
npx prettier write .
npx textlint .




EOF
# git grep -Ln SPDX-License-Identifier * > no-spdx.txt \
#    ':^.git*' ':^.ci/*' ':^.codeclimate.yml' \
#    ':^README' ':^MAINTAINERS' ':^VERSION' \
#    ':^*/packages' ':^*/README' \
#    ':^license/' ':^contracts/' ':^src' ':^migrations/' \
#    ':^*.sol' ':^*.d.ts' ':^*.js' ':^*.data' ':^*.cfg' ':^*.txt'
#
#echo
#echo "Files with redundant boilerplate"
#echo "________________________________ "
#
#git grep -l SPDX-License-Identifier | \
#    xargs grep -l 'Redistribution'
