
# note: these first 2 commands happen on the machine that runs the deployment whether that's your local machine, jenkins or circleci
# docker build -t bertomartin/sample-node . && docker run --rm bertomartin/sample-node npm test
#!/bin/bash
docker build -t bertomartin/sample-node .
docker push bertomartin/sample-node

ssh deploy@104.131.107.79 << EOF
docker pull bertomartin/sample-node:latest
docker stop web || true
docker rm web || true
docker rmi bertomartin/sample-node:current || true
docker tag bertomartin/sample-node:latest bertomartin/sample-node:current
docker run -d --restart always --name web -p 3000:3000 bertomartin/sample-node
EOF