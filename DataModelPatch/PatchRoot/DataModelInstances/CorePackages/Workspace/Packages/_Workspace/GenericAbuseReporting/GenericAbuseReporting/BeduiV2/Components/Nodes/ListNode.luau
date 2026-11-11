local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local ListModule = require(GenericAbuseReporting.Common.List)
local ScrollToItemModule = require(GenericAbuseReporting.BeduiV2.Utils.scrollToItem)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local TelemetryEventType = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService).TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagSupportSubmissionOnAllReportNodes = SharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes
local FFlagRemoveHardcodedStringsInReportNodes = SharedFlagsModule.FFlagRemoveHardcodedStringsInReportNodes

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseArTranslationFunction (copy), UseAbuseReportAnalyticsFunction (copy), UseLayoutSlotsFunction (copy), ScrollToItemModule (copy), DashModule (copy), TelemetryEventType (copy), EyebrowModule (copy), View (copy), ListModule (copy), Button (copy), FFlagRemoveHardcodedStringsInReportNodes (copy), ButtonVariant (copy), FillBehavior (copy), FFlagSupportSubmissionOnAllReportNodes (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialValue or nil)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	local Body = UseLayoutSlotsResult.Body
	local Actions = UseLayoutSlotsResult.Actions
	local Title = UseLayoutSlotsResult.Title
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local ScrollingFrame = Current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if not ScrollingFrame then return end
		local function checkScrollbar()
			-- upvalues: ScrollingFrame (copy), UseStateResult2_1 (upval)
			UseStateResult2_1(ScrollingFrame.AbsoluteWindowSize.Y < ScrollingFrame.AbsoluteCanvasSize.Y)
		end
		
		local function onScroll()
			-- upvalues: ScrollingFrame (copy), UseStateResult2_2 (upval)
			if ScrollingFrame.CanvasPosition.Y > 0 then
				UseStateResult2_2(true)
			end
		end
		
		UseStateResult2_1(ScrollingFrame.AbsoluteWindowSize.Y < ScrollingFrame.AbsoluteCanvasSize.Y)
		local Connection = ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
		local Connection1 = ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
		local Connection2 = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, {})
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult2 (copy), UseRefResult1 (copy), ScrollToItemModule (upval), UseRefResult (copy)
		if UseStateResult then
			UseRefResult2.current = UseRefResult1.current[UseStateResult]
			ScrollToItemModule(UseRefResult, UseRefResult2)
			
			return
		else
			UseRefResult2.current = nil
		end
	end, { UseStateResult })
	local UseResult = ReactModule.useCallback(function(Id)
		-- upvalues: UseStateResult2 (copy), DashModule (upval), p1 (copy), SendEventFunction (copy), TelemetryEventType (upval), UseStateResult1 (copy), UseStateResult3 (copy)
		UseStateResult2(Id)
		local Selected_index = 0
		DashModule.forEach(p1.items, function(p2, p3)
			-- upvalues: Id (copy), Selected_index (ref)
			if p2.id == Id then
				Selected_index = p3
				
				return
			end
		end)
		SendEventFunction({
			sub_event_type = TelemetryEventType.SelectItem,
			select_item_detail = {
				selected_index = Selected_index,
				list_length = #p1.items,
				has_scroll = UseStateResult1,
				did_scroll = UseStateResult3
			}
		})
	end, {
		SendEventFunction,
		UseStateResult1,
		UseStateResult3,
		p1.items
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: DashModule (upval), p1 (copy), UseStateResult (copy)
		local FindResult = DashModule.find(p1.items, function(p2): boolean
			-- upvalues: UseStateResult (upval)
			return p2.id == UseStateResult
		end)
		
		if p1.onNext then
			p1.onNext(UseStateResult, FindResult)
		end
	end, { p1.items, p1.onNext, UseStateResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = if p1.items == nil then nil else ReactModule.createElement(Body, { ref = UseRefResult }, {
			Eyebrow = ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = ReactModule.createElement(Title, { layoutOrder = 1, input = p1.title }),
			ItemListContainer = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, -UseTokensResult.Padding.XLarge),
					PaddingRight = UDim.new(0, -UseTokensResult.Padding.XLarge)
				}),
				ItemList = ReactModule.createElement(ListModule.Root, { value = UseStateResult, onValueChanged = UseResult }, {
					DashModule.map(p1.items, function(p2, CountItems)
						-- upvalues: ReactModule (upval), ListModule (upval), TranslateIntoStringFunction (copy), p1 (copy), UseRefResult1 (copy)
						return ReactModule.createElement(ListModule.Item, {
							trailingAccessory = "Radio",
							hasMargin = true,
							value = p2.id,
							title = TranslateIntoStringFunction(p2.label),
							description = if p2.description then TranslateIntoStringFunction(p2.description) else nil,
							hasDivider = CountItems ~= #p1.items,
							ref = function(p3)
								-- upvalues: UseRefResult1 (upval), p2 (copy)
								UseRefResult1.current[p2.id] = p3
							end
						})
					end)
				})
			})
		}),
		Actions = if p1.onNext and UseStateResult ~= nil then ReactModule.createElement(Actions, nil, {
			Button = ReactModule.createElement(Button, {
				text = if FFlagRemoveHardcodedStringsInReportNodes then TranslateIntoStringFunction(p1.nextButtonText) elseif p1.nextButtonText then TranslateIntoStringFunction(p1.nextButtonText) else "Continue",
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				isLoading = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
				isDisabled = if FFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
				onActivated = UseResult1
			})
		}) else nil
	})
end)