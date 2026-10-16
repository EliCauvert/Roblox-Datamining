local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(AssetId, AssetTypeIdString) --[[ Line: 12 ]]
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(AssetId, "string", "SetAnimationPreview: assetId")
	ArgCheckModule.isType(AssetTypeIdString, "string", "SetAnimationPreview: assetTypeIdString")
	
	return { assetId = AssetId, assetTypeIdString = AssetTypeIdString }
end)