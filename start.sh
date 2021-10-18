mvn clean install && \
cp target/*.jar /home/tekin/besu/plugins/
docker run -p 8545:8545 -p 9545:9545 --mount type=bind,source=/home/tekin/besu/lib,target=/var/lib/besu \
-v /home/tekin/besu/plugins:/opt/besu/plugins hyperledger/besu:20.10 --data-path=/var/lib/besu \
--metrics-enabled --network=dev --miner-enabled --miner-coinbase=0xfe3b557e8fb62b89f4916b721be55ceb828dbd73 \
--rpc-http-cors-origins="all" --rpc-http-enabled --host-allowlist="all" --metrics-host="0.0.0.0" --metrics-port=9545