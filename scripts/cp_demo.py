import os
import pickle
import tempfile
import time

CHECKPOINT = "calc_checkpoint.pkl"
RESULT_FILE = "final_results.pkl"

def load_checkpoint():
    if os.path.exists(CHECKPOINT):
        with open(CHECKPOINT, "rb") as f:
            checkpoint = pickle.load(f)
        print(f"Resuming from x = {checkpoint['last_x'] + 1}")
        return checkpoint['last_x'], checkpoint['results']
    else:
        print("No checkpoint found. Starting fresh.")
        return 0, {}

def save_checkpoint(last_x, results):
    checkpoint_dir = os.path.dirname(os.path.abspath(CHECKPOINT))
    with tempfile.NamedTemporaryFile('wb', dir=checkpoint_dir, delete=False) as tmp:
        pickle.dump({'last_x': last_x, 'results': results}, tmp)
        tmp.flush()
        os.fsync(tmp.fileno())
        os.replace(tmp.name, CHECKPOINT)
    print(f"Checkpoint saved at x = {last_x}")

def compute_y(x):
    time.sleep(1)
    return x**2 + 2*x + 1

last_x, results = load_checkpoint()

for x in range(last_x + 1, 51):
    y = compute_y(x)
    results[x] = y
    print(f"x={x}, y={y}")
    save_checkpoint(x, results)   # now saves after each iteration

print("All calculations complete!")

with open(RESULT_FILE, "wb") as f:
    pickle.dump(results, f)

if os.path.exists(CHECKPOINT):
    os.remove(CHECKPOINT)
    print("Checkpoint file removed after successful completion.")

