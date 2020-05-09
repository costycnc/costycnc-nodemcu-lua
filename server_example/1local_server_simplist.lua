--inspired from https://github.com/mohamadrezashafie/ESP8266-Server-LUA-hello-world/blob/master/init.lua

-- setto la modalità Access Point
wifi.setmode(wifi.SOFTAP)
-- setto parametri Access Point
cfgSoftAP={}
cfgSoftAP.ssid="costycnc"
--cfgSoftAP.pwd="PassSegreta"
wifi.ap.config(cfgSoftAP)
-- setto parametri ip
cfgIP ={}
cfgIP.ip = "192.168.4.1"
cfgIP.netmask = "255.255.255.0"
cfgIP.gateway = "192.168.4.1"
wifi.ap.setip(cfgIP)

srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        print(request);
        buf = buf.."<h1> HELLO FROM ESP8266 Web Server costycnc</h1>";
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)