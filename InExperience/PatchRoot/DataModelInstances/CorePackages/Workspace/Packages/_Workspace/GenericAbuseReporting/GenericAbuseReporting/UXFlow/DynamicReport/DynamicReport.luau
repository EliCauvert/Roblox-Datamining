local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagAddThumbnailSelectorReport = sharedFlagsModule.FFlagAddThumbnailSelectorReport
local partialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local scrollView = foundationModule.ScrollView
local view = foundationModule.View
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local _ = require(genericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local beduiAnalyticsModule = require(genericAbuseReporting.Bedui.Utils.BeduiAnalytics)
local reportFlowHandlerModule = require(genericAbuseReporting.Bedui.ReportFlowHandler)
local useAnalyticsContextModule = require(genericAbuseReporting.Bedui.Provider.useAnalyticsContext)
local useOnScreenKeyboardHeightModule = require(genericAbuseReporting.Common.useOnScreenKeyboardHeight)
local useScrollbarOffsetModule = require(genericAbuseReporting.Common.useScrollbarOffset)
local sendAnalyticsEvent = beduiAnalyticsModule.sendAnalyticsEvent
local telemetryEventType = beduiAnalyticsModule.TelemetryEventType

return reactModule.memo(function(p0) --[[ line: 45 | named "DynamicReport" ]]
	-- upvalues: useLayerCollector (ref), reactModule (ref), useScrollbarOffsetModule (ref), useOnScreenKeyboardHeightModule (ref), useLocalization (ref), useAnalyticsContextModule (ref), useSelector (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), partialPageModal (ref), view (ref), scrollView (ref), fFlagAddThumbnailSelectorReport (ref), reportFlowHandlerModule (ref)
	local absoluteSize = useLayerCollector().absoluteSize
	local var10, var11 = reactModule.useBinding(Vector2.new(0, 0))
	local var12, var13 = reactModule.useState(Vector2.new(0, 0))
	local var14, var15 = reactModule.useState(Vector2.new(0, 0))
	local var16 = useScrollbarOffsetModule(var12, var14)
	local var17 = useOnScreenKeyboardHeightModule()
	local isKeyboardShowing = var17.isKeyboardShowing
	local onScreenKeyboardHeight = var17.onScreenKeyboardHeight
	local keyboardPositionY = var17.keyboardPositionY
	local var18 = useLocalization({ reportTitle = "Feature.ReportAbuse.Label.Report" })
	local var19 = useAnalyticsContextModule()
	local isReportSubmitted = var19.isReportSubmitted
	local var20 = useSelector(function(p1) --[[ line: 64 ]]
		return if p1.GlobalGuiInset then p1.GlobalGuiInset.top else 0
	end)
	local var21 = reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: isKeyboardShowing (ref), keyboardPositionY (ref), var20 (ref), absoluteSize (ref), onScreenKeyboardHeight (ref)
		if not isKeyboardShowing then
			return 0
		end
		local var23 = absoluteSize.Y - (keyboardPositionY - var20)
		
		return if var23 <= 0 then 0 else math.min(var23, onScreenKeyboardHeight)
	end, {
		isKeyboardShowing,
		keyboardPositionY,
		onScreenKeyboardHeight,
		absoluteSize.Y,
		var20
	})
	local var22 = reactModule.useMemo(function() --[[ line: 92 ]]
		-- upvalues: isKeyboardShowing (ref), var21 (ref)
		return if isKeyboardShowing then -var21 else 0
	end, { isKeyboardShowing, var21 })
	reactModule.useEffect(function() --[[ line: 100 ]]
		-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), p0 (ref)
		sendAnalyticsEvent({
			eventType = telemetryEventType.Rendered,
			context = { abuseVector = p0.abuseVector }
		})
	end, { sendAnalyticsEvent, p0.abuseVector })
	
	return reactModule.createElement(partialPageModal, {
		title = var18.reportTitle,
		screenSize = Vector2.new(absoluteSize.X, absoluteSize.Y),
		position = if isKeyboardShowing then UDim2.new(0.5, 0, 1, var22) else nil,
		anchorPoint = if isKeyboardShowing then Vector2.new(0.5, 1) else nil,
		onCloseClicked = reactModule.useCallback(function() --[[ line: 109 ]]
			-- upvalues: isReportSubmitted (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var19 (ref), p0 (ref)
			if not isReportSubmitted then
				sendAnalyticsEvent({
					eventType = telemetryEventType.Abandoned,
					context = var19
				})
			end
			p0.onClose()
		end, { isReportSubmitted, sendAnalyticsEvent, var19, p0.onClose })
	}, {
		View = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, {
			ScrollView = reactModule.createElement(scrollView, {
				Size = var10:map(function(p2) --[[ line: 130 ]]
					-- upvalues: absoluteSize (ref), var21 (ref)
					return UDim2.new(1, 0, 0, math.min(absoluteSize.Y - var21 - 100, math.ceil(p2.Y)))
				end),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					VerticalScrollBarInset = if fFlagAddThumbnailSelectorReport then Enum.ScrollBarInset.ScrollBar else nil
				},
				onAbsoluteCanvasSizeChanged = function(value) --[[ line: 146 ]]
					-- upvalues: var13 (ref)
					var13(value.AbsoluteCanvasSize)
				end,
				onAbsoluteWindowSizeChanged = function(value) --[[ line: 149 ]]
					-- upvalues: var15 (ref)
					var15(value.AbsoluteWindowSize)
				end
			}, {
				Content = reactModule.createElement(view, {
					tag = "auto-xy padding-x-xxsmall padding-top-medium",
					Size = if fFlagAddThumbnailSelectorReport then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -var16, 0, 0),
					onAbsoluteSizeChanged = function(value) --[[ line: 157 ]]
						-- upvalues: var11 (ref)
						var11(value.AbsoluteSize)
					end
				}, {
					ReportFlowHandler = reactModule.createElement(reportFlowHandlerModule, {
						targetId = p0.targetId,
						abuseVector = p0.abuseVector,
						onSubmit = p0.onSubmit,
						custom = p0.custom
					})
				})
			})
		})
	})
end)