local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: pageEntryContentModule (ref), t_1 (ref)
	return setmetatable({
		universe_id = if p0 == nil or p0.universe_id == nil then 0 else p0.universe_id,
		user_id = if p0 == nil or p0.user_id == nil then 0 else p0.user_id,
		page_size = if p0 == nil or p0.page_size == nil then 0 else p0.page_size,
		cursor = if p0 == nil or p0.cursor == nil then "" else p0.cursor,
		page_entry_format = if p0 == nil or p0.page_entry_format == nil then assert(pageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p0.page_entry_format
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), pageEntryContentModule (ref)
	local buff = buffer.create(0)
	local var17 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		local var18, var19 = protoModule.writeTag(buff, var17, 1, protoModule.wireTypes.varint)
		var18, var19 = protoModule.writeVarInt(var18, var19, self.universe_id)
		buff = var18
		var17 = var19
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var20, var21 = protoModule.writeTag(buff, var17, 2, protoModule.wireTypes.varint)
		var20, var21 = protoModule.writeVarInt(var20, var21, self.user_id)
		buff = var20
		var17 = var21
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		local var22, var23 = protoModule.writeTag(buff, var17, 3, protoModule.wireTypes.varint)
		var22, var23 = protoModule.writeVarInt(var22, var23, self.page_size)
		buff = var22
		var17 = var23
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		local var24, var25 = protoModule.writeTag(buff, var17, 4, protoModule.wireTypes.lengthDelimited)
		var24, var25 = protoModule.writeString(var24, var25, self.cursor)
		buff = var24
		var17 = var25
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local var26, var27 = protoModule.writeTag(buff, var17, 5, protoModule.wireTypes.varint)
		var26, var27 = protoModule.writeVarInt(var26, var27, pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
		buff = var26
		var17 = var27
	end
	local buff_1 = buffer.create(var17)
	buffer.copy(buff_1, 0, buff, 0, var17)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref)
	local var29 = t_1.new()
	local var30 = 0
	while var30 < buffer.len(p1) do
		local _ = nil
		local var31 = nil
		local var32, var33, var34 = protoModule.readTag(p1, var30)
		local var35 = var32
		var31 = var33
		var30 = var34
		
		if var31 == protoModule.wireTypes.varint then
			if var35 == 1 then
				local _ = nil
				local var36, var37 = protoModule.readVarIntI64(p1, var30)
				var30 = var37
				var29.universe_id = var36
			elseif var35 == 2 then
				local _ = nil
				local var38, var39 = protoModule.readVarIntI64(p1, var30)
				var30 = var39
				var29.user_id = var38
			elseif var35 == 3 then
				local _ = nil
				local var40, var41 = protoModule.readVarIntI32(p1, var30)
				var30 = var41
				var29.page_size = var40
			elseif var35 == 5 then
				local _ = nil
				local var42, var43 = protoModule.readVarIntI32(p1, var30)
				local var44 = var42
				var30 = var43
				var29.page_entry_format = pageEntryContentModule.PageEntryFormat.fromNumber(var44) or var44
			else
				local _ = nil
				local var45, var46 = protoModule.readVarInt(p1, var30)
				local _ = var45
				var30 = var46
			end
		end
		if var31 == protoModule.wireTypes.lengthDelimited then
			if var35 == 4 then
				local _ = nil
				local var47, var48 = protoModule.readBuffer(p1, var30)
				var30 = var48
				var29.cursor = buffer.tostring(var47)
			else
				local _ = nil
				local var49, var50 = protoModule.readVarInt(p1, var30)
				var30 = var50 + var49
			end
		elseif var31 == protoModule.wireTypes.i32 then
			local _ = nil
			local var51, var52 = protoModule.readFixed32(p1, var30)
			local _ = var51
			var30 = var52
		elseif var31 == protoModule.wireTypes.i64 then
			local _ = nil
			local var53, var54 = protoModule.readFixed64(p1, var30)
			local _ = var53
			var30 = var54
		else
			error("Unsupported wire type: " .. var31)
		end
	end
	return var29
end

function t_1:jsonEncode()
	-- upvalues: pageEntryContentModule (ref)
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		t.universeId = self.universe_id
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		t.pageSize = self.page_size
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		t.cursor = self.cursor
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		t.pageEntryFormat = if typeof(self.page_entry_format) == "number" then self.page_entry_format else pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format)
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), pageEntryContentModule (ref)
	local var56 = t_1.new()
	
	if self.universe_id ~= nil then
		var56.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var56.universe_id = self.universeId
	end
	if self.user_id ~= nil then
		var56.user_id = self.user_id
	end
	if self.userId ~= nil then
		var56.user_id = self.userId
	end
	if self.page_size ~= nil then
		var56.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var56.page_size = self.pageSize
	end
	if self.cursor ~= nil then
		var56.cursor = self.cursor
	end
	if self.page_entry_format ~= nil then
		var56.page_entry_format = if typeof(self.page_entry_format) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.page_entry_format) or self.page_entry_format else pageEntryContentModule.PageEntryFormat.fromName(self.page_entry_format) or self.page_entry_format
	end
	if self.pageEntryFormat ~= nil then
		var56.page_entry_format = if typeof(self.pageEntryFormat) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.pageEntryFormat) or self.pageEntryFormat else pageEntryContentModule.PageEntryFormat.fromName(self.pageEntryFormat) or self.pageEntryFormat
	end
	return var56
end

t_1.descriptor = {
	name = "BadgesSeeAllRequest",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllRequest"
}
t.BadgesSeeAllRequest = t_1
typeRegistryModule.default:register(t.BadgesSeeAllRequest)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		page_size = if p2 == nil or p2.page_size == nil then 0 else p2.page_size,
		next_cursor = if p2 == nil or p2.next_cursor == nil then "" else p2.next_cursor,
		prev_cursor = if p2 == nil or p2.prev_cursor == nil then "" else p2.prev_cursor,
		total = if p2 == nil or p2.total == nil then 0 else p2.total
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var58 = 0
	
	if self.page_size ~= nil and self.page_size ~= 0 then
		local var59, var60 = protoModule.writeTag(buff, var58, 1, protoModule.wireTypes.varint)
		var59, var60 = protoModule.writeVarInt(var59, var60, self.page_size)
		buff = var59
		var58 = var60
	end
	if self.next_cursor ~= nil and self.next_cursor ~= "" then
		local var61, var62 = protoModule.writeTag(buff, var58, 2, protoModule.wireTypes.lengthDelimited)
		var61, var62 = protoModule.writeString(var61, var62, self.next_cursor)
		buff = var61
		var58 = var62
	end
	if self.prev_cursor ~= nil and self.prev_cursor ~= "" then
		local var63, var64 = protoModule.writeTag(buff, var58, 3, protoModule.wireTypes.lengthDelimited)
		var63, var64 = protoModule.writeString(var63, var64, self.prev_cursor)
		buff = var63
		var58 = var64
	end
	if self.total ~= nil and self.total ~= 0 then
		local var65, var66 = protoModule.writeTag(buff, var58, 4, protoModule.wireTypes.varint)
		var65, var66 = protoModule.writeVarInt(var65, var66, self.total)
		buff = var65
		var58 = var66
	end
	local buff_1 = buffer.create(var58)
	buffer.copy(buff_1, 0, buff, 0, var58)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var68 = t_2.new()
	local var69 = 0
	while var69 < buffer.len(p3) do
		local _ = nil
		local var70 = nil
		local var71, var72, var73 = protoModule.readTag(p3, var69)
		local var74 = var71
		var70 = var72
		var69 = var73
		
		if var70 == protoModule.wireTypes.varint then
			if var74 == 1 then
				local _ = nil
				local var75, var76 = protoModule.readVarIntI32(p3, var69)
				var69 = var76
				var68.page_size = var75
			elseif var74 == 4 then
				local _ = nil
				local var77, var78 = protoModule.readVarIntI64(p3, var69)
				var69 = var78
				var68.total = var77
			else
				local _ = nil
				local var79, var80 = protoModule.readVarInt(p3, var69)
				local _ = var79
				var69 = var80
			end
		end
		if var70 == protoModule.wireTypes.lengthDelimited then
			if var74 == 2 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p3, var69)
				var69 = var82
				var68.next_cursor = buffer.tostring(var81)
			elseif var74 == 3 then
				local _ = nil
				local var83, var84 = protoModule.readBuffer(p3, var69)
				var69 = var84
				var68.prev_cursor = buffer.tostring(var83)
			else
				local _ = nil
				local var85, var86 = protoModule.readVarInt(p3, var69)
				var69 = var86 + var85
			end
		elseif var70 == protoModule.wireTypes.i32 then
			local _ = nil
			local var87, var88 = protoModule.readFixed32(p3, var69)
			local _ = var87
			var69 = var88
		elseif var70 == protoModule.wireTypes.i64 then
			local _ = nil
			local var89, var90 = protoModule.readFixed64(p3, var69)
			local _ = var89
			var69 = var90
		else
			error("Unsupported wire type: " .. var70)
		end
	end
	return var68
end

function t_2:jsonEncode()
	local t = {}
	
	if self.page_size ~= nil and self.page_size ~= 0 then
		t.pageSize = self.page_size
	end
	if self.next_cursor ~= nil and self.next_cursor ~= "" then
		t.nextCursor = self.next_cursor
	end
	if self.prev_cursor ~= nil and self.prev_cursor ~= "" then
		t.prevCursor = self.prev_cursor
	end
	if self.total ~= nil and self.total ~= 0 then
		t.total = self.total
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref)
	local var92 = t_2.new()
	
	if self.page_size ~= nil then
		var92.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var92.page_size = self.pageSize
	end
	if self.next_cursor ~= nil then
		var92.next_cursor = self.next_cursor
	end
	if self.nextCursor ~= nil then
		var92.next_cursor = self.nextCursor
	end
	if self.prev_cursor ~= nil then
		var92.prev_cursor = self.prev_cursor
	end
	if self.prevCursor ~= nil then
		var92.prev_cursor = self.prevCursor
	end
	if self.total ~= nil then
		var92.total = self.total
	end
	return var92
end

t_2.descriptor = {
	name = "Pagination",
	fullName = "roblox.apppageplatform.badges.v1beta1.Pagination"
}
t.Pagination = t_2
typeRegistryModule.default:register(t.Pagination)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		section_title = if p4 == nil or p4.section_title == nil then "" else p4.section_title,
		badges = if p4 == nil or p4.badges == nil then {} else p4.badges,
		collection_id = if p4 == nil or p4.collection_id == nil then "" else p4.collection_id,
		collection_position = if p4 == nil or p4.collection_position == nil then "" else p4.collection_position,
		universe_id = if p4 == nil or p4.universe_id == nil then "" else p4.universe_id
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var94 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var95, var96 = protoModule.writeTag(buff, var94, 1, protoModule.wireTypes.lengthDelimited)
		var95, var96 = protoModule.writeString(var95, var96, self.section_title)
		buff = var95
		var94 = var96
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var97 = v:encode()
			local var98, var99 = protoModule.writeTag(buff, var94, 2, protoModule.wireTypes.lengthDelimited)
			var98, var99 = protoModule.writeBuffer(var98, var99, var97, buffer.len(var97))
			buff = var98
			var94 = var99
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var100, var101 = protoModule.writeTag(buff, var94, 3, protoModule.wireTypes.lengthDelimited)
		var100, var101 = protoModule.writeString(var100, var101, self.collection_id)
		buff = var100
		var94 = var101
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var102, var103 = protoModule.writeTag(buff, var94, 4, protoModule.wireTypes.lengthDelimited)
		var102, var103 = protoModule.writeString(var102, var103, self.collection_position)
		buff = var102
		var94 = var103
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var104, var105 = protoModule.writeTag(buff, var94, 5, protoModule.wireTypes.lengthDelimited)
		var104, var105 = protoModule.writeString(var104, var105, self.universe_id)
		buff = var104
		var94 = var105
	end
	local buff_1 = buffer.create(var94)
	buffer.copy(buff_1, 0, buff, 0, var94)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var107 = t_3.new()
	local var108 = 0
	while var108 < buffer.len(p5) do
		local _ = nil
		local var109 = nil
		local var110, var111, var112 = protoModule.readTag(p5, var108)
		local var113 = var110
		var109 = var111
		var108 = var112
		
		if var109 == protoModule.wireTypes.varint then
			local _ = nil
			local var114, var115 = protoModule.readVarInt(p5, var108)
			local _ = var114
			var108 = var115
			continue
		end
		if var109 == protoModule.wireTypes.lengthDelimited then
			if var113 == 1 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p5, var108)
				var108 = var117
				var107.section_title = buffer.tostring(var116)
			elseif var113 == 2 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p5, var108)
				var108 = var119
				table.insert(var107.badges, t.BadgesGridPageEntry_BadgeInputData.decode(var118))
			elseif var113 == 3 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p5, var108)
				var108 = var121
				var107.collection_id = buffer.tostring(var120)
			elseif var113 == 4 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p5, var108)
				var108 = var123
				var107.collection_position = buffer.tostring(var122)
			elseif var113 == 5 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p5, var108)
				var108 = var125
				var107.universe_id = buffer.tostring(var124)
			else
				local _ = nil
				local var126, var127 = protoModule.readVarInt(p5, var108)
				var108 = var127 + var126
			end
		elseif var109 == protoModule.wireTypes.i32 then
			local _ = nil
			local var128, var129 = protoModule.readFixed32(p5, var108)
			local _ = var128
			var108 = var129
		elseif var109 == protoModule.wireTypes.i64 then
			local _ = nil
			local var130, var131 = protoModule.readFixed64(p5, var108)
			local _ = var130
			var108 = var131
		else
			error("Unsupported wire type: " .. var109)
		end
	end
	return var107
end

function t_3:jsonEncode()
	local t = {}
	
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.badges ~= nil and #self.badges > 0 then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, v:jsonEncode())
		end
		t.badges = t_1
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		t.collectionId = self.collection_id
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		t.collectionPosition = self.collection_position
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var134 = t_3.new()
	
	if self.section_title ~= nil then
		var134.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var134.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridPageEntry_BadgeInputData.jsonDecode(v))
		end
		var134.badges = t_1
	end
	if self.collection_id ~= nil then
		var134.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var134.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var134.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var134.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var134.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var134.universe_id = self.universeId
	end
	return var134
end

t_3.descriptor = {
	name = "BadgesGridPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesGridPageEntry"
}
t.BadgesGridPageEntry = t_3
typeRegistryModule.default:register(t.BadgesGridPageEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		badge_id = if p6 == nil or p6.badge_id == nil then "" else p6.badge_id
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var137 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var138, var139 = protoModule.writeTag(buff, var137, 1, protoModule.wireTypes.lengthDelimited)
		var138, var139 = protoModule.writeString(var138, var139, self.badge_id)
		buff = var138
		var137 = var139
	end
	local buff_1 = buffer.create(var137)
	buffer.copy(buff_1, 0, buff, 0, var137)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var141 = t_4.new()
	local var142 = 0
	while var142 < buffer.len(p7) do
		local _ = nil
		local var143 = nil
		local var144, var145, var146 = protoModule.readTag(p7, var142)
		local var147 = var144
		var143 = var145
		var142 = var146
		
		if var143 == protoModule.wireTypes.varint then
			local _ = nil
			local var148, var149 = protoModule.readVarInt(p7, var142)
			local _ = var148
			var142 = var149
			continue
		end
		if var143 == protoModule.wireTypes.lengthDelimited then
			if var147 == 1 then
				local _ = nil
				local var150, var151 = protoModule.readBuffer(p7, var142)
				var142 = var151
				var141.badge_id = buffer.tostring(var150)
			else
				local _ = nil
				local var152, var153 = protoModule.readVarInt(p7, var142)
				var142 = var153 + var152
			end
		elseif var143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var154, var155 = protoModule.readFixed32(p7, var142)
			local _ = var154
			var142 = var155
		elseif var143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var156, var157 = protoModule.readFixed64(p7, var142)
			local _ = var156
			var142 = var157
		else
			error("Unsupported wire type: " .. var143)
		end
	end
	return var141
end

function t_4:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var159 = t_4.new()
	
	if self.badge_id ~= nil then
		var159.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var159.badge_id = self.badgeId
	end
	return var159
end

t_4.descriptor = {
	name = "BadgesGridPageEntry_BadgeInputData",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeInputData"
}
t.BadgesGridPageEntry_BadgeInputData = t_4
typeRegistryModule.default:register(t.BadgesGridPageEntry_BadgeInputData)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		page_entry = if p8 == nil or p8.page_entry == nil then nil else p8.page_entry,
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var161 = 0
	
	if self.page_entry ~= nil then
		local var162 = self.page_entry:encode()
		local var163, var164 = protoModule.writeTag(buff, var161, 1, protoModule.wireTypes.lengthDelimited)
		var163, var164 = protoModule.writeBuffer(var163, var164, var162, buffer.len(var162))
		buff = var163
		var161 = var164
	end
	if self.kind ~= nil and self.kind.type == "badges_grid" then
		local var165 = self.kind.value:encode()
		local var166, var167 = protoModule.writeTag(buff, var161, 2, protoModule.wireTypes.lengthDelimited)
		var166, var167 = protoModule.writeBuffer(var166, var167, var165, buffer.len(var165))
		buff = var166
		var161 = var167
	end
	local buff_1 = buffer.create(var161)
	buffer.copy(buff_1, 0, buff, 0, var161)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var169 = t_5.new()
	local var170 = 0
	while var170 < buffer.len(p9) do
		local _ = nil
		local var171 = nil
		local var172, var173, var174 = protoModule.readTag(p9, var170)
		local var175 = var172
		var171 = var173
		var170 = var174
		
		if var171 == protoModule.wireTypes.varint then
			local _ = nil
			local var176, var177 = protoModule.readVarInt(p9, var170)
			local _ = var176
			var170 = var177
			continue
		end
		if var171 == protoModule.wireTypes.lengthDelimited then
			if var175 == 1 then
				local _ = nil
				local var178, var179 = protoModule.readBuffer(p9, var170)
				var170 = var179
				var169.page_entry = pageEntryModule.PageEntry.decode(var178)
			elseif var175 == 2 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p9, var170)
				var170 = var181
				var169.kind = {
					type = "badges_grid",
					value = t.BadgesGridPageEntry.decode(var180)
				}
			else
				local _ = nil
				local var182, var183 = protoModule.readVarInt(p9, var170)
				var170 = var183 + var182
			end
		elseif var171 == protoModule.wireTypes.i32 then
			local _ = nil
			local var184, var185 = protoModule.readFixed32(p9, var170)
			local _ = var184
			var170 = var185
		elseif var171 == protoModule.wireTypes.i64 then
			local _ = nil
			local var186, var187 = protoModule.readFixed64(p9, var170)
			local _ = var186
			var170 = var187
		else
			error("Unsupported wire type: " .. var171)
		end
	end
	return var169
end

function t_5:jsonEncode()
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "badges_grid" then
		t.badgesGrid = self.kind.value:jsonEncode()
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), pageEntryModule (ref), t (ref)
	local var189 = t_5.new()
	
	if self.page_entry ~= nil then
		var189.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var189.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badges_grid ~= nil then
		var189.kind = {
			type = "badges_grid",
			value = t.BadgesGridPageEntry.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var189.kind = {
			type = "badges_grid",
			value = t.BadgesGridPageEntry.jsonDecode(self.badgesGrid)
		}
	end
	return var189
end

t_5.descriptor = {
	name = "BadgesSeeAllPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllPageEntry"
}
t.BadgesSeeAllPageEntry = t_5
typeRegistryModule.default:register(t.BadgesSeeAllPageEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10)
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entries = if p10 == nil or p10.page_entries == nil then {} else p10.page_entries,
		hydration_data = if p10 == nil or p10.hydration_data == nil then nil else p10.hydration_data,
		templates = if p10 == nil or p10.templates == nil then {} else p10.templates,
		pagination = if p10 == nil or p10.pagination == nil then nil else p10.pagination
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var191 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var192 = v:encode()
			local var193, var194 = protoModule.writeTag(buff, var191, 1, protoModule.wireTypes.lengthDelimited)
			var193, var194 = protoModule.writeBuffer(var193, var194, var192, buffer.len(var192))
			buff = var193
			var191 = var194
		end
	end
	if self.hydration_data ~= nil then
		local var195 = self.hydration_data:encode()
		local var196, var197 = protoModule.writeTag(buff, var191, 2, protoModule.wireTypes.lengthDelimited)
		var196, var197 = protoModule.writeBuffer(var196, var197, var195, buffer.len(var195))
		buff = var196
		var191 = var197
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var198, var199 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var198, var199 = protoModule.writeString(var198, var199, i)
			local var200 = v:encode()
			var199, var201 = protoModule.writeTag(var198, var199, 2, protoModule.wireTypes.lengthDelimited)
			var199, var201 = protoModule.writeBuffer(var199, var201, var200, buffer.len(var200))
			local var202 = var199
			local var203 = var201
			local var204, var205 = protoModule.writeTag(buff, var191, 3, protoModule.wireTypes.lengthDelimited)
			var204, var205 = protoModule.writeBuffer(var204, var205, var202, var203)
			buff = var204
			var191 = var205
		end
	end
	if self.pagination ~= nil then
		local var206 = self.pagination:encode()
		local var207, var208 = protoModule.writeTag(buff, var191, 4, protoModule.wireTypes.lengthDelimited)
		var207, var208 = protoModule.writeBuffer(var207, var208, var206, buffer.len(var206))
		buff = var207
		var191 = var208
	end
	local buff_1 = buffer.create(var191)
	buffer.copy(buff_1, 0, buff, 0, var191)
	
	return buff_1
end

function t_6.decode(p11)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var210 = t_6.new()
	local var211 = 0
	while var211 < buffer.len(p11) do
		local _ = nil
		local var212 = nil
		local var213, var214, var215 = protoModule.readTag(p11, var211)
		local var216 = var213
		var212 = var214
		var211 = var215
		
		if var212 == protoModule.wireTypes.varint then
			local _ = nil
			local var217, var218 = protoModule.readVarInt(p11, var211)
			local _ = var217
			var211 = var218
			continue
		end
		if var212 == protoModule.wireTypes.lengthDelimited then
			if var216 == 1 then
				local _ = nil
				local var219, var220 = protoModule.readBuffer(p11, var211)
				var211 = var220
				table.insert(var210.page_entries, t.BadgesSeeAllPageEntry.decode(var219))
			elseif var216 == 2 then
				local _ = nil
				local var221, var222 = protoModule.readBuffer(p11, var211)
				var211 = var222
				var210.hydration_data = hydrationContentModule.HydrationContent.decode(var221)
			elseif var216 == 3 then
				local _ = nil
				local var223, var224 = protoModule.readBuffer(p11, var211)
				var211 = var224
				var223 = t.BadgesSeeAllResponse_TemplatesEntry.decode(var223)
				var210.templates[var223.key or ""] = var223.value or templateEntryModule.TemplateEntry.new()
			elseif var216 == 4 then
				local _ = nil
				local var225, var226 = protoModule.readBuffer(p11, var211)
				var211 = var226
				var210.pagination = t.Pagination.decode(var225)
			else
				local _ = nil
				local var227, var228 = protoModule.readVarInt(p11, var211)
				var211 = var228 + var227
			end
		elseif var212 == protoModule.wireTypes.i32 then
			local _ = nil
			local var229, var230 = protoModule.readFixed32(p11, var211)
			local _ = var229
			var211 = var230
		elseif var212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var231, var232 = protoModule.readFixed64(p11, var211)
			local _ = var231
			var211 = var232
		else
			error("Unsupported wire type: " .. var212)
		end
	end
	return var210
end

function t_6:jsonEncode()
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
	end
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var236 = t_6.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, t.BadgesSeeAllPageEntry.jsonDecode(v))
		end
		var236.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, t.BadgesSeeAllPageEntry.jsonDecode(v))
		end
		var236.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var236.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var236.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var236.templates = t_1
	end
	if self.pagination ~= nil then
		var236.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var236
end

t_6.descriptor = {
	name = "BadgesSeeAllResponse",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllResponse"
}
t.BadgesSeeAllResponse = t_6
typeRegistryModule.default:register(t.BadgesSeeAllResponse)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p12 == nil or p12.key == nil then "" else p12.key,
		value = if p12 == nil or p12.value == nil then nil else p12.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var241 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var242, var243 = protoModule.writeTag(buff, var241, 1, protoModule.wireTypes.lengthDelimited)
		var242, var243 = protoModule.writeString(var242, var243, self.key)
		buff = var242
		var241 = var243
	end
	if self.value ~= nil then
		local var244 = self.value:encode()
		local var245, var246 = protoModule.writeTag(buff, var241, 2, protoModule.wireTypes.lengthDelimited)
		var245, var246 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
		buff = var245
		var241 = var246
	end
	local buff_1 = buffer.create(var241)
	buffer.copy(buff_1, 0, buff, 0, var241)
	
	return buff_1
end

function t_7.decode(p13)
	-- upvalues: t_7 (ref), protoModule (ref), templateEntryModule (ref)
	local var248 = t_7.new()
	local var249 = 0
	while var249 < buffer.len(p13) do
		local _ = nil
		local var250 = nil
		local var251, var252, var253 = protoModule.readTag(p13, var249)
		local var254 = var251
		var250 = var252
		var249 = var253
		
		if var250 == protoModule.wireTypes.varint then
			local _ = nil
			local var255, var256 = protoModule.readVarInt(p13, var249)
			local _ = var255
			var249 = var256
			continue
		end
		if var250 == protoModule.wireTypes.lengthDelimited then
			if var254 == 1 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p13, var249)
				var249 = var258
				var248.key = buffer.tostring(var257)
			elseif var254 == 2 then
				local _ = nil
				local var259, var260 = protoModule.readBuffer(p13, var249)
				var249 = var260
				var248.value = templateEntryModule.TemplateEntry.decode(var259)
			else
				local _ = nil
				local var261, var262 = protoModule.readVarInt(p13, var249)
				var249 = var262 + var261
			end
		elseif var250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var263, var264 = protoModule.readFixed32(p13, var249)
			local _ = var263
			var249 = var264
		elseif var250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var265, var266 = protoModule.readFixed64(p13, var249)
			local _ = var265
			var249 = var266
		else
			error("Unsupported wire type: " .. var250)
		end
	end
	return var248
end

function t_7:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), templateEntryModule (ref)
	local var268 = t_7.new()
	
	if self.key ~= nil then
		var268.key = self.key
	end
	if self.value ~= nil then
		var268.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var268
end

t_7.descriptor = {
	name = "BadgesSeeAllResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgesSeeAllResponse_TemplatesEntry = t_7
typeRegistryModule.default:register(t.BadgesSeeAllResponse_TemplatesEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14)
	-- upvalues: t_8 (ref)
	return setmetatable({
		page_entries = if p14 == nil or p14.page_entries == nil then {} else p14.page_entries,
		hydration_data = if p14 == nil or p14.hydration_data == nil then nil else p14.hydration_data,
		templates = if p14 == nil or p14.templates == nil then {} else p14.templates,
		pagination = if p14 == nil or p14.pagination == nil then nil else p14.pagination
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var270 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var271 = v:encode()
			local var272, var273 = protoModule.writeTag(buff, var270, 1, protoModule.wireTypes.lengthDelimited)
			var272, var273 = protoModule.writeBuffer(var272, var273, var271, buffer.len(var271))
			buff = var272
			var270 = var273
		end
	end
	if self.hydration_data ~= nil then
		local var274 = self.hydration_data:encode()
		local var275, var276 = protoModule.writeTag(buff, var270, 2, protoModule.wireTypes.lengthDelimited)
		var275, var276 = protoModule.writeBuffer(var275, var276, var274, buffer.len(var274))
		buff = var275
		var270 = var276
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var277, var278 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var277, var278 = protoModule.writeString(var277, var278, i)
			local var279 = v:encode()
			var278, var280 = protoModule.writeTag(var277, var278, 2, protoModule.wireTypes.lengthDelimited)
			var278, var280 = protoModule.writeBuffer(var278, var280, var279, buffer.len(var279))
			local var281 = var278
			local var282 = var280
			local var283, var284 = protoModule.writeTag(buff, var270, 3, protoModule.wireTypes.lengthDelimited)
			var283, var284 = protoModule.writeBuffer(var283, var284, var281, var282)
			buff = var283
			var270 = var284
		end
	end
	if self.pagination ~= nil then
		local var285 = self.pagination:encode()
		local var286, var287 = protoModule.writeTag(buff, var270, 4, protoModule.wireTypes.lengthDelimited)
		var286, var287 = protoModule.writeBuffer(var286, var287, var285, buffer.len(var285))
		buff = var286
		var270 = var287
	end
	local buff_1 = buffer.create(var270)
	buffer.copy(buff_1, 0, buff, 0, var270)
	
	return buff_1
end

function t_8.decode(p15)
	-- upvalues: t_8 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var289 = t_8.new()
	local var290 = 0
	while var290 < buffer.len(p15) do
		local _ = nil
		local var291 = nil
		local var292, var293, var294 = protoModule.readTag(p15, var290)
		local var295 = var292
		var291 = var293
		var290 = var294
		
		if var291 == protoModule.wireTypes.varint then
			local _ = nil
			local var296, var297 = protoModule.readVarInt(p15, var290)
			local _ = var296
			var290 = var297
			continue
		end
		if var291 == protoModule.wireTypes.lengthDelimited then
			if var295 == 1 then
				local _ = nil
				local var298, var299 = protoModule.readBuffer(p15, var290)
				var290 = var299
				table.insert(var289.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var298))
			elseif var295 == 2 then
				local _ = nil
				local var300, var301 = protoModule.readBuffer(p15, var290)
				var290 = var301
				var289.hydration_data = hydrationContentModule.HydrationContent.decode(var300)
			elseif var295 == 3 then
				local _ = nil
				local var302, var303 = protoModule.readBuffer(p15, var290)
				var290 = var303
				var302 = t.BadgesSeeAllV2Response_TemplatesEntry.decode(var302)
				var289.templates[var302.key or ""] = var302.value or templateEntryModule.TemplateEntry.new()
			elseif var295 == 4 then
				local _ = nil
				local var304, var305 = protoModule.readBuffer(p15, var290)
				var290 = var305
				var289.pagination = t.Pagination.decode(var304)
			else
				local _ = nil
				local var306, var307 = protoModule.readVarInt(p15, var290)
				var290 = var307 + var306
			end
		elseif var291 == protoModule.wireTypes.i32 then
			local _ = nil
			local var308, var309 = protoModule.readFixed32(p15, var290)
			local _ = var308
			var290 = var309
		elseif var291 == protoModule.wireTypes.i64 then
			local _ = nil
			local var310, var311 = protoModule.readFixed64(p15, var290)
			local _ = var310
			var290 = var311
		else
			error("Unsupported wire type: " .. var291)
		end
	end
	return var289
end

function t_8:jsonEncode()
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, v:jsonEncode())
		end
		t.pageEntries = t_1
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = v:jsonEncode()
		end
		t.templates = t_1
	end
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), pageEntryContentModule (ref), hydrationContentModule (ref), templateEntryModule (ref), t (ref)
	local var315 = t_8.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var315.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var315.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var315.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var315.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var315.templates = t_1
	end
	if self.pagination ~= nil then
		var315.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var315
end

t_8.descriptor = {
	name = "BadgesSeeAllV2Response",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllV2Response"
}
t.BadgesSeeAllV2Response = t_8
typeRegistryModule.default:register(t.BadgesSeeAllV2Response)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16)
	-- upvalues: t_9 (ref)
	return setmetatable({
		key = if p16 == nil or p16.key == nil then "" else p16.key,
		value = if p16 == nil or p16.value == nil then nil else p16.value
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var320 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var321, var322 = protoModule.writeTag(buff, var320, 1, protoModule.wireTypes.lengthDelimited)
		var321, var322 = protoModule.writeString(var321, var322, self.key)
		buff = var321
		var320 = var322
	end
	if self.value ~= nil then
		local var323 = self.value:encode()
		local var324, var325 = protoModule.writeTag(buff, var320, 2, protoModule.wireTypes.lengthDelimited)
		var324, var325 = protoModule.writeBuffer(var324, var325, var323, buffer.len(var323))
		buff = var324
		var320 = var325
	end
	local buff_1 = buffer.create(var320)
	buffer.copy(buff_1, 0, buff, 0, var320)
	
	return buff_1
end

function t_9.decode(p17)
	-- upvalues: t_9 (ref), protoModule (ref), templateEntryModule (ref)
	local var327 = t_9.new()
	local var328 = 0
	while var328 < buffer.len(p17) do
		local _ = nil
		local var329 = nil
		local var330, var331, var332 = protoModule.readTag(p17, var328)
		local var333 = var330
		var329 = var331
		var328 = var332
		
		if var329 == protoModule.wireTypes.varint then
			local _ = nil
			local var334, var335 = protoModule.readVarInt(p17, var328)
			local _ = var334
			var328 = var335
			continue
		end
		if var329 == protoModule.wireTypes.lengthDelimited then
			if var333 == 1 then
				local _ = nil
				local var336, var337 = protoModule.readBuffer(p17, var328)
				var328 = var337
				var327.key = buffer.tostring(var336)
			elseif var333 == 2 then
				local _ = nil
				local var338, var339 = protoModule.readBuffer(p17, var328)
				var328 = var339
				var327.value = templateEntryModule.TemplateEntry.decode(var338)
			else
				local _ = nil
				local var340, var341 = protoModule.readVarInt(p17, var328)
				var328 = var341 + var340
			end
		elseif var329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var342, var343 = protoModule.readFixed32(p17, var328)
			local _ = var342
			var328 = var343
		elseif var329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var344, var345 = protoModule.readFixed64(p17, var328)
			local _ = var344
			var328 = var345
		else
			error("Unsupported wire type: " .. var329)
		end
	end
	return var327
end

function t_9:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), templateEntryModule (ref)
	local var347 = t_9.new()
	
	if self.key ~= nil then
		var347.key = self.key
	end
	if self.value ~= nil then
		var347.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var347
end

t_9.descriptor = {
	name = "BadgesSeeAllV2Response_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgesSeeAllV2Response_TemplatesEntry = t_9
typeRegistryModule.default:register(t.BadgesSeeAllV2Response_TemplatesEntry)

return {
	BadgesSeeAllRequest = t.BadgesSeeAllRequest,
	Pagination = t.Pagination,
	BadgesGridPageEntry = t.BadgesGridPageEntry,
	BadgesGridPageEntry_BadgeInputData = t.BadgesGridPageEntry_BadgeInputData,
	BadgesSeeAllPageEntry = t.BadgesSeeAllPageEntry,
	BadgesSeeAllResponse = t.BadgesSeeAllResponse,
	BadgesSeeAllV2Response = t.BadgesSeeAllV2Response
}