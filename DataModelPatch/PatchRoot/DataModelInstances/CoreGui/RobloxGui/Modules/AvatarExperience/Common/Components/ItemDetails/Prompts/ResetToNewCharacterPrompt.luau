local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local AnalyticsModule = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ToggleTryOnThunkModule = require(Modules.AvatarExperience.Common.Thunks.ToggleTryOnThunk)
local ClearTryOns = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.ClearTryOns
local WrapDispatchTableModule = require(Modules.AvatarExperience.Common.wrapDispatchTable)
local SelectNumTryOnItemsModule = require(Modules.AvatarExperience.Catalog.Selectors.selectNumTryOnItems)
local ResetToNewCharacterPrompt = RoactModule.PureComponent:extend("ResetToNewCharacterPrompt")
ResetToNewCharacterPrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	numCartItems = TModule.number,
	clearTryOns = TModule.callback,
	toggleTryOn = TModule.callback,
	networking = TModule.callback,
	appAnalytics = TModule.table,
	catalogAnalytics = TModule.table,
	itemId = TModule.string,
	navigation = TModule.table,
	avatarRoute = TModule.table,
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback)
})

function ResetToNewCharacterPrompt.init(p1)
	-- upvalues: ConstantsModule (copy), NavigationUtilsModule (copy)
	function p1.equipNewCharacter()
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.props.toggleTryOn(p1.props.networking, p1.props.catalogAnalytics, ConstantsModule.ItemType.Bundle, ConstantsModule.BundleTypeIdStrings.BodyParts, p1.props.itemId, true, p1.props.avatarRoute, p1.props.navigation)
	end
	
	function p1.resetTryOnsAndAdd()
		-- upvalues: p1 (copy)
		p1.props.clearTryOns()
		p1.equipNewCharacter()
		p1.closePrompt()
	end
	
	function p1.keepTryOnsAndAdd()
		-- upvalues: p1 (copy)
		p1.equipNewCharacter()
		p1.closePrompt()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function ResetToNewCharacterPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.resetToNewCharacterTitle,
		bodyText = p2.resetToNewCharacterBody,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.resetTryOnsAndAdd, text = p2.reset }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = p1.keepTryOnsAndAdd, text = p2.keep }
				}
			}
		},
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function ResetToNewCharacterPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		resetToNewCharacterTitle = "Feature.Avatar.Title.ResetToNewCharacter",
		resetToNewCharacterBody = "Feature.Avatar.Label.ResetToNewCharacter",
		reset = "CommonUI.Messages.Action.Reset",
		keep = "Feature.Avatar.Action.Keep"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((WithAvatarRouteModule((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: SelectNumTryOnItemsModule (copy)
	return {
		screenSize = p1.ScreenSize,
		numCartItems = SelectNumTryOnItemsModule(p1)
	}
end, WrapDispatchTableModule({
	clearTryOns = ClearTryOns,
	toggleTryOn = ToggleTryOnThunkModule
}))((RoactServices.connect({
	appAnalytics = RoactAnalyticsModule,
	catalogAnalytics = AnalyticsModule,
	networking = RoactNetworkingModule
})(ResetToNewCharacterPrompt))))))))))