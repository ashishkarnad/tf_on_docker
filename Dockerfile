# FROM ubuntu:20.04
# RUN apt-get update && apt-get install -y wget unzip && rm -fr /var/lib/apt/lists/*
# RUN wget --quiet https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip && unzip terraform_1.6.6_linux_amd64.zip \
#     && mv terraform /usr/bin/ && rm terraform_1.6.6_linux_amd64.zip \
#     && terraform version 
# #USER ubuntu

# RUN terraform -install-autocomplete
FROM hashicorp/terraform:latest
WORKDIR /app
COPY  . /app/
# RUN terraform init && terraform validate && terraform plan
# CMD ["/bin/sh", "-c", "watch -n 5 tail -f /dev/null"]
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT [ "/app/entrypoint.sh"]