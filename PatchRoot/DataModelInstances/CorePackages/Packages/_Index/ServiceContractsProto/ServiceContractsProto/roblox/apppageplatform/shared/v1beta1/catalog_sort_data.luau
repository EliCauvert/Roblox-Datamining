-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:29 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 143 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		id = if p0 == nil or p0.id == nil then "" else p0.id,
		type = if p0 == nil or p0.type == nil then "" else p0.type
	}, t_1)
end

function t_1:encode() --[[ line: 150 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var9 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var10, var11 = protoModule.writeTag(buff, var9, 1, protoModule.wireTypes.lengthDelimited)
		var10, var11 = protoModule.writeString(var10, var11, self.id)
		buff = var10
		var9 = var11
	end
	if self.type ~= nil and self.type ~= "" then
		local var12, var13 = protoModule.writeTag(buff, var9, 2, protoModule.wireTypes.lengthDelimited)
		var12, var13 = protoModule.writeString(var12, var13, self.type)
		buff = var12
		var9 = var13
	end
	local buff_1 = buffer.create(var9)
	buffer.copy(buff_1, 0, buff, 0, var9)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 169 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var15 = t_1.new()
	local var16 = 0
	while var16 < buffer.len(p1) do
		local _ = nil
		local var17 = nil
		local var18, var19, var20 = protoModule.readTag(p1, var16)
		local var21 = var18
		var17 = var19
		var16 = var20
		
		if var17 == protoModule.wireTypes.varint then
			local _ = nil
			local var22, var23 = protoModule.readVarInt(p1, var16)
			local _ = var22
			var16 = var23
			continue
		end
		if var17 == protoModule.wireTypes.lengthDelimited then
			if var21 == 1 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var16)
				var16 = var25
				var15.id = buffer.tostring(var24)
			elseif var21 == 2 then
				local _ = nil
				local var26, var27 = protoModule.readBuffer(p1, var16)
				var16 = var27
				var15.type = buffer.tostring(var26)
			else
				local _ = nil
				local var28, var29 = protoModule.readVarInt(p1, var16)
				var16 = var29 + var28
			end
		elseif var17 == protoModule.wireTypes.i32 then
			local _ = nil
			local var30, var31 = protoModule.readFixed32(p1, var16)
			local _ = var30
			var16 = var31
		elseif var17 == protoModule.wireTypes.i64 then
			local _ = nil
			local var32, var33 = protoModule.readFixed64(p1, var16)
			local _ = var32
			var16 = var33
		else
			error("Unsupported wire type: " .. var17)
		end
	end
	return var15
end

function t_1:jsonEncode() --[[ line: 217 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_1:jsonDecode() --[[ line: 231 ]]
	-- upvalues: t_1 (ref)
	local var35 = t_1.new()
	
	if self.id ~= nil then
		var35.id = self.id
	end
	if self.type ~= nil then
		var35.type = self.type
	end
	return var35
end

t_1.descriptor = {
	name = "CatalogSortContentData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortContentData"
}
t.CatalogSortContentData = t_1
typeRegistryModule.default:register(t.CatalogSortContentData)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 259 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		content_type = if p2 == nil or p2.content_type == nil then "" else p2.content_type
	}, t_2)
end

function t_2:encode() --[[ line: 267 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var37 = 0
	
	if self.content_type ~= nil and self.content_type ~= "" then
		local var38, var39 = protoModule.writeTag(buff, var37, 1, protoModule.wireTypes.lengthDelimited)
		var38, var39 = protoModule.writeString(var38, var39, self.content_type)
		buff = var38
		var37 = var39
	end
	local buff_1 = buffer.create(var37)
	buffer.copy(buff_1, 0, buff, 0, var37)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 281 ]]
	-- upvalues: t_2 (ref), protoModule (ref)
	local var41 = t_2.new()
	local var42 = 0
	while var42 < buffer.len(p3) do
		local _ = nil
		local var43 = nil
		local var44, var45, var46 = protoModule.readTag(p3, var42)
		local var47 = var44
		var43 = var45
		var42 = var46
		
		if var43 == protoModule.wireTypes.varint then
			local _ = nil
			local var48, var49 = protoModule.readVarInt(p3, var42)
			local _ = var48
			var42 = var49
			continue
		end
		if var43 == protoModule.wireTypes.lengthDelimited then
			if var47 == 1 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p3, var42)
				var42 = var51
				var41.content_type = buffer.tostring(var50)
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p3, var42)
				var42 = var53 + var52
			end
		elseif var43 == protoModule.wireTypes.i32 then
			local _ = nil
			local var54, var55 = protoModule.readFixed32(p3, var42)
			local _ = var54
			var42 = var55
		elseif var43 == protoModule.wireTypes.i64 then
			local _ = nil
			local var56, var57 = protoModule.readFixed64(p3, var42)
			local _ = var56
			var42 = var57
		else
			error("Unsupported wire type: " .. var43)
		end
	end
	return var41
end

function t_2:jsonEncode() --[[ line: 324 ]]
	local t = {}
	
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	return t
end

function t_2:jsonDecode() --[[ line: 334 ]]
	-- upvalues: t_2 (ref)
	local var59 = t_2.new()
	
	if self.content_type ~= nil then
		var59.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var59.content_type = self.contentType
	end
	return var59
end

t_2.descriptor = {
	name = "CatalogSortCardItemFooter",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardItemFooter"
}
t.CatalogSortCardItemFooter = t_2
typeRegistryModule.default:register(t.CatalogSortCardItemFooter)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 362 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		thumbnail_aspect_ratio = if p4 == nil or p4.thumbnail_aspect_ratio == nil then "" else p4.thumbnail_aspect_ratio,
		background_layers = if p4 == nil or p4.background_layers == nil then {} else p4.background_layers
	}, t_3)
end

function t_3:encode() --[[ line: 371 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var61 = 0
	
	if self.thumbnail_aspect_ratio ~= nil and self.thumbnail_aspect_ratio ~= "" then
		local var62, var63 = protoModule.writeTag(buff, var61, 1, protoModule.wireTypes.lengthDelimited)
		var62, var63 = protoModule.writeString(var62, var63, self.thumbnail_aspect_ratio)
		buff = var62
		var61 = var63
	end
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var64 = v:encode()
			local var65, var66 = protoModule.writeTag(buff, var61, 2, protoModule.wireTypes.lengthDelimited)
			var65, var66 = protoModule.writeBuffer(var65, var66, var64, buffer.len(var64))
			buff = var65
			var61 = var66
		end
	end
	local buff_1 = buffer.create(var61)
	buffer.copy(buff_1, 0, buff, 0, var61)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 393 ]]
	-- upvalues: t_3 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var68 = t_3.new()
	local var69 = 0
	while var69 < buffer.len(p5) do
		local _ = nil
		local var70 = nil
		local var71, var72, var73 = protoModule.readTag(p5, var69)
		local var74 = var71
		var70 = var72
		var69 = var73
		
		if var70 == protoModule.wireTypes.varint then
			local _ = nil
			local var75, var76 = protoModule.readVarInt(p5, var69)
			local _ = var75
			var69 = var76
			continue
		end
		if var70 == protoModule.wireTypes.lengthDelimited then
			if var74 == 1 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p5, var69)
				var69 = var78
				var68.thumbnail_aspect_ratio = buffer.tostring(var77)
			elseif var74 == 2 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p5, var69)
				var69 = var80
				table.insert(var68.background_layers, backgroundLayerModule.BackgroundLayer.decode(var79))
			else
				local _ = nil
				local var81, var82 = protoModule.readVarInt(p5, var69)
				var69 = var82 + var81
			end
		elseif var70 == protoModule.wireTypes.i32 then
			local _ = nil
			local var83, var84 = protoModule.readFixed32(p5, var69)
			local _ = var83
			var69 = var84
		elseif var70 == protoModule.wireTypes.i64 then
			local _ = nil
			local var85, var86 = protoModule.readFixed64(p5, var69)
			local _ = var85
			var69 = var86
		else
			error("Unsupported wire type: " .. var70)
		end
	end
	return var68
end

function t_3:jsonEncode() --[[ line: 444 ]]
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

function t_3:jsonDecode() --[[ line: 462 ]]
	-- upvalues: t_3 (ref), backgroundLayerModule (ref)
	local var89 = t_3.new()
	
	if self.thumbnail_aspect_ratio ~= nil then
		var89.thumbnail_aspect_ratio = self.thumbnail_aspect_ratio
	end
	if self.thumbnailAspectRatio ~= nil then
		var89.thumbnail_aspect_ratio = self.thumbnailAspectRatio
	end
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var89.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var89.background_layers = t
	end
	return var89
end

t_3.descriptor = {
	name = "CatalogSortCardStyle",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogSortCardStyle"
}
t.CatalogSortCardStyle = t_3
typeRegistryModule.default:register(t.CatalogSortCardStyle)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 514 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		id = if p6 == nil or p6.id == nil then "" else p6.id,
		type = if p6 == nil or p6.type == nil then "" else p6.type,
		hydration_priority = if p6 == nil or p6.hydration_priority == nil then 0 else p6.hydration_priority,
		hydration_count = if p6 == nil or p6.hydration_count == nil then 0 else p6.hydration_count,
		content = if p6 == nil or p6.content == nil then {} else p6.content,
		preview_columns = if p6 == nil or p6.preview_columns == nil then 0 else p6.preview_columns,
		title = if p6 == nil or p6.title == nil then "" else p6.title,
		description = if p6 == nil or p6.description == nil then "" else p6.description,
		card_style = if p6 == nil or p6.card_style == nil then nil else p6.card_style,
		card_footers = if p6 == nil or p6.card_footers == nil then {} else p6.card_footers,
		tag_id = if p6 == nil or p6.tag_id == nil then "" else p6.tag_id
	}, t_4)
end

function t_4:encode() --[[ line: 530 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var93 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var94, var95 = protoModule.writeTag(buff, var93, 1, protoModule.wireTypes.lengthDelimited)
		var94, var95 = protoModule.writeString(var94, var95, self.id)
		buff = var94
		var93 = var95
	end
	if self.type ~= nil and self.type ~= "" then
		local var96, var97 = protoModule.writeTag(buff, var93, 2, protoModule.wireTypes.lengthDelimited)
		var96, var97 = protoModule.writeString(var96, var97, self.type)
		buff = var96
		var93 = var97
	end
	if self.hydration_priority ~= nil and self.hydration_priority ~= 0 then
		local var98, var99 = protoModule.writeTag(buff, var93, 3, protoModule.wireTypes.varint)
		var98, var99 = protoModule.writeVarInt(var98, var99, self.hydration_priority)
		buff = var98
		var93 = var99
	end
	if self.hydration_count ~= nil and self.hydration_count ~= 0 then
		local var100, var101 = protoModule.writeTag(buff, var93, 4, protoModule.wireTypes.varint)
		var100, var101 = protoModule.writeVarInt(var100, var101, self.hydration_count)
		buff = var100
		var93 = var101
	end
	if self.content ~= nil and #self.content > 0 then
		for i, v in self.content do
			local var102 = v:encode()
			local var103, var104 = protoModule.writeTag(buff, var93, 5, protoModule.wireTypes.lengthDelimited)
			var103, var104 = protoModule.writeBuffer(var103, var104, var102, buffer.len(var102))
			buff = var103
			var93 = var104
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var105, var106 = protoModule.writeTag(buff, var93, 6, protoModule.wireTypes.varint)
		var105, var106 = protoModule.writeVarInt(var105, var106, self.preview_columns)
		buff = var105
		var93 = var106
	end
	if self.title ~= nil and self.title ~= "" then
		local var107, var108 = protoModule.writeTag(buff, var93, 7, protoModule.wireTypes.lengthDelimited)
		var107, var108 = protoModule.writeString(var107, var108, self.title)
		buff = var107
		var93 = var108
	end
	if self.description ~= nil and self.description ~= "" then
		local var109, var110 = protoModule.writeTag(buff, var93, 8, protoModule.wireTypes.lengthDelimited)
		var109, var110 = protoModule.writeString(var109, var110, self.description)
		buff = var109
		var93 = var110
	end
	if self.card_style ~= nil then
		local var111 = self.card_style:encode()
		local var112, var113 = protoModule.writeTag(buff, var93, 9, protoModule.wireTypes.lengthDelimited)
		var112, var113 = protoModule.writeBuffer(var112, var113, var111, buffer.len(var111))
		buff = var112
		var93 = var113
	end
	if self.card_footers ~= nil and #self.card_footers > 0 then
		for i, v in self.card_footers do
			local var114 = v:encode()
			local var115, var116 = protoModule.writeTag(buff, var93, 10, protoModule.wireTypes.lengthDelimited)
			var115, var116 = protoModule.writeBuffer(var115, var116, var114, buffer.len(var114))
			buff = var115
			var93 = var116
		end
	end
	if self.tag_id ~= nil and self.tag_id ~= "" then
		local var117, var118 = protoModule.writeTag(buff, var93, 11, protoModule.wireTypes.lengthDelimited)
		var117, var118 = protoModule.writeString(var117, var118, self.tag_id)
		buff = var117
		var93 = var118
	end
	local buff_1 = buffer.create(var93)
	buffer.copy(buff_1, 0, buff, 0, var93)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 601 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var120 = t_4.new()
	local var121 = 0
	while var121 < buffer.len(p7) do
		local _ = nil
		local var122 = nil
		local var123, var124, var125 = protoModule.readTag(p7, var121)
		local var126 = var123
		var122 = var124
		var121 = var125
		
		if var122 == protoModule.wireTypes.varint then
			if var126 == 3 then
				local _ = nil
				local var127, var128 = protoModule.readVarIntI32(p7, var121)
				var121 = var128
				var120.hydration_priority = var127
			elseif var126 == 4 then
				local _ = nil
				local var129, var130 = protoModule.readVarIntI32(p7, var121)
				var121 = var130
				var120.hydration_count = var129
			elseif var126 == 6 then
				local _ = nil
				local var131, var132 = protoModule.readVarIntI64(p7, var121)
				var121 = var132
				var120.preview_columns = var131
			else
				local _ = nil
				local var133, var134 = protoModule.readVarInt(p7, var121)
				local _ = var133
				var121 = var134
			end
		end
		if var122 == protoModule.wireTypes.lengthDelimited then
			if var126 == 1 then
				local _ = nil
				local var135, var136 = protoModule.readBuffer(p7, var121)
				var121 = var136
				var120.id = buffer.tostring(var135)
			elseif var126 == 2 then
				local _ = nil
				local var137, var138 = protoModule.readBuffer(p7, var121)
				var121 = var138
				var120.type = buffer.tostring(var137)
			elseif var126 == 5 then
				local _ = nil
				local var139, var140 = protoModule.readBuffer(p7, var121)
				var121 = var140
				table.insert(var120.content, t.CatalogSortContentData.decode(var139))
			elseif var126 == 7 then
				local _ = nil
				local var141, var142 = protoModule.readBuffer(p7, var121)
				var121 = var142
				var120.title = buffer.tostring(var141)
			elseif var126 == 8 then
				local _ = nil
				local var143, var144 = protoModule.readBuffer(p7, var121)
				var121 = var144
				var120.description = buffer.tostring(var143)
			elseif var126 == 9 then
				local _ = nil
				local var145, var146 = protoModule.readBuffer(p7, var121)
				var121 = var146
				var120.card_style = t.CatalogSortCardStyle.decode(var145)
			elseif var126 == 10 then
				local _ = nil
				local var147, var148 = protoModule.readBuffer(p7, var121)
				var121 = var148
				table.insert(var120.card_footers, t.CatalogSortCardItemFooter.decode(var147))
			elseif var126 == 11 then
				local _ = nil
				local var149, var150 = protoModule.readBuffer(p7, var121)
				var121 = var150
				var120.tag_id = buffer.tostring(var149)
			else
				local _ = nil
				local var151, var152 = protoModule.readVarInt(p7, var121)
				var121 = var152 + var151
			end
		elseif var122 == protoModule.wireTypes.i32 then
			local _ = nil
			local var153, var154 = protoModule.readFixed32(p7, var121)
			local _ = var153
			var121 = var154
		elseif var122 == protoModule.wireTypes.i64 then
			local _ = nil
			local var155, var156 = protoModule.readFixed64(p7, var121)
			local _ = var155
			var121 = var156
		else
			error("Unsupported wire type: " .. var122)
		end
	end
	return var120
end

function t_4:jsonEncode() --[[ line: 694 ]]
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

function t_4:jsonDecode() --[[ line: 752 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var160 = t_4.new()
	
	if self.id ~= nil then
		var160.id = self.id
	end
	if self.type ~= nil then
		var160.type = self.type
	end
	if self.hydration_priority ~= nil then
		var160.hydration_priority = self.hydration_priority
	end
	if self.hydrationPriority ~= nil then
		var160.hydration_priority = self.hydrationPriority
	end
	if self.hydration_count ~= nil then
		var160.hydration_count = self.hydration_count
	end
	if self.hydrationCount ~= nil then
		var160.hydration_count = self.hydrationCount
	end
	if self.content ~= nil then
		local t_1 = {}
		
		for i, v in self.content do
			table.insert(t_1, t.CatalogSortContentData.jsonDecode(v))
		end
		var160.content = t_1
	end
	if self.preview_columns ~= nil then
		var160.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var160.preview_columns = self.previewColumns
	end
	if self.title ~= nil then
		var160.title = self.title
	end
	if self.description ~= nil then
		var160.description = self.description
	end
	if self.card_style ~= nil then
		var160.card_style = t.CatalogSortCardStyle.jsonDecode(self.card_style)
	end
	if self.cardStyle ~= nil then
		var160.card_style = t.CatalogSortCardStyle.jsonDecode(self.cardStyle)
	end
	if self.card_footers ~= nil then
		local t_1 = {}
		
		for i, v in self.card_footers do
			table.insert(t_1, t.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var160.card_footers = t_1
	end
	if self.cardFooters ~= nil then
		local t_1 = {}
		
		for i, v in self.cardFooters do
			table.insert(t_1, t.CatalogSortCardItemFooter.jsonDecode(v))
		end
		var160.card_footers = t_1
	end
	if self.tag_id ~= nil then
		var160.tag_id = self.tag_id
	end
	if self.tagId ~= nil then
		var160.tag_id = self.tagId
	end
	return var160
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