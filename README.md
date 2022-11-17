# yak's flipper syncer
A collection of Flipper data repos, stored as git submodules, with a Makefile to compose their contents and rsync them to an SD card.


## Usage
The `sync-latest` target will pull the latest tips from all submodules, compose their contents into a single Flipper-SD-formatted directory, and rsync them to your SD card.

```bash
SDCARD_PATH='/path/to/FLIPPER SD' make sync-latest
```
