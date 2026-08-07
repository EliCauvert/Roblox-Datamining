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

local function getCacheKey(p0, p1) --[[ line: 37 ]]
	local t = {}
	
	for i in pairs(p1) do
		table.insert(t, i)
	end
	table.sort(t)
	local list = { p0 }
	
	for i_1, v in ipairs(t) do
		table.insert(list, v .. "=" .. tostring(p1[v]))
	end
	return table.concat(list, ":")
end

local var8 = nil

local function clearCacheForTesting() --[[ line: 53 ]]
	-- upvalues: var8 (write)
	var8 = nil
end

local function useDynamicInExpConfigWithKeyGuard(p2, p3) --[[ line: 76 ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), getCacheKey (ref), inExperience (ref), reactModule (ref), var8 (write), sendAnalyticsEvent (ref), telemetryEventType (ref), fetchConfigWithAttributesModule (ref), dashModule (ref), getNewRunId (ref)
	local var14 = useRoactService(roactNetworking)
	local var15 = getCacheKey(inExperience, p3)
	local var16, var17 = reactModule.useState(nil)
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useRef(0)
	local var21 = if var16 and var16.key ~= var15 then nil elseif var16 then var16.data else nil
	reactModule.useEffect(function() --[[ line: 94 ]]
		-- upvalues: p2 (ref), var17 (ref), p3 (ref), var8 (copy), var15 (ref), var19 (ref), sendAnalyticsEvent (copy), inExperience (copy), telemetryEventType (copy), var20 (ref), fetchConfigWithAttributesModule (copy), var14 (ref), dashModule (copy), getNewRunId (copy)
		if not p2 then
			var17(nil)
			
			return
		end
		local experienceTargetId = p3.experienceTargetId
		
		if var8 and var8.key == var15 and DateTime.now().UnixTimestampMillis - var8.fetchedAtMs <= 1800000 then
			var17({ key = var15, data = var8.data })
			var19(false)
			sendAnalyticsEvent({
				run_id = "unknown",
				total_duration = 0,
				abuse_vector = inExperience,
				target_id = experienceTargetId,
				path = {},
				config_name = var8.data.name
			}, {
				sub_event_type = telemetryEventType.ConfigLoaded,
				config_load_detail = { load_duration_ms = 0, cache_hit = true, retry_count = 0 }
			})
			
			return
		end
		local var22 = var20.current + 1
		var20.current = var22
		var17(nil)
		var19(false)
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		fetchConfigWithAttributesModule(var14, inExperience, p3):andThen(function(p5) --[[ line: 144 ]]
			-- upvalues: var20 (copy), var22 (ref), var8 (copy), var15 (copy), var17 (copy), sendAnalyticsEvent (copy), inExperience (copy), experienceTargetId (ref), telemetryEventType (copy), unixTimestampMillis (ref)
			if var20.current == var22 then
				local responseBody = p5.responseBody
				var8 = {
					key = var15,
					data = responseBody,
					fetchedAtMs = DateTime.now().UnixTimestampMillis
				}
				var17({ key = var15, data = responseBody })
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
		end):catch(function(p4) --[[ line: 170 ]]
			-- upvalues: var20 (copy), var22 (ref), var19 (copy), dashModule (copy), sendAnalyticsEvent (copy), inExperience (copy), experienceTargetId (ref), getNewRunId (copy), telemetryEventType (copy)
			if var20.current == var22 then
				warn("Failed to fetch Dynamic Report V2 config:", p4)
				var19(true)
				sendAnalyticsEvent({
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = experienceTargetId,
					run_id = getNewRunId(),
					path = {}
				}, {
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = `Failed to fetch config: {string.sub(dashModule.pretty(p4, { depth = 2 }), 1, 256)}`
					}
				})
				
				return
			end
		end)
	end, { var14, p2, p3, var15 })
	
	return {
		config = var21,
		hasError = var18,
		setHasError = var19,
		abuseVector = inExperience
	}
end

local function useDynamicInExpConfigLegacy(p6, p7) --[[ line: 204 ]]
	-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), getCacheKey (ref), inExperience (ref), var8 (write), sendAnalyticsEvent (ref), telemetryEventType (ref), fetchConfigWithAttributesModule (ref), dashModule (ref), getNewRunId (ref)
	local var23 = useRoactService(roactNetworking)
	local var24, var25 = reactModule.useState(nil)
	local var26, var27 = reactModule.useState(false)
	local var28 = reactModule.useRef(0)
	reactModule.useEffect(function() --[[ line: 210 ]]
		-- upvalues: p6 (ref), var25 (ref), getCacheKey (copy), inExperience (copy), p7 (ref), var8 (copy), var27 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var28 (ref), fetchConfigWithAttributesModule (copy), var23 (ref), dashModule (copy), getNewRunId (copy)
		if not p6 then
			var25(nil)
			
			return
		end
		local var29 = getCacheKey(inExperience, p7)
		
		if var8 and var8.key == var29 and DateTime.now().UnixTimestampMillis - var8.fetchedAtMs <= 1800000 then
			var25(var8.data)
			var27(false)
			sendAnalyticsEvent({
				run_id = "unknown",
				total_duration = 0,
				abuse_vector = inExperience,
				target_id = p7.experienceTargetId,
				path = {},
				config_name = var8.data.name
			}, {
				sub_event_type = telemetryEventType.ConfigLoaded,
				config_load_detail = { load_duration_ms = 0, cache_hit = true, retry_count = 0 }
			})
			
			return
		end
		local var30 = var28.current + 1
		var28.current = var30
		var25(nil)
		var27(false)
		local unixTimestampMillis = DateTime.now().UnixTimestampMillis
		fetchConfigWithAttributesModule(var23, inExperience, p7):andThen(function(p9) --[[ line: 254 ]]
			-- upvalues: var28 (copy), var30 (ref), var8 (copy), var29 (ref), var25 (copy), sendAnalyticsEvent (copy), inExperience (copy), p7 (copy), telemetryEventType (copy), unixTimestampMillis (ref)
			if var28.current == var30 then
				local responseBody = p9.responseBody
				var8 = {
					key = var29,
					data = responseBody,
					fetchedAtMs = DateTime.now().UnixTimestampMillis
				}
				var25(responseBody)
				sendAnalyticsEvent({
					run_id = "unknown",
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = p7.experienceTargetId,
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
		end):catch(function(p8) --[[ line: 277 ]]
			-- upvalues: var28 (copy), var30 (ref), var27 (copy), dashModule (copy), sendAnalyticsEvent (copy), inExperience (copy), p7 (copy), getNewRunId (copy), telemetryEventType (copy)
			if var28.current == var30 then
				warn("Failed to fetch Dynamic Report V2 config:", p8)
				var27(true)
				sendAnalyticsEvent({
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = p7.experienceTargetId,
					run_id = getNewRunId(),
					path = {}
				}, {
					sub_event_type = telemetryEventType.Error,
					error_detail = {
						error_message = `Failed to fetch config: {string.sub(dashModule.pretty(p8, { depth = 2 }), 1, 256)}`
					}
				})
				
				return
			end
		end)
	end, { var23, p6, p7 })
	
	return {
		config = var24,
		hasError = var26,
		setHasError = var27,
		abuseVector = inExperience
	}
end

return {
	CONFIG_CACHE_TTL_MS = 1800000,
	useDynamicInExpConfig = function(p10, p11) --[[ line: 309 ]]
		-- upvalues: fFlagFixAbuseReportInExpPhantomAnalyticsModule (ref), useDynamicInExpConfigWithKeyGuard (ref), useDynamicInExpConfigLegacy (ref)
		return if fFlagFixAbuseReportInExpPhantomAnalyticsModule then useDynamicInExpConfigWithKeyGuard(p10, p11) else useDynamicInExpConfigLegacy(p10, p11)
	end,
	clearCacheForTesting = clearCacheForTesting
}