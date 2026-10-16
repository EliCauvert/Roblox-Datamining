local Parent = script:FindFirstAncestor("AvatarExperienceRodux").Parent
local _ = require(Parent.AvatarExperienceCommon)

return require(Parent.Rodux).makeActionCreator(script.Name, function(Colors, BodyPartColorRangeIds) --[[ Line: 16 ]]
	return {
		colors = Colors,
		bodyPartColorRangeIds = BodyPartColorRangeIds
	}
end)