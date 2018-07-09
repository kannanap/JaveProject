FROM tomcat:8
# Take the war and copy to webapps of tomcat
COPY target/*.war /usr/local/tomcat/webapps/
#AQUA CONTAINER SCANNING
#RUN apk add --no-cache ca-certificates && update-ca-certificates
RUN rm -rf /microscanner
RUN wget -O /microscanner https://get.aquasec.com/microscanner 
RUN chmod +x /microscanner 
RUN /microscanner OGZjZWI3ZmM0Yzgz
RUN rm -rf /microscanner
