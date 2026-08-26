local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local _ = require(script.Parent.Parent.Types)
local slotTypeModule = require(script.Parent.Parent.Enums.SlotType)
local fFlagEnableSlotsHeadShapeThumbnail = require(parent.AvatarExperienceFlags).FFlagEnableSlotsHeadShapeThumbnail

local function _(p1, p2, p3)
	return {
		nameTranslationKey = p1.nameTranslationKey,
		icon = p1.icon,
		thumbnailUrl = p2,
		assetTypes = p1.assetTypes,
		editorSubcategory = p1.editorSubcategory,
		eligibleSubcategories = p1.eligibleSubcategories,
		currentAssetType = p3,
		hide = p1.hide,
		deselectable = p1.deselectable
	}
end

local _ = function(p1, p2, p3, p4)
	-- upvalues: slotTypeModule (ref)
	return {
		nameTranslationKey = p1.nameTranslationKey,
		icon = p1.icon,
		thumbnailUrl = p2,
		assetTypes = p1.assetTypes,
		editorSubcategory = p1.editorSubcategory,
		eligibleSubcategories = p1.eligibleSubcategories,
		currentAssetType = p3,
		hide = p1.hide,
		deselectable = p1.deselectable,
		slotType = slotTypeModule.LayeredSlot,
		layerLimit = p1.layerLimit,
		layerIndex = p4
	}
end

local _ = function(value)
	local value_1 = value[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
	
	if value_1 then
		for i, v in value_1 do
			return if v.headShape == "Default" then nil else v.headShape
		end
	end
	return nil
end

local function getClassicFaceOrDynamicHeadThumbnail(p1, p2)
	local var1 = p1[if p2 then tostring(Enum.AvatarAssetType.DynamicHead.Value) else tostring(Enum.AvatarAssetType.Face.Value)]
	
	if var1 then
		for i, v in var1 do
			return `rbxthumb://type=Asset&id={i}&w=150&h=150`
		end
	end
	return nil
end

return function(p3, p4)
	-- upvalues: slotTypeModule (ref), fFlagEnableSlotsHeadShapeThumbnail (ref), getClassicFaceOrDynamicHeadThumbnail (ref)
	local var2, i_3
	local t = {}
	local var3 = false
	local var4 = false
	
	for i, v in p3 do
		local v_2
		if v.slotType ~= slotTypeModule.LayeredSlot then
			local assetTypes = v.assetTypes
			local var5 = false
			
			for i_1, v_1 in assetTypes do
				local value = p4[tostring(v_1.Value)]
				local i_1 = value ~= nil and next(value)
				
				if i_1 then
					if v_1 == Enum.AvatarAssetType.Face then
						var4 = true
					elseif v_1 == Enum.AvatarAssetType.DynamicHead then
						var3 = true
					end
					for i_5, v_4 in value do
						local var6 = `rbxthumb://type=Asset&id={i_5}&w=150&h=150`
						
						if var3 and fFlagEnableSlotsHeadShapeThumbnail then
							v_2 = p4[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
							
							if not v_2 then break end
							for i_6, v_5 in v_2 do
								i_3 = if v_5.headShape == "Default" then nil else v_5.headShape
							end
							i_3 = nil
							if i_3 then
								var6 = `rbxthumb://type=Asset&id={i_5}&headshape={i_3}&w=150&h=150`
							end
						end
						table.insert(t, {
							nameTranslationKey = v.nameTranslationKey,
							icon = v.icon,
							thumbnailUrl = var6,
							assetTypes = v.assetTypes,
							editorSubcategory = v.editorSubcategory,
							eligibleSubcategories = v.eligibleSubcategories,
							currentAssetType = v_1,
							hide = v.hide,
							deselectable = v.deselectable
						})
						var5 = true
					end
				end
			end
			for i_1, v_1 in assetTypes do
				if v_1 == Enum.AvatarAssetType.Face and (var3 or var4) then
					table.insert(t, {
						nameTranslationKey = v.nameTranslationKey,
						icon = v.icon,
						thumbnailUrl = getClassicFaceOrDynamicHeadThumbnail(p4, var3),
						assetTypes = v.assetTypes,
						editorSubcategory = v.editorSubcategory,
						eligibleSubcategories = v.eligibleSubcategories,
						currentAssetType = v_1,
						hide = v.hide,
						deselectable = v.deselectable
					})
					var5 = true
				end
			end
			if not var5 then
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
			var2 = false
			
			for i_1, v_1 in v.assetTypes do
				local value = p4[tostring(v_1.Value)]
				
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
							var2 = true
							continue
						end
					end
				end
			end
			if not var2 then
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