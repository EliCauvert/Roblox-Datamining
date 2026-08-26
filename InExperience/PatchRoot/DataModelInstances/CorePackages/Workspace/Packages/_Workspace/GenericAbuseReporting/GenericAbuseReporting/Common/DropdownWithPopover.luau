local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local coreGuiService = game:GetService("CoreGui")
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local UIBloxModule = require(parent.UIBlox)
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local overlayProvider = foundationModule.OverlayProvider
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local sideModalDropdownButtonModule = require(genericAbuseReporting.Common.SideModalDropdownButton)
local useScrollbarOffsetModule = require(genericAbuseReporting.Common.useScrollbarOffset)

return reactModule.memo(function(p1)
	-- upvalues: useLayerCollector (ref), useTokens (ref), reactModule (ref), useScrollbarOffsetModule (ref), reactFocusNavigationModule (ref), coreGuiService (ref), view (ref), text (ref), overlayProvider (ref), popover (ref), sideModalDropdownButtonModule (ref), popoverAlign (ref), popoverSide (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1 = useTokens()
	local absoluteSize = useLayerCollector().absoluteSize
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState({})
	local var6, var7 = reactModule.useState(Vector2.new(0, 0))
	local var8, var9 = reactModule.useState(Vector2.new(0, 0))
	local var10, var11 = reactModule.useState(Vector2.new(0, 0))
	local var12, var13 = reactModule.useState(Vector2.new(0, 0))
	local var14 = useScrollbarOffsetModule(var10, var12)
	local var15 = reactFocusNavigationModule.useFocusGuiObject()
	local var16 = reactModule.useRef(nil)
	local var17 = reactModule.useRef(nil)
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var18 = if VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local var19 = reactModule.useCallback(function()
		-- upvalues: var18 (ref), var15 (ref), var16 (ref), var3 (ref)
		if not var18 then
			var15(var16.current)
		end
		var3(false)
	end, { var16.current, var15, var18 })
	
	return reactModule.createElement(overlayProvider, { gui = var18 }, {
		DropdownWithPopover = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			ref = var16,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var7 (ref)
				var7(value.AbsoluteSize)
			end,
			LayoutOrder = p1.layoutOrder
		}, {
			Popover = reactModule.createElement(popover.Root, { isOpen = var2 }, {
				Anchor = reactModule.createElement(popover.Anchor, nil, reactModule.createElement(view, { Size = UDim2.new(0, var6.X, 0, var6.Y) }, {
					DropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
						onActivated = reactModule.useCallback(function()
							-- upvalues: var3 (ref), var2 (ref)
							var3(not var2)
						end, { var2 }),
						text = if var4.text and #var4.text > 0 then var4.text else p1.placeholder,
						isDropdownError = p1.errorState
					})
				})),
				Content = reactModule.createElement(popover.Content, {
					hasArrow = false,
					align = popoverAlign.Center,
					side = popoverSide.Bottom,
					onPressedOutside = var19,
					selection = { Selectable = true }
				}, {
					DropdownPopup = reactModule.createElement(view, { tag = "auto-xy" }, {
						AppFocusRoot = reactModule.createElement(appFocusRoot, {
							surfaceIdentifier = if var2 then focusNavigableSurfaceIdentifierEnum.ModerationOverlay else focusNavigableSurfaceIdentifierEnum.PopUp,
							isIsolated = var2,
							customEventHandlers = {
								[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var19) }
							}
						}, {
							reactModule.createElement(scrollView, {
								gradientHeight = 15,
								Size = UDim2.new(0, math.min(absoluteSize.X, var8.X + var14), 0, math.min(absoluteSize.Y, var8.Y)),
								scroll = {
									AutomaticCanvasSize = Enum.AutomaticSize.Y,
									CanvasSize = UDim2.new(1, 0, 0, 0),
									ScrollingDirection = Enum.ScrollingDirection.Y,
									scrollBarVisibility = scrollBarVisibility.Always
								},
								onAbsoluteCanvasSizeChanged = function(value)
									-- upvalues: var11 (ref)
									var11(value.AbsoluteCanvasSize)
								end,
								onAbsoluteWindowSizeChanged = function(value)
									-- upvalues: var13 (ref)
									var13(value.AbsoluteWindowSize)
								end
							}, {
								BaseMenu = reactModule.createElement(view, {
									tag = "auto-y col align-y-center gap-xsmall padding-xsmall",
									Size = UDim2.new(0, var6.X + var1.Stroke.Standard * 2, 0, 0),
									onAbsoluteSizeChanged = function(value)
										-- upvalues: var9 (ref)
										var9(value.AbsoluteSize)
									end,
									ref = var17
								}, reactModule.useMemo(function()
									-- upvalues: p1 (ref), var5 (ref), var19 (ref), reactModule (copy), view (copy), var4 (ref), text (copy)
									local t = {}
									
									for i, v in ipairs(p1.cellDatas) do
										table.insert(t, reactModule.createElement(view, {
											onActivated = function()
												-- upvalues: p1 (copy), v (ref), var5 (copy), var19 (copy)
												p1.onChange(if v.value == nil then v.text else v.value)
												var5(v)
												var19()
											end,
											selection = { Selectable = true },
											tag = {
												["size-full-0"] = true,
												["auto-y"] = true,
												["padding-small"] = true,
												["radius-medium"] = true,
												["bg-shift-200"] = var4 == v
											}
										}, {
											TextContainer = reactModule.createElement(view, { tag = "size-full-0 auto-y" }, {
												Text = reactModule.createElement(text, {
													TextWrapped = true,
													tag = "auto-xy",
													Text = v.text,
													TextXAlignment = Enum.TextXAlignment.Left
												})
											})
										}))
									end
									return t
								end, { p1.cellDatas, var4, p1.onChange, var19 }))
							})
						})
					})
				})
			})
		})
	})
end)