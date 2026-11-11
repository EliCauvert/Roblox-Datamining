local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseLastInputModeFunction = FocusNavigationUtilsModule.useLastInputMode
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local SideModalDropdownButtonModule = require(AuthCommon.Components.SideModalDropdownButton)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FFlagUseBirthdayDropdownForGamepad = require(Parent.SharedFlags).FFlagUseBirthdayDropdownForGamepad

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseSelectorFunction (copy), selectScreenSize (copy), ReactModule (copy), FFlagUseBirthdayDropdownForGamepad (copy), UseLastInputModeFunction (copy), ReactFocusNavigationModule (copy), View (copy), Text (copy), Popover (copy), SideModalDropdownButtonModule (copy), PopoverAlign (copy), PopoverSide (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Vector2.new(0, 0))
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local IsFocus = if FFlagUseBirthdayDropdownForGamepad then UseLastInputModeFunction() == "Focus" else nil
	local UseFocusGuiObjectResult = if FFlagUseBirthdayDropdownForGamepad then ReactFocusNavigationModule.useFocusGuiObject() else nil
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2_1 (copy)
		if p1.value == nil then
			UseStateResult2_1({})
			
			return
		end
		for _, cellData in ipairs(p1.cellDatas) do
			if cellData.value == p1.value then
				UseStateResult2_1(cellData)
				break
			end
		end
	end, { p1.value, p1.cellDatas })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: FFlagUseBirthdayDropdownForGamepad (upval), UseFocusGuiObjectResult (copy), IsFocus (copy), UseRefResult (copy), UseStateResult2 (copy)
		if FFlagUseBirthdayDropdownForGamepad and UseFocusGuiObjectResult and IsFocus then
			UseFocusGuiObjectResult(UseRefResult.current)
		end
		UseStateResult2(false)
	end, { UseRefResult.current, IsFocus })
	ReactModule.useEffect(function()
		-- upvalues: FFlagUseBirthdayDropdownForGamepad (upval), UseFocusGuiObjectResult (copy), p1 (copy), UseRefResult (copy)
		if FFlagUseBirthdayDropdownForGamepad and UseFocusGuiObjectResult and p1.focusOnMount then
			UseFocusGuiObjectResult(UseRefResult.current)
		end
	end, { UseRefResult.current })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult (copy)
		if p1.onDropdownOpened then
			p1.onDropdownOpened(UseStateResult)
		end
	end, { UseStateResult })
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 auto-y",
		ref = UseRefResult,
		onAbsoluteSizeChanged = function(Frame)
			-- upvalues: UseStateResult2_2 (copy)
			UseStateResult2_2(Frame.AbsoluteSize)
		end,
		LayoutOrder = p1.layoutOrder
	}, {
		Popover = ReactModule.createElement(Popover.Root, { isOpen = UseStateResult }, {
			Anchor = ReactModule.createElement(Popover.Anchor, nil, ReactModule.createElement(View, {
				Size = UDim2.new(0, UseStateResult3.X, 0, UseStateResult3.Y)
			}, {
				DropdownButton = ReactModule.createElement(SideModalDropdownButtonModule, {
					onActivated = ReactModule.useCallback(function()
						-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
						UseStateResult2(not UseStateResult)
					end, { UseStateResult }),
					text = if UseStateResult1.text and #UseStateResult1.text > 0 then UseStateResult1.text elseif p1.placeholder then p1.placeholder else "",
					isDropdownError = p1.errorState,
					backgroundColorToken = if FFlagUseBirthdayDropdownForGamepad then p1.backgroundColorToken else nil,
					height = if FFlagUseBirthdayDropdownForGamepad then p1.dropdownHeight else nil,
					fixSizeToParent = if FFlagUseBirthdayDropdownForGamepad then p1.fixSizeToParent else nil
				})
			})),
			Content = ReactModule.createElement(Popover.Content, {
				hasArrow = false,
				align = PopoverAlign.Center,
				side = PopoverSide.Bottom,
				selection = { Selectable = true }
			}, {
				DropdownPopup = ReactModule.createElement(View, { tag = "auto-xy" }, {
					AppFocusRoot = ReactModule.createElement(AppFocusRoot, {
						surfaceIdentifier = if UseStateResult then FocusNavigableSurfaceIdentifierEnum.ModerationOverlay else FocusNavigableSurfaceIdentifierEnum.PopUp,
						isIsolated = UseStateResult,
						customEventHandlers = {
							[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult) }
						}
					}, {
						ReactModule.createElement(ScrollView, {
							gradientHeight = 15,
							Size = UDim2.new(0, math.min(UseSelectorResult.X, UseStateResult4.X), 0, (math.min(500, UseSelectorResult.Y - (p1.topOffset or 0), UseStateResult4.Y))),
							scroll = {
								AutomaticCanvasSize = Enum.AutomaticSize.Y,
								CanvasSize = UDim2.new(1, 0, 0, 0),
								ScrollingDirection = Enum.ScrollingDirection.Y,
								scrollBarVisibility = ScrollBarVisibility.Always
							}
						}, {
							BaseMenu = ReactModule.createElement(View, {
								tag = "auto-y col align-y-center gap-xsmall padding-xsmall",
								Size = UDim2.new(0, UseStateResult3.X + UseTokensResult.Stroke.Standard * 2, 0, 0),
								onAbsoluteSizeChanged = function(Frame)
									-- upvalues: UseStateResult2_3 (copy)
									UseStateResult2_3(Frame.AbsoluteSize)
								end,
								ref = UseRefResult1
							}, (ReactModule.useMemo(function()
								-- upvalues: p1 (copy), UseResult (copy), ReactModule (upval), View (upval), UseStateResult1 (copy), Text (upval)
								local Elements = {}
								
								for _, cellData in ipairs(p1.cellDatas) do
									table.insert(Elements, ReactModule.createElement(View, {
										onActivated = function()
											-- upvalues: p1 (upval), cellData (copy), UseResult (upval)
											p1.onChange(cellData.value)
											UseResult()
										end,
										selection = { Selectable = true },
										tag = {
											["size-full-0"] = true,
											["auto-y"] = true,
											["padding-small"] = true,
											["radius-medium"] = true,
											["bg-shift-200"] = UseStateResult1 == cellData
										}
									}, {
										TextContainer = ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, {
											Text = ReactModule.createElement(Text, {
												TextWrapped = true,
												tag = "auto-xy",
												Text = cellData.text,
												TextXAlignment = Enum.TextXAlignment.Left
											})
										})
									}))
								end
								return Elements
							end, { p1.cellDatas, UseStateResult1, p1.onChange, UseResult })))
						})
					})
				})
			})
		})
	})
end)