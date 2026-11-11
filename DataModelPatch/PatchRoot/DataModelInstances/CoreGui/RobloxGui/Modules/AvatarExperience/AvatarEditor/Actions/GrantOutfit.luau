local GetFFlagAXEnableNewInventoryItemsListModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(OutfitId, p1, p2)
	-- upvalues: GetFFlagAXEnableNewInventoryItemsListModule (copy)
	return {
		outfitId = OutfitId,
		outfitType = if GetFFlagAXEnableNewInventoryItemsListModule() then p1 else nil,
		isEditable = if GetFFlagAXEnableNewInventoryItemsListModule() then p2 else nil
	}
end)