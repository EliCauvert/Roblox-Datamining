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
		type = if p1 == nil or p1.type == nil then "" else p1.type
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
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var17)
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
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var20 = t_1.new()
	
	if self.id ~= nil then
		var20.id = self.id
	end
	if self.type ~= nil then
		var20.type = self.type
	end
	return var20
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
	local var20 = 0
	
	if self.content_type ~= nil and self.content_type ~= "" then
		local var21, var22 = protoModule.writeTag(buff, var20, 1, protoModule.wireTypes.lengthDelimited)
		var21, var39 = protoModule.writeString(var21, var22, self.content_type)
		buff = var21
		var20 = var22
	end
	local buff_1 = buffer.create(var20)
	buffer.copy(buff_1, 0, buff, 0, var20)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var20 = t_2.new()
	local var21 = 0
	while var21 < buffer.len(p2) do
		local _ = nil
		local var22 = nil
		local var23, var24, var25 = protoModule.readTag(p2, var21)
		local var26 = var23
		var22 = var24
		var21 = var25
		
		if var22 == protoModule.wireTypes.varint then
			local _ = nil
			local var27, var28 = protoModule.readVarInt(p2, var21)
			local _ = var27
			var21 = var28
			continue
		end
		if var22 == protoModule.wireTypes.lengthDelimited then
			if var26 == 1 then
				local _ = nil
				local var29, var30 = protoModule.readBuffer(p2, var21)
				var21 = var30
				var20.content_type = buffer.tostring(var29)
			else
				local _ = nil
				local var31, var32 = protoModule.readVarInt(p2, var21)
				var21 = var32 + var31
			end
		elseif var22 == protoModule.wireTypes.i32 then
			local _ = nil
			local var33, var34 = protoModule.readFixed32(p2, var21)
			local _ = var33
			var21 = var34
		elseif var22 == protoModule.wireTypes.i64 then
			local _ = nil
			local var35, var36 = protoModule.readFixed64(p2, var21)
			local _ = var35
			var21 = var36
		else
			error("Unsupported wire type: " .. var43)
		end
	end
	return var20
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
	local var37 = t_2.new()
	
	if self.content_type ~= nil then
		var37.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var37.content_type = self.contentType
	end
	return var37
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
	local var37 = 0
	
	if self.thumbnail_aspect_ratio ~= nil and self.thumbnail_aspect_ratio ~= "" then
		local var38, var39 = protoModule.writeTag(buff, var37, 1, protoModule.wireTypes.lengthDelimited)
		var38, var63 = protoModule.writeString(var38, var39, self.thumbnail_aspect_ratio)
		buff = var38
		var37 = var39
	end
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var40 = v:encode()
			local var41, var42 = protoModule.writeTag(buff, var37, 2, protoModule.wireTypes.lengthDelimited)
			var41, var66 = protoModule.writeBuffer(var41, var42, var40, buffer.len(var40))
			buff = var41
			var37 = var42
		end
	end
	local buff_1 = buffer.create(var37)
	buffer.copy(buff_1, 0, buff, 0, var37)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var43 = t_3.new()
	local var44 = 0
	while var44 < buffer.len(p3) do
		local _ = nil
		local var45 = nil
		local var46, var47, var48 = protoModule.readTag(p3, var44)
		local var49 = var46
		var45 = var47
		var44 = var48
		
		if var45 == protoModule.wireTypes.varint then
			local _ = nil
			local var50, var51 = protoModule.readVarInt(p3, var44)
			local _ = var50
			var44 = var51
			continue
		end
		if var45 == protoModule.wireTypes.lengthDelimited then
			if var49 == 1 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p3, var44)
				var44 = var53
				var43.thumbnail_aspect_ratio = buffer.tostring(var52)
			elseif var49 == 2 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p3, var44)
				var44 = var55
				table.insert(var43.background_layers, backgroundLayerModule.BackgroundLayer.decode(var54))
			else
				local _ = nil
				local var56, var57 = protoModule.readVarInt(p3, var44)
				var44 = var57 + var56
			end
		elseif var45 == protoModule.wireTypes.i32 then
			local _ = nil
			local var58, var59 = protoModule.readFixed32(p3, var44)
			local _ = var58
			var44 = var59
		elseif var45 == protoModule.wireTypes.i64 then
			local _ = nil
			local var60, var61 = protoModule.readFixed64(p3, var44)
			local _ = var60
			var44 = var61
		else
			error("Unsupported wire type: " .. var70)
		end
	end
	return var43
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
	local var62 = t_3.new()
	
	if self.thumbnail_aspect_ratio ~= nil then
		var62.thumbnail_aspect_ratio = self.thumbnail_aspect_ratio
	end
	if self.thumbnailAspectRatio ~= nil then
		var62.thumbnail_aspect_ratio = self.thumbnailAspectRatio
	end
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var62.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var62.background_layers = t
	end
	return var62
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
	local var63 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var64, var65 = protoModule.writeTag(buff, var63, 1, protoModule.wireTypes.lengthDelimited)
		var64, var95 = protoModule.writeString(var64, var65, self.id)
		buff = var64
		var63 = var65
	end
	if self.type ~= nil and self.type ~= "" then
		local var66, var67 = protoModule.writeTag(buff, var63, 2, protoModule.wireTypes.lengthDelimited)
		var66, var97 = protoModule.writeString(var66, var67, self.type)
		buff = var66
		var63 = var67
	end
	if self.hydration_priority ~= nil and self.hydration_priority ~= 0 then
		local var68, var69 = protoModule.writeTag(buff, var63, 3, protoModule.wireTypes.varint)
		var68, var99 = protoModule.writeVarInt(var68, var69, self.hydration_priority)
		buff = var68
		var63 = var69
	end
	if self.hydration_count ~= nil and self.hydration_count ~= 0 then
		local var70, var71 = protoModule.writeTag(buff, var63, 4, protoModule.wireTypes.varint)
		var70, var101 = protoModule.writeVarInt(var70, var71, self.hydration_count)
		buff = var70
		var63 = var71
	end
	if self.content ~= nil and #self.content > 0 then
		for i, v in self.content do
			local var72 = v:encode()
			local var73, var74 = protoModule.writeTag(buff, var63, 5, protoModule.wireTypes.lengthDelimited)
			var73, var104 = protoModule.writeBuffer(var73, var74, var72, buffer.len(var72))
			buff = var73
			var63 = var74
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var75, var76 = protoModule.writeTag(buff, var63, 6, protoModule.wireTypes.varint)
		var75, var106 = protoModule.writeVarInt(var75, var76, self.preview_columns)
		buff = var75
		var63 = var76
	end
	if self.title ~= nil and self.title ~= "" then
		local var77, var78 = protoModule.writeTag(buff, var63, 7, protoModule.wireTypes.lengthDelimited)
		var77, var108 = protoModule.writeString(var77, var78, self.title)
		buff = var77
		var63 = var78
	end
	if self.description ~= nil and self.description ~= "" then
		local var79, var80 = protoModule.writeTag(buff, var63, 8, protoModule.wireTypes.lengthDelimited)
		var79, var110 = protoModule.writeString(var79, var80, self.description)
		buff = var79
		var63 = var80
	end
	if self.card_style ~= nil then
		local var81 = self.card_style:encode()
		local var82, var83 = protoModule.writeTag(buff, var63, 9, protoModule.wireTypes.lengthDelimited)
		var82, var113 = protoModule.writeBuffer(var82, var83, var81, buffer.len(var81))
		buff = var82
		var63 = var83
	end
	if self.card_footers ~= nil and #self.card_footers > 0 then
		for i, v in self.card_footers do
			local var84 = v:encode()
			local var85, var86 = protoModule.writeTag(buff, var63, 10, protoModule.wireTypes.lengthDelimited)
			var85, var116 = protoModule.writeBuffer(var85, var86, var84, buffer.len(var84))
			buff = var85
			var63 = var86
		end
	end
	if self.tag_id ~= nil and self.tag_id ~= "" then
		local var87, var88 = protoModule.writeTag(buff, var63, 11, protoModule.wireTypes.lengthDelimited)
		var87, var118 = protoModule.writeString(var87, var88, self.tag_id)
		buff = var87
		var63 = var88
	end
	local buff_1 = buffer.create(var63)
	buffer.copy(buff_1, 0, buff, 0, var63)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var89 = t_4.new()
	local var90 = 0
	while var90 < buffer.len(p4) do
		local _ = nil
		local var91 = nil
		local var92, var93, var94 = protoModule.readTag(p4, var90)
		local var95 = var92
		var91 = var93
		var90 = var94
		
		if var91 == protoModule.wireTypes.varint then
			if var95 == 3 then
				local _ = nil
				local var96, var97 = protoModule.readVarIntI32(p4, var90)
				var90 = var97
				var89.hydration_priority = var96
			elseif var95 == 4 then
				local _ = nil
				local var98, var99 = protoModule.readVarIntI32(p4, var90)
				var90 = var99
				var89.hydration_count = var98
			elseif var95 == 6 then
				local _ = nil
				local var100, var101 = protoModule.readVarIntI64(p4, var90)
				var90 = var101
				var89.preview_columns = var100
			else
				local _ = nil
				local var102, var103 = protoModule.readVarInt(p4, var90)
				local _ = var102
				var90 = var103
			end
		end
		if var91 == protoModule.wireTypes.lengthDelimited then
			if var95 == 1 then
				local _ = nil
				local var104, var105 = protoModule.readBuffer(p4, var90)
				var90 = var105
				var89.id = buffer.tostring(var104)
			elseif var95 == 2 then
				local _ = nil
				local var106, var107 = protoModule.readBuffer(p4, var90)
				var90 = var107
				var89.type = buffer.tostring(var106)
			elseif var95 == 5 then
				local _ = nil
				local var108, var109 = protoModule.readBuffer(p4, var90)
				var90 = var109
				table.insert(var89.content, t.CatalogSortContentData.decode(var108))
			elseif var95 == 7 then
				local _ = nil
				local var110, var111 = protoModule.readBuffer(p4, var90)
				var90 = var111
				var89.title = buffer.tostring(var110)
			elseif var95 == 8 then
				local _ = nil
				local var112, var113 = protoModule.readBuffer(p4, var90)
				var90 = var113
				var89.description = buffer.tostring(var112)
			elseif var95 == 9 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p4, var90)
				var90 = var115
				var89.card_style = t.CatalogSortCardStyle.decode(var114)
			elseif var95 == 10 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p4, var90)
				var90 = var117
				table.insert(var89.card_footers, t.CatalogSortCardItemFooter.decode(var116))
			elseif var95 == 11 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p4, var90)
				var90 = var119
				var89.tag_id = buffer.tostring(var118)
			else
				local _ = nil
				local var120, var121 = protoModule.readVarInt(p4, var90)
				var90 = var121 + var120
			end
		elseif var91 == protoModule.wireTypes.i32 then
			local _ = nil
			local var122, var123 = protoModule.readFixed32(p4, var90)
			local _ = var122
			var90 = var123
		elseif var91 == protoModule.wireTypes.i64 then
			local _ = nil
			local var124, var125 = protoModule.readFixed64(p4, var90)
			local _ = var124
			var90 = var125
		else
			error("Unsupported wire type: " .. var122)
		end
	end
	return var89
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
	local var126 = t_4.new()
	
	if self.id ~= nil then
		var126.id = self.id
	end
	if self.type ~= nil then
		var126.type = self.type
	end
	if self.hydration_priority ~= nil then
		var126.hydration_priority = self.hydration_priority
	end
	if self.hydrationPriority ~= nil then
		var126.hydration_priority = self.hydrationPriority
	end
	if self.hydration_count ~= nil then
		var126.hydration_count = self.hydration_count
	end
	if self.hydrationCount ~= nil then
		var126.hydration_count = self.hydrationCount
	end
	if self.content ~= nil then
		local t_1 = {}
		
		for i, v in self.content do
			table.insert(t_1, t.CatalogSortContentData.jsonDecode(v))
		end
		var126.content = t_1
	end
	if self.preview_columns ~= nil then
		var126.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var126.preview_columns = self.previewColumns
	end
	if self.title ~= nil then
		var126.title = self.title
	end
	if self.description ~= nil then
		var126.description = self.description
	end
	if self.card_style ~= nil then
		var126.card_style = t.CatalogSortCardStyle.jsonDecode(self.card_style)
	end
	if self.cardStyle ~= nil then
		var126.card_style = t.CatalogSortCardStyle.jsonDecode(self.cardStyle)
	end
	if self.card_footers ~= nil then
		local t_1 = {}
		
		for i, v in self.card_footers do
			table.insert(t_1, t.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var126.card_footers = t_1
	end
	if self.cardFooters ~= nil then
		local t_1 = {}
		
		for i, v in self.cardFooters do
			table.insert(t_1, t.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var126.card_footers = t_1
	end
	if self.tag_id ~= nil then
		var126.tag_id = self.tag_id
	end
	if self.tagId ~= nil then
		var126.tag_id = self.tagId
	end
	return var126
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