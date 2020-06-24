# DeepLearning Tor Traffic

Detecting and Classifying Tor Traffic using Deep Learning Techniques

## Dataset Summary

### How to Download
 The ISCXTor2016 dataset is available [here](https://www.unb.ca/cic/datasets/tor.html), along with descriptions about the dataset. The redirect to download the data is located at the bottom of the webpage. As of June 2020, both the CSV and PCAP zip files are available for download. For the work shown here, unless otherwise noted, we are using the CSV files. However, many of the files provided from the `TorCSV.zip` file are actually ARFF files. As a consequence of this, these may have to translated to another filetype (such as CSV), if absolutely necessary.  

- Go to the scripts folder after cloning the repository.
- dont have to change usermode or permission, just type 'bash CIC-Dataset-Download.sh'
- It will automatically create a folder CICDataSet-TOR in the parent directory and download the data for both of the scenario right there.
- *Note:* Downloading TorPcaps dataset takes substantial amount of time. 
 Script for downloading dataset is available: [here](https://github.com/rambasnet/DeepLearning-TorTraffic/tree/master/scripts)
 
### Cleanup
-   dropped samples with Infinitiy values
-   dropped samples witn NaN values
-   dropped 'Source IP' and 'Destination IP' columns (features)

### Dataset Summary
The available data is divided into Scenarios A and B. Scenario A was created with the goal of determining whether the provided sample is an example of Tor or non-Tor traffic. As a result, in addition to the features CIC-UNB have provided, the `label` column contains the 'TOR' and 'nonTOR' classifications. While determining whether traffic is Tor or non-Tor may be helpful research, Scenario B offers a dataset that differentiates Tor samples based on their type of traffic; namely FTP, browsing, video and audio-streaming, VoIP, chat, mail, and P2P traffic.   

Each scenario contains multiple sub-datasets. As mentioned in Arash *et al.*, these subsets are split-up based on the flow-timeout times. For their experiments, the team used 10, 15, 30, 60, and 120 seconds and provided a dataset for each timeout. Below, we go through each scenario and describe the files available.

#### Scenario-A
Let's dive into the dataset!  
```
    $ ls
    merged_5s.csv                              TimeBasedFeatures-120s-TOR-NonTOR.arff    TimeBasedFeatures-30s-TORNonTOR-85.arff
    SelectedFeatures-10s-TOR-NonTOR.csv        TimeBasedFeatures-15s-TOR-NonTOR-15.arff  TimeBasedFeatures-30s-TORNonTOR.arff
    SelectedFeatures-15s-TOR-NonTOR.arff       TimeBasedFeatures-15s-TOR-NonTOR-85.arff  TimeBasedFeatures-60s-TOR-NonTOR-15.arff
    TimeBasedFeatures-120s-TOR-NonTOR-15.arff  TimeBasedFeatures-15s-TOR-NonTOR.arff     TimeBasedFeatures-60s-TOR-NonTOR-85.arff
    TimeBasedFeatures-120s-TOR-NonTOR-85.arff  TimeBasedFeatures-30s-TORNonTOR-15.arff   TimeBasedFeatures-60s-TOR-NonTOR.arff
```  
That's quite a few ARFF files. If we look at the features available in a file such as `TimeBasedFeatures-15s-TOR-NonTOR.arff`, we see this:
```
    $ head -n25 TimeBasedFeatures-15s-TOR-NonTOR.arff | nl
     1	@RELATION <ISCXFlowMeter-generated-flows>,,,,,,,,,,,,,,,,,,,,,,,
     2	@ATTRIBUTE duration NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
     3	@ATTRIBUTE total_fiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
     4	@ATTRIBUTE total_biat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
     5	@ATTRIBUTE min_fiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
     6	@ATTRIBUTE min_biat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
     7	@ATTRIBUTE max_fiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
     8	@ATTRIBUTE max_biat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
     9	@ATTRIBUTE mean_fiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    10	@ATTRIBUTE mean_biat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    11	@ATTRIBUTE flowPktsPerSecond NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    12	@ATTRIBUTE flowBytesPerSecond NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    13	@ATTRIBUTE min_flowiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    14	@ATTRIBUTE max_flowiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    15	@ATTRIBUTE mean_flowiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    16	@ATTRIBUTE std_flowiat NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    17	@ATTRIBUTE min_active NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    18	@ATTRIBUTE mean_active NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    19	@ATTRIBUTE max_active NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    20	@ATTRIBUTE std_active NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    21	@ATTRIBUTE min_idle NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    22	@ATTRIBUTE mean_idle NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    23	@ATTRIBUTE max_idle NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    24	@ATTRIBUTE std_idle NUMERIC,,,,,,,,,,,,,,,,,,,,,,,
    25	@ATTRIBUTE class1 {TOR,NONTOR},,,,,,,,,,,,,,,,,,,,,,
```  
Above, we can see that there are 23 attributes and a single column for classification (also, ignoring the relation on the first line) available in the dataset. All of the features present are numeric and there are only two classification options available: 'TOR' and 'NONTOR'. This is the data we expected for Scenario-A. If we examine the ` TimeBasedFeatures-(30,60,120)s-TOR-NonTOR.arff` files, we will find these same features available (however there is no 10-second file). The variant files, those with a `-15` or `-85` near the end of the filename, appear to have been filtered through `Weka`. I will add more information here about these files when I get around to investigating them further. For the time being, we will stick to the unfiltered files.    

Converting the `15s` file to a CSV, we get the top few lines:  
```
    $ head -n3 TimeBasedFeatures-15s-TOR-NonTOR.csv
    duration,total_fiat,total_biat,min_fiat,min_biat,max_fiat,max_biat,mean_fiat,mean_biat,flowPktsPerSecond,flowBytesPerSecond,min_flowiat,max_flowiat,mean_flowiat,std_flowiat,min_active,mean_active,max_active,std_active,min_idle,mean_idle,max_idle,std_idle,class
    9368711,16,4,1564818,1549373,190205.285714286,203290.456521739,389822.391916579,370323.71975366,10.3536121458,4802.6884381427,4,1523088,97590.7395833333,267600.198443351,1871488,1983656.33333333,2195089,183219.697914371,1234883,1420565,1523088,161096.539275367,NONTOR
    7340238,18,4,1567554,1527893,165686.977272727,186914.846153846,317267.548742198,304370.651301392,11.5800059889,4340.1862446422,4,1517774,87383.7857142857,221462.862027935,1491627,3572433,5653239,2942704.06586714,1131498,1324636,1517774,273138.379007784,NONTOR
```
And if we look at the composition of the dataset, we find that...
```
    $ python -i
    Python 3.7.6 (default, Jan  8 2020, 19:59:22) 
    [GCC 7.3.0] :: Anaconda, Inc. on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> import pandas as pd
    >>> df = pd.read_csv('./TimeBasedFeatures-15s-TOR-NonTOR.csv')
    >>> df['class'].value_counts()
    NONTOR    18758
    TOR        3314
    Name: class, dtype: int64
```  
...the 'NONTOR' class is six times more prevalent than the 'TOR' classification.  

If we complete this process for each of the unfiltered datasets in Scenario-A, we get the following table demonstrating the composition of each dataset:  

| File  | TOR   | NONTOR    | Total  |
| ----- | ----: | --------: | -----: |
| merged_5s.csv | 14507 |   69680 | 84187 |
|  15s  | 3,314 |  18,758   | 22,072 |
|  30s  | 1,771 |  14,651   | 16,422 |
|  60s  |  914  |  15,515   | 16,429 |
|  120s |  470  |  10,782   | 11,252 |

#### Scenario-B

By following the example we go through in Scenario-A, we will find the `TimeBasedFeatures-*s-Layer2.arff` files, where the `*` indicates the timeout value (15, 30, 60, 120) and convert these unfiltered files to CSV. Then, using `pandas` once again, we output their class composition and produce the following table. 

| File Name     | FILE-TRANSFER | BROWSING | VIDEO | AUDIO | VOIP | CHAT |  P2P | MAIL | Total |
| ------------- | ------------: | -------: | ----: | ----: | ---: | ---: | ---: | ---: | ----: |
| merged_5s.csv |        1,663  |    2,644 | 1,529 | 1,026 |4,524 |  485 | 2,139|  497 |14,507 |
| 15s           |           480 |   227    |  598  |  46   | 1,509| 243  |   71 | 186  | 3,360 |
| 30s           |          246  |     133  |   345 | 32    | 758  | 147  |  38  | 104  | 1,803 |
| 60s           |          125  |    73    |   177 |  22   | 381  | 84   | 20   |  54  |  936  |
| 120s          |           63  |   41     | 90    | 16    | 193  | 45   |  10  | 28   | 486   |


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
