#!/usr/bin/env python3
import socket
import time
import json
import xml.etree.ElementTree as ET
from datetime import datetime

HOST = '127.0.0.1'
PORT = 44455
OUTPUT_FILE = 'pswg-status.json'
INTERVAL = 60  # seconds

def fetch_status_xml():
    try:
        with socket.create_connection((HOST, PORT), timeout=2) as sock:
            data = sock.recv(4096)
            return data.decode()
    except Exception as e:
        print(f"[{datetime.now()}] Could not connect to status server: {e}")
        return None

def parse_xml(xml_data):
    try:
        root = ET.fromstring(xml_data)
        if root.find('status') is not None and root.find('status').text != 'up':
            raise Exception("Server is reported down")

        return {
            "name": root.findtext("name", "unknown"),
            "status": "up",
            "users": {
                "connected": int(root.findtext("users/connected", 0)),
                "cap": int(root.findtext("users/cap", 0)),
                "max": int(root.findtext("users/max", 0)),
                "total": int(root.findtext("users/total", 0)),
                "deleted": int(root.findtext("users/deleted", 0)),
            },
            "uptime": int(root.findtext("uptime", 0)),
            "timestamp": int(root.findtext("timestamp", 0))
        }
    except Exception as e:
        print(f"[{datetime.now()}] Failed to parse XML: {e}")
        return default_status("down")

def default_status(state="down"):
    return {
        "name": "unknown",
        "status": state,
        "users": {
            "connected": 0,
            "cap": 0,
            "max": 0,
            "total": 0,
            "deleted": 0,
        },
        "uptime": 0,
        "timestamp": int(time.time() * 1000)
    }

def write_status_to_json(status):
    with open(OUTPUT_FILE, 'w') as f:
        json.dump(status, f, indent=2)
        print(f"[{datetime.now()}] Wrote status to {OUTPUT_FILE}")

def main_loop():
    while True:
        xml = fetch_status_xml()
        if xml:
            status = parse_xml(xml)
        else:
            status = default_status()

        write_status_to_json(status)
        time.sleep(INTERVAL)

if __name__ == "__main__":
    main_loop()
