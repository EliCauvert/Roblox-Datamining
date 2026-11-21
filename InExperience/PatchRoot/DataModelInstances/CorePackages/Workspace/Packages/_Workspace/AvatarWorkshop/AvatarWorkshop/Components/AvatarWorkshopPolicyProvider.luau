local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local RoactAppPolicy = UniversalAppPolicyModule.RoactAppPolicy
local Policy = {
	UniversalAppPolicyModule.AppFeaturePolicies,
	require(Parent.AvatarPolicies).AvatarPolicies
}

return function(p1)
	-- upvalues: ReactModule (copy), RoactAppPolicy (copy), Policy (copy)
	return ReactModule.createElement(RoactAppPolicy.Provider, { policy = Policy }, p1.children)
end