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

local function _(p1, p2)
	-- upvalues: reactModule (ref), scrollToItemModule (ref)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), p2 (ref), scrollToItemModule (copy)
		if not p1 then return end
		local var1 = p2.current[p1]
		
		if not var1 then return end
		local scrollingFrame = var1:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not scrollingFrame then return end
		local var2 = false
		local t = { current = scrollingFrame.Parent }
		local t_1 = { current = var1 }
		
		local function _()
			-- upvalues: var2 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
			if var2 then
				return
			end
			scrollToItemModule(t, t_1)
		end
		
		if var1.AbsoluteSize.Y > 0 then
			scrollToItemModule(t, t_1)
		else
			local var3 = nil
			var3 = var1:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var1 (ref), var3 (write), var2 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
				if var1.AbsoluteSize.Y > 0 then
					var3:Disconnect()
					
					if var2 then return end
					scrollToItemModule(t, t_1)
				end
			end)
			task.delay(2, function()
				-- upvalues: var3 (write)
				if var3.Connected then
					var3:Disconnect()
				end
			end)
		end
		return function()
			-- upvalues: var2 (write)
			var2 = true
		end
	end, { p1 })
end

local REPORT_MESSAGE_NOT_SHOWN_ITEM_ID = useInExpCustomSubmitModule.REPORT_MESSAGE_NOT_SHOWN_ITEM_ID

local function LoadingContent()
	-- upvalues: useTokens (ref), reactModule (ref), sheet (ref), view (ref), dashModule (ref), skeleton (ref), radius (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(sheet.Content, nil, {
		SkeletonContainer = reactModule.createElement(view, { tag = "col gap-medium size-full-0 auto-y" }, dashModule.map(table.create(5, true), function(_, p1)
			-- upvalues: reactModule (copy), skeleton (copy), radius (copy), var1 (ref)
			return reactModule.createElement(skeleton, {
				key = tostring(p1),
				radius = radius.Medium,
				Size = UDim2.new(1, 0, 0, var1.Size.Size_800)
			})
		end))
	})
end

local function ErrorContent(p1)
	-- upvalues: useArTranslation (ref), reactModule (ref), sheet (ref), view (ref), text (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local translateIntoString = useArTranslation().translateIntoString
	
	return reactModule.createElement(sheet.Content, nil, {
		ErrorContainer = reactModule.createElement(view, {
			tag = "align-x-center align-y-center gap-medium size-full"
		}, {
			ErrorText = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-body-medium text-wrap text-align-x-left",
				Text = translateIntoString(p1.errorText)
			}),
			RetryButton = reactModule.createElement(button, {
				text = translateIntoString(p1.retryButtonText),
				variant = buttonVariant.Standard,
				fillBehavior = fillBehavior.Fit,
				onActivated = p1.retry or function() end
			})
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), useGroupedListLoader (ref), scrollToItemModule (ref), telemetryEventType (ref), dashModule (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (ref), useInExpFocusNavigationRefsModule (ref), focusNavigableSurfaceIdentifierEnum (ref), LoadingContent (ref), ErrorContent (ref), sheet (ref), view (ref), textWithTranslationModule (ref), text (ref), fixChatSelectorDropdownPadding (ref), inExpDropdownWithPopoverModule (ref), list (ref), icon (ref), iconName (ref), iconVariant (ref), fFlagAbuseReportSelectItemAddId (ref), listItemInputType (ref), footerModule (ref), dialogSize (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1, var2 = reactModule.useState(p1.initialValue or nil)
	local var3 = reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useState(true)
	local translateIntoString = useArTranslation().translateIntoString
	local var8 = reactModule.useRef({})
	local var9 = reactModule.useRef(false)
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(false)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef(false)
	local layout = useLayoutSlots().Layout
	local var15 = useGroupedListLoader(p1.items)
	local data = var15.data or {}
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var8 (ref), scrollToItemModule (copy)
		if not var1 then return end
		local var16 = var8.current[var1]
		
		if not var16 then return end
		local scrollingFrame = var16:FindFirstAncestorWhichIsA("ScrollingFrame")
		
		if not scrollingFrame then return end
		local var17 = false
		local t = { current = scrollingFrame.Parent }
		local t_1 = { current = var16 }
		
		local function _()
			-- upvalues: var17 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
			if var17 then
				return
			end
			scrollToItemModule(t, t_1)
		end
		
		if var16.AbsoluteSize.Y > 0 then
			scrollToItemModule(t, t_1)
		else
			local var18 = nil
			var18 = var16:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var16 (ref), var18 (write), var17 (write), scrollToItemModule (copy), t (ref), t_1 (ref)
				if var16.AbsoluteSize.Y > 0 then
					var18:Disconnect()
					
					if var17 then return end
					scrollToItemModule(t, t_1)
				end
			end)
			task.delay(2, function()
				-- upvalues: var18 (write)
				if var18.Connected then
					var18:Disconnect()
				end
			end)
		end
		return function()
			-- upvalues: var17 (write)
			var17 = true
		end
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var12 (ref), var10 (ref), var11 (ref)
		local current = var12.current
		
		if not current then return end
		local scrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if scrollingFrame then
			local function checkScrollbar()
				-- upvalues: var10 (copy), scrollingFrame (ref)
				var10.current = scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y
			end
			
			local function onScroll()
				-- upvalues: scrollingFrame (ref), var11 (copy)
				if scrollingFrame.CanvasPosition.Y > 0 then
					var11.current = true
				end
			end
			
			var10.current = scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y
			local var16 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
			local var17 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
			local var18 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
			
			return function()
				-- upvalues: var16 (ref), var17 (ref), var18 (ref)
				var16:Disconnect()
				var17:Disconnect()
				var18:Disconnect()
			end
		end
	end, { var15.loading })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var13 (ref), sendEvent (ref), telemetryEventType (copy)
		if var15.error and not var13.current then
			var13.current = true
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = {
					error_message = "inExpChatSelection: load failed: " .. var38.error
				}
			})
		end
	end, { var15.error, sendEvent })
	local var16 = #data > 1
	local var17 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var1 (ref), data (ref)
		if var4 then
			return var4
		elseif var1 then
			for i, v in ipairs(data) do
				for i_1, v_1 in ipairs(v.items) do
					if v_1.id == var1 then
						return v.id
					end
				end
			end
		end
		return if data[1] then data[1].id else nil
	end, { var4, var1, data })
	local var18 = reactModule.useMemo(function()
		-- upvalues: data (ref), dashModule (copy), var17 (ref), p1 (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (copy)
		if #data == 0 then
			return {}
		end
		local var19 = dashModule.find(data, function(p2)
			-- upvalues: var17 (copy)
			return p2.id == var17
		end)
		local var20 = if p1.reportMessageNotShownText and p1.reportMessageNotShownText ~= "" then {
			{
				id = REPORT_MESSAGE_NOT_SHOWN_ITEM_ID,
				label = p1.reportMessageNotShownText
			}
		} else {}
		
		for i, v in ipairs(if var19 then var19.items else {}) do
			table.insert(var20, v)
		end
		return var20
	end, { data, var17, p1.reportMessageNotShownText })
	local var21 = if var18[#var18] then var18[#var18].id else nil
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var21 (ref), var8 (ref), scrollToItemModule (copy), var12 (ref)
		if var1 then return end
		if not var21 then return end
		local var22 = var8.current[var21]
		
		if not var22 then return end
		local var23 = false
		
		local function _()
			-- upvalues: var23 (write), scrollToItemModule (copy), var12 (copy), var22 (ref)
			if var23 then
				return
			end
			scrollToItemModule(var12, { current = var22 })
		end
		
		if var22.AbsoluteSize.Y > 0 then
			scrollToItemModule(var12, { current = var22 })
		else
			local var24 = nil
			var24 = var22:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var22 (ref), var24 (write), var23 (write), scrollToItemModule (copy), var12 (copy)
				if var22.AbsoluteSize.Y > 0 then
					var24:Disconnect()
					
					if var23 then return end
					scrollToItemModule(var12, { current = var22 })
				end
			end)
			task.delay(2, function()
				-- upvalues: var24 (write)
				if var24.Connected then
					var24:Disconnect()
				end
			end)
		end
		return function()
			-- upvalues: var23 (write)
			var23 = true
		end
	end, { var21, var1 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), var18 (ref), var14 (ref), sendEvent (ref), telemetryEventType (copy)
		if not var15.loading and not var15.error and (#var18 == 0 and not var14.current) then
			var14.current = true
			sendEvent({ sub_event_type = telemetryEventType.EmptyState })
		end
	end, { var15.loading, var15.error, var18, sendEvent })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var7 (ref)
		var9.current = true
		var7(false)
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var7 (ref)
		var7(false)
	end, {})
	local var24, var25 = reactModule.useState(false)
	local var26 = useInExpFocusNavigationRefsModule(focusNavigableSurfaceIdentifierEnum.CentralOverlay, var23, not var24)
	local var27 = reactModule.useMemo(function()
		-- upvalues: dashModule (copy), data (ref)
		return dashModule.map(data, function(p2)
			return { id = p2.id, text = p2.label }
		end)
	end, { data })
	local _ = nil
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = reactModule.createElement(layout, { body = nil, actions = nil }),
		ChatSelectionSheet = reactModule.createElement(sheet.Root, {
			centerSheetHeight = 1,
			preferCenterSheet = true,
			ref = var26,
			isOpen = var6,
			size = dialogSize.Medium,
			snapPoints = { 0.9 },
			onClose = function()
				-- upvalues: var9 (ref), p1 (ref), var1 (ref), var3 (ref)
				if var9.current then
					var9.current = false
					
					if p1.onNext then
						p1.onNext(var1, var3.current)
						
						return
					end
				elseif p1.goBack then
					p1.goBack()
				end
			end
		}, {
			SheetHeader = reactModule.createElement(sheet.Header, nil, {
				Title = reactModule.createElement(text, {
					tag = "align-x-left auto-xy text-title-large text-truncate-end content-emphasis",
					Text = translateIntoString(p1.title)
				})
			}),
			SheetContent = if var15.loading then reactModule.createElement(LoadingContent) elseif var15.error then reactModule.createElement(ErrorContent, {
				retry = var15.retry,
				errorText = p1.errorText,
				retryButtonText = p1.retryButtonText
			}) elseif #var18 == 0 then reactModule.createElement(sheet.Content, nil, {
				Empty = reactModule.createElement(view, {
					tag = "col align-x-center align-y-center gap-medium size-full"
				}, {
					Empty = reactModule.createElement(textWithTranslationModule, { tag = "auto-xy", LayoutOrder = 1, input = p1.emptyText }),
					ReportAMessageNotShown = reactModule.createElement(text, {
						RichText = true,
						tag = "auto-xy padding-small text-wrap text-align-x-center radius-medium",
						LayoutOrder = 2,
						Text = `<u>{translateIntoString(p1.reportMessageNotShownText)}</u>`,
						onActivated = reactModule.useCallback(function()
							-- upvalues: var2 (ref), REPORT_MESSAGE_NOT_SHOWN_ITEM_ID (copy), var3 (ref), p1 (ref), var22 (ref)
							var2(REPORT_MESSAGE_NOT_SHOWN_ITEM_ID)
							var3.current = {
								id = REPORT_MESSAGE_NOT_SHOWN_ITEM_ID,
								label = p1.reportMessageNotShownText
							}
							var22()
						end, { var22 })
					})
				})
			}) else reactModule.createElement(sheet.Content, { isContentFullBleed = true, ref = var12 }, {
				ChannelDropdown = if fixChatSelectorDropdownPadding and var16 then reactModule.createElement(view, {
					tag = "auto-xy padding-x-xlarge padding-top-xsmall",
					LayoutOrder = 1
				}, reactModule.createElement(inExpDropdownWithPopoverModule, {
					LayoutOrder = 1,
					value = var17,
					items = var27,
					onOpenChange = var25,
					onItemChanged = function(p2)
						-- upvalues: var17 (ref), var2 (ref), var5 (ref), sendEvent (ref), telemetryEventType (copy), data (ref)
						local var28 = var17 or ""
						local var29 = tostring(p2)
						var2(nil)
						var5(var29)
						sendEvent({
							sub_event_type = telemetryEventType.TextChannelSwitch,
							text_channel_switch_detail = {
								previous_channel_name = var28,
								new_channel_name = var29,
								channel_count = #data
							}
						})
					end
				})) elseif var16 then reactModule.createElement(inExpDropdownWithPopoverModule, {
					LayoutOrder = 1,
					value = var17,
					items = var27,
					onOpenChange = var25,
					onItemChanged = function(p2)
						-- upvalues: var17 (ref), var2 (ref), var5 (ref), sendEvent (ref), telemetryEventType (copy), data (ref)
						local var28 = var17 or ""
						local var29 = tostring(p2)
						var2(nil)
						var5(var29)
						sendEvent({
							sub_event_type = telemetryEventType.TextChannelSwitch,
							text_channel_switch_detail = {
								previous_channel_name = var28,
								new_channel_name = var29,
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
					dashModule.map(var18, function(p2, p3)
						-- upvalues: reactModule (copy), icon (copy), iconName (copy), iconVariant (copy), list (copy), translateIntoString (ref), var2 (ref), var3 (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportSelectItemAddId (copy), var18 (ref), var10 (ref), var11 (ref), listItemInputType (copy), var1 (ref), var8 (ref)
						return reactModule.createElement(list.Item, {
							description = translateIntoString(p2.label),
							trailing = if p2.meta and p2.meta.presetId and p2.meta.presetId ~= "" then reactModule.createElement(icon, {
								name = iconName.LightningBolt,
								variant = iconVariant.Filled
							}) else nil,
							onActivated = {
								onActivated = function()
									-- upvalues: var2 (copy), p2 (ref), var3 (copy), sendEvent (copy), telemetryEventType (copy), p3 (ref), fFlagAbuseReportSelectItemAddId (copy), var18 (copy), var10 (copy), var11 (copy)
									var2(p2.id)
									var3.current = p2
									sendEvent({
										sub_event_type = telemetryEventType.SelectItem,
										select_item_detail = {
											selected_index = p3,
											selected_id = if fFlagAbuseReportSelectItemAddId then p2.id else nil,
											list_length = #var18,
											has_scroll = var10.current,
											did_scroll = var11.current
										}
									})
								end,
								inputType = listItemInputType.Radio,
								isChecked = var1 == p2.id
							},
							LayoutOrder = p3,
							ref = function(p4)
								-- upvalues: var8 (copy), p2 (ref)
								var8.current[p2.id] = p4
							end,
							key = p2.id
						})
					end)
				}),
				Footer = p1.footerItems and reactModule.createElement(footerModule, {
					additionalTag = "padding-top-medium",
					layoutOrder = 3,
					footerItems = p1.footerItems
				})
			}),
			SheetActions = if var15.loading or var15.error or var1 == nil or var1 == REPORT_MESSAGE_NOT_SHOWN_ITEM_ID and #var18 <= 0 then nil else reactModule.createElement(sheet.Actions, nil, {
				Button = reactModule.createElement(button, {
					variant = buttonVariant.Emphasis,
					text = translateIntoString(p1.nextButtonText),
					isLoading = p1.isSubmitting,
					isDisabled = p1.isSubmitting,
					fillBehavior = fillBehavior.Fill,
					onActivated = var22
				})
			})
		})
	})
end)