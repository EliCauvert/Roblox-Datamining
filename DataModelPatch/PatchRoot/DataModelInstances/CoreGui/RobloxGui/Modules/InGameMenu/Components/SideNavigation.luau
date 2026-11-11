local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local UIBlox = InGameMenuDependenciesModule.UIBlox
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local Interactable = UIBlox.Core.Control.Interactable
local ControlState = UIBlox.Core.Control.Enum.ControlState
local Parent = script.Parent.Parent
local FocusHandlerModule = require(Parent.Components.Connection.FocusHandler)
local ZonePortalModule = require(Parent.Components.ZonePortal)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local SetCurrentPageModule = require(Parent.Actions.SetCurrentPage)
local ConstantsModule = require(Parent.Resources.Constants)
local DirectionModule = require(Parent.Enums.Direction)
local CloseMenuButtonModule = require(script.CloseMenuButton)
local HomeButtonModule = require(script.HomeButton)
local SystemMenuButtonModule = require(script.SystemMenuButton)
local InGameMenuPolicyModule = require(Parent.InGameMenuPolicy)
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local SideNavigation = Roact.PureComponent:extend("SideNavigation")
SideNavigation.validateProps = T.strictInterface({
	open = T.boolean,
	closeMenu = T.callback,
	goToHomePage = T.callback,
	goToSystemMenu = T.callback,
	currentPage = T.string,
	canCaptureFocus = T.optional(T.boolean),
	currentZone = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.number) or nil,
	enableInGameHomeIcon = T.optional(T.boolean)
})

function SideNavigation.init(p1)
	-- upvalues: ControlState (copy), ConstantsModule (copy), Roact (copy), GuiService (copy)
	function p1.controlStateUpdated(Hover, Hover1)
		-- upvalues: ControlState (upval), p1 (copy), ConstantsModule (upval)
		if Hover == ControlState.Hover and Hover1 ~= ControlState.Hover and p1.props.currentPage == ConstantsModule.InitalPageKey then
			p1.props.closeMenu()
		end
	end
	
	p1.firstItemRef = Roact.createRef()
	
	function p1.onContainerRendered(SelectionParent)
		-- upvalues: GuiService (upval)
		if SelectionParent then
			GuiService:RemoveSelectionGroup("SideNavigation_IGMSelectionGroup")
			GuiService:AddSelectionParent("SideNavigation_IGMSelectionGroup", SelectionParent)
		end
	end
end

function SideNavigation.oldRender(p1)
	-- upvalues: GetFFlagIGMGamepadSelectionHistoryModule (copy), WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), CloseMenuButtonModule (copy), FocusHandlerModule (copy), GuiService (copy), ConstantsModule (copy), ZonePortalModule (copy), DirectionModule (copy)
	local IsNotCurrentZoneMatch = if GetFFlagIGMGamepadSelectionHistoryModule() then p1.props.currentZone ~= 0 or not p1.props.open else nil
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				BackgroundUIContrast = {
					Color = p2.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p2.Color.OverMedia.OverMedia_0.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: Roact (upval), p1 (copy), CloseMenuButtonModule (upval), FocusHandlerModule (upval), IsNotCurrentZoneMatch (ref), GetFFlagIGMGamepadSelectionHistoryModule (upval), GuiService (upval), ConstantsModule (upval), ZonePortalModule (upval), DirectionModule (upval)
		return Roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BackgroundColor3 = p2.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 64, 1, 0),
			Visible = p1.props.open,
			Selectable = false,
			[Roact.Ref] = p1.onContainerRendered
		}, {
			Padding = Roact.createElement("UIPadding", { PaddingTop = UDim.new(0, 1) }),
			CloseMenuButton = Roact.createElement(CloseMenuButtonModule, {
				onActivated = p1.props.closeMenu,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 4),
				[Roact.Ref] = p1.firstItemRef
			}),
			FocusHandler = Roact.createElement(FocusHandlerModule, {
				isFocused = p1.props.canCaptureFocus,
				shouldForgetPreviousSelection = IsNotCurrentZoneMatch,
				didFocus = GetFFlagIGMGamepadSelectionHistoryModule() and function(p3)
					-- upvalues: GuiService (upval), p1 (upval)
					GuiService.SelectedCoreObject = p3 or p1.firstItemRef:getValue()
				end or function()
					-- upvalues: GuiService (upval), p1 (upval)
					GuiService.SelectedCoreObject = p1.firstItemRef:getValue()
				end
			}),
			ZonePortal = if p1.props.currentPage == ConstantsModule.InitalPageKey then nil else Roact.createElement(ZonePortalModule, { targetZone = 1, direction = DirectionModule.Right }) or nil
		})
	end)
end

function SideNavigation.newRender(p1)
	-- upvalues: Roact (copy), SystemMenuButtonModule (copy), ConstantsModule (copy), HomeButtonModule (copy), ZonePortalModule (copy), DirectionModule (copy), WithFoundationOrUIBloxStyleFunction (copy), Interactable (copy)
	local CurrentPage = p1.props.currentPage
	local config = {
		Padding = Roact.createElement("UIPadding", { PaddingTop = UDim.new(0, 1) }),
		Content = Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = UDim2.fromScale(1, 1)
		}, {
			Padding = Roact.createElement("UIPadding", { PaddingTop = UDim.new(0, 4) }),
			Layout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 4)
			}),
			SystemMenuButton = Roact.createElement(SystemMenuButtonModule, {
				layoutOrder = 1,
				on = CurrentPage == ConstantsModule.MainPagePageKey,
				onClose = p1.props.closeMenu,
				onActivated = p1.props.goToSystemMenu,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 4),
				canCaptureFocus = p1.props.canCaptureFocus
			}),
			HomeButton = Roact.createElement(HomeButtonModule, {
				layoutOrder = 2,
				on = CurrentPage == ConstantsModule.LeaveToAppPromptPageKey,
				onActivated = p1.props.goToHomePage,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 8)
			})
		}),
		ZonePortal = if p1.props.currentPage == ConstantsModule.InitalPageKey then nil else Roact.createElement(ZonePortalModule, { targetZone = 1, direction = DirectionModule.Right }) or nil
	}
	
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				BackgroundUIContrast = {
					Color = p2.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p2.Color.OverMedia.OverMedia_0.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: Roact (upval), Interactable (upval), p1 (copy), config (copy)
		return Roact.createElement(Interactable, {
			onStateChanged = p1.controlStateUpdated,
			AutoButtonColor = false,
			BackgroundColor3 = p2.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 64, 1, 0),
			Visible = p1.props.open,
			Selectable = false,
			[Roact.Ref] = p1.onContainerRendered
		}, config)
	end)
end

function SideNavigation.render(p1)
	return if p1.props.enableInGameHomeIcon then p1:newRender() else p1:oldRender()
end

return RoactRodux.UNSTABLE_connect2(function(p1, _)
	-- upvalues: ConstantsModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy)
	return {
		canCaptureFocus = p1.isMenuOpen and (not p1.respawn.dialogOpen and (p1.displayOptions.inputType == ConstantsModule.InputType.Gamepad and p1.currentZone == 0)),
		currentPage = p1.menuPage,
		open = p1.isMenuOpen,
		currentZone = if GetFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil
	}
end, function(Callback)
	-- upvalues: CloseMenuModule (copy), SetCurrentPageModule (copy), ConstantsModule (copy)
	return {
		closeMenu = function()
			-- upvalues: Callback (copy), CloseMenuModule (upval)
			Callback(CloseMenuModule)
		end,
		goToSystemMenu = function()
			-- upvalues: Callback (copy), SetCurrentPageModule (upval), ConstantsModule (upval)
			Callback(SetCurrentPageModule(ConstantsModule.MainPagePageKey))
		end,
		goToHomePage = function()
			-- upvalues: Callback (copy), SetCurrentPageModule (upval), ConstantsModule (upval)
			Callback(SetCurrentPageModule(ConstantsModule.LeaveToAppPromptPageKey))
		end
	}
end)((InGameMenuPolicyModule.connect(function(p1, _)
	return { enableInGameHomeIcon = p1.enableInGameHomeIcon() }
end)(SideNavigation)))