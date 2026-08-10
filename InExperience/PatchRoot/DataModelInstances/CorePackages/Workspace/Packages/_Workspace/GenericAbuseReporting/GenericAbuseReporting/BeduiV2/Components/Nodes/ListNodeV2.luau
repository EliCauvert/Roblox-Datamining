local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local focusBehaviorsModule = require(parent.FocusBehaviors)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local fFlagAbuseReportSelectItemAddId = require(parent.SharedFlags).FFlagAbuseReportSelectItemAddId
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
local t = {
	chevron = nil,
	radio = listItemInputType.Radio,
	toggle = listItemInputType.Toggle,
	checkbox = listItemInputType.Checkbox
}

local function ListNodeLoading(p0) --[[ line: 76 ]]
	-- upvalues: reactModule (ref), eyebrowModule (ref), view (ref), skeleton (ref), radius (ref)
	local title = p0.title
	local eyebrow = p0.eyebrow
	local tokens = p0.tokens
	
	return reactModule.createElement(p0.layout, {
		body = reactModule.createElement(reactModule.Fragment, nil, {
			Eyebrow = eyebrow and reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = eyebrow }),
			Title = reactModule.createElement(p0.titleSlot, { layoutOrder = 1, input = title }),
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

local function ListNodeError(p1) --[[ line: 125 ]]
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

return reactModule.memo(function(p2) --[[ line: 166 | named "ListNode" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useListLoader (ref), useLayoutSlots (ref), reactFocusNavigationModule (ref), focusBehaviorsModule (ref), scrollToItemModule (ref), telemetryEventType (ref), fFlagAbuseReportSelectItemAddId (ref), dashModule (ref), ListNodeLoading (ref), ListNodeError (ref), empty (ref), eyebrowModule (ref), view (ref), list (ref), fFlagAbuseReportInExpPlayerListV3 (ref), iconName (ref), t (ref), footerModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var16 = useTokens()
	local var17, var18 = reactModule.useState(p2.initialValue or nil)
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var19 = reactModule.useRef(nil)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(false)
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useRef(false)
	local var26 = useListLoader(p2.items)
	local loading = var26.loading
	local error = var26.error
	local retry = var26.retry
	local data = var26.data
	local var27 = useLayoutSlots()
	local layout = var27.Layout
	local var28 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var29 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 188 ]]
		-- upvalues: var19 (ref), var28 (ref), data (ref), focusBehaviorsModule (copy), var29 (ref)
		local current = var19.current
		
		if not current or not var28 then return end
		if data and #data ~= 0 then
			local var37 = focusBehaviorsModule.mostRecentOrDefault(var29.current)
			var28:registerFocusBehavior(current, var37)
			
			return function() --[[ line: 200 ]]
				-- upvalues: var28 (copy), current (ref), var37 (ref)
				var28:deregisterFocusBehavior(current, var37)
			end
		end
	end, { var28, data, var29 })
	reactModule.useEffect(function() --[[ line: 206 ]]
		-- upvalues: var19 (ref), var21 (ref), var23 (ref)
		local current = var19.current
		
		if not current then return end
		local scrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if scrollingFrame then
			local function checkScrollbar() --[[ line: 219 ]]
				-- upvalues: scrollingFrame (ref), var21 (copy)
				var21(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
			end
			
			local function onScroll() --[[ line: 224 ]]
				-- upvalues: scrollingFrame (ref), var23 (copy)
				if scrollingFrame.CanvasPosition.Y > 0 then
					var23(true)
				end
			end
			
			var21(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
			local var41 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
			local var42 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
			local var43 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
			
			return function() --[[ line: 237 ]]
				-- upvalues: var41 (ref), var42 (ref), var43 (ref)
				var41:Disconnect()
				var42:Disconnect()
				var43:Disconnect()
			end
		end
	end, { loading })
	local var30 = reactModule.useRef({})
	local var31 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 247 ]]
		-- upvalues: var17 (ref), var31 (ref), var30 (ref), scrollToItemModule (copy), var19 (ref)
		if var17 then
			var31.current = var30.current[var17]
			scrollToItemModule(var19, var31)
			
			return
		end
		var31.current = nil
	end, { var17 })
	reactModule.useEffect(function() --[[ line: 256 ]]
		-- upvalues: error (ref), var24 (ref), sendEvent (ref), telemetryEventType (copy)
		if error and not var24.current then
			var24.current = true
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = "list: async load failed: " .. error }
			})
		end
	end, { error, sendEvent })
	reactModule.useEffect(function() --[[ line: 266 ]]
		-- upvalues: loading (ref), error (ref), data (ref), var25 (ref), sendEvent (ref), telemetryEventType (copy)
		if not loading and not error and (data == nil or #data == 0) and not var25.current then
			var25.current = true
			sendEvent({ sub_event_type = telemetryEventType.EmptyState })
		end
	end, { loading, error, data, sendEvent })
	local variant = p2.variant or "radio"
	local isChevron = variant == "chevron"
	local var34 = reactModule.useCallback(function(p3, p4) --[[ line: 283 ]]
		-- upvalues: data (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportSelectItemAddId (copy), var20 (ref), var22 (ref)
		if data then
			sendEvent({
				sub_event_type = telemetryEventType.SelectItem,
				select_item_detail = {
					selected_index = p3,
					selected_id = if fFlagAbuseReportSelectItemAddId then p4 else nil,
					list_length = #data,
					has_scroll = var20,
					did_scroll = var22
				}
			})
			
			return
		end
	end, { sendEvent, var20, var22, data })
	local var35 = reactModule.useCallback(function(p5) --[[ line: 299 ]]
		-- upvalues: data (ref), var18 (ref), dashModule (copy), var34 (ref), fFlagAbuseReportSelectItemAddId (copy)
		if data then
			var18(p5)
			local var44 = 0
			dashModule.forEach(data, function(p6, p7) --[[ line: 306 ]]
				-- upvalues: p5 (ref), var44 (write)
				if p6.id == p5 then
					var44 = p7
					
					return
				end
			end)
			var34(var44, if fFlagAbuseReportSelectItemAddId then p5 else nil)
			
			return
		end
	end, { var34, data })
	local var36 = reactModule.useCallback(function() --[[ line: 315 ]]
		-- upvalues: data (ref), dashModule (copy), var17 (ref), p2 (ref)
		if not data then return end
		local var45 = dashModule.find(data, function(p8) --[[ line: 320 ]]
			-- upvalues: var17 (copy)
			return p8.id == var17
		end)
		
		if p2.onNext then
			p2.onNext(var17, var45)
		end
	end, { data, p2.onNext, var17 })
	local title = var27.Title
	
	if loading then
		return reactModule.createElement(ListNodeLoading, {
			layout = layout,
			titleSlot = title,
			title = p2.title,
			eyebrow = p2.eyebrow,
			tokens = var16
		})
	elseif error then
		return reactModule.createElement(ListNodeError, {
			layout = layout,
			titleSlot = title,
			title = p2.title,
			eyebrow = p2.eyebrow,
			errorText = p2.errorText,
			retryButtonText = p2.retryButtonText,
			tokens = var16,
			retry = retry
		})
	end
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, if data == nil or #data == 0 then {
		Empty = reactModule.createElement(empty, {
			text = if p2.emptyText then translateIntoString(p2.emptyText) else nil
		})
	} else {
		Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p2.eyebrow }),
		Title = reactModule.createElement(title, {
			layoutOrder = 1,
			input = p2.title,
			subtitle = p2.subtitle
		}),
		ItemListContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			ItemList = reactModule.createElement(list.Root, {
				hasDivider = { hasDivider = true, isInset = false },
				isContained = { isContained = false, hasMargin = true }
			}, {
				dashModule.map(data, function(p9, p10) --[[ line: 387 ]]
					-- upvalues: fFlagAbuseReportInExpPlayerListV3 (copy), p2 (ref), reactModule (copy), list (copy), iconName (copy), translateIntoString (ref), isChevron (ref), var34 (ref), fFlagAbuseReportSelectItemAddId (copy), var35 (ref), t (copy), variant (ref), var17 (ref), var30 (ref), var29 (ref)
					return reactModule.createElement(list.Item, {
						leading = if type(p9.leading) == "string" then iconName[p9.leading] else p9.leading,
						title = translateIntoString(p9.label),
						description = if p9.description then translateIntoString(p9.description) else nil,
						trailing = if fFlagAbuseReportInExpPlayerListV3 and p2.renderTrailingAccessory then p2.renderTrailingAccessory(p9) else nil,
						onActivated = {
							onActivated = if isChevron then function() --[[ line: 401 ]]
								-- upvalues: var34 (copy), p10 (ref), fFlagAbuseReportSelectItemAddId (copy), p9 (ref), p2 (copy)
								var34(p10, if fFlagAbuseReportSelectItemAddId then p9.id else nil)
								
								if p2.onNext then
									p2.onNext(p9.id, p9)
								end
							end else function() --[[ line: 410 ]]
								-- upvalues: var35 (copy), p9 (ref)
								var35(p9.id)
							end,
							inputType = t[variant],
							isChecked = var17 == p9.id
						},
						LayoutOrder = p10,
						ref = function(p11) --[[ line: 417 ]]
							-- upvalues: var30 (copy), p9 (ref), p10 (ref), var29 (copy)
							var30.current[p9.id] = p11
							
							if p10 == 1 then
								var29.current = p11
							end
						end
					})
				end)
			})
		}),
		Footer = p2.footerItems and reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p2.footerItems
		})
	})
	
	return reactModule.createElement(layout, {
		ref = var19,
		body = createElement,
		actions = if p2.onNext and not isChevron and var17 ~= nil then reactModule.createElement(button, {
			text = translateIntoString(p2.nextButtonText),
			variant = buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isLoading = p2.isSubmitting,
			isDisabled = p2.isSubmitting,
			onActivated = var36
		}) else nil
	})
end)