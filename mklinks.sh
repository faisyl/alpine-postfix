#! /bin/sh

if [ -f /run/secrets/links ]; then
  echo "Linking in config files..."
  for l in $(cat /run/secrets/links); do
    src="$(echo $l | cut -d: -f1)"
    dst="$(echo $l | cut -d: -f2)"
    [ -f "$dst" ] && mv "$dst" "$dst.saved"
    echo -n "Link: $src -> $dst:"
    if [ -f "$src" ]; then
        ln -sf "$src" "$dst"
        echo " done!"
    else
        echo " failed!"
    fi
  done
fi

