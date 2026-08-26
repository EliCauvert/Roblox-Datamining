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

function sideNavigation.init(p1)
	-- upvalues: controlState (ref), constantsModule (ref), roact (ref), guiService (ref)
	function p0.controlStateUpdated(p2, p3)
		-- upvalues: controlState (copy), p1 (ref), constantsModule (copy)
		if p2 == controlState.Hover and p3 ~= controlState.Hover and p1.props.currentPage == constantsModule.InitalPageKey then
			p1.props.closeMenu()
		end
	end
	
	p1.firstItemRef = roact.createRef()
	
	function p0.onContainerRendered(p2)
		-- upvalues: guiService (copy)
		if p2 then
			guiService:RemoveSelectionGroup("SideNavigation_IGMSelectionGroup")
			guiService:AddSelectionParent("SideNavigation_IGMSelectionGroup", p2)
		end
	end
end

function sideNavigation.oldRender(p1)
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), withFoundationOrUIBloxStyle (ref), roact (ref), closeMenuButtonModule (ref), focusHandlerModule (ref), guiService (ref), constantsModule (ref), zonePortalModule (ref), directionModule (ref)
	local var1 = if getFFlagIGMGamepadSelectionHistoryModule() then if p1.props.currentZone == 0 then not p1.props.open else true else nil
	
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				BackgroundUIContrast = {
					Color = p2.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p2.Color.OverMedia.OverMedia_0.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roact (copy), p1 (ref), closeMenuButtonModule (copy), focusHandlerModule (copy), var1 (write), getFFlagIGMGamepadSelectionHistoryModule (copy), guiService (copy), constantsModule (copy), zonePortalModule (copy), directionModule (copy)
		return roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BackgroundColor3 = p2.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 64, 1, 0),
			Visible = p1.props.open,
			Selectable = false,
			[roact.Ref] = p1.onContainerRendered
		}, {
			Padding = roact.createElement("UIPadding", { PaddingTop = UDim.new(0, 1) }),
			CloseMenuButton = roact.createElement(closeMenuButtonModule, {
				onActivated = p1.props.closeMenu,
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 4),
				[roact.Ref] = p1.firstItemRef
			}),
			FocusHandler = roact.createElement(focusHandlerModule, {
				isFocused = p1.props.canCaptureFocus,
				shouldForgetPreviousSelection = var1,
				didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p3)
					-- upvalues: guiService (copy), p1 (copy)
					guiService.SelectedCoreObject = p3 or p1.firstItemRef:getValue()
				end else function()
					-- upvalues: guiService (copy), p1 (copy)
					guiService.SelectedCoreObject = p1.firstItemRef:getValue()
				end
			}),
			ZonePortal = p1.props.currentPage ~= constantsModule.InitalPageKey and roact.createElement(zonePortalModule, { targetZone = 1, direction = directionModule.Right }) or nil
		})
	end)
end

function sideNavigation.newRender(p1)
	-- upvalues: roact (ref), systemMenuButtonModule (ref), constantsModule (ref), homeButtonModule (ref), zonePortalModule (ref), directionModule (ref), withFoundationOrUIBloxStyle (ref), interactable (ref)
	local currentPage = p1.props.currentPage
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
				onClose = p1.props.closeMenu,
				onActivated = p1.props.goToSystemMenu,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 4),
				canCaptureFocus = p1.props.canCaptureFocus
			}),
			HomeButton = roact.createElement(homeButtonModule, {
				layoutOrder = 2,
				on = currentPage == constantsModule.LeaveToAppPromptPageKey,
				onActivated = p1.props.goToHomePage,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 8)
			})
		}),
		ZonePortal = p1.props.currentPage ~= constantsModule.InitalPageKey and roact.createElement(zonePortalModule, { targetZone = 1, direction = directionModule.Right }) or nil
	}
	
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				BackgroundUIContrast = {
					Color = p2.Color.OverMedia.OverMedia_0.Color3,
					Transparency = p2.Color.OverMedia.OverMedia_0.Transparency
				}
			}
		}
	end, function(p2)
		-- upvalues: roact (copy), interactable (copy), p1 (ref), t (ref)
		return roact.createElement(interactable, {
			onStateChanged = p1.controlStateUpdated,
			AutoButtonColor = false,
			BackgroundColor3 = p2.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p2.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 64, 1, 0),
			Visible = p1.props.open,
			Selectable = false,
			[roact.Ref] = p1.onContainerRendered
		}, t)
	end)
end

function sideNavigation.render(p1)
	return if p1.props.enableInGameHomeIcon then p1:newRender() else p1:oldRender()
end

return roactRodux.UNSTABLE_connect2(function(p1, _)
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p1.isMenuOpen and (not p1.respawn.dialogOpen and (p1.displayOptions.inputType == constantsModule.InputType.Gamepad and p1.currentZone == 0)),
		currentPage = p1.menuPage,
		open = p1.isMenuOpen,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil
	}
end, function(p1)
	-- upvalues: closeMenuModule (ref), setCurrentPageModule (ref), constantsModule (ref)
	return {
		closeMenu = function()
			-- upvalues: p1 (ref), closeMenuModule (copy)
			p1(closeMenuModule)
		end,
		goToSystemMenu = function()
			-- upvalues: p1 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p1(setCurrentPageModule(constantsModule.MainPagePageKey))
		end,
		goToHomePage = function()
			-- upvalues: p1 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p1(setCurrentPageModule(constantsModule.LeaveToAppPromptPageKey))
		end
	}
end)(inGameMenuPolicyModule.connect(function(p1, _)
	return { enableInGameHomeIcon = p1.enableInGameHomeIcon() }
end)(sideNavigation))