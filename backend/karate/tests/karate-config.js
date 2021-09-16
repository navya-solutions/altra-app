function fn() {
  var env = karate.env; // get java system property 'karate.env'
  karate.log("karate.env system property was:", env);
  if (!env) {
    env = "dev"; // a custom 'intelligent' default
  }
  var config = {
    // base config JSON
    appId: "my.app.id",
    appSecret: "my.secret",
    baseUrl: "http://host.docker.internal:8080/v1/graphql",
  };
  if (env == "dev") {
    // over-ride only those that need to be
    config.baseUrl = "http://host.docker.internal:8080/v1/graphql"; // CHNAGE WITH THE STAGING ENV. URL
  } else if (env == "qa") {
    config.baseUrl = "http://host.docker.internal:8080/v1/graphql"; // CHNAGE WITH THE QA ENV. URL
  }
  // don't waste time waiting for a connection or if servers don't respond within 5 seconds
  karate.configure("connectTimeout", 5000);
  karate.configure("readTimeout", 5000);

  return config;
}
