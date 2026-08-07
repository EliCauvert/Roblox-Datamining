-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

local connectModule = require(script.connect)
local providerModule = require(script.Provider)
local getPolicyImplementations = script.getPolicyImplementations

return {
	withGetPolicyImplementation = function(p0) --[[ line: 12 ]]
		-- upvalues: connectModule (ref), providerModule (ref)
		assert(p0.read, "expected getPolicyImpl to have `read` function")
		assert(p0.onPolicyChanged, "expected getPolicyImpl to have `onPolicyChanged` function")
		
		return { connect = connectModule(p0), Provider = providerModule() }
	end,
	GetPolicyImplementations = {
		MemStorageService = require(getPolicyImplementations.fromMemStorageService)(),
		PolicyService = require(getPolicyImplementations.fromPolicyService)(),
		Static = require(getPolicyImplementations.fromStaticSource)()
	},
	Logger = require(script.Logger),
	AppPolicyContext = require(script.AppPolicyContext)
}