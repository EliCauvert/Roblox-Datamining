local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local AfterAvatarExperienceLoadedModule = require(Modules.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local IsAvatarRouteVisibleModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Utils.isAvatarRouteVisible)
local AvatarVRPanelWrapperModule = require(Modules.AvatarExperience.Common.Components.AvatarVRPanelWrapper)
local AvatarScreenProperties = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties
local AxRnStackvis = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.stackvis")
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local With10ftUIPaddingModule = require(Modules.AvatarExperience.Common.Components.with10ftUIPadding)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseEventMapFunction = require(CorePackages.Packages.ReactFocusNavigation).useEventMap
local GetFFlagEnableUseShowTopBarFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableUseShowTopBar
local StackVisibilityWrapper = RoactModule.PureComponent:extend("StackVisibilityWrapper")
StackVisibilityWrapper.validateProps = TModule.strictInterface({
	component = TModule.union(TModule.callback, TModule.table),
	innerProps = TModule.optional(TModule.table),
	navigation = TModule.table,
	designTokens = TModule.any,
	eventMapRef = if GetFFlagEnableUseShowTopBarFunction() then TModule.any else nil,
	guiService = TModule.optional(TModule.union(TModule.Instance, TModule.table)),
	avatarRoute = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarRoute.Interface
})

function StackVisibilityWrapper.getRouteName(p1)
	return p1.props.navigation.state.routeName
end

function StackVisibilityWrapper.render(p1)
	-- upvalues: GetFFlagEnableUseShowTopBarFunction (copy), IsAvatarRouteVisibleModule (copy), CryoModule (copy), AxRnStackvis (copy), IsVRAppBuildFunction (copy), RoactModule (copy), AvatarVRPanelWrapperModule (copy), AvatarScreenProperties (copy)
	local RouteName = p1:getRouteName()
	local Navigation = p1.props.navigation
	local AvatarRoute = p1.props.avatarRoute
	local Component = p1.props.component
	local InnerProps = p1.props.innerProps
	local DesignTokens = p1.props.designTokens
	local TopPadding = DesignTokens.topPadding
	local LeftPadding = DesignTokens.leftPadding
	local BottomPadding = DesignTokens.bottomPadding
	local RightPadding = DesignTokens.rightPadding
	local EventMapRef = if GetFFlagEnableUseShowTopBarFunction() then p1.props.eventMapRef else nil
	local IsAvatarRouteVisibleModule1 = IsAvatarRouteVisibleModule(p1.props)
	local JoinResult = CryoModule.Dictionary.join(InnerProps, { navigation = Navigation, avatarRoute = AvatarRoute })
	AxRnStackvis:trace("[{}]: {}", if IsAvatarRouteVisibleModule1 then "VISIBLE" else "NOT VISIBLE", RouteName)
	
	return if IsVRAppBuildFunction() then RoactModule.createElement(AvatarVRPanelWrapperModule, {
		visible = IsAvatarRouteVisibleModule1,
		roundedCornersFrame = AvatarScreenProperties[RouteName].VRPanelRoundedCorners,
		panelPlacement = AvatarScreenProperties[RouteName].VRPanelPlacement
	}, {
		StackScreen = RoactModule.createElement(Component, JoinResult)
	}) else RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		BorderSizePixel = 0,
		Size = UDim2.new(1, RightPadding, 1, BottomPadding),
		Position = UDim2.fromOffset(LeftPadding, TopPadding),
		Visible = IsAvatarRouteVisibleModule1,
		ref = EventMapRef
	}, {
		StackScreen = RoactModule.createElement(Component, JoinResult)
	})
end

function StackVisibilityWrapper.didMount(p1)
	-- upvalues: IsAvatarRouteVisibleModule (copy), NotificationTypeModule (copy)
	local RouteName = p1:getRouteName()
	local GuiService = p1.props.guiService
	
	if GuiService and IsAvatarRouteVisibleModule(p1.props) then
		GuiService:BroadcastNotification(RouteName, NotificationTypeModule.APP_READY)
	end
end

function StackVisibilityWrapper.didUpdate(p1, p2, _)
	-- upvalues: IsAvatarRouteVisibleModule (copy), NotificationTypeModule (copy)
	local GuiService = p1.props.guiService
	
	if GuiService and not IsAvatarRouteVisibleModule(p2) and IsAvatarRouteVisibleModule(p1.props) then
		GuiService:BroadcastNotification(p1:getRouteName(), NotificationTypeModule.APP_READY)
	end
end

local With10ftUIPaddingModuleResult: (any) -> any = With10ftUIPaddingModule((WithNavigationFunction((WithAvatarRouteModule((RoactServices.connect({ guiService = AppGuiService })(StackVisibilityWrapper)))))))

if GetFFlagEnableUseShowTopBarFunction() then
	local config = {
		[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NoOpEvent,
		[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NoOpEvent
	}
	local With10ftUIPaddingModuleResult1 = With10ftUIPaddingModuleResult
	
	With10ftUIPaddingModuleResult = function(p1)
		-- upvalues: UseEventMapFunction (copy), config (copy), RoactModule (copy), With10ftUIPaddingModuleResult1 (copy), CryoModule (copy)
		return RoactModule.createElement(With10ftUIPaddingModuleResult1, CryoModule.Dictionary.join(p1, { eventMapRef = UseEventMapFunction(config) }))
	end
end
return function(p1)
	-- upvalues: AfterAvatarExperienceLoadedModule (copy), RoactModule (copy), With10ftUIPaddingModuleResult (ref)
	local AfterAvatarExperienceLoadedModuleResult = AfterAvatarExperienceLoadedModule(p1)
	
	return function(InnerProps)
		-- upvalues: RoactModule (upval), With10ftUIPaddingModuleResult (upval), AfterAvatarExperienceLoadedModuleResult (ref)
		return RoactModule.createElement(With10ftUIPaddingModuleResult, {
			component = AfterAvatarExperienceLoadedModuleResult,
			innerProps = InnerProps,
			navigation = InnerProps.navigation
		})
	end
end