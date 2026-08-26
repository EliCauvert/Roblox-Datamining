local connectModule = require(script.connect)
local providerModule = require(script.Provider)
local getPolicyImplementations = script.getPolicyImplementations

return {
	withGetPolicyImplementation = function(p1)
		-- upvalues: connectModule (ref), providerModule (ref)
		assert(p1.read, "expected getPolicyImpl to have `read` function")
		assert(p1.onPolicyChanged, "expected getPolicyImpl to have `onPolicyChanged` function")
		
		return { connect = connectModule(p1), Provider = providerModule() }
	end,
	GetPolicyImplementations = {
		MemStorageService = require(getPolicyImplementations.fromMemStorageService)(),
		PolicyService = require(getPolicyImplementations.fromPolicyService)(),
		Static = require(getPolicyImplementations.fromStaticSource)()
	},
	Logger = require(script.Logger),
	AppPolicyContext = require(script.AppPolicyContext)
}