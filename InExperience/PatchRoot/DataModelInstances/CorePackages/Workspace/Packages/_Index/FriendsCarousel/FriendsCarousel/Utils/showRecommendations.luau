local parent = script.Parent.Parent
local isSubjectTo10ftPolicies = require(parent.dependencies).isSubjectTo10ftPolicies
local getFIntShowFriendRecommendationsLimitModule = require(parent.Flags.getFIntShowFriendRecommendationsLimit)

return function(p0) --[[ line: 6 ]]
	-- upvalues: isSubjectTo10ftPolicies (ref), getFIntShowFriendRecommendationsLimitModule (ref)
	return if isSubjectTo10ftPolicies() then true else p0 <= getFIntShowFriendRecommendationsLimitModule()
end