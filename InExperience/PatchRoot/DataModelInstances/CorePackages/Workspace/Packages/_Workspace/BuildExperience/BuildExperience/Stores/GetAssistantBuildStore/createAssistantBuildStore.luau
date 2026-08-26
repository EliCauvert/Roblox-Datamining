local parent = script:FindFirstAncestor("BuildExperience").Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref), displayModule (ref)
	local var1 = signalsModule.createComputed(function(p1)
		-- upvalues: displayModule (copy)
		local displayStore = displayModule.GetDisplayStore(p1)
		local viewportSize = displayStore.getViewportSize(p1)
		
		return displayStore.getDisplaySize(p1) == Enum.DisplaySize.Small and viewportSize.Y < viewportSize.X
	end)
	local var2, var3 = signalsModule.createSignal(false)
	
	return {
		getIsDisabled = var1,
		getIsDisabledTooltipOpen = var2,
		setIsDisabledTooltipOpen = var3
	}
end