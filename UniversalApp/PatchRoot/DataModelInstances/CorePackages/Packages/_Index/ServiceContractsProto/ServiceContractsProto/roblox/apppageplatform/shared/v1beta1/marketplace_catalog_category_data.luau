local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		taxonomy_id = if p1 == nil or p1.taxonomy_id == nil then "" else p1.taxonomy_id,
		buttons_enabled = if p1 == nil or p1.buttons_enabled == nil then {} else p1.buttons_enabled,
		subcategories = if p1 == nil or p1.subcategories == nil then {} else p1.subcategories,
		default_subcategory_id = if p1 == nil or p1.default_subcategory_id == nil then "" else p1.default_subcategory_id,
		asset_types = if p1 == nil or p1.asset_types == nil then {} else p1.asset_types,
		bundle_types = if p1 == nil or p1.bundle_types == nil then {} else p1.bundle_types,
		can_animate_camera_based_mood = if p1 == nil or p1.can_animate_camera_based_mood == nil then false else p1.can_animate_camera_based_mood,
		camera_focus = if p1 == nil or p1.camera_focus == nil then "" else p1.camera_focus,
		camera_zoom_radius = if p1 == nil or p1.camera_zoom_radius == nil then 0 else p1.camera_zoom_radius,
		tile_type = if p1 == nil or p1.tile_type == nil then "" else p1.tile_type,
		looks_widget_context_for_organic_content = if p1 == nil or p1.looks_widget_context_for_organic_content == nil then "" else p1.looks_widget_context_for_organic_content,
		time_to_refresh = if p1 == nil or p1.time_to_refresh == nil then 0 else p1.time_to_refresh,
		category_id = if p1 == nil or p1.category_id == nil then 0 else p1.category_id,
		subcategory_id = if p1 == nil or p1.subcategory_id == nil then 0 else p1.subcategory_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var7 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.title ~= nil and self.title ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var9 = protoModule.writeString(var4, var5, self.title)
		buff = var4
		var1 = var5
	end
	if self.name ~= nil and self.name ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var11 = protoModule.writeString(var6, var7, self.name)
		buff = var6
		var1 = var7
	end
	if self.taxonomy_id ~= nil and self.taxonomy_id ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var13 = protoModule.writeString(var8, var9, self.taxonomy_id)
		buff = var8
		var1 = var9
	end
	if self.buttons_enabled ~= nil and #self.buttons_enabled > 0 then
		for i, v in self.buttons_enabled do
			local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var10, var15 = protoModule.writeString(var10, var11, v)
			buff = var10
			var1 = var11
		end
	end
	if self.subcategories ~= nil and #self.subcategories > 0 then
		for i, v in self.subcategories do
			local var12, var13 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var12, var17 = protoModule.writeString(var12, var13, v)
			buff = var12
			var1 = var13
		end
	end
	if self.default_subcategory_id ~= nil and self.default_subcategory_id ~= "" then
		local var14, var15 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
		var14, var19 = protoModule.writeString(var14, var15, self.default_subcategory_id)
		buff = var14
		var1 = var15
	end
	if self.asset_types ~= nil and #self.asset_types > 0 then
		for i, v in self.asset_types do
			local var16, var17 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var16, var21 = protoModule.writeString(var16, var17, v)
			buff = var16
			var1 = var17
		end
	end
	if self.bundle_types ~= nil and #self.bundle_types > 0 then
		for i, v in self.bundle_types do
			local var18, var19 = protoModule.writeTag(buff, var1, 9, protoModule.wireTypes.lengthDelimited)
			var18, var23 = protoModule.writeString(var18, var19, v)
			buff = var18
			var1 = var19
		end
	end
	if self.can_animate_camera_based_mood then
		local var20, var21 = protoModule.writeTag(buff, var1, 10, protoModule.wireTypes.varint)
		var20, var25 = protoModule.writeVarInt(var20, var21, if self.can_animate_camera_based_mood then 1 else 0)
		buff = var20
		var1 = var21
	end
	if self.camera_focus ~= nil and self.camera_focus ~= "" then
		local var22, var23 = protoModule.writeTag(buff, var1, 11, protoModule.wireTypes.lengthDelimited)
		var22, var27 = protoModule.writeString(var22, var23, self.camera_focus)
		buff = var22
		var1 = var23
	end
	if self.camera_zoom_radius ~= nil and self.camera_zoom_radius ~= 0 then
		local var24, var25 = protoModule.writeTag(buff, var1, 12, protoModule.wireTypes.i32)
		var24, var29 = protoModule.writeFloat(var24, var25, self.camera_zoom_radius)
		buff = var24
		var1 = var25
	end
	if self.tile_type ~= nil and self.tile_type ~= "" then
		local var26, var27 = protoModule.writeTag(buff, var1, 13, protoModule.wireTypes.lengthDelimited)
		var26, var31 = protoModule.writeString(var26, var27, self.tile_type)
		buff = var26
		var1 = var27
	end
	if self.looks_widget_context_for_organic_content ~= nil and self.looks_widget_context_for_organic_content ~= "" then
		local var28, var29 = protoModule.writeTag(buff, var1, 14, protoModule.wireTypes.lengthDelimited)
		var28, var33 = protoModule.writeString(var28, var29, self.looks_widget_context_for_organic_content)
		buff = var28
		var1 = var29
	end
	if self.time_to_refresh ~= nil and self.time_to_refresh ~= 0 then
		local var30, var31 = protoModule.writeTag(buff, var1, 15, protoModule.wireTypes.varint)
		var30, var35 = protoModule.writeVarInt(var30, var31, self.time_to_refresh)
		buff = var30
		var1 = var31
	end
	if self.category_id ~= nil and self.category_id ~= 0 then
		local var32, var33 = protoModule.writeTag(buff, var1, 16, protoModule.wireTypes.varint)
		var32, var37 = protoModule.writeVarInt(var32, var33, self.category_id)
		buff = var32
		var1 = var33
	end
	if self.subcategory_id ~= nil and self.subcategory_id ~= 0 then
		local var34, var35 = protoModule.writeTag(buff, var1, 17, protoModule.wireTypes.varint)
		var34, var39 = protoModule.writeVarInt(var34, var35, self.subcategory_id)
		buff = var34
		var1 = var35
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var36 = t_1.new()
	local var37 = 0
	while var37 < buffer.len(p1) do
		local _ = nil
		local var38 = nil
		local var39, var40, var41 = protoModule.readTag(p1, var37)
		local var42 = var39
		var38 = var40
		var37 = var41
		
		if var38 == protoModule.wireTypes.varint then
			if var42 == 10 then
				local _ = nil
				local var43, var44 = protoModule.readVarInt(p1, var37)
				var37 = var44
				var36.can_animate_camera_based_mood = var43 ~= 0
			elseif var42 == 15 then
				local _ = nil
				local var45, var46 = protoModule.readVarIntI64(p1, var37)
				var37 = var46
				var36.time_to_refresh = var45
			elseif var42 == 16 then
				local _ = nil
				local var47, var48 = protoModule.readVarIntI64(p1, var37)
				var37 = var48
				var36.category_id = var47
			elseif var42 == 17 then
				local _ = nil
				local var49, var50 = protoModule.readVarIntI64(p1, var37)
				var37 = var50
				var36.subcategory_id = var49
			else
				local _ = nil
				local var51, var52 = protoModule.readVarInt(p1, var37)
				local _ = var51
				var37 = var52
			end
		end
		if var38 == protoModule.wireTypes.lengthDelimited then
			if var42 == 1 then
				local _ = nil
				local var53, var54 = protoModule.readBuffer(p1, var37)
				var37 = var54
				var36.id = buffer.tostring(var53)
			elseif var42 == 2 then
				local _ = nil
				local var55, var56 = protoModule.readBuffer(p1, var37)
				var37 = var56
				var36.title = buffer.tostring(var55)
			elseif var42 == 3 then
				local _ = nil
				local var57, var58 = protoModule.readBuffer(p1, var37)
				var37 = var58
				var36.name = buffer.tostring(var57)
			elseif var42 == 4 then
				local _ = nil
				local var59, var60 = protoModule.readBuffer(p1, var37)
				var37 = var60
				var36.taxonomy_id = buffer.tostring(var59)
			elseif var42 == 5 then
				local _ = nil
				local var61, var62 = protoModule.readBuffer(p1, var37)
				var37 = var62
				table.insert(var36.buttons_enabled, buffer.tostring(var61))
			elseif var42 == 6 then
				local _ = nil
				local var63, var64 = protoModule.readBuffer(p1, var37)
				var37 = var64
				table.insert(var36.subcategories, buffer.tostring(var63))
			elseif var42 == 7 then
				local _ = nil
				local var65, var66 = protoModule.readBuffer(p1, var37)
				var37 = var66
				var36.default_subcategory_id = buffer.tostring(var65)
			elseif var42 == 8 then
				local _ = nil
				local var67, var68 = protoModule.readBuffer(p1, var37)
				var37 = var68
				table.insert(var36.asset_types, buffer.tostring(var67))
			elseif var42 == 9 then
				local _ = nil
				local var69, var70 = protoModule.readBuffer(p1, var37)
				var37 = var70
				table.insert(var36.bundle_types, buffer.tostring(var69))
			elseif var42 == 11 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p1, var37)
				var37 = var72
				var36.camera_focus = buffer.tostring(var71)
			elseif var42 == 13 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p1, var37)
				var37 = var74
				var36.tile_type = buffer.tostring(var73)
			elseif var42 == 14 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p1, var37)
				var37 = var76
				var36.looks_widget_context_for_organic_content = buffer.tostring(var75)
			else
				local _ = nil
				local var77, var78 = protoModule.readVarInt(p1, var37)
				var37 = var78 + var77
			end
		elseif var38 == protoModule.wireTypes.i32 then
			if var42 == 12 then
				local _ = nil
				local var79, var80 = protoModule.readFloat(p1, var37)
				var37 = var80
				var36.camera_zoom_radius = var79
			else
				local _ = nil
				local var81, var82 = protoModule.readFixed32(p1, var37)
				local _ = var81
				var37 = var82
			end
		elseif var38 == protoModule.wireTypes.i64 then
			local _ = nil
			local var83, var84 = protoModule.readFixed64(p1, var37)
			local _ = var83
			var37 = var84
		else
			error("Unsupported wire type: " .. var43)
		end
	end
	return var36
end

function t_1:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.taxonomy_id ~= nil and self.taxonomy_id ~= "" then
		t.taxonomyId = self.taxonomy_id
	end
	if self.buttons_enabled ~= nil and #self.buttons_enabled > 0 then
		local t_1 = {}
		
		for i, v in self.buttons_enabled do
			table.insert(t_1, v)
		end
		t.buttonsEnabled = t_1
	end
	if self.subcategories ~= nil and #self.subcategories > 0 then
		local t_1 = {}
		
		for i, v in self.subcategories do
			table.insert(t_1, v)
		end
		t.subcategories = t_1
	end
	if self.default_subcategory_id ~= nil and self.default_subcategory_id ~= "" then
		t.defaultSubcategoryId = self.default_subcategory_id
	end
	if self.asset_types ~= nil and #self.asset_types > 0 then
		local t_1 = {}
		
		for i, v in self.asset_types do
			table.insert(t_1, v)
		end
		t.assetTypes = t_1
	end
	if self.bundle_types ~= nil and #self.bundle_types > 0 then
		local t_1 = {}
		
		for i, v in self.bundle_types do
			table.insert(t_1, v)
		end
		t.bundleTypes = t_1
	end
	if self.can_animate_camera_based_mood then
		t.canAnimateCameraBasedMood = self.can_animate_camera_based_mood
	end
	if self.camera_focus ~= nil and self.camera_focus ~= "" then
		t.cameraFocus = self.camera_focus
	end
	if self.camera_zoom_radius ~= nil and self.camera_zoom_radius ~= 0 then
		t.cameraZoomRadius = protoModule.json.serializeNumber(self.camera_zoom_radius)
	end
	if self.tile_type ~= nil and self.tile_type ~= "" then
		t.tileType = self.tile_type
	end
	if self.looks_widget_context_for_organic_content ~= nil and self.looks_widget_context_for_organic_content ~= "" then
		t.looksWidgetContextForOrganicContent = self.looks_widget_context_for_organic_content
	end
	if self.time_to_refresh ~= nil and self.time_to_refresh ~= 0 then
		t.timeToRefresh = self.time_to_refresh
	end
	if self.category_id ~= nil and self.category_id ~= 0 then
		t.categoryId = self.category_id
	end
	if self.subcategory_id ~= nil and self.subcategory_id ~= 0 then
		t.subcategoryId = self.subcategory_id
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), protoModule (ref)
	local var85 = t_1.new()
	
	if self.id ~= nil then
		var85.id = self.id
	end
	if self.title ~= nil then
		var85.title = self.title
	end
	if self.name ~= nil then
		var85.name = self.name
	end
	if self.taxonomy_id ~= nil then
		var85.taxonomy_id = self.taxonomy_id
	end
	if self.taxonomyId ~= nil then
		var85.taxonomy_id = self.taxonomyId
	end
	if self.buttons_enabled ~= nil then
		local t = {}
		
		for i, v in self.buttons_enabled do
			table.insert(t, v)
		end
		var85.buttons_enabled = t
	end
	if self.buttonsEnabled ~= nil then
		local t = {}
		
		for i, v in self.buttonsEnabled do
			table.insert(t, v)
		end
		var85.buttons_enabled = t
	end
	if self.subcategories ~= nil then
		local t = {}
		
		for i, v in self.subcategories do
			table.insert(t, v)
		end
		var85.subcategories = t
	end
	if self.default_subcategory_id ~= nil then
		var85.default_subcategory_id = self.default_subcategory_id
	end
	if self.defaultSubcategoryId ~= nil then
		var85.default_subcategory_id = self.defaultSubcategoryId
	end
	if self.asset_types ~= nil then
		local t = {}
		
		for i, v in self.asset_types do
			table.insert(t, v)
		end
		var85.asset_types = t
	end
	if self.assetTypes ~= nil then
		local t = {}
		
		for i, v in self.assetTypes do
			table.insert(t, v)
		end
		var85.asset_types = t
	end
	if self.bundle_types ~= nil then
		local t = {}
		
		for i, v in self.bundle_types do
			table.insert(t, v)
		end
		var85.bundle_types = t
	end
	if self.bundleTypes ~= nil then
		local t = {}
		
		for i, v in self.bundleTypes do
			table.insert(t, v)
		end
		var85.bundle_types = t
	end
	if self.can_animate_camera_based_mood ~= nil then
		var85.can_animate_camera_based_mood = self.can_animate_camera_based_mood
	end
	if self.canAnimateCameraBasedMood ~= nil then
		var85.can_animate_camera_based_mood = self.canAnimateCameraBasedMood
	end
	if self.camera_focus ~= nil then
		var85.camera_focus = self.camera_focus
	end
	if self.cameraFocus ~= nil then
		var85.camera_focus = self.cameraFocus
	end
	if self.camera_zoom_radius ~= nil then
		var85.camera_zoom_radius = protoModule.json.deserializeNumber(self.camera_zoom_radius)
	end
	if self.cameraZoomRadius ~= nil then
		var85.camera_zoom_radius = protoModule.json.deserializeNumber(self.cameraZoomRadius)
	end
	if self.tile_type ~= nil then
		var85.tile_type = self.tile_type
	end
	if self.tileType ~= nil then
		var85.tile_type = self.tileType
	end
	if self.looks_widget_context_for_organic_content ~= nil then
		var85.looks_widget_context_for_organic_content = self.looks_widget_context_for_organic_content
	end
	if self.looksWidgetContextForOrganicContent ~= nil then
		var85.looks_widget_context_for_organic_content = self.looksWidgetContextForOrganicContent
	end
	if self.time_to_refresh ~= nil then
		var85.time_to_refresh = self.time_to_refresh
	end
	if self.timeToRefresh ~= nil then
		var85.time_to_refresh = self.timeToRefresh
	end
	if self.category_id ~= nil then
		var85.category_id = self.category_id
	end
	if self.categoryId ~= nil then
		var85.category_id = self.categoryId
	end
	if self.subcategory_id ~= nil then
		var85.subcategory_id = self.subcategory_id
	end
	if self.subcategoryId ~= nil then
		var85.subcategory_id = self.subcategoryId
	end
	return var85
end

t_1.descriptor = {
	name = "MarketplaceCatalogCategoryData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryData"
}
t.MarketplaceCatalogCategoryData = t_1
typeRegistryModule.default:register(t.MarketplaceCatalogCategoryData)

return {
	MarketplaceCatalogCategoryData = t.MarketplaceCatalogCategoryData
}