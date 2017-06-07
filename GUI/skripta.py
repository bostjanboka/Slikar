import subprocess
import sys


print(str(sys.argv[1]))

p = subprocess.run(["python", "evaluate.py", "--checkpoint", "F:/tensor/fast-style-transfer-master/data\models/la_muse.ckpt", "--in-path", str(sys.argv[1]), "--out-path", "F:/tensor/fast-style-transfer-master/GUI/data/out1"], stdout=subprocess.PIPE)

nmap_lines = p.stdout.splitlines()
print(nmap_lines)

p = subprocess.run(["python", "evaluate.py", "--checkpoint", "F:/tensor/fast-style-transfer-master/data/models/rain_princess.ckpt", "--in-path", str(sys.argv[1]), "--out-path", "F:/tensor/fast-style-transfer-master/GUI/data/out2"], stdout=subprocess.PIPE)
p = subprocess.run(["python", "evaluate.py", "--checkpoint", "F:/tensor/fast-style-transfer-master/data\models/scream.ckpt", "--in-path", str(sys.argv[1]), "--out-path", "F:/tensor/fast-style-transfer-master/GUI/data/out3"], stdout=subprocess.PIPE)
p = subprocess.run(["python", "evaluate.py", "--checkpoint", "F:/tensor/fast-style-transfer-master/data\models/udnie.ckpt", "--in-path", str(sys.argv[1]), "--out-path", "F:/tensor/fast-style-transfer-master/GUI/data/out4"], stdout=subprocess.PIPE)
p = subprocess.run(["python", "evaluate.py", "--checkpoint", "F:/tensor/fast-style-transfer-master/data\models/wave.ckpt", "--in-path", str(sys.argv[1]), "--out-path", "F:/tensor/fast-style-transfer-master/GUI/data/out5"], stdout=subprocess.PIPE)
p = subprocess.run(["python", "evaluate.py", "--checkpoint", "F:/tensor/fast-style-transfer-master/data\models/wreck.ckpt", "--in-path", str(sys.argv[1]), "--out-path", "F:/tensor/fast-style-transfer-master/GUI/data/out6"], stdout=subprocess.PIPE)



#os.system("evaluate.py --checkpoint F:/tensor/fast-style-transfer-master/data\models/la_muse.ckpt --in-path C:/Users/Bostjan/Pictures/scene00049.jpg --out-path F:/tensor/fast-style-transfer-master")