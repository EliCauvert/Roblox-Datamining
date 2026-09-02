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

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useArTranslation (ref), useAbuseReportAnalytics (ref), useLayoutSlots (ref), scrollToItemModule (ref), dashModule (ref), telemetryEventType (ref), eyebrowModule (ref), view (ref), listModule (ref), button (ref), buttonVariant (ref), fillBehavior (ref), fFlagSupportSubmissionOnAllReportNodes (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(p1.initialValue or nil)
	local translateIntoString = useArTranslation().translateIntoString
	local sendEvent = useAbuseReportAnalytics().sendEvent
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local var9 = useLayoutSlots()
	local body = var9.Body
	local actions = var9.Actions
	local title = var9.Title
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
			local var10 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkScrollbar)
			local var11 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkScrollbar)
			local var12 = scrollingFrame:GetPropertyChangedSignal("CanvasPosition"):Connect(onScroll)
			
			return function()
				-- upvalues: var10 (ref), var11 (ref), var12 (ref)
				var10:Disconnect()
				var11:Disconnect()
				var12:Disconnect()
			end
		end
	end, {})
	local var10 = reactModule.useRef({})
	local var11 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var11 (ref), var10 (ref), scrollToItemModule (copy), var4 (ref)
		if var2 then
			var11.current = var10.current[var2]
			scrollToItemModule(var4, var11)
			
			return
		end
		var11.current = nil
	end, { var2 })
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Content = if p1.items ~= nil then nil else reactModule.createElement(body, { ref = var4 }, {
			Eyebrow = reactModule.createElement(eyebrowModule, { layoutOrder = 0, eyebrow = p1.eyebrow }),
			Title = reactModule.createElement(title, { layoutOrder = 1, input = p1.title }),
			ItemListContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y", LayoutOrder = 2 }, {
				UIPadding = reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, -var1.Padding.XLarge),
					PaddingRight = UDim.new(0, -var1.Padding.XLarge)
				}),
				ItemList = reactModule.createElement(listModule.Root, {
					value = var2,
					onValueChanged = reactModule.useCallback(function(p2)
						-- upvalues: var3 (ref), dashModule (copy), p1 (ref), sendEvent (ref), telemetryEventType (copy), var5 (ref), var7 (ref)
						var3(p2)
						local var12 = 0
						dashModule.forEach(p1.items, function(p3, p4)
							-- upvalues: p2 (ref), var12 (write)
							if p3.id == p2 then
								var12 = p4
								
								return
							end
						end)
						sendEvent({
							sub_event_type = telemetryEventType.SelectItem,
							select_item_detail = {
								selected_index = var12,
								list_length = #p1.items,
								has_scroll = var5,
								did_scroll = var7
							}
						})
					end, { sendEvent, var5, var7, p1.items })
				}, {
					dashModule.map(p1.items, function(p2, p3)
						-- upvalues: reactModule (copy), listModule (copy), translateIntoString (ref), p1 (ref), var10 (ref)
						return reactModule.createElement(listModule.Item, {
							trailingAccessory = "Radio",
							hasMargin = true,
							value = p2.id,
							title = translateIntoString(p2.label),
							description = if p2.description then translateIntoString(p2.description) else nil,
							hasDivider = p3 ~= #p1.items,
							ref = function(p4)
								-- upvalues: var10 (copy), p2 (ref)
								var10.current[p2.id] = p4
							end
						})
					end)
				})
			})
		}),
		Actions = if p1.onNext and var2 ~= nil then reactModule.createElement(actions, nil, {
			Button = reactModule.createElement(button, {
				text = translateIntoString(p1.nextButtonText),
				variant = buttonVariant.Emphasis,
				fillBehavior = fillBehavior.Fill,
				isLoading = if fFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
				isDisabled = if fFlagSupportSubmissionOnAllReportNodes then p1.isSubmitting else false,
				onActivated = reactModule.useCallback(function()
					-- upvalues: dashModule (copy), p1 (ref), var2 (ref)
					local var12 = dashModule.find(p1.items, function(p2)
						-- upvalues: var2 (copy)
						return p2.id == var2
					end)
					
					if p1.onNext then
						p1.onNext(var2, var12)
					end
				end, { p1.items, p1.onNext, var2 })
			})
		}) else nil
	})
end)