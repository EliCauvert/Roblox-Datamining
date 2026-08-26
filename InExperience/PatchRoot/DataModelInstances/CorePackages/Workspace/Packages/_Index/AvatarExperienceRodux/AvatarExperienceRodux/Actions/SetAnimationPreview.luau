local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "string", "SetAnimationPreview: assetId")
	argCheckModule.isType(p2, "string", "SetAnimationPreview: assetTypeIdString")
	
	return { assetId = p1, assetTypeIdString = p2 }
end)