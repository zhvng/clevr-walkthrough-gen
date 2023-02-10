if [ ! -e blender ]; then 
    echo "Blender not found. Please run download_blender.sh first."
    exit 1
fi
(
    cd image_generation \
    && \
    ../blender/blender --background --python render_images.py -- --num_images 10
)