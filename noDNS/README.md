# agh_2015061019_IPv4_anon/noDNS

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

| Parameter           |                          Value |      Unit |
|---------------------|-------------------------------:|----------:|
| Dataset name        | agh_2015061019_IPv4_anon/noDNS |           |
| Flow definition     |                        5-tuple |           |
| Exporter            |                   Cisco router | (NetFlow) |
| L2 technology       |                       Ethernet |           |
| Sampling rate       |                           none |           |
| Active timeout      |                            300 |   seconds |
| Inactive timeout    |                             15 |   seconds |
| Filter expression   |      `(sp != 53) & (dp != 53)` |           |
| Flow records        |              included (binary) |           |
| IP Anonymization    |                     Crypto-PAn |           |
|                     |                                |           |
| All traffic         |                                |           |
| Number of flows     |                      4 820 218 |     flows |
| Number of packets   |                    676 730 307 |   packets |
| Number of bytes     |                546 509 248 404 |     bytes |
| Average flow length |                     140.394129 |   packets |
| Average flow size   |                  113378.533586 |    octets |
| Average packet size |                     807.573184 |     bytes |

| Flows of length up to | Make up % |         |         |
|----------------------:|----------:|--------:|--------:|
|             (packets) |     flows | packets |  octets |
|                       |           |         |         |
|                     1 |   37.9709 |  0.2705 |  0.0480 |
|                     2 |   55.8600 |  0.5253 |  0.0866 |
|                     4 |   66.0885 |  0.7752 |  0.1386 |
|                     8 |   78.2829 |  1.3115 |  0.2880 |
|                    16 |   86.8536 |  2.0286 |  0.5622 |
|                    32 |   91.9533 |  2.8594 |  0.9444 |
|                    64 |   94.8772 |  3.8045 |  1.4678 |
|                   128 |   96.6446 |  4.9446 |  2.2003 |
|                   256 |   97.8446 |  6.5028 |  3.2900 |
|                   512 |   98.6348 |  8.5208 |  4.8263 |
|                  1024 |   99.1221 | 11.0123 |  6.8599 |
|                  2048 |   99.4324 | 14.1925 |  9.6000 |
|                  4096 |   99.6408 | 18.4516 | 13.5228 |
|                  8192 |   99.7665 | 23.5643 | 18.3448 |
|                 16384 |   99.8460 | 30.0775 | 24.3358 |
|                 32768 |   99.9033 | 39.6061 | 33.5589 |
|                 65536 |   99.9561 | 57.1953 | 49.9312 |
|                131072 |   99.9866 | 76.8269 | 71.4015 |
|                262144 |   99.9976 | 90.1797 | 88.3034 |
|                524288 |   99.9992 | 94.3390 | 93.0189 |
|               1048576 |   99.9998 | 97.1825 | 96.1328 |
|               2097152 |  100.0000 | 99.4287 | 99.1779 |

| Flows of size up to | Make up % |         |         |
|--------------------:|----------:|--------:|--------:|
|             (bytes) |     flows | packets |  octets |
|                     |           |         |         |
|                  64 |    5.4876 |  0.0391 |  0.0031 |
|                 128 |   26.7497 |  0.1969 |  0.0193 |
|                 256 |   49.4720 |  0.4986 |  0.0522 |
|                 512 |   63.1983 |  0.7691 |  0.0968 |
|                1024 |   72.1358 |  1.1103 |  0.1550 |
|                2048 |   79.9321 |  1.5747 |  0.2557 |
|                4096 |   85.9003 |  2.1731 |  0.4069 |
|                8192 |   90.6035 |  2.9211 |  0.6465 |
|               16384 |   93.6733 |  3.8166 |  0.9587 |
|               32768 |   95.6430 |  4.9426 |  1.3613 |
|               65536 |   97.0310 |  6.4476 |  1.9293 |
|              131072 |   97.9861 |  8.3304 |  2.7071 |
|              262144 |   98.6248 | 10.6607 |  3.7508 |
|              524288 |   99.0858 | 13.7201 |  5.2551 |
|             1048576 |   99.3901 | 17.6454 |  7.2364 |
|             2097152 |   99.6008 | 23.1050 |  9.9871 |
|             4194304 |   99.7473 | 31.8970 | 13.8530 |
|             8388608 |   99.8425 | 41.9995 | 18.7617 |
|            16777216 |   99.8960 | 49.9380 | 24.3345 |
|            33554432 |   99.9319 | 56.9321 | 31.9181 |
|            67108864 |   99.9615 | 66.3057 | 44.2289 |
|           134217728 |   99.9842 | 77.8203 | 63.3402 |
|           268435456 |   99.9964 | 89.5765 | 83.6117 |
|           536870912 |   99.9991 | 94.8649 | 91.8888 |
|          1073741824 |   99.9998 | 97.5255 | 95.8167 |
