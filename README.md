# Keyboard LED Remapper (Linux)

Apart from the CAPS LOCK, the NUM LOCK, and the SCROLL LOCK on your keyboard are not used for anything meaningful. This project aims to change that by allowing you to use these LEDs as indicators for various system events, such as Disk Activity, Network Activity, CPU Usage, etc.

## Description

This project is my first GitHub project. It used to be a simple shell script that I ran on my computer to use the Scroll Lock LED as the Disk Activity LED. But now, after 2 years of learning programming, I have decided to make it better. Now, it is a TUI installer that can apply the earlier mentioned functionality to your computer, with the bonus of choosing any light on your keyboard and some other cool functions to choose from. It works on both Wayland and X11.

## Requirements

- Python
- Newt-whiptail (for the TUI)

Note: The script will install the required packages if they are not already installed. no need to worry about that.

## Legacy Version
The original shell script is still available in the legacy branch. you can find it [here](https://github.com/suvanbanerjee/keyboard-led-remapper/tree/legacy)

## Getting Started

Just copy and paste in terminal DONE!

```bash
sh -c "curl -s https://raw.githubusercontent.com/suvanbanerjee/Keyboard-LED-Remapper/main/installer.sh -o installer.sh && chmod +x installer.sh && sudo ./installer.sh && rm installer.sh"
```

## How this works (Why this script needs root permission)

The script check the contents of `/sys/class/leds/` to find the LEDs on your keyboard. It then uses the `echo` command to write to the LED files in `/sys/class/leds/`. The script runs in the background and checks for the system events you have chosen. When the event occurs, the script writes to the LED file to turn the LED on. When the event stops, the script writes to the LED file to turn the LED off.

To run constantly in the background, the script creates a systemd service that runs the script at startup. The name of the service is the name of the led you have chosen. for example, if you have chosen the Scroll Lock LED, the service will be called `scrolllock.service`.

## Run this manually

If you don't want to run the installer, you can run the script manually. just edit the `mod_templed.sh` file and change the values of the variables at the top of the file. It is well commented, so you should not have any problem understanding it. Then add the script to your startup applications.

## Screenshots

![alt text](screenshots/image.png)
![alt text](screenshots/image-1.png)
![alt text](screenshots/image-3.png)
![alt text](screenshots/image-2.png)


## 👥 Author

[Suvan Banerjee](https://github.com/suvanbanerjee)

## License

This project is licensed under the Unlicense - see the [LICENSE](https://github.com/suvanbanerjee/Keyboard-LED-Remapper/blob/main/LICENSE) file for details