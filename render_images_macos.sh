if [ ! -e blender ]; then 
    echo "Blender not found. Please run download_blender.sh first."
    exit 1
fi
(
    cd image_generation \
    && \
    ../blender/blender.app/Contents/MacOS/blender -noaudio --background --python render_images.py -- --num_images 1 --min_objects 2 --max_objects 2 --render_num_samples 128 --render_tile_size 32
)