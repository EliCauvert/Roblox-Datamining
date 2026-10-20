local UniversalAppPolicy = script:FindFirstAncestor("UniversalAppPolicy")
local SignalsModule = require(UniversalAppPolicy.Parent.Signals)
local AppFeaturePoliciesModule = require(UniversalAppPolicy.AppFeaturePolicies)
local UniversalAppGetPolicyModule = require(UniversalAppPolicy.UniversalAppGetPolicy)

return function()
	-- upvalues: SignalsModule (copy), AppFeaturePoliciesModule (copy), UniversalAppGetPolicyModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(AppFeaturePoliciesModule(UniversalAppGetPolicyModule.read() or {}))
	UniversalAppGetPolicyModule.onPolicyChanged(function(p1)
		-- upvalues: Signal2 (copy), AppFeaturePoliciesModule (upval)
		Signal2(AppFeaturePoliciesModule(p1 or {}))
	end)
	
	return { getAppPolicy = Signal }
end