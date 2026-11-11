local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RetrievalStatusModule = require(Modules.LuaApp.Enum.RetrievalStatus)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)

return function(p1, p2)
	-- upvalues: RetrievalStatusModule (copy)
	if not p2 then
		return RetrievalStatusModule.NotStarted
	end
	assert(p2, "searchUuid is non-nil. Silence type checker.")
	local UserInventoryRecommendationsFetchStatusEntry = p1.AvatarExperience.AvatarEditor.UserInventoryRecommendationsFetchStatus[p2]
	
	if UserInventoryRecommendationsFetchStatusEntry == nil then
		UserInventoryRecommendationsFetchStatusEntry = RetrievalStatusModule.NotStarted
	end
	return UserInventoryRecommendationsFetchStatusEntry
end