local telemetryService = game:GetService("TelemetryService")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local t = {
	eventName = "GlobalAutoFocusFailureCounter",
	throttlingPercentage = 10000,
	description = "Records the number of times we detect global autofocus failing. If focus is re-gained, this re-enables the app to increment the counter again.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 6, 17 }
}
local t_1 = {
	eventName = "GlobalAutoFocusRecoveryCounter",
	throttlingPercentage = 10000,
	description = "Records the number of times we detect global autofocus recovery. If focus is regained then and lost again, this re-enables the app to increment the counter again.",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 26, 6, 17 }
}
local t_2 = {
	eventName = "GlobalAutoFocusFailureEvent",
	throttlingPercentage = 10000,
	description = "Records data associated with global autofocus failing. If focus is re-gained, this re-enables the app to send another event.",
	backends = { "Points" },
	lastUpdated = { 26, 6, 17 }
}

return {
	sendAutoFocusFailureCounter = function(p1)
		-- upvalues: telemetryService (ref), t (ref)
		telemetryService:LogCounter(t, {
			customFields = {
				FailureReason = if #p1 == 0 then "NoFocusTargets" else "FocusingTargetFailed"
			}
		})
	end,
	sendAutoFocusRecoveryCounter = function()
		-- upvalues: telemetryService (ref), t_1 (ref), runService (ref)
		telemetryService:LogCounter(t_1)
		
		if runService:IsStudio() then
			warn("[GlobalFocusTelemetry] Global autofocus recovered")
		end
	end,
	sendAutoFocusFailureEvent = function(p1, p2, p3, p4, p5, p6, p7)
		-- upvalues: guiService (ref), telemetryService (ref), t_2 (ref), runService (ref)
		local t = {
			SelectedCoreObject = if guiService.SelectedCoreObject then guiService.SelectedCoreObject:GetFullName() else "nil",
			SelectedObject = if guiService.SelectedObject then guiService.SelectedObject:GetFullName() else "nil",
			FocusedGuiObject = if p1 then p1:GetFullName() else "nil",
			OverlayType = p7,
			PrevRoute = p5,
			CurrentRoute = p6
		}
		
		if p2 then
			for i, v in p2 do
				t["PrevFocusTarget" .. i] = if v then v:GetFullName() else "nil"
			end
		end
		for i, v in p3 do
			t["FocusTarget" .. i] = if v then v:GetFullName() else "nil"
		end
		if p4.moderationOverlay then
			t.FocusPriority = "ModerationOverlay"
		elseif p4.centralOverlay then
			t.FocusPriority = "CentralOverlay"
		elseif p4.contextualMenu then
			t.FocusPriority = "ContextualMenu"
		elseif p4.popUp then
			t.FocusPriority = "PopUp"
		elseif p4.peekView then
			t.FocusPriority = "PeekView"
		elseif p4.routerView then
			t.FocusPriority = "RouterView"
		elseif p4.subRouterView then
			t.FocusPriority = "SubRouterView"
		elseif p4.globalNavBar then
			t.FocusPriority = "GlobalNavBar"
		elseif p4.searchBar then
			t.FocusPriority = "SearchBar"
		elseif p4.auxiliaryView then
			t.FocusPriority = "AuxiliaryView"
		elseif p4.headerView then
			t.FocusPriority = "HeaderView"
		end
		for i_1, v_1 in pairs(p4) do
			t["FocusSurface_" .. i_1:gsub("^%l", string.upper)] = if v_1 then v_1:GetFullName() else "nil"
		end
		telemetryService:LogEvent(t_2, {
			customFields = t,
			standardizedFields = { "addSessionId", "addSessionInfo", "addOSInfo" }
		})
		
		if runService:IsStudio() then
			warn("[GlobalFocusTelemetry] Global Auto Focus Failed:", t)
		end
	end
}