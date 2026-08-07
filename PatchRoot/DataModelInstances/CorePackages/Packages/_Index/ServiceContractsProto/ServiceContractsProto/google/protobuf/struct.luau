-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:11 2026 Pacific Standard Time.

local protoModule = require(script.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 125 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		fields = if p0 == nil or p0.fields == nil then {} else p0.fields
	}, t_1)
end

function t_1:encode() --[[ line: 131 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var8 = 0
	
	if self.fields ~= nil and next(self.fields) ~= nil then
		for i, v in self.fields do
			local var9, var10 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var9, var10 = protoModule.writeString(var9, var10, i)
			local var11 = v:encode()
			var10, var12 = protoModule.writeTag(var9, var10, 2, protoModule.wireTypes.lengthDelimited)
			var10, var12 = protoModule.writeBuffer(var10, var12, var11, buffer.len(var11))
			local var13 = var10
			local var14 = var12
			local var15, var16 = protoModule.writeTag(buff, var8, 1, protoModule.wireTypes.lengthDelimited)
			var15, var16 = protoModule.writeBuffer(var15, var16, var13, var14)
			buff = var15
			var8 = var16
		end
	end
	local buff_1 = buffer.create(var8)
	buffer.copy(buff_1, 0, buff, 0, var8)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 154 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var18 = t_1.new()
	local var19 = 0
	while var19 < buffer.len(p1) do
		local _ = nil
		local var20 = nil
		local var21, var22, var23 = protoModule.readTag(p1, var19)
		local var24 = var21
		var20 = var22
		var19 = var23
		
		if var20 == protoModule.wireTypes.varint then
			local _ = nil
			local var25, var26 = protoModule.readVarInt(p1, var19)
			local _ = var25
			var19 = var26
			continue
		end
		if var20 == protoModule.wireTypes.lengthDelimited then
			if var24 == 1 then
				local _ = nil
				local var27, var28 = protoModule.readBuffer(p1, var19)
				var19 = var28
				var27 = t.Struct_FieldsEntry.decode(var27)
				var18.fields[var27.key or ""] = var27.value or t.Value.new()
			else
				local _ = nil
				local var29, var30 = protoModule.readVarInt(p1, var19)
				var19 = var30 + var29
			end
		elseif var20 == protoModule.wireTypes.i32 then
			local _ = nil
			local var31, var32 = protoModule.readFixed32(p1, var19)
			local _ = var31
			var19 = var32
		elseif var20 == protoModule.wireTypes.i64 then
			local _ = nil
			local var33, var34 = protoModule.readFixed64(p1, var19)
			local _ = var33
			var19 = var34
		else
			error("Unsupported wire type: " .. var20)
		end
	end
	return var18
end

function t_1:jsonEncode() --[[ line: 204 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self.fields do
		t_1[i] = t.Value.jsonEncode(v)
	end
	return t_1
end

function t_1.jsonDecode(p2) --[[ line: 214 ]]
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

function t_2.new(p3) --[[ line: 240 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		key = if p3 == nil or p3.key == nil then "" else p3.key,
		value = if p3 == nil or p3.value == nil then nil else p3.value
	}, t_2)
end

function t_2:encode() --[[ line: 247 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var38 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var39, var40 = protoModule.writeTag(buff, var38, 1, protoModule.wireTypes.lengthDelimited)
		var39, var40 = protoModule.writeString(var39, var40, self.key)
		buff = var39
		var38 = var40
	end
	if self.value ~= nil then
		local var41 = self.value:encode()
		local var42, var43 = protoModule.writeTag(buff, var38, 2, protoModule.wireTypes.lengthDelimited)
		var42, var43 = protoModule.writeBuffer(var42, var43, var41, buffer.len(var41))
		buff = var42
		var38 = var43
	end
	local buff_1 = buffer.create(var38)
	buffer.copy(buff_1, 0, buff, 0, var38)
	
	return buff_1
end

function t_2.decode(p4) --[[ line: 267 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var45 = t_2.new()
	local var46 = 0
	while var46 < buffer.len(p4) do
		local _ = nil
		local var47 = nil
		local var48, var49, var50 = protoModule.readTag(p4, var46)
		local var51 = var48
		var47 = var49
		var46 = var50
		
		if var47 == protoModule.wireTypes.varint then
			local _ = nil
			local var52, var53 = protoModule.readVarInt(p4, var46)
			local _ = var52
			var46 = var53
			continue
		end
		if var47 == protoModule.wireTypes.lengthDelimited then
			if var51 == 1 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p4, var46)
				var46 = var55
				var45.key = buffer.tostring(var54)
			elseif var51 == 2 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p4, var46)
				var46 = var57
				var45.value = t.Value.decode(var56)
			else
				local _ = nil
				local var58, var59 = protoModule.readVarInt(p4, var46)
				var46 = var59 + var58
			end
		elseif var47 == protoModule.wireTypes.i32 then
			local _ = nil
			local var60, var61 = protoModule.readFixed32(p4, var46)
			local _ = var60
			var46 = var61
		elseif var47 == protoModule.wireTypes.i64 then
			local _ = nil
			local var62, var63 = protoModule.readFixed64(p4, var46)
			local _ = var62
			var46 = var63
		else
			error("Unsupported wire type: " .. var47)
		end
	end
	return var45
end

function t_2:jsonEncode() --[[ line: 315 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_2:jsonDecode() --[[ line: 329 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var65 = t_2.new()
	
	if self.key ~= nil then
		var65.key = self.key
	end
	if self.value ~= nil then
		var65.value = t.Value.jsonDecode(self.value)
	end
	return var65
end

t_2.descriptor = {
	name = "Struct_FieldsEntry",
	fullName = "google.protobuf.FieldsEntry"
}
t.Struct_FieldsEntry = t_2
typeRegistryModule.default:register(t.Struct_FieldsEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p5) --[[ line: 357 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p5 == nil or p5.kind == nil then nil else p5.kind
	}, t_3)
end

function t_3:encode() --[[ line: 363 ]]
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var67 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "null_value" then
			local var68, var69 = protoModule.writeTag(buff, var67, 1, protoModule.wireTypes.varint)
			var68, var69 = protoModule.writeVarInt(var68, var69, t.NullValue.toNumber(self.kind.value))
			buff = var68
			var67 = var69
		elseif self.kind.type == "number_value" then
			local var70, var71 = protoModule.writeTag(buff, var67, 2, protoModule.wireTypes.i64)
			var70, var71 = protoModule.writeDouble(var70, var71, self.kind.value)
			buff = var70
			var67 = var71
		elseif self.kind.type == "string_value" then
			local var72, var73 = protoModule.writeTag(buff, var67, 3, protoModule.wireTypes.lengthDelimited)
			var72, var73 = protoModule.writeString(var72, var73, self.kind.value)
			buff = var72
			var67 = var73
		elseif self.kind.type == "bool_value" then
			local var74, var75 = protoModule.writeTag(buff, var67, 4, protoModule.wireTypes.varint)
			var74, var75 = protoModule.writeVarInt(var74, var75, if self.kind.value then 1 else 0)
			buff = var74
			var67 = var75
		elseif self.kind.type == "struct_value" then
			local var76 = self.kind.value:encode()
			local var77, var78 = protoModule.writeTag(buff, var67, 5, protoModule.wireTypes.lengthDelimited)
			var77, var78 = protoModule.writeBuffer(var77, var78, var76, buffer.len(var76))
			buff = var77
			var67 = var78
		elseif self.kind.type == "list_value" then
			local var79 = self.kind.value:encode()
			local var80, var81 = protoModule.writeTag(buff, var67, 6, protoModule.wireTypes.lengthDelimited)
			var80, var81 = protoModule.writeBuffer(var80, var81, var79, buffer.len(var79))
			buff = var80
			var67 = var81
		end
	end
	local buff_1 = buffer.create(var67)
	buffer.copy(buff_1, 0, buff, 0, var67)
	
	return buff_1
end

function t_3.decode(p6) --[[ line: 396 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var83 = t_3.new()
	local var84 = 0
	while var84 < buffer.len(p6) do
		local _ = nil
		local var85 = nil
		local var86, var87, var88 = protoModule.readTag(p6, var84)
		local var89 = var86
		var85 = var87
		var84 = var88
		
		if var85 == protoModule.wireTypes.varint then
			if var89 == 1 then
				local _ = nil
				local var90, var91 = protoModule.readVarIntI32(p6, var84)
				local var92 = var90
				var84 = var91
				var83.kind = {
					type = "null_value",
					value = t.NullValue.fromNumber(var92) or var92
				}
			elseif var89 == 4 then
				local _ = nil
				local var93, var94 = protoModule.readVarInt(p6, var84)
				var84 = var94
				var83.kind = { type = "bool_value", value = var93 ~= 0 }
			else
				local _ = nil
				local var95, var96 = protoModule.readVarInt(p6, var84)
				local _ = var95
				var84 = var96
			end
		end
		if var85 == protoModule.wireTypes.lengthDelimited then
			if var89 == 3 then
				local _ = nil
				local var97, var98 = protoModule.readBuffer(p6, var84)
				var84 = var98
				var83.kind = { type = "string_value", value = buffer.tostring(var97) }
			elseif var89 == 5 then
				local _ = nil
				local var99, var100 = protoModule.readBuffer(p6, var84)
				var84 = var100
				var83.kind = { type = "struct_value", value = t.Struct.decode(var99) }
			elseif var89 == 6 then
				local _ = nil
				local var101, var102 = protoModule.readBuffer(p6, var84)
				var84 = var102
				var83.kind = { type = "list_value", value = t.ListValue.decode(var101) }
			else
				local _ = nil
				local var103, var104 = protoModule.readVarInt(p6, var84)
				var84 = var104 + var103
			end
		elseif var85 == protoModule.wireTypes.i32 then
			local _ = nil
			local var105, var106 = protoModule.readFixed32(p6, var84)
			local _ = var105
			var84 = var106
		elseif var85 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var85)
		elseif var89 == 2 then
			local _ = nil
			local var107, var108 = protoModule.readDouble(p6, var84)
			var84 = var108
			var83.kind = { type = "number_value", value = var107 }
		else
			local _ = nil
			local var109, var110 = protoModule.readFixed64(p6, var84)
			local _ = var109
			var84 = var110
		end
	end
	return var83
end

function t_3:jsonEncode() --[[ line: 467 ]]
	-- upvalues: t (ref)
	local kind = self.kind
	
	return if kind == nil or kind.type == "null_value" then nil elseif kind.type == "number_value" or kind.type == "string_value" or kind.type == "bool_value" then kind.value elseif kind.type == "list_value" then t.ListValue.jsonEncode(kind.value) elseif kind.type == "struct_value" then t.Struct.jsonEncode(kind.value) else kind.type
end

function t_3.jsonDecode(p7) --[[ line: 484 ]]
	-- upvalues: t_3 (ref), t (ref)
	if p7 == nil then
		return t_3.new({ kind = { type = "null_value", value = "NULL_VALUE" } })
	elseif typeof(p7) == "number" then
		return t_3.new({ kind = { type = "number_value", value = p7 } })
	elseif typeof(p7) == "string" then
		return t_3.new({ kind = { type = "string_value", value = p7 } })
	elseif typeof(p7) == "boolean" then
		return t_3.new({ kind = { type = "bool_value", value = p7 } })
	elseif typeof(p7) ~= "table" then
		error(`Unknown input type: {typeof(p7)}`)
		
		return
	end
	local var111 = true
	local var112 = 0
	
	for i in p7 do
		var112 += 1
		
		if #p7 < var112 then
			var111 = false
			break
		end
	end
	return if var112 == #p7 then t_3.new({
		kind = { type = "list_value", value = t.ListValue.jsonDecode(p7) }
	}) else t_3.new({
		kind = { type = "struct_value", value = t.Struct.jsonDecode(p7) }
	})
end

t_3.descriptor = { name = "Value", fullName = "google.protobuf.Value" }
t.Value = t_3
typeRegistryModule.default:register(t.Value)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p8) --[[ line: 530 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		values = if p8 == nil or p8.values == nil then {} else p8.values
	}, t_4)
end

function t_4:encode() --[[ line: 536 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var114 = 0
	
	if self.values ~= nil and #self.values > 0 then
		for i, v in self.values do
			local var115 = v:encode()
			local var116, var117 = protoModule.writeTag(buff, var114, 1, protoModule.wireTypes.lengthDelimited)
			var116, var117 = protoModule.writeBuffer(var116, var117, var115, buffer.len(var115))
			buff = var116
			var114 = var117
		end
	end
	local buff_1 = buffer.create(var114)
	buffer.copy(buff_1, 0, buff, 0, var114)
	
	return buff_1
end

function t_4.decode(p9) --[[ line: 553 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var119 = t_4.new()
	local var120 = 0
	while var120 < buffer.len(p9) do
		local _ = nil
		local var121 = nil
		local var122, var123, var124 = protoModule.readTag(p9, var120)
		local var125 = var122
		var121 = var123
		var120 = var124
		
		if var121 == protoModule.wireTypes.varint then
			local _ = nil
			local var126, var127 = protoModule.readVarInt(p9, var120)
			local _ = var126
			var120 = var127
			continue
		end
		if var121 == protoModule.wireTypes.lengthDelimited then
			if var125 == 1 then
				local _ = nil
				local var128, var129 = protoModule.readBuffer(p9, var120)
				var120 = var129
				table.insert(var119.values, t.Value.decode(var128))
			else
				local _ = nil
				local var130, var131 = protoModule.readVarInt(p9, var120)
				var120 = var131 + var130
			end
		elseif var121 == protoModule.wireTypes.i32 then
			local _ = nil
			local var132, var133 = protoModule.readFixed32(p9, var120)
			local _ = var132
			var120 = var133
		elseif var121 == protoModule.wireTypes.i64 then
			local _ = nil
			local var134, var135 = protoModule.readFixed64(p9, var120)
			local _ = var134
			var120 = var135
		else
			error("Unsupported wire type: " .. var121)
		end
	end
	return var119
end

function t_4:jsonEncode() --[[ line: 596 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in self.values do
		table.insert(t_1, t.Value.jsonEncode(v))
	end
	return t_1
end

function t_4.jsonDecode(p10) --[[ line: 606 ]]
	-- upvalues: t (ref), t_4 (ref)
	local t_1 = {}
	
	for i, v in p10 do
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
	fromNumber = function(p11) --[[ line: 631 ]]
		return if p11 == 0 then "NULL_VALUE" else nil
	end,
	toNumber = function(p12) --[[ line: 639 ]]
		return if p12 == "NULL_VALUE" then 0 else p12
	end,
	fromName = function(p13) --[[ line: 647 ]]
		return if p13 == "NULL_VALUE" then "NULL_VALUE" else nil
	end
}

return {
	Struct = t.Struct,
	Value = t.Value,
	ListValue = t.ListValue,
	NullValue = t.NullValue
}