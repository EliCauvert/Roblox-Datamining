local FFlagAXMigrateSlotsSignalsModule = require(script.Parent.FFlagAXMigrateSlotsSignals)

return pcall(function()
	return Enum.AvatarAssetType.EyeMakeup, Enum.MakeupType.Eye
end) and (game:DefineFastFlag("AXCustomizeMakeupSupport4", false) and FFlagAXMigrateSlotsSignalsModule)