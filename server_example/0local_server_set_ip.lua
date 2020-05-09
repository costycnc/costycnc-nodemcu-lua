-- setto la modalità Access Point
wifi.setmode(wifi.SOFTAP)
-- setto parametri Access Point
cfgSoftAP={}
cfgSoftAP.ssid="MyNode"
cfgSoftAP.pwd="PassSegreta"
wifi.ap.config(cfgSoftAP)
-- setto parametri ip
cfgIP ={}
cfgIP.ip = "192.168.4.1"
cfgIP.netmask = "255.255.255.0"
cfgIP.gateway = "192.168.4.1"
wifi.ap.setip(cfgIP)