# windows-scripts


 build scripts for windows 10/11 setup

 bits and pieces from the following
  - jessfraz https://gist.github.com/jessfraz/7c319b046daa101a4aaef937a20ff41f
  - NickCraver https://gist.github.com/NickCraver/7ebf9efbfd0c3eab72e9
  - Microsoft https://github.com/Microsoft/windows-dev-box-setup-scripts

### Description: Boxstarter script

### Install Chocolatey & Boxstarter:
. { iwr -useb http://boxstarter.org/bootstrapper.ps1 } | iex; get-boxstarter -Force
or if you have chocolately installed: 

choco install -y boxstarter
You might need to set: Set-ExecutionPolicy RemoteSigned

### Run this boxstarter by calling the following from an **elevated** command-prompt:
  start http://boxstarter.org/package/nr/url?<URL-TO-RAW-GIST>
  
  OR
  
  Install-BoxstarterPackage -PackageName <URL-TO-RAW-GIST> -DisableReboots
  Learn more: http://boxstarter.org/Learn/WebLauncher
