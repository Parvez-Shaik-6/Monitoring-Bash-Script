# follow the steps to setup mail config to get alert 

```bash
   sudo apt update
   sudo apt install msmtp -y
   vim ~/.msmtprc

and add the given config in .msmtprc to ~/.msmtprc
```
2FA 
since msmtp follows 2FA Auth 
go to your GMAIL account > Security > App Password 
generate a token which usually 16 string length token 
use it 