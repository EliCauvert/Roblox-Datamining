local var1 = require(script:FindFirstAncestor("Moments").Parent.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

return function()
	-- upvalues: var1 (ref)
	return var1.read()
end