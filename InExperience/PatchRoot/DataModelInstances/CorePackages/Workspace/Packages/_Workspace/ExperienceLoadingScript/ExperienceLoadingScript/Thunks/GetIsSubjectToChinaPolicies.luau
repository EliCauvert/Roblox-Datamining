local ExperienceLoadingScript = script:FindFirstAncestor("ExperienceLoadingScript")
local CachedPolicyServiceModule = require(ExperienceLoadingScript.Parent.CachedPolicyService)
local SetIsSubjectToChinaPoliciesModule = require(ExperienceLoadingScript.Actions.SetIsSubjectToChinaPolicies)

return function() --[[ Line: 7 ]]
	-- upvalues: CachedPolicyServiceModule (copy), SetIsSubjectToChinaPoliciesModule (copy)
	return function(p1) --[[ Line: 8 ]]
		-- upvalues: CachedPolicyServiceModule (upval), SetIsSubjectToChinaPoliciesModule (upval)
		coroutine.wrap(function() --[[ Line: 9 ]]
			-- upvalues: CachedPolicyServiceModule (upval), p1 (copy), SetIsSubjectToChinaPoliciesModule (upval)
			p1:dispatch(SetIsSubjectToChinaPoliciesModule((CachedPolicyServiceModule:IsSubjectToChinaPolicies())))
		end)()
	end
end