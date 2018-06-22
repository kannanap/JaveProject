FROM tomcat:8
# Take the war and copy to webapps of tomcat
#COPY target/*.war /usr/local/tomcat/webapps/
#AQUA CONTAINER SCANNING
RUN apk add --no-cache ca-certificates && update-ca-certificates
rm -rf /microscanner
wget -O /microscanner https://get.aquasec.com/microscanner \
chmod +x /microscanner \
/microscanner <token> \
rm -rf /microscanner
