


;/adb
一、Ubuntu环境
    echo '0x2a45' >> ~/.android/adb_usb.ini #添加行

    sudo echo 'SUBSYSTEM=="usb", ATTR{idVendor}=="2a45", MODE="0666", GROUP="plugdev" ' >> /etc/udev/rules.d/51-android.rules
    sudo chmod a+rx /etc/udev/rules.d/51-android.rules
    sudo adduser plugdev
5.  按下面流程重启udev服务或直接重启PC
    sudo service udev restart

三、Windows 7中文环境
1.  建立或修改C:\用户\<你的用户名>\.android\adb_usb.ini文件，在该文件中添加一行文本，内容是0x2a45

2.  检查ADB设备是否找到（命令行程序中）
!!!!!需要设置只充电状态 并开启usb调试?
    adb kill-server
    adb devices

参考文档： http://developer.android.com/tools/device.html




 的APK后缀名改为.rar或则 .zip，并解压，得到其中的额
classes.dex文件（它就是java文件编译再通过dx工具打包而成的），将获取到的classes.dex
放到之前解压出来的工具
dex2jar-0.0.9.15 文件夹内，
在命令行下定位到dex2jar.bat所在目录，输入
dex2jar.bat   classes.dex，效果如下
