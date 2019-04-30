FROM openshift/jenkins-2-centos7

ARG mm_version="5.9.0"
ARG user="1001"

USER root

#RUN yum -y  update
#RUN yum -y  upgrade

RUN yum -y install openldap

RUN yum -y install openldap-clients nss-pam-ldapd

RUN wget https://releases.mattermost.com/$mm_version/mattermost-$mm_version-linux-amd64.tar.gz && \
    tar -xvzf *.gz && \
    mv mattermost /opt

RUN groupadd -g ${user} mattermost

RUN adduser -D -u ${user} -G mattermost -h /opt/mattermost -D mattermost

USER $user

CMD [ "/opt/mattermost/bin/mattermost" ]


