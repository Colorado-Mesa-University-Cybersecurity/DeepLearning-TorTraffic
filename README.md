# DeepLearning Tor Traffic

Detecting and Classifying Tor Traffic using Deep Learning Techniques test

## Dataset

-   Downloaded from: https://www.unb.ca/cic/datasets/tor.html

## Data Cleanup

-   dropped samples with Infinitiy values
-   dropped samples witn NaN values
-   dropped 'Source IP' and 'Destination IP' columns (features)

## Datasets Summary

### Scenario-A

-   Labeled TOR and nonTOR dataset
    -   build model to classify encrypted TOR traffic from non TOR traffic

| File Name     |   Tor | Non Tor | Total |
| ------------- | ----: | ------: | ----: |
| merged_5s.csv | 14507 |   69680 | 84187 |

### Scenario-B

-   contains only the TOR encrypted dataset
    -   build model to classify various types of TOR traffic

| File Name     | FILE-TRANSFER | BROWSING | VIDEO | AUDIO | VOIP | CHAT |  P2P | MAIL | Total |
| ------------- | ------------: | -------: | ----: | ----: | ---: | ---: | ---: | ---: | ----: |
| merged_5s.csv |          1663 |     2644 |  1529 |  1026 | 4524 |  485 | 2139 |  497 | 14507 |

# Deep Learning Frameworks

-   perfomance results using various deep learning frameworks are compared

## Fastai-Pytorch

-   https://www.fast.ai/
-   uses PyTorch (phttps://pytorch.org/) as the backend

## Keras

-   https://keras.io/
-   using Tensorflow and Theano as backend
-   https://www.tensorflow.org/
-   https://github.com/Theano/Theano

# Results

### Scenario-A

| Dataset       | Framework        | Accuracy (%) |
| ------------- | ---------------- | -----------: |
| merged_5s.csv | Fastai-Pytorch   |        99.96 |
|               | Keras-Tensorflow |           \* |
|               | Keras-Theano     |           \* |

### Scenario-B

| Dataset       | Framework        | Accuracy (%) |
| ------------- | ---------------- | -----------: |
| merged_5s.csv | Fastai-Pytorch   |        99.72 |
|               | Keras-Tensorflow |           \* |
|               | Keras-Theano     |           \* |

# References

-   Arash Habibi Lashkari, Gerard Draper-Gil, Mohammad Saiful Islam Mamun and Ali A. Ghorbani, "Characterization of Tor Traffic Using Time Based Features", In the proceeding of the 3rd International Conference on Information System Security and Privacy, SCITEPRESS, Porto, Portugal, 2017.
