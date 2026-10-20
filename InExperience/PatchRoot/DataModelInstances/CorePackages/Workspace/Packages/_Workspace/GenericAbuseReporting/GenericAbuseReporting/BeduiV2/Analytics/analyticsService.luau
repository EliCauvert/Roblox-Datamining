local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local HttpService = game:GetService("HttpService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local TelemetryService = game:GetService("TelemetryService")
local DashModule = require(GenericAbuseReporting.Parent.Dash)
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local TelemetryEventType = {
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
local LinkOpenedSource = { Footer = "footer", NextAction = "next_action" }
local SubmitSource = { Flow = "flow", SceneSelection = "sceneSelection" }
local list = { "errorMessage", "message", "error" }

local function _(p1, p2: number)
	local Text = tostring(p1)
	
	return if utf8.len(Text) == nil then nil elseif #Text <= p2 then Text else string.sub(Text, 1, utf8.offset(Text, 0, p2 + 1) - 1)
end

local _ = function(Segments, Key, p1)
	if p1 ~= nil then
		local Text = tostring(p1)
		local Text1 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
		
		if Text1 ~= nil then
			Segments[Key] = Text1
		end
	end
end

local _ = function(p1)
	-- upvalues: list (copy)
	if type(p1) ~= "table" then
		return nil
	end
	local v1 = nil
	for _, value in list do
		v1 = p1[value]
		
		if type(v1) == "string" then
			return v1
		end
	end
	return nil
end

local function getHeader(Headers, Text: string)
	if type(Headers) ~= "table" then
		return nil
	end
	local Lowered = string.lower(Text)
	
	for i, header in Headers do
		if type(i) == "string" and string.lower(i) == Lowered then
			return header
		end
	end
	return nil
end

local _ = function(Segments, Key, p2, p3)
	-- upvalues: getHeader (copy)
	local Number: number? = tonumber((getHeader(p2, p3)))
	
	if Number and Number ~= nil then
		local Text = tostring(Number)
		local Text1 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
		
		if Text1 ~= nil then
			Segments[Key] = Text1
		end
	end
end

local function formatErrorDetailForAnalytics(p2, p3, p4)
	-- upvalues: getHeader (copy), list (copy), DashModule (copy)
	local v2 = if type(p3) == "string" then p3 else nil
	local Error_metadata = {}
	
	if type(p3) == "table" then
		local StatusCode = p3.StatusCode
		
		if StatusCode ~= nil then
			local Text = tostring(StatusCode)
			local Text1 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
			
			if Text1 ~= nil then
				Error_metadata.status_code = Text1
			end
		end
		local HttpError = p3.HttpError
		
		if HttpError ~= nil then
			local Text = tostring(HttpError)
			local Text2 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
			
			if Text2 ~= nil then
				Error_metadata.http_error = Text2
			end
		end
		local IsCached = p3.IsCached
		
		if IsCached ~= nil then
			local Text = tostring(IsCached)
			local Text3 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
			
			if Text3 ~= nil then
				Error_metadata.is_cached = Text3
			end
		end
		local IsPrefetch = p3.IsPrefetch
		
		if IsPrefetch ~= nil then
			local Text = tostring(IsPrefetch)
			local Text4 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
			
			if Text4 ~= nil then
				Error_metadata.is_prefetch = Text4
			end
		end
		if p3.isJSONValid == false then
			Error_metadata.reason = "invalid_json"
		end
		local Stats = p3.Stats
		
		if type(Stats) == "table" then
			local Number: number? = tonumber(Stats.RoundTripTime)
			
			if Number then
				local ScaledNumber = Number * 1000
				
				if ScaledNumber ~= nil then
					local Text = tostring(ScaledNumber)
					local Text5 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
					
					if Text5 ~= nil then
						Error_metadata.round_trip_milliseconds = Text5
					end
				end
			end
			local WasRequestRetried = Stats.WasRequestRetried
			
			if WasRequestRetried ~= nil then
				local Text = tostring(WasRequestRetried)
				local Text6 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
				
				if Text6 ~= nil then
					Error_metadata.was_request_retried = Text6
				end
			end
		end
		local Number1: number? = tonumber((getHeader(p3.Headers, "Retry-After")))
		
		if Number1 and Number1 ~= nil then
			local Text = tostring(Number1)
			local Text7 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
			
			if Text7 ~= nil then
				Error_metadata.retry_after_seconds = Text7
			end
		end
		local Number: number? = tonumber((getHeader(p3.Headers, "x-envoy-upstream-service-time")))
		
		if Number and Number ~= nil then
			local Text = tostring(Number)
			local Text9 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
			
			if Text9 ~= nil then
				Error_metadata.upstream_service_time_milliseconds = Text9
			end
		end
		if next(Error_metadata) == nil then
			if type(p3) == "table" then
				v2 = nil
				local v3 = nil
				
				for _, value in list do
					v3 = p3[value]
					
					if type(v3) == "string" then
						v2 = v3
						break
					end
				end
			else
				v2 = nil
			end
			Error_metadata.reason = "unknown"
		end
		if type(p3.Body) == "string" then
			local CountBody = #p3.Body
			
			if CountBody ~= nil then
				local Text = tostring(CountBody)
				local Text10 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
				
				if Text10 ~= nil then
					Error_metadata.body_size_bytes = Text10
				end
			end
		end
		if p4 and p4.includeResponseBody and p3.Body ~= nil then
			local Body = if type(p3.Body) == "string" then p3.Body else DashModule.pretty(p3.Body, { depth = 10 })
			
			if Body ~= nil then
				local Text = tostring(Body)
				local Text11 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
				
				if Text11 ~= nil then
					Error_metadata.response_body = Text11
				end
			end
		end
	end
	if next(Error_metadata) == nil then
		Error_metadata.reason = "unknown"
	end
	local v4 = v2
	
	if v4 ~= nil then
		local Text = tostring(v4)
		local Text8 = if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)
		
		if Text8 ~= nil then
			Error_metadata.runtime_message = Text8
		end
	end
	local Text = tostring(p2)
	
	return {
		error_message = (if utf8.len(Text) == nil then nil elseif #Text <= 1000 then Text else string.sub(Text, 1, utf8.offset(Text, 0, 1001) - 1)) or "Unknown error",
		error_metadata = Error_metadata
	}
end

local _ = function(List): boolean
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
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/13201",
	lastUpdated = { 2026, 9, 10 },
	backends = { "EventIngest", "Points" },
	throttlingPercentage = game:DefineFastInt("DynamicAbuseReportV2ThrottleHundredthsPercent", 0)
}

local _ = function()
	-- upvalues: RunService (copy)
	if game:GetEngineFeature("CoreScriptVersionEnabled") then
		local Success, Result = pcall(function()
			-- upvalues: RunService (upval)
			return RunService:GetCoreScriptVersion()
		end)
		
		return if Success then Result else nil
	else
		return nil
	end
end
local Client_version = nil

if game:GetEngineFeature("CoreScriptVersionEnabled") then
	local Success, Result = pcall(function()
		-- upvalues: RunService (copy)
		return RunService:GetCoreScriptVersion()
	end)
	Client_version = if Success then Result else nil
else
	Client_version = nil
end
return {
	sendAnalyticsEvent = function(p5, p6)
		-- upvalues: LocalPlayer (copy), Client_version (copy), flattenForTelemetry (copy), DashModule (copy), FFlagAbuseReportImproveErrorEventsModule (copy), HttpService (copy), TelemetryService (copy), config (copy)
		local FlattenForTelemetryResult = flattenForTelemetry(DashModule.join(p5, p6, {
			user_id = LocalPlayer and LocalPlayer.UserId or nil,
			client_version = Client_version
		}))
		
		if FFlagAbuseReportImproveErrorEventsModule and p6.sub_event_type == "Error" and p6.error_detail.error_metadata ~= nil then
			local Success, Result = pcall(HttpService.JSONEncode, HttpService, p6.error_detail.error_metadata)
			
			if Success and type(Result) == "string" then
				FlattenForTelemetryResult.error_metadata = Result
			else
				FlattenForTelemetryResult = DashModule.omit(FlattenForTelemetryResult, { "error_metadata" })
			end
		end
		TelemetryService:LogEvent(config, {
			customFields = FlattenForTelemetryResult,
			eventContext = p5.abuse_vector
		})
	end,
	TelemetryEventType = TelemetryEventType,
	LinkOpenedSource = LinkOpenedSource,
	SubmitSource = SubmitSource,
	formatErrorDetailForAnalytics = formatErrorDetailForAnalytics
}