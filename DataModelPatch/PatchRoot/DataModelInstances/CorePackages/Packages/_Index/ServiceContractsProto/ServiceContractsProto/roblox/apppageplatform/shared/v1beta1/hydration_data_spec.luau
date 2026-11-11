local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local HydrationContentTypeModule = require(script.Parent.hydration_content_type)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: HydrationContentTypeModule (copy), Module (copy)
	return (setmetatable({
		content_type = if p1 == nil or p1.content_type == nil then assert(HydrationContentTypeModule.HydrationContentType.fromNumber(0), "Enum has no 0 default") else p1.content_type,
		id_binding = if p1 == nil or p1.id_binding == nil then nil else p1.id_binding,
		alias = if p1 == nil or p1.alias == nil then "" else p1.alias,
		client_fetch = p1 ~= nil and p1.client_fetch ~= nil and p1.client_fetch,
		required_fields = if p1 == nil or p1.required_fields == nil then {} else p1.required_fields,
		required = p1 ~= nil and p1.required ~= nil and p1.required
	}, Module))
end

function Module:encode()
	-- upvalues: HydrationContentTypeModule (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.content_type ~= nil and (self.content_type ~= nil and self.content_type ~= 0 or self.content_type ~= HydrationContentTypeModule.HydrationContentType.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, HydrationContentTypeModule.HydrationContentType.toNumber(self.content_type))
	end
	if self.id_binding ~= nil then
		local EncodeResult = self.id_binding:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	if self.alias ~= nil and self.alias ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.alias)
	end
	if self.client_fetch then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.client_fetch then 1 else 0)
	end
	if self.required_fields ~= nil and #self.required_fields > 0 then
		for _, requiredField in self.required_fields do
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult5, WriteTagResult2_4, requiredField)
		end
	end
	if self.required then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult6, WriteTagResult2_5, if self.required then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), HydrationContentTypeModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v22 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v22 = ProtoModule.readVarIntI32(Buf, v1)
				NewModule.content_type = HydrationContentTypeModule.HydrationContentType.fromNumber(VarIntI32) or VarIntI32
			elseif Tag == 4 then
				local VarInt
				VarInt, v22 = ProtoModule.readVarInt(Buf, v1)
				NewModule.client_fetch = VarInt ~= 0
			elseif Tag == 6 then
				local VarInt1
				VarInt1, v22 = ProtoModule.readVarInt(Buf, v1)
				NewModule.required = VarInt1 ~= 0
			else
				local _
				_, v22 = ProtoModule.readVarInt(Buf, v1)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v22 = ProtoModule.readBuffer(Buf, v1)
				NewModule.id_binding = t.IdBinding.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v22 = ProtoModule.readBuffer(Buf, v1)
				NewModule.alias = buffer.tostring(Buffer2)
			elseif Tag == 5 then
				local Buffer3
				Buffer3, v22 = ProtoModule.readBuffer(Buf, v1)
				table.insert(NewModule.required_fields, buffer.tostring(Buffer3))
			else
				local VarInt2, VarInt2_1 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2_1 + VarInt2
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v22 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v22 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
	-- upvalues: HydrationContentTypeModule (copy)
	local t = {}
	
	if self.content_type ~= nil and (self.content_type ~= nil and self.content_type ~= 0 or self.content_type ~= HydrationContentTypeModule.HydrationContentType.fromNumber(0)) then
		t.contentType = if typeof(self.content_type) == "number" then self.content_type else HydrationContentTypeModule.HydrationContentType.toNumber(self.content_type)
	end
	if self.id_binding ~= nil then
		t.idBinding = self.id_binding:jsonEncode()
	end
	if self.alias ~= nil and self.alias ~= "" then
		t.alias = self.alias
	end
	if self.client_fetch then
		t.clientFetch = self.client_fetch
	end
	if self.required_fields ~= nil and #self.required_fields > 0 then
		local RequiredFields = {}
		
		for _, requiredField in self.required_fields do
			table.insert(RequiredFields, requiredField)
		end
		t.requiredFields = RequiredFields
	end
	if self.required then
		t.required = self.required
	end
	return t
end

function Module:jsonDecode()
	-- upvalues: Module (copy), HydrationContentTypeModule (copy), t (copy)
	local NewModule = Module.new()
	
	if self.content_type ~= nil then
		NewModule.content_type = (if typeof(self.content_type) == "number" then HydrationContentTypeModule.HydrationContentType.fromNumber(self.content_type) else HydrationContentTypeModule.HydrationContentType.fromName(self.content_type)) or self.content_type
	end
	if self.contentType ~= nil then
		NewModule.content_type = (if typeof(self.contentType) == "number" then HydrationContentTypeModule.HydrationContentType.fromNumber(self.contentType) else HydrationContentTypeModule.HydrationContentType.fromName(self.contentType)) or self.contentType
	end
	if self.id_binding ~= nil then
		NewModule.id_binding = t.IdBinding.jsonDecode(self.id_binding)
	end
	if self.idBinding ~= nil then
		NewModule.id_binding = t.IdBinding.jsonDecode(self.idBinding)
	end
	if self.alias ~= nil then
		NewModule.alias = self.alias
	end
	if self.client_fetch ~= nil then
		NewModule.client_fetch = self.client_fetch
	end
	if self.clientFetch ~= nil then
		NewModule.client_fetch = self.clientFetch
	end
	if self.required_fields ~= nil then
		local Required_fields = {}
		
		for _, requiredField in self.required_fields do
			table.insert(Required_fields, requiredField)
		end
		NewModule.required_fields = Required_fields
	end
	if self.requiredFields ~= nil then
		local Required_fields = {}
		
		for _, requiredField1 in self.requiredFields do
			table.insert(Required_fields, requiredField1)
		end
		NewModule.required_fields = Required_fields
	end
	if self.required ~= nil then
		NewModule.required = self.required
	end
	return NewModule
end

Module.descriptor = {
	name = "HydrationDataSpec",
	fullName = "roblox.apppageplatform.shared.v1beta1.HydrationDataSpec"
}
t.HydrationDataSpec = Module
TypeRegistryModule.default:register(t.HydrationDataSpec)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "input_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		end
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
		Tag, Tag2, v48 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v48 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v48 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v48 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = { type = "input_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v48 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v48 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "input_path" then
			t.inputPath = self.kind.value
		end
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy)
	local NewModule = Module1.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.input_path ~= nil then
		NewModule.kind = { type = "input_path", value = self.input_path }
	end
	if self.inputPath ~= nil then
		NewModule.kind = { type = "input_path", value = self.inputPath }
	end
	return NewModule
end

Module1.descriptor = {
	name = "IdBinding",
	fullName = "roblox.apppageplatform.shared.v1beta1.IdBinding"
}
t.IdBinding = Module1
TypeRegistryModule.default:register(t.IdBinding)

return {
	HydrationDataSpec = t.HydrationDataSpec,
	IdBinding = t.IdBinding
}