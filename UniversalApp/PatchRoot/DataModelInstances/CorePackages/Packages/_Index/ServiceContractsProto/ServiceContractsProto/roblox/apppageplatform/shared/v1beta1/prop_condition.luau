local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 231 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p0 == nil or p0.kind == nil then nil else p0.kind
	}, t_1)
end

function t_1:encode() --[[ line: 237 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var12 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "comparison" then
			local var13 = self.kind.value:encode()
			local var14, var15 = protoModule.writeTag(buff, var12, 1, protoModule.wireTypes.lengthDelimited)
			var14, var15 = protoModule.writeBuffer(var14, var15, var13, buffer.len(var13))
			buff = var14
			var12 = var15
		elseif self.kind.type == "is_null" then
			local var16 = self.kind.value:encode()
			local var17, var18 = protoModule.writeTag(buff, var12, 2, protoModule.wireTypes.lengthDelimited)
			var17, var18 = protoModule.writeBuffer(var17, var18, var16, buffer.len(var16))
			buff = var17
			var12 = var18
		elseif self.kind.type == "is_not_null" then
			local var19 = self.kind.value:encode()
			local var20, var21 = protoModule.writeTag(buff, var12, 3, protoModule.wireTypes.lengthDelimited)
			var20, var21 = protoModule.writeBuffer(var20, var21, var19, buffer.len(var19))
			buff = var20
			var12 = var21
		elseif self.kind.type == "and_condition" then
			local var22 = self.kind.value:encode()
			local var23, var24 = protoModule.writeTag(buff, var12, 4, protoModule.wireTypes.lengthDelimited)
			var23, var24 = protoModule.writeBuffer(var23, var24, var22, buffer.len(var22))
			buff = var23
			var12 = var24
		elseif self.kind.type == "or_condition" then
			local var25 = self.kind.value:encode()
			local var26, var27 = protoModule.writeTag(buff, var12, 5, protoModule.wireTypes.lengthDelimited)
			var26, var27 = protoModule.writeBuffer(var26, var27, var25, buffer.len(var25))
			buff = var26
			var12 = var27
		elseif self.kind.type == "is_empty" then
			local var28 = self.kind.value:encode()
			local var29, var30 = protoModule.writeTag(buff, var12, 6, protoModule.wireTypes.lengthDelimited)
			var29, var30 = protoModule.writeBuffer(var29, var30, var28, buffer.len(var28))
			buff = var29
			var12 = var30
		elseif self.kind.type == "is_not_empty" then
			local var31 = self.kind.value:encode()
			local var32, var33 = protoModule.writeTag(buff, var12, 7, protoModule.wireTypes.lengthDelimited)
			var32, var33 = protoModule.writeBuffer(var32, var33, var31, buffer.len(var31))
			buff = var32
			var12 = var33
		end
	end
	local buff_1 = buffer.create(var12)
	buffer.copy(buff_1, 0, buff, 0, var12)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 278 ]]
	-- upvalues: t_1 (ref), protoModule (ref), t (ref)
	local var35 = t_1.new()
	local var36 = 0
	while var36 < buffer.len(p1) do
		local _ = nil
		local var37 = nil
		local var38, var39, var40 = protoModule.readTag(p1, var36)
		local var41 = var38
		var37 = var39
		var36 = var40
		
		if var37 == protoModule.wireTypes.varint then
			local _ = nil
			local var42, var43 = protoModule.readVarInt(p1, var36)
			local _ = var42
			var36 = var43
			continue
		end
		if var37 == protoModule.wireTypes.lengthDelimited then
			if var41 == 1 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p1, var36)
				var36 = var45
				var35.kind = {
					type = "comparison",
					value = t.ComparisonCondition.decode(var44)
				}
			elseif var41 == 2 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p1, var36)
				var36 = var47
				var35.kind = {
					type = "is_null",
					value = t.IsNullCondition.decode(var46)
				}
			elseif var41 == 3 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p1, var36)
				var36 = var49
				var35.kind = {
					type = "is_not_null",
					value = t.IsNotNullCondition.decode(var48)
				}
			elseif var41 == 4 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p1, var36)
				var36 = var51
				var35.kind = {
					type = "and_condition",
					value = t.AndCondition.decode(var50)
				}
			elseif var41 == 5 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p1, var36)
				var36 = var53
				var35.kind = {
					type = "or_condition",
					value = t.OrCondition.decode(var52)
				}
			elseif var41 == 6 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p1, var36)
				var36 = var55
				var35.kind = {
					type = "is_empty",
					value = t.IsEmptyCondition.decode(var54)
				}
			elseif var41 == 7 then
				local _ = nil
				local var56, var57 = protoModule.readBuffer(p1, var36)
				var36 = var57
				var35.kind = {
					type = "is_not_empty",
					value = t.IsNotEmptyCondition.decode(var56)
				}
			else
				local _ = nil
				local var58, var59 = protoModule.readVarInt(p1, var36)
				var36 = var59 + var58
			end
		elseif var37 == protoModule.wireTypes.i32 then
			local _ = nil
			local var60, var61 = protoModule.readFixed32(p1, var36)
			local _ = var60
			var36 = var61
		elseif var37 == protoModule.wireTypes.i64 then
			local _ = nil
			local var62, var63 = protoModule.readFixed64(p1, var36)
			local _ = var62
			var36 = var63
		else
			error("Unsupported wire type: " .. var37)
		end
	end
	return var35
end

function t_1:jsonEncode() --[[ line: 351 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "comparison" then
			t.comparison = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "is_null" then
			t.isNull = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "is_not_null" then
			t.isNotNull = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "and_condition" then
			t.andCondition = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "or_condition" then
			t.orCondition = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "is_empty" then
			t.isEmpty = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "is_not_empty" then
			t.isNotEmpty = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_1:jsonDecode() --[[ line: 375 ]]
	-- upvalues: t_1 (ref), t (ref)
	local var65 = t_1.new()
	
	if self.comparison ~= nil then
		var65.kind = {
			type = "comparison",
			value = t.ComparisonCondition.jsonDecode(self.comparison)
		}
	end
	if self.is_null ~= nil then
		var65.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.is_null)
		}
	end
	if self.isNull ~= nil then
		var65.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.isNull)
		}
	end
	if self.is_not_null ~= nil then
		var65.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.is_not_null)
		}
	end
	if self.isNotNull ~= nil then
		var65.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.isNotNull)
		}
	end
	if self.and_condition ~= nil then
		var65.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.and_condition)
		}
	end
	if self.andCondition ~= nil then
		var65.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.andCondition)
		}
	end
	if self.or_condition ~= nil then
		var65.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.or_condition)
		}
	end
	if self.orCondition ~= nil then
		var65.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.orCondition)
		}
	end
	if self.is_empty ~= nil then
		var65.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.is_empty)
		}
	end
	if self.isEmpty ~= nil then
		var65.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.isEmpty)
		}
	end
	if self.is_not_empty ~= nil then
		var65.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.is_not_empty)
		}
	end
	if self.isNotEmpty ~= nil then
		var65.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.isNotEmpty)
		}
	end
	return var65
end

t_1.descriptor = {
	name = "PropCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.PropCondition"
}
t.PropCondition = t_1
typeRegistryModule.default:register(t.PropCondition)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 447 ]]
	-- upvalues: t (ref), t_2 (ref)
	return setmetatable({
		field = if p2 == nil or p2.field == nil then "" else p2.field,
		op = if p2 == nil or p2.op == nil then assert(t.ComparisonCondition_Op.fromNumber(0), "Enum has no 0 default") else p2.op,
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode() --[[ line: 457 ]]
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var67 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var68, var69 = protoModule.writeTag(buff, var67, 1, protoModule.wireTypes.lengthDelimited)
		var68, var69 = protoModule.writeString(var68, var69, self.field)
		buff = var68
		var67 = var69
	end
	if self.op ~= nil and (self.op ~= nil and self.op ~= 0 or self.op ~= t.ComparisonCondition_Op.fromNumber(0)) then
		local var70, var71 = protoModule.writeTag(buff, var67, 2, protoModule.wireTypes.varint)
		var70, var71 = protoModule.writeVarInt(var70, var71, t.ComparisonCondition_Op.toNumber(self.op))
		buff = var70
		var67 = var71
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			local var72, var73 = protoModule.writeTag(buff, var67, 3, protoModule.wireTypes.lengthDelimited)
			var72, var73 = protoModule.writeString(var72, var73, self.kind.value)
			buff = var72
			var67 = var73
		elseif self.kind.type == "bool_value" then
			local var74, var75 = protoModule.writeTag(buff, var67, 4, protoModule.wireTypes.varint)
			var74, var75 = protoModule.writeVarInt(var74, var75, if self.kind.value then 1 else 0)
			buff = var74
			var67 = var75
		elseif self.kind.type == "int32_value" then
			local var76, var77 = protoModule.writeTag(buff, var67, 5, protoModule.wireTypes.varint)
			var76, var77 = protoModule.writeVarInt(var76, var77, self.kind.value)
			buff = var76
			var67 = var77
		elseif self.kind.type == "int64_value" then
			local var78, var79 = protoModule.writeTag(buff, var67, 6, protoModule.wireTypes.varint)
			var78, var79 = protoModule.writeVarInt(var78, var79, self.kind.value)
			buff = var78
			var67 = var79
		elseif self.kind.type == "float_value" then
			local var80, var81 = protoModule.writeTag(buff, var67, 7, protoModule.wireTypes.i32)
			var80, var81 = protoModule.writeFloat(var80, var81, self.kind.value)
			buff = var80
			var67 = var81
		elseif self.kind.type == "double_value" then
			local var82, var83 = protoModule.writeTag(buff, var67, 8, protoModule.wireTypes.i64)
			var82, var83 = protoModule.writeDouble(var82, var83, self.kind.value)
			buff = var82
			var67 = var83
		end
	end
	local buff_1 = buffer.create(var67)
	buffer.copy(buff_1, 0, buff, 0, var67)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 501 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var85 = t_2.new()
	local var86 = 0
	while var86 < buffer.len(p3) do
		local _ = nil
		local var87 = nil
		local var88, var89, var90 = protoModule.readTag(p3, var86)
		local var91 = var88
		var87 = var89
		var86 = var90
		
		if var87 == protoModule.wireTypes.varint then
			if var91 == 2 then
				local _ = nil
				local var92, var93 = protoModule.readVarIntI32(p3, var86)
				local var94 = var92
				var86 = var93
				var85.op = t.ComparisonCondition_Op.fromNumber(var94) or var94
			elseif var91 == 4 then
				local _ = nil
				local var95, var96 = protoModule.readVarInt(p3, var86)
				var86 = var96
				var85.kind = { type = "bool_value", value = var95 ~= 0 }
			elseif var91 == 5 then
				local _ = nil
				local var97, var98 = protoModule.readVarIntI32(p3, var86)
				var86 = var98
				var85.kind = { type = "int32_value", value = var97 }
			elseif var91 == 6 then
				local _ = nil
				local var99, var100 = protoModule.readVarIntI64(p3, var86)
				var86 = var100
				var85.kind = { type = "int64_value", value = var99 }
			else
				local _ = nil
				local var101, var102 = protoModule.readVarInt(p3, var86)
				local _ = var101
				var86 = var102
			end
		end
		if var87 == protoModule.wireTypes.lengthDelimited then
			if var91 == 1 then
				local _ = nil
				local var103, var104 = protoModule.readBuffer(p3, var86)
				var86 = var104
				var85.field = buffer.tostring(var103)
			elseif var91 == 3 then
				local _ = nil
				local var105, var106 = protoModule.readBuffer(p3, var86)
				var86 = var106
				var85.kind = { type = "string_value", value = buffer.tostring(var105) }
			else
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p3, var86)
				var86 = var108 + var107
			end
		elseif var87 == protoModule.wireTypes.i32 then
			if var91 == 7 then
				local _ = nil
				local var109, var110 = protoModule.readFloat(p3, var86)
				var86 = var110
				var85.kind = { type = "float_value", value = var109 }
			else
				local _ = nil
				local var111, var112 = protoModule.readFixed32(p3, var86)
				local _ = var111
				var86 = var112
			end
		elseif var87 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var87)
		elseif var91 == 8 then
			local _ = nil
			local var113, var114 = protoModule.readDouble(p3, var86)
			var86 = var114
			var85.kind = { type = "double_value", value = var113 }
		else
			local _ = nil
			local var115, var116 = protoModule.readFixed64(p3, var86)
			local _ = var115
			var86 = var116
		end
	end
	return var85
end

function t_2:jsonEncode() --[[ line: 579 ]]
	-- upvalues: t (ref), protoModule (ref)
	local t_1 = {}
	
	if self.field ~= nil and self.field ~= "" then
		t_1.field = self.field
	end
	if self.op ~= nil and (self.op ~= nil and self.op ~= 0 or self.op ~= t.ComparisonCondition_Op.fromNumber(0)) then
		t_1.op = if typeof(self.op) == "number" then self.op else t.ComparisonCondition_Op.toNumber(self.op)
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			t_1.stringValue = self.kind.value
			
			return t_1
		elseif self.kind.type == "bool_value" then
			t_1.boolValue = self.kind.value
			
			return t_1
		elseif self.kind.type == "int32_value" then
			t_1.int32Value = self.kind.value
			
			return t_1
		elseif self.kind.type == "int64_value" then
			t_1.int64Value = self.kind.value
			
			return t_1
		elseif self.kind.type == "float_value" then
			t_1.floatValue = protoModule.json.serializeNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "double_value" then
			t_1.doubleValue = protoModule.json.serializeNumber(self.kind.value)
		end
	end
	return t_1
end

function t_2:jsonDecode() --[[ line: 614 ]]
	-- upvalues: t_2 (ref), t (ref), protoModule (ref)
	local var118 = t_2.new()
	
	if self.field ~= nil then
		var118.field = self.field
	end
	if self.op ~= nil then
		var118.op = if typeof(self.op) == "number" then t.ComparisonCondition_Op.fromNumber(self.op) or self.op else t.ComparisonCondition_Op.fromName(self.op) or self.op
	end
	if self.string_value ~= nil then
		var118.kind = { type = "string_value", value = self.string_value }
	end
	if self.stringValue ~= nil then
		var118.kind = { type = "string_value", value = self.stringValue }
	end
	if self.bool_value ~= nil then
		var118.kind = { type = "bool_value", value = self.bool_value }
	end
	if self.boolValue ~= nil then
		var118.kind = { type = "bool_value", value = self.boolValue }
	end
	if self.int32_value ~= nil then
		var118.kind = { type = "int32_value", value = self.int32_value }
	end
	if self.int32Value ~= nil then
		var118.kind = { type = "int32_value", value = self.int32Value }
	end
	if self.int64_value ~= nil then
		var118.kind = { type = "int64_value", value = self.int64_value }
	end
	if self.int64Value ~= nil then
		var118.kind = { type = "int64_value", value = self.int64Value }
	end
	if self.float_value ~= nil then
		var118.kind = {
			type = "float_value",
			value = protoModule.json.deserializeNumber(self.float_value)
		}
	end
	if self.floatValue ~= nil then
		var118.kind = {
			type = "float_value",
			value = protoModule.json.deserializeNumber(self.floatValue)
		}
	end
	if self.double_value ~= nil then
		var118.kind = {
			type = "double_value",
			value = protoModule.json.deserializeNumber(self.double_value)
		}
	end
	if self.doubleValue ~= nil then
		var118.kind = {
			type = "double_value",
			value = protoModule.json.deserializeNumber(self.doubleValue)
		}
	end
	return var118
end

t_2.descriptor = {
	name = "ComparisonCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.ComparisonCondition"
}
t.ComparisonCondition = t_2
typeRegistryModule.default:register(t.ComparisonCondition)
t.ComparisonCondition_Op = {
	fromNumber = function(p4) --[[ line: 689 ]]
		return if p4 == 0 then "OP_INVALID" elseif p4 == 1 then "OP_LT" elseif p4 == 2 then "OP_LTE" elseif p4 == 3 then "OP_GT" elseif p4 == 4 then "OP_GTE" elseif p4 == 5 then "OP_E" elseif p4 == 6 then "OP_NE" else nil
	end,
	toNumber = function(p5) --[[ line: 709 ]]
		return if p5 == "OP_INVALID" then 0 elseif p5 == "OP_LT" then 1 elseif p5 == "OP_LTE" then 2 elseif p5 == "OP_GT" then 3 elseif p5 == "OP_GTE" then 4 elseif p5 == "OP_E" then 5 elseif p5 == "OP_NE" then 6 else p5
	end,
	fromName = function(p6) --[[ line: 729 ]]
		return if p6 == "OP_INVALID" then "OP_INVALID" elseif p6 == "OP_LT" then "OP_LT" elseif p6 == "OP_LTE" then "OP_LTE" elseif p6 == "OP_GT" then "OP_GT" elseif p6 == "OP_GTE" then "OP_GTE" elseif p6 == "OP_E" then "OP_E" elseif p6 == "OP_NE" then "OP_NE" else nil
	end
}
local t_3 = {}
t_3.__index = t_3

function t_3.new(p7) --[[ line: 754 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		field = if p7 == nil or p7.field == nil then "" else p7.field
	}, t_3)
end

function t_3:encode() --[[ line: 760 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var120 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var121, var122 = protoModule.writeTag(buff, var120, 1, protoModule.wireTypes.lengthDelimited)
		var121, var122 = protoModule.writeString(var121, var122, self.field)
		buff = var121
		var120 = var122
	end
	local buff_1 = buffer.create(var120)
	buffer.copy(buff_1, 0, buff, 0, var120)
	
	return buff_1
end

function t_3.decode(p8) --[[ line: 774 ]]
	-- upvalues: t_3 (ref), protoModule (ref)
	local var124 = t_3.new()
	local var125 = 0
	while var125 < buffer.len(p8) do
		local _ = nil
		local var126 = nil
		local var127, var128, var129 = protoModule.readTag(p8, var125)
		local var130 = var127
		var126 = var128
		var125 = var129
		
		if var126 == protoModule.wireTypes.varint then
			local _ = nil
			local var131, var132 = protoModule.readVarInt(p8, var125)
			local _ = var131
			var125 = var132
			continue
		end
		if var126 == protoModule.wireTypes.lengthDelimited then
			if var130 == 1 then
				local _ = nil
				local var133, var134 = protoModule.readBuffer(p8, var125)
				var125 = var134
				var124.field = buffer.tostring(var133)
			else
				local _ = nil
				local var135, var136 = protoModule.readVarInt(p8, var125)
				var125 = var136 + var135
			end
		elseif var126 == protoModule.wireTypes.i32 then
			local _ = nil
			local var137, var138 = protoModule.readFixed32(p8, var125)
			local _ = var137
			var125 = var138
		elseif var126 == protoModule.wireTypes.i64 then
			local _ = nil
			local var139, var140 = protoModule.readFixed64(p8, var125)
			local _ = var139
			var125 = var140
		else
			error("Unsupported wire type: " .. var126)
		end
	end
	return var124
end

function t_3:jsonEncode() --[[ line: 817 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_3:jsonDecode() --[[ line: 827 ]]
	-- upvalues: t_3 (ref)
	local var142 = t_3.new()
	
	if self.field ~= nil then
		var142.field = self.field
	end
	return var142
end

t_3.descriptor = {
	name = "IsNullCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNullCondition"
}
t.IsNullCondition = t_3
typeRegistryModule.default:register(t.IsNullCondition)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p9) --[[ line: 851 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		field = if p9 == nil or p9.field == nil then "" else p9.field
	}, t_4)
end

function t_4:encode() --[[ line: 857 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var144 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var145, var146 = protoModule.writeTag(buff, var144, 1, protoModule.wireTypes.lengthDelimited)
		var145, var146 = protoModule.writeString(var145, var146, self.field)
		buff = var145
		var144 = var146
	end
	local buff_1 = buffer.create(var144)
	buffer.copy(buff_1, 0, buff, 0, var144)
	
	return buff_1
end

function t_4.decode(p10) --[[ line: 871 ]]
	-- upvalues: t_4 (ref), protoModule (ref)
	local var148 = t_4.new()
	local var149 = 0
	while var149 < buffer.len(p10) do
		local _ = nil
		local var150 = nil
		local var151, var152, var153 = protoModule.readTag(p10, var149)
		local var154 = var151
		var150 = var152
		var149 = var153
		
		if var150 == protoModule.wireTypes.varint then
			local _ = nil
			local var155, var156 = protoModule.readVarInt(p10, var149)
			local _ = var155
			var149 = var156
			continue
		end
		if var150 == protoModule.wireTypes.lengthDelimited then
			if var154 == 1 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p10, var149)
				var149 = var158
				var148.field = buffer.tostring(var157)
			else
				local _ = nil
				local var159, var160 = protoModule.readVarInt(p10, var149)
				var149 = var160 + var159
			end
		elseif var150 == protoModule.wireTypes.i32 then
			local _ = nil
			local var161, var162 = protoModule.readFixed32(p10, var149)
			local _ = var161
			var149 = var162
		elseif var150 == protoModule.wireTypes.i64 then
			local _ = nil
			local var163, var164 = protoModule.readFixed64(p10, var149)
			local _ = var163
			var149 = var164
		else
			error("Unsupported wire type: " .. var150)
		end
	end
	return var148
end

function t_4:jsonEncode() --[[ line: 914 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_4:jsonDecode() --[[ line: 924 ]]
	-- upvalues: t_4 (ref)
	local var166 = t_4.new()
	
	if self.field ~= nil then
		var166.field = self.field
	end
	return var166
end

t_4.descriptor = {
	name = "IsNotNullCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNotNullCondition"
}
t.IsNotNullCondition = t_4
typeRegistryModule.default:register(t.IsNotNullCondition)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p11) --[[ line: 948 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		field = if p11 == nil or p11.field == nil then "" else p11.field
	}, t_5)
end

function t_5:encode() --[[ line: 954 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var168 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var169, var170 = protoModule.writeTag(buff, var168, 1, protoModule.wireTypes.lengthDelimited)
		var169, var170 = protoModule.writeString(var169, var170, self.field)
		buff = var169
		var168 = var170
	end
	local buff_1 = buffer.create(var168)
	buffer.copy(buff_1, 0, buff, 0, var168)
	
	return buff_1
end

function t_5.decode(p12) --[[ line: 968 ]]
	-- upvalues: t_5 (ref), protoModule (ref)
	local var172 = t_5.new()
	local var173 = 0
	while var173 < buffer.len(p12) do
		local _ = nil
		local var174 = nil
		local var175, var176, var177 = protoModule.readTag(p12, var173)
		local var178 = var175
		var174 = var176
		var173 = var177
		
		if var174 == protoModule.wireTypes.varint then
			local _ = nil
			local var179, var180 = protoModule.readVarInt(p12, var173)
			local _ = var179
			var173 = var180
			continue
		end
		if var174 == protoModule.wireTypes.lengthDelimited then
			if var178 == 1 then
				local _ = nil
				local var181, var182 = protoModule.readBuffer(p12, var173)
				var173 = var182
				var172.field = buffer.tostring(var181)
			else
				local _ = nil
				local var183, var184 = protoModule.readVarInt(p12, var173)
				var173 = var184 + var183
			end
		elseif var174 == protoModule.wireTypes.i32 then
			local _ = nil
			local var185, var186 = protoModule.readFixed32(p12, var173)
			local _ = var185
			var173 = var186
		elseif var174 == protoModule.wireTypes.i64 then
			local _ = nil
			local var187, var188 = protoModule.readFixed64(p12, var173)
			local _ = var187
			var173 = var188
		else
			error("Unsupported wire type: " .. var174)
		end
	end
	return var172
end

function t_5:jsonEncode() --[[ line: 1011 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_5:jsonDecode() --[[ line: 1021 ]]
	-- upvalues: t_5 (ref)
	local var190 = t_5.new()
	
	if self.field ~= nil then
		var190.field = self.field
	end
	return var190
end

t_5.descriptor = {
	name = "IsEmptyCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsEmptyCondition"
}
t.IsEmptyCondition = t_5
typeRegistryModule.default:register(t.IsEmptyCondition)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p13) --[[ line: 1045 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		field = if p13 == nil or p13.field == nil then "" else p13.field
	}, t_6)
end

function t_6:encode() --[[ line: 1051 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var192 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var193, var194 = protoModule.writeTag(buff, var192, 1, protoModule.wireTypes.lengthDelimited)
		var193, var194 = protoModule.writeString(var193, var194, self.field)
		buff = var193
		var192 = var194
	end
	local buff_1 = buffer.create(var192)
	buffer.copy(buff_1, 0, buff, 0, var192)
	
	return buff_1
end

function t_6.decode(p14) --[[ line: 1065 ]]
	-- upvalues: t_6 (ref), protoModule (ref)
	local var196 = t_6.new()
	local var197 = 0
	while var197 < buffer.len(p14) do
		local _ = nil
		local var198 = nil
		local var199, var200, var201 = protoModule.readTag(p14, var197)
		local var202 = var199
		var198 = var200
		var197 = var201
		
		if var198 == protoModule.wireTypes.varint then
			local _ = nil
			local var203, var204 = protoModule.readVarInt(p14, var197)
			local _ = var203
			var197 = var204
			continue
		end
		if var198 == protoModule.wireTypes.lengthDelimited then
			if var202 == 1 then
				local _ = nil
				local var205, var206 = protoModule.readBuffer(p14, var197)
				var197 = var206
				var196.field = buffer.tostring(var205)
			else
				local _ = nil
				local var207, var208 = protoModule.readVarInt(p14, var197)
				var197 = var208 + var207
			end
		elseif var198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var209, var210 = protoModule.readFixed32(p14, var197)
			local _ = var209
			var197 = var210
		elseif var198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var211, var212 = protoModule.readFixed64(p14, var197)
			local _ = var211
			var197 = var212
		else
			error("Unsupported wire type: " .. var198)
		end
	end
	return var196
end

function t_6:jsonEncode() --[[ line: 1108 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_6:jsonDecode() --[[ line: 1118 ]]
	-- upvalues: t_6 (ref)
	local var214 = t_6.new()
	
	if self.field ~= nil then
		var214.field = self.field
	end
	return var214
end

t_6.descriptor = {
	name = "IsNotEmptyCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNotEmptyCondition"
}
t.IsNotEmptyCondition = t_6
typeRegistryModule.default:register(t.IsNotEmptyCondition)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p15) --[[ line: 1142 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		conditions = if p15 == nil or p15.conditions == nil then {} else p15.conditions
	}, t_7)
end

function t_7:encode() --[[ line: 1148 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var216 = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for i, v in self.conditions do
			local var217 = v:encode()
			local var218, var219 = protoModule.writeTag(buff, var216, 1, protoModule.wireTypes.lengthDelimited)
			var218, var219 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var216 = var219
		end
	end
	local buff_1 = buffer.create(var216)
	buffer.copy(buff_1, 0, buff, 0, var216)
	
	return buff_1
end

function t_7.decode(p16) --[[ line: 1165 ]]
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var221 = t_7.new()
	local var222 = 0
	while var222 < buffer.len(p16) do
		local _ = nil
		local var223 = nil
		local var224, var225, var226 = protoModule.readTag(p16, var222)
		local var227 = var224
		var223 = var225
		var222 = var226
		
		if var223 == protoModule.wireTypes.varint then
			local _ = nil
			local var228, var229 = protoModule.readVarInt(p16, var222)
			local _ = var228
			var222 = var229
			continue
		end
		if var223 == protoModule.wireTypes.lengthDelimited then
			if var227 == 1 then
				local _ = nil
				local var230, var231 = protoModule.readBuffer(p16, var222)
				var222 = var231
				table.insert(var221.conditions, t.PropCondition.decode(var230))
			else
				local _ = nil
				local var232, var233 = protoModule.readVarInt(p16, var222)
				var222 = var233 + var232
			end
		elseif var223 == protoModule.wireTypes.i32 then
			local _ = nil
			local var234, var235 = protoModule.readFixed32(p16, var222)
			local _ = var234
			var222 = var235
		elseif var223 == protoModule.wireTypes.i64 then
			local _ = nil
			local var236, var237 = protoModule.readFixed64(p16, var222)
			local _ = var236
			var222 = var237
		else
			error("Unsupported wire type: " .. var223)
		end
	end
	return var221
end

function t_7:jsonEncode() --[[ line: 1208 ]]
	local t = {}
	
	if self.conditions ~= nil and #self.conditions > 0 then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, v:jsonEncode())
		end
		t.conditions = t_1
	end
	return t
end

function t_7:jsonDecode() --[[ line: 1222 ]]
	-- upvalues: t_7 (ref), t (ref)
	local var240 = t_7.new()
	
	if self.conditions ~= nil then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, t.PropCondition.jsonDecode(v))
		end
		var240.conditions = t_1
	end
	return var240
end

t_7.descriptor = {
	name = "AndCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.AndCondition"
}
t.AndCondition = t_7
typeRegistryModule.default:register(t.AndCondition)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p17) --[[ line: 1251 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		conditions = if p17 == nil or p17.conditions == nil then {} else p17.conditions
	}, t_8)
end

function t_8:encode() --[[ line: 1257 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var243 = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for i, v in self.conditions do
			local var244 = v:encode()
			local var245, var246 = protoModule.writeTag(buff, var243, 1, protoModule.wireTypes.lengthDelimited)
			var245, var246 = protoModule.writeBuffer(var245, var246, var244, buffer.len(var244))
			buff = var245
			var243 = var246
		end
	end
	local buff_1 = buffer.create(var243)
	buffer.copy(buff_1, 0, buff, 0, var243)
	
	return buff_1
end

function t_8.decode(p18) --[[ line: 1274 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var248 = t_8.new()
	local var249 = 0
	while var249 < buffer.len(p18) do
		local _ = nil
		local var250 = nil
		local var251, var252, var253 = protoModule.readTag(p18, var249)
		local var254 = var251
		var250 = var252
		var249 = var253
		
		if var250 == protoModule.wireTypes.varint then
			local _ = nil
			local var255, var256 = protoModule.readVarInt(p18, var249)
			local _ = var255
			var249 = var256
			continue
		end
		if var250 == protoModule.wireTypes.lengthDelimited then
			if var254 == 1 then
				local _ = nil
				local var257, var258 = protoModule.readBuffer(p18, var249)
				var249 = var258
				table.insert(var248.conditions, t.PropCondition.decode(var257))
			else
				local _ = nil
				local var259, var260 = protoModule.readVarInt(p18, var249)
				var249 = var260 + var259
			end
		elseif var250 == protoModule.wireTypes.i32 then
			local _ = nil
			local var261, var262 = protoModule.readFixed32(p18, var249)
			local _ = var261
			var249 = var262
		elseif var250 == protoModule.wireTypes.i64 then
			local _ = nil
			local var263, var264 = protoModule.readFixed64(p18, var249)
			local _ = var263
			var249 = var264
		else
			error("Unsupported wire type: " .. var250)
		end
	end
	return var248
end

function t_8:jsonEncode() --[[ line: 1317 ]]
	local t = {}
	
	if self.conditions ~= nil and #self.conditions > 0 then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, v:jsonEncode())
		end
		t.conditions = t_1
	end
	return t
end

function t_8:jsonDecode() --[[ line: 1331 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var267 = t_8.new()
	
	if self.conditions ~= nil then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, t.PropCondition.jsonDecode(v))
		end
		var267.conditions = t_1
	end
	return var267
end

t_8.descriptor = {
	name = "OrCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.OrCondition"
}
t.OrCondition = t_8
typeRegistryModule.default:register(t.OrCondition)

return {
	PropCondition = t.PropCondition,
	ComparisonCondition = t.ComparisonCondition,
	ComparisonCondition_Op = t.ComparisonCondition_Op,
	IsNullCondition = t.IsNullCondition,
	IsNotNullCondition = t.IsNotNullCondition,
	IsEmptyCondition = t.IsEmptyCondition,
	IsNotEmptyCondition = t.IsNotEmptyCondition,
	AndCondition = t.AndCondition,
	OrCondition = t.OrCondition
}