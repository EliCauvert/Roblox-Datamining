local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local AvatarExperienceSlotBasedEditorModule = require(CorePackages.Workspace.Packages.AvatarExperienceSlotBasedEditor)
local UseSlotBasedEditorContextFunction = AvatarExperienceSlotBasedEditorModule.Context.useSlotBasedEditorContext
local UseAvatarEditorStoresFunction = AvatarExperienceSlotBasedEditorModule.Context.useAvatarEditorStores
local UseSignalStateFunction = require(CorePackages.Packages.SignalsReact).useSignalState
local SignalsModule = require(CorePackages.Packages.Signals)
local AvatarExperienceAnalyticsModule = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics)
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local Exit3DFullViewModule = require(Modules.AvatarExperience.Common.Thunks.Exit3DFullView)
local NumericalBadgeModule = require(Modules.LuaApp.Components.NumericalBadge)
local SelectFilterCountModule = require(Modules.AvatarExperience.Catalog.Selectors.selectFilterCount)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UnifiedLoggingSurface = AvatarExperienceNavigationModule.Enums.UnifiedLoggingSurface
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local UseCloseFiltersSignalModule = require(Modules.AvatarExperience.Catalog.Hooks.useCloseFiltersSignal)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local GetFFlagAXEnableInventorySortsAndFiltersModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableInventorySortsAndFilters)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local AddUnifiedEventLoggingFunction = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local UnifiedEventLogConstants = AvatarExperienceAnalyticsModule.UnifiedEventLogConstants
local ExpiredFilterTooltipModule = require(Modules.AvatarExperience.Catalog.Components.Filters.ExpiredFilterTooltip)
local FFlagAXAvatarEditorStoresContext = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXAvatarEditorStoresContext
local FFlagAXShowExpiredItemsFilterTooltip = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXShowExpiredItemsFilterTooltip
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local AXUnifiedLoggingFilterOpen = game:DefineFastFlag("AXUnifiedLoggingFilterOpen", false)

return function(Gui)
	-- upvalues: UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseCloseFiltersSignalModule (copy), UseDispatchFunction (copy), UseRoactServiceModule (copy), AnalyticsModule (copy), AXUnifiedLoggingFilterOpen (copy), ReactModule (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (copy), UseSlotBasedEditorContextFunction (copy), FFlagAXShowExpiredItemsFilterTooltip (copy), AvatarScreen (copy), NavigationUtilsModule (copy), Exit3DFullViewModule (copy), UseSelectorFunction (copy), SelectFilterCountModule (copy), GetUseSelectorDeepEqualsFunction (copy), FFlagAXAvatarEditorStoresContext (copy), UseAvatarEditorStoresFunction (copy), UseSignalStateFunction (copy), SignalsModule (copy), UnifiedLoggingSurface (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), UnifiedEventLogConstants (copy), IconButton (copy), IconSize (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), Images (copy), NumericalBadgeModule (copy), ExpiredFilterTooltipModule (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseCloseFiltersSignalModuleResult = UseCloseFiltersSignalModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceModuleResult = UseRoactServiceModule(AnalyticsModule)
	local UseRefResult = if AXUnifiedLoggingFilterOpen then ReactModule.useRef(nil) else nil
	local ButtonRef = if AXUnifiedLoggingFilterOpen then Gui.buttonRef or UseRefResult else nil
	local UseSlotBasedEditorContextResult = if GetFFlagAXEnableInventorySortsAndFiltersModule() then UseSlotBasedEditorContextFunction() else nil
	local UseRefResult1 = if FFlagAXShowExpiredItemsFilterTooltip then ReactModule.useRef(nil) else nil
	
	local function toggleFilters()
		-- upvalues: UseAvatarRouteResult (copy), AvatarScreen (upval), UseCloseFiltersSignalModuleResult (copy), NavigationUtilsModule (upval), UseNavigationResult (copy), GetFFlagAXEnableInventorySortsAndFiltersModule (upval), UseSlotBasedEditorContextResult (copy), FFlagAXShowExpiredItemsFilterTooltip (upval), UseRefResult1 (copy), UseDispatchResult (copy), Exit3DFullViewModule (upval), UseRoactServiceModuleResult (copy)
		if UseAvatarRouteResult.current.name == AvatarScreen.SortAndFilters then
			UseCloseFiltersSignalModuleResult:fire()
		else
			NavigationUtilsModule.closeTryOnManager(UseNavigationResult)
			UseNavigationResult.navigate(AvatarScreen.SortAndFilters, {
				catalogSort = "",
				isPortrait = true,
				navigation = UseNavigationResult,
				onAcceptCallback = function() end,
				slotBasedEditorContext = if GetFFlagAXEnableInventorySortsAndFiltersModule() then UseSlotBasedEditorContextResult else nil
			})
		end
		if FFlagAXShowExpiredItemsFilterTooltip and UseRefResult1.current then
			UseRefResult1.current()
		end
		UseDispatchResult(Exit3DFullViewModule(UseRoactServiceModuleResult, UseNavigationResult.state.routeName))
	end
	local UseSelectorResult1 = nil
	
	if GetFFlagAXEnableInventorySortsAndFiltersModule() then
		local UseSelectorResult = UseSelectorFunction(SelectFilterCountModule, GetUseSelectorDeepEqualsFunction())
		local UseSignalStateResult = nil
		
		if FFlagAXAvatarEditorStoresContext then
			UseSignalStateResult = UseSignalStateFunction(UseAvatarEditorStoresFunction().sortAndFiltersStore.getFiltersCount)
		else
			local UseMemoResult = ReactModule.useMemo(function()
				-- upvalues: SignalsModule (upval)
				return SignalsModule.createSignal(0)
			end, {})
			UseSignalStateResult = UseSignalStateFunction(if UseSlotBasedEditorContextResult then UseSlotBasedEditorContextResult.sortAndFiltersStore.getFiltersCount else UseMemoResult)
		end
		UseSelectorResult1 = if UseSlotBasedEditorContextResult then UseSignalStateResult else UseSelectorResult
	else
		UseSelectorResult1 = UseSelectorFunction(SelectFilterCountModule, GetUseSelectorDeepEqualsFunction())
	end
	if AXUnifiedLoggingFilterOpen then
		local CUSTOMIZE = if UseSlotBasedEditorContextResult then UnifiedLoggingSurface.CUSTOMIZE else UnifiedLoggingSurface.CATALOG
		ReactModule.useEffect(function()
			-- upvalues: AddUnifiedEventLoggingFunction (upval), ButtonRef (copy), UnifiedEventLogEnums (upval), CUSTOMIZE (copy), UnifiedEventLogConstants (upval)
			AddUnifiedEventLoggingFunction(ButtonRef, {
				elementName = "OPEN_FILTER",
				action = UnifiedEventLogEnums.MarketplaceUnifiedAction.UI_ELEMENT_CLICK,
				surface = CUSTOMIZE
			}, {
				sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
			})
		end, { ButtonRef })
	end
	return ReactModule.createElement(IconButton, {
		anchorPoint = Gui.anchorPoint or Vector2.new(0, 0.5),
		position = Gui.position or UDim2.fromScale(0, 0.5),
		size = UDim2.fromOffset(24, 24),
		iconSize = IconSize.Medium,
		icon = if GetFFlagAXEnableSlotBasedEditorModule() then Images["icons/actions/adjust"] else Images["icons/actions/filter"],
		onActivated = toggleFilters,
		buttonRef = if AXUnifiedLoggingFilterOpen then ButtonRef else Gui.buttonRef,
		layoutOrder = Gui.layoutOrder,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionUp = Gui.NextSelectionUp,
		NextSelectionDown = Gui.NextSelectionDown
	}, {
		NotificationBadge = ReactModule.createElement(NumericalBadgeModule, {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0.5, 0, 0.5, 4),
			badgeCount = UseSelectorResult1
		}),
		FilterTooltip = if FFlagAXShowExpiredItemsFilterTooltip and UseSlotBasedEditorContextResult then ReactModule.createElement(ExpiredFilterTooltipModule, { dismissTooltipRef = UseRefResult1 }) else nil
	})
end