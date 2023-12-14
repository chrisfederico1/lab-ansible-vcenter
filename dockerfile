
# Use the latest Fedora base image
FROM fedora:latest

# Update the package repositories and install Ansible
RUN dnf -y update && dnf -y install ansible

# Install additional dependencies required for VMware modules
RUN dnf -y install \
    # unzip
        unzip \
    # Python Build tools
        python3-pip \
        bzip2-devel \
        zlib-devel \
        gcc \
        python3-devel \
        openssl-devel \
        libffi-devel \
        neovim \
        yum-utils \
        make \
        iputils \
        util-linux \
        man \
        ncurses \
        direnv

RUN pip3 install pyvmomi
RUN pip3 install pywinrm

# Set the working directory
WORKDIR /ansible

# Copy your Ansible playbook and inventory files to the container
# COPY playbook.yml /ansible/playbook.yml
# COPY inventory.ini /ansible/inventory.ini

# Define the entry point command to run your Ansible playbook
# ENTRYPOINT ["ansible-playbook", "-i", "inventory.ini", "playbook.yml"]

# Mount a volume to make the ansible directory accessible outside the container
VOLUME /ansible

