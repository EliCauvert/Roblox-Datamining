local UniversalAppGetPolicyModule = require(script.Parent.UniversalAppGetPolicy)
local AppFeaturePoliciesModule = require(script.Parent.AppFeaturePolicies)

return function() --[[ Line: 8 ]]
	-- upvalues: UniversalAppGetPolicyModule (copy), AppFeaturePoliciesModule (copy)
	return AppFeaturePoliciesModule(UniversalAppGetPolicyModule.read() or {})
end