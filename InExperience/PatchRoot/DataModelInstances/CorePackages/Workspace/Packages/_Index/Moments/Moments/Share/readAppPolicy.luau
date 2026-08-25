local var0 = require(script:FindFirstAncestor("Moments").Parent.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

return function()
	-- upvalues: var0 (ref)
	return var0.read()
end