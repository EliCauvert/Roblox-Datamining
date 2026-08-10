local var0 = require(script:FindFirstAncestor("Moments").Parent.PolicyProvider).GetPolicyImplementations.MemStorageService("app-policy")

return function() --[[ line: 9 ]]
	-- upvalues: var0 (ref)
	return var0.read()
end