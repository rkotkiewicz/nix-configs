{ inputs, lib, config, pkgs, ... }: {


  hardware.amdgpu.opencl.enable = true;

  services.ollama = {
    enable = true;
    package = pkgs.ollama-rocm;
  };

  services.open-webui.enable = true;
}