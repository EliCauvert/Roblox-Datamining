local Parent = script.Parent.Parent
local IsSubjectTo10ftPoliciesFunction = require(Parent.dependencies).isSubjectTo10ftPolicies
local GetFIntShowFriendRecommendationsLimitModule = require(Parent.Flags.getFIntShowFriendRecommendationsLimit)

return function(p1): boolean
	-- upvalues: IsSubjectTo10ftPoliciesFunction (copy), GetFIntShowFriendRecommendationsLimitModule (copy)
	return if IsSubjectTo10ftPoliciesFunction() then true else p1 <= GetFIntShowFriendRecommendationsLimitModule()
end