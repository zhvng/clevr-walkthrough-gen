if [ -e blender ]; then
    echo "Blender already downloaded"
else
    echo "Downloading Blender"
    curl https://download.blender.org/release/Blender2.78/blender-2.78c-OSX_10.6-x86_64.zip -o blender.zip
    unzip blender-2.78c.zip 
    mv blender-2.78c-OSX_10.6-x86_64 blender
    rm blender-2.78c.zip
fi

echo "Adding pth file to Blender, as described in README.md"
echo $PWD/image_generation >> ./blender/blender.app/Contents/Resources/2.78/python/lib/python3.5/site-packages/clevr.pth