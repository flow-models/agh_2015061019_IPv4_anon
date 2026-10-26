# agh_2015061019_IPv4_anon/TCP

Please cite as:

    @article{flow-models2,
        title = {flow-models 2.0: Elephant flows modeling and detection with machine learning},
        journal = {SoftwareX},
        volume = {24},
        pages = {101506},
        year = {2023},
        issn = {2352-7110},
        doi = {10.1016/j.softx.2023.101506},
        author = {Piotr Jurkiewicz}
    }

Available at: https://doi.org/10.1016/j.softx.2023.101506

This model is a filtered subset of the `agh_2015061019_IPv4_anon`
dataset (a one-hour period between 19:00-20:00 UTC on Wednesday, June 10th,
from the `agh_2015` collection), stored in the [ALL](../ALL) directory.

In order to reproduce all steps towards creating artifacts in this repository use the following commands:

    make histograms
    make mixtures
    make plots
    make summary
    make series
    make first_mirror

Please consult the [Makefile](Makefile) for more details.

| Parameter           |                        Value |      Unit |
|---------------------|-----------------------------:|----------:|
| Dataset name        | agh_2015061019_IPv4_anon/TCP |           |
| Flow definition     |                      5-tuple |           |
| Exporter            |                 Cisco router | (NetFlow) |
| L2 technology       |                     Ethernet |           |
| Sampling rate       |                         none |           |
| Active timeout      |                          300 |   seconds |
| Inactive timeout    |                           15 |   seconds |
| Filter expression   |                  `prot == 6` |           |
| Flow records        |            included (binary) |           |
| IP Anonymization    |                   Crypto-PAn |           |
|                     |                              |           |
| All traffic         |                              |           |
| Number of flows     |                    3 423 087 |     flows |
| Number of packets   |                  552 104 410 |   packets |
| Number of bytes     |              474 938 286 477 |     bytes |
| Average flow length |                   161.288454 |   packets |
| Average flow size   |                138745.607832 |    octets |
| Average packet size |                   860.232735 |     bytes |

| Flows of length up to | Make up % |         |         |
|----------------------:|----------:|--------:|--------:|
|             (packets) |     flows | packets |  octets |
|                       |           |         |         |
|                     1 |   22.2955 |  0.1382 |  0.0180 |
|                     2 |   43.7214 |  0.4039 |  0.0531 |
|                     4 |   55.5880 |  0.6577 |  0.1032 |
|                     8 |   71.1636 |  1.2540 |  0.2643 |
|                    16 |   82.4340 |  2.0750 |  0.5670 |
|                    32 |   89.1985 |  3.0350 |  0.9922 |
|                    64 |   93.1293 |  4.1417 |  1.5800 |
|                   128 |   95.5214 |  5.4851 |  2.4042 |
|                   256 |   97.1420 |  7.3164 |  3.6261 |
|                   512 |   98.2069 |  9.6833 |  5.3492 |
|                  1024 |   98.8590 | 12.5857 |  7.6246 |
|                  2048 |   99.2694 | 16.2425 | 10.6626 |
|                  4096 |   99.5457 | 21.1519 | 15.0024 |
|                  8192 |   99.7100 | 26.9740 | 20.3145 |
|                 16384 |   99.8135 | 34.3410 | 26.9235 |
|                 32768 |   99.8865 | 44.8835 | 36.9695 |
|                 65536 |   99.9510 | 63.5736 | 54.1508 |
|                131072 |   99.9872 | 83.7145 | 76.8748 |
|                262144 |   99.9987 | 95.6368 | 93.7100 |
|                524288 |   99.9996 | 97.7148 | 96.7961 |
|               1048576 |   99.9999 | 98.9363 | 98.1236 |

| Flows of size up to | Make up % |         |         |
|--------------------:|----------:|--------:|--------:|
|             (bytes) |     flows | packets |  octets |
|                     |           |         |         |
|                  64 |    5.9017 |  0.0366 |  0.0027 |
|                 128 |   20.3812 |  0.1332 |  0.0109 |
|                 256 |   42.0436 |  0.4191 |  0.0364 |
|                 512 |   52.5331 |  0.6528 |  0.0650 |
|                1024 |   63.2100 |  1.0186 |  0.1223 |
|                2048 |   73.0776 |  1.5335 |  0.2268 |
|                4096 |   80.9340 |  2.2157 |  0.3896 |
|                8192 |   87.2560 |  3.0833 |  0.6529 |
|               16384 |   91.4172 |  4.1306 |  0.9988 |
|               32768 |   94.1035 |  5.4511 |  1.4477 |
|               65536 |   95.9993 |  7.2126 |  2.0815 |
|              131072 |   97.2994 |  9.4029 |  2.9467 |
|              262144 |   98.1641 | 12.0881 |  4.1003 |
|              524288 |   98.7872 | 15.5766 |  5.7611 |
|             1048576 |   99.1990 | 20.0660 |  7.9510 |
|             2097152 |   99.4814 | 26.1970 | 10.9629 |
|             4194304 |   99.6749 | 35.7109 | 15.1310 |
|             8388608 |   99.7997 | 46.3077 | 20.3874 |
|            16777216 |   99.8684 | 53.8012 | 26.2204 |
|            33554432 |   99.9145 | 59.8233 | 34.2055 |
|            67108864 |   99.9518 | 68.7771 | 46.8669 |
|           134217728 |   99.9808 | 80.9007 | 66.8626 |
|           268435456 |   99.9964 | 93.1285 | 88.0146 |
|           536870912 |   99.9994 | 97.3674 | 95.3786 |
|          1073741824 |   99.9998 | 98.5662 | 97.4702 |
