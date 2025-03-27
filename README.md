# nixbook-t480

After Nixbook is installed and rebooted and you are at the login screen:
1. Press Ctrl+alt+F1 at the same time.
2. login as root
3. ```
   cd /etc
   git clone https://github.com/phillipzink/nixbook-t480
   cd nixbook-t480
   ./install
   ```
4. Enter the username that you set up during install to configure user home encryption
5. ```exit```
6. Press Ctrl+alt+F1 at the same time to return to login screen

7. Login and open terminal
8. ```ecryptfs-unwrap-passphrase```
9. enter user password
10. write down the code on paper. it can be used to recover your user data if you forget password
11. [disable root login](https://wiki.archlinux.org/title/Sudo#Disable_root_login)
    ```
    # be sure your user is in the wheel group and can sudo
    sudo passwd -l root
    # also added a line in configuration.nix? probably doesn't do anything
    # Disable password-based login for root.
    users.users.root.hashedPassword = "!";
    ```
