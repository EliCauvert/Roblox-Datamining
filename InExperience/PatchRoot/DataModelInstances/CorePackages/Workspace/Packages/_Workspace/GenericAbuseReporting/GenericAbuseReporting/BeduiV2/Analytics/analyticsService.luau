local var1
local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local localPlayer = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")
local telemetryService = game:GetService("TelemetryService")
local dashModule = require(parent.Dash)
local fFlagAbuseReportClientVersionModule = require(genericAbuseReporting.Flags.FFlagAbuseReportClientVersion)
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

local function formatHttpErrorMessageForAnalytics(p1, p2)
	-- upvalues: dashModule (ref)
	local t = {}
	
	if type(p2) == "table" then
		if type(p2.StatusCode) == "number" then
			table.insert(t, `status={p2.StatusCode}`)
		end
		if typeof(p2.HttpError) == "EnumItem" then
			table.insert(t, `httpError={p2.HttpError}`)
		end
		if p2.isJSONValid == false then
			table.insert(t, "reason=invalid_json")
		end
	end
	if #t == 0 then
		table.insert(t, "reason=unknown")
	end
	table.insert(t, `error={string.sub(dashModule.pretty(p2, { depth = 10 }), 1, 1000)}`)
	
	return p1 .. " " .. table.concat(t, " ")
end

local function _(p1)
	local var2 = 0
	
	for i in p1 do
		var2 += 1
	end
	return var2 == #p1 and var2 > 0
end

local function flattenForTelemetry(p2)
	local t = {}
	
	for i, v in p2 do
		if type(v) ~= "table" then
			t[i] = tostring(v)
			continue
		end
		local var3 = 0
		
		for i_1 in v do
			var3 += 1
		end
		if var3 == #v and var3 > 0 then
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

local _ = function()
	-- upvalues: runService (ref)
	if not game:GetEngineFeature("CoreScriptVersionEnabled") then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: runService (copy)
		return runService:GetCoreScriptVersion()
	end)
	
	return if ok then status else nil
end

if not fFlagAbuseReportClientVersionModule then
	var1 = nil
elseif game:GetEngineFeature("CoreScriptVersionEnabled") then
	local ok, status = pcall(function()
		-- upvalues: runService (ref)
		return runService:GetCoreScriptVersion()
	end)
	var1 = if ok then status else nil
else
	var1 = nil
end
return {
	sendAnalyticsEvent = function(p3, p4)
		-- upvalues: localPlayer (ref), fFlagAbuseReportClientVersionModule (ref), var1 (ref), dashModule (ref), telemetryService (ref), t_3 (ref), flattenForTelemetry (ref)
		local t = {
			user_id = if localPlayer then localPlayer.UserId else nil
		}
		
		if fFlagAbuseReportClientVersionModule then
			t.client_version = var1
		end
		telemetryService:LogEvent(t_3, {
			customFields = flattenForTelemetry(dashModule.join(p3, p4, t)),
			eventContext = p3.abuse_vector
		})
	end,
	TelemetryEventType = t,
	LinkOpenedSource = t_1,
	SubmitSource = t_2,
	formatHttpErrorMessageForAnalytics = formatHttpErrorMessageForAnalytics
}