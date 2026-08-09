local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local inExpSceneSelectionAdapterModule = require(script.Parent.inExpSceneSelectionAdapter)
local getIsInExpSceneSelectionAvailableModule = require(script.Parent.getIsInExpSceneSelectionAvailable)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots

return reactModule.memo(function(p0) --[[ line: 31 | named "InExpSceneSelectionNode" ]]
	-- upvalues: reactModule (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), getIsInExpSceneSelectionAvailableModule (ref), telemetryEventType (ref), inExpSceneSelectionAdapterModule (ref), textWithTranslationModule (ref)
	local var8, var9 = reactModule.useState(p0.loadingText)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var10 = useLayoutSlots()
	local layout = var10.Layout
	local title = var10.Title
	local var11 = reactModule.useRef(p0)
	var11.current = p0
	local var12 = reactModule.useRef(sendEvent)
	var12.current = sendEvent
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: getIsInExpSceneSelectionAvailableModule (copy), var12 (ref), telemetryEventType (copy), var9 (ref), var11 (ref), inExpSceneSelectionAdapterModule (copy)
		if not getIsInExpSceneSelectionAvailableModule() then
			var12.current({
				sub_event_type = telemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = "unavailable", success = false }
			})
			var9(var11.current.errorText)
			
			return
		end
		local var13 = nil
		var13 = inExpSceneSelectionAdapterModule.subscribeOnceToExitReason(function(p1) --[[ line: 64 ]]
			-- upvalues: var13 (write), var12 (copy), telemetryEventType (copy), var11 (copy)
			var13 = nil
			var12.current({
				sub_event_type = telemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = p1.reason, success = p1.reason == "submit" }
			})
			local current = var11.current
			
			if p1.reason == "submit" then
				if current.onNext then
					current.onNext()
					
					return
				end
			elseif current.goBack then
				current.goBack()
			end
		end)
		
		if not pcall(inExpSceneSelectionAdapterModule.start) then
			var12.current({
				sub_event_type = telemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = "start_failed", success = false }
			})
			var9(var11.current.errorText)
			
			if var13 then
				var13:Disconnect()
				var13 = nil
			end
		end
		return function() --[[ line: 101 ]]
			-- upvalues: var13 (write)
			if var13 then
				var13:Disconnect()
				var13 = nil
			end
		end
	end, {})
	
	return reactModule.createElement(layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, {
			Title = reactModule.createElement(title, { layoutOrder = 1, input = p0.title }),
			Message = if var8 then reactModule.createElement(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = var8
			}) else nil
		})
	})
end)