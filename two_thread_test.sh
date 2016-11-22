#!/bin/sh

killall server
timeout=${timeout:-15}
nothreads=${nothreads:-1}

shutdown_ccserver.sh
sleep 1
killall server
sleep 1
#port =9998
./ccserver 2 & > /dev/null 2>&1
sleep 1


#client <host_ip> <port> <threads> <msg_size> <sessions> <time>
for nosessions in 2 10 100 1000 10000; do
  echo "msg_size: 1 Threads: 2 Sessions: $nosessions timeout: $timeout" | tee -a two_thread_test_report.txt
  echo "*****************ccserver Vs ccpp_client *********************************************" | tee -a two_thread_test_report.txt
  ./ccpp_client 127.0.0.1 9998 2 1 $nosessions $timeout | tee -a two_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a two_thread_test_report.txt
sleep 1
  echo "msg_size: 10 Threads: 2 Sessions: $nosessions timeout: $timeout" | tee -a two_thread_test_report.txt
  echo "*****************ccserver Vs ccpp_client *********************************************" | tee -a two_thread_test_report.txt
  ./ccpp_client 127.0.0.1 9998 2 10 $nosessions $timeout | tee -a two_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a two_thread_test_report.txt
sleep 1
  echo "msg_size: 100 Threads: 2 Sessions: $nosessions timeout: $timeout" | tee -a two_thread_test_report.txt
  echo "*****************ccserver Vs ccpp_client *********************************************" | tee -a two_thread_test_report.txt
  ./ccpp_client 127.0.0.1 9998 2 100 $nosessions $timeout | tee -a two_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a two_thread_test_report.txt
sleep 1
  echo "msg_size: 500 Threads: 2 Sessions: $nosessions timeout: $timeout" | tee -a two_thread_test_report.txt
  echo "*****************ccserver Vs ccpp_client *********************************************" | tee -a two_thread_test_report.txt
  ./ccpp_client 127.0.0.1 9998 2 500 $nosessions $timeout | tee -a two_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a two_thread_test_report.txt
  echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n" | tee -a two_thread_test_report.txt
sleep 1
done


shutdown_ccserver.sh
sleep 1

