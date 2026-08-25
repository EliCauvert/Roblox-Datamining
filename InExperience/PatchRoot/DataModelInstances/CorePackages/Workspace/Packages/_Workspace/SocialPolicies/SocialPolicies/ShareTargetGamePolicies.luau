return function(p0)
	return {
		shouldShowCreatorName = function()
			-- upvalues: p0 (ref)
			local showShareTargetGameCreator = p0.ShowShareTargetGameCreator
			
			return if showShareTargetGameCreator == nil then false else showShareTargetGameCreator
		end
	}
end