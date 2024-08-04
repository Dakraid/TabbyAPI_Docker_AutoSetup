#!bin/sh
if [ "$DOWNLOAD_MODEL" = "true" ]; then
    if [ -d "./models/$MODEL_NAME" ]; then
        echo "Model is already downloaded, skipping."
    else
        HF_HUB_ENABLE_HF_TRANSFER=1 huggingface-cli download $MODEL_REPO --local-dir ./models/$MODEL_NAME --cache-dir ./models/.cache
    fi

    sed -i.bak "s/^.*model_name:.*/  model_name: $MODEL_NAME/" "config.yml"

    if [ $? -eq 0 ]; then
        echo "Updated model_name to $MODEL_NAME in config.yml"
    else
        echo "Failed to update model_name in config.yml"
        exit 1
    fi
fi

if [ -n "$ADMIN_KEY" ] && [ -n "$API_KEY" ]; then
    > api_tokens.yml
    echo "admin_key: $ADMIN_KEY" >> api_tokens.yml
    echo "api_key: $API_KEY" >> api_tokens.yml
fi

python3 main.py
