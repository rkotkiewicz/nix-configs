{ config, pkgs, lib, ... }:

{
  services.comfyui = {
    enable = true;
    package = pkgs.pkgsRocm.comfyui;
    models = [
      {
        name = "ltx-2.3-22b-dev-fp8.safetensors";
        url = "https://huggingface.co/Lightricks/LTX-2.3-fp8/resolve/main/ltx-2.3-22b-dev-fp8.safetensors";
        hash = "sha256-KGBsW1oGzlb4ltTfyyDyEnOeB6aPvkjlNjgYhEnSZFA=";
        installPaths = "checkpoints";
      }
      {
        name = "gemma-3-12b-it-abliterated_lora_rank64_bf16.safetensors";
        url = "https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/loras/gemma-3-12b-it-abliterated_lora_rank64_bf16.safetensors";
        hash = "sha256-h7yr6sm+yfN0IytRItZRHCshEtR55QF2FJ6USzcS60o=";
        installPaths = "loras";
      }
      {
        name = "ltx_2.3_22b_distilled_1.1_lora_dynamic_fro09_avg_rank_111_bf16.safetensors";
        url = "https://huggingface.co/Comfy-Org/ltx-2.3/resolve/main/split_files/loras/ltx_2.3_22b_distilled_1.1_lora_dynamic_fro09_avg_rank_111_bf16.safetensors";
        hash = "sha256-MeDAGV+4Qb8xr3jotghY9InofdzqSlI5q8gJQ9pl46w=";
        installPaths = "loras";
      }
      {
        name = "gemma_3_12B_it_fp4_mixed.safetensors";
        url = "https://huggingface.co/Comfy-Org/ltx-2/resolve/main/split_files/text_encoders/gemma_3_12B_it_fp4_mixed.safetensors";
        hash = "sha256-qspGPRHm2NKkvbDWKZIUwV73ij9z4O+BE9Wp0CGbP20=";
        installPaths = "text_encoders";
      }
      {
        name = "ltx-2.3-spatial-upscaler-x2-1.1.safetensors";
        url = "https://huggingface.co/Lightricks/LTX-2.3/resolve/main/ltx-2.3-spatial-upscaler-x2-1.1.safetensors";
        hash = "sha256-X0FjEfqBcrZa9nUwdYlkcI0poxe4MNaJpRFDt/kZE+0=";
        installPaths = "latent_upscale_models";
      }
    ];
  };
}