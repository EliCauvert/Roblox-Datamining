local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local reactModule = require(parent.React)
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local fFlagAbuseReportConfigStoreResolver = require(parent.SharedFlags).FFlagAbuseReportConfigStoreResolver
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local abuseVectorModule = require(genericAbuseReporting.Enums.AbuseVector)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local downgradeV2ToV1Module = require(genericAbuseReporting.BeduiV2.Utils.downgradeV2ToV1)
local fetchConfigWithAttributesModule = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.inExperienceConfig)
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

return {
	CONFIG_CACHE_TTL_MS = 1800000,
	useDynamicInExpConfig = function(p2, p3) --[[ line: 73 ]]
		-- upvalues: useRoactService (ref), roactNetworking (ref), reactModule (ref), getCacheKey (ref), inExperience (ref), var8 (write), sendAnalyticsEvent (ref), telemetryEventType (ref), fetchConfigWithAttributesModule (ref), fFlagAbuseReportConfigStoreResolver (ref), downgradeV2ToV1Module (ref), dashModule (ref), getNewRunId (ref)
		local var11 = useRoactService(roactNetworking)
		local var12, var13 = reactModule.useState(nil)
		local var14, var15 = reactModule.useState(false)
		local var16 = reactModule.useRef(0)
		reactModule.useEffect(function() --[[ line: 79 ]]
			-- upvalues: p2 (ref), var13 (ref), getCacheKey (copy), inExperience (copy), p3 (ref), var8 (copy), var15 (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var16 (ref), fetchConfigWithAttributesModule (copy), var11 (ref), fFlagAbuseReportConfigStoreResolver (copy), downgradeV2ToV1Module (copy), dashModule (copy), getNewRunId (copy)
			if not p2 then
				var13(nil)
				
				return
			end
			local var17 = getCacheKey(inExperience, p3)
			
			if var8 and var8.key == var17 and DateTime.now().UnixTimestampMillis - var8.fetchedAtMs <= 1800000 then
				var13(var8.data)
				var15(false)
				sendAnalyticsEvent({
					run_id = "unknown",
					total_duration = 0,
					abuse_vector = inExperience,
					target_id = p3.experienceTargetId,
					path = {},
					config_name = var8.data.name
				}, {
					sub_event_type = telemetryEventType.ConfigLoaded,
					config_load_detail = { load_duration_ms = 0, cache_hit = true, retry_count = 0 }
				})
				
				return
			end
			local var18 = var16.current + 1
			var16.current = var18
			var13(nil)
			var15(false)
			local unixTimestampMillis = DateTime.now().UnixTimestampMillis
			fetchConfigWithAttributesModule(var11, inExperience, p3):andThen(function(p5) --[[ line: 123 ]]
				-- upvalues: var16 (copy), var18 (ref), fFlagAbuseReportConfigStoreResolver (copy), downgradeV2ToV1Module (copy), var8 (copy), var17 (ref), var13 (copy), sendAnalyticsEvent (copy), inExperience (copy), p3 (copy), telemetryEventType (copy), unixTimestampMillis (ref)
				if var16.current == var18 then
					local var19 = if fFlagAbuseReportConfigStoreResolver then p5.responseBody else downgradeV2ToV1Module(p5.responseBody)
					var8 = {
						key = var17,
						data = var19,
						fetchedAtMs = DateTime.now().UnixTimestampMillis
					}
					var13(var19)
					sendAnalyticsEvent({
						run_id = "unknown",
						total_duration = 0,
						abuse_vector = inExperience,
						target_id = p3.experienceTargetId,
						path = {},
						config_name = var19.name
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
			end):catch(function(p4) --[[ line: 148 ]]
				-- upvalues: var16 (copy), var18 (ref), var15 (copy), dashModule (copy), sendAnalyticsEvent (copy), inExperience (copy), p3 (copy), getNewRunId (copy), telemetryEventType (copy)
				if var16.current == var18 then
					warn("Failed to fetch Dynamic Report V2 config:", p4)
					var15(true)
					sendAnalyticsEvent({
						total_duration = 0,
						abuse_vector = inExperience,
						target_id = p3.experienceTargetId,
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
		end, { var11, p2, p3 })
		
		return {
			config = var12,
			hasError = var14,
			setHasError = var15,
			abuseVector = inExperience
		}
	end,
	clearCacheForTesting = function() --[[ line: 53 ]]
		-- upvalues: var8 (write)
		var8 = nil
	end
}