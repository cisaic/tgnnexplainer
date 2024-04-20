import os
import shutil


IN_PATH = "./saved_checkpoints/"
OUT_PATH = "./checkpoints/"

if not os.path.exists(OUT_PATH):
    os.makedirs(OUT_PATH)

for fname in os.listdir(IN_PATH):
    if not fname.endswith(".pth"):
        continue
    if "simulate_v1" in fname or "simulate_v2" in fname:
        epoch = 99
    else:
        epoch = 9
    if "-{}.pth".format(epoch) not in fname:
        continue # or delete
    parts = fname.split("-")
    print ("copying", fname, epoch)
    # print (parts)
    ds = parts[2]
    seed = parts[3]
    shutil.copy2(IN_PATH + fname, OUT_PATH + f"tgn-attn_{ds}_{seed}_best.pth")

