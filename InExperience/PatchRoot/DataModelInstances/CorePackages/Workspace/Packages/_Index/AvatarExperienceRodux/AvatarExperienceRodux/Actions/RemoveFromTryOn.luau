local parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local roduxModule = require(parent.Rodux)

return if require(parent.AvatarExperienceFlags).FFlagAXMISEnableMultiShopping then roduxModule.makeActionCreator(script.Name, function(p1, p2)
	return { itemId = p1, itemType = p2 }
end) else roduxModule.makeActionCreator(script.Name, function(p1)
	return { itemId = p1 }
end)