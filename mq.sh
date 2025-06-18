1st go to the ect directry 

sudo nano /etc/rc.d/init.d/start_qm

vi start_qm
-------------------------------------------------------------------------------------------
#!/bin/bash
# chkconfig: 2345 99 01
# description: Start IBM MQ Queue Manager

### BEGIN INIT INFO
# Provides:          start_qm
# Required-Start:    $network
# Required-Stop:
# Default-Start:     2 3 4 5
# Default-Stop:
# Short-Description: Start IBM MQ Queue Manager
### END INIT INFO

echo "Starting Queue Manager..."
/opt/mqm/bin/strmqm AIIBSPRD
-----------------------------------------------------------------------------------------------
2. Make the Script Executable

sudo chmod +x /etc/rc.d/init.d/start_qm

3. Add the Script to Startup Using chkconfig

sudo chkconfig --add start_qm
sudo chkconfig start_qm on

4. Verify the Script is Enabled

chkconfig --list start_qm

The script will automatically run every time the server boots into a multi-user mode (runlevels 2–5).
It will start your IBM MQ Queue Manager named AIIBSPRD without manual intervention.