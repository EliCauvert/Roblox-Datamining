local experienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local cachedPolicyServiceModule = require(experienceLoadingScript.Parent.CachedPolicyService)
local setIsSubjectToChinaPoliciesModule = require(experienceLoadingScript.Actions.SetIsSubjectToChinaPolicies)

return function() --[[ line: 7 ]]
	-- upvalues: cachedPolicyServiceModule (ref), setIsSubjectToChinaPoliciesModule (ref)
	return function(p0) --[[ line: 8 ]]
		-- upvalues: cachedPolicyServiceModule (copy), setIsSubjectToChinaPoliciesModule (copy)
		coroutine.wrap(function() --[[ line: 9 ]]
			-- upvalues: cachedPolicyServiceModule (copy), p0 (ref), setIsSubjectToChinaPoliciesModule (copy)
			p0:dispatch(setIsSubjectToChinaPoliciesModule(cachedPolicyServiceModule:IsSubjectToChinaPolicies()))
		end)()
	end
end