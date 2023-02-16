import numpy as np
from PIL import Image
import argparse
import os

parser = argparse.ArgumentParser()
parser.add_argument('--output_image_dir', default='../output/images/',
    help="The directory where output images will be stored. It will be " +
         "created if it does not exist.")
parser.add_argument('--num_angles', default=2, type=int,
    help="Number of angles to use on a given scene")
parser.add_argument('--num_images', default=5, type=int,
    help="The number of images to render")
parser.add_argument('--start_idx', default=0, type=int,
    help="The index at which to start for numbering rendered images. Setting " +
         "this to non-zero values allows you to distribute rendering across " +
         "multiple machines and recombine the results later.")
parser.add_argument('--filename_prefix', default='',
    help="This prefix will be prepended to the rendered images and JSON scenes")
parser.add_argument('--split', default='',
    help="Name of the split for which we are rendering. This will be added to " +
         "the names of rendered images, and will also be stored in the JSON " +
         "scene structure for each image.")



# args.num images, start idx


def save_img(output_image_dir='render', num_angles=2):

    print(output_image_dir, num_angles)

    greyscale_image = np.zeros((512,512), dtype = np.uint8)
    greyscale_image.fill(4)

    for angle_number in range(num_angles):
        depth_path = os.path.join(output_image_dir, "%03d_depth.tiff" % angle_number)
        
        im = Image.fromarray(greyscale_image) # float32
        im.save(depth_path)

num_digits=2

args = parser.parse_args()

prefix = ''
img_dir_template = '%s%%0%dd' % (prefix, num_digits)
img_dir_template = os.path.join(args.output_image_dir, img_dir_template)

for i in range(args.num_images):
    img_dir_path = img_dir_template % (i + args.start_idx)
    
    save_img(img_dir_path, args.num_angles)

# # create 512 x 512 .tiff file of depths 
# depth_img = np.zeros((512,512))
# depth_img_filepath = os.path.join(output_image_dir_path, "%d_depth.png" % angle_number)
# # im = Image.fromarray(depth_img, mode='F') # float32
# matplotlib.image.imsave(depth_img_filepath, depth_img)

# import numpy as np


# data = np.random.randint(0, 255, (10,10)).astype(np.uint8)
# im = Image.fromarray(data)
# im.save('test.tif')