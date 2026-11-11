local Songbird = script:FindFirstAncestor("Songbird")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local CryoModule = require(Songbird.Parent.Cryo)
local FoundationModule = require(Songbird.Parent.Foundation)
local ReactModule = require(Songbird.Parent.React)
local ReactUtilsModule = require(Songbird.Parent.ReactUtils)
local ResponsiveModule = require(Songbird.Parent.Responsive)
local CollapsibleFrameModule = require(Songbird.Components.CollapsibleFrame)
local ConstantsModule = require(Songbird.constants)
local GetFFlagSongbirdPopoverSubmenuModule = require(Songbird.Flags.getFFlagSongbirdPopoverSubmenu)
local GetFFlagChromeMusicWindowTopbarReappearsOnGamepadFunction = require(Songbird.Parent.SharedFlags).GetFFlagChromeMusicWindowTopbarReappearsOnGamepad
local CreateNextOrderFunction = ReactUtilsModule.createNextOrder
local UsePreviousFunction = ReactUtilsModule.usePrevious
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState

local function _(p1)
	-- upvalues: UseEffectFunction (copy), GuiService (copy), ContextActionService (copy)
	UseEffectFunction(function()
		-- upvalues: p1 (copy), GuiService (upval), ContextActionService (upval)
		if p1 then
			ContextActionService:BindCoreAction("UnfocusMusicWindow", function(_, UserInputState)
				-- upvalues: GuiService (upval)
				if UserInputState == Enum.UserInputState.End then
					GuiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: ContextActionService (upval)
				ContextActionService:UnbindCoreAction("UnfocusMusicWindow")
			end
		else
			return nil
		end
	end, { p1 })
end

local config = {
	autoCollapseSeconds = 3,
	isSubMenuOpen = false,
	isFocused = false,
	onToggleSubMenu = function() end
}

return function(p1)
	-- upvalues: CryoModule (copy), config (copy), FoundationModule (copy), UseRefFunction (copy), ResponsiveModule (copy), GetFFlagChromeMusicWindowTopbarReappearsOnGamepadFunction (copy), UsePreviousFunction (copy), GetFFlagSongbirdPopoverSubmenuModule (copy), ConstantsModule (copy), CreateNextOrderFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), UseEffectFunction (copy), RunService (copy), GuiService (copy), ContextActionService (copy), ReactModule (copy), CollapsibleFrameModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseRefResult = UseRefFunction(nil)
	local UseRefResult1 = UseRefFunction(nil)
	local UseLastInputResult = ResponsiveModule.useLastInput()
	local UsePreviousResult = if GetFFlagChromeMusicWindowTopbarReappearsOnGamepadFunction() then UsePreviousFunction(UseLastInputResult) else nil
	local IsXBelow: boolean = if GetFFlagSongbirdPopoverSubmenuModule() or typeof(JoinResult.overflowButtonRef) ~= "table" or not JoinResult.overflowButtonRef.current then true else (JoinResult.overflowButtonRef.current.AbsolutePosition + Vector2.new(UseTokensResult.Gap.Small + ConstantsModule.SUBMENU_WIDTH, 0)).X < JoinResult.overflowButtonRef.current:FindFirstAncestorOfClass("ScreenGui").AbsoluteSize.X
	local NextOrder = CreateNextOrderFunction()
	local UseRefResult2 = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction(true)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: JoinResult (copy)
		if JoinResult.onClose then
			JoinResult.onClose()
		end
	end, { JoinResult.onClose })
	local UseCallbackResult1 = UseCallbackFunction(function(Default)
		-- upvalues: UseRefResult2 (copy), UseStateResult2 (copy), FoundationModule (upval)
		UseRefResult2.current = nil
		UseStateResult2(true)
		
		if Default == FoundationModule.Enums.ControlState.Default then
			UseRefResult2.current = os.time()
		end
	end, {})
	UseEffectFunction(function()
		-- upvalues: UseLastInputResult (copy), ResponsiveModule (upval), JoinResult (copy), RunService (upval), UseRefResult2 (copy), UseStateResult2 (copy)
		if UseLastInputResult ~= ResponsiveModule.Input.Pointer then return end
		if JoinResult.autoCollapseSeconds and JoinResult.autoCollapseSeconds > 0 then
			local HeartbeatConnection = RunService.Heartbeat:Connect(function()
				-- upvalues: UseRefResult2 (upval), JoinResult (upval), UseStateResult2 (upval)
				if UseRefResult2.current and JoinResult.autoCollapseSeconds <= os.time() - UseRefResult2.current then
					UseStateResult2(false)
				end
			end)
			
			return function()
				-- upvalues: HeartbeatConnection (copy)
				HeartbeatConnection:Disconnect()
			end
		else
			return nil
		end
	end, { JoinResult.autoCollapseSeconds, UseLastInputResult })
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(Vector2.new(1e999, 1e999))
	local UseCallbackResult2 = UseCallbackFunction(function(Frame)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize)
	end, {})
	UseEffectFunction(function()
		-- upvalues: UseRefResult1 (copy), JoinResult (copy)
		local Current = UseRefResult1.current
		
		if Current then
			local SelectionChangedConnection = Current.SelectionChanged:Connect(function(_, _, p2)
				-- upvalues: Current (copy), JoinResult (upval)
				if not Current:IsAncestorOf(p2) and JoinResult.onUnfocus then
					JoinResult.onUnfocus()
				end
			end)
			
			return function()
				-- upvalues: SelectionChangedConnection (copy)
				SelectionChangedConnection:Disconnect()
			end
		else
			return nil
		end
	end, { JoinResult.onUnfocus })
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), GuiService (upval), UseRefResult (copy)
		if JoinResult.isFocused then
			GuiService.SelectedCoreObject = UseRefResult.current
		end
	end, { JoinResult.isFocused })
	local IsFocused = JoinResult.isFocused
	UseEffectFunction(function()
		-- upvalues: IsFocused (copy), GuiService (upval), ContextActionService (upval)
		if IsFocused then
			ContextActionService:BindCoreAction("UnfocusMusicWindow", function(_, UserInputState)
				-- upvalues: GuiService (upval)
				if UserInputState == Enum.UserInputState.End then
					GuiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: ContextActionService (upval)
				ContextActionService:UnbindCoreAction("UnfocusMusicWindow")
			end
		else
			return nil
		end
	end, { IsFocused })
	
	if GetFFlagChromeMusicWindowTopbarReappearsOnGamepadFunction() then
		UseEffectFunction(function()
			-- upvalues: UsePreviousResult (copy), UseLastInputResult (copy), ResponsiveModule (upval), UseStateResult2 (copy)
			if UsePreviousResult and UseLastInputResult ~= UsePreviousResult and UseLastInputResult ~= ResponsiveModule.Input.Pointer then
				UseStateResult2(true)
			end
		end, { UseLastInputResult, UsePreviousResult })
	end
	return ReactModule.createElement(FoundationModule.View, {
		tag = "auto-xy",
		sizeConstraint = {
			MaxSize = if JoinResult.maxSize then JoinResult.maxSize else nil
		},
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		},
		onStateChanged = UseCallbackResult1,
		ref = if GetFFlagSongbirdPopoverSubmenuModule() then UseRefResult1 else nil
	}, {
		WindowFrame = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y bg-over-media-100 radius-medium col gap-xxsmall stroke-emphasis"
		}, {
			CollapsibleTitleBar = ReactModule.createElement(CollapsibleFrameModule, {
				isCollapsed = not UseStateResult,
				LayoutOrder = NextOrder()
			}, {
				TitleBar = ReactModule.createElement(FoundationModule.View, { tag = "size-full-0 auto-y row flex-between items-center" }, {
					Actions = ReactModule.createElement(FoundationModule.View, {
						tag = "auto-xy row",
						LayoutOrder = NextOrder(),
						onAbsoluteSizeChanged = UseCallbackResult2
					}, {
						CloseButton = ReactModule.createElement(FoundationModule.IconButton, {
							icon = FoundationModule.Enums.IconName.X,
							layoutOrder = NextOrder(),
							size = FoundationModule.Enums.IconSize.Medium,
							onActivated = UseCallbackResult,
							ref = UseRefResult
						})
					}),
					CenterAlignedTitle = ReactModule.createElement(FoundationModule.View, {
						tag = "size-full-0 shrink auto-y",
						LayoutOrder = NextOrder()
					}, {
						Title = ReactModule.createElement(FoundationModule.Text, {
							tag = "size-full-0 text-title-medium content-emphasis",
							Text = JoinResult.title,
							fontStyle = UseTokensResult.Typography.TitleMedium,
							Position = UDim2.new(0, -UseStateResult1.X / 2, 0, 0)
						})
					})
				})
			}),
			Divider = if UseStateResult then ReactModule.createElement(FoundationModule.View, {
				backgroundStyle = UseTokensResult.Color.Stroke.Emphasis,
				Size = UDim2.new(1, 0, 0, 1),
				LayoutOrder = NextOrder()
			}) else nil,
			Content = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y row flex-between items-center padding-left-small padding-y-small",
				LayoutOrder = NextOrder()
			}, {
				Body = ReactModule.createElement(FoundationModule.View, {
					tag = "size-full-0 auto-y shrink clip",
					LayoutOrder = NextOrder()
				}, JoinResult.children),
				Actions = ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy row flex-between items-center",
					LayoutOrder = NextOrder()
				}, {
					CustomActions = if JoinResult.actions then ReactModule.createElement(FoundationModule.View, { tag = "row auto-xy", LayoutOrder = NextOrder() }, JoinResult.actions) else nil,
					OverflowButton = if GetFFlagSongbirdPopoverSubmenuModule() then if JoinResult.menuItems and UseLastInputResult ~= ResponsiveModule.Input.Directional then ReactModule.createElement(FoundationModule.IconButton, {
						icon = "icons/common/overflow",
						size = FoundationModule.Enums.IconSize.Medium,
						onActivated = JoinResult.onToggleSubMenu,
						LayoutOrder = NextOrder()
					}) else nil elseif JoinResult.submenu and UseLastInputResult ~= ResponsiveModule.Input.Directional then ReactModule.createElement(FoundationModule.IconButton, {
						icon = "icons/common/overflow",
						size = FoundationModule.Enums.IconSize.Medium,
						onActivated = JoinResult.onToggleSubMenu,
						LayoutOrder = NextOrder(),
						ref = JoinResult.overflowButtonRef
					}) else nil
				})
			})
		}),
		SubMenu = if GetFFlagSongbirdPopoverSubmenuModule() then nil elseif JoinResult.submenu and JoinResult.isSubMenuOpen then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy bg-over-media-200 radius-medium padding-small",
			Position = if IsXBelow then UDim2.fromScale(1, 0) + UDim2.fromOffset(UseTokensResult.Gap.Small, 0) else UDim2.new(1, -ConstantsModule.SUBMENU_WIDTH - ConstantsModule.ICON_BUTTON_WIDTH / 2, 1, 0) + UDim2.fromOffset(UseTokensResult.Gap.Small / 2, UseTokensResult.Gap.Small)
		}, JoinResult.submenu) else nil,
		OverflowMenu = if GetFFlagSongbirdPopoverSubmenuModule() and JoinResult.menuItems then ReactModule.createElement(FoundationModule.Menu, {
			isOpen = JoinResult.isSubMenuOpen,
			items = JoinResult.menuItems,
			side = FoundationModule.Enums.PopoverSide.Right,
			align = FoundationModule.Enums.PopoverAlign.Center,
			anchorRef = UseRefResult1,
			onPressedOutside = JoinResult.onToggleSubMenu
		}) else nil
	})
end