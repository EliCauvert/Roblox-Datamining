local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p1 == nil or p1.id == nil then "" else p1.id,
		type = if p1 == nil or p1.type == nil then "" else p1.type,
		encrypted_ad_tracking_data = if p1 == nil or p1.encrypted_ad_tracking_data == nil then nil else p1.encrypted_ad_tracking_data
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var11 = protoModule.writeString(var2, var3, self.id)
		buff = var2
		var1 = var3
	end
	if self.type ~= nil and self.type ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var13 = protoModule.writeString(var4, var5, self.type)
		buff = var4
		var1 = var5
	end
	if self.encrypted_ad_tracking_data ~= nil then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var15 = protoModule.writeString(var6, var7, self.encrypted_ad_tracking_data)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var1 = t_1.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.id = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.type = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.encrypted_ad_tracking_data = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var19)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	if self.encrypted_ad_tracking_data ~= nil then
		t.encryptedAdTrackingData = self.encrypted_ad_tracking_data
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var22 = t_1.new()
	
	if self.id ~= nil then
		var22.id = self.id
	end
	if self.type ~= nil then
		var22.type = self.type
	end
	if self.encrypted_ad_tracking_data ~= nil then
		var22.encrypted_ad_tracking_data = self.encrypted_ad_tracking_data
	end
	if self.encryptedAdTrackingData ~= nil then
		var22.encrypted_ad_tracking_data = self.encryptedAdTrackingData
	end
	return var22
end

t_1.descriptor = {
	name = "CatalogSortContentData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContentData"
}
t.CatalogSortContentData = t_1
typeRegistryModule.default:register(t.CatalogSortContentData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		content_type = if p2 == nil or p2.content_type == nil then "" else p2.content_type
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var22 = 0
	
	if self.content_type ~= nil and self.content_type ~= "" then
		local var23, var24 = protoModule.writeTag(buff, var22, 1, protoModule.wireTypes.lengthDelimited)
		var23, var43 = protoModule.writeString(var23, var24, self.content_type)
		buff = var23
		var22 = var24
	end
	local buff_1 = buffer.create(var22)
	buffer.copy(buff_1, 0, buff, 0, var22)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var22 = t_2.new()
	local var23 = 0
	while var23 < buffer.len(p2) do
		local _ = nil
		local var24 = nil
		local var25, var26, var27 = protoModule.readTag(p2, var23)
		local var28 = var25
		var24 = var26
		var23 = var27
		
		if var24 == protoModule.wireTypes.varint then
			local _ = nil
			local var29, var30 = protoModule.readVarInt(p2, var23)
			local _ = var29
			var23 = var30
			continue
		end
		if var24 == protoModule.wireTypes.lengthDelimited then
			if var28 == 1 then
				local _ = nil
				local var31, var32 = protoModule.readBuffer(p2, var23)
				var23 = var32
				var22.content_type = buffer.tostring(var31)
			else
				local _ = nil
				local var33, var34 = protoModule.readVarInt(p2, var23)
				var23 = var34 + var33
			end
		elseif var24 == protoModule.wireTypes.i32 then
			local _ = nil
			local var35, var36 = protoModule.readFixed32(p2, var23)
			local _ = var35
			var23 = var36
		elseif var24 == protoModule.wireTypes.i64 then
			local _ = nil
			local var37, var38 = protoModule.readFixed64(p2, var23)
			local _ = var37
			var23 = var38
		else
			error("Unsupported wire type: " .. var47)
		end
	end
	return var22
end

function t_2:jsonEncode()
	local t = {}
	
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var39 = t_2.new()
	
	if self.content_type ~= nil then
		var39.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var39.content_type = self.contentType
	end
	return var39
end

t_2.descriptor = {
	name = "CatalogSortCardItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardItemFooter"
}
t.CatalogSortCardItemFooter = t_2
typeRegistryModule.default:register(t.CatalogSortCardItemFooter)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		thumbnail_aspect_ratio = if p3 == nil or p3.thumbnail_aspect_ratio == nil then "" else p3.thumbnail_aspect_ratio,
		background_layers = if p3 == nil or p3.background_layers == nil then {} else p3.background_layers
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var39 = 0
	
	if self.thumbnail_aspect_ratio ~= nil and self.thumbnail_aspect_ratio ~= "" then
		local var40, var41 = protoModule.writeTag(buff, var39, 1, protoModule.wireTypes.lengthDelimited)
		var40, var67 = protoModule.writeString(var40, var41, self.thumbnail_aspect_ratio)
		buff = var40
		var39 = var41
	end
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var42 = v:encode()
			local var43, var44 = protoModule.writeTag(buff, var39, 2, protoModule.wireTypes.lengthDelimited)
			var43, var70 = protoModule.writeBuffer(var43, var44, var42, buffer.len(var42))
			buff = var43
			var39 = var44
		end
	end
	local buff_1 = buffer.create(var39)
	buffer.copy(buff_1, 0, buff, 0, var39)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var45 = t_3.new()
	local var46 = 0
	while var46 < buffer.len(p3) do
		local _ = nil
		local var47 = nil
		local var48, var49, var50 = protoModule.readTag(p3, var46)
		local var51 = var48
		var47 = var49
		var46 = var50
		
		if var47 == protoModule.wireTypes.varint then
			local _ = nil
			local var52, var53 = protoModule.readVarInt(p3, var46)
			local _ = var52
			var46 = var53
			continue
		end
		if var47 == protoModule.wireTypes.lengthDelimited then
			if var51 == 1 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p3, var46)
				var46 = var55
				var45.thumbnail_aspect_ratio = buffer.tostring(var54)
			elseif var51 == 2 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p3, var46)
				var46 = var57
				table.insert(var45.background_layers, backgroundLayerModule.BackgroundLayer.decode(var56))
			else
				local _ = nil
				local var58, var59 = protoModule.readVarInt(p3, var46)
				var46 = var59 + var58
			end
		elseif var47 == protoModule.wireTypes.i32 then
			local _ = nil
			local var60, var61 = protoModule.readFixed32(p3, var46)
			local _ = var60
			var46 = var61
		elseif var47 == protoModule.wireTypes.i64 then
			local _ = nil
			local var62, var63 = protoModule.readFixed64(p3, var46)
			local _ = var62
			var46 = var63
		else
			error("Unsupported wire type: " .. var74)
		end
	end
	return var45
end

function t_3:jsonEncode()
	local t = {}
	
	if self.thumbnail_aspect_ratio ~= nil and self.thumbnail_aspect_ratio ~= "" then
		t.thumbnailAspectRatio = self.thumbnail_aspect_ratio
	end
	if self.background_layers ~= nil and #self.background_layers > 0 then
		local t_1 = {}
		
		for i, v in self.background_layers do
			table.insert(t_1, v:jsonEncode())
		end
		t.backgroundLayers = t_1
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), backgroundLayerModule (ref)
	local var64 = t_3.new()
	
	if self.thumbnail_aspect_ratio ~= nil then
		var64.thumbnail_aspect_ratio = self.thumbnail_aspect_ratio
	end
	if self.thumbnailAspectRatio ~= nil then
		var64.thumbnail_aspect_ratio = self.thumbnailAspectRatio
	end
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var64.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var64.background_layers = t
	end
	return var64
end

t_3.descriptor = {
	name = "CatalogSortCardStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardStyle"
}
t.CatalogSortCardStyle = t_3
typeRegistryModule.default:register(t.CatalogSortCardStyle)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		id = if p4 == nil or p4.id == nil then "" else p4.id,
		type = if p4 == nil or p4.type == nil then "" else p4.type,
		hydration_priority = if p4 == nil or p4.hydration_priority == nil then 0 else p4.hydration_priority,
		hydration_count = if p4 == nil or p4.hydration_count == nil then 0 else p4.hydration_count,
		content = if p4 == nil or p4.content == nil then {} else p4.content,
		preview_columns = if p4 == nil or p4.preview_columns == nil then 0 else p4.preview_columns,
		title = if p4 == nil or p4.title == nil then "" else p4.title,
		description = if p4 == nil or p4.description == nil then "" else p4.description,
		card_style = if p4 == nil or p4.card_style == nil then nil else p4.card_style,
		card_footers = if p4 == nil or p4.card_footers == nil then {} else p4.card_footers,
		tag_id = if p4 == nil or p4.tag_id == nil then "" else p4.tag_id
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var65 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var66, var67 = protoModule.writeTag(buff, var65, 1, protoModule.wireTypes.lengthDelimited)
		var66, var99 = protoModule.writeString(var66, var67, self.id)
		buff = var66
		var65 = var67
	end
	if self.type ~= nil and self.type ~= "" then
		local var68, var69 = protoModule.writeTag(buff, var65, 2, protoModule.wireTypes.lengthDelimited)
		var68, var101 = protoModule.writeString(var68, var69, self.type)
		buff = var68
		var65 = var69
	end
	if self.hydration_priority ~= nil and self.hydration_priority ~= 0 then
		local var70, var71 = protoModule.writeTag(buff, var65, 3, protoModule.wireTypes.varint)
		var70, var103 = protoModule.writeVarInt(var70, var71, self.hydration_priority)
		buff = var70
		var65 = var71
	end
	if self.hydration_count ~= nil and self.hydration_count ~= 0 then
		local var72, var73 = protoModule.writeTag(buff, var65, 4, protoModule.wireTypes.varint)
		var72, var105 = protoModule.writeVarInt(var72, var73, self.hydration_count)
		buff = var72
		var65 = var73
	end
	if self.content ~= nil and #self.content > 0 then
		for i, v in self.content do
			local var74 = v:encode()
			local var75, var76 = protoModule.writeTag(buff, var65, 5, protoModule.wireTypes.lengthDelimited)
			var75, var108 = protoModule.writeBuffer(var75, var76, var74, buffer.len(var74))
			buff = var75
			var65 = var76
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var77, var78 = protoModule.writeTag(buff, var65, 6, protoModule.wireTypes.varint)
		var77, var110 = protoModule.writeVarInt(var77, var78, self.preview_columns)
		buff = var77
		var65 = var78
	end
	if self.title ~= nil and self.title ~= "" then
		local var79, var80 = protoModule.writeTag(buff, var65, 7, protoModule.wireTypes.lengthDelimited)
		var79, var112 = protoModule.writeString(var79, var80, self.title)
		buff = var79
		var65 = var80
	end
	if self.description ~= nil and self.description ~= "" then
		local var81, var82 = protoModule.writeTag(buff, var65, 8, protoModule.wireTypes.lengthDelimited)
		var81, var114 = protoModule.writeString(var81, var82, self.description)
		buff = var81
		var65 = var82
	end
	if self.card_style ~= nil then
		local var83 = self.card_style:encode()
		local var84, var85 = protoModule.writeTag(buff, var65, 9, protoModule.wireTypes.lengthDelimited)
		var84, var117 = protoModule.writeBuffer(var84, var85, var83, buffer.len(var83))
		buff = var84
		var65 = var85
	end
	if self.card_footers ~= nil and #self.card_footers > 0 then
		for i, v in self.card_footers do
			local var86 = v:encode()
			local var87, var88 = protoModule.writeTag(buff, var65, 10, protoModule.wireTypes.lengthDelimited)
			var87, var120 = protoModule.writeBuffer(var87, var88, var86, buffer.len(var86))
			buff = var87
			var65 = var88
		end
	end
	if self.tag_id ~= nil and self.tag_id ~= "" then
		local var89, var90 = protoModule.writeTag(buff, var65, 11, protoModule.wireTypes.lengthDelimited)
		var89, var122 = protoModule.writeString(var89, var90, self.tag_id)
		buff = var89
		var65 = var90
	end
	local buff_1 = buffer.create(var65)
	buffer.copy(buff_1, 0, buff, 0, var65)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var91 = t_4.new()
	local var92 = 0
	while var92 < buffer.len(p4) do
		local _ = nil
		local var93 = nil
		local var94, var95, var96 = protoModule.readTag(p4, var92)
		local var97 = var94
		var93 = var95
		var92 = var96
		
		if var93 == protoModule.wireTypes.varint then
			if var97 == 3 then
				local _ = nil
				local var98, var99 = protoModule.readVarIntI32(p4, var92)
				var92 = var99
				var91.hydration_priority = var98
			elseif var97 == 4 then
				local _ = nil
				local var100, var101 = protoModule.readVarIntI32(p4, var92)
				var92 = var101
				var91.hydration_count = var100
			elseif var97 == 6 then
				local _ = nil
				local var102, var103 = protoModule.readVarIntI64(p4, var92)
				var92 = var103
				var91.preview_columns = var102
			else
				local _ = nil
				local var104, var105 = protoModule.readVarInt(p4, var92)
				local _ = var104
				var92 = var105
			end
		end
		if var93 == protoModule.wireTypes.lengthDelimited then
			if var97 == 1 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p4, var92)
				var92 = var107
				var91.id = buffer.tostring(var106)
			elseif var97 == 2 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p4, var92)
				var92 = var109
				var91.type = buffer.tostring(var108)
			elseif var97 == 5 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p4, var92)
				var92 = var111
				table.insert(var91.content, t.CatalogSortContentData.decode(var110))
			elseif var97 == 7 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p4, var92)
				var92 = var113
				var91.title = buffer.tostring(var112)
			elseif var97 == 8 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p4, var92)
				var92 = var115
				var91.description = buffer.tostring(var114)
			elseif var97 == 9 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p4, var92)
				var92 = var117
				var91.card_style = t.CatalogSortCardStyle.decode(var116)
			elseif var97 == 10 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p4, var92)
				var92 = var119
				table.insert(var91.card_footers, t.CatalogSortCardItemFooter.decode(var118))
			elseif var97 == 11 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p4, var92)
				var92 = var121
				var91.tag_id = buffer.tostring(var120)
			else
				local _ = nil
				local var122, var123 = protoModule.readVarInt(p4, var92)
				var92 = var123 + var122
			end
		elseif var93 == protoModule.wireTypes.i32 then
			local _ = nil
			local var124, var125 = protoModule.readFixed32(p4, var92)
			local _ = var124
			var92 = var125
		elseif var93 == protoModule.wireTypes.i64 then
			local _ = nil
			local var126, var127 = protoModule.readFixed64(p4, var92)
			local _ = var126
			var92 = var127
		else
			error("Unsupported wire type: " .. var126)
		end
	end
	return var91
end

function t_4:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	if self.hydration_priority ~= nil and self.hydration_priority ~= 0 then
		t.hydrationPriority = self.hydration_priority
	end
	if self.hydration_count ~= nil and self.hydration_count ~= 0 then
		t.hydrationCount = self.hydration_count
	end
	if self.content ~= nil and #self.content > 0 then
		local t_1 = {}
		
		for i, v in self.content do
			table.insert(t_1, v:jsonEncode())
		end
		t.content = t_1
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		t.previewColumns = self.preview_columns
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.card_style ~= nil then
		t.cardStyle = self.card_style:jsonEncode()
	end
	if self.card_footers ~= nil and #self.card_footers > 0 then
		local t_1 = {}
		
		for i, v in self.card_footers do
			table.insert(t_1, v:jsonEncode())
		end
		t.cardFooters = t_1
	end
	if self.tag_id ~= nil and self.tag_id ~= "" then
		t.tagId = self.tag_id
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var128 = t_4.new()
	
	if self.id ~= nil then
		var128.id = self.id
	end
	if self.type ~= nil then
		var128.type = self.type
	end
	if self.hydration_priority ~= nil then
		var128.hydration_priority = self.hydration_priority
	end
	if self.hydrationPriority ~= nil then
		var128.hydration_priority = self.hydrationPriority
	end
	if self.hydration_count ~= nil then
		var128.hydration_count = self.hydration_count
	end
	if self.hydrationCount ~= nil then
		var128.hydration_count = self.hydrationCount
	end
	if self.content ~= nil then
		local t_1 = {}
		
		for i, v in self.content do
			table.insert(t_1, t.CatalogSortContentData.jsonDecode(v))
		end
		var128.content = t_1
	end
	if self.preview_columns ~= nil then
		var128.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var128.preview_columns = self.previewColumns
	end
	if self.title ~= nil then
		var128.title = self.title
	end
	if self.description ~= nil then
		var128.description = self.description
	end
	if self.card_style ~= nil then
		var128.card_style = t.CatalogSortCardStyle.jsonDecode(self.card_style)
	end
	if self.cardStyle ~= nil then
		var128.card_style = t.CatalogSortCardStyle.jsonDecode(self.cardStyle)
	end
	if self.card_footers ~= nil then
		local t_1 = {}
		
		for i, v in self.card_footers do
			table.insert(t_1, t.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var128.card_footers = t_1
	end
	if self.cardFooters ~= nil then
		local t_1 = {}
		
		for i, v in self.cardFooters do
			table.insert(t_1, t.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var128.card_footers = t_1
	end
	if self.tag_id ~= nil then
		var128.tag_id = self.tag_id
	end
	if self.tagId ~= nil then
		var128.tag_id = self.tagId
	end
	return var128
end

t_4.descriptor = {
	name = "CatalogSortData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortData"
}
t.CatalogSortData = t_4
typeRegistryModule.default:register(t.CatalogSortData)

return {
	CatalogSortContentData = t.CatalogSortContentData,
	CatalogSortCardItemFooter = t.CatalogSortCardItemFooter,
	CatalogSortCardStyle = t.CatalogSortCardStyle,
	CatalogSortData = t.CatalogSortData
}