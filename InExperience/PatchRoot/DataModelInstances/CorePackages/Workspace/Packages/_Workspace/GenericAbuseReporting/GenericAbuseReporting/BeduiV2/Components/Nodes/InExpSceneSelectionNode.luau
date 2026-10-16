local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local inExpSceneSelectionAdapterModule = require(script.Parent.inExpSceneSelectionAdapter)
local getIsInExpSceneSelectionAvailableModule = require(script.Parent.getIsInExpSceneSelectionAvailable)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local submitSource = analyticsServiceModule.SubmitSource
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagAbuseReportSceneSelectionSubmitTrackingModule = require(genericAbuseReporting.Flags.FFlagAbuseReportSceneSelectionSubmitTracking)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), getIsInExpSceneSelectionAvailableModule (ref), telemetryEventType (ref), inExpSceneSelectionAdapterModule (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), submitSource (ref), textWithTranslationModule (ref)
	local var1, var2 = reactModule.useState(p1.loadingText)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var3 = useLayoutSlots()
	local layout = var3.Layout
	local title = var3.Title
	local var4 = reactModule.useRef(p1)
	var4.current = p1
	local var5 = reactModule.useRef(sendEvent)
	var5.current = sendEvent
	reactModule.useEffect(function()
		-- upvalues: getIsInExpSceneSelectionAvailableModule (copy), var5 (ref), telemetryEventType (copy), var4 (ref), var2 (ref), inExpSceneSelectionAdapterModule (copy), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy)
		if getIsInExpSceneSelectionAvailableModule() then
			local var6 = nil
			var6 = inExpSceneSelectionAdapterModule.subscribeOnceToExitReason(function(p2)
				-- upvalues: var6 (write), var5 (copy), telemetryEventType (copy), var4 (copy), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy)
				var6 = nil
				var5.current({
					sub_event_type = telemetryEventType.SceneCaptureResult,
					scene_capture_detail = { exit_reason = p2.reason, success = p2.reason == "submit" }
				})
				local current = var4.current
				
				if p2.reason == "submit" then
					if fFlagAbuseReportSceneSelectionSubmitTrackingModule and current.onExternalSubmit then
						current.onExternalSubmit(submitSource.SceneSelection)
					end
					if current.onNext then
						current.onNext()
						
						return
					end
				elseif current.goBack then
					current.goBack()
				end
			end)
			
			if not pcall(inExpSceneSelectionAdapterModule.start) then
				var5.current({
					sub_event_type = telemetryEventType.SceneCaptureResult,
					scene_capture_detail = { exit_reason = "start_failed", success = false }
				})
				
				if var6 then
					var6:Disconnect()
					var6 = nil
				end
				local current = var4.current
				
				if current.onFailure then
					current.onFailure()
				else
					var2(current.errorText)
				end
			end
			return function()
				-- upvalues: var6 (write)
				if var6 then
					var6:Disconnect()
					var6 = nil
				end
			end
		else
			var5.current({
				sub_event_type = telemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = "unavailable", success = false }
			})
			local current = var4.current
			
			if current.onFailure then
				current.onFailure()
				
				return
			end
			var2(current.errorText)
		end
	end, {})
	
	return reactModule.createElement(layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, {
			Title = reactModule.createElement(title, { layoutOrder = 1, input = p1.title }),
			Message = if var1 then reactModule.createElement(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = var1
			}) else nil
		})
	})
end)