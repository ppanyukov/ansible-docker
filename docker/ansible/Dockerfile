FROM centos:centos7

# Ansible is easy
# Need ssh client so we use proper ssh
RUN set -x \
	&& yum -y install openssh-clients \
	&& yum -y install ansible

# Az is a bit more tricky, install steps are from here:
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest
RUN set -x \
	&& echo "Import the Microsoft repository key" \
	&& rpm --import https://packages.microsoft.com/keys/microsoft.asc \
	&& echo "Create local azure-cli repository information" \
	&& echo -e "[azure-cli]\nname=Azure CLI\nbaseurl=https://packages.microsoft.com/yumrepos/azure-cli\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/azure-cli.repo \
	\
	&& echo "Update the yum package index and install" \
	&& yum install -y azure-cli

# These need to be created or else sometimes ssh things fail
RUN set -x \
	&& mkdir -p /root/.ssh \
	&& chmod 700 /root/.ssh
