local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local UIBlox = inGameMenuDependenciesModule.UIBlox
local t = inGameMenuDependenciesModule.t
local withStyle = UIBlox.Core.Style.withStyle
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

function sideNavigation.init(p0) --[[ line: 51 ]]
	-- upvalues: controlState (ref), constantsModule (ref), roact (ref), guiService (ref)
	function p0.controlStateUpdated(p1, p2) --[[ line: 52 ]]
		-- upvalues: controlState (copy), p0 (ref), constantsModule (copy)
		if p1 == controlState.Hover and p2 ~= controlState.Hover and p0.props.currentPage == constantsModule.InitalPageKey then
			p0.props.closeMenu()
		end
	end
	
	p0.firstItemRef = roact.createRef()
	
	function p0.onContainerRendered(p3) --[[ line: 62 ]]
		-- upvalues: guiService (copy)
		if p3 then
			guiService:RemoveSelectionGroup("SideNavigation_IGMSelectionGroup")
			guiService:AddSelectionParent("SideNavigation_IGMSelectionGroup", p3)
		end
	end
end

function sideNavigation.oldRender(p4) --[[ line: 71 ]]
	-- upvalues: getFFlagIGMGamepadSelectionHistoryModule (ref), withStyle (ref), roact (ref), closeMenuButtonModule (ref), focusHandlerModule (ref), guiService (ref), constantsModule (ref), zonePortalModule (ref), directionModule (ref)
	local var14 = if getFFlagIGMGamepadSelectionHistoryModule() then if p4.props.currentZone == 0 then not p4.props.open else true else nil
	
	return withStyle(function(p5) --[[ line: 77 ]]
		-- upvalues: roact (copy), p4 (ref), closeMenuButtonModule (copy), focusHandlerModule (copy), var14 (write), getFFlagIGMGamepadSelectionHistoryModule (copy), guiService (copy), constantsModule (copy), zonePortalModule (copy), directionModule (copy)
		return roact.createElement("TextButton", {
			AutoButtonColor = false,
			Text = "",
			BackgroundColor3 = p5.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p5.Theme.BackgroundUIContrast.Transparency,
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
				shouldForgetPreviousSelection = var14,
				didFocus = if getFFlagIGMGamepadSelectionHistoryModule() then function(p6) --[[ line: 102 ]]
					-- upvalues: guiService (copy), p4 (copy)
					guiService.SelectedCoreObject = p6 or p4.firstItemRef:getValue()
				end else function() --[[ line: 104 ]]
					-- upvalues: guiService (copy), p4 (copy)
					guiService.SelectedCoreObject = p4.firstItemRef:getValue()
				end
			}),
			ZonePortal = p4.props.currentPage ~= constantsModule.InitalPageKey and roact.createElement(zonePortalModule, { targetZone = 1, direction = directionModule.Right }) or nil
		})
	end)
end

function sideNavigation.newRender(p7) --[[ line: 116 ]]
	-- upvalues: roact (ref), systemMenuButtonModule (ref), constantsModule (ref), homeButtonModule (ref), zonePortalModule (ref), directionModule (ref), withStyle (ref), interactable (ref)
	local currentPage = p7.props.currentPage
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
				onClose = p7.props.closeMenu,
				onActivated = p7.props.goToSystemMenu,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 4),
				canCaptureFocus = p7.props.canCaptureFocus
			}),
			HomeButton = roact.createElement(homeButtonModule, {
				layoutOrder = 2,
				on = currentPage == constantsModule.LeaveToAppPromptPageKey,
				onActivated = p7.props.goToHomePage,
				anchorPoint = Vector2.new(0.5, 0),
				position = UDim2.new(0.5, 0, 0, 8)
			})
		}),
		ZonePortal = p7.props.currentPage ~= constantsModule.InitalPageKey and roact.createElement(zonePortalModule, { targetZone = 1, direction = directionModule.Right }) or nil
	}
	
	return withStyle(function(p8) --[[ line: 162 ]]
		-- upvalues: roact (copy), interactable (copy), p7 (ref), t (ref)
		return roact.createElement(interactable, {
			onStateChanged = p7.controlStateUpdated,
			AutoButtonColor = false,
			BackgroundColor3 = p8.Theme.BackgroundUIContrast.Color,
			BackgroundTransparency = p8.Theme.BackgroundUIContrast.Transparency,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 64, 1, 0),
			Visible = p7.props.open,
			Selectable = false,
			[roact.Ref] = p7.onContainerRendered
		}, t)
	end)
end

function sideNavigation.render(p9) --[[ line: 178 ]]
	return if p9.props.enableInGameHomeIcon then p9:newRender() else p9:oldRender()
end

return roactRodux.UNSTABLE_connect2(function(p11, _) --[[ line: 191 ]]
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p11.isMenuOpen and (not p11.respawn.dialogOpen and (p11.displayOptions.inputType == constantsModule.InputType.Gamepad and p11.currentZone == 0)),
		currentPage = p11.menuPage,
		open = p11.isMenuOpen,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p11.currentZone else nil
	}
end, function(p12) --[[ line: 208 ]]
	-- upvalues: closeMenuModule (ref), setCurrentPageModule (ref), constantsModule (ref)
	return {
		closeMenu = function() --[[ line: 210 ]]
			-- upvalues: p12 (ref), closeMenuModule (copy)
			p12(closeMenuModule)
		end,
		goToSystemMenu = function() --[[ line: 213 ]]
			-- upvalues: p12 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p12(setCurrentPageModule(constantsModule.MainPagePageKey))
		end,
		goToHomePage = function() --[[ line: 216 ]]
			-- upvalues: p12 (ref), setCurrentPageModule (copy), constantsModule (copy)
			p12(setCurrentPageModule(constantsModule.LeaveToAppPromptPageKey))
		end
	}
end)(inGameMenuPolicyModule.connect(function(p10, _) --[[ line: 185 ]]
	return { enableInGameHomeIcon = p10.enableInGameHomeIcon() }
end)(sideNavigation))