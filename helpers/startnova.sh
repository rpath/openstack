#!/bin/bash

SERVICES="openstack-nova-api openstack-nova-objectstore openstack-nova-compute openstack-nova-network openstack-nova-scheduler openstack-nova-volume openstack-nova-ajax-console-proxy"

start()
{
        for SERVICE in `echo $SERVICES`; do
                echo $SERVICE
                service $SERVICE start
        done
}

stop()
{
        for SERVICE in `echo $SERVICES`; do
                echo $SERVICE
                service $SERVICE stop
        done
}

case "$1" in
        start)
                start
                ;;
        stop)
                stop
                ;;
        restart)
                stop
                start
                ;;
        status)
                status -p $PID_FILE openssh-daemon
                RETVAL=$?
                ;;
        *)
                echo $"Usage: $0 {start|stop|restart|reload|condrestart|status}"
                RETVAL=1
esac
exit $RETVAL

