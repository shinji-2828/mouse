#!/bin/bash

set -x 

# docker-compose exec -T app sh /go/src/mouse/tools/sqlboiler/codegen.sh
BOIL_MAJOR_VER=v4
BOIL_FULL_VER=${BOIL_MAJOR_VER}.14.1

NULL_MAJOR_VER=v8
NULL_FULL_VER=${NULL_MAJOR_VER}.1.2


go install github.com/volatiletech/sqlboiler/${BOIL_MAJOR_VER}@${BOIL_FULL_VER}
go install github.com/volatiletech/sqlboiler/${BOIL_MAJOR_VER}/drivers/sqlboiler-psql@${BOIL_FULL_VER}
go get github.com/volatiletech/null/${NULL_MAJOR_VER}@${NULL_FULL_VER}
go get github.com/volatiletech/sqlboiler/${BOIL_MAJOR_VER}/queries@${BOIL_FULL_VER}



TOML_FILE="/go/src/mouse/tools/sqlboiler/sqlboiler.toml"
# sqlboiler psql -d -c "$TOML_FILE" --wipe --no-tests --add-global-variants | jq .
sqlboiler psql -d -c "$TOML_FILE" --wipe  | jq .

go mod tidy