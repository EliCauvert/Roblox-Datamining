return function(p1)
	return {
		shouldShowCreatorName = function()
			-- upvalues: p1 (copy)
			local ShowShareTargetGameCreator = p1.ShowShareTargetGameCreator
			
			return ShowShareTargetGameCreator ~= nil and ShowShareTargetGameCreator
		end
	}
end