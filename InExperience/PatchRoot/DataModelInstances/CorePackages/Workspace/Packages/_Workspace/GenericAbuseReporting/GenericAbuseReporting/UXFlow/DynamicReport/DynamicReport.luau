local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport
local PartialPageModal = UIBloxModule.App.Dialog.Modal.PartialPageModal
local ScrollView = FoundationModule.ScrollView
local View = FoundationModule.View
local UseLayerCollectorFunction = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local _ = require(GenericAbuseReporting.Bedui.Provider.AbuseReportBeduiTypes)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local BeduiAnalyticsModule = require(GenericAbuseReporting.Bedui.Utils.BeduiAnalytics)
local ReportFlowHandlerModule = require(GenericAbuseReporting.Bedui.ReportFlowHandler)
local UseAnalyticsContextModule = require(GenericAbuseReporting.Bedui.Provider.useAnalyticsContext)
local UseOnScreenKeyboardHeightModule = require(GenericAbuseReporting.Common.useOnScreenKeyboardHeight)
local UseScrollbarOffsetModule = require(GenericAbuseReporting.Common.useScrollbarOffset)
local SendAnalyticsEventFunction = BeduiAnalyticsModule.sendAnalyticsEvent
local TelemetryEventType = BeduiAnalyticsModule.TelemetryEventType

return ReactModule.memo(function(p1) --[[ Line: 45 | Named "DynamicReport" ]]
	-- upvalues: UseLayerCollectorFunction (copy), ReactModule (copy), UseScrollbarOffsetModule (copy), UseOnScreenKeyboardHeightModule (copy), UseLocalizationFunction (copy), UseAnalyticsContextModule (copy), UseSelectorFunction (copy), SendAnalyticsEventFunction (copy), TelemetryEventType (copy), PartialPageModal (copy), View (copy), ScrollView (copy), FFlagAddThumbnailSelectorReport (copy), ReportFlowHandlerModule (copy)
	local AbsoluteSize = UseLayerCollectorFunction().absoluteSize
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseScrollbarOffsetModuleResult = UseScrollbarOffsetModule(UseStateResult, UseStateResult1)
	local UseOnScreenKeyboardHeightModuleResult = UseOnScreenKeyboardHeightModule()
	local IsKeyboardShowing = UseOnScreenKeyboardHeightModuleResult.isKeyboardShowing
	local OnScreenKeyboardHeight = UseOnScreenKeyboardHeightModuleResult.onScreenKeyboardHeight
	local KeyboardPositionY = UseOnScreenKeyboardHeightModuleResult.keyboardPositionY
	local UseLocalizationResult = UseLocalizationFunction({ reportTitle = "Feature.ReportAbuse.Label.Report" })
	local UseAnalyticsContextModuleResult = UseAnalyticsContextModule()
	local IsReportSubmitted = UseAnalyticsContextModuleResult.isReportSubmitted
	local UseSelectorResult = UseSelectorFunction(function(p2) --[[ Line: 64 ]]
		return if p2.GlobalGuiInset then p2.GlobalGuiInset.top else 0
	end)
	local UseMemoResult = ReactModule.useMemo(function(): number --[[ Line: 69 ]]
		-- upvalues: IsKeyboardShowing (copy), KeyboardPositionY (copy), UseSelectorResult (copy), AbsoluteSize (copy), OnScreenKeyboardHeight (copy)
		if IsKeyboardShowing then
			local YDelta = AbsoluteSize.Y - (KeyboardPositionY - UseSelectorResult)
			
			return if YDelta <= 0 then 0 else math.min(YDelta, OnScreenKeyboardHeight)
		else
			return 0
		end
	end, {
		IsKeyboardShowing,
		KeyboardPositionY,
		OnScreenKeyboardHeight,
		AbsoluteSize.Y,
		UseSelectorResult
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 92 ]]
		-- upvalues: IsKeyboardShowing (copy), UseMemoResult (copy)
		return if IsKeyboardShowing then -UseMemoResult else 0
	end, { IsKeyboardShowing, UseMemoResult })
	ReactModule.useEffect(function() --[[ Line: 100 ]]
		-- upvalues: SendAnalyticsEventFunction (upval), TelemetryEventType (upval), p1 (copy)
		SendAnalyticsEventFunction({
			eventType = TelemetryEventType.Rendered,
			context = { abuseVector = p1.abuseVector }
		})
	end, { SendAnalyticsEventFunction, p1.abuseVector })
	
	return ReactModule.createElement(PartialPageModal, {
		title = UseLocalizationResult.reportTitle,
		screenSize = Vector2.new(AbsoluteSize.X, AbsoluteSize.Y),
		position = if IsKeyboardShowing then UDim2.new(0.5, 0, 1, UseMemoResult1) else nil,
		anchorPoint = if IsKeyboardShowing then Vector2.new(0.5, 1) else nil,
		onCloseClicked = ReactModule.useCallback(function() --[[ Line: 109 ]]
			-- upvalues: IsReportSubmitted (copy), SendAnalyticsEventFunction (upval), TelemetryEventType (upval), UseAnalyticsContextModuleResult (copy), p1 (copy)
			if not IsReportSubmitted then
				SendAnalyticsEventFunction({
					eventType = TelemetryEventType.Abandoned,
					context = UseAnalyticsContextModuleResult
				})
			end
			p1.onClose()
		end, {
			IsReportSubmitted,
			SendAnalyticsEventFunction,
			UseAnalyticsContextModuleResult,
			p1.onClose
		})
	}, {
		View = ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, {
			ScrollView = ReactModule.createElement(ScrollView, {
				Size = UseBindingResult:map(function(p2): UDim2 --[[ Line: 130 ]]
					-- upvalues: AbsoluteSize (copy), UseMemoResult (copy)
					return UDim2.new(1, 0, 0, (math.min(AbsoluteSize.Y - UseMemoResult - 100, (math.ceil(p2.Y)))))
				end),
				scroll = {
					AutomaticCanvasSize = Enum.AutomaticSize.Y,
					CanvasSize = UDim2.new(1, 0, 0, 0),
					ScrollingDirection = Enum.ScrollingDirection.Y,
					VerticalScrollBarInset = if FFlagAddThumbnailSelectorReport then Enum.ScrollBarInset.ScrollBar else nil
				},
				onAbsoluteCanvasSizeChanged = function(ScrollFrame) --[[ Line: 146 ]]
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(ScrollFrame.AbsoluteCanvasSize)
				end,
				onAbsoluteWindowSizeChanged = function(p2) --[[ Line: 149 ]]
					-- upvalues: UseStateResult2_1 (copy)
					UseStateResult2_1(p2.AbsoluteWindowSize)
				end
			}, {
				Content = ReactModule.createElement(View, {
					tag = "auto-xy padding-x-xxsmall padding-top-medium",
					Size = if FFlagAddThumbnailSelectorReport then UDim2.new(0, 0, 0, 0) else UDim2.new(0, -UseScrollbarOffsetModuleResult, 0, 0),
					onAbsoluteSizeChanged = function(Frame) --[[ Line: 157 ]]
						-- upvalues: UseBindingResult2 (copy)
						UseBindingResult2(Frame.AbsoluteSize)
					end
				}, {
					ReportFlowHandler = ReactModule.createElement(ReportFlowHandlerModule, {
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