local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local PageEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 374 ]]
	-- upvalues: PageEntryContentModule (copy), Module (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then 0 else p1.badge_id,
		user_id = if p1 == nil or p1.user_id == nil then 0 else p1.user_id,
		page_entry_format = if p1 == nil or p1.page_entry_format == nil then assert(PageEntryContentModule.PageEntryFormat.fromNumber(0), "Enum has no 0 default") else p1.page_entry_format,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, Module))
end

function Module:encode() --[[ Line: 390 ]]
	-- upvalues: ProtoModule (copy), PageEntryContentModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.badge_id ~= nil and self.badge_id ~= 0 then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.badge_id)
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.user_id)
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= PageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, PageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format))
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 433 ]]
	-- upvalues: Module (copy), ProtoModule (copy), PageEntryContentModule (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v31 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				NewModule.badge_id, v31 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 2 then
				NewModule.user_id, v31 = ProtoModule.readVarIntI64(Buf, v1)
			elseif Tag == 3 then
				local VarIntI32
				VarIntI32, v31 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.page_entry_format = PageEntryContentModule.PageEntryFormat.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v31 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 4 then
				local Buffer1
				Buffer1, v31 = ProtoModule.readBuffer(Buf, v1)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v31 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v31 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 495 ]]
	-- upvalues: PageEntryContentModule (copy)
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= 0 then
		t.badgeId = self.badge_id
	end
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	if self.page_entry_format ~= nil and (self.page_entry_format ~= nil and self.page_entry_format ~= 0 or self.page_entry_format ~= PageEntryContentModule.PageEntryFormat.fromNumber(0)) then
		t.pageEntryFormat = if typeof(self.page_entry_format) == "number" then self.page_entry_format else PageEntryContentModule.PageEntryFormat.toNumber(self.page_entry_format)
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function Module:jsonDecode() --[[ Line: 528 ]]
	-- upvalues: Module (copy), PageEntryContentModule (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	
	if self.badge_id ~= nil then
		NewModule.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		NewModule.badge_id = self.badgeId
	end
	if self.user_id ~= nil then
		NewModule.user_id = self.user_id
	end
	if self.userId ~= nil then
		NewModule.user_id = self.userId
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
	name = "BadgeDetailsPageRequest",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageRequest"
}
local config = { BadgeDetailsPageRequest = Module }
TypeRegistryModule.default:register(config.BadgeDetailsPageRequest)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 598 ]]
	-- upvalues: Module1 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates
	}, Module1))
end

function Module1:encode() --[[ Line: 606 ]]
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
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 643 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), config (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v63 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v63 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v63 = ProtoModule.readBuffer(Buf, v2)
				table.insert(NewModule.page_entries, config.BadgeDetailsPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v63 = ProtoModule.readBuffer(Buf, v2)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v63 = ProtoModule.readBuffer(Buf, v2)
				local DecodeResult = config.BadgeDetailsPageResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v63 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v63 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 704 ]]
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
	return t
end

function Module1:jsonDecode() --[[ Line: 730 ]]
	-- upvalues: Module1 (copy), config (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module1.new()
	
	if self.page_entries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry in self.page_entries do
			table.insert(Page_entries, config.BadgeDetailsPageEntry.jsonDecode(pageEntry))
		end
		NewModule.page_entries = Page_entries
	end
	if self.pageEntries ~= nil then
		local Page_entries = {}
		
		for _, pageEntry1 in self.pageEntries do
			table.insert(Page_entries, config.BadgeDetailsPageEntry.jsonDecode(pageEntry1))
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
	return NewModule
end

Module1.descriptor = {
	name = "BadgeDetailsPageResponse",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageResponse"
}
config.BadgeDetailsPageResponse = Module1
TypeRegistryModule.default:register(config.BadgeDetailsPageResponse)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 789 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module2))
end

function Module2:encode() --[[ Line: 798 ]]
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

function Module2.decode(Buf) --[[ Line: 818 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v91 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v91 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v91 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v91 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v91 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v91 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 866 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 880 ]]
	-- upvalues: Module2 (copy), TemplateEntryModule (copy)
	local NewModule = Module2.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module2.descriptor = {
	name = "BadgeDetailsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
config.BadgeDetailsPageResponse_TemplatesEntry = Module2
TypeRegistryModule.default:register(config.BadgeDetailsPageResponse_TemplatesEntry)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 910 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates
	}, Module3))
end

function Module3:encode() --[[ Line: 920 ]]
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
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 957 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), config (copy), TemplateEntryModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v123 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v123 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v123 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v123 = ProtoModule.readBuffer(Buf, v4)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v123 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = config.BadgeDetailsPageV2Response_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v123 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v123 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 1021 ]]
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
	return t
end

function Module3:jsonDecode() --[[ Line: 1047 ]]
	-- upvalues: Module3 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module3.new()
	
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
	return NewModule
end

Module3.descriptor = {
	name = "BadgeDetailsPageV2Response",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageV2Response"
}
config.BadgeDetailsPageV2Response = Module3
TypeRegistryModule.default:register(config.BadgeDetailsPageV2Response)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 1112 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module4))
end

function Module4:encode() --[[ Line: 1121 ]]
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

function Module4.decode(Buf) --[[ Line: 1143 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v151 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v151 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v151 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v151 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v151 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v151 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1193 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1209 ]]
	-- upvalues: Module4 (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module4.descriptor = {
	name = "BadgeDetailsPageV2Response_TemplatesEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.TemplatesEntry"
}
config.BadgeDetailsPageV2Response_TemplatesEntry = Module4
TypeRegistryModule.default:register(config.BadgeDetailsPageV2Response_TemplatesEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1239 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		page_entry = if p1 == nil or p1.page_entry == nil then nil else p1.page_entry,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module5))
end

function Module5:encode() --[[ Line: 1246 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.page_entry ~= nil then
		local EncodeResult = self.page_entry:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		local EncodeResult = self.kind.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf) --[[ Line: 1269 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy), PageEntryModule (copy), config (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v172 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v172 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v172 = ProtoModule.readBuffer(Buf, v6)
				NewModule.page_entry = PageEntryModule.PageEntry.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v172 = ProtoModule.readBuffer(Buf, v6)
				NewModule.kind = {
					type = "badge_details",
					value = config.BadgeDetailsContent.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v172 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v172 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1317 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "badge_details" then
		t.badgeDetails = self.kind.value:jsonEncode()
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1333 ]]
	-- upvalues: Module5 (copy), PageEntryModule (copy), config (copy)
	local NewModule = Module5.new()
	
	if self.page_entry ~= nil then
		NewModule.page_entry = PageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		NewModule.page_entry = PageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.badge_details ~= nil then
		NewModule.kind = {
			type = "badge_details",
			value = config.BadgeDetailsContent.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		NewModule.kind = {
			type = "badge_details",
			value = config.BadgeDetailsContent.jsonDecode(self.badgeDetails)
		}
	end
	return NewModule
end

Module5.descriptor = {
	name = "BadgeDetailsPageEntry",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsPageEntry"
}
config.BadgeDetailsPageEntry = Module5
TypeRegistryModule.default:register(config.BadgeDetailsPageEntry)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1369 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		badge_id = if p1 == nil or p1.badge_id == nil then "" else p1.badge_id,
		universe_id = if p1 == nil or p1.universe_id == nil then "" else p1.universe_id,
		localized_literals = if p1 == nil or p1.localized_literals == nil then nil else p1.localized_literals,
		creator_key = if p1 == nil or p1.creator_key == nil then "" else p1.creator_key
	}, Module6))
end

function Module6:encode() --[[ Line: 1378 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.badge_id)
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.universe_id)
	end
	if self.localized_literals ~= nil then
		local EncodeResult = self.localized_literals:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.creator_key)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf) --[[ Line: 1408 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v196 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v196 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v196 = ProtoModule.readBuffer(Buf, v7)
				NewModule.badge_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v196 = ProtoModule.readBuffer(Buf, v7)
				NewModule.universe_id = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v196 = ProtoModule.readBuffer(Buf, v7)
				NewModule.localized_literals = config.BadgeDetailsContent_LocalizedLiterals.decode(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v196 = ProtoModule.readBuffer(Buf, v7)
				NewModule.creator_key = buffer.tostring(Buffer4)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v196 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v196 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1466 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.localized_literals ~= nil then
		t.localizedLiterals = self.localized_literals:jsonEncode()
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1488 ]]
	-- upvalues: Module6 (copy), config (copy)
	local NewModule = Module6.new()
	
	if self.badge_id ~= nil then
		NewModule.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		NewModule.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		NewModule.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		NewModule.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		NewModule.localized_literals = config.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		NewModule.localized_literals = config.BadgeDetailsContent_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		NewModule.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		NewModule.creator_key = self.creatorKey
	end
	return NewModule
end

Module6.descriptor = {
	name = "BadgeDetailsContent",
	fullName = "roblox.apppageplatform.badges.v1beta1.BadgeDetailsContent"
}
config.BadgeDetailsContent = Module6
TypeRegistryModule.default:register(config.BadgeDetailsContent)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1541 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		info_table = if p1 == nil or p1.info_table == nil then nil else p1.info_table,
		action_module = if p1 == nil or p1.action_module == nil then nil else p1.action_module,
		overflow_menu = if p1 == nil or p1.overflow_menu == nil then nil else p1.overflow_menu
	}, Module7))
end

function Module7:encode() --[[ Line: 1551 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.info_table ~= nil then
		local EncodeResult = self.info_table:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.action_module ~= nil then
		local EncodeResult = self.action_module:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.overflow_menu ~= nil then
		local EncodeResult = self.overflow_menu:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf) --[[ Line: 1578 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v222 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v222 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v222 = ProtoModule.readBuffer(Buf, v8)
				NewModule.info_table = config.BadgeDetailsContent_LocalizedLiterals_InfoTable.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v222 = ProtoModule.readBuffer(Buf, v8)
				NewModule.action_module = config.BadgeDetailsContent_LocalizedLiterals_ActionModule.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v222 = ProtoModule.readBuffer(Buf, v8)
				NewModule.overflow_menu = config.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v222 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v222 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 1631 ]]
	local t = {}
	
	if self.info_table ~= nil then
		t.infoTable = self.info_table:jsonEncode()
	end
	if self.action_module ~= nil then
		t.actionModule = self.action_module:jsonEncode()
	end
	if self.overflow_menu ~= nil then
		t.overflowMenu = self.overflow_menu:jsonEncode()
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 1649 ]]
	-- upvalues: Module7 (copy), config (copy)
	local NewModule = Module7.new()
	
	if self.info_table ~= nil then
		NewModule.info_table = config.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		NewModule.info_table = config.BadgeDetailsContent_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		NewModule.action_module = config.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		NewModule.action_module = config.BadgeDetailsContent_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		NewModule.overflow_menu = config.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		NewModule.overflow_menu = config.BadgeDetailsContent_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return NewModule
end

Module7.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals",
	fullName = "roblox.apppageplatform.badges.v1beta1.LocalizedLiterals"
}
config.BadgeDetailsContent_LocalizedLiterals = Module7
TypeRegistryModule.default:register(config.BadgeDetailsContent_LocalizedLiterals)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1) --[[ Line: 1699 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		type_label = if p1 == nil or p1.type_label == nil then "" else p1.type_label,
		earned_label = if p1 == nil or p1.earned_label == nil then "" else p1.earned_label,
		updated_label = if p1 == nil or p1.updated_label == nil then "" else p1.updated_label,
		experience_label = if p1 == nil or p1.experience_label == nil then "" else p1.experience_label,
		rarity_label = if p1 == nil or p1.rarity_label == nil then "" else p1.rarity_label,
		won_yesterday_label = if p1 == nil or p1.won_yesterday_label == nil then "" else p1.won_yesterday_label,
		won_ever_label = if p1 == nil or p1.won_ever_label == nil then "" else p1.won_ever_label
	}, Module8))
end

function Module8:encode() --[[ Line: 1715 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.type_label)
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.earned_label)
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.updated_label)
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.experience_label)
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.rarity_label)
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.won_yesterday_label)
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, self.won_ever_label)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf) --[[ Line: 1761 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v252 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v252 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v252 = ProtoModule.readBuffer(Buf, v9)
				NewModule.type_label = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v252 = ProtoModule.readBuffer(Buf, v9)
				NewModule.earned_label = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v252 = ProtoModule.readBuffer(Buf, v9)
				NewModule.updated_label = buffer.tostring(Buffer3)
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v252 = ProtoModule.readBuffer(Buf, v9)
				NewModule.experience_label = buffer.tostring(Buffer4)
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v252 = ProtoModule.readBuffer(Buf, v9)
				NewModule.rarity_label = buffer.tostring(Buffer5)
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v252 = ProtoModule.readBuffer(Buf, v9)
				NewModule.won_yesterday_label = buffer.tostring(Buffer6)
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v252 = ProtoModule.readBuffer(Buf, v9)
				NewModule.won_ever_label = buffer.tostring(Buffer7)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v252 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v252 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 1836 ]]
	local t = {}
	
	if self.type_label ~= nil and self.type_label ~= "" then
		t.typeLabel = self.type_label
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		t.earnedLabel = self.earned_label
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		t.updatedLabel = self.updated_label
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		t.experienceLabel = self.experience_label
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		t.rarityLabel = self.rarity_label
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		t.wonYesterdayLabel = self.won_yesterday_label
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		t.wonEverLabel = self.won_ever_label
	end
	return t
end

function Module8:jsonDecode() --[[ Line: 1872 ]]
	-- upvalues: Module8 (copy)
	local NewModule = Module8.new()
	
	if self.type_label ~= nil then
		NewModule.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		NewModule.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		NewModule.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		NewModule.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		NewModule.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		NewModule.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		NewModule.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		NewModule.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		NewModule.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		NewModule.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		NewModule.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		NewModule.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		NewModule.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		NewModule.won_ever_label = self.wonEverLabel
	end
	return NewModule
end

Module8.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.badges.v1beta1.InfoTable"
}
config.BadgeDetailsContent_LocalizedLiterals_InfoTable = Module8
TypeRegistryModule.default:register(config.BadgeDetailsContent_LocalizedLiterals_InfoTable)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1) --[[ Line: 1952 ]]
	-- upvalues: Module9 (copy)
	return (setmetatable({
		share = if p1 == nil or p1.share == nil then "" else p1.share,
		report = if p1 == nil or p1.report == nil then "" else p1.report
	}, Module9))
end

function Module9:encode() --[[ Line: 1964 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.share ~= nil and self.share ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.share)
	end
	if self.report ~= nil and self.report ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.report)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf) --[[ Line: 1985 ]]
	-- upvalues: Module9 (copy), ProtoModule (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v276 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v276 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v276 = ProtoModule.readBuffer(Buf, v10)
				NewModule.share = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v276 = ProtoModule.readBuffer(Buf, v10)
				NewModule.report = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v276 = ProtoModule.readFixed32(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v276 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode() --[[ Line: 2035 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function Module9:jsonDecode() --[[ Line: 2051 ]]
	-- upvalues: Module9 (copy)
	local NewModule = Module9.new()
	
	if self.share ~= nil then
		NewModule.share = self.share
	end
	if self.report ~= nil then
		NewModule.report = self.report
	end
	return NewModule
end

Module9.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.badges.v1beta1.ActionModule"
}
config.BadgeDetailsContent_LocalizedLiterals_ActionModule = Module9
TypeRegistryModule.default:register(config.BadgeDetailsContent_LocalizedLiterals_ActionModule)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1) --[[ Line: 2083 ]]
	-- upvalues: Module10 (copy)
	return (setmetatable({
		report = if p1 == nil or p1.report == nil then "" else p1.report,
		remove = if p1 == nil or p1.remove == nil then "" else p1.remove
	}, Module10))
end

function Module10:encode() --[[ Line: 2095 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.report ~= nil and self.report ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.report)
	end
	if self.remove ~= nil and self.remove ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.remove)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module10.decode(Buf) --[[ Line: 2116 ]]
	-- upvalues: Module10 (copy), ProtoModule (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v295 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v295 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v295 = ProtoModule.readBuffer(Buf, v11)
				NewModule.report = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v295 = ProtoModule.readBuffer(Buf, v11)
				NewModule.remove = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v295 = ProtoModule.readFixed32(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v295 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode() --[[ Line: 2166 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function Module10:jsonDecode() --[[ Line: 2182 ]]
	-- upvalues: Module10 (copy)
	local NewModule = Module10.new()
	
	if self.report ~= nil then
		NewModule.report = self.report
	end
	if self.remove ~= nil then
		NewModule.remove = self.remove
	end
	return NewModule
end

Module10.descriptor = {
	name = "BadgeDetailsContent_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.badges.v1beta1.OverflowMenu"
}
config.BadgeDetailsContent_LocalizedLiterals_OverflowMenu = Module10
TypeRegistryModule.default:register(config.BadgeDetailsContent_LocalizedLiterals_OverflowMenu)

return {
	BadgeDetailsPageRequest = config.BadgeDetailsPageRequest,
	BadgeDetailsPageResponse = config.BadgeDetailsPageResponse,
	BadgeDetailsPageV2Response = config.BadgeDetailsPageV2Response,
	BadgeDetailsPageEntry = config.BadgeDetailsPageEntry,
	BadgeDetailsContent = config.BadgeDetailsContent,
	BadgeDetailsContent_LocalizedLiterals = config.BadgeDetailsContent_LocalizedLiterals,
	BadgeDetailsContent_LocalizedLiterals_InfoTable = config.BadgeDetailsContent_LocalizedLiterals_InfoTable,
	BadgeDetailsContent_LocalizedLiterals_ActionModule = config.BadgeDetailsContent_LocalizedLiterals_ActionModule,
	BadgeDetailsContent_LocalizedLiterals_OverflowMenu = config.BadgeDetailsContent_LocalizedLiterals_OverflowMenu
}