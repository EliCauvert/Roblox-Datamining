local _ = require(script.Parent.Parent.Types)
local SlotTypeModule = require(script.Parent.Parent.Enums.SlotType)
local FFlagEnableSlotsHeadShapeThumbnail = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.AvatarExperienceFlags).FFlagEnableSlotsHeadShapeThumbnail

local function _(SlotSubcategory, ThumbnailUrl, CurrentAssetType) --[[ Line: 21 | Named "buildSlotSubcategory" ]]
	return {
		nameTranslationKey = SlotSubcategory.nameTranslationKey,
		icon = SlotSubcategory.icon,
		thumbnailUrl = ThumbnailUrl,
		assetTypes = SlotSubcategory.assetTypes,
		editorSubcategory = SlotSubcategory.editorSubcategory,
		eligibleSubcategories = SlotSubcategory.eligibleSubcategories,
		currentAssetType = CurrentAssetType,
		hide = SlotSubcategory.hide,
		deselectable = SlotSubcategory.deselectable
	}
end

local _ = function(LayeredSlotSubcategory, ThumbnailUrl, CurrentAssetType, LayerIndex) --[[ Line: 35 | Named "buildLayeredSlotSubcategory" ]]
	-- upvalues: SlotTypeModule (copy)
	return {
		nameTranslationKey = LayeredSlotSubcategory.nameTranslationKey,
		icon = LayeredSlotSubcategory.icon,
		thumbnailUrl = ThumbnailUrl,
		assetTypes = LayeredSlotSubcategory.assetTypes,
		editorSubcategory = LayeredSlotSubcategory.editorSubcategory,
		eligibleSubcategories = LayeredSlotSubcategory.eligibleSubcategories,
		currentAssetType = CurrentAssetType,
		hide = LayeredSlotSubcategory.hide,
		deselectable = LayeredSlotSubcategory.deselectable,
		slotType = SlotTypeModule.LayeredSlot,
		layerLimit = LayeredSlotSubcategory.layerLimit,
		layerIndex = LayerIndex
	}
end

local _ = function(p1) --[[ Line: 50 | Named "getHeadShapeFromEquippedAssets" ]]
	local v1 = p1[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
	
	if v1 then
		for _, value in v1 do
			return if value.headShape == "Default" then nil else value.headShape
		end
	end
	return nil
end

local function getClassicFaceOrDynamicHeadThumbnail(p2, p3): string? --[[ Line: 63 ]]
	local v2 = p2[if p3 then tostring(Enum.AvatarAssetType.DynamicHead.Value) else tostring(Enum.AvatarAssetType.Face.Value)]
	
	if v2 then
		for i, _ in v2 do
			return `rbxthumb://type=Asset&id={i}&w=150&h=150`
		end
	end
	return nil
end

return function(List, p4) --[[ Line: 80 | Named "buildSlots" ]]
	-- upvalues: SlotTypeModule (copy), FFlagEnableSlotsHeadShapeThumbnail (copy), getClassicFaceOrDynamicHeadThumbnail (copy)
	local List1 = {}
	local Flag = false
	local Flag1 = false
	local Flag3 = nil
	
	for _, LayeredSlotSubcategory in List do
		if LayeredSlotSubcategory.slotType == SlotTypeModule.LayeredSlot then
			for i = 0, LayeredSlotSubcategory.layerLimit - 1 do
				Flag3 = false
				
				for _, assetType in LayeredSlotSubcategory.assetTypes do
					local v3 = p4[tostring(assetType.Value)]
					
					if v3 ~= nil and next(v3) then
						for i1, value in v3 do
							if value.order == i then
								table.insert(List1, {
									nameTranslationKey = LayeredSlotSubcategory.nameTranslationKey,
									icon = LayeredSlotSubcategory.icon,
									thumbnailUrl = `rbxthumb://type=Asset&id={i1}&w=150&h=150`,
									assetTypes = LayeredSlotSubcategory.assetTypes,
									editorSubcategory = LayeredSlotSubcategory.editorSubcategory,
									eligibleSubcategories = LayeredSlotSubcategory.eligibleSubcategories,
									currentAssetType = assetType,
									hide = LayeredSlotSubcategory.hide,
									deselectable = LayeredSlotSubcategory.deselectable,
									slotType = SlotTypeModule.LayeredSlot,
									layerLimit = LayeredSlotSubcategory.layerLimit,
									layerIndex = i
								})
								Flag3 = true
								break
							end
						end
					end
				end
				if not Flag3 then
					table.insert(List1, {
						thumbnailUrl = nil,
						currentAssetType = nil,
						nameTranslationKey = LayeredSlotSubcategory.nameTranslationKey,
						icon = LayeredSlotSubcategory.icon,
						assetTypes = LayeredSlotSubcategory.assetTypes,
						editorSubcategory = LayeredSlotSubcategory.editorSubcategory,
						eligibleSubcategories = LayeredSlotSubcategory.eligibleSubcategories,
						hide = LayeredSlotSubcategory.hide,
						deselectable = LayeredSlotSubcategory.deselectable,
						slotType = SlotTypeModule.LayeredSlot,
						layerLimit = LayeredSlotSubcategory.layerLimit,
						layerIndex = i
					})
				end
			end
		else
			local AssetTypes = LayeredSlotSubcategory.assetTypes
			local Flag2 = false
			
			for _, assetType1 in AssetTypes do
				local v4 = p4[tostring(assetType1.Value)]
				
				if v4 ~= nil and next(v4) then
					if assetType1 == Enum.AvatarAssetType.Face then
						Flag1 = true
						continue
					end
					if assetType1 == Enum.AvatarAssetType.DynamicHead then
						Flag = true
					end
					for i2, _ in v4 do
						local RbxthumbName: string = `rbxthumb://type=Asset&id={i2}&w=150&h=150`
						
						if Flag and FFlagEnableSlotsHeadShapeThumbnail then
							local v5 = p4[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
							local HeadShape = nil
							repeat
								if not v5 then break end
								for _, value1 in v5 do
									HeadShape = if value1.headShape == "Default" then nil else value1.headShape
									break
								end
								HeadShape = nil
							until true
							if HeadShape then
								RbxthumbName = `rbxthumb://type=Asset&id={i2}&headshape={HeadShape}&w=150&h=150`
							end
						end
						table.insert(List1, {
							nameTranslationKey = LayeredSlotSubcategory.nameTranslationKey,
							icon = LayeredSlotSubcategory.icon,
							thumbnailUrl = RbxthumbName,
							assetTypes = LayeredSlotSubcategory.assetTypes,
							editorSubcategory = LayeredSlotSubcategory.editorSubcategory,
							eligibleSubcategories = LayeredSlotSubcategory.eligibleSubcategories,
							currentAssetType = assetType1,
							hide = LayeredSlotSubcategory.hide,
							deselectable = LayeredSlotSubcategory.deselectable
						})
						Flag2 = true
					end
				end
			end
			for _, assetType2 in AssetTypes do
				if assetType2 == Enum.AvatarAssetType.Face and (Flag or Flag1) then
					table.insert(List1, {
						nameTranslationKey = LayeredSlotSubcategory.nameTranslationKey,
						icon = LayeredSlotSubcategory.icon,
						thumbnailUrl = getClassicFaceOrDynamicHeadThumbnail(p4, Flag),
						assetTypes = LayeredSlotSubcategory.assetTypes,
						editorSubcategory = LayeredSlotSubcategory.editorSubcategory,
						eligibleSubcategories = LayeredSlotSubcategory.eligibleSubcategories,
						currentAssetType = assetType2,
						hide = LayeredSlotSubcategory.hide,
						deselectable = LayeredSlotSubcategory.deselectable
					})
					Flag2 = true
				end
			end
			if not Flag2 then
				table.insert(List1, {
					thumbnailUrl = nil,
					currentAssetType = nil,
					nameTranslationKey = LayeredSlotSubcategory.nameTranslationKey,
					icon = LayeredSlotSubcategory.icon,
					assetTypes = LayeredSlotSubcategory.assetTypes,
					editorSubcategory = LayeredSlotSubcategory.editorSubcategory,
					eligibleSubcategories = LayeredSlotSubcategory.eligibleSubcategories,
					hide = LayeredSlotSubcategory.hide,
					deselectable = LayeredSlotSubcategory.deselectable
				})
			end
		end
	end
	return List1
end