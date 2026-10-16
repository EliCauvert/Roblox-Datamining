local FFlagAXMigrateOutfitsToUserInventoryModule = require(script.Parent.FFlagAXMigrateOutfitsToUserInventory)
local MakeupOutfitsEngineFeature = game:GetEngineFeature("MakeupOutfits")

return game:DefineFastFlag("AXOutfitPageRevamp3", false) and (FFlagAXMigrateOutfitsToUserInventoryModule and MakeupOutfitsEngineFeature)