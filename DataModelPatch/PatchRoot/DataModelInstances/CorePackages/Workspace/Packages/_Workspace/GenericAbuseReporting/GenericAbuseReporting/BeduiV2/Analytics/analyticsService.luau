local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local LocalPlayer = game:GetService("Players").LocalPlayer
local TelemetryService = game:GetService("TelemetryService")
local DashModule = require(Parent.Dash)
local FFlagFixAnalyticsForDynamicReportV2 = require(Parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2

local function _(List): boolean
	local Count = 0
	
	for _ in List do
		Count += 1
	end
	return Count == #List and Count > 0
end

local function flattenForTelemetry(JoinResult)
	local t = {}
	
	for i, value in JoinResult do
		if type(value) ~= "table" then
			t[i] = tostring(value)
			continue
		end
		local Count = 0
		
		for _ in value do
			Count += 1
		end
		if Count == #value and Count > 0 then
			local List = {}
			
			for _, value1 in value do
				table.insert(List, (tostring(value1)))
			end
			t[i] = "[" .. table.concat(List, ", ") .. "]"
		else
			for i1, value2 in value do
				t[tostring(i1)] = tostring(value2)
			end
		end
	end
	return t
end

local config = {
	eventName = "DynamicAbuseReportEventV2",
	description = "Event to track dynamic abuse report v2",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8782",
	lastUpdated = { 2026, 5, 20 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("DynamicAbuseReportV2ThrottleHundredthsPercent", 0)
}

return {
	sendAnalyticsEvent = function(p1, p2)
		-- upvalues: FFlagFixAnalyticsForDynamicReportV2 (copy), DashModule (copy), LocalPlayer (copy), TelemetryService (copy), config (copy), flattenForTelemetry (copy)
		if FFlagFixAnalyticsForDynamicReportV2 then
			TelemetryService:LogEvent(config, {
				customFields = flattenForTelemetry((DashModule.join(p1, p2, { user_id = LocalPlayer and LocalPlayer.UserId or nil }))),
				eventContext = p1.abuse_vector
			})
			
			return
		else
			TelemetryService:LogEvent(DashModule.join(config, { eventContext = p1.abuse_vector }), {
				customFields = DashModule.join(p1, p2, { user_id = LocalPlayer and LocalPlayer.UserId or nil })
			})
		end
	end,
	TelemetryEventType = {
		ReportStarted = "OpenDialog",
		ReportAbandoned = "EarlyClose",
		ReportCompleted = "Close",
		Submit = "Submit",
		SubmitSuccess = "SubmitSuccess",
		SubmitFail = "SubmitFail",
		BackAction = "BackAction",
		NodeDone = "NodeDone",
		SelectItem = "SelectItem",
		IsUserBlockAvailable = "IsUserBlockAvailable",
		IsUserMuteAvailable = "IsUserMuteAvailable",
		DidBlockUser = "DidBlockUser",
		DidUnblockUser = "DidUnblockUser",
		DidMuteUser = "DidMuteUser",
		HelplineShown = "HelplineShown",
		HelplineOpened = "HelplineOpened",
		Error = "Error",
		CommentInput = "CommentInput",
		TextChannelSwitch = "TextChannelSwitch",
		EmptyState = "EmptyState",
		SceneCaptureResult = "SceneCaptureResult",
		ConfigLoaded = "ConfigLoaded"
	}
}