local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ItemTile = UIBloxModule.Tile.ItemTile
local ItemTileEnums = UIBloxModule.Tile.ItemTileEnums
local SaveTile = UIBloxModule.Tile.SaveTile
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local TModule = require(CorePackages.Packages.t)
local Focusable = RoactGamepadModule.Focusable
local CryoModule = require(CorePackages.Packages.Cryo)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local Logging = require(CorePackages.Workspace.Packages.AppCommonLib).Logging
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local WithLastInputGroupModule = require(Modules.AvatarExperience.Common.Components.withLastInputGroup)
local WithAdaptiveScrollingFunction = AvatarExperienceCommonModule.Hooks.withAdaptiveScrolling
local ConstantsModule = require(Modules.AvatarExperience.AvatarEditor.Constants)
local LogOnOverlayClosedFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local AnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Services.Analytics)
local AnalyticsModule1 = require(Modules.AvatarExperience.Common.Services.Analytics)
local ItemTileDetailButtonModule = require(Modules.AvatarExperience.Common.Components.ItemTileDetailButton)
local ConstantsModule1 = require(Modules.LuaApp.Constants)
local FetchAssetOrBundleInfoModule = require(Modules.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo)
local EquipOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.EquipOutfit)
local SendAnalyticsModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.SendAnalytics)
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local CatalogUtilsModule = require(Modules.AvatarExperience.Catalog.CatalogUtils)
local ItemDataModule = require(Modules.AvatarExperience.Common.Selectors.ItemData)
local ConstantsModule2 = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule3 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local SetFullViewModule = require(Modules.AvatarExperience.Common.Thunks.SetFullView)
local FullView = AvatarExperienceCommonModule.Enums.FullView
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local NavigateWithLockFunction = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock
local OpenItemDetailsModule = require(Modules.AvatarExperience.Common.Thunks.OpenItemDetails)
local AnalyticsModule2 = require(Modules.AvatarExperience.Catalog.Services.Analytics)
local CatalogItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCard
local CatalogItemCardStatusIconTypeEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum
local _ = require(Modules.AvatarExperience.Common.Types)
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local Constants = UserLibModule.Utils.Constants
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local ImpressionsUtil = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil
local OrganicEventImpressionsSchema = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema
local UnifiedEventLogEnums = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums
local AddUnifiedEventLoggingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging
local UnifiedEventLogConstants = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants
local SelectHasAvatarDataModule = require(Modules.AvatarExperience.Common.Selectors.selectHasAvatarData)
local GetFFlagAXEnableSlotBasedEditorModule = require(Modules.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor)
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FFlagAXNegativeAvatarSequenceFeatures = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXNegativeAvatarSequenceFeatures
local AXItemCardShouldNotBeAbleToActivateUntilReady = game:DefineFastFlag("AXItemCardShouldNotBeAbleToActivateUntilReady", false)
local FFlagAXModeratedItemsFlow = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow
local FFlagAXMISEnableMultiShoppingUnifiedEvents = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents
local IsTenFootInterface = GuiService:IsTenFootInterface()
local AddOutfitButton = ConstantsModule3.AddOutfitButton
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local ItemCard = RoactModule.PureComponent:extend("ItemCard")
ItemCard.validateProps = TModule.strictInterface({
	itemId = TModule.optional(TModule.string),
	isOutfit = TModule.boolean,
	isWearingAssetOrOutfit = TModule.optional(TModule.boolean),
	titleFontStyle = TModule.optional(TModule.table),
	hasItemFromCurrentPageEquipped = TModule.optional(TModule.boolean),
	itemDetailsPeekViewRefs = TModule.table,
	resultsListRef = TModule.table,
	impressionsTag = TModule.optional(TModule.string),
	impressionsSchema = TModule.optional(TModule.string),
	gridInformation = TModule.optional(TModule.table),
	assetTypeId = TModule.optional(TModule.string),
	name = TModule.optional(TModule.string),
	thumbnail = TModule.optional(TModule.string),
	isUIFullView = TModule.boolean,
	outfitInfo = TModule.optional(TModule.table),
	categoryInfo = TModule.table,
	lastInputGroup = TModule.string,
	avatarType = TModule.string,
	hasAvatarData = TModule.boolean,
	itemData = TModule.optional(TModule.table),
	itemType = TModule.optional(TModule.string),
	isEditable = TModule.optional(TModule.boolean),
	isPortrait = TModule.boolean,
	disabled = if AXItemCardShouldNotBeAbleToActivateUntilReady then TModule.boolean else nil,
	fetchItemInfo = TModule.callback,
	toggleEquipAsset = TModule.callback,
	equipOutfitThunk = TModule.callback,
	sendAnalytics = TModule.callback,
	setFullView = TModule.callback,
	navigateWithLock = TModule.callback,
	openItemDetails = TModule.callback,
	appAnalytics = TModule.table,
	analytics = TModule.table,
	avatarExperienceAnalytics = TModule.table,
	networking = TModule.callback,
	catalogAnalytics = TModule.table,
	navigation = TModule.table,
	avatarRoute = TModule.table,
	adaptiveScrolling = TModule.optional(TModule.table),
	focusController = if FFlagAXMigrateAXToGlobalAutofocus then nil else TModule.optional(TModule.table)
})

function ItemCard.shouldShowConfirmationDialog(p1): boolean
	-- upvalues: ConstantsModule2 (copy)
	return (p1.props.outfitInfo.outfitType ~= ConstantsModule2.OutfitTypes.DynamicHead or p1.props.outfitInfo.isEditable) and not p1.props.hasItemFromCurrentPageEquipped
end

function ItemCard.getItemIconType(p1)
	-- upvalues: UtilsModule (copy), ItemTileEnums (copy)
	local IsOutfit = p1.props.isOutfit
	local OutfitInfo = p1.props.outfitInfo
	local ItemIconTypeFromOutfit = if IsOutfit and OutfitInfo then UtilsModule.getItemIconTypeFromOutfit(OutfitInfo) else IsOutfit and ItemTileEnums.ItemIconType.Bundle or nil
	
	return if ItemIconTypeFromOutfit == ItemTileEnums.ItemIconType.Bundle then nil else ItemIconTypeFromOutfit
end

function ItemCard.getItemStatusStyle(p1)
	-- upvalues: UtilsModule (copy)
	local OutfitInfo = p1.props.outfitInfo
	
	return if p1.props.isOutfit and OutfitInfo then UtilsModule.getItemStatusStyleFromOutfit(OutfitInfo) else nil
end

function ItemCard.isEquippable(p1): boolean
	return p1:getItemStatusStyle() == nil
end

function ItemCard.init(p1)
	-- upvalues: RoactModule (copy), NavigationUtilsModule (copy), AvatarScreen (copy), CatalogUtilsModule (copy), ConstantsModule1 (copy), LogOnOverlayClosedFunction (copy), ConstantsModule2 (copy), UtilsModule (copy), FFlagAXModeratedItemsFlow (copy), AXItemCardShouldNotBeAbleToActivateUntilReady (copy)
	p1.addOutfitButtonRef = RoactModule.createRef()
	p1.thumbnailRef = RoactModule.createRef()
	p1.textButtonRef = RoactModule.createRef()
	
	function p1.activateDetailsButton()
		-- upvalues: p1 (copy), NavigationUtilsModule (upval), AvatarScreen (upval), CatalogUtilsModule (upval)
		if p1:isOutfit() then
			local Navigation = p1.props.navigation
			local config = {
				ZIndex = 2,
				renderBottomBar = false,
				outfitId = p1.props.itemId,
				showFullWithNoPeekView = not p1.props.isPortrait,
				NextSelectionLeft = if p1.props.isPortrait then nil else p1.props.resultsListRef or nil,
				outfitDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs
			}
			p1.props.navigateWithLock(function()
				-- upvalues: NavigationUtilsModule (upval), Navigation (copy), AvatarScreen (upval), config (copy)
				NavigationUtilsModule.closeFiltersAndItemDetails(Navigation)
				NavigationUtilsModule.closeTryOnManager(Navigation)
				Navigation.navigate(AvatarScreen.OutfitDetails, config)
			end)
			
			return
		else
			p1.props.openItemDetails({
				mountAsFullView = nil,
				showFullWithNoPeekView = true,
				closePreviousItemDetails = true,
				itemId = p1.props.itemId,
				itemType = p1.props.itemType,
				itemSubType = CatalogUtilsModule.GetItemSubType(p1.props.itemType, p1.props.itemData),
				priceInRobux = if p1.props.itemData then p1.props.itemData.priceInRobux else nil,
				catalogAnalytics = p1.props.catalogAnalytics,
				avatarRoute = p1.props.avatarRoute,
				navigation = p1.props.navigation,
				itemDetailsPeekViewRefs = p1.props.itemDetailsPeekViewRefs,
				resultsListRef = p1.props.resultsListRef
			})
		end
	end
	
	function p1.onOverlayClosed()
		-- upvalues: p1 (copy), ConstantsModule1 (upval), LogOnOverlayClosedFunction (upval)
		local IsLastInputGroupMatch = p1.props.lastInputGroup == ConstantsModule1.InputType.Gamepad
		LogOnOverlayClosedFunction("ItemCard", IsLastInputGroupMatch)
		
		if IsLastInputGroupMatch then
			p1.props.focusController.captureFocus()
		end
	end
	
	function p1.maybeShowNonBlockingR15Prompt()
		-- upvalues: p1 (copy), ConstantsModule2 (upval), AvatarScreen (upval)
		if p1.props.avatarType ~= ConstantsModule2.AvatarType.R6 then return end
		local Flag = false
		local BodyTextKey: string? = nil
		
		if p1.props.categoryInfo.PageType == ConstantsModule2.PageType.Animation then
			Flag = true
			BodyTextKey = "Feature.Avatar.Message.R15AnimationsPrompt"
		elseif p1.props.categoryInfo.PageType == ConstantsModule2.PageType.Emotes then
			Flag = true
			BodyTextKey = "Feature.Avatar.Message.R15EmotesPrompt"
		end
		if Flag then
			p1.props.navigateWithLock(function()
				-- upvalues: p1 (upval), AvatarScreen (upval), BodyTextKey (ref)
				p1.props.navigation.navigate(AvatarScreen.R15UpgradePrompt, {
					onOverlayClosed = p1.onOverlayClosed,
					bodyTextKey = BodyTextKey
				})
			end)
		end
	end
	
	function p1.toggleAdaptiveScrollingSelectedItem(IsWearingAssetOrOutfit, p2)
		-- upvalues: p1 (copy)
		local AdaptiveScrolling = p1.props.adaptiveScrolling
		
		if not AdaptiveScrolling then return end
		if IsWearingAssetOrOutfit then
			AdaptiveScrolling.setSelectedItemInstance(nil)
			
			return
		end
		local Current = p1.thumbnailRef.current
		
		if Current and p2 then
			AdaptiveScrolling.setSelectedItemInstance(Current)
		end
	end
	
	function p1.onItemClick()
		-- upvalues: p1 (copy), UtilsModule (upval), FFlagAXModeratedItemsFlow (upval), ConstantsModule2 (upval), AvatarScreen (upval), AXItemCardShouldNotBeAbleToActivateUntilReady (upval)
		local ItemData = p1.props.itemData
		
		if ItemData and UtilsModule.isModerationPendingOrRejected(ItemData.moderationStatus) then
			p1.props.navigation.navigate(AvatarScreen.ItemsUnavailablePrompt, {
				items = {
					{
						category = p1.props.itemType,
						categoryLoc = if FFlagAXModeratedItemsFlow then if p1.props.assetType then ConstantsModule2.AssetTypeLocalized[p1.props.assetTypeId] else "Feature.Catalog.Label.Bundle" else nil,
						itemName = ItemData.name
					}
				},
				messageType = UtilsModule.getMessageTypeFromModerationStatus(ItemData.moderationStatus)
			})
			
			return
		end
		if AXItemCardShouldNotBeAbleToActivateUntilReady then
			if p1.props.disabled then return end
		else
			if not p1.props.itemId then return end
			if not p1.props.hasAvatarData then return end
		end
		if p1:isEquippable() then
			p1:toggleEquip()
			
			return
		else
			p1.activateDetailsButton()
		end
	end
end

function ItemCard.toggleEquip(p1)
	-- upvalues: ConstantsModule3 (copy), ConstantsModule2 (copy), AvatarScreen (copy), Logging (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), FullView (copy)
	local ItemId = p1.props.itemId
	local IsWearingAssetOrOutfit = p1.props.isWearingAssetOrOutfit
	local ToggleEquipAssetFunction = p1.props.toggleEquipAsset
	local SendAnalyticsFunction: (any, any, any) -> () = p1.props.sendAnalytics
	local Analytics = p1.props.analytics
	local EquipOutfitThunkFunction = p1.props.equipOutfitThunk
	local IsUIFullView = p1.props.isUIFullView
	local Navigation = p1.props.navigation
	local Outfits = p1:isOutfit() and ConstantsModule3.Outfits or p1.props.assetTypeId
	
	local function OnSwitchSelected()
		-- upvalues: ToggleEquipAssetFunction (copy), Outfits (copy), ItemId (copy), Navigation (copy), p1 (copy), IsWearingAssetOrOutfit (copy)
		p1.toggleAdaptiveScrollingSelectedItem(IsWearingAssetOrOutfit, (ToggleEquipAssetFunction(Outfits, ItemId, Navigation)))
	end
	
	p1.maybeShowNonBlockingR15Prompt()
	local IsOutfitsMatch = Outfits == ConstantsModule2.AssetTypeIdStrings.HairAccessory
	local NoIsOutfitsMatch: boolean = ConstantsModule2.LayeredAssetTypes[Outfits] ~= nil and not IsOutfitsMatch
	
	if p1.props.avatarType == ConstantsModule2.AvatarType.R6 and not IsWearingAssetOrOutfit and NoIsOutfitsMatch then
		p1.props.navigateWithLock(function()
			-- upvalues: p1 (copy), AvatarScreen (upval), OnSwitchSelected (copy)
			p1.props.navigation.navigate(AvatarScreen.R15UpgradePrompt, {
				bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning",
				onOverlayClosed = p1.onOverlayClosed,
				onSwitchSelected = OnSwitchSelected
			})
		end)
		
		return
	end
	if p1:isOutfit() then
		local OutfitInfo = p1.props.outfitInfo
		
		if OutfitInfo then
			if p1:shouldShowConfirmationDialog() then
				p1.props.navigateWithLock(function()
					-- upvalues: p1 (copy), AvatarScreen (upval), OutfitInfo (copy), IsWearingAssetOrOutfit (copy)
					p1.props.navigation.navigate(AvatarScreen.EquipOutfitConfirmation, {
						onOverlayClosed = p1.onOverlayClosed,
						outfitInfo = OutfitInfo,
						onEquip = function(p2)
							-- upvalues: p1 (upval), IsWearingAssetOrOutfit (upval)
							p1.toggleAdaptiveScrollingSelectedItem(IsWearingAssetOrOutfit, p2)
						end
					})
				end)
			else
				p1.toggleAdaptiveScrollingSelectedItem(IsWearingAssetOrOutfit, (EquipOutfitThunkFunction(OutfitInfo, Analytics, Navigation, IsWearingAssetOrOutfit)))
			end
		else
			Logging.warn("Tried equipping a costume without any costume data!")
		end
	else
		if Outfits then
			if IsWearingAssetOrOutfit then
				SendAnalyticsFunction(Analytics.unequipAsset, ItemId, Outfits)
			else
				SendAnalyticsFunction(Analytics.equipAsset, ItemId, Outfits)
			end
		end
		p1.toggleAdaptiveScrollingSelectedItem(IsWearingAssetOrOutfit, (ToggleEquipAssetFunction(Outfits, ItemId, Navigation)))
	end
	if not IsWearingAssetOrOutfit and IsUIFullView then
		if GetFFlagAXEnableSlotBasedEditorModule() then
			p1.props.setFullView(p1.props.avatarExperienceAnalytics, p1.props.avatarRoute.opaque.name, FullView.None)
			
			return
		end
		p1.props.setFullView(p1.props.avatarExperienceAnalytics, AvatarScreen.AvatarEditor, FullView.None)
	end
end

function ItemCard.isOutfit(p1)
	return p1.props.isOutfit
end

function ItemCard.wasCreatedInExperience(p1): boolean
	local OutfitInfo = p1.props.outfitInfo
	
	return OutfitInfo and (OutfitInfo.creatingUniverseId ~= nil and string.len(OutfitInfo.creatingUniverseId) > 0)
end

function ItemCard.shouldProvideControlsToViewItemDetails(p1): boolean
	return (not p1:isOutfit() or p1:wasCreatedInExperience()) and (if p1.props.isWearingAssetOrOutfit then true else false)
end

function ItemCard.renderDetailsButton(p1, _, _)
	-- upvalues: IsTenFootInterface (copy), RoactModule (copy), ItemTileDetailButtonModule (copy)
	return if p1:shouldProvideControlsToViewItemDetails() then if IsTenFootInterface then nil else RoactModule.createElement(ItemTileDetailButtonModule, { activateButton = p1.activateDetailsButton }) else nil
end

function ItemCard.render(p1)
	-- upvalues: WithLocalizationFunction (copy), WithStyleFunction (copy)
	return WithLocalizationFunction({ more = "CommonUI.Features.Label.More" })(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function ItemCard.renderWithProviders(p1, p2, p3)
	-- upvalues: RoactGamepadModule (copy), AddOutfitButton (copy), RoactModule (copy), SaveTile (copy), Images (copy), ConstantsModule1 (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ConstantsModule2 (copy), UtilsModule (copy), CatalogItemCardStatusIconTypeEnum (copy), ReactModule (copy), CatalogItemCard (copy), Focusable (copy), ItemTile (copy)
	local ItemId = p1.props.itemId
	local Name = p1.props.name
	local Thumbnail = p1.props.thumbnail
	local IsWearingAssetOrOutfit = p1.props.isWearingAssetOrOutfit
	local ItemData = p1.props.itemData
	
	return RoactGamepadModule.withFocusController(function(p4)
		-- upvalues: ItemId (copy), AddOutfitButton (upval), RoactModule (upval), SaveTile (upval), Images (upval), p1 (copy), ConstantsModule1 (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), ConstantsModule2 (upval), IsWearingAssetOrOutfit (copy), RoactGamepadModule (upval), ItemData (copy), UtilsModule (upval), CatalogItemCardStatusIconTypeEnum (upval), ReactModule (upval), CatalogItemCard (upval), Focusable (upval), ItemTile (upval), Name (copy), Thumbnail (copy), p2 (copy), p3 (copy)
		if ItemId == AddOutfitButton then
			return RoactModule.createElement(SaveTile, {
				thumbnail = Images["icons/menu/customize"],
				onActivated = function()
					-- upvalues: p1 (upval), ConstantsModule1 (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p4 (copy)
					p1:openCreateOrUpdateCostumeMenu(function()
						-- upvalues: p1 (upval), ConstantsModule1 (upval), FFlagAXMigrateAXToGlobalAutofocus (upval), p4 (upval)
						local IsLastInputGroupMatch = p1.props.lastInputGroup == ConstantsModule1.InputType.Gamepad
						
						if not FFlagAXMigrateAXToGlobalAutofocus and IsLastInputGroupMatch then
							p4.captureFocus()
						end
					end)
				end,
				thumbnailTransparency = 0,
				[RoactModule.Ref] = p1.addOutfitButtonRef
			})
		end
		local InputBindings = {
			SelectSlot = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p1.onItemClick, {
				key = if p1.props.categoryInfo.PageType == ConstantsModule2.PageType.Emotes then if IsWearingAssetOrOutfit then "Feature.Avatar.Action.UnslotEmote" else "Feature.Avatar.Action.SlotEmote" else nil
			}),
			MoreDetails = if p1:shouldProvideControlsToViewItemDetails() then RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonX, p1.activateDetailsButton, { key = "CommonUI.Features.Label.More" }) else nil
		}
		local ItemTileTitleMaxLines = 0
		local TitleFontStyle = nil
		
		if not p1.props.categoryInfo.HideTextUnderTile then
			ItemTileTitleMaxLines = ConstantsModule2.ItemTileTitleMaxLines
			TitleFontStyle = p1.props.titleFontStyle
		end
		return if ItemData and UtilsModule.isModerationPendingOrRejected(ItemData.moderationStatus) then ReactModule.createElement(CatalogItemCard, {
			Size = UDim2.fromScale(1, 1),
			AutomaticSize = Enum.AutomaticSize.Y,
			isSelected = IsWearingAssetOrOutfit,
			onActivated = p1.onItemClick,
			ref = p1.textButtonRef,
			itemStatus = {
				type = "placeholder",
				iconType = if ItemData.moderationStatus == Enum.ModerationStatus.NotReviewed then CatalogItemCardStatusIconTypeEnum.PendingModeration else CatalogItemCardStatusIconTypeEnum.Moderated
			}
		}) else RoactModule.createElement(Focusable[ItemTile], {
			LayoutOrder = p1.props.layoutOrder,
			isSelected = IsWearingAssetOrOutfit,
			itemIconType = p1:getItemIconType(),
			onActivated = p1.onItemClick,
			name = Name,
			titleTextLineCount = ItemTileTitleMaxLines,
			titleFontStyle = TitleFontStyle,
			thumbnail = Thumbnail,
			renderTileInset = function()
				-- upvalues: p1 (upval), p2 (upval), p3 (upval)
				return p1:renderDetailsButton(p2, p3)
			end,
			inputBindings = InputBindings,
			statusStyle = p1:getItemStatusStyle(),
			key = ItemId,
			textButtonRef = p1.textButtonRef,
			[RoactModule.Ref] = p1.thumbnailRef,
			[ReactModule.Tag] = p1.props.impressionsTag
		})
	end)
end

function ItemCard.openCreateOrUpdateCostumeMenu(p1, OnOverlayClosed)
	-- upvalues: AvatarScreen (copy)
	local Value = p1.addOutfitButtonRef:getValue()
	
	if Value then
		local NewAbsolutePosition = Value.AbsolutePosition + Value.AbsoluteSize * Vector2.new(0.5, 0.5)
		p1.props.navigateWithLock(function()
			-- upvalues: p1 (copy), AvatarScreen (upval), NewAbsolutePosition (copy), OnOverlayClosed (copy)
			p1.props.navigation.navigate(AvatarScreen.CreateOrUpdateOutfitMenu, {
				saveTilePosition = NewAbsolutePosition,
				onOverlayClosed = OnOverlayClosed
			})
		end)
		
		return
	end
end

function ItemCard.checkFetchInfo(p1)
	-- upvalues: AddOutfitButton (copy), ConstantsModule2 (copy)
	if p1:isOutfit() then return end
	local ItemId = p1.props.itemId
	
	if ItemId == AddOutfitButton then return end
	if ItemId and not p1.props.name then
		p1.props.fetchItemInfo(p1.props.networking, p1.props.appAnalytics, ItemId, ConstantsModule2.ItemType.Asset)
	end
end

function ItemCard.setImpressionAttributes(p1)
	-- upvalues: OrganicEventImpressionsSchema (copy), ImpressionsUtil (copy)
	local Value = p1.thumbnailRef and p1.thumbnailRef:getValue()
	
	if p1.props.impressionsTag and Value then
		Value:SetAttribute(p1.props.impressionsTag, p1.props.itemId)
		ImpressionsUtil.writeItemAttributes(OrganicEventImpressionsSchema[p1.props.impressionsSchema], Value, p1.props)
	end
end

function ItemCard.addUnifiedEventLogging(p1)
	-- upvalues: AddUnifiedEventLoggingFunction (copy), UnifiedEventLogEnums (copy), UtilsModule (copy), FFlagAXNegativeAvatarSequenceFeatures (copy), FFlagAXMISEnableMultiShoppingUnifiedEvents (copy), UnifiedEventLogConstants (copy)
	AddUnifiedEventLoggingFunction(p1.textButtonRef, {
		action = if p1.props.isWearingAssetOrOutfit then UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_DESELECTED else UnifiedEventLogEnums.MarketplaceUnifiedAction.ITEM_SELECTED,
		itemId = p1.props.itemId,
		itemType = if p1.props.itemType == "Asset" then UnifiedEventLogEnums.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnums.MarketplaceUnifiedItemType.BUNDLE,
		assetType = p1.props.itemData and p1.props.itemData.assetType or nil,
		gridPositionRow = if p1.props.gridInformation then p1.props.gridInformation.row else nil,
		gridPositionColumn = if p1.props.gridInformation then p1.props.gridInformation.column else nil,
		category = if p1.props.categoryInfo.Category then UtilsModule.getAvatarEditorCategoryInfo(p1.props.categoryInfo.Category).Name else nil,
		subcategory = if p1.props.categoryInfo.Category and p1.props.categoryInfo.Subcategory then UtilsModule.getAvatarEditorCategoryInfo(p1.props.categoryInfo.Category, p1.props.categoryInfo.Subcategory).Name else nil,
		isOwnedItem = if FFlagAXNegativeAvatarSequenceFeatures then true else nil
	}, {
		hasDeferredActions = not FFlagAXMISEnableMultiShoppingUnifiedEvents or nil,
		sessionTagName = UnifiedEventLogConstants.L2_SESSION_TAG_NAME
	})
end

function ItemCard.didUpdate(p1, p2)
	p1:setImpressionAttributes()
	p1:addUnifiedEventLogging()
	
	if p2.itemId ~= p1.props.itemId then
		p1:checkFetchInfo()
		
		return
	end
end

function ItemCard.didMount(p1)
	p1:setImpressionAttributes()
	p1:addUnifiedEventLogging()
	p1:checkFetchInfo()
end

local WithAdaptiveScrollingResult = WithAdaptiveScrollingFunction((WithLastInputGroupModule((WithAvatarRouteModule((WithNavigationFunction(RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: UtilsModule (copy), AXItemCardShouldNotBeAbleToActivateUntilReady (copy), ConstantsModule2 (copy), ItemDataModule (copy), SelectHasAvatarDataModule (copy), Constants (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), ConstantsModule (copy), AvatarScreen (copy), FullView (copy), GetFFlagAXEnableSlotBasedEditorModule (copy), SelectIsPortraitModule (copy)
	local ItemId = p2.itemId
	local AvatarEditorCategoryInfoFromState = UtilsModule.getAvatarEditorCategoryInfoFromState(p1)
	local OutfitInfo = p1.AvatarExperience.AvatarEditor.OutfitInfos[ItemId]
	local Inverted = if AXItemCardShouldNotBeAbleToActivateUntilReady then true else nil
	local AssetType = nil
	local Name = nil
	local Text = nil
	local Bundle = if p2.isOutfit then ConstantsModule2.ItemType.Bundle else ConstantsModule2.ItemType.Asset
	local ItemDataModuleResult = ItemDataModule(p1.AvatarExperience.Common, p2.itemId, Bundle)
	local IsEditable = if OutfitInfo then OutfitInfo.isEditable else false
	local SelectHasAvatarDataModuleResult = if AXItemCardShouldNotBeAbleToActivateUntilReady then SelectHasAvatarDataModule(p1) else nil
	
	if ItemId then
		if p2.isOutfit then
			Name = OutfitInfo and OutfitInfo.name or nil
			Text = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, Constants.RbxthumbTypes.Outfit, 150)
			
			if OutfitInfo then
				Text ..= "&filters=" .. OutfitInfo.updateCounter
				
				if UtilsModule.isModerationPendingOrRejected(OutfitInfo.moderationStatus) then
					Text = ConstantsModule.BrokenAvatarThumbnail
				end
			end
			Inverted = if AXItemCardShouldNotBeAbleToActivateUntilReady then not SelectHasAvatarDataModuleResult else nil
		else
			AssetType = ItemDataModuleResult and ItemDataModuleResult.assetType or nil
			Name = ItemDataModuleResult and ItemDataModuleResult.name or nil
			Text = GetRbxthumbWithTypeSizeAndOptionsFunction(ItemId, Constants.RbxthumbTypes.Asset, 150)
			
			if ItemDataModuleResult and ItemDataModuleResult.outfitModerationStatus then
				Text ..= `&filters=__{ItemDataModuleResult.outfitModerationStatus}__`
			end
			if ItemDataModuleResult and ItemDataModuleResult.moderationStatus then
				Text ..= "&filters=" .. ItemDataModuleResult.updateCounter or 0
			end
			Inverted = if AXItemCardShouldNotBeAbleToActivateUntilReady then not ItemDataModuleResult or not SelectHasAvatarDataModuleResult else nil
		end
	end
	return {
		itemData = ItemDataModuleResult,
		itemType = Bundle,
		isEditable = IsEditable,
		assetTypeId = AssetType,
		name = Name,
		thumbnail = Text,
		isUIFullView = if GetFFlagAXEnableSlotBasedEditorModule() then p1.AvatarExperience.Common.FullView[p2.avatarRoute.opaque.name] == FullView.UIFullView else p1.AvatarExperience.Common.FullView[AvatarScreen.AvatarEditor] == FullView.UIFullView,
		outfitInfo = OutfitInfo,
		categoryInfo = AvatarEditorCategoryInfoFromState,
		avatarType = p1.AvatarExperience.AvatarEditor.Character.AvatarType,
		hasAvatarData = if AXItemCardShouldNotBeAbleToActivateUntilReady then SelectHasAvatarDataModuleResult else SelectHasAvatarDataModule(p1),
		isPortrait = SelectIsPortraitModule(p1),
		disabled = if AXItemCardShouldNotBeAbleToActivateUntilReady then Inverted else nil
	}
end, function(Callback)
	-- upvalues: FetchAssetOrBundleInfoModule (copy), ToggleEquipAssetModule (copy), EquipOutfitModule (copy), SendAnalyticsModule (copy), SetFullViewModule (copy), NavigateWithLockFunction (copy), OpenItemDetailsModule (copy)
	return {
		fetchItemInfo = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), FetchAssetOrBundleInfoModule (upval)
			return Callback(FetchAssetOrBundleInfoModule(p1, p2, p3, p4))
		end,
		toggleEquipAsset = function(p1, p2, p3)
			-- upvalues: Callback (copy), ToggleEquipAssetModule (upval)
			return Callback(ToggleEquipAssetModule(p1, p2, p3))
		end,
		equipOutfitThunk = function(OutfitInfo, Analytics, Navigation, IsSelected)
			-- upvalues: Callback (copy), EquipOutfitModule (upval)
			return Callback(EquipOutfitModule({
				outfitInfo = OutfitInfo,
				analytics = Analytics,
				navigation = Navigation,
				isSelected = IsSelected
			}))
		end,
		sendAnalytics = function(p1, p2, p3)
			-- upvalues: Callback (copy), SendAnalyticsModule (upval)
			Callback(SendAnalyticsModule(p1, p2, p3))
		end,
		setFullView = function(p1, p2, p3)
			-- upvalues: Callback (copy), SetFullViewModule (upval)
			Callback(SetFullViewModule(p1, p2, p3))
		end,
		navigateWithLock = function(p1)
			-- upvalues: Callback (copy), NavigateWithLockFunction (upval)
			Callback(NavigateWithLockFunction(p1))
		end,
		openItemDetails = function(p1)
			-- upvalues: Callback (copy), OpenItemDetailsModule (upval)
			Callback(OpenItemDetailsModule(p1))
		end
	}
end)((RoactServices.connect({
	appAnalytics = RoactAnalyticsModule,
	analytics = AnalyticsModule,
	catalogAnalytics = AnalyticsModule2,
	avatarExperienceAnalytics = AnalyticsModule1,
	networking = RoactNetworkingModule
})(ItemCard))), nil)))))))

return if FFlagAXMigrateAXToGlobalAutofocus then WithAdaptiveScrollingResult else function(p1)
	-- upvalues: RoactGamepadModule (copy), RoactModule (copy), WithAdaptiveScrollingResult (ref), CryoModule (copy)
	return RoactGamepadModule.withFocusController(function(FocusController)
		-- upvalues: RoactModule (upval), WithAdaptiveScrollingResult (upval), CryoModule (upval), p1 (copy)
		return RoactModule.createElement(WithAdaptiveScrollingResult, CryoModule.Dictionary.join(p1, { focusController = FocusController }))
	end)
end