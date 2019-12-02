#!/bin/bash

# Change the file to create a new container

HOSTNAME=$(hostname)
#HOSTNAME=`hostname`
VERSION_CONTAINER=${VERSION:-v1}
COMMIT_ID=${COMMIT_ID:defaultf2bfed773333bfd03e554f3aff73f571d572e93f}


cat > /usr/share/nginx/html/index.html <<EOF
<HTML>
<HEAD>
<TITLE>Page Hosted in Containerised= $HOSTNAME</TITLE>
</HEAD>
<BODY>
<H1>THIS IS HOST [ $HOSTNAME  ]</H1>
<H2>And we're running version: $VERSION_CONTAINER</H2>
<h1> This Container displays runtime info </h1>
<b>Hostname=</b> $HOSTNAME        <br>
<b>Tag Version=</b> $VERSION_CONTAINER      <br>
<b>Git Commit ID=</b> $COMMIT_ID  <br>
</BODY>
</HTML>
EOF

env > /usr/share/nginx/html/env.html
mkdir /usr/share/nginx/html/healthz /usr/share/nginx/html/hostname /usr/share/nginx/html/version
cat > /usr/share/nginx/html/hostname/index.html <<EOF

EOF
cat > /usr/share/nginx/html/version/index.html <<EOF

EOF
chmod 777 /usr/share/nginx/html/healthz
cat > /usr/share/nginx/html/healthz/index.html <<EOF
healthy
EOF

nginx -g "daemon off;"
