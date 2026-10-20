local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local UseFocusGuiObjectFunction = ReactFocusNavigationModule.useFocusGuiObject
local InputHandlersModule = require(CorePackages.Packages.InputHandlers)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum
local UseTableWrappedCallbackRefFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local FFlagAXGeneralizeInventoryItemsList = AvatarExperienceFlagsModule.FFlagAXGeneralizeInventoryItemsList
local FFlagAXAddInventoryItemsListProps = AvatarExperienceFlagsModule.FFlagAXAddInventoryItemsListProps
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local BodyColorsFrameModule = require(Modules.AvatarExperience.AvatarEditor.Components.BodyColorsFrame)
local AvatarSwitcherFrameModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarSwitcherFrame)
local MakeupOutfitSwitcherFrameModule = require(Modules.AvatarExperience.OutfitSwitcher.MakeupOutfitSwitcherFrame.MakeupOutfitSwitcherFrame)
local UseAvatarSwitcherFramePropsModule = require(Modules.AvatarExperience.AvatarEditor.Components.useAvatarSwitcherFrameProps)
local AvatarSwitcherFrameContainerModule = require(Modules.AvatarExperience.AvatarEditor.Components.AvatarSwitcherFrameContainer)
local AvatarOutfitSwitcherFrameModule = require(Modules.AvatarExperience.OutfitSwitcher.AvatarOutfitSwitcherFrame.AvatarOutfitSwitcherFrame)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local AXRefactorEmotesPageToFunctional2 = GetFFlagAXEnableSlotBasedEditorModule() and game:DefineFastFlag("AXRefactorEmotesPageToFunctional2", false)
local EmotesPageModule = if AXRefactorEmotesPageToFunctional2 then require(Modules.AvatarExperience.AvatarEditor.Components.EmotesPage) else require(Modules.AvatarExperience.AvatarEditor.Components.EmotesPage_DEPRECATED)
local ItemsListModule = require(Modules.AvatarExperience.AvatarEditor.Components.ItemsList)
local InventoryItemsListContainerModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.InventoryItemsListContainer)
local AXRefactorScalesPageToFunctional2 = GetFFlagAXEnableSlotBasedEditorModule() and game:DefineFastFlag("AXRefactorScalesPageToFunctional2", false)
local ScalesPageModule = if AXRefactorScalesPageToFunctional2 then require(Modules.AvatarExperience.AvatarEditor.Components.ScalesPage) else require(Modules.AvatarExperience.AvatarEditor.Components.ScalesPage_DEPRECATED)
local GetFFlagAXEnableNewInventoryItemsListModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList)
local FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad
local FFlagAXItemsViewContentSizeBinding = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemsViewContentSizeBinding
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXInventoryDurablesSupport = AvatarExperienceFlagsModule.FFlagAXInventoryDurablesSupport
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport
local FFlagLuaAppsDefaultSelection = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppsDefaultSelection
local CategoryContent = RoactModule.PureComponent:extend("CategoryContent")
local config = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack
}

local function useFocusNavigationBindings(FrameRef, Callback)
	-- upvalues: ReactFocusNavigationModule (copy), config (copy), ReactModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy)
	return ReactFocusNavigationModule.useEventHandlerMap(ReactModule.useMemo(function()
		-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
		return {
			[FocusNavigationEventNameEnum.NavigateBack] = {
				handler = InputHandlersModule.onRelease(function(_)
					-- upvalues: Callback (upval)
					Callback()
				end)
			}
		}
	end, { Callback }), (ReactFocusNavigationModule.useEventMap(config, FrameRef)))
end

function CategoryContent.init(p1)
	-- upvalues: RoactModule (copy)
	p1.isMounted = false
	p1.connections = {}
	p1.isTouched = false
	p1.ref = RoactModule.createRef()
	p1.state = { enableNavigation = true }
	
	function p1.lockNavigationCallback()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ enableNavigation = false })
			
			return
		end
	end
	
	function p1.unlockNavigationCallback()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ enableNavigation = true })
			
			return
		end
	end
end

function CategoryContent.renderWithProviders(p1, p2, p3)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), EmotesPageModule (copy), ScalesPageModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), BodyColorsFrameModule (copy), FFlagAXItemsViewContentSizeBinding (copy), FFlagAXCustomizeMakeupSupport (copy), AvatarOutfitSwitcherFrameModule (copy), FFlagAXInventoryDurablesSupport (copy), AvatarSwitcherFrameContainerModule (copy), AvatarSwitcherFrameModule (copy), MakeupOutfitSwitcherFrameModule (copy), GetFFlagAXEnableNewInventoryItemsListModule (copy), FFlagAXGeneralizeInventoryItemsList (copy), FFlagAXAddInventoryItemsListProps (copy), FoundationModule (copy), InventoryItemsListContainerModule (copy), ItemsListModule (copy), FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), RoactGamepadModule (copy)
	local Theme = p2.Theme
	local CategoryInfo = p1.props.categoryInfo
	local SubcategoryFilter = p1.props.subcategoryFilter
	local Size = p1.props.size or UDim2.new(1, 0, 1, -ConstantsModule.PeekHeaderHeight)
	
	return RoactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		Active = true,
		Size = if FFlagAXItemsViewContentSizeBinding then p1.props.Size else Size,
		BorderSizePixel = 0,
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		BackgroundTransparency = Theme.BackgroundDefault.Transparency,
		LayoutOrder = p1.props.LayoutOrder,
		inputBindings = if FFlagAXMigrateAXToGlobalAutofocus or FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then nil else {
			NavUp = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonB, function()
				-- upvalues: p1 (copy), p3 (copy)
				if p1.props.NextSelectionUp then
					p3.moveFocusTo(p1.props.NextSelectionUp)
				end
			end)
		},
		[RoactModule.Ref] = (if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then p1.props.focusNavigationRef else p1.props.frameRef) or p1.ref
	}, {
		PageContent = if CategoryInfo.PageType == ConstantsModule.PageType.Emotes then RoactModule.createElement(EmotesPageModule, {
			enableNavigation = p1.state.enableNavigation,
			lockNavigationCallback = p1.lockNavigationCallback,
			unlockNavigationCallback = p1.unlockNavigationCallback,
			categoryInfo = CategoryInfo,
			NextSelectionUp = p1.props.NextSelectionUp,
			restorePreviousChildFocus = p1.props.restorePreviousChildFocus
		}) elseif CategoryInfo.PageType == ConstantsModule.PageType.BodyStyle then RoactModule.createElement(ScalesPageModule, {
			enableNavigation = p1.state.enableNavigation,
			lockNavigationCallback = p1.lockNavigationCallback,
			unlockNavigationCallback = p1.unlockNavigationCallback,
			NextSelectionUp = p1.props.NextSelectionUp,
			onCanvasPositionChanged = if GetFFlagAXEnableSlotBasedEditorModule() then p1.props.onContentScroll else nil
		}) elseif CategoryInfo.PageType == ConstantsModule.PageType.BodyColors then RoactModule.createElement(BodyColorsFrameModule, {
			Size = if FFlagAXItemsViewContentSizeBinding then UDim2.new(1, 0, 1, -ConstantsModule.PeekHeaderHeight) else Size,
			onContentScroll = if GetFFlagAXEnableSlotBasedEditorModule() then p1.props.onContentScroll else nil,
			NextSelectionUp = p1.props.NextSelectionUp
		}) elseif GetFFlagAXEnableSlotBasedEditorModule() and CategoryInfo.PageType == ConstantsModule.PageType.Avatars then RoactModule.createElement(if FFlagAXCustomizeMakeupSupport then AvatarOutfitSwitcherFrameModule elseif FFlagAXInventoryDurablesSupport then AvatarSwitcherFrameContainerModule else AvatarSwitcherFrameModule, p1.props.avatarSwitcherProps) elseif FFlagAXCustomizeMakeupSupport and CategoryInfo.PageType == ConstantsModule.PageType.MakeupLooks then RoactModule.createElement(MakeupOutfitSwitcherFrameModule) elseif CategoryInfo.RenderItemTiles then if GetFFlagAXEnableNewInventoryItemsListModule() then if FFlagAXGeneralizeInventoryItemsList then if FFlagAXAddInventoryItemsListProps then RoactModule.createElement(FoundationModule.View, { tag = "size-full bg-surface-0 padding-x-medium" }, {
			RoactModule.createElement(InventoryItemsListContainerModule, {
				showRecommendedItems = true,
				categoryInfo = CategoryInfo,
				subcategoryFilter = SubcategoryFilter,
				onContentScroll = if GetFFlagAXEnableSlotBasedEditorModule() then p1.props.onContentScroll else nil
			})
		}) else RoactModule.createElement(FoundationModule.View, { tag = "size-full bg-surface-0 padding-x-medium" }, {
			InventoryItemsListContainer = RoactModule.createElement(InventoryItemsListContainerModule)
		}) elseif FFlagAXAddInventoryItemsListProps then RoactModule.createElement(InventoryItemsListContainerModule, {
			showRecommendedItems = true,
			categoryInfo = CategoryInfo,
			subcategoryFilter = SubcategoryFilter,
			onContentScroll = if GetFFlagAXEnableSlotBasedEditorModule() then p1.props.onContentScroll else nil
		}) else RoactModule.createElement(InventoryItemsListContainerModule) else RoactModule.createElement(ItemsListModule, {
			backToTopSignal = p1.props.backToTopSignal,
			NextSelectionUp = p1.props.NextSelectionUp,
			tagBasedImpressionsDetectorExtensions = {}
		}) else nil
	})
end

function CategoryContent.render(p1)
	-- upvalues: WithStyleFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (upval), p1 (copy), RoactGamepadModule (upval)
		return if FFlagAXMigrateAXToGlobalAutofocus then p1:renderWithProviders(p2) else RoactGamepadModule.withFocusController(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function CategoryContent.didMount(p1)
	p1.isMounted = true
end

function CategoryContent.willUnmount(p1)
	p1.isMounted = false
	p1:disconnectListeners()
end

function CategoryContent.disconnectListeners(p1)
	for _, connection in p1.connections do
		connection:disconnect()
	end
	p1.connections = {}
	p1.isTouched = false
end

function CategoryContent.didUpdate(p2, p3, _)
	-- upvalues: AvatarScreen (copy), UserInputService (copy)
	local Name = p2.props.avatarRoute.current.name
	local Name1 = p3.avatarRoute.current.name
	
	if Name == AvatarScreen.AvatarEditor and Name ~= Name1 then
		local TouchSwipeConnection = UserInputService.TouchSwipe:Connect(function(...)
			-- upvalues: p2 (copy)
			p2:onTouchSwipe(...)
		end)
		p2.connections[#p2.connections + 1] = UserInputService.TouchMoved:Connect(function(...)
			-- upvalues: p2 (copy)
			p2:onTouchMoved(...)
		end)
		p2.connections[#p2.connections + 1] = TouchSwipeConnection
		
		return
	elseif Name1 == AvatarScreen.AvatarEditor and Name ~= AvatarScreen.AvatarEditor and Name ~= Name1 then
		p2:disconnectListeners()
	end
end

function CategoryContent.onTouchMoved(p2, p3, _)
	-- upvalues: FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad (copy)
	p2.isTouched = false
	local FocusNavigationRef = if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then p2.props.focusNavigationRef else p2.props.frameRef
	local Current = FocusNavigationRef and FocusNavigationRef.current or p2.ref.current
	
	if not Current or not p2.state.enableNavigation then return end
	local AbsolutePosition = Current.AbsolutePosition
	local AbsoluteSize = Current.AbsoluteSize
	local _Vector2 = Vector2.new(AbsolutePosition.X + AbsoluteSize.X, AbsolutePosition.Y + AbsoluteSize.Y)
	
	if Current.AbsolutePosition.X < p3.Position.X and Current.AbsolutePosition.Y < p3.Position.Y and p3.Position.X < _Vector2.X and p3.Position.Y < _Vector2.Y then
		p2.isTouched = true
	end
end

function CategoryContent.onTouchSwipe(p2, SwipeDirection, p3, _)
	if p3 ~= 1 then return end
	if not p2.isTouched or not p2.state.enableNavigation then return end
	if SwipeDirection == Enum.SwipeDirection.Right then
		if p2.props.navigateLeft then
			p2.props.navigateLeft()
			
			return
		end
	elseif SwipeDirection == Enum.SwipeDirection.Left and p2.props.navigateRight then
		p2.props.navigateRight()
	end
end

local WithAvatarRouteModuleResult = WithAvatarRouteModule((RoactRoduxModule.connect(function(p2, _)
	-- upvalues: UtilsModule (copy), FFlagAXGeneralizeInventoryItemsList (copy)
	return {
		categoryInfo = UtilsModule.getAvatarEditorCategoryInfoFromState(p2),
		subcategoryFilter = if FFlagAXGeneralizeInventoryItemsList then UtilsModule.getAvatarEditorSubcategoryFilterFromState(p2) else nil,
		deviceOrientation = p2.DeviceOrientation,
		screenSize = p2.ScreenSize
	}
end, nil)((RoactServices.connect({ avatarExperienceAnalytics = AnalyticsModule })(CategoryContent)))))

return if FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad then function(p2)
	-- upvalues: FFlagAXMigrateAXToGlobalAutofocus (copy), RoactGamepadModule (copy), UseFocusGuiObjectFunction (copy), ReactModule (copy), FFlagAXInventoryDurablesSupport (copy), FFlagAXCustomizeMakeupSupport (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UseAvatarSwitcherFramePropsModule (copy), useFocusNavigationBindings (copy), FFlagLuaAppsDefaultSelection (copy), UseTableWrappedCallbackRefFunction (copy), WithAvatarRouteModuleResult (ref), CryoModule (copy)
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
	local UseFocusGuiObjectResult = if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectFunction() else nil
	local UseAvatarSwitcherFramePropsModuleResult = if FFlagAXInventoryDurablesSupport or FFlagAXCustomizeMakeupSupport or not GetFFlagAXEnableSlotBasedEditorModule() then nil else UseAvatarSwitcherFramePropsModule()
	local UseFocusNavigationBindingsResult = useFocusNavigationBindings(p2.frameRef, (ReactModule.useCallback(function()
		-- upvalues: p2 (copy), FFlagAXMigrateAXToGlobalAutofocus (upval), UseFocusGuiObjectResult (copy), UseFocusControllerResult (copy)
		if p2.NextSelectionUp then
			if not FFlagAXMigrateAXToGlobalAutofocus then
				UseFocusControllerResult.moveFocusTo(p2.NextSelectionUp)
			elseif UseFocusGuiObjectResult and p2.NextSelectionUp.current then
				UseFocusGuiObjectResult(p2.NextSelectionUp.current)
				
				return
			end
		end
	end, {
		p2.NextSelectionUp,
		p2.buttonBInputRef,
		if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectResult else UseFocusControllerResult
	})))
	local UseResult = if FFlagLuaAppsDefaultSelection then ReactModule.useCallback(function(Current)
		-- upvalues: UseFocusNavigationBindingsResult (copy), p2 (copy)
		if type(UseFocusNavigationBindingsResult) == "function" then
			UseFocusNavigationBindingsResult(Current)
		elseif type(UseFocusNavigationBindingsResult) == "table" then
			UseFocusNavigationBindingsResult.current = Current
		end
		if p2.defaultFocusRef then
			p2.defaultFocusRef(Current)
		end
	end, { p2.defaultFocusRef, UseFocusNavigationBindingsResult }) else nil
	
	return ReactModule.createElement(WithAvatarRouteModuleResult, CryoModule.Dictionary.join(p2, {
		avatarSwitcherProps = if FFlagAXInventoryDurablesSupport or FFlagAXCustomizeMakeupSupport then nil else UseAvatarSwitcherFramePropsModuleResult,
		focusNavigationRef = UseTableWrappedCallbackRefFunction(if FFlagLuaAppsDefaultSelection then UseResult else UseFocusNavigationBindingsResult)
	}))
end elseif GetFFlagAXEnableSlotBasedEditorModule() then function(p2)
	-- upvalues: FFlagAXInventoryDurablesSupport (copy), FFlagAXCustomizeMakeupSupport (copy), ReactModule (copy), WithAvatarRouteModuleResult (ref), UseAvatarSwitcherFramePropsModule (copy), CryoModule (copy)
	return if FFlagAXInventoryDurablesSupport or FFlagAXCustomizeMakeupSupport then ReactModule.createElement(WithAvatarRouteModuleResult, p2) else ReactModule.createElement(WithAvatarRouteModuleResult, CryoModule.Dictionary.join(p2, {
		avatarSwitcherProps = UseAvatarSwitcherFramePropsModule()
	}))
end else WithAvatarRouteModuleResult