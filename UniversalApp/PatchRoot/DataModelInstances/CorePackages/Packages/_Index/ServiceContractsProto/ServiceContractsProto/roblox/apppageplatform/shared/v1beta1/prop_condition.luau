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
			var3, var16 = protoModule.writeBuffer(var3, var4, var2, buffer.len(var2))
			buff = var3
			var1 = var4
		elseif self.kind.type == "is_null" then
			local var5 = self.kind.value:encode()
			local var6, var7 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
			var6, var19 = protoModule.writeBuffer(var6, var7, var5, buffer.len(var5))
			buff = var6
			var1 = var7
		elseif self.kind.type == "is_not_null" then
			local var8 = self.kind.value:encode()
			local var9, var10 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
			var9, var22 = protoModule.writeBuffer(var9, var10, var8, buffer.len(var8))
			buff = var9
			var1 = var10
		elseif self.kind.type == "and_condition" then
			local var11 = self.kind.value:encode()
			local var12, var13 = protoModule.writeTag(buff, var1, 4, protoModule.wireTypes.lengthDelimited)
			var12, var25 = protoModule.writeBuffer(var12, var13, var11, buffer.len(var11))
			buff = var12
			var1 = var13
		elseif self.kind.type == "or_condition" then
			local var14 = self.kind.value:encode()
			local var15, var16 = protoModule.writeTag(buff, var1, 5, protoModule.wireTypes.lengthDelimited)
			var15, var28 = protoModule.writeBuffer(var15, var16, var14, buffer.len(var14))
			buff = var15
			var1 = var16
		elseif self.kind.type == "is_empty" then
			local var17 = self.kind.value:encode()
			local var18, var19 = protoModule.writeTag(buff, var1, 6, protoModule.wireTypes.lengthDelimited)
			var18, var31 = protoModule.writeBuffer(var18, var19, var17, buffer.len(var17))
			buff = var18
			var1 = var19
		elseif self.kind.type == "is_not_empty" then
			local var20 = self.kind.value:encode()
			local var21, var22 = protoModule.writeTag(buff, var1, 7, protoModule.wireTypes.lengthDelimited)
			var21, var34 = protoModule.writeBuffer(var21, var22, var20, buffer.len(var20))
			buff = var21
			var1 = var22
		elseif self.kind.type == "contains" then
			local var23 = self.kind.value:encode()
			local var24, var25 = protoModule.writeTag(buff, var1, 8, protoModule.wireTypes.lengthDelimited)
			var24, var37 = protoModule.writeBuffer(var24, var25, var23, buffer.len(var23))
			buff = var24
			var1 = var25
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
			elseif var7 == 8 then
				local _ = nil
				local var24, var25 = protoModule.readBuffer(p1, var2)
				var2 = var25
				var1.kind = {
					type = "contains",
					value = t.ContainsCondition.decode(var24)
				}
			else
				local _ = nil
				local var26, var27 = protoModule.readVarInt(p1, var2)
				var2 = var27 + var26
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var28, var29 = protoModule.readFixed32(p1, var2)
			local _ = var28
			var2 = var29
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var30, var31 = protoModule.readFixed64(p1, var2)
			local _ = var30
			var2 = var31
		else
			error("Unsupported wire type: " .. var41)
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
			
			return t
		elseif self.kind.type == "contains" then
			t.contains = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), t (ref)
	local var32 = t_1.new()
	
	if self.comparison ~= nil then
		var32.kind = {
			type = "comparison",
			value = t.ComparisonCondition.jsonDecode(self.comparison)
		}
	end
	if self.is_null ~= nil then
		var32.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.is_null)
		}
	end
	if self.isNull ~= nil then
		var32.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.isNull)
		}
	end
	if self.is_not_null ~= nil then
		var32.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.is_not_null)
		}
	end
	if self.isNotNull ~= nil then
		var32.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.isNotNull)
		}
	end
	if self.and_condition ~= nil then
		var32.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.and_condition)
		}
	end
	if self.andCondition ~= nil then
		var32.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.andCondition)
		}
	end
	if self.or_condition ~= nil then
		var32.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.or_condition)
		}
	end
	if self.orCondition ~= nil then
		var32.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.orCondition)
		}
	end
	if self.is_empty ~= nil then
		var32.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.is_empty)
		}
	end
	if self.isEmpty ~= nil then
		var32.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.isEmpty)
		}
	end
	if self.is_not_empty ~= nil then
		var32.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.is_not_empty)
		}
	end
	if self.isNotEmpty ~= nil then
		var32.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.isNotEmpty)
		}
	end
	if self.contains ~= nil then
		var32.kind = {
			type = "contains",
			value = t.ContainsCondition.jsonDecode(self.contains)
		}
	end
	return var32
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
	local var32 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var33, var34 = protoModule.writeTag(buff, var32, 1, protoModule.wireTypes.lengthDelimited)
		var33, var75 = protoModule.writeString(var33, var34, self.field)
		buff = var33
		var32 = var34
	end
	if self.op ~= nil and (self.op ~= nil and self.op ~= 0 or self.op ~= t.ComparisonCondition_Op.fromNumber(0)) then
		local var35, var36 = protoModule.writeTag(buff, var32, 2, protoModule.wireTypes.varint)
		var35, var77 = protoModule.writeVarInt(var35, var36, t.ComparisonCondition_Op.toNumber(self.op))
		buff = var35
		var32 = var36
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			local var37, var38 = protoModule.writeTag(buff, var32, 3, protoModule.wireTypes.lengthDelimited)
			var37, var79 = protoModule.writeString(var37, var38, self.kind.value)
			buff = var37
			var32 = var38
		elseif self.kind.type == "bool_value" then
			local var39, var40 = protoModule.writeTag(buff, var32, 4, protoModule.wireTypes.varint)
			var39, var81 = protoModule.writeVarInt(var39, var40, if self.kind.value then 1 else 0)
			buff = var39
			var32 = var40
		elseif self.kind.type == "int32_value" then
			local var41, var42 = protoModule.writeTag(buff, var32, 5, protoModule.wireTypes.varint)
			var41, var83 = protoModule.writeVarInt(var41, var42, self.kind.value)
			buff = var41
			var32 = var42
		elseif self.kind.type == "int64_value" then
			local var43, var44 = protoModule.writeTag(buff, var32, 6, protoModule.wireTypes.varint)
			var43, var85 = protoModule.writeVarInt(var43, var44, self.kind.value)
			buff = var43
			var32 = var44
		elseif self.kind.type == "float_value" then
			local var45, var46 = protoModule.writeTag(buff, var32, 7, protoModule.wireTypes.i32)
			var45, var87 = protoModule.writeFloat(var45, var46, self.kind.value)
			buff = var45
			var32 = var46
		elseif self.kind.type == "double_value" then
			local var47, var48 = protoModule.writeTag(buff, var32, 8, protoModule.wireTypes.i64)
			var47, var89 = protoModule.writeDouble(var47, var48, self.kind.value)
			buff = var47
			var32 = var48
		elseif self.kind.type == "binding_path_value" then
			local var49, var50 = protoModule.writeTag(buff, var32, 9, protoModule.wireTypes.lengthDelimited)
			var49, var91 = protoModule.writeString(var49, var50, self.kind.value)
			buff = var49
			var32 = var50
		end
	end
	local buff_1 = buffer.create(var32)
	buffer.copy(buff_1, 0, buff, 0, var32)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var32 = t_2.new()
	local var33 = 0
	while var33 < buffer.len(p2) do
		local _ = nil
		local var34 = nil
		local var35, var36, var37 = protoModule.readTag(p2, var33)
		local var38 = var35
		var34 = var36
		var33 = var37
		
		if var34 == protoModule.wireTypes.varint then
			if var38 == 2 then
				local _ = nil
				local var39, var40 = protoModule.readVarIntI32(p2, var33)
				local var41 = var39
				var33 = var40
				var32.op = t.ComparisonCondition_Op.fromNumber(var41) or var41
			elseif var38 == 4 then
				local _ = nil
				local var42, var43 = protoModule.readVarInt(p2, var33)
				var33 = var43
				var32.kind = { type = "bool_value", value = var42 ~= 0 }
			elseif var38 == 5 then
				local _ = nil
				local var44, var45 = protoModule.readVarIntI32(p2, var33)
				var33 = var45
				var32.kind = { type = "int32_value", value = var44 }
			elseif var38 == 6 then
				local _ = nil
				local var46, var47 = protoModule.readVarIntI64(p2, var33)
				var33 = var47
				var32.kind = { type = "int64_value", value = var46 }
			else
				local _ = nil
				local var48, var49 = protoModule.readVarInt(p2, var33)
				local _ = var48
				var33 = var49
			end
		end
		if var34 == protoModule.wireTypes.lengthDelimited then
			if var38 == 1 then
				local _ = nil
				local var50, var51 = protoModule.readBuffer(p2, var33)
				var33 = var51
				var32.field = buffer.tostring(var50)
			elseif var38 == 3 then
				local _ = nil
				local var52, var53 = protoModule.readBuffer(p2, var33)
				var33 = var53
				var32.kind = { type = "string_value", value = buffer.tostring(var52) }
			elseif var38 == 9 then
				local _ = nil
				local var54, var55 = protoModule.readBuffer(p2, var33)
				var33 = var55
				var32.kind = {
					type = "binding_path_value",
					value = buffer.tostring(var54)
				}
			else
				local _ = nil
				local var56, var57 = protoModule.readVarInt(p2, var33)
				var33 = var57 + var56
			end
		elseif var34 == protoModule.wireTypes.i32 then
			if var38 == 7 then
				local _ = nil
				local var58, var59 = protoModule.readFloat(p2, var33)
				var33 = var59
				var32.kind = { type = "float_value", value = var58 }
			else
				local _ = nil
				local var60, var61 = protoModule.readFixed32(p2, var33)
				local _ = var60
				var33 = var61
			end
		elseif var34 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var95)
		elseif var38 == 8 then
			local _ = nil
			local var62, var63 = protoModule.readDouble(p2, var33)
			var33 = var63
			var32.kind = { type = "double_value", value = var62 }
		else
			local _ = nil
			local var64, var65 = protoModule.readFixed64(p2, var33)
			local _ = var64
			var33 = var65
		end
	end
	return var32
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
			
			return t_1
		elseif self.kind.type == "binding_path_value" then
			t_1.bindingPathValue = self.kind.value
		end
	end
	return t_1
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref), protoModule (ref)
	local var66 = t_2.new()
	
	if self.field ~= nil then
		var66.field = self.field
	end
	if self.op ~= nil then
		var66.op = if typeof(self.op) == "number" then t.ComparisonCondition_Op.fromNumber(self.op) or self.op else t.ComparisonCondition_Op.fromName(self.op) or self.op
	end
	if self.string_value ~= nil then
		var66.kind = { type = "string_value", value = self.string_value }
	end
	if self.stringValue ~= nil then
		var66.kind = { type = "string_value", value = self.stringValue }
	end
	if self.bool_value ~= nil then
		var66.kind = { type = "bool_value", value = self.bool_value }
	end
	if self.boolValue ~= nil then
		var66.kind = { type = "bool_value", value = self.boolValue }
	end
	if self.int32_value ~= nil then
		var66.kind = { type = "int32_value", value = self.int32_value }
	end
	if self.int32Value ~= nil then
		var66.kind = { type = "int32_value", value = self.int32Value }
	end
	if self.int64_value ~= nil then
		var66.kind = { type = "int64_value", value = self.int64_value }
	end
	if self.int64Value ~= nil then
		var66.kind = { type = "int64_value", value = self.int64Value }
	end
	if self.float_value ~= nil then
		var66.kind = {
			type = "float_value",
			value = protoModule.json.deserializeNumber(self.float_value)
		}
	end
	if self.floatValue ~= nil then
		var66.kind = {
			type = "float_value",
			value = protoModule.json.deserializeNumber(self.floatValue)
		}
	end
	if self.double_value ~= nil then
		var66.kind = {
			type = "double_value",
			value = protoModule.json.deserializeNumber(self.double_value)
		}
	end
	if self.doubleValue ~= nil then
		var66.kind = {
			type = "double_value",
			value = protoModule.json.deserializeNumber(self.doubleValue)
		}
	end
	if self.binding_path_value ~= nil then
		var66.kind = {
			type = "binding_path_value",
			value = self.binding_path_value
		}
	end
	if self.bindingPathValue ~= nil then
		var66.kind = {
			type = "binding_path_value",
			value = self.bindingPathValue
		}
	end
	return var66
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
	local var66 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var67, var68 = protoModule.writeTag(buff, var66, 1, protoModule.wireTypes.lengthDelimited)
		var67, var132 = protoModule.writeString(var67, var68, self.field)
		buff = var67
		var66 = var68
	end
	local buff_1 = buffer.create(var66)
	buffer.copy(buff_1, 0, buff, 0, var66)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref)
	local var66 = t_3.new()
	local var67 = 0
	while var67 < buffer.len(p3) do
		local _ = nil
		local var68 = nil
		local var69, var70, var71 = protoModule.readTag(p3, var67)
		local var72 = var69
		var68 = var70
		var67 = var71
		
		if var68 == protoModule.wireTypes.varint then
			local _ = nil
			local var73, var74 = protoModule.readVarInt(p3, var67)
			local _ = var73
			var67 = var74
			continue
		end
		if var68 == protoModule.wireTypes.lengthDelimited then
			if var72 == 1 then
				local _ = nil
				local var75, var76 = protoModule.readBuffer(p3, var67)
				var67 = var76
				var66.field = buffer.tostring(var75)
			else
				local _ = nil
				local var77, var78 = protoModule.readVarInt(p3, var67)
				var67 = var78 + var77
			end
		elseif var68 == protoModule.wireTypes.i32 then
			local _ = nil
			local var79, var80 = protoModule.readFixed32(p3, var67)
			local _ = var79
			var67 = var80
		elseif var68 == protoModule.wireTypes.i64 then
			local _ = nil
			local var81, var82 = protoModule.readFixed64(p3, var67)
			local _ = var81
			var67 = var82
		else
			error("Unsupported wire type: " .. var136)
		end
	end
	return var66
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
	local var83 = t_3.new()
	
	if self.field ~= nil then
		var83.field = self.field
	end
	return var83
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
	local var83 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var84, var85 = protoModule.writeTag(buff, var83, 1, protoModule.wireTypes.lengthDelimited)
		var84, var156 = protoModule.writeString(var84, var85, self.field)
		buff = var84
		var83 = var85
	end
	local buff_1 = buffer.create(var83)
	buffer.copy(buff_1, 0, buff, 0, var83)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref)
	local var83 = t_4.new()
	local var84 = 0
	while var84 < buffer.len(p4) do
		local _ = nil
		local var85 = nil
		local var86, var87, var88 = protoModule.readTag(p4, var84)
		local var89 = var86
		var85 = var87
		var84 = var88
		
		if var85 == protoModule.wireTypes.varint then
			local _ = nil
			local var90, var91 = protoModule.readVarInt(p4, var84)
			local _ = var90
			var84 = var91
			continue
		end
		if var85 == protoModule.wireTypes.lengthDelimited then
			if var89 == 1 then
				local _ = nil
				local var92, var93 = protoModule.readBuffer(p4, var84)
				var84 = var93
				var83.field = buffer.tostring(var92)
			else
				local _ = nil
				local var94, var95 = protoModule.readVarInt(p4, var84)
				var84 = var95 + var94
			end
		elseif var85 == protoModule.wireTypes.i32 then
			local _ = nil
			local var96, var97 = protoModule.readFixed32(p4, var84)
			local _ = var96
			var84 = var97
		elseif var85 == protoModule.wireTypes.i64 then
			local _ = nil
			local var98, var99 = protoModule.readFixed64(p4, var84)
			local _ = var98
			var84 = var99
		else
			error("Unsupported wire type: " .. var160)
		end
	end
	return var83
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
	local var100 = t_4.new()
	
	if self.field ~= nil then
		var100.field = self.field
	end
	return var100
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
	local var100 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var101, var102 = protoModule.writeTag(buff, var100, 1, protoModule.wireTypes.lengthDelimited)
		var101, var180 = protoModule.writeString(var101, var102, self.field)
		buff = var101
		var100 = var102
	end
	local buff_1 = buffer.create(var100)
	buffer.copy(buff_1, 0, buff, 0, var100)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var100 = t_5.new()
	local var101 = 0
	while var101 < buffer.len(p5) do
		local _ = nil
		local var102 = nil
		local var103, var104, var105 = protoModule.readTag(p5, var101)
		local var106 = var103
		var102 = var104
		var101 = var105
		
		if var102 == protoModule.wireTypes.varint then
			local _ = nil
			local var107, var108 = protoModule.readVarInt(p5, var101)
			local _ = var107
			var101 = var108
			continue
		end
		if var102 == protoModule.wireTypes.lengthDelimited then
			if var106 == 1 then
				local _ = nil
				local var109, var110 = protoModule.readBuffer(p5, var101)
				var101 = var110
				var100.field = buffer.tostring(var109)
			else
				local _ = nil
				local var111, var112 = protoModule.readVarInt(p5, var101)
				var101 = var112 + var111
			end
		elseif var102 == protoModule.wireTypes.i32 then
			local _ = nil
			local var113, var114 = protoModule.readFixed32(p5, var101)
			local _ = var113
			var101 = var114
		elseif var102 == protoModule.wireTypes.i64 then
			local _ = nil
			local var115, var116 = protoModule.readFixed64(p5, var101)
			local _ = var115
			var101 = var116
		else
			error("Unsupported wire type: " .. var184)
		end
	end
	return var100
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
	local var117 = t_5.new()
	
	if self.field ~= nil then
		var117.field = self.field
	end
	return var117
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
	local var117 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var118, var119 = protoModule.writeTag(buff, var117, 1, protoModule.wireTypes.lengthDelimited)
		var118, var204 = protoModule.writeString(var118, var119, self.field)
		buff = var118
		var117 = var119
	end
	local buff_1 = buffer.create(var117)
	buffer.copy(buff_1, 0, buff, 0, var117)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref)
	local var117 = t_6.new()
	local var118 = 0
	while var118 < buffer.len(p6) do
		local _ = nil
		local var119 = nil
		local var120, var121, var122 = protoModule.readTag(p6, var118)
		local var123 = var120
		var119 = var121
		var118 = var122
		
		if var119 == protoModule.wireTypes.varint then
			local _ = nil
			local var124, var125 = protoModule.readVarInt(p6, var118)
			local _ = var124
			var118 = var125
			continue
		end
		if var119 == protoModule.wireTypes.lengthDelimited then
			if var123 == 1 then
				local _ = nil
				local var126, var127 = protoModule.readBuffer(p6, var118)
				var118 = var127
				var117.field = buffer.tostring(var126)
			else
				local _ = nil
				local var128, var129 = protoModule.readVarInt(p6, var118)
				var118 = var129 + var128
			end
		elseif var119 == protoModule.wireTypes.i32 then
			local _ = nil
			local var130, var131 = protoModule.readFixed32(p6, var118)
			local _ = var130
			var118 = var131
		elseif var119 == protoModule.wireTypes.i64 then
			local _ = nil
			local var132, var133 = protoModule.readFixed64(p6, var118)
			local _ = var132
			var118 = var133
		else
			error("Unsupported wire type: " .. var208)
		end
	end
	return var117
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
	local var134 = t_6.new()
	
	if self.field ~= nil then
		var134.field = self.field
	end
	return var134
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
		field = if p7 == nil or p7.field == nil then "" else p7.field,
		kind = if p7 == nil or p7.kind == nil then nil else p7.kind
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var134 = 0
	
	if self.field ~= nil and self.field ~= "" then
		local var135, var136 = protoModule.writeTag(buff, var134, 1, protoModule.wireTypes.lengthDelimited)
		var135, var228 = protoModule.writeString(var135, var136, self.field)
		buff = var135
		var134 = var136
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			local var137, var138 = protoModule.writeTag(buff, var134, 2, protoModule.wireTypes.lengthDelimited)
			var137, var230 = protoModule.writeString(var137, var138, self.kind.value)
			buff = var137
			var134 = var138
		elseif self.kind.type == "binding_path_value" then
			local var139, var140 = protoModule.writeTag(buff, var134, 3, protoModule.wireTypes.lengthDelimited)
			var139, var232 = protoModule.writeString(var139, var140, self.kind.value)
			buff = var139
			var134 = var140
		end
	end
	local buff_1 = buffer.create(var134)
	buffer.copy(buff_1, 0, buff, 0, var134)
	
	return buff_1
end

function t_7.decode(p7)
	-- upvalues: t_7 (ref), protoModule (ref)
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
				var134.field = buffer.tostring(var143)
			elseif var140 == 2 then
				local _ = nil
				local var145, var146 = protoModule.readBuffer(p7, var135)
				var135 = var146
				var134.kind = { type = "string_value", value = buffer.tostring(var145) }
			elseif var140 == 3 then
				local _ = nil
				local var147, var148 = protoModule.readBuffer(p7, var135)
				var135 = var148
				var134.kind = {
					type = "binding_path_value",
					value = buffer.tostring(var147)
				}
			else
				local _ = nil
				local var149, var150 = protoModule.readVarInt(p7, var135)
				var135 = var150 + var149
			end
		elseif var136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var151, var152 = protoModule.readFixed32(p7, var135)
			local _ = var151
			var135 = var152
		elseif var136 == protoModule.wireTypes.i64 then
			local _ = nil
			local var153, var154 = protoModule.readFixed64(p7, var135)
			local _ = var153
			var135 = var154
		else
			error("Unsupported wire type: " .. var236)
		end
	end
	return var134
end

function t_7:jsonEncode()
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			t.stringValue = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path_value" then
			t.bindingPathValue = self.kind.value
		end
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref)
	local var155 = t_7.new()
	
	if self.field ~= nil then
		var155.field = self.field
	end
	if self.string_value ~= nil then
		var155.kind = { type = "string_value", value = self.string_value }
	end
	if self.stringValue ~= nil then
		var155.kind = { type = "string_value", value = self.stringValue }
	end
	if self.binding_path_value ~= nil then
		var155.kind = {
			type = "binding_path_value",
			value = self.binding_path_value
		}
	end
	if self.bindingPathValue ~= nil then
		var155.kind = {
			type = "binding_path_value",
			value = self.bindingPathValue
		}
	end
	return var155
end

t_7.descriptor = {
	name = "ContainsCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContainsCondition"
}
t.ContainsCondition = t_7
typeRegistryModule.default:register(t.ContainsCondition)
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
	local var155 = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for i, v in self.conditions do
			local var156 = v:encode()
			local var157, var158 = protoModule.writeTag(buff, var155, 1, protoModule.wireTypes.lengthDelimited)
			var157, var261 = protoModule.writeBuffer(var157, var158, var156, buffer.len(var156))
			buff = var157
			var155 = var158
		end
	end
	local buff_1 = buffer.create(var155)
	buffer.copy(buff_1, 0, buff, 0, var155)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var159 = t_8.new()
	local var160 = 0
	while var160 < buffer.len(p8) do
		local _ = nil
		local var161 = nil
		local var162, var163, var164 = protoModule.readTag(p8, var160)
		local var165 = var162
		var161 = var163
		var160 = var164
		
		if var161 == protoModule.wireTypes.varint then
			local _ = nil
			local var166, var167 = protoModule.readVarInt(p8, var160)
			local _ = var166
			var160 = var167
			continue
		end
		if var161 == protoModule.wireTypes.lengthDelimited then
			if var165 == 1 then
				local _ = nil
				local var168, var169 = protoModule.readBuffer(p8, var160)
				var160 = var169
				table.insert(var159.conditions, t.PropCondition.decode(var168))
			else
				local _ = nil
				local var170, var171 = protoModule.readVarInt(p8, var160)
				var160 = var171 + var170
			end
		elseif var161 == protoModule.wireTypes.i32 then
			local _ = nil
			local var172, var173 = protoModule.readFixed32(p8, var160)
			local _ = var172
			var160 = var173
		elseif var161 == protoModule.wireTypes.i64 then
			local _ = nil
			local var174, var175 = protoModule.readFixed64(p8, var160)
			local _ = var174
			var160 = var175
		else
			error("Unsupported wire type: " .. var265)
		end
	end
	return var159
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
	local var176 = t_8.new()
	
	if self.conditions ~= nil then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, t.PropCondition.jsonDecode(v))
		end
		var176.conditions = t_1
	end
	return var176
end

t_8.descriptor = {
	name = "AndCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.AndCondition"
}
t.AndCondition = t_8
typeRegistryModule.default:register(t.AndCondition)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		conditions = if p9 == nil or p9.conditions == nil then {} else p9.conditions
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var177 = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for i, v in self.conditions do
			local var178 = v:encode()
			local var179, var180 = protoModule.writeTag(buff, var177, 1, protoModule.wireTypes.lengthDelimited)
			var179, var288 = protoModule.writeBuffer(var179, var180, var178, buffer.len(var178))
			buff = var179
			var177 = var180
		end
	end
	local buff_1 = buffer.create(var177)
	buffer.copy(buff_1, 0, buff, 0, var177)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var181 = t_9.new()
	local var182 = 0
	while var182 < buffer.len(p9) do
		local _ = nil
		local var183 = nil
		local var184, var185, var186 = protoModule.readTag(p9, var182)
		local var187 = var184
		var183 = var185
		var182 = var186
		
		if var183 == protoModule.wireTypes.varint then
			local _ = nil
			local var188, var189 = protoModule.readVarInt(p9, var182)
			local _ = var188
			var182 = var189
			continue
		end
		if var183 == protoModule.wireTypes.lengthDelimited then
			if var187 == 1 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p9, var182)
				var182 = var191
				table.insert(var181.conditions, t.PropCondition.decode(var190))
			else
				local _ = nil
				local var192, var193 = protoModule.readVarInt(p9, var182)
				var182 = var193 + var192
			end
		elseif var183 == protoModule.wireTypes.i32 then
			local _ = nil
			local var194, var195 = protoModule.readFixed32(p9, var182)
			local _ = var194
			var182 = var195
		elseif var183 == protoModule.wireTypes.i64 then
			local _ = nil
			local var196, var197 = protoModule.readFixed64(p9, var182)
			local _ = var196
			var182 = var197
		else
			error("Unsupported wire type: " .. var292)
		end
	end
	return var181
end

function t_9:jsonEncode()
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

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var198 = t_9.new()
	
	if self.conditions ~= nil then
		local t_1 = {}
		
		for i, v in self.conditions do
			table.insert(t_1, t.PropCondition.jsonDecode(v))
		end
		var198.conditions = t_1
	end
	return var198
end

t_9.descriptor = {
	name = "OrCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.OrCondition"
}
t.OrCondition = t_9
typeRegistryModule.default:register(t.OrCondition)

return {
	PropCondition = t.PropCondition,
	ComparisonCondition = t.ComparisonCondition,
	ComparisonCondition_Op = t.ComparisonCondition_Op,
	IsNullCondition = t.IsNullCondition,
	IsNotNullCondition = t.IsNotNullCondition,
	IsEmptyCondition = t.IsEmptyCondition,
	IsNotEmptyCondition = t.IsNotEmptyCondition,
	ContainsCondition = t.ContainsCondition,
	AndCondition = t.AndCondition,
	OrCondition = t.OrCondition
}