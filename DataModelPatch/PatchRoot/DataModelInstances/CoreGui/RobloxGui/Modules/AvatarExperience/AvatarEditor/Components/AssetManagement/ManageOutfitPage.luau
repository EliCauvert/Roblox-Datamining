local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local FitTextLabel = require(CorePackages.Packages.FitFrame).FitTextLabel
local ConstantsModule = require(Modules.LuaApp.Constants)
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local FocusNavigationUtilsModule = require(CorePackages.Workspace.Packages.FocusNavigationUtils)
local _ = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseFocusNavigableSurfaceRegistryConnectionFunction = FocusNavigationUtilsModule.useFocusNavigableSurfaceRegistryConnection
local UseFocusOnMountEffectFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.useFocusOnMountEffect
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
local UseManageOutfitPageFocusNavigationBindingsModule = require(Modules.AvatarExperience.AvatarEditor.Components.AssetManagement.useManageOutfitPageFocusNavigationBindings)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXAddManageOutfitClickTracking = AvatarExperienceFlagsModule.FFlagAXAddManageOutfitClickTracking
local FFlagAXFixDeselectOutfitInManage = AvatarExperienceFlagsModule.FFlagAXFixDeselectOutfitInManage
local FFlagAXFixGamepadNavigationOnOutfitManagement = AvatarExperienceFlagsModule.FFlagAXFixGamepadNavigationOnOutfitManagement
local AXFocusOnMountManageOutfitPage = game:DefineFastFlag("AXFocusOnMountManageOutfitPage", false)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
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
	avatarEditorAnalytics = TModule.table,
	multiSelectionEnabled = TModule.boolean,
	setMultiSelectionEnabled = TModule.callback,
	outfitGridCanScroll = TModule.boolean,
	setOutfitGridCanScroll = TModule.callback,
	selectedOutfits = TModule.table,
	setSelectedOutfits = TModule.callback,
	exitButtonPosition = TModule.Vector2,
	setExitButtonPosition = TModule.callback,
	isGamepad = TModule.boolean,
	setIsGamepad = TModule.callback,
	focusNavigationRef = TModule.union(TModule.callback, TModule.table),
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.table
})

function ManageOutfitPage.init(p1)
	-- upvalues: RoactModule (copy), RoactGamepadModule (copy), WithStyleFunction (copy), IconButton (copy), IconsNavigationClose (copy), IconSize (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (copy), NavigationUtilsModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), LogOnOverlayClosedFunction (copy), FFlagAXAddManageOutfitClickTracking (copy), SlotBasedEditorAnalytics (copy), AvatarScreen (copy), FFlagAXFixDeselectOutfitInManage (copy), MutedErrorModule (copy), UserInputService (copy), IsGamepadInputFunction (copy)
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
			p1.props.setSelectedOutfits({ p2 })
			
			return
		else
			p1.props.setSelectedOutfits(p2 or {})
		end
	end
	
	function p1.exitButtonPositionChanged(Frame: Frame)
		-- upvalues: p1 (copy)
		if Frame.AbsolutePosition ~= p1.props.exitButtonPosition then
			p1.props.setExitButtonPosition(Frame.AbsolutePosition)
		end
	end
	
	function p1.renderExitButton()
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), IconButton (upval), IconsNavigationClose (upval), IconSize (upval), p1 (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (upval)
		return WithStyleFunction(function(p2)
			-- upvalues: RoactModule (upval), IconButton (upval), IconsNavigationClose (upval), IconSize (upval), p1 (upval), FFlagAXFixGamepadNavigationOnOutfitManagement (upval)
			local Theme = p2.Theme
			
			return RoactModule.createElement(IconButton, {
				size = UDim2.new(0, 44, 1, 0),
				icon = IconsNavigationClose,
				iconSize = IconSize.Medium,
				iconColor3 = Theme.SystemPrimaryDefault.Color,
				iconTransparency = Theme.SystemPrimaryDefault.Transparency,
				onActivated = p1.navigateBack,
				buttonRef = p1.exitButtonRef,
				NextSelectionDown = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil else p1.gridViewRef,
				NextSelectionRight = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil else p1.selectButtonRef,
				onAbsolutePositionChanged = p1.exitButtonPositionChanged
			})
		end)
	end
	
	function p1.selectButtonPressed()
		-- upvalues: p1 (copy), NavigationUtilsModule (upval)
		p1.props.setMultiSelectionEnabled(not p1.props.multiSelectionEnabled)
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
	end
	
	function p1.outfitGridCanScrollUpdated(OutfitGridCanScroll)
		-- upvalues: p1 (copy)
		if p1.props.outfitGridCanScroll ~= OutfitGridCanScroll then
			p1.props.setOutfitGridCanScroll(OutfitGridCanScroll)
		end
	end
	
	function p1.onPeekViewClosed()
		-- upvalues: p1 (copy), FFlagAXMigrateAXToGlobalAutofocus (upval)
		p1.props.setSelectedOutfits({})
		
		if not FFlagAXMigrateAXToGlobalAutofocus and p1.props.isGamepad then
			p1.props.focusController.captureFocus()
		end
	end
	
	function p1.onOverlayClosed()
		-- upvalues: p1 (copy), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval)
		local IsGamepad = p1.props.isGamepad
		LogOnOverlayClosedFunction("ManageOutfitPage", IsGamepad)
		
		if not FFlagAXMigrateAXToGlobalAutofocus and IsGamepad then
			p1.props.focusController.captureFocus()
		end
	end
	
	function p1.deleteOutfit()
		-- upvalues: FFlagAXAddManageOutfitClickTracking (upval), SlotBasedEditorAnalytics (upval), p1 (copy), AvatarScreen (upval)
		if FFlagAXAddManageOutfitClickTracking then
			SlotBasedEditorAnalytics.trackDeleteAvatarAttemptClick(p1.state.multiSelectionEnabled)
		end
		p1.props.navigation.navigate(AvatarScreen.DeleteOutfitPrompt, {
			outfitIds = p1.props.selectedOutfits,
			onOverlayClosed = function()
				-- upvalues: p1 (upval)
				if p1.props.multiSelectionEnabled then
					p1.props.setMultiSelectionEnabled(false)
				end
				p1.onOverlayClosed()
			end
		})
	end
	
	function p1.renameOutfit()
		-- upvalues: FFlagAXFixDeselectOutfitInManage (upval), p1 (copy), MutedErrorModule (upval), AvatarScreen (upval)
		if FFlagAXFixDeselectOutfitInManage and (not p1.props.selectedOutfits or not p1.props.selectedOutfits[1]) then
			MutedErrorModule("Tried to rename an outfit with no outfit selected", p1.props.selectedOutfits)
			
			return
		else
			p1.props.navigation.navigate(AvatarScreen.RenameOutfitPrompt, {
				costumeId = p1.props.selectedOutfits[1],
				onOverlayClosed = p1.onOverlayClosed
			})
		end
	end
	
	function p1.lastInputTypeChangedCallback()
		-- upvalues: UserInputService (upval), IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction((UserInputService:GetLastInputType()))
		
		if IsGamepadInput ~= p1.props.isGamepad then
			p1.props.setIsGamepad(IsGamepadInput)
		end
	end
	
	function p1.onToggleOutfitCard(p2, OutfitId)
		-- upvalues: p1 (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (upval), NavigationUtilsModule (upval), AvatarScreen (upval)
		local Navigation = p1.props.navigation
		
		if p2 then
			local config = {
				ZIndex = 2,
				outfitId = OutfitId,
				onPeekViewClosed = p1.onPeekViewClosed,
				exitButtonPosition = p1.props.exitButtonPosition,
				deleteOutfit = p1.deleteOutfit,
				renameOutfit = p1.renameOutfit,
				NextSelectionLeft = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil elseif p1.props.isPortrait then nil else p1.gridViewRef or nil,
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
	-- upvalues: RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), FitTextLabel (copy), Focusable (copy), CursorKind (copy)
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then FitTextLabel else Focusable[FitTextLabel], {
		width = FitTextLabel.Width.FitToText,
		onActivated = p1.selectButtonPressed,
		BackgroundTransparency = 1,
		Text = if p1.props.multiSelectionEnabled then p2.cancel else p2.select,
		Font = p3.Font.Header2.Font,
		LayoutOrder = 1,
		TextColor3 = p3.Theme.TextEmphasis.Color,
		TextSize = p3.Font.BaseSize * p3.Font.Header2.RelativeSize,
		SelectionImageObject = Callback(CursorKind.RoundedRect),
		NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.exitButtonRef,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.gridViewRef,
		[RoactModule.Ref] = p1.selectButtonRef
	})
end

function ManageOutfitPage.renderWithProviders(p1, p2, p3, p4)
	-- upvalues: IsTenFootInterface (copy), ConstantsModule (copy), FFlagAXFixGamepadNavigationOnOutfitManagement (copy), RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), ExternalEventConnection (copy), UserInputService (copy), BoundInputsUpdaterModule (copy), NavOverlayPageContainerModule (copy), OutfitSelectionGridModule (copy), AvatarScreen (copy), ManageActionBarModule (copy)
	local v1: boolean = not p1.props.multiSelectionEnabled and #p1.props.selectedOutfits == 1
	local GAMEPADBOTTOMBARSIZE = if p1.props.isGamepad and IsTenFootInterface then ConstantsModule.GAMEPAD_BOTTOM_BAR_SIZE else nil
	
	if v1 then
		local _ = p1.peekViewRef
	end
	if v1 then
		local Key = p1.props.avatarRoute.current.key
		
		if not FFlagAXFixGamepadNavigationOnOutfitManagement then
			local _ = p1.outfitDetailsPeekViewRefs[Key]
		end
	end
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 1),
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.gridViewRef,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil
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
			forwardRef = p1.props.focusNavigationRef,
			focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p1.props.focusController,
			onDismiss = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil else p1.navigateBack
		}, {
			OutfitSelectionGrid = RoactModule.createElement(OutfitSelectionGridModule, {
				onToggleOutfitCard = p1.onToggleOutfitCard,
				selectedOutfits = p1.props.selectedOutfits,
				selectionUpdated = p1.selectedOutfitUpdated,
				canScrollUpdated = p1.outfitGridCanScrollUpdated,
				multiSelect = p1.props.multiSelectionEnabled,
				goBack = p1.navigateBack,
				pageOwner = AvatarScreen.ManageOutfitPage,
				NextSelectionUp = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil else p1.exitButtonRef,
				NextSelectionDown = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil elseif p1.props.multiSelectionEnabled then p1.actionBarRef else nil,
				NextSelectionRight = nil,
				[RoactModule.Ref] = p1.gridViewRef
			}),
			ManageActionBar = p1.props.multiSelectionEnabled and RoactModule.createElement(ManageActionBarModule, {
				gradientFade = p1.props.outfitGridCanScroll,
				multiSelect = true,
				selectedOutfits = p1.props.selectedOutfits,
				bottomPadding = GAMEPADBOTTOMBARSIZE,
				deleteOutfit = p1.deleteOutfit,
				renameOutfit = p1.renameOutfit,
				ZIndex = 2,
				NextSelectionUp = if FFlagAXFixGamepadNavigationOnOutfitManagement then nil else p1.gridViewRef,
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

function ManageOutfitPage.didUpdate(p1, p2, _)
	-- upvalues: FFlagAXFixDeselectOutfitInManage (copy), NavigationUtilsModule (copy)
	local v1: boolean = #p1.props.selectedOutfits ~= 1 and #p2.selectedOutfits == 1
	
	if not p1.props.multiSelectionEnabled and v1 then
		if FFlagAXFixDeselectOutfitInManage then
			NavigationUtilsModule.closeAllDialogs(p1.props.navigation)
		end
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.props.navigation)
	end
end

local WithStackVisibilityWrapperModuleResult = WithStackVisibilityWrapperModule((RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: NavigateWithLockFunction (copy)
	return {
		navigateWithLock = function(p1)
			-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
			Callback(NavigateWithLockFunction(p1))
		end
	}
end)(ManageOutfitPage)))

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), AnalyticsModule (copy), UseAppPolicyModule (copy), UserInputService (copy), IsGamepadInputFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy), RoactGamepadModule (copy), FocusNavigationEventNameEnum (copy), NavigationUtilsModule (copy), LogOnOverlayClosedFunction (copy), AvatarScreen (copy), FFlagAXFixDeselectOutfitInManage (copy), MutedErrorModule (copy), UseManageOutfitPageFocusNavigationBindingsModule (copy), UseFocusNavigableSurfaceRegistryConnectionFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), AXFocusOnMountManageOutfitPage (copy), UseFocusOnMountEffectFunction (copy), WithStackVisibilityWrapperModuleResult (ref), CryoModule (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getCustomOutfitNames()
	end)
	local IsGamepadInput = IsGamepadInputFunction((UserInputService:GetLastInputType()))
	local UseMemoResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else ReactModule.useMemo(function()
		-- upvalues: RoactGamepadModule (upval)
		return RoactGamepadModule.createFocusController()
	end, {})
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState({})
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(IsGamepadInput)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), NavigationUtilsModule (upval), p1 (copy)
		UseStateResult2(true)
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.navigation)
	end, { p1.navigation })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), NavigationUtilsModule (upval), p1 (copy)
		UseStateResult2(false)
		NavigationUtilsModule.closeFiltersAndItemDetails(p1.navigation)
	end, { p1.navigation })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseStateResult5 (copy), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseMemoResult (copy), p1 (copy), AvatarScreen (upval), UseStateResult3 (copy)
		p1.navigation.navigate(AvatarScreen.DeleteOutfitPrompt, {
			outfitIds = UseStateResult3,
			onOverlayClosed = function()
				-- upvalues: UseStateResult (upval), UseStateResult2 (upval), UseStateResult5 (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseMemoResult (upval)
				if UseStateResult then
					UseStateResult2(false)
				end
				LogOnOverlayClosedFunction("ManageOutfitPage", UseStateResult5)
				
				if not FFlagAXMigrateAXToGlobalAutofocus and UseStateResult5 then
					UseMemoResult.captureFocus()
				end
			end
		})
	end, {
		UseStateResult3,
		UseStateResult,
		UseStateResult5,
		p1.navigation,
		if FFlagAXMigrateAXToGlobalAutofocus then nil else UseMemoResult
	})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: FFlagAXFixDeselectOutfitInManage (upval), UseStateResult3 (copy), MutedErrorModule (upval), UseStateResult5 (copy), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseMemoResult (copy), p1 (copy), AvatarScreen (upval)
		if FFlagAXFixDeselectOutfitInManage and (not UseStateResult3 or not UseStateResult3[1]) then
			MutedErrorModule("Tried to rename an outfit with no outfit selected", UseStateResult3)
			
			return
		else
			p1.navigation.navigate(AvatarScreen.RenameOutfitPrompt, {
				costumeId = UseStateResult3[1],
				onOverlayClosed = function()
					-- upvalues: UseStateResult5 (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), UseMemoResult (upval)
					LogOnOverlayClosedFunction("ManageOutfitPage", UseStateResult5)
					
					if not FFlagAXMigrateAXToGlobalAutofocus and UseStateResult5 then
						UseMemoResult.captureFocus()
					end
				end
			})
		end
	end, {
		p1.navigation,
		UseStateResult3,
		UseStateResult5,
		if FFlagAXMigrateAXToGlobalAutofocus then nil else UseMemoResult
	})
	local v1: boolean = not UseStateResult and #UseStateResult3 == 1
	local v2: boolean = not UseStateResult and (UseAppPolicyModuleResult and #UseStateResult3 == 1)
	local UseManageOutfitPageFocusNavigationBindingsModuleResult = UseManageOutfitPageFocusNavigationBindingsModule(UseRefResult, ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), UseStateResult (copy)
		return {
			[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
			[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
			[Enum.KeyCode.ButtonL3] = if UseStateResult then FocusNavigationEventNameEnum.ManageOutfitsCancelMultiSelect else FocusNavigationEventNameEnum.ManageOutfitsToggleMultiSelect,
			[Enum.KeyCode.ButtonX] = FocusNavigationEventNameEnum.ManageOutfitsDelete,
			[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.ManageOutfitsRename
		}
	end, { UseStateResult }), {
		onGoBack = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.navigation.goBack()
		end, { p1.navigation.goBack }),
		onToggleMultiselect = if v1 or UseStateResult then nil else UseResult,
		onCancelMultiselect = if v1 or not UseStateResult then nil else UseResult1,
		onDelete = if #UseStateResult3 > 0 then UseResult2 else nil,
		onRename = if v2 then UseResult3 else nil
	})
	UseFocusNavigableSurfaceRegistryConnectionFunction(UseRefResult and UseRefResult.current, FocusNavigableSurfaceIdentifierEnum.SubRouterView)
	
	if AXFocusOnMountManageOutfitPage then
		UseFocusOnMountEffectFunction(UseRefResult)
	end
	return ReactModule.createElement(WithStackVisibilityWrapperModuleResult, CryoModule.Dictionary.join(p1, {
		multiSelectionEnabled = UseStateResult,
		setMultiSelectionEnabled = UseStateResult2,
		outfitGridCanScroll = UseStateResult1,
		setOutfitGridCanScroll = UseStateResult2_1,
		selectedOutfits = UseStateResult3,
		setSelectedOutfits = UseStateResult2_2,
		exitButtonPosition = UseStateResult4,
		setExitButtonPosition = UseStateResult2_3,
		isGamepad = UseStateResult5,
		setIsGamepad = UseStateResult2_4,
		focusNavigationRef = UseManageOutfitPageFocusNavigationBindingsModuleResult,
		avatarEditorAnalytics = UseRoactServiceModuleResult,
		showCustomOutfitNames = UseAppPolicyModuleResult,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseMemoResult
	}))
end