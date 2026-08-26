local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "comparison" then
			local var2 = self.kind.value:encode()
			local var3, var4 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
			var3, var15 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "is_null" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var18 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.kind.type == "is_not_null" then
			local var8 = self.kind.value:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var9, var21 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		elseif self.kind.type == "and_condition" then
			local var11 = self.kind.value:encode()
			local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var12, var24 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
			buff = var12
			var1 = var13
		elseif self.kind.type == "or_condition" then
			local var14 = self.kind.value:encode()
			local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var15, var27 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
			buff = var15
			var1 = var16
		elseif self.kind.type == "is_empty" then
			local var17 = self.kind.value:encode()
			local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var18, var30 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
			buff = var18
			var1 = var19
		elseif self.kind.type == "is_not_empty" then
			local var20 = self.kind.value:encode()
			local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var21, var33 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
			buff = var21
			var1 = var22
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
				var1.kind = {
					type = "comparison",
					value = t.ComparisonCondition.decode(var10)
				}
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.kind = {
					type = "is_null",
					value = t.IsNullCondition.decode(var12)
				}
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.kind = {
					type = "is_not_null",
					value = t.IsNotNullCondition.decode(var14)
				}
			elseif var7 == 4 then
				local _ = nil
				local var16, var17 = protoModule.readBuffer(p1, var2)
				var2 = var17
				var1.kind = {
					type = "and_condition",
					value = t.AndCondition.decode(var16)
				}
			elseif var7 == 5 then
				local _ = nil
				local var18, var19 = protoModule.readBuffer(p1, var2)
				var2 = var19
				var1.kind = {
					type = "or_condition",
					value = t.OrCondition.decode(var18)
				}
			elseif var7 == 6 then
				local _ = nil
				local var20, var21 = protoModule.readBuffer(p1, var2)
				var2 = var21
				var1.kind = {
					type = "is_empty",
					value = t.IsEmptyCondition.decode(var20)
				}
			elseif var7 == 7 then
				local _ = nil
				local var22, var23 = protoModule.readBuffer(p1, var2)
				var2 = var23
				var1.kind = {
					type = "is_not_empty",
					value = t.IsNotEmptyCondition.decode(var22)
				}
			else
				local _ = nil
				local var24, var25 = protoModule.readVarInt(p1, var2)
				var2 = var25 + var24
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var26, var27 = protoModule.readFixed32(p1, var2)
			local _ = var26
			var2 = var27
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var28, var29 = protoModule.readFixed64(p1, var2)
			local _ = var28
			var2 = var29
		else
			error("Unsupported wire type: " .. var37)
		end
	end
	return var1
end

function t_1:jsonEncode()
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

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var30 = t_1.new()
	
	if self.comparison ~= nil then
		var30.kind = {
			type = "comparison",
			value = t.ComparisonCondition.jsonDecode(self.comparison)
		}
	end
	if self.is_null ~= nil then
		var30.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.is_null)
		}
	end
	if self.isNull ~= nil then
		var30.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.isNull)
		}
	end
	if self.is_not_null ~= nil then
		var30.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.is_not_null)
		}
	end
	if self.isNotNull ~= nil then
		var30.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.isNotNull)
		}
	end
	if self.and_condition ~= nil then
		var30.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.and_condition)
		}
	end
	if self.andCondition ~= nil then
		var30.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.andCondition)
		}
	end
	if self.or_condition ~= nil then
		var30.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.or_condition)
		}
	end
	if self.orCondition ~= nil then
		var30.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.orCondition)
		}
	end
	if self.is_empty ~= nil then
		var30.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.is_empty)
		}
	end
	if self.isEmpty ~= nil then
		var30.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.isEmpty)
		}
	end
	if self.is_not_empty ~= nil then
		var30.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.is_not_empty)
		}
	end
	if self.isNotEmpty ~= nil then
		var30.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.isNotEmpty)
		}
	end
	return var30
end

t_1.descriptor = {
	name = "PropCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.PropCondition"
}
t.PropCondition = t_1
typeRegistryModule.default:register(t.PropCondition)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t (ref), t_2 (ref)
	return setmetatable({
		field = if p2 == nil or p2.field == nil then "" else p2.field,
		op = if p2 == nil or p2.op == nil then assert(t.ComparisonCondition_Op.fromNumber(0), "Enum has no 0 default") else p2.op,
		kind = if p2 == nil or p2.kind == nil then nil else p2.kind
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var30 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var31, var32 = protoModule.writeTag(buff, var30, 1, protoModule.wireTypes.lengthDelimited)
		var31, var69 = protoModule.writeString(var31, var32, self.field)
		buff = var31
		var30 = var32
	end
	if self.op ~= nil and (self.op ~= nil and self.op ~= 0 or self.op ~= t.ComparisonCondition_Op.fromNumber(0)) then
		local var33, var34 = protoModule.writeTag(buff, var30, 2, protoModule.wireTypes.varint)
		var33, var71 = protoModule.writeVarInt(var33, var34, t.ComparisonCondition_Op.toNumber(self.op))
		buff = var33
		var30 = var34
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			local var35, var36 = protoModule.writeTag(buff, var30, 3, protoModule.wireTypes.lengthDelimited)
			var35, var73 = protoModule.writeString(var35, var36, self.kind.value)
			buff = var35
			var30 = var36
		elseif self.kind.type == "bool_value" then
			local var37, var38 = protoModule.writeTag(buff, var30, 4, protoModule.wireTypes.varint)
			var37, var75 = protoModule.writeVarInt(var37, var38, if self.kind.value then 1 else 0)
			buff = var37
			var30 = var38
		elseif self.kind.type == "int32_value" then
			local var39, var40 = protoModule.writeTag(buff, var30, 5, protoModule.wireTypes.varint)
			var39, var77 = protoModule.writeVarInt(var39, var40, self.kind.value)
			buff = var39
			var30 = var40
		elseif self.kind.type == "int64_value" then
			local var41, var42 = protoModule.writeTag(buff, var30, 6, protoModule.wireTypes.varint)
			var41, var79 = protoModule.writeVarInt(var41, var42, self.kind.value)
			buff = var41
			var30 = var42
		elseif self.kind.type == "float_value" then
			local var43, var44 = protoModule.writeTag(buff, var30, 7, protoModule.wireTypes.i32)
			var43, var81 = protoModule.writeFloat(var43, var44, self.kind.value)
			buff = var43
			var30 = var44
		elseif self.kind.type == "double_value" then
			local var45, var46 = protoModule.writeTag(buff, var30, 8, protoModule.wireTypes.i64)
			var45, var83 = protoModule.writeDouble(var45, var46, self.kind.value)
			buff = var45
			var30 = var46
		end
	end
	local buff_1 = buffer.create(var30)
	buffer.copy(buff_1, 0, buff, 0, var30)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var30 = t_2.new()
	local var31 = 0
	while var31 < buffer.len(p2) do
		local _ = nil
		local var32 = nil
		local var33, var34, var35 = protoModule.readTag(p2, var31)
		local var36 = var33
		var32 = var34
		var31 = var35
		
		if var32 == protoModule.wireTypes.varint then
			if var36 == 2 then
				local _ = nil
				local var37, var38 = protoModule.readVarIntI32(p2, var31)
				local var39 = var37
				var31 = var38
				var30.op = t.ComparisonCondition_Op.fromNumber(var39) or var39
			elseif var36 == 4 then
				local _ = nil
				local var40, var41 = protoModule.readVarInt(p2, var31)
				var31 = var41
				var30.kind = { type = "bool_value", value = var40 ~= 0 }
			elseif var36 == 5 then
				local _ = nil
				local var42, var43 = protoModule.readVarIntI32(p2, var31)
				var31 = var43
				var30.kind = { type = "int32_value", value = var42 }
			elseif var36 == 6 then
				local _ = nil
				local var44, var45 = protoModule.readVarIntI64(p2, var31)
				var31 = var45
				var30.kind = { type = "int64_value", value = var44 }
			else
				local _ = nil
				local var46, var47 = protoModule.readVarInt(p2, var31)
				local _ = var46
				var31 = var47
			end
		end
		if var32 == protoModule.wireTypes.lengthDelimited then
			if var36 == 1 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p2, var31)
				var31 = var49
				var30.field = buffer.tostring(var48)
			elseif var36 == 3 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p2, var31)
				var31 = var51
				var30.kind = { type = "string_value", value = buffer.tostring(var50) }
			else
				local _ = nil
				local var52, var53 = protoModule.readVarInt(p2, var31)
				var31 = var53 + var52
			end
		elseif var32 == protoModule.wireTypes.i32 then
			if var36 == 7 then
				local _ = nil
				local var54, var55 = protoModule.readFloat(p2, var31)
				var31 = var55
				var30.kind = { type = "float_value", value = var54 }
			else
				local _ = nil
				local var56, var57 = protoModule.readFixed32(p2, var31)
				local _ = var56
				var31 = var57
			end
		elseif var32 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var87)
		elseif var36 == 8 then
			local _ = nil
			local var58, var59 = protoModule.readDouble(p2, var31)
			var31 = var59
			var30.kind = { type = "double_value", value = var58 }
		else
			local _ = nil
			local var60, var61 = protoModule.readFixed64(p2, var31)
			local _ = var60
			var31 = var61
		end
	end
	return var30
end

function t_2:jsonEncode()
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

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref), protoModule (ref)
	local var62 = t_2.new()
	
	if self.field ~= nil then
		var62.field = self.field
	end
	if self.op ~= nil then
		var62.op = if typeof(self.op) == "number" then t.ComparisonCondition_Op.fromNumber(self.op) or self.op else t.ComparisonCondition_Op.fromName(self.op) or self.op
	end
	if self.string_value ~= nil then
		var62.kind = { type = "string_value", value = self.string_value }
	end
	if self.stringValue ~= nil then
		var62.kind = { type = "string_value", value = self.stringValue }
	end
	if self.bool_value ~= nil then
		var62.kind = { type = "bool_value", value = self.bool_value }
	end
	if self.boolValue ~= nil then
		var62.kind = { type = "bool_value", value = self.boolValue }
	end
	if self.int32_value ~= nil then
		var62.kind = { type = "int32_value", value = self.int32_value }
	end
	if self.int32Value ~= nil then
		var62.kind = { type = "int32_value", value = self.int32Value }
	end
	if self.int64_value ~= nil then
		var62.kind = { type = "int64_value", value = self.int64_value }
	end
	if self.int64Value ~= nil then
		var62.kind = { type = "int64_value", value = self.int64Value }
	end
	if self.float_value ~= nil then
		var62.kind = {
			type = "float_value",
			value = protoModule.json.deserializeNumber(self.float_value)
		}
	end
	if self.floatValue ~= nil then
		var62.kind = {
			type = "float_value",
			value = protoModule.json.deserializeNumber(self.floatValue)
		}
	end
	if self.double_value ~= nil then
		var62.kind = {
			type = "double_value",
			value = protoModule.json.deserializeNumber(self.double_value)
		}
	end
	if self.doubleValue ~= nil then
		var62.kind = {
			type = "double_value",
			value = protoModule.json.deserializeNumber(self.doubleValue)
		}
	end
	return var62
end

t_2.descriptor = {
	name = "ComparisonCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.ComparisonCondition"
}
t.ComparisonCondition = t_2
typeRegistryModule.default:register(t.ComparisonCondition)
t.ComparisonCondition_Op = {
	fromNumber = function(p3)
		return if p3 == 0 then "OP_INVALID" elseif p3 == 1 then "OP_LT" elseif p3 == 2 then "OP_LTE" elseif p3 == 3 then "OP_GT" elseif p3 == 4 then "OP_GTE" elseif p3 == 5 then "OP_E" elseif p3 == 6 then "OP_NE" else nil
	end,
	toNumber = function(p3)
		return if p3 == "OP_INVALID" then 0 elseif p3 == "OP_LT" then 1 elseif p3 == "OP_LTE" then 2 elseif p3 == "OP_GT" then 3 elseif p3 == "OP_GTE" then 4 elseif p3 == "OP_E" then 5 elseif p3 == "OP_NE" then 6 else p3
	end,
	fromName = function(p3)
		return if p3 == "OP_INVALID" then "OP_INVALID" elseif p3 == "OP_LT" then "OP_LT" elseif p3 == "OP_LTE" then "OP_LTE" elseif p3 == "OP_GT" then "OP_GT" elseif p3 == "OP_GTE" then "OP_GTE" elseif p3 == "OP_E" then "OP_E" elseif p3 == "OP_NE" then "OP_NE" else nil
	end
}
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		field = if p3 == nil or p3.field == nil then "" else p3.field
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var62 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var63, var64 = protoModule.writeTag(buff, var62, 1, protoModule.wireTypes.lengthDelimited)
		var63, var122 = protoModule.writeString(var63, var64, self.field)
		buff = var63
		var62 = var64
	end
	local buff_1 = buffer.create(var62)
	buffer.copy(buff_1, 0, buff, 0, var62)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var62 = t_3.new()
	local var63 = 0
	while var63 < buffer.len(p3) do
		local _ = nil
		local var64 = nil
		local var65, var66, var67 = protoModule.readTag(p3, var63)
		local var68 = var65
		var64 = var66
		var63 = var67
		
		if var64 == protoModule.wireTypes.varint then
			local _ = nil
			local var69, var70 = protoModule.readVarInt(p3, var63)
			local _ = var69
			var63 = var70
			continue
		end
		if var64 == protoModule.wireTypes.lengthDelimited then
			if var68 == 1 then
				local _ = nil
				local var71, var72 = protoModule.readBuffer(p3, var63)
				var63 = var72
				var62.field = buffer.tostring(var71)
			else
				local _ = nil
				local var73, var74 = protoModule.readVarInt(p3, var63)
				var63 = var74 + var73
			end
		elseif var64 == protoModule.wireTypes.i32 then
			local _ = nil
			local var75, var76 = protoModule.readFixed32(p3, var63)
			local _ = var75
			var63 = var76
		elseif var64 == protoModule.wireTypes.i64 then
			local _ = nil
			local var77, var78 = protoModule.readFixed64(p3, var63)
			local _ = var77
			var63 = var78
		else
			error("Unsupported wire type: " .. var126)
		end
	end
	return var62
end

function t_3:jsonEncode()
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref)
	local var79 = t_3.new()
	
	if self.field ~= nil then
		var79.field = self.field
	end
	return var79
end

t_3.descriptor = {
	name = "IsNullCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNullCondition"
}
t.IsNullCondition = t_3
typeRegistryModule.default:register(t.IsNullCondition)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t_4 (ref)
	return setmetatable({
		field = if p4 == nil or p4.field == nil then "" else p4.field
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var79 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var80, var81 = protoModule.writeTag(buff, var79, 1, protoModule.wireTypes.lengthDelimited)
		var80, var146 = protoModule.writeString(var80, var81, self.field)
		buff = var80
		var79 = var81
	end
	local buff_1 = buffer.create(var79)
	buffer.copy(buff_1, 0, buff, 0, var79)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var79 = t_4.new()
	local var80 = 0
	while var80 < buffer.len(p4) do
		local _ = nil
		local var81 = nil
		local var82, var83, var84 = protoModule.readTag(p4, var80)
		local var85 = var82
		var81 = var83
		var80 = var84
		
		if var81 == protoModule.wireTypes.varint then
			local _ = nil
			local var86, var87 = protoModule.readVarInt(p4, var80)
			local _ = var86
			var80 = var87
			continue
		end
		if var81 == protoModule.wireTypes.lengthDelimited then
			if var85 == 1 then
				local _ = nil
				local var88, var89 = protoModule.readBuffer(p4, var80)
				var80 = var89
				var79.field = buffer.tostring(var88)
			else
				local _ = nil
				local var90, var91 = protoModule.readVarInt(p4, var80)
				var80 = var91 + var90
			end
		elseif var81 == protoModule.wireTypes.i32 then
			local _ = nil
			local var92, var93 = protoModule.readFixed32(p4, var80)
			local _ = var92
			var80 = var93
		elseif var81 == protoModule.wireTypes.i64 then
			local _ = nil
			local var94, var95 = protoModule.readFixed64(p4, var80)
			local _ = var94
			var80 = var95
		else
			error("Unsupported wire type: " .. var150)
		end
	end
	return var79
end

function t_4:jsonEncode()
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref)
	local var96 = t_4.new()
	
	if self.field ~= nil then
		var96.field = self.field
	end
	return var96
end

t_4.descriptor = {
	name = "IsNotNullCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNotNullCondition"
}
t.IsNotNullCondition = t_4
typeRegistryModule.default:register(t.IsNotNullCondition)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		field = if p5 == nil or p5.field == nil then "" else p5.field
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var96 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var97, var98 = protoModule.writeTag(buff, var96, 1, protoModule.wireTypes.lengthDelimited)
		var97, var170 = protoModule.writeString(var97, var98, self.field)
		buff = var97
		var96 = var98
	end
	local buff_1 = buffer.create(var96)
	buffer.copy(buff_1, 0, buff, 0, var96)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var96 = t_5.new()
	local var97 = 0
	while var97 < buffer.len(p5) do
		local _ = nil
		local var98 = nil
		local var99, var100, var101 = protoModule.readTag(p5, var97)
		local var102 = var99
		var98 = var100
		var97 = var101
		
		if var98 == protoModule.wireTypes.varint then
			local _ = nil
			local var103, var104 = protoModule.readVarInt(p5, var97)
			local _ = var103
			var97 = var104
			continue
		end
		if var98 == protoModule.wireTypes.lengthDelimited then
			if var102 == 1 then
				local _ = nil
				local var105, var106 = protoModule.readBuffer(p5, var97)
				var97 = var106
				var96.field = buffer.tostring(var105)
			else
				local _ = nil
				local var107, var108 = protoModule.readVarInt(p5, var97)
				var97 = var108 + var107
			end
		elseif var98 == protoModule.wireTypes.i32 then
			local _ = nil
			local var109, var110 = protoModule.readFixed32(p5, var97)
			local _ = var109
			var97 = var110
		elseif var98 == protoModule.wireTypes.i64 then
			local _ = nil
			local var111, var112 = protoModule.readFixed64(p5, var97)
			local _ = var111
			var97 = var112
		else
			error("Unsupported wire type: " .. var174)
		end
	end
	return var96
end

function t_5:jsonEncode()
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var113 = t_5.new()
	
	if self.field ~= nil then
		var113.field = self.field
	end
	return var113
end

t_5.descriptor = {
	name = "IsEmptyCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsEmptyCondition"
}
t.IsEmptyCondition = t_5
typeRegistryModule.default:register(t.IsEmptyCondition)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		field = if p6 == nil or p6.field == nil then "" else p6.field
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var113 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var114, var115 = protoModule.writeTag(buff, var113, 1, protoModule.wireTypes.lengthDelimited)
		var114, var194 = protoModule.writeString(var114, var115, self.field)
		buff = var114
		var113 = var115
	end
	local buff_1 = buffer.create(var113)
	buffer.copy(buff_1, 0, buff, 0, var113)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var113 = t_6.new()
	local var114 = 0
	while var114 < buffer.len(p6) do
		local _ = nil
		local var115 = nil
		local var116, var117, var118 = protoModule.readTag(p6, var114)
		local var119 = var116
		var115 = var117
		var114 = var118
		
		if var115 == protoModule.wireTypes.varint then
			local _ = nil
			local var120, var121 = protoModule.readVarInt(p6, var114)
			local _ = var120
			var114 = var121
			continue
		end
		if var115 == protoModule.wireTypes.lengthDelimited then
			if var119 == 1 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p6, var114)
				var114 = var123
				var113.field = buffer.tostring(var122)
			else
				local _ = nil
				local var124, var125 = protoModule.readVarInt(p6, var114)
				var114 = var125 + var124
			end
		elseif var115 == protoModule.wireTypes.i32 then
			local _ = nil
			local var126, var127 = protoModule.readFixed32(p6, var114)
			local _ = var126
			var114 = var127
		elseif var115 == protoModule.wireTypes.i64 then
			local _ = nil
			local var128, var129 = protoModule.readFixed64(p6, var114)
			local _ = var128
			var114 = var129
		else
			error("Unsupported wire type: " .. var198)
		end
	end
	return var113
end

function t_6:jsonEncode()
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref)
	local var130 = t_6.new()
	
	if self.field ~= nil then
		var130.field = self.field
	end
	return var130
end

t_6.descriptor = {
	name = "IsNotEmptyCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNotEmptyCondition"
}
t.IsNotEmptyCondition = t_6
typeRegistryModule.default:register(t.IsNotEmptyCondition)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		conditions = if p7 == nil or p7.conditions == nil then {} else p7.conditions
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var130 = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for i, v in self.conditions do
			local var131 = v:encode()
			local var132, var133 = protoModule.writeTag(buff, var130, 1, protoModule.wireTypes.lengthDelimited)
			var132, var219 = protoModule.writeBuffer(var132, var133, var131, buffer.len(var131))
			buff = var132
			var130 = var133
		end
	end
	local buff_1 = buffer.create(var130)
	buffer.copy(buff_1, 0, buff, 0, var130)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var134 = t_7.new()
	local var135 = 0
	while var135 < buffer.len(p7) do
		local _ = nil
		local var136 = nil
		local var137, var138, var139 = protoModule.readTag(p7, var135)
		local var140 = var137
		var136 = var138
		var135 = var139
		
		if var136 == protoModule.wireTypes.varint then
			local _ = nil
			local var141, var142 = protoModule.readVarInt(p7, var135)
			local _ = var141
			var135 = var142
			continue
		end
		if var136 == protoModule.wireTypes.lengthDelimited then
			if var140 == 1 then
				local _ = nil
				local var143, var144 = protoModule.readBuffer(p7, var135)
				var135 = var144
				table.insert(var134.conditions, t.PropCondition.decode(var143))
			else
				local _ = nil
				local var145, var146 = protoModule.readVarInt(p7, var135)
				var135 = var146 + var145
			end
		elseif var136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var147, var148 = protoModule.readFixed32(p7, var135)
			local _ = var147
			var135 = var148
		elseif var136 == protoModule.wireTypes.i64 then
			local _ = nil
			local var149, var150 = protoModule.readFixed64(p7, var135)
			local _ = var149
			var135 = var150
		else
			error("Unsupported wire type: " .. var223)
		end
	end
	return var134
end

function t_7:jsonEncode()
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

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), t (ref)
	local var151 = t_7.new()
	
	if self.conditions ~= nil then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, t.PropCondition.jsonDecode(v))
		end
		var151.conditions = t_1
	end
	return var151
end

t_7.descriptor = {
	name = "AndCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.AndCondition"
}
t.AndCondition = t_7
typeRegistryModule.default:register(t.AndCondition)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		conditions = if p8 == nil or p8.conditions == nil then {} else p8.conditions
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var152 = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for i, v in self.conditions do
			local var153 = v:encode()
			local var154, var155 = protoModule.writeTag(buff, var152, 1, protoModule.wireTypes.lengthDelimited)
			var154, var246 = protoModule.writeBuffer(var154, var155, var153, buffer.len(var153))
			buff = var154
			var152 = var155
		end
	end
	local buff_1 = buffer.create(var152)
	buffer.copy(buff_1, 0, buff, 0, var152)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var156 = t_8.new()
	local var157 = 0
	while var157 < buffer.len(p8) do
		local _ = nil
		local var158 = nil
		local var159, var160, var161 = protoModule.readTag(p8, var157)
		local var162 = var159
		var158 = var160
		var157 = var161
		
		if var158 == protoModule.wireTypes.varint then
			local _ = nil
			local var163, var164 = protoModule.readVarInt(p8, var157)
			local _ = var163
			var157 = var164
			continue
		end
		if var158 == protoModule.wireTypes.lengthDelimited then
			if var162 == 1 then
				local _ = nil
				local var165, var166 = protoModule.readBuffer(p8, var157)
				var157 = var166
				table.insert(var156.conditions, t.PropCondition.decode(var165))
			else
				local _ = nil
				local var167, var168 = protoModule.readVarInt(p8, var157)
				var157 = var168 + var167
			end
		elseif var158 == protoModule.wireTypes.i32 then
			local _ = nil
			local var169, var170 = protoModule.readFixed32(p8, var157)
			local _ = var169
			var157 = var170
		elseif var158 == protoModule.wireTypes.i64 then
			local _ = nil
			local var171, var172 = protoModule.readFixed64(p8, var157)
			local _ = var171
			var157 = var172
		else
			error("Unsupported wire type: " .. var250)
		end
	end
	return var156
end

function t_8:jsonEncode()
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

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var173 = t_8.new()
	
	if self.conditions ~= nil then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, t.PropCondition.jsonDecode(v))
		end
		var173.conditions = t_1
	end
	return var173
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