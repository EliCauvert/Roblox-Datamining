local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local _ = require(AvatarWorkshop.Stores.AvatarStateTypes)
local _ = require(AvatarWorkshop.PreBuildFilters.PreBuildFilterTypes)

return function(p1, List)
	local config = {
		humanoidDescription = p1.humanoidDescription:Clone(),
		rigType = p1.rigType,
		gearId = p1.gearId
	}
	
	for _, value in List do
		config = value(config)
	end
	return config
end