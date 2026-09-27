local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local clientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
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
		page_entry_format = if p1 == nil or p1.page_entry_format == nil then assert(pageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p1.page_entry_format,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref), pageEntryContentModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
		var2, var20 = protoModule.writeVarInt(var2, var3, self.universe_id)
		buff = var2
		var1 = var3
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.varint)
		var4, var22 = protoModule.writeVarInt(var4, var5, self.user_id)
		buff = var4
		var1 = var5
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.varint)
		var6, var24 = protoModule.writeVarInt(var6, var7, self.page_size)
		buff = var6
		var1 = var7
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
		var8, var26 = protoModule.writeString(var8, var9, self.cursor)
		buff = var8
		var1 = var9
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= pageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local var10, var11 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.varint)
		var10, var28 = protoModule.writeVarInt(var10, var11, pageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
		buff = var10
		var1 = var11
	end
	if self.client_capabilities ~= nil then
		local var12 = self.client_capabilities:encode()
		local var13, var14 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
		var13, var31 = protoModule.writeBuffer(var13, var14, var12, buffer.len(var12))
		buff = var13
		var1 = var14
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryContentModule (ref), clientCapabilitiesModule (ref)
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
			elseif var7 == 6 then
				local _ = nil
				local var21, var22 = protoModule.readBuffer(p1, var2)
				var2 = var22
				var1.client_capabilities = clientCapabilitiesModule.ClientCapabilities.decode(var21)
			else
				local _ = nil
				local var23, var24 = protoModule.readVarInt(p1, var2)
				var2 = var24 + var23
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var25, var26 = protoModule.readFixed32(p1, var2)
			local _ = var25
			var2 = var26
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var27, var28 = protoModule.readFixed64(p1, var2)
			local _ = var27
			var2 = var28
		else
			error("Unsupported wire type: " .. var35)
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
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), pageEntryContentModule (ref), clientCapabilitiesModule (ref)
	local var29 = t_1.new()
	
	if self.universe_id ~= nil then
		var29.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var29.universe_id = self.universeId
	end
	if self.user_id ~= nil then
		var29.user_id = self.user_id
	end
	if self.userId ~= nil then
		var29.user_id = self.userId
	end
	if self.page_size ~= nil then
		var29.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var29.page_size = self.pageSize
	end
	if self.cursor ~= nil then
		var29.cursor = self.cursor
	end
	if self.page_entry_format ~= nil then
		var29.page_entry_format = if typeof(self.page_entry_format) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.page_entry_format) or self.page_entry_format else pageEntryContentModule.PageEntryFormat.fromName(self.page_entry_format) or self.page_entry_format
	end
	if self.pageEntryFormat ~= nil then
		var29.page_entry_format = if typeof(self.pageEntryFormat) == "number" then pageEntryContentModule.PageEntryFormat.fromNumber(self.pageEntryFormat) or self.pageEntryFormat else pageEntryContentModule.PageEntryFormat.fromName(self.pageEntryFormat) or self.pageEntryFormat
	end
	if self.client_capabilities ~= nil then
		var29.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		var29.client_capabilities = clientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return var29
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
	local var29 = 0
	
	if self.page_size ~= nil and self.page_size ~= 0 then
		local var30, var31 = protoModule.writeTag(buff, var29, 1, protoModule.wireTypes.varint)
		var30, var66 = protoModule.writeVarInt(var30, var31, self.page_size)
		buff = var30
		var29 = var31
	end
	if self.next_cursor ~= nil and self.next_cursor ~= "" then
		local var32, var33 = protoModule.writeTag(buff, var29, 2, protoModule.wireTypes.lengthDelimited)
		var32, var68 = protoModule.writeString(var32, var33, self.next_cursor)
		buff = var32
		var29 = var33
	end
	if self.prev_cursor ~= nil and self.prev_cursor ~= "" then
		local var34, var35 = protoModule.writeTag(buff, var29, 3, protoModule.wireTypes.lengthDelimited)
		var34, var70 = protoModule.writeString(var34, var35, self.prev_cursor)
		buff = var34
		var29 = var35
	end
	if self.total ~= nil and self.total ~= 0 then
		local var36, var37 = protoModule.writeTag(buff, var29, 4, protoModule.wireTypes.varint)
		var36, var72 = protoModule.writeVarInt(var36, var37, self.total)
		buff = var36
		var29 = var37
	end
	local buff_1 = buffer.create(var29)
	buffer.copy(buff_1, 0, buff, 0, var29)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref)
	local var29 = t_2.new()
	local var30 = 0
	while var30 < buffer.len(p2) do
		local _ = nil
		local var31 = nil
		local var32, var33, var34 = protoModule.readTag(p2, var30)
		local var35 = var32
		var31 = var33
		var30 = var34
		
		if var31 == protoModule.wireTypes.varint then
			if var35 == 1 then
				local _ = nil
				local var36, var37 = protoModule.readVarIntI32(p2, var30)
				var30 = var37
				var29.page_size = var36
			elseif var35 == 4 then
				local _ = nil
				local var38, var39 = protoModule.readVarIntI64(p2, var30)
				var30 = var39
				var29.total = var38
			else
				local _ = nil
				local var40, var41 = protoModule.readVarInt(p2, var30)
				local _ = var40
				var30 = var41
			end
		end
		if var31 == protoModule.wireTypes.lengthDelimited then
			if var35 == 2 then
				local _ = nil
				local var42, var43 = protoModule.readBuffer(p2, var30)
				var30 = var43
				var29.next_cursor = buffer.tostring(var42)
			elseif var35 == 3 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p2, var30)
				var30 = var45
				var29.prev_cursor = buffer.tostring(var44)
			else
				local _ = nil
				local var46, var47 = protoModule.readVarInt(p2, var30)
				var30 = var47 + var46
			end
		elseif var31 == protoModule.wireTypes.i32 then
			local _ = nil
			local var48, var49 = protoModule.readFixed32(p2, var30)
			local _ = var48
			var30 = var49
		elseif var31 == protoModule.wireTypes.i64 then
			local _ = nil
			local var50, var51 = protoModule.readFixed64(p2, var30)
			local _ = var50
			var30 = var51
		else
			error("Unsupported wire type: " .. var76)
		end
	end
	return var29
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
	local var52 = t_2.new()
	
	if self.page_size ~= nil then
		var52.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		var52.page_size = self.pageSize
	end
	if self.next_cursor ~= nil then
		var52.next_cursor = self.next_cursor
	end
	if self.nextCursor ~= nil then
		var52.next_cursor = self.nextCursor
	end
	if self.prev_cursor ~= nil then
		var52.prev_cursor = self.prev_cursor
	end
	if self.prevCursor ~= nil then
		var52.prev_cursor = self.prevCursor
	end
	if self.total ~= nil then
		var52.total = self.total
	end
	return var52
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
	local var52 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var53, var54 = protoModule.writeTag(buff, var52, 1, protoModule.wireTypes.lengthDelimited)
		var53, var102 = protoModule.writeString(var53, var54, self.section_title)
		buff = var53
		var52 = var54
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var55 = v:encode()
			local var56, var57 = protoModule.writeTag(buff, var52, 2, protoModule.wireTypes.lengthDelimited)
			var56, var105 = protoModule.writeBuffer(var56, var57, var55, buffer.len(var55))
			buff = var56
			var52 = var57
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var58, var59 = protoModule.writeTag(buff, var52, 3, protoModule.wireTypes.lengthDelimited)
		var58, var107 = protoModule.writeString(var58, var59, self.collection_id)
		buff = var58
		var52 = var59
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var60, var61 = protoModule.writeTag(buff, var52, 4, protoModule.wireTypes.lengthDelimited)
		var60, var109 = protoModule.writeString(var60, var61, self.collection_position)
		buff = var60
		var52 = var61
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var62, var63 = protoModule.writeTag(buff, var52, 5, protoModule.wireTypes.lengthDelimited)
		var62, var111 = protoModule.writeString(var62, var63, self.universe_id)
		buff = var62
		var52 = var63
	end
	local buff_1 = buffer.create(var52)
	buffer.copy(buff_1, 0, buff, 0, var52)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var64 = t_3.new()
	local var65 = 0
	while var65 < buffer.len(p3) do
		local _ = nil
		local var66 = nil
		local var67, var68, var69 = protoModule.readTag(p3, var65)
		local var70 = var67
		var66 = var68
		var65 = var69
		
		if var66 == protoModule.wireTypes.varint then
			local _ = nil
			local var71, var72 = protoModule.readVarInt(p3, var65)
			local _ = var71
			var65 = var72
			continue
		end
		if var66 == protoModule.wireTypes.lengthDelimited then
			if var70 == 1 then
				local _ = nil
				local var73, var74 = protoModule.readBuffer(p3, var65)
				var65 = var74
				var64.section_title = buffer.tostring(var73)
			elseif var70 == 2 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var65)
				var65 = var76
				table.insert(var64.badges, t.BadgesGridPageEntry_BadgeInputData.decode(var75))
			elseif var70 == 3 then
				local _ = nil
				local var77, var78 = protoModule.readBuffer(p3, var65)
				var65 = var78
				var64.collection_id = buffer.tostring(var77)
			elseif var70 == 4 then
				local _ = nil
				local var79, var80 = protoModule.readBuffer(p3, var65)
				var65 = var80
				var64.collection_position = buffer.tostring(var79)
			elseif var70 == 5 then
				local _ = nil
				local var81, var82 = protoModule.readBuffer(p3, var65)
				var65 = var82
				var64.universe_id = buffer.tostring(var81)
			else
				local _ = nil
				local var83, var84 = protoModule.readVarInt(p3, var65)
				var65 = var84 + var83
			end
		elseif var66 == protoModule.wireTypes.i32 then
			local _ = nil
			local var85, var86 = protoModule.readFixed32(p3, var65)
			local _ = var85
			var65 = var86
		elseif var66 == protoModule.wireTypes.i64 then
			local _ = nil
			local var87, var88 = protoModule.readFixed64(p3, var65)
			local _ = var87
			var65 = var88
		else
			error("Unsupported wire type: " .. var115)
		end
	end
	return var64
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
	local var89 = t_3.new()
	
	if self.section_title ~= nil then
		var89.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var89.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridPageEntry_BadgeInputData.jsonDecode(v))
		end
		var89.badges = t_1
	end
	if self.collection_id ~= nil then
		var89.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var89.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var89.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var89.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var89.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var89.universe_id = self.universeId
	end
	return var89
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
	local var90 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var91, var92 = protoModule.writeTag(buff, var90, 1, protoModule.wireTypes.lengthDelimited)
		var91, var145 = protoModule.writeString(var91, var92, self.badge_id)
		buff = var91
		var90 = var92
	end
	local buff_1 = buffer.create(var90)
	buffer.copy(buff_1, 0, buff, 0, var90)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var90 = t_4.new()
	local var91 = 0
	while var91 < buffer.len(p4) do
		local _ = nil
		local var92 = nil
		local var93, var94, var95 = protoModule.readTag(p4, var91)
		local var96 = var93
		var92 = var94
		var91 = var95
		
		if var92 == protoModule.wireTypes.varint then
			local _ = nil
			local var97, var98 = protoModule.readVarInt(p4, var91)
			local _ = var97
			var91 = var98
			continue
		end
		if var92 == protoModule.wireTypes.lengthDelimited then
			if var96 == 1 then
				local _ = nil
				local var99, var100 = protoModule.readBuffer(p4, var91)
				var91 = var100
				var90.badge_id = buffer.tostring(var99)
			else
				local _ = nil
				local var101, var102 = protoModule.readVarInt(p4, var91)
				var91 = var102 + var101
			end
		elseif var92 == protoModule.wireTypes.i32 then
			local _ = nil
			local var103, var104 = protoModule.readFixed32(p4, var91)
			local _ = var103
			var91 = var104
		elseif var92 == protoModule.wireTypes.i64 then
			local _ = nil
			local var105, var106 = protoModule.readFixed64(p4, var91)
			local _ = var105
			var91 = var106
		else
			error("Unsupported wire type: " .. var149)
		end
	end
	return var90
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
	local var107 = t_4.new()
	
	if self.badge_id ~= nil then
		var107.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var107.badge_id = self.badgeId
	end
	return var107
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
	local var107 = 0
	
	if self.page_entry ~= nil then
		local var108 = self.page_entry:encode()
		local var109, var110 = protoModule.writeTag(buff, var107, 1, protoModule.wireTypes.lengthDelimited)
		var109, var170 = protoModule.writeBuffer(var109, var110, var108, buffer.len(var108))
		buff = var109
		var107 = var110
	end
	if self.kind ~= nil and self.kind.type == "badges_grid" then
		local var111 = self.kind.value:encode()
		local var112, var113 = protoModule.writeTag(buff, var107, 2, protoModule.wireTypes.lengthDelimited)
		var112, var173 = protoModule.writeBuffer(var112, var113, var111, buffer.len(var111))
		buff = var112
		var107 = var113
	end
	local buff_1 = buffer.create(var107)
	buffer.copy(buff_1, 0, buff, 0, var107)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var107 = t_5.new()
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
				var107.page_entry = pageEntryModule.PageEntry.decode(var116)
			elseif var113 == 2 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p5, var108)
				var108 = var119
				var107.kind = {
					type = "badges_grid",
					value = t.BadgesGridPageEntry.decode(var118)
				}
			else
				local _ = nil
				local var120, var121 = protoModule.readVarInt(p5, var108)
				var108 = var121 + var120
			end
		elseif var109 == protoModule.wireTypes.i32 then
			local _ = nil
			local var122, var123 = protoModule.readFixed32(p5, var108)
			local _ = var122
			var108 = var123
		elseif var109 == protoModule.wireTypes.i64 then
			local _ = nil
			local var124, var125 = protoModule.readFixed64(p5, var108)
			local _ = var124
			var108 = var125
		else
			error("Unsupported wire type: " .. var177)
		end
	end
	return var107
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
	local var126 = t_5.new()
	
	if self.page_entry ~= nil then
		var126.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var126.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badges_grid ~= nil then
		var126.kind = {
			type = "badges_grid",
			value = t.BadgesGridPageEntry.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var126.kind = {
			type = "badges_grid",
			value = t.BadgesGridPageEntry.jsonDecode(self.badgesGrid)
		}
	end
	return var126
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
	local var126 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var127 = v:encode()
			local var128, var129 = protoModule.writeTag(buff, var126, 1, protoModule.wireTypes.lengthDelimited)
			var128, var200 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
			buff = var128
			var126 = var129
		end
	end
	if self.hydration_data ~= nil then
		local var130 = self.hydration_data:encode()
		local var131, var132 = protoModule.writeTag(buff, var126, 2, protoModule.wireTypes.lengthDelimited)
		var131, var203 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
		buff = var131
		var126 = var132
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var133, var134 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var133, var205 = protoModule.writeString(var133, var134, i)
			local var135 = v:encode()
			var134, var207 = protoModule.writeTag(var133, var134, 2, protoModule.wireTypes.lengthDelimited)
			var134, var207 = protoModule.writeBuffer(var134, var207, var135, buffer.len(var135))
			local var136 = var134
			local var137 = var207
			local var138, var139 = protoModule.writeTag(buff, var126, 3, protoModule.wireTypes.lengthDelimited)
			var138, var211 = protoModule.writeBuffer(var138, var139, var136, var137)
			buff = var138
			var126 = var139
		end
	end
	if self.pagination ~= nil then
		local var140 = self.pagination:encode()
		local var141, var142 = protoModule.writeTag(buff, var126, 4, protoModule.wireTypes.lengthDelimited)
		var141, var214 = protoModule.writeBuffer(var141, var142, var140, buffer.len(var140))
		buff = var141
		var126 = var142
	end
	local buff_1 = buffer.create(var126)
	buffer.copy(buff_1, 0, buff, 0, var126)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref), hydrationContentModule (ref), templateEntryModule (ref)
	local var143 = t_6.new()
	local var144 = 0
	while var144 < buffer.len(p6) do
		local _ = nil
		local var145 = nil
		local var146, var147, var148 = protoModule.readTag(p6, var144)
		local var149 = var146
		var145 = var147
		var144 = var148
		
		if var145 == protoModule.wireTypes.varint then
			local _ = nil
			local var150, var151 = protoModule.readVarInt(p6, var144)
			local _ = var150
			var144 = var151
			continue
		end
		if var145 == protoModule.wireTypes.lengthDelimited then
			if var149 == 1 then
				local _ = nil
				local var152, var153 = protoModule.readBuffer(p6, var144)
				var144 = var153
				table.insert(var143.page_entries, t.BadgesSeeAllPageEntry.decode(var152))
			elseif var149 == 2 then
				local _ = nil
				local var154, var155 = protoModule.readBuffer(p6, var144)
				var144 = var155
				var143.hydration_data = hydrationContentModule.HydrationContent.decode(var154)
			elseif var149 == 3 then
				local _ = nil
				local var156, var157 = protoModule.readBuffer(p6, var144)
				var144 = var157
				var156 = t.BadgesSeeAllResponse_TemplatesEntry.decode(var156)
				var143.templates[var156.key or ""] = var156.value or templateEntryModule.TemplateEntry.new()
			elseif var149 == 4 then
				local _ = nil
				local var158, var159 = protoModule.readBuffer(p6, var144)
				var144 = var159
				var143.pagination = t.Pagination.decode(var158)
			else
				local _ = nil
				local var160, var161 = protoModule.readVarInt(p6, var144)
				var144 = var161 + var160
			end
		elseif var145 == protoModule.wireTypes.i32 then
			local _ = nil
			local var162, var163 = protoModule.readFixed32(p6, var144)
			local _ = var162
			var144 = var163
		elseif var145 == protoModule.wireTypes.i64 then
			local _ = nil
			local var164, var165 = protoModule.readFixed64(p6, var144)
			local _ = var164
			var144 = var165
		else
			error("Unsupported wire type: " .. var218)
		end
	end
	return var143
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
	local var166 = t_6.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, t.BadgesSeeAllPageEntry.jsonDecode(v))
		end
		var166.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, t.BadgesSeeAllPageEntry.jsonDecode(v))
		end
		var166.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var166.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var166.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var166.templates = t_1
	end
	if self.pagination ~= nil then
		var166.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var166
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
	local var167 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var168, var169 = protoModule.writeTag(buff, var167, 1, protoModule.wireTypes.lengthDelimited)
		var168, var249 = protoModule.writeString(var168, var169, self.key)
		buff = var168
		var167 = var169
	end
	if self.value ~= nil then
		local var170 = self.value:encode()
		local var171, var172 = protoModule.writeTag(buff, var167, 2, protoModule.wireTypes.lengthDelimited)
		var171, var252 = protoModule.writeBuffer(var171, var172, var170, buffer.len(var170))
		buff = var171
		var167 = var172
	end
	local buff_1 = buffer.create(var167)
	buffer.copy(buff_1, 0, buff, 0, var167)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), templateEntryModule (ref)
	local var167 = t_7.new()
	local var168 = 0
	while var168 < buffer.len(p7) do
		local _ = nil
		local var169 = nil
		local var170, var171, var172 = protoModule.readTag(p7, var168)
		local var173 = var170
		var169 = var171
		var168 = var172
		
		if var169 == protoModule.wireTypes.varint then
			local _ = nil
			local var174, var175 = protoModule.readVarInt(p7, var168)
			local _ = var174
			var168 = var175
			continue
		end
		if var169 == protoModule.wireTypes.lengthDelimited then
			if var173 == 1 then
				local _ = nil
				local var176, var177 = protoModule.readBuffer(p7, var168)
				var168 = var177
				var167.key = buffer.tostring(var176)
			elseif var173 == 2 then
				local _ = nil
				local var178, var179 = protoModule.readBuffer(p7, var168)
				var168 = var179
				var167.value = templateEntryModule.TemplateEntry.decode(var178)
			else
				local _ = nil
				local var180, var181 = protoModule.readVarInt(p7, var168)
				var168 = var181 + var180
			end
		elseif var169 == protoModule.wireTypes.i32 then
			local _ = nil
			local var182, var183 = protoModule.readFixed32(p7, var168)
			local _ = var182
			var168 = var183
		elseif var169 == protoModule.wireTypes.i64 then
			local _ = nil
			local var184, var185 = protoModule.readFixed64(p7, var168)
			local _ = var184
			var168 = var185
		else
			error("Unsupported wire type: " .. var256)
		end
	end
	return var167
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
	local var186 = t_7.new()
	
	if self.key ~= nil then
		var186.key = self.key
	end
	if self.value ~= nil then
		var186.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var186
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
	local var186 = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for i, v in self.page_entries do
			local var187 = v:encode()
			local var188, var189 = protoModule.writeTag(buff, var186, 1, protoModule.wireTypes.lengthDelimited)
			var188, var279 = protoModule.writeBuffer(var188, var189, var187, buffer.len(var187))
			buff = var188
			var186 = var189
		end
	end
	if self.hydration_data ~= nil then
		local var190 = self.hydration_data:encode()
		local var191, var192 = protoModule.writeTag(buff, var186, 2, protoModule.wireTypes.lengthDelimited)
		var191, var282 = protoModule.writeBuffer(var191, var192, var190, buffer.len(var190))
		buff = var191
		var186 = var192
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, v in self.templates do
			local var193, var194 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var193, var284 = protoModule.writeString(var193, var194, i)
			local var195 = v:encode()
			var194, var286 = protoModule.writeTag(var193, var194, 2, protoModule.wireTypes.lengthDelimited)
			var194, var286 = protoModule.writeBuffer(var194, var286, var195, buffer.len(var195))
			local var196 = var194
			local var197 = var286
			local var198, var199 = protoModule.writeTag(buff, var186, 3, protoModule.wireTypes.lengthDelimited)
			var198, var290 = protoModule.writeBuffer(var198, var199, var196, var197)
			buff = var198
			var186 = var199
		end
	end
	if self.pagination ~= nil then
		local var200 = self.pagination:encode()
		local var201, var202 = protoModule.writeTag(buff, var186, 4, protoModule.wireTypes.lengthDelimited)
		var201, var293 = protoModule.writeBuffer(var201, var202, var200, buffer.len(var200))
		buff = var201
		var186 = var202
	end
	local buff_1 = buffer.create(var186)
	buffer.copy(buff_1, 0, buff, 0, var186)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), pageEntryContentModule (ref), hydrationContentModule (ref), t (ref), templateEntryModule (ref)
	local var203 = t_8.new()
	local var204 = 0
	while var204 < buffer.len(p8) do
		local _ = nil
		local var205 = nil
		local var206, var207, var208 = protoModule.readTag(p8, var204)
		local var209 = var206
		var205 = var207
		var204 = var208
		
		if var205 == protoModule.wireTypes.varint then
			local _ = nil
			local var210, var211 = protoModule.readVarInt(p8, var204)
			local _ = var210
			var204 = var211
			continue
		end
		if var205 == protoModule.wireTypes.lengthDelimited then
			if var209 == 1 then
				local _ = nil
				local var212, var213 = protoModule.readBuffer(p8, var204)
				var204 = var213
				table.insert(var203.page_entries, pageEntryContentModule.UniversalPageEntry.decode(var212))
			elseif var209 == 2 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p8, var204)
				var204 = var215
				var203.hydration_data = hydrationContentModule.HydrationContent.decode(var214)
			elseif var209 == 3 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p8, var204)
				var204 = var217
				var216 = t.BadgesSeeAllV2Response_TemplatesEntry.decode(var216)
				var203.templates[var216.key or ""] = var216.value or templateEntryModule.TemplateEntry.new()
			elseif var209 == 4 then
				local _ = nil
				local var218, var219 = protoModule.readBuffer(p8, var204)
				var204 = var219
				var203.pagination = t.Pagination.decode(var218)
			else
				local _ = nil
				local var220, var221 = protoModule.readVarInt(p8, var204)
				var204 = var221 + var220
			end
		elseif var205 == protoModule.wireTypes.i32 then
			local _ = nil
			local var222, var223 = protoModule.readFixed32(p8, var204)
			local _ = var222
			var204 = var223
		elseif var205 == protoModule.wireTypes.i64 then
			local _ = nil
			local var224, var225 = protoModule.readFixed64(p8, var204)
			local _ = var224
			var204 = var225
		else
			error("Unsupported wire type: " .. var297)
		end
	end
	return var203
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
	local var226 = t_8.new()
	
	if self.page_entries ~= nil then
		local t_1 = {}
		
		for i, v in self.page_entries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var226.page_entries = t_1
	end
	if self.pageEntries ~= nil then
		local t_1 = {}
		
		for i, v in self.pageEntries do
			table.insert(t_1, pageEntryContentModule.UniversalPageEntry.jsonDecode(v))
		end
		var226.page_entries = t_1
	end
	if self.hydration_data ~= nil then
		var226.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		var226.hydration_data = hydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local t_1 = {}
		
		for i, v in self.templates do
			t_1[i] = templateEntryModule.TemplateEntry.jsonDecode(v)
		end
		var226.templates = t_1
	end
	if self.pagination ~= nil then
		var226.pagination = t.Pagination.jsonDecode(self.pagination)
	end
	return var226
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
	local var227 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var228, var229 = protoModule.writeTag(buff, var227, 1, protoModule.wireTypes.lengthDelimited)
		var228, var328 = protoModule.writeString(var228, var229, self.key)
		buff = var228
		var227 = var229
	end
	if self.value ~= nil then
		local var230 = self.value:encode()
		local var231, var232 = protoModule.writeTag(buff, var227, 2, protoModule.wireTypes.lengthDelimited)
		var231, var331 = protoModule.writeBuffer(var231, var232, var230, buffer.len(var230))
		buff = var231
		var227 = var232
	end
	local buff_1 = buffer.create(var227)
	buffer.copy(buff_1, 0, buff, 0, var227)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), templateEntryModule (ref)
	local var227 = t_9.new()
	local var228 = 0
	while var228 < buffer.len(p9) do
		local _ = nil
		local var229 = nil
		local var230, var231, var232 = protoModule.readTag(p9, var228)
		local var233 = var230
		var229 = var231
		var228 = var232
		
		if var229 == protoModule.wireTypes.varint then
			local _ = nil
			local var234, var235 = protoModule.readVarInt(p9, var228)
			local _ = var234
			var228 = var235
			continue
		end
		if var229 == protoModule.wireTypes.lengthDelimited then
			if var233 == 1 then
				local _ = nil
				local var236, var237 = protoModule.readBuffer(p9, var228)
				var228 = var237
				var227.key = buffer.tostring(var236)
			elseif var233 == 2 then
				local _ = nil
				local var238, var239 = protoModule.readBuffer(p9, var228)
				var228 = var239
				var227.value = templateEntryModule.TemplateEntry.decode(var238)
			else
				local _ = nil
				local var240, var241 = protoModule.readVarInt(p9, var228)
				var228 = var241 + var240
			end
		elseif var229 == protoModule.wireTypes.i32 then
			local _ = nil
			local var242, var243 = protoModule.readFixed32(p9, var228)
			local _ = var242
			var228 = var243
		elseif var229 == protoModule.wireTypes.i64 then
			local _ = nil
			local var244, var245 = protoModule.readFixed64(p9, var228)
			local _ = var244
			var228 = var245
		else
			error("Unsupported wire type: " .. var335)
		end
	end
	return var227
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
	local var246 = t_9.new()
	
	if self.key ~= nil then
		var246.key = self.key
	end
	if self.value ~= nil then
		var246.value = templateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return var246
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