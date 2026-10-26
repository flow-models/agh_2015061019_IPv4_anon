# agh_2015061019_IPv4_anon/UDP/noDNS

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
from the `agh_2015` collection), stored in the [ALL](../../ALL) directory.

In order to reproduce all steps towards creating artifacts in this repository use the following commands:

    make histograms
    make mixtures
    make plots
    make summary
    make series
    make first_mirror

Please consult the [Makefile](Makefile) for more details.

| Parameter           |                                    Value |      Unit |
|---------------------|-----------------------------------------:|----------:|
| Dataset name        |       agh_2015061019_IPv4_anon/UDP/noDNS |           |
| Flow definition     |                                  5-tuple |           |
| Exporter            |                             Cisco router | (NetFlow) |
| L2 technology       |                                 Ethernet |           |
| Sampling rate       |                                     none |           |
| Active timeout      |                                      300 |   seconds |
| Inactive timeout    |                                       15 |   seconds |
| Filter expression   | `(prot == 17) & (sp != 53) & (dp != 53)` |           |
| Flow records        |                        included (binary) |           |
| IP Anonymization    |                               Crypto-PAn |           |
|                     |                                          |           |
| All traffic         |                                          |           |
| Number of flows     |                                1 289 713 |     flows |
| Number of packets   |                              122 532 551 |   packets |
| Number of bytes     |                           70 994 638 144 |     bytes |
| Average flow length |                                95.007611 |   packets |
| Average flow size   |                             55046.850070 |    octets |
| Average packet size |                               579.394108 |     bytes |

| Flows of length up to | Make up % |         |         |
|----------------------:|----------:|--------:|--------:|
|             (packets) |     flows | packets |  octets |
|                       |           |         |         |
|                     1 |   76.9546 |  0.8100 |  0.2356 |
|                     2 |   85.8643 |  0.9975 |  0.2939 |
|                     4 |   91.7639 |  1.2059 |  0.3541 |
|                     8 |   95.7166 |  1.4636 |  0.4225 |
|                    16 |   97.7348 |  1.7124 |  0.5060 |
|                    32 |   98.7313 |  1.9492 |  0.5994 |
|                    64 |   99.1765 |  2.1586 |  0.6901 |
|                   128 |   99.4068 |  2.3786 |  0.8068 |
|                   256 |   99.5748 |  2.7010 |  1.0085 |
|                   512 |   99.6911 |  3.1424 |  1.2937 |
|                  1024 |   99.7721 |  3.7551 |  1.7039 |
|                  2048 |   99.8301 |  4.6509 |  2.3734 |
|                  4096 |   99.8694 |  5.8623 |  3.4396 |
|                  8192 |   99.8998 |  7.6890 |  4.9153 |
|                 16384 |   99.9211 | 10.3056 |  6.7382 |
|                 32768 |   99.9410 | 15.2327 | 10.4866 |
|                 65536 |   99.9659 | 27.8116 | 21.3569 |
|                131072 |   99.9841 | 45.4381 | 34.5782 |
|                262144 |   99.9946 | 65.4517 | 52.0769 |
|                524288 |   99.9980 | 79.2336 | 68.2219 |
|               1048576 |   99.9995 | 89.7864 | 83.7110 |
|               2097152 |   99.9999 | 96.8447 | 93.6715 |

| Flows of size up to | Make up % |         |         |
|--------------------:|----------:|--------:|--------:|
|             (bytes) |     flows | packets |  octets |
|                     |           |         |         |
|                  64 |    4.7793 |  0.0503 |  0.0056 |
|                 128 |   41.1153 |  0.4368 |  0.0676 |
|                 256 |   66.4746 |  0.7783 |  0.1427 |
|                 512 |   89.1789 |  1.1936 |  0.2904 |
|                1024 |   93.9090 |  1.4111 |  0.3514 |
|                2048 |   96.6738 |  1.6378 |  0.4224 |
|                4096 |   98.0331 |  1.8439 |  0.4927 |
|                8192 |   98.7883 |  2.0439 |  0.5705 |
|               16384 |   99.1997 |  2.2527 |  0.6572 |
|               32768 |   99.4188 |  2.4968 |  0.7482 |
|               65536 |   99.5633 |  2.8359 |  0.8705 |
|              131072 |   99.6718 |  3.3160 |  1.0529 |
|              262144 |   99.7538 |  3.9824 |  1.3326 |
|              524288 |   99.8138 |  4.9865 |  1.7361 |
|             1048576 |   99.8526 |  6.2140 |  2.2598 |
|             2097152 |   99.8876 |  8.5136 |  3.2101 |
|             4194304 |   99.9202 | 13.9915 |  5.0080 |
|             8388608 |   99.9436 | 21.8622 |  7.5292 |
|            16777216 |   99.9611 | 31.8140 | 11.3141 |
|            33554432 |   99.9727 | 43.2661 | 16.2257 |
|            67108864 |   99.9842 | 54.5982 | 26.1371 |
|           134217728 |   99.9921 | 63.6571 | 39.5741 |
|           268435456 |   99.9963 | 74.5016 | 54.3342 |
|           536870912 |   99.9984 | 83.6343 | 68.8260 |
|          1073741824 |   99.9997 | 93.0191 | 85.2784 |
