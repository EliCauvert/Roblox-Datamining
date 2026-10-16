local PolicyProvider = require(script:FindFirstAncestor("PurchasePrompt").Parent.PurchasePromptDeps).PolicyProvider
local WithGetPolicyImplementationResult = PolicyProvider.withGetPolicyImplementation((PolicyProvider.GetPolicyImplementations.MemStorageService("app-policy")))

function WithGetPolicyImplementationResult:Mapper() --[[ Line: 9 ]]
	return {}
end

return WithGetPolicyImplementationResult