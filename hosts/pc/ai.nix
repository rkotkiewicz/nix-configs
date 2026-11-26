{ pkgs, ... }:
{
  services.ollama = {
    enable = true;

    package = pkgs.ollama-rocm;

    loadModels = [
      "qwen3-coder:30b"
      "qwen3:8b"
      "huihui_ai/Qwen3.8-abliterated:27b"
      "gemma4:12b"
    ];

    environmentVariables = {
      OLLAMA_MAX_LOADED_MODELS = "1";
      OLLAMA_CONTEXT_LENGTH = "32768";
      OLLAMA_KV_CACHE_TYPE = "q8_0";
    };

    syncModels = false;
  };
}