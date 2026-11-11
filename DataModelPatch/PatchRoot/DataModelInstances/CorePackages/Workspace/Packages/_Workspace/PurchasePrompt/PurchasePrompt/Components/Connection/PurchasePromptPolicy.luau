local PolicyProvider = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).PolicyProvider
local WithGetPolicyImplementationResult = PolicyProvider.withGetPolicyImplementation((PolicyProvider.GetPolicyImplementations.MemStorageService("app-policy")))

function WithGetPolicyImplementationResult:Mapper()
	return {}
end

return WithGetPolicyImplementationResult