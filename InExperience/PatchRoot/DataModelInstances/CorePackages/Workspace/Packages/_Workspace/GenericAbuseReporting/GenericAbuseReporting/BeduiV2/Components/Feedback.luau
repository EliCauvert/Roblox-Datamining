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
local var4 = motionModule.createState({
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

return reactModule.memo(function(p0)
	-- upvalues: motionModule (ref), var4 (ref), reactModule (ref), useAbuseReportAnalytics (ref), t (ref), telemetryEventType (ref), view (ref), feedbackAlert (ref), alertSeverity (ref)
	local var6 = motionModule.usePresence()
	local var7, var8 = motionModule.useMotion(var4)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef(var6.isPresent)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	reactModule.useEffect(function()
		-- upvalues: t (copy), p0 (ref), sendEvent (ref), telemetryEventType (copy)
		if not t[p0.severity] then
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "feedback missing correct severity, received type: " .. tostring(p0.severity)
				}
			})
		end
	end, { p0.severity, sendEvent })
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), var6 (ref)
		var10.current = var6.isPresent
	end, { var6.isPresent })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var9 (ref), var8 (ref), p0 (ref)
		if var6.isPresent then
			if var9.current > 0 then
				var8({
					groupTransparency = 0,
					position = UDim2.new(0, 0, 0, 1),
					sizeY = var9.current + 2 + (p0.bottomMargin or 0)
				})
				
				return
			end
		else
			var8({
				groupTransparency = 1,
				sizeY = 0,
				position = UDim2.new(0, 0, -0.5, 0)
			}, {
				onAnimationComplete = function(p1)
					-- upvalues: var6 (copy)
					if p1 == true then
						var6.onExitComplete()
					end
				end
			})
		end
	end, {
		var6.isPresent,
		var8,
		var6.onExitComplete,
		p0.bottomMargin
	})
	local maxWidth = p0.maxWidth
	
	return reactModule.createElement(view, {
		ClipsDescendants = true,
		Size = var7.sizeY:map(function(p2)
			-- upvalues: maxWidth (ref)
			return if maxWidth == nil then UDim2.new(1, 0, 0, p2) else UDim2.new(0, maxWidth, 0, p2)
		end),
		LayoutOrder = p0.layoutOrder
	}, {
		Content = reactModule.createElement("CanvasGroup", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			GroupTransparency = var7.groupTransparency,
			Position = var7.position,
			[reactModule.Change.AbsoluteSize] = reactModule.useCallback(function(p3)
				-- upvalues: var9 (ref), var10 (ref), var8 (ref), p0 (ref)
				local y = p3.AbsoluteSize.Y
				
				if y <= 0 or y == var9.current then return end
				var9.current = y
				
				if var10.current then
					var8({
						groupTransparency = 0,
						position = UDim2.new(0, 0, 0, 1),
						sizeY = y + 2 + (p0.bottomMargin or 0)
					})
				end
			end, { var8, p0.bottomMargin })
		}, {
			Padding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 1),
				PaddingBottom = UDim.new(0, 1),
				PaddingLeft = UDim.new(0, 1),
				PaddingRight = UDim.new(0, 1)
			}),
			Alert = reactModule.createElement(feedbackAlert, {
				severity = t[p0.severity] or alertSeverity.Info,
				title = p0.title,
				subtitle = p0.subtitle,
				onClose = p0.onClose
			})
		})
	})
end)