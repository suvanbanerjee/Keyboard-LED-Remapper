#!/bin/bash

# Define function for process p1
p1() {
    echo "Process p1 started"
    sleep 5  # Example command, replace with actual p1 logic
    echo "Process p1 finished"
}

# Define function for process p2
p2() {
    echo "Process p2 started"
    sleep 3  # Example command, replace with actual p2 logic
    echo "Process p2 finished"
}

# Run process p1 in the background
p1 &

# Save the PID of the background process
p1_pid=$!

# Run process p2 in the foreground
p2

# If p2 finishes, terminate p1
echo "p2 finished, terminating p1..."
kill $p1_pid