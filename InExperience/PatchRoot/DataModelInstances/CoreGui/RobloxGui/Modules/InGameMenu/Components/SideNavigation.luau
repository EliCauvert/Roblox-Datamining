local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local interactable = UIBlox.Core.Control.Interactable
local controlState = UIBlox.Core.Control.Enum.ControlState
local parent = script.Parent.Parent
local focusHandlerModule = require(parent.Components.Connection.FocusHandler)
local zonePortalModule = require(parent.Components.ZonePortal)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local setCurrentPageModule = require(parent.Actions.SetCurrentPage)
local constantsModule = require(parent.Resources.Constants)
local directionModule = require(parent.Enums.Direction)
local closeMenuButtonModule = require(script.CloseMenuButton)
local homeButtonModule = require(script.HomeButton)
local systemMenuButtonModule = require(script.SystemMenuButton)
local inGameMenuPolicyModule = require(parent.InGameMenuPolicy)
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local sideNavigation = roact.PureComponent:extend("SideNavigation")
sideNavigation.validateProps = t.strictInterface({
	open = t.boolean,
	closeMenu = t.callback,
	goToHomePage = t.callback,
	goToSystemMenu = t.callback,
	currentPage = t.string,
	canCaptureFocus = t.optional(t.boolean),
	currentZone = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil,
	enableInGameHomeIcon = t.optional(t.boolean)
})

function sideNavigation.init(p0)
	-- upvalues: controlState (ref), constantsModule (ref), roact (ref), guiService (ref)
	function p0.controlStateUpdated(p1, p2)
		-- upvalues: controlState (copy), p0 (ref), constantsModule (copy)
		if p1 == controlState.Hover and p2 ~= controlState.Hover and p0.props.currentPage == constantsModule.InitalPageKey then
			p0.props.closeMenu()
		end
	end
	
	p0.firstItemRef = roact.createRef()
	
	function p0.onContainerRendered(p3)
		-- upvalues: guiService (copy)
		if p3 then
			guiService:RemoveSelectionGroup("SideNavigation_IGMSelectionGroup")
			guiService:AddSelectionParent("SideNavigation_IGMSelectionGroup", p3)
		end
	end
end

function sideNavigation.oldRender(p4)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), closeMenuButtonModule (ref), focusHandlerModule (ref), guiService (ref), constantsModule (ref), zonePortalModule (ref), directionModule (ref)
	local var15 = if getFFlagIGMGamepadSelectionHistoryModule() then if p4.props.currentZone == 0 then not p4.props.open else true else nil
	
	return withFoundationOrUIBloxStyle(function(p5)
		return {
			Theme = {
				BackgroundUIContrast = {
					Color = p5.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p5.Color.OverMedia.OverMedia_0.Transparency
				}
			}
		}
	end, function(p6)
		-- upvalues: roact (copy), p4 (ref), closeMenuButtonModule (copy), focusHandlerModule (copy), var15 (write), getFFlagIGMGamepadSelectionHistoryModule (copy), guiService (copy), constantsModule (copy), zonePortalModule (copy), directionModule (copy)
		return roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BackgroundColor3 = p6.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p6.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 64, 1, 0),
			Visible = p4.props.open,
			Selectable = false,
			[roact.Ref] = p4.onContainerRendered
		}, {
			Padding = roact.createElement("UIPadding", { PaddingTop = UDim.new(0, 1) }),
			CloseMenuButton = roact.createElement(closeMenuButtonModule, {
				onActivated = p4.props.closeMenu,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 4),
				[roact.Ref] = p4.firstItemRef
			}),
			FocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p4.props.canCaptureFocus,
				shouldForgetPreviousSelection = var15,
				didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p7)
					-- upvalues: guiService (copy), p4 (copy)
					guiService.SelectedCoreObject = p7 or p4.firstItemRef:getValue()
				end else function()
					-- upvalues: guiService (copy), p4 (copy)
					guiService.SelectedCoreObject = p4.firstItemRef:getValue()
				end
			}),
			ZonePortal = p4.props.currentPage ~= constantsModule.InitalPageKey and roact.createElement(zonePortalModule, { targetZone = 1, direction = directionModule.Right }) or nil
		})
	end)
end

function sideNavigation.newRender(p8)
	-- upvalues: roact (ref), systemMenuButtonModule (ref), constantsModule (ref), homeButtonModule (ref), zonePortalModule (ref), directionModule (ref), withFoundationOrUIBloxStyle (ref), interactable (ref)
	local currentPage = p8.props.currentPage
	local t = {
		Padding = roact.createElement("UIPadding", { PaddingTop = UDim.new(0, 1) }),
		Content = roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Selectable = false,
			Size = UDim2.fromScale(1, 1)
		}, {
			Padding = roact.createElement("UIPadding", { PaddingTop = UDim.new(0, 4) }),
			Layout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 4)
			}),
			SystemMenuButton = roact.createElement(systemMenuButtonModule, {
				layoutOrder = 1,
				on = currentPage == constantsModule.MainPagePageKey,
				onClose = p8.props.closeMenu,
				onActivated = p8.props.goToSystemMenu,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 4),
				canCaptureFocus = p8.props.canCaptureFocus
			}),
			HomeButton = roact.createElement(homeButtonModule, {
				layoutOrder = 2,
				on = currentPage == constantsModule.LeaveToAppPromptPageKey,
				onActivated = p8.props.goToHomePage,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 8)
			})
		}),
		ZonePortal = p8.props.currentPage ~= constantsModule.InitalPageKey and roact.createElement(zonePortalModule, { targetZone = 1, direction = directionModule.Right }) or nil
	}
	
	return withFoundationOrUIBloxStyle(function(p9)
		return {
			Theme = {
				BackgroundUIContrast = {
					Color = p9.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p9.Color.OverMedia.OverMedia_0.Transparency
				}
			}
		}
	end, function(p10)
		-- upvalues: roact (copy), interactable (copy), p8 (ref), t (ref)
		return roact.createElement(interactable, {
			onStateChanged = p8.controlStateUpdated,
			AutoButtonColor = false,
			BackgroundColor3 = p10.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p10.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 64, 1, 0),
			Visible = p8.props.open,
			Selectable = false,
			[roact.Ref] = p8.onContainerRendered
		}, t)
	end)
end

function sideNavigation.render(p11)
	return if p11.props.enableInGameHomeIcon then p11:newRender() else p11:oldRender()
end

return roactRodux.UNSTABLE_connect2(function(p13, _)
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p13.isMenuOpen and (not p13.respawn.dialogOpen and (p13.displayOptions.inputType == constantsModule.InputType.Gamepad and p13.currentZone == 0)),
		currentPage = p13.menuPage,
		open = p13.isMenuOpen,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p13.currentZone else nil
	}
end, function(p14)
	-- upvalues: closeMenuModule (ref), setCurrentPageModule (ref), constantsModule (ref)
	return {
		closeMenu = function()
			-- upvalues: p14 (ref), closeMenuModule (copy)
			p14(closeMenuModule)
		end,
		goToSystemMenu = function()
			-- upvalues: p14 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p14(setCurrentPageModule(constantsModule.MainPagePageKey))
		end,
		goToHomePage = function()
			-- upvalues: p14 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p14(setCurrentPageModule(constantsModule.LeaveToAppPromptPageKey))
		end
	}
end)(inGameMenuPolicyModule.connect(function(p12, _)
	return { enableInGameHomeIcon = p12.enableInGameHomeIcon() }
end)(sideNavigation))