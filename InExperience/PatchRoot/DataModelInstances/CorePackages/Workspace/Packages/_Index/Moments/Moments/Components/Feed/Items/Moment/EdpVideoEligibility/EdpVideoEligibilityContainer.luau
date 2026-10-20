local _ = require(script:FindFirstAncestor("Moments").Parent.React)
local UseEdpVideoEligibilityViewModelModule = require(script.Parent.useEdpVideoEligibilityViewModel)

return function(p1)
	-- upvalues: UseEdpVideoEligibilityViewModelModule (copy)
	local UseEdpVideoEligibilityViewModelModuleResult = UseEdpVideoEligibilityViewModelModule({ momentId = p1.momentId, universeId = p1.universeId })
	
	return if UseEdpVideoEligibilityViewModelModuleResult.status == "Loading" then p1.loadingContent elseif UseEdpVideoEligibilityViewModelModuleResult.status == "Eligible" then p1.content else nil
end