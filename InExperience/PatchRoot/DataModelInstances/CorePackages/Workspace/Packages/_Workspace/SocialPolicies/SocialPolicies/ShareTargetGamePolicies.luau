return function(p1)
	return {
		shouldShowCreatorName = function()
			-- upvalues: p1 (ref)
			local showShareTargetGameCreator = p1.ShowShareTargetGameCreator
			
			return if showShareTargetGameCreator == nil then false else showShareTargetGameCreator
		end
	}
end