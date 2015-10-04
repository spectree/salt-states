#!stateconf
{% from 'states/openvpn/map.jinja' import openvpn as openvpn_map with context %}
{% from 'states/defaults.map.jinja' import defaults with context %}

.params:
    stateconf.set: []
# --- end of state config ---

{% for vpnname, vpn in params.vpns.items() %}
openvpn-client-{{ vpnname }}-service:
  service.running:
    - name: {{ openvpn_map.client.service|format('client-' + vpnname) }}
    - enable: True
    - require:
      - pkg: openvpn
{% endfor %}