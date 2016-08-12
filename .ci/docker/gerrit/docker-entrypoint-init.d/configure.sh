#!/bin/bash -ex

set_gerrit_config() {
  gosu ${GERRIT_USER} git config -f "${GERRIT_SITE}/etc/gerrit.config" "$@"
}

set_gerrit_config auth.type HTTP
set_gerrit_config auth.httpHeader X-Remote-User
