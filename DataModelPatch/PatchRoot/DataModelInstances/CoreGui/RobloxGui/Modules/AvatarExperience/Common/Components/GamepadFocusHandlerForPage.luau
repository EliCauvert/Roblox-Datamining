local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local TModule = require(CorePackages.Packages.t)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local AxGamepad = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.gamepad")
local GamepadFocusRecoveryModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusRecovery)
local WithIsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).withIsGamepadInput
local GamepadFocusHandlerForPage = RoactModule.PureComponent:extend("GamepadFocusHandlerForPage")
GamepadFocusHandlerForPage.validateProps = TModule.strictInterface({
	focusController = TModule.table,
	captureFocusOnMount = TModule.optional(TModule.boolean),
	isGamepadInput = TModule.optional(TModule.boolean),
	navigation = TModule.table,
	avatarRoute = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute.Interface
})
GamepadFocusHandlerForPage.defaultProps = { captureFocusOnMount = false }

function GamepadFocusHandlerForPage.debugName(p1): string
	local State = p1.props.navigation.state
	
	return (State.routeName or "") .. ":" .. (State.key or "")
end

function GamepadFocusHandlerForPage.render(p1)
	-- upvalues: RoactModule (copy), GamepadFocusRecoveryModule (copy)
	return RoactModule.createElement(GamepadFocusRecoveryModule, {
		focusController = p1.props.focusController,
		isGamepadInput = p1.props.isGamepadInput,
		debugName = p1:debugName()
	})
end

local function _(p1): boolean
	return p1.navigation.state.key == p1.avatarRoute.current.key
end

function GamepadFocusHandlerForPage.canCaptureFocus(p1, p2)
	-- upvalues: AxGamepad (copy)
	local AvatarRoute = p1.props.avatarRoute
	local IsGamepadInput = p1.props.isGamepadInput
	local Props = p1.props
	local IsKeyMatch = Props.navigation.state.key == Props.avatarRoute.current.key
	local IsGamepadInput1 = IsKeyMatch and (AvatarRoute.isVisible and (not AvatarRoute.isOverlayVisible and IsGamepadInput))
	
	if p2 then
		AxGamepad:trace("{} {} canCapture: {}, isCurrentScreen: {}, currentRoute: {}, isVisible: {}, isOverlayVisible: {}, isGamepadInput: {}", p1:debugName(), p2, IsGamepadInput1, IsKeyMatch, AvatarRoute.current, AvatarRoute.isVisible, AvatarRoute.isOverlayVisible, IsGamepadInput)
	end
	return IsGamepadInput1
end

function GamepadFocusHandlerForPage.didMount(p1)
	-- upvalues: AxGamepad (copy)
	if p1.props.captureFocusOnMount and p1:canCaptureFocus("didMount") then
		AxGamepad:debug("captureFocusOnMount page: {}", p1:debugName())
		p1.props.focusController.captureFocus()
	end
end

function GamepadFocusHandlerForPage.didUpdate(p1, p2)
	-- upvalues: AxGamepad (copy)
	if p1:canCaptureFocus("didUpdate") then
		local Inverted = not (p2.navigation.state.key == p2.avatarRoute.current.key)
		local NoIsGamepadInput = not p2.isGamepadInput
		local NoIsVisible = not p2.avatarRoute.isVisible
		
		if Inverted or NoIsGamepadInput or NoIsVisible then
			AxGamepad:debug("captureFocus {}, navigatedToThisPage: {}, acquiredVisibility: {}", p1:debugName(), Inverted, NoIsVisible)
			p1.props.focusController.captureFocus()
			
			return
		end
	elseif p2.isGamepadInput and not p1.props.isGamepadInput then
		AxGamepad:debug("releaseFocus {}", p1:debugName())
		p1.props.focusController.releaseFocus()
	end
end

return (WithNavigationFunction((WithAvatarRouteModule((WithIsGamepadInputFunction(GamepadFocusHandlerForPage))))))