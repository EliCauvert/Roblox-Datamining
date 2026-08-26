local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local cachedPolicyServiceModule = require(experienceLoadingScript.Parent.CachedPolicyService)
local setIsSubjectToChinaPoliciesModule = require(experienceLoadingScript.Actions.SetIsSubjectToChinaPolicies)

return function()
	-- upvalues: cachedPolicyServiceModule (ref), setIsSubjectToChinaPoliciesModule (ref)
	return function(p1)
		-- upvalues: cachedPolicyServiceModule (copy), setIsSubjectToChinaPoliciesModule (copy)
		coroutine.wrap(function()
			-- upvalues: cachedPolicyServiceModule (copy), p1 (ref), setIsSubjectToChinaPoliciesModule (copy)
			p1:dispatch(setIsSubjectToChinaPoliciesModule(cachedPolicyServiceModule:IsSubjectToChinaPolicies()))
		end)()
	end
end