local ConstantsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Constants)

return function(p1, p2, Asset)
	-- upvalues: ConstantsModule (copy)
	return if Asset == ConstantsModule.ItemType.Asset then p1.AssetInfos[p2] elseif Asset == ConstantsModule.ItemType.Bundle then p1.BundleInfos[p2] else nil
end