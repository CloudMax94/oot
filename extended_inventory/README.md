# Description

The inventory has been moved to 0x0F50 in the Save File (0x8015F5B0 in RAM), so existing files will not have any items in the inventory.

I'll write more, eventually.

# Copy Edition

If you need existing events from Ocarina of Time to continue working properly there is an alternative version which stores the first 24 inventory slots at their original location in the save, and the extra slots at 0x0F68. When you open the inventory the items are copied from the original location to 0x0F50 and then read by the inventory. The side-effect of this is that items past the first 24 slots will have slot IDs that actually reference data past the inventory in the save and cause issues. But as long as the items do not reference their own inventory slot, that should not be a problem.

# Console Support

The hack has been tested on an EverDrive 64 throughout development and should work properly.
