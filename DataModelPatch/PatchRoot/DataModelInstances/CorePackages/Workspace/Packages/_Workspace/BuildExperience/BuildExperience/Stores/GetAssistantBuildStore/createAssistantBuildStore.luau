local Parent = script:FindFirstAncestor("BuildExperience").Parent
local DisplayModule = require(Parent.Display)
local SignalsModule = require(Parent.Signals)

return function()
	-- upvalues: SignalsModule (copy), DisplayModule (copy)
	local Computed = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: DisplayModule (upval)
		local DisplayStore = DisplayModule.GetDisplayStore(p1)
		local ViewportSize = DisplayStore.getViewportSize(p1)
		
		return DisplayStore.getDisplaySize(p1) == Enum.DisplaySize.Small and ViewportSize.Y < ViewportSize.X
	end)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	
	return {
		getIsDisabled = Computed,
		getIsDisabledTooltipOpen = Signal,
		setIsDisabledTooltipOpen = Signal2
	}
end