local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local fFlagAbuseReportSelectItemAddId = require(parent.SharedFlags).FFlagAbuseReportSelectItemAddId
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local dialogSize = foundationModule.Enums.DialogSize
local fillBehavior = foundationModule.Enums.FillBehavior
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local list = foundationModule.List
local listItemInputType = foundationModule.Enums.ListItemInputType
local radius = foundationModule.Enums.Radius
local sheet = foundationModule.Sheet
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local useInExpCustomSubmitModule = require(genericAbuseReporting.BeduiV2.Hooks.useInExpCustomSubmit)
local useInExpFocusNavigationRefsModule = require(genericAbuseReporting.BeduiV2.Hooks.FocusNavigation.useInExpFocusNavigationRefs)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local footerModule = require(genericAbuseReporting.BeduiV2.Components.Footer)
local inExpDropdownWithPopoverModule = require(genericAbuseReporting.BeduiV2.Components.InExpDropdownWithPopover)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local scrollToItemModule = require(genericAbuseReporting.BeduiV2.Utils.scrollToItem)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local useGroupedListLoader = require(genericAbuseReporting.BeduiV2.Loaders.useLoader).useGroupedListLoader
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fixChatSelectorDropdownPadding = game:DefineFastFlag("FixChatSelectorDropdownPadding", false)

local function _(p0, p1) --[[ line: 49 | named "useScrollToSelected" ]]
	-- upvalues: reactModule (ref), scrollToItemModule (ref)
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: p0 (ref), p1 (ref), scrollToItemModule (copy)
		if not p0 then return end
		local var17 = p1.current[p0]
		
		if not var17 then return end
		local scrollingFrame = var17:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not scrollingFrame then return end
		local var19 = false
		local t = { current = scrollingFrame.Parent }
		local t_1 = { current = var17 }
		
		local function _() --[[ line: 72 | named "performScroll" ]]
			-- upvalues: var19 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
			if var19 then
				return
			end
			scrollToItemModule(t, t_1)
		end
		
		if var17.AbsoluteSize.Y > 0 then
			scrollToItemModule(t, t_1)
		else
			local var22 = nil
			var22 = var17:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 84 ]]
				-- upvalues: var17 (ref), var22 (write), var19 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
				if var17.AbsoluteSize.Y > 0 then
					var22:Disconnect()
					
					if var19 then return end
					scrollToItemModule(t, t_1)
				end
			end)
			task.delay(2, function() --[[ line: 91 ]]
				-- upvalues: var22 (write)
				if var22.Connected then
					var22:Disconnect()
				end
			end)
		end
		return function() --[[ line: 98 ]]
			-- upvalues: var19 (write)
			var19 = true
		end
	end, { p0 })
end

local REPORT_MESSAGE_NOT_SHOWN_ITEM_ID = useInExpCustomSubmitModule.REPORT_MESSAGE_NOT_SHOWN_ITEM_ID

local function LoadingContent() --[[ line: 139 ]]
	-- upvalues: useTokens (ref), reactModule (ref), sheet (ref), view (ref), dashModule (ref), skeleton (ref), radius (ref)
	local var23 = useTokens()
	
	return reactModule.createElement(sheet.Content, nil, {
		SkeletonContainer = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, dashModule.map(table.create(5, true), function(_, p2) --[[ line: 146 ]]
			-- upvalues: reactModule (copy), skeleton (copy), radius (copy), var23 (ref)
			return reactModule.createElement(skeleton, {
				key = tostring(p2),
				radius = radius.Medium,
				Size = UDim2.new(1, 0, 0, var23.Size.Size_800)
			})
		end))
	})
end

local function ErrorContent(p3) --[[ line: 157 ]]
	-- upvalues: useArTranslation (ref), reactModule (ref), sheet (ref), view (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local translateIntoString = useArTranslation().translateIntoString
	
	return reactModule.createElement(sheet.Content, nil, {
		ErrorContainer = reactModule.createElement(view, {
			tag = "align-x-center align-y-center gap-medium size-full"
		}, {
			ErrorText = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-body-medium text-wrap text-align-x-left",
				Text = translateIntoString(p3.errorText)
			}),
			RetryButton = reactModule.createElement(button, {
				text = translateIntoString(p3.retryButtonText),
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fit,
				onActivated = p3.retry or function() --[[ line: 177 ]] end
			})
		})
	})
end

return reactModule.memo(function(p4) --[[ line: 189 | named "InExpChatSelectionNode" ]]
	-- upvalues: reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), useGroupedListLoader (ref), scrollToItemModule (ref), telemetryEventType (ref), dashModule (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), LoadingContent (ref), ErrorContent (ref), sheet (ref), view (ref), textWithTranslationModule (ref), text (ref), fixChatSelectorDropdownPadding (ref), inExpDropdownWithPopoverModule (ref), list (ref), icon (ref), iconName (ref), iconVariant (ref), fFlagAbuseReportSelectItemAddId (ref), listItemInputType (ref), footerModule (ref), dialogSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var24, var25 = reactModule.useState(p4.initialValue or nil)
	local var26 = reactModule.useRef(nil)
	local var27, var28 = reactModule.useState(nil)
	local var29, var30 = reactModule.useState(true)
	local translateIntoString = useArTranslation().translateIntoString
	local var31 = reactModule.useRef({})
	local var32 = reactModule.useRef(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var33 = reactModule.useRef(false)
	local var34 = reactModule.useRef(false)
	local var35 = reactModule.useRef(nil)
	local var36 = reactModule.useRef(false)
	local var37 = reactModule.useRef(false)
	local layout = useLayoutSlots().Layout
	local var38 = useGroupedListLoader(p4.items)
	local data = var38.data or {}
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: var24 (ref), var31 (ref), scrollToItemModule (copy)
		if not var24 then return end
		local var17 = var31.current[var24]
		
		if not var17 then return end
		local scrollingFrame = var17:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not scrollingFrame then return end
		local var19 = false
		local t = { current = scrollingFrame.Parent }
		local t_1 = { current = var17 }
		
		local function _() --[[ line: 72 | named "performScroll" ]]
			-- upvalues: var19 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
			if var19 then
				return
			end
			scrollToItemModule(t, t_1)
		end
		
		if var17.AbsoluteSize.Y > 0 then
			scrollToItemModule(t, t_1)
		else
			local var22 = nil
			var22 = var17:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 84 ]]
				-- upvalues: var17 (ref), var22 (write), var19 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
				if var17.AbsoluteSize.Y > 0 then
					var22:Disconnect()
					
					if var19 then return end
					scrollToItemModule(t, t_1)
				end
			end)
			task.delay(2, function() --[[ line: 91 ]]
				-- upvalues: var22 (write)
				if var22.Connected then
					var22:Disconnect()
				end
			end)
		end
		return function() --[[ line: 98 ]]
			-- upvalues: var19 (write)
			var19 = true
		end
	end, { var24 })
	reactModule.useEffect(function() --[[ line: 213 ]]
		-- upvalues: var35 (ref), var33 (ref), var34 (ref)
		local current = var35.current
		
		if not current then return end
		local scrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if scrollingFrame then
			local function checkScrollbar() --[[ line: 224 ]]
				-- upvalues: var33 (copy), scrollingFrame (ref)
				var33.current = scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y
			end
			
			local function onScroll() --[[ line: 228 ]]
				-- upvalues: scrollingFrame (ref), var34 (copy)
				if scrollingFrame.CanvasPosition.Y > 0 then
					var34.current = true
				end
			end
			
			var33.current = scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y
			local var53 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
			local var54 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
			local var55 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
			
			return function() --[[ line: 241 ]]
				-- upvalues: var53 (ref), var54 (ref), var55 (ref)
				var53:Disconnect()
				var54:Disconnect()
				var55:Disconnect()
			end
		end
	end, { var38.loading })
	reactModule.useEffect(function() --[[ line: 248 ]]
		-- upvalues: var38 (ref), var36 (ref), sendEvent (ref), telemetryEventType (copy)
		if var38.error and not var36.current then
			var36.current = true
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "inExpChatSelection: load failed: " .. var38.error
				}
			})
		end
	end, { var38.error, sendEvent })
	local var40 = #data > 1
	local var41 = reactModule.useMemo(function() --[[ line: 259 ]]
		-- upvalues: var27 (ref), var24 (ref), data (ref)
		if var27 then
			return var27
		elseif var24 then
			for i, v in ipairs(data) do
				for i_1, v_1 in ipairs(v.items) do
					if v_1.id == var24 then
						return v.id
					end
				end
			end
		end
		return if data[1] then data[1].id else nil
	end, { var27, var24, data })
	local var42 = reactModule.useMemo(function() --[[ line: 275 ]]
		-- upvalues: data (ref), dashModule (copy), var41 (ref), p4 (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (copy)
		if #data == 0 then
			return {}
		end
		local var56 = dashModule.find(data, function(p5) --[[ line: 279 ]]
			-- upvalues: var41 (copy)
			return p5.id == var41
		end)
		local var57 = if p4.reportMessageNotShownText and p4.reportMessageNotShownText ~= "" then {
			{
				id = REPORT_MESSAGE_NOT_SHOWN_ITEM_ID,
				label = p4.reportMessageNotShownText
			}
		} else {}
		
		for i, v in ipairs(if var56 then var56.items else {}) do
			table.insert(var57, v)
		end
		return var57
	end, { data, var41, p4.reportMessageNotShownText })
	local var43 = if var42[#var42] then var42[#var42].id else nil
	reactModule.useEffect(function() --[[ line: 300 ]]
		-- upvalues: var24 (ref), var43 (ref), var31 (ref), scrollToItemModule (copy), var35 (ref)
		if var24 then return end
		if not var43 then return end
		local var58 = var31.current[var43]
		
		if not var58 then return end
		local var59 = false
		
		local function _() --[[ line: 315 | named "performScroll" ]]
			-- upvalues: var59 (write), scrollToItemModule (copy), var35 (copy), var58 (ref)
			if var59 then
				return
			end
			scrollToItemModule(var35, { current = var58 })
		end
		
		if var58.AbsoluteSize.Y > 0 then
			scrollToItemModule(var35, { current = var58 })
		else
			local var60 = nil
			var60 = var58:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 326 ]]
				-- upvalues: var58 (ref), var60 (write), var59 (write), scrollToItemModule (copy), var35 (copy)
				if var58.AbsoluteSize.Y > 0 then
					var60:Disconnect()
					
					if var59 then return end
					scrollToItemModule(var35, { current = var58 })
				end
			end)
			task.delay(2, function() --[[ line: 334 ]]
				-- upvalues: var60 (write)
				if var60.Connected then
					var60:Disconnect()
				end
			end)
		end
		return function() --[[ line: 341 ]]
			-- upvalues: var59 (write)
			var59 = true
		end
	end, { var43, var24 })
	reactModule.useEffect(function() --[[ line: 346 ]]
		-- upvalues: var38 (ref), var42 (ref), var37 (ref), sendEvent (ref), telemetryEventType (copy)
		if not var38.loading and not var38.error and (#var42 == 0 and not var37.current) then
			var37.current = true
			sendEvent({ sub_event_type = telemetryEventType.EmptyState })
		end
	end, { var38.loading, var38.error, var42, sendEvent })
	local var44 = reactModule.useCallback(function() --[[ line: 360 ]]
		-- upvalues: var32 (ref), var30 (ref)
		var32.current = true
		var30(false)
	end, {})
	local var45 = reactModule.useCallback(function() --[[ line: 365 ]]
		-- upvalues: var30 (ref)
		var30(false)
	end, {})
	local var46, var47 = reactModule.useState(false)
	local var48 = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var45, not var46)
	local var49 = reactModule.useMemo(function() --[[ line: 380 ]]
		-- upvalues: dashModule (copy), data (ref)
		return dashModule.map(data, function(p6) --[[ line: 381 ]]
			return { id = p6.id, text = p6.label }
		end)
	end, { data })
	local _ = nil
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(layout, { body = nil, actions = nil }),
		ChatSelectionSheet = reactModule.createElement(sheet.Root, {
			centerSheetHeight = 1,
			preferCenterSheet = true,
			ref = var48,
			isOpen = var29,
			size = dialogSize.Medium,
			snapPoints = { 0.9 },
			onClose = function() --[[ line: 542 ]]
				-- upvalues: var32 (ref), p4 (ref), var24 (ref), var26 (ref)
				if var32.current then
					var32.current = false
					
					if p4.onNext then
						p4.onNext(var24, var26.current)
						
						return
					end
				elseif p4.goBack then
					p4.goBack()
				end
			end
		}, {
			SheetHeader = reactModule.createElement(sheet.Header, nil, {
				Title = reactModule.createElement(text, {
					tag = "align-x-left auto-xy text-title-large text-truncate-end content-emphasis",
					Text = translateIntoString(p4.title)
				})
			}),
			SheetContent = if var38.loading then reactModule.createElement(LoadingContent) elseif var38.error then reactModule.createElement(ErrorContent, {
				retry = var38.retry,
				errorText = p4.errorText,
				retryButtonText = p4.retryButtonText
			}) elseif #var42 == 0 then reactModule.createElement(sheet.Content, nil, {
				Empty = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center gap-medium size-full"
				}, {
					Empty = reactModule.createElement(textWithTranslationModule, { tag = "auto-xy", LayoutOrder = 1, input = p4.emptyText }),
					ReportAMessageNotShown = reactModule.createElement(text, {
						RichText = true,
						tag = "auto-xy padding-small text-wrap text-align-x-center radius-medium",
						LayoutOrder = 2,
						Text = `<u>{translateIntoString(p4.reportMessageNotShownText)}</u>`,
						onActivated = reactModule.useCallback(function() --[[ line: 386 ]]
							-- upvalues: var25 (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (copy), var26 (ref), p4 (ref), var44 (ref)
							var25(REPORT_MESSAGE_NOT_SHOWN_ITEM_ID)
							var26.current = {
								id = REPORT_MESSAGE_NOT_SHOWN_ITEM_ID,
								label = p4.reportMessageNotShownText
							}
							var44()
						end, { var44 })
					})
				})
			}) else reactModule.createElement(sheet.Content, { isContentFullBleed = true, ref = var35 }, {
				ChannelDropdown = if fixChatSelectorDropdownPadding and var40 then reactModule.createElement(view, {
					tag = "auto-xy padding-x-xlarge padding-top-xsmall",
					LayoutOrder = 1
				}, reactModule.createElement(inExpDropdownWithPopoverModule, {
					LayoutOrder = 1,
					value = var41,
					items = var49,
					onOpenChange = var47,
					onItemChanged = function(p8) --[[ line: 438 ]]
						-- upvalues: var41 (ref), var25 (ref), var28 (ref), sendEvent (ref), telemetryEventType (copy), data (ref)
						local var41_1 = var41 or ""
						local var64 = tostring(p8)
						var25(nil)
						var28(var64)
						sendEvent({
							sub_event_type = telemetryEventType.TextChannelSwitch,
							text_channel_switch_detail = {
								previous_channel_name = var41_1,
								new_channel_name = var64,
								channel_count = #data
							}
						})
					end
				})) elseif var40 then reactModule.createElement(inExpDropdownWithPopoverModule, {
					LayoutOrder = 1,
					value = var41,
					items = var49,
					onOpenChange = var47,
					onItemChanged = function(p7) --[[ line: 459 ]]
						-- upvalues: var41 (ref), var25 (ref), var28 (ref), sendEvent (ref), telemetryEventType (copy), data (ref)
						local var41_1 = var41 or ""
						local var62 = tostring(p7)
						var25(nil)
						var28(var62)
						sendEvent({
							sub_event_type = telemetryEventType.TextChannelSwitch,
							text_channel_switch_detail = {
								previous_channel_name = var41_1,
								new_channel_name = var62,
								channel_count = #data
							}
						})
					end
				}) else nil,
				ItemList = reactModule.createElement(list.Root, {
					LayoutOrder = 2,
					hasDivider = { hasDivider = true, isInset = false },
					isContained = { isContained = false, hasMargin = true }
				}, {
					dashModule.map(var42, function(p9, p10) --[[ line: 486 ]]
						-- upvalues: reactModule (copy), icon (copy), iconName (copy), iconVariant (copy), list (copy), translateIntoString (ref), var25 (ref), var26 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportSelectItemAddId (copy), var42 (ref), var33 (ref), var34 (ref), listItemInputType (copy), var24 (ref), var31 (ref)
						return reactModule.createElement(list.Item, {
							description = translateIntoString(p9.label),
							trailing = if p9.meta and p9.meta.presetId and p9.meta.presetId ~= "" then reactModule.createElement(icon, {
								name = iconName.LightningBolt,
								variant = iconVariant.Filled
							}) else nil,
							onActivated = {
								onActivated = function() --[[ line: 499 ]]
									-- upvalues: var25 (copy), p9 (ref), var26 (copy), sendEvent (copy), telemetryEventType (copy), p10 (ref), fFlagAbuseReportSelectItemAddId (copy), var42 (copy), var33 (copy), var34 (copy)
									var25(p9.id)
									var26.current = p9
									sendEvent({
										sub_event_type = telemetryEventType.SelectItem,
										select_item_detail = {
											selected_index = p10,
											selected_id = if fFlagAbuseReportSelectItemAddId then p9.id else nil,
											list_length = #var42,
											has_scroll = var33.current,
											did_scroll = var34.current
										}
									})
								end,
								inputType = listItemInputType.Radio,
								isChecked = var24 == p9.id
							},
							LayoutOrder = p10,
							ref = function(p11) --[[ line: 517 ]]
								-- upvalues: var31 (copy), p9 (ref)
								var31.current[p9.id] = p11
							end,
							key = p9.id
						})
					end)
				}),
				Footer = p4.footerItems and reactModule.createElement(footerModule, {
					additionalTag = "padding-top-medium",
					layoutOrder = 3,
					footerItems = p4.footerItems
				})
			}),
			SheetActions = if var38.loading or var38.error or var24 == nil or var24 == REPORT_MESSAGE_NOT_SHOWN_ITEM_ID and #var42 <= 0 then nil else reactModule.createElement(sheet.Actions, nil, {
				Button = reactModule.createElement(button, {
					variant = buttonVariant.Emphasis,
					text = translateIntoString(p4.nextButtonText),
					isLoading = p4.isSubmitting,
					isDisabled = p4.isSubmitting,
					fillBehavior = fillBehavior.Fill,
					onActivated = var44
				})
			})
		})
	})
end)