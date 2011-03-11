if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Needed for EC2 api tools

export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export EC2_PRIVATE_KEY="$(/bin/ls $HOME/.ec2/pk-*.pem)"
export EC2_CERT="$(/bin/ls $HOME/.ec2/cert-*.pem)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-57419/jars"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.11.0/jars/"

