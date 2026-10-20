local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local Focusable = RoactGamepadModule.Focusable
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local Overlay = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.Overlay
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local CharacterManagerUtilsModule = require(Modules.AvatarExperience.Common.Util.CharacterManagerUtils)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local OutfitNameTextBoxModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitNameTextBox)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local CheckShouldPreloadEditableCostumesModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.CheckShouldPreloadEditableCostumes)
local CreateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.CreateOutfit)
local GetEditableOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXMigrateSaveOutfitPromptFromRoactGamepad = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSaveOutfitPromptFromRoactGamepad
local FFlagAXCharacterToAvatarStrings = AvatarExperienceFlagsModule.FFlagAXCharacterToAvatarStrings
local FFlagAXUpdateSlotBasedEditorToastAndPrompts = AvatarExperienceFlagsModule.FFlagAXUpdateSlotBasedEditorToastAndPrompts
local FFlagAXFixCustomOutfitNamesDisabled = AvatarExperienceFlagsModule.FFlagAXFixCustomOutfitNamesDisabled
local SaveOutfitPrompt = RoactModule.PureComponent:extend("SaveOutfitPrompt")
SaveOutfitPrompt.validateProps = TModule.strictInterface({
	lookId = TModule.optional(TModule.string),
	onComplete = TModule.optional(TModule.callback),
	containerWidth = if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then nil else TModule.optional(TModule.number),
	defaultChildRef = if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then nil else TModule.optional(TModule.table),
	focusController = if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then nil else TModule.optional(TModule.table),
	showCustomOutfitNames = TModule.boolean,
	avatarEditorAnalytics = TModule.table,
	onOverlayClosed = TModule.optional(TModule.callback),
	navigation = TModule.table,
	screenSize = TModule.Vector2,
	fetchingState = TModule.string,
	shouldPreloadEditableCostumes = TModule.boolean,
	ownedItemIdsBySubtype = TModule.table,
	outfitInfos = TModule.table,
	combinedTryOnHumanoidDescription = TModule.optional(TModule.Instance),
	createOutfit = TModule.callback,
	getEditableUserCostumes = TModule.callback,
	forwardRef = TModule.optional(TModule.table)
})

function SaveOutfitPrompt.init(p1)
	-- upvalues: FFlagAXFixCustomOutfitNamesDisabled (copy), UtilsModule1 (copy), NavigationUtilsModule (copy), AvatarScreen (copy), ConstantsModule (copy), RoactModule (copy), OutfitNameTextBoxModule (copy), UserInputService (copy)
	function p1.getShowCustomCostumeNames()
		-- upvalues: p1 (copy)
		return p1.props.showCustomOutfitNames
	end
	
	p1.outfitName = if p1.getShowCustomCostumeNames() then "" else nil
	p1.isMounted = false
	
	function p1.checkIsMounted()
		-- upvalues: p1 (copy)
		return p1.isMounted
	end
	
	p1.state = {
		isKeyboardRepositioned = false,
		isNameInvalid = if p1.getShowCustomCostumeNames() then true else false
	}
	
	function p1.saveOutfit()
		-- upvalues: p1 (copy), FFlagAXFixCustomOutfitNamesDisabled (upval), UtilsModule1 (upval), NavigationUtilsModule (upval), AvatarScreen (upval), ConstantsModule (upval)
		if p1.state.isNameInvalid then return end
		if not p1.getShowCustomCostumeNames() then
			p1.props.createOutfit(if FFlagAXFixCustomOutfitNamesDisabled then "" else p1.outfitName, p1.props.avatarEditorAnalytics, p1.checkIsMounted, p1.props.onComplete, if p1.props.lookId == nil then nil else p1.props.combinedTryOnHumanoidDescription)
			
			return
		end
		if UtilsModule1.isDuplicateOutfitName(p1.props.ownedItemIdsBySubtype, p1.props.outfitInfos, p1.outfitName) then
			local OutfitName = p1.outfitName
			NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, AvatarScreen.DuplicateOutfitNamePrompt, {
				outfitName = p1.outfitName,
				sourcePrompt = AvatarScreen.SaveOutfitPrompt,
				sourceParams = {},
				saveCallback = function()
					-- upvalues: p1 (upval), OutfitName (copy)
					p1.props.createOutfit(OutfitName, p1.props.avatarEditorAnalytics, p1.checkIsMounted, p1.props.onComplete, if p1.props.lookId == nil then nil else p1.props.combinedTryOnHumanoidDescription)
				end,
				saveFetchingStateKey = ConstantsModule.CreateOutfitKey
			})
			
			return
		else
			p1.props.createOutfit(p1.outfitName, p1.props.avatarEditorAnalytics, p1.checkIsMounted, p1.props.onComplete, if p1.props.lookId == nil then nil else p1.props.combinedTryOnHumanoidDescription)
		end
	end
	
	function p1.onOutfitNameUpdated(OutfitName, IsNameInvalid)
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1.outfitName = OutfitName
			p1:setState({ isNameInvalid = IsNameInvalid })
			
			return
		end
	end
	
	function p1.renderMiddleContent()
		-- upvalues: RoactModule (upval), OutfitNameTextBoxModule (upval), p1 (copy)
		return RoactModule.createElement(OutfitNameTextBoxModule, { onOutfitNameUpdated = p1.onOutfitNameUpdated })
	end
	
	p1.keyboardConnection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
		-- upvalues: p1 (copy), UserInputService (upval)
		if not p1.isMounted then return end
		if not p1.state.isKeyboardRepositioned and UserInputService.OnScreenKeyboardVisible then
			p1:setState({ isKeyboardRepositioned = true })
		end
	end)
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
		
		if p1.props.onComplete then
			p1.props.onComplete()
		end
	end
end

function SaveOutfitPrompt.checkFetchEditableOutfits(p1)
	if p1.props.shouldPreloadEditableCostumes then
		p1.props.getEditableUserCostumes()
	end
end

function SaveOutfitPrompt.didMount(p1)
	p1.isMounted = true
	p1:checkFetchEditableOutfits()
end

function SaveOutfitPrompt.willUpdate(p1, p2, _)
	-- upvalues: UtilsModule (copy)
	if UtilsModule.isFetchingDoneOrFailed(p1.props.fetchingState, p2.fetchingState) then
		p1.closePrompt()
	end
end

function SaveOutfitPrompt.renderAlertLocalized(p1, p2)
	-- upvalues: UserInputService (copy), RoactModule (copy), FFlagAXMigrateSaveOutfitPromptFromRoactGamepad (copy), Overlay (copy), Focusable (copy), RoactGamepadModule (copy), InteractiveAlert (copy), FFlagAXCharacterToAvatarStrings (copy), ButtonType (copy), RetrievalStatus (copy)
	local ShowCustomCostumeNames = p1.getShowCustomCostumeNames()
	local ScreenSize = p1.props.screenSize
	
	return RoactModule.createElement(if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then Overlay else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		inputBindings = if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then nil else {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.closePrompt),
			Confirm = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function() end, { key = "CommonUI.Controls.Action.Confirm" })
		}
	}, {
		Alert = RoactModule.createElement(InteractiveAlert, {
			isRoactGamepadEnabled = not FFlagAXMigrateSaveOutfitPromptFromRoactGamepad and nil,
			title = p2.titleText,
			bodyText = if FFlagAXCharacterToAvatarStrings then nil else ShowCustomCostumeNames and p2.messageText or nil,
			buttonStackInfo = {
				buttons = {
					{
						props = { onActivated = p1.closePrompt, text = p2.cancelButtonText },
						isDefaultChild = not FFlagAXMigrateSaveOutfitPromptFromRoactGamepad or nil
					},
					{
						buttonType = if FFlagAXCharacterToAvatarStrings then ButtonType.PrimaryContextual else ButtonType.PrimarySystem,
						props = {
							isLoading = p1.props.fetchingState == RetrievalStatus.Fetching,
							isDisabled = ShowCustomCostumeNames and p1.state.isNameInvalid or false,
							onActivated = p1.saveOutfit,
							text = p2.confirmButtonText
						}
					}
				}
			},
			middleContent = ShowCustomCostumeNames and p1.renderMiddleContent or nil,
			isMiddleContentFocusable = if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then nil else ShowCustomCostumeNames,
			position = if p1.state.isKeyboardRepositioned then UDim2.new(0.5, 0, 0, (ScreenSize.Y - UserInputService.OnScreenKeyboardSize.Y) / 2) else UDim2.new(0.5, 0, 0.5, 0),
			screenSize = p1.props.screenSize,
			defaultChildRef = if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then nil else p1.props.defaultChildRef
		})
	})
end

function SaveOutfitPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy), FFlagAXCharacterToAvatarStrings (copy), FFlagAXUpdateSlotBasedEditorToastAndPrompts (copy), FFlagAXMigrateSaveOutfitPromptFromRoactGamepad (copy), WithSelectionCursorProviderFunction (copy)
	return WithLocalizationFunction({
		messageText = "Feature.Avatar.Label.EnterCostumeName",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		warningText = "Feature.Avatar.Label.CostumeWarning",
		titleText = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Label.Title.AvatarName" else "Feature.Avatar.Heading.SaveCostume",
		confirmButtonText = if FFlagAXUpdateSlotBasedEditorToastAndPrompts then "Feature.Avatar.Label.Add" else "Feature.Avatar.Action.Save"
	})(function(p2)
		-- upvalues: FFlagAXMigrateSaveOutfitPromptFromRoactGamepad (upval), p1 (copy), WithSelectionCursorProviderFunction (upval)
		return if FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then p1:renderAlertLocalized(p2) else WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderAlertLocalized(p2, p3)
		end)
	end)
end

function SaveOutfitPrompt.didUpdate(p1, _, _)
	p1:checkFetchEditableOutfits()
end

function SaveOutfitPrompt.willUnmount(p1)
	p1.keyboardConnection:disconnect()
	p1.keyboardConnection = nil
	p1.isMounted = false
end

local v1 = RoactServices.connect({ avatarEditorAnalytics = AnalyticsModule })((RoactAppPolicy.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: CharacterManagerUtilsModule (copy), PerformFetch (copy), ConstantsModule (copy), CheckShouldPreloadEditableCostumesModule (copy)
	return {
		fetchingState = PerformFetch.GetStatus(p1, ConstantsModule.CreateOutfitKey),
		screenSize = p1.ScreenSize,
		shouldPreloadEditableCostumes = CheckShouldPreloadEditableCostumesModule(p1),
		ownedItemIdsBySubtype = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype,
		outfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos,
		combinedTryOnHumanoidDescription = if p2.lookId == nil then nil else CharacterManagerUtilsModule.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(p1)
	}
end, function(Callback)
	-- upvalues: CreateOutfitModule (copy), GetEditableOutfitsModule (copy)
	return {
		createOutfit = function(p1, p2, p3, p4, p5)
			-- upvalues: Callback (copy), CreateOutfitModule (upval)
			Callback(CreateOutfitModule(p1, p2, p3, p4, p5))
		end,
		getEditableUserCostumes = function()
			-- upvalues: Callback (copy), GetEditableOutfitsModule (upval)
			return Callback(GetEditableOutfitsModule())
		end
	}
end)(SaveOutfitPrompt)))))

if not FFlagAXMigrateSaveOutfitPromptFromRoactGamepad then
	v1 = WithOverlayFocusHandlingModule(v1)
end
local WithMappedNavigationParamsModuleResult = WithMappedNavigationParamsModule(v1)

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), WithMappedNavigationParamsModuleResult (ref), CryoModule (copy)
	return RoactModule.createElement(WithMappedNavigationParamsModuleResult, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)