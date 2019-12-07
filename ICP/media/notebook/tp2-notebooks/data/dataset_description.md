## Dataset description

# The addressed problem


As quoted in the literature, that the effects of denial-of-service attacks can be perceived in the network and transport layers of the
TCP/IP architecture, even stealth application-layer attacks. Thus, the addressed problem here is select from the network layer and the
transport layer as few variables as possible to describe normal traffic and denial of service attack traffic.

## Explore the universe of variables

In the network and transport layers of the TCP/IP architecture the Internet Protocol (IPv4) is standardized by (<a href="https://tools.ietf.org/html/rfc791">RFC 91</a>).
The Transmission Control Protocol (TCP) is standardized by (<a href="https://tools.ietf.org/html/rfc793">RFC 793</a>). User Datagram protocol (UDP) is standardized by
(<a href="https://www.ietf.org/rfc/rfc768.txt">RFC 768 </a>). The headers these protocols are shown below:

```
 Example Internet Datagram Header

    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |Version|  IHL  |Type of Service|          Total Length         |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |         Identification        |Flags|      Fragment Offset    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Time to Live |    Protocol   |         Header Checksum       |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                       Source Address                          |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Destination Address                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Options                    |    Padding    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


    TCP Header Format
    0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |          Source Port          |       Destination Port        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                        Sequence Number                        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Acknowledgment Number                      |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |  Data |           |U|A|P|R|S|F|                               |
   | Offset| Reserved  |R|C|S|S|Y|I|            Window             |
   |       |           |G|K|H|T|N|N|                               |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |           Checksum            |         Urgent Pointer        |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                    Options                    |    Padding    |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
   |                             data                              |
   +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

    User Datagram Header Format

    0      7 8     15 16    23 24    31
    +--------+--------+--------+--------+
    |     Source      |   Destination   |
    |      Port       |      Port       |
    +--------+--------+--------+--------+
    |                 |                 |
    |     Length      |    Checksum     |
    +--------+--------+--------+--------+
    |
    |          data octets ...
    +---------------- ...


```

In summary, there are 25 variables available in the IP, TCP, and UDP headers.
Considering that a section (TCP or UDP) contains the set of distributions of each variable, it is possible to extract several measures of this data.
In this particular case, each instance of the dataset contains the normalized measures of mean, median, variance (var), standard deviation (std), entropy, Variation coefficient (cv), Quantile coefficient (cvq) and rate of change (rte) totalizing 73 variables.
Below is the complete list of variables:

'ip_proto',
'ip_len_mean',
'ip_len_median',
'ip_len_var',
'ip_len_std',
'ip_len_entropy',
'ip_len_cv',
'ip_len_cvq',
'ip_len_rte',
'ip_ttl_mean',
'ip_ttl_median',
'ip_ttl_var',
'ip_ttl_std',
'ip_ttl_entropy',
'ip_ttl_cv',
'ip_ttl_cvq',
'ip_ttl_rte',
'sport_mean',
'sport_median',
'sport_var',
'sport_std',
'sport_entropy',
'sport_cv',
'sport_cvq',
'sport_rte',
'dport_mean',
'dport_median',
'dport_var',
'dport_std',
'dport_entropy',
'dport_cv',
'dport_cvq',
'dport_rte',
'tcp_seq_median',
'tcp_seq_mean',
'tcp_seq_var',
'tcp_seq_std',
'tcp_seq_entropy',
'tcp_seq_cv',
'tcp_seq_cvq',
'tcp_seq_rte',
'tcp_ack_mean',
'tcp_ack_median',
'tcp_ack_var',
'tcp_ack_std',
'tcp_ack_entropy',
'tcp_ack_cv',
'tcp_ack_cvq',
'tcp_ack_rte',
'tcp_dataofs_mean',
'tcp_dataofs_median',
'tcp_dataofs_var',
'tcp_dataofs_std',
'tcp_dataofs_entropy',
'tcp_dataofs_cv',
'tcp_dataofs_cvq',
'tcp_dataofs_rte',
'tcp_flags_mean',
'tcp_flags_median',
'tcp_flags_var',
'tcp_flags_std',
'tcp_flags_entropy',
'tcp_flags_cv',
'tcp_flags_cvq',
'tcp_flags_rte',
'tcp_window_mean',
'tcp_window_median',
'tcp_window_var',
'tcp_window_std',
'tcp_window_entropy',
'tcp_window_cv',
'tcp_window_cvq',
'tcp_window_rte',
'Label1',
'Label2',
'Label3'

Lable1: 11 type of traffic class labels ['http_flood', 'http_slow_body', 'http_slow_headers',
                                               'http_slow_range', 'http_slow_read', 'normal', 'tcp_ack_flood',
                                               'tcp_fin_flood', 'tcp_syn_ack_flood', 'tcp_syn_flood', 'udp_flood']

Lable2: 2 type of traffic class labels ['attack', 'normal']
Lable3: 5 type of traffic class labels ['http_flood', 'http_slow', 'normal', 'tcp_flood', 'udp_flood']

The database contains examples of normal traffic (23.088 instances), TCP Flood attacks (14.988 instances), UDP Flood (6.894 instances), HTTP Flood (347 instances) and HTTP Slow (183 instances).
