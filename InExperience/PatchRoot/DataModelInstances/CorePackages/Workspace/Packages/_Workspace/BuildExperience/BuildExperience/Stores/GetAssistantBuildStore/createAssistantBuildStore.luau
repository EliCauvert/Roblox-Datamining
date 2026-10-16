local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FFlagBuildExperienceInGameShell = require(Parent.SharedFlags).FFlagBuildExperienceInGameShell
local DisplayModule = if FFlagBuildExperienceInGameShell then nil else require(Parent.Display)
local SignalsModule = require(Parent.Signals)

return function() --[[ Line: 17 | Named "createAssistantBuildStore" ]]
	-- upvalues: FFlagBuildExperienceInGameShell (copy), SignalsModule (copy), DisplayModule (copy)
	local Signal = nil
	Signal = if FFlagBuildExperienceInGameShell then SignalsModule.createSignal(false) else SignalsModule.createComputed(function(p1): boolean --[[ Line: 22 ]]
		-- upvalues: DisplayModule (upval)
		local DisplayStore = DisplayModule.GetDisplayStore(p1)
		local ViewportSize = DisplayStore.getViewportSize(p1)
		
		return DisplayStore.getDisplaySize(p1) == Enum.DisplaySize.Small and ViewportSize.Y < ViewportSize.X
	end)
	local Signal1, Signal2 = SignalsModule.createSignal(false)
	local Signal3, Signal2_1 = SignalsModule.createSignal(true)
	
	return {
		getIsDisabled = Signal,
		getIsDisabledTooltipOpen = Signal1,
		getIsOverlayVisible = Signal3,
		activate = function() --[[ Line: 32 ]]
			-- upvalues: Signal (ref), Signal2 (copy), Signal1 (copy), Signal2_1 (copy), Signal3 (copy)
			if Signal(false) then
				Signal2(not Signal1(false))
				
				return
			else
				Signal2(false)
				Signal2_1(not Signal3(false))
			end
		end,
		setIsDisabledTooltipOpen = Signal2,
		setIsOverlayVisible = Signal2_1
	}
end