local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local reactModule = require(parent.React)
local alertSeverity = foundationModule.Enums.AlertSeverity
local feedbackAlert = foundationModule.FeedbackAlert
local view = foundationModule.View
local telemetryEventType = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local useAbuseReportAnalytics = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local var1 = motionModule.createState({
	groupTransparency = 1,
	sizeY = 0,
	position = UDim2.new(0, 0, -0.5, 0)
}, {
	default = motionModule.transition(motionModule.TransitionPreset.Default, { duration = 0.15 })
})
local t = {
	error = alertSeverity.Error,
	warning = alertSeverity.Warning,
	info = alertSeverity.Info,
	success = alertSeverity.Success
}

return reactModule.memo(function(p1)
	-- upvalues: motionModule (ref), var1 (ref), reactModule (ref), useAbuseReportAnalytics (ref), t (ref), telemetryEventType (ref), view (ref), feedbackAlert (ref), alertSeverity (ref)
	local var2 = motionModule.usePresence()
	local var3, var4 = motionModule.useMotion(var1)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useRef(var2.isPresent)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	reactModule.useEffect(function()
		-- upvalues: t (copy), p1 (ref), sendEvent (ref), telemetryEventType (copy)
		if not t[p1.severity] then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "feedback missing correct severity, received type: " .. tostring(p1.severity)
				}
			})
		end
	end, { p1.severity, sendEvent })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var2 (ref)
		var6.current = var2.isPresent
	end, { var2.isPresent })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var5 (ref), var4 (ref), p1 (ref)
		if var2.isPresent then
			if var5.current > 0 then
				var4({
					groupTransparency = 0,
					position = UDim2.new(0, 0, 0, 1),
					sizeY = var5.current + 2 + (p1.bottomMargin or 0)
				})
				
				return
			end
		else
			var4({
				groupTransparency = 1,
				sizeY = 0,
				position = UDim2.new(0, 0, -0.5, 0)
			}, {
				onAnimationComplete = function(p2)
					-- upvalues: var2 (copy)
					if p2 == true then
						var2.onExitComplete()
					end
				end
			})
		end
	end, {
		var2.isPresent,
		var4,
		var2.onExitComplete,
		p1.bottomMargin
	})
	local maxWidth = p1.maxWidth
	
	return reactModule.createElement(view, {
		ClipsDescendants = true,
		Size = var3.sizeY:map(function(p2)
			-- upvalues: maxWidth (ref)
			return if maxWidth == nil then UDim2.new(1, 0, 0, p2) else UDim2.new(0, maxWidth, 0, p2)
		end),
		LayoutOrder = p1.layoutOrder
	}, {
		Content = reactModule.createElement("CanvasGroup", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			GroupTransparency = var3.groupTransparency,
			Position = var3.position,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p2)
				-- upvalues: var5 (ref), var6 (ref), var4 (ref), p1 (ref)
				local y = p2.AbsoluteSize.Y
				
				if y <= 0 or y == var5.current then return end
				var5.current = y
				
				if var6.current then
					var4({
						groupTransparency = 0,
						position = UDim2.new(0, 0, 0, 1),
						sizeY = y + 2 + (p1.bottomMargin or 0)
					})
				end
			end, { var4, p1.bottomMargin })
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 1),
				PaddingBottom = UDim.new(0, 1),
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 1)
			}),
			Alert = reactModule.createElement(feedbackAlert, {
				severity = t[p1.severity] or alertSeverity.Info,
				title = p1.title,
				subtitle = p1.subtitle,
				onClose = p1.onClose
			})
		})
	})
end)