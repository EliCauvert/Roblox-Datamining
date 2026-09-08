local avatarExperienceRodux = script:FindFirstAncestor("AvatarExperienceRodux")
local parent = avatarExperienceRodux.Parent
local roduxModule = require(parent.Rodux)
local cryoModule = require(parent.Cryo)
local _ = require(parent.AvatarExperienceModel)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local tutilsModule = require(parent.tutils)
local _ = require(avatarExperienceRodux.Types.RoduxTypes)
local _ = require(avatarExperienceRodux.Types.OutfitTryOn)
local tryOnLooksOutfitModule = require(avatarExperienceRodux.Actions.TryOnLooksOutfit)
local toggleTryOnModule = require(avatarExperienceRodux.Actions.ToggleTryOn)
local tryOnColorUpdatedModule = require(avatarExperienceRodux.Actions.TryOnColorUpdated)
local setEquippedInTryOnManagerModule = require(avatarExperienceRodux.Actions.SetEquippedInTryOnManager)
local setSelectedTimedOptionModule = require(avatarExperienceRodux.Actions.SetSelectedTimedOption)
local removeUnselectedItemsFromTryOnModule = require(avatarExperienceRodux.Actions.RemoveUnselectedItemsFromTryOn)
local removeFromTryOnModule = require(avatarExperienceRodux.Actions.RemoveFromTryOn)
local removeLookModule = require(avatarExperienceRodux.Actions.RemoveLook)
local removeLookFromTryOnModule = require(avatarExperienceRodux.Actions.RemoveLookFromTryOn)
local removeLookItemsFromTryOnModule = require(avatarExperienceRodux.Actions.RemoveLookItemsFromTryOn)
local receivedBundleInfoForTryOnModule = require(avatarExperienceRodux.Actions.ReceivedBundleInfoForTryOn)
local clearTryOnsModule = require(avatarExperienceRodux.Actions.ClearTryOns)
local setBackgroundPreviewModule = require(avatarExperienceRodux.Actions.SetBackgroundPreview)
local setOrderForTryOnsModule = require(avatarExperienceRodux.Actions.SetOrderForTryOns)
local addSelectedBundleInfoModule = require(avatarExperienceRodux.Actions.AddSelectedBundleInfo)
local setOutfitTryOnsModule = require(avatarExperienceRodux.Actions.SetOutfitTryOns)
local setAccessoryAdjustmentsModule = require(avatarExperienceRodux.Actions.SetAccessoryAdjustments)
local reducerUtilsModule = require(avatarExperienceRodux.Utils.ReducerUtils)
local tryOnClassicHeadShapeModule = require(avatarExperienceRodux.Actions.TryOnClassicHeadShape)
local navigatedToNonTryOnPageModule = require(avatarExperienceRodux.Actions.NavigatedToNonTryOnPage)
local navigatedToTryOnPageModule = require(avatarExperienceRodux.Actions.NavigatedToTryOnPage)
local defaultTryOnBodyColorsToggledModule = require(avatarExperienceRodux.Actions.DefaultTryOnBodyColorsToggled)
local findItemInTryOnItems = avatarExperienceCommonModule.Utils.findItemInTryOnItems
local getTryOnItemReducerKey = avatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local getFilteredTryOnItems = avatarExperienceCommonModule.Utils.getFilteredTryOnItems
local removeMakeupAssetsFromTryOnsIfOverLimit = avatarExperienceCommonModule.Utils.removeMakeupAssetsFromTryOnsIfOverLimit
local setLastToggledLookTypeModule = require(avatarExperienceRodux.Actions.SetLastToggledLookType)
local ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE = avatarExperienceCommonModule.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE
local LAYERED_MAKEUP_ORDER = avatarExperienceCommonModule.Constants.LAYERED_MAKEUP_ORDER
local MAKEUP_LOOK_ASSET_TYPES = avatarExperienceCommonModule.Constants.MAKEUP_LOOK_ASSET_TYPES
local LOOK_TYPE = avatarExperienceCommonModule.Constants.LOOK_TYPE
local constants = avatarExperienceCommonModule.Constants
local itemTypeEnum = avatarExperienceCommonModule.Enums.ItemTypeEnum
local ASSET_TYPE_NAME_TO_ID_STRING = constants.ASSET_TYPE_NAME_TO_ID_STRING
local BUNDLE_TYPE_ID_STRINGS = constants.BUNDLE_TYPE_ID_STRINGS
local BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND = constants.BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND
local LAYERED_CLOTHING_ORDER = constants.LAYERED_CLOTHING_ORDER
local LAYERED_ASSET_TYPES = constants.LAYERED_ASSET_TYPES
local ASSET_TYPE_TO_ACCESSORY_TYPE = constants.ASSET_TYPE_TO_ACCESSORY_TYPE
local characterHistoryStateChangeButtonActivated = avatarExperienceCommonModule.State.Actions.CharacterHistoryStateChangeButtonActivated
local fFlagAXRootSlotBasedEditorFlag = avatarExperienceFlagsModule.FFlagAXRootSlotBasedEditorFlag
local fFlagAXCatalogMakeupSupport = avatarExperienceFlagsModule.FFlagAXCatalogMakeupSupport
local fFlagAXMISEnableMultiShopping = avatarExperienceFlagsModule.FFlagAXMISEnableMultiShopping
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local fFlagParseHeadShapeFromAPIResponse = avatarExperienceFlagsModule.FFlagParseHeadShapeFromAPIResponse
local fFlagHeadRefinementFacialAnimationToggle = avatarExperienceFlagsModule.FFlagHeadRefinementFacialAnimationToggle
local fFlagDynamicHeadsMigration = avatarExperienceFlagsModule.FFlagDynamicHeadsMigration
local var1 = 0

local function formatItem(p1, p2)
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), fFlagDynamicHeadsMigration (ref), itemTypeEnum (ref), BUNDLE_TYPE_ID_STRINGS (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), fFlagParseHeadShapeFromAPIResponse (ref), fFlagHeadRefinementFacialAnimationToggle (ref), fFlagAXDurablesForMIS (ref), ASSET_TYPE_TO_ACCESSORY_TYPE (ref), LAYERED_CLOTHING_ORDER (ref), LAYERED_ASSET_TYPES (ref), cryoModule (ref), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (ref), LAYERED_MAKEUP_ORDER (ref), var1 (write)
	local var2 = if p1.receivedBundleInfo then true else false
	local bundleInfo = p1.bundleInfo
	
	if fFlagAXMISEnableMultiShopping and p1.bundleItems and not var2 then
		local t = {}
		
		for i, v in p1.bundleItems do
			if fFlagDynamicHeadsMigration and v.type == itemTypeEnum.Asset then
				local assetType = v.assetType
				
				if not assetType and p1.itemSubType == BUNDLE_TYPE_ID_STRINGS.DynamicHead then
					assetType = ASSET_TYPE_NAME_TO_ID_STRING.DynamicHead
				end
				if assetType then
					local t_1 = { assetType = assetType }
					
					if fFlagParseHeadShapeFromAPIResponse and v.meta and v.meta.headShape ~= nil then
						t_1.headShape = v.meta.headShape
					end
					if fFlagHeadRefinementFacialAnimationToggle and v.meta and v.meta.staticFacialAnimation ~= nil then
						t_1.staticFacialAnimation = v.meta.staticFacialAnimation
					end
					t[v.id] = t_1
				end
			elseif v.type == itemTypeEnum.Asset and v.assetType then
				local t_1 = { assetType = v.assetType }
				
				if fFlagParseHeadShapeFromAPIResponse and v.meta and v.meta.headShape ~= nil then
					t_1.headShape = v.meta.headShape
				end
				if fFlagHeadRefinementFacialAnimationToggle and v.meta and v.meta.staticFacialAnimation ~= nil then
					t_1.staticFacialAnimation = v.meta.staticFacialAnimation
				end
				t[v.id] = t_1
			end
		end
		bundleInfo = t
		var2 = true
	end
	local t = {
		version = "1",
		itemId = p1.itemId,
		itemType = p1.itemType,
		itemSubType = p1.itemSubType,
		selectedInTryOnManager = p1.selectedInTryOnManager,
		isUnequipped = p2,
		receivedBundleInfo = var2,
		bundleInfo = if fFlagAXMISEnableMultiShopping then bundleInfo else p1.bundleInfo,
		widgetInfo = p1.widgetInfo,
		isRecolorable = p1.isRecolorable,
		selectedTimedOptionIndex = if fFlagAXDurablesForMIS then p1.selectedTimedOptionIndex else nil
	}
	
	if ASSET_TYPE_TO_ACCESSORY_TYPE[p1.itemSubType] then
		t = cryoModule.Dictionary.join(t, {
			order = p1.overrideOrder or LAYERED_CLOTHING_ORDER[p1.itemSubType],
			isLayered = LAYERED_ASSET_TYPES[p1.itemSubType] ~= nil
		})
	elseif ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p1.itemSubType] then
		t = cryoModule.Dictionary.join(t, {
			isLayered = true,
			order = p1.overrideOrder or LAYERED_MAKEUP_ORDER[p1.itemSubType]
		})
	end
	if not p2 then
		t.itemRecency = var1
		var1 += 1
	end
	return t
end

local function formatItemFromLookOutfit(p3, p4, p5)
	-- upvalues: ASSET_TYPE_TO_ACCESSORY_TYPE (ref), LAYERED_CLOTHING_ORDER (ref), LAYERED_ASSET_TYPES (ref), cryoModule (ref), ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE (ref), LAYERED_MAKEUP_ORDER (ref), LOOK_TYPE (ref), fFlagAXCatalogMakeupSupport (ref), var1 (write)
	local t = {
		version = "1",
		isUnequipped = false,
		receivedBundleInfo = false,
		itemId = p3.itemId,
		itemType = p3.itemType,
		itemSubType = p3.itemSubType,
		selectedInTryOnManager = p3.isNotSelectable ~= true,
		lookId = p5
	}
	
	if ASSET_TYPE_TO_ACCESSORY_TYPE[p3.itemSubType] then
		t = cryoModule.Dictionary.join(t, {
			order = p3.order or LAYERED_CLOTHING_ORDER[p3.itemSubType],
			isLayered = LAYERED_ASSET_TYPES[p3.itemSubType] ~= nil
		})
	elseif ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE[p3.itemSubType] then
		t = cryoModule.Dictionary.join(t, {
			isLayered = true,
			order = p3.order or LAYERED_MAKEUP_ORDER[p3.itemSubType]
		})
	end
	t.itemRecency = if p4 == LOOK_TYPE.Avatar or fFlagAXCatalogMakeupSupport and p4 == LOOK_TYPE.Makeup then p3.tryOnItemOrder else var1
	var1 += 1
	
	return t
end

local function formatBundleFromLookOutfit(p3, p4)
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), LAYERED_CLOTHING_ORDER (ref), LAYERED_MAKEUP_ORDER (ref), fFlagParseHeadShapeFromAPIResponse (ref), var1 (write)
	local t = {
		version = "1",
		isUnequipped = false,
		receivedBundleInfo = false,
		selectedInTryOnManager = p3.isNotSelectable ~= true,
		itemType = p3.itemType,
		itemId = p3.itemId,
		itemSubType = if fFlagAXMISEnableMultiShopping then p3.itemSubType else nil,
		lookId = p4
	}
	local t_1 = {}
	
	for i, v in p3.items do
		t_1[v.itemId] = {
			assetType = v.itemSubType,
			order = LAYERED_CLOTHING_ORDER[v.itemSubType] or LAYERED_MAKEUP_ORDER[v.itemSubType],
			headShape = if fFlagParseHeadShapeFromAPIResponse then v.headShape else nil
		}
	end
	t.bundleInfo = t_1
	t.itemRecency = p3.tryOnItemOrder or var1
	var1 += 1
	
	return t
end

local function removeItem(p5, p6, p7)
	-- upvalues: getTryOnItemReducerKey (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), itemTypeEnum (ref), BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND (ref), cryoModule (ref)
	local var3 = getTryOnItemReducerKey(p7.itemId, p7.itemType)
	local var4 = p6[var3]
	var4.isUnequipped = true
	local var5 = p7.itemType == itemTypeEnum.Bundle and BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND[p7.itemSubType] == "Body"
	
	return cryoModule.Dictionary.join(p5, {
		TryOnItems = cryoModule.Dictionary.join(p6, { [var3] = cryoModule.None }),
		LastToggledItem = var4,
		LastTryOnClassicHeadShape = if p7.itemSubType == ASSET_TYPE_NAME_TO_ID_STRING.Face then cryoModule.None else nil,
		BodyColor3s = if var5 then cryoModule.None else nil,
		BodyPartColorRangeIds = if var5 then cryoModule.None else nil
	})
end

local function _(p5)
	-- upvalues: itemTypeEnum (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), BUNDLE_TYPE_ID_STRINGS (ref)
	return p5.itemType == itemTypeEnum.Asset and p5.itemSubType == ASSET_TYPE_NAME_TO_ID_STRING.EmoteAnimation or p5.itemType == itemTypeEnum.Bundle and p5.itemSubType == tostring(BUNDLE_TYPE_ID_STRINGS.Animations)
end

local function getTryOnItemsContainsRecolorableBody(p5)
	-- upvalues: BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND (ref)
	for i, v in p5 do
		if v.itemType == "Bundle" and BUNDLE_TYPE_ID_STRING_TO_NAME_FOR_BACKEND[v.itemSubType] == "Body" and v.isRecolorable then
			return true
		end
	end
	return false
end

local function getTryOnItemsMakeupAndAvatarLookIds(p6)
	-- upvalues: cryoModule (ref), MAKEUP_LOOK_ASSET_TYPES (ref)
	local none = cryoModule.None
	local none_1 = cryoModule.None
	
	for i, v in p6 do
		if v.lookId and not MAKEUP_LOOK_ASSET_TYPES[v.itemSubType] then
			none = v.lookId
		end
		if v.lookId and MAKEUP_LOOK_ASSET_TYPES[v.itemSubType] then
			none_1 = v.lookId
		end
	end
	return none, none_1
end

local function reconcileAllTryOnState(p7)
	-- upvalues: fFlagAXMISEnableMultiShopping (ref), getTryOnItemsMakeupAndAvatarLookIds (ref), getTryOnItemsContainsRecolorableBody (ref), cryoModule (ref), tutilsModule (ref), LOOK_TYPE (ref)
	local tryOnItems = p7.TryOnItems
	local var3 = nil
	local var4 = nil
	
	if fFlagAXMISEnableMultiShopping then
		local var5, var6 = getTryOnItemsMakeupAndAvatarLookIds(tryOnItems)
		var3 = var5
		var4 = var6
	end
	local var7 = getTryOnItemsContainsRecolorableBody(tryOnItems)
	
	if fFlagAXMISEnableMultiShopping then
		var7 = var7 or var3 ~= nil
	end
	local var8
	local var9 = if var7 then p7.BodyColor3s else cryoModule.None
	local var10 = if var7 then p7.BodyPartColorRangeIds else cryoModule.None
	local var11 = if var7 then p7.DefaultTryOnBodyColorsToggled else false
	
	if fFlagAXMISEnableMultiShopping then
		var8 = tutilsModule.fieldCount(tryOnItems) == 0
		var8 = nil
	else
		var8 = nil
	end
	return cryoModule.Dictionary.join(p7, {
		BodyColor3s = var9,
		BodyPartColorRangeIds = var10,
		DefaultTryOnBodyColorsToggled = var11,
		LookId = if fFlagAXMISEnableMultiShopping then var3 else nil,
		LookType = if fFlagAXMISEnableMultiShopping then if fFlagAXMISEnableMultiShopping then if var8 then cryoModule.None else p7.LookType else nil else nil,
		MakeupLookId = if fFlagAXMISEnableMultiShopping then var4 else nil,
		MakeupLookType = if fFlagAXMISEnableMultiShopping then if not fFlagAXMISEnableMultiShopping then if var8 or not var4 then cryoModule.None else LOOK_TYPE.Makeup else nil else nil,
		ShouldTryOnWithoutEquippedItems = if fFlagAXMISEnableMultiShopping then if var8 then false else p7.ShouldTryOnWithoutEquippedItems else nil
	})
end

local t = {
	DefaultTryOnBodyColorsToggled = false,
	LookId = nil,
	LookType = nil,
	MakeupLookId = nil,
	MakeupLookType = nil,
	LastToggledLookType = nil,
	LastTryOnClassicHeadShape = nil,
	BackgroundPreview = nil,
	TryOnItems = {},
	OutfitIdMap = {},
	ShouldTryOnWithoutEquippedItems = if fFlagAXMISEnableMultiShopping then false else nil
}

return roduxModule.createReducer(t, {
	[tryOnColorUpdatedModule.name] = function(p7, p8)
		-- upvalues: t (ref)
		local cloned = table.clone(p7 or t)
		cloned.BodyColor3s = p8.colors
		cloned.BodyPartColorRangeIds = p8.bodyPartColorRangeIds
		
		return cloned
	end,
	[toggleTryOnModule.name] = function(p7, p8)
		-- upvalues: t (ref), getTryOnItemReducerKey (ref), fFlagAXMISEnableMultiShopping (ref), reconcileAllTryOnState (ref), removeItem (ref), reducerUtilsModule (ref), formatItem (ref), getFilteredTryOnItems (ref), itemTypeEnum (ref), ASSET_TYPE_NAME_TO_ID_STRING (ref), BUNDLE_TYPE_ID_STRINGS (ref), cryoModule (ref), getTryOnItemsContainsRecolorableBody (ref), fFlagAXCatalogMakeupSupport (ref), removeMakeupAssetsFromTryOnsIfOverLimit (ref)
		local var3
		local var4 = p7 or t
		local var5 = var4.TryOnItems or {}
		local var6 = var4.LookId ~= nil
		local var7 = getTryOnItemReducerKey(p8.itemId, p8.itemType)
		
		if fFlagAXMISEnableMultiShopping then
			local _ = var5[var7] ~= nil
		else
			var3 = var5[var7] ~= nil and not var6
		end
		if var3 then
			return if fFlagAXMISEnableMultiShopping then reconcileAllTryOnState(removeItem(var4, var5, p8)) else removeItem(var4, var5, p8)
		elseif fFlagAXMISEnableMultiShopping and p8.resetTryOnsBeforeToggleOn then
			var5 = {}
		end
		local var8 = reducerUtilsModule.filterTryOns(var5, p8)
		local var9 = formatItem(p8, false)
		
		if fFlagAXMISEnableMultiShopping then
			var8 = getFilteredTryOnItems(var5, var9)
		end
		local var10
		local var11 = nil
		
		if var9.itemType == itemTypeEnum.Asset and var9.itemSubType == ASSET_TYPE_NAME_TO_ID_STRING.EmoteAnimation then
			var10 = true
		elseif var9.itemType == itemTypeEnum.Bundle then
			var10 = var9.itemSubType ~= tostring(BUNDLE_TYPE_ID_STRINGS.Animations)
		end
		if var10 then
			var11 = var9
		end
		if not fFlagAXMISEnableMultiShopping and var6 then
			return cryoModule.Dictionary.join(var4, {
				DefaultTryOnBodyColorsToggled = false,
				TryOnItems = { [p8.itemId] = var9 },
				LastToggledItem = var9,
				LastAnimOrEmoteToggledItem = var11,
				LookId = cryoModule.None,
				BodyColor3s = {},
				BodyPartColorRangeIds = cryoModule.None
			})
		end
		local var12 = cryoModule.Dictionary.join(var8, { [var7] = var9 })
		local var13 = getTryOnItemsContainsRecolorableBody(var12)
		local var14 = cryoModule.Dictionary.join(var4, {
			TryOnItems = var12,
			LastToggledItem = var9,
			LastAnimOrEmoteToggledItem = var11,
			BodyColor3s = if var13 then var4.BodyColor3s else cryoModule.None,
			BodyPartColorRangeIds = if var13 then var4.BodyPartColorRangeIds else cryoModule.None,
			DefaultTryOnBodyColorsToggled = if var13 then var4.DefaultTryOnBodyColorsToggled else false
		})
		
		if not fFlagAXMISEnableMultiShopping then
			return var14
		elseif fFlagAXCatalogMakeupSupport then
			var12 = removeMakeupAssetsFromTryOnsIfOverLimit(var12)
		end
		var14 = cryoModule.Dictionary.join(var14, {
			TryOnItems = var12,
			LastToggledItem = var9,
			LastAnimOrEmoteToggledItem = var11
		})
		
		return reconcileAllTryOnState(var14)
	end,
	[tryOnClassicHeadShapeModule.name] = function(p7, p8)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p7, {
			LastTryOnClassicHeadShape = if p8.headShape then p8.headShape else cryoModule.None
		})
	end,
	[tryOnLooksOutfitModule.name] = function(p7, p8)
		-- upvalues: t (ref), fFlagAXMISEnableMultiShopping (ref), fFlagAXCatalogMakeupSupport (ref), LOOK_TYPE (ref), MAKEUP_LOOK_ASSET_TYPES (ref), getTryOnItemReducerKey (ref), formatItemFromLookOutfit (ref), formatBundleFromLookOutfit (ref), cryoModule (ref)
		local var3 = p7 or t
		local t_1 = {}
		
		if fFlagAXMISEnableMultiShopping and fFlagAXCatalogMakeupSupport and p8.lookType == LOOK_TYPE.Makeup then
			t_1 = table.clone(var3.TryOnItems)
			
			for i, v in t_1 do
				if MAKEUP_LOOK_ASSET_TYPES[v.itemSubType] then
					t_1[i] = nil
				end
			end
		end
		for i, v in p8.assetItemIdTypeAndSubtype do
			t_1[getTryOnItemReducerKey(v.itemId, v.itemType)] = formatItemFromLookOutfit(v, p8.lookType, if fFlagAXMISEnableMultiShopping then p8.lookId else nil)
		end
		if p8.bundleItemIdTypeAndSubtype ~= nil then
			for i_1, v_1 in p8.bundleItemIdTypeAndSubtype do
				t_1[getTryOnItemReducerKey(v_1.itemId, v_1.itemType)] = formatBundleFromLookOutfit(v_1, if fFlagAXMISEnableMultiShopping then p8.lookId else nil)
			end
		end
		if fFlagAXMISEnableMultiShopping and fFlagAXCatalogMakeupSupport and p8.lookType == LOOK_TYPE.Makeup then
			return cryoModule.Dictionary.join(var3, {
				TryOnItems = t_1,
				MakeupLookId = if p8.lookId then p8.lookId else cryoModule.None,
				MakeupLookType = p8.lookType,
				LastToggledLookType = p8.lookType,
				MakeupLookAnalyticsInfo = if p8.analyticsInfo then p8.analyticsInfo else cryoModule.None
			})
		end
		local var4
		local join = cryoModule.Dictionary.join
		local t_2 = {
			TryOnItems = t_1,
			LookId = if p8.lookId then p8.lookId else cryoModule.None,
			LookAnalyticsInfo = if p8.analyticsInfo then p8.analyticsInfo else cryoModule.None,
			LookType = p8.lookType,
			MakeupLookId = cryoModule.None,
			MakeupLookType = cryoModule.None,
			MakeupLookAnalyticsInfo = cryoModule.None,
			LastToggledLookType = if fFlagAXMISEnableMultiShopping then p8.lookType else nil,
			BodyColor3s = if p8.bodyColor3s then p8.bodyColor3s else cryoModule.None,
			BodyPartColorRangeIds = if p8.bodyPartColorRangeIds then p8.bodyPartColorRangeIds else cryoModule.None,
			DefaultTryOnBodyColorsToggled = cryoModule.None,
			Scale = if p8.scale then p8.scale else cryoModule.None
		}
		
		if fFlagAXMISEnableMultiShopping then
			var4 = p8.lookId ~= nil
			var4 = nil
		else
			var4 = nil
		end
		t_2.ShouldTryOnWithoutEquippedItems = var4
		
		return join(var3, t_2)
	end,
	[setEquippedInTryOnManagerModule.name] = function(p9, p10)
		-- upvalues: t (ref), getTryOnItemReducerKey (ref), cryoModule (ref)
		local var5 = p9 or t
		local tryOnItems = var5.TryOnItems or {}
		local var6 = getTryOnItemReducerKey(p10.itemId, p10.itemType)
		
		return if tryOnItems[var6] == nil then var5 else cryoModule.Dictionary.join(var5, {
			TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
				[var6] = cryoModule.Dictionary.join(tryOnItems[var6], { selectedInTryOnManager = p10.selectedInTryOnManager })
			})
		})
	end,
	[setSelectedTimedOptionModule.name] = function(p9, p10)
		-- upvalues: t (ref), getTryOnItemReducerKey (ref), cryoModule (ref)
		local var5 = p9 or t
		local tryOnItems = var5.TryOnItems or {}
		local var6 = getTryOnItemReducerKey(p10.itemId, p10.itemType)
		
		return if tryOnItems[var6] == nil then var5 else cryoModule.Dictionary.join(var5, {
			TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
				[var6] = cryoModule.Dictionary.join(tryOnItems[var6], { selectedTimedOptionIndex = p10.selectedTimedOptionIndex })
			})
		})
	end,
	[removeUnselectedItemsFromTryOnModule.name] = function(p9, _)
		-- upvalues: t (ref), cryoModule (ref)
		local var5 = p9 or t
		local t_1 = {}
		
		for i, v in var5.TryOnItems or {} do
			if v.selectedInTryOnManager then
				t_1[i] = v
			end
		end
		return cryoModule.Dictionary.join(var5, { TryOnItems = t_1 })
	end,
	[removeLookFromTryOnModule.name] = if fFlagAXMISEnableMultiShopping then function(p10, p11)
		-- upvalues: t (ref), fFlagAXCatalogMakeupSupport (ref), cryoModule (ref)
		local var6 = p10 or t
		local t_1 = {}
		
		for i, v in var6.TryOnItems or {} do
			if v.lookId ~= p11.lookId then
				t_1[i] = v
			end
		end
		return if fFlagAXCatalogMakeupSupport and var6.MakeupLookId == p11.lookId then cryoModule.Dictionary.join(var6, {
			TryOnItems = t_1,
			MakeupLookId = cryoModule.None,
			MakeupLookType = cryoModule.None,
			MakeupLookAnalyticsInfo = cryoModule.None,
			LastToggledLookType = cryoModule.None
		}) else cryoModule.Dictionary.join(var6, {
			ShouldTryOnWithoutEquippedItems = false,
			TryOnItems = t_1,
			LookId = cryoModule.None,
			LookType = cryoModule.None,
			LookAnalyticsInfo = cryoModule.None,
			BodyColor3s = cryoModule.None,
			BodyPartColorRangeIds = cryoModule.None,
			Scale = cryoModule.None,
			LastToggledLookType = cryoModule.None
		})
	end else nil,
	[removeFromTryOnModule.name] = function(p12, p13)
		-- upvalues: t (ref), findItemInTryOnItems (ref), reconcileAllTryOnState (ref), removeItem (ref)
		local var7 = p12 or t
		local tryOnItems = var7.TryOnItems or {}
		local _ = nil
		local var8 = findItemInTryOnItems(tryOnItems, p13.itemId, p13.itemType)
		
		return if var8 == nil then var7 else reconcileAllTryOnState(removeItem(var7, tryOnItems, var8))
	end,
	[removeLookItemsFromTryOnModule.name] = function(p12, p13)
		-- upvalues: t (ref), getTryOnItemReducerKey (ref), itemTypeEnum (ref), cryoModule (ref), fFlagAXMISEnableMultiShopping (ref), fFlagAXCatalogMakeupSupport (ref)
		local var7 = p12 or t
		
		if p13.lookId == var7.LookId then
			local var8 = var7.TryOnItems or {}
			
			for i, v in p13.assetIds do
				local var9 = getTryOnItemReducerKey(v, itemTypeEnum.Asset)
				
				if var8[var9] ~= nil then
					var8 = cryoModule.Dictionary.join(var8, { [var9] = cryoModule.None })
				end
			end
			if p13.bundleIds ~= nil then
				for i, v_1 in p13.bundleIds do
					local var10 = getTryOnItemReducerKey(v_1, itemTypeEnum.Bundle)
					
					if var8[var10] ~= nil then
						var8 = cryoModule.Dictionary.join(var8, { [var10] = cryoModule.None })
					end
				end
			end
			var7 = cryoModule.Dictionary.join(var7, {
				TryOnItems = var8,
				LookId = cryoModule.None,
				LookType = cryoModule.None,
				BodyColor3s = cryoModule.None,
				BodyPartColorRangeIds = cryoModule.None,
				Scale = cryoModule.None,
				ShouldTryOnWithoutEquippedItems = if fFlagAXMISEnableMultiShopping then false else nil
			})
		end
		if fFlagAXMISEnableMultiShopping and fFlagAXCatalogMakeupSupport and p13.lookId == var7.MakeupLookId then
			local var11 = var7.TryOnItems or {}
			
			for i, v in p13.assetIds do
				local var12 = getTryOnItemReducerKey(v, itemTypeEnum.Asset)
				
				if var11[var12] ~= nil then
					var11 = cryoModule.Dictionary.join(var11, { [var12] = cryoModule.None })
				end
			end
			if p13.bundleIds ~= nil then
				for i, v_1 in p13.bundleIds do
					local var13 = getTryOnItemReducerKey(v_1, itemTypeEnum.Bundle)
					
					if var11[var13] ~= nil then
						var11 = cryoModule.Dictionary.join(var11, { [var13] = cryoModule.None })
					end
				end
			end
			var7 = cryoModule.Dictionary.join(var7, {
				TryOnItems = var11,
				MakeupLookId = cryoModule.None,
				MakeupLookType = cryoModule.None
			})
		end
		return var7
	end,
	[receivedBundleInfoForTryOnModule.name] = function(p14, p15)
		-- upvalues: t (ref), getTryOnItemReducerKey (ref), itemTypeEnum (ref), cryoModule (ref)
		local var14 = p14 or t
		local tryOnItems = var14.TryOnItems or {}
		local _ = nil
		local _ = nil
		local var15 = getTryOnItemReducerKey(p15.itemId, itemTypeEnum.Bundle)
		
		if tryOnItems[var15] then
			local cloned = table.clone(var14.OutfitIdMap or {})
			cloned[p15.itemId] = p15.outfitId
			local var16 = var15
			
			return cryoModule.Dictionary.join(var14, {
				TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
					[var16] = cryoModule.Dictionary.join(tryOnItems[var16], { receivedBundleInfo = true })
				}),
				OutfitIdMap = cloned
			})
		end
		return var14
	end,
	[clearTryOnsModule.name] = function(p14, p15)
		-- upvalues: cryoModule (ref), t (ref), fFlagAXMISEnableMultiShopping (ref), fFlagAXCatalogMakeupSupport (ref)
		if not p14 then
			return t
		end
		local retainTryOnColor = not p14.LookId and p15.retainTryOnColor
		
		return cryoModule.Dictionary.join(t, {
			LastTryOnClassicHeadShape = p14.LastTryOnClassicHeadShape,
			DefaultTryOnBodyColorsToggled = if retainTryOnColor then p14.DefaultTryOnBodyColorsToggled else nil,
			BodyColor3s = if retainTryOnColor then p14.BodyColor3s else nil,
			BodyPartColorRangeIds = if retainTryOnColor then p14.BodyPartColorRangeIds else nil,
			OutfitIdMap = if p14 then p14.OutfitIdMap else {},
			ShouldTryOnWithoutEquippedItems = if fFlagAXMISEnableMultiShopping then false else nil,
			LastToggledLookType = if fFlagAXMISEnableMultiShopping and fFlagAXCatalogMakeupSupport then cryoModule.None else nil
		})
	end,
	[navigatedToNonTryOnPageModule.name] = function(p14, _)
		-- upvalues: t (ref)
		local cloned = table.clone(t)
		
		if p14 and p14.OutfitIdMap then
			cloned.OutfitIdMap = p14.OutfitIdMap
		end
		return cloned
	end,
	[navigatedToTryOnPageModule.name] = function(p14, _)
		-- upvalues: t (ref)
		local cloned = table.clone(t)
		
		if p14 and p14.OutfitIdMap then
			cloned.OutfitIdMap = p14.OutfitIdMap
		end
		return cloned
	end,
	[setBackgroundPreviewModule.name] = function(p14, p15)
		-- upvalues: t (ref)
		local cloned = table.clone(p14 or t)
		cloned.BackgroundPreview = p15.previewKey
		
		return cloned
	end,
	[defaultTryOnBodyColorsToggledModule.name] = function(p14, p15)
		-- upvalues: t (ref)
		local cloned = table.clone(p14 or t)
		cloned.DefaultTryOnBodyColorsToggled = p15.state
		
		return cloned
	end,
	[setOrderForTryOnsModule.name] = function(p14, p15)
		-- upvalues: t (ref), getTryOnItemReducerKey (ref), itemTypeEnum (ref), cryoModule (ref), constants (ref)
		local tryOnItems
		local var14 = p14 or t
		
		for i, v in p15.itemIdToOrderMap do
			tryOnItems = var14.TryOnItems or {}
			local var15 = getTryOnItemReducerKey(i, itemTypeEnum.Asset)
			
			if tryOnItems[var15] and tryOnItems[var15].itemType ~= itemTypeEnum.Bundle then
				var14 = cryoModule.Dictionary.join(var14, {
					TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
						[var15] = cryoModule.Dictionary.join(tryOnItems[var15], { order = v })
					})
				})
			elseif not tryOnItems[var15] then
				for i_1, v_1 in tryOnItems do
					if v_1.bundleInfo and v_1.bundleInfo[i] and v_1.itemId ~= constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
						local bundleInfo = v_1.bundleInfo
						var14 = cryoModule.Dictionary.join(p14, {
							TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
								[i_1] = cryoModule.Dictionary.join(tryOnItems[i_1], {
									bundleInfo = cryoModule.Dictionary.join(bundleInfo, {
										[i] = cryoModule.Dictionary.join(bundleInfo[i], { order = v })
									})
								})
							})
						})
						continue
					end
				end
			end
		end
		return var14
	end,
	[setAccessoryAdjustmentsModule.name] = function(p16, p17)
		-- upvalues: t (ref), cryoModule (ref)
		local var16 = p16 or t
		local tryOnItems = var16.TryOnItems or {}
		
		for i, v in tryOnItems do
			if v.itemType == "Asset" then
				if v.itemId == p17.itemId then
					return cryoModule.Dictionary.join(var16, {
						TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
							[i] = cryoModule.Dictionary.join(v, {
								position = p17.position,
								rotation = p17.rotation,
								scale = p17.scale
							})
						})
					})
				end
			elseif v.itemType == "Bundle" then
				for i_1, v_1 in tryOnItems do
					if v_1.bundleInfo and v_1.bundleInfo[p17.itemId] then
						local bundleInfo = v_1.bundleInfo
						
						return cryoModule.Dictionary.join(p16, {
							TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
								[i_1] = cryoModule.Dictionary.join(tryOnItems[i_1], {
									bundleInfo = cryoModule.Dictionary.join(bundleInfo, {
										[p17.itemId] = cryoModule.Dictionary.join(bundleInfo[p17.itemId], {
											position = p17.position,
											rotation = p17.rotation,
											scale = p17.scale
										})
									})
								})
							})
						})
					end
				end
			end
		end
		return var16
	end,
	[addSelectedBundleInfoModule.name] = function(p18, p19)
		-- upvalues: t (ref), getTryOnItemReducerKey (ref), itemTypeEnum (ref), cryoModule (ref)
		local var17 = p18 or t
		local tryOnItems = var17.TryOnItems or {}
		local var18 = getTryOnItemReducerKey(p19.bundleId, itemTypeEnum.Bundle)
		
		return if tryOnItems[var18] then cryoModule.Dictionary.join(var17, {
			TryOnItems = cryoModule.Dictionary.join(tryOnItems, {
				[var18] = cryoModule.Dictionary.join(tryOnItems[var18], { bundleInfo = p19.bundleInfo })
			})
		}) else var17
	end,
	[setOutfitTryOnsModule.name] = function(_, p18)
		return p18.outfitTryOns
	end,
	[removeLookModule.name] = function(p18, p19)
		-- upvalues: t (ref), fFlagAXMISEnableMultiShopping (ref), fFlagAXCatalogMakeupSupport (ref), cryoModule (ref)
		local var17 = p18 or t
		
		if p19.lookId == var17.LookId or fFlagAXMISEnableMultiShopping and fFlagAXCatalogMakeupSupport and p19.lookId == var17.MakeupLookId then
			local t_1 = {}
			
			if fFlagAXMISEnableMultiShopping then
				for i, v in var17.TryOnItems or {} do
					if v.lookId ~= p19.lookId then
						t_1[i] = v
					end
				end
			end
			if fFlagAXMISEnableMultiShopping and fFlagAXCatalogMakeupSupport then
				if p19.lookId == var17.LookId then
					var17 = cryoModule.Dictionary.join(var17, {
						ShouldTryOnWithoutEquippedItems = false,
						TryOnItems = t_1,
						LookId = cryoModule.None,
						LookType = cryoModule.None,
						BodyColor3s = cryoModule.None,
						BodyPartColorRangeIds = cryoModule.None,
						Scale = cryoModule.None,
						LastToggledLookType = cryoModule.None
					})
				end
				if p19.lookId == var17.MakeupLookId then
					var17 = cryoModule.Dictionary.join(var17, {
						TryOnItems = t_1,
						MakeupLookId = cryoModule.None,
						MakeupLookType = cryoModule.None,
						LastToggledLookType = cryoModule.None
					})
					
					return var17
				end
			else
				var17 = cryoModule.Dictionary.join(var17, {
					TryOnItems = t_1,
					LookId = cryoModule.None,
					LookType = cryoModule.None,
					BodyColor3s = cryoModule.None,
					BodyPartColorRangeIds = cryoModule.None,
					Scale = cryoModule.None,
					ShouldTryOnWithoutEquippedItems = if fFlagAXMISEnableMultiShopping then false else nil
				})
			end
		end
		return var17
	end,
	[characterHistoryStateChangeButtonActivated.name] = function(p20, p21)
		-- upvalues: fFlagAXRootSlotBasedEditorFlag (ref)
		return if fFlagAXRootSlotBasedEditorFlag and p21.tryOn and p21.tryOn.OutfitTryOn then table.clone(p21.tryOn.OutfitTryOn) else p20
	end,
	[setLastToggledLookTypeModule.name] = if fFlagAXMISEnableMultiShopping then function(p20, p21)
		-- upvalues: t (ref), cryoModule (ref)
		return cryoModule.Dictionary.join(p20 or t, { LastToggledLookType = p21.lastToggledLookType })
	end else nil
})