local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local _ = require(script.Parent.Parent.Types)
local slotTypeModule = require(script.Parent.Parent.Enums.SlotType)
local fFlagEnableSlotsHeadShapeThumbnail = require(parent.AvatarExperienceFlags).FFlagEnableSlotsHeadShapeThumbnail

local function _(p0, p1, p2) --[[ line: 21 | named "buildSlotSubcategory" ]]
	return {
		nameTranslationKey = p0.nameTranslationKey,
		icon = p0.icon,
		thumbnailUrl = p1,
		assetTypes = p0.assetTypes,
		editorSubcategory = p0.editorSubcategory,
		eligibleSubcategories = p0.eligibleSubcategories,
		currentAssetType = p2,
		hide = p0.hide,
		deselectable = p0.deselectable
	}
end

local _ = function(p3, p4, p5, p6) --[[ line: 35 | named "buildLayeredSlotSubcategory" ]]
	-- upvalues: slotTypeModule (ref)
	return {
		nameTranslationKey = p3.nameTranslationKey,
		icon = p3.icon,
		thumbnailUrl = p4,
		assetTypes = p3.assetTypes,
		editorSubcategory = p3.editorSubcategory,
		eligibleSubcategories = p3.eligibleSubcategories,
		currentAssetType = p5,
		hide = p3.hide,
		deselectable = p3.deselectable,
		slotType = slotTypeModule.LayeredSlot,
		layerLimit = p3.layerLimit,
		layerIndex = p6
	}
end

local _ = function(value) --[[ line: 50 | named "getHeadShapeFromEquippedAssets" ]]
	local value_1 = value[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
	
	if value_1 then
		for i, v in value_1 do
			return if v.headShape == "Default" then nil else v.headShape
		end
	end
	return nil
end

local function getClassicFaceOrDynamicHeadThumbnail(p7, p8) --[[ line: 63 ]]
	local var2 = p7[if p8 then tostring(Enum.AvatarAssetType.DynamicHead.Value) else tostring(Enum.AvatarAssetType.Face.Value)]
	
	if var2 then
		for i, v in var2 do
			return `rbxthumb://type=Asset&id={i}&w=150&h=150`
		end
	end
	return nil
end

return function(p9, p10) --[[ line: 80 | named "buildSlots" ]]
	-- upvalues: slotTypeModule (ref), fFlagEnableSlotsHeadShapeThumbnail (ref), getClassicFaceOrDynamicHeadThumbnail (ref)
	local var6, i_3
	local t = {}
	local var4 = false
	local var5 = false
	
	for i, v in p9 do
		local v_2
		if v.slotType ~= slotTypeModule.LayeredSlot then
			local assetTypes = v.assetTypes
			local var7 = false
			
			for i_1, v_1 in assetTypes do
				local value = p10[tostring(v_1.Value)]
				local i_1 = value ~= nil and next(value)
				
				if i_1 then
					if v_1 == Enum.AvatarAssetType.Face then
						var5 = true
					elseif v_1 == Enum.AvatarAssetType.DynamicHead then
						var4 = true
					end
					for i_5, v_4 in value do
						local var8 = `rbxthumb://type=Asset&id={i_5}&w=150&h=150`
						
						if var4 and fFlagEnableSlotsHeadShapeThumbnail then
							v_2 = p10[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
							
							if not v_2 then break end
							for i_6, v_5 in v_2 do
								i_3 = if v_5.headShape == "Default" then nil else v_5.headShape
							end
							i_3 = nil
							if i_3 then
								var8 = `rbxthumb://type=Asset&id={i_5}&headshape={i_3}&w=150&h=150`
							end
						end
						table.insert(t, {
							nameTranslationKey = v.nameTranslationKey,
							icon = v.icon,
							thumbnailUrl = var8,
							assetTypes = v.assetTypes,
							editorSubcategory = v.editorSubcategory,
							eligibleSubcategories = v.eligibleSubcategories,
							currentAssetType = v_1,
							hide = v.hide,
							deselectable = v.deselectable
						})
						var7 = true
					end
				end
			end
			for i_1, v_1 in assetTypes do
				if v_1 == Enum.AvatarAssetType.Face and (var4 or var5) then
					table.insert(t, {
						nameTranslationKey = v.nameTranslationKey,
						icon = v.icon,
						thumbnailUrl = getClassicFaceOrDynamicHeadThumbnail(p10, var4),
						assetTypes = v.assetTypes,
						editorSubcategory = v.editorSubcategory,
						eligibleSubcategories = v.eligibleSubcategories,
						currentAssetType = v_1,
						hide = v.hide,
						deselectable = v.deselectable
					})
					var7 = true
				end
			end
			if not var7 then
				table.insert(t, {
					thumbnailUrl = nil,
					currentAssetType = nil,
					nameTranslationKey = v.nameTranslationKey,
					icon = v.icon,
					assetTypes = v.assetTypes,
					editorSubcategory = v.editorSubcategory,
					eligibleSubcategories = v.eligibleSubcategories,
					hide = v.hide,
					deselectable = v.deselectable
				})
			end
		end
		for i_2 = 0, v.layerLimit - 1 do
			var6 = false
			
			for i_1, v_1 in v.assetTypes do
				local value = p10[tostring(v_1.Value)]
				
				if value ~= nil and next(value) then
					for i_3, v_2 in value do
						if v_2.order == i_2 then
							table.insert(t, {
								nameTranslationKey = v.nameTranslationKey,
								icon = v.icon,
								thumbnailUrl = `rbxthumb://type=Asset&id={i_3}&w=150&h=150`,
								assetTypes = v.assetTypes,
								editorSubcategory = v.editorSubcategory,
								eligibleSubcategories = v.eligibleSubcategories,
								currentAssetType = v_1,
								hide = v.hide,
								deselectable = v.deselectable,
								slotType = slotTypeModule.LayeredSlot,
								layerLimit = v.layerLimit,
								layerIndex = i_2
							})
							var6 = true
							continue
						end
					end
				end
			end
			if not var6 then
				table.insert(t, {
					thumbnailUrl = nil,
					currentAssetType = nil,
					nameTranslationKey = v.nameTranslationKey,
					icon = v.icon,
					assetTypes = v.assetTypes,
					editorSubcategory = v.editorSubcategory,
					eligibleSubcategories = v.eligibleSubcategories,
					hide = v.hide,
					deselectable = v.deselectable,
					slotType = slotTypeModule.LayeredSlot,
					layerLimit = v.layerLimit,
					layerIndex = i_2
				})
			end
		end
	end
	return t
end