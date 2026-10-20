local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactNavigationModule = require(CorePackages.Packages.RoactNavigation)
local WithNavigationFunction = RoactNavigationModule.withNavigation
local AvatarRoute = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute
local WithAvatarRouteModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local TModule = require(CorePackages.Packages.t)
local AxGamepad = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.gamepad")
local GamepadFocusRecovery = RoactModule.PureComponent:extend("GamepadFocusRecovery")
GamepadFocusRecovery.defaultProps = { debugName = "Unspecified" }
GamepadFocusRecovery.validateProps = TModule.strictInterface({
	focusController = TModule.table,
	isGamepadInput = TModule.boolean,
	debugName = TModule.optional(TModule.string),
	avatarRoute = AvatarRoute.Interface,
	navigation = TModule.table
})

function GamepadFocusRecovery.init(p1)
	-- upvalues: GuiService (copy)
	p1:setState({ isFocused = p1.props.navigation.isFocused() })
	
	function p1.onWillFocus()
		-- upvalues: p1 (copy), GuiService (upval)
		p1.selectedCoreObjectConnection = GuiService:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
			-- upvalues: p1 (upval)
			p1:startTrackingSelectedCoreObject()
		end)
		p1:startTrackingSelectedCoreObject()
		p1:setState({ isFocused = true })
	end
	
	function p1.onWillBlur()
		-- upvalues: p1 (copy)
		p1:onBlurOrUnmount()
		p1:setState({ isFocused = false })
	end
end

function GamepadFocusRecovery.onBlurOrUnmount(p1)
	p1:stopTrackingSelectedCoreObject()
	
	if p1.selectedCoreObjectConnection then
		p1.selectedCoreObjectConnection:Disconnect()
		p1.selectedCoreObjectConnection = nil
	end
end

function GamepadFocusRecovery.handleFocusLost(p1, SelectedCoreObject)
	-- upvalues: GuiService (copy), AxGamepad (copy)
	wait()
	local SelectedCoreObject1 = GuiService.SelectedCoreObject
	
	if SelectedCoreObject1 ~= nil and SelectedCoreObject1:IsDescendantOf(game) then return end
	if p1:canCaptureFocus() then
		p1.props.focusController:captureFocus()
		
		if SelectedCoreObject ~= nil then
			AxGamepad:debug(string.format("[GamepadFocusRecovery] Lost focus on object: %s, screen: %s, %s", tostring(SelectedCoreObject), p1.props.debugName, (tostring(p1.props.avatarRoute))))
		end
	end
end

function GamepadFocusRecovery.startTrackingSelectedCoreObject(p1)
	-- upvalues: GuiService (copy), AxGamepad (copy)
	p1:stopTrackingSelectedCoreObject()
	local SelectedCoreObject = GuiService.SelectedCoreObject
	AxGamepad:trace("SelectedCoreObject: {}", SelectedCoreObject and SelectedCoreObject:GetFullName() or "nil")
	
	if SelectedCoreObject == nil or not SelectedCoreObject:IsDescendantOf(game) then
		p1:handleFocusLost(SelectedCoreObject)
		
		return
	else
		p1.selectedCoreObjectAncestryConnection = SelectedCoreObject.AncestryChanged:Connect(function(_, NewParent)
			-- upvalues: p1 (copy), SelectedCoreObject (copy)
			if not NewParent then
				p1:stopTrackingSelectedCoreObject()
				p1:handleFocusLost(SelectedCoreObject)
			end
		end)
	end
end

function GamepadFocusRecovery.stopTrackingSelectedCoreObject(p1)
	if p1.selectedCoreObjectAncestryConnection then
		p1.selectedCoreObjectAncestryConnection:Disconnect()
		p1.selectedCoreObjectAncestryConnection = nil
	end
end

function GamepadFocusRecovery.render(p1)
	-- upvalues: RoactModule (copy), RoactNavigationModule (copy)
	return RoactModule.createElement(RoactNavigationModule.NavigationEvents, { onWillFocus = p1.onWillFocus, onWillBlur = p1.onWillBlur })
end

function GamepadFocusRecovery.willUnmount(p1)
	p1:onBlurOrUnmount()
end

function GamepadFocusRecovery.canCaptureFocus(p1)
	return p1.props.avatarRoute and (p1.props.avatarRoute.isVisible and (p1.props.isGamepadInput and p1.state.isFocused))
end

return WithNavigationFunction(WithAvatarRouteModule(GamepadFocusRecovery), nil)