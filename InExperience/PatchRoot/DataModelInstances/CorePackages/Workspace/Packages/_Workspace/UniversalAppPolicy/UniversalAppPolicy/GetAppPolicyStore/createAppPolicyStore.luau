local universalAppPolicy = script:FindFirstAncestor("UniversalAppPolicy")
local signalsModule = require(universalAppPolicy.Parent.Signals)
local appFeaturePoliciesModule = require(universalAppPolicy.AppFeaturePolicies)
local universalAppGetPolicyModule = require(universalAppPolicy.UniversalAppGetPolicy)

return function() --[[ line: 19 | named "createAppPolicyStore" ]]
	-- upvalues: signalsModule (ref), appFeaturePoliciesModule (ref), universalAppGetPolicyModule (ref)
	local var4, var5 = signalsModule.createSignal(appFeaturePoliciesModule(universalAppGetPolicyModule.read() or {}))
	universalAppGetPolicyModule.onPolicyChanged(function(p0) --[[ line: 22 ]]
		-- upvalues: var5 (ref), appFeaturePoliciesModule (copy)
		var5(appFeaturePoliciesModule(p0 or {}))
	end)
	
	return { getAppPolicy = var4 }
end