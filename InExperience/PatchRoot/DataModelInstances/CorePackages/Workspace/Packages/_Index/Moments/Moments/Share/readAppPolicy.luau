local AppPolicy = require(script:FindFirstAncestor("Moments").Parent.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

return function()
	-- upvalues: AppPolicy (copy)
	return AppPolicy.read()
end