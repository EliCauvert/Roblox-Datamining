local ShowOnboardingModalModule = require(script.Parent.Parent.Actions.ShowOnboardingModal)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: ShowOnboardingModalModule (copy)
	return function(p2) --[[ Line: 8 ]]
		-- upvalues: ShowOnboardingModalModule (upval), p1 (copy)
		p2:dispatch(ShowOnboardingModalModule(p1))
	end
end