local ProtoModule = require(script.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		fields = if p1 == nil or p1.fields == nil then {} else p1.fields
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.fields ~= nil and next(self.fields) ~= nil then
		for i, field in self.fields do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult, WriteTagResult2, i)
			local EncodeResult = field:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, WriteBufferResult, WriteBufferResult2)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v21 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v21 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v21 = ProtoModule.readBuffer(Buf, v1)
				local DecodeResult = t.Struct_FieldsEntry.decode(Buffer1)
				local NewResult = t.Value.new()
				NewModule.fields[DecodeResult.key or ""] = DecodeResult.value or NewResult
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v21 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v21 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module.jsonEncode(p1)
	-- upvalues: t (copy)
	local JsonEncodeResults = {}
	
	for i, field in p1.fields do
		JsonEncodeResults[i] = t.Value.jsonEncode(field)
	end
	return JsonEncodeResults
end

function Module.jsonDecode(List)
	-- upvalues: t (copy), Module (copy)
	local Fields = {}
	
	for i, value in List do
		Fields[i] = t.Value.jsonDecode(value)
	end
	return Module.new({ fields = Fields })
end

Module.descriptor = { name = "Struct", fullName = "google.protobuf.Struct" }
t.Struct = Module
TypeRegistryModule.default:register(t.Struct)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p2)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		key = if p2 == nil or p2.key == nil then "" else p2.key,
		value = if p2 == nil or p2.value == nil then nil else p2.value
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
	-- upvalues: Module1 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v42 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v42 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v42 = ProtoModule.readBuffer(Buf, v2)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v42 = ProtoModule.readBuffer(Buf, v2)
				NewModule.value = t.Value.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v42 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v42 = ProtoModule.readFixed64(Buf, v2)
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
	-- upvalues: Module1 (copy), t (copy)
	local NewModule = Module1.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = t.Value.jsonDecode(self.value)
	end
	return NewModule
end

Module1.descriptor = {
	name = "Struct_FieldsEntry",
	fullName = "google.protobuf.FieldsEntry"
}
t.Struct_FieldsEntry = Module1
TypeRegistryModule.default:register(t.Struct_FieldsEntry)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p2)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy), t (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "null_value" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, t.NullValue.toNumber(self.kind.value))
		elseif self.kind.type == "number_value" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i64)
			Buf, Count = ProtoModule.writeDouble(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "string_value" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "bool_value" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.kind.value then 1 else 0)
		elseif self.kind.type == "struct_value" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "list_value" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v71 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v71 = ProtoModule.readVarIntI32(Buf, v3)
				NewModule.kind = {
					type = "null_value",
					value = t.NullValue.fromNumber(VarIntI32) or VarIntI32
				}
			elseif Tag == 4 then
				local VarInt
				VarInt, v71 = ProtoModule.readVarInt(Buf, v3)
				NewModule.kind = { type = "bool_value", value = VarInt ~= 0 }
			else
				local _
				_, v71 = ProtoModule.readVarInt(Buf, v3)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 3 then
				local Buffer1
				Buffer1, v71 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = { type = "string_value", value = buffer.tostring(Buffer1) }
			elseif Tag == 5 then
				local Buffer2
				Buffer2, v71 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = { type = "struct_value", value = t.Struct.decode(Buffer2) }
			elseif Tag == 6 then
				local Buffer3
				Buffer3, v71 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = { type = "list_value", value = t.ListValue.decode(Buffer3) }
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v71 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 2 then
				local Double
				Double, v71 = ProtoModule.readDouble(Buf, v3)
				NewModule.kind = { type = "number_value", value = Double }
			else
				local _
				_, v71 = ProtoModule.readFixed64(Buf, v3)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
	-- upvalues: t (copy)
	local Kind = self.kind
	
	return if Kind == nil or Kind.type == "null_value" then nil elseif Kind.type == "number_value" or Kind.type == "string_value" or Kind.type == "bool_value" then Kind.value elseif Kind.type == "list_value" then t.ListValue.jsonEncode(Kind.value) elseif Kind.type == "struct_value" then t.Struct.jsonEncode(Kind.value) else Kind.type
end

function Module2.jsonDecode(Value)
	-- upvalues: Module2 (copy), t (copy)
	if Value == nil then
		return Module2.new({ kind = { type = "null_value", value = "NULL_VALUE" } })
	end
	if typeof(Value) == "number" then
		return Module2.new({ kind = { type = "number_value", value = Value } })
	end
	if typeof(Value) == "string" then
		return Module2.new({ kind = { type = "string_value", value = Value } })
	end
	if typeof(Value) == "boolean" then
		return Module2.new({ kind = { type = "bool_value", value = Value } })
	end
	if typeof(Value) ~= "table" then
		error(`Unknown input type: {typeof(Value)}`)
		
		return
	end
	local Count = 0
	
	for _ in Value do
		Count += 1
		
		if #Value < Count then break end
	end
	return if Count == #Value then Module2.new({
		kind = {
			type = "list_value",
			value = t.ListValue.jsonDecode(Value)
		}
	}) else Module2.new({
		kind = {
			type = "struct_value",
			value = t.Struct.jsonDecode(Value)
		}
	})
end

Module2.descriptor = { name = "Value", fullName = "google.protobuf.Value" }
t.Value = Module2
TypeRegistryModule.default:register(t.Value)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p2)
	-- upvalues: Module3 (copy)
	return (setmetatable({
		values = if p2 == nil or p2.values == nil then {} else p2.values
	}, Module3))
end

function Module3:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.values ~= nil and #self.values > 0 then
		for _, value in self.values do
			local EncodeResult = value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v93 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v93 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v93 = ProtoModule.readBuffer(Buf, v4)
				table.insert(NewModule.values, t.Value.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v93 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v93 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3.jsonEncode(p2)
	-- upvalues: t (copy)
	local JsonEncodeResults = {}
	
	for _, value in p2.values do
		table.insert(JsonEncodeResults, t.Value.jsonEncode(value))
	end
	return JsonEncodeResults
end

function Module3.jsonDecode(List)
	-- upvalues: t (copy), Module3 (copy)
	local Values = {}
	
	for _, value in List do
		table.insert(Values, t.Value.jsonDecode(value))
	end
	return Module3.new({ values = Values })
end

Module3.descriptor = {
	name = "ListValue",
	fullName = "google.protobuf.ListValue"
}
t.ListValue = Module3
TypeRegistryModule.default:register(t.ListValue)
t.NullValue = {
	fromNumber = function(p3)
		return if p3 == 0 then "NULL_VALUE" else nil
	end,
	toNumber = function(p3)
		return if p3 == "NULL_VALUE" then 0 else p3
	end,
	fromName = function(p3)
		return if p3 == "NULL_VALUE" then "NULL_VALUE" else nil
	end
}

return {
	Struct = t.Struct,
	Value = t.Value,
	ListValue = t.ListValue,
	NullValue = t.NullValue
}