local Parent = script:FindFirstAncestor("AddFriends").Parent
local GetDeepValueFunction = require(Parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local RecommendationSourceEnum = require(Parent.SocialCommon).Enums.RecommendationSourceEnum
local RODUXKEY = require(Parent.AddFriendsState).RODUX_KEY

return function(p1)
	-- upvalues: GetDeepValueFunction (copy), RODUXKEY (copy), RecommendationSourceEnum (copy)
	local t = {}
	
	for i, _ in pairs(GetDeepValueFunction(p1, string.format("%s.Friends.recommendations.byUserId.%s", RODUXKEY, "test")) or {}) do
		t[i] = true
	end
	p1[RODUXKEY].Friends.recommendations.bySource = { [RecommendationSourceEnum.AddFriendsPage] = t }
end