# docker-edgeml

I recommend adding host helper scripts for each of the commands BonsaiTrain, BonsaiPredict, ProtoNNTrain, ProtoNNPredict like

```bash
#!/bin/bash
  
docker run -v $(pwd):/workspace -w /workspace edgeml:latest /EdgeML/BonsaiTrain "$@"
```