if [ ! -e blender ]; then 
    echo "Blender not found. Please run download_blender.sh first."
    exit 1
fi

# training data
(
    cd image_generation \
    && \
    ../blender/blender.app/Contents/MacOS/blender -noaudio --background \
        --python render_dataset.py -- --num_images 2 --min_objects 2 \
        --max_objects 2 --render_num_samples 128 --render_tile_size 32 \
        --num_angles 6 --output_image_dir ../output/clvr_dataset/train  --output_scene_dir ../output/clvr_dataset/train \
        --base_scene_blendfile data/base_scene_4sided.blend \
        --width 256 --height 256
)

(
    cd image_generation && python3 save_depths.py --output_image_dir ../output/clvr_dataset/train \
        --num_angles 10 --num_images 2 --width 256 --height 256 \
        --default_depth 2
)

# testing data
(
    cd image_generation \
    && \
    ../blender/blender.app/Contents/MacOS/blender -noaudio --background \
        --python render_dataset.py -- --num_images 2 --min_objects 2 \
        --max_objects 2 --render_num_samples 128 --render_tile_size 32 \
        --num_angles 6 --output_image_dir ../output/clvr_dataset/test  --output_scene_dir ../output/clvr_dataset/test \
        --base_scene_blendfile data/base_scene_4sided.blend \
        --width 256 --height 256
)

(
    cd image_generation && python3 save_depths.py --output_image_dir ../output/clvr_dataset/test \
        --num_angles 3 --num_images 2 --width 256 --height 256 \
        --default_depth 2
)