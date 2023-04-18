import random
import os
from tqdm import tqdm

def generate_random_code():
    code = ''.join(random.choices('BCDFGHJKMNPQRTUVWXYZ2346789', k=25))
    formatted_code = '-'.join([code[i:i+4] for i in range(0, 20, 4)] + [code[20:]])
    return formatted_code

folder_name = "Soft gen"
folder_path = os.path.join(folder_name)

# create the folder if it doesn't exist
if not os.path.exists(folder_path):
    os.mkdir(folder_path)

manifest_filename = os.path.join(folder_path, "SAVE.SAVE-MANIFEST")

# check if the manifest file exists
if os.path.isfile(manifest_filename):
    # read the last saved index from the manifest file
    with open(manifest_filename, "r") as f:
        last_index = int(f.read().strip())
else:
    # create the manifest file with initial index 1
    with open(manifest_filename, "w") as f:
        f.write("1")
    last_index = 1

total_codes = 10000
filename = os.path.join(folder_path, f"{last_index}.txt")
with open(filename, "w") as f:
    with tqdm(total=total_codes, mininterval=0, dynamic_ncols=True) as pbar:
        for i in range(total_codes):
            code = generate_random_code()
            # write the code to the file
            f.write(code + "\n")
            # update the progress bar
            pbar.update(1)
            # increment the index
            last_index += 1

# update the manifest file with the new index
with open(manifest_filename, "w") as f:
    f.write(str(last_index))

print("Done! Codes saved in:", filename)
