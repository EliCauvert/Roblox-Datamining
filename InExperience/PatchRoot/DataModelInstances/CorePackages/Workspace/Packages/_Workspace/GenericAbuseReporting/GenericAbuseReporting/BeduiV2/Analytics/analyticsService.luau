local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local localPlayer = game:GetService("Players").LocalPlayer
local telemetryService = game:GetService("TelemetryService")
local dashModule = require(parent.Dash)
local fFlagFixAnalyticsForDynamicReportV2 = require(parent.SharedFlags).FFlagFixAnalyticsForDynamicReportV2
local t = {
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

local function _(p0) --[[ line: 84 | named "isArray" ]]
	local var5 = 0
	
	for i in p0 do
		var5 += 1
	end
	return var5 == #p0 and var5 > 0
end

local function flattenForTelemetry(p1) --[[ line: 97 ]]
	local t = {}
	
	for i, v in p1 do
		if type(v) ~= "table" then
			t[i] = tostring(v)
			continue
		end
		local var7 = 0
		
		for i_1 in v do
			var7 += 1
		end
		if var7 == #v and var7 > 0 then
			local t_1 = {}
			
			for v_1, i_1 in v do
				table.insert(t_1, tostring(i_1))
			end
			t[i] = "[" .. table.concat(t_1, ", ") .. "]"
		else
			for i_2, v_1 in v do
				t[tostring(i_2)] = tostring(v_1)
			end
		end
	end
	return t
end

local t_1 = {
	eventName = "DynamicAbuseReportEventV2",
	description = "Event to track dynamic abuse report v2",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8782",
	lastUpdated = { 2026, 5, 20 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("DynamicAbuseReportV2ThrottleHundredthsPercent", 0)
}

return {
	sendAnalyticsEvent = function(p2, p3) --[[ line: 133 ]]
		-- upvalues: fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), localPlayer (ref), telemetryService (ref), t_1 (ref), flattenForTelemetry (ref)
		if fFlagFixAnalyticsForDynamicReportV2 then
			telemetryService:LogEvent(t_1, {
				customFields = flattenForTelemetry(dashModule.join(p2, p3, {
					user_id = if localPlayer then localPlayer.UserId else nil
				})),
				eventContext = p2.abuse_vector
			})
			
			return
		end
		telemetryService:LogEvent(dashModule.join(t_1, { eventContext = p2.abuse_vector }), {
			customFields = dashModule.join(p2, p3, {
				user_id = if localPlayer then localPlayer.UserId else nil
			})
		})
	end,
	TelemetryEventType = t
}