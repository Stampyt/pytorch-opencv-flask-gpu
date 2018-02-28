#!/bin/bash
nvidia-docker run -e USE_GPU=True -e LOGGINGLEVEL=INFO -e GOOGLE_API_KEY=<your api key> -p 5000:5000 stampytlpccnnapi_lpc_cnn_gpu:0.3.1