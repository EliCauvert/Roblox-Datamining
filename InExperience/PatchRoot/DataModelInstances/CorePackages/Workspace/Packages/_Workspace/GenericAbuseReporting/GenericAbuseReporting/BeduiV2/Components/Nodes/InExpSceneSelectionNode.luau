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

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), getIsInExpSceneSelectionAvailableModule (ref), telemetryEventType (ref), inExpSceneSelectionAdapterModule (ref), fFlagAbuseReportSceneSelectionSubmitTrackingModule (ref), submitSource (ref), textWithTranslationModule (ref)
	local var9, var10 = reactModule.useState(p0.loadingText)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var11 = useLayoutSlots()
	local layout = var11.Layout
	local title = var11.Title
	local var12 = reactModule.useRef(p0)
	var12.current = p0
	local var13 = reactModule.useRef(sendEvent)
	var13.current = sendEvent
	reactModule.useEffect(function()
		-- upvalues: getIsInExpSceneSelectionAvailableModule (copy), var13 (ref), telemetryEventType (copy), var12 (ref), var10 (ref), inExpSceneSelectionAdapterModule (copy), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy)
		if getIsInExpSceneSelectionAvailableModule() then
			local var14 = nil
			var14 = inExpSceneSelectionAdapterModule.subscribeOnceToExitReason(function(p1)
				-- upvalues: var14 (write), var13 (copy), telemetryEventType (copy), var12 (copy), fFlagAbuseReportSceneSelectionSubmitTrackingModule (copy), submitSource (copy)
				var14 = nil
				var13.current({
					sub_event_type = telemetryEventType.SceneCaptureResult,
					scene_capture_detail = { exit_reason = p1.reason, success = p1.reason == "submit" }
				})
				local current = var12.current
				
				if p1.reason == "submit" then
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
				var13.current({
					sub_event_type = telemetryEventType.SceneCaptureResult,
					scene_capture_detail = { exit_reason = "start_failed", success = false }
				})
				
				if var14 then
					var14:Disconnect()
					var14 = nil
				end
				local current = var12.current
				
				if current.onFailure then
					current.onFailure()
				else
					var10(current.errorText)
				end
			end
			return function()
				-- upvalues: var14 (write)
				if var14 then
					var14:Disconnect()
					var14 = nil
				end
			end
		else
			var13.current({
				sub_event_type = telemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = "unavailable", success = false }
			})
			local current = var12.current
			
			if current.onFailure then
				current.onFailure()
				
				return
			end
			var10(current.errorText)
		end
	end, {})
	
	return reactModule.createElement(layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, {
			Title = reactModule.createElement(title, { layoutOrder = 1, input = p0.title }),
			Message = if var9 then reactModule.createElement(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = var9
			}) else nil
		})
	})
end)