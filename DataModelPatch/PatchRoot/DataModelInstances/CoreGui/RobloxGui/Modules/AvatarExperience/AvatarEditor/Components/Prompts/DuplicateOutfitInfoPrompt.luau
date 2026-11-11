local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FFlagAXCharacterToAvatarStrings = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCharacterToAvatarStrings
local DuplicateOutfitInfoPrompt = RoactModule.PureComponent:extend("DuplicateOutfitInfoPrompt")
local FFlagAXUpdateSlotBasedEditorToastAndPrompts = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts
DuplicateOutfitInfoPrompt.validateProps = TModule.strictInterface({
	saveAsNew = TModule.boolean,
	duplicateOutfitId = TModule.string,
	onOverlayClosed = TModule.optional(TModule.callback),
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	showCustomOutfitNames = TModule.boolean,
	navigation = TModule.table,
	screenSize = TModule.Vector2,
	duplicateOutfitName = TModule.optional(TModule.string)
})

function DuplicateOutfitInfoPrompt.init(p1)
	-- upvalues: NavigationUtilsModule (copy), AvatarScreen (copy)
	function p1.saveOutfit()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, AvatarScreen.SaveOutfitPrompt)
	end
	
	function p1.updateExisting()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.UpdateOutfitPage)
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function DuplicateOutfitInfoPrompt.renderLocalized(p1, p2)
	-- upvalues: FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy), FFlagAXCharacterToAvatarStrings (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local SavedSimilarCharacter = if p1.props.duplicateOutfitName and p1.props.showCustomOutfitNames then if FFlagAXUpdateSlotBasedEditorToastAndPrompts then p2.savedSimilarCharacter elseif FFlagAXCharacterToAvatarStrings then p2.savedSimilarCharacter .. "\n\n" .. "\"" .. p1.props.duplicateOutfitName .. "\"" else p2.savedSimilarCharacter .. "\n" .. p1.props.duplicateOutfitName else p2.savedSimilarCharacterNoName
	local AddNewAvatarConfirmText = nil
	local SaveOutfit = nil
	
	if p1.props.saveAsNew then
		AddNewAvatarConfirmText = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then p2.addNewAvatarConfirmText else p2.saveAsNewConfirmText
		SaveOutfit = p1.saveOutfit
	else
		AddNewAvatarConfirmText = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then p2.updateAvatarConfirmText else p2.updateExistingConfirmText
		SaveOutfit = p1.updateExisting
	end
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		Alert = RoactModule.createElement(InteractiveAlert, {
			title = p2.titleText,
			bodyText = SavedSimilarCharacter,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
					},
					{
						buttonType = if FFlagAXCharacterToAvatarStrings then ButtonType.PrimaryContextual else ButtonType.PrimarySystem,
						props = { onActivated = SaveOutfit, text = AddNewAvatarConfirmText }
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = p1.props.screenSize,
			defaultChildRef = p1.props.defaultChildRef
		})
	})
end

function DuplicateOutfitInfoPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy), FFlagAXCharacterToAvatarStrings (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy)
	return WithLocalizationFunction({
		saveAsNewConfirmText = "Feature.Avatar.Action.Save",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		titleText = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Label.Title.DuplicateAvatar" else "Feature.Avatar.Heading.DuplicateCharacter",
		savedSimilarCharacter = if FFlagAXCharacterToAvatarStrings then if FFlagAXUpdateSlotBasedEditorToastAndPrompts then {
			"Feature.Avatar.Message.AddAvatarAgain",
			prevAvatar = p1.props.duplicateOutfitName
		} else "Feature.Avatar.Label.Message.DuplicateAvatar" else "Feature.Avatar.Label.SavedSimilarCharacter",
		savedSimilarCharacterNoName = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Label.Message.DuplicateAvatar" else "Feature.Avatar.Label.SavedSimilarCharacterNoName",
		updateExistingConfirmText = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Action.Save" else "Feature.Avatar.Action.GotIt",
		addNewAvatarConfirmText = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "Feature.Avatar.Label.Add" else nil,
		updateAvatarConfirmText = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "Feature.Avatar.Label.Replace" else nil
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactAppPolicy.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)((RoactRoduxModule.connect(function(p1, p2)
	local OutfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos
	
	return {
		screenSize = p1.ScreenSize,
		duplicateOutfitName = if OutfitInfos[p2.duplicateOutfitId] then OutfitInfos[p2.duplicateOutfitId].name else nil
	}
end, nil)(DuplicateOutfitInfoPrompt))))))))