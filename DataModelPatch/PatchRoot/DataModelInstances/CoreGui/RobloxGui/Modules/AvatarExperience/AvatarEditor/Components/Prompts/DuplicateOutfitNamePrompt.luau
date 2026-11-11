local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Focusable = RoactGamepadModule.Focusable
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local DuplicateOutfitNamePrompt = RoactModule.PureComponent:extend("DuplicateOutfitNamePrompt")
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
DuplicateOutfitNamePrompt.validateProps = TModule.strictInterface({
	outfitName = TModule.string,
	sourcePrompt = TModule.string,
	sourceParams = TModule.table,
	saveCallback = TModule.callback,
	saveFetchingStateKey = TModule.string,
	onOverlayClosed = TModule.optional(TModule.callback),
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	navigation = TModule.table,
	screenSize = TModule.Vector2,
	fetchingState = TModule.string
})

function DuplicateOutfitNamePrompt.init(p1)
	-- upvalues: NavigationUtilsModule (copy)
	function p1.goBack()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, p1.props.sourcePrompt, p1.props.sourceParams)
	end
end

function DuplicateOutfitNamePrompt.willUpdate(p1, p2, _)
	-- upvalues: UtilsModule (copy), NavigationUtilsModule (copy)
	if UtilsModule.isFetchingDoneOrFailed(p1.props.fetchingState, p2.fetchingState) then
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function DuplicateOutfitNamePrompt.renderLocalized(p1, p2)
	-- upvalues: RoactModule (copy), Focusable (copy), FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation (copy), RoactGamepadModule (copy), InteractiveAlert (copy), ButtonType (copy), RetrievalStatus (copy)
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		inputBindings = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then nil else {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.goBack),
			Confirm = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function() end, { key = "CommonUI.Controls.Action.Confirm" })
		}
	}, {
		Alert = RoactModule.createElement(InteractiveAlert, {
			title = p2.titleText,
			bodyText = p2.messageText,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = p1.goBack, text = p2.cancelButtonText }
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							isLoading = p1.props.fetchingState == RetrievalStatus.Fetching,
							onActivated = p1.props.saveCallback,
							text = p2.confirmButtonText
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = p1.props.screenSize,
			defaultChildRef = p1.props.defaultChildRef
		})
	})
end

function DuplicateOutfitNamePrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		titleText = "Feature.Avatar.Heading.UsedName",
		messageText = "Feature.Avatar.Label.UsedNameLong",
		confirmButtonText = "Feature.Avatar.Action.Save",
		cancelButtonText = "Feature.Avatar.Label.Back"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: PerformFetch (copy)
	return {
		screenSize = p1.ScreenSize,
		fetchingState = PerformFetch.GetStatus(p1, p2.saveFetchingStateKey)
	}
end, nil)(DuplicateOutfitNamePrompt))))))