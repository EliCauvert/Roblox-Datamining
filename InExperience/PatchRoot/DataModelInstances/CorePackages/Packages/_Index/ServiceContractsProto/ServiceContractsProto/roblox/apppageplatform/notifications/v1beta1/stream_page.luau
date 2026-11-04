local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local ClientCapabilitiesModule = require(script.Parent.Parent.Parent.shared.v1beta1.client_capabilities)
local HydrationContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.hydration_content)
local PageEntryContentModule = require(script.Parent.Parent.Parent.shared.v1beta1.page_entry_content)
local TemplateEntryModule = require(script.Parent.Parent.Parent.shared.v1beta1.template_entry)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		cursor = if p1 == nil or p1.cursor == nil then "" else p1.cursor,
		max_rows = if p1 == nil or p1.max_rows == nil then 0 else p1.max_rows,
		notification_id = if p1 == nil or p1.notification_id == nil then nil else p1.notification_id,
		state = if p1 == nil or p1.state == nil then nil else p1.state,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_attributes = if p1 == nil or p1.client_attributes == nil then {} else p1.client_attributes
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.cursor ~= nil and self.cursor ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.cursor)
	end
	if self.max_rows ~= nil and self.max_rows ~= 0 then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.max_rows)
	end
	if self.notification_id ~= nil then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.notification_id)
	end
	if self.state ~= nil then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.state)
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, value in self.cached_roblox_component_to_template_id do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, value)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.client_attributes ~= nil and next(self.client_attributes) ~= nil then
		for i1, clientAttribute in self.client_attributes do
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult3, WriteStringResult2_2 = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, i1)
			local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(WriteStringResult3, WriteStringResult2_2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult4, WriteStringResult2_3 = ProtoModule.writeString(WriteTagResult10, WriteTagResult2_9, clientAttribute)
			local WriteTagResult11, WriteTagResult2_10 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult11, WriteTagResult2_10, WriteStringResult4, WriteStringResult2_3)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), ClientCapabilitiesModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v47 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				NewModule.max_rows, v47 = ProtoModule.readVarIntI32(Buf, v1)
			else
				local _
				_, v47 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v47 = ProtoModule.readBuffer(Buf, v1)
				NewModule.cursor = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v47 = ProtoModule.readBuffer(Buf, v1)
				NewModule.notification_id = buffer.tostring(Buffer2)
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v47 = ProtoModule.readBuffer(Buf, v1)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer3)
			elseif Tag == 5 then
				local Buffer4
				Buffer4, v47 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.StreamPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(Buffer4)
				NewModule.cached_roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 6 then
				local Buffer5
				Buffer5, v47 = ProtoModule.readBuffer(Buf, v1)
				NewModule.state = buffer.tostring(Buffer5)
			elseif Tag == 7 then
				local Buffer6
				Buffer6, v47 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.StreamPageRequest_ClientAttributesEntry.decode(Buffer6)
				NewModule.client_attributes[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v47 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v47 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	local t = {}
	
	if self.cursor ~= nil and self.cursor ~= "" then
		t.cursor = self.cursor
	end
	if self.max_rows ~= nil and self.max_rows ~= 0 then
		t.maxRows = self.max_rows
	end
	if self.notification_id ~= nil then
		t.notificationId = self.notification_id
	end
	if self.state ~= nil then
		t.state = self.state
	end
	if self.client_capabilities ~= nil then
		t.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local CachedRobloxComponentToTemplateId = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			CachedRobloxComponentToTemplateId[i] = value
		end
		t.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if self.client_attributes ~= nil and next(self.client_attributes) ~= nil then
		local ClientAttributes = {}
		
		for i1, clientAttribute in self.client_attributes do
			ClientAttributes[i1] = clientAttribute
		end
		t.clientAttributes = ClientAttributes
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	
	if self.cursor ~= nil then
		NewModule.cursor = self.cursor
	end
	if self.max_rows ~= nil then
		NewModule.max_rows = self.max_rows
	end
	if self.maxRows ~= nil then
		NewModule.max_rows = self.maxRows
	end
	if self.notification_id ~= nil then
		NewModule.notification_id = self.notification_id
	end
	if self.notificationId ~= nil then
		NewModule.notification_id = self.notificationId
	end
	if self.state ~= nil then
		NewModule.state = self.state
	end
	if self.client_capabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.client_capabilities)
	end
	if self.clientCapabilities ~= nil then
		NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.jsonDecode(self.clientCapabilities)
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
	if self.client_attributes ~= nil then
		local Client_attributes = {}
		
		for i2, clientAttribute in self.client_attributes do
			Client_attributes[i2] = clientAttribute
		end
		NewModule.client_attributes = Client_attributes
	end
	if self.clientAttributes ~= nil then
		local Client_attributes = {}
		
		for i3, clientAttribute1 in self.clientAttributes do
			Client_attributes[i3] = clientAttribute1
		end
		NewModule.client_attributes = Client_attributes
	end
	return NewModule
end

Module.descriptor = {
	name = "StreamPageRequest",
	fullName = "roblox.apppageplatform.notifications.v1beta1.StreamPageRequest"
}
t.StreamPageRequest = Module
TypeRegistryModule.default:register(t.StreamPageRequest)
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
		Tag, Tag2, v78 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v78 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v78 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v78 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v78 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v78 = ProtoModule.readFixed64(Buf, v2)
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
	name = "StreamPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.notifications.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.StreamPageRequest_CachedRobloxComponentToTemplateIdEntry = Module1
TypeRegistryModule.default:register(t.StreamPageRequest_CachedRobloxComponentToTemplateIdEntry)
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
		Tag, Tag2, v97 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v97 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v97 = ProtoModule.readBuffer(Buf, v3)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v97 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v97 = ProtoModule.readFixed64(Buf, v3)
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
	name = "StreamPageRequest_ClientAttributesEntry",
	fullName = "roblox.apppageplatform.notifications.v1beta1.ClientAttributesEntry"
}
t.StreamPageRequest_ClientAttributesEntry = Module2
TypeRegistryModule.default:register(t.StreamPageRequest_ClientAttributesEntry)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals,
		next_cursor = if p1 == nil or p1.next_cursor == nil then "" else p1.next_cursor
	}, Module3))
end

function Module3:encode()
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
	if self.next_cursor ~= nil and self.next_cursor ~= "" then
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult9, WriteTagResult2_8, self.next_cursor)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v141 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v141 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v141 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v141 = ProtoModule.readBuffer(Buf, v4)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v141 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.StreamPageResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v141 = ProtoModule.readBuffer(Buf, v4)
				local DecodeResult = t.StreamPageResponse_LocalizedLiteralsEntry.decode(Buffer4)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v141 = ProtoModule.readBuffer(Buf, v4)
				NewModule.next_cursor = buffer.tostring(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v141 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v141 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
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
	if self.next_cursor ~= nil and self.next_cursor ~= "" then
		t.nextCursor = self.next_cursor
	end
	return t
end

function Module3:jsonDecode()
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
	if self.next_cursor ~= nil then
		NewModule.next_cursor = self.next_cursor
	end
	if self.nextCursor ~= nil then
		NewModule.next_cursor = self.nextCursor
	end
	return NewModule
end

Module3.descriptor = {
	name = "StreamPageResponse",
	fullName = "roblox.apppageplatform.notifications.v1beta1.StreamPageResponse"
}
t.StreamPageResponse = Module3
TypeRegistryModule.default:register(t.StreamPageResponse)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
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
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v175 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v175 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v175 = ProtoModule.readBuffer(Buf, v5)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v175 = ProtoModule.readBuffer(Buf, v5)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v175 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v175 = ProtoModule.readFixed64(Buf, v5)
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
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module4:jsonDecode()
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
	name = "StreamPageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.notifications.v1beta1.TemplatesEntry"
}
t.StreamPageResponse_TemplatesEntry = Module4
TypeRegistryModule.default:register(t.StreamPageResponse_TemplatesEntry)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module5))
end

function Module5:encode()
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

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v194 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v194 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v194 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v194 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v194 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v194 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy)
	local NewModule = Module5.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module5.descriptor = {
	name = "StreamPageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.notifications.v1beta1.LocalizedLiteralsEntry"
}
t.StreamPageResponse_LocalizedLiteralsEntry = Module5
TypeRegistryModule.default:register(t.StreamPageResponse_LocalizedLiteralsEntry)

return {
	StreamPageRequest = t.StreamPageRequest,
	StreamPageResponse = t.StreamPageResponse
}