local showOnboardingModalModule = require(script.Parent.Parent.Actions.ShowOnboardingModal)

return function(p0)
	-- upvalues: showOnboardingModalModule (ref)
	return function(p1)
		-- upvalues: showOnboardingModalModule (copy), p0 (ref)
		p1:dispatch(showOnboardingModalModule(p0))
	end
end