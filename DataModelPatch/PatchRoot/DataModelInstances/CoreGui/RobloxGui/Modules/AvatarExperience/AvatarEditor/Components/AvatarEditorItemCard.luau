local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ItemTileEnums = require(CorePackages.Packages.UIBlox).Tile.ItemTileEnums
local ReactModule = require(CorePackages.Packages.React)
local TutilsModule = require(CorePackages.Packages.tutils)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local FFlagAXNegativeAvatarSequenceFeatures = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXNegativeAvatarSequenceFeatures
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AvatarExperienceNavigationModule = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation)
local AvatarScreen = AvatarExperienceNavigationModule.Enums.AvatarScreen
local UseAvatarRouteFunction = AvatarExperienceNavigationModule.AvatarRoute.Hooks.useAvatarRoute
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseTableWrappedCallbackRefFunction = AvatarExperienceCommonModule.Utils.RoactGamepadMigration.useTableWrappedCallbackRef
local CatalogItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local CatalogItemCardItemInfoEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardItemInfoEnum
local ItemCardThumbnail = require(CorePackages.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local CatalogItemCardStatusIconTypeEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local UseLastInputFunction = ResponsiveModule.useLastInput
local UseIsSpatialFunction = ResponsiveModule.useIsSpatial
local Input = ResponsiveModule.Input
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local LogOnOverlayClosedFunction = AvatarExperienceNavigationModule.Debug.logOnOverlayClosed
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Common.Services.Analytics)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.EquipOutfit)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ConstantsModule1 = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule2 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local AnalyticsModule2 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local ImpressionsUtil = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local UseAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.useAdaptiveScrolling
local SelectHasAvatarDataModule = require(Modules.AvatarExperience.Common.Selectors.selectHasAvatarData)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local UseItemCardFocusNavigationBindingsModule = require(script.Parent.useItemCardFocusNavigationBindings)
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local AvatarEditorItemCardWaitForData = game:DefineFastFlag("AvatarEditorItemCardWaitForData", false)
local AXDoNotDoubleToggleEmoteWithGamepad = game:DefineFastFlag("AXDoNotDoubleToggleEmoteWithGamepad", false)

return (ReactModule.memo(ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFunction (copy), UseAvatarRouteFunction (copy), UseAdaptiveScrollingFunction (copy), ReactModule (copy), UseLastInputFunction (copy), UseIsSpatialFunction (copy), UseRoactServiceFunction (copy), RoactAnalyticsModule (copy), AnalyticsModule (copy), AnalyticsModule2 (copy), AnalyticsModule1 (copy), RoactNetworkingModule (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), UseTokensFunction (copy), UtilsModule (copy), ConstantsModule1 (copy), ItemDataModule (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ConstantsModule (copy), AvatarScreen (copy), FullView (copy), ConstantsModule2 (copy), SelectHasAvatarDataModule (copy), SelectIsPortraitModule (copy), ItemTileEnums (copy), AvatarEditorItemCardWaitForData (copy), UseSelectorFunction (copy), TutilsModule (copy), Input (copy), LogOnOverlayClosedFunction (copy), NavigateWithLockFunction (copy), ToggleEquipAssetModule (copy), EquipOutfitModule (copy), Logging (copy), SendAnalyticsModule (copy), SetFullViewModule (copy), NavigationUtilsModule (copy), CatalogUtilsModule (copy), OpenItemDetailsModule (copy), FFlagAXModeratedItemsFlow (copy), OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy), AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), FFlagAXNegativeAvatarSequenceFeatures (copy), UnifiedEventLogConstants (copy), FetchAssetOrBundleInfoModule (copy), UseItemCardFocusNavigationBindingsModule (copy), AXDoNotDoubleToggleEmoteWithGamepad (copy), UseTableWrappedCallbackRefFunction (copy), UseLocalizationFunction (copy), CatalogItemCardStatusIconTypeEnum (copy), CatalogItemCard (copy), CatalogItemCardItemInfoEnum (copy), ItemCardThumbnail (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseAvatarRouteResult = UseAvatarRouteFunction()
	local UseAdaptiveScrollingResult = UseAdaptiveScrollingFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseLastInputResult = UseLastInputFunction()
	local UseIsSpatialResult = UseIsSpatialFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalyticsModule)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AnalyticsModule)
	local UseRoactServiceResult2 = UseRoactServiceFunction(AnalyticsModule2)
	local UseRoactServiceResult3 = UseRoactServiceFunction(AnalyticsModule1)
	local UseRoactServiceResult4 = UseRoactServiceFunction(RoactNetworkingModule)
	local UseTokensResult = if GetFFlagAXEnableSlotBasedEditorModule() then UseTokensFunction() else nil
	local ItemId = p1.itemId
	local IsOutfit = p1.isOutfit
	local IsWearingAssetOrOutfit = if p1.isWearingAssetOrOutfit then p1.isWearingAssetOrOutfit else false
	local UseSelectorResult = UseSelectorFunction(ReactModule.useCallback(function(p2)
		-- upvalues: UtilsModule (upval), ItemId (copy), IsOutfit (copy), ConstantsModule1 (upval), ItemDataModule (upval), Constants (upval), GetRbxthumbWithTypeSizeAndOptionsFunction (upval), ConstantsModule (upval), AvatarScreen (upval), FullView (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), UseAvatarRouteResult (copy), ConstantsModule2 (upval), p1 (copy), IsWearingAssetOrOutfit (copy), SelectHasAvatarDataModule (upval), SelectIsPortraitModule (upval), ItemTileEnums (upval), AvatarEditorItemCardWaitForData (upval)
		local AvatarEditorCategoryInfoFromState = UtilsModule.getAvatarEditorCategoryInfoFromState(p2)
		local OutfitInfo = p2.AvatarExperience.AvatarEditor.OutfitInfos[ItemId]
		local AssetType = nil
		local Name = nil
		local Text = nil
		local Bundle = if IsOutfit then ConstantsModule1.ItemType.Bundle else ConstantsModule1.ItemType.Asset
		local ItemDataModuleResult = ItemDataModule(p2.AvatarExperience.Common, ItemId, Bundle)
		
		if ItemId then
			if IsOutfit then
				Name = if AvatarEditorCategoryInfoFromState.HideTextUnderTile or not OutfitInfo then nil else OutfitInfo.name or nil
				Text = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, Constants.RbxthumbTypes.Outfit, 150)
				
				if OutfitInfo then
					Text ..= "&filters=" .. OutfitInfo.updateCounter
					
					if UtilsModule.isModerationPendingOrRejected(OutfitInfo.moderationStatus) then
						Text = ConstantsModule.BrokenAvatarThumbnail
					end
				end
			else
				AssetType = ItemDataModuleResult and ItemDataModuleResult.assetType or nil
				Name = if AvatarEditorCategoryInfoFromState.HideTextUnderTile or not ItemDataModuleResult then nil else ItemDataModuleResult.name or nil
				Text = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, Constants.RbxthumbTypes.Asset, 150)
				
				if ItemDataModuleResult and ItemDataModuleResult.outfitModerationStatus then
					Text ..= `&filters=__{ItemDataModuleResult.outfitModerationStatus}__`
				end
				if ItemDataModuleResult and ItemDataModuleResult.moderationStatus then
					Text ..= "&filters=" .. ItemDataModuleResult.updateCounter or 0
				end
			end
		end
		local ItemStatusStyleFromOutfit = if IsOutfit and OutfitInfo then UtilsModule.getItemStatusStyleFromOutfit(OutfitInfo) else nil
		local ItemIconTypeFromOutfit = if IsOutfit and OutfitInfo then UtilsModule.getItemIconTypeFromOutfit(OutfitInfo) else nil
		local IsEditable = if OutfitInfo then OutfitInfo.isEditable else false
		local IsLengthAbove: boolean = OutfitInfo and (OutfitInfo.creatingUniverseId ~= nil and string.len(OutfitInfo.creatingUniverseId) > 0)
		
		return {
			itemData = ItemDataModuleResult,
			itemType = Bundle,
			modifiedAssetType = if IsOutfit then ConstantsModule2.Outfits else AssetType,
			name = Name,
			thumbnail = Text,
			isUIFullView = if GetFFlagAXEnableSlotBasedEditorModule() then p2.AvatarExperience.Common.FullView[UseAvatarRouteResult.opaque.name] == FullView.UIFullView else p2.AvatarExperience.Common.FullView[AvatarScreen.AvatarEditor] == FullView.UIFullView,
			outfitInfo = OutfitInfo,
			categoryInfo = AvatarEditorCategoryInfoFromState,
			avatarTypeIsR6 = p2.AvatarExperience.AvatarEditor.Character.AvatarType == ConstantsModule1.AvatarType.R6,
			hasAvatarData = SelectHasAvatarDataModule(p2),
			isPortrait = SelectIsPortraitModule(p2),
			itemStatusStyle = ItemStatusStyleFromOutfit,
			isEquippable = ItemStatusStyleFromOutfit == nil,
			iconType = if ItemIconTypeFromOutfit == ItemTileEnums.ItemIconType.Bundle then nil else ItemIconTypeFromOutfit,
			shouldConfirmEquip = not (OutfitInfo and (OutfitInfo.outfitType == ConstantsModule1.OutfitTypes.DynamicHead and not IsEditable)) and not p1.hasItemFromCurrentPageEquipped,
			canShowDetails = IsWearingAssetOrOutfit and not (IsOutfit and not IsLengthAbove),
			dataLoaded = if AvatarEditorItemCardWaitForData then if IsOutfit then OutfitInfo else ItemDataModuleResult else nil
		}
	end, { ItemId, IsOutfit, UseAvatarRouteResult }), TutilsModule.deepEqual)
	local CategoryInfo = UseSelectorResult.categoryInfo
	local ItemType = UseSelectorResult.itemType
	local ItemData = UseSelectorResult.itemData
	local AssetType = if ItemData then ItemData.assetType else nil
	local IsPortrait = UseSelectorResult.isPortrait
	local NoUseIsSpatialResult: boolean = UseLastInputResult == Input.Directional and not UseIsSpatialResult
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: LogOnOverlayClosedFunction (upval), NoUseIsSpatialResult (copy)
		LogOnOverlayClosedFunction("ItemCard", NoUseIsSpatialResult)
	end, { NoUseIsSpatialResult })
	local UseResult1 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: UseAdaptiveScrollingResult (copy), UseRefResult (copy)
		if not UseAdaptiveScrollingResult then return end
		if p2 then
			UseAdaptiveScrollingResult.setSelectedItemInstance(nil)
			
			return
		end
		local Current = UseRefResult.current
		
		if Current and p3 then
			UseAdaptiveScrollingResult.setSelectedItemInstance(Current)
		end
	end, { UseAdaptiveScrollingResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: CategoryInfo (copy), ConstantsModule1 (upval), UseDispatchResult (copy), NavigateWithLockFunction (upval), UseNavigationResult (copy), AvatarScreen (upval), UseResult (copy)
		local Flag = false
		local BodyTextKey: string? = nil
		
		if CategoryInfo.PageType == ConstantsModule1.PageType.Animation then
			Flag = true
			BodyTextKey = "Feature.Avatar.Message.R15AnimationsPrompt"
		elseif CategoryInfo.PageType == ConstantsModule1.PageType.Emotes then
			Flag = true
			BodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
		end
		if Flag then
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), UseResult (upval), BodyTextKey (ref)
				UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, { onOverlayClosed = UseResult, bodyTextKey = BodyTextKey })
			end))
		end
	end, { UseNavigationResult, UseDispatchResult, UseResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: AvatarEditorItemCardWaitForData (upval), UseSelectorResult (copy), UseResult2 (copy), ConstantsModule1 (upval), IsWearingAssetOrOutfit (copy), UseNavigationResult (copy), AvatarScreen (upval), UseResult (copy), UseDispatchResult (copy), ToggleEquipAssetModule (upval), ItemId (copy), UseResult1 (copy), NavigateWithLockFunction (upval), IsOutfit (copy), EquipOutfitModule (upval), UseRoactServiceResult1 (copy), Logging (upval), SendAnalyticsModule (upval), GetFFlagAXEnableSlotBasedEditorModule (upval), SetFullViewModule (upval), UseRoactServiceResult3 (copy), UseAvatarRouteResult (copy), FullView (upval)
		if AvatarEditorItemCardWaitForData and not UseSelectorResult.dataLoaded then return end
		local ModifiedAssetType = UseSelectorResult.modifiedAssetType
		
		if UseSelectorResult.avatarTypeIsR6 then
			UseResult2()
		end
		local IsModifiedAssetTypeMatch = ModifiedAssetType == ConstantsModule1.AssetTypeIdStrings.HairAccessory
		local NoIsModifiedAssetTypeMatch: boolean = ConstantsModule1.LayeredAssetTypes[ModifiedAssetType] ~= nil and not IsModifiedAssetTypeMatch
		
		if UseSelectorResult.avatarTypeIsR6 and not IsWearingAssetOrOutfit and NoIsModifiedAssetTypeMatch then
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), UseResult (upval), UseDispatchResult (upval), ToggleEquipAssetModule (upval), ModifiedAssetType (copy), ItemId (upval), UseResult1 (upval), IsWearingAssetOrOutfit (upval)
				UseNavigationResult.navigate(AvatarScreen.R15UpgradePrompt, {
					bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning",
					onOverlayClosed = UseResult,
					onSwitchSelected = function()
						-- upvalues: UseDispatchResult (upval), ToggleEquipAssetModule (upval), ModifiedAssetType (upval), ItemId (upval), UseNavigationResult (upval), UseResult1 (upval), IsWearingAssetOrOutfit (upval)
						UseResult1(IsWearingAssetOrOutfit, (UseDispatchResult(ToggleEquipAssetModule(ModifiedAssetType, ItemId, UseNavigationResult))))
					end
				})
			end))
			
			return
		end
		if IsOutfit then
			local OutfitInfo = UseSelectorResult.outfitInfo
			
			if OutfitInfo then
				if UseSelectorResult.shouldConfirmEquip then
					UseDispatchResult(NavigateWithLockFunction(function()
						-- upvalues: UseNavigationResult (upval), AvatarScreen (upval), UseResult (upval), OutfitInfo (copy), UseResult1 (upval), IsWearingAssetOrOutfit (upval)
						UseNavigationResult.navigate(AvatarScreen.EquipOutfitConfirmation, {
							onOverlayClosed = UseResult,
							outfitInfo = OutfitInfo,
							onEquip = function(p2)
								-- upvalues: UseResult1 (upval), IsWearingAssetOrOutfit (upval)
								UseResult1(IsWearingAssetOrOutfit, p2)
							end
						})
					end))
				else
					UseResult1(IsWearingAssetOrOutfit, (UseDispatchResult(EquipOutfitModule({
						outfitInfo = OutfitInfo,
						analytics = UseRoactServiceResult1,
						navigation = UseNavigationResult,
						isSelected = IsWearingAssetOrOutfit
					}))))
				end
			else
				Logging.warn("Tried equipping a costume without any costume data!")
			end
		else
			if ModifiedAssetType then
				UseDispatchResult(SendAnalyticsModule(if IsWearingAssetOrOutfit then UseRoactServiceResult1.unequipAsset else UseRoactServiceResult1.equipAsset, ItemId, ModifiedAssetType))
			end
			UseResult1(IsWearingAssetOrOutfit, (UseDispatchResult(ToggleEquipAssetModule(ModifiedAssetType, ItemId, UseNavigationResult))))
		end
		if not IsWearingAssetOrOutfit and UseSelectorResult.isUIFullView then
			if GetFFlagAXEnableSlotBasedEditorModule() then
				UseDispatchResult(SetFullViewModule(UseRoactServiceResult3, UseAvatarRouteResult.opaque.name, FullView.None))
				
				return
			end
			UseDispatchResult(SetFullViewModule(UseRoactServiceResult3, AvatarScreen.AvatarEditor, FullView.None))
		end
	end, {
		UseRoactServiceResult3, IsWearingAssetOrOutfit, UseSelectorResult.isUIFullView,
		UseSelectorResult.modifiedAssetType, UseSelectorResult.avatarTypeIsR6,
		UseSelectorResult.shouldConfirmEquip, UseSelectorResult.outfitInfo,
		UseRoactServiceResult1, ItemId, UseResult1, UseResult2, UseNavigationResult,
		UseDispatchResult, UseResult,
		if AvatarEditorItemCardWaitForData then IsOutfit else nil,
		if AvatarEditorItemCardWaitForData then UseSelectorResult.dataLoaded else nil
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: IsOutfit (copy), ItemId (copy), IsPortrait (copy), p1 (copy), NavigationUtilsModule (upval), UseNavigationResult (copy), AvatarScreen (upval), UseDispatchResult (copy), NavigateWithLockFunction (upval), CatalogUtilsModule (upval), ItemType (copy), ItemData (copy), UseRoactServiceResult2 (copy), UseAvatarRouteResult (copy), OpenItemDetailsModule (upval)
		if IsOutfit then
			local config = {
				ZIndex = 2,
				renderBottomBar = false,
				outfitId = ItemId,
				showFullWithNoPeekView = not IsPortrait,
				NextSelectionLeft = if IsPortrait then nil else p1.resultsListRef or nil,
				outfitDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs
			}
			UseDispatchResult(NavigateWithLockFunction(function()
				-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (upval), AvatarScreen (upval), config (copy)
				NavigationUtilsModule.closeFiltersAndItemDetails(UseNavigationResult)
				NavigationUtilsModule.closeTryOnManager(UseNavigationResult)
				UseNavigationResult.navigate(AvatarScreen.OutfitDetails, config)
			end))
			
			return
		else
			UseDispatchResult(OpenItemDetailsModule({
				mountAsFullView = nil,
				showFullWithNoPeekView = true,
				closePreviousItemDetails = true,
				itemId = ItemId,
				itemType = ItemType,
				itemSubType = CatalogUtilsModule.GetItemSubType(ItemType, ItemData),
				priceInRobux = if ItemData then ItemData.priceInRobux else nil,
				isPortrait = IsPortrait,
				catalogAnalytics = UseRoactServiceResult2,
				avatarRoute = UseAvatarRouteResult,
				navigation = UseNavigationResult,
				itemDetailsPeekViewRefs = p1.itemDetailsPeekViewRefs,
				resultsListRef = p1.resultsListRef
			}))
		end
	end, {
		UseDispatchResult, UseNavigationResult, IsOutfit, ItemId,
		UseRoactServiceResult2, UseAvatarRouteResult, ItemType, ItemData,
		p1.itemDetailsPeekViewRefs, p1.resultsListRef
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: ItemData (copy), UtilsModule (upval), FFlagAXModeratedItemsFlow (upval), AssetType (copy), ConstantsModule1 (upval), UseNavigationResult (copy), AvatarScreen (upval), ItemType (copy), UseSelectorResult (copy), UseResult3 (copy), UseResult4 (copy)
		if ItemData and UtilsModule.isModerationPendingOrRejected(ItemData.moderationStatus) then
			UseNavigationResult.navigate(AvatarScreen.ItemsUnavailablePrompt, {
				items = {
					{
						category = ItemType,
						categoryLoc = if FFlagAXModeratedItemsFlow then if AssetType then ConstantsModule1.AssetTypeLocalized[AssetType] else "Feature.Catalog.Label.Bundle" else nil,
						itemName = ItemData.name
					}
				},
				messageType = UtilsModule.getMessageTypeFromModerationStatus(ItemData.moderationStatus)
			})
			
			return
		end
		if UseSelectorResult.isEquippable then
			UseResult3()
			
			return
		else
			UseResult4()
		end
	end, { UseSelectorResult.isEquippable, UseResult4, UseResult3 })
	local UseRefResult2 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), p1 (copy), ItemId (copy), OrganicEventImpressionsSchema (upval), ImpressionsUtil (upval), CategoryInfo (copy), AddUnifiedEventLoggingFunction (upval), UseRefResult1 (copy), IsWearingAssetOrOutfit (copy), UnifiedEventLogEnums (upval), ItemType (copy), AssetType (copy), UtilsModule (upval), FFlagAXNegativeAvatarSequenceFeatures (upval), UnifiedEventLogConstants (upval), IsOutfit (copy), UseRefResult2 (copy), ConstantsModule2 (upval), UseSelectorResult (copy), UseDispatchResult (copy), FetchAssetOrBundleInfoModule (upval), UseRoactServiceResult4 (copy), UseRoactServiceResult (copy), ConstantsModule1 (upval)
		local Current = UseRefResult.current
		
		if p1.impressionsTag and Current then
			Current:SetAttribute(p1.impressionsTag, ItemId)
			ImpressionsUtil.writeItemAttributes(OrganicEventImpressionsSchema[p1.impressionsSchema], Current, p1)
		end
		local Category = CategoryInfo.Category
		local Subcategory = CategoryInfo.Subcategory
		AddUnifiedEventLoggingFunction(UseRefResult1, {
			action = if IsWearingAssetOrOutfit then UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED else UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
			itemId = ItemId,
			itemType = if ItemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE,
			assetType = AssetType,
			gridPositionRow = if p1.gridInformation then p1.gridInformation.row else nil,
			gridPositionColumn = if p1.gridInformation then p1.gridInformation.column else nil,
			category = if Category then UtilsModule.getAvatarEditorCategoryInfo(Category).Name else nil,
			subcategory = if Category and Subcategory then UtilsModule.getAvatarEditorCategoryInfo(Category, Subcategory).Name else nil,
			isOwnedItem = if FFlagAXNegativeAvatarSequenceFeatures then true else nil
		}, {
			sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
		})
		
		if not ItemId or IsOutfit or UseRefResult2.current == ItemId or ItemId == ConstantsModule2.AddOutfitButton then return end
		UseRefResult2.current = ItemId
		
		if not UseSelectorResult.name then
			UseDispatchResult(FetchAssetOrBundleInfoModule(UseRoactServiceResult4, UseRoactServiceResult, ItemId, ConstantsModule1.ItemType.Asset))
		end
	end, {
		UseDispatchResult, UseRoactServiceResult4, UseRoactServiceResult, ItemId,
		UseSelectorResult.name, IsOutfit, CategoryInfo.Category,
		CategoryInfo.Subcategory, ItemType, IsWearingAssetOrOutfit, p1.gridInformation,
		AssetType
	})
	local UseTableWrappedCallbackRefResult = UseTableWrappedCallbackRefFunction((UseItemCardFocusNavigationBindingsModule({
		onOpenEditorDetailsPage = if UseSelectorResult.canShowDetails then UseResult4 else nil,
		onSlotEmote = if CategoryInfo.PageType == ConstantsModule1.PageType.Emotes and not IsWearingAssetOrOutfit then if AXDoNotDoubleToggleEmoteWithGamepad then function() end else UseResult5 else nil,
		onUnslotEmote = if CategoryInfo.PageType == ConstantsModule1.PageType.Emotes and IsWearingAssetOrOutfit then if AXDoNotDoubleToggleEmoteWithGamepad then function() end else UseResult5 else nil
	}, UseRefResult)))
	local UseLocalizationResult = UseLocalizationFunction({ details = "Feature.Avatar.Label.DetailsButton" })
	
	return ReactModule.createElement(CatalogItemCard, {
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.fromScale(1, 1),
		AutomaticSize = Enum.AutomaticSize.Y,
		isSelected = IsWearingAssetOrOutfit,
		title = UseSelectorResult.name,
		itemInfo = if UseSelectorResult.iconType == ItemTileEnums.ItemIconType.DynamicHead then CatalogItemCardItemInfoEnum.DynamicHead else nil,
		onActivated = if ItemId and UseSelectorResult.hasAvatarData then UseResult5 else nil,
		overlayButtonText = if UseSelectorResult.canShowDetails then UseLocalizationResult.details else nil,
		onOverlayButtonActivated = if UseSelectorResult.canShowDetails then UseResult4 else nil,
		ref = UseTableWrappedCallbackRefResult,
		titleTextSize = if GetFFlagAXEnableSlotBasedEditorModule() then if p1.titleFontStyle then p1.titleFontStyle elseif UseTokensResult then UseTokensResult.Typography.CaptionSmall else nil else nil,
		presentationSlot = if UseSelectorResult.thumbnail then ReactModule.createElement(ItemCardThumbnail, {
			url = UseSelectorResult.thumbnail,
			tag = p1.impressionsTag,
			ref = UseRefResult
		}) else nil,
		itemStatus = if ItemData and UtilsModule.isModerationPendingOrRejected(ItemData.moderationStatus) then {
			type = "placeholder",
			iconType = if ItemData.moderationStatus == Enum.ModerationStatus.NotReviewed then CatalogItemCardStatusIconTypeEnum.PendingModeration else CatalogItemCardStatusIconTypeEnum.Moderated
		} else nil
	})
end), TutilsModule.deepEqual))