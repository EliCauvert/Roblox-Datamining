local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local OutfitIncompletePrompt = RoactModule.PureComponent:extend("OutfitIncompletePrompt")
OutfitIncompletePrompt.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	navigationCallback = TModule.callback,
	navigation = TModule.table,
	focusController = TModule.optional(TModule.table),
	defaultChildRef = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback)
})

function closePrompt(p1)
	-- upvalues: NavigationUtilsModule (copy)
	NavigationUtilsModule.closeOverlay(p1)
end

function OutfitIncompletePrompt.init(p1)
	function p1.onStay()
		-- upvalues: p1 (copy)
		closePrompt(p1.props.navigation)
	end
	
	function p1.onLeave()
		-- upvalues: p1 (copy)
		closePrompt(p1.props.navigation)
		p1.props.navigationCallback()
	end
end

function OutfitIncompletePrompt.renderAlertLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.outfitIncompleteTitle,
		bodyText = p2.outfitIncompleteBody,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.onLeave, text = p2.leave }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = p1.onStay, text = p2.stay }
				}
			}
		},
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function OutfitIncompletePrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		outfitIncompleteTitle = "Feature.Avatar.Title.OutfitIncomplete",
		outfitIncompleteBody = "Feature.Avatar.Label.OutfitIncomplete",
		leave = "Feature.Chat.Action.Leave",
		stay = "Feature.Chat.Action.Stay"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderAlertLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, nil)(OutfitIncompletePrompt))))))