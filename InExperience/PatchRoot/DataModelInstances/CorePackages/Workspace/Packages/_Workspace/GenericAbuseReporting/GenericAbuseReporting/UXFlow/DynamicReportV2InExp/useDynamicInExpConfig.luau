local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local FetchConfigWithAttributesModule = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.fetchConfigWithAttributes)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.inExperienceConfig)
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local FormatErrorDetailForAnalyticsFunction = AnalyticsServiceModule.formatErrorDetailForAnalytics
local GetNewRunIdFunction = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.reducer).getNewRunId
local SendAnalyticsEventFunction = AnalyticsServiceModule.sendAnalyticsEvent
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local InExperience = require(GenericAbuseReporting.Enums.AbuseVector).InExperience

local function getCacheKey(InExperience, List): string --[[ Line: 38 ]]
	local List1 = {}
	
	for i in pairs(List) do
		table.insert(List1, i)
	end
	table.sort(List1)
	local List2 = { InExperience }
	
	for _, value in ipairs(List1) do
		table.insert(List2, value .. "=" .. tostring(List[value]))
	end
	return table.concat(List2, ":")
end

local v1 = nil

return {
	CONFIG_CACHE_TTL_MS = 1800000,
	useDynamicInExpConfig = function(p1, p2) --[[ Line: 77 ]]
		-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), getCacheKey (copy), InExperience (copy), ReactModule (copy), v1 (ref), SendAnalyticsEventFunction (copy), TelemetryEventType (copy), FetchConfigWithAttributesModule (copy), GetNewRunIdFunction (copy), FFlagAbuseReportImproveErrorEventsModule (copy), FormatErrorDetailForAnalyticsFunction (copy), DashModule (copy)
		local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
		local CacheKey = getCacheKey(InExperience, p2)
		local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
		local UseRefResult = ReactModule.useRef(0)
		local Data = if UseStateResult and UseStateResult.key ~= CacheKey then nil elseif UseStateResult then UseStateResult.data else nil
		ReactModule.useEffect(function() --[[ Line: 92 ]]
			-- upvalues: p1 (copy), UseStateResult2 (copy), p2 (copy), v1 (upval), CacheKey (copy), UseStateResult2_1 (copy), SendAnalyticsEventFunction (upval), InExperience (upval), TelemetryEventType (upval), UseRefResult (copy), FetchConfigWithAttributesModule (upval), UseRoactServiceResult (copy), GetNewRunIdFunction (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
			if not p1 then
				UseStateResult2(nil)
				
				return
			end
			local ExperienceTargetId = p2.experienceTargetId
			local UnixTimestampMillis = DateTime.now().UnixTimestampMillis
			
			if v1 and v1.key == CacheKey and UnixTimestampMillis - v1.fetchedAtMs <= 1800000 then
				UseStateResult2({ key = CacheKey, data = v1.data })
				UseStateResult2_1(false)
				SendAnalyticsEventFunction({
					run_id = "unknown",
					total_duration = 0,
					abuse_vector = InExperience,
					target_id = ExperienceTargetId,
					path = {},
					config_name = v1.data.name
				}, {
					sub_event_type = TelemetryEventType.ConfigLoaded,
					config_load_detail = { load_duration_ms = 0, cache_hit = true, retry_count = 0 }
				})
				
				return
			else
				local NewCurrent = UseRefResult.current + 1
				UseRefResult.current = NewCurrent
				UseStateResult2(nil)
				UseStateResult2_1(false)
				local UnixTimestampMillis1 = DateTime.now().UnixTimestampMillis
				FetchConfigWithAttributesModule(UseRoactServiceResult, InExperience, p2):andThen(function(Result) --[[ Line: 140 ]]
					-- upvalues: UseRefResult (upval), NewCurrent (copy), v1 (upval), CacheKey (upval), UseStateResult2 (upval), SendAnalyticsEventFunction (upval), InExperience (upval), ExperienceTargetId (copy), TelemetryEventType (upval), UnixTimestampMillis1 (copy)
					if UseRefResult.current == NewCurrent then
						local ResponseBody = Result.responseBody
						v1 = {
							key = CacheKey,
							data = ResponseBody,
							fetchedAtMs = DateTime.now().UnixTimestampMillis
						}
						UseStateResult2({ key = CacheKey, data = ResponseBody })
						SendAnalyticsEventFunction({
							run_id = "unknown",
							total_duration = 0,
							abuse_vector = InExperience,
							target_id = ExperienceTargetId,
							path = {},
							config_name = ResponseBody.name
						}, {
							sub_event_type = TelemetryEventType.ConfigLoaded,
							config_load_detail = {
								cache_hit = false,
								retry_count = 0,
								load_duration_ms = DateTime.now().UnixTimestampMillis - UnixTimestampMillis1
							}
						})
						
						return
					end
				end):catch(function(Err) --[[ Line: 166 ]]
					-- upvalues: UseRefResult (upval), NewCurrent (copy), UseStateResult2_1 (upval), SendAnalyticsEventFunction (upval), InExperience (upval), ExperienceTargetId (copy), GetNewRunIdFunction (upval), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval), DashModule (upval)
					if UseRefResult.current == NewCurrent then
						warn("Failed to fetch Dynamic Report V2 config:", Err)
						UseStateResult2_1(true)
						SendAnalyticsEventFunction({
							total_duration = 0,
							abuse_vector = InExperience,
							target_id = ExperienceTargetId,
							run_id = GetNewRunIdFunction(),
							path = {}
						}, {
							sub_event_type = TelemetryEventType.Error,
							error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("Failed to fetch config", Err) else {
								error_message = "Failed to fetch config: " .. string.sub(DashModule.pretty(Err, { depth = 2 }), 1, 256)
							}
						})
						
						return
					end
				end)
			end
		end, { UseRoactServiceResult, p1, p2, CacheKey })
		
		return {
			config = Data,
			hasError = UseStateResult1,
			setHasError = UseStateResult2_1,
			abuseVector = InExperience
		}
	end,
	clearCacheForTesting = function() --[[ Line: 54 ]]
		-- upvalues: v1 (ref)
		v1 = nil
	end
}