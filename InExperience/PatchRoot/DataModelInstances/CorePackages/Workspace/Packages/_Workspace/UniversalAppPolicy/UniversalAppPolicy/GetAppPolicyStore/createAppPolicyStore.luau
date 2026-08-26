local universalAppPolicy = script:FindFirstAncestor("UniversalAppPolicy")
local signalsModule = require(universalAppPolicy.Parent.Signals)
local appFeaturePoliciesModule = require(universalAppPolicy.AppFeaturePolicies)
local universalAppGetPolicyModule = require(universalAppPolicy.UniversalAppGetPolicy)

return function()
	-- upvalues: signalsModule (ref), appFeaturePoliciesModule (ref), universalAppGetPolicyModule (ref)
	local var1, var2 = signalsModule.createSignal(appFeaturePoliciesModule(universalAppGetPolicyModule.read() or {}))
	universalAppGetPolicyModule.onPolicyChanged(function(p1)
		-- upvalues: var2 (ref), appFeaturePoliciesModule (copy)
		var2(appFeaturePoliciesModule(p1 or {}))
	end)
	
	return { getAppPolicy = var1 }
end