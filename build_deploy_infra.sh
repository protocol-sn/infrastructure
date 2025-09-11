cd reverse-proxy
docker build . -t reverse-proxy
cd ../../keycloak-interaction
cd ../node-manager/node-manager
docker build  -t keycloak -f keycloak/Dockerfile .
./gradlew clean build
docker build -t psn-node-manager .
cd ../../keycloak-user-plugin
./gradlew clean build
docker build -t psn-user-plugin .
cd ../blog-plugin/blog-plugin
./gradlew clean build
docker build -t psn-blog-plugin .
cd ../../infrastructure
docker compose up -d
