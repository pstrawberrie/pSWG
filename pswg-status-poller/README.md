# SWGEmu Status Poller

This script connects to the SWGEmu status server on `localhost:44455`, parses the XML response, and writes it to a JSON file every 60 seconds.

It is designed to run as a persistent `systemd` service on **Debian 12**.

---

## 📦 Requirements

- Python 3 (already included on Debian 12)
- A running SWGEmu ZoneServer with status server enabled
- Your user (`swg`) must have access to run systemd units

---

## 🛠️ Installation

### 1. Copy the Script

Save `pswg-status-poller.py` to a permanent location and create the `pswg-status.json` JSON file:

```bash
sudo mkdir -p /opt/pswg-status-poller
sudo cp pswg-status-poller.py /opt/pswg-status-poller/
sudo chmod +x /opt/pswg-status-poller/pswg-status-poller.py
sudo touch /opt/pswg-status-poller/pswg-status.json
sudo chown swg:swg /opt/pswg-status-poller/pswg-status.json
```

### 2. Create the systemd Service

Create the service file:

```bash
sudo nano /etc/systemd/system/pswg-status-poller.service
```

Paste in the following content:

```ini
[Unit]
Description=SWGEmu Status XML Poller
After=network.target

[Service]
Type=simple
ExecStart=/usr/bin/python3 /opt/pswg-status-poller/pswg-status-poller.py
WorkingDirectory=/opt/pswg-status-poller
Restart=always
RestartSec=5
User=swg

[Install]
WantedBy=multi-user.target
```

### 3. Enable and Start the Service

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now pswg-status-poller.service
```

### 4. Verify the Service is Running

```bash
systemctl status pswg-status-poller.service
journalctl -u pswg-status-poller.service -f
```

### 5. Using the Service

```bash
sudo systemctl stop pswg-status-poller.service
sudo systemctl restart pswg-status-poller.service
```

### 6. Removing the Service

```bash
sudo systemctl disable --now pswg-status-poller.service
sudo rm /etc/systemd/system/pswg-status-poller.service
sudo systemctl daemon-reload
```
