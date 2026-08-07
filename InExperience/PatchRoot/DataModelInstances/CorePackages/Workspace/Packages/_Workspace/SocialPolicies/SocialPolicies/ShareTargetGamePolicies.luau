return function(p0) --[[ line: 2 | named "ShareTargetGamePolicies" ]]
	return {
		shouldShowCreatorName = function() --[[ line: 4 ]]
			-- upvalues: p0 (ref)
			local showShareTargetGameCreator = p0.ShowShareTargetGameCreator
			
			return if showShareTargetGameCreator == nil then false else showShareTargetGameCreator
		end
	}
end