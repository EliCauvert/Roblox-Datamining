local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local GetDuplicateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Selectors.GetDuplicateOutfit)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local NavOverlayContainerModule = require(Modules.AvatarExperience.Common.Components.NavOverlayContainer)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local AXOutfitMenuUpdatesForSlotBasedEditor2 = GetFFlagAXEnableSlotBasedEditorModule() and game:DefineFastFlag("AXOutfitMenuUpdatesForSlotBasedEditor2", false)
local SlotBasedEditorAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local FFlagAXAddManageOutfitClickTracking = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddManageOutfitClickTracking
local FFlagAXRemoveCreateOrUpdateOutfitMenuGamepadBindingsModule = require(Modules.AvatarExperience.Flags.FFlagAXRemoveCreateOrUpdateOutfitMenuGamepadBindings)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local CreateOrUpdateOutfitMenu = RoactModule.PureComponent:extend("CreateOrUpdateOutfitMenu")
CreateOrUpdateOutfitMenu.validateProps = TModule.strictInterface({
	screenSize = TModule.Vector2,
	duplicateOutfitId = TModule.optional(TModule.string),
	navigation = TModule.table,
	focusController = TModule.optional(TModule.table),
	onOverlayClosed = TModule.optional(TModule.callback),
	saveTilePosition = TModule.Vector2,
	defaultChildRef = TModule.optional(TModule.table)
})

function CreateOrUpdateOutfitMenu.init(p1)
	-- upvalues: FFlagAXAddManageOutfitClickTracking (copy), SlotBasedEditorAnalytics (copy), NavigationUtilsModule (copy), AvatarScreen (copy), RoactModule (copy)
	function p1.saveOutfitAsNew()
		-- upvalues: FFlagAXAddManageOutfitClickTracking (upval), SlotBasedEditorAnalytics (upval), p1 (copy), NavigationUtilsModule (upval), AvatarScreen (upval)
		if FFlagAXAddManageOutfitClickTracking then
			SlotBasedEditorAnalytics.trackAddNewAvatarClick()
		end
		if p1.props.duplicateOutfitId then
			NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, AvatarScreen.DuplicateOutfitInfoPrompt, {
				saveAsNew = true,
				duplicateOutfitId = p1.props.duplicateOutfitId
			})
			
			return
		else
			NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, AvatarScreen.SaveOutfitPrompt)
		end
	end
	
	function p1.updateExistingOutfit()
		-- upvalues: FFlagAXAddManageOutfitClickTracking (upval), SlotBasedEditorAnalytics (upval), p1 (copy), NavigationUtilsModule (upval), AvatarScreen (upval)
		if FFlagAXAddManageOutfitClickTracking then
			SlotBasedEditorAnalytics.trackUpdateAvatarClick()
		end
		if p1.props.duplicateOutfitId then
			NavigationUtilsModule.navigateToNextOverlay(p1.props.navigation, AvatarScreen.DuplicateOutfitInfoPrompt, {
				saveAsNew = false,
				duplicateOutfitId = p1.props.duplicateOutfitId
			})
			
			return
		else
			NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.UpdateOutfitPage)
		end
	end
	
	function p1.manageCharacters()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy), AvatarScreen (upval)
		NavigationUtilsModule.navigateFromOverlay(p1.props.navigation, AvatarScreen.ManageOutfitPage)
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
	
	p1:setState({ useFullWidth = false })
	
	function p1.onNavOverlaySizeChanged(Frame)
		-- upvalues: p1 (copy)
		if Frame.AbsoluteSize.X < 640 then
			if not p1.state.useFullWidth then
				p1:setState({ useFullWidth = true })
				
				return
			end
		elseif p1.state.useFullWidth then
			p1:setState({ useFullWidth = false })
		end
	end
	
	p1.positionOffset, p1.updatePositionOffset = RoactModule.createBinding(UDim2.fromOffset(0, 0))
	
	function p1.onNavOverlayPositionChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		p1.updatePositionOffset(UDim2.fromOffset(-Frame.AbsolutePosition.X, -Frame.AbsolutePosition.Y))
	end
end

function CreateOrUpdateOutfitMenu.renderLocalized(p1, p2)
	-- upvalues: MenuDirection (copy), RoactModule (copy), NavOverlayContainerModule (copy), Focusable (copy), FFlagAXRemoveCreateOrUpdateOutfitMenuGamepadBindingsModule (copy), RoactGamepadModule (copy), ContextualMenu (copy)
	local List = {}
	table.insert(List, {
		inputBindingKey = "CommonUI.Controls.Action.Confirm",
		text = p2.saveAsNew,
		onActivated = p1.saveOutfitAsNew
	})
	table.insert(List, {
		inputBindingKey = "CommonUI.Controls.Action.Confirm",
		text = p2.updateExistingCharacter,
		onActivated = p1.updateExistingOutfit
	})
	table.insert(List, {
		inputBindingKey = "CommonUI.Controls.Action.Confirm",
		text = p2.manageCharacters,
		onActivated = p1.manageCharacters
	})
	local NewY = p1.props.saveTilePosition.Y + 25
	local Down = MenuDirection.Down
	
	if p1.props.screenSize.Y < NewY + #List * 56 + 12 then
		NewY = p1.props.saveTilePosition.Y - 25
		Down = MenuDirection.Up
	end
	local _UDim2 = UDim2.fromOffset(p1.props.saveTilePosition.X - 42, 0)
	local _UDim2_1 = UDim2.new(0, 324, 1, 0)
	
	if p1.state.useFullWidth then
		_UDim2 = UDim2.fromOffset(0, 0)
		_UDim2_1 = UDim2.fromScale(1, 1)
	end
	return RoactModule.createElement(NavOverlayContainerModule, {
		onAbsoluteSizeChanged = p1.onNavOverlaySizeChanged,
		onAbsolutePositionChanged = p1.onNavOverlayPositionChanged
	}, {
		SizeFrame = RoactModule.createElement(Focusable.Frame, {
			BackgroundTransparency = 1,
			Position = _UDim2,
			Size = _UDim2_1,
			[RoactModule.Ref] = p1.props.defaultChildRef,
			inputBindings = if FFlagAXRemoveCreateOrUpdateOutfitMenuGamepadBindingsModule then nil else {
				NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.closePrompt)
			}
		}, {
			PositionOffsetFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Position = if p1.state.useFullWidth then nil else p1.positionOffset or nil,
				Size = UDim2.fromScale(1, 1)
			}, {
				ContextMenu = RoactModule.createElement(ContextualMenu, {
					open = true,
					closeBackgroundVisible = true,
					buttonProps = List,
					menuDirection = Down,
					openPositionY = UDim.new(0, NewY),
					screenSize = p1.props.screenSize,
					onDismiss = p1.closePrompt
				})
			})
		})
	})
end

function CreateOrUpdateOutfitMenu.render(p1)
	-- upvalues: WithLocalizationFunction (copy), AXOutfitMenuUpdatesForSlotBasedEditor2 (copy), GetFFlagAXEnableSlotBasedEditorModule (copy)
	return WithLocalizationFunction({
		saveAsNew = if AXOutfitMenuUpdatesForSlotBasedEditor2 then "Feature.Avatar.Label.Title.AddNewAvatar" else "Feature.Avatar.Action.SaveAsNew",
		updateExistingCharacter = if AXOutfitMenuUpdatesForSlotBasedEditor2 then "Feature.Avatar.Label.Title.UpdateAvatar" else "Feature.Avatar.Action.UpdateExistingCharacter",
		manageCharacters = if GetFFlagAXEnableSlotBasedEditorModule() then "Feature.Avatar.Label.Title.ManageAvatars" else "Feature.Avatar.Action.ManageCharacters"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, _)
	-- upvalues: GetDuplicateOutfitModule (copy)
	return {
		duplicateOutfitId = GetDuplicateOutfitModule(p1),
		screenSize = p1.ScreenSize
	}
end, nil)(CreateOrUpdateOutfitMenu))))))