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

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useSelector (ref), selectScreenSize (ref), reactModule (ref), useLastInputMode (ref), reactFocusNavigationModule (ref), view (ref), text (ref), popover (ref), sideModalDropdownButtonModule (ref), popoverAlign (ref), popoverSide (ref), appFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), scrollView (ref), scrollBarVisibility (ref)
	local var1 = useTokens()
	local var2 = useSelector(selectScreenSize)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState({})
	local var7, var8 = reactModule.useState(Vector2.new(0, 0))
	local var9, var10 = reactModule.useState(Vector2.new(0, 0))
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(nil)
	local isFocus = useLastInputMode() == "Focus"
	local var13 = reactFocusNavigationModule.useFocusGuiObject()
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var6 (ref)
		if p1.value == nil then
			var6({})
			
			return
		end
		for i, v in ipairs(p1.cellDatas) do
			if v.value == p1.value then
				var6(v)
				
				return
			end
		end
	end, { p1.value, p1.cellDatas })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var13 (ref), isFocus (ref), var11 (ref), var4 (ref)
		if var13 and isFocus then
			var13(var11.current)
		end
		var4(false)
	end, { var11.current, isFocus, var13 })
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), p1 (ref), var11 (ref)
		if var13 and p1.focusOnMount then
			var13(var11.current)
		end
	end, { var11.current, var13, p1.focusOnMount })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.onDropdownOpened then
			p1.onDropdownOpened(var3)
		end
	end, { var3, p1.onDropdownOpened })
	
	return reactModule.createElement(view, {
		tag = "size-full-0 auto-y",
		ref = var11,
		onAbsoluteSizeChanged = function(value)
			-- upvalues: var8 (ref)
			var8(value.AbsoluteSize)
		end,
		LayoutOrder = p1.layoutOrder
	}, {
		Popover = reactModule.createElement(popover.Root, { isOpen = var3 }, {
			Anchor = reactModule.createElement(popover.Anchor, nil, reactModule.createElement(view, { Size = UDim2.new(0, var7.X, 0, var7.Y) }, {
				DropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
					onActivated = reactModule.useCallback(function()
						-- upvalues: var4 (ref), var3 (ref)
						var4(not var3)
					end, { var3 }),
					text = if var5.text and #var5.text > 0 then var5.text elseif p1.placeholder then p1.placeholder else "",
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
						surfaceIdentifier = if var3 then focusNavigableSurfaceIdentifierEnum.ModerationOverlay else focusNavigableSurfaceIdentifierEnum.PopUp,
						isIsolated = var3,
						customEventHandlers = {
							[focusNavigationEventNameEnum.NavigateBack] = { handler = inputHandlersModule.onRelease(var14) }
						}
					}, {
						reactModule.createElement(scrollView, {
							gradientHeight = 15,
							Size = UDim2.new(0, math.min(var2.X, var9.X), 0, math.min(500, var2.Y - (p1.topOffset or 0), var9.Y)),
							scroll = {
								AutomaticCanvasSize = Enum.AutomaticSize.Y,
								CanvasSize = UDim2.new(1, 0, 0, 0),
								ScrollingDirection = Enum.ScrollingDirection.Y,
								scrollBarVisibility = scrollBarVisibility.Always
							}
						}, {
							BaseMenu = reactModule.createElement(view, {
								tag = "auto-y col align-y-center gap-xsmall padding-xsmall",
								Size = UDim2.new(0, var7.X + var1.Stroke.Standard * 2, 0, 0),
								onAbsoluteSizeChanged = function(value)
									-- upvalues: var10 (ref)
									var10(value.AbsoluteSize)
								end,
								ref = var12
							}, reactModule.useMemo(function()
								-- upvalues: p1 (ref), var14 (ref), reactModule (copy), view (copy), var5 (ref), text (copy)
								local t = {}
								
								for i, v in ipairs(p1.cellDatas) do
									table.insert(t, reactModule.createElement(view, {
										onActivated = function()
											-- upvalues: p1 (copy), v (ref), var14 (copy)
											p1.onChange(v.value)
											var14()
										end,
										selection = { Selectable = true },
										tag = {
											["size-full-0"] = true,
											["auto-y"] = true,
											["padding-small"] = true,
											["radius-medium"] = true,
											["bg-shift-200"] = var5 == v
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
							end, { p1.cellDatas, var5, p1.onChange, var14 }))
						})
					})
				})
			})
		})
	})
end)