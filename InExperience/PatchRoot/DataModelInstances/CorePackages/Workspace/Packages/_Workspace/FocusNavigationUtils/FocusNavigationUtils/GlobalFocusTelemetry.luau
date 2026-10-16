local TelemetryService = game:GetService("TelemetryService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local config = {
	eventName = "GlobalAutoFocusFailureCounter",
	throttlingPercentage = 10000,
	description = "Records the number of times we detect global autofocus failing. If focus is re-gained, this re-enables the app to increment the counter again.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 6, 17 }
}
local config1 = {
	eventName = "GlobalAutoFocusRecoveryCounter",
	throttlingPercentage = 10000,
	description = "Records the number of times we detect global autofocus recovery. If focus is regained then and lost again, this re-enables the app to increment the counter again.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 6, 17 }
}
local config2 = {
	eventName = "GlobalAutoFocusFailureEvent",
	throttlingPercentage = 10000,
	description = "Records data associated with global autofocus failing. If focus is re-gained, this re-enables the app to send another event.",
	backends = { "Points" },
	lastUpdated = { 26, 6, 17 }
}

return {
	sendAutoFocusFailureCounter = function(p1) --[[ Line: 29 ]]
		-- upvalues: TelemetryService (copy), config (copy)
		TelemetryService:LogCounter(config, {
			customFields = {
				FailureReason = if #p1 == 0 then "NoFocusTargets" else "FocusingTargetFailed"
			}
		})
	end,
	sendAutoFocusRecoveryCounter = function() --[[ Line: 38 ]]
		-- upvalues: TelemetryService (copy), config1 (copy), RunService (copy)
		TelemetryService:LogCounter(config1)
		
		if RunService:IsStudio() then
			warn("[GlobalFocusTelemetry] Global autofocus recovered")
		end
	end,
	sendAutoFocusFailureEvent = function(Object, List, List1, List2, PrevRoute, CurrentRoute, OverlayType) --[[ Line: 45 ]]
		-- upvalues: GuiService (copy), TelemetryService (copy), config2 (copy), RunService (copy)
		local FullNames = {
			SelectedCoreObject = if GuiService.SelectedCoreObject then GuiService.SelectedCoreObject:GetFullName() else "nil",
			SelectedObject = if GuiService.SelectedObject then GuiService.SelectedObject:GetFullName() else "nil",
			FocusedGuiObject = if Object then Object:GetFullName() else "nil",
			OverlayType = OverlayType,
			PrevRoute = PrevRoute,
			CurrentRoute = CurrentRoute
		}
		
		if List then
			for i, value in List do
				FullNames["PrevFocusTarget" .. i] = if value then value:GetFullName() else "nil"
			end
		end
		for i1, value1 in List1 do
			FullNames["FocusTarget" .. i1] = if value1 then value1:GetFullName() else "nil"
		end
		if List2.moderationOverlay then
			FullNames.FocusPriority = "ModerationOverlay"
		elseif List2.centralOverlay then
			FullNames.FocusPriority = "CentralOverlay"
		elseif List2.contextualMenu then
			FullNames.FocusPriority = "ContextualMenu"
		elseif List2.popUp then
			FullNames.FocusPriority = "PopUp"
		elseif List2.peekView then
			FullNames.FocusPriority = "PeekView"
		elseif List2.routerView then
			FullNames.FocusPriority = "RouterView"
		elseif List2.subRouterView then
			FullNames.FocusPriority = "SubRouterView"
		elseif List2.globalNavBar then
			FullNames.FocusPriority = "GlobalNavBar"
		elseif List2.searchBar then
			FullNames.FocusPriority = "SearchBar"
		elseif List2.auxiliaryView then
			FullNames.FocusPriority = "AuxiliaryView"
		elseif List2.headerView then
			FullNames.FocusPriority = "HeaderView"
		end
		for Text, value2 in pairs(List2) do
			FullNames["FocusSurface_" .. Text:gsub("^%l", string.upper)] = if value2 then value2:GetFullName() else "nil"
		end
		TelemetryService:LogEvent(config2, {
			customFields = FullNames,
			standardizedFields = { "addSessionId", "addSessionInfo", "addOSInfo" }
		})
		
		if RunService:IsStudio() then
			warn("[GlobalFocusTelemetry] Global Auto Focus Failed:", FullNames)
		end
	end
}