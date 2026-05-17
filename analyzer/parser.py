import argparse
import os

def parse_log_file(filepath, output_path):
    """
    Parses a given Linux log file, counts log levels, and writes results.
    """
    if not os.path.exists(filepath):
        print(f"Error: File not found - {filepath}")
        return
    
    print(f"\n--- Start parsing: {os.path.basename(filepath)} ---")
    
    # Initialize counters
    counts = {
        "INFO": 0,
        "WARNING": 0,
        "ERROR": 0
    }
    
    total_lines = 0
    
    # Read and parse the file
    with open(filepath, 'r') as infile:
        for line in infile:
            total_lines += 1
            if "INFO" in line:
                counts["INFO"] += 1
            elif "WARNING" in line:
                counts["WARNING"] += 1
            elif "ERROR" in line:
                counts["ERROR"] += 1
                
    # 1. Display summary in the terminal
    print("[Log Analysis Summary]")
    print(f"Total lines processed: {total_lines}")
    print(f"  [+] INFO   : {counts['INFO']}")
    print(f"  [!] WARNING: {counts['WARNING']}")
    print(f"  [x] ERROR  : {counts['ERROR']}")
        
    # 2. Write the summary to the output file
    with open(output_path, 'w') as outfile:
        outfile.write(f"Analysis Report for: {os.path.basename(filepath)}\n")
        outfile.write("=" * 40 + "\n")
        outfile.write(f"Total lines: {total_lines}\n")
        outfile.write("-" * 40 + "\n")
        outfile.write(f"INFO events   : {counts['INFO']}\n")
        outfile.write(f"WARNING events: {counts['WARNING']}\n")
        outfile.write(f"ERROR events  : {counts['ERROR']}\n")
        
    print(f"\nResults successfully saved to: {output_path}")
    print("-" * 50)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Linux Log Parser")
    parser.add_argument("log_file", help="Path to the log file to parse")
    parser.add_argument("--output", help="Path to output the results", default="../output/results.txt")
    
    args = parser.parse_args()
    parse_log_file(args.log_file, args.output)
