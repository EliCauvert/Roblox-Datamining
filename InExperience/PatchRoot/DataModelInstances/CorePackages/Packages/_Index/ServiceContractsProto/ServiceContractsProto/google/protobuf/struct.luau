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
	local var9 = t_1.new()
	local var10 = 0
	while var10 < buffer.len(p1) do
		local _ = nil
		local var11 = nil
		local var12, var13, var14 = protoModule.readTag(p1, var10)
		local var15 = var12
		var11 = var13
		var10 = var14
		
		if var11 == protoModule.wireTypes.varint then
			local _ = nil
			local var16, var17 = protoModule.readVarInt(p1, var10)
			local _ = var16
			var10 = var17
			continue
		end
		if var11 == protoModule.wireTypes.lengthDelimited then
			if var15 == 1 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var10)
				var10 = var19
				var18 = t.Struct_FieldsEntry.decode(var18)
				var9.fields[var18.key or ""] = var18.value or t.Value.new()
			else
				local _ = nil
				local var20, var21 = protoModule.readVarInt(p1, var10)
				var10 = var21 + var20
			end
		elseif var11 == protoModule.wireTypes.i32 then
			local _ = nil
			local var22, var23 = protoModule.readFixed32(p1, var10)
			local _ = var22
			var10 = var23
		elseif var11 == protoModule.wireTypes.i64 then
			local _ = nil
			local var24, var25 = protoModule.readFixed64(p1, var10)
			local _ = var24
			var10 = var25
		else
			error("Unsupported wire type: " .. var20)
		end
	end
	return var9
end

function t_1:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self.fields do
		t_1[i] = t.Value.jsonEncode(v)
	end
	return t_1
end

function t_1.jsonDecode(p2)
	-- upvalues: t (ref), t_1 (ref)
	local t_2 = {}
	
	for i, v in p2 do
		t_2[i] = t.Value.jsonDecode(v)
	end
	return t_1.new({ fields = t_2 })
end

t_1.descriptor = { name = "Struct", fullName = "google.protobuf.Struct" }
t.Struct = t_1
typeRegistryModule.default:register(t.Struct)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p3)
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then nil else p3.value
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var26 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var27, var28 = protoModule.writeTag(buff, var26, 1, protoModule.wireTypes.lengthDelimited)
		var27, var40 = protoModule.writeString(var27, var28, self.key)
		buff = var27
		var26 = var28
	end
	if self.value ~= nil then
		local var29 = self.value:encode()
		local var30, var31 = protoModule.writeTag(buff, var26, 2, protoModule.wireTypes.lengthDelimited)
		var30, var43 = protoModule.writeBuffer(var30, var31, var29, buffer.len(var29))
		buff = var30
		var26 = var31
	end
	local buff_1 = buffer.create(var26)
	buffer.copy(buff_1, 0, buff, 0, var26)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var26 = t_2.new()
	local var27 = 0
	while var27 < buffer.len(p3) do
		local _ = nil
		local var28 = nil
		local var29, var30, var31 = protoModule.readTag(p3, var27)
		local var32 = var29
		var28 = var30
		var27 = var31
		
		if var28 == protoModule.wireTypes.varint then
			local _ = nil
			local var33, var34 = protoModule.readVarInt(p3, var27)
			local _ = var33
			var27 = var34
			continue
		end
		if var28 == protoModule.wireTypes.lengthDelimited then
			if var32 == 1 then
				local _ = nil
				local var35, var36 = protoModule.readBuffer(p3, var27)
				var27 = var36
				var26.key = buffer.tostring(var35)
			elseif var32 == 2 then
				local _ = nil
				local var37, var38 = protoModule.readBuffer(p3, var27)
				var27 = var38
				var26.value = t.Value.decode(var37)
			else
				local _ = nil
				local var39, var40 = protoModule.readVarInt(p3, var27)
				var27 = var40 + var39
			end
		elseif var28 == protoModule.wireTypes.i32 then
			local _ = nil
			local var41, var42 = protoModule.readFixed32(p3, var27)
			local _ = var41
			var27 = var42
		elseif var28 == protoModule.wireTypes.i64 then
			local _ = nil
			local var43, var44 = protoModule.readFixed64(p3, var27)
			local _ = var43
			var27 = var44
		else
			error("Unsupported wire type: " .. var47)
		end
	end
	return var26
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
	local var45 = t_2.new()
	
	if self.key ~= nil then
		var45.key = self.key
	end
	if self.value ~= nil then
		var45.value = t.Value.jsonDecode(self.value)
	end
	return var45
end

t_2.descriptor = {
	name = "Struct_FieldsEntry",
	fullName = "google.protobuf.FieldsEntry"
}
t.Struct_FieldsEntry = t_2
typeRegistryModule.default:register(t.Struct_FieldsEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var45 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "null_value" then
			local var46, var47 = protoModule.writeTag(buff, var45, 1, protoModule.wireTypes.varint)
			var46, var69 = protoModule.writeVarInt(var46, var47, t.NullValue.toNumber(self.kind.value))
			buff = var46
			var45 = var47
		elseif self.kind.type == "number_value" then
			local var48, var49 = protoModule.writeTag(buff, var45, 2, protoModule.wireTypes.i64)
			var48, var71 = protoModule.writeDouble(var48, var49, self.kind.value)
			buff = var48
			var45 = var49
		elseif self.kind.type == "string_value" then
			local var50, var51 = protoModule.writeTag(buff, var45, 3, protoModule.wireTypes.lengthDelimited)
			var50, var73 = protoModule.writeString(var50, var51, self.kind.value)
			buff = var50
			var45 = var51
		elseif self.kind.type == "bool_value" then
			local var52, var53 = protoModule.writeTag(buff, var45, 4, protoModule.wireTypes.varint)
			var52, var75 = protoModule.writeVarInt(var52, var53, if self.kind.value then 1 else 0)
			buff = var52
			var45 = var53
		elseif self.kind.type == "struct_value" then
			local var54 = self.kind.value:encode()
			local var55, var56 = protoModule.writeTag(buff, var45, 5, protoModule.wireTypes.lengthDelimited)
			var55, var78 = protoModule.writeBuffer(var55, var56, var54, buffer.len(var54))
			buff = var55
			var45 = var56
		elseif self.kind.type == "list_value" then
			local var57 = self.kind.value:encode()
			local var58, var59 = protoModule.writeTag(buff, var45, 6, protoModule.wireTypes.lengthDelimited)
			var58, var81 = protoModule.writeBuffer(var58, var59, var57, buffer.len(var57))
			buff = var58
			var45 = var59
		end
	end
	local buff_1 = buffer.create(var45)
	buffer.copy(buff_1, 0, buff, 0, var45)
	
	return buff_1
end

function t_3.decode(p4)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var45 = t_3.new()
	local var46 = 0
	while var46 < buffer.len(p4) do
		local _ = nil
		local var47 = nil
		local var48, var49, var50 = protoModule.readTag(p4, var46)
		local var51 = var48
		var47 = var49
		var46 = var50
		
		if var47 == protoModule.wireTypes.varint then
			if var51 == 1 then
				local _ = nil
				local var52, var53 = protoModule.readVarIntI32(p4, var46)
				local var54 = var52
				var46 = var53
				var45.kind = {
					type = "null_value",
					value = t.NullValue.fromNumber(var54) or var54
				}
			elseif var51 == 4 then
				local _ = nil
				local var55, var56 = protoModule.readVarInt(p4, var46)
				var46 = var56
				var45.kind = { type = "bool_value", value = var55 ~= 0 }
			else
				local _ = nil
				local var57, var58 = protoModule.readVarInt(p4, var46)
				local _ = var57
				var46 = var58
			end
		end
		if var47 == protoModule.wireTypes.lengthDelimited then
			if var51 == 3 then
				local _ = nil
				local var59, var60 = protoModule.readBuffer(p4, var46)
				var46 = var60
				var45.kind = { type = "string_value", value = buffer.tostring(var59) }
			elseif var51 == 5 then
				local _ = nil
				local var61, var62 = protoModule.readBuffer(p4, var46)
				var46 = var62
				var45.kind = { type = "struct_value", value = t.Struct.decode(var61) }
			elseif var51 == 6 then
				local _ = nil
				local var63, var64 = protoModule.readBuffer(p4, var46)
				var46 = var64
				var45.kind = { type = "list_value", value = t.ListValue.decode(var63) }
			else
				local _ = nil
				local var65, var66 = protoModule.readVarInt(p4, var46)
				var46 = var66 + var65
			end
		elseif var47 == protoModule.wireTypes.i32 then
			local _ = nil
			local var67, var68 = protoModule.readFixed32(p4, var46)
			local _ = var67
			var46 = var68
		elseif var47 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var85)
		elseif var51 == 2 then
			local _ = nil
			local var69, var70 = protoModule.readDouble(p4, var46)
			var46 = var70
			var45.kind = { type = "number_value", value = var69 }
		else
			local _ = nil
			local var71, var72 = protoModule.readFixed64(p4, var46)
			local _ = var71
			var46 = var72
		end
	end
	return var45
end

function t_3:jsonEncode()
	-- upvalues: t (ref)
	local kind = self.kind
	
	return if kind == nil or kind.type == "null_value" then nil elseif kind.type == "number_value" or kind.type == "string_value" or kind.type == "bool_value" then kind.value elseif kind.type == "list_value" then t.ListValue.jsonEncode(kind.value) elseif kind.type == "struct_value" then t.Struct.jsonEncode(kind.value) else kind.type
end

function t_3.jsonDecode(p5)
	-- upvalues: t_3 (ref), t (ref)
	if p5 == nil then
		return t_3.new({ kind = { type = "null_value", value = "NULL_VALUE" } })
	elseif typeof(p5) == "number" then
		return t_3.new({ kind = { type = "number_value", value = p5 } })
	elseif typeof(p5) == "string" then
		return t_3.new({ kind = { type = "string_value", value = p5 } })
	elseif typeof(p5) == "boolean" then
		return t_3.new({ kind = { type = "bool_value", value = p5 } })
	elseif typeof(p5) ~= "table" then
		error(`Unknown input type: {typeof(p5)}`)
		
		return
	end
	local var73 = true
	local var74 = 0
	
	for i in p5 do
		var74 += 1
		
		if #p5 < var74 then
			var73 = false
			break
		end
	end
	return if var74 == #p5 then t_3.new({
		kind = { type = "list_value", value = t.ListValue.jsonDecode(p5) }
	}) else t_3.new({
		kind = { type = "struct_value", value = t.Struct.jsonDecode(p5) }
	})
end

t_3.descriptor = { name = "Value", fullName = "google.protobuf.Value" }
t.Value = t_3
typeRegistryModule.default:register(t.Value)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		values = if p6 == nil or p6.values == nil then {} else p6.values
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var75 = 0
	
	if self.values ~= nil and #self.values > 0 then
		for i, v in self.values do
			local var76 = v:encode()
			local var77, var78 = protoModule.writeTag(buff, var75, 1, protoModule.wireTypes.lengthDelimited)
			var77, var117 = protoModule.writeBuffer(var77, var78, var76, buffer.len(var76))
			buff = var77
			var75 = var78
		end
	end
	local buff_1 = buffer.create(var75)
	buffer.copy(buff_1, 0, buff, 0, var75)
	
	return buff_1
end

function t_4.decode(p6)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var79 = t_4.new()
	local var80 = 0
	while var80 < buffer.len(p6) do
		local _ = nil
		local var81 = nil
		local var82, var83, var84 = protoModule.readTag(p6, var80)
		local var85 = var82
		var81 = var83
		var80 = var84
		
		if var81 == protoModule.wireTypes.varint then
			local _ = nil
			local var86, var87 = protoModule.readVarInt(p6, var80)
			local _ = var86
			var80 = var87
			continue
		end
		if var81 == protoModule.wireTypes.lengthDelimited then
			if var85 == 1 then
				local _ = nil
				local var88, var89 = protoModule.readBuffer(p6, var80)
				var80 = var89
				table.insert(var79.values, t.Value.decode(var88))
			else
				local _ = nil
				local var90, var91 = protoModule.readVarInt(p6, var80)
				var80 = var91 + var90
			end
		elseif var81 == protoModule.wireTypes.i32 then
			local _ = nil
			local var92, var93 = protoModule.readFixed32(p6, var80)
			local _ = var92
			var80 = var93
		elseif var81 == protoModule.wireTypes.i64 then
			local _ = nil
			local var94, var95 = protoModule.readFixed64(p6, var80)
			local _ = var94
			var80 = var95
		else
			error("Unsupported wire type: " .. var121)
		end
	end
	return var79
end

function t_4:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self.values do
		table.insert(t_1, t.Value.jsonEncode(v))
	end
	return t_1
end

function t_4.jsonDecode(p7)
	-- upvalues: t (ref), t_4 (ref)
	local t_1 = {}
	
	for i, v in p7 do
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
	fromNumber = function(p8)
		return if p8 == 0 then "NULL_VALUE" else nil
	end,
	toNumber = function(p8)
		return if p8 == "NULL_VALUE" then 0 else p8
	end,
	fromName = function(p8)
		return if p8 == "NULL_VALUE" then "NULL_VALUE" else nil
	end
}

return {
	Struct = t.Struct,
	Value = t.Value,
	ListValue = t.ListValue,
	NullValue = t.NullValue
}