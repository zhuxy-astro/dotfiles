# My dot files
These files should be linked to their places using the `setup.sh` script.
Files here don't have the dot prefix.
These files are controlled by the `dot.sh` in the scripts folder.

Many of these files has some computer-specific part. It is possible to use a synced `.zshrc` and a non-synced `.zshrc_local` sourced by the former one. But considering that some lines requires to be at either the beginning or the ending of the configuration file, it is more convenient to determine the computer first in the file then use an if-selection.

I don't sync `~/.viminfo` because it is always changing.

With such backup and version control, the former `backup` is not useful any more.
