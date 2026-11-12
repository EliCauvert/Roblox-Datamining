local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		title = if p1 == nil or p1.title == nil then "" else p1.title,
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		taxonomy_id = if p1 == nil or p1.taxonomy_id == nil then "" else p1.taxonomy_id,
		buttons_enabled = if p1 == nil or p1.buttons_enabled == nil then {} else p1.buttons_enabled,
		subcategories = if p1 == nil or p1.subcategories == nil then {} else p1.subcategories,
		default_subcategory_id = if p1 == nil or p1.default_subcategory_id == nil then "" else p1.default_subcategory_id,
		asset_types = if p1 == nil or p1.asset_types == nil then {} else p1.asset_types,
		bundle_types = if p1 == nil or p1.bundle_types == nil then {} else p1.bundle_types,
		can_animate_camera_based_mood = p1 ~= nil and p1.can_animate_camera_based_mood ~= nil and p1.can_animate_camera_based_mood,
		camera_focus = if p1 == nil or p1.camera_focus == nil then "" else p1.camera_focus,
		camera_zoom_radius = if p1 == nil or p1.camera_zoom_radius == nil then 0 else p1.camera_zoom_radius,
		tile_type = if p1 == nil or p1.tile_type == nil then "" else p1.tile_type,
		looks_widget_context_for_organic_content = if p1 == nil or p1.looks_widget_context_for_organic_content == nil then "" else p1.looks_widget_context_for_organic_content,
		time_to_refresh = if p1 == nil or p1.time_to_refresh == nil then 0 else p1.time_to_refresh,
		category_id = if p1 == nil or p1.category_id == nil then 0 else p1.category_id,
		subcategory_id = if p1 == nil or p1.subcategory_id == nil then 0 else p1.subcategory_id
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.id ~= nil and self.id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.id)
	end
	if self.title ~= nil and self.title ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.title)
	end
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.name)
	end
	if self.taxonomy_id ~= nil and self.taxonomy_id ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.taxonomy_id)
	end
	if self.buttons_enabled ~= nil and #self.buttons_enabled > 0 then
		for _, value in self.buttons_enabled do
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, value)
		end
	end
	if self.subcategories ~= nil and #self.subcategories > 0 then
		for _, subcategory in self.subcategories do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, subcategory)
		end
	end
	if self.default_subcategory_id ~= nil and self.default_subcategory_id ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.default_subcategory_id)
	end
	if self.asset_types ~= nil and #self.asset_types > 0 then
		for _, assetType in self.asset_types do
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, assetType)
		end
	end
	if self.bundle_types ~= nil and #self.bundle_types > 0 then
		for _, bundleType in self.bundle_types do
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, bundleType)
		end
	end
	if self.can_animate_camera_based_mood then
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 10, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult10, WriteTagResult2_9, if self.can_animate_camera_based_mood then 1 else 0)
	end
	if self.camera_focus ~= nil and self.camera_focus ~= "" then
		local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 11, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult11, WriteTagResult2_10, self.camera_focus)
	end
	if self.camera_zoom_radius ~= nil and self.camera_zoom_radius ~= 0 then
		local WriteTagResult12, WriteTagResult2_11 = ProtoModule.writeTag(Buf, Count, 12, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult12, WriteTagResult2_11, self.camera_zoom_radius)
	end
	if self.tile_type ~= nil and self.tile_type ~= "" then
		local WriteTagResult13, WriteTagResult2_12 = ProtoModule.writeTag(Buf, Count, 13, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult13, WriteTagResult2_12, self.tile_type)
	end
	if self.looks_widget_context_for_organic_content ~= nil and self.looks_widget_context_for_organic_content ~= "" then
		local WriteTagResult14, WriteTagResult2_13 = ProtoModule.writeTag(Buf, Count, 14, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult14, WriteTagResult2_13, self.looks_widget_context_for_organic_content)
	end
	if self.time_to_refresh ~= nil and self.time_to_refresh ~= 0 then
		local WriteTagResult15, WriteTagResult2_14 = ProtoModule.writeTag(Buf, Count, 15, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult15, WriteTagResult2_14, self.time_to_refresh)
	end
	if self.category_id ~= nil and self.category_id ~= 0 then
		local WriteTagResult16, WriteTagResult2_15 = ProtoModule.writeTag(Buf, Count, 16, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult16, WriteTagResult2_15, self.category_id)
	end
	if self.subcategory_id ~= nil and self.subcategory_id ~= 0 then
		local WriteTagResult17, WriteTagResult2_16 = ProtoModule.writeTag(Buf, Count, 17, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult17, WriteTagResult2_16, self.subcategory_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v41 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 10 then
				local VarInt
				VarInt, v41 = ProtoModule.readVarInt(Buf, v1)
				NewModule.can_animate_camera_based_mood = VarInt ~= 0
			elseif Tag == 15 then
				NewModule.time_to_refresh, v41 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 16 then
				NewModule.category_id, v41 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 17 then
				NewModule.subcategory_id, v41 = ProtoModule.readVarIntI64(Buf, v1)
			else
				local _
				_, v41 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.title = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer4
				Buffer4, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.name = buffer.tostring(Buffer4)
			elseif Tag == 4 then
				local Buffer6
				Buffer6, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.taxonomy_id = buffer.tostring(Buffer6)
			elseif Tag == 5 then
				local Buffer7
				Buffer7, v41 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.buttons_enabled, buffer.tostring(Buffer7))
			elseif Tag == 6 then
				local Buffer9
				Buffer9, v41 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.subcategories, buffer.tostring(Buffer9))
			elseif Tag == 7 then
				local Buffer11
				Buffer11, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.default_subcategory_id = buffer.tostring(Buffer11)
			elseif Tag == 8 then
				local Buffer12
				Buffer12, v41 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.asset_types, buffer.tostring(Buffer12))
			elseif Tag == 9 then
				local Buffer3
				Buffer3, v41 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.bundle_types, buffer.tostring(Buffer3))
			elseif Tag == 11 then
				local Buffer5
				Buffer5, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.camera_focus = buffer.tostring(Buffer5)
			elseif Tag == 13 then
				local Buffer8
				Buffer8, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.tile_type = buffer.tostring(Buffer8)
			elseif Tag == 14 then
				local Buffer10
				Buffer10, v41 = ProtoModule.readBuffer(Buf, v1)
				NewModule.looks_widget_context_for_organic_content = buffer.tostring(Buffer10)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 12 then
				NewModule.camera_zoom_radius, v41 = ProtoModule.readFloat(Buf, v1)
			else
				local _
				_, v41 = ProtoModule.readFixed32(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v41 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: ProtoModule (copy)
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
		local ButtonsEnabled = {}
		
		for _, value in self.buttons_enabled do
			table.insert(ButtonsEnabled, value)
		end
		t.buttonsEnabled = ButtonsEnabled
	end
	if self.subcategories ~= nil and #self.subcategories > 0 then
		local Subcategories = {}
		
		for _, subcategory in self.subcategories do
			table.insert(Subcategories, subcategory)
		end
		t.subcategories = Subcategories
	end
	if self.default_subcategory_id ~= nil and self.default_subcategory_id ~= "" then
		t.defaultSubcategoryId = self.default_subcategory_id
	end
	if self.asset_types ~= nil and #self.asset_types > 0 then
		local AssetTypes = {}
		
		for _, assetType in self.asset_types do
			table.insert(AssetTypes, assetType)
		end
		t.assetTypes = AssetTypes
	end
	if self.bundle_types ~= nil and #self.bundle_types > 0 then
		local BundleTypes = {}
		
		for _, bundleType in self.bundle_types do
			table.insert(BundleTypes, bundleType)
		end
		t.bundleTypes = BundleTypes
	end
	if self.can_animate_camera_based_mood then
		t.canAnimateCameraBasedMood = self.can_animate_camera_based_mood
	end
	if self.camera_focus ~= nil and self.camera_focus ~= "" then
		t.cameraFocus = self.camera_focus
	end
	if self.camera_zoom_radius ~= nil and self.camera_zoom_radius ~= 0 then
		t.cameraZoomRadius = ProtoModule.json.serializeNumber(self.camera_zoom_radius)
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

function Module:jsonDecode()
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	
	if self.id ~= nil then
		NewModule.id = self.id
	end
	if self.title ~= nil then
		NewModule.title = self.title
	end
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.taxonomy_id ~= nil then
		NewModule.taxonomy_id = self.taxonomy_id
	end
	if self.taxonomyId ~= nil then
		NewModule.taxonomy_id = self.taxonomyId
	end
	if self.buttons_enabled ~= nil then
		local Buttons_enabled = {}
		
		for _, value in self.buttons_enabled do
			table.insert(Buttons_enabled, value)
		end
		NewModule.buttons_enabled = Buttons_enabled
	end
	if self.buttonsEnabled ~= nil then
		local Buttons_enabled = {}
		
		for _, value1 in self.buttonsEnabled do
			table.insert(Buttons_enabled, value1)
		end
		NewModule.buttons_enabled = Buttons_enabled
	end
	if self.subcategories ~= nil then
		local Subcategories = {}
		
		for _, subcategory in self.subcategories do
			table.insert(Subcategories, subcategory)
		end
		NewModule.subcategories = Subcategories
	end
	if self.default_subcategory_id ~= nil then
		NewModule.default_subcategory_id = self.default_subcategory_id
	end
	if self.defaultSubcategoryId ~= nil then
		NewModule.default_subcategory_id = self.defaultSubcategoryId
	end
	if self.asset_types ~= nil then
		local Asset_types = {}
		
		for _, assetType in self.asset_types do
			table.insert(Asset_types, assetType)
		end
		NewModule.asset_types = Asset_types
	end
	if self.assetTypes ~= nil then
		local Asset_types = {}
		
		for _, assetType1 in self.assetTypes do
			table.insert(Asset_types, assetType1)
		end
		NewModule.asset_types = Asset_types
	end
	if self.bundle_types ~= nil then
		local Bundle_types = {}
		
		for _, bundleType in self.bundle_types do
			table.insert(Bundle_types, bundleType)
		end
		NewModule.bundle_types = Bundle_types
	end
	if self.bundleTypes ~= nil then
		local Bundle_types = {}
		
		for _, bundleType1 in self.bundleTypes do
			table.insert(Bundle_types, bundleType1)
		end
		NewModule.bundle_types = Bundle_types
	end
	if self.can_animate_camera_based_mood ~= nil then
		NewModule.can_animate_camera_based_mood = self.can_animate_camera_based_mood
	end
	if self.canAnimateCameraBasedMood ~= nil then
		NewModule.can_animate_camera_based_mood = self.canAnimateCameraBasedMood
	end
	if self.camera_focus ~= nil then
		NewModule.camera_focus = self.camera_focus
	end
	if self.cameraFocus ~= nil then
		NewModule.camera_focus = self.cameraFocus
	end
	if self.camera_zoom_radius ~= nil then
		NewModule.camera_zoom_radius = ProtoModule.json.deserializeNumber(self.camera_zoom_radius)
	end
	if self.cameraZoomRadius ~= nil then
		NewModule.camera_zoom_radius = ProtoModule.json.deserializeNumber(self.cameraZoomRadius)
	end
	if self.tile_type ~= nil then
		NewModule.tile_type = self.tile_type
	end
	if self.tileType ~= nil then
		NewModule.tile_type = self.tileType
	end
	if self.looks_widget_context_for_organic_content ~= nil then
		NewModule.looks_widget_context_for_organic_content = self.looks_widget_context_for_organic_content
	end
	if self.looksWidgetContextForOrganicContent ~= nil then
		NewModule.looks_widget_context_for_organic_content = self.looksWidgetContextForOrganicContent
	end
	if self.time_to_refresh ~= nil then
		NewModule.time_to_refresh = self.time_to_refresh
	end
	if self.timeToRefresh ~= nil then
		NewModule.time_to_refresh = self.timeToRefresh
	end
	if self.category_id ~= nil then
		NewModule.category_id = self.category_id
	end
	if self.categoryId ~= nil then
		NewModule.category_id = self.categoryId
	end
	if self.subcategory_id ~= nil then
		NewModule.subcategory_id = self.subcategory_id
	end
	if self.subcategoryId ~= nil then
		NewModule.subcategory_id = self.subcategoryId
	end
	return NewModule
end

Module.descriptor = {
	name = "MarketplaceCatalogCategoryData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryData"
}
local config = { MarketplaceCatalogCategoryData = Module }
TypeRegistryModule.default:register(config.MarketplaceCatalogCategoryData)

return {
	MarketplaceCatalogCategoryData = config.MarketplaceCatalogCategoryData
}