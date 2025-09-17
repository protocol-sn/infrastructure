cd reverse-proxy
docker build . -t reverse-proxy
cd ../../keycloak-interaction
docker build  -t local-keycloak -f keycloak/Dockerfile .
cd ../node-manager/node-manager
./gradlew clean assemble
docker build -t psn-node-manager .
cd ../../keycloak-user-plugin
./gradlew clean assemble
docker build -t psn-user-plugin .
cd ../blog-plugin/blog-plugin
./gradlew clean assemble
docker build -t psn-blog-plugin .
cd ../../infrastructure
docker compose up -d
