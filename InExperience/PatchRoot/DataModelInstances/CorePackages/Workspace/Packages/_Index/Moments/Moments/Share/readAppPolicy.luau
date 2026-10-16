local AppPolicy = require(script:FindFirstAncestor("Moments").Parent.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

return function() --[[ Line: 9 ]]
	-- upvalues: AppPolicy (copy)
	return AppPolicy.read()
end