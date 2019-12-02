#!/bin/bash

# Change the file to create a new container

HOSTNAME=$(hostname)
#HOSTNAME=`hostname`
ENV_CONTAINER=$(env)
VERSION_CONTAINER=${VERSION:-v1}
COMMIT_ID=${COMMIT_ID:defaultf2bfed773333bfd03e554f3aff73f571d572e93f}

cat > /usr/share/nginx/html/index.html <<EOF
<HTML>
<HEAD>
<TITLE>Page Hosted in Containerised= $HOSTNAME</TITLE>
</HEAD>
<BODY>
<H1>THIS IS HOST [ <var>HOSTNAME</var>]= $HOSTNAME </H1>
<H2>And we're running version: $VERSION_CONTAINER</H2>
<h1> This Container displays runtime info </h1>
<b>Hostname=</b> $HOSTNAME        <br>
<b>Tag Version=</b> $VERSION_CONTAINER      <br>
<b>Git Commit ID=</b> $COMMIT_ID  <br>
<hr>
<H1>THIS IS $ <var>ENV</var> Value for HOST  $<var>HOSTNAME</var>= $HOSTNAME </H1>
<p>
The Following Section contains an output of the Containers ENV value ENV 
</p>

<p>
<code>$ENV_CONTAINER</code>
</p>

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
