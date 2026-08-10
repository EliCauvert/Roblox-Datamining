local var10
local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local localPlayer = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")
local telemetryService = game:GetService("TelemetryService")
local dashModule = require(parent.Dash)
local fFlagAbuseReportClientVersionModule = require(genericAbuseReporting.Flags.FFlagAbuseReportClientVersion)
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
	LinkOpened = "LinkOpened",
	Error = "Error",
	CommentInput = "CommentInput",
	TextChannelSwitch = "TextChannelSwitch",
	EmptyState = "EmptyState",
	SceneCaptureResult = "SceneCaptureResult",
	ConfigLoaded = "ConfigLoaded"
}
local t_1 = { Footer = "footer", NextAction = "next_action" }
local t_2 = { Flow = "flow", SceneSelection = "sceneSelection" }

local function _(p0) --[[ line: 107 | named "isArray" ]]
	local var11 = 0
	
	for i in p0 do
		var11 += 1
	end
	return var11 == #p0 and var11 > 0
end

local function flattenForTelemetry(p1) --[[ line: 120 ]]
	local t = {}
	
	for i, v in p1 do
		if type(v) ~= "table" then
			t[i] = tostring(v)
			continue
		end
		local var13 = 0
		
		for i_1 in v do
			var13 += 1
		end
		if var13 == #v and var13 > 0 then
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

local t_3 = {
	eventName = "DynamicAbuseReportEventV2",
	description = "Event to track dynamic abuse report v2",
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/8782",
	lastUpdated = { 2026, 5, 20 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("DynamicAbuseReportV2ThrottleHundredthsPercent", 0)
}

local _ = function() --[[ line: 162 | named "getCoreScriptVersion" ]]
	-- upvalues: runService (ref)
	if not game:GetEngineFeature("CoreScriptVersionEnabled") then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 167 ]]
		-- upvalues: runService (copy)
		return runService:GetCoreScriptVersion()
	end)
	
	return if ok then status else nil
end

if not fFlagAbuseReportClientVersionModule then
	var10 = nil
elseif game:GetEngineFeature("CoreScriptVersionEnabled") then
	local ok, status = pcall(function() --[[ line: 167 ]]
		-- upvalues: runService (ref)
		return runService:GetCoreScriptVersion()
	end)
	var10 = if ok then status else nil
else
	var10 = nil
end
return {
	sendAnalyticsEvent = function(p2, p3) --[[ line: 176 ]]
		-- upvalues: localPlayer (ref), fFlagAbuseReportClientVersionModule (ref), var10 (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), telemetryService (ref), t_3 (ref), flattenForTelemetry (ref)
		local t = {
			user_id = if localPlayer then localPlayer.UserId else nil
		}
		
		if fFlagAbuseReportClientVersionModule then
			t.client_version = var10
		end
		if fFlagFixAnalyticsForDynamicReportV2 then
			telemetryService:LogEvent(t_3, {
				customFields = flattenForTelemetry(dashModule.join(p2, p3, t)),
				eventContext = p2.abuse_vector
			})
			
			return
		end
		telemetryService:LogEvent(dashModule.join(t_3, { eventContext = p2.abuse_vector }), { customFields = dashModule.join(p2, p3, t) })
	end,
	TelemetryEventType = t,
	LinkOpenedSource = t_1,
	SubmitSource = t_2
}