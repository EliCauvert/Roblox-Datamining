return function(p1) --[[ Line: 2 | Named "ShareTargetGamePolicies" ]]
	return {
		shouldShowCreatorName = function() --[[ Line: 4 ]]
			-- upvalues: p1 (copy)
			local ShowShareTargetGameCreator = p1.ShowShareTargetGameCreator
			
			return ShowShareTargetGameCreator ~= nil and ShowShareTargetGameCreator
		end
	}
end