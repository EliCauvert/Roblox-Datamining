local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local TModule = require(CorePackages.Packages.t)
local ExternalEventConnection = require(CorePackages.Workspace.Packages.RoactUtils).ExternalEventConnection
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UseAvatarRouteFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local WithStackVisibilityWrapperModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withStackVisibilityWrapper)
local VerticalClothingListModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.VerticalClothingList)
local ResetButtonModule = require(Modules.AvatarExperience.LayeredClothingSort.Components.ResetButton)
local SceneInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.Scene.SceneInteractionFrame)
local TopBarModule = require(Modules.LuaApp.Components.TopBar.TopBar)
local MakeAvatarBackButtonModule = require(Modules.AvatarExperience.Common.Components.TopBar.makeAvatarBackButton)
local SetLastSavedSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetLastSavedSort)
local SetCurrentSortModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort)
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local ClearRemovedItemsModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.ClearRemovedItems)
local FullView = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Enums.FullView
local GamepadFocusHandlerForPageModule = require(Modules.AvatarExperience.Common.Components.GamepadFocusHandlerForPage)
local VRAvatarRotateHandlerModule = require(Modules.AvatarExperience.Common.Components.Scene.VRAvatarRotateHandler)
local BoundInputsUpdaterModule = require(Modules.AvatarExperience.Common.Components.BoundInputsUpdater)
local ConstantsModule = require(Modules.AvatarExperience.AvatarRefinement.Constants)
local SelectEquippedLCAccessoriesOrderedModule = require(Modules.AvatarExperience.LayeredClothingSort.Selectors.selectEquippedLCAccessoriesOrdered)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local HasClassicAccessoriesModule = require(Modules.AvatarExperience.LayeredClothingSort.Selectors.hasClassicAccessories)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.LayeredClothingSort.Services.Analytics)
local SetEntryPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage)
local UnlockCharacterUpdatesModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.UnlockCharacterUpdates)
local SendRefinementAnalyticsModule = require(Modules.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics)
local RefinementNavBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementNavBar)
local RefinementControlBarModule = require(Modules.AvatarExperience.AvatarRefinement.Components.RefinementControlBar)
local IsGamepadInputFunction = require(CorePackages.Workspace.Packages.RoactUtils).isGamepadInput
local SceneGamepadHandlerModule = if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSceneGamepadHandlerInputBindings then require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler) else require(Modules.AvatarExperience.Common.Components.Scene.SceneGamepadHandler_DEPRECATED)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXCustomizeMakeupSupport = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXCustomizeMakeupSupport
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local config = {
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.ButtonY] = FocusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt
}

local function useFocusNavigationBindings(UseRefResult, Callback, p1)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy), p1 (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(p2)
					-- upvalues: Callback (upval)
					p2.cancelled = true
					Callback()
				end)
			},
			[FocusNavigationEventNameEnum.OpenLayeredClothingSortResetPrompt] = if p1 then { handler = InputHandlersModule.onRelease(p1) } else nil
		}
	end, { Callback, p1 }), (ReactFocusNavigationModule.useEventMap(config, UseRefResult)))
end

local config1 = {
	toastMessage = "Feature.Avatar.Message.LCSortClassicWarning",
	isLocalized = false,
	toastType = require(Modules.LuaApp.Enum.ToastType).InformationMessage
}
local IconsMenuAboutLarge = UIBloxModule.App.ImageSet.Images["icons/menu/about_large"]
local _UDim = UDim.new(0, 10)
local LayeredClothingSortPage = RoactModule.PureComponent:extend("LayeredClothingSortPage")
LayeredClothingSortPage.validateProps = TModule.strictInterface({
	wrappedFrameRef = TModule.table,
	setWrapperIsGamepad = TModule.callback,
	tokens = TModule.table,
	isPortrait = TModule.boolean,
	topBarHeight = TModule.number,
	equippedLCAssetIdsOrdered = TModule.table,
	equippedAssets = TModule.table,
	hasClassicAccessories = TModule.boolean,
	removedList = TModule.optional(TModule.table),
	isLocalUserSoothSayer = TModule.optional(TModule.boolean),
	setLastSavedSort = TModule.callback,
	setCurrentToastMessage = TModule.callback,
	setFullView = TModule.callback,
	setCurrentSort = TModule.callback,
	sendAnalytics = TModule.callback,
	setEntryPage = TModule.callback,
	clearRemovedItems = TModule.callback,
	unlockCharacterUpdates = TModule.callback,
	navigation = TModule.table,
	avatarRoute = TModule.table,
	avatarExperienceAnalytics = TModule.table,
	analytics = TModule.table
})

function LayeredClothingSortPage.init(p1)
	-- upvalues: RoactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), IsVRAppBuildFunction (copy), IsGamepadInputFunction (copy), UserInputService (copy), AvatarScreen (copy), LogOnOverlayClosedFunction (copy), MakeAvatarBackButtonModule (copy)
	p1.numAssetsUponPageEntry = nil
	p1.verticalClothingListRef = RoactModule.createRef()
	p1.topBarRef = RoactModule.createRef()
	p1.refinementNavBarRef = RoactModule.createRef()
	p1.focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.createFocusController()
	p1:setState({
		isDragging = false,
		lastInputIsGamepad = not IsVRAppBuildFunction() and IsGamepadInputFunction(UserInputService:GetLastInputType())
	})
	p1.props.setWrapperIsGamepad(not IsVRAppBuildFunction() and IsGamepadInputFunction(UserInputService:GetLastInputType()))
	
	function p1.onBackFromTopBar()
		-- upvalues: p1 (copy), AvatarScreen (upval)
		p1.props.unlockCharacterUpdates()
		p1.props.navigation.pop()
		p1.props.sendAnalytics(p1.props.analytics.avatarRefineGoBack)
		p1.props.setEntryPage(AvatarScreen.None)
	end
	
	function p1.lastInputTypeChangedCallback(p2)
		-- upvalues: IsGamepadInputFunction (upval), p1 (copy)
		local IsGamepadInput = IsGamepadInputFunction(p2)
		
		if IsGamepadInput ~= p1.state.lastInputIsGamepad then
			p1:setState({ lastInputIsGamepad = IsGamepadInput })
			p1.props.setWrapperIsGamepad(IsGamepadInput)
		end
	end
	
	function p1.onOverlayClosed()
		-- upvalues: p1 (copy), AvatarScreen (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval)
		return function()
			-- upvalues: p1 (upval), AvatarScreen (upval), LogOnOverlayClosedFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval)
			if p1.state.lastInputIsGamepad and p1.props.avatarRoute.opaque.name == AvatarScreen.LayeredClothingSort then
				LogOnOverlayClosedFunction("LayeredClothingSort")
				
				if not FFlagAXMigrateAXToGlobalAutofocus then
					p1.focusController.captureFocus()
				end
			end
		end
	end
	
	function p1.onDragChange(IsDragging)
		-- upvalues: p1 (copy)
		p1:setState({ isDragging = IsDragging })
	end
	
	p1.backButton = MakeAvatarBackButtonModule(p1.onBackFromTopBar)
end

function LayeredClothingSortPage.saveSortOnPageEnter(p1)
	local List = {}
	
	for _, value in p1.props.equippedLCAssetIdsOrdered do
		if p1.props.equippedAssets[value.typeId] and p1.props.equippedAssets[value.typeId][value.id] then
			value.equipped = true
		end
		table.insert(List, value)
	end
	p1.props.setLastSavedSort(List)
	p1.props.setCurrentSort(p1.props.equippedLCAssetIdsOrdered)
	p1.numAssetsUponPageEntry = #p1.props.equippedLCAssetIdsOrdered
end

function LayeredClothingSortPage.onPageEntry(p2)
	-- upvalues: FullView (copy), config1 (copy)
	p2:saveSortOnPageEnter()
	p2.props.setFullView(p2.props.avatarExperienceAnalytics, FullView.SceneFullView)
	
	if p2.props.hasClassicAccessories then
		p2.props.setCurrentToastMessage(config1)
	end
end

function LayeredClothingSortPage.renderTopBar(p2)
	-- upvalues: WithLocalizationFunction (copy), RoactModule (copy), TopBarModule (copy)
	return WithLocalizationFunction({ clothingSorting = "Feature.Avatar.Title.LCSortPage" })(function(p3)
		-- upvalues: RoactModule (upval), TopBarModule (upval), p2 (copy)
		return RoactModule.createElement(TopBarModule.Container, {
			titleText = p3.clothingSorting,
			transparentBackground = true,
			hideSiteMessageBanner = p2.props.isPortrait,
			leftItem = p2.backButton,
			ZIndex = 1,
			[RoactModule.Ref] = p2.topBarRef,
			NextSelectionRight = p2.verticalClothingListRef,
			NextSelectionDown = p2.refinementNavBarRef
		})
	end)
end

function LayeredClothingSortPage.render(p2)
	-- upvalues: WithStyleFunction (copy), WithLocalizationFunction (copy)
	return WithStyleFunction(function(p3)
		-- upvalues: WithLocalizationFunction (upval), p2 (copy)
		return WithLocalizationFunction({ noItemText = "Feature.Avatar.Message.LCSortNoEquipped" })(function(p4)
			-- upvalues: p2 (upval), p3 (copy)
			return p2:renderWithProviders(p3, p4)
		end)
	end)
end

function LayeredClothingSortPage.renderWithProviders(p2, p3, p4)
	-- upvalues: RoactModule (copy), SceneInteractionFrameModule (copy), RoactGamepadModule (copy), VerticalClothingListModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ResetButtonModule (copy), IsVRAppBuildFunction (copy), VRAvatarRotateHandlerModule (copy), ConstantsModule (copy), _UDim (copy), ImageSetLabel (copy), IconsMenuAboutLarge (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), ReactModule (copy), RefinementControlBarModule (copy), RefinementNavBarModule (copy), GamepadFocusHandlerForPageModule (copy), ExternalEventConnection (copy), UserInputService (copy), BoundInputsUpdaterModule (copy), SceneGamepadHandlerModule (copy)
	local _Font = p3.Font
	local Theme = p3.Theme
	local v1 = #p2.props.equippedLCAssetIdsOrdered > 0
	local IsNumAssetsUponPageEntryMatch: boolean = not v1 and p2.numAssetsUponPageEntry == 0
	local VerticalClothingListRef = if v1 then p2.verticalClothingListRef else p2.topBarRef
	local Frame = RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 2,
		Size = UDim2.new(1, 0, 1, -p2.props.topBarHeight),
		Position = UDim2.fromOffset(0, p2.props.topBarHeight)
	}, {
		SceneInteractionFrame = RoactModule.createElement(SceneInteractionFrameModule),
		VerticalClothingList = not IsNumAssetsUponPageEntryMatch and RoactModule.createElement(RoactGamepadModule.Focusable[VerticalClothingListModule], {
			[RoactModule.Ref] = p2.verticalClothingListRef,
			NextSelectionLeft = p2.refinementNavBarRef,
			lastInputIsGamepad = p2.state.lastInputIsGamepad,
			topBarRef = p2.topBarRef,
			focusControllerProp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2.focusController,
			onDragChange = p2.onDragChange
		}),
		ResetButton = not IsNumAssetsUponPageEntryMatch and RoactModule.createElement(ResetButtonModule, {
			lastInputIsGamepad = p2.state.lastInputIsGamepad,
			isDragging = p2.state.isDragging
		}),
		VRAvatarRotateHandler = if IsVRAppBuildFunction() then RoactModule.createElement(VRAvatarRotateHandlerModule) else nil,
		NoItemsMessage = IsNumAssetsUponPageEntryMatch and RoactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, ConstantsModule.NoItem.BottomPadding),
			Size = if IsVRAppBuildFunction() then UDim2.new(1, 0, 0, 50) else UDim2.new(1, 0, 0, 100),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = if IsVRAppBuildFunction() then 0 else 1
		}, {
			UICorner = if IsVRAppBuildFunction() then RoactModule.createElement("UICorner", { CornerRadius = _UDim }) else nil,
			NoItemsTextLabel = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				AutomaticSize = Enum.AutomaticSize.XY,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Size = UDim2.fromScale(0, 0),
				Text = p4.noItemText,
				Font = _Font.CaptionHeader.Font,
				TextSize = p2.props.tokens.Typography.BodyMedium.FontSize,
				TextColor3 = Theme.IconEmphasis.Color,
				TextXAlignment = Enum.TextXAlignment.Left
			}, {
				NoItemsIcon = RoactModule.createElement(ImageSetLabel, {
					BackgroundTransparency = 1,
					Image = IconsMenuAboutLarge,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(0, -2, 0.5, 0),
					Size = UDim2.fromOffset(ConstantsModule.NoItem.IconSize, ConstantsModule.NoItem.IconSize),
					ImageColor3 = Theme.IconEmphasis.Color
				})
			})
		})
	})
	local config = {
		TopBar = p2:renderTopBar(p4),
		RefinementControlBar = if GetFFlagAXEnableSlotBasedEditorModule() then ReactModule.createElement(RefinementControlBarModule, {
			hideUndoRedo = true,
			ref = p2.refinementNavBarRef,
			NextSelectionUp = p2.topBarRef,
			NextSelectionRight = p2.verticalClothingListRef
		}) else nil,
		RefinementNavBar = if GetFFlagAXEnableSlotBasedEditorModule() then nil else RoactModule.createElement(RefinementNavBarModule, {
			defaultChildRef = p2.refinementNavBarRef,
			NextSelectionUp = p2.topBarRef,
			NextSelectionRight = p2.verticalClothingListRef
		}),
		LayeredClothingSortPageFrame = Frame,
		GamepadFocusHandlerForPage = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(GamepadFocusHandlerForPageModule, {
			captureFocusOnMount = true,
			focusController = p2.focusController
		}),
		LastInputTypeChangedConnection = RoactModule.createElement(ExternalEventConnection, {
			event = UserInputService.LastInputTypeChanged,
			callback = p2.lastInputTypeChangedCallback
		}),
		BoundInputsUpdater = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactModule.createElement(BoundInputsUpdaterModule)
	}
	
	return if IsVRAppBuildFunction() then Frame else RoactModule.createElement(RoactGamepadModule.Focusable.Frame, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2.focusController,
		[RoactModule.Ref] = p2.props.wrappedFrameRef,
		defaultChild = VerticalClothingListRef
	}, {
		SceneGamepadHandler = RoactModule.createElement(SceneGamepadHandlerModule, nil, config)
	})
end

function LayeredClothingSortPage.didMount(p2)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), AvatarScreen (copy)
	if not FFlagAXCustomizeMakeupSupport then
		p2:onPageEntry()
	elseif p2.props.avatarRoute.opaque.name == AvatarScreen.LayeredClothingSort then
		p2:onPageEntry()
		
		return
	end
end

function LayeredClothingSortPage.didUpdate(p2, p3, _)
	-- upvalues: AvatarScreen (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	if p2.props.avatarRoute.opaque.name ~= p3.avatarRoute.opaque.name and p2.props.avatarRoute.opaque.name == AvatarScreen.LayeredClothingSort then
		p2:onPageEntry()
	end
	if p2.props.avatarRoute.opaque.name == AvatarScreen.LayeredClothingSort and p2.props.avatarRoute.isVisible and not p3.avatarRoute.isVisible then
		p2:onPageEntry()
	end
	if not FFlagAXMigrateAXToGlobalAutofocus and p2.state.lastInputIsGamepad and #p2.props.equippedLCAssetIdsOrdered == 0 and #p3.equippedLCAssetIdsOrdered > 0 then
		p2.focusController.moveFocusTo(p2.topBarRef)
	end
end

function LayeredClothingSortPage.willUnmount(p2)
	p2.props.unlockCharacterUpdates()
end

local WithStackVisibilityWrapperModuleResult = WithStackVisibilityWrapperModule((WithAvatarRouteModule((WithMappedNavigationParamsModule((RoactRoduxModule.connect(function(p2, _)
	-- upvalues: SelectIsPortraitModule (copy), IsVRAppBuildFunction (copy), SelectEquippedLCAccessoriesOrderedModule (copy), HasClassicAccessoriesModule (copy)
	return {
		isPortrait = SelectIsPortraitModule(p2),
		topBarHeight = if IsVRAppBuildFunction() then 0 else p2.TopBar.topBarHeight,
		equippedLCAssetIdsOrdered = SelectEquippedLCAccessoriesOrderedModule(p2),
		equippedAssets = p2.AvatarExperience.AvatarEditor.Character.EquippedAssets,
		hasClassicAccessories = HasClassicAccessoriesModule(p2),
		removedList = p2.AvatarExperience.LayeredClothingSort.CurrentSort.RemovedList,
		isLocalUserSoothSayer = p2.IsLocalUserSoothsayer
	}
end, function(Callback)
	-- upvalues: SetLastSavedSortModule (copy), SetCurrentSortModule (copy), SetCurrentToastMessageModule (copy), SetFullViewModule (copy), AvatarScreen (copy), SendRefinementAnalyticsModule (copy), SetEntryPageModule (copy), ClearRemovedItemsModule (copy), UnlockCharacterUpdatesModule (copy)
	return {
		setLastSavedSort = function(p2)
			-- upvalues: Callback (copy), SetLastSavedSortModule (upval)
			Callback(SetLastSavedSortModule(p2))
		end,
		setCurrentSort = function(p2)
			-- upvalues: Callback (copy), SetCurrentSortModule (upval)
			Callback(SetCurrentSortModule(p2))
		end,
		setCurrentToastMessage = function(p2)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule(p2))
		end,
		setFullView = function(p2, p3)
			-- upvalues: Callback (copy), SetFullViewModule (upval), AvatarScreen (upval)
			Callback(SetFullViewModule(p2, AvatarScreen.LayeredClothingSort, p3))
		end,
		sendAnalytics = function(p2)
			-- upvalues: Callback (copy), SendRefinementAnalyticsModule (upval)
			Callback(SendRefinementAnalyticsModule(p2))
		end,
		setEntryPage = function(p2)
			-- upvalues: Callback (copy), SetEntryPageModule (upval)
			Callback(SetEntryPageModule(p2))
		end,
		clearRemovedItems = function()
			-- upvalues: Callback (copy), ClearRemovedItemsModule (upval)
			Callback(ClearRemovedItemsModule())
		end,
		unlockCharacterUpdates = function()
			-- upvalues: Callback (copy), UnlockCharacterUpdatesModule (upval)
			Callback(UnlockCharacterUpdatesModule())
		end
	}
end)((RoactServices.connect({
	analytics = AnalyticsModule1,
	avatarExperienceAnalytics = AnalyticsModule
})(LayeredClothingSortPage)))))))))

return function(p2)
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy), SelectEquippedLCAccessoriesOrderedModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule1 (copy), UseAvatarRouteFunction (copy), UseTokensFunction (copy), UnlockCharacterUpdatesModule (copy), FFlagAXCustomizeMakeupSupport (copy), SendRefinementAnalyticsModule (copy), SetEntryPageModule (copy), AvatarScreen (copy), LogOnOverlayClosedFunction (copy), useFocusNavigationBindings (copy), UseTableWrappedCallbackRefFunction (copy), CryoModule (copy), WithStackVisibilityWrapperModuleResult (ref)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSelectorResult = UseSelectorFunction(SelectEquippedLCAccessoriesOrderedModule)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule1)
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), UseAvatarRouteResult (copy), AvatarScreen (upval), LogOnOverlayClosedFunction (upval), p2 (copy)
		p2.navigation.navigate(AvatarScreen.ResetLayeredItemsSortPrompt, {
			onOverlayClosed = function()
				-- upvalues: UseStateResult (upval), UseAvatarRouteResult (upval), AvatarScreen (upval), LogOnOverlayClosedFunction (upval)
				if UseStateResult and UseAvatarRouteResult.opaque.name == AvatarScreen.LayeredClothingSort then
					LogOnOverlayClosedFunction("LayeredClothingSort")
				end
			end
		})
	end, { p2.navigation, UseStateResult, UseAvatarRouteResult })
	
	return ReactModule.createElement(WithStackVisibilityWrapperModuleResult, (CryoModule.Dictionary.join(p2, {
		wrappedFrameRef = UseTableWrappedCallbackRefFunction((useFocusNavigationBindings(UseRefResult, ReactModule.useCallback(function()
			-- upvalues: UseDispatchResult (copy), UnlockCharacterUpdatesModule (upval), FFlagAXCustomizeMakeupSupport (upval), p2 (copy), SendRefinementAnalyticsModule (upval), UseRoactServiceModuleResult (copy), SetEntryPageModule (upval), AvatarScreen (upval)
			UseDispatchResult(UnlockCharacterUpdatesModule())
			
			if FFlagAXCustomizeMakeupSupport then
				p2.navigation.popToTop()
			else
				p2.navigation.pop()
			end
			UseDispatchResult(SendRefinementAnalyticsModule(UseRoactServiceModuleResult.avatarRefineGoBack))
			UseDispatchResult(SetEntryPageModule(AvatarScreen.None))
		end, {
			UseDispatchResult,
			p2.navigation,
			UseRoactServiceModuleResult
		}), if #UseSelectorResult > 0 then UseResult else nil))),
		setWrapperIsGamepad = UseStateResult2,
		tokens = UseTokensFunction()
	})))
end