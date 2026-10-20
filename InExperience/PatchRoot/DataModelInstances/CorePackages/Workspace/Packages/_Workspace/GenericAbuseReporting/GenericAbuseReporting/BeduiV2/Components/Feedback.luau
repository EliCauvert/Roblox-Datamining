local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local ReactModule = require(Parent.React)
local AlertSeverity = FoundationModule.Enums.AlertSeverity
local FeedbackAlert = FoundationModule.FeedbackAlert
local View = FoundationModule.View
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local State = MotionModule.createState({
	groupTransparency = 1,
	sizeY = 0,
	position = UDim2.new(0, 0, -0.5, 0)
}, {
	default = MotionModule.transition(MotionModule.TransitionPreset.Default, { duration = 0.15 })
})
local config = {
	error = AlertSeverity.Error,
	warning = AlertSeverity.Warning,
	info = AlertSeverity.Info,
	success = AlertSeverity.Success
}

return ReactModule.memo(function(p1)
	-- upvalues: MotionModule (copy), State (copy), ReactModule (copy), UseAbuseReportAnalyticsFunction (copy), config (copy), TelemetryEventType (copy), FFlagAbuseReportImproveErrorEventsModule (copy), View (copy), FeedbackAlert (copy), AlertSeverity (copy)
	local UsePresenceResult = MotionModule.usePresence()
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(State)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(UsePresenceResult.isPresent)
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	ReactModule.useEffect(function()
		-- upvalues: config (upval), p1 (copy), SendEventFunction (copy), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval)
		if not config[p1.severity] then
			SendEventFunction({
				sub_event_type = TelemetryEventType.Error,
				error_detail = if FFlagAbuseReportImproveErrorEventsModule then {
					error_message = "feedback missing correct severity",
					error_metadata = { received_severity = p1.severity }
				} else {
					error_message = "feedback missing correct severity, received type: " .. tostring(p1.severity)
				}
			})
		end
	end, { p1.severity, SendEventFunction })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UsePresenceResult (copy)
		UseRefResult1.current = UsePresenceResult.isPresent
	end, { UsePresenceResult.isPresent })
	ReactModule.useEffect(function()
		-- upvalues: UsePresenceResult (copy), UseRefResult (copy), UseMotionResult2 (copy), p1 (copy)
		if not UsePresenceResult.isPresent then
			UseMotionResult2({
				groupTransparency = 1,
				sizeY = 0,
				position = UDim2.new(0, 0, -0.5, 0)
			}, {
				onAnimationComplete = function(Enabled)
					-- upvalues: UsePresenceResult (upval)
					if Enabled == true then
						UsePresenceResult.onExitComplete()
					end
				end
			})
		elseif UseRefResult.current > 0 then
			UseMotionResult2({
				groupTransparency = 0,
				position = UDim2.new(0, 0, 0, 1),
				sizeY = UseRefResult.current + 2 + (p1.bottomMargin or 0)
			})
			
			return
		end
	end, {
		UsePresenceResult.isPresent,
		UseMotionResult2,
		UsePresenceResult.onExitComplete,
		p1.bottomMargin
	})
	local MaxWidth = p1.maxWidth
	
	return ReactModule.createElement(View, {
		ClipsDescendants = true,
		Size = UseMotionResult.sizeY:map(function(YOffset): UDim2
			-- upvalues: MaxWidth (copy)
			return if MaxWidth == nil then UDim2.new(1, 0, 0, YOffset) else UDim2.new(0, MaxWidth, 0, YOffset)
		end),
		LayoutOrder = p1.layoutOrder
	}, {
		Content = ReactModule.createElement("CanvasGroup", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			GroupTransparency = UseMotionResult.groupTransparency,
			Position = UseMotionResult.position,
			[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
				-- upvalues: UseRefResult (copy), UseRefResult1 (copy), UseMotionResult2 (copy), p1 (copy)
				local Y: number = Frame.AbsoluteSize.Y
				
				if Y <= 0 or Y == UseRefResult.current then return end
				UseRefResult.current = Y
				
				if UseRefResult1.current then
					UseMotionResult2({
						groupTransparency = 0,
						position = UDim2.new(0, 0, 0, 1),
						sizeY = Y + 2 + (p1.bottomMargin or 0)
					})
				end
			end, { UseMotionResult2, p1.bottomMargin })
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 1),
				PaddingBottom = UDim.new(0, 1),
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 1)
			}),
			Alert = ReactModule.createElement(FeedbackAlert, {
				severity = config[p1.severity] or AlertSeverity.Info,
				title = p1.title,
				subtitle = p1.subtitle,
				onClose = p1.onClose
			})
		})
	})
end)