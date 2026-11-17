local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceInGameShell = require(Parent.SharedFlags).FFlagBuildExperienceInGameShell
local DisplayModule = if FFlagBuildExperienceInGameShell then nil else require(Parent.Display)
local SignalsModule = require(Parent.Signals)
local FFlagBuildExperienceInExperienceEntryTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceInExperienceEntryTelemetry)
local GetInExperienceEventIdsModule = require(BuildExperience.Telemetry.getInExperienceEventIds)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)

return function()
	-- upvalues: FFlagBuildExperienceInGameShell (copy), SignalsModule (copy), DisplayModule (copy), FFlagBuildExperienceInExperienceEntryTelemetryModule (copy), SendBuildExperienceEventModule (copy), GetInExperienceEventIdsModule (copy)
	local Signal = nil
	Signal = if FFlagBuildExperienceInGameShell then SignalsModule.createSignal(false) else SignalsModule.createComputed(function(p1): boolean
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
		activate = function()
			-- upvalues: Signal (ref), Signal2 (copy), Signal1 (copy), Signal2_1 (copy), Signal3 (copy), FFlagBuildExperienceInExperienceEntryTelemetryModule (upval), SendBuildExperienceEventModule (upval), GetInExperienceEventIdsModule (upval)
			if Signal(false) then
				Signal2(not Signal1(false))
				
				return
			end
			Signal2(false)
			Signal2_1(not Signal3(false))
			
			if FFlagBuildExperienceInExperienceEntryTelemetryModule then
				SendBuildExperienceEventModule("BUILD_OVERLAY_TOGGLE_CLICK", GetInExperienceEventIdsModule(), { state = if Signal3(false) then "open" else "close" })
			end
		end,
		setIsDisabledTooltipOpen = Signal2,
		setIsOverlayVisible = Signal2_1
	}
end