local showOnboardingModalModule = require(script.Parent.Parent.Actions.ShowOnboardingModal)

return function(p1)
	-- upvalues: showOnboardingModalModule (ref)
	return function(p2)
		-- upvalues: showOnboardingModalModule (copy), p1 (ref)
		p2:dispatch(showOnboardingModalModule(p1))
	end
end