# java-tomcat-environment
Shell script to set prerequisites for tomcat and validate AWS credentials first itself.

Currently, available Tomcat to deploy services needs a lot of prerequisites. 

A couple of the prerequisites is now fixed with the help of this.

# Benefits:

1. Have all mandatory environment variables needed (set to default - prelive), but you can always override it using ENVIRONMENT.

2. Also validating AWS_CREDENTIALS first itself and not waiting for 1 hour.

3. Logback with console appender by default.

4. No need to set up environment variables or logback in the IDE for RUN/DEBUG.
