local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local InExpSceneSelectionAdapterModule = require(script.Parent.inExpSceneSelectionAdapter)
local GetIsInExpSceneSelectionAvailableModule = require(script.Parent.getIsInExpSceneSelectionAvailable)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots

return ReactModule.memo(function(Current)
	-- upvalues: ReactModule (copy), UseAbuseReportAnalyticsFunction (copy), UseLayoutSlotsFunction (copy), GetIsInExpSceneSelectionAvailableModule (copy), TelemetryEventType (copy), InExpSceneSelectionAdapterModule (copy), TextWithTranslationModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Current.loadingText)
	local SendEvent = UseAbuseReportAnalyticsFunction().sendEvent
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	local Layout = UseLayoutSlotsResult.Layout
	local Title = UseLayoutSlotsResult.Title
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseRefResult1 = ReactModule.useRef(SendEvent)
	UseRefResult1.current = SendEvent
	ReactModule.useEffect(function()
		-- upvalues: GetIsInExpSceneSelectionAvailableModule (upval), UseRefResult1 (copy), TelemetryEventType (upval), UseStateResult2 (copy), UseRefResult (copy), InExpSceneSelectionAdapterModule (upval)
		if not GetIsInExpSceneSelectionAvailableModule() then
			UseRefResult1.current({
				sub_event_type = TelemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = "unavailable", success = false }
			})
			UseStateResult2(UseRefResult.current.errorText)
			
			return
		end
		local Connection = nil
		Connection = InExpSceneSelectionAdapterModule.subscribeOnceToExitReason(function(p1)
			-- upvalues: Connection (ref), UseRefResult1 (upval), TelemetryEventType (upval), UseRefResult (upval)
			Connection = nil
			UseRefResult1.current({
				sub_event_type = TelemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = p1.reason, success = p1.reason == "submit" }
			})
			local Current = UseRefResult.current
			
			if p1.reason == "submit" then
				if Current.onNext then
					Current.onNext()
					
					return
				end
			elseif Current.goBack then
				Current.goBack()
			end
		end)
		
		if not pcall(InExpSceneSelectionAdapterModule.start) then
			UseRefResult1.current({
				sub_event_type = TelemetryEventType.SceneCaptureResult,
				scene_capture_detail = { exit_reason = "start_failed", success = false }
			})
			UseStateResult2(UseRefResult.current.errorText)
			
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
		return function()
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
				Connection = nil
			end
		end
	end, {})
	
	return ReactModule.createElement(Layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, {
			Title = ReactModule.createElement(Title, { layoutOrder = 1, input = Current.title }),
			Message = if UseStateResult then ReactModule.createElement(TextWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = UseStateResult
			}) else nil
		})
	})
end)