#!/usr/bin/env python3

import os

def _find_files(path, fileExtList):
    fList = []

    for root, subdirs, files in os.walk(path):
        for filename in files:
            if os.path.splitext(filename)[1] in fileExtList:
                fList.append(os.path.join(root, filename))

    return fList

def _read_files(fileList, regex):
    data = []

    for file in fileList:
        with open(file) as f:
            for line in f:
                if regex in line:
                    data.append(line)

    return data

def main():
    config = {}
    config['extList']       = ['.yaml', '.yml']
    config['path']          = os.getcwd()
    config['docRe']         = "#*"
    config['outfile']       = "README.md"
    fileList = _find_files(config['path'], config['extList'])
    print fileList

    data = _read_files(fileList, config['docRe'])

    with open(config['outfile'], "w") as f:
        for line in data:
            f.write("%s" % line[2:])

main()
