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

local function ListNodeLoading(p0)
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

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useListLoader (ref), useLayoutSlots (ref), fFlagAbuseReportListNodeFullBleedModule (ref), reactFocusNavigationModule (ref), focusBehaviorsModule (ref), scrollToItemModule (ref), telemetryEventType (ref), fFlagAbuseReportSelectItemAddId (ref), dashModule (ref), ListNodeLoading (ref), ListNodeError (ref), empty (ref), eyebrowModule (ref), view (ref), list (ref), fFlagAbuseReportInExpPlayerListV3 (ref), iconName (ref), t (ref), footerModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref)
	local var17 = useTokens()
	local var18, var19 = reactModule.useState(p2.initialValue or nil)
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var20 = reactModule.useRef(nil)
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(false)
	local var25 = reactModule.useRef(false)
	local var26 = reactModule.useRef(false)
	local var27 = useListLoader(p2.items)
	local loading = var27.loading
	local error = var27.error
	local retry = var27.retry
	local data = var27.data
	local var28 = useLayoutSlots()
	local layout = var28.Layout
	local contentInset = var28.ContentInset
	local var29 = fFlagAbuseReportListNodeFullBleedModule and (data ~= nil and #data > 0)
	local var30 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var31 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var30 (ref), data (ref), focusBehaviorsModule (copy), var31 (ref)
		local current = var20.current
		
		if not current or not var30 then return end
		if data and #data ~= 0 then
			local var39 = focusBehaviorsModule.mostRecentOrDefault(var31.current)
			var30:registerFocusBehavior(current, var39)
			
			return function()
				-- upvalues: var30 (copy), current (ref), var39 (ref)
				var30:deregisterFocusBehavior(current, var39)
			end
		end
	end, { var30, data, var31 })
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var22 (ref), var24 (ref)
		local current = var20.current
		
		if not current then return end
		local scrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if scrollingFrame then
			local function checkScrollbar()
				-- upvalues: scrollingFrame (ref), var22 (copy)
				var22(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
			end
			
			local function onScroll()
				-- upvalues: scrollingFrame (ref), var24 (copy)
				if scrollingFrame.CanvasPosition.Y > 0 then
					var24(true)
				end
			end
			
			var22(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
			local var43 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
			local var44 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
			local var45 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
			
			return function()
				-- upvalues: var43 (ref), var44 (ref), var45 (ref)
				var43:Disconnect()
				var44:Disconnect()
				var45:Disconnect()
			end
		end
	end, { loading })
	local var32 = reactModule.useRef({})
	local var33 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), var33 (ref), var32 (ref), scrollToItemModule (copy), var20 (ref)
		if var18 then
			var33.current = var32.current[var18]
			scrollToItemModule(var20, var33)
			
			return
		end
		var33.current = nil
	end, { var18 })
	reactModule.useEffect(function()
		-- upvalues: error (ref), var25 (ref), sendEvent (ref), telemetryEventType (copy)
		if error and not var25.current then
			var25.current = true
			sendEvent({
				sub_event_type = telemetryEventType.Error,
				error_detail = { error_message = "list: async load failed: " .. error }
			})
		end
	end, { error, sendEvent })
	reactModule.useEffect(function()
		-- upvalues: loading (ref), error (ref), data (ref), var26 (ref), sendEvent (ref), telemetryEventType (copy)
		if not loading and not error and (data == nil or #data == 0) and not var26.current then
			var26.current = true
			sendEvent({ sub_event_type = telemetryEventType.EmptyState })
		end
	end, { loading, error, data, sendEvent })
	local variant = p2.variant or "radio"
	local isChevron = variant == "chevron"
	local var36 = reactModule.useCallback(function(p3, p4)
		-- upvalues: data (ref), sendEvent (ref), telemetryEventType (copy), fFlagAbuseReportSelectItemAddId (copy), var21 (ref), var23 (ref)
		if data then
			sendEvent({
				sub_event_type = telemetryEventType.SelectItem,
				select_item_detail = {
					selected_index = p3,
					selected_id = if fFlagAbuseReportSelectItemAddId then p4 else nil,
					list_length = #data,
					has_scroll = var21,
					did_scroll = var23
				}
			})
			
			return
		end
	end, { sendEvent, var21, var23, data })
	local var37 = reactModule.useCallback(function(p5)
		-- upvalues: data (ref), var19 (ref), dashModule (copy), var36 (ref), fFlagAbuseReportSelectItemAddId (copy)
		if data then
			var19(p5)
			local var46 = 0
			dashModule.forEach(data, function(p6, p7)
				-- upvalues: p5 (ref), var46 (write)
				if p6.id == p5 then
					var46 = p7
					
					return
				end
			end)
			var36(var46, if fFlagAbuseReportSelectItemAddId then p5 else nil)
			
			return
		end
	end, { var36, data })
	local var38 = reactModule.useCallback(function()
		-- upvalues: data (ref), dashModule (copy), var18 (ref), p2 (ref)
		if not data then return end
		local var47 = dashModule.find(data, function(p8)
			-- upvalues: var18 (copy)
			return p8.id == var18
		end)
		
		if p2.onNext then
			p2.onNext(var18, var47)
		end
	end, { data, p2.onNext, var18 })
	local title = var28.Title
	
	if loading then
		return reactModule.createElement(ListNodeLoading, {
			layout = layout,
			titleSlot = title,
			title = p2.title,
			eyebrow = p2.eyebrow,
			tokens = var17
		})
	elseif error then
		return reactModule.createElement(ListNodeError, {
			layout = layout,
			titleSlot = title,
			title = p2.title,
			eyebrow = p2.eyebrow,
			errorText = p2.errorText,
			retryButtonText = p2.retryButtonText,
			tokens = var17,
			retry = retry
		})
	end
	local createElement = reactModule.createElement
	createElement = createElement(reactModule.Fragment, nil, if data == nil or #data == 0 then {
		Empty = reactModule.createElement(empty, {
			text = if p2.emptyText then translateIntoString(p2.emptyText) else nil
		})
	} else {
		Eyebrow = if fFlagAbuseReportListNodeFullBleedModule then nil else reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p2.eyebrow }),
		Title = if fFlagAbuseReportListNodeFullBleedModule then nil else reactModule.createElement(title, {
			layoutOrder = 1,
			input = p2.title,
			subtitle = p2.subtitle
		}),
		Header = if fFlagAbuseReportListNodeFullBleedModule then reactModule.createElement(contentInset, { layoutOrder = 0 }, {
			Eyebrow = p2.eyebrow and reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p2.eyebrow }),
			Title = reactModule.createElement(title, {
				layoutOrder = 1,
				input = p2.title,
				subtitle = p2.subtitle
			})
		}) else nil,
		ItemListContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
			ItemList = reactModule.createElement(list.Root, {
				hasDivider = { hasDivider = true, isInset = false },
				isContained = { isContained = false, hasMargin = true }
			}, {
				dashModule.map(data, function(p9, p10)
					-- upvalues: fFlagAbuseReportInExpPlayerListV3 (copy), p2 (ref), reactModule (copy), list (copy), iconName (copy), translateIntoString (ref), isChevron (ref), var36 (ref), fFlagAbuseReportSelectItemAddId (copy), var37 (ref), t (copy), variant (ref), var18 (ref), var32 (ref), var31 (ref)
					return reactModule.createElement(list.Item, {
						leading = if type(p9.leading) == "string" then iconName[p9.leading] else p9.leading,
						title = translateIntoString(p9.label),
						description = if p9.description then translateIntoString(p9.description) else nil,
						trailing = if fFlagAbuseReportInExpPlayerListV3 and p2.renderTrailingAccessory then p2.renderTrailingAccessory(p9) else nil,
						onActivated = {
							onActivated = if isChevron then function()
								-- upvalues: var36 (copy), p10 (ref), fFlagAbuseReportSelectItemAddId (copy), p9 (ref), p2 (copy)
								var36(p10, if fFlagAbuseReportSelectItemAddId then p9.id else nil)
								
								if p2.onNext then
									p2.onNext(p9.id, p9)
								end
							end else function()
								-- upvalues: var37 (copy), p9 (ref)
								var37(p9.id)
							end,
							inputType = t[variant],
							isChecked = var18 == p9.id
						},
						LayoutOrder = p10,
						ref = function(p11)
							-- upvalues: var32 (copy), p9 (ref), p10 (ref), var31 (copy)
							var32.current[p9.id] = p11
							
							if p10 == 1 then
								var31.current = p11
							end
						end
					})
				end)
			})
		}),
		Footer = if fFlagAbuseReportListNodeFullBleedModule then p2.footerItems and reactModule.createElement(contentInset, { layoutOrder = 3 }, reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			footerItems = p2.footerItems
		})) else p2.footerItems and reactModule.createElement(footerModule, {
			additionalTag = "padding-top-medium",
			layoutOrder = 3,
			footerItems = p2.footerItems
		})
	})
	
	return reactModule.createElement(layout, {
		ref = var20,
		body = createElement,
		actions = if p2.onNext and not isChevron and var18 ~= nil then reactModule.createElement(button, {
			text = translateIntoString(p2.nextButtonText),
			variant = buttonVariant.Emphasis,
			fillBehavior = fillBehavior.Fill,
			isLoading = p2.isSubmitting,
			isDisabled = p2.isSubmitting,
			onActivated = var38
		}) else nil,
		isContentFullBleed = var29
	})
end)