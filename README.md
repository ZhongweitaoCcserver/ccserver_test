# ccserver_test
Some shell script for ccserver test.  And some test report.
As you can see in the test report, ccserver is faster than libevent. 

ccserver, ccpp_client --repository-- ZhongweitaoCcserver/ccserver
server, client --repository-- ZhongweitaoCcserver/pp_libevent

msg_size: 1 Threads: 1 Sessions: 1 timeout: 30
*****************ccserver Vs ccpp_client *********************************************
4356: 21 Nov 19:29:54.392 * CCPP_CLIENT Begin! --server.cc:149
4356: 21 Nov 19:29:54.393 * All connected. --server.cc:180
4356: 21 Nov 19:30:24.395 * CCSERVER time off now! --server.cc:197
4356: 21 Nov 19:30:24.395 * CCSERVER shutdown now! --epollreactor.cc:169
4356: 21 Nov 19:30:24.395 * ****:72061426 total bytes read. --server.cc:201
4356: 21 Nov 19:30:24.395 * ****:661114 total messages read. --server.cc:203
4356: 21 Nov 19:30:24.395 * ****:109 average message size. --server.cc:207
4356: 21 Nov 19:30:24.396 * ****:2.290771 MiB/s throughput. --server.cc:209
4356: 21 Nov 19:30:24.396 * ****:22037 Msg/s throughput. --server.cc:211
4356: 21 Nov 19:30:24.396 * CCSERVER wait for reactors. --server.cc:213
4356: 21 Nov 19:30:24.396 * CCSERVER exit now! --server.cc:215
------------------------------------------------------------------------------------
*****************libevent server Vs libevent client **********************************
timeout
49571347 total bytes read
454783 total messages read
109.000 average messages size
1.576 MiB/s throughtput
15159 Msg/s throughput.
------------------------------------------------------------------------------------
*****************ccserver Vs libevent client ******************************************
timeout
56706051 total bytes read
520239 total messages read
109.000 average messages size
1.803 MiB/s throughtput
17341 Msg/s throughput.
------------------------------------------------------------------------------------
*****************libevent server Vs ccpp_client ***************************************
4506: 21 Nov 19:31:30.432 * CCPP_CLIENT Begin! --server.cc:149
4506: 21 Nov 19:31:30.434 * All connected. --server.cc:180
4506: 21 Nov 19:32:00.436 * CCSERVER time off now! --server.cc:197
4506: 21 Nov 19:32:00.436 * CCSERVER shutdown now! --epollreactor.cc:169
4506: 21 Nov 19:32:00.436 * ****:63639650 total bytes read. --server.cc:201
4506: 21 Nov 19:32:00.436 * ****:583850 total messages read. --server.cc:203
4506: 21 Nov 19:32:00.436 * ****:109 average message size. --server.cc:207
4506: 21 Nov 19:32:00.436 * ****:2.023053 MiB/s throughput. --server.cc:209
4506: 21 Nov 19:32:00.436 * ****:19461 Msg/s throughput. --server.cc:211
4506: 21 Nov 19:32:00.436 * CCSERVER wait for reactors. --server.cc:213
4506: 21 Nov 19:32:00.436 * CCSERVER exit now! --server.cc:215
------------------------------------------------------------------------------------
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
