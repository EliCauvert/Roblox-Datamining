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
	-- upvalues: t (copy), Module (copy)
	return (setmetatable({
		view = if p1 == nil or p1.view == nil then assert(t.View.fromNumber(0), "Enum has no 0 default") else p1.view,
		cursor = if p1 == nil or p1.cursor == nil then "" else p1.cursor,
		page_size = if p1 == nil or p1.page_size == nil then 0 else p1.page_size,
		config_key = if p1 == nil or p1.config_key == nil then "" else p1.config_key,
		surface_key = if p1 == nil or p1.surface_key == nil then "" else p1.surface_key,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, Module))
end

function Module:encode()
	-- upvalues: t (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.view ~= nil and (self.view ~= nil and self.view ~= 0 or self.view ~= t.View.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.View.toNumber(self.view))
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.cursor)
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult3, WriteTagResult2_2, self.page_size)
	end
	if self.config_key ~= nil and self.config_key ~= "" then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.config_key)
	end
	if self.surface_key ~= nil and self.surface_key ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.surface_key)
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, value in self.cached_roblox_component_to_template_id do
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, i)
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, value)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, EncodeResult, buffer.len(EncodeResult))
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
		Tag, Tag2, v40 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v40 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.view = t.View.fromNumber(VarIntI32) or VarIntI32
			elseif Tag == 3 then
				NewModule.page_size, v40 = ProtoModule.readVarIntI32(Buf, v1)
			else
				local _
				_, v40 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v40 = ProtoModule.readBuffer(Buf, v1)
				NewModule.cursor = buffer.tostring(Buffer1)
			elseif Tag == 4 then
				local Buffer2
				Buffer2, v40 = ProtoModule.readBuffer(Buf, v1)
				NewModule.config_key = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v40 = ProtoModule.readBuffer(Buf, v1)
				NewModule.surface_key = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v40 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.LibraryPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(Buffer4)
				NewModule.cached_roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 7 then
				local Buffer5
				Buffer5, v40 = ProtoModule.readBuffer(Buf, v1)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer5)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v40 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v40 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: t (copy)
	local t1 = {}
	
	if self.view ~= nil and (self.view ~= nil and self.view ~= 0 or self.view ~= t.View.fromNumber(0)) then
		t1.view = if typeof(self.view) == "number" then self.view else t.View.toNumber(self.view)
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		t1.cursor = self.cursor
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		t1.pageSize = self.page_size
	end
	if self.config_key ~= nil and self.config_key ~= "" then
		t1.configKey = self.config_key
	end
	if self.surface_key ~= nil and self.surface_key ~= "" then
		t1.surfaceKey = self.surface_key
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local CachedRobloxComponentToTemplateId = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			CachedRobloxComponentToTemplateId[i] = value
		end
		t1.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if self.client_capabilities ~= nil then
		t1.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t1
end

function Module:jsonDecode()
	-- upvalues: Module (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module.new()
	
	if self.view ~= nil then
		NewModule.view = (if typeof(self.view) == "number" then t.View.fromNumber(self.view) else t.View.fromName(self.view)) or self.view
	end
	if self.cursor ~= nil then
		NewModule.cursor = self.cursor
	end
	if self.page_size ~= nil then
		NewModule.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		NewModule.page_size = self.pageSize
	end
	if self.config_key ~= nil then
		NewModule.config_key = self.config_key
	end
	if self.configKey ~= nil then
		NewModule.config_key = self.configKey
	end
	if self.surface_key ~= nil then
		NewModule.surface_key = self.surface_key
	end
	if self.surfaceKey ~= nil then
		NewModule.surface_key = self.surfaceKey
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
	name = "LibraryPageRequest",
	fullName = "roblox.apppageplatform.userlibrary.v1beta1.LibraryPageRequest"
}
t.LibraryPageRequest = Module
TypeRegistryModule.default:register(t.LibraryPageRequest)
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
		Tag, Tag2, v67 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v67 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v67 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v67 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v67 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v67 = ProtoModule.readFixed64(Buf, v2)
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
	name = "LibraryPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.userlibrary.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.LibraryPageRequest_CachedRobloxComponentToTemplateIdEntry = Module1
TypeRegistryModule.default:register(t.LibraryPageRequest_CachedRobloxComponentToTemplateIdEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: t (copy), Module2 (copy)
	return (setmetatable({
		collection_id = if p1 == nil or p1.collection_id == nil then "" else p1.collection_id,
		view = if p1 == nil or p1.view == nil then assert(t.View.fromNumber(0), "Enum has no 0 default") else p1.view,
		cursor = if p1 == nil or p1.cursor == nil then "" else p1.cursor,
		page_size = if p1 == nil or p1.page_size == nil then 0 else p1.page_size,
		config_key = if p1 == nil or p1.config_key == nil then "" else p1.config_key,
		surface_key = if p1 == nil or p1.surface_key == nil then "" else p1.surface_key,
		cached_roblox_component_to_template_id = if p1 == nil or p1.cached_roblox_component_to_template_id == nil then {} else p1.cached_roblox_component_to_template_id,
		client_capabilities = if p1 == nil or p1.client_capabilities == nil then nil else p1.client_capabilities
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy), t (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.collection_id)
	end
	if self.view ~= nil and (self.view ~= nil and self.view ~= 0 or self.view ~= t.View.fromNumber(0)) then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, t.View.toNumber(self.view))
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.cursor)
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, self.page_size)
	end
	if self.config_key ~= nil and self.config_key ~= "" then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, self.config_key)
	end
	if self.surface_key ~= nil and self.surface_key ~= "" then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.surface_key)
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		for i, value in self.cached_roblox_component_to_template_id do
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult7, WriteTagResult2_6, i)
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult1, WriteStringResult2_1 = ProtoModule.writeString(WriteTagResult8, WriteTagResult2_7, value)
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult9, WriteTagResult2_8, WriteStringResult1, WriteStringResult2_1)
		end
	end
	if self.client_capabilities ~= nil then
		local EncodeResult = self.client_capabilities:encode()
		local WriteTagResult10, WriteTagResult2_9 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult10, WriteTagResult2_9, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v107 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v107 = ProtoModule.readVarIntI32(Buf, v3)
				NewModule.view = t.View.fromNumber(VarIntI32) or VarIntI32
			elseif Tag == 4 then
				NewModule.page_size, v107 = ProtoModule.readVarIntI32(Buf, v3)
			else
				local _
				_, v107 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v107 = ProtoModule.readBuffer(Buf, v3)
				NewModule.collection_id = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v107 = ProtoModule.readBuffer(Buf, v3)
				NewModule.cursor = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v107 = ProtoModule.readBuffer(Buf, v3)
				NewModule.config_key = buffer.tostring(Buffer3)
			elseif Tag == 6 then
				local Buffer4
				Buffer4, v107 = ProtoModule.readBuffer(Buf, v3)
				NewModule.surface_key = buffer.tostring(Buffer4)
			elseif Tag == 7 then
				local Buffer5
				Buffer5, v107 = ProtoModule.readBuffer(Buf, v3)
				local DecodeResult = t.CollectionPageRequest_CachedRobloxComponentToTemplateIdEntry.decode(Buffer5)
				NewModule.cached_roblox_component_to_template_id[DecodeResult.key or ""] = DecodeResult.value or ""
			elseif Tag == 8 then
				local Buffer6
				Buffer6, v107 = ProtoModule.readBuffer(Buf, v3)
				NewModule.client_capabilities = ClientCapabilitiesModule.ClientCapabilities.decode(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v107 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v107 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	-- upvalues: t (copy)
	local t2 = {}
	
	if self.collection_id ~= nil and self.collection_id ~= "" then
		t2.collectionId = self.collection_id
	end
	if self.view ~= nil and (self.view ~= nil and self.view ~= 0 or self.view ~= t.View.fromNumber(0)) then
		t2.view = if typeof(self.view) == "number" then self.view else t.View.toNumber(self.view)
	end
	if self.cursor ~= nil and self.cursor ~= "" then
		t2.cursor = self.cursor
	end
	if self.page_size ~= nil and self.page_size ~= 0 then
		t2.pageSize = self.page_size
	end
	if self.config_key ~= nil and self.config_key ~= "" then
		t2.configKey = self.config_key
	end
	if self.surface_key ~= nil and self.surface_key ~= "" then
		t2.surfaceKey = self.surface_key
	end
	if self.cached_roblox_component_to_template_id ~= nil and next(self.cached_roblox_component_to_template_id) ~= nil then
		local CachedRobloxComponentToTemplateId = {}
		
		for i, value in self.cached_roblox_component_to_template_id do
			CachedRobloxComponentToTemplateId[i] = value
		end
		t2.cachedRobloxComponentToTemplateId = CachedRobloxComponentToTemplateId
	end
	if self.client_capabilities ~= nil then
		t2.clientCapabilities = self.client_capabilities:jsonEncode()
	end
	return t2
end

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), t (copy), ClientCapabilitiesModule (copy)
	local NewModule = Module2.new()
	
	if self.collection_id ~= nil then
		NewModule.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		NewModule.collection_id = self.collectionId
	end
	if self.view ~= nil then
		NewModule.view = (if typeof(self.view) == "number" then t.View.fromNumber(self.view) else t.View.fromName(self.view)) or self.view
	end
	if self.cursor ~= nil then
		NewModule.cursor = self.cursor
	end
	if self.page_size ~= nil then
		NewModule.page_size = self.page_size
	end
	if self.pageSize ~= nil then
		NewModule.page_size = self.pageSize
	end
	if self.config_key ~= nil then
		NewModule.config_key = self.config_key
	end
	if self.configKey ~= nil then
		NewModule.config_key = self.configKey
	end
	if self.surface_key ~= nil then
		NewModule.surface_key = self.surface_key
	end
	if self.surfaceKey ~= nil then
		NewModule.surface_key = self.surfaceKey
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

Module2.descriptor = {
	name = "CollectionPageRequest",
	fullName = "roblox.apppageplatform.userlibrary.v1beta1.CollectionPageRequest"
}
t.CollectionPageRequest = Module2
TypeRegistryModule.default:register(t.CollectionPageRequest)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
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
	if self.value ~= nil and self.value ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy)
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
				NewModule.value = buffer.tostring(Buffer2)
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
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy)
	local NewModule = Module3.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module3.descriptor = {
	name = "CollectionPageRequest_CachedRobloxComponentToTemplateIdEntry",
	fullName = "roblox.apppageplatform.userlibrary.v1beta1.CachedRobloxComponentToTemplateIdEntry"
}
t.CollectionPageRequest_CachedRobloxComponentToTemplateIdEntry = Module3
TypeRegistryModule.default:register(t.CollectionPageRequest_CachedRobloxComponentToTemplateIdEntry)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		page_entries = if p1 == nil or p1.page_entries == nil then {} else p1.page_entries,
		hydration_data = if p1 == nil or p1.hydration_data == nil then nil else p1.hydration_data,
		templates = if p1 == nil or p1.templates == nil then {} else p1.templates,
		localized_literals = if p1 == nil or p1.localized_literals == nil then {} else p1.localized_literals
	}, Module4))
end

function Module4:encode()
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

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy), PageEntryContentModule (copy), HydrationContentModule (copy), t (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v177 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v177 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v177 = ProtoModule.readBuffer(Buf, v5)
				table.insert(NewModule.page_entries, PageEntryContentModule.UniversalPageEntry.decode(Buffer1))
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v177 = ProtoModule.readBuffer(Buf, v5)
				NewModule.hydration_data = HydrationContentModule.HydrationContent.decode(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v177 = ProtoModule.readBuffer(Buf, v5)
				local DecodeResult = t.PageResponse_TemplatesEntry.decode(Buffer3)
				local NewResult = TemplateEntryModule.TemplateEntry.new()
				NewModule.templates[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v177 = ProtoModule.readBuffer(Buf, v5)
				local DecodeResult = t.PageResponse_LocalizedLiteralsEntry.decode(Buffer4)
				NewModule.localized_literals[DecodeResult.key or ""] = DecodeResult.value or ""
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v177 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v177 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
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

function Module4:jsonDecode()
	-- upvalues: Module4 (copy), PageEntryContentModule (copy), HydrationContentModule (copy), TemplateEntryModule (copy)
	local NewModule = Module4.new()
	
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

Module4.descriptor = {
	name = "PageResponse",
	fullName = "roblox.apppageplatform.userlibrary.v1beta1.PageResponse"
}
t.PageResponse = Module4
TypeRegistryModule.default:register(t.PageResponse)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
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
	if self.value ~= nil then
		local EncodeResult = self.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v210 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v210 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v210 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v210 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = TemplateEntryModule.TemplateEntry.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v210 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v210 = ProtoModule.readFixed64(Buf, v6)
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
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), TemplateEntryModule (copy)
	local NewModule = Module5.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = TemplateEntryModule.TemplateEntry.jsonDecode(self.value)
	end
	return NewModule
end

Module5.descriptor = {
	name = "PageResponse_TemplatesEntry",
	fullName = "roblox.apppageplatform.userlibrary.v1beta1.TemplatesEntry"
}
t.PageResponse_TemplatesEntry = Module5
TypeRegistryModule.default:register(t.PageResponse_TemplatesEntry)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then "" else p1.value
	}, Module6))
end

function Module6:encode()
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

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v229 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v229 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v229 = ProtoModule.readBuffer(Buf, v7)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v229 = ProtoModule.readBuffer(Buf, v7)
				NewModule.value = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v229 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v229 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil and self.value ~= "" then
		t.value = self.value
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy)
	local NewModule = Module6.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = self.value
	end
	return NewModule
end

Module6.descriptor = {
	name = "PageResponse_LocalizedLiteralsEntry",
	fullName = "roblox.apppageplatform.userlibrary.v1beta1.LocalizedLiteralsEntry"
}
t.PageResponse_LocalizedLiteralsEntry = Module6
TypeRegistryModule.default:register(t.PageResponse_LocalizedLiteralsEntry)
t.View = {
	fromNumber = function(p1)
		return if p1 == 0 then "VIEW_INVALID" elseif p1 == 1 then "VIEW_ALL" elseif p1 == 2 then "VIEW_COLLECTIONS" elseif p1 == 3 then "VIEW_GAMES" elseif p1 == 4 then "VIEW_AVATARS" elseif p1 == 5 then "VIEW_AVATAR_ITEMS" elseif p1 == 6 then "VIEW_SONGS" else nil
	end,
	toNumber = function(p1)
		return if p1 == "VIEW_INVALID" then 0 elseif p1 == "VIEW_ALL" then 1 elseif p1 == "VIEW_COLLECTIONS" then 2 elseif p1 == "VIEW_GAMES" then 3 elseif p1 == "VIEW_AVATARS" then 4 elseif p1 == "VIEW_AVATAR_ITEMS" then 5 elseif p1 == "VIEW_SONGS" then 6 else p1
	end,
	fromName = function(p1)
		return if p1 == "VIEW_INVALID" then "VIEW_INVALID" elseif p1 == "VIEW_ALL" then "VIEW_ALL" elseif p1 == "VIEW_COLLECTIONS" then "VIEW_COLLECTIONS" elseif p1 == "VIEW_GAMES" then "VIEW_GAMES" elseif p1 == "VIEW_AVATARS" then "VIEW_AVATARS" elseif p1 == "VIEW_AVATAR_ITEMS" then "VIEW_AVATAR_ITEMS" elseif p1 == "VIEW_SONGS" then "VIEW_SONGS" else nil
	end
}

return {
	LibraryPageRequest = t.LibraryPageRequest,
	CollectionPageRequest = t.CollectionPageRequest,
	PageResponse = t.PageResponse,
	View = t.View
}