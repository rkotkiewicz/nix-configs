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
      {
        name = "minimax_h3_fl2va_pruned_int8_convrot.safetensors";
        url = "https://huggingface.co/Comfy-Org/MiniMax-H3/resolve/main/diffusion_models/minimax_h3_fl2va_pruned_int8_convrot.safetensors";
        hash = "sha256-6IkgLEHa+2exDWe5fw2FQVCANqYJCvI0JaXCYV0DxHo=";
        installPaths = "diffusion_models";
      }
      {
        name = "minimax_h3_fl2v_turbo_8step_v1.0_comfyui_bf16.safetensors";
        url = "https://huggingface.co/Comfy-Org/MiniMax-H3/resolve/main/loras/minimax_h3_fl2v_turbo_8step_v1.0_comfyui_bf16.safetensors";
        hash = "sha256-Izms3xm/4SP0a5ceo102eoStuF3kNifh7Or6WlsrER4=";
        installPaths = "loras";
      }
      {
        name = "minimax_h3_audio_vae_fp32.safetensors";
        url = "https://huggingface.co/Comfy-Org/MiniMax-H3/resolve/main/vae/minimax_h3_audio_vae_fp32.safetensors";
        hash = "sha256-jlBdld0VYdR6vUPUI4/UDZuxrp4UftCky6d412rk20g=";
        installPaths = "vae";
      }
      {
        name = "minimax_h3_video_vae_int8_convrot.safetensors";
        url = "https://huggingface.co/Comfy-Org/MiniMax-H3/resolve/main/vae/minimax_h3_video_vae_int8_convrot.safetensors";
        hash = "sha256-UqLIxzWDyG5PQc3M46atDqVimHvAvz1goM719cjmDA4=";
        installPaths = "vae";
      }
      {
        name = "qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors";
        url = "https://huggingface.co/Comfy-Org/MiniMax-H3/resolve/main/text_encoders/qwen3vl_32b_minimax_h3_nvfp4_awq.safetensors";
        hash = "sha256-NaiNUQRCMf4zIwHXpiqoHj8sumL+vrRG4sHj4O928sY=";
        installPaths = "text_encoders";
      }
    ];
  };
}