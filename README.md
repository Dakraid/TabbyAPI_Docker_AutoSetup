# TabbyAPI Docker Image with Autosetup (Unofficial)
This repository contains the file to setup a Docker image for TabbyAPI that automatically downloads a model on first container startup and updates the included config.

The idea is to have something that can be fire and forget, requiring little to no setup. If required you can overlay the config.yaml with your own. I might update it to use an environment defined source URI for a config that can be pulled at first startup and updated so it isn't baked directly into the image.
