#!/usr/bin/env bash
xpra list||true
ss -ltnp|grep 14500||true
