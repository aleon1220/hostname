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
<TITLE>Environent $ECS_ENVIRONMENT Hosted in Containerised= $HOSTNAME</TITLE>
</HEAD>

<BODY>
<h1>Running Environment is [ <var> $ECS_ENVIRONMENT </var>]  </h1>
<h1>THIS IS HOST [ <var>HOSTNAME</var>]= $HOSTNAME </h1>
<h2>And we're running version: $VERSION_CONTAINER</h2>
<hr> <br>
<h3> This Container displays runtime info </h3>
<b>Hostname=</b> $HOSTNAME        <br>
<b>Tag Version=</b> $VERSION_CONTAINER      <br>
<b>Git Commit ID=</b> $COMMIT_ID  <br>
<hr>
<h1>THIS IS $ <var>ENV</var> Value for HOST  $<var>HOSTNAME</var>= $HOSTNAME </h1>
<p>
The following section contains an output of the Containers ENV value ENV 
</p>

<p>
<code>$ENV_CONTAINER</code>
</p>

</BODY>

</HTML>
EOF

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
