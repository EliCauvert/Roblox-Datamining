local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
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

local function _(p0, p1) --[[ line: 45 | named "useScrollToSelected" ]]
	-- upvalues: reactModule (ref), scrollToItemModule (ref)
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: p0 (ref), p1 (ref), scrollToItemModule (copy)
		if not p0 then return end
		local var16 = p1.current[p0]
		
		if not var16 then return end
		local scrollingFrame = var16:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not scrollingFrame then return end
		local var18 = false
		local t = { current = scrollingFrame.Parent }
		local t_1 = { current = var16 }
		
		local function _() --[[ line: 68 | named "performScroll" ]]
			-- upvalues: var18 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
			if var18 then
				return
			end
			scrollToItemModule(t, t_1)
		end
		
		if var16.AbsoluteSize.Y > 0 then
			scrollToItemModule(t, t_1)
		else
			local var21 = nil
			var21 = var16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 80 ]]
				-- upvalues: var16 (ref), var21 (write), var18 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
				if var16.AbsoluteSize.Y > 0 then
					var21:Disconnect()
					
					if var18 then return end
					scrollToItemModule(t, t_1)
				end
			end)
			task.delay(2, function() --[[ line: 87 ]]
				-- upvalues: var21 (write)
				if var21.Connected then
					var21:Disconnect()
				end
			end)
		end
		return function() --[[ line: 94 ]]
			-- upvalues: var18 (write)
			var18 = true
		end
	end, { p0 })
end

local REPORT_MESSAGE_NOT_SHOWN_ITEM_ID = useInExpCustomSubmitModule.REPORT_MESSAGE_NOT_SHOWN_ITEM_ID

local function LoadingContent() --[[ line: 135 ]]
	-- upvalues: useTokens (ref), reactModule (ref), sheet (ref), view (ref), dashModule (ref), skeleton (ref), radius (ref)
	local var22 = useTokens()
	
	return reactModule.createElement(sheet.Content, nil, {
		SkeletonContainer = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, dashModule.map(table.create(5, true), function(_, p2) --[[ line: 142 ]]
			-- upvalues: reactModule (copy), skeleton (copy), radius (copy), var22 (ref)
			return reactModule.createElement(skeleton, {
				key = tostring(p2),
				radius = radius.Medium,
				Size = UDim2.new(1, 0, 0, var22.Size.Size_800)
			})
		end))
	})
end

local function ErrorContent(p3) --[[ line: 153 ]]
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
				onActivated = p3.retry or function() --[[ line: 173 ]] end
			})
		})
	})
end

return reactModule.memo(function(p4) --[[ line: 185 | named "InExpChatSelectionNode" ]]
	-- upvalues: reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), useGroupedListLoader (ref), scrollToItemModule (ref), telemetryEventType (ref), dashModule (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), LoadingContent (ref), ErrorContent (ref), sheet (ref), view (ref), textWithTranslationModule (ref), text (ref), inExpDropdownWithPopoverModule (ref), list (ref), icon (ref), iconName (ref), iconVariant (ref), listItemInputType (ref), footerModule (ref), dialogSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var23, var24 = reactModule.useState(p4.initialValue or nil)
	local var25 = reactModule.useRef(nil)
	local var26, var27 = reactModule.useState(nil)
	local var28, var29 = reactModule.useState(true)
	local translateIntoString = useArTranslation().translateIntoString
	local var30 = reactModule.useRef({})
	local var31 = reactModule.useRef(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var32 = reactModule.useRef(false)
	local var33 = reactModule.useRef(false)
	local var34 = reactModule.useRef(nil)
	local var35 = reactModule.useRef(false)
	local var36 = reactModule.useRef(false)
	local layout = useLayoutSlots().Layout
	local var37 = useGroupedListLoader(p4.items)
	local data = var37.data or {}
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: var23 (ref), var30 (ref), scrollToItemModule (copy)
		if not var23 then return end
		local var16 = var30.current[var23]
		
		if not var16 then return end
		local scrollingFrame = var16:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not scrollingFrame then return end
		local var18 = false
		local t = { current = scrollingFrame.Parent }
		local t_1 = { current = var16 }
		
		local function _() --[[ line: 68 | named "performScroll" ]]
			-- upvalues: var18 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
			if var18 then
				return
			end
			scrollToItemModule(t, t_1)
		end
		
		if var16.AbsoluteSize.Y > 0 then
			scrollToItemModule(t, t_1)
		else
			local var21 = nil
			var21 = var16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 80 ]]
				-- upvalues: var16 (ref), var21 (write), var18 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
				if var16.AbsoluteSize.Y > 0 then
					var21:Disconnect()
					
					if var18 then return end
					scrollToItemModule(t, t_1)
				end
			end)
			task.delay(2, function() --[[ line: 87 ]]
				-- upvalues: var21 (write)
				if var21.Connected then
					var21:Disconnect()
				end
			end)
		end
		return function() --[[ line: 94 ]]
			-- upvalues: var18 (write)
			var18 = true
		end
	end, { var23 })
	reactModule.useEffect(function() --[[ line: 209 ]]
		-- upvalues: var34 (ref), var32 (ref), var33 (ref)
		local current = var34.current
		
		if not current then return end
		local scrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if scrollingFrame then
			local function checkScrollbar() --[[ line: 220 ]]
				-- upvalues: var32 (copy), scrollingFrame (ref)
				var32.current = scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y
			end
			
			local function onScroll() --[[ line: 224 ]]
				-- upvalues: scrollingFrame (ref), var33 (copy)
				if scrollingFrame.CanvasPosition.Y > 0 then
					var33.current = true
				end
			end
			
			var32.current = scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y
			local var50 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
			local var51 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
			local var52 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
			
			return function() --[[ line: 237 ]]
				-- upvalues: var50 (ref), var51 (ref), var52 (ref)
				var50:Disconnect()
				var51:Disconnect()
				var52:Disconnect()
			end
		end
	end, { var37.loading })
	reactModule.useEffect(function() --[[ line: 244 ]]
		-- upvalues: var37 (ref), var35 (ref), sendEvent (ref), telemetryEventType (copy)
		if var37.error and not var35.current then
			var35.current = true
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "inExpChatSelection: load failed: " .. var37.error
				}
			})
		end
	end, { var37.error, sendEvent })
	local var39 = #data > 1
	local var40 = reactModule.useMemo(function() --[[ line: 255 ]]
		-- upvalues: var26 (ref), var23 (ref), data (ref)
		if var26 then
			return var26
		elseif var23 then
			for i, v in ipairs(data) do
				for i_1, v_1 in ipairs(v.items) do
					if v_1.id == var23 then
						return v.id
					end
				end
			end
		end
		return if data[1] then data[1].id else nil
	end, { var26, var23, data })
	local var41 = reactModule.useMemo(function() --[[ line: 271 ]]
		-- upvalues: data (ref), dashModule (copy), var40 (ref), p4 (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (copy)
		if #data == 0 then
			return {}
		end
		local var53 = dashModule.find(data, function(p5) --[[ line: 275 ]]
			-- upvalues: var40 (copy)
			return p5.id == var40
		end)
		local var54 = if p4.reportMessageNotShownText and p4.reportMessageNotShownText ~= "" then {
			{
				id = REPORT_MESSAGE_NOT_SHOWN_ITEM_ID,
				label = p4.reportMessageNotShownText
			}
		} else {}
		
		for i, v in ipairs(if var53 then var53.items else {}) do
			table.insert(var54, v)
		end
		return var54
	end, { data, var40, p4.reportMessageNotShownText })
	local var42 = if var41[#var41] then var41[#var41].id else nil
	reactModule.useEffect(function() --[[ line: 296 ]]
		-- upvalues: var23 (ref), var42 (ref), var30 (ref), scrollToItemModule (copy), var34 (ref)
		if var23 then return end
		if not var42 then return end
		local var55 = var30.current[var42]
		
		if not var55 then return end
		local var56 = false
		
		local function _() --[[ line: 311 | named "performScroll" ]]
			-- upvalues: var56 (write), scrollToItemModule (copy), var34 (copy), var55 (ref)
			if var56 then
				return
			end
			scrollToItemModule(var34, { current = var55 })
		end
		
		if var55.AbsoluteSize.Y > 0 then
			scrollToItemModule(var34, { current = var55 })
		else
			local var57 = nil
			var57 = var55:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ line: 322 ]]
				-- upvalues: var55 (ref), var57 (write), var56 (write), scrollToItemModule (copy), var34 (copy)
				if var55.AbsoluteSize.Y > 0 then
					var57:Disconnect()
					
					if var56 then return end
					scrollToItemModule(var34, { current = var55 })
				end
			end)
			task.delay(2, function() --[[ line: 330 ]]
				-- upvalues: var57 (write)
				if var57.Connected then
					var57:Disconnect()
				end
			end)
		end
		return function() --[[ line: 337 ]]
			-- upvalues: var56 (write)
			var56 = true
		end
	end, { var42, var23 })
	reactModule.useEffect(function() --[[ line: 342 ]]
		-- upvalues: var37 (ref), var41 (ref), var36 (ref), sendEvent (ref), telemetryEventType (copy)
		if not var37.loading and not var37.error and (#var41 == 0 and not var36.current) then
			var36.current = true
			sendEvent({ sub_event_type = telemetryEventType.EmptyState })
		end
	end, { var37.loading, var37.error, var41, sendEvent })
	local var43 = reactModule.useCallback(function() --[[ line: 356 ]]
		-- upvalues: var31 (ref), var29 (ref)
		var31.current = true
		var29(false)
	end, {})
	local var44 = reactModule.useCallback(function() --[[ line: 361 ]]
		-- upvalues: var29 (ref)
		var29(false)
	end, {})
	local var45, var46 = reactModule.useState(false)
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(layout, { body = nil, actions = nil }),
		ChatSelectionSheet = reactModule.createElement(sheet.Root, {
			centerSheetHeight = 1,
			preferCenterSheet = true,
			ref = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var44, not var45),
			isOpen = var28,
			size = dialogSize.Medium,
			snapPoints = { 0.9 },
			onClose = function() --[[ line: 510 ]]
				-- upvalues: var31 (ref), p4 (ref), var23 (ref), var25 (ref)
				if var31.current then
					var31.current = false
					
					if p4.onNext then
						p4.onNext(var23, var25.current)
						
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
			SheetContent = if var37.loading then reactModule.createElement(LoadingContent) elseif var37.error then reactModule.createElement(ErrorContent, {
				retry = var37.retry,
				errorText = p4.errorText,
				retryButtonText = p4.retryButtonText
			}) elseif #var41 == 0 then reactModule.createElement(sheet.Content, nil, {
				Empty = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center gap-medium size-full"
				}, {
					Empty = reactModule.createElement(textWithTranslationModule, { tag = "auto-xy", LayoutOrder = 1, input = p4.emptyText }),
					ReportAMessageNotShown = reactModule.createElement(text, {
						RichText = true,
						tag = "auto-xy padding-small text-wrap text-align-x-center radius-medium",
						LayoutOrder = 2,
						Text = `<u>{translateIntoString(p4.reportMessageNotShownText)}</u>`,
						onActivated = reactModule.useCallback(function() --[[ line: 382 ]]
							-- upvalues: var24 (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (copy), var25 (ref), p4 (ref), var43 (ref)
							var24(REPORT_MESSAGE_NOT_SHOWN_ITEM_ID)
							var25.current = {
								id = REPORT_MESSAGE_NOT_SHOWN_ITEM_ID,
								label = p4.reportMessageNotShownText
							}
							var43()
						end, { var43 })
					})
				})
			}) else reactModule.createElement(sheet.Content, { isContentFullBleed = true, ref = var34 }, {
				ChannelDropdown = if var39 then reactModule.createElement(inExpDropdownWithPopoverModule, {
					LayoutOrder = 1,
					value = var40,
					items = reactModule.useMemo(function() --[[ line: 376 ]]
						-- upvalues: dashModule (copy), data (ref)
						return dashModule.map(data, function(p6) --[[ line: 377 ]]
							return { id = p6.id, text = p6.label }
						end)
					end, { data }),
					onOpenChange = var46,
					onItemChanged = function(p7) --[[ line: 428 ]]
						-- upvalues: var40 (ref), var24 (ref), var27 (ref), sendEvent (ref), telemetryEventType (copy), data (ref)
						local var40_1 = var40 or ""
						local var59 = tostring(p7)
						var24(nil)
						var27(var59)
						sendEvent({
							sub_event_type = telemetryEventType.TextChannelSwitch,
							text_channel_switch_detail = {
								previous_channel_name = var40_1,
								new_channel_name = var59,
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
					dashModule.map(var41, function(p8, p9) --[[ line: 455 ]]
						-- upvalues: reactModule (copy), icon (copy), iconName (copy), iconVariant (copy), list (copy), translateIntoString (ref), var24 (ref), var25 (ref), sendEvent (ref), telemetryEventType (copy), var41 (ref), var32 (ref), var33 (ref), listItemInputType (copy), var23 (ref), var30 (ref)
						return reactModule.createElement(list.Item, {
							description = translateIntoString(p8.label),
							trailing = if p8.meta and p8.meta.presetId and p8.meta.presetId ~= "" then reactModule.createElement(icon, {
								name = iconName.LightningBolt,
								variant = iconVariant.Filled
							}) else nil,
							onActivated = {
								onActivated = function() --[[ line: 468 ]]
									-- upvalues: var24 (copy), p8 (ref), var25 (copy), sendEvent (copy), telemetryEventType (copy), p9 (ref), var41 (copy), var32 (copy), var33 (copy)
									var24(p8.id)
									var25.current = p8
									sendEvent({
										sub_event_type = telemetryEventType.SelectItem,
										select_item_detail = {
											selected_index = p9,
											list_length = #var41,
											has_scroll = var32.current,
											did_scroll = var33.current
										}
									})
								end,
								inputType = listItemInputType.Radio,
								isChecked = var23 == p8.id
							},
							LayoutOrder = p9,
							ref = function(p10) --[[ line: 485 ]]
								-- upvalues: var30 (copy), p8 (ref)
								var30.current[p8.id] = p10
							end,
							key = p8.id
						})
					end)
				}),
				Footer = p4.footerItems and reactModule.createElement(footerModule, {
					additionalTag = "padding-top-medium",
					layoutOrder = 3,
					footerItems = p4.footerItems
				})
			}),
			SheetActions = if var37.loading or var37.error or var23 == nil or var23 == REPORT_MESSAGE_NOT_SHOWN_ITEM_ID and #var41 <= 0 then nil else reactModule.createElement(sheet.Actions, nil, {
				Button = reactModule.createElement(button, {
					variant = buttonVariant.Emphasis,
					text = translateIntoString(p4.nextButtonText),
					isLoading = p4.isSubmitting,
					isDisabled = p4.isSubmitting,
					fillBehavior = fillBehavior.Fill,
					onActivated = var43
				})
			})
		})
	})
end)