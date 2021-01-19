
# 8relayhv-rpi


This is the command line and python functions to control the High voltage Relays Card for Raspberry Pi.

Don't forget to enable I2C communication:
```bash
~$ sudo raspi-config
```

## Usage

```bash
~$ git clone https://github.com/SequentMicrosystems/8relayhv-rpi.git
~$ cd 8relayhv-rpi/
~/8relayhv-rpi$ sudo make install
```

Now you can access all the functions of the relays board through the command "8relayhv". Use -h option for help:
```bash
~$ 8relayhv -h
```

If you clone the repository any update can be made with the following commands:

```bash
~$ cd 8relayhv-rpi/  
~/8relayhv-rpi$ git pull
~/8relayhv-rpi$ sudo make install
```  

### [Python library](https://github.com/SequentMicrosystems/8relayhv-rpi/python)


