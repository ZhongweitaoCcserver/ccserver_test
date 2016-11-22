#!/bin/sh

killall server
timeout=${timeout:-30}
nothreads=${nothreads:-1}


shutdown_ccserver.sh
sleep 1
killall server
sleep 1
#port =9998
./ccserver& > /dev/null 2>&1
sleep 1
#port =9876
./server & > /dev/null 2>&1
sleep 1


#client <host_ip> <port> <threads> <msg_size> <sessions> <time>
for nosessions in 1 10 100 1000 10000; do
  echo "msg_size: 1 Threads: 1 Sessions: $nosessions timeout: $timeout" | tee -a single_thread_test_report.txt
  echo "*****************ccserver Vs ccpp_client *********************************************" | tee -a single_thread_test_report.txt
  ./ccpp_client 127.0.0.1 9998 1 1 $nosessions $timeout | tee -a single_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a single_thread_test_report.txt
  sleep 2
  echo "*****************libevent server Vs libevent client **********************************" | tee -a single_thread_test_report.txt
  ./client 9876 109 $nosessions $timeout | tee -a single_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a single_thread_test_report.txt
  sleep 2
  echo "*****************ccserver Vs libevent client ******************************************" | tee -a single_thread_test_report.txt
  ./client 9998 109 $nosessions $timeout | tee -a single_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a single_thread_test_report.txt
  sleep 2
  echo "*****************libevent server Vs ccpp_client ***************************************" | tee -a single_thread_test_report.txt  
  ./ccpp_client 127.0.0.1 9876 1 1 $nosessions $timeout | tee -a single_thread_test_report.txt
  echo "------------------------------------------------------------------------------------" | tee -a single_thread_test_report.txt
  sleep 2
  echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n" | tee -a single_thread_test_report.txt
done


shutdown_ccserver.sh
sleep 1
killall server

