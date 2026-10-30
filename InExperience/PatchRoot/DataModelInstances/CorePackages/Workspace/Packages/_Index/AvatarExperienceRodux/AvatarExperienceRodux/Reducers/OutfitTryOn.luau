local AvatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local Parent = AvatarExperienceRodux.Parent
local CryoModule = require(Parent.Cryo)
local AvatarExperienceModelModule = require(Parent.AvatarExperienceModel)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local TutilsModule = require(Parent.tutils)
local _ = require(AvatarExperienceRodux.Types.RoduxTypes)
local _ = require(AvatarExperienceRodux.Types.OutfitTryOn)
local ReducerUtilsModule = require(AvatarExperienceRodux.Utils.ReducerUtils)
local FindItemInTryOnItemsFunction = AvatarExperienceCommonModule.Utils.findItemInTryOnItems
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local GetFilteredTryOnItemsFunction = AvatarExperienceCommonModule.Utils.getFilteredTryOnItems
local RemoveMakeupAssetsFromTryOnsIfOverLimitFunction = AvatarExperienceCommonModule.Utils.removeMakeupAssetsFromTryOnsIfOverLimit
local ASSETTYPEIDSTRINGTOMAKEUPTYPE = AvatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local LAYEREDMAKEUPORDER = AvatarExperienceCommonModule.Constants.LAYERED_MAKEUP_ORDER
local MAKEUPLOOKASSETTYPES = AvatarExperienceCommonModule.Constants.MAKEUP_LOOK_ASSET_TYPES
local LOOKTYPE = AvatarExperienceCommonModule.Constants.LOOK_TYPE
local Constants = AvatarExperienceCommonModule.Constants
local ItemTypeEnum = AvatarExperienceModelModule.Enums.ItemTypeEnum
local ASSETTYPENAMETOIDSTRING = Constants.ASSET_TYPE_NAME_TO_ID_STRING
local BundleTypeIdStrings = AvatarExperienceModelModule.Constants.BundleTypeIdStrings
local BUNDLETYPEIDSTRINGTONAMEFORBACKEND = Constants.BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND
local LAYEREDCLOTHINGORDER = Constants.LAYERED_CLOTHING_ORDER
local LAYEREDASSETTYPES = Constants.LAYERED_ASSET_TYPES
local ASSETTYPETOACCESSORYTYPE = Constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local FFlagAXCatalogMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local FFlagAXMISEnableMultiShopping = AvatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagParseHeadShapeFromAPIResponse = AvatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local FFlagHeadRefinementFacialAnimationToggle = AvatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local FFlagAXPhotoboothMomentsPage = AvatarExperienceFlagsModule.FFlagAXPhotoboothMomentsPage
local FFlagAXTryOnWithoutEquippedBody = AvatarExperienceFlagsModule.FFlagAXTryOnWithoutEquippedBody
local FFlagAXPhotoboothMomentsTryOnAccessoryAdjustments = AvatarExperienceFlagsModule.FFlagAXPhotoboothMomentsTryOnAccessoryAdjustments
local Count = 0

local function formatItem(JoinResult, IsUnequipped)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), ItemTypeEnum (copy), BundleTypeIdStrings (copy), ASSETTYPENAMETOIDSTRING (copy), FFlagParseHeadShapeFromAPIResponse (copy), FFlagHeadRefinementFacialAnimationToggle (copy), FFlagAXDurablesForMIS (copy), ASSETTYPETOACCESSORYTYPE (copy), LAYEREDCLOTHINGORDER (copy), LAYEREDASSETTYPES (copy), CryoModule (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), LAYEREDMAKEUPORDER (copy), Count (ref)
	local ReceivedBundleInfo: boolean = if JoinResult.receivedBundleInfo then true else false
	local BundleInfo = JoinResult.bundleInfo
	
	if FFlagAXMISEnableMultiShopping and JoinResult.bundleItems and not ReceivedBundleInfo then
		local t = {}
		
		for _, bundleItem in JoinResult.bundleItems do
			if bundleItem.type == ItemTypeEnum.Asset then
				local AssetType = bundleItem.assetType
				
				if not AssetType and JoinResult.itemSubType == BundleTypeIdStrings.DynamicHead then
					AssetType = ASSETTYPENAMETOIDSTRING.DynamicHead
				end
				if AssetType then
					local config = { assetType = AssetType }
					
					if FFlagParseHeadShapeFromAPIResponse and bundleItem.meta and bundleItem.meta.headShape ~= nil then
						config.headShape = bundleItem.meta.headShape
					end
					if FFlagHeadRefinementFacialAnimationToggle and bundleItem.meta and bundleItem.meta.staticFacialAnimation ~= nil then
						config.staticFacialAnimation = bundleItem.meta.staticFacialAnimation
					end
					t[bundleItem.id] = config
				end
			end
		end
		BundleInfo = t
		ReceivedBundleInfo = true
	end
	local JoinResult1 = {
		version = "1",
		itemId = JoinResult.itemId,
		itemType = JoinResult.itemType,
		itemSubType = JoinResult.itemSubType,
		selectedInTryOnManager = JoinResult.selectedInTryOnManager,
		isUnequipped = IsUnequipped,
		receivedBundleInfo = ReceivedBundleInfo,
		bundleInfo = if FFlagAXMISEnableMultiShopping then BundleInfo else JoinResult.bundleInfo,
		widgetInfo = JoinResult.widgetInfo,
		isRecolorable = JoinResult.isRecolorable,
		selectedTimedOptionIndex = if FFlagAXDurablesForMIS then JoinResult.selectedTimedOptionIndex else nil
	}
	
	if ASSETTYPETOACCESSORYTYPE[JoinResult.itemSubType] then
		JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
			order = JoinResult.overrideOrder or LAYEREDCLOTHINGORDER[JoinResult.itemSubType],
			isLayered = LAYEREDASSETTYPES[JoinResult.itemSubType] ~= nil
		})
	elseif ASSETTYPEIDSTRINGTOMAKEUPTYPE[JoinResult.itemSubType] then
		JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
			isLayered = true,
			order = JoinResult.overrideOrder or LAYEREDMAKEUPORDER[JoinResult.itemSubType]
		})
	end
	if not IsUnequipped then
		JoinResult1.itemRecency = Count
		Count += 1
	end
	return JoinResult1
end

local function formatItemFromLookOutfit(JoinResult, LookType, LookId, OutfitId)
	-- upvalues: FFlagAXPhotoboothMomentsPage (copy), FFlagAXTryOnWithoutEquippedBody (copy), ASSETTYPETOACCESSORYTYPE (copy), LAYEREDCLOTHINGORDER (copy), LAYEREDASSETTYPES (copy), CryoModule (copy), FFlagAXPhotoboothMomentsTryOnAccessoryAdjustments (copy), ASSETTYPEIDSTRINGTOMAKEUPTYPE (copy), LAYEREDMAKEUPORDER (copy), LOOKTYPE (copy), FFlagAXCatalogMakeupSupport (copy), Count (ref)
	local JoinResult1 = {
		version = "1",
		isUnequipped = false,
		receivedBundleInfo = false,
		itemId = JoinResult.itemId,
		itemType = JoinResult.itemType,
		itemSubType = JoinResult.itemSubType,
		selectedInTryOnManager = JoinResult.isNotSelectable ~= true,
		lookId = LookId,
		outfitId = if FFlagAXPhotoboothMomentsPage then OutfitId else nil,
		headShape = if FFlagAXTryOnWithoutEquippedBody then JoinResult.headShape else nil,
		staticFacialAnimation = if FFlagAXTryOnWithoutEquippedBody then JoinResult.staticFacialAnimation else nil
	}
	
	if ASSETTYPETOACCESSORYTYPE[JoinResult.itemSubType] then
		JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
			order = JoinResult.order or LAYEREDCLOTHINGORDER[JoinResult.itemSubType],
			isLayered = LAYEREDASSETTYPES[JoinResult.itemSubType] ~= nil
		})
		
		if FFlagAXPhotoboothMomentsTryOnAccessoryAdjustments and OutfitId ~= nil then
			JoinResult1.position = JoinResult.position
			JoinResult1.rotation = JoinResult.rotation
			JoinResult1.scale = JoinResult.scale
		end
	elseif ASSETTYPEIDSTRINGTOMAKEUPTYPE[JoinResult.itemSubType] then
		JoinResult1 = CryoModule.Dictionary.join(JoinResult1, {
			isLayered = true,
			order = JoinResult.order or LAYEREDMAKEUPORDER[JoinResult.itemSubType]
		})
	end
	JoinResult1.itemRecency = if LookType == LOOKTYPE.Avatar or FFlagAXCatalogMakeupSupport and LookType == LOOKTYPE.Makeup then JoinResult.tryOnItemOrder else Count
	Count += 1
	
	return JoinResult1
end

local function formatBundleFromLookOutfit(JoinResult, LookId)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), LAYEREDCLOTHINGORDER (copy), LAYEREDMAKEUPORDER (copy), FFlagParseHeadShapeFromAPIResponse (copy), Count (ref)
	local config = {
		version = "1",
		isUnequipped = false,
		receivedBundleInfo = false,
		selectedInTryOnManager = JoinResult.isNotSelectable ~= true,
		itemType = JoinResult.itemType,
		itemId = JoinResult.itemId,
		itemSubType = if FFlagAXMISEnableMultiShopping then JoinResult.itemSubType else nil,
		lookId = LookId
	}
	local BundleInfo = {}
	
	for _, item in JoinResult.items do
		BundleInfo[item.itemId] = {
			assetType = item.itemSubType,
			order = LAYEREDCLOTHINGORDER[item.itemSubType] or LAYEREDMAKEUPORDER[item.itemSubType],
			headShape = if FFlagParseHeadShapeFromAPIResponse then item.headShape else nil
		}
	end
	config.bundleInfo = BundleInfo
	config.itemRecency = JoinResult.tryOnItemOrder or Count
	Count += 1
	
	return config
end

local function removeItem(p1, TryOnItems, JoinResult)
	-- upvalues: GetTryOnItemReducerKeyFunction (copy), ASSETTYPENAMETOIDSTRING (copy), ItemTypeEnum (copy), BUNDLETYPEIDSTRINGTONAMEFORBACKEND (copy), CryoModule (copy)
	local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(JoinResult.itemId, JoinResult.itemType)
	local TryOnItem = TryOnItems[TryOnItemReducerKey]
	TryOnItem.isUnequipped = true
	local IsItemSubTypeMatch = JoinResult.itemSubType == ASSETTYPENAMETOIDSTRING.Face
	local IsBody: boolean = JoinResult.itemType == ItemTypeEnum.Bundle and BUNDLETYPEIDSTRINGTONAMEFORBACKEND[JoinResult.itemSubType] == "Body"
	
	return CryoModule.Dictionary.join(p1, {
		TryOnItems = CryoModule.Dictionary.join(TryOnItems, { [TryOnItemReducerKey] = CryoModule.None }),
		LastToggledItem = TryOnItem,
		LastTryOnClassicHeadShape = if IsItemSubTypeMatch then CryoModule.None else nil,
		BodyColor3s = if IsBody then CryoModule.None else nil,
		BodyPartColorRangeIds = if IsBody then CryoModule.None else nil
	})
end

local function _(JoinResult): boolean
	-- upvalues: ItemTypeEnum (copy), ASSETTYPENAMETOIDSTRING (copy), BundleTypeIdStrings (copy)
	return JoinResult.itemType == ItemTypeEnum.Asset and JoinResult.itemSubType == ASSETTYPENAMETOIDSTRING.EmoteAnimation or JoinResult.itemType == ItemTypeEnum.Bundle and JoinResult.itemSubType == tostring(BundleTypeIdStrings.Animations)
end

local function getTryOnItemsContainsRecolorableBody(JoinResult): boolean
	-- upvalues: BUNDLETYPEIDSTRINGTONAMEFORBACKEND (copy)
	for _, JoinResult1 in JoinResult do
		if JoinResult1.itemType == "Bundle" and BUNDLETYPEIDSTRINGTONAMEFORBACKEND[JoinResult1.itemSubType] == "Body" and JoinResult1.isRecolorable then
			return true
		end
	end
	return false
end

local function getTryOnItemsMakeupAndAvatarLookIds(TryOnItems)
	-- upvalues: CryoModule (copy), MAKEUPLOOKASSETTYPES (copy)
	local None = CryoModule.None
	local None1 = CryoModule.None
	
	for _, tryOnItem in TryOnItems do
		if tryOnItem.lookId and not MAKEUPLOOKASSETTYPES[tryOnItem.itemSubType] then
			None = tryOnItem.lookId
		end
		if tryOnItem.lookId and MAKEUPLOOKASSETTYPES[tryOnItem.itemSubType] then
			None1 = tryOnItem.lookId
		end
	end
	return None, None1
end

local function reconcileAllTryOnState(JoinResult)
	-- upvalues: FFlagAXMISEnableMultiShopping (copy), getTryOnItemsMakeupAndAvatarLookIds (copy), getTryOnItemsContainsRecolorableBody (copy), FFlagAXPhotoboothMomentsPage (copy), CryoModule (copy), TutilsModule (copy), LOOKTYPE (copy), FFlagAXTryOnWithoutEquippedBody (copy)
	local TryOnItems = JoinResult.TryOnItems
	local v1 = nil
	local v2 = nil
	
	if FFlagAXMISEnableMultiShopping then
		v1, v57 = getTryOnItemsMakeupAndAvatarLookIds(TryOnItems)
	end
	local TryOnItemsContainsRecolorableBody = getTryOnItemsContainsRecolorableBody(TryOnItems)
	
	if FFlagAXMISEnableMultiShopping then
		TryOnItemsContainsRecolorableBody = TryOnItemsContainsRecolorableBody or v1 ~= nil
	end
	if FFlagAXPhotoboothMomentsPage then
		TryOnItemsContainsRecolorableBody = TryOnItemsContainsRecolorableBody or JoinResult.OutfitId ~= nil
	end
	local IsFieldCountResultMatch = if FFlagAXMISEnableMultiShopping then TutilsModule.fieldCount(TryOnItems) == 0 else nil
	local None = if FFlagAXMISEnableMultiShopping then if IsFieldCountResultMatch then CryoModule.None else JoinResult.LookType else nil
	local None1 = if FFlagAXMISEnableMultiShopping then if IsFieldCountResultMatch or not v2 then CryoModule.None else LOOKTYPE.Makeup else nil
	
	return CryoModule.Dictionary.join(JoinResult, {
		BodyColor3s = if TryOnItemsContainsRecolorableBody then JoinResult.BodyColor3s else CryoModule.None,
		BodyPartColorRangeIds = if TryOnItemsContainsRecolorableBody then JoinResult.BodyPartColorRangeIds else CryoModule.None,
		DefaultTryOnBodyColorsToggled = if TryOnItemsContainsRecolorableBody then JoinResult.DefaultTryOnBodyColorsToggled else false,
		LookId = if FFlagAXMISEnableMultiShopping then v1 else nil,
		LookType = if FFlagAXMISEnableMultiShopping then None else nil,
		MakeupLookId = if FFlagAXMISEnableMultiShopping then v2 else nil,
		MakeupLookType = if FFlagAXMISEnableMultiShopping then None1 else nil,
		ShouldTryOnWithoutEquippedItems = if FFlagAXMISEnableMultiShopping then not IsFieldCountResultMatch and JoinResult.ShouldTryOnWithoutEquippedItems else nil,
		ShouldTryOnWithoutEquippedBody = if FFlagAXTryOnWithoutEquippedBody then not IsFieldCountResultMatch and JoinResult.ShouldTryOnWithoutEquippedBody else nil
	})
end

local Tbl = {
	DefaultTryOnBodyColorsToggled = false,
	LookId = nil,
	LookType = nil,
	MakeupLookId = nil,
	MakeupLookType = nil,
	LastToggledLookType = nil,
	LastTryOnClassicHeadShape = nil,
	BackgroundPreview = nil,
	AvatarType = nil,
	OutfitId = nil,
	TryOnItems = {},
	OutfitIdMap = {},
	ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil,
	ShouldTryOnWithoutEquippedBody = not FFlagAXTryOnWithoutEquippedBody and nil
}

return require(Parent.Rodux).createReducer(Tbl, {
	[require(AvatarExperienceRodux.Actions.TryOnColorUpdated).name] = function(p1, p2)
		-- upvalues: Tbl (copy)
		local Copy = table.clone(p1 or Tbl)
		Copy.BodyColor3s = p2.colors
		Copy.BodyPartColorRangeIds = p2.bodyPartColorRangeIds
		
		return Copy
	end,
	[require(AvatarExperienceRodux.Actions.ToggleTryOn).name] = function(p1, JoinResult)
		-- upvalues: Tbl (copy), GetTryOnItemReducerKeyFunction (copy), FFlagAXMISEnableMultiShopping (copy), reconcileAllTryOnState (copy), removeItem (copy), ReducerUtilsModule (copy), formatItem (copy), GetFilteredTryOnItemsFunction (copy), ItemTypeEnum (copy), ASSETTYPENAMETOIDSTRING (copy), BundleTypeIdStrings (copy), CryoModule (copy), getTryOnItemsContainsRecolorableBody (copy), FFlagAXPhotoboothMomentsPage (copy), FFlagAXCatalogMakeupSupport (copy), RemoveMakeupAssetsFromTryOnsIfOverLimitFunction (copy)
		local Tbl1 = if p1 then p1 else Tbl
		local TryOnItems = Tbl1.TryOnItems or {}
		local HasLookId = Tbl1.LookId ~= nil
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(JoinResult.itemId, JoinResult.itemType)
		
		if if FFlagAXMISEnableMultiShopping then TryOnItems[TryOnItemReducerKey] ~= nil else TryOnItems[TryOnItemReducerKey] ~= nil and not HasLookId then
			return if FFlagAXMISEnableMultiShopping then reconcileAllTryOnState(removeItem(Tbl1, TryOnItems, JoinResult)) else removeItem(Tbl1, TryOnItems, JoinResult)
		end
		if FFlagAXMISEnableMultiShopping and JoinResult.resetTryOnsBeforeToggleOn then
			TryOnItems = {}
		end
		local FilterTryOnsResult = ReducerUtilsModule.filterTryOns(TryOnItems, JoinResult)
		local FormatItemResult = formatItem(JoinResult, false)
		
		if FFlagAXMISEnableMultiShopping then
			FilterTryOnsResult = GetFilteredTryOnItemsFunction(TryOnItems, FormatItemResult)
		end
		local FormatItemResult1 = if FormatItemResult.itemType == ItemTypeEnum.Asset and FormatItemResult.itemSubType == ASSETTYPENAMETOIDSTRING.EmoteAnimation or FormatItemResult.itemType == ItemTypeEnum.Bundle and FormatItemResult.itemSubType == tostring(BundleTypeIdStrings.Animations) then FormatItemResult else nil
		
		if not FFlagAXMISEnableMultiShopping and HasLookId then
			return CryoModule.Dictionary.join(Tbl1, {
				DefaultTryOnBodyColorsToggled = false,
				TryOnItems = { [JoinResult.itemId] = FormatItemResult },
				LastToggledItem = FormatItemResult,
				LastAnimOrEmoteToggledItem = FormatItemResult1,
				LookId = CryoModule.None,
				BodyColor3s = {},
				BodyPartColorRangeIds = CryoModule.None
			})
		end
		local JoinResult1 = CryoModule.Dictionary.join(FilterTryOnsResult, { [TryOnItemReducerKey] = FormatItemResult })
		local TryOnItemsContainsRecolorableBody = getTryOnItemsContainsRecolorableBody(JoinResult1)
		
		if FFlagAXPhotoboothMomentsPage then
			TryOnItemsContainsRecolorableBody = TryOnItemsContainsRecolorableBody or Tbl1.OutfitId ~= nil
		end
		local JoinResult2 = CryoModule.Dictionary.join(Tbl1, {
			TryOnItems = JoinResult1,
			LastToggledItem = FormatItemResult,
			LastAnimOrEmoteToggledItem = FormatItemResult1,
			BodyColor3s = if TryOnItemsContainsRecolorableBody then Tbl1.BodyColor3s else CryoModule.None,
			BodyPartColorRangeIds = if TryOnItemsContainsRecolorableBody then Tbl1.BodyPartColorRangeIds else CryoModule.None,
			DefaultTryOnBodyColorsToggled = if TryOnItemsContainsRecolorableBody then Tbl1.DefaultTryOnBodyColorsToggled else false
		})
		
		if not FFlagAXMISEnableMultiShopping then
			return JoinResult2
		end
		if FFlagAXCatalogMakeupSupport then
			JoinResult1 = RemoveMakeupAssetsFromTryOnsIfOverLimitFunction(JoinResult1)
		end
		JoinResult2 = CryoModule.Dictionary.join(JoinResult2, {
			TryOnItems = JoinResult1,
			LastToggledItem = FormatItemResult,
			LastAnimOrEmoteToggledItem = FormatItemResult1
		})
		
		return reconcileAllTryOnState(JoinResult2)
	end,
	[require(AvatarExperienceRodux.Actions.TryOnClassicHeadShape).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			LastTryOnClassicHeadShape = if p2.headShape then p2.headShape else CryoModule.None
		})
	end,
	[require(AvatarExperienceRodux.Actions.TryOnLooksOutfit).name] = function(p1, p2)
		-- upvalues: Tbl (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy), LOOKTYPE (copy), MAKEUPLOOKASSETTYPES (copy), GetTryOnItemReducerKeyFunction (copy), formatItemFromLookOutfit (copy), FFlagAXPhotoboothMomentsPage (copy), formatBundleFromLookOutfit (copy), CryoModule (copy), FFlagAXTryOnWithoutEquippedBody (copy)
		local Tbl1 = if p1 then p1 else Tbl
		local TryOnItems = {}
		
		if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport and p2.lookType == LOOKTYPE.Makeup then
			TryOnItems = table.clone(Tbl1.TryOnItems)
			
			for i, tryOnItem in TryOnItems do
				if MAKEUPLOOKASSETTYPES[tryOnItem.itemSubType] then
					TryOnItems[i] = nil
				end
			end
		end
		for _, JoinResult in p2.assetItemIdTypeAndSubtype do
			TryOnItems[GetTryOnItemReducerKeyFunction(JoinResult.itemId, JoinResult.itemType)] = formatItemFromLookOutfit(JoinResult, p2.lookType, if FFlagAXMISEnableMultiShopping then p2.lookId else nil, if FFlagAXPhotoboothMomentsPage then p2.outfitId else nil)
		end
		if p2.bundleItemIdTypeAndSubtype ~= nil then
			for _, JoinResult1 in p2.bundleItemIdTypeAndSubtype do
				TryOnItems[GetTryOnItemReducerKeyFunction(JoinResult1.itemId, JoinResult1.itemType)] = formatBundleFromLookOutfit(JoinResult1, if FFlagAXMISEnableMultiShopping then p2.lookId else nil)
			end
		end
		return if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport and p2.lookType == LOOKTYPE.Makeup then CryoModule.Dictionary.join(Tbl1, {
			TryOnItems = TryOnItems,
			MakeupLookId = if p2.lookId then p2.lookId else CryoModule.None,
			MakeupLookType = p2.lookType,
			LastToggledLookType = p2.lookType,
			MakeupLookAnalyticsInfo = if p2.analyticsInfo then p2.analyticsInfo else CryoModule.None
		}) else CryoModule.Dictionary.join(Tbl1, {
			TryOnItems = TryOnItems,
			LookId = if p2.lookId then p2.lookId else CryoModule.None,
			LookAnalyticsInfo = if p2.analyticsInfo then p2.analyticsInfo else CryoModule.None,
			LookType = p2.lookType,
			MakeupLookId = CryoModule.None,
			MakeupLookType = CryoModule.None,
			MakeupLookAnalyticsInfo = CryoModule.None,
			LastToggledLookType = if FFlagAXMISEnableMultiShopping then p2.lookType else nil,
			BodyColor3s = if p2.bodyColor3s then p2.bodyColor3s else CryoModule.None,
			BodyPartColorRangeIds = if p2.bodyPartColorRangeIds then p2.bodyPartColorRangeIds else CryoModule.None,
			DefaultTryOnBodyColorsToggled = CryoModule.None,
			Scale = if p2.scale then p2.scale else CryoModule.None,
			ShouldTryOnWithoutEquippedItems = if FFlagAXMISEnableMultiShopping then p2.lookId ~= nil or FFlagAXPhotoboothMomentsPage and p2.outfitId ~= nil else nil,
			ShouldTryOnWithoutEquippedBody = if FFlagAXTryOnWithoutEquippedBody then p2.shouldTryOnWithoutEquippedBody == true else nil,
			AvatarType = if FFlagAXPhotoboothMomentsPage then if p2.avatarType then p2.avatarType else CryoModule.None else nil,
			OutfitId = if FFlagAXPhotoboothMomentsPage then if p2.outfitId == nil then CryoModule.None else p2.outfitId else nil
		})
	end,
	[require(AvatarExperienceRodux.Actions.SetEquippedInTryOnManager).name] = function(p3, JoinResult)
		-- upvalues: Tbl (copy), GetTryOnItemReducerKeyFunction (copy), CryoModule (copy)
		local Tbl1 = if p3 then p3 else Tbl
		local TryOnItems = Tbl1.TryOnItems or {}
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(JoinResult.itemId, JoinResult.itemType)
		
		return if TryOnItems[TryOnItemReducerKey] == nil then Tbl1 else CryoModule.Dictionary.join(Tbl1, {
			TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
				[TryOnItemReducerKey] = CryoModule.Dictionary.join(TryOnItems[TryOnItemReducerKey], {
					selectedInTryOnManager = JoinResult.selectedInTryOnManager
				})
			})
		})
	end,
	[require(AvatarExperienceRodux.Actions.SetSelectedTimedOption).name] = function(p3, JoinResult)
		-- upvalues: Tbl (copy), GetTryOnItemReducerKeyFunction (copy), CryoModule (copy)
		local Tbl1 = if p3 then p3 else Tbl
		local TryOnItems = Tbl1.TryOnItems or {}
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(JoinResult.itemId, JoinResult.itemType)
		
		return if TryOnItems[TryOnItemReducerKey] == nil then Tbl1 else CryoModule.Dictionary.join(Tbl1, {
			TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
				[TryOnItemReducerKey] = CryoModule.Dictionary.join(TryOnItems[TryOnItemReducerKey], {
					selectedTimedOptionIndex = JoinResult.selectedTimedOptionIndex
				})
			})
		})
	end,
	[require(AvatarExperienceRodux.Actions.RemoveUnselectedItemsFromTryOn).name] = function(p3, _)
		-- upvalues: Tbl (copy), CryoModule (copy)
		local Tbl1 = if p3 then p3 else Tbl
		local TryOnItems = {}
		
		for i, value in Tbl1.TryOnItems or {} do
			if value.selectedInTryOnManager then
				TryOnItems[i] = value
			end
		end
		return CryoModule.Dictionary.join(Tbl1, { TryOnItems = TryOnItems })
	end,
	[require(AvatarExperienceRodux.Actions.RemoveLookFromTryOn).name] = if FFlagAXMISEnableMultiShopping then function(p4, p5)
		-- upvalues: Tbl (copy), FFlagAXCatalogMakeupSupport (copy), CryoModule (copy), FFlagAXTryOnWithoutEquippedBody (copy)
		local Tbl1 = if p4 then p4 else Tbl
		local TryOnItems = {}
		
		for i, value in Tbl1.TryOnItems or {} do
			if value.lookId ~= p5.lookId then
				TryOnItems[i] = value
			end
		end
		return if FFlagAXCatalogMakeupSupport and Tbl1.MakeupLookId == p5.lookId then CryoModule.Dictionary.join(Tbl1, {
			TryOnItems = TryOnItems,
			MakeupLookId = CryoModule.None,
			MakeupLookType = CryoModule.None,
			MakeupLookAnalyticsInfo = CryoModule.None,
			LastToggledLookType = CryoModule.None
		}) else CryoModule.Dictionary.join(Tbl1, {
			ShouldTryOnWithoutEquippedItems = false,
			TryOnItems = TryOnItems,
			LookId = CryoModule.None,
			LookType = CryoModule.None,
			LookAnalyticsInfo = CryoModule.None,
			BodyColor3s = CryoModule.None,
			BodyPartColorRangeIds = CryoModule.None,
			Scale = CryoModule.None,
			LastToggledLookType = CryoModule.None,
			ShouldTryOnWithoutEquippedBody = not FFlagAXTryOnWithoutEquippedBody and nil
		})
	end else nil,
	[require(AvatarExperienceRodux.Actions.RemoveFromTryOn).name] = function(p6, JoinResult)
		-- upvalues: Tbl (copy), FindItemInTryOnItemsFunction (copy), reconcileAllTryOnState (copy), removeItem (copy)
		local Tbl1 = if p6 then p6 else Tbl
		local TryOnItems = Tbl1.TryOnItems or {}
		local ItemInTryOnItems = FindItemInTryOnItemsFunction(TryOnItems, JoinResult.itemId, JoinResult.itemType)
		
		return if ItemInTryOnItems == nil then Tbl1 else reconcileAllTryOnState(removeItem(Tbl1, TryOnItems, ItemInTryOnItems))
	end,
	[require(AvatarExperienceRodux.Actions.RemoveLookItemsFromTryOn).name] = function(p6, p7)
		-- upvalues: Tbl (copy), GetTryOnItemReducerKeyFunction (copy), ItemTypeEnum (copy), CryoModule (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXTryOnWithoutEquippedBody (copy), FFlagAXCatalogMakeupSupport (copy)
		local Tbl1 = if p6 then p6 else Tbl
		
		if p7.lookId == Tbl1.LookId then
			local TryOnItems = Tbl1.TryOnItems or {}
			for _, assetId in p7.assetIds do
				local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(assetId, ItemTypeEnum.Asset)
				
				if TryOnItems[TryOnItemReducerKey] ~= nil then
					TryOnItems = CryoModule.Dictionary.join(TryOnItems, { [TryOnItemReducerKey] = CryoModule.None })
				end
			end
			if p7.bundleIds ~= nil then
				for _, bundleId in p7.bundleIds do
					local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(bundleId, ItemTypeEnum.Bundle)
					
					if TryOnItems[TryOnItemReducerKey] ~= nil then
						TryOnItems = CryoModule.Dictionary.join(TryOnItems, { [TryOnItemReducerKey] = CryoModule.None })
					end
				end
			end
			Tbl1 = CryoModule.Dictionary.join(Tbl1, {
				TryOnItems = TryOnItems,
				LookId = CryoModule.None,
				LookType = CryoModule.None,
				BodyColor3s = CryoModule.None,
				BodyPartColorRangeIds = CryoModule.None,
				Scale = CryoModule.None,
				ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil,
				ShouldTryOnWithoutEquippedBody = not FFlagAXTryOnWithoutEquippedBody and nil
			})
		end
		if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport and p7.lookId == Tbl1.MakeupLookId then
			local TryOnItems = Tbl1.TryOnItems or {}
			for _, assetId1 in p7.assetIds do
				local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(assetId1, ItemTypeEnum.Asset)
				
				if TryOnItems[TryOnItemReducerKey] ~= nil then
					TryOnItems = CryoModule.Dictionary.join(TryOnItems, { [TryOnItemReducerKey] = CryoModule.None })
				end
			end
			if p7.bundleIds ~= nil then
				for _, bundleId1 in p7.bundleIds do
					local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(bundleId1, ItemTypeEnum.Bundle)
					
					if TryOnItems[TryOnItemReducerKey] ~= nil then
						TryOnItems = CryoModule.Dictionary.join(TryOnItems, { [TryOnItemReducerKey] = CryoModule.None })
					end
				end
			end
			Tbl1 = CryoModule.Dictionary.join(Tbl1, {
				TryOnItems = TryOnItems,
				MakeupLookId = CryoModule.None,
				MakeupLookType = CryoModule.None
			})
		end
		return Tbl1
	end,
	[require(AvatarExperienceRodux.Actions.ReceivedBundleInfoForTryOn).name] = function(p8, JoinResult)
		-- upvalues: Tbl (copy), GetTryOnItemReducerKeyFunction (copy), ItemTypeEnum (copy), CryoModule (copy)
		local Tbl1 = if p8 then p8 else Tbl
		local TryOnItems = Tbl1.TryOnItems or {}
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(JoinResult.itemId, ItemTypeEnum.Bundle)
		
		if TryOnItems[TryOnItemReducerKey] then
			local Copy = table.clone(Tbl1.OutfitIdMap or {})
			Copy[JoinResult.itemId] = JoinResult.outfitId
			
			return CryoModule.Dictionary.join(Tbl1, {
				TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
					[TryOnItemReducerKey] = CryoModule.Dictionary.join(TryOnItems[TryOnItemReducerKey], { receivedBundleInfo = true })
				}),
				OutfitIdMap = Copy
			})
		else
			return Tbl1
		end
	end,
	[require(AvatarExperienceRodux.Actions.ClearTryOns).name] = function(p8, p9)
		-- upvalues: FFlagAXPhotoboothMomentsPage (copy), CryoModule (copy), Tbl (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXTryOnWithoutEquippedBody (copy), FFlagAXCatalogMakeupSupport (copy)
		if p8 then
			local RetainTryOnColor = not (if FFlagAXPhotoboothMomentsPage then p8.LookId ~= nil or p8.OutfitId ~= nil else p8.LookId ~= nil) and p9.retainTryOnColor
			
			return CryoModule.Dictionary.join(Tbl, {
				LastTryOnClassicHeadShape = p8.LastTryOnClassicHeadShape,
				DefaultTryOnBodyColorsToggled = if RetainTryOnColor then p8.DefaultTryOnBodyColorsToggled else nil,
				BodyColor3s = if RetainTryOnColor then p8.BodyColor3s else nil,
				BodyPartColorRangeIds = if RetainTryOnColor then p8.BodyPartColorRangeIds else nil,
				OutfitIdMap = if p8 then p8.OutfitIdMap else {},
				ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil,
				ShouldTryOnWithoutEquippedBody = not FFlagAXTryOnWithoutEquippedBody and nil,
				LastToggledLookType = if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport then CryoModule.None else nil
			})
		else
			return Tbl
		end
	end,
	[require(AvatarExperienceRodux.Actions.NavigatedToNonTryOnPage).name] = function(p8, _)
		-- upvalues: Tbl (copy)
		local Copy = table.clone(Tbl)
		
		if p8 and p8.OutfitIdMap then
			Copy.OutfitIdMap = p8.OutfitIdMap
		end
		return Copy
	end,
	[require(AvatarExperienceRodux.Actions.NavigatedToTryOnPage).name] = function(p8, _)
		-- upvalues: Tbl (copy)
		local Copy = table.clone(Tbl)
		
		if p8 and p8.OutfitIdMap then
			Copy.OutfitIdMap = p8.OutfitIdMap
		end
		return Copy
	end,
	[require(AvatarExperienceRodux.Actions.SetBackgroundPreview).name] = function(p8, p9)
		-- upvalues: Tbl (copy)
		local Copy = table.clone(p8 or Tbl)
		Copy.BackgroundPreview = p9.previewKey
		
		return Copy
	end,
	[require(AvatarExperienceRodux.Actions.DefaultTryOnBodyColorsToggled).name] = function(p8, p9)
		-- upvalues: Tbl (copy)
		local Copy = table.clone(p8 or Tbl)
		Copy.DefaultTryOnBodyColorsToggled = p9.state
		
		return Copy
	end,
	[require(AvatarExperienceRodux.Actions.SetOrderForTryOns).name] = function(p8, p9)
		-- upvalues: Tbl (copy), GetTryOnItemReducerKeyFunction (copy), ItemTypeEnum (copy), CryoModule (copy), Constants (copy)
		local ItemIdToOrderMap = p9.itemIdToOrderMap
		local Tbl1 = if p8 then p8 else Tbl
		local TryOnItems = nil
		for i, Order in ItemIdToOrderMap do
			TryOnItems = Tbl1.TryOnItems or {}
			local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(i, ItemTypeEnum.Asset)
			
			if TryOnItems[TryOnItemReducerKey] and TryOnItems[TryOnItemReducerKey].itemType ~= ItemTypeEnum.Bundle then
				Tbl1 = CryoModule.Dictionary.join(Tbl1, {
					TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
						[TryOnItemReducerKey] = CryoModule.Dictionary.join(TryOnItems[TryOnItemReducerKey], { order = Order })
					})
				})
			elseif not TryOnItems[TryOnItemReducerKey] then
				for i1, tryOnItem in TryOnItems do
					if tryOnItem.bundleInfo and tryOnItem.bundleInfo[i] and tryOnItem.itemId ~= Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
						local BundleInfo = tryOnItem.bundleInfo
						Tbl1 = CryoModule.Dictionary.join(p8, {
							TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
								[i1] = CryoModule.Dictionary.join(TryOnItems[i1], {
									bundleInfo = CryoModule.Dictionary.join(BundleInfo, {
										[i] = CryoModule.Dictionary.join(BundleInfo[i], { order = Order })
									})
								})
							})
						})
						break
					end
				end
			end
		end
		return Tbl1
	end,
	[require(AvatarExperienceRodux.Actions.SetAccessoryAdjustments).name] = function(p10, JoinResult)
		-- upvalues: Tbl (copy), CryoModule (copy)
		local Tbl1 = if p10 then p10 else Tbl
		local TryOnItems = Tbl1.TryOnItems or {}
		for i, tryOnItem in TryOnItems do
			if tryOnItem.itemType ~= "Asset" then
				if tryOnItem.itemType == "Bundle" then
					for i1, tryOnItem1 in TryOnItems do
						if tryOnItem1.bundleInfo and tryOnItem1.bundleInfo[JoinResult.itemId] then
							local BundleInfo = tryOnItem1.bundleInfo
							
							return CryoModule.Dictionary.join(p10, {
								TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
									[i1] = CryoModule.Dictionary.join(TryOnItems[i1], {
										bundleInfo = CryoModule.Dictionary.join(BundleInfo, {
											[JoinResult.itemId] = CryoModule.Dictionary.join(BundleInfo[JoinResult.itemId], {
												position = JoinResult.position,
												rotation = JoinResult.rotation,
												scale = JoinResult.scale
											})
										})
									})
								})
							})
						end
					end
				end
			elseif tryOnItem.itemId == JoinResult.itemId then
				return CryoModule.Dictionary.join(Tbl1, {
					TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
						[i] = CryoModule.Dictionary.join(tryOnItem, {
							position = JoinResult.position,
							rotation = JoinResult.rotation,
							scale = JoinResult.scale
						})
					})
				})
			end
		end
		return Tbl1
	end,
	[require(AvatarExperienceRodux.Actions.AddSelectedBundleInfo).name] = function(p11, p12)
		-- upvalues: Tbl (copy), GetTryOnItemReducerKeyFunction (copy), ItemTypeEnum (copy), CryoModule (copy)
		local Tbl1 = if p11 then p11 else Tbl
		local TryOnItems = Tbl1.TryOnItems or {}
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(p12.bundleId, ItemTypeEnum.Bundle)
		
		return if TryOnItems[TryOnItemReducerKey] then CryoModule.Dictionary.join(Tbl1, {
			TryOnItems = CryoModule.Dictionary.join(TryOnItems, {
				[TryOnItemReducerKey] = CryoModule.Dictionary.join(TryOnItems[TryOnItemReducerKey], { bundleInfo = p12.bundleInfo })
			})
		}) else Tbl1
	end,
	[require(AvatarExperienceRodux.Actions.SetOutfitTryOns).name] = function(_, p11)
		return p11.outfitTryOns
	end,
	[require(AvatarExperienceRodux.Actions.RemoveLook).name] = function(p11, p12)
		-- upvalues: Tbl (copy), FFlagAXMISEnableMultiShopping (copy), FFlagAXCatalogMakeupSupport (copy), CryoModule (copy), FFlagAXTryOnWithoutEquippedBody (copy)
		local Tbl1 = if p11 then p11 else Tbl
		
		if p12.lookId == Tbl1.LookId or FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport and p12.lookId == Tbl1.MakeupLookId then
			local TryOnItems = {}
			
			if FFlagAXMISEnableMultiShopping then
				local TryOnItems1 = Tbl1.TryOnItems or {}
				for i, value in TryOnItems1 do
					if value.lookId ~= p12.lookId then
						TryOnItems[i] = value
					end
				end
			end
			if FFlagAXMISEnableMultiShopping and FFlagAXCatalogMakeupSupport then
				if p12.lookId == Tbl1.LookId then
					Tbl1 = CryoModule.Dictionary.join(Tbl1, {
						ShouldTryOnWithoutEquippedItems = false,
						TryOnItems = TryOnItems,
						LookId = CryoModule.None,
						LookType = CryoModule.None,
						BodyColor3s = CryoModule.None,
						BodyPartColorRangeIds = CryoModule.None,
						Scale = CryoModule.None,
						ShouldTryOnWithoutEquippedBody = not FFlagAXTryOnWithoutEquippedBody and nil,
						LastToggledLookType = CryoModule.None
					})
				end
				if p12.lookId == Tbl1.MakeupLookId then
					Tbl1 = CryoModule.Dictionary.join(Tbl1, {
						TryOnItems = TryOnItems,
						MakeupLookId = CryoModule.None,
						MakeupLookType = CryoModule.None,
						LastToggledLookType = CryoModule.None
					})
					
					return Tbl1
				end
			else
				Tbl1 = CryoModule.Dictionary.join(Tbl1, {
					TryOnItems = TryOnItems,
					LookId = CryoModule.None,
					LookType = CryoModule.None,
					BodyColor3s = CryoModule.None,
					BodyPartColorRangeIds = CryoModule.None,
					Scale = CryoModule.None,
					ShouldTryOnWithoutEquippedItems = not FFlagAXMISEnableMultiShopping and nil,
					ShouldTryOnWithoutEquippedBody = not FFlagAXTryOnWithoutEquippedBody and nil
				})
			end
		end
		return Tbl1
	end,
	[AvatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated.name] = function(p13, p14)
		return if p14.tryOn and p14.tryOn.OutfitTryOn then table.clone(p14.tryOn.OutfitTryOn) else p13
	end,
	[require(AvatarExperienceRodux.Actions.SetLastToggledLookType).name] = if FFlagAXMISEnableMultiShopping then function(p13, p14)
		-- upvalues: Tbl (copy), CryoModule (copy)
		return CryoModule.Dictionary.join(if p13 then p13 else Tbl, { LastToggledLookType = p14.lastToggledLookType })
	end else nil
})