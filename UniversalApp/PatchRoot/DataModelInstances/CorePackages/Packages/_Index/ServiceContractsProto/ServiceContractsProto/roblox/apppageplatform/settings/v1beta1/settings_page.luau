local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local StructModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local ConfigDrivenFormDataModule = require(script.Parent.Parent.Parent.shared.v1beta1.config_driven_form_data)
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		session_id = if p1 == nil or p1.session_id == nil then "" else p1.session_id,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.session_id ~= nil and self.session_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.session_id)
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, value in self.cached_roblox_component_to_template_id do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, i)
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, value)
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v36 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v36 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.session_id = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v36 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(Buffer2)
				NewModule.cached_roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v36 = ProtoModule.readBuffer(Buf, v1)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v36 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v36 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.session_id ~= nil and self.session_id ~= "" then
		t.sessionId = self.session_id
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local CachedRobloxComponentToTemplateId = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			CachedRobloxComponentToTemplateId[i] = value
		end
		t.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	
	if self.session_id ~= nil then
		NewModule.session_id = self.session_id
	end
	if self.sessionId ~= nil then
		NewModule.session_id = self.sessionId
	end
	if self.cached_roblox_component_to_template_id ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			Cached_roblox_component_to_template_id[i] = value
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
	end
	if self.cachedRobloxComponentToTemplateId ~= nil then
		local Cached_roblox_component_to_template_id = {}
		
		for i1, value1 in self.cachedRobloxComponentToTemplateId do
			Cached_roblox_component_to_template_id[i1] = value1
		end
		NewModule.cached_roblox_component_to_template_id = Cached_roblox_component_to_template_id
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
	name = "SettingsPageRequest",
	fullName = "roblox.apppageplatform.settings.v1beta1.SettingsPageRequest"
}
t.SettingsPageRequest = Module
TypeRegistryModule.default:register(t.SettingsPageRequest)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
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
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v60 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v60 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v60 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v60 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v60 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v60 = ProtoModule.readFixed64(Buf, v2)
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
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module1.descriptor = {
	name = "SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.settings.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry = Module1
TypeRegistryModule.default:register(t.SettingsPageRequest_CachedRobloxComponentToTemplateIdEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module2))
end

function Module2:encode()
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

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v102 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v102 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v102 = ProtoModule.readBuffer(Buf, v3)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v102 = ProtoModule.readBuffer(Buf, v3)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v102 = ProtoModule.readBuffer(Buf, v3)
				local DecodeResult = t.SettingsPageResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v102 = ProtoModule.readBuffer(Buf, v3)
				local DecodeResult = t.SettingsPageResponse_LocalizedLiteralsEntry.decode(Buffer4)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v102 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v102 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
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

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module2.new()
	
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

Module2.descriptor = {
	name = "SettingsPageResponse",
	fullName = "roblox.apppageplatform.settings.v1beta1.SettingsPageResponse"
}
t.SettingsPageResponse = Module2
TypeRegistryModule.default:register(t.SettingsPageResponse)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module3))
end

function Module3:encode()
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

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v135 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v135 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v135 = ProtoModule.readBuffer(Buf, v4)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v135 = ProtoModule.readBuffer(Buf, v4)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v135 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v135 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), TemplateEntryModule (copy)
	local NewModule = Module3.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module3.descriptor = {
	name = "SettingsPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.settings.v1beta1.TemplatesEntry"
}
t.SettingsPageResponse_TemplatesEntry = Module3
TypeRegistryModule.default:register(t.SettingsPageResponse_TemplatesEntry)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module4))
end

function Module4:encode()
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

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v154 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v154 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v154 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v154 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v154 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v154 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy)
	local NewModule = Module4.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module4.descriptor = {
	name = "SettingsPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.settings.v1beta1.LocalizedLiteralsEntry"
}
t.SettingsPageResponse_LocalizedLiteralsEntry = Module4
TypeRegistryModule.default:register(t.SettingsPageResponse_LocalizedLiteralsEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		parameters = if p1 == nil or p1.parameters == nil then nil else p1.parameters
	}, Module5))
end

function Module5:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.name)
	end
	if self.parameters ~= nil then
		local EncodeResult = self.parameters:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), StructModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v174 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v174 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v174 = ProtoModule.readBuffer(Buf, v6)
				NewModule.name = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v174 = ProtoModule.readBuffer(Buf, v6)
				NewModule.parameters = StructModule.Struct.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v174 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v174 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.parameters ~= nil then
		t.parameters = self.parameters:jsonEncode()
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), StructModule (copy)
	local NewModule = Module5.new()
	
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.parameters ~= nil then
		NewModule.parameters = StructModule.Struct.jsonDecode(self.parameters)
	end
	return NewModule
end

Module5.descriptor = {
	name = "FormAction",
	fullName = "roblox.apppageplatform.settings.v1beta1.FormAction"
}
t.FormAction = Module5
TypeRegistryModule.default:register(t.FormAction)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		operation = if p1 == nil or p1.operation == nil then nil else p1.operation
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.operation ~= nil then
		if self.operation.type == "diff" then
			local EncodeResult = self.operation.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.operation.type == "action" then
			local EncodeResult = self.operation.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy), StructModule (copy), t (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v195 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v195 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v195 = ProtoModule.readBuffer(Buf, v7)
				NewModule.operation = {
					type = "diff",
					value = StructModule.Struct.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v195 = ProtoModule.readBuffer(Buf, v7)
				NewModule.operation = { type = "action", value = t.FormAction.decode(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v195 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v195 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.operation ~= nil then
		if self.operation.type == "diff" then
			t.diff = self.operation.value:jsonEncode()
			
			return t
		end
		if self.operation.type == "action" then
			t.action = self.operation.value:jsonEncode()
		end
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy), StructModule (copy), t (copy)
	local NewModule = Module6.new()
	
	if self.diff ~= nil then
		NewModule.operation = {
			type = "diff",
			value = StructModule.Struct.jsonDecode(self.diff)
		}
	end
	if self.action ~= nil then
		NewModule.operation = {
			type = "action",
			value = t.FormAction.jsonDecode(self.action)
		}
	end
	return NewModule
end

Module6.descriptor = {
	name = "SaveSettingsFormRequest",
	fullName = "roblox.apppageplatform.settings.v1beta1.SaveSettingsFormRequest"
}
t.SaveSettingsFormRequest = Module6
TypeRegistryModule.default:register(t.SaveSettingsFormRequest)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Module7 (copy)
	return (setmetatable({
		name = if p1 == nil or p1.name == nil then "" else p1.name,
		status = if p1 == nil or p1.status == nil then 0 else p1.status,
		message = if p1 == nil or p1.message == nil then "" else p1.message
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.name ~= nil and self.name ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.name)
	end
	if self.status ~= nil and self.status ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.status)
	end
	if self.message ~= nil and self.message ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.message)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v216 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.status, v216 = ProtoModule.readVarIntI32(Buf, v8)
			else
				local _
				_, v216 = ProtoModule.readVarInt(Buf, v8)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v216 = ProtoModule.readBuffer(Buf, v8)
				NewModule.name = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v216 = ProtoModule.readBuffer(Buf, v8)
				NewModule.message = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v216 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v216 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
	local t = {}
	
	if self.name ~= nil and self.name ~= "" then
		t.name = self.name
	end
	if self.status ~= nil and self.status ~= 0 then
		t.status = self.status
	end
	if self.message ~= nil and self.message ~= "" then
		t.message = self.message
	end
	return t
end

function Module7:jsonDecode()
	-- upvalues: Module7 (copy)
	local NewModule = Module7.new()
	
	if self.name ~= nil then
		NewModule.name = self.name
	end
	if self.status ~= nil then
		NewModule.status = self.status
	end
	if self.message ~= nil then
		NewModule.message = self.message
	end
	return NewModule
end

Module7.descriptor = {
	name = "FormWriteError",
	fullName = "roblox.apppageplatform.settings.v1beta1.FormWriteError"
}
t.FormWriteError = Module7
TypeRegistryModule.default:register(t.FormWriteError)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: Module8 (copy)
	return (setmetatable({
		refreshed_data = if p1 == nil or p1.refreshed_data == nil then nil else p1.refreshed_data,
		committed_groups = if p1 == nil or p1.committed_groups == nil then {} else p1.committed_groups,
		write_errors = if p1 == nil or p1.write_errors == nil then {} else p1.write_errors
	}, Module8))
end

function Module8:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.refreshed_data ~= nil then
		local EncodeResult = self.refreshed_data:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.committed_groups ~= nil and #self.committed_groups > 0 then
		for _, committedGroup in self.committed_groups do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, committedGroup)
		end
	end
	if self.write_errors ~= nil and #self.write_errors > 0 then
		for _, writeError in self.write_errors do
			local EncodeResult = writeError:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy), ConfigDrivenFormDataModule (copy), t (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v239 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v239 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v239 = ProtoModule.readBuffer(Buf, v9)
				NewModule.refreshed_data = ConfigDrivenFormDataModule.ConfigDrivenFormInputData.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v239 = ProtoModule.readBuffer(Buf, v9)
				table.insert(NewModule.committed_groups, buffer.tostring(Buffer2))
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v239 = ProtoModule.readBuffer(Buf, v9)
				table.insert(NewModule.write_errors, t.FormWriteError.decode(Buffer3))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v239 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v239 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
	local t = {}
	
	if self.refreshed_data ~= nil then
		t.refreshedData = self.refreshed_data:jsonEncode()
	end
	if self.committed_groups ~= nil and #self.committed_groups > 0 then
		local CommittedGroups = {}
		
		for _, committedGroup in self.committed_groups do
			table.insert(CommittedGroups, committedGroup)
		end
		t.committedGroups = CommittedGroups
	end
	if self.write_errors ~= nil and #self.write_errors > 0 then
		local WriteErrors = {}
		
		for _, writeError in self.write_errors do
			table.insert(WriteErrors, writeError:jsonEncode())
		end
		t.writeErrors = WriteErrors
	end
	return t
end

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), ConfigDrivenFormDataModule (copy), t (copy)
	local NewModule = Module8.new()
	
	if self.refreshed_data ~= nil then
		NewModule.refreshed_data = ConfigDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.refreshed_data)
	end
	if self.refreshedData ~= nil then
		NewModule.refreshed_data = ConfigDrivenFormDataModule.ConfigDrivenFormInputData.jsonDecode(self.refreshedData)
	end
	if self.committed_groups ~= nil then
		local Committed_groups = {}
		
		for _, committedGroup in self.committed_groups do
			table.insert(Committed_groups, committedGroup)
		end
		NewModule.committed_groups = Committed_groups
	end
	if self.committedGroups ~= nil then
		local Committed_groups = {}
		
		for _, committedGroup1 in self.committedGroups do
			table.insert(Committed_groups, committedGroup1)
		end
		NewModule.committed_groups = Committed_groups
	end
	if self.write_errors ~= nil then
		local Write_errors = {}
		
		for _, writeError in self.write_errors do
			table.insert(Write_errors, t.FormWriteError.jsonDecode(writeError))
		end
		NewModule.write_errors = Write_errors
	end
	if self.writeErrors ~= nil then
		local Write_errors = {}
		
		for _, writeError1 in self.writeErrors do
			table.insert(Write_errors, t.FormWriteError.jsonDecode(writeError1))
		end
		NewModule.write_errors = Write_errors
	end
	return NewModule
end

Module8.descriptor = {
	name = "SaveSettingsFormResponse",
	fullName = "roblox.apppageplatform.settings.v1beta1.SaveSettingsFormResponse"
}
t.SaveSettingsFormResponse = Module8
TypeRegistryModule.default:register(t.SaveSettingsFormResponse)

return {
	SettingsPageRequest = t.SettingsPageRequest,
	SettingsPageResponse = t.SettingsPageResponse,
	FormAction = t.FormAction,
	SaveSettingsFormRequest = t.SaveSettingsFormRequest,
	FormWriteError = t.FormWriteError,
	SaveSettingsFormResponse = t.SaveSettingsFormResponse
}