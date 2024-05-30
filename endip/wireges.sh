{
        "route": {
                "geoip": {
                "path": "geo-assets\\sagernet-sing-geoip-geoip.db"
                },
                "geosite": {
                "path": "geo-assets\\sagernet-sing-geosite-geosite.db"
                },
                "rules": [
                {
                        "inbound": "dns-in",
                        "outbound": "dns-out"
                },
                {
                        "port": 53,
                        "outbound": "dns-out"
                },
                {
                        "clash_mode": "Direct",
                        "outbound": "direct"
                },
                {
                        "clash_mode": "Global",
                        "outbound": "select"
                }
                ],
                "auto_detect_interface": true,
                "override_android_vpn": true
        },
        "outbounds": [
                {
                "type": "selector",
                "tag": "select",
                "outbounds": [
                        "auto",
                        "IP->Iran, Shaycom",
                        "IP->Main, Shaycom"
                ],
                "default": "auto"
                },
                {
                "type": "urltest",
                "tag": "auto",
                "outbounds": [
                        "IP->Iran, Shaycom",
                        "IP->Main, Shaycom"
                ],
                "url": "http://cp.cloudflare.com/",
                "interval": "10m0s"
                },
                {
                "type": "wireguard",
                "tag": "IP->Iran, Shaycom",
                "local_address": [
                        "172.16.0.2/32",
                        "2606:4700:110:8a1b:c21e:2ee7:6f70:bb40/128"
                ],
                "private_key": "iG+eCGp38G96ps7kqXpjbkqtuEfbiVOsW942Ya+CLlA=",
                "server": "188.114.96.179",
                "server_port": 859,
                "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                "reserved": [239,168,243],
                "mtu": 1280,
                "fake_packets": "5-10"
                },
                {
                "type": "wireguard",
                "tag": "IP->Main, Shaycom",
                "detour": "IP->Iran, Shaycom",
                "local_address": [
                        "172.16.0.2/32",
                        "2606:4700:110:8a1f:856:6e40:7b39:2d27/128"
                ],
                "private_key": "qJitqRe/bE/nn7UIB/NcSZF6XijOkQ5kSDAxI5JiKUo=",
                "server": "188.114.96.179",
                "server_port": 859,
                "peer_public_key": "bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                "reserved": [216,33,114],
                "mtu": 1280,
                "fake_packets": "5-10"
                },
                {
                "type": "dns",
                "tag": "dns-out"
                },
                {
                "type": "direct",
                "tag": "direct"
                },
                {
                "type": "direct",
                "tag": "bypass"
                },
                {
                "type": "block",
                "tag": "block"
                }
        ]
        }