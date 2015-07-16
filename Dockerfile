

###################################################
#	Docker File to build Nginx container
#	Debian Based
###################################################

FROM debian

Maintainer Steven Mustafa


# Update and install pre-reqs
RUN apt-get update
RUN apt-get install -y curl net-tools python openssl



# generate the 1GB random File
# CMD dd if=/dev/urandom of=/tmp/1G.img bs=64M count=16 iflag=fullblock

# ENV BIG_FILE /tmp/1G.img


# download pip
CMD CMD curl -O https://bootstrap.pypa.io/get-pip.py
# setup pip
CMD python get-pip.py
# install virtualenv and create in folder named appdo
CMD pip install virtualenv
CMD mkdir app 
CMD cd app
CMD virtualenv .venv
CMD source .venv/bin/activate
CMD pip install flask
ADD barrage.py .
ADD stress_thread.py .
CMD touch __init__.py
CMD python /app/barrage.py
# create virtual and install




# Install Nginx
#########

# download repo key

# RUN curl -O -L nginx.org/keys/nginx_signing.key
# RUN apt-key add nginx_signing.key
# RUN apt-get update -y 
# RUN apt-get install -y nginx 

# Remove the default config and a new one
# RUN rm -v /etc/nginx/nginx.conf

#copy local conf
# ADD nginx.conf /etc/nginx/
# RUN echo "daemon off;" >> /etc/nginx/nginx.conf


############################################################

# EXPOSE 80

# CMD service nginx start