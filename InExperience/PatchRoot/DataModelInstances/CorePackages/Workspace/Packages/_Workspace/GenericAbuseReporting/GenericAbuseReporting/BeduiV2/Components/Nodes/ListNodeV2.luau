local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local focusBehaviorsModule = require(parent.FocusBehaviors)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local empty = foundationModule.Empty
local fillBehavior = foundationModule.Enums.FillBehavior
local iconName = foundationModule.Enums.IconName
local list = foundationModule.List
local listItemInputType = foundationModule.Enums.ListItemInputType
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local eyebrowModule = require(genericAbuseReporting.BeduiV2.Components.Eyebrow)
local footerModule = require(genericAbuseReporting.BeduiV2.Components.Footer)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local scrollToItemModule = require(genericAbuseReporting.BeduiV2.Utils.scrollToItem)
local textWithTranslationModule = require(genericAbuseReporting.BeduiV2.Utils.Translate.TextWithTranslation)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local useListLoader = require(genericAbuseReporting.BeduiV2.Loaders.useLoader).useListLoader
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagAbuseReportInExpPlayerListV3 = require(parent.SharedFlags).FFlagAbuseReportInExpPlayerListV3
local fFlagAbuseReportSelectItemAddId = require(parent.SharedFlags).FFlagAbuseReportSelectItemAddId
local fFlagAbuseReportListNodeFullBleedModule = require(genericAbuseReporting.Flags.FFlagAbuseReportListNodeFullBleed)
local t = {
	chevron = nil,
	radio = listItemInputType.Radio,
	toggle = listItemInputType.Toggle,
	checkbox = listItemInputType.Checkbox
}

local function ListNodeLoading(p1)
	-- upvalues: reactModule (ref), eyebrowModule (ref), view (ref), skeleton (ref), radius (ref)
	local title = p1.title
	local eyebrow = p1.eyebrow
	local tokens = p1.tokens
	
	return reactModule.createElement(p1.layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, {
			Eyebrow = eyebrow and reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = eyebrow }),
			Title = reactModule.createElement(p1.titleSlot, { layoutOrder = 1, input = title }),
			SkeletonContainer = reactModule.createElement(view, {
				tag = "col gap-medium size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				Skeleton1 = reactModule.createElement(skeleton, {
					radius = radius.Medium,
					Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
				}),
				Skeleton2 = reactModule.createElement(skeleton, {
					radius = radius.Medium,
					Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
				}),
				Skeleton3 = reactModule.createElement(skeleton, {
					radius = radius.Medium,
					Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
				}),
				Skeleton4 = reactModule.createElement(skeleton, {
					radius = radius.Medium,
					Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
				}),
				Skeleton5 = reactModule.createElement(skeleton, {
					radius = radius.Medium,
					Size = UDim2.new(1, 0, 0, tokens.Size.Size_600)
				})
			})
		})
	})
end

local function ListNodeError(p1)
	-- upvalues: useArTranslation (ref), reactModule (ref), eyebrowModule (ref), textWithTranslationModule (ref), button (ref), buttonVariant (ref), foundationModule (ref)
	local translateIntoString = useArTranslation().translateIntoString
	
	return reactModule.createElement(p1.layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, {
			Eyebrow = p1.eyebrow and reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = reactModule.createElement(p1.titleSlot, { layoutOrder = 1, input = p1.title }),
			ErrorText = reactModule.createElement(textWithTranslationModule, {
				tag = "size-full-0 auto-y text-body-small",
				layoutOrder = 2,
				input = translateIntoString(p1.errorText)
			}),
			RetryButton = reactModule.createElement(button, {
				LayoutOrder = 3,
				text = translateIntoString(p1.retryButtonText),
				variant = buttonVariant.Standard,
				fillBehavior = foundationModule.Enums.FillBehavior.Fit,
				onActivated = p1.retry
			})
		})
	})
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useListLoader (ref), useLayoutSlots (ref), fFlagAbuseReportListNodeFullBleedModule (ref), reactFocusNavigationModule (ref), focusBehaviorsModule (ref), scrollToItemModule (ref), telemetryEventType (ref), fFlagAbuseReportSelectItemAddId (ref), dashModule (ref), ListNodeLoading (ref), ListNodeError (ref), empty (ref), eyebrowModule (ref), view (ref), list (ref), fFlagAbuseReportInExpPlayerListV3 (ref), iconName (ref), t (ref), footerModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(p1.initialValue or nil)
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useRef(false)
	local var11 = useListLoader(p1.items)
	local loading = var11.loading
	local error = var11.error
	local retry = var11.retry
	local data = var11.data
	local var12 = useLayoutSlots()
	local layout = var12.Layout
	local contentInset = var12.ContentInset
	local var13 = fFlagAbuseReportListNodeFullBleedModule and (data ~= nil and #data > 0)
	local var14 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var15 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var14 (ref), data (ref), focusBehaviorsModule (copy), var15 (ref)
		local current = var4.current
		
		if not current or not var14 then return end
		if data and #data ~= 0 then
			local var16 = focusBehaviorsModule.mostRecentOrDefault(var15.current)
			var14:registerFocusBehavior(current, var16)
			
			return function()
				-- upvalues: var14 (copy), current (ref), var16 (ref)
				var14:deregisterFocusBehavior(current, var16)
			end
		end
	end, { var14, data, var15 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref), var8 (ref)
		local current = var4.current
		
		if not current then return end
		local scrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if scrollingFrame then
			local function checkScrollbar()
				-- upvalues: scrollingFrame (ref), var6 (copy)
				var6(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
			end
			
			local function onScroll()
				-- upvalues: scrollingFrame (ref), var8 (copy)
				if scrollingFrame.CanvasPosition.Y > 0 then
					var8(true)
				end
			end
			
			var6(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
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
	end, { loading })
	local var16 = reactModule.useRef({})
	local var17 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var17 (ref), var16 (ref), scrollToItemModule (copy), var4 (ref)
		if var2 then
			var17.current = var16.current[var2]
			scrollToItemModule(var4, var17)
			
			return
		end
		var17.current = nil
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: error (ref), var9 (ref), sendEvent (ref), telemetryEventType (copy)
		if error and not var9.current then
			var9.current = true
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = "list: async load failed: " .. error }
			})
		end
	end, { error, sendEvent })
	reactModule.useEffect(function()
		-- upvalues: loading (ref), error (ref), data (ref), var10 (ref), sendEvent (ref), telemetryEventType (copy)
		if not loading and not error and (data == nil or #data == 0) and not var10.current then
			var10.current = true
			sendEvent({ sub_event_type = telemetryEventType.EmptyState })
		end
	end, { loading, error, data, sendEvent })
	local variant = p1.variant or "radio"
	local isChevron = variant == "chevron"
	local var18 = reactModule.useCallback(function(p2, p3)
		-- upvalues: data (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportSelectItemAddId (copy), var5 (ref), var7 (ref)
		if data then
			sendEvent({
				sub_event_type = telemetryEventType.SelectItem,
				select_item_detail = {
					selected_index = p2,
					selected_id = if fFlagAbuseReportSelectItemAddId then p3 else nil,
					list_length = #data,
					has_scroll = var5,
					did_scroll = var7
				}
			})
			
			return
		end
	end, { sendEvent, var5, var7, data })
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: data (ref), var3 (ref), dashModule (copy), var18 (ref), fFlagAbuseReportSelectItemAddId (copy)
		if data then
			var3(p2)
			local var20 = 0
			dashModule.forEach(data, function(p3, p4)
				-- upvalues: p2 (ref), var20 (write)
				if p3.id == p2 then
					var20 = p4
					
					return
				end
			end)
			var18(var20, if fFlagAbuseReportSelectItemAddId then p2 else nil)
			
			return
		end
	end, { var18, data })
	local var20 = reactModule.useCallback(function()
		-- upvalues: data (ref), dashModule (copy), var2 (ref), p1 (ref)
		if not data then return end
		local var21 = dashModule.find(data, function(p2)
			-- upvalues: var2 (copy)
			return p2.id == var2
		end)
		
		if p1.onNext then
			p1.onNext(var2, var21)
		end
	end, { data, p1.onNext, var2 })
	local title = var12.Title
	
	if loading then
		return reactModule.createElement(ListNodeLoading, {
			layout = layout,
			titleSlot = title,
			title = p1.title,
			eyebrow = p1.eyebrow,
			tokens = var1
		})
	elseif error then
		return reactModule.createElement(ListNodeError, {
			layout = layout,
			titleSlot = title,
			title = p1.title,
			eyebrow = p1.eyebrow,
			errorText = p1.errorText,
			retryButtonText = p1.retryButtonText,
			tokens = var1,
			retry = retry
		})
	end
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, if data == nil or #data == 0 then {
		Empty = reactModule.createElement(empty, {
			text = if p1.emptyText then translateIntoString(p1.emptyText) else nil
		})
	} else {
		Eyebrow = if fFlagAbuseReportListNodeFullBleedModule then nil else reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
		Title = if fFlagAbuseReportListNodeFullBleedModule then nil else reactModule.createElement(title, {
			layoutOrder = 1,
			input = p1.title,
			subtitle = p1.subtitle
		}),
		Header = if fFlagAbuseReportListNodeFullBleedModule then reactModule.createElement(contentInset, { layoutOrder = 0 }, {
			Eyebrow = p1.eyebrow and reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = reactModule.createElement(title, {
				layoutOrder = 1,
				input = p1.title,
				subtitle = p1.subtitle
			})
		}) else nil,
		ItemListContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			ItemList = reactModule.createElement(list.Root, {
				hasDivider = { hasDivider = true, isInset = false },
				isContained = { isContained = false, hasMargin = true }
			}, {
				dashModule.map(data, function(p2, p3)
					-- upvalues: fFlagAbuseReportInExpPlayerListV3 (copy), p1 (ref), reactModule (copy), list (copy), iconName (copy), translateIntoString (ref), isChevron (ref), var18 (ref), fFlagAbuseReportSelectItemAddId (copy), var19 (ref), t (copy), variant (ref), var2 (ref), var16 (ref), var15 (ref)
					return reactModule.createElement(list.Item, {
						leading = if type(p2.leading) == "string" then iconName[p2.leading] else p2.leading,
						title = translateIntoString(p2.label),
						description = if p2.description then translateIntoString(p2.description) else nil,
						trailing = if fFlagAbuseReportInExpPlayerListV3 and p1.renderTrailingAccessory then p1.renderTrailingAccessory(p2) else nil,
						onActivated = {
							onActivated = if isChevron then function()
								-- upvalues: var18 (copy), p3 (ref), fFlagAbuseReportSelectItemAddId (copy), p2 (ref), p1 (copy)
								var18(p3, if fFlagAbuseReportSelectItemAddId then p2.id else nil)
								
								if p1.onNext then
									p1.onNext(p2.id, p2)
								end
							end else function()
								-- upvalues: var19 (copy), p2 (ref)
								var19(p2.id)
							end,
							inputType = t[variant],
							isChecked = var2 == p2.id
						},
						LayoutOrder = p3,
						ref = function(p4)
							-- upvalues: var16 (copy), p2 (ref), p3 (ref), var15 (copy)
							var16.current[p2.id] = p4
							
							if p3 == 1 then
								var15.current = p4
							end
						end
					})
				end)
			})
		}),
		Footer = if fFlagAbuseReportListNodeFullBleedModule then p1.footerItems and reactModule.createElement(contentInset, { layoutOrder = 3 }, reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			footerItems = p1.footerItems
		})) else p1.footerItems and reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p1.footerItems
		})
	})
	
	return reactModule.createElement(layout, {
		ref = var4,
		body = createElement,
		actions = if p1.onNext and not isChevron and var2 ~= nil then reactModule.createElement(button, {
			text = translateIntoString(p1.nextButtonText),
			variant = buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isLoading = p1.isSubmitting,
			isDisabled = p1.isSubmitting,
			onActivated = var20
		}) else nil,
		isContentFullBleed = var13
	})
end)