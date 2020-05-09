--SOFTAP local  STATION conect to router
--wifi.setmode(wifi.SOFTAP)
--wifi.sta.config("costycnc","costycnc")

-- setto la modalità Access Point
wifi.setmode(wifi.SOFTAP)
-- setto parametri Access Point
cfgSoftAP={}
cfgSoftAP.ssid="Costy"
--cfgSoftAP.pwd="PassSegreta"
wifi.ap.config(cfgSoftAP)
-- setto parametri ip
cfgIP ={}
cfgIP.ip = "192.168.4.1"
cfgIP.netmask = "255.255.255.0"
cfgIP.gateway = "192.168.4.1"
wifi.ap.setip(cfgIP)

led2 = 4
gpio.mode(led2, gpio.OUTPUT)
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = buf.."<h1> ESP8266 Web Server</h1>";
        buf = buf.."<p>GPIO2 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
        local _on,_off = "",""
        if(_GET.pin == "ON1")then
        elseif(_GET.pin == "ON2")then
              gpio.write(led2, gpio.HIGH);
              print(request);
        elseif(_GET.pin == "OFF2")then
              gpio.write(led2, gpio.LOW);
        end
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)


