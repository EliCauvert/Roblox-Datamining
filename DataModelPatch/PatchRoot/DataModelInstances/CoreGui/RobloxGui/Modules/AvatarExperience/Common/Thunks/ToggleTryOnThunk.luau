local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local TutilsModule = require(CorePackages.Packages.tutils)
local AvatarExperienceHeadRefinementModule = require(CorePackages.Workspace.Packages.AvatarExperienceHeadRefinement)
local AvatarExperienceCatalogModule = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog)
local AvatarExperienceFlagsModule = require(CorePackages.Workspace.Packages.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local AvatarExperienceRoduxModule = require(CorePackages.Workspace.Packages.AvatarExperienceRodux)
local GetFilteredTryOnItemsFunction = AvatarExperienceCatalogModule.Utils.TryOns.getFilteredTryOnItems
local UseMultiItemShoppingFtuxFunction = AvatarExperienceCatalogModule.Hooks.useMultiItemShoppingFtux
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local FetchOutfitInfoFromBundleModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchOutfitInfoFromBundle)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreenProperties = AvatarExperienceNavigationModule.AvatarRoute.AvatarScreenProperties
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local ClearTryOnsFunction = AvatarExperienceRoduxModule.Actions.ClearTryOns
local StartedWaitingOnLCUpdateModule = require(Modules.AvatarExperience.Common.Actions.StartedWaitingOnLCUpdate)
local ToggleTryOnFunction = AvatarExperienceRoduxModule.Actions.ToggleTryOn
local CloseAllItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.CloseAllItemDetails)
local SetOrderForTryOnsFunction = AvatarExperienceRoduxModule.Actions.SetOrderForTryOns
local SetOrderModule = require(Modules.AvatarExperience.LayeredClothingSort.Actions.SetOrder)
local SelectOrderedToggledOnItemsListModule = require(Modules.AvatarExperience.Common.Selectors.SelectOrderedToggledOnItemsList)
local SelectOrderedToggledOnMakeupItemsListModule = require(Modules.AvatarExperience.Common.Selectors.SelectOrderedToggledOnMakeupItemsList)
local SelectUpdatedSortOrderForToggledOnItemsModule = require(Modules.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnItems)
local SelectUpdatedSortOrderForToggledOnMakeupItemsModule = require(Modules.AvatarExperience.Common.Selectors.SelectUpdatedSortOrderForToggledOnMakeupItems)
local UtilsModule1 = require(Modules.AvatarExperience.AvatarEditor.Utils)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local IsMakeupAssetTypeFunction = AvatarExperienceCommonModule.Utils.isMakeupAssetType
local _ = require(Modules.AvatarExperience.Common.Types)
local HeadShape = AvatarExperienceHeadRefinementModule.Enums.HeadShape
local TryOnClassicHeadShapeFunction = AvatarExperienceHeadRefinementModule.Actions.TryOnClassicHeadShape
local AXMISFixItemDetailsClose = game:DefineFastFlag("AXMISFixItemDetailsClose", false)
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagUseNavigationSelectors = require(CorePackages.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors
local FFlagSignalsNavP3gAvatarExperience = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3gAvatarExperience
local GetLegacyNavigationStoreFunction = require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore
local FFlagAXEnableExpiredUserLookCheckout = AvatarExperienceFlagsModule.FFlagAXEnableExpiredUserLookCheckout

return function(p1, p2, Bundle, ItemSubType, ItemId, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: ConstantsModule (copy), UtilsModule (copy), FetchOutfitInfoFromBundleModule (copy), GetTryOnItemReducerKeyFunction (copy), FFlagAXEnableExpiredUserLookCheckout (copy), NavigationUtilsModule (copy), AvatarScreenProperties (copy), FFlagAXMISEnableMultiShopping (copy), ClearTryOnsFunction (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), AXMISFixItemDetailsClose (copy), FetchAssetOrBundleInfoModule (copy), StartedWaitingOnLCUpdateModule (copy), SelectOrderedToggledOnItemsListModule (copy), FFlagAXCatalogMakeupSupport (copy), SelectOrderedToggledOnMakeupItemsListModule (copy), IsMakeupAssetTypeFunction (copy), SelectUpdatedSortOrderForToggledOnMakeupItemsModule (copy), SelectUpdatedSortOrderForToggledOnItemsModule (copy), SetOrderModule (copy), SetOrderForTryOnsFunction (copy), UtilsModule1 (copy), HeadShape (copy), TryOnClassicHeadShapeFunction (copy), UseMultiItemShoppingFtuxFunction (copy), TutilsModule (copy), GetFilteredTryOnItemsFunction (copy), AvatarScreen (copy), CloseAllItemDetailsModule (copy), CatalogUtilsModule (copy), FFlagSignalsNavP3gAvatarExperience (copy), GetLegacyNavigationStoreFunction (copy), FFlagUseNavigationSelectors (copy), Selectors (copy), ToggleTryOnFunction (copy), FFlagAXDurablesForMIS (copy)
	return function(p10)
		-- upvalues: ItemSubType (copy), Bundle (copy), ConstantsModule (upval), UtilsModule (upval), ItemId (copy), FetchOutfitInfoFromBundleModule (upval), p1 (copy), GetTryOnItemReducerKeyFunction (upval), p7 (copy), FFlagAXEnableExpiredUserLookCheckout (upval), p5 (copy), NavigationUtilsModule (upval), p4 (copy), AvatarScreenProperties (upval), FFlagAXMISEnableMultiShopping (upval), ClearTryOnsFunction (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), AXMISFixItemDetailsClose (upval), FetchAssetOrBundleInfoModule (upval), p2 (copy), StartedWaitingOnLCUpdateModule (upval), SelectOrderedToggledOnItemsListModule (upval), FFlagAXCatalogMakeupSupport (upval), SelectOrderedToggledOnMakeupItemsListModule (upval), IsMakeupAssetTypeFunction (upval), SelectUpdatedSortOrderForToggledOnMakeupItemsModule (upval), SelectUpdatedSortOrderForToggledOnItemsModule (upval), SetOrderModule (upval), SetOrderForTryOnsFunction (upval), UtilsModule1 (upval), HeadShape (upval), TryOnClassicHeadShapeFunction (upval), UseMultiItemShoppingFtuxFunction (upval), p8 (copy), TutilsModule (upval), GetFilteredTryOnItemsFunction (upval), AvatarScreen (upval), CloseAllItemDetailsModule (upval), CatalogUtilsModule (upval), FFlagSignalsNavP3gAvatarExperience (upval), GetLegacyNavigationStoreFunction (upval), FFlagUseNavigationSelectors (upval), Selectors (upval), ToggleTryOnFunction (upval), p3 (copy), p6 (copy), FFlagAXDurablesForMIS (upval), p9 (copy)
		local State = p10:getState()
		
		if State.AvatarExperience.LayeredClothingSort.CharacterUpdatesLocked then return end
		if not ItemSubType then return end
		local OutfitInfoFromBundleId = nil
		local IsRecolorable = nil
		local IsBodyPartsMatch = nil
		
		if Bundle == ConstantsModule.ItemType.Bundle then
			OutfitInfoFromBundleId = UtilsModule.getOutfitInfoFromBundleId(State, ItemId)
			local BundleInfo = State.AvatarExperience.Common.BundleInfos[ItemId]
			IsRecolorable = if BundleInfo then BundleInfo.isRecolorable else nil
			IsBodyPartsMatch = if IsRecolorable and BundleInfo then ItemSubType == ConstantsModule.BundleTypeIdStrings.BodyParts else nil
			
			if not OutfitInfoFromBundleId then
				p10:dispatch(FetchOutfitInfoFromBundleModule(p1, ItemId))
			end
		end
		local TryOnItems = p10:getState().AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(ItemId, Bundle)
		local TryOnItem = TryOnItems[TryOnItemReducerKey]
		
		if p7 and TryOnItem ~= nil then return end
		if FFlagAXEnableExpiredUserLookCheckout and p5 then
			NavigationUtilsModule.closeExpiredUserLookActionBar(p5)
		end
		local IsMultiTryOn = p4 and AvatarScreenProperties[p4.opaque.name].isMultiTryOn
		
		if not FFlagAXMISEnableMultiShopping and not IsMultiTryOn then
			if TryOnItem then
				if p5 then
					NavigationUtilsModule.closeFiltersAndItemDetails(p5)
				end
			else
				p10:dispatch(ClearTryOnsFunction(IsBodyPartsMatch))
				
				if FFlagAXMigrateAXToGlobalAutofocus and p5 then
					NavigationUtilsModule.closeTryOnManager(p5)
				end
			end
		end
		if AXMISFixItemDetailsClose and FFlagAXMISEnableMultiShopping and p5 and TryOnItem then
			NavigationUtilsModule.closeFiltersAndItemDetails(p5)
		end
		p10:dispatch(FetchAssetOrBundleInfoModule(p1, p2, ItemId, Bundle))
		
		if UtilsModule.isBundleOrLCAsset(Bundle, ItemSubType) then
			p10:dispatch(StartedWaitingOnLCUpdateModule())
		end
		local SelectOrderedToggledOnItemsListModuleResult, SelectOrderedToggledOnItemsListModuleResult2 = SelectOrderedToggledOnItemsListModule(State)
		local SelectOrderedToggledOnMakeupItemsListModuleResult = if FFlagAXCatalogMakeupSupport then SelectOrderedToggledOnMakeupItemsListModule(State) else nil
		local SelectUpdatedSortOrderForToggledOnMakeupItemsModuleResult = if FFlagAXCatalogMakeupSupport and IsMakeupAssetTypeFunction(ItemSubType) then SelectUpdatedSortOrderForToggledOnMakeupItemsModule(State, ItemId, Bundle, ItemSubType, SelectOrderedToggledOnMakeupItemsListModuleResult) else SelectUpdatedSortOrderForToggledOnItemsModule(State, ItemId, Bundle, ItemSubType, SelectOrderedToggledOnItemsListModuleResult, SelectOrderedToggledOnItemsListModuleResult2)
		
		if SelectUpdatedSortOrderForToggledOnMakeupItemsModuleResult.equippedAssetsToSetOrder then
			p10:dispatch(SetOrderModule(SelectUpdatedSortOrderForToggledOnMakeupItemsModuleResult.equippedAssetsToSetOrder))
		end
		if SelectUpdatedSortOrderForToggledOnMakeupItemsModuleResult.itemIdToOrderMap then
			p10:dispatch(SetOrderForTryOnsFunction(SelectUpdatedSortOrderForToggledOnMakeupItemsModuleResult.itemIdToOrderMap))
		end
		local v1: boolean = if OutfitInfoFromBundleId then true else false
		
		if ItemSubType == ConstantsModule.AssetTypeIdStrings.Face then
			local EquippedAssets = State.AvatarExperience.AvatarEditor.Character.EquippedAssets
			
			if not State.AvatarExperience.AvatarScene.OutfitTryOn.LastTryOnClassicHeadShape and not UtilsModule1.isClassicHeadEquipped(EquippedAssets) then
				local HeadRefinement = State.AvatarExperience.AvatarScene.HeadRefinement
				p10:dispatch(TryOnClassicHeadShapeFunction(HeadRefinement and HeadRefinement.lastSelectedHeadShape or HeadShape.Default))
			end
		else
			p10:dispatch(TryOnClassicHeadShapeFunction(nil))
		end
		local Items = nil
		
		if FFlagAXMISEnableMultiShopping and Bundle == ConstantsModule.ItemType.Bundle then
			local BundleInfo = State.AvatarExperience.Common.BundleInfos[ItemId]
			
			if BundleInfo then
				Items = BundleInfo.items
			end
		end
		if FFlagAXMISEnableMultiShopping then
			local HasTryOnItem = TryOnItems[TryOnItemReducerKey] ~= nil
			local UseMultiItemShoppingFtuxResult = UseMultiItemShoppingFtuxFunction()
			
			if UseMultiItemShoppingFtuxResult.shouldShowItemReplacedOnAvatarPrompt() and not p8 and TutilsModule.fieldCount(TryOnItems) > 1 and not HasTryOnItem and ItemSubType then
				local BundleInfo = nil
				
				if Items ~= nil then
					BundleInfo = {}
					
					for _, item in Items do
						if item.type == ConstantsModule.ItemType.Asset and item.assetType then
							BundleInfo[item.id] = { assetType = item.assetType }
						end
					end
				end
				local _, FilteredTryOnItems2 = GetFilteredTryOnItemsFunction(TryOnItems, {
					itemType = Bundle,
					itemSubType = ItemSubType,
					bundleInfo = BundleInfo
				})
				local _, Value = next(FilteredTryOnItems2)
				
				if Value and p5 then
					p5.navigate(AvatarScreen.ItemReplacedOnAvatarPrompt, {
						onConfirm = function()
							-- upvalues: UseMultiItemShoppingFtuxResult (copy), p10 (copy), CloseAllItemDetailsModule (upval), p5 (upval)
							UseMultiItemShoppingFtuxResult.setSeenItemReplaceOnAvatarPrompt()
							p10:dispatch(CloseAllItemDetailsModule(p5))
						end,
						beforeItem = {
							itemId = Value.itemId,
							thumbType = CatalogUtilsModule.GetRbxThumbType(Value.itemType)
						},
						afterItem = {
							itemId = ItemId,
							thumbType = CatalogUtilsModule.GetRbxThumbType(Bundle)
						}
					})
				end
			end
		end
		if FFlagAXMISEnableMultiShopping and p5 and (if FFlagSignalsNavP3gAvatarExperience then GetLegacyNavigationStoreFunction(false).getCurrentRoute(false) elseif FFlagUseNavigationSelectors then Selectors.selectCurrentRoactNavigationRoute(State) else State.Navigation.currentRoute).routeName == AvatarScreen.Checkout then
			NavigationUtilsModule.closeFocusedScreen(p5)
		end
		p10:dispatch(ToggleTryOnFunction(Bundle, ItemSubType, ItemId, p3, SelectUpdatedSortOrderForToggledOnMakeupItemsModuleResult.overrideOrder, SelectUpdatedSortOrderForToggledOnMakeupItemsModuleResult.bundleInfoMapping, p6, v1, IsRecolorable, if FFlagAXMISEnableMultiShopping then Items else nil, if FFlagAXMISEnableMultiShopping then p8 else nil, if FFlagAXDurablesForMIS then p9 else nil))
	end
end