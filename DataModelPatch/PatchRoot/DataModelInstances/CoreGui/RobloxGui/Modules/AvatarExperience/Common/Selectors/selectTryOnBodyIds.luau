local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

local function getBodiesInTryOns(TryOnItems)
	-- upvalues: ConstantsModule (copy)
	local List = {}
	
	for i, tryOnItem in TryOnItems do
		if tryOnItem.itemType == ConstantsModule.ItemType.Bundle and ConstantsModule.BundleTypeIdStringToNameForBackend[tryOnItem.itemSubType] == "Body" then
			table.insert(List, i)
		end
	end
	return List
end

return function(p1)
	-- upvalues: getBodiesInTryOns (copy)
	local OutfitTryOn = p1.AvatarExperience.AvatarScene.OutfitTryOn
	
	return if OutfitTryOn and OutfitTryOn.TryOnItems then getBodiesInTryOns(OutfitTryOn.TryOnItems) else {}
end