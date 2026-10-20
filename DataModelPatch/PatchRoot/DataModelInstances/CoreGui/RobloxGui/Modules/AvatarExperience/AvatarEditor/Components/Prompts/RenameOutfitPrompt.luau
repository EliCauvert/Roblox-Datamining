local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local Focusable = RoactGamepadModule.Focusable
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local OutfitNameTextBoxModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitNameTextBox)
local CheckShouldPreloadEditableCostumesModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.CheckShouldPreloadEditableCostumes)
local RenameOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.RenameOutfit)
local GetEditableOutfitsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits)
local FFlagAXCharacterToAvatarStrings = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCharacterToAvatarStrings
local FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation
local FFlagAXFixDeselectOutfitInManage = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage
local RenameOutfitPrompt = RoactModule.PureComponent:extend("RenameOutfitPrompt")
RenameOutfitPrompt.validateProps = TModule.strictInterface({
	costumeId = TModule.string,
	containerWidth = TModule.optional(TModule.number),
	defaultChildRef = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback),
	focusController = TModule.optional(TModule.table),
	avatarEditorAnalytics = TModule.table,
	navigation = TModule.table,
	screenSize = TModule.Vector2,
	fetchingState = TModule.string,
	shouldPreloadEditableCostumes = TModule.boolean,
	ownedItemIdsBySubtype = TModule.table,
	outfitInfos = TModule.table,
	renameOutfit = TModule.callback,
	getEditableUserCostumes = TModule.callback
})

function RenameOutfitPrompt.init(p1)
	-- upvalues: UtilsModule1 (copy), ConstantsModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), RoactModule (copy), OutfitNameTextBoxModule (copy), UserInputService (copy)
	p1:setState({
		isKeyboardRepositioned = false,
		costumeName = "",
		isNameInvalid = true
	})
	
	function p1.renameOutfit()
		-- upvalues: p1 (copy), UtilsModule1 (upval), ConstantsModule (upval), NavigationUtilsModule (upval), AvatarScreen (upval)
		if p1.state.isNameInvalid then return end
		local CostumeName = p1.state.costumeName
		
		if UtilsModule1.isDuplicateOutfitName(p1.props.ownedItemIdsBySubtype, p1.props.outfitInfos, CostumeName) then
			local CostumeId = p1.props.costumeId
			NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, AvatarScreen.DuplicateOutfitNamePrompt, {
				outfitName = CostumeName,
				sourcePrompt = AvatarScreen.RenameOutfitPrompt,
				sourceParams = { costumeId = p1.props.costumeId },
				saveCallback = function()
					-- upvalues: p1 (upval), CostumeId (copy), CostumeName (copy)
					p1.props.renameOutfit(p1.props.avatarEditorAnalytics, CostumeId, CostumeName)
				end,
				saveFetchingStateKey = ConstantsModule.RenameOutfitKey .. CostumeId
			})
			
			return
		else
			p1.props.renameOutfit(p1.props.avatarEditorAnalytics, p1.props.costumeId, CostumeName)
		end
	end
	
	function p1.onOutfitNameUpdated(CostumeName, IsNameInvalid)
		-- upvalues: p1 (copy)
		p1:setState({ costumeName = CostumeName, isNameInvalid = IsNameInvalid })
	end
	
	function p1.renderMiddleContent()
		-- upvalues: RoactModule (upval), OutfitNameTextBoxModule (upval), p1 (copy)
		return RoactModule.createElement(OutfitNameTextBoxModule, { onOutfitNameUpdated = p1.onOutfitNameUpdated })
	end
	
	function p1.onScreenKeyboardVisibleChanged()
		-- upvalues: p1 (copy), UserInputService (upval)
		if p1.state.isKeyboardRepositioned ~= UserInputService.OnScreenKeyboardVisible then
			p1:setState({
				isKeyboardRepositioned = UserInputService.OnScreenKeyboardVisible
			})
		end
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function RenameOutfitPrompt.checkFetchEditableCostumes(p1)
	if p1.props.shouldPreloadEditableCostumes then
		p1.props.getEditableUserCostumes()
	end
end

function RenameOutfitPrompt.didMount(p1)
	p1:checkFetchEditableCostumes()
end

function RenameOutfitPrompt.willUpdate(p1, p2, _)
	-- upvalues: UtilsModule (copy)
	if UtilsModule.isFetchingDoneOrFailed(p1.props.fetchingState, p2.fetchingState) then
		p1.closePrompt()
	end
end

function RenameOutfitPrompt.renderWithProviders(p1, p2)
	-- upvalues: UserInputService (copy), RoactModule (copy), FFlagAXFixDeselectOutfitInManage (copy), Focusable (copy), FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation (copy), RoactGamepadModule (copy), ExternalEventConnection (copy), InteractiveAlert (copy), FFlagAXCharacterToAvatarStrings (copy), ButtonType (copy), RetrievalStatus (copy)
	local ScreenSize = p1.props.screenSize
	
	return RoactModule.createElement(if FFlagAXFixDeselectOutfitInManage then Focusable.TextButton else Focusable.Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		AutoButtonColor = not FFlagAXFixDeselectOutfitInManage and nil,
		Text = if FFlagAXFixDeselectOutfitInManage then "" else nil,
		Selectable = not FFlagAXFixDeselectOutfitInManage and nil,
		[RoactModule.Event.Activated] = if FFlagAXFixDeselectOutfitInManage then p1.closePrompt else nil,
		[RoactModule.Ref] = p1.props.focusNavigationRef,
		inputBindings = if FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation then nil else {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.closePrompt),
			Confirm = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, function() end, { key = "CommonUI.Controls.Action.Confirm" })
		}
	}, {
		KeyboardConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"),
			callback = p1.onScreenKeyboardVisibleChanged
		}),
		Alert = RoactModule.createElement(InteractiveAlert, {
			isMiddleContentFocusable = true,
			title = p2.titleText,
			bodyText = if FFlagAXCharacterToAvatarStrings then nil else p2.messageText,
			buttonStackInfo = {
				buttons = {
					{
						isDefaultChild = true,
						props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
					},
					{
						buttonType = if FFlagAXCharacterToAvatarStrings then ButtonType.PrimaryContextual else ButtonType.PrimarySystem,
						props = {
							isDisabled = p1.state.isNameInvalid,
							isLoading = p1.props.fetchingState == RetrievalStatus.Fetching,
							onActivated = p1.renameOutfit,
							text = p2.confirmButtonText
						}
					}
				}
			},
			middleContent = p1.renderMiddleContent,
			position = if p1.state.isKeyboardRepositioned then UDim2.new(0.5, 0, 0, (ScreenSize.Y - UserInputService.OnScreenKeyboardSize.Y) / 2) else UDim2.new(0.5, 0, 0.5, 0),
			screenSize = p1.props.screenSize,
			defaultChildRef = p1.props.defaultChildRef
		})
	})
end

function RenameOutfitPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy), FFlagAXCharacterToAvatarStrings (copy)
	return WithLocalizationFunction({
		messageText = "Feature.Avatar.Label.EnterNewCostumeName",
		confirmButtonText = "Feature.Avatar.Action.Save",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		titleText = if FFlagAXCharacterToAvatarStrings then "Feature.Avatar.Label.Title.AvatarName" else "Feature.Avatar.Heading.RenameCharacter"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

function RenameOutfitPrompt.didUpdate(p1, _, _)
	p1:checkFetchEditableCostumes()
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactServices.connect({ avatarEditorAnalytics = AnalyticsModule })((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ConstantsModule (copy), PerformFetch (copy), CheckShouldPreloadEditableCostumesModule (copy)
	return {
		fetchingState = PerformFetch.GetStatus(p1, ConstantsModule.RenameOutfitKey .. p2.costumeId),
		screenSize = p1.ScreenSize,
		shouldPreloadEditableCostumes = CheckShouldPreloadEditableCostumesModule(p1),
		ownedItemIdsBySubtype = p1.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype,
		outfitInfos = p1.AvatarExperience.AvatarEditor.OutfitInfos
	}
end, function(Callback)
	-- upvalues: RenameOutfitModule (copy), GetEditableOutfitsModule (copy)
	return {
		renameOutfit = function(p1, p2, p3)
			-- upvalues: Callback (copy), RenameOutfitModule (upval)
			Callback(RenameOutfitModule(p1, p2, p3))
		end,
		getEditableUserCostumes = function()
			-- upvalues: Callback (copy), GetEditableOutfitsModule (upval)
			return Callback(GetEditableOutfitsModule())
		end
	}
end)(RenameOutfitPrompt))))))))