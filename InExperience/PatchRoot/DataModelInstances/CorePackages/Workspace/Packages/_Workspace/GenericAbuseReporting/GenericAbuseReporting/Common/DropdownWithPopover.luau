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

return reactModule.memo(function(p0)
	-- upvalues: useLayerCollector (ref), useTokens (ref), reactModule (ref), useScrollbarOffsetModule (ref), reactFocusNavigationModule (ref), coreGuiService (ref), view (ref), text (ref), overlayProvider (ref), popover (ref), sideModalDropdownButtonModule (ref), popoverAlign (ref), popoverSide (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var10 = useTokens()
	local absoluteSize = useLayerCollector().absoluteSize
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState({})
	local var15, var16 = reactModule.useState(Vector2.new(0, 0))
	local var17, var18 = reactModule.useState(Vector2.new(0, 0))
	local var19, var20 = reactModule.useState(Vector2.new(0, 0))
	local var21, var22 = reactModule.useState(Vector2.new(0, 0))
	local var23 = useScrollbarOffsetModule(var19, var21)
	local var24 = reactFocusNavigationModule.useFocusGuiObject()
	local var25 = reactModule.useRef(nil)
	local var26 = reactModule.useRef(nil)
	local VRCentralOverlay = coreGuiService:FindFirstChild("VRCentralOverlay")
	local var28 = if VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local var29 = reactModule.useCallback(function()
		-- upvalues: var28 (ref), var24 (ref), var25 (ref), var12 (ref)
		if not var28 then
			var24(var25.current)
		end
		var12(false)
	end, { var25.current, var24, var28 })
	
	return reactModule.createElement(overlayProvider, { gui = var28 }, {
		DropdownWithPopover = reactModule.createElement(view, {
			tag = "size-full-0 auto-y",
			ref = var25,
			onAbsoluteSizeChanged = function(value)
				-- upvalues: var16 (ref)
				var16(value.AbsoluteSize)
			end,
			LayoutOrder = p0.layoutOrder
		}, {
			Popover = reactModule.createElement(popover.Root, { isOpen = var11 }, {
				Anchor = reactModule.createElement(popover.Anchor, nil, reactModule.createElement(view, { Size = UDim2.new(0, var15.X, 0, var15.Y) }, {
					DropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
						onActivated = reactModule.useCallback(function()
							-- upvalues: var12 (ref), var11 (ref)
							var12(not var11)
						end, { var11 }),
						text = if var13.text and #var13.text > 0 then var13.text else p0.placeholder,
						isDropdownError = p0.errorState
					})
				})),
				Content = reactModule.createElement(popover.Content, {
					hasArrow = false,
					align = popoverAlign.Center,
					side = popoverSide.Bottom,
					onPressedOutside = var29,
					selection = { Selectable = true }
				}, {
					DropdownPopup = reactModule.createElement(view, { tag = "auto-xy" }, {
						AppFocusRoot = reactModule.createElement(appFocusRoot, {
							surfaceIdentifier = if var11 then focusNavigableSurfaceIdentifierEnum.ModerationOverlay else focusNavigableSurfaceIdentifierEnum.PopUp,
							isIsolated = var11,
							customEventHandlers = {
								[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var29) }
							}
						}, {
							reactModule.createElement(scrollView, {
								gradientHeight = 15,
								Size = UDim2.new(0, math.min(absoluteSize.X, var17.X + var23), 0, math.min(absoluteSize.Y, var17.Y)),
								scroll = {
									AutomaticCanvasSize = Enum.AutomaticSize.Y,
									CanvasSize = UDim2.new(1, 0, 0, 0),
									ScrollingDirection = Enum.ScrollingDirection.Y,
									scrollBarVisibility = scrollBarVisibility.Always
								},
								onAbsoluteCanvasSizeChanged = function(value)
									-- upvalues: var20 (ref)
									var20(value.AbsoluteCanvasSize)
								end,
								onAbsoluteWindowSizeChanged = function(value)
									-- upvalues: var22 (ref)
									var22(value.AbsoluteWindowSize)
								end
							}, {
								BaseMenu = reactModule.createElement(view, {
									tag = "auto-y col align-y-center gap-xsmall padding-xsmall",
									Size = UDim2.new(0, var15.X + var10.Stroke.Standard * 2, 0, 0),
									onAbsoluteSizeChanged = function(value)
										-- upvalues: var18 (ref)
										var18(value.AbsoluteSize)
									end,
									ref = var26
								}, reactModule.useMemo(function()
									-- upvalues: p0 (ref), var14 (ref), var29 (ref), reactModule (copy), view (copy), var13 (ref), text (copy)
									local t = {}
									
									for i, v in ipairs(p0.cellDatas) do
										table.insert(t, reactModule.createElement(view, {
											onActivated = function()
												-- upvalues: p0 (copy), v (ref), var14 (copy), var29 (copy)
												p0.onChange(if v.value == nil then v.text else v.value)
												var14(v)
												var29()
											end,
											selection = { Selectable = true },
											tag = {
												["size-full-0"] = true,
												["auto-y"] = true,
												["padding-small"] = true,
												["radius-medium"] = true,
												["bg-shift-200"] = var13 == v
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
								end, { p0.cellDatas, var13, p0.onChange, var29 }))
							})
						})
					})
				})
			})
		})
	})
end)