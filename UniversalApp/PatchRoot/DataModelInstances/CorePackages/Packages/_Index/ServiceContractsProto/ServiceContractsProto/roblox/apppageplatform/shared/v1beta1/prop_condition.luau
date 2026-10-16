local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local Module = {}
Module.__index = Module

function Module.new(p1) --[[ Line: 259 ]]
	-- upvalues: Module (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module))
end

function Module:encode() --[[ Line: 265 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "comparison" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "is_null" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "is_not_null" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "and_condition" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "or_condition" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "is_empty" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult7, WriteTagResult2_6, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "is_not_empty" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult8, WriteTagResult2_7, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "contains" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf) --[[ Line: 310 ]]
	-- upvalues: Module (copy), ProtoModule (copy), t (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v39 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v39 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "comparison",
					value = t.ComparisonCondition.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "is_null",
					value = t.IsNullCondition.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "is_not_null",
					value = t.IsNotNullCondition.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "and_condition",
					value = t.AndCondition.decode(Buffer4)
				}
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "or_condition",
					value = t.OrCondition.decode(Buffer5)
				}
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "is_empty",
					value = t.IsEmptyCondition.decode(Buffer6)
				}
			elseif Tag == 7 then
				local Buffer7
				Buffer7, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "is_not_empty",
					value = t.IsNotEmptyCondition.decode(Buffer7)
				}
			elseif Tag == 8 then
				local Buffer8
				Buffer8, v39 = ProtoModule.readBuffer(Buf, v1)
				NewModule.kind = {
					type = "contains",
					value = t.ContainsCondition.decode(Buffer8)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v39 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v39 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode() --[[ Line: 388 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "comparison" then
			t.comparison = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "is_null" then
			t.isNull = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "is_not_null" then
			t.isNotNull = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "and_condition" then
			t.andCondition = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "or_condition" then
			t.orCondition = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "is_empty" then
			t.isEmpty = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "is_not_empty" then
			t.isNotEmpty = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "contains" then
			t.contains = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module:jsonDecode() --[[ Line: 414 ]]
	-- upvalues: Module (copy), t (copy)
	local NewModule = Module.new()
	
	if self.comparison ~= nil then
		NewModule.kind = {
			type = "comparison",
			value = t.ComparisonCondition.jsonDecode(self.comparison)
		}
	end
	if self.is_null ~= nil then
		NewModule.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.is_null)
		}
	end
	if self.isNull ~= nil then
		NewModule.kind = {
			type = "is_null",
			value = t.IsNullCondition.jsonDecode(self.isNull)
		}
	end
	if self.is_not_null ~= nil then
		NewModule.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.is_not_null)
		}
	end
	if self.isNotNull ~= nil then
		NewModule.kind = {
			type = "is_not_null",
			value = t.IsNotNullCondition.jsonDecode(self.isNotNull)
		}
	end
	if self.and_condition ~= nil then
		NewModule.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.and_condition)
		}
	end
	if self.andCondition ~= nil then
		NewModule.kind = {
			type = "and_condition",
			value = t.AndCondition.jsonDecode(self.andCondition)
		}
	end
	if self.or_condition ~= nil then
		NewModule.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.or_condition)
		}
	end
	if self.orCondition ~= nil then
		NewModule.kind = {
			type = "or_condition",
			value = t.OrCondition.jsonDecode(self.orCondition)
		}
	end
	if self.is_empty ~= nil then
		NewModule.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.is_empty)
		}
	end
	if self.isEmpty ~= nil then
		NewModule.kind = {
			type = "is_empty",
			value = t.IsEmptyCondition.jsonDecode(self.isEmpty)
		}
	end
	if self.is_not_empty ~= nil then
		NewModule.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.is_not_empty)
		}
	end
	if self.isNotEmpty ~= nil then
		NewModule.kind = {
			type = "is_not_empty",
			value = t.IsNotEmptyCondition.jsonDecode(self.isNotEmpty)
		}
	end
	if self.contains ~= nil then
		NewModule.kind = {
			type = "contains",
			value = t.ContainsCondition.jsonDecode(self.contains)
		}
	end
	return NewModule
end

Module.descriptor = {
	name = "PropCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.PropCondition"
}
t.PropCondition = Module
TypeRegistryModule.default:register(t.PropCondition)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1) --[[ Line: 490 ]]
	-- upvalues: t (copy), Module1 (copy)
	return (setmetatable({
		field = if p1 == nil or p1.field == nil then "" else p1.field,
		op = if p1 == nil or p1.op == nil then assert(t.ComparisonCondition_Op.fromNumber(0), "Enum has no 0 default") else p1.op,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module1))
end

function Module1:encode() --[[ Line: 500 ]]
	-- upvalues: ProtoModule (copy), t (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field ~= nil and self.field ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field)
	end
	if self.op ~= nil and (self.op ~= nil and self.op ~= 0 or self.op ~= t.ComparisonCondition_Op.fromNumber(0)) then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, t.ComparisonCondition_Op.toNumber(self.op))
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "bool_value" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult4, WriteTagResult2_3, if self.kind.value then 1 else 0)
		elseif self.kind.type == "int32_value" then
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, self.kind.value)
		elseif self.kind.type == "int64_value" then
			local WriteTagResult7, WriteTagResult2_6 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult7, WriteTagResult2_6, self.kind.value)
		elseif self.kind.type == "float_value" then
			local WriteTagResult8, WriteTagResult2_7 = ProtoModule.writeTag(Buf, Count, 7, ProtoModule.wireTypes.i32)
			Buf, Count = ProtoModule.writeFloat(WriteTagResult8, WriteTagResult2_7, self.kind.value)
		elseif self.kind.type == "double_value" then
			local WriteTagResult9, WriteTagResult2_8 = ProtoModule.writeTag(Buf, Count, 8, ProtoModule.wireTypes.i64)
			Buf, Count = ProtoModule.writeDouble(WriteTagResult9, WriteTagResult2_8, self.kind.value)
		elseif self.kind.type == "binding_path_value" then
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 9, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult6, WriteTagResult2_5, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf) --[[ Line: 547 ]]
	-- upvalues: Module1 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v78 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v78 = ProtoModule.readVarIntI32(Buf, v2)
				NewModule.op = t.ComparisonCondition_Op.fromNumber(VarIntI32) or VarIntI32
			elseif Tag == 4 then
				local VarInt
				VarInt, v78 = ProtoModule.readVarInt(Buf, v2)
				NewModule.kind = { type = "bool_value", value = VarInt ~= 0 }
			elseif Tag == 5 then
				local VarIntI32_1
				VarIntI32_1, v78 = ProtoModule.readVarIntI32(Buf, v2)
				NewModule.kind = { type = "int32_value", value = VarIntI32_1 }
			elseif Tag == 6 then
				local VarIntI64
				VarIntI64, v78 = ProtoModule.readVarIntI64(Buf, v2)
				NewModule.kind = { type = "int64_value", value = VarIntI64 }
			else
				local _
				_, v78 = ProtoModule.readVarInt(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v78 = ProtoModule.readBuffer(Buf, v2)
				NewModule.field = buffer.tostring(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v78 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = { type = "string_value", value = buffer.tostring(Buffer2) }
			elseif Tag == 9 then
				local Buffer3
				Buffer3, v78 = ProtoModule.readBuffer(Buf, v2)
				NewModule.kind = {
					type = "binding_path_value",
					value = buffer.tostring(Buffer3)
				}
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 7 then
				local Float
				Float, v78 = ProtoModule.readFloat(Buf, v2)
				NewModule.kind = { type = "float_value", value = Float }
			else
				local _
				_, v78 = ProtoModule.readFixed32(Buf, v2)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 8 then
				local Double
				Double, v78 = ProtoModule.readDouble(Buf, v2)
				NewModule.kind = { type = "double_value", value = Double }
			else
				local _
				_, v78 = ProtoModule.readFixed64(Buf, v2)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode() --[[ Line: 630 ]]
	-- upvalues: t (copy), ProtoModule (copy)
	local t1 = {}
	
	if self.field ~= nil and self.field ~= "" then
		t1.field = self.field
	end
	if self.op ~= nil and (self.op ~= nil and self.op ~= 0 or self.op ~= t.ComparisonCondition_Op.fromNumber(0)) then
		t1.op = if typeof(self.op) == "number" then self.op else t.ComparisonCondition_Op.toNumber(self.op)
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			t1.stringValue = self.kind.value
			
			return t1
		end
		if self.kind.type == "bool_value" then
			t1.boolValue = self.kind.value
			
			return t1
		end
		if self.kind.type == "int32_value" then
			t1.int32Value = self.kind.value
			
			return t1
		end
		if self.kind.type == "int64_value" then
			t1.int64Value = self.kind.value
			
			return t1
		end
		if self.kind.type == "float_value" then
			t1.floatValue = ProtoModule.json.serializeNumber(self.kind.value)
			
			return t1
		end
		if self.kind.type == "double_value" then
			t1.doubleValue = ProtoModule.json.serializeNumber(self.kind.value)
			
			return t1
		end
		if self.kind.type == "binding_path_value" then
			t1.bindingPathValue = self.kind.value
		end
	end
	return t1
end

function Module1:jsonDecode() --[[ Line: 667 ]]
	-- upvalues: Module1 (copy), t (copy), ProtoModule (copy)
	local NewModule = Module1.new()
	
	if self.field ~= nil then
		NewModule.field = self.field
	end
	if self.op ~= nil then
		NewModule.op = (if typeof(self.op) == "number" then t.ComparisonCondition_Op.fromNumber(self.op) else t.ComparisonCondition_Op.fromName(self.op)) or self.op
	end
	if self.string_value ~= nil then
		NewModule.kind = { type = "string_value", value = self.string_value }
	end
	if self.stringValue ~= nil then
		NewModule.kind = { type = "string_value", value = self.stringValue }
	end
	if self.bool_value ~= nil then
		NewModule.kind = { type = "bool_value", value = self.bool_value }
	end
	if self.boolValue ~= nil then
		NewModule.kind = { type = "bool_value", value = self.boolValue }
	end
	if self.int32_value ~= nil then
		NewModule.kind = { type = "int32_value", value = self.int32_value }
	end
	if self.int32Value ~= nil then
		NewModule.kind = { type = "int32_value", value = self.int32Value }
	end
	if self.int64_value ~= nil then
		NewModule.kind = { type = "int64_value", value = self.int64_value }
	end
	if self.int64Value ~= nil then
		NewModule.kind = { type = "int64_value", value = self.int64Value }
	end
	if self.float_value ~= nil then
		NewModule.kind = {
			type = "float_value",
			value = ProtoModule.json.deserializeNumber(self.float_value)
		}
	end
	if self.floatValue ~= nil then
		NewModule.kind = {
			type = "float_value",
			value = ProtoModule.json.deserializeNumber(self.floatValue)
		}
	end
	if self.double_value ~= nil then
		NewModule.kind = {
			type = "double_value",
			value = ProtoModule.json.deserializeNumber(self.double_value)
		}
	end
	if self.doubleValue ~= nil then
		NewModule.kind = {
			type = "double_value",
			value = ProtoModule.json.deserializeNumber(self.doubleValue)
		}
	end
	if self.binding_path_value ~= nil then
		NewModule.kind = {
			type = "binding_path_value",
			value = self.binding_path_value
		}
	end
	if self.bindingPathValue ~= nil then
		NewModule.kind = {
			type = "binding_path_value",
			value = self.bindingPathValue
		}
	end
	return NewModule
end

Module1.descriptor = {
	name = "ComparisonCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.ComparisonCondition"
}
t.ComparisonCondition = Module1
TypeRegistryModule.default:register(t.ComparisonCondition)
t.ComparisonCondition_Op = {
	fromNumber = function(p1) --[[ Line: 750 ]]
		return if p1 == 0 then "OP_INVALID" elseif p1 == 1 then "OP_LT" elseif p1 == 2 then "OP_LTE" elseif p1 == 3 then "OP_GT" elseif p1 == 4 then "OP_GTE" elseif p1 == 5 then "OP_E" elseif p1 == 6 then "OP_NE" else nil
	end,
	toNumber = function(p1) --[[ Line: 770 ]]
		return if p1 == "OP_INVALID" then 0 elseif p1 == "OP_LT" then 1 elseif p1 == "OP_LTE" then 2 elseif p1 == "OP_GT" then 3 elseif p1 == "OP_GTE" then 4 elseif p1 == "OP_E" then 5 elseif p1 == "OP_NE" then 6 else p1
	end,
	fromName = function(p1) --[[ Line: 790 ]]
		return if p1 == "OP_INVALID" then "OP_INVALID" elseif p1 == "OP_LT" then "OP_LT" elseif p1 == "OP_LTE" then "OP_LTE" elseif p1 == "OP_GT" then "OP_GT" elseif p1 == "OP_GTE" then "OP_GTE" elseif p1 == "OP_E" then "OP_E" elseif p1 == "OP_NE" then "OP_NE" else nil
	end
}
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1) --[[ Line: 815 ]]
	-- upvalues: Module2 (copy)
	return (setmetatable({
		field = if p1 == nil or p1.field == nil then "" else p1.field
	}, Module2))
end

function Module2:encode() --[[ Line: 821 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field ~= nil and self.field ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf) --[[ Line: 835 ]]
	-- upvalues: Module2 (copy), ProtoModule (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v102 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v102 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v102 = ProtoModule.readBuffer(Buf, v3)
				NewModule.field = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v102 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v102 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode() --[[ Line: 878 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function Module2:jsonDecode() --[[ Line: 888 ]]
	-- upvalues: Module2 (copy)
	local NewModule = Module2.new()
	
	if self.field ~= nil then
		NewModule.field = self.field
	end
	return NewModule
end

Module2.descriptor = {
	name = "IsNullCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNullCondition"
}
t.IsNullCondition = Module2
TypeRegistryModule.default:register(t.IsNullCondition)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1) --[[ Line: 912 ]]
	-- upvalues: Module3 (copy)
	return (setmetatable({
		field = if p1 == nil or p1.field == nil then "" else p1.field
	}, Module3))
end

function Module3:encode() --[[ Line: 918 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field ~= nil and self.field ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf) --[[ Line: 932 ]]
	-- upvalues: Module3 (copy), ProtoModule (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v118 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v118 = ProtoModule.readVarInt(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v118 = ProtoModule.readBuffer(Buf, v4)
				NewModule.field = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v118 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v118 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode() --[[ Line: 975 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function Module3:jsonDecode() --[[ Line: 985 ]]
	-- upvalues: Module3 (copy)
	local NewModule = Module3.new()
	
	if self.field ~= nil then
		NewModule.field = self.field
	end
	return NewModule
end

Module3.descriptor = {
	name = "IsNotNullCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNotNullCondition"
}
t.IsNotNullCondition = Module3
TypeRegistryModule.default:register(t.IsNotNullCondition)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1) --[[ Line: 1009 ]]
	-- upvalues: Module4 (copy)
	return (setmetatable({
		field = if p1 == nil or p1.field == nil then "" else p1.field
	}, Module4))
end

function Module4:encode() --[[ Line: 1015 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field ~= nil and self.field ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf) --[[ Line: 1029 ]]
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v134 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v134 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v134 = ProtoModule.readBuffer(Buf, v5)
				NewModule.field = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v134 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v134 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode() --[[ Line: 1072 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function Module4:jsonDecode() --[[ Line: 1082 ]]
	-- upvalues: Module4 (copy)
	local NewModule = Module4.new()
	
	if self.field ~= nil then
		NewModule.field = self.field
	end
	return NewModule
end

Module4.descriptor = {
	name = "IsEmptyCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsEmptyCondition"
}
t.IsEmptyCondition = Module4
TypeRegistryModule.default:register(t.IsEmptyCondition)
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1) --[[ Line: 1106 ]]
	-- upvalues: Module5 (copy)
	return (setmetatable({
		field = if p1 == nil or p1.field == nil then "" else p1.field
	}, Module5))
end

function Module5:encode() --[[ Line: 1112 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field ~= nil and self.field ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module5.decode(Buf) --[[ Line: 1126 ]]
	-- upvalues: Module5 (copy), ProtoModule (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v150 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v150 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v150 = ProtoModule.readBuffer(Buf, v6)
				NewModule.field = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v150 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v150 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode() --[[ Line: 1169 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	return t
end

function Module5:jsonDecode() --[[ Line: 1179 ]]
	-- upvalues: Module5 (copy)
	local NewModule = Module5.new()
	
	if self.field ~= nil then
		NewModule.field = self.field
	end
	return NewModule
end

Module5.descriptor = {
	name = "IsNotEmptyCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.IsNotEmptyCondition"
}
t.IsNotEmptyCondition = Module5
TypeRegistryModule.default:register(t.IsNotEmptyCondition)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1) --[[ Line: 1203 ]]
	-- upvalues: Module6 (copy)
	return (setmetatable({
		field = if p1 == nil or p1.field == nil then "" else p1.field,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module6))
end

function Module6:encode() --[[ Line: 1210 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.field ~= nil and self.field ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.field)
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path_value" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf) --[[ Line: 1234 ]]
	-- upvalues: Module6 (copy), ProtoModule (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v170 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v170 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v170 = ProtoModule.readBuffer(Buf, v7)
				NewModule.field = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v170 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = { type = "string_value", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v170 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = {
					type = "binding_path_value",
					value = buffer.tostring(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v170 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v170 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode() --[[ Line: 1287 ]]
	local t = {}
	
	if self.field ~= nil and self.field ~= "" then
		t.field = self.field
	end
	if self.kind ~= nil then
		if self.kind.type == "string_value" then
			t.stringValue = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path_value" then
			t.bindingPathValue = self.kind.value
		end
	end
	return t
end

function Module6:jsonDecode() --[[ Line: 1305 ]]
	-- upvalues: Module6 (copy)
	local NewModule = Module6.new()
	
	if self.field ~= nil then
		NewModule.field = self.field
	end
	if self.string_value ~= nil then
		NewModule.kind = { type = "string_value", value = self.string_value }
	end
	if self.stringValue ~= nil then
		NewModule.kind = { type = "string_value", value = self.stringValue }
	end
	if self.binding_path_value ~= nil then
		NewModule.kind = {
			type = "binding_path_value",
			value = self.binding_path_value
		}
	end
	if self.bindingPathValue ~= nil then
		NewModule.kind = {
			type = "binding_path_value",
			value = self.bindingPathValue
		}
	end
	return NewModule
end

Module6.descriptor = {
	name = "ContainsCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContainsCondition"
}
t.ContainsCondition = Module6
TypeRegistryModule.default:register(t.ContainsCondition)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1) --[[ Line: 1345 ]]
	-- upvalues: Module7 (copy)
	return (setmetatable({
		conditions = if p1 == nil or p1.conditions == nil then {} else p1.conditions
	}, Module7))
end

function Module7:encode() --[[ Line: 1351 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for _, condition in self.conditions do
			local EncodeResult = condition:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf) --[[ Line: 1368 ]]
	-- upvalues: Module7 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v189 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v189 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v189 = ProtoModule.readBuffer(Buf, v8)
				table.insert(NewModule.conditions, t.PropCondition.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v189 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v189 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode() --[[ Line: 1411 ]]
	local t = {}
	
	if self.conditions ~= nil and #self.conditions > 0 then
		local Conditions = {}
		
		for _, condition in self.conditions do
			table.insert(Conditions, condition:jsonEncode())
		end
		t.conditions = Conditions
	end
	return t
end

function Module7:jsonDecode() --[[ Line: 1425 ]]
	-- upvalues: Module7 (copy), t (copy)
	local NewModule = Module7.new()
	
	if self.conditions ~= nil then
		local Conditions = {}
		
		for _, condition in self.conditions do
			table.insert(Conditions, t.PropCondition.jsonDecode(condition))
		end
		NewModule.conditions = Conditions
	end
	return NewModule
end

Module7.descriptor = {
	name = "AndCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.AndCondition"
}
t.AndCondition = Module7
TypeRegistryModule.default:register(t.AndCondition)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1) --[[ Line: 1454 ]]
	-- upvalues: Module8 (copy)
	return (setmetatable({
		conditions = if p1 == nil or p1.conditions == nil then {} else p1.conditions
	}, Module8))
end

function Module8:encode() --[[ Line: 1460 ]]
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.conditions ~= nil and #self.conditions > 0 then
		for _, condition in self.conditions do
			local EncodeResult = condition:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf) --[[ Line: 1477 ]]
	-- upvalues: Module8 (copy), ProtoModule (copy), t (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v208 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v208 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v208 = ProtoModule.readBuffer(Buf, v9)
				table.insert(NewModule.conditions, t.PropCondition.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v208 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v208 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode() --[[ Line: 1520 ]]
	local t = {}
	
	if self.conditions ~= nil and #self.conditions > 0 then
		local Conditions = {}
		
		for _, condition in self.conditions do
			table.insert(Conditions, condition:jsonEncode())
		end
		t.conditions = Conditions
	end
	return t
end

function Module8:jsonDecode() --[[ Line: 1534 ]]
	-- upvalues: Module8 (copy), t (copy)
	local NewModule = Module8.new()
	
	if self.conditions ~= nil then
		local Conditions = {}
		
		for _, condition in self.conditions do
			table.insert(Conditions, t.PropCondition.jsonDecode(condition))
		end
		NewModule.conditions = Conditions
	end
	return NewModule
end

Module8.descriptor = {
	name = "OrCondition",
	fullName = "roblox.apppageplatform.shared.v1beta1.OrCondition"
}
t.OrCondition = Module8
TypeRegistryModule.default:register(t.OrCondition)

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