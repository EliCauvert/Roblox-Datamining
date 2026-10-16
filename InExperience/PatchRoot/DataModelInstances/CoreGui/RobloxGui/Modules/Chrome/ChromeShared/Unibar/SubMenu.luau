local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagEnableMenuTrailingBadge = SharedFlagsModule.FFlagEnableMenuTrailingBadge
local AvatarSwitcherHamburgerExposure = game:DefineFastFlag("AvatarSwitcherHamburgerExposure", false)
local AvatarSwitcherIXPLayer = game:DefineFastString("AvatarSwitcherIXPLayer", "UIEcosystem.User.Migration")
local FFlagUnibarMenuOpenSubmenu = require(script.Parent.Parent.Parent.Flags).FFlagUnibarMenuOpenSubmenu
local FFlagTokenizeUnibarConstantsWithStyleProvider = require(ChromeShared.Flags).FFlagTokenizeUnibarConstantsWithStyleProvider
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local GamepadUtils = if FFlagEnableConsoleExpControls then require(CorePackages.Workspace.Packages.InputUi).Gamepad.GamepadUtils else nil
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Interactable = UIBloxModule.Core.Control.Interactable
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local VerticalScrollView = UIBloxModule.App.Container.VerticalScrollView
local ScrollBarType = UIBloxModule.App.Container.Enum.ScrollBarType
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local IXPServiceWrapper = require(CorePackages.Workspace.Packages.IxpServiceWrapper).IXPServiceWrapper
local FoundationModule = require(CorePackages.Packages.Foundation)
local UseCursorFunction = FoundationModule.Hooks.useCursor
local ServiceModule = require(ChromeShared.Service)
local ViewportUtilModule = require(ChromeShared.Service.ViewportUtil)
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local MenuIconContextModule = if FFlagEnableConsoleExpControls then require(ChromeShared.Parent.Parent.TopBar.Components.MenuIconContext) else nil
local SubMenuContextModule = require(ChromeShared.Unibar.SubMenuContext)
local MenuTrailingBadgeModule = if FFlagEnableMenuTrailingBadge then require(ChromeShared.Unibar.MenuTrailingBadge) else nil
local UnibarStyle = require(CorePackages.Workspace.Packages.Chrome).UnibarStyle
local UserInputService = game:GetService("UserInputService")
local UseChromeMenuItemsModule = require(ChromeShared.Hooks.useChromeMenuItems)
local UseObservableValueModule = require(ChromeShared.Hooks.useObservableValue)
local UseTopbarInsetHeightModule = require(ChromeShared.Hooks.useTopbarInsetHeight)
local UseMappedObservableValueModule = require(ChromeShared.Hooks.useMappedObservableValue)
local FixChromeIntegrationLayoutBug = game:DefineFastFlag("FixChromeIntegrationLayoutBug", false)
local IsSpatialFunction = require(CorePackages.Workspace.Packages.AppCommonLib).isSpatial
local IsInExperienceUIVREnabled = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).isInExperienceUIVREnabled
local InExperienceUIVRIXP = require(CorePackages.Workspace.Packages.SharedExperimentDefinition).InExperienceUIVRIXP
local UIManager = if IsInExperienceUIVREnabled then require(CorePackages.Workspace.Packages.VrSpatialUi).UIManager else nil
local IconHostModule = require(ChromeShared.Unibar.ComponentHosts.IconHost)
local RoundedSlot = FoundationModule.Enums.CursorType.RoundedSlot
local _Vector2 = Vector2.new(0, 0)
local Items = {}
local v1 = nil

function MenuRow(Integration) --[[ Line: 86 ]]
	-- upvalues: UseStyleFunction (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), ReactModule (copy), SubMenuContextModule (copy), FFlagEnableConsoleExpControls (copy), MenuIconContextModule (copy), ControlState (copy), FFlagEnableMenuTrailingBadge (copy), ServiceModule (copy), GuiService (copy), StyledTextLabel (copy), IconHostModule (copy), MenuTrailingBadgeModule (copy), IsInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), UIManager (ref), Interactable (copy), UseCursorFunction (copy), RoundedSlot (copy), FixChromeIntegrationLayoutBug (copy)
	local Theme = UseStyleFunction().Theme
	local config = { Transparency = 1, Color = Color3.new(0, 0, 0) }
	local SUBMENUROWPADDING = nil
	local ICONSIZE = nil
	local SUBMENUROWHEIGHT = nil
	local SUBMENUPADDINGLEFT = nil
	local SUBMENUPADDINGRIGHT = nil
	local SUBMENUROWLABELFONT = nil
	local SUBMENUROWCORNERRADIUS = nil
	
	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local UseResult = UnibarStyle.use()
		ICONSIZE = UseResult.ICON_SIZE
		SUBMENUROWHEIGHT = UseResult.SUB_MENU_ROW_HEIGHT
		SUBMENUPADDINGLEFT = UseResult.SUBMENU_PADDING_LEFT
		SUBMENUPADDINGRIGHT = UseResult.SUBMENU_PADDING_RIGHT
		SUBMENUROWLABELFONT = UseResult.SUBMENU_ROW_LABEL_FONT
		SUBMENUROWPADDING = UseResult.SUBMENU_ROW_PADDING
		SUBMENUROWCORNERRADIUS = UseResult.SUBMENU_ROW_CORNER_RADIUS
	else
		ICONSIZE = ConstantsModule.ICON_SIZE
		SUBMENUROWHEIGHT = ConstantsModule.SUB_MENU_ROW_HEIGHT
		SUBMENUPADDINGLEFT = ConstantsModule.SUBMENU_PADDING_LEFT
		SUBMENUPADDINGRIGHT = ConstantsModule.SUBMENU_PADDING_RIGHT
		SUBMENUROWLABELFONT = ConstantsModule.SUBMENU_ROW_LABEL_FONT
		SUBMENUROWPADDING = ConstantsModule.SUBMENU_ROW_PADDING
		SUBMENUROWCORNERRADIUS = ConstantsModule.SUBMENU_ROW_CORNER_RADIUS
	end
	local UseContextResult = ReactModule.useContext(SubMenuContextModule)
	local UseContextResult1 = if FFlagEnableConsoleExpControls then ReactModule.useContext(MenuIconContextModule) else nil
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(config)
	local MenuTrailingBadgeConfig = if FFlagEnableMenuTrailingBadge then Integration.integration.menuTrailingBadgeConfig else nil
	local Element = ReactModule.createElement(StyledTextLabel, {
		lineHeight = 1,
		fluidSizing = true,
		richText = true,
		size = if FFlagEnableMenuTrailingBadge then UDim2.fromScale(1, 1) else UDim2.new(1, -ICONSIZE - SUBMENUPADDINGLEFT - SUBMENUPADDINGRIGHT, 1, 0),
		fontStyle = SUBMENUROWLABELFONT,
		colorStyle = if UseContextResult then {
			Color = Theme.TextEmphasis.Color,
			Transparency = UseContextResult:map(function(p1: number): number --[[ Line: 161 ]]
				return 1 - p1
			end)
		} else Theme.TextEmphasis,
		text = Integration.integration.label,
		textTruncate = Enum.TextTruncate.AtEnd,
		textXAlignment = Enum.TextXAlignment.Left
	})
	local Element1 = ReactModule.createElement(ReactModule.Fragment, nil, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, SUBMENUPADDINGLEFT),
			PaddingRight = UDim.new(0, SUBMENUPADDINGRIGHT)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, SUBMENUROWPADDING)
		}),
		IconHost = ReactModule.createElement(IconHostModule, { disableButtonBehaviors = true, integration = Integration }),
		Label = if FFlagEnableMenuTrailingBadge then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(0, 1)
		}, {
			UIFlexItem = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }),
			StyledTextLabel = Element
		}) else Element,
		TrailingBadge = if FFlagEnableMenuTrailingBadge and MenuTrailingBadgeConfig then ReactModule.createElement(MenuTrailingBadgeModule, {
			integrationId = Integration.integration.id,
			config = MenuTrailingBadgeConfig
		}) else nil
	})
	
	return ReactModule.createElement(Interactable, {
		Size = UDim2.new(1, 0, 0, SUBMENUROWHEIGHT * (if IsInExperienceUIVREnabled and not InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then UIManager.getInstance():getAdditionalCameraScaleIfNeeded() else 1)),
		BorderSizePixel = 0,
		BackgroundTransparency = UseBindingResult:map(function(p1) --[[ Line: 225 ]]
			return p1.Transparency
		end),
		BackgroundColor3 = UseBindingResult:map(function(p1) --[[ Line: 228 ]]
			return p1.Color
		end),
		SelectionImageObject = UseCursorFunction(RoundedSlot),
		[ReactModule.Event.Activated] = ReactModule.useCallback(function() --[[ Line: 137 ]]
			-- upvalues: FFlagEnableConsoleExpControls (upval), ServiceModule (upval), GuiService (upval), Integration (copy)
			if FFlagEnableConsoleExpControls then
				ServiceModule:disableFocusNav()
				GuiService.SelectedCoreObject = nil
				ServiceModule:setShortcutBar(nil)
				ServiceModule:selectedItem():set(nil)
				Integration.activated()
				
				return
			else
				Integration.activated()
			end
		end, { Integration.id }),
		LayoutOrder = Integration.order,
		onStateChanged = ReactModule.useCallback(function(_, Hover) --[[ Line: 125 ]]
			-- upvalues: ControlState (upval), UseBindingResult2 (copy), Theme (copy), config (copy)
			if Hover == ControlState.Pressed then
				UseBindingResult2(Theme.BackgroundOnPress)
				
				return
			end
			if Hover == ControlState.Hover then
				UseBindingResult2(Theme.BackgroundOnHover)
				
				return
			else
				UseBindingResult2(config)
			end
		end),
		NextSelectionLeft = if FFlagEnableConsoleExpControls then UseContextResult1.menuIconRef else nil
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, SUBMENUROWCORNERRADIUS) }),
		RowLabel = if FixChromeIntegrationLayoutBug then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = Integration.order
		}, { Element1 }) else Element1
	})
end

function isLeft(HorizontalAlignment): boolean --[[ Line: 253 ]]
	return HorizontalAlignment == Enum.HorizontalAlignment.Left
end

function SubMenu(p1) --[[ Line: 257 ]]
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), UseObservableValueModule (copy), ViewportUtilModule (copy), UseTopbarInsetHeightModule (copy), FFlagTokenizeUnibarConstantsWithStyleProvider (copy), UnibarStyle (copy), ConstantsModule (copy), GuiService (copy), ServiceModule (copy), FFlagEnableConsoleExpControls (copy), UserInputService (copy), GamepadUtils (copy), AvatarSwitcherHamburgerExposure (copy), IXPServiceWrapper (copy), AvatarSwitcherIXPLayer (copy), IsInExperienceUIVREnabled (copy), InExperienceUIVRIXP (copy), UIManager (ref), IsSpatialFunction (copy), UserGameSettings (copy), UseMappedObservableValueModule (copy), VerticalScrollView (copy), ScrollBarType (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseRefResult = ReactModule.useRef(nil)
	local UseObservableValueModuleResult = UseObservableValueModule(ViewportUtilModule.screenSize)
	local UseTopbarInsetHeightModuleResult: number = UseTopbarInsetHeightModule()
	local ICONCELLWIDTH = nil
	local UNIBARENDPADDING = nil
	local UNIBARLEFTMARGIN = nil
	local SUBMENUROWHEIGHT = nil
	local SUBMENUCORNERRADIUS = nil
	local SUBMENUBOTTOMPADDING = nil
	
	if FFlagTokenizeUnibarConstantsWithStyleProvider then
		local UseResult = UnibarStyle.use()
		UNIBARLEFTMARGIN = UseResult.UNIBAR_LEFT_MARGIN
		ICONCELLWIDTH = UseResult.ICON_CELL_WIDTH
		UNIBARENDPADDING = UseResult.UNIBAR_END_PADDING
		SUBMENUROWHEIGHT = UseResult.SUB_MENU_ROW_HEIGHT
		SUBMENUCORNERRADIUS = UseResult.SUBMENU_CORNER_RADIUS
		SUBMENUBOTTOMPADDING = UseResult.SUBMENU_BOTTOM_PADDING
	else
		UNIBARLEFTMARGIN = ConstantsModule.UNIBAR_LEFT_MARGIN
		ICONCELLWIDTH = ConstantsModule.ICON_CELL_WIDTH
		UNIBARENDPADDING = ConstantsModule.UNIBAR_END_PADDING
		SUBMENUROWHEIGHT = ConstantsModule.SUB_MENU_ROW_HEIGHT
		SUBMENUCORNERRADIUS = ConstantsModule.SUBMENU_CORNER_RADIUS
		SUBMENUBOTTOMPADDING = ConstantsModule.SUBMENU_BOTTOM_PADDING
	end
	local ScaledSUBMENUROWHEIGHT = SUBMENUROWHEIGHT * 0.5
	ReactModule.useEffect(function() --[[ Line: 287 ]]
		-- upvalues: UseRefResult (copy), GuiService (upval), ServiceModule (upval), FFlagEnableConsoleExpControls (upval), UserInputService (upval), GamepadUtils (upval)
		local function _() --[[ Line: 288 | Named "moveLeft" ]]
			-- upvalues: UseRefResult (upval), GuiService (upval), ServiceModule (upval)
			if UseRefResult.current and UseRefResult.current:IsAncestorOf(GuiService.SelectedCoreObject) then
				ServiceModule:setSelectedByOffset(-1)
			end
		end
		
		local _ = function() --[[ Line: 295 | Named "moveRight" ]]
			-- upvalues: UseRefResult (upval), GuiService (upval), ServiceModule (upval)
			if UseRefResult.current and UseRefResult.current:IsAncestorOf(GuiService.SelectedCoreObject) then
				ServiceModule:setSelectedByOffset(1)
			end
		end
		
		local InputChangedConnection = if FFlagEnableConsoleExpControls then UserInputService.InputChanged:Connect(function(_) --[[ Line: 306 ]]
			-- upvalues: UserInputService (upval), GamepadUtils (upval), UseRefResult (upval), GuiService (upval), ServiceModule (upval)
			for _, Input in UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
				if Input.KeyCode == Enum.KeyCode.Thumbstick1 then
					local X: number = GamepadUtils.normalizeStickByDeadzone(Vector2.new(Input.Position.X, Input.Position.Y)).X
					
					if X < -0.5 then
						if UseRefResult.current and UseRefResult.current:IsAncestorOf(GuiService.SelectedCoreObject) then
							ServiceModule:setSelectedByOffset(-1)
						end
					elseif X > 0.5 and (UseRefResult.current and UseRefResult.current:IsAncestorOf(GuiService.SelectedCoreObject)) then
						ServiceModule:setSelectedByOffset(1)
					end
				end
			end
		end) else nil
		local InputBeganConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 328 ]]
			-- upvalues: UseRefResult (upval), GuiService (upval), ServiceModule (upval)
			local KeyCode = Input.KeyCode
			
			if KeyCode == Enum.KeyCode.Left or KeyCode == Enum.KeyCode.DPadLeft then
				if UseRefResult.current and UseRefResult.current:IsAncestorOf(GuiService.SelectedCoreObject) then
					ServiceModule:setSelectedByOffset(-1)
					
					return
				end
			elseif (KeyCode == Enum.KeyCode.Right or KeyCode == Enum.KeyCode.DPadRight) and (UseRefResult.current and UseRefResult.current:IsAncestorOf(GuiService.SelectedCoreObject)) then
				ServiceModule:setSelectedByOffset(1)
			end
		end)
		
		return function() --[[ Line: 337 ]]
			-- upvalues: FFlagEnableConsoleExpControls (upval), InputChangedConnection (ref), InputBeganConnection (copy)
			if FFlagEnableConsoleExpControls then
				InputChangedConnection:Disconnect()
			end
			InputBeganConnection:Disconnect()
		end
	end, {})
	
	if AvatarSwitcherHamburgerExposure then
		ReactModule.useEffect(function() --[[ Line: 347 ]]
			-- upvalues: IXPServiceWrapper (upval), AvatarSwitcherIXPLayer (upval)
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(AvatarSwitcherIXPLayer)
		end, {})
	end
	local NewUseTopbarInsetHeightModuleResult = UseTopbarInsetHeightModuleResult + ICONCELLWIDTH
	local ScaledSUBMENUROWHEIGHT1: number = if p1 and p1.items then SUBMENUROWHEIGHT * #p1.items else 0
	local ScaledScaledSUBMENUROWHEIGHT = ScaledSUBMENUROWHEIGHT1 * (if IsInExperienceUIVREnabled and not InExperienceUIVRIXP:isSpatialUIScalingFixEnabled() then UIManager.getInstance():getAdditionalCameraScaleIfNeeded() else 1)
	local Y = if p1.panelSize then p1.panelSize.Y else ScaledScaledSUBMENUROWHEIGHT
	local IsSpatial = IsInExperienceUIVREnabled and IsSpatialFunction()
	local Smallest: number = if IsSpatial then math.min(ScaledScaledSUBMENUROWHEIGHT, Y) else math.min(UseObservableValueModuleResult.Y - NewUseTopbarInsetHeightModuleResult, ScaledSUBMENUROWHEIGHT1)
	
	if not IsSpatial and UseObservableValueModuleResult.Y - NewUseTopbarInsetHeightModuleResult < ScaledSUBMENUROWHEIGHT1 then
		local Floored = math.floor((UseObservableValueModuleResult.Y - NewUseTopbarInsetHeightModuleResult) / SUBMENUROWHEIGHT)
		Smallest = if SUBMENUROWHEIGHT * Floored + ScaledSUBMENUROWHEIGHT <= UseObservableValueModuleResult.Y - NewUseTopbarInsetHeightModuleResult then SUBMENUROWHEIGHT * Floored + ScaledSUBMENUROWHEIGHT else SUBMENUROWHEIGHT * Floored - ScaledSUBMENUROWHEIGHT
	end
	local config = {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
			MinSize = if UserGameSettings.ReducedMotion or not p1.menuTransition then Vector2.new(0, Smallest) else p1.menuTransition:map(function(p2): Vector2 --[[ Line: 384 ]]
				-- upvalues: Smallest (ref)
				return Vector2.new(0, Smallest * p2)
			end)
		}),
		BottomPadding = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 10000,
			Size = UDim2.new(0, 0, 0, SUBMENUBOTTOMPADDING)
		})
	}
	
	for _, item in p1.items do
		config[item.id] = ReactModule.createElement(MenuRow, item)
	end
	local UseMappedObservableValueModuleResult = UseMappedObservableValueModule(ServiceModule:orderAlignment(), isLeft)
	local ScaledTransparency = UseStyleResult.Theme.BackgroundUIContrast.Transparency * UseStyleResult.Settings.PreferredTransparency
	
	return ReactModule.createElement("Frame", {
		Size = if IsSpatial then UDim2.new(1, 0, 0, if IsSpatial then math.min(ScaledScaledSUBMENUROWHEIGHT, Y) else ScaledScaledSUBMENUROWHEIGHT) else UDim2.new(0, ICONCELLWIDTH * 4 + UNIBARLEFTMARGIN + UNIBARENDPADDING * 2, 0, 0),
		AnchorPoint = if IsSpatial then Vector2.new(0, 1) elseif UseMappedObservableValueModuleResult then Vector2.zero else Vector2.new(1, 0),
		Position = if IsSpatial then UDim2.new(0, 0, 1, 0) else UDim2.new(0, -UseTopbarInsetHeightModuleResult - 2 + UNIBARLEFTMARGIN, 0, 0),
		BackgroundColor3 = Theme.BackgroundUIContrast.Color,
		BackgroundTransparency = if p1.menuTransition then p1.menuTransition:map(function(p2: number): number --[[ Line: 424 ]]
			-- upvalues: ScaledTransparency (copy)
			return ScaledTransparency + (1 - ScaledTransparency) * (1 - p2)
		end) else ScaledTransparency,
		AutomaticSize = if IsSpatial then nil else Enum.AutomaticSize.Y,
		ref = UseRefResult,
		SelectionGroup = if FFlagEnableConsoleExpControls then true else nil,
		SelectionBehaviorDown = if FFlagEnableConsoleExpControls then Enum.SelectionBehavior.Stop else nil
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, SUBMENUCORNERRADIUS) }),
		ScrollingFrame = ReactModule.createElement(VerticalScrollView, {
			selectable = false,
			size = UDim2.new(1, 0, 1, 0),
			canvasSizeY = UDim.new(0, if IsSpatial then ScaledScaledSUBMENUROWHEIGHT else ScaledSUBMENUROWHEIGHT1),
			scrollBarType = ScrollBarType.Compact
		}, config)
	})
end

return function(p2) --[[ Line: 450 ]]
	-- upvalues: ReactModule (copy), UseObservableValueModule (copy), ServiceModule (copy), UseChromeMenuItemsModule (copy), ReactOtterModule (copy), Items (ref), v1 (ref), ConstantsModule (copy), UserInputService (copy), _Vector2 (ref), IsInExperienceUIVREnabled (copy), IsSpatialFunction (copy), InExperienceUIVRIXP (copy), FFlagUnibarMenuOpenSubmenu (copy), SubMenuContextModule (copy)
	local Elements = {}
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseObservableValueModuleResult = UseObservableValueModule(ServiceModule:currentSubMenu())
	local _, UseStateResult2 = ReactModule.useState(0)
	local UseChromeMenuItemsModuleResult = UseChromeMenuItemsModule()
	local Children = {}
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0, function(p3) --[[ Line: 463 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p3)
	end)
	ReactModule.useEffect(function() --[[ Line: 468 ]]
		-- upvalues: Items (upval), Children (ref), v1 (upval), UseObservableValueModuleResult (copy), UseStateResult2 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), ConstantsModule (upval), UseRefResult2 (copy), UserInputService (upval), _Vector2 (upval), UseRefResult1 (copy), ServiceModule (upval), UseRefResult (copy), IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), InExperienceUIVRIXP (upval)
		Items = Children
		v1 = UseObservableValueModuleResult
		
		if UseObservableValueModuleResult then
			UseStateResult2(0)
			UseAnimatedBindingResult2(ReactOtterModule.spring(1, ConstantsModule.MENU_ANIMATION_SPRING))
			UseRefResult2.current = UserInputService.TouchStarted:Connect(function(Touch) --[[ Line: 476 ]]
				-- upvalues: _Vector2 (upval)
				_Vector2 = Vector2.new(Touch.Position.X, Touch.Position.Y)
			end)
			UseRefResult1.current = UserInputService.TouchTap:Connect(function(Entry) --[[ Line: 480 ]]
				-- upvalues: _Vector2 (upval), ServiceModule (upval)
				if Entry[1] - _Vector2 ~= Vector2.zero then return end
				local GetResult = ServiceModule:currentSubMenu():get()
				
				if GetResult then
					ServiceModule:toggleSubMenu(GetResult)
				end
			end)
			UseRefResult.current = UserInputService.InputEnded:Connect(function(Input, _) --[[ Line: 491 ]]
				-- upvalues: IsInExperienceUIVREnabled (upval), IsSpatialFunction (upval), InExperienceUIVRIXP (upval), ServiceModule (upval)
				if IsInExperienceUIVREnabled and IsSpatialFunction() and not InExperienceUIVRIXP:isMovePanelToCenter() then return end
				local IsUserInputTypeMatch = Input.UserInputType == Enum.UserInputType.MouseButton1
				local GetResult = ServiceModule:currentSubMenu():get()
				
				if GetResult and IsUserInputTypeMatch then
					ServiceModule:toggleSubMenu(GetResult)
				end
			end)
		else
			UseStateResult2(1)
			UseAnimatedBindingResult2(ReactOtterModule.spring(0, ConstantsModule.MENU_ANIMATION_SPRING))
		end
		return function() --[[ Line: 512 ]]
			-- upvalues: UseRefResult (upval), UseRefResult1 (upval), UseRefResult2 (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
			if UseRefResult1.current then
				UseRefResult1.current:Disconnect()
				UseRefResult1.current = nil
			end
			if UseRefResult2.current then
				UseRefResult2.current:Disconnect()
				UseRefResult2.current = nil
			end
		end
	end, { UseObservableValueModuleResult })
	
	if UseObservableValueModuleResult and UseChromeMenuItemsModuleResult then
		for _, value in UseChromeMenuItemsModuleResult do
			if UseObservableValueModuleResult == value.id then
				Children = value.children
				break
			end
		end
	end
	if #Children > 0 then
		Elements[UseObservableValueModuleResult] = ReactModule.createElement(SubMenu, {
			items = Children,
			menuTransition = UseAnimatedBindingResult,
			panelSize = p2.panelSize
		})
	elseif #Items > 0 then
		Elements[v1] = ReactModule.createElement(SubMenu, {
			items = Items,
			menuTransition = UseAnimatedBindingResult,
			panelSize = p2.panelSize
		})
	end
	return ReactModule.createElement("Frame", {
		Name = "SubMenuHost",
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = if IsInExperienceUIVREnabled and IsSpatialFunction() then UDim2.new(1, 0, 1, 0) else UDim2.new(0, 0, 1, 0),
		ref = if FFlagUnibarMenuOpenSubmenu then p2.subMenuHostRef else nil
	}, ReactModule.createElement(SubMenuContextModule.Provider, { value = UseAnimatedBindingResult }, Elements))
end