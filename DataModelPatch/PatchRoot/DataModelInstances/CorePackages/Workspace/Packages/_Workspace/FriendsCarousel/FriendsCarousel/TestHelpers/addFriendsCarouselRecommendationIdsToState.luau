local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local GetDeepValueFunction = DependenciesModule.SocialLibraries.Dictionary.getDeepValue
local RODUXKEY = require(Parent.Common.Constants).RODUX_KEY
local HomepageFriendsCarousel = DependenciesModule.SocialCommon.Enums.RecommendationSourceEnum.HomepageFriendsCarousel

return function(p1)
	-- upvalues: GetDeepValueFunction (copy), RODUXKEY (copy), HomepageFriendsCarousel (copy)
	local t = {}
	
	for i, _ in pairs(GetDeepValueFunction(p1, string.format("%s.Friends.recommendations.byUserId.%s", RODUXKEY, "test")) or {}) do
		t[i] = true
	end
	p1[RODUXKEY].Friends.recommendations.bySource = { [HomepageFriendsCarousel] = t }
end