# agh_2015061019_IPv4_anon/TCP/HTTP

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

This model is a subset of flows derived from the `agh_2015061019_IPv4_anon`
dataset (a one-hour period between 19:00-20:00 UTC on Wednesday, June 10th,
from the `agh_2015` collection), limited to HTTP/HTTPS traffic (TCP ports
80 and 443).

In order to reproduce all steps towards creating artifacts in this repository use the following commands:

    make histograms
    make mixtures
    make plots
    make summary
    make series
    make first_mirror

Please consult the [Makefile](Makefile) for more details.

| Parameter           |                                                                    Value |      Unit |
|---------------------|-------------------------------------------------------------------------:|----------:|
| Dataset name        |                                            agh_2015061019_IPv4_anon/TCP/HTTP |           |
| Flow definition     |                                                                  5-tuple |           |
| Exporter            |                                                             Cisco router | (NetFlow) |
| L2 technology       |                                                                 Ethernet |           |
| Sampling rate       |                                                                     none |           |
| Active timeout      |                                                                      300 |   seconds |
| Inactive timeout    |                                                                       15 |   seconds |
| Filter expression   | `(prot == 6) & ((sp == 80) \| (dp == 80) \| (sp == 443) \| (dp == 443))` |           |
| Flow records        |                                                        included (binary) |           |
| IP Anonymization    |                                                               Crypto-PAn |           |
|                     |                                                                          |           |
| All traffic         |                                                                          |           |
| Number of flows     |                                                                2 500 442 |     flows |
| Number of packets   |                                                              513 613 949 |   packets |
| Number of bytes     |                                                          448 660 412 536 |     bytes |
| Average flow length |                                                               205.409263 |   packets |
| Average flow size   |                                                            179432.441359 |    octets |
| Average packet size |                                                               873.536269 |     bytes |

| Flows of length up to | Make up % |         |         |
|----------------------:|----------:|--------:|--------:|
|             (packets) |     flows | packets |  octets |
|                       |           |         |         |
|                     1 |   19.2873 |  0.0939 |  0.0140 |
|                     2 |   33.3417 |  0.2307 |  0.0372 |
|                     4 |   45.8513 |  0.4428 |  0.0824 |
|                     8 |   64.2139 |  0.9942 |  0.2410 |
|                    16 |   77.9481 |  1.7802 |  0.5446 |
|                    32 |   86.2377 |  2.7050 |  0.9715 |
|                    64 |   91.1986 |  3.8025 |  1.5697 |
|                   128 |   94.2656 |  5.1553 |  2.4101 |
|                   256 |   96.3516 |  7.0077 |  3.6574 |
|                   512 |   97.7124 |  9.3787 |  5.4063 |
|                  1024 |   98.5268 | 12.2294 |  7.7104 |
|                  2048 |   99.0588 | 15.9592 | 10.8195 |
|                  4096 |   99.4183 | 20.9765 | 15.2586 |
|                  8192 |   99.6311 | 26.8787 | 20.6545 |
|                 16384 |   99.7603 | 34.1070 | 27.1623 |
|                 32768 |   99.8524 | 44.5787 | 37.1036 |
|                 65536 |   99.9363 | 63.6954 | 54.5508 |
|                131072 |   99.9838 | 84.3927 | 77.8353 |
|                262144 |   99.9985 | 96.3259 | 94.7467 |
|                524288 |   99.9996 | 98.1544 | 97.6690 |
|               1048576 |   99.9999 | 99.1900 | 98.5924 |

| Flows of size up to | Make up % |         |         |
|--------------------:|----------:|--------:|--------:|
|             (bytes) |     flows | packets |  octets |
|                     |           |         |         |
|                  64 |    3.3946 |  0.0165 |  0.0012 |
|                 128 |   16.9486 |  0.0876 |  0.0071 |
|                 256 |   29.9739 |  0.2266 |  0.0197 |
|                 512 |   41.2252 |  0.4152 |  0.0437 |
|                1024 |   53.2323 |  0.7206 |  0.0940 |
|                2048 |   65.3779 |  1.1974 |  0.1937 |
|                4096 |   75.2147 |  1.8388 |  0.3514 |
|                8192 |   83.3835 |  2.6861 |  0.6144 |
|               16384 |   88.7825 |  3.7233 |  0.9616 |
|               32768 |   92.2935 |  5.0387 |  1.4156 |
|               65536 |   94.7839 |  6.8027 |  2.0592 |
|              131072 |   96.4661 |  8.9357 |  2.9243 |
|              262144 |   97.5919 | 11.6039 |  4.0880 |
|              524288 |   98.4084 | 15.0732 |  5.7692 |
|             1048576 |   98.9508 | 19.5949 |  7.9983 |
|             2097152 |   99.3232 | 25.7528 | 11.0707 |
|             4194304 |   99.5773 | 35.3874 | 15.3028 |
|             8388608 |   99.7414 | 46.2383 | 20.6459 |
|            16777216 |   99.8300 | 53.6329 | 26.4703 |
|            33554432 |   99.8880 | 59.4027 | 34.2350 |
|            67108864 |   99.9366 | 68.4883 | 46.9947 |
|           134217728 |   99.9747 | 80.9104 | 67.3353 |
|           268435456 |   99.9956 | 93.7742 | 89.3005 |
|           536870912 |   99.9994 | 97.9577 | 96.4654 |
|          1073741824 |   99.9998 | 98.9506 | 98.1758 |
