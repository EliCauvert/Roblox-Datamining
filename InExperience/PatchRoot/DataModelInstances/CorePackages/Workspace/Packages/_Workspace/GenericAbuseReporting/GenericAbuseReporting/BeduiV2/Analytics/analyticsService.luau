local var11
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

local function formatHttpErrorMessageForAnalytics(p0, p1) --[[ line: 85 ]]
	-- upvalues: dashModule (ref)
	local t = {}
	
	if type(p1) == "table" then
		if type(p1.StatusCode) == "number" then
			table.insert(t, `status={p1.StatusCode}`)
		end
		if typeof(p1.HttpError) == "EnumItem" then
			table.insert(t, `httpError={p1.HttpError}`)
		end
		if p1.isJSONValid == false then
			table.insert(t, "reason=invalid_json")
		end
	end
	if #t == 0 then
		table.insert(t, "reason=unknown")
	end
	table.insert(t, `error={string.sub(dashModule.pretty(p1, { depth = 10 }), 1, 1000)}`)
	
	return p0 .. " " .. table.concat(t, " ")
end

local function _(p2) --[[ line: 131 | named "isArray" ]]
	local var13 = 0
	
	for i in p2 do
		var13 += 1
	end
	return var13 == #p2 and var13 > 0
end

local function flattenForTelemetry(p3) --[[ line: 144 ]]
	local t = {}
	
	for i, v in p3 do
		if type(v) ~= "table" then
			t[i] = tostring(v)
			continue
		end
		local var15 = 0
		
		for i_1 in v do
			var15 += 1
		end
		if var15 == #v and var15 > 0 then
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

local _ = function() --[[ line: 186 | named "getCoreScriptVersion" ]]
	-- upvalues: runService (ref)
	if not game:GetEngineFeature("CoreScriptVersionEnabled") then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 191 ]]
		-- upvalues: runService (copy)
		return runService:GetCoreScriptVersion()
	end)
	
	return if ok then status else nil
end

if not fFlagAbuseReportClientVersionModule then
	var11 = nil
elseif game:GetEngineFeature("CoreScriptVersionEnabled") then
	local ok, status = pcall(function() --[[ line: 191 ]]
		-- upvalues: runService (ref)
		return runService:GetCoreScriptVersion()
	end)
	var11 = if ok then status else nil
else
	var11 = nil
end
return {
	sendAnalyticsEvent = function(p4, p5) --[[ line: 200 ]]
		-- upvalues: localPlayer (ref), fFlagAbuseReportClientVersionModule (ref), var11 (ref), fFlagFixAnalyticsForDynamicReportV2 (ref), dashModule (ref), telemetryService (ref), t_3 (ref), flattenForTelemetry (ref)
		local t = {
			user_id = if localPlayer then localPlayer.UserId else nil
		}
		
		if fFlagAbuseReportClientVersionModule then
			t.client_version = var11
		end
		if fFlagFixAnalyticsForDynamicReportV2 then
			telemetryService:LogEvent(t_3, {
				customFields = flattenForTelemetry(dashModule.join(p4, p5, t)),
				eventContext = p4.abuse_vector
			})
			
			return
		end
		telemetryService:LogEvent(dashModule.join(t_3, { eventContext = p4.abuse_vector }), { customFields = dashModule.join(p4, p5, t) })
	end,
	TelemetryEventType = t,
	LinkOpenedSource = t_1,
	SubmitSource = t_2,
	formatHttpErrorMessageForAnalytics = formatHttpErrorMessageForAnalytics
}