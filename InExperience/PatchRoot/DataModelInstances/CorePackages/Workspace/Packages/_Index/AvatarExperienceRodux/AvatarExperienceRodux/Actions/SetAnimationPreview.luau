local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1) --[[ line: 12 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "string", "SetAnimationPreview: assetId")
	argCheckModule.isType(p1, "string", "SetAnimationPreview: assetTypeIdString")
	
	return { assetId = p0, assetTypeIdString = p1 }
end)