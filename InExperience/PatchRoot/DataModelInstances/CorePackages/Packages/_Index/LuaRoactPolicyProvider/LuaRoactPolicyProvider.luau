local ConnectModule = require(script.connect)
local ProviderModule = require(script.Provider)
local GetPolicyImplementations = script.getPolicyImplementations

return {
	withGetPolicyImplementation = function(p1) --[[ Line: 12 ]]
		-- upvalues: ConnectModule (copy), ProviderModule (copy)
		assert(p1.read, "expected getPolicyImpl to have `read` function")
		assert(p1.onPolicyChanged, "expected getPolicyImpl to have `onPolicyChanged` function")
		
		return { connect = ConnectModule(p1), Provider = ProviderModule() }
	end,
	GetPolicyImplementations = {
		MemStorageService = require(GetPolicyImplementations.fromMemStorageService)(),
		PolicyService = require(GetPolicyImplementations.fromPolicyService)(),
		Static = require(GetPolicyImplementations.fromStaticSource)()
	},
	Logger = require(script.Logger),
	AppPolicyContext = require(script.AppPolicyContext)
}