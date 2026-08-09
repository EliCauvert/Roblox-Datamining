local parent = script:FindFirstAncestor("AvatarExperienceSlotBasedEditor").Parent
local _ = require(script.Parent.Parent.Types)
local slotTypeModule = require(script.Parent.Parent.Enums.SlotType)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagEnableSlotsHeadShapeThumbnail = avatarExperienceFlagsModule.FFlagEnableSlotsHeadShapeThumbnail
local fFlagAXCustomizeMakeupSupport = avatarExperienceFlagsModule.FFlagAXCustomizeMakeupSupport

local function buildSlotSubcategory(p0, p1, p2) --[[ line: 23 ]]
	-- upvalues: fFlagAXCustomizeMakeupSupport (ref)
	return if fFlagAXCustomizeMakeupSupport then {
		nameTranslationKey = p0.nameTranslationKey,
		icon = p0.icon,
		thumbnailUrl = p1,
		assetTypes = p0.assetTypes,
		editorSubcategory = p0.editorSubcategory,
		eligibleSubcategories = p0.eligibleSubcategories,
		currentAssetType = p2,
		hide = p0.hide,
		deselectable = p0.deselectable
	} else {
		nameTranslationKey = p0.nameTranslationKey,
		icon = p0.icon,
		thumbnailUrl = p1,
		assetTypes = p0.assetTypes,
		editorSubcategory = p0.editorSubcategory
	}
end

local function _(p3, p4, p5, p6) --[[ line: 47 | named "buildLayeredSlotSubcategory" ]]
	-- upvalues: buildSlotSubcategory (ref), slotTypeModule (ref)
	local var4 = buildSlotSubcategory(p3, p4, p5)
	var4.slotType = slotTypeModule.LayeredSlot
	var4.layerLimit = p3.layerLimit
	var4.layerIndex = p6
	
	return var4
end

local _ = function(value) --[[ line: 62 | named "getHeadShapeFromEquippedAssets" ]]
	local value_1 = value[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
	
	if value_1 then
		for i, v in value_1 do
			return if v.headShape == "Default" then nil else v.headShape
		end
	end
	return nil
end

local function getClassicFaceOrDynamicHeadThumbnail(p7, p8) --[[ line: 75 ]]
	local var5 = p7[if p8 then tostring(Enum.AvatarAssetType.DynamicHead.Value) else tostring(Enum.AvatarAssetType.Face.Value)]
	
	if var5 then
		for i, v in var5 do
			return `rbxthumb://type=Asset&id={i}&w=150&h=150`
		end
	end
	return nil
end

return function(p9, p10) --[[ line: 92 | named "buildSlots" ]]
	-- upvalues: fFlagAXCustomizeMakeupSupport (ref), slotTypeModule (ref), buildSlotSubcategory (ref), fFlagEnableSlotsHeadShapeThumbnail (ref), getClassicFaceOrDynamicHeadThumbnail (ref)
	local var13, v_4, var12
	local t = {}
	local var7 = false
	local var8 = false
	
	for i, v in p9 do
		local var10, value_1
		if not fFlagAXCustomizeMakeupSupport or v.slotType ~= slotTypeModule.LayeredSlot then
			local assetTypes = v.assetTypes
			local var9 = false
			
			for i_1, v_1 in assetTypes do
				local value = p10[tostring(v_1.Value)]
				var10 = value ~= nil and next(value)
				
				if var10 then
					if v_1 == Enum.AvatarAssetType.Face then
						var8 = true
					elseif v_1 == Enum.AvatarAssetType.DynamicHead then
						var7 = true
					end
					for i_3, v_3 in value do
						local var11 = `rbxthumb://type=Asset&id={i_3}&w=150&h=150`
						
						if var7 and fFlagEnableSlotsHeadShapeThumbnail then
							value_1 = p10[tostring(Enum.AvatarAssetType.DynamicHead.Value)]
							
							if not value_1 then break end
							for i_4, v_4 in value_1 do
								var12 = if v_4.headShape == "Default" then nil else v_4.headShape
							end
							var12 = nil
							if var12 then
								var11 = `rbxthumb://type=Asset&id={i_3}&headshape={var12}&w=150&h=150`
							end
						end
						table.insert(t, buildSlotSubcategory(v, var11, v_1))
						var9 = true
					end
				end
			end
			for i_1, v_1 in assetTypes do
				if v_1 == Enum.AvatarAssetType.Face and (var7 or var8) then
					table.insert(t, buildSlotSubcategory(v, getClassicFaceOrDynamicHeadThumbnail(p10, var7), v_1))
					var9 = true
				end
			end
			if not var9 then
				table.insert(t, buildSlotSubcategory(v))
			end
		end
		for i_3 = 0, v.layerLimit - 1 do
			var13 = false
			
			for var10, v_1 in v.assetTypes do
				local value = p10[tostring(v_1.Value)]
				
				if value ~= nil and next(value) then
					for var12, value_1 in value do
						if value_1.order == i_3 then
							v_4 = buildSlotSubcategory(v, `rbxthumb://type=Asset&id={var12}&w=150&h=150`, v_1)
							v_4.slotType = slotTypeModule.LayeredSlot
							v_4.layerLimit = v.layerLimit
							v_4.layerIndex = i_3
							table.insert(t, v_4)
							var13 = true
							continue
						end
					end
				end
			end
			if not var13 then
				var10 = buildSlotSubcategory(v, nil, nil)
				var10.slotType = slotTypeModule.LayeredSlot
				var10.layerLimit = v.layerLimit
				var10.layerIndex = i_3
				table.insert(t, var10)
			end
		end
	end
	return t
end