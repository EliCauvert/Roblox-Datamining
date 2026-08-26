local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local fetchConfigWithAttributesModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.inExperienceConfig)
local fFlagFixAbuseReportInExpPhantomAnalyticsModule = require(genericAbuseReporting.Flags.FFlagFixAbuseReportInExpPhantomAnalytics)
local getNewRunId = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getNewRunId
local sendAnalyticsEvent = analyticsServiceModule.sendAnalyticsEvent
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local inExperience = abuseVectorModule.InExperience

local function getCacheKey(p1, p2)
	local t = {}
	
	for i in pairs(p2) do
		table.insert(t, i)
	end
	table.sort(t)
	local list = { p1 }
	
	for i_1, v in ipairs(t) do
		table.insert(list, v .. "=" .. tostring(p2[v]))
	end
	return table.concat(list, ":")
end

local var1 = nil

local function clearCacheForTesting()
	-- upvalues: var1 (write)
	var1 = nil
end

local function useDynamicInExpConfigWithKeyGuard(p3, p4)
	-- upvalues: useRoactService (ref), roactNetworking (ref), getCacheKey (ref), inExperience (ref), reactModule (ref), var1 (write), sendAnalyticsEvent (ref), telemetryEventType (ref), fetchConfigWithAttributesModule (ref), dashModule (ref), getNewRunId (ref)
	local var2 = useRoactService(roactNetworking)
	local var3 = getCacheKey(inExperience, p4)
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useState(false)
	local var8 = reactModule.useRef(0)
	local var9 = if var4 and var4.key ~= var3 then nil elseif var4 then var4.data else nil
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var5 (ref), p4 (ref), var1 (copy), var3 (ref), var7 (ref), sendAnalyticsEvent (copy), inExperience (copy), telemetryEventType (copy), var8 (ref), fetchConfigWithAttributesModule (copy), var2 (ref), dashModule (copy), getNewRunId (copy)
		if not p3 then
			var5(nil)
			
			return
		end
		local experienceTargetId = p4.experienceTargetId
		
		if var1 and var1.key == var3 and DateTime.now().UnixTimestampMillis - var1.fetchedAtMs <= 1800000 then
			var5({ key = var3, data = var1.data })
			var7(false)
			sendAnalyticsEvent({
				run_id = "unknown",
				total_duration = 0,
				abuse_vector = inExperience,
				target_id = experienceTargetId,
				path = {},
				config_name = var1.data.name
			}, {
				sub_event_type = telemetryEventType.ConfigLoaded,
				config_load_detail = { load_duration_ms = 0, cache_hit = true, retry_count = 0 }
			})
			
			return
		end
		local var10 = var8.current + 1
		var8.current = var10
		var5(nil)
		var7(false)
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		fetchConfigWithAttributesModule(var2, inExperience, p4):andThen(function(p5)
			-- upvalues: var8 (copy), var10 (ref), var1 (copy), var3 (copy), var5 (copy), sendAnalyticsEvent (copy), inExperience (copy), experienceTargetId (ref), telemetryEventType (copy), unixTimestampMillis (ref)
			if var8.current == var10 then
				local responseBody = p5.responseBody
				var1 = {
					key = var3,
					data = responseBody,
					fetchedAtMs = DateTime.now().UnixTimestampMillis
				}
				var5({ key = var3, data = responseBody })
				sendAnalyticsEvent({
					run_id = "unknown",
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = experienceTargetId,
					path = {},
					config_name = responseBody.name
				}, {
					sub_event_type = telemetryEventType.ConfigLoaded,
					config_load_detail = {
						cache_hit = false,
						retry_count = 0,
						load_duration_ms = DateTime.now().UnixTimestampMillis - unixTimestampMillis
					}
				})
				
				return
			end
		end):catch(function(p5)
			-- upvalues: var8 (copy), var10 (ref), var7 (copy), dashModule (copy), sendAnalyticsEvent (copy), inExperience (copy), experienceTargetId (ref), getNewRunId (copy), telemetryEventType (copy)
			if var8.current == var10 then
				warn("Failed to fetch Dynamic Report V2 config:", p5)
				var7(true)
				sendAnalyticsEvent({
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = experienceTargetId,
					run_id = getNewRunId(),
					path = {}
				}, {
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = `Failed to fetch config: {string.sub(dashModule.pretty(p5, { depth = 2 }), 1, 256)}`
					}
				})
				
				return
			end
		end)
	end, { var2, p3, p4, var3 })
	
	return {
		config = var9,
		hasError = var6,
		setHasError = var7,
		abuseVector = inExperience
	}
end

local function useDynamicInExpConfigLegacy(p3, p4)
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), getCacheKey (ref), inExperience (ref), var1 (write), sendAnalyticsEvent (ref), telemetryEventType (ref), fetchConfigWithAttributesModule (ref), dashModule (ref), getNewRunId (ref)
	local var2 = useRoactService(roactNetworking)
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useState(false)
	local var7 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: p3 (ref), var4 (ref), getCacheKey (copy), inExperience (copy), p4 (ref), var1 (copy), var6 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var7 (ref), fetchConfigWithAttributesModule (copy), var2 (ref), dashModule (copy), getNewRunId (copy)
		if not p3 then
			var4(nil)
			
			return
		end
		local var8 = getCacheKey(inExperience, p4)
		
		if var1 and var1.key == var8 and DateTime.now().UnixTimestampMillis - var1.fetchedAtMs <= 1800000 then
			var4(var1.data)
			var6(false)
			sendAnalyticsEvent({
				run_id = "unknown",
				total_duration = 0,
				abuse_vector = inExperience,
				target_id = p4.experienceTargetId,
				path = {},
				config_name = var1.data.name
			}, {
				sub_event_type = telemetryEventType.ConfigLoaded,
				config_load_detail = { load_duration_ms = 0, cache_hit = true, retry_count = 0 }
			})
			
			return
		end
		local var9 = var7.current + 1
		var7.current = var9
		var4(nil)
		var6(false)
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		fetchConfigWithAttributesModule(var2, inExperience, p4):andThen(function(p5)
			-- upvalues: var7 (copy), var9 (ref), var1 (copy), var8 (ref), var4 (copy), sendAnalyticsEvent (copy), inExperience (copy), p4 (copy), telemetryEventType (copy), unixTimestampMillis (ref)
			if var7.current == var9 then
				local responseBody = p5.responseBody
				var1 = {
					key = var8,
					data = responseBody,
					fetchedAtMs = DateTime.now().UnixTimestampMillis
				}
				var4(responseBody)
				sendAnalyticsEvent({
					run_id = "unknown",
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = p4.experienceTargetId,
					path = {},
					config_name = responseBody.name
				}, {
					sub_event_type = telemetryEventType.ConfigLoaded,
					config_load_detail = {
						cache_hit = false,
						retry_count = 0,
						load_duration_ms = DateTime.now().UnixTimestampMillis - unixTimestampMillis
					}
				})
				
				return
			end
		end):catch(function(p5)
			-- upvalues: var7 (copy), var9 (ref), var6 (copy), dashModule (copy), sendAnalyticsEvent (copy), inExperience (copy), p4 (copy), getNewRunId (copy), telemetryEventType (copy)
			if var7.current == var9 then
				warn("Failed to fetch Dynamic Report V2 config:", p5)
				var6(true)
				sendAnalyticsEvent({
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = p4.experienceTargetId,
					run_id = getNewRunId(),
					path = {}
				}, {
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = `Failed to fetch config: {string.sub(dashModule.pretty(p5, { depth = 2 }), 1, 256)}`
					}
				})
				
				return
			end
		end)
	end, { var2, p3, p4 })
	
	return {
		config = var3,
		hasError = var5,
		setHasError = var6,
		abuseVector = inExperience
	}
end

return {
	CONFIG_CACHE_TTL_MS = 1800000,
	useDynamicInExpConfig = function(p3, p4)
		-- upvalues: fFlagFixAbuseReportInExpPhantomAnalyticsModule (ref), useDynamicInExpConfigWithKeyGuard (ref), useDynamicInExpConfigLegacy (ref)
		return if fFlagFixAbuseReportInExpPhantomAnalyticsModule then useDynamicInExpConfigWithKeyGuard(p3, p4) else useDynamicInExpConfigLegacy(p3, p4)
	end,
	clearCacheForTesting = clearCacheForTesting
}