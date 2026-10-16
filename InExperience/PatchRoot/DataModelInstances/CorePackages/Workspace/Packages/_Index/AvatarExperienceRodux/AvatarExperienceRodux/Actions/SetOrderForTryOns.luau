local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(Parent.AvatarExperienceCommon)

return require(Parent.Rodux).makeActionCreator(script.Name, function(ItemIdToOrderMap) --[[ Line: 20 ]]
	return { itemIdToOrderMap = ItemIdToOrderMap }
end)