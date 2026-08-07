local policyProvider = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).PolicyProvider
local var0 = policyProvider.withGetPolicyImplementation(policyProvider.GetPolicyImplementations.MemStorageService("app-policy"))

function var0.Mapper(_) --[[ line: 9 ]]
	return {}
end

return var0