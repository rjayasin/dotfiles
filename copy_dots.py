#!/usr/bin/python3
import argparse
import os
import shutil

HOME = os.path.expanduser('~') 
# (where_file_lives, filename)
DOTFILES = [
           (HOME, '.vimrc'), 
           (HOME, '.tmux.conf'), 
           (HOME, '.zshrc'), 
           (HOME, '.gitignore_global'), 
           (HOME, '.gitconfig'), 
           (HOME, '.i3/config'), 
           ]

parser = argparse.ArgumentParser(description='Copy dotfiles --in or --out')
parser.add_argument('--in', action='store_true')
parser.add_argument('--out', action='store_true')
args = parser.parse_args()

def copy_files(source, dest):
    '''Copy all DOTFILES from source to dest'''
    print('Copying {} to {}'.format(source, dest))
    try:
        shutil.copytree(source, dest)
    except:
        print('copying file {}'.format(source))
        shutil.copy2(source, dest)

if __name__ == '__main__':
    # argparse workaround for using reserved keyword `in`
    d = vars(args)
    if not d['in'] and not d['out']:
        raise Exception('Must use copy_dots.py with --in or --out')
    elif d['in'] and d['out']:
        raise Exception('Use either --in OR --out')

    cwd = os.getcwd()
    if d['in']:
        for f in DOTFILES:
            source = os.path.join(f[0], f[1])
            copy_files(source, cwd)
    elif d['out']:
        dest = 'asdf'
        copy_files(cwd, dest)
