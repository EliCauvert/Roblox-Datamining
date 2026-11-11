local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local OpenInfoPeekViewFunction = require(CorePackages.Workspace.Packages.DiscoveryRouting).OpenInfoPeekView
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local GetFooterVisibilityFromItemFootersFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Utils.getFooterVisibilityFromItemFooters
local UseCatalogCategoryImpressionsInfoModule = require(Modules.AvatarExperience.Catalog.Hooks.useCatalogCategoryImpressionsInfo)
local SponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Components.Search.SponsoredItems)
local CatalogItemCardContainerModule = require(Modules.AvatarExperience.Catalog.Components.ItemsList.CatalogItemCardContainer)
local ConstantsModule = require(Modules.LuaApp.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local SelectSponsoredItemsModule = require(Modules.AvatarExperience.Catalog.Selectors.selectSponsoredItems)
local _ = require(Modules.AvatarExperience.Common.Types)
local AXFixSponsoredItemsWidgetRowFooters = game:DefineFastFlag("AXFixSponsoredItemsWidgetRowFooters", false)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

return (ReactModule.forwardRef(function(Gui, SponsoredGridRef)
	-- upvalues: AXFixSponsoredItemsWidgetRowFooters (copy), GetFooterVisibilityFromItemFootersFunction (copy), UseTokensFunction (copy), RoactGamepadModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), UseNavigationFunction (copy), ConstantsModule (copy), CatalogConstantsModule (copy), SelectSponsoredItemsModule (copy), ReactModule (copy), CryoModule (copy), UseLocalizationModule (copy), UseDispatchFunction (copy), AvatarScreen (copy), IsVRAppBuildFunction (copy), OpenInfoPeekViewFunction (copy), UseCatalogCategoryImpressionsInfoModule (copy), UtilsModule (copy), SponsoredItemsModule (copy), CatalogItemCardContainerModule (copy)
	local FooterVisibilityFromItemFooters = if AXFixSponsoredItemsWidgetRowFooters then GetFooterVisibilityFromItemFootersFunction(if Gui.widgetConfiguration and Gui.widgetConfiguration.defaultItemGroupTemplate then Gui.widgetConfiguration.defaultItemGroupTemplate.itemFooters else nil) else nil
	local UseTokensResult = UseTokensFunction()
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseFocusControllerResult = if FFlagAXMigrateAXToGlobalAutofocus then nil else RoactGamepadModule.useFocusController()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: Gui (copy)
		return p1.Search.SearchesInCatalog[Gui.searchUuid]
	end, GetUseSelectorDeepEqualsFunction())
	local UseNavigationResult = UseNavigationFunction()
	local ItemsPerRow = Gui.itemsPerRow
	local Key: string = UseNavigationResult.state.key
	local Text = ConstantsModule.ImpressionsEvents.AvatarItems .. (if Key then string.gsub(Key, "[-{}]", "") else "")
	local Keyword = UseSelectorResult and UseSelectorResult.keyword
	local CatalogSearch = if Gui.fromSearch then CatalogConstantsModule.AnalyticsContext.CatalogSearch else CatalogConstantsModule.AnalyticsContext.Catalog
	local UseSelectorResult1 = UseSelectorFunction(SelectSponsoredItemsModule, GetUseSelectorDeepEqualsFunction())
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseSelectorResult1 (copy), ItemsPerRow (copy), CryoModule (upval)
		return if UseSelectorResult1 and ItemsPerRow > 0 then CryoModule.List.getRange(UseSelectorResult1, 1, ItemsPerRow) else nil
	end, { UseSelectorResult1, ItemsPerRow })
	local UseLocalizationModuleResult = UseLocalizationModule({
		sponsored = "Feature.GamePage.Label.Sponsored",
		sponsoredDisclosure = "Feature.GamePage.Label.SponsoredDisclosure",
		gotIt = "Feature.Avatar.Action.GotIt"
	})
	local UseDispatchResult = UseDispatchFunction()
	
	local function v32(TitleText, BodyText)
		-- upvalues: UseNavigationResult (copy), AvatarScreen (upval), UseLocalizationModuleResult (copy)
		UseNavigationResult.navigate(AvatarScreen.GenericPrompt, {
			titleText = TitleText,
			bodyText = BodyText,
			buttonText = UseLocalizationModuleResult.gotIt
		})
	end
	
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), UseLocalizationModuleResult (copy), IsVRAppBuildFunction (upval), v32 (copy), UseNavigationResult (copy), AvatarScreen (upval), OpenInfoPeekViewFunction (upval)
		if UseDispatchResult and UseLocalizationModuleResult.sponsoredDisclosure then
			if IsVRAppBuildFunction() and v32 then
				UseNavigationResult.navigate(AvatarScreen.GenericPrompt, {
					titleText = UseLocalizationModuleResult.sponsored,
					bodyText = UseLocalizationModuleResult.sponsoredDisclosure,
					buttonText = UseLocalizationModuleResult.gotIt
				})
				
				return
			end
			UseDispatchResult(OpenInfoPeekViewFunction(UseLocalizationModuleResult.sponsored, UseLocalizationModuleResult.sponsoredDisclosure))
		end
	end, {
		UseDispatchResult,
		UseLocalizationModuleResult.sponsored,
		UseLocalizationModuleResult.sponsoredDisclosure
	})
	local ImpressionsCategory = nil
	local ImpressionsSubcategory = nil
	local ImpressionsTaxonomyId = nil
	local UseCatalogCategoryImpressionsInfoModuleResult = UseCatalogCategoryImpressionsInfoModule(Gui.fromSearch)
	ImpressionsCategory = UseCatalogCategoryImpressionsInfoModuleResult.impressionsCategory
	ImpressionsSubcategory = UseCatalogCategoryImpressionsInfoModuleResult.impressionsSubcategory
	ImpressionsTaxonomyId = UseCatalogCategoryImpressionsInfoModuleResult.impressionsTaxonomyId
	local CreatorNameTileFooterEnabled = UtilsModule.getCreatorNameTileFooterEnabled(Gui.widgetConfiguration)
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center
		}),
		SponsoredItems = ReactModule.createElement(SponsoredItemsModule, {
			LayoutOrder = 1,
			numItemsPerRow = ItemsPerRow,
			renderItem = function(p1)
				-- upvalues: ReactModule (upval), RoactGamepadModule (upval), UseRefCacheResult (copy), ItemsPerRow (copy), Gui (copy), CatalogItemCardContainerModule (upval), CatalogSearch (ref), CatalogConstantsModule (upval), Text (copy), Keyword (copy), ImpressionsCategory (ref), ImpressionsSubcategory (ref), ImpressionsTaxonomyId (ref), CreatorNameTileFooterEnabled (copy), AXFixSponsoredItemsWidgetRowFooters (upval), FooterVisibilityFromItemFooters (copy)
				local Index: number = p1.index
				local Item = p1.item
				
				return ReactModule.createElement(RoactGamepadModule.Focusable.Frame, {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					ref = UseRefCacheResult[Index],
					NextSelectionRight = if Index < ItemsPerRow then UseRefCacheResult[Index + 1] else nil,
					NextSelectionLeft = if Index > 1 then UseRefCacheResult[Index - 1] else nil,
					onFocusGained = function()
						-- upvalues: Gui (upval), Index (copy)
						if Gui.gamepadNavigationFocusPos:getValue().Y == Gui.rowIndex then
							Gui.setGamepadNavigationFocusPos(Vector2.new(Index, Gui.rowIndex))
							
							return
						end
					end
				}, {
					CatalogItemCard = ReactModule.createElement(CatalogItemCardContainerModule, {
						isSponsoredItem = true,
						impressionsSchema = "defaultItem",
						impressionsGroup = nil,
						isOrganic = true,
						analyticsContext = CatalogSearch,
						analyticsItemCountPerPage = CatalogConstantsModule.PageFetchLimit,
						index = Index,
						itemType = Item.type,
						itemId = Item.id,
						adTrackingData = Item.encryptedAdTrackingData,
						itemDetailsPeekViewRefs = Gui.itemDetailsPeekViewRefs,
						resultsListRef = Gui.gridRef,
						impressionsTag = Text,
						impressionsSearch = Keyword,
						impressionsId = Item.id,
						impressionsCategory = ImpressionsCategory,
						impressionsSubcategory = ImpressionsSubcategory,
						impressionsTaxonomyId = ImpressionsTaxonomyId,
						creatorNameTileFooterEnabled = CreatorNameTileFooterEnabled,
						isCreatorNameVisible = if AXFixSponsoredItemsWidgetRowFooters then FooterVisibilityFromItemFooters.isCreatorNameVisible else nil,
						isTitleVisible = if AXFixSponsoredItemsWidgetRowFooters then FooterVisibilityFromItemFooters.isTitleVisible else nil,
						isPriceVisible = if AXFixSponsoredItemsWidgetRowFooters then FooterVisibilityFromItemFooters.isPriceVisible else nil,
						gridInformation = {
							gridPositionRow = Gui.rowIndex,
							gridPositionColumn = Index
						}
					})
				})
			end,
			sponsoredGridRef = SponsoredGridRef,
			scrollingFrameRef = Gui.scrollingFrameRef,
			requestImpressionsSignal = Gui.requestImpressionsSignal,
			NextSelectionUp = Gui.NextSelectionUp,
			NextSelectionDown = Gui.NextSelectionDown,
			NextSelectionRight = Gui.NextSelectionRight,
			onFocusGained = Gui.onFocusGained,
			moveFocusToColumn = if FFlagAXMigrateAXToGlobalAutofocus then nil else function()
				-- upvalues: Gui (copy), UseRefCacheResult (copy), UseMemoResult (copy), UseFocusControllerResult (copy)
				Gui.setGamepadNavigationFocusPos(Vector2.new(Gui.gamepadNavigationFocusPos:getValue().X, Gui.rowIndex))
				local X: number = Gui.gamepadNavigationFocusPos:getValue().X
				UseFocusControllerResult.moveFocusTo(if X then UseRefCacheResult[math.min(X, #UseMemoResult)] else UseRefCacheResult[1])
			end,
			onActivateTooltipCallback = UseResult
		}),
		ManualPaddingFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, UseTokensResult.Gap.Large)
		})
	})
end))