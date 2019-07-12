# java-tomcat-environment
Shell script to set prerequisites for tomcat and validate AWS credentials first itself.
Tomcat to deploy services needs a lot of prerequisites. A couple of the prerequisites is now fixed with the help of this.

# Benefits:

1. Have all mandatory environment variables needed (set to default - eg: prelive), but you can always override it using ENVIRONMENT.

2. Also validating AWS_CREDENTIALS first itself and not waiting until the service starts.

3. Logback with console appender by default.

4. No need to set up environment variables or logback in the IDE for RUN/DEBUG.


# Before Run/Debug

1. Copy `logback_local.xml` to your `conf` folder in tomcat. This will override your default logback.xml and will never have problems related to different APPENDERS.

2. Copy `setenv.sh` to your `bin` folder in tomcat.
