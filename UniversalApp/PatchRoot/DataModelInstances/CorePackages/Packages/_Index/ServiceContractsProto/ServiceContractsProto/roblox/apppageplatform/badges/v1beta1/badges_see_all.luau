local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local PageEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 294 ]]
	-- upvalues: PageEntryContentModule (copy), Module (copy)
	return (setmetatable({
		universe_id = if p1 == nil or p1.universe_id == nil then 0 else p1.universe_id,
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id,
		page_size = if p1 == nil or p1.page_size == nil then 0 else p1.page_size,
		cursor = if p1 == nil or p1.cursor == nil then "" else p1.cursor,
		page_entry_format = if p1 == nil or p1.page_entry_format == nil then assert(PageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p1.page_entry_format,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, Module))
end

function Module:encode() --[[ Line: 312 ]]
	-- upvalues: ProtoModule (copy), PageEntryContentModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.universe_id ~= nil and self.universe_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.universe_id)
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.user_id)
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.page_size)
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.cursor)
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= PageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, PageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 365 ]]
	-- upvalues: Module (copy), ProtoModule (copy), PageEntryContentModule (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v33 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.universe_id, v33 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 2 then
				NewModule.user_id, v33 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 3 then
				NewModule.page_size, v33 = ProtoModule.readVarIntI32(Buf, v1)
			elseif Tag == 5 then
				local VarIntI32
				VarIntI32, v33 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.page_entry_format = PageEntryContentModule.PageEntryFormat.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v33 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 4 then
				local Buffer1
				Buffer1, v33 = ProtoModule.readBuffer(Buf, v1)
				NewModule.cursor = buffer.tostring(Buffer1)
			elseif Tag == 6 then
				local Buffer2
				Buffer2, v33 = ProtoModule.readBuffer(Buf, v1)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v33 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v33 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 437 ]]
	-- upvalues: PageEntryContentModule (copy)
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
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= PageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		t.pageEntryFormat = if typeof(self.page_entry_format) == "number" then self.page_entry_format else PageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format)
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function Module:jsonDecode() --[[ Line: 478 ]]
	-- upvalues: Module (copy), PageEntryContentModule (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
	end
	if self.page_size ~= nil then
		NewModule.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		NewModule.page_size = self.pageSize
	end
	if self.cursor ~= nil then
		NewModule.cursor = self.cursor
	end
	if self.page_entry_format ~= nil then
		NewModule.page_entry_format = (if typeof(self.page_entry_format) == "number" then PageEntryContentModule.PageEntryFormat.fromNumber(self.page_entry_format) else PageEntryContentModule.PageEntryFormat.fromName(self.page_entry_format)) or self.page_entry_format
	end
	if self.pageEntryFormat ~= nil then
		NewModule.page_entry_format = (if typeof(self.pageEntryFormat) == "number" then PageEntryContentModule.PageEntryFormat.fromNumber(self.pageEntryFormat) else PageEntryContentModule.PageEntryFormat.fromName(self.pageEntryFormat)) or self.pageEntryFormat
	end
	if self.client_capabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
	end
	return NewModule
end

Module.descriptor = {
	name = "BadgesSeeAllRequest",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllRequest"
}
local config = { BadgesSeeAllRequest = Module }
TypeRegistryModule.default:register(config.BadgesSeeAllRequest)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 560 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		page_size = if p1 == nil or p1.page_size == nil then 0 else p1.page_size,
		next_cursor = if p1 == nil or p1.next_cursor == nil then "" else p1.next_cursor,
		prev_cursor = if p1 == nil or p1.prev_cursor == nil then "" else p1.prev_cursor,
		total = if p1 == nil or p1.total == nil then 0 else p1.total
	}, Module1))
end

function Module1:encode() --[[ Line: 569 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_size ~= nil and self.page_size ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.page_size)
	end
	if self.next_cursor ~= nil and self.next_cursor ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.next_cursor)
	end
	if self.prev_cursor ~= nil and self.prev_cursor ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.prev_cursor)
	end
	if self.total ~= nil and self.total ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.total)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 598 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v57 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.page_size, v57 = ProtoModule.readVarIntI32(Buf, v2)
			elseif Tag == 4 then
				NewModule.total, v57 = ProtoModule.readVarIntI64(Buf, v2)
			else
				local _
				_, v57 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v57 = ProtoModule.readBuffer(Buf, v2)
				NewModule.next_cursor = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v57 = ProtoModule.readBuffer(Buf, v2)
				NewModule.prev_cursor = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v57 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v57 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 656 ]]
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

function Module1:jsonDecode() --[[ Line: 678 ]]
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.page_size ~= nil then
		NewModule.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		NewModule.page_size = self.pageSize
	end
	if self.next_cursor ~= nil then
		NewModule.next_cursor = self.next_cursor
	end
	if self.nextCursor ~= nil then
		NewModule.next_cursor = self.nextCursor
	end
	if self.prev_cursor ~= nil then
		NewModule.prev_cursor = self.prev_cursor
	end
	if self.prevCursor ~= nil then
		NewModule.prev_cursor = self.prevCursor
	end
	if self.total ~= nil then
		NewModule.total = self.total
	end
	return NewModule
end

Module1.descriptor = {
	name = "Pagination",
	fullName = "roblox.apppageplatform.badges.v1beta1.Pagination"
}
config.Pagination = Module1
TypeRegistryModule.default:register(config.Pagination)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 726 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		section_title = if p1 == nil or p1.section_title == nil then "" else p1.section_title,
		badges = if p1 == nil or p1.badges == nil then {} else p1.badges,
		collection_id = if p1 == nil or p1.collection_id == nil then "" else p1.collection_id,
		collection_position = if p1 == nil or p1.collection_position == nil then "" else p1.collection_position,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id
	}, Module2))
end

function Module2:encode() --[[ Line: 738 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.section_title)
	end
	if self.badges ~= nil and #self.badges > 0 then
		for _, badge in self.badges do
			local EncodeResult = badge:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.collection_id)
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.collection_position)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.universe_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 775 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v83 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v83 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v83 = ProtoModule.readBuffer(Buf, v3)
				NewModule.section_title = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v83 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.badges, config.BadgesGridPageEntry_BadgeInputData.decode(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v83 = ProtoModule.readBuffer(Buf, v3)
				NewModule.collection_id = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v83 = ProtoModule.readBuffer(Buf, v3)
				NewModule.collection_position = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v83 = ProtoModule.readBuffer(Buf, v3)
				NewModule.universe_id = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v83 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v83 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 838 ]]
	local t = {}
	
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.badges ~= nil and #self.badges > 0 then
		local Badges = {}
		
		for _, badge in self.badges do
			table.insert(Badges, badge:jsonEncode())
		end
		t.badges = Badges
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

function Module2:jsonDecode() --[[ Line: 868 ]]
	-- upvalues: Module2 (copy), config (copy)
	local NewModule = Module2.new()
	
	if self.section_title ~= nil then
		NewModule.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		NewModule.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local Badges = {}
		
		for _, badge in self.badges do
			table.insert(Badges, config.BadgesGridPageEntry_BadgeInputData.jsonDecode(badge))
		end
		NewModule.badges = Badges
	end
	if self.collection_id ~= nil then
		NewModule.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		NewModule.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		NewModule.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		NewModule.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	return NewModule
end

Module2.descriptor = {
	name = "BadgesGridPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesGridPageEntry"
}
config.BadgesGridPageEntry = Module2
TypeRegistryModule.default:register(config.BadgesGridPageEntry)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 929 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id
	}, Module3))
end

function Module3:encode() --[[ Line: 937 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.badge_id)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 951 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v105 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v105 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v105 = ProtoModule.readBuffer(Buf, v4)
				NewModule.badge_id = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v105 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v105 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 994 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 1004 ]]
	-- upvalues: Module3 (copy)
	local NewModule = Module3.new()
	
	if self.badge_id ~= nil then
		NewModule.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		NewModule.badge_id = self.badgeId
	end
	return NewModule
end

Module3.descriptor = {
	name = "BadgesGridPageEntry_BadgeInputData",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeInputData"
}
config.BadgesGridPageEntry_BadgeInputData = Module3
TypeRegistryModule.default:register(config.BadgesGridPageEntry_BadgeInputData)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 1034 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		page_entry = if p1 == nil or p1.page_entry == nil then nil else p1.page_entry,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module4))
end

function Module4:encode() --[[ Line: 1041 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entry ~= nil then
		local EncodeResult = self.page_entry:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil and self.kind.type == "badges_grid" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 1064 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy), PageEntryModule (copy), config (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v125 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v125 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v125 = ProtoModule.readBuffer(Buf, v5)
				NewModule.page_entry = PageEntryModule.PageEntry.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v125 = ProtoModule.readBuffer(Buf, v5)
				NewModule.kind = {
					type = "badges_grid",
					value = config.BadgesGridPageEntry.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v125 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v125 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1112 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "badges_grid" then
		t.badgesGrid = self.kind.value:jsonEncode()
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1128 ]]
	-- upvalues: Module4 (copy), PageEntryModule (copy), config (copy)
	local NewModule = Module4.new()
	
	if self.page_entry ~= nil then
		NewModule.page_entry = PageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		NewModule.page_entry = PageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badges_grid ~= nil then
		NewModule.kind = {
			type = "badges_grid",
			value = config.BadgesGridPageEntry.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		NewModule.kind = {
			type = "badges_grid",
			value = config.BadgesGridPageEntry.jsonDecode(self.badgesGrid)
		}
	end
	return NewModule
end

Module4.descriptor = {
	name = "BadgesSeeAllPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllPageEntry"
}
config.BadgesSeeAllPageEntry = Module4
TypeRegistryModule.default:register(config.BadgesSeeAllPageEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1164 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		pagination = if p1 == nil or p1.pagination == nil then nil else p1.pagination
	}, Module5))
end

function Module5:encode() --[[ Line: 1173 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for _, pageEntry in self.page_entries do
			local EncodeResult = pageEntry:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.hydration_data ~= nil then
		local EncodeResult = self.hydration_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, template in self.templates do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = template:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.pagination ~= nil then
		local EncodeResult = self.pagination:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf) --[[ Line: 1216 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), config (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v160 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v160 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v160 = ProtoModule.readBuffer(Buf, v6)
				table.insert(NewModule.page_entries, config.BadgesSeeAllPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v160 = ProtoModule.readBuffer(Buf, v6)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v160 = ProtoModule.readBuffer(Buf, v6)
				local DecodeResult = config.BadgesSeeAllResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v160 = ProtoModule.readBuffer(Buf, v6)
				NewModule.pagination = config.Pagination.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v160 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v160 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1282 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local PageEntries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(PageEntries, pageEntry:jsonEncode())
		end
		t.pageEntries = PageEntries
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = template:jsonEncode()
		end
		t.templates = Templates
	end
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1312 ]]
	-- upvalues: Module5 (copy), config (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	
	if self.page_entries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(Page_entries, config.BadgesSeeAllPageEntry.jsonDecode(pageEntry))
		end
		NewModule.page_entries = Page_entries
	end
	if self.pageEntries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry1 in self.pageEntries do
			table.insert(Page_entries, config.BadgesSeeAllPageEntry.jsonDecode(pageEntry1))
		end
		NewModule.page_entries = Page_entries
	end
	if self.hydration_data ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = TemplateEntryModule.TemplateEntry.jsonDecode(template)
		end
		NewModule.templates = Templates
	end
	if self.pagination ~= nil then
		NewModule.pagination = config.Pagination.jsonDecode(self.pagination)
	end
	return NewModule
end

Module5.descriptor = {
	name = "BadgesSeeAllResponse",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllResponse"
}
config.BadgesSeeAllResponse = Module5
TypeRegistryModule.default:register(config.BadgesSeeAllResponse)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1375 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module6))
end

function Module6:encode() --[[ Line: 1384 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf) --[[ Line: 1404 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v189 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v189 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v189 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v189 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v189 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v189 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1452 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1466 ]]
	-- upvalues: Module6 (copy), TemplateEntryModule (copy)
	local NewModule = Module6.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module6.descriptor = {
	name = "BadgesSeeAllResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
config.BadgesSeeAllResponse_TemplatesEntry = Module6
TypeRegistryModule.default:register(config.BadgesSeeAllResponse_TemplatesEntry)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1496 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		pagination = if p1 == nil or p1.pagination == nil then nil else p1.pagination
	}, Module7))
end

function Module7:encode() --[[ Line: 1505 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		for _, pageEntry in self.page_entries do
			local EncodeResult = pageEntry:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.hydration_data ~= nil then
		local EncodeResult = self.hydration_data:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		for i, template in self.templates do
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, i)
			local EncodeResult = template:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.pagination ~= nil then
		local EncodeResult = self.pagination:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf) --[[ Line: 1548 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), config (copy), TemplateEntryModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v224 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v224 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v224 = ProtoModule.readBuffer(Buf, v8)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v224 = ProtoModule.readBuffer(Buf, v8)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v224 = ProtoModule.readBuffer(Buf, v8)
				local DecodeResult = config.BadgesSeeAllV2Response_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v224 = ProtoModule.readBuffer(Buf, v8)
				NewModule.pagination = config.Pagination.decode(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v224 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v224 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 1617 ]]
	local t = {}
	
	if self.page_entries ~= nil and #self.page_entries > 0 then
		local PageEntries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(PageEntries, pageEntry:jsonEncode())
		end
		t.pageEntries = PageEntries
	end
	if self.hydration_data ~= nil then
		t.hydrationData = self.hydration_data:jsonEncode()
	end
	if self.templates ~= nil and next(self.templates) ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = template:jsonEncode()
		end
		t.templates = Templates
	end
	if self.pagination ~= nil then
		t.pagination = self.pagination:jsonEncode()
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 1647 ]]
	-- upvalues: Module7 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy), config (copy)
	local NewModule = Module7.new()
	
	if self.page_entries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry))
		end
		NewModule.page_entries = Page_entries
	end
	if self.pageEntries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry1 in self.pageEntries do
			table.insert(Page_entries, PageEntryContentModule.UniversalPageEntry.jsonDecode(pageEntry1))
		end
		NewModule.page_entries = Page_entries
	end
	if self.hydration_data ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydration_data)
	end
	if self.hydrationData ~= nil then
		NewModule.hydration_data = HydrationContentModule.HydrationContent.jsonDecode(self.hydrationData)
	end
	if self.templates ~= nil then
		local Templates = {}
		
		for i, template in self.templates do
			Templates[i] = TemplateEntryModule.TemplateEntry.jsonDecode(template)
		end
		NewModule.templates = Templates
	end
	if self.pagination ~= nil then
		NewModule.pagination = config.Pagination.jsonDecode(self.pagination)
	end
	return NewModule
end

Module7.descriptor = {
	name = "BadgesSeeAllV2Response",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgesSeeAllV2Response"
}
config.BadgesSeeAllV2Response = Module7
TypeRegistryModule.default:register(config.BadgesSeeAllV2Response)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1) --[[ Line: 1716 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module8))
end

function Module8:encode() --[[ Line: 1725 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf) --[[ Line: 1745 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v253 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v253 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v253 = ProtoModule.readBuffer(Buf, v9)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v253 = ProtoModule.readBuffer(Buf, v9)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v253 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v253 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 1793 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module8:jsonDecode() --[[ Line: 1807 ]]
	-- upvalues: Module8 (copy), TemplateEntryModule (copy)
	local NewModule = Module8.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module8.descriptor = {
	name = "BadgesSeeAllV2Response_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
config.BadgesSeeAllV2Response_TemplatesEntry = Module8
TypeRegistryModule.default:register(config.BadgesSeeAllV2Response_TemplatesEntry)

return {
	BadgesSeeAllRequest = config.BadgesSeeAllRequest,
	Pagination = config.Pagination,
	BadgesGridPageEntry = config.BadgesGridPageEntry,
	BadgesGridPageEntry_BadgeInputData = config.BadgesGridPageEntry_BadgeInputData,
	BadgesSeeAllPageEntry = config.BadgesSeeAllPageEntry,
	BadgesSeeAllResponse = config.BadgesSeeAllResponse,
	BadgesSeeAllV2Response = config.BadgesSeeAllV2Response
}