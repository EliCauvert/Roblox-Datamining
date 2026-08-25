local universalAppGetPolicyModule = require(script.Parent.UniversalAppGetPolicy)
local appFeaturePoliciesModule = require(script.Parent.AppFeaturePolicies)

return function()
	-- upvalues: universalAppGetPolicyModule (ref), appFeaturePoliciesModule (ref)
	return appFeaturePoliciesModule(universalAppGetPolicyModule.read() or {})
end