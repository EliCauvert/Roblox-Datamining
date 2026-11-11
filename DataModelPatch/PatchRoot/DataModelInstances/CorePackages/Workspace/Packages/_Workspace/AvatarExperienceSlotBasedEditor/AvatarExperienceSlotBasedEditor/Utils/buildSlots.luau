local _ = require(script.Parent.Parent.Types)
local SlotTypeModule = require(script.Parent.Parent.Enums.SlotType)
local AvatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent.AvatarExperienceFlags)
local FFlagEnableSlotsHeadShapeThumbnail = AvatarExperienceFlagsModule.FFlagEnableSlotsHeadShapeThumbnail
local FFlagAXCustomizeMakeupSupport = AvatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport

local function buildSlotSubcategory(p1, ThumbnailUrl, CurrentAssetType)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy)
	return if FFlagAXCustomizeMakeupSupport then {
		nameTranslationKey = p1.nameTranslationKey,
		icon = p1.icon,
		thumbnailUrl = ThumbnailUrl,
		assetTypes = p1.assetTypes,
		editorSubcategory = p1.editorSubcategory,
		eligibleSubcategories = p1.eligibleSubcategories,
		currentAssetType = CurrentAssetType,
		hide = p1.hide,
		deselectable = p1.deselectable
	} else {
		nameTranslationKey = p1.nameTranslationKey,
		icon = p1.icon,
		thumbnailUrl = ThumbnailUrl,
		assetTypes = p1.assetTypes,
		editorSubcategory = p1.editorSubcategory
	}
end

local function _(p1, ThumbnailUrl, CurrentAssetType, LayerIndex)
	-- upvalues: buildSlotSubcategory (copy), SlotTypeModule (copy)
	local SlotSubcategory = buildSlotSubcategory(p1, ThumbnailUrl, CurrentAssetType)
	SlotSubcategory.slotType = SlotTypeModule.LayeredSlot
	SlotSubcategory.layerLimit = p1.layerLimit
	SlotSubcategory.layerIndex = LayerIndex
	
	return SlotSubcategory
end

local _ = function(p1)
	local v1 = p1[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
	
	if v1 then
		for _, value in v1 do
			return if value.headShape == "Default" then nil else value.headShape
		end
	end
	return nil
end

local function getClassicFaceOrDynamicHeadThumbnail(p2, p3): string?
	local v2 = p2[if p3 then tostring(Enum.AvatarAssetType.DynamicHead.Value) else tostring(Enum.AvatarAssetType.Face.Value)]
	
	if v2 then
		for i, _ in v2 do
			return `rbxthumb://type=Asset&id={i}&w=150&h=150`
		end
	end
	return nil
end

return function(List, p4)
	-- upvalues: FFlagAXCustomizeMakeupSupport (copy), SlotTypeModule (copy), buildSlotSubcategory (copy), FFlagEnableSlotsHeadShapeThumbnail (copy), getClassicFaceOrDynamicHeadThumbnail (copy)
	local List1 = {}
	local Flag = false
	local Flag1 = false
	local Flag3 = nil
	
	for _, value in List do
		if FFlagAXCustomizeMakeupSupport and value.slotType == SlotTypeModule.LayeredSlot then
			for i = 0, value.layerLimit - 1 do
				Flag3 = false
				
				for _, assetType in value.assetTypes do
					local v3 = p4[tostring(assetType.Value)]
					
					if v3 ~= nil and next(v3) then
						for i1, value1 in v3 do
							if value1.order == i then
								local SlotSubcategory = buildSlotSubcategory(value, `rbxthumb://type=Asset&id={i1}&w=150&h=150`, assetType)
								SlotSubcategory.slotType = SlotTypeModule.LayeredSlot
								SlotSubcategory.layerLimit = value.layerLimit
								SlotSubcategory.layerIndex = i
								table.insert(List1, SlotSubcategory)
								Flag3 = true
								break
							end
						end
					end
				end
				if not Flag3 then
					local SlotSubcategory = buildSlotSubcategory(value, nil, nil)
					SlotSubcategory.slotType = SlotTypeModule.LayeredSlot
					SlotSubcategory.layerLimit = value.layerLimit
					SlotSubcategory.layerIndex = i
					table.insert(List1, SlotSubcategory)
				end
			end
		else
			local AssetTypes = value.assetTypes
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
								for _, value2 in v5 do
									HeadShape = if value2.headShape == "Default" then nil else value2.headShape
									break
								end
								HeadShape = nil
							until true
							if HeadShape then
								RbxthumbName = `rbxthumb://type=Asset&id={i2}&headshape={HeadShape}&w=150&h=150`
							end
						end
						table.insert(List1, (buildSlotSubcategory(value, RbxthumbName, assetType1)))
						Flag2 = true
					end
				end
			end
			for _, assetType2 in AssetTypes do
				if assetType2 == Enum.AvatarAssetType.Face and (Flag or Flag1) then
					table.insert(List1, (buildSlotSubcategory(value, getClassicFaceOrDynamicHeadThumbnail(p4, Flag), assetType2)))
					Flag2 = true
				end
			end
			if not Flag2 then
				table.insert(List1, (buildSlotSubcategory(value)))
			end
		end
	end
	return List1
end