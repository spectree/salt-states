#!stateconf
{% from 'states/cobbler/map.jinja' import cobbler as cobbler_map with context %}

{% set application = 'cobbler' %}
{% set ipv6 = False %}
{% set public = False %}
{% set components = cobbler_map.ports %}

{% include 'states/templates/iptables.sls.jinja' with context %}
