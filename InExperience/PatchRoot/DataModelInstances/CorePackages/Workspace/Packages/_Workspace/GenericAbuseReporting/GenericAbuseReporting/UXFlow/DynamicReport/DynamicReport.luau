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

return reactModule.memo(function(p1)
	-- upvalues: useLayerCollector (ref), reactModule (ref), useScrollbarOffsetModule (ref), useOnScreenKeyboardHeightModule (ref), useLocalization (ref), useAnalyticsContextModule (ref), useSelector (ref), sendAnalyticsEvent (ref), telemetryEventType (ref), partialPageModal (ref), view (ref), scrollView (ref), fFlagAddThumbnailSelectorReport (ref), reportFlowHandlerModule (ref)
	local absoluteSize = useLayerCollector().absoluteSize
	local var1, var2 = reactModule.useBinding(Vector2.new(0, 0))
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	local var5, var6 = reactModule.useState(Vector2.new(0, 0))
	local var7 = useScrollbarOffsetModule(var3, var5)
	local var8 = useOnScreenKeyboardHeightModule()
	local isKeyboardShowing = var8.isKeyboardShowing
	local onScreenKeyboardHeight = var8.onScreenKeyboardHeight
	local keyboardPositionY = var8.keyboardPositionY
	local var9 = useLocalization({ reportTitle = "Feature.ReportAbuse.Label.Report" })
	local var10 = useAnalyticsContextModule()
	local isReportSubmitted = var10.isReportSubmitted
	local var11 = useSelector(function(p2)
		return if p2.GlobalGuiInset then p2.GlobalGuiInset.top else 0
	end)
	local var12 = reactModule.useMemo(function()
		-- upvalues: isKeyboardShowing (ref), keyboardPositionY (ref), var11 (ref), absoluteSize (ref), onScreenKeyboardHeight (ref)
		if not isKeyboardShowing then
			return 0
		end
		local var13 = absoluteSize.Y - (keyboardPositionY - var11)
		
		return if var13 <= 0 then 0 else math.min(var13, onScreenKeyboardHeight)
	end, {
		isKeyboardShowing,
		keyboardPositionY,
		onScreenKeyboardHeight,
		absoluteSize.Y,
		var11
	})
	local var13 = reactModule.useMemo(function()
		-- upvalues: isKeyboardShowing (ref), var12 (ref)
		return if isKeyboardShowing then -var12 else 0
	end, { isKeyboardShowing, var12 })
	reactModule.useEffect(function()
		-- upvalues: sendAnalyticsEvent (copy), telemetryEventType (copy), p1 (ref)
		sendAnalyticsEvent({
			eventType = telemetryEventType.Rendered,
			context = { abuseVector = p1.abuseVector }
		})
	end, { sendAnalyticsEvent, p1.abuseVector })
	
	return reactModule.createElement(partialPageModal, {
		title = var9.reportTitle,
		screenSize = Vector2.new(absoluteSize.X, absoluteSize.Y),
		position = if isKeyboardShowing then UDim2.new(0.5, 0, 1, var13) else nil,
		anchorPoint = if isKeyboardShowing then Vector2.new(0.5, 1) else nil,
		onCloseClicked = reactModule.useCallback(function()
			-- upvalues: isReportSubmitted (ref), sendAnalyticsEvent (copy), telemetryEventType (copy), var10 (ref), p1 (ref)
			if not isReportSubmitted then
				sendAnalyticsEvent({
					eventType = telemetryEventType.Abandoned,
					context = var10
				})
			end
			p1.onClose()
		end, { isReportSubmitted, sendAnalyticsEvent, var10, p1.onClose })
	}, {
		View = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, {
			ScrollView = reactModule.createElement(scrollView, {
				Size = var1:map(function(p2)
					-- upvalues: absoluteSize (ref), var12 (ref)
					return UDim2.new(1, 0, 0, math.min(absoluteSize.Y - var12 - 100, math.ceil(p2.Y)))
				end),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					VerticalScrollBarInset = if fFlagAddThumbnailSelectorReport then Enum.ScrollBarInset.ScrollBar else nil
				},
				onAbsoluteCanvasSizeChanged = function(value)
					-- upvalues: var4 (ref)
					var4(value.AbsoluteCanvasSize)
				end,
				onAbsoluteWindowSizeChanged = function(value)
					-- upvalues: var6 (ref)
					var6(value.AbsoluteWindowSize)
				end
			}, {
				Content = reactModule.createElement(view, {
					tag = "auto-xy padding-x-xxsmall padding-top-medium",
					Size = if fFlagAddThumbnailSelectorReport then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -var7, 0, 0),
					onAbsoluteSizeChanged = function(value)
						-- upvalues: var2 (ref)
						var2(value.AbsoluteSize)
					end
				}, {
					ReportFlowHandler = reactModule.createElement(reportFlowHandlerModule, {
						targetId = p1.targetId,
						abuseVector = p1.abuseVector,
						onSubmit = p1.onSubmit,
						custom = p1.custom
					})
				})
			})
		})
	})
end)