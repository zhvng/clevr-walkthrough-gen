if [ -e blender ]; then
    echo "Blender already downloaded"
else
    echo "Downloading Blender"
    wget https://download.blender.org/release/Blender2.78/blender-2.78c-linux-glibc219-i686.tar.bz2
    tar -xvf blender-2.78c-linux-glibc219-i686.tar.bz2 
    mv blender-2.78c-linux-glibc219-i686 blender
    rm blender-2.78c-linux-glibc219-i686.tar.bz2
fi

echo "Adding pth file to Blender, as described in README.md"
echo $PWD/image_generation >> ./blender/2.78/python/lib/python3.5/site-packages/clevr.pth