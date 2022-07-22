MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILE_DIR := $(dir $(MAKEFILE_PATH))
REPOS_DIR := $(shell dirname "${MAKEFILE_DIR}")

REPOS := FlipperZeroSub-GHz UberGuidoZ_Flipper UberGuidoZ_Flipper-IRDB

sync:
	$(eval SYNC_DIR := $(abspath $(shell date +"sync_%Y%m%d_%H%M%S")))
	mkdir "${SYNC_DIR}"
	rsync -ar --mkpath --exclude='*.md' "${REPOS_DIR}/UberGuidoZ_Flipper/Sub-GHz/" "${SYNC_DIR}/subghz"
	rsync -ar --mkpath --exclude='*.md' "${REPOS_DIR}/UberGuidoZ_Flipper/NFC/" "${SYNC_DIR}/nfc"
	mkdir "${SYNC_DIR}/nfc/assets"
	cp "${SYNC_DIR}/nfc/mf_classic_dict/mf_classic_dict.nfc" "${SYNC_DIR}/nfc/assets/mf_classic_dict.nfc"
	rsync -ar --mkpath --exclude='*.md' "${REPOS_DIR}/UberGuidoZ_Flipper/Music_Player/" "${SYNC_DIR}/music_player"
	rsync -ar --mkpath --exclude='*.md' "${REPOS_DIR}/UberGuidoZ_Flipper/BadUSB/" "${SYNC_DIR}/badusb"
	rsync -ar --mkpath --exclude='*.md' "${REPOS_DIR}/UberGuidoZ_Flipper/picopass/" "${SYNC_DIR}/picopass"
	rsync -ar --mkpath --exclude='*.md' "${REPOS_DIR}/UberGuidoZ_Flipper-IRDB/" "${SYNC_DIR}/infrared"

	rsync -arv --mkpath "${SYNC_DIR}/" '/media/they4kman/FLIPPER SD'
