
#!/bin/bash

for number in {0.07,0.14,0.21,0.28,0.35,0.42,0.49,0.63}
        do
        result=`awk -v a=0.7 -v b=$number 'BEGIN{printf "%.2f\n",a-b}'`
        ./bin/spark-submit \
        --class org.apache.spark.examples.SparkPageRank_RDD \
        --conf spark.storage.memoryFraction=$number \
        --conf spark.shuffle.memoryFraction=$result \
        --conf spark.memory.useLegacyMode=true \
        --name "PageRank static" \
        ~/spark/examples/jars/spark-examples_2.11-2.2.1.jar \
        data/web-Google-800M.txt 50
        done

#for number in {0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9}
#        do
#        ./bin/spark-submit \
#        --class org.apache.spark.examples.SparkPageRank \
#        --conf spark.memory.storageFraction=$number \
#       --conf spark.memory.useLegacyMode=false \
#       --conf spark.test=1 \
#        --name "PageRank unified" \
#        ~/spark/examples/jars/spark-examples_2.11-2.2.1.jar \
#        data/web-Google-400M.txt 50
#        done

exit 0
