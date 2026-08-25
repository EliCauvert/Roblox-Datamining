local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		title = if p0 == nil or p0.title == nil then "" else p0.title,
		name = if p0 == nil or p0.name == nil then "" else p0.name,
		taxonomy_id = if p0 == nil or p0.taxonomy_id == nil then "" else p0.taxonomy_id,
		buttons_enabled = if p0 == nil or p0.buttons_enabled == nil then {} else p0.buttons_enabled,
		subcategories = if p0 == nil or p0.subcategories == nil then {} else p0.subcategories,
		default_subcategory_id = if p0 == nil or p0.default_subcategory_id == nil then "" else p0.default_subcategory_id,
		asset_types = if p0 == nil or p0.asset_types == nil then {} else p0.asset_types,
		bundle_types = if p0 == nil or p0.bundle_types == nil then {} else p0.bundle_types,
		can_animate_camera_based_mood = if p0 == nil or p0.can_animate_camera_based_mood == nil then false else p0.can_animate_camera_based_mood,
		camera_focus = if p0 == nil or p0.camera_focus == nil then "" else p0.camera_focus,
		camera_zoom_radius = if p0 == nil or p0.camera_zoom_radius == nil then 0 else p0.camera_zoom_radius,
		tile_type = if p0 == nil or p0.tile_type == nil then "" else p0.tile_type,
		looks_widget_context_for_organic_content = if p0 == nil or p0.looks_widget_context_for_organic_content == nil then "" else p0.looks_widget_context_for_organic_content,
		time_to_refresh = if p0 == nil or p0.time_to_refresh == nil then 0 else p0.time_to_refresh,
		category_id = if p0 == nil or p0.category_id == nil then 0 else p0.category_id,
		subcategory_id = if p0 == nil or p0.subcategory_id == nil then 0 else p0.subcategory_id
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var5, 1, protoModule.wireTypes.lengthDelimited)
		var6, var7 = protoModule.writeString(var6, var7, self.id)
		buff = var6
		var5 = var7
	end
	if self.title ~= nil and self.title ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var5, 2, protoModule.wireTypes.lengthDelimited)
		var8, var9 = protoModule.writeString(var8, var9, self.title)
		buff = var8
		var5 = var9
	end
	if self.name ~= nil and self.name ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var5, 3, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.name)
		buff = var10
		var5 = var11
	end
	if self.taxonomy_id ~= nil and self.taxonomy_id ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var5, 4, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.taxonomy_id)
		buff = var12
		var5 = var13
	end
	if self.buttons_enabled ~= nil and #self.buttons_enabled > 0 then
		for i, v in self.buttons_enabled do
			local var14, var15 = protoModule.writeTag(buff, var5, 5, protoModule.wireTypes.lengthDelimited)
			var14, var15 = protoModule.writeString(var14, var15, v)
			buff = var14
			var5 = var15
		end
	end
	if self.subcategories ~= nil and #self.subcategories > 0 then
		for i, v in self.subcategories do
			local var16, var17 = protoModule.writeTag(buff, var5, 6, protoModule.wireTypes.lengthDelimited)
			var16, var17 = protoModule.writeString(var16, var17, v)
			buff = var16
			var5 = var17
		end
	end
	if self.default_subcategory_id ~= nil and self.default_subcategory_id ~= "" then
		local var18, var19 = protoModule.writeTag(buff, var5, 7, protoModule.wireTypes.lengthDelimited)
		var18, var19 = protoModule.writeString(var18, var19, self.default_subcategory_id)
		buff = var18
		var5 = var19
	end
	if self.asset_types ~= nil and #self.asset_types > 0 then
		for i, v in self.asset_types do
			local var20, var21 = protoModule.writeTag(buff, var5, 8, protoModule.wireTypes.lengthDelimited)
			var20, var21 = protoModule.writeString(var20, var21, v)
			buff = var20
			var5 = var21
		end
	end
	if self.bundle_types ~= nil and #self.bundle_types > 0 then
		for i, v in self.bundle_types do
			local var22, var23 = protoModule.writeTag(buff, var5, 9, protoModule.wireTypes.lengthDelimited)
			var22, var23 = protoModule.writeString(var22, var23, v)
			buff = var22
			var5 = var23
		end
	end
	if self.can_animate_camera_based_mood then
		local var24, var25 = protoModule.writeTag(buff, var5, 10, protoModule.wireTypes.varint)
		var24, var25 = protoModule.writeVarInt(var24, var25, if self.can_animate_camera_based_mood then 1 else 0)
		buff = var24
		var5 = var25
	end
	if self.camera_focus ~= nil and self.camera_focus ~= "" then
		local var26, var27 = protoModule.writeTag(buff, var5, 11, protoModule.wireTypes.lengthDelimited)
		var26, var27 = protoModule.writeString(var26, var27, self.camera_focus)
		buff = var26
		var5 = var27
	end
	if self.camera_zoom_radius ~= nil and self.camera_zoom_radius ~= 0 then
		local var28, var29 = protoModule.writeTag(buff, var5, 12, protoModule.wireTypes.i32)
		var28, var29 = protoModule.writeFloat(var28, var29, self.camera_zoom_radius)
		buff = var28
		var5 = var29
	end
	if self.tile_type ~= nil and self.tile_type ~= "" then
		local var30, var31 = protoModule.writeTag(buff, var5, 13, protoModule.wireTypes.lengthDelimited)
		var30, var31 = protoModule.writeString(var30, var31, self.tile_type)
		buff = var30
		var5 = var31
	end
	if self.looks_widget_context_for_organic_content ~= nil and self.looks_widget_context_for_organic_content ~= "" then
		local var32, var33 = protoModule.writeTag(buff, var5, 14, protoModule.wireTypes.lengthDelimited)
		var32, var33 = protoModule.writeString(var32, var33, self.looks_widget_context_for_organic_content)
		buff = var32
		var5 = var33
	end
	if self.time_to_refresh ~= nil and self.time_to_refresh ~= 0 then
		local var34, var35 = protoModule.writeTag(buff, var5, 15, protoModule.wireTypes.varint)
		var34, var35 = protoModule.writeVarInt(var34, var35, self.time_to_refresh)
		buff = var34
		var5 = var35
	end
	if self.category_id ~= nil and self.category_id ~= 0 then
		local var36, var37 = protoModule.writeTag(buff, var5, 16, protoModule.wireTypes.varint)
		var36, var37 = protoModule.writeVarInt(var36, var37, self.category_id)
		buff = var36
		var5 = var37
	end
	if self.subcategory_id ~= nil and self.subcategory_id ~= 0 then
		local var38, var39 = protoModule.writeTag(buff, var5, 17, protoModule.wireTypes.varint)
		var38, var39 = protoModule.writeVarInt(var38, var39, self.subcategory_id)
		buff = var38
		var5 = var39
	end
	local buff_1 = buffer.create(var5)
	buffer.copy(buff_1, 0, buff, 0, var5)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var41 = t_1.new()
	local var42 = 0
	while var42 < buffer.len(p1) do
		local _ = nil
		local var43 = nil
		local var44, var45, var46 = protoModule.readTag(p1, var42)
		local var47 = var44
		var43 = var45
		var42 = var46
		
		if var43 == protoModule.wireTypes.varint then
			if var47 == 10 then
				local _ = nil
				local var48, var49 = protoModule.readVarInt(p1, var42)
				var42 = var49
				var41.can_animate_camera_based_mood = var48 ~= 0
			elseif var47 == 15 then
				local _ = nil
				local var50, var51 = protoModule.readVarIntI64(p1, var42)
				var42 = var51
				var41.time_to_refresh = var50
			elseif var47 == 16 then
				local _ = nil
				local var52, var53 = protoModule.readVarIntI64(p1, var42)
				var42 = var53
				var41.category_id = var52
			elseif var47 == 17 then
				local _ = nil
				local var54, var55 = protoModule.readVarIntI64(p1, var42)
				var42 = var55
				var41.subcategory_id = var54
			else
				local _ = nil
				local var56, var57 = protoModule.readVarInt(p1, var42)
				local _ = var56
				var42 = var57
			end
		end
		if var43 == protoModule.wireTypes.lengthDelimited then
			if var47 == 1 then
				local _ = nil
				local var58, var59 = protoModule.readBuffer(p1, var42)
				var42 = var59
				var41.id = buffer.tostring(var58)
			elseif var47 == 2 then
				local _ = nil
				local var60, var61 = protoModule.readBuffer(p1, var42)
				var42 = var61
				var41.title = buffer.tostring(var60)
			elseif var47 == 3 then
				local _ = nil
				local var62, var63 = protoModule.readBuffer(p1, var42)
				var42 = var63
				var41.name = buffer.tostring(var62)
			elseif var47 == 4 then
				local _ = nil
				local var64, var65 = protoModule.readBuffer(p1, var42)
				var42 = var65
				var41.taxonomy_id = buffer.tostring(var64)
			elseif var47 == 5 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p1, var42)
				var42 = var67
				table.insert(var41.buttons_enabled, buffer.tostring(var66))
			elseif var47 == 6 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p1, var42)
				var42 = var69
				table.insert(var41.subcategories, buffer.tostring(var68))
			elseif var47 == 7 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p1, var42)
				var42 = var71
				var41.default_subcategory_id = buffer.tostring(var70)
			elseif var47 == 8 then
				local _ = nil
				local var72, var73 = protoModule.readBuffer(p1, var42)
				var42 = var73
				table.insert(var41.asset_types, buffer.tostring(var72))
			elseif var47 == 9 then
				local _ = nil
				local var74, var75 = protoModule.readBuffer(p1, var42)
				var42 = var75
				table.insert(var41.bundle_types, buffer.tostring(var74))
			elseif var47 == 11 then
				local _ = nil
				local var76, var77 = protoModule.readBuffer(p1, var42)
				var42 = var77
				var41.camera_focus = buffer.tostring(var76)
			elseif var47 == 13 then
				local _ = nil
				local var78, var79 = protoModule.readBuffer(p1, var42)
				var42 = var79
				var41.tile_type = buffer.tostring(var78)
			elseif var47 == 14 then
				local _ = nil
				local var80, var81 = protoModule.readBuffer(p1, var42)
				var42 = var81
				var41.looks_widget_context_for_organic_content = buffer.tostring(var80)
			else
				local _ = nil
				local var82, var83 = protoModule.readVarInt(p1, var42)
				var42 = var83 + var82
			end
		elseif var43 == protoModule.wireTypes.i32 then
			if var47 == 12 then
				local _ = nil
				local var84, var85 = protoModule.readFloat(p1, var42)
				var42 = var85
				var41.camera_zoom_radius = var84
			else
				local _ = nil
				local var86, var87 = protoModule.readFixed32(p1, var42)
				local _ = var86
				var42 = var87
			end
		elseif var43 == protoModule.wireTypes.i64 then
			local _ = nil
			local var88, var89 = protoModule.readFixed64(p1, var42)
			local _ = var88
			var42 = var89
		else
			error("Unsupported wire type: " .. var43)
		end
	end
	return var41
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
	local var95 = t_1.new()
	
	if self.id ~= nil then
		var95.id = self.id
	end
	if self.title ~= nil then
		var95.title = self.title
	end
	if self.name ~= nil then
		var95.name = self.name
	end
	if self.taxonomy_id ~= nil then
		var95.taxonomy_id = self.taxonomy_id
	end
	if self.taxonomyId ~= nil then
		var95.taxonomy_id = self.taxonomyId
	end
	if self.buttons_enabled ~= nil then
		local t = {}
		
		for i, v in self.buttons_enabled do
			table.insert(t, v)
		end
		var95.buttons_enabled = t
	end
	if self.buttonsEnabled ~= nil then
		local t = {}
		
		for i, v in self.buttonsEnabled do
			table.insert(t, v)
		end
		var95.buttons_enabled = t
	end
	if self.subcategories ~= nil then
		local t = {}
		
		for i, v in self.subcategories do
			table.insert(t, v)
		end
		var95.subcategories = t
	end
	if self.default_subcategory_id ~= nil then
		var95.default_subcategory_id = self.default_subcategory_id
	end
	if self.defaultSubcategoryId ~= nil then
		var95.default_subcategory_id = self.defaultSubcategoryId
	end
	if self.asset_types ~= nil then
		local t = {}
		
		for i, v in self.asset_types do
			table.insert(t, v)
		end
		var95.asset_types = t
	end
	if self.assetTypes ~= nil then
		local t = {}
		
		for i, v in self.assetTypes do
			table.insert(t, v)
		end
		var95.asset_types = t
	end
	if self.bundle_types ~= nil then
		local t = {}
		
		for i, v in self.bundle_types do
			table.insert(t, v)
		end
		var95.bundle_types = t
	end
	if self.bundleTypes ~= nil then
		local t = {}
		
		for i, v in self.bundleTypes do
			table.insert(t, v)
		end
		var95.bundle_types = t
	end
	if self.can_animate_camera_based_mood ~= nil then
		var95.can_animate_camera_based_mood = self.can_animate_camera_based_mood
	end
	if self.canAnimateCameraBasedMood ~= nil then
		var95.can_animate_camera_based_mood = self.canAnimateCameraBasedMood
	end
	if self.camera_focus ~= nil then
		var95.camera_focus = self.camera_focus
	end
	if self.cameraFocus ~= nil then
		var95.camera_focus = self.cameraFocus
	end
	if self.camera_zoom_radius ~= nil then
		var95.camera_zoom_radius = protoModule.json.deserializeNumber(self.camera_zoom_radius)
	end
	if self.cameraZoomRadius ~= nil then
		var95.camera_zoom_radius = protoModule.json.deserializeNumber(self.cameraZoomRadius)
	end
	if self.tile_type ~= nil then
		var95.tile_type = self.tile_type
	end
	if self.tileType ~= nil then
		var95.tile_type = self.tileType
	end
	if self.looks_widget_context_for_organic_content ~= nil then
		var95.looks_widget_context_for_organic_content = self.looks_widget_context_for_organic_content
	end
	if self.looksWidgetContextForOrganicContent ~= nil then
		var95.looks_widget_context_for_organic_content = self.looksWidgetContextForOrganicContent
	end
	if self.time_to_refresh ~= nil then
		var95.time_to_refresh = self.time_to_refresh
	end
	if self.timeToRefresh ~= nil then
		var95.time_to_refresh = self.timeToRefresh
	end
	if self.category_id ~= nil then
		var95.category_id = self.category_id
	end
	if self.categoryId ~= nil then
		var95.category_id = self.categoryId
	end
	if self.subcategory_id ~= nil then
		var95.subcategory_id = self.subcategory_id
	end
	if self.subcategoryId ~= nil then
		var95.subcategory_id = self.subcategoryId
	end
	return var95
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