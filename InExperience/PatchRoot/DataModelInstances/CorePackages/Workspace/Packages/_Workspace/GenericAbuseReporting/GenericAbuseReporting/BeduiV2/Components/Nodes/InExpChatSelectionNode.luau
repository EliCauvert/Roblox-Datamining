local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FFlagAbuseReportImproveErrorEventsModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportImproveErrorEvents)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FocusNavigableSurfaceIdentifierEnum = require(Parent.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum
local DialogSize = FoundationModule.Enums.DialogSize
local FillBehavior = FoundationModule.Enums.FillBehavior
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local List = FoundationModule.List
local ListItemInputType = FoundationModule.Enums.ListItemInputType
local Radius = FoundationModule.Enums.Radius
local Sheet = FoundationModule.Sheet
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local UseInExpFocusNavigationRefsModule = require(GenericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useInExpFocusNavigationRefs)
local _ = require(GenericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local AnalyticsServiceModule = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local FooterModule = require(GenericAbuseReporting.BeduiV2.Components.Footer)
local InExpDropdownWithPopoverModule = require(GenericAbuseReporting.BeduiV2.Components.InExpDropdownWithPopover)
local ScrollToItemModule = require(GenericAbuseReporting.BeduiV2.Utils.scrollToItem)
local TextWithTranslationModule = require(GenericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(GenericAbuseReporting.BeduiV2.Utils.Translate.translate)
local UseArTranslationFunction = require(GenericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local UseGroupedListLoaderFunction = require(GenericAbuseReporting.BeduiV2.Loaders.useLoader).useGroupedListLoader
local FormatErrorDetailForAnalyticsFunction = AnalyticsServiceModule.formatErrorDetailForAnalytics
local TelemetryEventType = AnalyticsServiceModule.TelemetryEventType
local UseAbuseReportAnalyticsFunction = require(GenericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext).useAbuseReportAnalytics
local UseLayoutSlotsFunction = require(GenericAbuseReporting.BeduiV2.Components.LayoutSlots).useLayoutSlots
local FixChatSelectorDropdownPadding = game:DefineFastFlag("FixChatSelectorDropdownPadding", false)

local function _(Id, p1)
	-- upvalues: ReactModule (copy), ScrollToItemModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: Id (copy), p1 (copy), ScrollToItemModule (upval)
		if not Id then return end
		local CurrentEntry = p1.current[Id]
		
		if not CurrentEntry then return end
		local ScrollingFrame = CurrentEntry:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not ScrollingFrame then return end
		local Flag = false
		local config = { current = ScrollingFrame.Parent }
		local config1 = { current = CurrentEntry }
		
		local function _()
			-- upvalues: Flag (ref), ScrollToItemModule (upval), config (copy), config1 (copy)
			if not Flag then
				ScrollToItemModule(config, config1)
				
				return
			end
		end
		
		if CurrentEntry.AbsoluteSize.Y > 0 then
			if not Flag then
				ScrollToItemModule(config, config1)
			end
		else
			local Connection = nil
			Connection = CurrentEntry:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: CurrentEntry (copy), Connection (ref), Flag (ref), ScrollToItemModule (upval), config (copy), config1 (copy)
				if CurrentEntry.AbsoluteSize.Y > 0 then
					Connection:Disconnect()
					
					if Flag then return end
					ScrollToItemModule(config, config1)
				end
			end)
			task.delay(2, function()
				-- upvalues: Connection (ref)
				if Connection.Connected then
					Connection:Disconnect()
				end
			end)
		end
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Id })
end

local REPORTMESSAGENOTSHOWNITEMID = require(GenericAbuseReporting.BeduiV2.Hooks.useInExpCustomSubmit).REPORT_MESSAGE_NOT_SHOWN_ITEM_ID

local function LoadingContent()
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), Sheet (copy), View (copy), DashModule (copy), Skeleton (copy), Radius (copy)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Sheet.Content, nil, {
		SkeletonContainer = ReactModule.createElement(View, { tag = "col gap-medium size-full-0 auto-y" }, DashModule.map(table.create(5, true), function(_, p1)
			-- upvalues: ReactModule (upval), Skeleton (upval), Radius (upval), UseTokensResult (copy)
			return ReactModule.createElement(Skeleton, {
				key = tostring(p1),
				radius = Radius.Medium,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_800)
			})
		end))
	})
end

local function ErrorContent(p1)
	-- upvalues: UseArTranslationFunction (copy), ReactModule (copy), Sheet (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	
	return ReactModule.createElement(Sheet.Content, nil, {
		ErrorContainer = ReactModule.createElement(View, {
			tag = "align-x-center align-y-center gap-medium size-full"
		}, {
			ErrorText = ReactModule.createElement(Text, {
				RichText = true,
				tag = "auto-xy text-body-medium text-wrap text-align-x-left",
				Text = TranslateIntoStringFunction(p1.errorText)
			}),
			RetryButton = ReactModule.createElement(Button, {
				text = TranslateIntoStringFunction(p1.retryButtonText),
				variant = ButtonVariant.Standard,
				fillBehavior = FillBehavior.Fit,
				onActivated = p1.retry or function() end
			})
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), UseArTranslationFunction (copy), UseAbuseReportAnalyticsFunction (copy), UseLayoutSlotsFunction (copy), UseGroupedListLoaderFunction (copy), ScrollToItemModule (copy), TelemetryEventType (copy), FFlagAbuseReportImproveErrorEventsModule (copy), FormatErrorDetailForAnalyticsFunction (copy), DashModule (copy), REPORTMESSAGENOTSHOWNITEMID (copy), UseInExpFocusNavigationRefsModule (copy), FocusNavigableSurfaceIdentifierEnum (copy), LoadingContent (copy), ErrorContent (copy), Sheet (copy), View (copy), TextWithTranslationModule (copy), Text (copy), FixChatSelectorDropdownPadding (copy), InExpDropdownWithPopoverModule (copy), List (copy), Icon (copy), IconName (copy), IconVariant (copy), ListItemInputType (copy), FooterModule (copy), DialogSize (copy), Button (copy), ButtonVariant (copy), FillBehavior (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialValue or nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local TranslateIntoStringFunction = UseArTranslationFunction().translateIntoString
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef(false)
	local SendEventFunction = UseAbuseReportAnalyticsFunction().sendEvent
	local UseRefResult3 = ReactModule.useRef(false)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(false)
	local Layout = UseLayoutSlotsFunction().Layout
	local UseGroupedListLoaderResult = UseGroupedListLoaderFunction(p1.items)
	local Data = UseGroupedListLoaderResult.data or {}
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseRefResult1 (copy), ScrollToItemModule (upval)
		if not UseStateResult then return end
		local CurrentEntry = UseRefResult1.current[UseStateResult]
		
		if not CurrentEntry then return end
		local ScrollingFrame = CurrentEntry:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not ScrollingFrame then return end
		local Flag = false
		local config = { current = ScrollingFrame.Parent }
		local config1 = { current = CurrentEntry }
		
		local function _()
			-- upvalues: Flag (ref), ScrollToItemModule (upval), config (copy), config1 (copy)
			if not Flag then
				ScrollToItemModule(config, config1)
				
				return
			end
		end
		
		if CurrentEntry.AbsoluteSize.Y > 0 then
			if not Flag then
				ScrollToItemModule(config, config1)
			end
		else
			local Connection = nil
			Connection = CurrentEntry:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: CurrentEntry (copy), Connection (ref), Flag (ref), ScrollToItemModule (upval), config (copy), config1 (copy)
				if CurrentEntry.AbsoluteSize.Y > 0 then
					Connection:Disconnect()
					
					if Flag then return end
					ScrollToItemModule(config, config1)
				end
			end)
			task.delay(2, function()
				-- upvalues: Connection (ref)
				if Connection.Connected then
					Connection:Disconnect()
				end
			end)
		end
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult5 (copy), UseRefResult3 (copy), UseRefResult4 (copy)
		local Current = UseRefResult5.current
		
		if not Current then return end
		local ScrollingFrame = Current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if not ScrollingFrame then return end
		local function checkScrollbar()
			-- upvalues: UseRefResult3 (upval), ScrollingFrame (copy)
			UseRefResult3.current = ScrollingFrame.AbsoluteWindowSize.Y < ScrollingFrame.AbsoluteCanvasSize.Y
		end
		
		local function onScroll()
			-- upvalues: ScrollingFrame (copy), UseRefResult4 (upval)
			if ScrollingFrame.CanvasPosition.Y > 0 then
				UseRefResult4.current = true
			end
		end
		
		UseRefResult3.current = ScrollingFrame.AbsoluteWindowSize.Y < ScrollingFrame.AbsoluteCanvasSize.Y
		local Connection = ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
		local Connection1 = ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
		local Connection2 = ScrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
			Connection2:Disconnect()
		end
	end, { UseGroupedListLoaderResult.loading })
	ReactModule.useEffect(function()
		-- upvalues: UseGroupedListLoaderResult (copy), UseRefResult6 (copy), SendEventFunction (copy), TelemetryEventType (upval), FFlagAbuseReportImproveErrorEventsModule (upval), FormatErrorDetailForAnalyticsFunction (upval)
		if UseGroupedListLoaderResult.error and not UseRefResult6.current then
			UseRefResult6.current = true
			SendEventFunction({
				sub_event_type = TelemetryEventType.Error,
				error_detail = if FFlagAbuseReportImproveErrorEventsModule then FormatErrorDetailForAnalyticsFunction("inExpChatSelection: load failed", UseGroupedListLoaderResult.error) else {
					error_message = "inExpChatSelection: load failed: " .. UseGroupedListLoaderResult.error
				}
			})
		end
	end, { UseGroupedListLoaderResult.error, SendEventFunction })
	local v1 = #Data > 1
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult (copy), Data (copy)
		if UseStateResult1 then
			return UseStateResult1
		end
		if UseStateResult then
			for _, entry in ipairs(Data) do
				for _, item in ipairs(entry.items) do
					if item.id == UseStateResult then
						return entry.id
					end
				end
			end
		end
		return Data[1] and Data[1].id or nil
	end, { UseStateResult1, UseStateResult, Data })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: Data (copy), DashModule (upval), UseMemoResult (copy), p1 (copy), REPORTMESSAGENOTSHOWNITEMID (upval)
		if #Data == 0 then
			return {}
		end
		local FindResult = DashModule.find(Data, function(p2): boolean
			-- upvalues: UseMemoResult (upval)
			return p2.id == UseMemoResult
		end)
		local List = if p1.reportMessageNotShownText and p1.reportMessageNotShownText ~= "" then {
			{
				id = REPORTMESSAGENOTSHOWNITEMID,
				label = p1.reportMessageNotShownText
			}
		} else {}
		local Iterator = ipairs
		local Items = FindResult and FindResult.items or {}
		for _, value in Iterator(Items) do
			table.insert(List, value)
		end
		return List
	end, { Data, UseMemoResult, p1.reportMessageNotShownText })
	local Id = UseMemoResult1[#UseMemoResult1] and UseMemoResult1[#UseMemoResult1].id or nil
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), Id (copy), UseRefResult1 (copy), ScrollToItemModule (upval), UseRefResult5 (copy)
		if UseStateResult then return end
		if not Id then return end
		local CurrentEntry = UseRefResult1.current[Id]
		
		if not CurrentEntry then return end
		local Flag = false
		
		local function _()
			-- upvalues: Flag (ref), ScrollToItemModule (upval), UseRefResult5 (upval), CurrentEntry (copy)
			if not Flag then
				ScrollToItemModule(UseRefResult5, { current = CurrentEntry })
				
				return
			end
		end
		
		if CurrentEntry.AbsoluteSize.Y > 0 then
			if not Flag then
				ScrollToItemModule(UseRefResult5, { current = CurrentEntry })
			end
		else
			local Connection = nil
			Connection = CurrentEntry:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: CurrentEntry (copy), Connection (ref), Flag (ref), ScrollToItemModule (upval), UseRefResult5 (upval)
				if CurrentEntry.AbsoluteSize.Y > 0 then
					Connection:Disconnect()
					
					if Flag then return end
					ScrollToItemModule(UseRefResult5, { current = CurrentEntry })
				end
			end)
			task.delay(2, function()
				-- upvalues: Connection (ref)
				if Connection.Connected then
					Connection:Disconnect()
				end
			end)
		end
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, { Id, UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: UseGroupedListLoaderResult (copy), UseMemoResult1 (copy), UseRefResult7 (copy), SendEventFunction (copy), TelemetryEventType (upval)
		if not UseGroupedListLoaderResult.loading and not UseGroupedListLoaderResult.error and #UseMemoResult1 == 0 and not UseRefResult7.current then
			UseRefResult7.current = true
			SendEventFunction({ sub_event_type = TelemetryEventType.EmptyState })
		end
	end, {
		UseGroupedListLoaderResult.loading,
		UseGroupedListLoaderResult.error,
		UseMemoResult1,
		SendEventFunction
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseStateResult2_2 (copy)
		UseRefResult2.current = true
		UseStateResult2_2(false)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(false)
	end, {})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: DashModule (upval), Data (copy)
		return DashModule.map(Data, function(Current)
			return { id = Current.id, text = Current.label }
		end)
	end, { Data })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), REPORTMESSAGENOTSHOWNITEMID (upval), UseRefResult (copy), p1 (copy), UseResult (copy)
		UseStateResult2(REPORTMESSAGENOTSHOWNITEMID)
		UseRefResult.current = {
			id = REPORTMESSAGENOTSHOWNITEMID,
			label = p1.reportMessageNotShownText
		}
		UseResult()
	end, { UseResult })
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Content = ReactModule.createElement(Layout, { body = nil, actions = nil }),
		ChatSelectionSheet = ReactModule.createElement(Sheet.Root, {
			centerSheetHeight = 1,
			preferCenterSheet = true,
			ref = UseInExpFocusNavigationRefsModule(FocusNavigableSurfaceIdentifierEnum.CentralOverlay, UseResult1, not UseStateResult4),
			isOpen = UseStateResult3,
			size = DialogSize.Medium,
			snapPoints = { 0.9 },
			onClose = function()
				-- upvalues: UseRefResult2 (copy), p1 (copy), UseStateResult (copy), UseRefResult (copy)
				if UseRefResult2.current then
					UseRefResult2.current = false
					
					if p1.onNext then
						p1.onNext(UseStateResult, UseRefResult.current)
						
						return
					end
				elseif p1.goBack then
					p1.goBack()
				end
			end
		}, {
			SheetHeader = ReactModule.createElement(Sheet.Header, nil, {
				Title = ReactModule.createElement(Text, {
					tag = "align-x-left auto-xy text-title-large text-truncate-end content-emphasis",
					Text = TranslateIntoStringFunction(p1.title)
				})
			}),
			SheetContent = if UseGroupedListLoaderResult.loading then ReactModule.createElement(LoadingContent) elseif UseGroupedListLoaderResult.error then ReactModule.createElement(ErrorContent, {
				retry = UseGroupedListLoaderResult.retry,
				errorText = p1.errorText,
				retryButtonText = p1.retryButtonText
			}) elseif #UseMemoResult1 == 0 then ReactModule.createElement(Sheet.Content, nil, {
				Empty = ReactModule.createElement(View, {
					tag = "col align-x-center align-y-center gap-medium size-full"
				}, {
					Empty = ReactModule.createElement(TextWithTranslationModule, { tag = "auto-xy", LayoutOrder = 1, input = p1.emptyText }),
					ReportAMessageNotShown = ReactModule.createElement(Text, {
						RichText = true,
						tag = "auto-xy padding-small text-wrap text-align-x-center radius-medium",
						LayoutOrder = 2,
						Text = `<u>{TranslateIntoStringFunction(p1.reportMessageNotShownText)}</u>`,
						onActivated = UseResult2
					})
				})
			}) else ReactModule.createElement(Sheet.Content, { isContentFullBleed = true, ref = UseRefResult5 }, {
				ChannelDropdown = if FixChatSelectorDropdownPadding and v1 then ReactModule.createElement(View, {
					tag = "auto-xy padding-x-xlarge padding-top-xsmall",
					LayoutOrder = 1
				}, ReactModule.createElement(InExpDropdownWithPopoverModule, {
					LayoutOrder = 1,
					value = UseMemoResult,
					items = UseMemoResult2,
					onOpenChange = UseStateResult2_3,
					onItemChanged = function(p2)
						-- upvalues: UseMemoResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), SendEventFunction (copy), TelemetryEventType (upval), Data (copy)
						local UseMemoResult1 = UseMemoResult or ""
						local Text = tostring(p2)
						UseStateResult2(nil)
						UseStateResult2_1(Text)
						SendEventFunction({
							sub_event_type = TelemetryEventType.TextChannelSwitch,
							text_channel_switch_detail = {
								previous_channel_name = UseMemoResult1,
								new_channel_name = Text,
								channel_count = #Data
							}
						})
					end
				})) elseif v1 then ReactModule.createElement(InExpDropdownWithPopoverModule, {
					LayoutOrder = 1,
					value = UseMemoResult,
					items = UseMemoResult2,
					onOpenChange = UseStateResult2_3,
					onItemChanged = function(p2)
						-- upvalues: UseMemoResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), SendEventFunction (copy), TelemetryEventType (upval), Data (copy)
						local UseMemoResult1 = UseMemoResult or ""
						local Text = tostring(p2)
						UseStateResult2(nil)
						UseStateResult2_1(Text)
						SendEventFunction({
							sub_event_type = TelemetryEventType.TextChannelSwitch,
							text_channel_switch_detail = {
								previous_channel_name = UseMemoResult1,
								new_channel_name = Text,
								channel_count = #Data
							}
						})
					end
				}) else nil,
				ItemList = ReactModule.createElement(List.Root, {
					LayoutOrder = 2,
					hasDivider = { hasDivider = true, isInset = false },
					isContained = { isContained = false, hasMargin = true }
				}, {
					DashModule.map(UseMemoResult1, function(Current, LayoutOrder)
						-- upvalues: ReactModule (upval), Icon (upval), IconName (upval), IconVariant (upval), List (upval), TranslateIntoStringFunction (copy), UseStateResult2 (copy), UseRefResult (copy), SendEventFunction (copy), TelemetryEventType (upval), UseMemoResult1 (copy), UseRefResult3 (copy), UseRefResult4 (copy), ListItemInputType (upval), UseStateResult (copy), UseRefResult1 (copy)
						return ReactModule.createElement(List.Item, {
							description = TranslateIntoStringFunction(Current.label),
							trailing = if Current.meta and Current.meta.presetId and Current.meta.presetId ~= "" then ReactModule.createElement(Icon, {
								name = IconName.LightningBolt,
								variant = IconVariant.Filled
							}) else nil,
							onActivated = {
								onActivated = function()
									-- upvalues: UseStateResult2 (upval), Current (copy), UseRefResult (upval), SendEventFunction (upval), TelemetryEventType (upval), LayoutOrder (copy), UseMemoResult1 (upval), UseRefResult3 (upval), UseRefResult4 (upval)
									UseStateResult2(Current.id)
									UseRefResult.current = Current
									SendEventFunction({
										sub_event_type = TelemetryEventType.SelectItem,
										select_item_detail = {
											selected_index = LayoutOrder,
											selected_id = Current.id,
											list_length = #UseMemoResult1,
											has_scroll = UseRefResult3.current,
											did_scroll = UseRefResult4.current
										}
									})
								end,
								inputType = ListItemInputType.Radio,
								isChecked = UseStateResult == Current.id
							},
							LayoutOrder = LayoutOrder,
							ref = function(p2)
								-- upvalues: UseRefResult1 (upval), Current (copy)
								UseRefResult1.current[Current.id] = p2
							end,
							key = Current.id
						})
					end)
				}),
				Footer = p1.footerItems and ReactModule.createElement(FooterModule, {
					additionalTag = "padding-top-medium",
					layoutOrder = 3,
					footerItems = p1.footerItems
				})
			}),
			SheetActions = if UseGroupedListLoaderResult.loading or UseGroupedListLoaderResult.error or UseStateResult == nil or UseStateResult == REPORTMESSAGENOTSHOWNITEMID and #UseMemoResult1 <= 0 then nil else ReactModule.createElement(Sheet.Actions, nil, {
				Button = ReactModule.createElement(Button, {
					variant = ButtonVariant.Emphasis,
					text = TranslateIntoStringFunction(p1.nextButtonText),
					isLoading = p1.isSubmitting,
					isDisabled = p1.isSubmitting,
					fillBehavior = FillBehavior.Fill,
					onActivated = UseResult
				})
			})
		})
	})
end)