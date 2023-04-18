const scanner = require("sonarqube-scanner");
scanner(
  {
    serverUrl: "https://sonarqube.objectedge.com/",
    token: "sqp_e6d684f6e9bb7e51d0ffa57bf1098eda84e8c8a6",
    options: {
      'sonar.projectName': 'Founders Network Frontend',
      'sonar.projectDescription': 'Founders Network FrontEnd Code',
      "sonar.sources": "./src",
    },
  },
  () => process.exit()
);
