local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local fillBehavior = foundationModule.Enums.FillBehavior
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local _ = require(genericAbuseReporting.BeduiV2.Hooks.AbuseSheetFlow.AbuseSheetFlowTypes)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.BeduiV2.Analytics.AbuseReportAnalyticsContext)
local analyticsServiceModule = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local eyebrowModule = require(genericAbuseReporting.BeduiV2.Components.Eyebrow)
local layoutSlotsModule = require(genericAbuseReporting.BeduiV2.Components.LayoutSlots)
local listModule = require(genericAbuseReporting.Common.List)
local scrollToItemModule = require(genericAbuseReporting.BeduiV2.Utils.scrollToItem)
local _ = require(genericAbuseReporting.BeduiV2.Utils.Translate.translate)
local useArTranslation = require(genericAbuseReporting.BeduiV2.Utils.Translate.arTranslation).useArTranslation
local telemetryEventType = analyticsServiceModule.TelemetryEventType
local useAbuseReportAnalytics = abuseReportAnalyticsContextModule.useAbuseReportAnalytics
local useLayoutSlots = layoutSlotsModule.useLayoutSlots
local fFlagSupportSubmissionOnAllReportNodes = sharedFlagsModule.FFlagSupportSubmissionOnAllReportNodes
local fFlagRemoveHardcodedStringsInReportNodes = sharedFlagsModule.FFlagRemoveHardcodedStringsInReportNodes

return reactModule.memo(function(p0) --[[ line: 48 | named "ListNode" ]]
	-- upvalues: useTokens (ref), reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), scrollToItemModule (ref), dashModule (ref), telemetryEventType (ref), eyebrowModule (ref), view (ref), listModule (ref), button (ref), fFlagRemoveHardcodedStringsInReportNodes (ref), buttonVariant (ref), fillBehavior (ref), fFlagSupportSubmissionOnAllReportNodes (ref)
	local var11 = useTokens()
	local var12, var13 = reactModule.useState(p0.initialValue or nil)
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var14 = reactModule.useRef(nil)
	local var15, var16 = reactModule.useState(false)
	local var17, var18 = reactModule.useState(false)
	local var19 = useLayoutSlots()
	local body = var19.Body
	local actions = var19.Actions
	local title = var19.Title
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: var14 (ref), var16 (ref), var18 (ref)
		local current = var14.current
		
		if not current then return end
		local scrollingFrame = current:FindFirstChildWhichIsA("ScrollingFrame", true)
		
		if scrollingFrame then
			local function checkScrollbar() --[[ line: 76 ]]
				-- upvalues: scrollingFrame (ref), var16 (copy)
				var16(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
			end
			
			local function onScroll() --[[ line: 81 ]]
				-- upvalues: scrollingFrame (ref), var18 (copy)
				if scrollingFrame.CanvasPosition.Y > 0 then
					var18(true)
				end
			end
			
			var16(scrollingFrame.AbsoluteWindowSize.Y < scrollingFrame.AbsoluteCanvasSize.Y)
			local var25 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
			local var26 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
			local var27 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
			
			return function() --[[ line: 94 ]]
				-- upvalues: var25 (ref), var26 (ref), var27 (ref)
				var25:Disconnect()
				var26:Disconnect()
				var27:Disconnect()
			end
		end
	end, {})
	local var20 = reactModule.useRef({})
	local var21 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 104 ]]
		-- upvalues: var12 (ref), var21 (ref), var20 (ref), scrollToItemModule (copy), var14 (ref)
		if var12 then
			var21.current = var20.current[var12]
			scrollToItemModule(var14, var21)
			
			return
		end
		var21.current = nil
	end, { var12 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = if p0.items ~= nil then nil else reactModule.createElement(body, { ref = var14 }, {
			Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p0.eyebrow }),
			Title = reactModule.createElement(title, { layoutOrder = 1, input = p0.title }),
			ItemListContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, -var11.Padding.XLarge),
					PaddingRight = UDim.new(0, -var11.Padding.XLarge)
				}),
				ItemList = reactModule.createElement(listModule.Root, {
					value = var12,
					onValueChanged = reactModule.useCallback(function(p1) --[[ line: 113 ]]
						-- upvalues: var13 (ref), dashModule (copy), p0 (ref), sendEvent (ref), telemetryEventType (copy), var15 (ref), var17 (ref)
						var13(p1)
						local var28 = 0
						dashModule.forEach(p0.items, function(p2, p3) --[[ line: 117 ]]
							-- upvalues: p1 (ref), var28 (write)
							if p2.id == p1 then
								var28 = p3
								
								return
							end
						end)
						sendEvent({
							sub_event_type = telemetryEventType.SelectItem,
							select_item_detail = {
								selected_index = var28,
								list_length = #p0.items,
								has_scroll = var15,
								did_scroll = var17
							}
						})
					end, { sendEvent, var15, var17, p0.items })
				}, {
					dashModule.map(p0.items, function(p4, p5) --[[ line: 168 ]]
						-- upvalues: reactModule (copy), listModule (copy), translateIntoString (ref), p0 (ref), var20 (ref)
						return reactModule.createElement(listModule.Item, {
							trailingAccessory = "Radio",
							hasMargin = true,
							value = p4.id,
							title = translateIntoString(p4.label),
							description = if p4.description then translateIntoString(p4.description) else nil,
							hasDivider = p5 ~= #p0.items,
							ref = function(p6) --[[ line: 176 ]]
								-- upvalues: var20 (copy), p4 (ref)
								var20.current[p4.id] = p6
							end
						})
					end)
				})
			})
		}),
		Actions = if p0.onNext and var12 ~= nil then reactModule.createElement(actions, nil, {
			Button = reactModule.createElement(button, {
				text = if fFlagRemoveHardcodedStringsInReportNodes then translateIntoString(p0.nextButtonText) elseif p0.nextButtonText then translateIntoString(p0.nextButtonText) else "Continue",
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else false,
				isDisabled = if fFlagSupportSubmissionOnAllReportNodes then p0.isSubmitting else false,
				onActivated = reactModule.useCallback(function() --[[ line: 134 ]]
					-- upvalues: dashModule (copy), p0 (ref), var12 (ref)
					local var29 = dashModule.find(p0.items, function(p7) --[[ line: 135 ]]
						-- upvalues: var12 (copy)
						return p7.id == var12
					end)
					
					if p0.onNext then
						p0.onNext(var12, var29)
					end
				end, { p0.items, p0.onNext, var12 })
			})
		}) else nil
	})
end)