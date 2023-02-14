if [ ! -e blender ]; then 
    echo "Blender not found. Please run download_blender.sh first."
    exit 1
fi
(
    cd image_generation \
    && \
    ../blender/blender.app/Contents/MacOS/blender -noaudio --background \
        --python render_dataset.py -- --num_images 2 --min_objects 2 \
        --max_objects 2 --render_num_samples 128 --render_tile_size 32 \
        --num_angles 3 --output_image_dir ../output/clvr_dataset  --output_scene_dir ../output/clvr_dataset
)

(
    cd image_generation && python3 save_depths.py --output_image_dir ../output/clvr_dataset --num_angles 3 --num_images 2
)