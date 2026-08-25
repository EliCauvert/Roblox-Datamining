local protoModule = require(script.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		fields = if p1 == nil or p1.fields == nil then {} else p1.fields
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.fields ~= nil and next(self.fields) ~= nil then
		for i, v in self.fields do
			local var2, var3 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2, var10 = protoModule.writeString(var2, var3, i)
			local var4 = v:encode()
			var3, var12 = protoModule.writeTag(var2, var3, 2, protoModule.wireTypes.lengthDelimited)
			var3, var12 = protoModule.writeBuffer(var3, var12, var4, buffer.len(var4))
			local var5 = var3
			local var6 = var12
			local var7, var8 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var7, var16 = protoModule.writeBuffer(var7, var8, var5, var6)
			buff = var7
			var1 = var8
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
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
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var10 = t.Struct_FieldsEntry.decode(var10)
				var1.fields[var10.key or ""] = var10.value or t.Value.new()
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var20)
		end
	end
	return var1
end

function t_1:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self.fields do
		t_1[i] = t.Value.jsonEncode(v)
	end
	return t_1
end

function t_1.jsonDecode(p1)
	-- upvalues: t (ref), t_1 (ref)
	local t_2 = {}
	
	for i, v in p1 do
		t_2[i] = t.Value.jsonDecode(v)
	end
	return t_1.new({ fields = t_2 })
end

t_1.descriptor = { name = "Struct", fullName = "google.protobuf.Struct" }
t.Struct = t_1
typeRegistryModule.default:register(t.Struct)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p1)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var40 = protoModule.writeString(var2, var3, self.key)
		buff = var2
		var1 = var3
	end
	if self.value ~= nil then
		local var4 = self.value:encode()
		local var5, var6 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var5, var43 = protoModule.writeBuffer(var5, var6, var4, buffer.len(var4))
		buff = var5
		var1 = var6
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_2.decode(p1)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var1 = t_2.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				var1.key = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.value = t.Value.decode(var12)
			else
				local _ = nil
				local var14, var15 = protoModule.readVarInt(p1, var2)
				var2 = var15 + var14
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var16, var17 = protoModule.readFixed32(p1, var2)
			local _ = var16
			var2 = var17
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var18, var19 = protoModule.readFixed64(p1, var2)
			local _ = var18
			var2 = var19
		else
			error("Unsupported wire type: " .. var47)
		end
	end
	return var1
end

function t_2:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var1 = t_2.new()
	
	if self.key ~= nil then
		var1.key = self.key
	end
	if self.value ~= nil then
		var1.value = t.Value.jsonDecode(self.value)
	end
	return var1
end

t_2.descriptor = {
	name = "Struct_FieldsEntry",
	fullName = "google.protobuf.FieldsEntry"
}
t.Struct_FieldsEntry = t_2
typeRegistryModule.default:register(t.Struct_FieldsEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p1)
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "null_value" then
			local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.varint)
			var2, var69 = protoModule.writeVarInt(var2, var3, t.NullValue.toNumber(self.kind.value))
			buff = var2
			var1 = var3
		elseif self.kind.type == "number_value" then
			local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.i64)
			var4, var71 = protoModule.writeDouble(var4, var5, self.kind.value)
			buff = var4
			var1 = var5
		elseif self.kind.type == "string_value" then
			local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var6, var73 = protoModule.writeString(var6, var7, self.kind.value)
			buff = var6
			var1 = var7
		elseif self.kind.type == "bool_value" then
			local var8, var9 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.varint)
			var8, var75 = protoModule.writeVarInt(var8, var9, if self.kind.value then 1 else 0)
			buff = var8
			var1 = var9
		elseif self.kind.type == "struct_value" then
			local var10 = self.kind.value:encode()
			local var11, var12 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var11, var78 = protoModule.writeBuffer(var11, var12, var10, buffer.len(var10))
			buff = var11
			var1 = var12
		elseif self.kind.type == "list_value" then
			local var13 = self.kind.value:encode()
			local var14, var15 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var14, var81 = protoModule.writeBuffer(var14, var15, var13, buffer.len(var13))
			buff = var14
			var1 = var15
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_3.decode(p1)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var1 = t_3.new()
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
				local var8, var9 = protoModule.readVarIntI32(p1, var2)
				local var10 = var8
				var2 = var9
				var1.kind = {
					type = "null_value",
					value = t.NullValue.fromNumber(var10) or var10
				}
			elseif var7 == 4 then
				local _ = nil
				local var11, var12 = protoModule.readVarInt(p1, var2)
				var2 = var12
				var1.kind = { type = "bool_value", value = var11 ~= 0 }
			else
				local _ = nil
				local var13, var14 = protoModule.readVarInt(p1, var2)
				local _ = var13
				var2 = var14
			end
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 3 then
				local _ = nil
				local var15, var16 = protoModule.readBuffer(p1, var2)
				var2 = var16
				var1.kind = { type = "string_value", value = buffer.tostring(var15) }
			elseif var7 == 5 then
				local _ = nil
				local var17, var18 = protoModule.readBuffer(p1, var2)
				var2 = var18
				var1.kind = { type = "struct_value", value = t.Struct.decode(var17) }
			elseif var7 == 6 then
				local _ = nil
				local var19, var20 = protoModule.readBuffer(p1, var2)
				var2 = var20
				var1.kind = { type = "list_value", value = t.ListValue.decode(var19) }
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
		elseif var3 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var85)
		elseif var7 == 2 then
			local _ = nil
			local var25, var26 = protoModule.readDouble(p1, var2)
			var2 = var26
			var1.kind = { type = "number_value", value = var25 }
		else
			local _ = nil
			local var27, var28 = protoModule.readFixed64(p1, var2)
			local _ = var27
			var2 = var28
		end
	end
	return var1
end

function t_3:jsonEncode()
	-- upvalues: t (ref)
	local kind = self.kind
	
	return if kind == nil or kind.type == "null_value" then nil elseif kind.type == "number_value" or kind.type == "string_value" or kind.type == "bool_value" then kind.value elseif kind.type == "list_value" then t.ListValue.jsonEncode(kind.value) elseif kind.type == "struct_value" then t.Struct.jsonEncode(kind.value) else kind.type
end

function t_3.jsonDecode(p1)
	-- upvalues: t_3 (ref), t (ref)
	if p1 == nil then
		return t_3.new({ kind = { type = "null_value", value = "NULL_VALUE" } })
	elseif typeof(p1) == "number" then
		return t_3.new({ kind = { type = "number_value", value = p1 } })
	elseif typeof(p1) == "string" then
		return t_3.new({ kind = { type = "string_value", value = p1 } })
	elseif typeof(p1) == "boolean" then
		return t_3.new({ kind = { type = "bool_value", value = p1 } })
	elseif typeof(p1) ~= "table" then
		error(`Unknown input type: {typeof(p1)}`)
		
		return
	end
	local var1 = true
	local var2 = 0
	
	for i in p1 do
		var2 += 1
		
		if #p1 < var2 then
			var1 = false
			break
		end
	end
	return if var2 == #p1 then t_3.new({
		kind = { type = "list_value", value = t.ListValue.jsonDecode(p1) }
	}) else t_3.new({
		kind = { type = "struct_value", value = t.Struct.jsonDecode(p1) }
	})
end

t_3.descriptor = { name = "Value", fullName = "google.protobuf.Value" }
t.Value = t_3
typeRegistryModule.default:register(t.Value)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p1)
	-- upvalues: t_4 (ref)
	return setmetatable({
		values = if p1 == nil or p1.values == nil then {} else p1.values
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.values ~= nil and #self.values > 0 then
		for i, v in self.values do
			local var2 = v:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var117 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		end
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_4.decode(p1)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var1 = t_4.new()
	local var2 = 0
	while var2 < buffer.len(p1) do
		local _ = nil
		local var3 = nil
		local var4, var5, var6 = protoModule.readTag(p1, var2)
		local var7 = var4
		var3 = var5
		var2 = var6
		
		if var3 == protoModule.wireTypes.varint then
			local _ = nil
			local var8, var9 = protoModule.readVarInt(p1, var2)
			local _ = var8
			var2 = var9
			continue
		end
		if var3 == protoModule.wireTypes.lengthDelimited then
			if var7 == 1 then
				local _ = nil
				local var10, var11 = protoModule.readBuffer(p1, var2)
				var2 = var11
				table.insert(var1.values, t.Value.decode(var10))
			else
				local _ = nil
				local var12, var13 = protoModule.readVarInt(p1, var2)
				var2 = var13 + var12
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var14, var15 = protoModule.readFixed32(p1, var2)
			local _ = var14
			var2 = var15
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var16, var17 = protoModule.readFixed64(p1, var2)
			local _ = var16
			var2 = var17
		else
			error("Unsupported wire type: " .. var121)
		end
	end
	return var1
end

function t_4:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self.values do
		table.insert(t_1, t.Value.jsonEncode(v))
	end
	return t_1
end

function t_4.jsonDecode(p1)
	-- upvalues: t (ref), t_4 (ref)
	local t_1 = {}
	
	for i, v in p1 do
		table.insert(t_1, t.Value.jsonDecode(v))
	end
	return t_4.new({ values = t_1 })
end

t_4.descriptor = {
	name = "ListValue",
	fullName = "google.protobuf.ListValue"
}
t.ListValue = t_4
typeRegistryModule.default:register(t.ListValue)
t.NullValue = {
	fromNumber = function(p1)
		return if p1 == 0 then "NULL_VALUE" else nil
	end,
	toNumber = function(p1)
		return if p1 == "NULL_VALUE" then 0 else p1
	end,
	fromName = function(p1)
		return if p1 == "NULL_VALUE" then "NULL_VALUE" else nil
	end
}

return {
	Struct = t.Struct,
	Value = t.Value,
	ListValue = t.ListValue,
	NullValue = t.NullValue
}