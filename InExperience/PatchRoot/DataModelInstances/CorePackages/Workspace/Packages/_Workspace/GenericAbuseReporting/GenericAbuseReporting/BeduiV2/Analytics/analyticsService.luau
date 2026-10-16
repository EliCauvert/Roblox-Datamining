local var1
local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local localPlayer = game:GetService("Players").LocalPlayer
local runService = game:GetService("RunService")
local telemetryService = game:GetService("TelemetryService")
local dashModule = require(parent.Dash)
local fFlagAbuseReportClientVersionModule = require(genericAbuseReporting.Flags.FFlagAbuseReportClientVersion)
local fFlagAbuseReportImproveErrorEventsModule = require(genericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
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
local list = { "errorMessage", "message", "error" }

local function _(p1, p2)
	local var2 = tostring(p1)
	
	return if utf8.len(var2) == nil then nil elseif #var2 <= p2 then var2 else string.sub(var2, 1, utf8.offset(var2, 0, p2 + 1) - 1)
end

local _ = function(value, p1, p2)
	if p2 ~= nil then
		local var2 = tostring(p2)
		local var3 = if utf8.len(var2) == nil then nil elseif #var2 <= 1000 then var2 else string.sub(var2, 1, utf8.offset(var2, 0, 1001) - 1)
		
		if var3 ~= nil then
			value[p1] = var3
		end
	end
end

local _ = function(p1)
	-- upvalues: list (ref)
	if type(p1) ~= "table" then
		return nil
	end
	for i, v in list do
		local var2 = p1[v]
		
		if type(var2) == "string" then
			return var2
		end
	end
	return nil
end

local function getHeader(p2, p3)
	if type(p2) ~= "table" then
		return nil
	end
	local lowerText = string.lower(p3)
	
	for i, v in p2 do
		if type(i) == "string" and string.lower(i) == lowerText then
			return v
		end
	end
	return nil
end

local _ = function(value, p4, p5, p6)
	-- upvalues: getHeader (ref)
	local var3 = tonumber(getHeader(p5, p6))
	
	if var3 and var3 ~= nil then
		local var4 = tostring(var3)
		local var5 = if utf8.len(var4) == nil then nil elseif #var4 <= 1000 then var4 else string.sub(var4, 1, utf8.offset(var4, 0, 1001) - 1)
		
		if var5 ~= nil then
			value[p4] = var5
		end
	end
end

local function formatErrorDetailForAnalytics(p4, p5, p6)
	-- upvalues: getHeader (ref), list (ref), dashModule (ref)
	local var3 = if type(p5) == "string" then p5 else nil
	local t = {}
	
	if type(p5) == "table" then
		local statusCode = p5.StatusCode
		
		if statusCode ~= nil then
			local var4 = tostring(statusCode)
			local var5 = if utf8.len(var4) == nil then nil elseif #var4 <= 1000 then var4 else string.sub(var4, 1, utf8.offset(var4, 0, 1001) - 1)
			
			if var5 ~= nil then
				t.status_code = var5
			end
		end
		local httpError = p5.HttpError
		
		if httpError ~= nil then
			local var6 = tostring(httpError)
			local var7 = if utf8.len(var6) == nil then nil elseif #var6 <= 1000 then var6 else string.sub(var6, 1, utf8.offset(var6, 0, 1001) - 1)
			
			if var7 ~= nil then
				t.http_error = var7
			end
		end
		local isCached = p5.IsCached
		
		if isCached ~= nil then
			local var8 = tostring(isCached)
			local var9 = if utf8.len(var8) == nil then nil elseif #var8 <= 1000 then var8 else string.sub(var8, 1, utf8.offset(var8, 0, 1001) - 1)
			
			if var9 ~= nil then
				t.is_cached = var9
			end
		end
		local isPrefetch = p5.IsPrefetch
		
		if isPrefetch ~= nil then
			local var10 = tostring(isPrefetch)
			local var11 = if utf8.len(var10) == nil then nil elseif #var10 <= 1000 then var10 else string.sub(var10, 1, utf8.offset(var10, 0, 1001) - 1)
			
			if var11 ~= nil then
				t.is_prefetch = var11
			end
		end
		if p5.isJSONValid == false then
			t.reason = "invalid_json"
		end
		local stats = p5.Stats
		
		if type(stats) == "table" then
			local var12 = tonumber(stats.RoundTripTime)
			
			if var12 then
				local var13 = var12 * 1000
				
				if var13 ~= nil then
					local var14 = tostring(var13)
					local var15 = if utf8.len(var14) == nil then nil elseif #var14 <= 1000 then var14 else string.sub(var14, 1, utf8.offset(var14, 0, 1001) - 1)
					
					if var15 ~= nil then
						t.round_trip_milliseconds = var15
					end
				end
			end
			local wasRequestRetried = stats.WasRequestRetried
			
			if wasRequestRetried ~= nil then
				local var16 = tostring(wasRequestRetried)
				local var17 = if utf8.len(var16) == nil then nil elseif #var16 <= 1000 then var16 else string.sub(var16, 1, utf8.offset(var16, 0, 1001) - 1)
				
				if var17 ~= nil then
					t.was_request_retried = var17
				end
			end
		end
		local var18 = tonumber(getHeader(p5.Headers, "Retry-After"))
		
		if var18 and var18 ~= nil then
			local var19 = tostring(var18)
			local var20 = if utf8.len(var19) == nil then nil elseif #var19 <= 1000 then var19 else string.sub(var19, 1, utf8.offset(var19, 0, 1001) - 1)
			
			if var20 ~= nil then
				t.retry_after_seconds = var20
			end
		end
		local var21 = tonumber(getHeader(p5.Headers, "x-envoy-upstream-service-time"))
		
		if var21 and var21 ~= nil then
			local var22 = tostring(var21)
			local var23 = if utf8.len(var22) == nil then nil elseif #var22 <= 1000 then var22 else string.sub(var22, 1, utf8.offset(var22, 0, 1001) - 1)
			
			if var23 ~= nil then
				t.upstream_service_time_milliseconds = var23
			end
		end
		if next(t) == nil then
			if type(p5) == "table" then
				local var24
				for i, v in list do
					var24 = p5[v]
					
					if type(var24) == "string" then
						var3 = var24
					end
				end
				var3 = nil
			else
				var3 = nil
			end
			t.reason = "unknown"
		end
		if type(p5.Body) == "string" then
			local bodyCount = #p5.Body
			
			if bodyCount ~= nil then
				local var25 = tostring(bodyCount)
				local var26 = if utf8.len(var25) == nil then nil elseif #var25 <= 1000 then var25 else string.sub(var25, 1, utf8.offset(var25, 0, 1001) - 1)
				
				if var26 ~= nil then
					t.body_size_bytes = var26
				end
			end
		end
		if p6 and p6.includeResponseBody and p5.Body ~= nil then
			local var27 = if type(p5.Body) == "string" then p5.Body else dashModule.pretty(p5.Body, { depth = 10 })
			
			if var27 ~= nil then
				local var28 = tostring(var27)
				local var29 = if utf8.len(var28) == nil then nil elseif #var28 <= 1000 then var28 else string.sub(var28, 1, utf8.offset(var28, 0, 1001) - 1)
				
				if var29 ~= nil then
					t.response_body = var29
				end
			end
		end
	end
	if next(t) == nil then
		t.reason = "unknown"
	end
	if var3 ~= nil then
		local var30 = tostring(var3)
		local var31 = if utf8.len(var30) == nil then nil elseif #var30 <= 1000 then var30 else string.sub(var30, 1, utf8.offset(var30, 0, 1001) - 1)
		
		if var31 ~= nil then
			t.runtime_message = var31
		end
	end
	local t_1 = {}
	local var32 = tostring(p4)
	t_1.error_message = (if utf8.len(var32) == nil then nil elseif #var32 <= 1000 then var32 else string.sub(var32, 1, utf8.offset(var32, 0, 1001) - 1)) or "Unknown error"
	t_1.error_metadata = t
	
	return t_1
end

local _ = function(p7)
	local var33 = 0
	
	for i in p7 do
		var33 += 1
	end
	return var33 == #p7 and var33 > 0
end

local function flattenForTelemetry(p8)
	local t = {}
	
	for i, v in p8 do
		if type(v) ~= "table" then
			t[i] = tostring(v)
			continue
		end
		local var34 = 0
		
		for i_1 in v do
			var34 += 1
		end
		if var34 == #v and var34 > 0 then
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
	links = "https://github.rbx.com/Roblox/proto-schemas/pull/13201",
	lastUpdated = { 2026, 9, 10 },
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
	sendAnalyticsEvent = function(p9, p10)
		-- upvalues: localPlayer (ref), fFlagAbuseReportClientVersionModule (ref), var1 (ref), flattenForTelemetry (ref), dashModule (ref), fFlagAbuseReportImproveErrorEventsModule (ref), httpService (ref), telemetryService (ref), t_3 (ref)
		local t = {
			user_id = if localPlayer then localPlayer.UserId else nil
		}
		
		if fFlagAbuseReportClientVersionModule then
			t.client_version = var1
		end
		local var35 = flattenForTelemetry(dashModule.join(p9, p10, t))
		
		if fFlagAbuseReportImproveErrorEventsModule and p10.sub_event_type == "Error" and p10.error_detail.error_metadata ~= nil then
			local ok, status = pcall(httpService.JSONEncode, httpService, p10.error_detail.error_metadata)
			
			if ok and type(status) == "string" then
				var35.error_metadata = status
			else
				var35 = dashModule.omit(var35, { "error_metadata" })
			end
		end
		telemetryService:LogEvent(t_3, { customFields = var35, eventContext = p9.abuse_vector })
	end,
	TelemetryEventType = t,
	LinkOpenedSource = t_1,
	SubmitSource = t_2,
	formatErrorDetailForAnalytics = formatErrorDetailForAnalytics
}