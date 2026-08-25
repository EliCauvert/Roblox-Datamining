local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local foundationModule = require(parent.Foundation)
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local appFocusRoot = focusNavigationUtilsModule.AppFocusRoot
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useLastInputMode = focusNavigationUtilsModule.useLastInputMode
local popover = foundationModule.Popover
local popoverAlign = foundationModule.Enums.PopoverAlign
local popoverSide = foundationModule.Enums.PopoverSide
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local scrollView = foundationModule.ScrollView
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local sideModalDropdownButtonModule = require(authCommon.Components.SideModalDropdownButton)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)

local function selectScreenSize(p0)
	return p0.ScreenSize
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useSelector (ref), selectScreenSize (ref), reactModule (ref), useLastInputMode (ref), reactFocusNavigationModule (ref), view (ref), text (ref), popover (ref), sideModalDropdownButtonModule (ref), popoverAlign (ref), popoverSide (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var8 = useTokens()
	local var9 = useSelector(selectScreenSize)
	local var10, var11 = reactModule.useState(false)
	local var12, var13 = reactModule.useState({})
	local var14, var15 = reactModule.useState(Vector2.new(0, 0))
	local var16, var17 = reactModule.useState(Vector2.new(0, 0))
	local var18 = reactModule.useRef(nil)
	local var19 = reactModule.useRef(nil)
	local isFocus = useLastInputMode() == "Focus"
	local var21 = reactFocusNavigationModule.useFocusGuiObject()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var13 (ref)
		if p1.value == nil then
			var13({})
			
			return
		end
		for i, v in ipairs(p1.cellDatas) do
			if v.value == p1.value then
				var13(v)
				
				return
			end
		end
	end, { p1.value, p1.cellDatas })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var21 (ref), isFocus (ref), var18 (ref), var11 (ref)
		if var21 and isFocus then
			var21(var18.current)
		end
		var11(false)
	end, { var18.current, isFocus, var21 })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), p1 (ref), var18 (ref)
		if var21 and p1.focusOnMount then
			var21(var18.current)
		end
	end, { var18.current, var21, p1.focusOnMount })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var10 (ref)
		if p1.onDropdownOpened then
			p1.onDropdownOpened(var10)
		end
	end, { var10, p1.onDropdownOpened })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		ref = var18,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var15 (ref)
			var15(value.AbsoluteSize)
		end,
		LayoutOrder = p1.layoutOrder
	}, {
		Popover = reactModule.createElement(popover.Root, { isOpen = var10 }, {
			Anchor = reactModule.createElement(popover.Anchor, nil, reactModule.createElement(view, { Size = UDim2.new(0, var14.X, 0, var14.Y) }, {
				DropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
					onActivated = reactModule.useCallback(function()
						-- upvalues: var11 (ref), var10 (ref)
						var11(not var10)
					end, { var10 }),
					text = if var12.text and #var12.text > 0 then var12.text elseif p1.placeholder then p1.placeholder else "",
					isDropdownError = p1.errorState,
					backgroundColorToken = p1.backgroundColorToken,
					height = p1.dropdownHeight,
					fixSizeToParent = p1.fixSizeToParent
				})
			})),
			Content = reactModule.createElement(popover.Content, {
				hasArrow = false,
				align = popoverAlign.Center,
				side = popoverSide.Bottom,
				selection = { Selectable = true }
			}, {
				DropdownPopup = reactModule.createElement(view, { tag = "auto-xy" }, {
					AppFocusRoot = reactModule.createElement(appFocusRoot, {
						surfaceIdentifier = if var10 then focusNavigableSurfaceIdentifierEnum.ModerationOverlay else focusNavigableSurfaceIdentifierEnum.PopUp,
						isIsolated = var10,
						customEventHandlers = {
							[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var22) }
						}
					}, {
						reactModule.createElement(scrollView, {
							gradientHeight = 15,
							Size = UDim2.new(0, math.min(var9.X, var16.X), 0, math.min(500, var9.Y - (p1.topOffset or 0), var16.Y)),
							scroll = {
								AutomaticCanvasSize = Enum.AutomaticSize.Y,
								CanvasSize = UDim2.new(1, 0, 0, 0),
								ScrollingDirection = Enum.ScrollingDirection.Y,
								scrollBarVisibility = scrollBarVisibility.Always
							}
						}, {
							BaseMenu = reactModule.createElement(view, {
								tag = "auto-y col align-y-center gap-xsmall padding-xsmall",
								Size = UDim2.new(0, var14.X + var8.Stroke.Standard * 2, 0, 0),
								onAbsoluteSizeChanged = function(value)
									-- upvalues: var17 (ref)
									var17(value.AbsoluteSize)
								end,
								ref = var19
							}, reactModule.useMemo(function()
								-- upvalues: p1 (ref), var22 (ref), reactModule (copy), view (copy), var12 (ref), text (copy)
								local t = {}
								
								for i, v in ipairs(p1.cellDatas) do
									table.insert(t, reactModule.createElement(view, {
										onActivated = function()
											-- upvalues: p1 (copy), v (ref), var22 (copy)
											p1.onChange(v.value)
											var22()
										end,
										selection = { Selectable = true },
										tag = {
											["size-full-0"] = true,
											["auto-y"] = true,
											["padding-small"] = true,
											["radius-medium"] = true,
											["bg-shift-200"] = var12 == v
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
							end, { p1.cellDatas, var12, p1.onChange, var22 }))
						})
					})
				})
			})
		})
	})
end)