local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local FitTextLabel = require(CorePackages.Packages.FitFrame).FitTextLabel
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local ConstantsModule = require(Modules.LuaApp.Constants)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local SlotBasedEditorAnalytics = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).Surfaces.SlotBasedEditorAnalytics
local NavOverlayPageContainerModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.NavOverlayPageContainer)
local OutfitSelectionGridModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGrid)
local ManageActionBarModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.ManageActionBar)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local FFlagAXAddManageOutfitClickTracking = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddManageOutfitClickTracking
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXFixDeselectOutfitInManage = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixDeselectOutfitInManage
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Focusable = RoactGamepadModule.Focusable
local IconsNavigationClose = UIBloxModule.App.ImageSet.Images["icons/navigation/close"]
local IsTenFootInterface = game:GetService("GuiService"):IsTenFootInterface()
local ManageOutfitPage = RoactModule.PureComponent:extend("ManageOutfitPage")
ManageOutfitPage.validateProps = TModule.strictInterface({
	navigateWithLock = TModule.callback,
	navigation = TModule.table,
	avatarRoute = TModule.table,
	showCustomOutfitNames = TModule.boolean,
	avatarEditorAnalytics = TModule.table
})

function ManageOutfitPage.init(p1)
	-- upvalues: UserInputService (copy), IsGamepadInputFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), RoactModule (copy), WithStyleFunction (copy), IconButton (copy), IconsNavigationClose (copy), IconSize (copy), NavigationUtilsModule (copy), LogOnOverlayClosedFunction (copy), FFlagAXAddManageOutfitClickTracking (copy), SlotBasedEditorAnalytics (copy), AvatarScreen (copy), FFlagAXFixDeselectOutfitInManage (copy), MutedErrorModule (copy)
	p1:setState({
		multiSelectionEnabled = false,
		outfitGridCanScroll = false,
		selectedOutfits = {},
		exitButtonPosition = Vector2.new(0, 0),
		isGamepad = IsGamepadInputFunction((UserInputService:GetLastInputType()))
	})
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.createFocusController()
	p1.exitButtonRef = RoactModule.createRef()
	p1.selectButtonRef = RoactModule.createRef()
	p1.gridViewRef = RoactModule.createRef()
	p1.actionBarRef = RoactModule.createRef()
	p1.peekViewRef = RoactModule.createRef()
	p1.outfitDetailsPeekViewRefs = RoactGamepadModule.createRefCache()
	
	function p1.navigateBack()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.selectedOutfitUpdated(p2)
		-- upvalues: p1 (copy)
		if typeof(p2) == "string" then
			p1:setState({ selectedOutfits = { p2 } })
			
			return
		else
			p1:setState({ selectedOutfits = p2 or {} })
		end
	end
	
	function p1.exitButtonPositionChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		if Frame.AbsolutePosition ~= p1.state.exitButtonPosition then
			p1:setState({ exitButtonPosition = Frame.AbsolutePosition })
		end
	end
	
	function p1.renderExitButton()
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), IconButton (upval), IconsNavigationClose (upval), IconSize (upval), p1 (copy)
		return WithStyleFunction(function(p2)
			-- upvalues: RoactModule (upval), IconButton (upval), IconsNavigationClose (upval), IconSize (upval), p1 (upval)
			local Theme = p2.Theme
			
			return RoactModule.createElement(IconButton, {
				size = UDim2.new(0, 44, 1, 0),
				icon = IconsNavigationClose,
				iconSize = IconSize.Medium,
				iconColor3 = Theme.SystemPrimaryDefault.Color,
				iconTransparency = Theme.SystemPrimaryDefault.Transparency,
				onActivated = p1.navigateBack,
				buttonRef = p1.exitButtonRef,
				NextSelectionDown = p1.gridViewRef,
				NextSelectionRight = p1.selectButtonRef,
				onAbsolutePositionChanged = p1.exitButtonPositionChanged
			})
		end)
	end
	
	function p1.selectButtonPressed()
		-- upvalues: p1 (copy), NavigationUtilsModule (upval)
		p1:setState({
			multiSelectionEnabled = not p1.state.multiSelectionEnabled
		})
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
	end
	
	function p1.outfitGridCanScrollUpdated(OutfitGridCanScroll)
		-- upvalues: p1 (copy)
		if p1.state.outfitGridCanScroll ~= OutfitGridCanScroll then
			p1:setState({ outfitGridCanScroll = OutfitGridCanScroll })
		end
	end
	
	function p1.onPeekViewClosed()
		-- upvalues: p1 (copy), FFlagAXMigrateAXToGlobalAutofocus (upval)
		p1:setState({ selectedOutfits = {} })
		
		if not FFlagAXMigrateAXToGlobalAutofocus and p1.state.isGamepad then
			p1.focusController.captureFocus()
		end
	end
	
	function p1.onOverlayClosed()
		-- upvalues: p1 (copy), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval)
		local IsGamepad = p1.state.isGamepad
		LogOnOverlayClosedFunction("ManageOutfitPage", IsGamepad)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and IsGamepad then
			p1.focusController.captureFocus()
		end
	end
	
	function p1.deleteOutfit()
		-- upvalues: FFlagAXAddManageOutfitClickTracking (upval), SlotBasedEditorAnalytics (upval), p1 (copy), AvatarScreen (upval)
		if FFlagAXAddManageOutfitClickTracking then
			SlotBasedEditorAnalytics.trackDeleteAvatarAttemptClick(p1.state.multiSelectionEnabled)
		end
		p1.props.navigation.navigate(AvatarScreen.DeleteOutfitPrompt, {
			outfitIds = p1.state.selectedOutfits,
			onOverlayClosed = function()
				-- upvalues: p1 (upval)
				if p1.state.multiSelectionEnabled then
					p1:setState({ multiSelectionEnabled = false })
				end
				p1.onOverlayClosed()
			end
		})
	end
	
	function p1.renameOutfit()
		-- upvalues: FFlagAXFixDeselectOutfitInManage (upval), p1 (copy), MutedErrorModule (upval), AvatarScreen (upval)
		if FFlagAXFixDeselectOutfitInManage and (not p1.state.selectedOutfits or not p1.state.selectedOutfits[1]) then
			MutedErrorModule("Tried to rename an outfit with no outfit selected", p1.state.selectedOutfits)
			
			return
		else
			p1.props.navigation.navigate(AvatarScreen.RenameOutfitPrompt, {
				costumeId = p1.state.selectedOutfits[1],
				onOverlayClosed = p1.onOverlayClosed
			})
		end
	end
	
	function p1.lastInputTypeChangedCallback()
		-- upvalues: UserInputService (upval), IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction((UserInputService:GetLastInputType()))
		
		if IsGamepadInput ~= p1.state.isGamepad then
			p1:setState({ isGamepad = IsGamepadInput })
		end
	end
	
	function p1.onToggleOutfitCard(p2, OutfitId)
		-- upvalues: p1 (copy), NavigationUtilsModule (upval), AvatarScreen (upval)
		local Navigation = p1.props.navigation
		
		if p2 then
			local config = {
				ZIndex = 2,
				outfitId = OutfitId,
				onPeekViewClosed = p1.onPeekViewClosed,
				exitButtonPosition = p1.state.exitButtonPosition,
				deleteOutfit = p1.deleteOutfit,
				renameOutfit = p1.renameOutfit,
				NextSelectionLeft = if p1.props.isPortrait then nil else p1.gridViewRef or nil,
				outfitDetailsPeekViewRefs = p1.outfitDetailsPeekViewRefs
			}
			p1.props.navigateWithLock(function()
				-- upvalues: NavigationUtilsModule (upval), Navigation (copy), AvatarScreen (upval), config (copy)
				NavigationUtilsModule.closeFiltersAndItemDetails(Navigation)
				NavigationUtilsModule.closeTryOnManager(Navigation)
				Navigation.navigate(AvatarScreen.OutfitDetails, config)
			end)
			
			return
		else
			NavigationUtilsModule.closeFiltersAndItemDetails(Navigation)
		end
	end
end

function ManageOutfitPage.renderRightTopBarButton(p1, p2, p3, Callback)
	-- upvalues: RoactModule (copy), Focusable (copy), FitTextLabel (copy), CursorKind (copy)
	return RoactModule.createElement(Focusable[FitTextLabel], {
		width = FitTextLabel.Width.FitToText,
		onActivated = p1.selectButtonPressed,
		BackgroundTransparency = 1,
		Text = if p1.state.multiSelectionEnabled then p2.cancel else p2.select,
		Font = p3.Font.Header2.Font,
		LayoutOrder = 1,
		TextColor3 = p3.Theme.TextEmphasis.Color,
		TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
		SelectionImageObject = Callback(CursorKind.RoundedRect),
		NextSelectionLeft = p1.exitButtonRef,
		NextSelectionDown = p1.gridViewRef,
		[RoactModule.Ref] = p1.selectButtonRef
	})
end

function ManageOutfitPage.renderWithProviders(p1, p2, p3, p4)
	-- upvalues: IsTenFootInterface (copy), ConstantsModule (copy), RoactModule (copy), Focusable (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), ExternalEventConnection (copy), UserInputService (copy), BoundInputsUpdaterModule (copy), NavOverlayPageContainerModule (copy), OutfitSelectionGridModule (copy), AvatarScreen (copy), ManageActionBarModule (copy)
	local v1: boolean = not p1.state.multiSelectionEnabled and #p1.state.selectedOutfits == 1
	local v2: boolean = not p1.state.multiSelectionEnabled and (p1.props.showCustomOutfitNames and #p1.state.selectedOutfits == 1)
	local GAMEPADBOTTOMBARSIZE = if p1.state.isGamepad and IsTenFootInterface then ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE else nil
	
	return RoactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		restorePreviousChildFocus = true,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
		defaultChild = p1.gridViewRef,
		inputBindings = {
			NavigateBack = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, p1.navigateBack),
			ToggleMultiSelect = if v1 then nil else RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonL3, p1.selectButtonPressed, {
				key = if p1.state.multiSelectionEnabled then "Feature.Avatar.Action.CancelSelection" else "Feature.Avatar.Action.SelectMultipleItems"
			}),
			Delete = if #p1.state.selectedOutfits > 0 then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, p1.deleteOutfit, { key = "Feature.Avatar.Action.Delete" }) else nil,
			Rename = if v2 then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonY, p1.renameOutfit, { key = "Feature.Avatar.Action.Rename" }) else nil
		}
	}, {
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = p1.lastInputTypeChangedCallback
		}),
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(BoundInputsUpdaterModule),
		NavOverlayPageContainer = RoactModule.createElement(NavOverlayPageContainerModule, {
			ZIndex = 1,
			headerBarProps = {
				title = p2.manage,
				renderLeft = p1.renderExitButton,
				renderRight = function()
					-- upvalues: p1 (copy), p2 (copy), p3 (copy), p4 (copy)
					return p1:renderRightTopBarButton(p2, p3, p4)
				end
			},
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.focusController,
			onDismiss = p1.navigateBack
		}, {
			OutfitSelectionGrid = RoactModule.createElement(OutfitSelectionGridModule, {
				onToggleOutfitCard = p1.onToggleOutfitCard,
				selectedOutfits = p1.state.selectedOutfits,
				selectionUpdated = p1.selectedOutfitUpdated,
				canScrollUpdated = p1.outfitGridCanScrollUpdated,
				multiSelect = p1.state.multiSelectionEnabled,
				goBack = p1.navigateBack,
				pageOwner = AvatarScreen.ManageOutfitPage,
				NextSelectionUp = p1.exitButtonRef,
				NextSelectionDown = if p1.state.multiSelectionEnabled then p1.actionBarRef else nil,
				NextSelectionRight = if v1 then p1.outfitDetailsPeekViewRefs[p1.props.avatarRoute.current.key] elseif v1 then p1.peekViewRef else nil,
				[RoactModule.Ref] = p1.gridViewRef
			}),
			ManageActionBar = p1.state.multiSelectionEnabled and RoactModule.createElement(ManageActionBarModule, {
				gradientFade = p1.state.outfitGridCanScroll,
				multiSelect = true,
				selectedOutfits = p1.state.selectedOutfits,
				bottomPadding = GAMEPADBOTTOMBARSIZE,
				deleteOutfit = p1.deleteOutfit,
				renameOutfit = p1.renameOutfit,
				ZIndex = 2,
				NextSelectionUp = p1.gridViewRef,
				[RoactModule.Ref] = p1.actionBarRef
			}) or nil
		})
	})
end

function ManageOutfitPage.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithLocalizationFunction({
		manage = "Feature.Avatar.Heading.Manage",
		select = "Feature.Avatar.Action.Select",
		cancel = "Feature.Avatar.Action.Cancel"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (upval), p2 (copy)
			return WithSelectionCursorProviderFunction(function(p4)
				-- upvalues: p1 (upval), p2 (upval), p3 (copy)
				return p1:renderWithProviders(p2, p3, p4)
			end)
		end)
	end)
end

function ManageOutfitPage.didUpdate(p1, _, p2)
	-- upvalues: FFlagAXFixDeselectOutfitInManage (copy), NavigationUtilsModule (copy)
	local v1: boolean = #p1.state.selectedOutfits ~= 1 and #p2.selectedOutfits == 1
	
	if not p1.state.multiSelectionEnabled and v1 then
		if FFlagAXFixDeselectOutfitInManage then
			NavigationUtilsModule.closeAllDialogs(p1.props.navigation)
		end
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
	end
end

return (WithStackVisibilityWrapperModule((RoactAppPolicy.connect(function(p1, _)
	return { showCustomOutfitNames = p1.getCustomOutfitNames() }
end)((RoactServices.connect({ avatarEditorAnalytics = AnalyticsModule })((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: NavigateWithLockFunction (copy)
	return {
		navigateWithLock = function(p1)
			-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
			Callback(NavigateWithLockFunction(p1))
		end
	}
end)(ManageOutfitPage))))))))