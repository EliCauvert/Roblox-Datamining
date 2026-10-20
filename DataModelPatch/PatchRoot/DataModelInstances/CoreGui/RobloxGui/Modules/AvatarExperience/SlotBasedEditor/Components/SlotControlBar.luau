local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ReactModule = require(CorePackages.Packages.React)
local FoundationModule = require(CorePackages.Packages.Foundation)
local AvatarExperienceControlBarModule = require(CorePackages.Workspace.Packages.AvatarExperienceControlBar)
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AXEnableAccessoryAdjustmentDuringTryOnIXP = require(CorePackages.Workspace.Packages.AvatarExperienceExperiments).AXEnableAccessoryAdjustmentDuringTryOnIXP
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local ContextualActionButton = AvatarExperienceCommonModule.Components.ContextualActionButton
local ColorGradientCircle = AvatarExperienceCommonModule.Components.ColorGradientCircle
local SelectShowColorQuickButton = if AvatarExperienceFlagsModule.FFlagAXColorAdjustmentButtonShouldAccountForTryOns then AvatarExperienceCommonModule.State.Selectors.selectShowColorQuickButton else require(Modules.AvatarExperience.Common.Selectors.selectShowColorQuickButton)
local SelectColorAdjustmentButtonColor = AvatarExperienceCommonModule.State.Selectors.selectColorAdjustmentButtonColor
local SetCategoryAndSubcategoryModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SetCategoryAndSubcategory)
local SetSelectedAccessoryModule = require(Modules.AvatarExperience.AccessoryAdjustment.Actions.SetSelectedAccessory)
local SetEntryPageModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetEntryPage)
local GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule = require(Modules.AvatarExperience.Flags.GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPage)
local GetAvatarEditorCategoriesModule = require(Modules.AvatarExperience.AvatarEditor.GetAvatarEditorCategories)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local AvatarEditorCategories = AvatarExperienceSlotBasedEditorModule.Enums.AvatarEditorCategories
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local UseNavigationFocusFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigationFocus
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local UseSlotBasedEditorContextFunction = AvatarExperienceSlotBasedEditorModule.Context.useSlotBasedEditorContext
local UseAccessoryAdjustmentQuickButtonDuringTryOnModule = require(Modules.AvatarExperience.Common.Hooks.useAccessoryAdjustmentQuickButtonDuringTryOn)
local FFlagAXFixCatalogSearchRedirectModule = require(Modules.AvatarExperience.Flags.FFlagAXFixCatalogSearchRedirect)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local ContextualActionsModule = require(Modules.AvatarExperience.SlotBasedEditor.Components.ContextualActions.ContextualActions)
local ItemView = AvatarExperienceSlotBasedEditorModule.Enums.ItemView
local NavigationParams = AvatarExperienceSlotBasedEditorModule.Enums.NavigationParams
local CustomizeControlBar = AvatarExperienceControlBarModule.CustomizeControlBar
local UndoRedoBar = AvatarExperienceControlBarModule.UndoRedoBar
local FFlagAXResetAvatarButton = AvatarExperienceFlagsModule.FFlagAXResetAvatarButton
local FFlagAXMoveContextualActionButtons = AvatarExperienceFlagsModule.FFlagAXMoveContextualActionButtons
local FFlagAXFixContextualActionVisibility = AvatarExperienceFlagsModule.FFlagAXFixContextualActionVisibility
local FFlagAXMigrateSlotsSignals = AvatarExperienceFlagsModule.FFlagAXMigrateSlotsSignals
local AvatarHeadShot = UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot

local function selectUserId(p1)
	return p1.LocalUserId
end

return ReactModule.memo(ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseTokensFunction (copy), UseNavigationFocusFunction (copy), UseAvatarRouteFunction (copy), UseNavigationFunction (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), UseSlotBasedEditorContextFunction (copy), FFlagAXMigrateSlotsSignals (copy), FFlagAXMoveContextualActionButtons (copy), UseSelectorFunction (copy), SelectIsPortraitModule (copy), SelectColorAdjustmentButtonColor (copy), SelectShowColorQuickButton (copy), AXEnableAccessoryAdjustmentDuringTryOnIXP (copy), UseAccessoryAdjustmentQuickButtonDuringTryOnModule (copy), selectUserId (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), ReactModule (copy), UtilsModule (copy), GetAvatarEditorCategoriesModule (copy), AvatarEditorCategories (copy), SetCategoryAndSubcategoryModule (copy), FFlagAXFixCatalogSearchRedirectModule (copy), AvatarScreen (copy), NavigationParams (copy), ItemView (copy), CustomizeControlBar (copy), FFlagAXResetAvatarButton (copy), UndoRedoBar (copy), FFlagAXFixContextualActionVisibility (copy), ContextualActionsModule (copy), ContextualActionButton (copy), ColorGradientCircle (copy), GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule (copy), SetEntryPageModule (copy), SetSelectedAccessoryModule (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseSlotBasedEditorContextResult = UseSlotBasedEditorContextFunction()
	local SetSlotCategory = if UseSlotBasedEditorContextResult then if FFlagAXMigrateSlotsSignals then UseSlotBasedEditorContextResult.signalStore.setSlotCategory else UseSlotBasedEditorContextResult.setSlotCategory else nil
	local UseSelectorResult = if FFlagAXMoveContextualActionButtons then UseSelectorFunction(SelectIsPortraitModule) else nil
	local UseSelectorResult1 = if FFlagAXMoveContextualActionButtons then nil else UseSelectorFunction(SelectColorAdjustmentButtonColor)
	local UseSelectorResult2 = if FFlagAXMoveContextualActionButtons then nil else UseSelectorFunction(SelectShowColorQuickButton)
	local ShouldEnableAccessoryAdjustmentDuringTryOn = nil
	local AdjustableLastTryOnItemId = nil
	local AccessoryAdjustmentQuickButtonFtux = nil
	
	if not FFlagAXMoveContextualActionButtons and AXEnableAccessoryAdjustmentDuringTryOnIXP.isEnabled() then
		local UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult = UseAccessoryAdjustmentQuickButtonDuringTryOnModule()
		ShouldEnableAccessoryAdjustmentDuringTryOn = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.shouldEnableAccessoryAdjustmentDuringTryOn
		AdjustableLastTryOnItemId = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.adjustableLastTryOnItemId
		AccessoryAdjustmentQuickButtonFtux = UseAccessoryAdjustmentQuickButtonDuringTryOnModuleResult.accessoryAdjustmentQuickButtonFtux
	end
	local RbxthumbWithTypeSizeAndOptions = GetRbxthumbWithTypeSizeAndOptionsFunction(UseSelectorFunction(selectUserId), AvatarHeadShot, 150)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), UtilsModule (upval), UseAvatarRouteResult (copy), UseNavigationFocusResult (copy), UseNavigationResult (copy)
		return Frame.showControlBar and UtilsModule.isAvatarSceneButtonsVisible(UseAvatarRouteResult, UseNavigationFocusResult, Frame.isUIFullView, Frame.isSceneFullView, UseNavigationResult)
	end, {
		UseAvatarRouteResult, UseNavigationFocusResult, Frame.isUIFullView,
		Frame.isSceneFullView, UseNavigationResult, Frame.showControlBar
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: GetAvatarEditorCategoriesModule (upval), AvatarEditorCategories (upval), SetSlotCategory (copy), UseDispatchResult (copy), SetCategoryAndSubcategoryModule (upval), UseRoactServiceModuleResult (copy), UseSlotBasedEditorContextResult (copy), UseAvatarRouteResult (copy), FFlagAXFixCatalogSearchRedirectModule (upval), UseNavigationResult (copy), AvatarScreen (upval), NavigationParams (upval), ItemView (upval)
		for _, value in GetAvatarEditorCategoriesModule() do
			if value.NavigationKey == AvatarEditorCategories.All then
				if SetSlotCategory then
					SetSlotCategory(value.NavigationKey)
				end
				UseDispatchResult(SetCategoryAndSubcategoryModule(value.Category, nil, UseRoactServiceModuleResult))
				break
			end
		end
		local Params = if FFlagAXFixCatalogSearchRedirectModule then UseNavigationResult.state and UseNavigationResult.state.params else nil
		local IsNameMatch = UseAvatarRouteResult.current.name == AvatarScreen.LookDetails
		local IsNameMatch1 = UseAvatarRouteResult.opaque.name == AvatarScreen.AvatarEditor
		UseNavigationResult.navigate(AvatarScreen.AvatarEditor, {
			[NavigationParams.itemView] = ItemView.AllItems,
			[NavigationParams.fromScreen] = if UseSlotBasedEditorContextResult then nil else UseAvatarRouteResult.opaque.name,
			[NavigationParams.params] = if FFlagAXFixCatalogSearchRedirectModule then Params or {} else nil
		})
		
		if IsNameMatch1 and IsNameMatch then
			UseNavigationResult.navigate(AvatarScreen.LookDetails)
		end
	end, {
		UseDispatchResult,
		UseRoactServiceModuleResult,
		UseSlotBasedEditorContextResult,
		UseNavigationResult,
		UseAvatarRouteResult
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.XY,
		ref = Ref,
		NextSelectionLeft = Frame.NextSelectionLeft,
		LayoutOrder = Frame.LayoutOrder
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, UseTokensResult.Gap.Small)
		}),
		ControlBar = if UseMemoResult then ReactModule.createElement(CustomizeControlBar, {
			LayoutOrder = 1,
			onActiveMenuItemChanged = Frame.onActiveMenuItemChanged,
			onInventoryActivated = UseResult,
			thumbnailUrl = RbxthumbWithTypeSizeAndOptions,
			showUndoRedo = if FFlagAXResetAvatarButton then Frame.showUndoRedo else nil
		}) else nil,
		UndoRedoBar = if Frame.showUndoRedo and not FFlagAXResetAvatarButton then ReactModule.createElement(UndoRedoBar, { direction = "vertical", LayoutOrder = 2 }) else nil,
		ContextualActions = if FFlagAXMoveContextualActionButtons and (not FFlagAXFixContextualActionVisibility or UseMemoResult) then if UseSelectorResult then nil else ReactModule.createElement(ContextualActionsModule, { LayoutOrder = 3 }) else nil,
		SkinColorButton = if FFlagAXMoveContextualActionButtons or not UseSelectorResult2 or not UseSelectorResult1 then nil else ReactModule.createElement(ContextualActionButton, {
			LayoutOrder = 3,
			Selectable = true,
			size = UDim.new(0, UseTokensResult.Size.Size_1100),
			onActivated = function()
				-- upvalues: UseNavigationResult (copy), AvatarScreen (upval)
				UseNavigationResult.navigate(AvatarScreen.ColorAdjustment)
			end
		}, ReactModule.createElement(ColorGradientCircle, {
			Colors = { UseSelectorResult1 },
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_500, UseTokensResult.Size.Size_500),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})),
		AccessoryAdjustmentButton = if FFlagAXMoveContextualActionButtons or not ShouldEnableAccessoryAdjustmentDuringTryOn or UseAvatarRouteResult.opaque.name ~= AvatarScreen.Catalog or not AdjustableLastTryOnItemId then nil else ReactModule.createElement(ContextualActionButton, {
			LayoutOrder = 4,
			Selectable = true,
			GroupTransparencyOverwrite = 0,
			size = UDim.new(0, UseTokensResult.Size.Size_1100),
			onActivated = function()
				-- upvalues: AccessoryAdjustmentQuickButtonFtux (ref), GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule (upval), UseDispatchResult (copy), SetEntryPageModule (upval), UseAvatarRouteResult (copy), UseNavigationResult (copy), AvatarScreen (upval), SetSelectedAccessoryModule (upval), AdjustableLastTryOnItemId (ref)
				if AccessoryAdjustmentQuickButtonFtux and AccessoryAdjustmentQuickButtonFtux.shouldShowFirstTimeGlow() then
					AccessoryAdjustmentQuickButtonFtux.completeFirstTimeGlow()
				end
				if GetFFlagAXFixAccessoryAdjustmentAnalyticsEntryPageModule() then
					UseDispatchResult(SetEntryPageModule(UseAvatarRouteResult.opaque.name))
				end
				UseNavigationResult.navigate(AvatarScreen.AdjustAccessoryView, { fromRoute = UseAvatarRouteResult.opaque.name })
				UseDispatchResult(SetSelectedAccessoryModule(AdjustableLastTryOnItemId))
			end,
			enableFocusAnimation = AccessoryAdjustmentQuickButtonFtux and AccessoryAdjustmentQuickButtonFtux.shouldShowFirstTimeGlow()
		}, {
			Icon = ReactModule.createElement(FoundationModule.View, {
				Visible = true,
				tag = "radius-circle position-center-center anchor-center-center clip",
				Size = UDim2.fromScale(1, 1)
			}, {
				IconImage = ReactModule.createElement(FoundationModule.Image, {
					Image = "icons/menu/transform",
					tag = "position-center-center anchor-center-center radius-circle content-emphasis",
					Size = UDim2.fromOffset(UseTokensResult.Size.Size_800, UseTokensResult.Size.Size_800),
					imageStyle = {
						Color3 = UseTokensResult.Color.Content.Emphasis.Color3,
						Transparency = UseTokensResult.Color.Content.Emphasis.Transparency
					}
				})
			})
		})
	})
end))