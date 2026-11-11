local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local AfterAvatarExperienceLoadedModule = require(Modules.AvatarExperience.Common.Components.AfterAvatarExperienceLoaded)
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local AvatarExperienceViewModule = require(Modules.AvatarExperience.Common.Components.AvatarExperienceView)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local NavigationEventsLoggerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.NavigationEventsLogger)
local ExternalNavigationHandlerModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.ExternalNavigationHandler)
local SetPlayEmoteInBackgroundModule = require(Modules.AvatarExperience.Common.Actions.SetPlayEmoteInBackground)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local FFlagAXMigrateAXToGlobalAutofocus = SharedFlagsModule.FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXFixOrientationInputBlocking = SharedFlagsModule.FFlagAXFixOrientationInputBlocking
local FFlagAndroidTVExitWithB = SharedFlagsModule.FFlagAndroidTVExitWithB
local AndroidTVExitButtonManager = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).AndroidTVExitButtonManager
local AvatarBackground = RoactModule.PureComponent:extend("AvatarBackground")
AvatarBackground.defaultProps = {
	playEmote = true,
	isVisible = true,
	isTopBarVisible = true
}
AvatarBackground.validateProps = TModule.strictInterface({
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.optional(TModule.table),
	title = TModule.optional(TModule.string),
	playEmote = TModule.optional(TModule.boolean),
	isVisible = TModule.optional(TModule.boolean),
	renderContent = TModule.optional(TModule.callback),
	isTopBarSecondary = TModule.optional(TModule.boolean),
	isTopBarVisible = TModule.optional(TModule.boolean),
	deviceOrientation = TModule.string,
	currentCharacter = TModule.Instance,
	setPlayEmoteInBackground = TModule.callback,
	navigateBackInAppRoute = TModule.callback,
	avatarRoute = TModule.optional(TModule.table),
	detail = TModule.optional(TModule.string),
	navigation = TModule.table
})

function AvatarBackground.init(p1)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), TopBarModule (copy)
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController or RoactGamepadModule.createFocusController()
	p1.tvExitDisconnect = nil
	
	function p1.backButtonPressed()
		-- upvalues: p1 (copy)
		p1.props.navigateBackInAppRoute(true)
	end
	
	p1.backButton = TopBarModule.makeBackButton(p1.backButtonPressed)
	
	function p1.renderContent()
		-- upvalues: p1 (copy)
		return if p1.props.renderContent then p1.props.renderContent({ character = p1.props.currentCharacter }) else nil
	end
end

function AvatarBackground.renderTopBarWithLocalized(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return if p1.props.title then WithLocalizationFunction({ title = p1.props.title })(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderTopBar(p2.title)
	end) else p1:renderTopBar("")
end

function AvatarBackground.renderTopBar(p1, TitleText)
	-- upvalues: RoactModule (copy), TopBarModule (copy)
	return RoactModule.createElement(TopBarModule.Container, {
		transparentBackground = true,
		isSecondary = p1.props.isTopBarSecondary,
		titleText = TitleText,
		leftItem = p1.backButton
	})
end

function AvatarBackground.renderAvatarExperienceView(p1, IsTopBarVisible)
	-- upvalues: RoactModule (copy), AvatarExperienceViewModule (copy), ExternalNavigationHandlerModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), GamepadFocusHandlerForPageModule (copy)
	return RoactModule.createElement(AvatarExperienceViewModule, {
		bottomBarEnabled = false,
		isSceneFullView = true,
		isUIFullView = false,
		topBar = IsTopBarVisible and p1:renderTopBarWithLocalized() or nil
	}, {
		ExternalNavigationHandler = RoactModule.createElement(ExternalNavigationHandlerModule, { navigation = p1.props.navigation }),
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, { focusController = p1.focusController })
	})
end

function AvatarBackground.renderMainView(p1)
	-- upvalues: DeviceOrientationMode (copy), RoactModule (copy), FFlagAXFixOrientationInputBlocking (copy)
	return if p1.props.deviceOrientation == DeviceOrientationMode.Portrait then if FFlagAXFixOrientationInputBlocking then RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		AEView = p1:renderAvatarExperienceView(p1.props.isTopBarVisible)
	}) else p1:renderAvatarExperienceView(p1.props.isTopBarVisible) else RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		TopBar = if p1.props.isTopBarVisible then p1:renderTopBarWithLocalized() else nil,
		AEView = p1:renderAvatarExperienceView(false)
	})
end

function AvatarBackground.render(p1)
	-- upvalues: RoactModule (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ExternalEventConnection (copy), GuiService (copy), NavigationEventsLoggerModule (copy)
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController
	}, {
		BackButtonConnection = RoactModule.createElement(ExternalEventConnection, {
			event = GuiService.ShowLeaveConfirmation,
			callback = p1.backButtonPressed
		}),
		NavigationEventsLogger = RoactModule.createElement(NavigationEventsLoggerModule, { pageName = "AvatarBackground" }),
		Mainview = p1:renderMainView(),
		Content = p1.renderContent()
	})
end

function AvatarBackground.didUpdate(p1, p2)
	if p1.props.playEmote ~= p2.playEmote then
		p1.props.setPlayEmoteInBackground(p1.props.playEmote)
	end
end

function AvatarBackground.willUnmount(p1)
	-- upvalues: FFlagAndroidTVExitWithB (copy)
	if FFlagAndroidTVExitWithB and p1.tvExitDisconnect then
		p1.tvExitDisconnect()
		p1.tvExitDisconnect = nil
	end
end

function AvatarBackground.didMount(p1)
	-- upvalues: FFlagAndroidTVExitWithB (copy), AndroidTVExitButtonManager (copy)
	if FFlagAndroidTVExitWithB then
		p1.tvExitDisconnect = AndroidTVExitButtonManager.register(function()
			-- upvalues: p1 (copy)
			p1:backButtonPressed()
		end)
	end
	p1.props.setPlayEmoteInBackground(p1.props.playEmote)
end

return AfterAvatarExperienceLoadedModule((WithMappedNavigationParamsModule((RoactRoduxModule.connect(function(p1)
	return {
		deviceOrientation = p1.DeviceOrientation,
		currentCharacter = p1.AvatarExperience.AvatarScene.Character.CurrentCharacter
	}
end, function(Callback)
	-- upvalues: SetPlayEmoteInBackgroundModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy)
	return {
		setPlayEmoteInBackground = function(p1)
			-- upvalues: Callback (copy), SetPlayEmoteInBackgroundModule (upval)
			Callback(SetPlayEmoteInBackgroundModule(p1))
		end,
		navigateBackInAppRoute = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back(p1)
				
				return
			else
				Callback(NavigateBackModule(p1))
			end
		end
	}
end)(AvatarBackground)))))