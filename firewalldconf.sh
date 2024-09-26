#!/bin/bash

ssh_port=2222
internal=ens36
external=ens33

# Привязка интерфейсов к зонам
firewall-cmd --permanent --change-interface=$internal --zone=internal
firewall-cmd --permanent --change-interface=$external --zone=external

# Приоритеты трафика для внутренних и внешних зон
firewall-cmd --permanent --set-ingress-priority=-10 --zone=internal
firewall-cmd --permanent --set-egress-priority=100 --zone=internal
firewall-cmd --permanent --set-ingress-priority=100 --zone=external
firewall-cmd --permanent --set-egress-priority=-10 --zone=external

# Создание политики с назначением зон
firewall-cmd --permanent --new-policy=inet
firewall-cmd --permanent --policy=inet --add-ingress-zone=internal
firewall-cmd --permanent --policy=inet --add-egress-zone=external
firewall-cmd --permanent --set-target=ACCEPT --policy=inet

firewall-cmd --add-protocol=ospf --zone=internal --permanent
firewall-cmd --add-protocol=ospf --zone=external --permanent
firewall-cmd --add-protocol=eigrp --zone=internal --permanent
firewall-cmd --add-protocol=eigrp --zone=external --permanent

# Добавление портов для DNS и SSH
firewall-cmd --add-port=53/udp --zone=external --permanent
firewall-cmd --add-port=53/tcp --zone=external --permanent
firewall-cmd --add-port=53/udp --zone=internal --permanent
firewall-cmd --add-port=53/tcp --zone=internal --permanent
firewall-cmd --add-port=5001/tcp --zone=external --permanent
firewall-cmd --add-port=5001/udp --zone=internal --permanent
firewall-cmd --add-port=$ssh_port/tcp --zone=external --permanent
firewall-cmd --add-port=$ssh_port/udp --zone=internal --permanent

# Применение изменений
firewall-cmd --reload

# Вывод настроек для проверки
firewall-cmd --list-all --zone=external
firewall-cmd --list-all --zone=internal!/bin/bash

ssh_port=2222
internal=ens36
external=ens33

# Привязка интерфейсов к зонам
firewall-cmd --permanent --change-interface=$internal --zone=internal
firewall-cmd --permanent --change-interface=$external --zone=external

# Приоритеты трафика для внутренних и внешних зон
firewall-cmd --permanent --set-ingress-priority=-10 --zone=internal
firewall-cmd --permanent --set-egress-priority=100 --zone=internal
firewall-cmd --permanent --set-ingress-priority=100 --zone=external
firewall-cmd --permanent --set-egress-priority=-10 --zone=external

# Создание политики с назначением зон
firewall-cmd --permanent --new-policy=inet
firewall-cmd --permanent --policy=inet --add-ingress-zone=internal
firewall-cmd --permanent --policy=inet --add-egress-zone=external
firewall-cmd --permanent --set-target=ACCEPT --policy=inet

firewall-cmd --add-protocol=ospf --zone=internal --permanent
firewall-cmd --add-protocol=ospf --zone=external --permanent
firewall-cmd --add-protocol=eigrp --zone=internal --permanent
firewall-cmd --add-protocol=eigrp --zone=external --permanent

# Добавление портов для DNS и SSH
firewall-cmd --add-port=53/udp --zone=external --permanent
firewall-cmd --add-port=53/tcp --zone=external --permanent
firewall-cmd --add-port=53/udp --zone=internal --permanent
firewall-cmd --add-port=53/tcp --zone=internal --permanent
firewall-cmd --add-port=5001/tcp --zone=external --permanent
firewall-cmd --add-port=5001/udp --zone=internal --permanent
firewall-cmd --add-port=$ssh_port/tcp --zone=external --permanent
firewall-cmd --add-port=$ssh_port/udp --zone=internal --permanent

# Применение изменений
firewall-cmd --reload

# Вывод настроек для проверки
firewall-cmd --list-all --zone=external
firewall-cmd --list-all --zone=internal
