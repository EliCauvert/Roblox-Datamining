local PolicyProviderModule = require(game:GetService("CorePackages").Packages.PolicyProvider)
local WithGetPolicyImplementationResult = PolicyProviderModule.withGetPolicyImplementation((PolicyProviderModule.GetPolicyImplementations.MemStorageService("app-policy")))

function WithGetPolicyImplementationResult:Mapper()
	return {}
end

return WithGetPolicyImplementationResult