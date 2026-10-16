local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local FocusBehaviorsModule = require(Parent.FocusBehaviors)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Empty = FoundationModule.Empty
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconName = FoundationModule.Enums.IconName
local List = FoundationModule.List
local ListItemInputType = FoundationModule.Enums.ListItemInputType
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local EyebrowModule = require(GenericAbuseReporting.BeduiV2.Components.Eyebrow)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local ScrollToItemModule = require(GenericAbuseReporting.BeduiV2.Utils.scrollToItem)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseListLoaderFunction = require(GenericAbuseReporting.BeduiV2.Loaders.useLoader).useListLoader
local FormatErrorDetailForAnalyticsFunction = AnalyticsServiceModule.formatErrorDetailForAnalytics
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FFlagAbuseReportInExpPlayerListV3 = require(Parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local FFlagAbuseReportListNodeFullBleedModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportListNodeFullBleed)
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local config = {
	chevron = nil,
	radio = ListItemInputType.Radio,
	toggle = ListItemInputType.Toggle,
	checkbox = ListItemInputType.Checkbox
}

local function ListNodeLoading(p1) --[[ Line: 77 ]]
	-- upvalues: ReactModule (copy), EyebrowModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local Eyebrow = p1.eyebrow
	local Tokens = p1.tokens
	
	return ReactModule.createElement(p1.layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, {
			Eyebrow = Eyebrow and ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = Eyebrow }),
			Title = ReactModule.createElement(p1.titleSlot, { layoutOrder = 1, input = p1.title }),
			SkeletonContainer = ReactModule.createElement(View, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				Skeleton1 = ReactModule.createElement(Skeleton, {
					radius = Radius.Medium,
					Size = UDim2.new(1, 0, 0, Tokens.Size.Size_600)
				}),
				Skeleton2 = ReactModule.createElement(Skeleton, {
					radius = Radius.Medium,
					Size = UDim2.new(1, 0, 0, Tokens.Size.Size_600)
				}),
				Skeleton3 = ReactModule.createElement(Skeleton, {
					radius = Radius.Medium,
					Size = UDim2.new(1, 0, 0, Tokens.Size.Size_600)
				}),
				Skeleton4 = ReactModule.createElement(Skeleton, {
					radius = Radius.Medium,
					Size = UDim2.new(1, 0, 0, Tokens.Size.Size_600)
				}),
				Skeleton5 = ReactModule.createElement(Skeleton, {
					radius = Radius.Medium,
					Size = UDim2.new(1, 0, 0, Tokens.Size.Size_600)
				})
			})
		})
	})
end

local function ListNodeError(p1) --[[ Line: 126 ]]
	-- upvalues: UseArTranslationFunction (copy), ReactModule (copy), EyebrowModule (copy), TextWithTranslationModule (copy), Button (copy), ButtonVariant (copy), FoundationModule (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	
	return ReactModule.createElement(p1.layout, {
		body = ReactModule.createElement(ReactModule.Fragment, nil, {
			Eyebrow = p1.eyebrow and ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = ReactModule.createElement(p1.titleSlot, { layoutOrder = 1, input = p1.title }),
			ErrorText = ReactModule.createElement(TextWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = TranslateIntoStringFunction(p1.errorText)
			}),
			RetryButton = ReactModule.createElement(Button, {
				LayoutOrder = 3,
				text = TranslateIntoStringFunction(p1.retryButtonText),
				variant = ButtonVariant.Standard,
				fillBehavior = FoundationModule.Enums.FillBehavior.Fit,
				onActivated = p1.retry
			})
		})
	})
end

return ReactModule.memo(function(p1) --[[ Line: 167 | Named "ListNode" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseArTranslationFunction (copy), UseAbuseReportAnalyticsFunction (copy), UseListLoaderFunction (copy), UseLayoutSlotsFunction (copy), FFlagAbuseReportListNodeFullBleedModule (copy), ReactFocusNavigationModule (copy), FocusBehaviorsModule (copy), ScrollToItemModule (copy), TelemetryEventType (copy), FFlagAbuseReportImproveErrorEventsModule (copy), FormatErrorDetailForAnalyticsFunction (copy), DashModule (copy), ListNodeLoading (copy), ListNodeError (copy), Empty (copy), EyebrowModule (copy), View (copy), List (copy), FFlagAbuseReportInExpPlayerListV3 (copy), IconName (copy), config (copy), FooterModule (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialValue or nil)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseRefResult2 = ReactModule.useRef(false)
	local UseListLoaderResult = UseListLoaderFunction(p1.items)
	local Loading = UseListLoaderResult.loading
	local Error = UseListLoaderResult.error
	local Retry = UseListLoaderResult.retry
	local Data = UseListLoaderResult.data
	local UseLayoutSlotsResult = UseLayoutSlotsFunction()
	local Layout = UseLayoutSlotsResult.Layout
	local ContentInset = UseLayoutSlotsResult.ContentInset
	local IsContentFullBleed: boolean = FFlagAbuseReportListNodeFullBleedModule and (Data ~= nil and #Data > 0)
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	local UseRefResult3 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 193 ]]
		-- upvalues: UseRefResult (copy), UseContextResult (copy), Data (copy), FocusBehaviorsModule (upval), UseRefResult3 (copy)
		local Current = UseRefResult.current
		
		if not Current or not UseContextResult then return end
		if not Data or #Data == 0 then return end
		local MostRecentOrDefaultResult = FocusBehaviorsModule.mostRecentOrDefault(UseRefResult3.current)
		UseContextResult:registerFocusBehavior(Current, MostRecentOrDefaultResult)
		
		return function() --[[ Line: 205 ]]
			-- upvalues: UseContextResult (upval), Current (copy), MostRecentOrDefaultResult (copy)
			UseContextResult:deregisterFocusBehavior(Current, MostRecentOrDefaultResult)
		end
	end, { UseContextResult, Data, UseRefResult3 })
	ReactModule.useEffect(function() --[[ Line: 211 ]]
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local Current = UseRefResult.current
		
		if not Current then return end
		local ScrollingFrame = Current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if not ScrollingFrame then return end
		local function checkScrollbar() --[[ Line: 224 ]]
			-- upvalues: ScrollingFrame (copy), UseStateResult2_1 (upval)
			UseStateResult2_1(ScrollingFrame.AbsoluteWindowSize.Y < ScrollingFrame.AbsoluteCanvasSize.Y)
		end
		
		local function onScroll() --[[ Line: 229 ]]
			-- upvalues: ScrollingFrame (copy), UseStateResult2_2 (upval)
			if ScrollingFrame.CanvasPosition.Y > 0 then
				UseStateResult2_2(true)
			end
		end
		
		UseStateResult2_1(ScrollingFrame.AbsoluteWindowSize.Y < ScrollingFrame.AbsoluteCanvasSize.Y)
		local Connection = ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
		local Connection1 = ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
		local Connection2 = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
		
		return function() --[[ Line: 242 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, { Loading })
	local UseRefResult4 = ReactModule.useRef({})
	local UseRefResult5 = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 252 ]]
		-- upvalues: UseStateResult (copy), UseRefResult5 (copy), UseRefResult4 (copy), ScrollToItemModule (upval), UseRefResult (copy)
		if UseStateResult then
			UseRefResult5.current = UseRefResult4.current[UseStateResult]
			ScrollToItemModule(UseRefResult, UseRefResult5)
			
			return
		else
			UseRefResult5.current = nil
		end
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 261 ]]
		-- upvalues: Error (copy), UseRefResult1 (copy), SendEventFunction (copy), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval)
		if Error and not UseRefResult1.current then
			UseRefResult1.current = true
			SendEventFunction({
				sub_event_type = TelemetryEventType.Error,
				error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("list: async load failed", Error) else { error_message = "list: async load failed: " .. Error }
			})
		end
	end, { Error, SendEventFunction })
	ReactModule.useEffect(function() --[[ Line: 273 ]]
		-- upvalues: Loading (copy), Error (copy), Data (copy), UseRefResult2 (copy), SendEventFunction (copy), TelemetryEventType (upval)
		if not Loading and not Error and (Data == nil or #Data == 0) and not UseRefResult2.current then
			UseRefResult2.current = true
			SendEventFunction({ sub_event_type = TelemetryEventType.EmptyState })
		end
	end, { Loading, Error, Data, SendEventFunction })
	local Variant = p1.variant or "radio"
	local IsChevron = Variant == "chevron"
	local UseResult = ReactModule.useCallback(function(Selected_index, Selected_id) --[[ Line: 290 ]]
		-- upvalues: Data (copy), SendEventFunction (copy), TelemetryEventType (upval), UseStateResult1 (copy), UseStateResult3 (copy)
		if Data then
			SendEventFunction({
				sub_event_type = TelemetryEventType.SelectItem,
				select_item_detail = {
					selected_index = Selected_index,
					selected_id = Selected_id,
					list_length = #Data,
					has_scroll = UseStateResult1,
					did_scroll = UseStateResult3
				}
			})
			
			return
		end
	end, {
		SendEventFunction,
		UseStateResult1,
		UseStateResult3,
		Data
	})
	local UseResult1 = ReactModule.useCallback(function(Id) --[[ Line: 306 ]]
		-- upvalues: Data (copy), UseStateResult2 (copy), DashModule (upval), UseResult (copy)
		if Data then
			UseStateResult2(Id)
			local v1 = 0
			DashModule.forEach(Data, function(p2, p3) --[[ Line: 313 ]]
				-- upvalues: Id (copy), v1 (ref)
				if p2.id == Id then
					v1 = p3
					
					return
				end
			end)
			UseResult(v1, Id)
			
			return
		end
	end, { UseResult, Data })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 322 ]]
		-- upvalues: Data (copy), DashModule (upval), UseStateResult (copy), p1 (copy)
		if not Data then return end
		local FindResult = DashModule.find(Data, function(p2): boolean --[[ Line: 327 ]]
			-- upvalues: UseStateResult (upval)
			return p2.id == UseStateResult
		end)
		
		if p1.onNext then
			p1.onNext(UseStateResult, FindResult)
		end
	end, { Data, p1.onNext, UseStateResult })
	local Title = UseLayoutSlotsResult.Title
	
	return if Loading then ReactModule.createElement(ListNodeLoading, {
		layout = Layout,
		titleSlot = Title,
		title = p1.title,
		eyebrow = p1.eyebrow,
		tokens = UseTokensResult
	}) elseif Error then ReactModule.createElement(ListNodeError, {
		layout = Layout,
		titleSlot = Title,
		title = p1.title,
		eyebrow = p1.eyebrow,
		errorText = p1.errorText,
		retryButtonText = p1.retryButtonText,
		tokens = UseTokensResult,
		retry = Retry
	}) else ReactModule.createElement(Layout, {
		ref = UseRefResult,
		body = ReactModule.createElement(ReactModule.Fragment, nil, if Data == nil or #Data == 0 then {
			Empty = ReactModule.createElement(Empty, {
				text = if p1.emptyText then TranslateIntoStringFunction(p1.emptyText) else nil
			})
		} else {
			Eyebrow = if FFlagAbuseReportListNodeFullBleedModule then nil else ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = if FFlagAbuseReportListNodeFullBleedModule then nil else ReactModule.createElement(Title, {
				layoutOrder = 1,
				input = p1.title,
				subtitle = p1.subtitle
			}),
			Header = if FFlagAbuseReportListNodeFullBleedModule then ReactModule.createElement(ContentInset, { layoutOrder = 0 }, {
				Eyebrow = p1.eyebrow and ReactModule.createElement(EyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
				Title = ReactModule.createElement(Title, {
					layoutOrder = 1,
					input = p1.title,
					subtitle = p1.subtitle
				})
			}) else nil,
			ItemListContainer = ReactModule.createElement(View, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
				ItemList = ReactModule.createElement(List.Root, {
					hasDivider = { hasDivider = true, isInset = false },
					isContained = { isContained = false, hasMargin = true }
				}, {
					DashModule.map(Data, function(p2, LayoutOrder) --[[ Line: 411 ]]
						-- upvalues: FFlagAbuseReportInExpPlayerListV3 (upval), p1 (copy), ReactModule (upval), List (upval), IconName (upval), TranslateIntoStringFunction (copy), IsChevron (copy), UseResult (copy), UseResult1 (copy), config (upval), Variant (copy), UseStateResult (copy), UseRefResult4 (copy), UseRefResult3 (copy)
						return ReactModule.createElement(List.Item, {
							leading = if type(p2.leading) == "string" then IconName[p2.leading] else p2.leading,
							title = TranslateIntoStringFunction(p2.label),
							description = if p2.description then TranslateIntoStringFunction(p2.description) else nil,
							trailing = if FFlagAbuseReportInExpPlayerListV3 and p1.renderTrailingAccessory then p1.renderTrailingAccessory(p2) else nil,
							onActivated = {
								onActivated = if IsChevron then function() --[[ Line: 425 ]]
									-- upvalues: UseResult (upval), LayoutOrder (copy), p2 (copy), p1 (upval)
									UseResult(LayoutOrder, p2.id)
									
									if p1.onNext then
										p1.onNext(p2.id, p2)
									end
								end else function() --[[ Line: 431 ]]
									-- upvalues: UseResult1 (upval), p2 (copy)
									UseResult1(p2.id)
								end,
								inputType = config[Variant],
								isChecked = UseStateResult == p2.id
							},
							LayoutOrder = LayoutOrder,
							ref = function(Current) --[[ Line: 438 ]]
								-- upvalues: UseRefResult4 (upval), p2 (copy), LayoutOrder (copy), UseRefResult3 (upval)
								UseRefResult4.current[p2.id] = Current
								
								if LayoutOrder == 1 then
									UseRefResult3.current = Current
								end
							end
						})
					end)
				})
			}),
			Footer = if FFlagAbuseReportListNodeFullBleedModule then p1.footerItems and ReactModule.createElement(ContentInset, { layoutOrder = 3 }, ReactModule.createElement(FooterModule, {
				additionalTag = "padding-top-medium",
				footerItems = p1.footerItems
			})) else p1.footerItems and ReactModule.createElement(FooterModule, {
				additionalTag = "padding-top-medium",
				layoutOrder = 3,
				footerItems = p1.footerItems
			})
		}),
		actions = if p1.onNext and not IsChevron and UseStateResult ~= nil then ReactModule.createElement(Button, {
			text = TranslateIntoStringFunction(p1.nextButtonText),
			variant = ButtonVariant.Emphasis,
			fillBehavior = FillBehavior.Fill,
			isLoading = p1.isSubmitting,
			isDisabled = p1.isSubmitting,
			onActivated = UseResult2
		}) else nil,
		isContentFullBleed = IsContentFullBleed
	})
end)