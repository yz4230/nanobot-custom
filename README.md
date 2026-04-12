# nanobot-custom

This repository provides a custom distribution of [nanobot](https://github.com/HKUDS/nanobot), an ultra-lightweight personal AI agent.

## 🌟 Overview

`nanobot-custom` extends the core `nanobot` functionality by bundling additional tools and skills, specifically:

- **Integrated `gws` (Google Workspace CLI):** Built from source and included in the Docker image.
- **Extra Skills:** Automatically pulls and bundles additional skills from the [Google Workspace CLI](https://github.com/googleworkspace/cli) repository.
- **Enhanced Channel Support:** Pre-installed `discord.py` for out-of-the-box Discord integration.

## 🚀 Getting Started

This project is primarily designed to be run via Docker.

### 1. Clone the Repository

Since this project uses submodules, make sure to clone recursively:

```bash
git clone --recursive https://github.com/your-username/nanobot-custom.git
cd nanobot-custom
```

### 2. Build and Run

You can build the custom image locally:

```bash
# Build the base nanobot image first
docker build -t nanobot ./nanobot

# Build the custom extension
docker build -t nanobot-custom .
```

To run the agent:

```bash
docker run -it -v ~/.nanobot:/home/nanobot/.nanobot nanobot-custom agent
```

## 🛠️ Customizations

### Google Workspace CLI (`gws`)
The `gws` tool is installed at `/usr/local/bin/gws`. You can use it within the agent's shell or as part of custom skills.

### Bundled Skills
Additional skills are located in `/app/nanobot/skills`. These are sourced from the `googleworkspace/cli` repository and are available for the agent to use.

## 📝 Configuration

Configuration follows the standard `nanobot` format. Refer to the [nanobot documentation](https://github.com/HKUDS/nanobot#️-configuration) for details on setting up providers, channels, and tools.

## 🤝 Credits

This project is based on [nanobot](https://github.com/HKUDS/nanobot) by HKUDS.
Additional skills and the `gws` tool are sourced from [googleworkspace/cli](https://github.com/googleworkspace/cli).
