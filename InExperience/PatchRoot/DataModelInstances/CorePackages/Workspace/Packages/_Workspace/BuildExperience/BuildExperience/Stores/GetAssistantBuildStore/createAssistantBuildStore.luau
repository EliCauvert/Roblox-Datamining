local parent = script:FindFirstAncestor("BuildExperience").Parent
local displayModule = require(parent.Display)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: signalsModule (ref), displayModule (ref)
	local var2 = signalsModule.createComputed(function(p0)
		-- upvalues: displayModule (copy)
		local displayStore = displayModule.GetDisplayStore(p0)
		local viewportSize = displayStore.getViewportSize(p0)
		
		return displayStore.getDisplaySize(p0) == Enum.DisplaySize.Small and viewportSize.Y < viewportSize.X
	end)
	local var3, var4 = signalsModule.createSignal(false)
	
	return {
		getIsDisabled = var2,
		getIsDisabledTooltipOpen = var3,
		setIsDisabledTooltipOpen = var4
	}
end