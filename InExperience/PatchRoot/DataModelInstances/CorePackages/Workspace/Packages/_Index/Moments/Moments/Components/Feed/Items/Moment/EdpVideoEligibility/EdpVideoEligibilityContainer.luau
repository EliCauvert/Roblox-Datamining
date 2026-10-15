local _ = require(script:FindFirstAncestor("Moments").Parent.React)
local useEdpVideoEligibilityViewModelModule = require(script.Parent.useEdpVideoEligibilityViewModel)

return function(p1)
	-- upvalues: useEdpVideoEligibilityViewModelModule (ref)
	local var1 = useEdpVideoEligibilityViewModelModule({ momentId = p1.momentId, universeId = p1.universeId })
	
	return if var1.status == "Loading" then p1.loadingContent elseif var1.status == "Eligible" then p1.content else nil
end