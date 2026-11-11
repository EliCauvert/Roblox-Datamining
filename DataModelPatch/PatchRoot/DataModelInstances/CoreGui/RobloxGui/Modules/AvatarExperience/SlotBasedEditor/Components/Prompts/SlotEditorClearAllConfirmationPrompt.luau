local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseCallbackFunction = ReactModule.useCallback
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local Categories = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor).Constants.Categories
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local config = {
	[Categories.Animations] = {
		title = "Feature.Avatar.Title.ClearAnimationsConfirmation",
		message = "Feature.Avatar.Message.ClearAnimations"
	},
	[Categories.Accessories] = {
		title = "Feature.Avatar.Title.ClearAccessoriesConfirmation",
		message = "Feature.Avatar.Message.ClearAccessories"
	},
	[Categories.Body] = {
		title = "Feature.Avatar.Title.ClearBodyConfirmation",
		message = "Feature.Avatar.Message.ClearBody"
	},
	[Categories.Clothing] = {
		title = "Feature.Avatar.Title.ClearClothesConfirmation",
		message = "Feature.Avatar.Message.ClearClothes"
	},
	[Categories.Makeup] = if require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport then {
		title = "Feature.Avatar.Title.ClearMakeupConfirmation",
		message = "Feature.Avatar.Message.ClearMakeupConfirmation"
	} else nil
}

local function selectScreenSize(p1)
	return p1.ScreenSize
end

return (require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)(function(_)
	-- upvalues: UseNavigationFunction (copy), UseSelectorFunction (copy), selectScreenSize (copy), UseLocalizationFunction (copy), config (copy), UseCallbackFunction (copy), NavigationUtilsModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseSelectorResult = UseSelectorFunction(selectScreenSize)
	local SlotCategoryParam = UseNavigationResult.getParam("slotCategory")
	local ClearAllParam = UseNavigationResult.getParam("clearAll")
	local UseLocalizationResult = UseLocalizationFunction({
		confirmationModalLeftButton = "Feature.Avatar.Action.Cancel",
		confirmationModalRightButton = "Feature.Avatar.Action.Clear",
		confirmationModalTitle = config[SlotCategoryParam].title,
		confirmationModalDescription = config[SlotCategoryParam].message
	})
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy)
		NavigationUtilsModule.closeFocusedScreen(UseNavigationResult)
	end, { UseNavigationResult })
	
	return ReactModule.createElement(InteractiveAlert, {
		title = UseLocalizationResult.confirmationModalTitle,
		bodyText = UseLocalizationResult.confirmationModalDescription,
		buttonStackInfo = {
			buttons = {
				{
					props = {
						onActivated = UseCallbackResult,
						text = UseLocalizationResult.confirmationModalLeftButton
					}
				},
				{
					buttonType = ButtonType.PrimaryContextual,
					props = {
						onActivated = function()
							-- upvalues: ClearAllParam (copy), UseCallbackResult (copy)
							ClearAllParam()
							UseCallbackResult()
						end,
						text = UseLocalizationResult.confirmationModalRightButton
					}
				}
			}
		},
		screenSize = UseSelectorResult
	})
end))