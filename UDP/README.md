# agh_2015061019_IPv4_anon/UDP

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
| Dataset name        | agh_2015061019_IPv4_anon/UDP |           |
| Flow definition     |                      5-tuple |           |
| Exporter            |                 Cisco router | (NetFlow) |
| L2 technology       |                     Ethernet |           |
| Sampling rate       |                         none |           |
| Active timeout      |                          300 |   seconds |
| Inactive timeout    |                           15 |   seconds |
| Filter expression   |                 `prot == 17` |           |
| Flow records        |            included (binary) |           |
| IP Anonymization    |                   Crypto-PAn |           |
|                     |                              |           |
| All traffic         |                              |           |
| Number of flows     |                    2 982 158 |     flows |
| Number of packets   |                  126 676 716 |   packets |
| Number of bytes     |               71 866 582 507 |     bytes |
| Average flow length |                    42.478204 |   packets |
| Average flow size   |                 24098.851405 |    octets |
| Average packet size |                   567.322747 |     bytes |

| Flows of length up to | Make up % |         |         |
|----------------------:|----------:|--------:|--------:|
|             (packets) |     flows | packets |  octets |
|                       |           |         |         |
|                     1 |   69.3865 |  1.6335 |  0.4696 |
|                     2 |   84.0094 |  2.3219 |  0.6639 |
|                     4 |   92.8175 |  3.0146 |  0.8558 |
|                     8 |   96.8609 |  3.5910 |  1.0158 |
|                    16 |   98.5136 |  4.0407 |  1.1634 |
|                    32 |   99.2181 |  4.4151 |  1.3059 |
|                    64 |   99.5339 |  4.7445 |  1.4432 |
|                   128 |   99.6888 |  5.0744 |  1.6159 |
|                   256 |   99.7980 |  5.5377 |  1.9008 |
|                   512 |   99.8596 |  6.0546 |  2.2377 |
|                  1024 |   99.8977 |  6.6989 |  2.6882 |
|                  2048 |   99.9257 |  7.6596 |  3.4203 |
|                  4096 |   99.9432 |  8.8675 |  4.5318 |
|                  8192 |   99.9566 | 10.6583 |  6.0287 |
|                 16384 |   99.9658 | 13.2172 |  7.8455 |
|                 32768 |   99.9745 | 18.0058 | 11.5727 |
|                 65536 |   99.9853 | 30.1732 | 22.3111 |
|                131072 |   99.9931 | 47.2231 | 35.3720 |
|                262144 |   99.9977 | 66.5820 | 52.6583 |
|                524288 |   99.9992 | 79.9129 | 68.6075 |
|               1048576 |   99.9998 | 90.1205 | 83.9086 |
|               2097152 |  100.0000 | 96.9479 | 93.7483 |

| Flows of size up to | Make up % |         |         |
|--------------------:|----------:|--------:|--------:|
|             (bytes) |     flows | packets |  octets |
|                     |           |         |         |
|                  64 |    2.0674 |  0.0487 |  0.0055 |
|                 128 |   39.1753 |  0.9261 |  0.1557 |
|                 256 |   66.7667 |  1.7958 |  0.3564 |
|                 512 |   88.6306 |  2.8512 |  0.6748 |
|                1024 |   95.1010 |  3.4635 |  0.8627 |
|                2048 |   97.6490 |  3.9164 |  1.0109 |
|                4096 |   98.7600 |  4.2823 |  1.1410 |
|                8192 |   99.2905 |  4.5997 |  1.2651 |
|               16384 |   99.5605 |  4.9235 |  1.3947 |
|               32768 |   99.7007 |  5.2721 |  1.5277 |
|               65536 |   99.7840 |  5.6828 |  1.6876 |
|              131072 |   99.8454 |  6.2396 |  1.9250 |
|              262144 |   99.8890 |  6.9631 |  2.2582 |
|              524288 |   99.9168 |  7.9588 |  2.6867 |
|             1048576 |   99.9346 |  9.1590 |  3.2342 |
|             2097152 |   99.9506 | 11.4093 |  4.2265 |
|             4194304 |   99.9652 | 16.7594 |  6.0787 |
|             8388608 |   99.9755 | 24.3894 |  8.6103 |
|            16777216 |   99.9831 | 34.0220 | 12.3659 |
|            33554432 |   99.9882 | 45.1222 | 17.2421 |
|            67108864 |   99.9932 | 56.0835 | 27.0333 |
|           134217728 |   99.9966 | 64.8460 | 40.3072 |
|           268435456 |   99.9984 | 75.3357 | 54.8883 |
|           536870912 |   99.9993 | 84.1697 | 69.2042 |
|          1073741824 |   99.9999 | 93.2475 | 85.4570 |
