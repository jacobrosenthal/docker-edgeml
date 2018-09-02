# docker-edgeml

Probably
```bash
docker build -t edgeml:latest -f Dockerfile .
```
If you get Killed Returned a non-zero code: 137 you need to increase your docker resource allocation

I recommend adding host helper scripts for each of the commands BonsaiTrain, BonsaiPredict, ProtoNNTrain, ProtoNNPredict like:
```bash
#!/bin/bash

docker run -v "$(pwd)":/workspace -w /workspace edgeml:latest /EdgeML/BonsaiTrain "$@"
```
