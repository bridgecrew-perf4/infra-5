FROM nikaro/debian-dev

# avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

RUN \
    # install required tools
    sudo apt-get update && \
    sudo apt-get install -y \
        # ansible
        libffi-dev \
        libssl-dev \
        dnsutils \
        && \
    # clean up
    sudo apt-get autoremove -y && \
    sudo apt-get clean -y && \
    sudo rm -rf /var/lib/apt/lists/* &&  \
    :

ENV ANSIBLE_VERSION 2.9.9
ENV ANSIBLE_LINT_VERSION 4.2.0
RUN \
    python3 -m pip install --user \
        # ansible
        ansible==${ANSIBLE_VERSION} \
        ansible-lint==${ANSIBLE_LINT_VERSION} \
        bcrypt \
        dnspython \
        netaddr \
        passlib \
        && \
    :

ENV TERRAFORM_VERSION 0.12.26
RUN \
    # terraform
    # import hashicorp gpg key
    sudo gpg --keyserver hkp://eu.pool.sks-keyservers.net --recv-key 51852D87348FFC4C && \
    sudo curl -LOSs https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    sudo curl -LOSs https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sudo curl -LOSs https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig && \
    sudo gpg --verify terraform_${TERRAFORM_VERSION}_SHA256SUMS.sig terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sudo shasum -a 256 -c terraform_${TERRAFORM_VERSION}_SHA256SUMS --ignore-missing && \
    sudo unzip -d /usr/local/bin terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    sudo rm -f terraform_${TERRAFORM_VERSION}* && \
    :

ENV TFLINT_VERSION 0.16.1
RUN \
    # tflint
    sudo curl -LOSs https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip && \
    sudo unzip -d /usr/local/bin tflint_linux_amd64.zip && \
    sudo rm -f tflint_* && \
    :

# switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog
