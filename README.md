# Linux Resource Monitoring Script

This project provides a **Bash-based system resource monitor** that checks CPU, Memory, and Disk usage. When usage crosses defined thresholds, it **sends email alerts via Gmail** using `msmtp`. The script runs in the background and logs resource usage to a text file.

---

# clone the REPO

# Prerequisites for EMAIL Alerts
follow the **msmtpSetUpforMail folder**

once mail config is setup, follow the steps

In ."env" define the values
Give Exec permissions to the scripts
chmod 700 <filename>

```bash
   ./filename.sh
```
You might face an error saying illegal character or command not found
follow

```bash
   sudo apt install dos2unix -y
   dos2unix .env functions.sh resourceMonitoring.sh
  file .env
```
you should see ASCII text

