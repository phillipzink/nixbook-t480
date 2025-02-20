{ config, pkgs, ... }: {
  imports = [
      <nixoshardware/lenovo/thinkpad/t480>
  ];

  # enable powertop auto tuning on startup
  # run one time: sudo powertop --auto-tune
  powerManagement.powertop.enable = true;

  # Enable TLP for better power management
  services.tlp.enable = true;

  # Enable power management and monitoring
  services.upower.enable = true;

  # For keyboard backlight control (if not working out of the box)
  hardware.acpilight.enable = true;

  # https://nixos.wiki/wiki/ECryptfs
  environment.systemPackages = with pkgs; [
    ecryptfs
  ];

  # Automatically mount your private folder on login with PAM
  security.pam.enableEcryptfs = true;
  boot.kernelModules = ["ecryptfs"];
}
