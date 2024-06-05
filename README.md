# neovim config



### docker command to start 
```
docker run --rm -it ubuntu bash -c "apt-get update && apt-get upgrade -y &&
  apt-get install -y git gcc lua5.4 neovim &&
  mkdir -p ~/.config/nvim &&
  mkdir -p ~/workspace &&
  git clone https://github.com/abhishekghoshh/neovim-config ~/.config/nvim &&
  exec nvim ~/workspace/"
```
