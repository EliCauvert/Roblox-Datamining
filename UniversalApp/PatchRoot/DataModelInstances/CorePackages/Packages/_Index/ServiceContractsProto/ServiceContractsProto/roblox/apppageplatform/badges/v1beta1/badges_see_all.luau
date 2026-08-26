local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local hydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local templateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local pageEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry)
local pageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: pageEntryContentModule (ref), t_1 (ref)
	return setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then 0 else p1.universe_id,
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id,
		page_size = if p1 == nil or p1.page_size == nil then 0 else p1.page_size,
		cursor = if p1 == nil or p1.cursor == nil then "" else p1.cursor,
		page_entry_format = if p1 == nil or p1.page_entry_format == nil then assert(pageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p1.page_entry_format
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), pageEntryContentModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var19 = protoModule.writeVarInt(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var21 = protoModule.writeVarInt(var4, var5, self.user_id)
		buff = var4
		var1 = var5
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var23 = protoModule.writeVarInt(var6, var7, self.page_size)
		buff = var6
		var1 = var7
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var25 = protoModule.writeString(var8, var9, self.cursor)
		buff = var8
		var1 = var9
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var27 = protoModule.writeVarInt(var10, var11, pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
		buff = var10
		var1 = var11
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref)
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
			if var7 == 1 then
				local _ = nil
				local var8, var9 = protoModule.readVarIntI64(p1, var2)
				var2 = var9
				var1.universe_id = var8
			elseif var7 == 2 then
				local _ = nil
				local var10, var11 = protoModule.readVarIntI64(p1, var2)
				var2 = var11
				var1.user_id = var10
			elseif var7 == 3 then
				local _ = nil
				local var12, var13 = protoModule.readVarIntI32(p1, var2)
				var2 = var13
				var1.page_size = var12
			elseif var7 == 5 then
				local _ = nil
				local var14, var15 = protoModule.readVarIntI32(p1, var2)
				local var16 = var14
				var2 = var15
				var1.page_entry_format = pageEntryContentModule.PageEntryFormat.fromNumber(var16) or var16
			else
				local _ = nil
				local var17, var18 = protoModule.readVarInt(p1, var2)
				local _ = var17
				var2 = var18
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 4 then
				local _ = nil
				local var19, var20 = protoModule.readBuffer(p1, var2)
				var2 = var20
				var1.cursor = buffer.tostring(var19)
			else
				local _ = nil
				local var21, var22 = protoModule.readVarInt(p1, var2)
				var2 = var22 + var21
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var23, var24 = protoModule.readFixed32(p1, var2)
			local _ = var23
			var2 = var24
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var25, var26 = protoModule.readFixed64(p1, var2)
			local _ = var25
			var2 = var26
		else
			error("Unsupported wire type: " .. var31)
		end
	end
	return var1
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
	local var27 = t_1.new()
	
	if self.universe_id ~= nil then
		var27.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var27.universe_id = self.universeId
	end
	if self.user_id ~= nil then
		var27.user_id = self.user_id
	end
	if self.userId ~= nil then
		var27.user_id = self.userId
	end
	if self.page_size ~= nil then
		var27.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var27.page_size = self.pageSize
	end
	if self.cursor ~= nil then
		var27.cursor = self.cursor
	end
	if self.page_entry_format ~= nil then
		var27.page_entry_format = if typeof(self.page_entry_format) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.page_entry_format) or self.page_entry_format else pageEntryContentModule.PageEntryFormat.fromName(self.page_entry_format) or self.page_entry_format
	end
	if self.pageEntryFormat ~= nil then
		var27.page_entry_format = if typeof(self.pageEntryFormat) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.pageEntryFormat) or self.pageEntryFormat else pageEntryContentModule.PageEntryFormat.fromName(self.pageEntryFormat) or self.pageEntryFormat
	end
	return var27
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
	local var27 = 0
	
	if self.page_size ~= nil and self.page_size ~= 0 then
		local var28, var29 = protoModule.writeTag(buff, var27, 1, protoModule.wireTypes.varint)
		var28, var60 = protoModule.writeVarInt(var28, var29, self.page_size)
		buff = var28
		var27 = var29
	end
	if self.next_cursor ~= nil and self.next_cursor ~= "" then
		local var30, var31 = protoModule.writeTag(buff, var27, 2, protoModule.wireTypes.lengthDelimited)
		var30, var62 = protoModule.writeString(var30, var31, self.next_cursor)
		buff = var30
		var27 = var31
	end
	if self.prev_cursor ~= nil and self.prev_cursor ~= "" then
		local var32, var33 = protoModule.writeTag(buff, var27, 3, protoModule.wireTypes.lengthDelimited)
		var32, var64 = protoModule.writeString(var32, var33, self.prev_cursor)
		buff = var32
		var27 = var33
	end
	if self.total ~= nil and self.total ~= 0 then
		local var34, var35 = protoModule.writeTag(buff, var27, 4, protoModule.wireTypes.varint)
		var34, var66 = protoModule.writeVarInt(var34, var35, self.total)
		buff = var34
		var27 = var35
	end
	local buff_1 = buffer.create(var27)
	buffer.copy(buff_1, 0, buff, 0, var27)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var27 = t_2.new()
	local var28 = 0
	while var28 < buffer.len(p2) do
		local _ = nil
		local var29 = nil
		local var30, var31, var32 = protoModule.readTag(p2, var28)
		local var33 = var30
		var29 = var31
		var28 = var32
		
		if var29 == protoModule.wireTypes.varint then
			if var33 == 1 then
				local _ = nil
				local var34, var35 = protoModule.readVarIntI32(p2, var28)
				var28 = var35
				var27.page_size = var34
			elseif var33 == 4 then
				local _ = nil
				local var36, var37 = protoModule.readVarIntI64(p2, var28)
				var28 = var37
				var27.total = var36
			else
				local _ = nil
				local var38, var39 = protoModule.readVarInt(p2, var28)
				local _ = var38
				var28 = var39
			end
		end
		if var29 == protoModule.wireTypes.lengthDelimited then
			if var33 == 2 then
				local _ = nil
				local var40, var41 = protoModule.readBuffer(p2, var28)
				var28 = var41
				var27.next_cursor = buffer.tostring(var40)
			elseif var33 == 3 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p2, var28)
				var28 = var43
				var27.prev_cursor = buffer.tostring(var42)
			else
				local _ = nil
				local var44, var45 = protoModule.readVarInt(p2, var28)
				var28 = var45 + var44
			end
		elseif var29 == protoModule.wireTypes.i32 then
			local _ = nil
			local var46, var47 = protoModule.readFixed32(p2, var28)
			local _ = var46
			var28 = var47
		elseif var29 == protoModule.wireTypes.i64 then
			local _ = nil
			local var48, var49 = protoModule.readFixed64(p2, var28)
			local _ = var48
			var28 = var49
		else
			error("Unsupported wire type: " .. var70)
		end
	end
	return var27
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
	local var50 = t_2.new()
	
	if self.page_size ~= nil then
		var50.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var50.page_size = self.pageSize
	end
	if self.next_cursor ~= nil then
		var50.next_cursor = self.next_cursor
	end
	if self.nextCursor ~= nil then
		var50.next_cursor = self.nextCursor
	end
	if self.prev_cursor ~= nil then
		var50.prev_cursor = self.prev_cursor
	end
	if self.prevCursor ~= nil then
		var50.prev_cursor = self.prevCursor
	end
	if self.total ~= nil then
		var50.total = self.total
	end
	return var50
end

t_2.descriptor = {
	name = "Pagination",
	fullName = "roblox.apppageplatform.badges.v1beta1.Pagination"
}
t.Pagination = t_2
typeRegistryModule.default:register(t.Pagination)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		section_title = if p3 == nil or p3.section_title == nil then "" else p3.section_title,
		badges = if p3 == nil or p3.badges == nil then {} else p3.badges,
		collection_id = if p3 == nil or p3.collection_id == nil then "" else p3.collection_id,
		collection_position = if p3 == nil or p3.collection_position == nil then "" else p3.collection_position,
		universe_id = if p3 == nil or p3.universe_id == nil then "" else p3.universe_id
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var50 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var51, var52 = protoModule.writeTag(buff, var50, 1, protoModule.wireTypes.lengthDelimited)
		var51, var96 = protoModule.writeString(var51, var52, self.section_title)
		buff = var51
		var50 = var52
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var53 = v:encode()
			local var54, var55 = protoModule.writeTag(buff, var50, 2, protoModule.wireTypes.lengthDelimited)
			var54, var99 = protoModule.writeBuffer(var54, var55, var53, buffer.len(var53))
			buff = var54
			var50 = var55
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var56, var57 = protoModule.writeTag(buff, var50, 3, protoModule.wireTypes.lengthDelimited)
		var56, var101 = protoModule.writeString(var56, var57, self.collection_id)
		buff = var56
		var50 = var57
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var58, var59 = protoModule.writeTag(buff, var50, 4, protoModule.wireTypes.lengthDelimited)
		var58, var103 = protoModule.writeString(var58, var59, self.collection_position)
		buff = var58
		var50 = var59
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var60, var61 = protoModule.writeTag(buff, var50, 5, protoModule.wireTypes.lengthDelimited)
		var60, var105 = protoModule.writeString(var60, var61, self.universe_id)
		buff = var60
		var50 = var61
	end
	local buff_1 = buffer.create(var50)
	buffer.copy(buff_1, 0, buff, 0, var50)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var62 = t_3.new()
	local var63 = 0
	while var63 < buffer.len(p3) do
		local _ = nil
		local var64 = nil
		local var65, var66, var67 = protoModule.readTag(p3, var63)
		local var68 = var65
		var64 = var66
		var63 = var67
		
		if var64 == protoModule.wireTypes.varint then
			local _ = nil
			local var69, var70 = protoModule.readVarInt(p3, var63)
			local _ = var69
			var63 = var70
			continue
		end
		if var64 == protoModule.wireTypes.lengthDelimited then
			if var68 == 1 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p3, var63)
				var63 = var72
				var62.section_title = buffer.tostring(var71)
			elseif var68 == 2 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p3, var63)
				var63 = var74
				table.insert(var62.badges, t.BadgesGridPageEntry_BadgeInputData.decode(var73))
			elseif var68 == 3 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var63)
				var63 = var76
				var62.collection_id = buffer.tostring(var75)
			elseif var68 == 4 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p3, var63)
				var63 = var78
				var62.collection_position = buffer.tostring(var77)
			elseif var68 == 5 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p3, var63)
				var63 = var80
				var62.universe_id = buffer.tostring(var79)
			else
				local _ = nil
				local var81, var82 = protoModule.readVarInt(p3, var63)
				var63 = var82 + var81
			end
		elseif var64 == protoModule.wireTypes.i32 then
			local _ = nil
			local var83, var84 = protoModule.readFixed32(p3, var63)
			local _ = var83
			var63 = var84
		elseif var64 == protoModule.wireTypes.i64 then
			local _ = nil
			local var85, var86 = protoModule.readFixed64(p3, var63)
			local _ = var85
			var63 = var86
		else
			error("Unsupported wire type: " .. var109)
		end
	end
	return var62
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
	local var87 = t_3.new()
	
	if self.section_title ~= nil then
		var87.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var87.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridPageEntry_BadgeInputData.jsonDecode(v))
		end
		var87.badges = t_1
	end
	if self.collection_id ~= nil then
		var87.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var87.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var87.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var87.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var87.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var87.universe_id = self.universeId
	end
	return var87
end

t_3.descriptor = {
	name = "BadgesGridPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesGridPageEntry"
}
t.BadgesGridPageEntry = t_3
typeRegistryModule.default:register(t.BadgesGridPageEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		badge_id = if p4 == nil or p4.badge_id == nil then "" else p4.badge_id
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var88 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var89, var90 = protoModule.writeTag(buff, var88, 1, protoModule.wireTypes.lengthDelimited)
		var89, var139 = protoModule.writeString(var89, var90, self.badge_id)
		buff = var89
		var88 = var90
	end
	local buff_1 = buffer.create(var88)
	buffer.copy(buff_1, 0, buff, 0, var88)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var88 = t_4.new()
	local var89 = 0
	while var89 < buffer.len(p4) do
		local _ = nil
		local var90 = nil
		local var91, var92, var93 = protoModule.readTag(p4, var89)
		local var94 = var91
		var90 = var92
		var89 = var93
		
		if var90 == protoModule.wireTypes.varint then
			local _ = nil
			local var95, var96 = protoModule.readVarInt(p4, var89)
			local _ = var95
			var89 = var96
			continue
		end
		if var90 == protoModule.wireTypes.lengthDelimited then
			if var94 == 1 then
				local _ = nil
				local var97, var98 = protoModule.readBuffer(p4, var89)
				var89 = var98
				var88.badge_id = buffer.tostring(var97)
			else
				local _ = nil
				local var99, var100 = protoModule.readVarInt(p4, var89)
				var89 = var100 + var99
			end
		elseif var90 == protoModule.wireTypes.i32 then
			local _ = nil
			local var101, var102 = protoModule.readFixed32(p4, var89)
			local _ = var101
			var89 = var102
		elseif var90 == protoModule.wireTypes.i64 then
			local _ = nil
			local var103, var104 = protoModule.readFixed64(p4, var89)
			local _ = var103
			var89 = var104
		else
			error("Unsupported wire type: " .. var143)
		end
	end
	return var88
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
	local var105 = t_4.new()
	
	if self.badge_id ~= nil then
		var105.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var105.badge_id = self.badgeId
	end
	return var105
end

t_4.descriptor = {
	name = "BadgesGridPageEntry_BadgeInputData",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeInputData"
}
t.BadgesGridPageEntry_BadgeInputData = t_4
typeRegistryModule.default:register(t.BadgesGridPageEntry_BadgeInputData)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		page_entry = if p5 == nil or p5.page_entry == nil then nil else p5.page_entry,
		kind = if p5 == nil or p5.kind == nil then nil else p5.kind
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var105 = 0
	
	if self.page_entry ~= nil then
		local var106 = self.page_entry:encode()
		local var107, var108 = protoModule.writeTag(buff, var105, 1, protoModule.wireTypes.lengthDelimited)
		var107, var164 = protoModule.writeBuffer(var107, var108, var106, buffer.len(var106))
		buff = var107
		var105 = var108
	end
	if self.kind ~= nil and self.kind.type == "badges_grid" then
		local var109 = self.kind.value:encode()
		local var110, var111 = protoModule.writeTag(buff, var105, 2, protoModule.wireTypes.lengthDelimited)
		var110, var167 = protoModule.writeBuffer(var110, var111, var109, buffer.len(var109))
		buff = var110
		var105 = var111
	end
	local buff_1 = buffer.create(var105)
	buffer.copy(buff_1, 0, buff, 0, var105)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var105 = t_5.new()
	local var106 = 0
	while var106 < buffer.len(p5) do
		local _ = nil
		local var107 = nil
		local var108, var109, var110 = protoModule.readTag(p5, var106)
		local var111 = var108
		var107 = var109
		var106 = var110
		
		if var107 == protoModule.wireTypes.varint then
			local _ = nil
			local var112, var113 = protoModule.readVarInt(p5, var106)
			local _ = var112
			var106 = var113
			continue
		end
		if var107 == protoModule.wireTypes.lengthDelimited then
			if var111 == 1 then
				local _ = nil
				local var114, var115 = protoModule.readBuffer(p5, var106)
				var106 = var115
				var105.page_entry = pageEntryModule.PageEntry.decode(var114)
			elseif var111 == 2 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p5, var106)
				var106 = var117
				var105.kind = {
					type = "badges_grid",
					value = t.BadgesGridPageEntry.decode(var116)
				}
			else
				local _ = nil
				local var118, var119 = protoModule.readVarInt(p5, var106)
				var106 = var119 + var118
			end
		elseif var107 == protoModule.wireTypes.i32 then
			local _ = nil
			local var120, var121 = protoModule.readFixed32(p5, var106)
			local _ = var120
			var106 = var121
		elseif var107 == protoModule.wireTypes.i64 then
			local _ = nil
			local var122, var123 = protoModule.readFixed64(p5, var106)
			local _ = var122
			var106 = var123
		else
			error("Unsupported wire type: " .. var171)
		end
	end
	return var105
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
	local var124 = t_5.new()
	
	if self.page_entry ~= nil then
		var124.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var124.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badges_grid ~= nil then
		var124.kind = {
			type = "badges_grid",
			value = t.BadgesGridPageEntry.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var124.kind = {
			type = "badges_grid",
			value = t.BadgesGridPageEntry.jsonDecode(self.badgesGrid)
		}
	end
	return var124
end

t_5.descriptor = {
	name = "BadgesSeeAllPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllPageEntry"
}
t.BadgesSeeAllPageEntry = t_5
typeRegistryModule.default:register(t.BadgesSeeAllPageEntry)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		page_entries = if p6 == nil or p6.page_entries == nil then {} else p6.page_entries,
		hydration_data = if p6 == nil or p6.hydration_data == nil then nil else p6.hydration_data,
		templates = if p6 == nil or p6.templates == nil then {} else p6.templates,
		pagination = if p6 == nil or p6.pagination == nil then nil else p6.pagination
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var124 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var125 = v:encode()
			local var126, var127 = protoModule.writeTag(buff, var124, 1, protoModule.wireTypes.lengthDelimited)
			var126, var194 = protoModule.writeBuffer(var126, var127, var125, buffer.len(var125))
			buff = var126
			var124 = var127
		end
	end
	if self.hydration_data ~= nil then
		local var128 = self.hydration_data:encode()
		local var129, var130 = protoModule.writeTag(buff, var124, 2, protoModule.wireTypes.lengthDelimited)
		var129, var197 = protoModule.writeBuffer(var129, var130, var128, buffer.len(var128))
		buff = var129
		var124 = var130
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var131, var132 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var131, var199 = protoModule.writeString(var131, var132, i)
			local var133 = v:encode()
			var132, var201 = protoModule.writeTag(var131, var132, 2, protoModule.wireTypes.lengthDelimited)
			var132, var201 = protoModule.writeBuffer(var132, var201, var133, buffer.len(var133))
			local var134 = var132
			local var135 = var201
			local var136, var137 = protoModule.writeTag(buff, var124, 3, protoModule.wireTypes.lengthDelimited)
			var136, var205 = protoModule.writeBuffer(var136, var137, var134, var135)
			buff = var136
			var124 = var137
		end
	end
	if self.pagination ~= nil then
		local var138 = self.pagination:encode()
		local var139, var140 = protoModule.writeTag(buff, var124, 4, protoModule.wireTypes.lengthDelimited)
		var139, var208 = protoModule.writeBuffer(var139, var140, var138, buffer.len(var138))
		buff = var139
		var124 = var140
	end
	local buff_1 = buffer.create(var124)
	buffer.copy(buff_1, 0, buff, 0, var124)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var141 = t_6.new()
	local var142 = 0
	while var142 < buffer.len(p6) do
		local _ = nil
		local var143 = nil
		local var144, var145, var146 = protoModule.readTag(p6, var142)
		local var147 = var144
		var143 = var145
		var142 = var146
		
		if var143 == protoModule.wireTypes.varint then
			local _ = nil
			local var148, var149 = protoModule.readVarInt(p6, var142)
			local _ = var148
			var142 = var149
			continue
		end
		if var143 == protoModule.wireTypes.lengthDelimited then
			if var147 == 1 then
				local _ = nil
				local var150, var151 = protoModule.readBuffer(p6, var142)
				var142 = var151
				table.insert(var141.page_entries, t.BadgesSeeAllPageEntry.decode(var150))
			elseif var147 == 2 then
				local _ = nil
				local var152, var153 = protoModule.readBuffer(p6, var142)
				var142 = var153
				var141.hydration_data = hydrationContentModule.HydrationContent.decode(var152)
			elseif var147 == 3 then
				local _ = nil
				local var154, var155 = protoModule.readBuffer(p6, var142)
				var142 = var155
				var154 = t.BadgesSeeAllResponse_TemplatesEntry.decode(var154)
				var141.templates[var154.key or ""] = var154.value or templateEntryModule.TemplateEntry.new()
			elseif var147 == 4 then
				local _ = nil
				local var156, var157 = protoModule.readBuffer(p6, var142)
				var142 = var157
				var141.pagination = t.Pagination.decode(var156)
			else
				local _ = nil
				local var158, var159 = protoModule.readVarInt(p6, var142)
				var142 = var159 + var158
			end
		elseif var143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var160, var161 = protoModule.readFixed32(p6, var142)
			local _ = var160
			var142 = var161
		elseif var143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var162, var163 = protoModule.readFixed64(p6, var142)
			local _ = var162
			var142 = var163
		else
			error("Unsupported wire type: " .. var212)
		end
	end
	return var141
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
	local var164 = t_6.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, t.BadgesSeeAllPageEntry.jsonDecode(v))
		end
		var164.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, t.BadgesSeeAllPageEntry.jsonDecode(v))
		end
		var164.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var164.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var164.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var164.templates = t_1
	end
	if self.pagination ~= nil then
		var164.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var164
end

t_6.descriptor = {
	name = "BadgesSeeAllResponse",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllResponse"
}
t.BadgesSeeAllResponse = t_6
typeRegistryModule.default:register(t.BadgesSeeAllResponse)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		key = if p7 == nil or p7.key == nil then "" else p7.key,
		value = if p7 == nil or p7.value == nil then nil else p7.value
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var165 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var166, var167 = protoModule.writeTag(buff, var165, 1, protoModule.wireTypes.lengthDelimited)
		var166, var243 = protoModule.writeString(var166, var167, self.key)
		buff = var166
		var165 = var167
	end
	if self.value ~= nil then
		local var168 = self.value:encode()
		local var169, var170 = protoModule.writeTag(buff, var165, 2, protoModule.wireTypes.lengthDelimited)
		var169, var246 = protoModule.writeBuffer(var169, var170, var168, buffer.len(var168))
		buff = var169
		var165 = var170
	end
	local buff_1 = buffer.create(var165)
	buffer.copy(buff_1, 0, buff, 0, var165)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), templateEntryModule (ref)
	local var165 = t_7.new()
	local var166 = 0
	while var166 < buffer.len(p7) do
		local _ = nil
		local var167 = nil
		local var168, var169, var170 = protoModule.readTag(p7, var166)
		local var171 = var168
		var167 = var169
		var166 = var170
		
		if var167 == protoModule.wireTypes.varint then
			local _ = nil
			local var172, var173 = protoModule.readVarInt(p7, var166)
			local _ = var172
			var166 = var173
			continue
		end
		if var167 == protoModule.wireTypes.lengthDelimited then
			if var171 == 1 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p7, var166)
				var166 = var175
				var165.key = buffer.tostring(var174)
			elseif var171 == 2 then
				local _ = nil
				local var176, var177 = protoModule.readBuffer(p7, var166)
				var166 = var177
				var165.value = templateEntryModule.TemplateEntry.decode(var176)
			else
				local _ = nil
				local var178, var179 = protoModule.readVarInt(p7, var166)
				var166 = var179 + var178
			end
		elseif var167 == protoModule.wireTypes.i32 then
			local _ = nil
			local var180, var181 = protoModule.readFixed32(p7, var166)
			local _ = var180
			var166 = var181
		elseif var167 == protoModule.wireTypes.i64 then
			local _ = nil
			local var182, var183 = protoModule.readFixed64(p7, var166)
			local _ = var182
			var166 = var183
		else
			error("Unsupported wire type: " .. var250)
		end
	end
	return var165
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
	local var184 = t_7.new()
	
	if self.key ~= nil then
		var184.key = self.key
	end
	if self.value ~= nil then
		var184.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var184
end

t_7.descriptor = {
	name = "BadgesSeeAllResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
t.BadgesSeeAllResponse_TemplatesEntry = t_7
typeRegistryModule.default:register(t.BadgesSeeAllResponse_TemplatesEntry)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		page_entries = if p8 == nil or p8.page_entries == nil then {} else p8.page_entries,
		hydration_data = if p8 == nil or p8.hydration_data == nil then nil else p8.hydration_data,
		templates = if p8 == nil or p8.templates == nil then {} else p8.templates,
		pagination = if p8 == nil or p8.pagination == nil then nil else p8.pagination
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var184 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var185 = v:encode()
			local var186, var187 = protoModule.writeTag(buff, var184, 1, protoModule.wireTypes.lengthDelimited)
			var186, var273 = protoModule.writeBuffer(var186, var187, var185, buffer.len(var185))
			buff = var186
			var184 = var187
		end
	end
	if self.hydration_data ~= nil then
		local var188 = self.hydration_data:encode()
		local var189, var190 = protoModule.writeTag(buff, var184, 2, protoModule.wireTypes.lengthDelimited)
		var189, var276 = protoModule.writeBuffer(var189, var190, var188, buffer.len(var188))
		buff = var189
		var184 = var190
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var191, var192 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var191, var278 = protoModule.writeString(var191, var192, i)
			local var193 = v:encode()
			var192, var280 = protoModule.writeTag(var191, var192, 2, protoModule.wireTypes.lengthDelimited)
			var192, var280 = protoModule.writeBuffer(var192, var280, var193, buffer.len(var193))
			local var194 = var192
			local var195 = var280
			local var196, var197 = protoModule.writeTag(buff, var184, 3, protoModule.wireTypes.lengthDelimited)
			var196, var284 = protoModule.writeBuffer(var196, var197, var194, var195)
			buff = var196
			var184 = var197
		end
	end
	if self.pagination ~= nil then
		local var198 = self.pagination:encode()
		local var199, var200 = protoModule.writeTag(buff, var184, 4, protoModule.wireTypes.lengthDelimited)
		var199, var287 = protoModule.writeBuffer(var199, var200, var198, buffer.len(var198))
		buff = var199
		var184 = var200
	end
	local buff_1 = buffer.create(var184)
	buffer.copy(buff_1, 0, buff, 0, var184)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var201 = t_8.new()
	local var202 = 0
	while var202 < buffer.len(p8) do
		local _ = nil
		local var203 = nil
		local var204, var205, var206 = protoModule.readTag(p8, var202)
		local var207 = var204
		var203 = var205
		var202 = var206
		
		if var203 == protoModule.wireTypes.varint then
			local _ = nil
			local var208, var209 = protoModule.readVarInt(p8, var202)
			local _ = var208
			var202 = var209
			continue
		end
		if var203 == protoModule.wireTypes.lengthDelimited then
			if var207 == 1 then
				local _ = nil
				local var210, var211 = protoModule.readBuffer(p8, var202)
				var202 = var211
				table.insert(var201.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var210))
			elseif var207 == 2 then
				local _ = nil
				local var212, var213 = protoModule.readBuffer(p8, var202)
				var202 = var213
				var201.hydration_data = hydrationContentModule.HydrationContent.decode(var212)
			elseif var207 == 3 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p8, var202)
				var202 = var215
				var214 = t.BadgesSeeAllV2Response_TemplatesEntry.decode(var214)
				var201.templates[var214.key or ""] = var214.value or templateEntryModule.TemplateEntry.new()
			elseif var207 == 4 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p8, var202)
				var202 = var217
				var201.pagination = t.Pagination.decode(var216)
			else
				local _ = nil
				local var218, var219 = protoModule.readVarInt(p8, var202)
				var202 = var219 + var218
			end
		elseif var203 == protoModule.wireTypes.i32 then
			local _ = nil
			local var220, var221 = protoModule.readFixed32(p8, var202)
			local _ = var220
			var202 = var221
		elseif var203 == protoModule.wireTypes.i64 then
			local _ = nil
			local var222, var223 = protoModule.readFixed64(p8, var202)
			local _ = var222
			var202 = var223
		else
			error("Unsupported wire type: " .. var291)
		end
	end
	return var201
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
	local var224 = t_8.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var224.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var224.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var224.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var224.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var224.templates = t_1
	end
	if self.pagination ~= nil then
		var224.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var224
end

t_8.descriptor = {
	name = "BadgesSeeAllV2Response",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllV2Response"
}
t.BadgesSeeAllV2Response = t_8
typeRegistryModule.default:register(t.BadgesSeeAllV2Response)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		key = if p9 == nil or p9.key == nil then "" else p9.key,
		value = if p9 == nil or p9.value == nil then nil else p9.value
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var225 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var226, var227 = protoModule.writeTag(buff, var225, 1, protoModule.wireTypes.lengthDelimited)
		var226, var322 = protoModule.writeString(var226, var227, self.key)
		buff = var226
		var225 = var227
	end
	if self.value ~= nil then
		local var228 = self.value:encode()
		local var229, var230 = protoModule.writeTag(buff, var225, 2, protoModule.wireTypes.lengthDelimited)
		var229, var325 = protoModule.writeBuffer(var229, var230, var228, buffer.len(var228))
		buff = var229
		var225 = var230
	end
	local buff_1 = buffer.create(var225)
	buffer.copy(buff_1, 0, buff, 0, var225)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), templateEntryModule (ref)
	local var225 = t_9.new()
	local var226 = 0
	while var226 < buffer.len(p9) do
		local _ = nil
		local var227 = nil
		local var228, var229, var230 = protoModule.readTag(p9, var226)
		local var231 = var228
		var227 = var229
		var226 = var230
		
		if var227 == protoModule.wireTypes.varint then
			local _ = nil
			local var232, var233 = protoModule.readVarInt(p9, var226)
			local _ = var232
			var226 = var233
			continue
		end
		if var227 == protoModule.wireTypes.lengthDelimited then
			if var231 == 1 then
				local _ = nil
				local var234, var235 = protoModule.readBuffer(p9, var226)
				var226 = var235
				var225.key = buffer.tostring(var234)
			elseif var231 == 2 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p9, var226)
				var226 = var237
				var225.value = templateEntryModule.TemplateEntry.decode(var236)
			else
				local _ = nil
				local var238, var239 = protoModule.readVarInt(p9, var226)
				var226 = var239 + var238
			end
		elseif var227 == protoModule.wireTypes.i32 then
			local _ = nil
			local var240, var241 = protoModule.readFixed32(p9, var226)
			local _ = var240
			var226 = var241
		elseif var227 == protoModule.wireTypes.i64 then
			local _ = nil
			local var242, var243 = protoModule.readFixed64(p9, var226)
			local _ = var242
			var226 = var243
		else
			error("Unsupported wire type: " .. var329)
		end
	end
	return var225
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
	local var244 = t_9.new()
	
	if self.key ~= nil then
		var244.key = self.key
	end
	if self.value ~= nil then
		var244.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var244
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