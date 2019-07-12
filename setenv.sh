#!/bin/sh

#Set Default setting of environment variable
if [ -n "$ENVIRONMENT" ]; then
  echo "$ENVIRONMENT set to $ENVIRONMENT"
else
	echo "ENVIRONMENT set to prelive by default"
	export ENVIRONMENT=prelive
fi

export ENV_TAGS=$ENVIRONMENT
export ENV_TAGS_LIST=$ENVIRONMENT

#Set LOGBACK with just console appender
CATALINA_OPTS="-Dlogback.configurationFile=file:$CATALINA_HOME/conf/logback_local.xml -Dlogging.config=$CATALINA_HOME/conf/logback_local.xml -Dspring.profiles.active=testcfg,$ENVIRONMENT"
# CATALINA_OPTS="-Dspring.profiles.active=testcfg,$ENVIRONMENT"

has_valid_aws_credentials="$(/usr/local/bin/saml2aws script --profile=default --idp-account=$ENVIRONMENT | grep "AWS_ACCESS_KEY_ID" | wc -l)"
has_valid_aws_credentials_with_no_profile="$(/usr/local/bin/saml2aws script --idp-account=$ENVIRONMENT | grep "AWS_ACCESS_KEY_ID" | wc -l)"

#Validate aws_crendentials-Exit because of Multifactor authentication needs to be entered manually for OKTA
if [ $has_valid_aws_credentials_with_no_profile = 0 ] && [ $has_valid_aws_credentials = 0 ]; then
	echo '' > ~/.aws/credentials
	echo "\n\nYOUR AWS SESSION IS EXPIRED/NON-EXISTING"
	exit -1
fi

#temporarly store credentials without profile value
temporary_credentials="$(tail -n +2 ~/.aws/credentials)"

#Save the credentials as [default] profile to support lower versions of Spring-boot
echo '[default]' > ~/.aws/credentials
echo "$temporary_credentials" >> ~/.aws/credentials
