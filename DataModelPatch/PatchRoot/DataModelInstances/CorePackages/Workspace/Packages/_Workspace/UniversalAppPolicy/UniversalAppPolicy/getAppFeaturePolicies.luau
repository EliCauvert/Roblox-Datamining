local UniversalAppGetPolicyModule = require(script.Parent.UniversalAppGetPolicy)
local AppFeaturePoliciesModule = require(script.Parent.AppFeaturePolicies)

return function()
	-- upvalues: UniversalAppGetPolicyModule (copy), AppFeaturePoliciesModule (copy)
	return AppFeaturePoliciesModule(UniversalAppGetPolicyModule.read() or {})
end