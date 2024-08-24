# TabbyAPI Docker Image with Autosetup (Unofficial)

This repository contains the file to setup a Docker image for TabbyAPI that automatically downloads a model on first container startup and updates the included config.

The idea is to have something that can be fire and forget, requiring little to no setup. If required you can overlay the config.yaml with your own. I might update it to use an environment defined source URI for a config that can be pulled at first startup and updated so it isn't baked directly into the image.

# Usage

### Following enviroment variables are avaliable:

-   `ADMIN_KEY` - The admin key to use for the API.

Defaults to `setMe`

-   `API_KEY` - The API key to use for the API.

Defaults to `setMe`

-   `DOWNLOAD_MODEL` - Whether to download the model on first startup.

Defaults to `true`

-   `MODEL_REPO` - The model repository to download the model from.

Defaults to `MikeRoz/NeverSleep_Lumimaid-v0.2-123B-5.0bpw-h8-exl2`

-   `MODEL_NAME` - The name of the model to save as.

Defaults to `MikeRoz_NeverSleep_Lumimaid-v0.2-123B-5.0bpw-h8-exl2`

-   `CONFIG_URL` - The URL to download the config from.

Defaults to `https://raw.githubusercontent.com/Dakraid/TabbyAPI_Docker_Config/main/config.yml`

### Following build args are avaliable:

-   `DO_PULL` - Whether to pull the latest image from Docker Hub on first startup.

Defaults to `true`

-   `GIT_REPO` - The repository to download TabbyAPI from.

Defaults to `https://github.com/theroyallab/tabbyAPI`
