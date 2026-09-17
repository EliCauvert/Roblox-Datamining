local parent = script:FindFirstAncestor("BuildExperience").Parent
local fFlagBuildExperienceInGameShell = require(parent.SharedFlags).FFlagBuildExperienceInGameShell
local var1 = if fFlagBuildExperienceInGameShell then nil else require(parent.Display)
local signalsModule = require(parent.Signals)

return function()
	-- upvalues: fFlagBuildExperienceInGameShell (ref), signalsModule (ref), var1 (ref)
	local var2 = if fFlagBuildExperienceInGameShell then signalsModule.createSignal(false) else signalsModule.createComputed(function(p1)
		-- upvalues: var1 (copy)
		local displayStore = var1.GetDisplayStore(p1)
		local viewportSize = displayStore.getViewportSize(p1)
		
		return displayStore.getDisplaySize(p1) == Enum.DisplaySize.Small and viewportSize.Y < viewportSize.X
	end)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(true)
	
	return {
		getIsDisabled = var2,
		getIsDisabledTooltipOpen = var3,
		getIsOverlayVisible = var5,
		activate = function()
			-- upvalues: var2 (write), var4 (ref), var3 (ref), var6 (ref), var5 (ref)
			if var2(false) then
				var4(not var3(false))
				
				return
			end
			var4(false)
			var6(not var5(false))
		end,
		setIsDisabledTooltipOpen = var4,
		setIsOverlayVisible = var6
	}
end