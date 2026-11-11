local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local CachedPolicyServiceModule = require(ExperienceLoadingScript.Parent.CachedPolicyService)
local SetIsSubjectToChinaPoliciesModule = require(ExperienceLoadingScript.Actions.SetIsSubjectToChinaPolicies)

return function()
	-- upvalues: CachedPolicyServiceModule (copy), SetIsSubjectToChinaPoliciesModule (copy)
	return function(p1)
		-- upvalues: CachedPolicyServiceModule (upval), SetIsSubjectToChinaPoliciesModule (upval)
		coroutine.wrap(function()
			-- upvalues: CachedPolicyServiceModule (upval), p1 (copy), SetIsSubjectToChinaPoliciesModule (upval)
			p1:dispatch(SetIsSubjectToChinaPoliciesModule((CachedPolicyServiceModule:IsSubjectToChinaPolicies())))
		end)()
	end
end