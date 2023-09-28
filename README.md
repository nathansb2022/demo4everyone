# demo4everyone
Disclaimer: Only for educational purposes only. 
An up-to-date example of how to create a trojan installer and utilize cloud infrastructure to host malicious files as well as control a victim machine.

# Remember
Before testing, update your variables and directories in the files accordingly.

# Rundown
1. mcode: This directory has the peristence and revershell Powershell code.
2. terraformscript: Contains the automagic way to create an s3 bucket in aws that can host files.
3. CodeSignScript.txt: The code signing script that created from the link below to sign our malicious .exe file. Run as admin.
4. demoC.txt: The text file that provides the steps portrayed in the youtube video to recreate the demo.
5. mcode.txt: This is the CSharp code to merge with the media installer to initially establish our persistence.
6. Last part of the youtube video demonstration shows teardown of the demo

# Youtube Video

[![IMAGE ALT TEXT](http://img.youtube.com/vi/xh1IrSag46w/0.jpg)](http://www.youtube.com/watch?v=xh1IrSag46w "1. Demo of Trojan Backdoor")

# Helpful Links
http://gphackingarticles.blogspot.com/2012/06/how-to-bind-two-exe-files-using-windows.html

https://adamtheautomator.com/how-to-sign-powershell-script/

[AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

[Terraform S3 Bucket Documentation](https://registry.terraform.io/providers/hashicorp/aws/4.8.0/docs/resources/s3_bucket)

[Powershell Reverseshell One-liner](https://gist.github.com/egre55/c058744a4240af6515eb32b2d33fbed3)


