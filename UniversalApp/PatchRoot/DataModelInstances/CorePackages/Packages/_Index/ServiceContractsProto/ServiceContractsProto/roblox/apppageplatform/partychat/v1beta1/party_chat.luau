local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module))
end

function Module:encode()
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
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		for i1, localizedLiteral in self.localized_literals do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i1)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult1, WriteStringResult2_1, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, localizedLiteral)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteStringResult3, WriteStringResult2_2)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v39 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v39 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v39 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v39 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.PartyChatResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v39 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.PartyChatResponse_LocalizedLiteralsEntry.decode(Buffer4)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v39 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v39 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
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
	if self.localized_literals ~= nil and next(self.localized_literals) ~= nil then
		local LocalizedLiterals = {}
		
		for i1, localizedLiteral in self.localized_literals do
			LocalizedLiterals[i1] = localizedLiteral
		end
		t.localizedLiterals = LocalizedLiterals
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module.new()
	
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
	if self.localized_literals ~= nil then
		local Localized_literals = {}
		
		for i1, localizedLiteral in self.localized_literals do
			Localized_literals[i1] = localizedLiteral
		end
		NewModule.localized_literals = Localized_literals
	end
	if self.localizedLiterals ~= nil then
		local Localized_literals = {}
		
		for i2, localizedLiteral1 in self.localizedLiterals do
			Localized_literals[i2] = localizedLiteral1
		end
		NewModule.localized_literals = Localized_literals
	end
	return NewModule
end

Module.descriptor = {
	name = "PartyChatResponse",
	fullName = "roblox.apppageplatform.partychat.v1beta1.PartyChatResponse"
}
t.PartyChatResponse = Module
TypeRegistryModule.default:register(t.PartyChatResponse)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module1))
end

function Module1:encode()
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

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v72 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v72 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v72 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v72 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v72 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v72 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), TemplateEntryModule (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module1.descriptor = {
	name = "PartyChatResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.partychat.v1beta1.TemplatesEntry"
}
t.PartyChatResponse_TemplatesEntry = Module1
TypeRegistryModule.default:register(t.PartyChatResponse_TemplatesEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.key)
	end
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy)
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
				NewModule.value = buffer.tostring(Buffer2)
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

function Module2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module2.descriptor = {
	name = "PartyChatResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.partychat.v1beta1.LocalizedLiteralsEntry"
}
t.PartyChatResponse_LocalizedLiteralsEntry = Module2
TypeRegistryModule.default:register(t.PartyChatResponse_LocalizedLiteralsEntry)

return { PartyChatResponse = t.PartyChatResponse }