local SignalsModule = require(script:FindFirstAncestor("AvatarExperiencePhotobooth").Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal("")
	
	return {
		getSelectedSceneId = Signal,
		selectScene = function(p1)
			-- upvalues: Signal2 (copy)
			Signal2(p1)
		end,
		clearSelection = function()
			-- upvalues: Signal2 (copy)
			Signal2("")
		end
	}
end