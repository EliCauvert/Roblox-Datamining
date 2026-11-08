local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(AssetId)
	-- upvalues: ArgCheckModule (copy)
	if AssetId ~= nil then
		ArgCheckModule.isType(AssetId, "string", "SetSpawnEffectPreview: assetId")
	end
	return { assetId = AssetId }
end)