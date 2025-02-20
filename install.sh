#!/bin/sh

echo "This will install Thinkpad T480/T480s specific configurations.";
read -p "Do you want to continue? (y/n): " answer

if [[ "$answer" =~ ^[Yy]$ ]]; then
  echo "Installing T408/T480s configuration..."
  # Add Nixbook config
  sed -i '/hardware-configuration\.nix/a\      /etc/nixbook-t480/t480-configuration\.nix' /etc/nixos/configuration.nix

  # Add nix-hardware channel and rebuild
  nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
  nix-channel --update
  nixos-rebuild switch

  nix-shell -p powertop
  powertop --auto-tune

  read -p "Username: " answer
  ecryptfs-migrate-home -u "$answer"
else
  echo "T480/T480s Install Cancelled!"
fi
