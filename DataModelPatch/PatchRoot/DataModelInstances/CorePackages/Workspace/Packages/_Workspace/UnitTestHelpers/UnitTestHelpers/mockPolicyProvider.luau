local Parent = script.Parent.Parent
local RoactModule = require(Parent.Roact)

return function(Element, p1)
	-- upvalues: Parent (copy), RoactModule (copy)
	return RoactModule.createElement(require(Parent.UniversalAppPolicy).RoactAppPolicy.Provider, {
		policy = {
			require(Parent.UniversalAppPolicy).AppFeaturePolicies,
			require(Parent.SocialPolicies).ChatPolicies,
			require(Parent.AvatarPolicies).AvatarPolicies,
			require(Parent.SocialPolicies).SharePolicies,
			require(Parent.SocialPolicies).ShareTargetGamePolicies
		},
		policyData = p1 or {}
	}, { Element = Element })
end