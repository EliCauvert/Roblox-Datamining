local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	return setmetatable({
		namespace = if p1 == nil or p1.namespace == nil then "" else p1.namespace,
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		map_key = if p1 == nil or p1.map_key == nil then "" else p1.map_key
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1 = 0
	
	if self.namespace ~= nil and self.namespace ~= "" then
		local var2, var3 = protoModule.writeTag(buff, var1, 1, protoModule.wireTypes.lengthDelimited)
		var2, var108 = protoModule.writeString(var2, var3, self.namespace)
		buff = var2
		var1 = var3
	end
	if self.key ~= nil and self.key ~= "" then
		local var4, var5 = protoModule.writeTag(buff, var1, 2, protoModule.wireTypes.lengthDelimited)
		var4, var110 = protoModule.writeString(var4, var5, self.key)
		buff = var4
		var1 = var5
	end
	if self.map_key ~= nil and self.map_key ~= "" then
		local var6, var7 = protoModule.writeTag(buff, var1, 3, protoModule.wireTypes.lengthDelimited)
		var6, var112 = protoModule.writeString(var6, var7, self.map_key)
		buff = var6
		var1 = var7
	end
	local buff_1 = buffer.create(var1)
	buffer.copy(buff_1, 0, buff, 0, var1)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
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
				var1.namespace = buffer.tostring(var10)
			elseif var7 == 2 then
				local _ = nil
				local var12, var13 = protoModule.readBuffer(p1, var2)
				var2 = var13
				var1.key = buffer.tostring(var12)
			elseif var7 == 3 then
				local _ = nil
				local var14, var15 = protoModule.readBuffer(p1, var2)
				var2 = var15
				var1.map_key = buffer.tostring(var14)
			else
				local _ = nil
				local var16, var17 = protoModule.readVarInt(p1, var2)
				var2 = var17 + var16
			end
		elseif var3 == protoModule.wireTypes.i32 then
			local _ = nil
			local var18, var19 = protoModule.readFixed32(p1, var2)
			local _ = var18
			var2 = var19
		elseif var3 == protoModule.wireTypes.i64 then
			local _ = nil
			local var20, var21 = protoModule.readFixed64(p1, var2)
			local _ = var20
			var2 = var21
		else
			error("Unsupported wire type: " .. var116)
		end
	end
	return var1
end

function t_1:jsonEncode()
	local t = {}
	
	if self.namespace ~= nil and self.namespace ~= "" then
		t.namespace = self.namespace
	end
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.map_key ~= nil and self.map_key ~= "" then
		t.mapKey = self.map_key
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref)
	local var22 = t_1.new()
	
	if self.namespace ~= nil then
		var22.namespace = self.namespace
	end
	if self.key ~= nil then
		var22.key = self.key
	end
	if self.map_key ~= nil then
		var22.map_key = self.map_key
	end
	if self.mapKey ~= nil then
		var22.map_key = self.mapKey
	end
	return var22
end

t_1.descriptor = {
	name = "TranslationRef",
	fullName = "roblox.apppageplatform.shared.v1beta1.TranslationRef"
}
t.TranslationRef = t_1
typeRegistryModule.default:register(t.TranslationRef)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		str = if p2 == nil or p2.str == nil then "" else p2.str,
		args = if p2 == nil or p2.args == nil then {} else p2.args,
		translation = if p2 == nil or p2.translation == nil then nil else p2.translation
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var22 = 0
	
	if self.str ~= nil and self.str ~= "" then
		local var23, var24 = protoModule.writeTag(buff, var22, 1, protoModule.wireTypes.lengthDelimited)
		var23, var140 = protoModule.writeString(var23, var24, self.str)
		buff = var23
		var22 = var24
	end
	if self.args ~= nil and next(self.args) ~= nil then
		for i, v in self.args do
			local var25, var26 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var25, var142 = protoModule.writeString(var25, var26, i)
			local var27 = v:encode()
			var26, var144 = protoModule.writeTag(var25, var26, 2, protoModule.wireTypes.lengthDelimited)
			var26, var144 = protoModule.writeBuffer(var26, var144, var27, buffer.len(var27))
			local var28 = var26
			local var29 = var144
			local var30, var31 = protoModule.writeTag(buff, var22, 2, protoModule.wireTypes.lengthDelimited)
			var30, var148 = protoModule.writeBuffer(var30, var31, var28, var29)
			buff = var30
			var22 = var31
		end
	end
	if self.translation ~= nil then
		local var32 = self.translation:encode()
		local var33, var34 = protoModule.writeTag(buff, var22, 3, protoModule.wireTypes.lengthDelimited)
		var33, var151 = protoModule.writeBuffer(var33, var34, var32, buffer.len(var32))
		buff = var33
		var22 = var34
	end
	local buff_1 = buffer.create(var22)
	buffer.copy(buff_1, 0, buff, 0, var22)
	
	return buff_1
end

function t_2.decode(p2)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var35 = t_2.new()
	local var36 = 0
	while var36 < buffer.len(p2) do
		local _ = nil
		local var37 = nil
		local var38, var39, var40 = protoModule.readTag(p2, var36)
		local var41 = var38
		var37 = var39
		var36 = var40
		
		if var37 == protoModule.wireTypes.varint then
			local _ = nil
			local var42, var43 = protoModule.readVarInt(p2, var36)
			local _ = var42
			var36 = var43
			continue
		end
		if var37 == protoModule.wireTypes.lengthDelimited then
			if var41 == 1 then
				local _ = nil
				local var44, var45 = protoModule.readBuffer(p2, var36)
				var36 = var45
				var35.str = buffer.tostring(var44)
			elseif var41 == 2 then
				local _ = nil
				local var46, var47 = protoModule.readBuffer(p2, var36)
				var36 = var47
				var46 = t.StringFormat_ArgsEntry.decode(var46)
				var35.args[var46.key or ""] = var46.value or t.StringFormat_FormatArg.new()
			elseif var41 == 3 then
				local _ = nil
				local var48, var49 = protoModule.readBuffer(p2, var36)
				var36 = var49
				var35.translation = t.TranslationRef.decode(var48)
			else
				local _ = nil
				local var50, var51 = protoModule.readVarInt(p2, var36)
				var36 = var51 + var50
			end
		elseif var37 == protoModule.wireTypes.i32 then
			local _ = nil
			local var52, var53 = protoModule.readFixed32(p2, var36)
			local _ = var52
			var36 = var53
		elseif var37 == protoModule.wireTypes.i64 then
			local _ = nil
			local var54, var55 = protoModule.readFixed64(p2, var36)
			local _ = var54
			var36 = var55
		else
			error("Unsupported wire type: " .. var155)
		end
	end
	return var35
end

function t_2:jsonEncode()
	local t = {}
	
	if self.str ~= nil and self.str ~= "" then
		t.str = self.str
	end
	if self.args ~= nil and next(self.args) ~= nil then
		local t_1 = {}
		
		for i, v in self.args do
			t_1[i] = v:jsonEncode()
		end
		t.args = t_1
	end
	if self.translation ~= nil then
		t.translation = self.translation:jsonEncode()
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var56 = t_2.new()
	
	if self.str ~= nil then
		var56.str = self.str
	end
	if self.args ~= nil then
		local t_1 = {}
		
		for i, v in self.args do
			t_1[i] = t.StringFormat_FormatArg.jsonDecode(v)
		end
		var56.args = t_1
	end
	if self.translation ~= nil then
		var56.translation = t.TranslationRef.jsonDecode(self.translation)
	end
	return var56
end

t_2.descriptor = {
	name = "StringFormat",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
}
t.StringFormat = t_2
typeRegistryModule.default:register(t.StringFormat)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p3 == nil or p3.kind == nil then nil else p3.kind,
		formatter = if p3 == nil or p3.formatter == nil then nil else p3.formatter
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var57 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var58, var59 = protoModule.writeTag(buff, var57, 1, protoModule.wireTypes.lengthDelimited)
			var58, var181 = protoModule.writeString(var58, var59, self.kind.value)
			buff = var58
			var57 = var59
		elseif self.kind.type == "binding_path" then
			local var60, var61 = protoModule.writeTag(buff, var57, 2, protoModule.wireTypes.lengthDelimited)
			var60, var183 = protoModule.writeString(var60, var61, self.kind.value)
			buff = var60
			var57 = var61
		end
	end
	if self.formatter ~= nil then
		local var62 = self.formatter:encode()
		local var63, var64 = protoModule.writeTag(buff, var57, 3, protoModule.wireTypes.lengthDelimited)
		var63, var186 = protoModule.writeBuffer(var63, var64, var62, buffer.len(var62))
		buff = var63
		var57 = var64
	end
	local buff_1 = buffer.create(var57)
	buffer.copy(buff_1, 0, buff, 0, var57)
	
	return buff_1
end

function t_3.decode(p3)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var57 = t_3.new()
	local var58 = 0
	while var58 < buffer.len(p3) do
		local _ = nil
		local var59 = nil
		local var60, var61, var62 = protoModule.readTag(p3, var58)
		local var63 = var60
		var59 = var61
		var58 = var62
		
		if var59 == protoModule.wireTypes.varint then
			local _ = nil
			local var64, var65 = protoModule.readVarInt(p3, var58)
			local _ = var64
			var58 = var65
			continue
		end
		if var59 == protoModule.wireTypes.lengthDelimited then
			if var63 == 1 then
				local _ = nil
				local var66, var67 = protoModule.readBuffer(p3, var58)
				var58 = var67
				var57.kind = { type = "literal", value = buffer.tostring(var66) }
			elseif var63 == 2 then
				local _ = nil
				local var68, var69 = protoModule.readBuffer(p3, var58)
				var58 = var69
				var57.kind = { type = "binding_path", value = buffer.tostring(var68) }
			elseif var63 == 3 then
				local _ = nil
				local var70, var71 = protoModule.readBuffer(p3, var58)
				var58 = var71
				var57.formatter = t.StringFormat_FormatArg_Formatter.decode(var70)
			else
				local _ = nil
				local var72, var73 = protoModule.readVarInt(p3, var58)
				var58 = var73 + var72
			end
		elseif var59 == protoModule.wireTypes.i32 then
			local _ = nil
			local var74, var75 = protoModule.readFixed32(p3, var58)
			local _ = var74
			var58 = var75
		elseif var59 == protoModule.wireTypes.i64 then
			local _ = nil
			local var76, var77 = protoModule.readFixed64(p3, var58)
			local _ = var76
			var58 = var77
		else
			error("Unsupported wire type: " .. var190)
		end
	end
	return var57
end

function t_3:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	if self.formatter ~= nil then
		t.formatter = self.formatter:jsonEncode()
	end
	return t
end

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var78 = t_3.new()
	
	if self.literal ~= nil then
		var78.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var78.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var78.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.formatter ~= nil then
		var78.formatter = t.StringFormat_FormatArg_Formatter.jsonDecode(self.formatter)
	end
	return var78
end

t_3.descriptor = {
	name = "StringFormat_FormatArg",
	fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
}
t.StringFormat_FormatArg = t_3
typeRegistryModule.default:register(t.StringFormat_FormatArg)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p4)
	-- upvalues: t (ref), t_4 (ref)
	return setmetatable({
		type = if p4 == nil or p4.type == nil then assert(t.StringFormat_FormatArg_Formatter_Type.fromNumber(0), "Enum has no 0 default") else p4.type,
		config = if p4 == nil or p4.config == nil then nil else p4.config
	}, t_4)
end

function t_4:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var78 = 0
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= t.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		local var79, var80 = protoModule.writeTag(buff, var78, 1, protoModule.wireTypes.varint)
		var79, var214 = protoModule.writeVarInt(var79, var80, t.StringFormat_FormatArg_Formatter_Type.toNumber(self.type))
		buff = var79
		var78 = var80
	end
	if self.config ~= nil and self.config.type == "date_config" then
		local var81 = self.config.value:encode()
		local var82, var83 = protoModule.writeTag(buff, var78, 2, protoModule.wireTypes.lengthDelimited)
		var82, var217 = protoModule.writeBuffer(var82, var83, var81, buffer.len(var81))
		buff = var82
		var78 = var83
	end
	local buff_1 = buffer.create(var78)
	buffer.copy(buff_1, 0, buff, 0, var78)
	
	return buff_1
end

function t_4.decode(p4)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var78 = t_4.new()
	local var79 = 0
	while var79 < buffer.len(p4) do
		local _ = nil
		local var80 = nil
		local var81, var82, var83 = protoModule.readTag(p4, var79)
		local var84 = var81
		var80 = var82
		var79 = var83
		
		if var80 == protoModule.wireTypes.varint then
			if var84 == 1 then
				local _ = nil
				local var85, var86 = protoModule.readVarIntI32(p4, var79)
				local var87 = var85
				var79 = var86
				var78.type = t.StringFormat_FormatArg_Formatter_Type.fromNumber(var87) or var87
			else
				local _ = nil
				local var88, var89 = protoModule.readVarInt(p4, var79)
				local _ = var88
				var79 = var89
			end
		end
		if var80 == protoModule.wireTypes.lengthDelimited then
			if var84 == 2 then
				local _ = nil
				local var90, var91 = protoModule.readBuffer(p4, var79)
				var79 = var91
				var78.config = {
					type = "date_config",
					value = t.StringFormat_FormatArg_Formatter_DateConfig.decode(var90)
				}
			else
				local _ = nil
				local var92, var93 = protoModule.readVarInt(p4, var79)
				var79 = var93 + var92
			end
		elseif var80 == protoModule.wireTypes.i32 then
			local _ = nil
			local var94, var95 = protoModule.readFixed32(p4, var79)
			local _ = var94
			var79 = var95
		elseif var80 == protoModule.wireTypes.i64 then
			local _ = nil
			local var96, var97 = protoModule.readFixed64(p4, var79)
			local _ = var96
			var79 = var97
		else
			error("Unsupported wire type: " .. var221)
		end
	end
	return var78
end

function t_4:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= t.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		t_1.type = if typeof(self.type) == "number" then self.type else t.StringFormat_FormatArg_Formatter_Type.toNumber(self.type)
	end
	if self.config ~= nil and self.config.type == "date_config" then
		t_1.dateConfig = self.config.value:jsonEncode()
	end
	return t_1
end

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var98 = t_4.new()
	
	if self.type ~= nil then
		var98.type = if typeof(self.type) == "number" then t.StringFormat_FormatArg_Formatter_Type.fromNumber(self.type) or self.type else t.StringFormat_FormatArg_Formatter_Type.fromName(self.type) or self.type
	end
	if self.date_config ~= nil then
		var98.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.date_config)
		}
	end
	if self.dateConfig ~= nil then
		var98.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.dateConfig)
		}
	end
	return var98
end

t_4.descriptor = {
	name = "StringFormat_FormatArg_Formatter",
	fullName = "roblox.apppageplatform.shared.v1beta1.Formatter"
}
t.StringFormat_FormatArg_Formatter = t_4
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p5)
	-- upvalues: t_5 (ref)
	return setmetatable({
		pattern = if p5 == nil or p5.pattern == nil then "" else p5.pattern
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var98 = 0
	
	if self.pattern ~= nil and self.pattern ~= "" then
		local var99, var100 = protoModule.writeTag(buff, var98, 1, protoModule.wireTypes.lengthDelimited)
		var99, var244 = protoModule.writeString(var99, var100, self.pattern)
		buff = var99
		var98 = var100
	end
	local buff_1 = buffer.create(var98)
	buffer.copy(buff_1, 0, buff, 0, var98)
	
	return buff_1
end

function t_5.decode(p5)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var98 = t_5.new()
	local var99 = 0
	while var99 < buffer.len(p5) do
		local _ = nil
		local var100 = nil
		local var101, var102, var103 = protoModule.readTag(p5, var99)
		local var104 = var101
		var100 = var102
		var99 = var103
		
		if var100 == protoModule.wireTypes.varint then
			local _ = nil
			local var105, var106 = protoModule.readVarInt(p5, var99)
			local _ = var105
			var99 = var106
			continue
		end
		if var100 == protoModule.wireTypes.lengthDelimited then
			if var104 == 1 then
				local _ = nil
				local var107, var108 = protoModule.readBuffer(p5, var99)
				var99 = var108
				var98.pattern = buffer.tostring(var107)
			else
				local _ = nil
				local var109, var110 = protoModule.readVarInt(p5, var99)
				var99 = var110 + var109
			end
		elseif var100 == protoModule.wireTypes.i32 then
			local _ = nil
			local var111, var112 = protoModule.readFixed32(p5, var99)
			local _ = var111
			var99 = var112
		elseif var100 == protoModule.wireTypes.i64 then
			local _ = nil
			local var113, var114 = protoModule.readFixed64(p5, var99)
			local _ = var113
			var99 = var114
		else
			error("Unsupported wire type: " .. var248)
		end
	end
	return var98
end

function t_5:jsonEncode()
	local t = {}
	
	if self.pattern ~= nil and self.pattern ~= "" then
		t.pattern = self.pattern
	end
	return t
end

function t_5:jsonDecode()
	-- upvalues: t_5 (ref)
	local var115 = t_5.new()
	
	if self.pattern ~= nil then
		var115.pattern = self.pattern
	end
	return var115
end

t_5.descriptor = {
	name = "StringFormat_FormatArg_Formatter_DateConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.DateConfig"
}
t.StringFormat_FormatArg_Formatter_DateConfig = t_5
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter_DateConfig)
t.StringFormat_FormatArg_Formatter_Type = {
	fromNumber = function(p6)
		return if p6 == 0 then "TYPE_INVALID" elseif p6 == 1 then "TYPE_NUMBER_ABBREVIATE" elseif p6 == 2 then "TYPE_NUMBER_LOCALIZE" elseif p6 == 3 then "TYPE_DATE_FORMAT" else nil
	end,
	toNumber = function(p6)
		return if p6 == "TYPE_INVALID" then 0 elseif p6 == "TYPE_NUMBER_ABBREVIATE" then 1 elseif p6 == "TYPE_NUMBER_LOCALIZE" then 2 elseif p6 == "TYPE_DATE_FORMAT" then 3 else p6
	end,
	fromName = function(p6)
		return if p6 == "TYPE_INVALID" then "TYPE_INVALID" elseif p6 == "TYPE_NUMBER_ABBREVIATE" then "TYPE_NUMBER_ABBREVIATE" elseif p6 == "TYPE_NUMBER_LOCALIZE" then "TYPE_NUMBER_LOCALIZE" elseif p6 == "TYPE_DATE_FORMAT" then "TYPE_DATE_FORMAT" else nil
	end
}
local t_6 = {}
t_6.__index = t_6

function t_6.new(p6)
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p6 == nil or p6.key == nil then "" else p6.key,
		value = if p6 == nil or p6.value == nil then nil else p6.value
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var115 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var116, var117 = protoModule.writeTag(buff, var115, 1, protoModule.wireTypes.lengthDelimited)
		var116, var268 = protoModule.writeString(var116, var117, self.key)
		buff = var116
		var115 = var117
	end
	if self.value ~= nil then
		local var118 = self.value:encode()
		local var119, var120 = protoModule.writeTag(buff, var115, 2, protoModule.wireTypes.lengthDelimited)
		var119, var271 = protoModule.writeBuffer(var119, var120, var118, buffer.len(var118))
		buff = var119
		var115 = var120
	end
	local buff_1 = buffer.create(var115)
	buffer.copy(buff_1, 0, buff, 0, var115)
	
	return buff_1
end

function t_6.decode(p6)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var115 = t_6.new()
	local var116 = 0
	while var116 < buffer.len(p6) do
		local _ = nil
		local var117 = nil
		local var118, var119, var120 = protoModule.readTag(p6, var116)
		local var121 = var118
		var117 = var119
		var116 = var120
		
		if var117 == protoModule.wireTypes.varint then
			local _ = nil
			local var122, var123 = protoModule.readVarInt(p6, var116)
			local _ = var122
			var116 = var123
			continue
		end
		if var117 == protoModule.wireTypes.lengthDelimited then
			if var121 == 1 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p6, var116)
				var116 = var125
				var115.key = buffer.tostring(var124)
			elseif var121 == 2 then
				local _ = nil
				local var126, var127 = protoModule.readBuffer(p6, var116)
				var116 = var127
				var115.value = t.StringFormat_FormatArg.decode(var126)
			else
				local _ = nil
				local var128, var129 = protoModule.readVarInt(p6, var116)
				var116 = var129 + var128
			end
		elseif var117 == protoModule.wireTypes.i32 then
			local _ = nil
			local var130, var131 = protoModule.readFixed32(p6, var116)
			local _ = var130
			var116 = var131
		elseif var117 == protoModule.wireTypes.i64 then
			local _ = nil
			local var132, var133 = protoModule.readFixed64(p6, var116)
			local _ = var132
			var116 = var133
		else
			error("Unsupported wire type: " .. var275)
		end
	end
	return var115
end

function t_6:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var134 = t_6.new()
	
	if self.key ~= nil then
		var134.key = self.key
	end
	if self.value ~= nil then
		var134.value = t.StringFormat_FormatArg.jsonDecode(self.value)
	end
	return var134
end

t_6.descriptor = {
	name = "StringFormat_ArgsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
}
t.StringFormat_ArgsEntry = t_6
typeRegistryModule.default:register(t.StringFormat_ArgsEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p7)
	-- upvalues: t_7 (ref)
	return setmetatable({
		kind = if p7 == nil or p7.kind == nil then nil else p7.kind
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var134 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var135, var136 = protoModule.writeTag(buff, var134, 1, protoModule.wireTypes.lengthDelimited)
			var135, var297 = protoModule.writeString(var135, var136, self.kind.value)
			buff = var135
			var134 = var136
		elseif self.kind.type == "binding_path" then
			local var137, var138 = protoModule.writeTag(buff, var134, 2, protoModule.wireTypes.lengthDelimited)
			var137, var299 = protoModule.writeString(var137, var138, self.kind.value)
			buff = var137
			var134 = var138
		elseif self.kind.type == "token" then
			local var139, var140 = protoModule.writeTag(buff, var134, 3, protoModule.wireTypes.lengthDelimited)
			var139, var301 = protoModule.writeString(var139, var140, self.kind.value)
			buff = var139
			var134 = var140
		elseif self.kind.type == "format" then
			local var141 = self.kind.value:encode()
			local var142, var143 = protoModule.writeTag(buff, var134, 4, protoModule.wireTypes.lengthDelimited)
			var142, var304 = protoModule.writeBuffer(var142, var143, var141, buffer.len(var141))
			buff = var142
			var134 = var143
		elseif self.kind.type == "conditional" then
			local var144 = self.kind.value:encode()
			local var145, var146 = protoModule.writeTag(buff, var134, 5, protoModule.wireTypes.lengthDelimited)
			var145, var307 = protoModule.writeBuffer(var145, var146, var144, buffer.len(var144))
			buff = var145
			var134 = var146
		elseif self.kind.type == "translation" then
			local var147 = self.kind.value:encode()
			local var148, var149 = protoModule.writeTag(buff, var134, 6, protoModule.wireTypes.lengthDelimited)
			var148, var310 = protoModule.writeBuffer(var148, var149, var147, buffer.len(var147))
			buff = var148
			var134 = var149
		end
	end
	local buff_1 = buffer.create(var134)
	buffer.copy(buff_1, 0, buff, 0, var134)
	
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
				var134.kind = { type = "literal", value = buffer.tostring(var143) }
			elseif var140 == 2 then
				local _ = nil
				local var145, var146 = protoModule.readBuffer(p7, var135)
				var135 = var146
				var134.kind = { type = "binding_path", value = buffer.tostring(var145) }
			elseif var140 == 3 then
				local _ = nil
				local var147, var148 = protoModule.readBuffer(p7, var135)
				var135 = var148
				var134.kind = { type = "token", value = buffer.tostring(var147) }
			elseif var140 == 4 then
				local _ = nil
				local var149, var150 = protoModule.readBuffer(p7, var135)
				var135 = var150
				var134.kind = { type = "format", value = t.StringFormat.decode(var149) }
			elseif var140 == 5 then
				local _ = nil
				local var151, var152 = protoModule.readBuffer(p7, var135)
				var135 = var152
				var134.kind = {
					type = "conditional",
					value = t.StringProp_ConditionalOptions.decode(var151)
				}
			elseif var140 == 6 then
				local _ = nil
				local var153, var154 = protoModule.readBuffer(p7, var135)
				var135 = var154
				var134.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var153)
				}
			else
				local _ = nil
				local var155, var156 = protoModule.readVarInt(p7, var135)
				var135 = var156 + var155
			end
		elseif var136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var157, var158 = protoModule.readFixed32(p7, var135)
			local _ = var157
			var135 = var158
		elseif var136 == protoModule.wireTypes.i64 then
			local _ = nil
			local var159, var160 = protoModule.readFixed64(p7, var135)
			local _ = var159
			var135 = var160
		else
			error("Unsupported wire type: " .. var314)
		end
	end
	return var134
end

function t_7:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref), t (ref)
	local var161 = t_7.new()
	
	if self.literal ~= nil then
		var161.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var161.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var161.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var161.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var161.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var161.kind = {
			type = "conditional",
			value = t.StringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var161.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var161
end

t_7.descriptor = {
	name = "StringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
}
t.StringProp = t_7
typeRegistryModule.default:register(t.StringProp)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p8)
	-- upvalues: t_8 (ref)
	return setmetatable({
		condition = if p8 == nil or p8.condition == nil then nil else p8.condition,
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var161 = 0
	
	if self.condition ~= nil then
		local var162 = self.condition:encode()
		local var163, var164 = protoModule.writeTag(buff, var161, 1, protoModule.wireTypes.lengthDelimited)
		var163, var345 = protoModule.writeBuffer(var163, var164, var162, buffer.len(var162))
		buff = var163
		var161 = var164
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var165, var166 = protoModule.writeTag(buff, var161, 2, protoModule.wireTypes.lengthDelimited)
			var165, var347 = protoModule.writeString(var165, var166, self.kind.value)
			buff = var165
			var161 = var166
		elseif self.kind.type == "binding_path" then
			local var167, var168 = protoModule.writeTag(buff, var161, 3, protoModule.wireTypes.lengthDelimited)
			var167, var349 = protoModule.writeString(var167, var168, self.kind.value)
			buff = var167
			var161 = var168
		elseif self.kind.type == "token" then
			local var169, var170 = protoModule.writeTag(buff, var161, 4, protoModule.wireTypes.lengthDelimited)
			var169, var351 = protoModule.writeString(var169, var170, self.kind.value)
			buff = var169
			var161 = var170
		elseif self.kind.type == "format" then
			local var171 = self.kind.value:encode()
			local var172, var173 = protoModule.writeTag(buff, var161, 5, protoModule.wireTypes.lengthDelimited)
			var172, var354 = protoModule.writeBuffer(var172, var173, var171, buffer.len(var171))
			buff = var172
			var161 = var173
		elseif self.kind.type == "translation" then
			local var174 = self.kind.value:encode()
			local var175, var176 = protoModule.writeTag(buff, var161, 6, protoModule.wireTypes.lengthDelimited)
			var175, var357 = protoModule.writeBuffer(var175, var176, var174, buffer.len(var174))
			buff = var175
			var161 = var176
		end
	end
	local buff_1 = buffer.create(var161)
	buffer.copy(buff_1, 0, buff, 0, var161)
	
	return buff_1
end

function t_8.decode(p8)
	-- upvalues: t_8 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var161 = t_8.new()
	local var162 = 0
	while var162 < buffer.len(p8) do
		local _ = nil
		local var163 = nil
		local var164, var165, var166 = protoModule.readTag(p8, var162)
		local var167 = var164
		var163 = var165
		var162 = var166
		
		if var163 == protoModule.wireTypes.varint then
			local _ = nil
			local var168, var169 = protoModule.readVarInt(p8, var162)
			local _ = var168
			var162 = var169
			continue
		end
		if var163 == protoModule.wireTypes.lengthDelimited then
			if var167 == 1 then
				local _ = nil
				local var170, var171 = protoModule.readBuffer(p8, var162)
				var162 = var171
				var161.condition = propConditionModule.PropCondition.decode(var170)
			elseif var167 == 2 then
				local _ = nil
				local var172, var173 = protoModule.readBuffer(p8, var162)
				var162 = var173
				var161.kind = { type = "literal", value = buffer.tostring(var172) }
			elseif var167 == 3 then
				local _ = nil
				local var174, var175 = protoModule.readBuffer(p8, var162)
				var162 = var175
				var161.kind = { type = "binding_path", value = buffer.tostring(var174) }
			elseif var167 == 4 then
				local _ = nil
				local var176, var177 = protoModule.readBuffer(p8, var162)
				var162 = var177
				var161.kind = { type = "token", value = buffer.tostring(var176) }
			elseif var167 == 5 then
				local _ = nil
				local var178, var179 = protoModule.readBuffer(p8, var162)
				var162 = var179
				var161.kind = { type = "format", value = t.StringFormat.decode(var178) }
			elseif var167 == 6 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p8, var162)
				var162 = var181
				var161.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var180)
				}
			else
				local _ = nil
				local var182, var183 = protoModule.readVarInt(p8, var162)
				var162 = var183 + var182
			end
		elseif var163 == protoModule.wireTypes.i32 then
			local _ = nil
			local var184, var185 = protoModule.readFixed32(p8, var162)
			local _ = var184
			var162 = var185
		elseif var163 == protoModule.wireTypes.i64 then
			local _ = nil
			local var186, var187 = protoModule.readFixed64(p8, var162)
			local _ = var186
			var162 = var187
		else
			error("Unsupported wire type: " .. var361)
		end
	end
	return var161
end

function t_8:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), propConditionModule (ref), t (ref)
	local var188 = t_8.new()
	
	if self.condition ~= nil then
		var188.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var188.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var188.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var188.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var188.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var188.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var188.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var188
end

t_8.descriptor = {
	name = "StringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StringProp_ConditionalOption = t_8
typeRegistryModule.default:register(t.StringProp_ConditionalOption)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p9)
	-- upvalues: t_9 (ref)
	return setmetatable({
		options = if p9 == nil or p9.options == nil then {} else p9.options
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var188 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var189 = v:encode()
			local var190, var191 = protoModule.writeTag(buff, var188, 1, protoModule.wireTypes.lengthDelimited)
			var190, var392 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
			buff = var190
			var188 = var191
		end
	end
	local buff_1 = buffer.create(var188)
	buffer.copy(buff_1, 0, buff, 0, var188)
	
	return buff_1
end

function t_9.decode(p9)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var192 = t_9.new()
	local var193 = 0
	while var193 < buffer.len(p9) do
		local _ = nil
		local var194 = nil
		local var195, var196, var197 = protoModule.readTag(p9, var193)
		local var198 = var195
		var194 = var196
		var193 = var197
		
		if var194 == protoModule.wireTypes.varint then
			local _ = nil
			local var199, var200 = protoModule.readVarInt(p9, var193)
			local _ = var199
			var193 = var200
			continue
		end
		if var194 == protoModule.wireTypes.lengthDelimited then
			if var198 == 1 then
				local _ = nil
				local var201, var202 = protoModule.readBuffer(p9, var193)
				var193 = var202
				table.insert(var192.options, t.StringProp_ConditionalOption.decode(var201))
			else
				local _ = nil
				local var203, var204 = protoModule.readVarInt(p9, var193)
				var193 = var204 + var203
			end
		elseif var194 == protoModule.wireTypes.i32 then
			local _ = nil
			local var205, var206 = protoModule.readFixed32(p9, var193)
			local _ = var205
			var193 = var206
		elseif var194 == protoModule.wireTypes.i64 then
			local _ = nil
			local var207, var208 = protoModule.readFixed64(p9, var193)
			local _ = var207
			var193 = var208
		else
			error("Unsupported wire type: " .. var396)
		end
	end
	return var192
end

function t_9:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var209 = t_9.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StringProp_ConditionalOption.jsonDecode(v))
		end
		var209.options = t_1
	end
	return var209
end

t_9.descriptor = {
	name = "StringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StringProp_ConditionalOptions = t_9
typeRegistryModule.default:register(t.StringProp_ConditionalOptions)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p10)
	-- upvalues: t_10 (ref)
	return setmetatable({
		kind = if p10 == nil or p10.kind == nil then nil else p10.kind
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var210 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var211, var212 = protoModule.writeTag(buff, var210, 1, protoModule.wireTypes.i32)
			var211, var418 = protoModule.writeFloat(var211, var212, self.kind.value)
			buff = var211
			var210 = var212
		elseif self.kind.type == "binding_path" then
			local var213, var214 = protoModule.writeTag(buff, var210, 2, protoModule.wireTypes.lengthDelimited)
			var213, var420 = protoModule.writeString(var213, var214, self.kind.value)
			buff = var213
			var210 = var214
		elseif self.kind.type == "token" then
			local var215, var216 = protoModule.writeTag(buff, var210, 3, protoModule.wireTypes.lengthDelimited)
			var215, var422 = protoModule.writeString(var215, var216, self.kind.value)
			buff = var215
			var210 = var216
		elseif self.kind.type == "conditional" then
			local var217 = self.kind.value:encode()
			local var218, var219 = protoModule.writeTag(buff, var210, 4, protoModule.wireTypes.lengthDelimited)
			var218, var425 = protoModule.writeBuffer(var218, var219, var217, buffer.len(var217))
			buff = var218
			var210 = var219
		end
	end
	local buff_1 = buffer.create(var210)
	buffer.copy(buff_1, 0, buff, 0, var210)
	
	return buff_1
end

function t_10.decode(p10)
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var210 = t_10.new()
	local var211 = 0
	while var211 < buffer.len(p10) do
		local _ = nil
		local var212 = nil
		local var213, var214, var215 = protoModule.readTag(p10, var211)
		local var216 = var213
		var212 = var214
		var211 = var215
		
		if var212 == protoModule.wireTypes.varint then
			local _ = nil
			local var217, var218 = protoModule.readVarInt(p10, var211)
			local _ = var217
			var211 = var218
			continue
		end
		if var212 == protoModule.wireTypes.lengthDelimited then
			if var216 == 2 then
				local _ = nil
				local var219, var220 = protoModule.readBuffer(p10, var211)
				var211 = var220
				var210.kind = { type = "binding_path", value = buffer.tostring(var219) }
			elseif var216 == 3 then
				local _ = nil
				local var221, var222 = protoModule.readBuffer(p10, var211)
				var211 = var222
				var210.kind = { type = "token", value = buffer.tostring(var221) }
			elseif var216 == 4 then
				local _ = nil
				local var223, var224 = protoModule.readBuffer(p10, var211)
				var211 = var224
				var210.kind = {
					type = "conditional",
					value = t.FloatProp_ConditionalOptions.decode(var223)
				}
			else
				local _ = nil
				local var225, var226 = protoModule.readVarInt(p10, var211)
				var211 = var226 + var225
			end
		elseif var212 == protoModule.wireTypes.i32 then
			if var216 == 1 then
				local _ = nil
				local var227, var228 = protoModule.readFloat(p10, var211)
				var211 = var228
				var210.kind = { type = "literal", value = var227 }
			else
				local _ = nil
				local var229, var230 = protoModule.readFixed32(p10, var211)
				local _ = var229
				var211 = var230
			end
		elseif var212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var231, var232 = protoModule.readFixed64(p10, var211)
			local _ = var231
			var211 = var232
		else
			error("Unsupported wire type: " .. var429)
		end
	end
	return var210
end

function t_10:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = protoModule.json.serializeNumber(self.kind.value)
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_10:jsonDecode()
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var233 = t_10.new()
	
	if self.literal ~= nil then
		var233.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var233.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var233.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var233.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var233.kind = {
			type = "conditional",
			value = t.FloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var233
end

t_10.descriptor = {
	name = "FloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
}
t.FloatProp = t_10
typeRegistryModule.default:register(t.FloatProp)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p11)
	-- upvalues: t_11 (ref)
	return setmetatable({
		condition = if p11 == nil or p11.condition == nil then nil else p11.condition,
		kind = if p11 == nil or p11.kind == nil then nil else p11.kind
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var233 = 0
	
	if self.condition ~= nil then
		local var234 = self.condition:encode()
		local var235, var236 = protoModule.writeTag(buff, var233, 1, protoModule.wireTypes.lengthDelimited)
		var235, var456 = protoModule.writeBuffer(var235, var236, var234, buffer.len(var234))
		buff = var235
		var233 = var236
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var237, var238 = protoModule.writeTag(buff, var233, 2, protoModule.wireTypes.i32)
			var237, var458 = protoModule.writeFloat(var237, var238, self.kind.value)
			buff = var237
			var233 = var238
		elseif self.kind.type == "binding_path" then
			local var239, var240 = protoModule.writeTag(buff, var233, 3, protoModule.wireTypes.lengthDelimited)
			var239, var460 = protoModule.writeString(var239, var240, self.kind.value)
			buff = var239
			var233 = var240
		elseif self.kind.type == "token" then
			local var241, var242 = protoModule.writeTag(buff, var233, 4, protoModule.wireTypes.lengthDelimited)
			var241, var462 = protoModule.writeString(var241, var242, self.kind.value)
			buff = var241
			var233 = var242
		end
	end
	local buff_1 = buffer.create(var233)
	buffer.copy(buff_1, 0, buff, 0, var233)
	
	return buff_1
end

function t_11.decode(p11)
	-- upvalues: t_11 (ref), protoModule (ref), propConditionModule (ref)
	local var233 = t_11.new()
	local var234 = 0
	while var234 < buffer.len(p11) do
		local _ = nil
		local var235 = nil
		local var236, var237, var238 = protoModule.readTag(p11, var234)
		local var239 = var236
		var235 = var237
		var234 = var238
		
		if var235 == protoModule.wireTypes.varint then
			local _ = nil
			local var240, var241 = protoModule.readVarInt(p11, var234)
			local _ = var240
			var234 = var241
			continue
		end
		if var235 == protoModule.wireTypes.lengthDelimited then
			if var239 == 1 then
				local _ = nil
				local var242, var243 = protoModule.readBuffer(p11, var234)
				var234 = var243
				var233.condition = propConditionModule.PropCondition.decode(var242)
			elseif var239 == 3 then
				local _ = nil
				local var244, var245 = protoModule.readBuffer(p11, var234)
				var234 = var245
				var233.kind = { type = "binding_path", value = buffer.tostring(var244) }
			elseif var239 == 4 then
				local _ = nil
				local var246, var247 = protoModule.readBuffer(p11, var234)
				var234 = var247
				var233.kind = { type = "token", value = buffer.tostring(var246) }
			else
				local _ = nil
				local var248, var249 = protoModule.readVarInt(p11, var234)
				var234 = var249 + var248
			end
		elseif var235 == protoModule.wireTypes.i32 then
			if var239 == 2 then
				local _ = nil
				local var250, var251 = protoModule.readFloat(p11, var234)
				var234 = var251
				var233.kind = { type = "literal", value = var250 }
			else
				local _ = nil
				local var252, var253 = protoModule.readFixed32(p11, var234)
				local _ = var252
				var234 = var253
			end
		elseif var235 == protoModule.wireTypes.i64 then
			local _ = nil
			local var254, var255 = protoModule.readFixed64(p11, var234)
			local _ = var254
			var234 = var255
		else
			error("Unsupported wire type: " .. var466)
		end
	end
	return var233
end

function t_11:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = protoModule.json.serializeNumber(self.kind.value)
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref), propConditionModule (ref), protoModule (ref)
	local var256 = t_11.new()
	
	if self.condition ~= nil then
		var256.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var256.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var256.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var256.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var256.kind = { type = "token", value = self.token }
	end
	return var256
end

t_11.descriptor = {
	name = "FloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FloatProp_ConditionalOption = t_11
typeRegistryModule.default:register(t.FloatProp_ConditionalOption)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p12)
	-- upvalues: t_12 (ref)
	return setmetatable({
		options = if p12 == nil or p12.options == nil then {} else p12.options
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var256 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var257 = v:encode()
			local var258, var259 = protoModule.writeTag(buff, var256, 1, protoModule.wireTypes.lengthDelimited)
			var258, var493 = protoModule.writeBuffer(var258, var259, var257, buffer.len(var257))
			buff = var258
			var256 = var259
		end
	end
	local buff_1 = buffer.create(var256)
	buffer.copy(buff_1, 0, buff, 0, var256)
	
	return buff_1
end

function t_12.decode(p12)
	-- upvalues: t_12 (ref), protoModule (ref), t (ref)
	local var260 = t_12.new()
	local var261 = 0
	while var261 < buffer.len(p12) do
		local _ = nil
		local var262 = nil
		local var263, var264, var265 = protoModule.readTag(p12, var261)
		local var266 = var263
		var262 = var264
		var261 = var265
		
		if var262 == protoModule.wireTypes.varint then
			local _ = nil
			local var267, var268 = protoModule.readVarInt(p12, var261)
			local _ = var267
			var261 = var268
			continue
		end
		if var262 == protoModule.wireTypes.lengthDelimited then
			if var266 == 1 then
				local _ = nil
				local var269, var270 = protoModule.readBuffer(p12, var261)
				var261 = var270
				table.insert(var260.options, t.FloatProp_ConditionalOption.decode(var269))
			else
				local _ = nil
				local var271, var272 = protoModule.readVarInt(p12, var261)
				var261 = var272 + var271
			end
		elseif var262 == protoModule.wireTypes.i32 then
			local _ = nil
			local var273, var274 = protoModule.readFixed32(p12, var261)
			local _ = var273
			var261 = var274
		elseif var262 == protoModule.wireTypes.i64 then
			local _ = nil
			local var275, var276 = protoModule.readFixed64(p12, var261)
			local _ = var275
			var261 = var276
		else
			error("Unsupported wire type: " .. var497)
		end
	end
	return var260
end

function t_12:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref), t (ref)
	local var277 = t_12.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FloatProp_ConditionalOption.jsonDecode(v))
		end
		var277.options = t_1
	end
	return var277
end

t_12.descriptor = {
	name = "FloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FloatProp_ConditionalOptions = t_12
typeRegistryModule.default:register(t.FloatProp_ConditionalOptions)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p13)
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p13 == nil or p13.kind == nil then nil else p13.kind
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var278 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var279, var280 = protoModule.writeTag(buff, var278, 1, protoModule.wireTypes.i64)
			var279, var519 = protoModule.writeDouble(var279, var280, self.kind.value)
			buff = var279
			var278 = var280
		elseif self.kind.type == "binding_path" then
			local var281, var282 = protoModule.writeTag(buff, var278, 2, protoModule.wireTypes.lengthDelimited)
			var281, var521 = protoModule.writeString(var281, var282, self.kind.value)
			buff = var281
			var278 = var282
		elseif self.kind.type == "token" then
			local var283, var284 = protoModule.writeTag(buff, var278, 3, protoModule.wireTypes.lengthDelimited)
			var283, var523 = protoModule.writeString(var283, var284, self.kind.value)
			buff = var283
			var278 = var284
		elseif self.kind.type == "conditional" then
			local var285 = self.kind.value:encode()
			local var286, var287 = protoModule.writeTag(buff, var278, 4, protoModule.wireTypes.lengthDelimited)
			var286, var526 = protoModule.writeBuffer(var286, var287, var285, buffer.len(var285))
			buff = var286
			var278 = var287
		end
	end
	local buff_1 = buffer.create(var278)
	buffer.copy(buff_1, 0, buff, 0, var278)
	
	return buff_1
end

function t_13.decode(p13)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var278 = t_13.new()
	local var279 = 0
	while var279 < buffer.len(p13) do
		local _ = nil
		local var280 = nil
		local var281, var282, var283 = protoModule.readTag(p13, var279)
		local var284 = var281
		var280 = var282
		var279 = var283
		
		if var280 == protoModule.wireTypes.varint then
			local _ = nil
			local var285, var286 = protoModule.readVarInt(p13, var279)
			local _ = var285
			var279 = var286
			continue
		end
		if var280 == protoModule.wireTypes.lengthDelimited then
			if var284 == 2 then
				local _ = nil
				local var287, var288 = protoModule.readBuffer(p13, var279)
				var279 = var288
				var278.kind = { type = "binding_path", value = buffer.tostring(var287) }
			elseif var284 == 3 then
				local _ = nil
				local var289, var290 = protoModule.readBuffer(p13, var279)
				var279 = var290
				var278.kind = { type = "token", value = buffer.tostring(var289) }
			elseif var284 == 4 then
				local _ = nil
				local var291, var292 = protoModule.readBuffer(p13, var279)
				var279 = var292
				var278.kind = {
					type = "conditional",
					value = t.DoubleProp_ConditionalOptions.decode(var291)
				}
			else
				local _ = nil
				local var293, var294 = protoModule.readVarInt(p13, var279)
				var279 = var294 + var293
			end
		elseif var280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var295, var296 = protoModule.readFixed32(p13, var279)
			local _ = var295
			var279 = var296
		elseif var280 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var530)
		elseif var284 == 1 then
			local _ = nil
			local var297, var298 = protoModule.readDouble(p13, var279)
			var279 = var298
			var278.kind = { type = "literal", value = var297 }
		else
			local _ = nil
			local var299, var300 = protoModule.readFixed64(p13, var279)
			local _ = var299
			var279 = var300
		end
	end
	return var278
end

function t_13:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = protoModule.json.serializeNumber(self.kind.value)
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_13:jsonDecode()
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var301 = t_13.new()
	
	if self.literal ~= nil then
		var301.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var301.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var301.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var301.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var301.kind = {
			type = "conditional",
			value = t.DoubleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var301
end

t_13.descriptor = {
	name = "DoubleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
}
t.DoubleProp = t_13
typeRegistryModule.default:register(t.DoubleProp)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p14)
	-- upvalues: t_14 (ref)
	return setmetatable({
		condition = if p14 == nil or p14.condition == nil then nil else p14.condition,
		kind = if p14 == nil or p14.kind == nil then nil else p14.kind
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var301 = 0
	
	if self.condition ~= nil then
		local var302 = self.condition:encode()
		local var303, var304 = protoModule.writeTag(buff, var301, 1, protoModule.wireTypes.lengthDelimited)
		var303, var557 = protoModule.writeBuffer(var303, var304, var302, buffer.len(var302))
		buff = var303
		var301 = var304
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var305, var306 = protoModule.writeTag(buff, var301, 2, protoModule.wireTypes.i64)
			var305, var559 = protoModule.writeDouble(var305, var306, self.kind.value)
			buff = var305
			var301 = var306
		elseif self.kind.type == "binding_path" then
			local var307, var308 = protoModule.writeTag(buff, var301, 3, protoModule.wireTypes.lengthDelimited)
			var307, var561 = protoModule.writeString(var307, var308, self.kind.value)
			buff = var307
			var301 = var308
		elseif self.kind.type == "token" then
			local var309, var310 = protoModule.writeTag(buff, var301, 4, protoModule.wireTypes.lengthDelimited)
			var309, var563 = protoModule.writeString(var309, var310, self.kind.value)
			buff = var309
			var301 = var310
		end
	end
	local buff_1 = buffer.create(var301)
	buffer.copy(buff_1, 0, buff, 0, var301)
	
	return buff_1
end

function t_14.decode(p14)
	-- upvalues: t_14 (ref), protoModule (ref), propConditionModule (ref)
	local var301 = t_14.new()
	local var302 = 0
	while var302 < buffer.len(p14) do
		local _ = nil
		local var303 = nil
		local var304, var305, var306 = protoModule.readTag(p14, var302)
		local var307 = var304
		var303 = var305
		var302 = var306
		
		if var303 == protoModule.wireTypes.varint then
			local _ = nil
			local var308, var309 = protoModule.readVarInt(p14, var302)
			local _ = var308
			var302 = var309
			continue
		end
		if var303 == protoModule.wireTypes.lengthDelimited then
			if var307 == 1 then
				local _ = nil
				local var310, var311 = protoModule.readBuffer(p14, var302)
				var302 = var311
				var301.condition = propConditionModule.PropCondition.decode(var310)
			elseif var307 == 3 then
				local _ = nil
				local var312, var313 = protoModule.readBuffer(p14, var302)
				var302 = var313
				var301.kind = { type = "binding_path", value = buffer.tostring(var312) }
			elseif var307 == 4 then
				local _ = nil
				local var314, var315 = protoModule.readBuffer(p14, var302)
				var302 = var315
				var301.kind = { type = "token", value = buffer.tostring(var314) }
			else
				local _ = nil
				local var316, var317 = protoModule.readVarInt(p14, var302)
				var302 = var317 + var316
			end
		elseif var303 == protoModule.wireTypes.i32 then
			local _ = nil
			local var318, var319 = protoModule.readFixed32(p14, var302)
			local _ = var318
			var302 = var319
		elseif var303 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var567)
		elseif var307 == 2 then
			local _ = nil
			local var320, var321 = protoModule.readDouble(p14, var302)
			var302 = var321
			var301.kind = { type = "literal", value = var320 }
		else
			local _ = nil
			local var322, var323 = protoModule.readFixed64(p14, var302)
			local _ = var322
			var302 = var323
		end
	end
	return var301
end

function t_14:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = protoModule.json.serializeNumber(self.kind.value)
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), propConditionModule (ref), protoModule (ref)
	local var324 = t_14.new()
	
	if self.condition ~= nil then
		var324.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var324.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var324.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var324.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var324.kind = { type = "token", value = self.token }
	end
	return var324
end

t_14.descriptor = {
	name = "DoubleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.DoubleProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.DoubleProp_ConditionalOption)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p15)
	-- upvalues: t_15 (ref)
	return setmetatable({
		options = if p15 == nil or p15.options == nil then {} else p15.options
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var324 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var325 = v:encode()
			local var326, var327 = protoModule.writeTag(buff, var324, 1, protoModule.wireTypes.lengthDelimited)
			var326, var594 = protoModule.writeBuffer(var326, var327, var325, buffer.len(var325))
			buff = var326
			var324 = var327
		end
	end
	local buff_1 = buffer.create(var324)
	buffer.copy(buff_1, 0, buff, 0, var324)
	
	return buff_1
end

function t_15.decode(p15)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var328 = t_15.new()
	local var329 = 0
	while var329 < buffer.len(p15) do
		local _ = nil
		local var330 = nil
		local var331, var332, var333 = protoModule.readTag(p15, var329)
		local var334 = var331
		var330 = var332
		var329 = var333
		
		if var330 == protoModule.wireTypes.varint then
			local _ = nil
			local var335, var336 = protoModule.readVarInt(p15, var329)
			local _ = var335
			var329 = var336
			continue
		end
		if var330 == protoModule.wireTypes.lengthDelimited then
			if var334 == 1 then
				local _ = nil
				local var337, var338 = protoModule.readBuffer(p15, var329)
				var329 = var338
				table.insert(var328.options, t.DoubleProp_ConditionalOption.decode(var337))
			else
				local _ = nil
				local var339, var340 = protoModule.readVarInt(p15, var329)
				var329 = var340 + var339
			end
		elseif var330 == protoModule.wireTypes.i32 then
			local _ = nil
			local var341, var342 = protoModule.readFixed32(p15, var329)
			local _ = var341
			var329 = var342
		elseif var330 == protoModule.wireTypes.i64 then
			local _ = nil
			local var343, var344 = protoModule.readFixed64(p15, var329)
			local _ = var343
			var329 = var344
		else
			error("Unsupported wire type: " .. var598)
		end
	end
	return var328
end

function t_15:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_15:jsonDecode()
	-- upvalues: t_15 (ref), t (ref)
	local var345 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.DoubleProp_ConditionalOption.jsonDecode(v))
		end
		var345.options = t_1
	end
	return var345
end

t_15.descriptor = {
	name = "DoubleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.DoubleProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.DoubleProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p16)
	-- upvalues: t_16 (ref)
	return setmetatable({
		kind = if p16 == nil or p16.kind == nil then nil else p16.kind
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var346 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var347, var348 = protoModule.writeTag(buff, var346, 1, protoModule.wireTypes.varint)
			var347, var620 = protoModule.writeVarInt(var347, var348, self.kind.value)
			buff = var347
			var346 = var348
		elseif self.kind.type == "binding_path" then
			local var349, var350 = protoModule.writeTag(buff, var346, 2, protoModule.wireTypes.lengthDelimited)
			var349, var622 = protoModule.writeString(var349, var350, self.kind.value)
			buff = var349
			var346 = var350
		elseif self.kind.type == "token" then
			local var351, var352 = protoModule.writeTag(buff, var346, 3, protoModule.wireTypes.lengthDelimited)
			var351, var624 = protoModule.writeString(var351, var352, self.kind.value)
			buff = var351
			var346 = var352
		elseif self.kind.type == "conditional" then
			local var353 = self.kind.value:encode()
			local var354, var355 = protoModule.writeTag(buff, var346, 4, protoModule.wireTypes.lengthDelimited)
			var354, var627 = protoModule.writeBuffer(var354, var355, var353, buffer.len(var353))
			buff = var354
			var346 = var355
		end
	end
	local buff_1 = buffer.create(var346)
	buffer.copy(buff_1, 0, buff, 0, var346)
	
	return buff_1
end

function t_16.decode(p16)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var346 = t_16.new()
	local var347 = 0
	while var347 < buffer.len(p16) do
		local _ = nil
		local var348 = nil
		local var349, var350, var351 = protoModule.readTag(p16, var347)
		local var352 = var349
		var348 = var350
		var347 = var351
		
		if var348 == protoModule.wireTypes.varint then
			if var352 == 1 then
				local _ = nil
				local var353, var354 = protoModule.readVarIntI32(p16, var347)
				var347 = var354
				var346.kind = { type = "literal", value = var353 }
			else
				local _ = nil
				local var355, var356 = protoModule.readVarInt(p16, var347)
				local _ = var355
				var347 = var356
			end
		end
		if var348 == protoModule.wireTypes.lengthDelimited then
			if var352 == 2 then
				local _ = nil
				local var357, var358 = protoModule.readBuffer(p16, var347)
				var347 = var358
				var346.kind = { type = "binding_path", value = buffer.tostring(var357) }
			elseif var352 == 3 then
				local _ = nil
				local var359, var360 = protoModule.readBuffer(p16, var347)
				var347 = var360
				var346.kind = { type = "token", value = buffer.tostring(var359) }
			elseif var352 == 4 then
				local _ = nil
				local var361, var362 = protoModule.readBuffer(p16, var347)
				var347 = var362
				var346.kind = {
					type = "conditional",
					value = t.Int32Prop_ConditionalOptions.decode(var361)
				}
			else
				local _ = nil
				local var363, var364 = protoModule.readVarInt(p16, var347)
				var347 = var364 + var363
			end
		elseif var348 == protoModule.wireTypes.i32 then
			local _ = nil
			local var365, var366 = protoModule.readFixed32(p16, var347)
			local _ = var365
			var347 = var366
		elseif var348 == protoModule.wireTypes.i64 then
			local _ = nil
			local var367, var368 = protoModule.readFixed64(p16, var347)
			local _ = var367
			var347 = var368
		else
			error("Unsupported wire type: " .. var631)
		end
	end
	return var346
end

function t_16:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_16:jsonDecode()
	-- upvalues: t_16 (ref), t (ref)
	local var369 = t_16.new()
	
	if self.literal ~= nil then
		var369.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var369.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var369.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var369.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var369.kind = {
			type = "conditional",
			value = t.Int32Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var369
end

t_16.descriptor = {
	name = "Int32Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
}
t.Int32Prop = t_16
typeRegistryModule.default:register(t.Int32Prop)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p17)
	-- upvalues: t_17 (ref)
	return setmetatable({
		condition = if p17 == nil or p17.condition == nil then nil else p17.condition,
		kind = if p17 == nil or p17.kind == nil then nil else p17.kind
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var369 = 0
	
	if self.condition ~= nil then
		local var370 = self.condition:encode()
		local var371, var372 = protoModule.writeTag(buff, var369, 1, protoModule.wireTypes.lengthDelimited)
		var371, var658 = protoModule.writeBuffer(var371, var372, var370, buffer.len(var370))
		buff = var371
		var369 = var372
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var373, var374 = protoModule.writeTag(buff, var369, 2, protoModule.wireTypes.varint)
			var373, var660 = protoModule.writeVarInt(var373, var374, self.kind.value)
			buff = var373
			var369 = var374
		elseif self.kind.type == "binding_path" then
			local var375, var376 = protoModule.writeTag(buff, var369, 3, protoModule.wireTypes.lengthDelimited)
			var375, var662 = protoModule.writeString(var375, var376, self.kind.value)
			buff = var375
			var369 = var376
		elseif self.kind.type == "token" then
			local var377, var378 = protoModule.writeTag(buff, var369, 4, protoModule.wireTypes.lengthDelimited)
			var377, var664 = protoModule.writeString(var377, var378, self.kind.value)
			buff = var377
			var369 = var378
		end
	end
	local buff_1 = buffer.create(var369)
	buffer.copy(buff_1, 0, buff, 0, var369)
	
	return buff_1
end

function t_17.decode(p17)
	-- upvalues: t_17 (ref), protoModule (ref), propConditionModule (ref)
	local var369 = t_17.new()
	local var370 = 0
	while var370 < buffer.len(p17) do
		local _ = nil
		local var371 = nil
		local var372, var373, var374 = protoModule.readTag(p17, var370)
		local var375 = var372
		var371 = var373
		var370 = var374
		
		if var371 == protoModule.wireTypes.varint then
			if var375 == 2 then
				local _ = nil
				local var376, var377 = protoModule.readVarIntI32(p17, var370)
				var370 = var377
				var369.kind = { type = "literal", value = var376 }
			else
				local _ = nil
				local var378, var379 = protoModule.readVarInt(p17, var370)
				local _ = var378
				var370 = var379
			end
		end
		if var371 == protoModule.wireTypes.lengthDelimited then
			if var375 == 1 then
				local _ = nil
				local var380, var381 = protoModule.readBuffer(p17, var370)
				var370 = var381
				var369.condition = propConditionModule.PropCondition.decode(var380)
			elseif var375 == 3 then
				local _ = nil
				local var382, var383 = protoModule.readBuffer(p17, var370)
				var370 = var383
				var369.kind = { type = "binding_path", value = buffer.tostring(var382) }
			elseif var375 == 4 then
				local _ = nil
				local var384, var385 = protoModule.readBuffer(p17, var370)
				var370 = var385
				var369.kind = { type = "token", value = buffer.tostring(var384) }
			else
				local _ = nil
				local var386, var387 = protoModule.readVarInt(p17, var370)
				var370 = var387 + var386
			end
		elseif var371 == protoModule.wireTypes.i32 then
			local _ = nil
			local var388, var389 = protoModule.readFixed32(p17, var370)
			local _ = var388
			var370 = var389
		elseif var371 == protoModule.wireTypes.i64 then
			local _ = nil
			local var390, var391 = protoModule.readFixed64(p17, var370)
			local _ = var390
			var370 = var391
		else
			error("Unsupported wire type: " .. var668)
		end
	end
	return var369
end

function t_17:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function t_17:jsonDecode()
	-- upvalues: t_17 (ref), propConditionModule (ref)
	local var392 = t_17.new()
	
	if self.condition ~= nil then
		var392.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var392.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var392.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var392.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var392.kind = { type = "token", value = self.token }
	end
	return var392
end

t_17.descriptor = {
	name = "Int32Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int32Prop_ConditionalOption = t_17
typeRegistryModule.default:register(t.Int32Prop_ConditionalOption)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p18)
	-- upvalues: t_18 (ref)
	return setmetatable({
		options = if p18 == nil or p18.options == nil then {} else p18.options
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var392 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var393 = v:encode()
			local var394, var395 = protoModule.writeTag(buff, var392, 1, protoModule.wireTypes.lengthDelimited)
			var394, var695 = protoModule.writeBuffer(var394, var395, var393, buffer.len(var393))
			buff = var394
			var392 = var395
		end
	end
	local buff_1 = buffer.create(var392)
	buffer.copy(buff_1, 0, buff, 0, var392)
	
	return buff_1
end

function t_18.decode(p18)
	-- upvalues: t_18 (ref), protoModule (ref), t (ref)
	local var396 = t_18.new()
	local var397 = 0
	while var397 < buffer.len(p18) do
		local _ = nil
		local var398 = nil
		local var399, var400, var401 = protoModule.readTag(p18, var397)
		local var402 = var399
		var398 = var400
		var397 = var401
		
		if var398 == protoModule.wireTypes.varint then
			local _ = nil
			local var403, var404 = protoModule.readVarInt(p18, var397)
			local _ = var403
			var397 = var404
			continue
		end
		if var398 == protoModule.wireTypes.lengthDelimited then
			if var402 == 1 then
				local _ = nil
				local var405, var406 = protoModule.readBuffer(p18, var397)
				var397 = var406
				table.insert(var396.options, t.Int32Prop_ConditionalOption.decode(var405))
			else
				local _ = nil
				local var407, var408 = protoModule.readVarInt(p18, var397)
				var397 = var408 + var407
			end
		elseif var398 == protoModule.wireTypes.i32 then
			local _ = nil
			local var409, var410 = protoModule.readFixed32(p18, var397)
			local _ = var409
			var397 = var410
		elseif var398 == protoModule.wireTypes.i64 then
			local _ = nil
			local var411, var412 = protoModule.readFixed64(p18, var397)
			local _ = var411
			var397 = var412
		else
			error("Unsupported wire type: " .. var699)
		end
	end
	return var396
end

function t_18:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_18:jsonDecode()
	-- upvalues: t_18 (ref), t (ref)
	local var413 = t_18.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int32Prop_ConditionalOption.jsonDecode(v))
		end
		var413.options = t_1
	end
	return var413
end

t_18.descriptor = {
	name = "Int32Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int32Prop_ConditionalOptions = t_18
typeRegistryModule.default:register(t.Int32Prop_ConditionalOptions)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p19)
	-- upvalues: t_19 (ref)
	return setmetatable({
		kind = if p19 == nil or p19.kind == nil then nil else p19.kind
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var414 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var415, var416 = protoModule.writeTag(buff, var414, 1, protoModule.wireTypes.varint)
			var415, var721 = protoModule.writeVarInt(var415, var416, self.kind.value)
			buff = var415
			var414 = var416
		elseif self.kind.type == "binding_path" then
			local var417, var418 = protoModule.writeTag(buff, var414, 2, protoModule.wireTypes.lengthDelimited)
			var417, var723 = protoModule.writeString(var417, var418, self.kind.value)
			buff = var417
			var414 = var418
		elseif self.kind.type == "token" then
			local var419, var420 = protoModule.writeTag(buff, var414, 3, protoModule.wireTypes.lengthDelimited)
			var419, var725 = protoModule.writeString(var419, var420, self.kind.value)
			buff = var419
			var414 = var420
		elseif self.kind.type == "conditional" then
			local var421 = self.kind.value:encode()
			local var422, var423 = protoModule.writeTag(buff, var414, 4, protoModule.wireTypes.lengthDelimited)
			var422, var728 = protoModule.writeBuffer(var422, var423, var421, buffer.len(var421))
			buff = var422
			var414 = var423
		end
	end
	local buff_1 = buffer.create(var414)
	buffer.copy(buff_1, 0, buff, 0, var414)
	
	return buff_1
end

function t_19.decode(p19)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var414 = t_19.new()
	local var415 = 0
	while var415 < buffer.len(p19) do
		local _ = nil
		local var416 = nil
		local var417, var418, var419 = protoModule.readTag(p19, var415)
		local var420 = var417
		var416 = var418
		var415 = var419
		
		if var416 == protoModule.wireTypes.varint then
			if var420 == 1 then
				local _ = nil
				local var421, var422 = protoModule.readVarIntI64(p19, var415)
				var415 = var422
				var414.kind = { type = "literal", value = var421 }
			else
				local _ = nil
				local var423, var424 = protoModule.readVarInt(p19, var415)
				local _ = var423
				var415 = var424
			end
		end
		if var416 == protoModule.wireTypes.lengthDelimited then
			if var420 == 2 then
				local _ = nil
				local var425, var426 = protoModule.readBuffer(p19, var415)
				var415 = var426
				var414.kind = { type = "binding_path", value = buffer.tostring(var425) }
			elseif var420 == 3 then
				local _ = nil
				local var427, var428 = protoModule.readBuffer(p19, var415)
				var415 = var428
				var414.kind = { type = "token", value = buffer.tostring(var427) }
			elseif var420 == 4 then
				local _ = nil
				local var429, var430 = protoModule.readBuffer(p19, var415)
				var415 = var430
				var414.kind = {
					type = "conditional",
					value = t.Int64Prop_ConditionalOptions.decode(var429)
				}
			else
				local _ = nil
				local var431, var432 = protoModule.readVarInt(p19, var415)
				var415 = var432 + var431
			end
		elseif var416 == protoModule.wireTypes.i32 then
			local _ = nil
			local var433, var434 = protoModule.readFixed32(p19, var415)
			local _ = var433
			var415 = var434
		elseif var416 == protoModule.wireTypes.i64 then
			local _ = nil
			local var435, var436 = protoModule.readFixed64(p19, var415)
			local _ = var435
			var415 = var436
		else
			error("Unsupported wire type: " .. var732)
		end
	end
	return var414
end

function t_19:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_19:jsonDecode()
	-- upvalues: t_19 (ref), t (ref)
	local var437 = t_19.new()
	
	if self.literal ~= nil then
		var437.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var437.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var437.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var437.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var437.kind = {
			type = "conditional",
			value = t.Int64Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var437
end

t_19.descriptor = {
	name = "Int64Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
}
t.Int64Prop = t_19
typeRegistryModule.default:register(t.Int64Prop)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p20)
	-- upvalues: t_20 (ref)
	return setmetatable({
		condition = if p20 == nil or p20.condition == nil then nil else p20.condition,
		kind = if p20 == nil or p20.kind == nil then nil else p20.kind
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var437 = 0
	
	if self.condition ~= nil then
		local var438 = self.condition:encode()
		local var439, var440 = protoModule.writeTag(buff, var437, 1, protoModule.wireTypes.lengthDelimited)
		var439, var759 = protoModule.writeBuffer(var439, var440, var438, buffer.len(var438))
		buff = var439
		var437 = var440
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var441, var442 = protoModule.writeTag(buff, var437, 2, protoModule.wireTypes.varint)
			var441, var761 = protoModule.writeVarInt(var441, var442, self.kind.value)
			buff = var441
			var437 = var442
		elseif self.kind.type == "binding_path" then
			local var443, var444 = protoModule.writeTag(buff, var437, 3, protoModule.wireTypes.lengthDelimited)
			var443, var763 = protoModule.writeString(var443, var444, self.kind.value)
			buff = var443
			var437 = var444
		elseif self.kind.type == "token" then
			local var445, var446 = protoModule.writeTag(buff, var437, 4, protoModule.wireTypes.lengthDelimited)
			var445, var765 = protoModule.writeString(var445, var446, self.kind.value)
			buff = var445
			var437 = var446
		end
	end
	local buff_1 = buffer.create(var437)
	buffer.copy(buff_1, 0, buff, 0, var437)
	
	return buff_1
end

function t_20.decode(p20)
	-- upvalues: t_20 (ref), protoModule (ref), propConditionModule (ref)
	local var437 = t_20.new()
	local var438 = 0
	while var438 < buffer.len(p20) do
		local _ = nil
		local var439 = nil
		local var440, var441, var442 = protoModule.readTag(p20, var438)
		local var443 = var440
		var439 = var441
		var438 = var442
		
		if var439 == protoModule.wireTypes.varint then
			if var443 == 2 then
				local _ = nil
				local var444, var445 = protoModule.readVarIntI64(p20, var438)
				var438 = var445
				var437.kind = { type = "literal", value = var444 }
			else
				local _ = nil
				local var446, var447 = protoModule.readVarInt(p20, var438)
				local _ = var446
				var438 = var447
			end
		end
		if var439 == protoModule.wireTypes.lengthDelimited then
			if var443 == 1 then
				local _ = nil
				local var448, var449 = protoModule.readBuffer(p20, var438)
				var438 = var449
				var437.condition = propConditionModule.PropCondition.decode(var448)
			elseif var443 == 3 then
				local _ = nil
				local var450, var451 = protoModule.readBuffer(p20, var438)
				var438 = var451
				var437.kind = { type = "binding_path", value = buffer.tostring(var450) }
			elseif var443 == 4 then
				local _ = nil
				local var452, var453 = protoModule.readBuffer(p20, var438)
				var438 = var453
				var437.kind = { type = "token", value = buffer.tostring(var452) }
			else
				local _ = nil
				local var454, var455 = protoModule.readVarInt(p20, var438)
				var438 = var455 + var454
			end
		elseif var439 == protoModule.wireTypes.i32 then
			local _ = nil
			local var456, var457 = protoModule.readFixed32(p20, var438)
			local _ = var456
			var438 = var457
		elseif var439 == protoModule.wireTypes.i64 then
			local _ = nil
			local var458, var459 = protoModule.readFixed64(p20, var438)
			local _ = var458
			var438 = var459
		else
			error("Unsupported wire type: " .. var769)
		end
	end
	return var437
end

function t_20:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function t_20:jsonDecode()
	-- upvalues: t_20 (ref), propConditionModule (ref)
	local var460 = t_20.new()
	
	if self.condition ~= nil then
		var460.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var460.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var460.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var460.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var460.kind = { type = "token", value = self.token }
	end
	return var460
end

t_20.descriptor = {
	name = "Int64Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int64Prop_ConditionalOption = t_20
typeRegistryModule.default:register(t.Int64Prop_ConditionalOption)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p21)
	-- upvalues: t_21 (ref)
	return setmetatable({
		options = if p21 == nil or p21.options == nil then {} else p21.options
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var460 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var461 = v:encode()
			local var462, var463 = protoModule.writeTag(buff, var460, 1, protoModule.wireTypes.lengthDelimited)
			var462, var796 = protoModule.writeBuffer(var462, var463, var461, buffer.len(var461))
			buff = var462
			var460 = var463
		end
	end
	local buff_1 = buffer.create(var460)
	buffer.copy(buff_1, 0, buff, 0, var460)
	
	return buff_1
end

function t_21.decode(p21)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var464 = t_21.new()
	local var465 = 0
	while var465 < buffer.len(p21) do
		local _ = nil
		local var466 = nil
		local var467, var468, var469 = protoModule.readTag(p21, var465)
		local var470 = var467
		var466 = var468
		var465 = var469
		
		if var466 == protoModule.wireTypes.varint then
			local _ = nil
			local var471, var472 = protoModule.readVarInt(p21, var465)
			local _ = var471
			var465 = var472
			continue
		end
		if var466 == protoModule.wireTypes.lengthDelimited then
			if var470 == 1 then
				local _ = nil
				local var473, var474 = protoModule.readBuffer(p21, var465)
				var465 = var474
				table.insert(var464.options, t.Int64Prop_ConditionalOption.decode(var473))
			else
				local _ = nil
				local var475, var476 = protoModule.readVarInt(p21, var465)
				var465 = var476 + var475
			end
		elseif var466 == protoModule.wireTypes.i32 then
			local _ = nil
			local var477, var478 = protoModule.readFixed32(p21, var465)
			local _ = var477
			var465 = var478
		elseif var466 == protoModule.wireTypes.i64 then
			local _ = nil
			local var479, var480 = protoModule.readFixed64(p21, var465)
			local _ = var479
			var465 = var480
		else
			error("Unsupported wire type: " .. var800)
		end
	end
	return var464
end

function t_21:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_21:jsonDecode()
	-- upvalues: t_21 (ref), t (ref)
	local var481 = t_21.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int64Prop_ConditionalOption.jsonDecode(v))
		end
		var481.options = t_1
	end
	return var481
end

t_21.descriptor = {
	name = "Int64Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int64Prop_ConditionalOptions = t_21
typeRegistryModule.default:register(t.Int64Prop_ConditionalOptions)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p22)
	-- upvalues: t_22 (ref)
	return setmetatable({
		kind = if p22 == nil or p22.kind == nil then nil else p22.kind
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var482 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var483, var484 = protoModule.writeTag(buff, var482, 1, protoModule.wireTypes.varint)
			var483, var822 = protoModule.writeVarInt(var483, var484, if self.kind.value then 1 else 0)
			buff = var483
			var482 = var484
		elseif self.kind.type == "binding_path" then
			local var485, var486 = protoModule.writeTag(buff, var482, 2, protoModule.wireTypes.lengthDelimited)
			var485, var824 = protoModule.writeString(var485, var486, self.kind.value)
			buff = var485
			var482 = var486
		elseif self.kind.type == "conditional" then
			local var487 = self.kind.value:encode()
			local var488, var489 = protoModule.writeTag(buff, var482, 3, protoModule.wireTypes.lengthDelimited)
			var488, var827 = protoModule.writeBuffer(var488, var489, var487, buffer.len(var487))
			buff = var488
			var482 = var489
		end
	end
	local buff_1 = buffer.create(var482)
	buffer.copy(buff_1, 0, buff, 0, var482)
	
	return buff_1
end

function t_22.decode(p22)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var482 = t_22.new()
	local var483 = 0
	while var483 < buffer.len(p22) do
		local _ = nil
		local var484 = nil
		local var485, var486, var487 = protoModule.readTag(p22, var483)
		local var488 = var485
		var484 = var486
		var483 = var487
		
		if var484 == protoModule.wireTypes.varint then
			if var488 == 1 then
				local _ = nil
				local var489, var490 = protoModule.readVarInt(p22, var483)
				var483 = var490
				var482.kind = { type = "literal", value = var489 ~= 0 }
			else
				local _ = nil
				local var491, var492 = protoModule.readVarInt(p22, var483)
				local _ = var491
				var483 = var492
			end
		end
		if var484 == protoModule.wireTypes.lengthDelimited then
			if var488 == 2 then
				local _ = nil
				local var493, var494 = protoModule.readBuffer(p22, var483)
				var483 = var494
				var482.kind = { type = "binding_path", value = buffer.tostring(var493) }
			elseif var488 == 3 then
				local _ = nil
				local var495, var496 = protoModule.readBuffer(p22, var483)
				var483 = var496
				var482.kind = {
					type = "conditional",
					value = t.BoolProp_ConditionalOptions.decode(var495)
				}
			else
				local _ = nil
				local var497, var498 = protoModule.readVarInt(p22, var483)
				var483 = var498 + var497
			end
		elseif var484 == protoModule.wireTypes.i32 then
			local _ = nil
			local var499, var500 = protoModule.readFixed32(p22, var483)
			local _ = var499
			var483 = var500
		elseif var484 == protoModule.wireTypes.i64 then
			local _ = nil
			local var501, var502 = protoModule.readFixed64(p22, var483)
			local _ = var501
			var483 = var502
		else
			error("Unsupported wire type: " .. var831)
		end
	end
	return var482
end

function t_22:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_22:jsonDecode()
	-- upvalues: t_22 (ref), t (ref)
	local var503 = t_22.new()
	
	if self.literal ~= nil then
		var503.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var503.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var503.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var503.kind = {
			type = "conditional",
			value = t.BoolProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var503
end

t_22.descriptor = {
	name = "BoolProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
}
t.BoolProp = t_22
typeRegistryModule.default:register(t.BoolProp)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p23)
	-- upvalues: t_23 (ref)
	return setmetatable({
		condition = if p23 == nil or p23.condition == nil then nil else p23.condition,
		kind = if p23 == nil or p23.kind == nil then nil else p23.kind
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var503 = 0
	
	if self.condition ~= nil then
		local var504 = self.condition:encode()
		local var505, var506 = protoModule.writeTag(buff, var503, 1, protoModule.wireTypes.lengthDelimited)
		var505, var856 = protoModule.writeBuffer(var505, var506, var504, buffer.len(var504))
		buff = var505
		var503 = var506
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var507, var508 = protoModule.writeTag(buff, var503, 2, protoModule.wireTypes.varint)
			var507, var858 = protoModule.writeVarInt(var507, var508, if self.kind.value then 1 else 0)
			buff = var507
			var503 = var508
		elseif self.kind.type == "binding_path" then
			local var509, var510 = protoModule.writeTag(buff, var503, 3, protoModule.wireTypes.lengthDelimited)
			var509, var860 = protoModule.writeString(var509, var510, self.kind.value)
			buff = var509
			var503 = var510
		end
	end
	local buff_1 = buffer.create(var503)
	buffer.copy(buff_1, 0, buff, 0, var503)
	
	return buff_1
end

function t_23.decode(p23)
	-- upvalues: t_23 (ref), protoModule (ref), propConditionModule (ref)
	local var503 = t_23.new()
	local var504 = 0
	while var504 < buffer.len(p23) do
		local _ = nil
		local var505 = nil
		local var506, var507, var508 = protoModule.readTag(p23, var504)
		local var509 = var506
		var505 = var507
		var504 = var508
		
		if var505 == protoModule.wireTypes.varint then
			if var509 == 2 then
				local _ = nil
				local var510, var511 = protoModule.readVarInt(p23, var504)
				var504 = var511
				var503.kind = { type = "literal", value = var510 ~= 0 }
			else
				local _ = nil
				local var512, var513 = protoModule.readVarInt(p23, var504)
				local _ = var512
				var504 = var513
			end
		end
		if var505 == protoModule.wireTypes.lengthDelimited then
			if var509 == 1 then
				local _ = nil
				local var514, var515 = protoModule.readBuffer(p23, var504)
				var504 = var515
				var503.condition = propConditionModule.PropCondition.decode(var514)
			elseif var509 == 3 then
				local _ = nil
				local var516, var517 = protoModule.readBuffer(p23, var504)
				var504 = var517
				var503.kind = { type = "binding_path", value = buffer.tostring(var516) }
			else
				local _ = nil
				local var518, var519 = protoModule.readVarInt(p23, var504)
				var504 = var519 + var518
			end
		elseif var505 == protoModule.wireTypes.i32 then
			local _ = nil
			local var520, var521 = protoModule.readFixed32(p23, var504)
			local _ = var520
			var504 = var521
		elseif var505 == protoModule.wireTypes.i64 then
			local _ = nil
			local var522, var523 = protoModule.readFixed64(p23, var504)
			local _ = var522
			var504 = var523
		else
			error("Unsupported wire type: " .. var864)
		end
	end
	return var503
end

function t_23:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_23:jsonDecode()
	-- upvalues: t_23 (ref), propConditionModule (ref)
	local var524 = t_23.new()
	
	if self.condition ~= nil then
		var524.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var524.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var524.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var524.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var524
end

t_23.descriptor = {
	name = "BoolProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.BoolProp_ConditionalOption = t_23
typeRegistryModule.default:register(t.BoolProp_ConditionalOption)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p24)
	-- upvalues: t_24 (ref)
	return setmetatable({
		options = if p24 == nil or p24.options == nil then {} else p24.options
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var524 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var525 = v:encode()
			local var526, var527 = protoModule.writeTag(buff, var524, 1, protoModule.wireTypes.lengthDelimited)
			var526, var889 = protoModule.writeBuffer(var526, var527, var525, buffer.len(var525))
			buff = var526
			var524 = var527
		end
	end
	local buff_1 = buffer.create(var524)
	buffer.copy(buff_1, 0, buff, 0, var524)
	
	return buff_1
end

function t_24.decode(p24)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var528 = t_24.new()
	local var529 = 0
	while var529 < buffer.len(p24) do
		local _ = nil
		local var530 = nil
		local var531, var532, var533 = protoModule.readTag(p24, var529)
		local var534 = var531
		var530 = var532
		var529 = var533
		
		if var530 == protoModule.wireTypes.varint then
			local _ = nil
			local var535, var536 = protoModule.readVarInt(p24, var529)
			local _ = var535
			var529 = var536
			continue
		end
		if var530 == protoModule.wireTypes.lengthDelimited then
			if var534 == 1 then
				local _ = nil
				local var537, var538 = protoModule.readBuffer(p24, var529)
				var529 = var538
				table.insert(var528.options, t.BoolProp_ConditionalOption.decode(var537))
			else
				local _ = nil
				local var539, var540 = protoModule.readVarInt(p24, var529)
				var529 = var540 + var539
			end
		elseif var530 == protoModule.wireTypes.i32 then
			local _ = nil
			local var541, var542 = protoModule.readFixed32(p24, var529)
			local _ = var541
			var529 = var542
		elseif var530 == protoModule.wireTypes.i64 then
			local _ = nil
			local var543, var544 = protoModule.readFixed64(p24, var529)
			local _ = var543
			var529 = var544
		else
			error("Unsupported wire type: " .. var893)
		end
	end
	return var528
end

function t_24:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_24:jsonDecode()
	-- upvalues: t_24 (ref), t (ref)
	local var545 = t_24.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.BoolProp_ConditionalOption.jsonDecode(v))
		end
		var545.options = t_1
	end
	return var545
end

t_24.descriptor = {
	name = "BoolProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.BoolProp_ConditionalOptions = t_24
typeRegistryModule.default:register(t.BoolProp_ConditionalOptions)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p25)
	-- upvalues: t_25 (ref)
	return setmetatable({
		kind = if p25 == nil or p25.kind == nil then nil else p25.kind
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var546 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var547 = self.kind.value:encode()
			local var548, var549 = protoModule.writeTag(buff, var546, 1, protoModule.wireTypes.lengthDelimited)
			var548, var916 = protoModule.writeBuffer(var548, var549, var547, buffer.len(var547))
			buff = var548
			var546 = var549
		elseif self.kind.type == "binding_path" then
			local var550, var551 = protoModule.writeTag(buff, var546, 2, protoModule.wireTypes.lengthDelimited)
			var550, var918 = protoModule.writeString(var550, var551, self.kind.value)
			buff = var550
			var546 = var551
		elseif self.kind.type == "conditional" then
			local var552 = self.kind.value:encode()
			local var553, var554 = protoModule.writeTag(buff, var546, 3, protoModule.wireTypes.lengthDelimited)
			var553, var921 = protoModule.writeBuffer(var553, var554, var552, buffer.len(var552))
			buff = var553
			var546 = var554
		end
	end
	local buff_1 = buffer.create(var546)
	buffer.copy(buff_1, 0, buff, 0, var546)
	
	return buff_1
end

function t_25.decode(p25)
	-- upvalues: t_25 (ref), protoModule (ref), structModule (ref), t (ref)
	local var546 = t_25.new()
	local var547 = 0
	while var547 < buffer.len(p25) do
		local _ = nil
		local var548 = nil
		local var549, var550, var551 = protoModule.readTag(p25, var547)
		local var552 = var549
		var548 = var550
		var547 = var551
		
		if var548 == protoModule.wireTypes.varint then
			local _ = nil
			local var553, var554 = protoModule.readVarInt(p25, var547)
			local _ = var553
			var547 = var554
			continue
		end
		if var548 == protoModule.wireTypes.lengthDelimited then
			if var552 == 1 then
				local _ = nil
				local var555, var556 = protoModule.readBuffer(p25, var547)
				var547 = var556
				var546.kind = {
					type = "literal",
					value = structModule.Struct.decode(var555)
				}
			elseif var552 == 2 then
				local _ = nil
				local var557, var558 = protoModule.readBuffer(p25, var547)
				var547 = var558
				var546.kind = { type = "binding_path", value = buffer.tostring(var557) }
			elseif var552 == 3 then
				local _ = nil
				local var559, var560 = protoModule.readBuffer(p25, var547)
				var547 = var560
				var546.kind = {
					type = "conditional",
					value = t.StructProp_ConditionalOptions.decode(var559)
				}
			else
				local _ = nil
				local var561, var562 = protoModule.readVarInt(p25, var547)
				var547 = var562 + var561
			end
		elseif var548 == protoModule.wireTypes.i32 then
			local _ = nil
			local var563, var564 = protoModule.readFixed32(p25, var547)
			local _ = var563
			var547 = var564
		elseif var548 == protoModule.wireTypes.i64 then
			local _ = nil
			local var565, var566 = protoModule.readFixed64(p25, var547)
			local _ = var565
			var547 = var566
		else
			error("Unsupported wire type: " .. var925)
		end
	end
	return var546
end

function t_25:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_25:jsonDecode()
	-- upvalues: t_25 (ref), structModule (ref), t (ref)
	local var567 = t_25.new()
	
	if self.literal ~= nil then
		var567.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var567.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var567.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var567.kind = {
			type = "conditional",
			value = t.StructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var567
end

t_25.descriptor = {
	name = "StructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
}
t.StructProp = t_25
typeRegistryModule.default:register(t.StructProp)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p26)
	-- upvalues: t_26 (ref)
	return setmetatable({
		condition = if p26 == nil or p26.condition == nil then nil else p26.condition,
		kind = if p26 == nil or p26.kind == nil then nil else p26.kind
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var567 = 0
	
	if self.condition ~= nil then
		local var568 = self.condition:encode()
		local var569, var570 = protoModule.writeTag(buff, var567, 1, protoModule.wireTypes.lengthDelimited)
		var569, var950 = protoModule.writeBuffer(var569, var570, var568, buffer.len(var568))
		buff = var569
		var567 = var570
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var571 = self.kind.value:encode()
			local var572, var573 = protoModule.writeTag(buff, var567, 2, protoModule.wireTypes.lengthDelimited)
			var572, var953 = protoModule.writeBuffer(var572, var573, var571, buffer.len(var571))
			buff = var572
			var567 = var573
		elseif self.kind.type == "binding_path" then
			local var574, var575 = protoModule.writeTag(buff, var567, 3, protoModule.wireTypes.lengthDelimited)
			var574, var955 = protoModule.writeString(var574, var575, self.kind.value)
			buff = var574
			var567 = var575
		end
	end
	local buff_1 = buffer.create(var567)
	buffer.copy(buff_1, 0, buff, 0, var567)
	
	return buff_1
end

function t_26.decode(p26)
	-- upvalues: t_26 (ref), protoModule (ref), propConditionModule (ref), structModule (ref)
	local var567 = t_26.new()
	local var568 = 0
	while var568 < buffer.len(p26) do
		local _ = nil
		local var569 = nil
		local var570, var571, var572 = protoModule.readTag(p26, var568)
		local var573 = var570
		var569 = var571
		var568 = var572
		
		if var569 == protoModule.wireTypes.varint then
			local _ = nil
			local var574, var575 = protoModule.readVarInt(p26, var568)
			local _ = var574
			var568 = var575
			continue
		end
		if var569 == protoModule.wireTypes.lengthDelimited then
			if var573 == 1 then
				local _ = nil
				local var576, var577 = protoModule.readBuffer(p26, var568)
				var568 = var577
				var567.condition = propConditionModule.PropCondition.decode(var576)
			elseif var573 == 2 then
				local _ = nil
				local var578, var579 = protoModule.readBuffer(p26, var568)
				var568 = var579
				var567.kind = {
					type = "literal",
					value = structModule.Struct.decode(var578)
				}
			elseif var573 == 3 then
				local _ = nil
				local var580, var581 = protoModule.readBuffer(p26, var568)
				var568 = var581
				var567.kind = { type = "binding_path", value = buffer.tostring(var580) }
			else
				local _ = nil
				local var582, var583 = protoModule.readVarInt(p26, var568)
				var568 = var583 + var582
			end
		elseif var569 == protoModule.wireTypes.i32 then
			local _ = nil
			local var584, var585 = protoModule.readFixed32(p26, var568)
			local _ = var584
			var568 = var585
		elseif var569 == protoModule.wireTypes.i64 then
			local _ = nil
			local var586, var587 = protoModule.readFixed64(p26, var568)
			local _ = var586
			var568 = var587
		else
			error("Unsupported wire type: " .. var959)
		end
	end
	return var567
end

function t_26:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_26:jsonDecode()
	-- upvalues: t_26 (ref), propConditionModule (ref), structModule (ref)
	local var588 = t_26.new()
	
	if self.condition ~= nil then
		var588.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var588.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var588.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var588.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var588
end

t_26.descriptor = {
	name = "StructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StructProp_ConditionalOption = t_26
typeRegistryModule.default:register(t.StructProp_ConditionalOption)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p27)
	-- upvalues: t_27 (ref)
	return setmetatable({
		options = if p27 == nil or p27.options == nil then {} else p27.options
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var588 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var589 = v:encode()
			local var590, var591 = protoModule.writeTag(buff, var588, 1, protoModule.wireTypes.lengthDelimited)
			var590, var984 = protoModule.writeBuffer(var590, var591, var589, buffer.len(var589))
			buff = var590
			var588 = var591
		end
	end
	local buff_1 = buffer.create(var588)
	buffer.copy(buff_1, 0, buff, 0, var588)
	
	return buff_1
end

function t_27.decode(p27)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var592 = t_27.new()
	local var593 = 0
	while var593 < buffer.len(p27) do
		local _ = nil
		local var594 = nil
		local var595, var596, var597 = protoModule.readTag(p27, var593)
		local var598 = var595
		var594 = var596
		var593 = var597
		
		if var594 == protoModule.wireTypes.varint then
			local _ = nil
			local var599, var600 = protoModule.readVarInt(p27, var593)
			local _ = var599
			var593 = var600
			continue
		end
		if var594 == protoModule.wireTypes.lengthDelimited then
			if var598 == 1 then
				local _ = nil
				local var601, var602 = protoModule.readBuffer(p27, var593)
				var593 = var602
				table.insert(var592.options, t.StructProp_ConditionalOption.decode(var601))
			else
				local _ = nil
				local var603, var604 = protoModule.readVarInt(p27, var593)
				var593 = var604 + var603
			end
		elseif var594 == protoModule.wireTypes.i32 then
			local _ = nil
			local var605, var606 = protoModule.readFixed32(p27, var593)
			local _ = var605
			var593 = var606
		elseif var594 == protoModule.wireTypes.i64 then
			local _ = nil
			local var607, var608 = protoModule.readFixed64(p27, var593)
			local _ = var607
			var593 = var608
		else
			error("Unsupported wire type: " .. var988)
		end
	end
	return var592
end

function t_27:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_27:jsonDecode()
	-- upvalues: t_27 (ref), t (ref)
	local var609 = t_27.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StructProp_ConditionalOption.jsonDecode(v))
		end
		var609.options = t_1
	end
	return var609
end

t_27.descriptor = {
	name = "StructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StructProp_ConditionalOptions = t_27
typeRegistryModule.default:register(t.StructProp_ConditionalOptions)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p28)
	-- upvalues: t_28 (ref)
	return setmetatable({
		kind = if p28 == nil or p28.kind == nil then nil else p28.kind,
		alt = if p28 == nil or p28.alt == nil then nil else p28.alt
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var610 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var611, var612 = protoModule.writeTag(buff, var610, 1, protoModule.wireTypes.lengthDelimited)
			var611, var1010 = protoModule.writeString(var611, var612, self.kind.value)
			buff = var611
			var610 = var612
		elseif self.kind.type == "binding_path" then
			local var613, var614 = protoModule.writeTag(buff, var610, 2, protoModule.wireTypes.lengthDelimited)
			var613, var1012 = protoModule.writeString(var613, var614, self.kind.value)
			buff = var613
			var610 = var614
		elseif self.kind.type == "format" then
			local var615 = self.kind.value:encode()
			local var616, var617 = protoModule.writeTag(buff, var610, 3, protoModule.wireTypes.lengthDelimited)
			var616, var1015 = protoModule.writeBuffer(var616, var617, var615, buffer.len(var615))
			buff = var616
			var610 = var617
		elseif self.kind.type == "conditional" then
			local var618 = self.kind.value:encode()
			local var619, var620 = protoModule.writeTag(buff, var610, 4, protoModule.wireTypes.lengthDelimited)
			var619, var1018 = protoModule.writeBuffer(var619, var620, var618, buffer.len(var618))
			buff = var619
			var610 = var620
		elseif self.kind.type == "translation" then
			local var621 = self.kind.value:encode()
			local var622, var623 = protoModule.writeTag(buff, var610, 5, protoModule.wireTypes.lengthDelimited)
			var622, var1021 = protoModule.writeBuffer(var622, var623, var621, buffer.len(var621))
			buff = var622
			var610 = var623
		end
	end
	if self.alt ~= nil then
		local var624 = self.alt:encode()
		local var625, var626 = protoModule.writeTag(buff, var610, 6, protoModule.wireTypes.lengthDelimited)
		var625, var1024 = protoModule.writeBuffer(var625, var626, var624, buffer.len(var624))
		buff = var625
		var610 = var626
	end
	local buff_1 = buffer.create(var610)
	buffer.copy(buff_1, 0, buff, 0, var610)
	
	return buff_1
end

function t_28.decode(p28)
	-- upvalues: t_28 (ref), protoModule (ref), t (ref)
	local var610 = t_28.new()
	local var611 = 0
	while var611 < buffer.len(p28) do
		local _ = nil
		local var612 = nil
		local var613, var614, var615 = protoModule.readTag(p28, var611)
		local var616 = var613
		var612 = var614
		var611 = var615
		
		if var612 == protoModule.wireTypes.varint then
			local _ = nil
			local var617, var618 = protoModule.readVarInt(p28, var611)
			local _ = var617
			var611 = var618
			continue
		end
		if var612 == protoModule.wireTypes.lengthDelimited then
			if var616 == 1 then
				local _ = nil
				local var619, var620 = protoModule.readBuffer(p28, var611)
				var611 = var620
				var610.kind = { type = "literal", value = buffer.tostring(var619) }
			elseif var616 == 2 then
				local _ = nil
				local var621, var622 = protoModule.readBuffer(p28, var611)
				var611 = var622
				var610.kind = { type = "binding_path", value = buffer.tostring(var621) }
			elseif var616 == 3 then
				local _ = nil
				local var623, var624 = protoModule.readBuffer(p28, var611)
				var611 = var624
				var610.kind = { type = "format", value = t.StringFormat.decode(var623) }
			elseif var616 == 4 then
				local _ = nil
				local var625, var626 = protoModule.readBuffer(p28, var611)
				var611 = var626
				var610.kind = {
					type = "conditional",
					value = t.ImageStringProp_ConditionalOptions.decode(var625)
				}
			elseif var616 == 5 then
				local _ = nil
				local var627, var628 = protoModule.readBuffer(p28, var611)
				var611 = var628
				var610.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var627)
				}
			elseif var616 == 6 then
				local _ = nil
				local var629, var630 = protoModule.readBuffer(p28, var611)
				var611 = var630
				var610.alt = t.StringFormat.decode(var629)
			else
				local _ = nil
				local var631, var632 = protoModule.readVarInt(p28, var611)
				var611 = var632 + var631
			end
		elseif var612 == protoModule.wireTypes.i32 then
			local _ = nil
			local var633, var634 = protoModule.readFixed32(p28, var611)
			local _ = var633
			var611 = var634
		elseif var612 == protoModule.wireTypes.i64 then
			local _ = nil
			local var635, var636 = protoModule.readFixed64(p28, var611)
			local _ = var635
			var611 = var636
		else
			error("Unsupported wire type: " .. var1028)
		end
	end
	return var610
end

function t_28:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		elseif self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		elseif self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	if self.alt ~= nil then
		t.alt = self.alt:jsonEncode()
	end
	return t
end

function t_28:jsonDecode()
	-- upvalues: t_28 (ref), t (ref)
	local var637 = t_28.new()
	
	if self.literal ~= nil then
		var637.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var637.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var637.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var637.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var637.kind = {
			type = "conditional",
			value = t.ImageStringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var637.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	if self.alt ~= nil then
		var637.alt = t.StringFormat.jsonDecode(self.alt)
	end
	return var637
end

t_28.descriptor = {
	name = "ImageStringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
}
t.ImageStringProp = t_28
typeRegistryModule.default:register(t.ImageStringProp)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p29)
	-- upvalues: t_29 (ref)
	return setmetatable({
		condition = if p29 == nil or p29.condition == nil then nil else p29.condition,
		kind = if p29 == nil or p29.kind == nil then nil else p29.kind
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var637 = 0
	
	if self.condition ~= nil then
		local var638 = self.condition:encode()
		local var639, var640 = protoModule.writeTag(buff, var637, 1, protoModule.wireTypes.lengthDelimited)
		var639, var1059 = protoModule.writeBuffer(var639, var640, var638, buffer.len(var638))
		buff = var639
		var637 = var640
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var641, var642 = protoModule.writeTag(buff, var637, 2, protoModule.wireTypes.lengthDelimited)
			var641, var1061 = protoModule.writeString(var641, var642, self.kind.value)
			buff = var641
			var637 = var642
		elseif self.kind.type == "binding_path" then
			local var643, var644 = protoModule.writeTag(buff, var637, 3, protoModule.wireTypes.lengthDelimited)
			var643, var1063 = protoModule.writeString(var643, var644, self.kind.value)
			buff = var643
			var637 = var644
		elseif self.kind.type == "format" then
			local var645 = self.kind.value:encode()
			local var646, var647 = protoModule.writeTag(buff, var637, 4, protoModule.wireTypes.lengthDelimited)
			var646, var1066 = protoModule.writeBuffer(var646, var647, var645, buffer.len(var645))
			buff = var646
			var637 = var647
		elseif self.kind.type == "translation" then
			local var648 = self.kind.value:encode()
			local var649, var650 = protoModule.writeTag(buff, var637, 5, protoModule.wireTypes.lengthDelimited)
			var649, var1069 = protoModule.writeBuffer(var649, var650, var648, buffer.len(var648))
			buff = var649
			var637 = var650
		end
	end
	local buff_1 = buffer.create(var637)
	buffer.copy(buff_1, 0, buff, 0, var637)
	
	return buff_1
end

function t_29.decode(p29)
	-- upvalues: t_29 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var637 = t_29.new()
	local var638 = 0
	while var638 < buffer.len(p29) do
		local _ = nil
		local var639 = nil
		local var640, var641, var642 = protoModule.readTag(p29, var638)
		local var643 = var640
		var639 = var641
		var638 = var642
		
		if var639 == protoModule.wireTypes.varint then
			local _ = nil
			local var644, var645 = protoModule.readVarInt(p29, var638)
			local _ = var644
			var638 = var645
			continue
		end
		if var639 == protoModule.wireTypes.lengthDelimited then
			if var643 == 1 then
				local _ = nil
				local var646, var647 = protoModule.readBuffer(p29, var638)
				var638 = var647
				var637.condition = propConditionModule.PropCondition.decode(var646)
			elseif var643 == 2 then
				local _ = nil
				local var648, var649 = protoModule.readBuffer(p29, var638)
				var638 = var649
				var637.kind = { type = "literal", value = buffer.tostring(var648) }
			elseif var643 == 3 then
				local _ = nil
				local var650, var651 = protoModule.readBuffer(p29, var638)
				var638 = var651
				var637.kind = { type = "binding_path", value = buffer.tostring(var650) }
			elseif var643 == 4 then
				local _ = nil
				local var652, var653 = protoModule.readBuffer(p29, var638)
				var638 = var653
				var637.kind = { type = "format", value = t.StringFormat.decode(var652) }
			elseif var643 == 5 then
				local _ = nil
				local var654, var655 = protoModule.readBuffer(p29, var638)
				var638 = var655
				var637.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var654)
				}
			else
				local _ = nil
				local var656, var657 = protoModule.readVarInt(p29, var638)
				var638 = var657 + var656
			end
		elseif var639 == protoModule.wireTypes.i32 then
			local _ = nil
			local var658, var659 = protoModule.readFixed32(p29, var638)
			local _ = var658
			var638 = var659
		elseif var639 == protoModule.wireTypes.i64 then
			local _ = nil
			local var660, var661 = protoModule.readFixed64(p29, var638)
			local _ = var660
			var638 = var661
		else
			error("Unsupported wire type: " .. var1073)
		end
	end
	return var637
end

function t_29:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_29:jsonDecode()
	-- upvalues: t_29 (ref), propConditionModule (ref), t (ref)
	local var662 = t_29.new()
	
	if self.condition ~= nil then
		var662.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var662.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var662.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var662.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var662.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var662.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var662
end

t_29.descriptor = {
	name = "ImageStringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageStringProp_ConditionalOption = t_29
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOption)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p30)
	-- upvalues: t_30 (ref)
	return setmetatable({
		options = if p30 == nil or p30.options == nil then {} else p30.options
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var662 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var663 = v:encode()
			local var664, var665 = protoModule.writeTag(buff, var662, 1, protoModule.wireTypes.lengthDelimited)
			var664, var1102 = protoModule.writeBuffer(var664, var665, var663, buffer.len(var663))
			buff = var664
			var662 = var665
		end
	end
	local buff_1 = buffer.create(var662)
	buffer.copy(buff_1, 0, buff, 0, var662)
	
	return buff_1
end

function t_30.decode(p30)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var666 = t_30.new()
	local var667 = 0
	while var667 < buffer.len(p30) do
		local _ = nil
		local var668 = nil
		local var669, var670, var671 = protoModule.readTag(p30, var667)
		local var672 = var669
		var668 = var670
		var667 = var671
		
		if var668 == protoModule.wireTypes.varint then
			local _ = nil
			local var673, var674 = protoModule.readVarInt(p30, var667)
			local _ = var673
			var667 = var674
			continue
		end
		if var668 == protoModule.wireTypes.lengthDelimited then
			if var672 == 1 then
				local _ = nil
				local var675, var676 = protoModule.readBuffer(p30, var667)
				var667 = var676
				table.insert(var666.options, t.ImageStringProp_ConditionalOption.decode(var675))
			else
				local _ = nil
				local var677, var678 = protoModule.readVarInt(p30, var667)
				var667 = var678 + var677
			end
		elseif var668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var679, var680 = protoModule.readFixed32(p30, var667)
			local _ = var679
			var667 = var680
		elseif var668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var681, var682 = protoModule.readFixed64(p30, var667)
			local _ = var681
			var667 = var682
		else
			error("Unsupported wire type: " .. var1106)
		end
	end
	return var666
end

function t_30:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_30:jsonDecode()
	-- upvalues: t_30 (ref), t (ref)
	local var683 = t_30.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageStringProp_ConditionalOption.jsonDecode(v))
		end
		var683.options = t_1
	end
	return var683
end

t_30.descriptor = {
	name = "ImageStringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageStringProp_ConditionalOptions = t_30
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOptions)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p31)
	-- upvalues: t_31 (ref)
	return setmetatable({
		kind = if p31 == nil or p31.kind == nil then nil else p31.kind
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var684 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var685, var686 = protoModule.writeTag(buff, var684, 1, protoModule.wireTypes.lengthDelimited)
			var685, var1128 = protoModule.writeString(var685, var686, self.kind.value)
			buff = var685
			var684 = var686
		elseif self.kind.type == "binding_path" then
			local var687, var688 = protoModule.writeTag(buff, var684, 2, protoModule.wireTypes.lengthDelimited)
			var687, var1130 = protoModule.writeString(var687, var688, self.kind.value)
			buff = var687
			var684 = var688
		elseif self.kind.type == "format" then
			local var689 = self.kind.value:encode()
			local var690, var691 = protoModule.writeTag(buff, var684, 3, protoModule.wireTypes.lengthDelimited)
			var690, var1133 = protoModule.writeBuffer(var690, var691, var689, buffer.len(var689))
			buff = var690
			var684 = var691
		elseif self.kind.type == "conditional" then
			local var692 = self.kind.value:encode()
			local var693, var694 = protoModule.writeTag(buff, var684, 4, protoModule.wireTypes.lengthDelimited)
			var693, var1136 = protoModule.writeBuffer(var693, var694, var692, buffer.len(var692))
			buff = var693
			var684 = var694
		elseif self.kind.type == "translation" then
			local var695 = self.kind.value:encode()
			local var696, var697 = protoModule.writeTag(buff, var684, 5, protoModule.wireTypes.lengthDelimited)
			var696, var1139 = protoModule.writeBuffer(var696, var697, var695, buffer.len(var695))
			buff = var696
			var684 = var697
		end
	end
	local buff_1 = buffer.create(var684)
	buffer.copy(buff_1, 0, buff, 0, var684)
	
	return buff_1
end

function t_31.decode(p31)
	-- upvalues: t_31 (ref), protoModule (ref), t (ref)
	local var684 = t_31.new()
	local var685 = 0
	while var685 < buffer.len(p31) do
		local _ = nil
		local var686 = nil
		local var687, var688, var689 = protoModule.readTag(p31, var685)
		local var690 = var687
		var686 = var688
		var685 = var689
		
		if var686 == protoModule.wireTypes.varint then
			local _ = nil
			local var691, var692 = protoModule.readVarInt(p31, var685)
			local _ = var691
			var685 = var692
			continue
		end
		if var686 == protoModule.wireTypes.lengthDelimited then
			if var690 == 1 then
				local _ = nil
				local var693, var694 = protoModule.readBuffer(p31, var685)
				var685 = var694
				var684.kind = { type = "literal", value = buffer.tostring(var693) }
			elseif var690 == 2 then
				local _ = nil
				local var695, var696 = protoModule.readBuffer(p31, var685)
				var685 = var696
				var684.kind = { type = "binding_path", value = buffer.tostring(var695) }
			elseif var690 == 3 then
				local _ = nil
				local var697, var698 = protoModule.readBuffer(p31, var685)
				var685 = var698
				var684.kind = { type = "format", value = t.StringFormat.decode(var697) }
			elseif var690 == 4 then
				local _ = nil
				local var699, var700 = protoModule.readBuffer(p31, var685)
				var685 = var700
				var684.kind = {
					type = "conditional",
					value = t.ImageSetProp_ConditionalOptions.decode(var699)
				}
			elseif var690 == 5 then
				local _ = nil
				local var701, var702 = protoModule.readBuffer(p31, var685)
				var685 = var702
				var684.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var701)
				}
			else
				local _ = nil
				local var703, var704 = protoModule.readVarInt(p31, var685)
				var685 = var704 + var703
			end
		elseif var686 == protoModule.wireTypes.i32 then
			local _ = nil
			local var705, var706 = protoModule.readFixed32(p31, var685)
			local _ = var705
			var685 = var706
		elseif var686 == protoModule.wireTypes.i64 then
			local _ = nil
			local var707, var708 = protoModule.readFixed64(p31, var685)
			local _ = var707
			var685 = var708
		else
			error("Unsupported wire type: " .. var1143)
		end
	end
	return var684
end

function t_31:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_31:jsonDecode()
	-- upvalues: t_31 (ref), t (ref)
	local var709 = t_31.new()
	
	if self.literal ~= nil then
		var709.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var709.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var709.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var709.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var709.kind = {
			type = "conditional",
			value = t.ImageSetProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var709.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var709
end

t_31.descriptor = {
	name = "ImageSetProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
}
t.ImageSetProp = t_31
typeRegistryModule.default:register(t.ImageSetProp)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p32)
	-- upvalues: t_32 (ref)
	return setmetatable({
		condition = if p32 == nil or p32.condition == nil then nil else p32.condition,
		kind = if p32 == nil or p32.kind == nil then nil else p32.kind
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var709 = 0
	
	if self.condition ~= nil then
		local var710 = self.condition:encode()
		local var711, var712 = protoModule.writeTag(buff, var709, 1, protoModule.wireTypes.lengthDelimited)
		var711, var1172 = protoModule.writeBuffer(var711, var712, var710, buffer.len(var710))
		buff = var711
		var709 = var712
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var713, var714 = protoModule.writeTag(buff, var709, 2, protoModule.wireTypes.lengthDelimited)
			var713, var1174 = protoModule.writeString(var713, var714, self.kind.value)
			buff = var713
			var709 = var714
		elseif self.kind.type == "binding_path" then
			local var715, var716 = protoModule.writeTag(buff, var709, 3, protoModule.wireTypes.lengthDelimited)
			var715, var1176 = protoModule.writeString(var715, var716, self.kind.value)
			buff = var715
			var709 = var716
		elseif self.kind.type == "format" then
			local var717 = self.kind.value:encode()
			local var718, var719 = protoModule.writeTag(buff, var709, 4, protoModule.wireTypes.lengthDelimited)
			var718, var1179 = protoModule.writeBuffer(var718, var719, var717, buffer.len(var717))
			buff = var718
			var709 = var719
		elseif self.kind.type == "translation" then
			local var720 = self.kind.value:encode()
			local var721, var722 = protoModule.writeTag(buff, var709, 5, protoModule.wireTypes.lengthDelimited)
			var721, var1182 = protoModule.writeBuffer(var721, var722, var720, buffer.len(var720))
			buff = var721
			var709 = var722
		end
	end
	local buff_1 = buffer.create(var709)
	buffer.copy(buff_1, 0, buff, 0, var709)
	
	return buff_1
end

function t_32.decode(p32)
	-- upvalues: t_32 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var709 = t_32.new()
	local var710 = 0
	while var710 < buffer.len(p32) do
		local _ = nil
		local var711 = nil
		local var712, var713, var714 = protoModule.readTag(p32, var710)
		local var715 = var712
		var711 = var713
		var710 = var714
		
		if var711 == protoModule.wireTypes.varint then
			local _ = nil
			local var716, var717 = protoModule.readVarInt(p32, var710)
			local _ = var716
			var710 = var717
			continue
		end
		if var711 == protoModule.wireTypes.lengthDelimited then
			if var715 == 1 then
				local _ = nil
				local var718, var719 = protoModule.readBuffer(p32, var710)
				var710 = var719
				var709.condition = propConditionModule.PropCondition.decode(var718)
			elseif var715 == 2 then
				local _ = nil
				local var720, var721 = protoModule.readBuffer(p32, var710)
				var710 = var721
				var709.kind = { type = "literal", value = buffer.tostring(var720) }
			elseif var715 == 3 then
				local _ = nil
				local var722, var723 = protoModule.readBuffer(p32, var710)
				var710 = var723
				var709.kind = { type = "binding_path", value = buffer.tostring(var722) }
			elseif var715 == 4 then
				local _ = nil
				local var724, var725 = protoModule.readBuffer(p32, var710)
				var710 = var725
				var709.kind = { type = "format", value = t.StringFormat.decode(var724) }
			elseif var715 == 5 then
				local _ = nil
				local var726, var727 = protoModule.readBuffer(p32, var710)
				var710 = var727
				var709.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var726)
				}
			else
				local _ = nil
				local var728, var729 = protoModule.readVarInt(p32, var710)
				var710 = var729 + var728
			end
		elseif var711 == protoModule.wireTypes.i32 then
			local _ = nil
			local var730, var731 = protoModule.readFixed32(p32, var710)
			local _ = var730
			var710 = var731
		elseif var711 == protoModule.wireTypes.i64 then
			local _ = nil
			local var732, var733 = protoModule.readFixed64(p32, var710)
			local _ = var732
			var710 = var733
		else
			error("Unsupported wire type: " .. var1186)
		end
	end
	return var709
end

function t_32:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_32:jsonDecode()
	-- upvalues: t_32 (ref), propConditionModule (ref), t (ref)
	local var734 = t_32.new()
	
	if self.condition ~= nil then
		var734.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var734.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var734.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var734.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var734.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var734.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var734
end

t_32.descriptor = {
	name = "ImageSetProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageSetProp_ConditionalOption = t_32
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOption)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p33)
	-- upvalues: t_33 (ref)
	return setmetatable({
		options = if p33 == nil or p33.options == nil then {} else p33.options
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var734 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var735 = v:encode()
			local var736, var737 = protoModule.writeTag(buff, var734, 1, protoModule.wireTypes.lengthDelimited)
			var736, var1215 = protoModule.writeBuffer(var736, var737, var735, buffer.len(var735))
			buff = var736
			var734 = var737
		end
	end
	local buff_1 = buffer.create(var734)
	buffer.copy(buff_1, 0, buff, 0, var734)
	
	return buff_1
end

function t_33.decode(p33)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var738 = t_33.new()
	local var739 = 0
	while var739 < buffer.len(p33) do
		local _ = nil
		local var740 = nil
		local var741, var742, var743 = protoModule.readTag(p33, var739)
		local var744 = var741
		var740 = var742
		var739 = var743
		
		if var740 == protoModule.wireTypes.varint then
			local _ = nil
			local var745, var746 = protoModule.readVarInt(p33, var739)
			local _ = var745
			var739 = var746
			continue
		end
		if var740 == protoModule.wireTypes.lengthDelimited then
			if var744 == 1 then
				local _ = nil
				local var747, var748 = protoModule.readBuffer(p33, var739)
				var739 = var748
				table.insert(var738.options, t.ImageSetProp_ConditionalOption.decode(var747))
			else
				local _ = nil
				local var749, var750 = protoModule.readVarInt(p33, var739)
				var739 = var750 + var749
			end
		elseif var740 == protoModule.wireTypes.i32 then
			local _ = nil
			local var751, var752 = protoModule.readFixed32(p33, var739)
			local _ = var751
			var739 = var752
		elseif var740 == protoModule.wireTypes.i64 then
			local _ = nil
			local var753, var754 = protoModule.readFixed64(p33, var739)
			local _ = var753
			var739 = var754
		else
			error("Unsupported wire type: " .. var1219)
		end
	end
	return var738
end

function t_33:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_33:jsonDecode()
	-- upvalues: t_33 (ref), t (ref)
	local var755 = t_33.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageSetProp_ConditionalOption.jsonDecode(v))
		end
		var755.options = t_1
	end
	return var755
end

t_33.descriptor = {
	name = "ImageSetProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageSetProp_ConditionalOptions = t_33
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOptions)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p34)
	-- upvalues: t_34 (ref)
	return setmetatable({
		kind = if p34 == nil or p34.kind == nil then nil else p34.kind
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var756 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var757, var758 = protoModule.writeTag(buff, var756, 1, protoModule.wireTypes.lengthDelimited)
			var757, var1241 = protoModule.writeString(var757, var758, self.kind.value)
			buff = var757
			var756 = var758
		elseif self.kind.type == "token" then
			local var759, var760 = protoModule.writeTag(buff, var756, 2, protoModule.wireTypes.lengthDelimited)
			var759, var1243 = protoModule.writeString(var759, var760, self.kind.value)
			buff = var759
			var756 = var760
		elseif self.kind.type == "conditional" then
			local var761 = self.kind.value:encode()
			local var762, var763 = protoModule.writeTag(buff, var756, 3, protoModule.wireTypes.lengthDelimited)
			var762, var1246 = protoModule.writeBuffer(var762, var763, var761, buffer.len(var761))
			buff = var762
			var756 = var763
		elseif self.kind.type == "binding_path" then
			local var764, var765 = protoModule.writeTag(buff, var756, 4, protoModule.wireTypes.lengthDelimited)
			var764, var1248 = protoModule.writeString(var764, var765, self.kind.value)
			buff = var764
			var756 = var765
		end
	end
	local buff_1 = buffer.create(var756)
	buffer.copy(buff_1, 0, buff, 0, var756)
	
	return buff_1
end

function t_34.decode(p34)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var756 = t_34.new()
	local var757 = 0
	while var757 < buffer.len(p34) do
		local _ = nil
		local var758 = nil
		local var759, var760, var761 = protoModule.readTag(p34, var757)
		local var762 = var759
		var758 = var760
		var757 = var761
		
		if var758 == protoModule.wireTypes.varint then
			local _ = nil
			local var763, var764 = protoModule.readVarInt(p34, var757)
			local _ = var763
			var757 = var764
			continue
		end
		if var758 == protoModule.wireTypes.lengthDelimited then
			if var762 == 1 then
				local _ = nil
				local var765, var766 = protoModule.readBuffer(p34, var757)
				var757 = var766
				var756.kind = { type = "literal", value = buffer.tostring(var765) }
			elseif var762 == 2 then
				local _ = nil
				local var767, var768 = protoModule.readBuffer(p34, var757)
				var757 = var768
				var756.kind = { type = "token", value = buffer.tostring(var767) }
			elseif var762 == 3 then
				local _ = nil
				local var769, var770 = protoModule.readBuffer(p34, var757)
				var757 = var770
				var756.kind = {
					type = "conditional",
					value = t.ColorProp_ConditionalOptions.decode(var769)
				}
			elseif var762 == 4 then
				local _ = nil
				local var771, var772 = protoModule.readBuffer(p34, var757)
				var757 = var772
				var756.kind = { type = "binding_path", value = buffer.tostring(var771) }
			else
				local _ = nil
				local var773, var774 = protoModule.readVarInt(p34, var757)
				var757 = var774 + var773
			end
		elseif var758 == protoModule.wireTypes.i32 then
			local _ = nil
			local var775, var776 = protoModule.readFixed32(p34, var757)
			local _ = var775
			var757 = var776
		elseif var758 == protoModule.wireTypes.i64 then
			local _ = nil
			local var777, var778 = protoModule.readFixed64(p34, var757)
			local _ = var777
			var757 = var778
		else
			error("Unsupported wire type: " .. var1252)
		end
	end
	return var756
end

function t_34:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_34:jsonDecode()
	-- upvalues: t_34 (ref), t (ref)
	local var779 = t_34.new()
	
	if self.literal ~= nil then
		var779.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var779.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var779.kind = {
			type = "conditional",
			value = t.ColorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var779.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var779.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var779
end

t_34.descriptor = {
	name = "ColorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
}
t.ColorProp = t_34
typeRegistryModule.default:register(t.ColorProp)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p35)
	-- upvalues: t_35 (ref)
	return setmetatable({
		condition = if p35 == nil or p35.condition == nil then nil else p35.condition,
		kind = if p35 == nil or p35.kind == nil then nil else p35.kind
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var779 = 0
	
	if self.condition ~= nil then
		local var780 = self.condition:encode()
		local var781, var782 = protoModule.writeTag(buff, var779, 1, protoModule.wireTypes.lengthDelimited)
		var781, var1279 = protoModule.writeBuffer(var781, var782, var780, buffer.len(var780))
		buff = var781
		var779 = var782
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var783, var784 = protoModule.writeTag(buff, var779, 2, protoModule.wireTypes.lengthDelimited)
			var783, var1281 = protoModule.writeString(var783, var784, self.kind.value)
			buff = var783
			var779 = var784
		elseif self.kind.type == "token" then
			local var785, var786 = protoModule.writeTag(buff, var779, 3, protoModule.wireTypes.lengthDelimited)
			var785, var1283 = protoModule.writeString(var785, var786, self.kind.value)
			buff = var785
			var779 = var786
		elseif self.kind.type == "binding_path" then
			local var787, var788 = protoModule.writeTag(buff, var779, 4, protoModule.wireTypes.lengthDelimited)
			var787, var1285 = protoModule.writeString(var787, var788, self.kind.value)
			buff = var787
			var779 = var788
		end
	end
	local buff_1 = buffer.create(var779)
	buffer.copy(buff_1, 0, buff, 0, var779)
	
	return buff_1
end

function t_35.decode(p35)
	-- upvalues: t_35 (ref), protoModule (ref), propConditionModule (ref)
	local var779 = t_35.new()
	local var780 = 0
	while var780 < buffer.len(p35) do
		local _ = nil
		local var781 = nil
		local var782, var783, var784 = protoModule.readTag(p35, var780)
		local var785 = var782
		var781 = var783
		var780 = var784
		
		if var781 == protoModule.wireTypes.varint then
			local _ = nil
			local var786, var787 = protoModule.readVarInt(p35, var780)
			local _ = var786
			var780 = var787
			continue
		end
		if var781 == protoModule.wireTypes.lengthDelimited then
			if var785 == 1 then
				local _ = nil
				local var788, var789 = protoModule.readBuffer(p35, var780)
				var780 = var789
				var779.condition = propConditionModule.PropCondition.decode(var788)
			elseif var785 == 2 then
				local _ = nil
				local var790, var791 = protoModule.readBuffer(p35, var780)
				var780 = var791
				var779.kind = { type = "literal", value = buffer.tostring(var790) }
			elseif var785 == 3 then
				local _ = nil
				local var792, var793 = protoModule.readBuffer(p35, var780)
				var780 = var793
				var779.kind = { type = "token", value = buffer.tostring(var792) }
			elseif var785 == 4 then
				local _ = nil
				local var794, var795 = protoModule.readBuffer(p35, var780)
				var780 = var795
				var779.kind = { type = "binding_path", value = buffer.tostring(var794) }
			else
				local _ = nil
				local var796, var797 = protoModule.readVarInt(p35, var780)
				var780 = var797 + var796
			end
		elseif var781 == protoModule.wireTypes.i32 then
			local _ = nil
			local var798, var799 = protoModule.readFixed32(p35, var780)
			local _ = var798
			var780 = var799
		elseif var781 == protoModule.wireTypes.i64 then
			local _ = nil
			local var800, var801 = protoModule.readFixed64(p35, var780)
			local _ = var800
			var780 = var801
		else
			error("Unsupported wire type: " .. var1289)
		end
	end
	return var779
end

function t_35:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), propConditionModule (ref)
	local var802 = t_35.new()
	
	if self.condition ~= nil then
		var802.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var802.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var802.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var802.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var802.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var802
end

t_35.descriptor = {
	name = "ColorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorProp_ConditionalOption = t_35
typeRegistryModule.default:register(t.ColorProp_ConditionalOption)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p36)
	-- upvalues: t_36 (ref)
	return setmetatable({
		options = if p36 == nil or p36.options == nil then {} else p36.options
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var802 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var803 = v:encode()
			local var804, var805 = protoModule.writeTag(buff, var802, 1, protoModule.wireTypes.lengthDelimited)
			var804, var1316 = protoModule.writeBuffer(var804, var805, var803, buffer.len(var803))
			buff = var804
			var802 = var805
		end
	end
	local buff_1 = buffer.create(var802)
	buffer.copy(buff_1, 0, buff, 0, var802)
	
	return buff_1
end

function t_36.decode(p36)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var806 = t_36.new()
	local var807 = 0
	while var807 < buffer.len(p36) do
		local _ = nil
		local var808 = nil
		local var809, var810, var811 = protoModule.readTag(p36, var807)
		local var812 = var809
		var808 = var810
		var807 = var811
		
		if var808 == protoModule.wireTypes.varint then
			local _ = nil
			local var813, var814 = protoModule.readVarInt(p36, var807)
			local _ = var813
			var807 = var814
			continue
		end
		if var808 == protoModule.wireTypes.lengthDelimited then
			if var812 == 1 then
				local _ = nil
				local var815, var816 = protoModule.readBuffer(p36, var807)
				var807 = var816
				table.insert(var806.options, t.ColorProp_ConditionalOption.decode(var815))
			else
				local _ = nil
				local var817, var818 = protoModule.readVarInt(p36, var807)
				var807 = var818 + var817
			end
		elseif var808 == protoModule.wireTypes.i32 then
			local _ = nil
			local var819, var820 = protoModule.readFixed32(p36, var807)
			local _ = var819
			var807 = var820
		elseif var808 == protoModule.wireTypes.i64 then
			local _ = nil
			local var821, var822 = protoModule.readFixed64(p36, var807)
			local _ = var821
			var807 = var822
		else
			error("Unsupported wire type: " .. var1320)
		end
	end
	return var806
end

function t_36:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), t (ref)
	local var823 = t_36.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorProp_ConditionalOption.jsonDecode(v))
		end
		var823.options = t_1
	end
	return var823
end

t_36.descriptor = {
	name = "ColorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorProp_ConditionalOptions = t_36
typeRegistryModule.default:register(t.ColorProp_ConditionalOptions)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p37)
	-- upvalues: t_37 (ref)
	return setmetatable({
		kind = if p37 == nil or p37.kind == nil then nil else p37.kind
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var824 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var825, var826 = protoModule.writeTag(buff, var824, 1, protoModule.wireTypes.lengthDelimited)
			var825, var1342 = protoModule.writeString(var825, var826, self.kind.value)
			buff = var825
			var824 = var826
		elseif self.kind.type == "conditional" then
			local var827 = self.kind.value:encode()
			local var828, var829 = protoModule.writeTag(buff, var824, 2, protoModule.wireTypes.lengthDelimited)
			var828, var1345 = protoModule.writeBuffer(var828, var829, var827, buffer.len(var827))
			buff = var828
			var824 = var829
		end
	end
	local buff_1 = buffer.create(var824)
	buffer.copy(buff_1, 0, buff, 0, var824)
	
	return buff_1
end

function t_37.decode(p37)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var824 = t_37.new()
	local var825 = 0
	while var825 < buffer.len(p37) do
		local _ = nil
		local var826 = nil
		local var827, var828, var829 = protoModule.readTag(p37, var825)
		local var830 = var827
		var826 = var828
		var825 = var829
		
		if var826 == protoModule.wireTypes.varint then
			local _ = nil
			local var831, var832 = protoModule.readVarInt(p37, var825)
			local _ = var831
			var825 = var832
			continue
		end
		if var826 == protoModule.wireTypes.lengthDelimited then
			if var830 == 1 then
				local _ = nil
				local var833, var834 = protoModule.readBuffer(p37, var825)
				var825 = var834
				var824.kind = { type = "token", value = buffer.tostring(var833) }
			elseif var830 == 2 then
				local _ = nil
				local var835, var836 = protoModule.readBuffer(p37, var825)
				var825 = var836
				var824.kind = {
					type = "conditional",
					value = t.TypographyProp_ConditionalOptions.decode(var835)
				}
			else
				local _ = nil
				local var837, var838 = protoModule.readVarInt(p37, var825)
				var825 = var838 + var837
			end
		elseif var826 == protoModule.wireTypes.i32 then
			local _ = nil
			local var839, var840 = protoModule.readFixed32(p37, var825)
			local _ = var839
			var825 = var840
		elseif var826 == protoModule.wireTypes.i64 then
			local _ = nil
			local var841, var842 = protoModule.readFixed64(p37, var825)
			local _ = var841
			var825 = var842
		else
			error("Unsupported wire type: " .. var1349)
		end
	end
	return var824
end

function t_37:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_37:jsonDecode()
	-- upvalues: t_37 (ref), t (ref)
	local var843 = t_37.new()
	
	if self.token ~= nil then
		var843.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var843.kind = {
			type = "conditional",
			value = t.TypographyProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var843
end

t_37.descriptor = {
	name = "TypographyProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
}
t.TypographyProp = t_37
typeRegistryModule.default:register(t.TypographyProp)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p38)
	-- upvalues: t_38 (ref)
	return setmetatable({
		condition = if p38 == nil or p38.condition == nil then nil else p38.condition,
		kind = if p38 == nil or p38.kind == nil then nil else p38.kind
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var843 = 0
	
	if self.condition ~= nil then
		local var844 = self.condition:encode()
		local var845, var846 = protoModule.writeTag(buff, var843, 1, protoModule.wireTypes.lengthDelimited)
		var845, var1372 = protoModule.writeBuffer(var845, var846, var844, buffer.len(var844))
		buff = var845
		var843 = var846
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var847, var848 = protoModule.writeTag(buff, var843, 2, protoModule.wireTypes.lengthDelimited)
		var847, var1374 = protoModule.writeString(var847, var848, self.kind.value)
		buff = var847
		var843 = var848
	end
	local buff_1 = buffer.create(var843)
	buffer.copy(buff_1, 0, buff, 0, var843)
	
	return buff_1
end

function t_38.decode(p38)
	-- upvalues: t_38 (ref), protoModule (ref), propConditionModule (ref)
	local var843 = t_38.new()
	local var844 = 0
	while var844 < buffer.len(p38) do
		local _ = nil
		local var845 = nil
		local var846, var847, var848 = protoModule.readTag(p38, var844)
		local var849 = var846
		var845 = var847
		var844 = var848
		
		if var845 == protoModule.wireTypes.varint then
			local _ = nil
			local var850, var851 = protoModule.readVarInt(p38, var844)
			local _ = var850
			var844 = var851
			continue
		end
		if var845 == protoModule.wireTypes.lengthDelimited then
			if var849 == 1 then
				local _ = nil
				local var852, var853 = protoModule.readBuffer(p38, var844)
				var844 = var853
				var843.condition = propConditionModule.PropCondition.decode(var852)
			elseif var849 == 2 then
				local _ = nil
				local var854, var855 = protoModule.readBuffer(p38, var844)
				var844 = var855
				var843.kind = { type = "token", value = buffer.tostring(var854) }
			else
				local _ = nil
				local var856, var857 = protoModule.readVarInt(p38, var844)
				var844 = var857 + var856
			end
		elseif var845 == protoModule.wireTypes.i32 then
			local _ = nil
			local var858, var859 = protoModule.readFixed32(p38, var844)
			local _ = var858
			var844 = var859
		elseif var845 == protoModule.wireTypes.i64 then
			local _ = nil
			local var860, var861 = protoModule.readFixed64(p38, var844)
			local _ = var860
			var844 = var861
		else
			error("Unsupported wire type: " .. var1378)
		end
	end
	return var843
end

function t_38:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_38:jsonDecode()
	-- upvalues: t_38 (ref), propConditionModule (ref)
	local var862 = t_38.new()
	
	if self.condition ~= nil then
		var862.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var862.kind = { type = "token", value = self.token }
	end
	return var862
end

t_38.descriptor = {
	name = "TypographyProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyProp_ConditionalOption = t_38
typeRegistryModule.default:register(t.TypographyProp_ConditionalOption)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p39)
	-- upvalues: t_39 (ref)
	return setmetatable({
		options = if p39 == nil or p39.options == nil then {} else p39.options
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var862 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var863 = v:encode()
			local var864, var865 = protoModule.writeTag(buff, var862, 1, protoModule.wireTypes.lengthDelimited)
			var864, var1401 = protoModule.writeBuffer(var864, var865, var863, buffer.len(var863))
			buff = var864
			var862 = var865
		end
	end
	local buff_1 = buffer.create(var862)
	buffer.copy(buff_1, 0, buff, 0, var862)
	
	return buff_1
end

function t_39.decode(p39)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var866 = t_39.new()
	local var867 = 0
	while var867 < buffer.len(p39) do
		local _ = nil
		local var868 = nil
		local var869, var870, var871 = protoModule.readTag(p39, var867)
		local var872 = var869
		var868 = var870
		var867 = var871
		
		if var868 == protoModule.wireTypes.varint then
			local _ = nil
			local var873, var874 = protoModule.readVarInt(p39, var867)
			local _ = var873
			var867 = var874
			continue
		end
		if var868 == protoModule.wireTypes.lengthDelimited then
			if var872 == 1 then
				local _ = nil
				local var875, var876 = protoModule.readBuffer(p39, var867)
				var867 = var876
				table.insert(var866.options, t.TypographyProp_ConditionalOption.decode(var875))
			else
				local _ = nil
				local var877, var878 = protoModule.readVarInt(p39, var867)
				var867 = var878 + var877
			end
		elseif var868 == protoModule.wireTypes.i32 then
			local _ = nil
			local var879, var880 = protoModule.readFixed32(p39, var867)
			local _ = var879
			var867 = var880
		elseif var868 == protoModule.wireTypes.i64 then
			local _ = nil
			local var881, var882 = protoModule.readFixed64(p39, var867)
			local _ = var881
			var867 = var882
		else
			error("Unsupported wire type: " .. var1405)
		end
	end
	return var866
end

function t_39:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_39:jsonDecode()
	-- upvalues: t_39 (ref), t (ref)
	local var883 = t_39.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyProp_ConditionalOption.jsonDecode(v))
		end
		var883.options = t_1
	end
	return var883
end

t_39.descriptor = {
	name = "TypographyProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyProp_ConditionalOptions = t_39
typeRegistryModule.default:register(t.TypographyProp_ConditionalOptions)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p40)
	-- upvalues: t_40 (ref)
	return setmetatable({
		kind = if p40 == nil or p40.kind == nil then nil else p40.kind
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var884 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var885, var886 = protoModule.writeTag(buff, var884, 1, protoModule.wireTypes.lengthDelimited)
			var885, var1427 = protoModule.writeString(var885, var886, self.kind.value)
			buff = var885
			var884 = var886
		elseif self.kind.type == "conditional" then
			local var887 = self.kind.value:encode()
			local var888, var889 = protoModule.writeTag(buff, var884, 2, protoModule.wireTypes.lengthDelimited)
			var888, var1430 = protoModule.writeBuffer(var888, var889, var887, buffer.len(var887))
			buff = var888
			var884 = var889
		end
	end
	local buff_1 = buffer.create(var884)
	buffer.copy(buff_1, 0, buff, 0, var884)
	
	return buff_1
end

function t_40.decode(p40)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var884 = t_40.new()
	local var885 = 0
	while var885 < buffer.len(p40) do
		local _ = nil
		local var886 = nil
		local var887, var888, var889 = protoModule.readTag(p40, var885)
		local var890 = var887
		var886 = var888
		var885 = var889
		
		if var886 == protoModule.wireTypes.varint then
			local _ = nil
			local var891, var892 = protoModule.readVarInt(p40, var885)
			local _ = var891
			var885 = var892
			continue
		end
		if var886 == protoModule.wireTypes.lengthDelimited then
			if var890 == 1 then
				local _ = nil
				local var893, var894 = protoModule.readBuffer(p40, var885)
				var885 = var894
				var884.kind = { type = "token", value = buffer.tostring(var893) }
			elseif var890 == 2 then
				local _ = nil
				local var895, var896 = protoModule.readBuffer(p40, var885)
				var885 = var896
				var884.kind = {
					type = "conditional",
					value = t.TypographyFontProp_ConditionalOptions.decode(var895)
				}
			else
				local _ = nil
				local var897, var898 = protoModule.readVarInt(p40, var885)
				var885 = var898 + var897
			end
		elseif var886 == protoModule.wireTypes.i32 then
			local _ = nil
			local var899, var900 = protoModule.readFixed32(p40, var885)
			local _ = var899
			var885 = var900
		elseif var886 == protoModule.wireTypes.i64 then
			local _ = nil
			local var901, var902 = protoModule.readFixed64(p40, var885)
			local _ = var901
			var885 = var902
		else
			error("Unsupported wire type: " .. var1434)
		end
	end
	return var884
end

function t_40:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_40:jsonDecode()
	-- upvalues: t_40 (ref), t (ref)
	local var903 = t_40.new()
	
	if self.token ~= nil then
		var903.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var903.kind = {
			type = "conditional",
			value = t.TypographyFontProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var903
end

t_40.descriptor = {
	name = "TypographyFontProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
}
t.TypographyFontProp = t_40
typeRegistryModule.default:register(t.TypographyFontProp)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p41)
	-- upvalues: t_41 (ref)
	return setmetatable({
		condition = if p41 == nil or p41.condition == nil then nil else p41.condition,
		kind = if p41 == nil or p41.kind == nil then nil else p41.kind
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var903 = 0
	
	if self.condition ~= nil then
		local var904 = self.condition:encode()
		local var905, var906 = protoModule.writeTag(buff, var903, 1, protoModule.wireTypes.lengthDelimited)
		var905, var1457 = protoModule.writeBuffer(var905, var906, var904, buffer.len(var904))
		buff = var905
		var903 = var906
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var907, var908 = protoModule.writeTag(buff, var903, 2, protoModule.wireTypes.lengthDelimited)
		var907, var1459 = protoModule.writeString(var907, var908, self.kind.value)
		buff = var907
		var903 = var908
	end
	local buff_1 = buffer.create(var903)
	buffer.copy(buff_1, 0, buff, 0, var903)
	
	return buff_1
end

function t_41.decode(p41)
	-- upvalues: t_41 (ref), protoModule (ref), propConditionModule (ref)
	local var903 = t_41.new()
	local var904 = 0
	while var904 < buffer.len(p41) do
		local _ = nil
		local var905 = nil
		local var906, var907, var908 = protoModule.readTag(p41, var904)
		local var909 = var906
		var905 = var907
		var904 = var908
		
		if var905 == protoModule.wireTypes.varint then
			local _ = nil
			local var910, var911 = protoModule.readVarInt(p41, var904)
			local _ = var910
			var904 = var911
			continue
		end
		if var905 == protoModule.wireTypes.lengthDelimited then
			if var909 == 1 then
				local _ = nil
				local var912, var913 = protoModule.readBuffer(p41, var904)
				var904 = var913
				var903.condition = propConditionModule.PropCondition.decode(var912)
			elseif var909 == 2 then
				local _ = nil
				local var914, var915 = protoModule.readBuffer(p41, var904)
				var904 = var915
				var903.kind = { type = "token", value = buffer.tostring(var914) }
			else
				local _ = nil
				local var916, var917 = protoModule.readVarInt(p41, var904)
				var904 = var917 + var916
			end
		elseif var905 == protoModule.wireTypes.i32 then
			local _ = nil
			local var918, var919 = protoModule.readFixed32(p41, var904)
			local _ = var918
			var904 = var919
		elseif var905 == protoModule.wireTypes.i64 then
			local _ = nil
			local var920, var921 = protoModule.readFixed64(p41, var904)
			local _ = var920
			var904 = var921
		else
			error("Unsupported wire type: " .. var1463)
		end
	end
	return var903
end

function t_41:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_41:jsonDecode()
	-- upvalues: t_41 (ref), propConditionModule (ref)
	local var922 = t_41.new()
	
	if self.condition ~= nil then
		var922.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var922.kind = { type = "token", value = self.token }
	end
	return var922
end

t_41.descriptor = {
	name = "TypographyFontProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyFontProp_ConditionalOption = t_41
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOption)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p42)
	-- upvalues: t_42 (ref)
	return setmetatable({
		options = if p42 == nil or p42.options == nil then {} else p42.options
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var922 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var923 = v:encode()
			local var924, var925 = protoModule.writeTag(buff, var922, 1, protoModule.wireTypes.lengthDelimited)
			var924, var1486 = protoModule.writeBuffer(var924, var925, var923, buffer.len(var923))
			buff = var924
			var922 = var925
		end
	end
	local buff_1 = buffer.create(var922)
	buffer.copy(buff_1, 0, buff, 0, var922)
	
	return buff_1
end

function t_42.decode(p42)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var926 = t_42.new()
	local var927 = 0
	while var927 < buffer.len(p42) do
		local _ = nil
		local var928 = nil
		local var929, var930, var931 = protoModule.readTag(p42, var927)
		local var932 = var929
		var928 = var930
		var927 = var931
		
		if var928 == protoModule.wireTypes.varint then
			local _ = nil
			local var933, var934 = protoModule.readVarInt(p42, var927)
			local _ = var933
			var927 = var934
			continue
		end
		if var928 == protoModule.wireTypes.lengthDelimited then
			if var932 == 1 then
				local _ = nil
				local var935, var936 = protoModule.readBuffer(p42, var927)
				var927 = var936
				table.insert(var926.options, t.TypographyFontProp_ConditionalOption.decode(var935))
			else
				local _ = nil
				local var937, var938 = protoModule.readVarInt(p42, var927)
				var927 = var938 + var937
			end
		elseif var928 == protoModule.wireTypes.i32 then
			local _ = nil
			local var939, var940 = protoModule.readFixed32(p42, var927)
			local _ = var939
			var927 = var940
		elseif var928 == protoModule.wireTypes.i64 then
			local _ = nil
			local var941, var942 = protoModule.readFixed64(p42, var927)
			local _ = var941
			var927 = var942
		else
			error("Unsupported wire type: " .. var1490)
		end
	end
	return var926
end

function t_42:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_42:jsonDecode()
	-- upvalues: t_42 (ref), t (ref)
	local var943 = t_42.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyFontProp_ConditionalOption.jsonDecode(v))
		end
		var943.options = t_1
	end
	return var943
end

t_42.descriptor = {
	name = "TypographyFontProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyFontProp_ConditionalOptions = t_42
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOptions)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p43)
	-- upvalues: t_43 (ref)
	return setmetatable({
		kind = if p43 == nil or p43.kind == nil then nil else p43.kind
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var944 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var945, var946 = protoModule.writeTag(buff, var944, 1, protoModule.wireTypes.lengthDelimited)
			var945, var1512 = protoModule.writeString(var945, var946, self.kind.value)
			buff = var945
			var944 = var946
		elseif self.kind.type == "conditional" then
			local var947 = self.kind.value:encode()
			local var948, var949 = protoModule.writeTag(buff, var944, 2, protoModule.wireTypes.lengthDelimited)
			var948, var1515 = protoModule.writeBuffer(var948, var949, var947, buffer.len(var947))
			buff = var948
			var944 = var949
		end
	end
	local buff_1 = buffer.create(var944)
	buffer.copy(buff_1, 0, buff, 0, var944)
	
	return buff_1
end

function t_43.decode(p43)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var944 = t_43.new()
	local var945 = 0
	while var945 < buffer.len(p43) do
		local _ = nil
		local var946 = nil
		local var947, var948, var949 = protoModule.readTag(p43, var945)
		local var950 = var947
		var946 = var948
		var945 = var949
		
		if var946 == protoModule.wireTypes.varint then
			local _ = nil
			local var951, var952 = protoModule.readVarInt(p43, var945)
			local _ = var951
			var945 = var952
			continue
		end
		if var946 == protoModule.wireTypes.lengthDelimited then
			if var950 == 1 then
				local _ = nil
				local var953, var954 = protoModule.readBuffer(p43, var945)
				var945 = var954
				var944.kind = { type = "token", value = buffer.tostring(var953) }
			elseif var950 == 2 then
				local _ = nil
				local var955, var956 = protoModule.readBuffer(p43, var945)
				var945 = var956
				var944.kind = {
					type = "conditional",
					value = t.ColorStyleProp_ConditionalOptions.decode(var955)
				}
			else
				local _ = nil
				local var957, var958 = protoModule.readVarInt(p43, var945)
				var945 = var958 + var957
			end
		elseif var946 == protoModule.wireTypes.i32 then
			local _ = nil
			local var959, var960 = protoModule.readFixed32(p43, var945)
			local _ = var959
			var945 = var960
		elseif var946 == protoModule.wireTypes.i64 then
			local _ = nil
			local var961, var962 = protoModule.readFixed64(p43, var945)
			local _ = var961
			var945 = var962
		else
			error("Unsupported wire type: " .. var1519)
		end
	end
	return var944
end

function t_43:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_43:jsonDecode()
	-- upvalues: t_43 (ref), t (ref)
	local var963 = t_43.new()
	
	if self.token ~= nil then
		var963.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var963.kind = {
			type = "conditional",
			value = t.ColorStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var963
end

t_43.descriptor = {
	name = "ColorStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
}
t.ColorStyleProp = t_43
typeRegistryModule.default:register(t.ColorStyleProp)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p44)
	-- upvalues: t_44 (ref)
	return setmetatable({
		condition = if p44 == nil or p44.condition == nil then nil else p44.condition,
		kind = if p44 == nil or p44.kind == nil then nil else p44.kind
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var963 = 0
	
	if self.condition ~= nil then
		local var964 = self.condition:encode()
		local var965, var966 = protoModule.writeTag(buff, var963, 1, protoModule.wireTypes.lengthDelimited)
		var965, var1542 = protoModule.writeBuffer(var965, var966, var964, buffer.len(var964))
		buff = var965
		var963 = var966
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var967, var968 = protoModule.writeTag(buff, var963, 2, protoModule.wireTypes.lengthDelimited)
		var967, var1544 = protoModule.writeString(var967, var968, self.kind.value)
		buff = var967
		var963 = var968
	end
	local buff_1 = buffer.create(var963)
	buffer.copy(buff_1, 0, buff, 0, var963)
	
	return buff_1
end

function t_44.decode(p44)
	-- upvalues: t_44 (ref), protoModule (ref), propConditionModule (ref)
	local var963 = t_44.new()
	local var964 = 0
	while var964 < buffer.len(p44) do
		local _ = nil
		local var965 = nil
		local var966, var967, var968 = protoModule.readTag(p44, var964)
		local var969 = var966
		var965 = var967
		var964 = var968
		
		if var965 == protoModule.wireTypes.varint then
			local _ = nil
			local var970, var971 = protoModule.readVarInt(p44, var964)
			local _ = var970
			var964 = var971
			continue
		end
		if var965 == protoModule.wireTypes.lengthDelimited then
			if var969 == 1 then
				local _ = nil
				local var972, var973 = protoModule.readBuffer(p44, var964)
				var964 = var973
				var963.condition = propConditionModule.PropCondition.decode(var972)
			elseif var969 == 2 then
				local _ = nil
				local var974, var975 = protoModule.readBuffer(p44, var964)
				var964 = var975
				var963.kind = { type = "token", value = buffer.tostring(var974) }
			else
				local _ = nil
				local var976, var977 = protoModule.readVarInt(p44, var964)
				var964 = var977 + var976
			end
		elseif var965 == protoModule.wireTypes.i32 then
			local _ = nil
			local var978, var979 = protoModule.readFixed32(p44, var964)
			local _ = var978
			var964 = var979
		elseif var965 == protoModule.wireTypes.i64 then
			local _ = nil
			local var980, var981 = protoModule.readFixed64(p44, var964)
			local _ = var980
			var964 = var981
		else
			error("Unsupported wire type: " .. var1548)
		end
	end
	return var963
end

function t_44:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_44:jsonDecode()
	-- upvalues: t_44 (ref), propConditionModule (ref)
	local var982 = t_44.new()
	
	if self.condition ~= nil then
		var982.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var982.kind = { type = "token", value = self.token }
	end
	return var982
end

t_44.descriptor = {
	name = "ColorStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorStyleProp_ConditionalOption = t_44
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOption)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p45)
	-- upvalues: t_45 (ref)
	return setmetatable({
		options = if p45 == nil or p45.options == nil then {} else p45.options
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var982 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var983 = v:encode()
			local var984, var985 = protoModule.writeTag(buff, var982, 1, protoModule.wireTypes.lengthDelimited)
			var984, var1571 = protoModule.writeBuffer(var984, var985, var983, buffer.len(var983))
			buff = var984
			var982 = var985
		end
	end
	local buff_1 = buffer.create(var982)
	buffer.copy(buff_1, 0, buff, 0, var982)
	
	return buff_1
end

function t_45.decode(p45)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var986 = t_45.new()
	local var987 = 0
	while var987 < buffer.len(p45) do
		local _ = nil
		local var988 = nil
		local var989, var990, var991 = protoModule.readTag(p45, var987)
		local var992 = var989
		var988 = var990
		var987 = var991
		
		if var988 == protoModule.wireTypes.varint then
			local _ = nil
			local var993, var994 = protoModule.readVarInt(p45, var987)
			local _ = var993
			var987 = var994
			continue
		end
		if var988 == protoModule.wireTypes.lengthDelimited then
			if var992 == 1 then
				local _ = nil
				local var995, var996 = protoModule.readBuffer(p45, var987)
				var987 = var996
				table.insert(var986.options, t.ColorStyleProp_ConditionalOption.decode(var995))
			else
				local _ = nil
				local var997, var998 = protoModule.readVarInt(p45, var987)
				var987 = var998 + var997
			end
		elseif var988 == protoModule.wireTypes.i32 then
			local _ = nil
			local var999, var1000 = protoModule.readFixed32(p45, var987)
			local _ = var999
			var987 = var1000
		elseif var988 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1001, var1002 = protoModule.readFixed64(p45, var987)
			local _ = var1001
			var987 = var1002
		else
			error("Unsupported wire type: " .. var1575)
		end
	end
	return var986
end

function t_45:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_45:jsonDecode()
	-- upvalues: t_45 (ref), t (ref)
	local var1003 = t_45.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorStyleProp_ConditionalOption.jsonDecode(v))
		end
		var1003.options = t_1
	end
	return var1003
end

t_45.descriptor = {
	name = "ColorStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorStyleProp_ConditionalOptions = t_45
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOptions)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p46)
	-- upvalues: t_46 (ref)
	return setmetatable({
		kind = if p46 == nil or p46.kind == nil then nil else p46.kind
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1004 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1005, var1006 = protoModule.writeTag(buff, var1004, 1, protoModule.wireTypes.lengthDelimited)
			var1005, var1597 = protoModule.writeString(var1005, var1006, self.kind.value)
			buff = var1005
			var1004 = var1006
		elseif self.kind.type == "conditional" then
			local var1007 = self.kind.value:encode()
			local var1008, var1009 = protoModule.writeTag(buff, var1004, 2, protoModule.wireTypes.lengthDelimited)
			var1008, var1600 = protoModule.writeBuffer(var1008, var1009, var1007, buffer.len(var1007))
			buff = var1008
			var1004 = var1009
		elseif self.kind.type == "binding_path" then
			local var1010, var1011 = protoModule.writeTag(buff, var1004, 3, protoModule.wireTypes.lengthDelimited)
			var1010, var1602 = protoModule.writeString(var1010, var1011, self.kind.value)
			buff = var1010
			var1004 = var1011
		end
	end
	local buff_1 = buffer.create(var1004)
	buffer.copy(buff_1, 0, buff, 0, var1004)
	
	return buff_1
end

function t_46.decode(p46)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1004 = t_46.new()
	local var1005 = 0
	while var1005 < buffer.len(p46) do
		local _ = nil
		local var1006 = nil
		local var1007, var1008, var1009 = protoModule.readTag(p46, var1005)
		local var1010 = var1007
		var1006 = var1008
		var1005 = var1009
		
		if var1006 == protoModule.wireTypes.varint then
			local _ = nil
			local var1011, var1012 = protoModule.readVarInt(p46, var1005)
			local _ = var1011
			var1005 = var1012
			continue
		end
		if var1006 == protoModule.wireTypes.lengthDelimited then
			if var1010 == 1 then
				local _ = nil
				local var1013, var1014 = protoModule.readBuffer(p46, var1005)
				var1005 = var1014
				var1004.kind = { type = "literal", value = buffer.tostring(var1013) }
			elseif var1010 == 2 then
				local _ = nil
				local var1015, var1016 = protoModule.readBuffer(p46, var1005)
				var1005 = var1016
				var1004.kind = {
					type = "conditional",
					value = t.FillBehaviorProp_ConditionalOptions.decode(var1015)
				}
			elseif var1010 == 3 then
				local _ = nil
				local var1017, var1018 = protoModule.readBuffer(p46, var1005)
				var1005 = var1018
				var1004.kind = { type = "binding_path", value = buffer.tostring(var1017) }
			else
				local _ = nil
				local var1019, var1020 = protoModule.readVarInt(p46, var1005)
				var1005 = var1020 + var1019
			end
		elseif var1006 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1021, var1022 = protoModule.readFixed32(p46, var1005)
			local _ = var1021
			var1005 = var1022
		elseif var1006 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1023, var1024 = protoModule.readFixed64(p46, var1005)
			local _ = var1023
			var1005 = var1024
		else
			error("Unsupported wire type: " .. var1606)
		end
	end
	return var1004
end

function t_46:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_46:jsonDecode()
	-- upvalues: t_46 (ref), t (ref)
	local var1025 = t_46.new()
	
	if self.literal ~= nil then
		var1025.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1025.kind = {
			type = "conditional",
			value = t.FillBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1025.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1025.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1025
end

t_46.descriptor = {
	name = "FillBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
}
t.FillBehaviorProp = t_46
typeRegistryModule.default:register(t.FillBehaviorProp)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p47)
	-- upvalues: t_47 (ref)
	return setmetatable({
		condition = if p47 == nil or p47.condition == nil then nil else p47.condition,
		kind = if p47 == nil or p47.kind == nil then nil else p47.kind
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1025 = 0
	
	if self.condition ~= nil then
		local var1026 = self.condition:encode()
		local var1027, var1028 = protoModule.writeTag(buff, var1025, 1, protoModule.wireTypes.lengthDelimited)
		var1027, var1631 = protoModule.writeBuffer(var1027, var1028, var1026, buffer.len(var1026))
		buff = var1027
		var1025 = var1028
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1029, var1030 = protoModule.writeTag(buff, var1025, 2, protoModule.wireTypes.lengthDelimited)
			var1029, var1633 = protoModule.writeString(var1029, var1030, self.kind.value)
			buff = var1029
			var1025 = var1030
		elseif self.kind.type == "binding_path" then
			local var1031, var1032 = protoModule.writeTag(buff, var1025, 3, protoModule.wireTypes.lengthDelimited)
			var1031, var1635 = protoModule.writeString(var1031, var1032, self.kind.value)
			buff = var1031
			var1025 = var1032
		end
	end
	local buff_1 = buffer.create(var1025)
	buffer.copy(buff_1, 0, buff, 0, var1025)
	
	return buff_1
end

function t_47.decode(p47)
	-- upvalues: t_47 (ref), protoModule (ref), propConditionModule (ref)
	local var1025 = t_47.new()
	local var1026 = 0
	while var1026 < buffer.len(p47) do
		local _ = nil
		local var1027 = nil
		local var1028, var1029, var1030 = protoModule.readTag(p47, var1026)
		local var1031 = var1028
		var1027 = var1029
		var1026 = var1030
		
		if var1027 == protoModule.wireTypes.varint then
			local _ = nil
			local var1032, var1033 = protoModule.readVarInt(p47, var1026)
			local _ = var1032
			var1026 = var1033
			continue
		end
		if var1027 == protoModule.wireTypes.lengthDelimited then
			if var1031 == 1 then
				local _ = nil
				local var1034, var1035 = protoModule.readBuffer(p47, var1026)
				var1026 = var1035
				var1025.condition = propConditionModule.PropCondition.decode(var1034)
			elseif var1031 == 2 then
				local _ = nil
				local var1036, var1037 = protoModule.readBuffer(p47, var1026)
				var1026 = var1037
				var1025.kind = { type = "literal", value = buffer.tostring(var1036) }
			elseif var1031 == 3 then
				local _ = nil
				local var1038, var1039 = protoModule.readBuffer(p47, var1026)
				var1026 = var1039
				var1025.kind = { type = "binding_path", value = buffer.tostring(var1038) }
			else
				local _ = nil
				local var1040, var1041 = protoModule.readVarInt(p47, var1026)
				var1026 = var1041 + var1040
			end
		elseif var1027 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1042, var1043 = protoModule.readFixed32(p47, var1026)
			local _ = var1042
			var1026 = var1043
		elseif var1027 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1044, var1045 = protoModule.readFixed64(p47, var1026)
			local _ = var1044
			var1026 = var1045
		else
			error("Unsupported wire type: " .. var1639)
		end
	end
	return var1025
end

function t_47:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_47:jsonDecode()
	-- upvalues: t_47 (ref), propConditionModule (ref)
	local var1046 = t_47.new()
	
	if self.condition ~= nil then
		var1046.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1046.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1046.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1046.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1046
end

t_47.descriptor = {
	name = "FillBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FillBehaviorProp_ConditionalOption = t_47
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOption)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p48)
	-- upvalues: t_48 (ref)
	return setmetatable({
		options = if p48 == nil or p48.options == nil then {} else p48.options
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1046 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1047 = v:encode()
			local var1048, var1049 = protoModule.writeTag(buff, var1046, 1, protoModule.wireTypes.lengthDelimited)
			var1048, var1664 = protoModule.writeBuffer(var1048, var1049, var1047, buffer.len(var1047))
			buff = var1048
			var1046 = var1049
		end
	end
	local buff_1 = buffer.create(var1046)
	buffer.copy(buff_1, 0, buff, 0, var1046)
	
	return buff_1
end

function t_48.decode(p48)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1050 = t_48.new()
	local var1051 = 0
	while var1051 < buffer.len(p48) do
		local _ = nil
		local var1052 = nil
		local var1053, var1054, var1055 = protoModule.readTag(p48, var1051)
		local var1056 = var1053
		var1052 = var1054
		var1051 = var1055
		
		if var1052 == protoModule.wireTypes.varint then
			local _ = nil
			local var1057, var1058 = protoModule.readVarInt(p48, var1051)
			local _ = var1057
			var1051 = var1058
			continue
		end
		if var1052 == protoModule.wireTypes.lengthDelimited then
			if var1056 == 1 then
				local _ = nil
				local var1059, var1060 = protoModule.readBuffer(p48, var1051)
				var1051 = var1060
				table.insert(var1050.options, t.FillBehaviorProp_ConditionalOption.decode(var1059))
			else
				local _ = nil
				local var1061, var1062 = protoModule.readVarInt(p48, var1051)
				var1051 = var1062 + var1061
			end
		elseif var1052 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1063, var1064 = protoModule.readFixed32(p48, var1051)
			local _ = var1063
			var1051 = var1064
		elseif var1052 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1065, var1066 = protoModule.readFixed64(p48, var1051)
			local _ = var1065
			var1051 = var1066
		else
			error("Unsupported wire type: " .. var1668)
		end
	end
	return var1050
end

function t_48:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_48:jsonDecode()
	-- upvalues: t_48 (ref), t (ref)
	local var1067 = t_48.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FillBehaviorProp_ConditionalOption.jsonDecode(v))
		end
		var1067.options = t_1
	end
	return var1067
end

t_48.descriptor = {
	name = "FillBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FillBehaviorProp_ConditionalOptions = t_48
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOptions)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p49)
	-- upvalues: t_49 (ref)
	return setmetatable({
		kind = if p49 == nil or p49.kind == nil then nil else p49.kind
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1068 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1069, var1070 = protoModule.writeTag(buff, var1068, 1, protoModule.wireTypes.lengthDelimited)
			var1069, var1690 = protoModule.writeString(var1069, var1070, self.kind.value)
			buff = var1069
			var1068 = var1070
		elseif self.kind.type == "conditional" then
			local var1071 = self.kind.value:encode()
			local var1072, var1073 = protoModule.writeTag(buff, var1068, 2, protoModule.wireTypes.lengthDelimited)
			var1072, var1693 = protoModule.writeBuffer(var1072, var1073, var1071, buffer.len(var1071))
			buff = var1072
			var1068 = var1073
		elseif self.kind.type == "binding_path" then
			local var1074, var1075 = protoModule.writeTag(buff, var1068, 3, protoModule.wireTypes.lengthDelimited)
			var1074, var1695 = protoModule.writeString(var1074, var1075, self.kind.value)
			buff = var1074
			var1068 = var1075
		end
	end
	local buff_1 = buffer.create(var1068)
	buffer.copy(buff_1, 0, buff, 0, var1068)
	
	return buff_1
end

function t_49.decode(p49)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1068 = t_49.new()
	local var1069 = 0
	while var1069 < buffer.len(p49) do
		local _ = nil
		local var1070 = nil
		local var1071, var1072, var1073 = protoModule.readTag(p49, var1069)
		local var1074 = var1071
		var1070 = var1072
		var1069 = var1073
		
		if var1070 == protoModule.wireTypes.varint then
			local _ = nil
			local var1075, var1076 = protoModule.readVarInt(p49, var1069)
			local _ = var1075
			var1069 = var1076
			continue
		end
		if var1070 == protoModule.wireTypes.lengthDelimited then
			if var1074 == 1 then
				local _ = nil
				local var1077, var1078 = protoModule.readBuffer(p49, var1069)
				var1069 = var1078
				var1068.kind = { type = "literal", value = buffer.tostring(var1077) }
			elseif var1074 == 2 then
				local _ = nil
				local var1079, var1080 = protoModule.readBuffer(p49, var1069)
				var1069 = var1080
				var1068.kind = {
					type = "conditional",
					value = t.InputSizeProp_ConditionalOptions.decode(var1079)
				}
			elseif var1074 == 3 then
				local _ = nil
				local var1081, var1082 = protoModule.readBuffer(p49, var1069)
				var1069 = var1082
				var1068.kind = { type = "binding_path", value = buffer.tostring(var1081) }
			else
				local _ = nil
				local var1083, var1084 = protoModule.readVarInt(p49, var1069)
				var1069 = var1084 + var1083
			end
		elseif var1070 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1085, var1086 = protoModule.readFixed32(p49, var1069)
			local _ = var1085
			var1069 = var1086
		elseif var1070 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1087, var1088 = protoModule.readFixed64(p49, var1069)
			local _ = var1087
			var1069 = var1088
		else
			error("Unsupported wire type: " .. var1699)
		end
	end
	return var1068
end

function t_49:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_49:jsonDecode()
	-- upvalues: t_49 (ref), t (ref)
	local var1089 = t_49.new()
	
	if self.literal ~= nil then
		var1089.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1089.kind = {
			type = "conditional",
			value = t.InputSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1089.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1089.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1089
end

t_49.descriptor = {
	name = "InputSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
}
t.InputSizeProp = t_49
typeRegistryModule.default:register(t.InputSizeProp)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p50)
	-- upvalues: t_50 (ref)
	return setmetatable({
		condition = if p50 == nil or p50.condition == nil then nil else p50.condition,
		kind = if p50 == nil or p50.kind == nil then nil else p50.kind
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1089 = 0
	
	if self.condition ~= nil then
		local var1090 = self.condition:encode()
		local var1091, var1092 = protoModule.writeTag(buff, var1089, 1, protoModule.wireTypes.lengthDelimited)
		var1091, var1724 = protoModule.writeBuffer(var1091, var1092, var1090, buffer.len(var1090))
		buff = var1091
		var1089 = var1092
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1093, var1094 = protoModule.writeTag(buff, var1089, 2, protoModule.wireTypes.lengthDelimited)
			var1093, var1726 = protoModule.writeString(var1093, var1094, self.kind.value)
			buff = var1093
			var1089 = var1094
		elseif self.kind.type == "binding_path" then
			local var1095, var1096 = protoModule.writeTag(buff, var1089, 3, protoModule.wireTypes.lengthDelimited)
			var1095, var1728 = protoModule.writeString(var1095, var1096, self.kind.value)
			buff = var1095
			var1089 = var1096
		end
	end
	local buff_1 = buffer.create(var1089)
	buffer.copy(buff_1, 0, buff, 0, var1089)
	
	return buff_1
end

function t_50.decode(p50)
	-- upvalues: t_50 (ref), protoModule (ref), propConditionModule (ref)
	local var1089 = t_50.new()
	local var1090 = 0
	while var1090 < buffer.len(p50) do
		local _ = nil
		local var1091 = nil
		local var1092, var1093, var1094 = protoModule.readTag(p50, var1090)
		local var1095 = var1092
		var1091 = var1093
		var1090 = var1094
		
		if var1091 == protoModule.wireTypes.varint then
			local _ = nil
			local var1096, var1097 = protoModule.readVarInt(p50, var1090)
			local _ = var1096
			var1090 = var1097
			continue
		end
		if var1091 == protoModule.wireTypes.lengthDelimited then
			if var1095 == 1 then
				local _ = nil
				local var1098, var1099 = protoModule.readBuffer(p50, var1090)
				var1090 = var1099
				var1089.condition = propConditionModule.PropCondition.decode(var1098)
			elseif var1095 == 2 then
				local _ = nil
				local var1100, var1101 = protoModule.readBuffer(p50, var1090)
				var1090 = var1101
				var1089.kind = { type = "literal", value = buffer.tostring(var1100) }
			elseif var1095 == 3 then
				local _ = nil
				local var1102, var1103 = protoModule.readBuffer(p50, var1090)
				var1090 = var1103
				var1089.kind = { type = "binding_path", value = buffer.tostring(var1102) }
			else
				local _ = nil
				local var1104, var1105 = protoModule.readVarInt(p50, var1090)
				var1090 = var1105 + var1104
			end
		elseif var1091 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1106, var1107 = protoModule.readFixed32(p50, var1090)
			local _ = var1106
			var1090 = var1107
		elseif var1091 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1108, var1109 = protoModule.readFixed64(p50, var1090)
			local _ = var1108
			var1090 = var1109
		else
			error("Unsupported wire type: " .. var1732)
		end
	end
	return var1089
end

function t_50:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_50:jsonDecode()
	-- upvalues: t_50 (ref), propConditionModule (ref)
	local var1110 = t_50.new()
	
	if self.condition ~= nil then
		var1110.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1110.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1110.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1110.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1110
end

t_50.descriptor = {
	name = "InputSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.InputSizeProp_ConditionalOption = t_50
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOption)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p51)
	-- upvalues: t_51 (ref)
	return setmetatable({
		options = if p51 == nil or p51.options == nil then {} else p51.options
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1110 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1111 = v:encode()
			local var1112, var1113 = protoModule.writeTag(buff, var1110, 1, protoModule.wireTypes.lengthDelimited)
			var1112, var1757 = protoModule.writeBuffer(var1112, var1113, var1111, buffer.len(var1111))
			buff = var1112
			var1110 = var1113
		end
	end
	local buff_1 = buffer.create(var1110)
	buffer.copy(buff_1, 0, buff, 0, var1110)
	
	return buff_1
end

function t_51.decode(p51)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1114 = t_51.new()
	local var1115 = 0
	while var1115 < buffer.len(p51) do
		local _ = nil
		local var1116 = nil
		local var1117, var1118, var1119 = protoModule.readTag(p51, var1115)
		local var1120 = var1117
		var1116 = var1118
		var1115 = var1119
		
		if var1116 == protoModule.wireTypes.varint then
			local _ = nil
			local var1121, var1122 = protoModule.readVarInt(p51, var1115)
			local _ = var1121
			var1115 = var1122
			continue
		end
		if var1116 == protoModule.wireTypes.lengthDelimited then
			if var1120 == 1 then
				local _ = nil
				local var1123, var1124 = protoModule.readBuffer(p51, var1115)
				var1115 = var1124
				table.insert(var1114.options, t.InputSizeProp_ConditionalOption.decode(var1123))
			else
				local _ = nil
				local var1125, var1126 = protoModule.readVarInt(p51, var1115)
				var1115 = var1126 + var1125
			end
		elseif var1116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1127, var1128 = protoModule.readFixed32(p51, var1115)
			local _ = var1127
			var1115 = var1128
		elseif var1116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1129, var1130 = protoModule.readFixed64(p51, var1115)
			local _ = var1129
			var1115 = var1130
		else
			error("Unsupported wire type: " .. var1761)
		end
	end
	return var1114
end

function t_51:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_51:jsonDecode()
	-- upvalues: t_51 (ref), t (ref)
	local var1131 = t_51.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.InputSizeProp_ConditionalOption.jsonDecode(v))
		end
		var1131.options = t_1
	end
	return var1131
end

t_51.descriptor = {
	name = "InputSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.InputSizeProp_ConditionalOptions = t_51
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOptions)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p52)
	-- upvalues: t_52 (ref)
	return setmetatable({
		kind = if p52 == nil or p52.kind == nil then nil else p52.kind
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1132 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1133, var1134 = protoModule.writeTag(buff, var1132, 1, protoModule.wireTypes.lengthDelimited)
			var1133, var1783 = protoModule.writeString(var1133, var1134, self.kind.value)
			buff = var1133
			var1132 = var1134
		elseif self.kind.type == "token" then
			local var1135, var1136 = protoModule.writeTag(buff, var1132, 2, protoModule.wireTypes.lengthDelimited)
			var1135, var1785 = protoModule.writeString(var1135, var1136, self.kind.value)
			buff = var1135
			var1132 = var1136
		elseif self.kind.type == "conditional" then
			local var1137 = self.kind.value:encode()
			local var1138, var1139 = protoModule.writeTag(buff, var1132, 3, protoModule.wireTypes.lengthDelimited)
			var1138, var1788 = protoModule.writeBuffer(var1138, var1139, var1137, buffer.len(var1137))
			buff = var1138
			var1132 = var1139
		elseif self.kind.type == "binding_path" then
			local var1140, var1141 = protoModule.writeTag(buff, var1132, 4, protoModule.wireTypes.lengthDelimited)
			var1140, var1790 = protoModule.writeString(var1140, var1141, self.kind.value)
			buff = var1140
			var1132 = var1141
		end
	end
	local buff_1 = buffer.create(var1132)
	buffer.copy(buff_1, 0, buff, 0, var1132)
	
	return buff_1
end

function t_52.decode(p52)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1132 = t_52.new()
	local var1133 = 0
	while var1133 < buffer.len(p52) do
		local _ = nil
		local var1134 = nil
		local var1135, var1136, var1137 = protoModule.readTag(p52, var1133)
		local var1138 = var1135
		var1134 = var1136
		var1133 = var1137
		
		if var1134 == protoModule.wireTypes.varint then
			local _ = nil
			local var1139, var1140 = protoModule.readVarInt(p52, var1133)
			local _ = var1139
			var1133 = var1140
			continue
		end
		if var1134 == protoModule.wireTypes.lengthDelimited then
			if var1138 == 1 then
				local _ = nil
				local var1141, var1142 = protoModule.readBuffer(p52, var1133)
				var1133 = var1142
				var1132.kind = { type = "literal", value = buffer.tostring(var1141) }
			elseif var1138 == 2 then
				local _ = nil
				local var1143, var1144 = protoModule.readBuffer(p52, var1133)
				var1133 = var1144
				var1132.kind = { type = "token", value = buffer.tostring(var1143) }
			elseif var1138 == 3 then
				local _ = nil
				local var1145, var1146 = protoModule.readBuffer(p52, var1133)
				var1133 = var1146
				var1132.kind = {
					type = "conditional",
					value = t.UDimProp_ConditionalOptions.decode(var1145)
				}
			elseif var1138 == 4 then
				local _ = nil
				local var1147, var1148 = protoModule.readBuffer(p52, var1133)
				var1133 = var1148
				var1132.kind = { type = "binding_path", value = buffer.tostring(var1147) }
			else
				local _ = nil
				local var1149, var1150 = protoModule.readVarInt(p52, var1133)
				var1133 = var1150 + var1149
			end
		elseif var1134 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1151, var1152 = protoModule.readFixed32(p52, var1133)
			local _ = var1151
			var1133 = var1152
		elseif var1134 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1153, var1154 = protoModule.readFixed64(p52, var1133)
			local _ = var1153
			var1133 = var1154
		else
			error("Unsupported wire type: " .. var1794)
		end
	end
	return var1132
end

function t_52:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_52:jsonDecode()
	-- upvalues: t_52 (ref), t (ref)
	local var1155 = t_52.new()
	
	if self.literal ~= nil then
		var1155.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1155.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1155.kind = {
			type = "conditional",
			value = t.UDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1155.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1155.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1155
end

t_52.descriptor = {
	name = "UDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
}
t.UDimProp = t_52
typeRegistryModule.default:register(t.UDimProp)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p53)
	-- upvalues: t_53 (ref)
	return setmetatable({
		condition = if p53 == nil or p53.condition == nil then nil else p53.condition,
		kind = if p53 == nil or p53.kind == nil then nil else p53.kind
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1155 = 0
	
	if self.condition ~= nil then
		local var1156 = self.condition:encode()
		local var1157, var1158 = protoModule.writeTag(buff, var1155, 1, protoModule.wireTypes.lengthDelimited)
		var1157, var1821 = protoModule.writeBuffer(var1157, var1158, var1156, buffer.len(var1156))
		buff = var1157
		var1155 = var1158
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1159, var1160 = protoModule.writeTag(buff, var1155, 2, protoModule.wireTypes.lengthDelimited)
			var1159, var1823 = protoModule.writeString(var1159, var1160, self.kind.value)
			buff = var1159
			var1155 = var1160
		elseif self.kind.type == "token" then
			local var1161, var1162 = protoModule.writeTag(buff, var1155, 3, protoModule.wireTypes.lengthDelimited)
			var1161, var1825 = protoModule.writeString(var1161, var1162, self.kind.value)
			buff = var1161
			var1155 = var1162
		elseif self.kind.type == "binding_path" then
			local var1163, var1164 = protoModule.writeTag(buff, var1155, 4, protoModule.wireTypes.lengthDelimited)
			var1163, var1827 = protoModule.writeString(var1163, var1164, self.kind.value)
			buff = var1163
			var1155 = var1164
		end
	end
	local buff_1 = buffer.create(var1155)
	buffer.copy(buff_1, 0, buff, 0, var1155)
	
	return buff_1
end

function t_53.decode(p53)
	-- upvalues: t_53 (ref), protoModule (ref), propConditionModule (ref)
	local var1155 = t_53.new()
	local var1156 = 0
	while var1156 < buffer.len(p53) do
		local _ = nil
		local var1157 = nil
		local var1158, var1159, var1160 = protoModule.readTag(p53, var1156)
		local var1161 = var1158
		var1157 = var1159
		var1156 = var1160
		
		if var1157 == protoModule.wireTypes.varint then
			local _ = nil
			local var1162, var1163 = protoModule.readVarInt(p53, var1156)
			local _ = var1162
			var1156 = var1163
			continue
		end
		if var1157 == protoModule.wireTypes.lengthDelimited then
			if var1161 == 1 then
				local _ = nil
				local var1164, var1165 = protoModule.readBuffer(p53, var1156)
				var1156 = var1165
				var1155.condition = propConditionModule.PropCondition.decode(var1164)
			elseif var1161 == 2 then
				local _ = nil
				local var1166, var1167 = protoModule.readBuffer(p53, var1156)
				var1156 = var1167
				var1155.kind = { type = "literal", value = buffer.tostring(var1166) }
			elseif var1161 == 3 then
				local _ = nil
				local var1168, var1169 = protoModule.readBuffer(p53, var1156)
				var1156 = var1169
				var1155.kind = { type = "token", value = buffer.tostring(var1168) }
			elseif var1161 == 4 then
				local _ = nil
				local var1170, var1171 = protoModule.readBuffer(p53, var1156)
				var1156 = var1171
				var1155.kind = { type = "binding_path", value = buffer.tostring(var1170) }
			else
				local _ = nil
				local var1172, var1173 = protoModule.readVarInt(p53, var1156)
				var1156 = var1173 + var1172
			end
		elseif var1157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1174, var1175 = protoModule.readFixed32(p53, var1156)
			local _ = var1174
			var1156 = var1175
		elseif var1157 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1176, var1177 = protoModule.readFixed64(p53, var1156)
			local _ = var1176
			var1156 = var1177
		else
			error("Unsupported wire type: " .. var1831)
		end
	end
	return var1155
end

function t_53:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_53:jsonDecode()
	-- upvalues: t_53 (ref), propConditionModule (ref)
	local var1178 = t_53.new()
	
	if self.condition ~= nil then
		var1178.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1178.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1178.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1178.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1178.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1178
end

t_53.descriptor = {
	name = "UDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDimProp_ConditionalOption = t_53
typeRegistryModule.default:register(t.UDimProp_ConditionalOption)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p54)
	-- upvalues: t_54 (ref)
	return setmetatable({
		options = if p54 == nil or p54.options == nil then {} else p54.options
	}, t_54)
end

function t_54:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1178 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1179 = v:encode()
			local var1180, var1181 = protoModule.writeTag(buff, var1178, 1, protoModule.wireTypes.lengthDelimited)
			var1180, var1858 = protoModule.writeBuffer(var1180, var1181, var1179, buffer.len(var1179))
			buff = var1180
			var1178 = var1181
		end
	end
	local buff_1 = buffer.create(var1178)
	buffer.copy(buff_1, 0, buff, 0, var1178)
	
	return buff_1
end

function t_54.decode(p54)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1182 = t_54.new()
	local var1183 = 0
	while var1183 < buffer.len(p54) do
		local _ = nil
		local var1184 = nil
		local var1185, var1186, var1187 = protoModule.readTag(p54, var1183)
		local var1188 = var1185
		var1184 = var1186
		var1183 = var1187
		
		if var1184 == protoModule.wireTypes.varint then
			local _ = nil
			local var1189, var1190 = protoModule.readVarInt(p54, var1183)
			local _ = var1189
			var1183 = var1190
			continue
		end
		if var1184 == protoModule.wireTypes.lengthDelimited then
			if var1188 == 1 then
				local _ = nil
				local var1191, var1192 = protoModule.readBuffer(p54, var1183)
				var1183 = var1192
				table.insert(var1182.options, t.UDimProp_ConditionalOption.decode(var1191))
			else
				local _ = nil
				local var1193, var1194 = protoModule.readVarInt(p54, var1183)
				var1183 = var1194 + var1193
			end
		elseif var1184 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1195, var1196 = protoModule.readFixed32(p54, var1183)
			local _ = var1195
			var1183 = var1196
		elseif var1184 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1197, var1198 = protoModule.readFixed64(p54, var1183)
			local _ = var1197
			var1183 = var1198
		else
			error("Unsupported wire type: " .. var1862)
		end
	end
	return var1182
end

function t_54:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_54:jsonDecode()
	-- upvalues: t_54 (ref), t (ref)
	local var1199 = t_54.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDimProp_ConditionalOption.jsonDecode(v))
		end
		var1199.options = t_1
	end
	return var1199
end

t_54.descriptor = {
	name = "UDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDimProp_ConditionalOptions = t_54
typeRegistryModule.default:register(t.UDimProp_ConditionalOptions)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p55)
	-- upvalues: t_55 (ref)
	return setmetatable({
		kind = if p55 == nil or p55.kind == nil then nil else p55.kind
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1200 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1201, var1202 = protoModule.writeTag(buff, var1200, 1, protoModule.wireTypes.lengthDelimited)
			var1201, var1884 = protoModule.writeString(var1201, var1202, self.kind.value)
			buff = var1201
			var1200 = var1202
		elseif self.kind.type == "token" then
			local var1203, var1204 = protoModule.writeTag(buff, var1200, 2, protoModule.wireTypes.lengthDelimited)
			var1203, var1886 = protoModule.writeString(var1203, var1204, self.kind.value)
			buff = var1203
			var1200 = var1204
		elseif self.kind.type == "conditional" then
			local var1205 = self.kind.value:encode()
			local var1206, var1207 = protoModule.writeTag(buff, var1200, 3, protoModule.wireTypes.lengthDelimited)
			var1206, var1889 = protoModule.writeBuffer(var1206, var1207, var1205, buffer.len(var1205))
			buff = var1206
			var1200 = var1207
		elseif self.kind.type == "binding_path" then
			local var1208, var1209 = protoModule.writeTag(buff, var1200, 4, protoModule.wireTypes.lengthDelimited)
			var1208, var1891 = protoModule.writeString(var1208, var1209, self.kind.value)
			buff = var1208
			var1200 = var1209
		end
	end
	local buff_1 = buffer.create(var1200)
	buffer.copy(buff_1, 0, buff, 0, var1200)
	
	return buff_1
end

function t_55.decode(p55)
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1200 = t_55.new()
	local var1201 = 0
	while var1201 < buffer.len(p55) do
		local _ = nil
		local var1202 = nil
		local var1203, var1204, var1205 = protoModule.readTag(p55, var1201)
		local var1206 = var1203
		var1202 = var1204
		var1201 = var1205
		
		if var1202 == protoModule.wireTypes.varint then
			local _ = nil
			local var1207, var1208 = protoModule.readVarInt(p55, var1201)
			local _ = var1207
			var1201 = var1208
			continue
		end
		if var1202 == protoModule.wireTypes.lengthDelimited then
			if var1206 == 1 then
				local _ = nil
				local var1209, var1210 = protoModule.readBuffer(p55, var1201)
				var1201 = var1210
				var1200.kind = { type = "literal", value = buffer.tostring(var1209) }
			elseif var1206 == 2 then
				local _ = nil
				local var1211, var1212 = protoModule.readBuffer(p55, var1201)
				var1201 = var1212
				var1200.kind = { type = "token", value = buffer.tostring(var1211) }
			elseif var1206 == 3 then
				local _ = nil
				local var1213, var1214 = protoModule.readBuffer(p55, var1201)
				var1201 = var1214
				var1200.kind = {
					type = "conditional",
					value = t.UDim2Prop_ConditionalOptions.decode(var1213)
				}
			elseif var1206 == 4 then
				local _ = nil
				local var1215, var1216 = protoModule.readBuffer(p55, var1201)
				var1201 = var1216
				var1200.kind = { type = "binding_path", value = buffer.tostring(var1215) }
			else
				local _ = nil
				local var1217, var1218 = protoModule.readVarInt(p55, var1201)
				var1201 = var1218 + var1217
			end
		elseif var1202 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1219, var1220 = protoModule.readFixed32(p55, var1201)
			local _ = var1219
			var1201 = var1220
		elseif var1202 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1221, var1222 = protoModule.readFixed64(p55, var1201)
			local _ = var1221
			var1201 = var1222
		else
			error("Unsupported wire type: " .. var1895)
		end
	end
	return var1200
end

function t_55:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_55:jsonDecode()
	-- upvalues: t_55 (ref), t (ref)
	local var1223 = t_55.new()
	
	if self.literal ~= nil then
		var1223.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1223.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1223.kind = {
			type = "conditional",
			value = t.UDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1223.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1223.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1223
end

t_55.descriptor = {
	name = "UDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
}
t.UDim2Prop = t_55
typeRegistryModule.default:register(t.UDim2Prop)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p56)
	-- upvalues: t_56 (ref)
	return setmetatable({
		condition = if p56 == nil or p56.condition == nil then nil else p56.condition,
		kind = if p56 == nil or p56.kind == nil then nil else p56.kind
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1223 = 0
	
	if self.condition ~= nil then
		local var1224 = self.condition:encode()
		local var1225, var1226 = protoModule.writeTag(buff, var1223, 1, protoModule.wireTypes.lengthDelimited)
		var1225, var1922 = protoModule.writeBuffer(var1225, var1226, var1224, buffer.len(var1224))
		buff = var1225
		var1223 = var1226
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1227, var1228 = protoModule.writeTag(buff, var1223, 2, protoModule.wireTypes.lengthDelimited)
			var1227, var1924 = protoModule.writeString(var1227, var1228, self.kind.value)
			buff = var1227
			var1223 = var1228
		elseif self.kind.type == "token" then
			local var1229, var1230 = protoModule.writeTag(buff, var1223, 3, protoModule.wireTypes.lengthDelimited)
			var1229, var1926 = protoModule.writeString(var1229, var1230, self.kind.value)
			buff = var1229
			var1223 = var1230
		elseif self.kind.type == "binding_path" then
			local var1231, var1232 = protoModule.writeTag(buff, var1223, 4, protoModule.wireTypes.lengthDelimited)
			var1231, var1928 = protoModule.writeString(var1231, var1232, self.kind.value)
			buff = var1231
			var1223 = var1232
		end
	end
	local buff_1 = buffer.create(var1223)
	buffer.copy(buff_1, 0, buff, 0, var1223)
	
	return buff_1
end

function t_56.decode(p56)
	-- upvalues: t_56 (ref), protoModule (ref), propConditionModule (ref)
	local var1223 = t_56.new()
	local var1224 = 0
	while var1224 < buffer.len(p56) do
		local _ = nil
		local var1225 = nil
		local var1226, var1227, var1228 = protoModule.readTag(p56, var1224)
		local var1229 = var1226
		var1225 = var1227
		var1224 = var1228
		
		if var1225 == protoModule.wireTypes.varint then
			local _ = nil
			local var1230, var1231 = protoModule.readVarInt(p56, var1224)
			local _ = var1230
			var1224 = var1231
			continue
		end
		if var1225 == protoModule.wireTypes.lengthDelimited then
			if var1229 == 1 then
				local _ = nil
				local var1232, var1233 = protoModule.readBuffer(p56, var1224)
				var1224 = var1233
				var1223.condition = propConditionModule.PropCondition.decode(var1232)
			elseif var1229 == 2 then
				local _ = nil
				local var1234, var1235 = protoModule.readBuffer(p56, var1224)
				var1224 = var1235
				var1223.kind = { type = "literal", value = buffer.tostring(var1234) }
			elseif var1229 == 3 then
				local _ = nil
				local var1236, var1237 = protoModule.readBuffer(p56, var1224)
				var1224 = var1237
				var1223.kind = { type = "token", value = buffer.tostring(var1236) }
			elseif var1229 == 4 then
				local _ = nil
				local var1238, var1239 = protoModule.readBuffer(p56, var1224)
				var1224 = var1239
				var1223.kind = { type = "binding_path", value = buffer.tostring(var1238) }
			else
				local _ = nil
				local var1240, var1241 = protoModule.readVarInt(p56, var1224)
				var1224 = var1241 + var1240
			end
		elseif var1225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1242, var1243 = protoModule.readFixed32(p56, var1224)
			local _ = var1242
			var1224 = var1243
		elseif var1225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1244, var1245 = protoModule.readFixed64(p56, var1224)
			local _ = var1244
			var1224 = var1245
		else
			error("Unsupported wire type: " .. var1932)
		end
	end
	return var1223
end

function t_56:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_56:jsonDecode()
	-- upvalues: t_56 (ref), propConditionModule (ref)
	local var1246 = t_56.new()
	
	if self.condition ~= nil then
		var1246.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1246.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1246.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1246.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1246.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1246
end

t_56.descriptor = {
	name = "UDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDim2Prop_ConditionalOption = t_56
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOption)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p57)
	-- upvalues: t_57 (ref)
	return setmetatable({
		options = if p57 == nil or p57.options == nil then {} else p57.options
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1246 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1247 = v:encode()
			local var1248, var1249 = protoModule.writeTag(buff, var1246, 1, protoModule.wireTypes.lengthDelimited)
			var1248, var1959 = protoModule.writeBuffer(var1248, var1249, var1247, buffer.len(var1247))
			buff = var1248
			var1246 = var1249
		end
	end
	local buff_1 = buffer.create(var1246)
	buffer.copy(buff_1, 0, buff, 0, var1246)
	
	return buff_1
end

function t_57.decode(p57)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1250 = t_57.new()
	local var1251 = 0
	while var1251 < buffer.len(p57) do
		local _ = nil
		local var1252 = nil
		local var1253, var1254, var1255 = protoModule.readTag(p57, var1251)
		local var1256 = var1253
		var1252 = var1254
		var1251 = var1255
		
		if var1252 == protoModule.wireTypes.varint then
			local _ = nil
			local var1257, var1258 = protoModule.readVarInt(p57, var1251)
			local _ = var1257
			var1251 = var1258
			continue
		end
		if var1252 == protoModule.wireTypes.lengthDelimited then
			if var1256 == 1 then
				local _ = nil
				local var1259, var1260 = protoModule.readBuffer(p57, var1251)
				var1251 = var1260
				table.insert(var1250.options, t.UDim2Prop_ConditionalOption.decode(var1259))
			else
				local _ = nil
				local var1261, var1262 = protoModule.readVarInt(p57, var1251)
				var1251 = var1262 + var1261
			end
		elseif var1252 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1263, var1264 = protoModule.readFixed32(p57, var1251)
			local _ = var1263
			var1251 = var1264
		elseif var1252 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1265, var1266 = protoModule.readFixed64(p57, var1251)
			local _ = var1265
			var1251 = var1266
		else
			error("Unsupported wire type: " .. var1963)
		end
	end
	return var1250
end

function t_57:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_57:jsonDecode()
	-- upvalues: t_57 (ref), t (ref)
	local var1267 = t_57.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var1267.options = t_1
	end
	return var1267
end

t_57.descriptor = {
	name = "UDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDim2Prop_ConditionalOptions = t_57
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOptions)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p58)
	-- upvalues: t_58 (ref)
	return setmetatable({
		kind = if p58 == nil or p58.kind == nil then nil else p58.kind
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1268 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1269, var1270 = protoModule.writeTag(buff, var1268, 1, protoModule.wireTypes.lengthDelimited)
			var1269, var1985 = protoModule.writeString(var1269, var1270, self.kind.value)
			buff = var1269
			var1268 = var1270
		elseif self.kind.type == "token" then
			local var1271, var1272 = protoModule.writeTag(buff, var1268, 2, protoModule.wireTypes.lengthDelimited)
			var1271, var1987 = protoModule.writeString(var1271, var1272, self.kind.value)
			buff = var1271
			var1268 = var1272
		elseif self.kind.type == "conditional" then
			local var1273 = self.kind.value:encode()
			local var1274, var1275 = protoModule.writeTag(buff, var1268, 3, protoModule.wireTypes.lengthDelimited)
			var1274, var1990 = protoModule.writeBuffer(var1274, var1275, var1273, buffer.len(var1273))
			buff = var1274
			var1268 = var1275
		elseif self.kind.type == "binding_path" then
			local var1276, var1277 = protoModule.writeTag(buff, var1268, 4, protoModule.wireTypes.lengthDelimited)
			var1276, var1992 = protoModule.writeString(var1276, var1277, self.kind.value)
			buff = var1276
			var1268 = var1277
		end
	end
	local buff_1 = buffer.create(var1268)
	buffer.copy(buff_1, 0, buff, 0, var1268)
	
	return buff_1
end

function t_58.decode(p58)
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1268 = t_58.new()
	local var1269 = 0
	while var1269 < buffer.len(p58) do
		local _ = nil
		local var1270 = nil
		local var1271, var1272, var1273 = protoModule.readTag(p58, var1269)
		local var1274 = var1271
		var1270 = var1272
		var1269 = var1273
		
		if var1270 == protoModule.wireTypes.varint then
			local _ = nil
			local var1275, var1276 = protoModule.readVarInt(p58, var1269)
			local _ = var1275
			var1269 = var1276
			continue
		end
		if var1270 == protoModule.wireTypes.lengthDelimited then
			if var1274 == 1 then
				local _ = nil
				local var1277, var1278 = protoModule.readBuffer(p58, var1269)
				var1269 = var1278
				var1268.kind = { type = "literal", value = buffer.tostring(var1277) }
			elseif var1274 == 2 then
				local _ = nil
				local var1279, var1280 = protoModule.readBuffer(p58, var1269)
				var1269 = var1280
				var1268.kind = { type = "token", value = buffer.tostring(var1279) }
			elseif var1274 == 3 then
				local _ = nil
				local var1281, var1282 = protoModule.readBuffer(p58, var1269)
				var1269 = var1282
				var1268.kind = {
					type = "conditional",
					value = t.Vector2Prop_ConditionalOptions.decode(var1281)
				}
			elseif var1274 == 4 then
				local _ = nil
				local var1283, var1284 = protoModule.readBuffer(p58, var1269)
				var1269 = var1284
				var1268.kind = { type = "binding_path", value = buffer.tostring(var1283) }
			else
				local _ = nil
				local var1285, var1286 = protoModule.readVarInt(p58, var1269)
				var1269 = var1286 + var1285
			end
		elseif var1270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1287, var1288 = protoModule.readFixed32(p58, var1269)
			local _ = var1287
			var1269 = var1288
		elseif var1270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1289, var1290 = protoModule.readFixed64(p58, var1269)
			local _ = var1289
			var1269 = var1290
		else
			error("Unsupported wire type: " .. var1996)
		end
	end
	return var1268
end

function t_58:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_58:jsonDecode()
	-- upvalues: t_58 (ref), t (ref)
	local var1291 = t_58.new()
	
	if self.literal ~= nil then
		var1291.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1291.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1291.kind = {
			type = "conditional",
			value = t.Vector2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1291.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1291.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1291
end

t_58.descriptor = {
	name = "Vector2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
}
t.Vector2Prop = t_58
typeRegistryModule.default:register(t.Vector2Prop)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p59)
	-- upvalues: t_59 (ref)
	return setmetatable({
		condition = if p59 == nil or p59.condition == nil then nil else p59.condition,
		kind = if p59 == nil or p59.kind == nil then nil else p59.kind
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1291 = 0
	
	if self.condition ~= nil then
		local var1292 = self.condition:encode()
		local var1293, var1294 = protoModule.writeTag(buff, var1291, 1, protoModule.wireTypes.lengthDelimited)
		var1293, var2023 = protoModule.writeBuffer(var1293, var1294, var1292, buffer.len(var1292))
		buff = var1293
		var1291 = var1294
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1295, var1296 = protoModule.writeTag(buff, var1291, 2, protoModule.wireTypes.lengthDelimited)
			var1295, var2025 = protoModule.writeString(var1295, var1296, self.kind.value)
			buff = var1295
			var1291 = var1296
		elseif self.kind.type == "token" then
			local var1297, var1298 = protoModule.writeTag(buff, var1291, 3, protoModule.wireTypes.lengthDelimited)
			var1297, var2027 = protoModule.writeString(var1297, var1298, self.kind.value)
			buff = var1297
			var1291 = var1298
		elseif self.kind.type == "binding_path" then
			local var1299, var1300 = protoModule.writeTag(buff, var1291, 4, protoModule.wireTypes.lengthDelimited)
			var1299, var2029 = protoModule.writeString(var1299, var1300, self.kind.value)
			buff = var1299
			var1291 = var1300
		end
	end
	local buff_1 = buffer.create(var1291)
	buffer.copy(buff_1, 0, buff, 0, var1291)
	
	return buff_1
end

function t_59.decode(p59)
	-- upvalues: t_59 (ref), protoModule (ref), propConditionModule (ref)
	local var1291 = t_59.new()
	local var1292 = 0
	while var1292 < buffer.len(p59) do
		local _ = nil
		local var1293 = nil
		local var1294, var1295, var1296 = protoModule.readTag(p59, var1292)
		local var1297 = var1294
		var1293 = var1295
		var1292 = var1296
		
		if var1293 == protoModule.wireTypes.varint then
			local _ = nil
			local var1298, var1299 = protoModule.readVarInt(p59, var1292)
			local _ = var1298
			var1292 = var1299
			continue
		end
		if var1293 == protoModule.wireTypes.lengthDelimited then
			if var1297 == 1 then
				local _ = nil
				local var1300, var1301 = protoModule.readBuffer(p59, var1292)
				var1292 = var1301
				var1291.condition = propConditionModule.PropCondition.decode(var1300)
			elseif var1297 == 2 then
				local _ = nil
				local var1302, var1303 = protoModule.readBuffer(p59, var1292)
				var1292 = var1303
				var1291.kind = { type = "literal", value = buffer.tostring(var1302) }
			elseif var1297 == 3 then
				local _ = nil
				local var1304, var1305 = protoModule.readBuffer(p59, var1292)
				var1292 = var1305
				var1291.kind = { type = "token", value = buffer.tostring(var1304) }
			elseif var1297 == 4 then
				local _ = nil
				local var1306, var1307 = protoModule.readBuffer(p59, var1292)
				var1292 = var1307
				var1291.kind = { type = "binding_path", value = buffer.tostring(var1306) }
			else
				local _ = nil
				local var1308, var1309 = protoModule.readVarInt(p59, var1292)
				var1292 = var1309 + var1308
			end
		elseif var1293 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1310, var1311 = protoModule.readFixed32(p59, var1292)
			local _ = var1310
			var1292 = var1311
		elseif var1293 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1312, var1313 = protoModule.readFixed64(p59, var1292)
			local _ = var1312
			var1292 = var1313
		else
			error("Unsupported wire type: " .. var2033)
		end
	end
	return var1291
end

function t_59:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_59:jsonDecode()
	-- upvalues: t_59 (ref), propConditionModule (ref)
	local var1314 = t_59.new()
	
	if self.condition ~= nil then
		var1314.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1314.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1314.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1314.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1314.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1314
end

t_59.descriptor = {
	name = "Vector2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Vector2Prop_ConditionalOption = t_59
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOption)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p60)
	-- upvalues: t_60 (ref)
	return setmetatable({
		options = if p60 == nil or p60.options == nil then {} else p60.options
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1314 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1315 = v:encode()
			local var1316, var1317 = protoModule.writeTag(buff, var1314, 1, protoModule.wireTypes.lengthDelimited)
			var1316, var2060 = protoModule.writeBuffer(var1316, var1317, var1315, buffer.len(var1315))
			buff = var1316
			var1314 = var1317
		end
	end
	local buff_1 = buffer.create(var1314)
	buffer.copy(buff_1, 0, buff, 0, var1314)
	
	return buff_1
end

function t_60.decode(p60)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var1318 = t_60.new()
	local var1319 = 0
	while var1319 < buffer.len(p60) do
		local _ = nil
		local var1320 = nil
		local var1321, var1322, var1323 = protoModule.readTag(p60, var1319)
		local var1324 = var1321
		var1320 = var1322
		var1319 = var1323
		
		if var1320 == protoModule.wireTypes.varint then
			local _ = nil
			local var1325, var1326 = protoModule.readVarInt(p60, var1319)
			local _ = var1325
			var1319 = var1326
			continue
		end
		if var1320 == protoModule.wireTypes.lengthDelimited then
			if var1324 == 1 then
				local _ = nil
				local var1327, var1328 = protoModule.readBuffer(p60, var1319)
				var1319 = var1328
				table.insert(var1318.options, t.Vector2Prop_ConditionalOption.decode(var1327))
			else
				local _ = nil
				local var1329, var1330 = protoModule.readVarInt(p60, var1319)
				var1319 = var1330 + var1329
			end
		elseif var1320 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1331, var1332 = protoModule.readFixed32(p60, var1319)
			local _ = var1331
			var1319 = var1332
		elseif var1320 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1333, var1334 = protoModule.readFixed64(p60, var1319)
			local _ = var1333
			var1319 = var1334
		else
			error("Unsupported wire type: " .. var2064)
		end
	end
	return var1318
end

function t_60:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_60:jsonDecode()
	-- upvalues: t_60 (ref), t (ref)
	local var1335 = t_60.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Vector2Prop_ConditionalOption.jsonDecode(v))
		end
		var1335.options = t_1
	end
	return var1335
end

t_60.descriptor = {
	name = "Vector2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Vector2Prop_ConditionalOptions = t_60
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOptions)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p61)
	-- upvalues: t_61 (ref)
	return setmetatable({
		kind = if p61 == nil or p61.kind == nil then nil else p61.kind
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1336 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1337, var1338 = protoModule.writeTag(buff, var1336, 1, protoModule.wireTypes.lengthDelimited)
			var1337, var2086 = protoModule.writeString(var1337, var1338, self.kind.value)
			buff = var1337
			var1336 = var1338
		elseif self.kind.type == "binding_path" then
			local var1339, var1340 = protoModule.writeTag(buff, var1336, 2, protoModule.wireTypes.lengthDelimited)
			var1339, var2088 = protoModule.writeString(var1339, var1340, self.kind.value)
			buff = var1339
			var1336 = var1340
		elseif self.kind.type == "conditional" then
			local var1341 = self.kind.value:encode()
			local var1342, var1343 = protoModule.writeTag(buff, var1336, 3, protoModule.wireTypes.lengthDelimited)
			var1342, var2091 = protoModule.writeBuffer(var1342, var1343, var1341, buffer.len(var1341))
			buff = var1342
			var1336 = var1343
		end
	end
	local buff_1 = buffer.create(var1336)
	buffer.copy(buff_1, 0, buff, 0, var1336)
	
	return buff_1
end

function t_61.decode(p61)
	-- upvalues: t_61 (ref), protoModule (ref), t (ref)
	local var1336 = t_61.new()
	local var1337 = 0
	while var1337 < buffer.len(p61) do
		local _ = nil
		local var1338 = nil
		local var1339, var1340, var1341 = protoModule.readTag(p61, var1337)
		local var1342 = var1339
		var1338 = var1340
		var1337 = var1341
		
		if var1338 == protoModule.wireTypes.varint then
			local _ = nil
			local var1343, var1344 = protoModule.readVarInt(p61, var1337)
			local _ = var1343
			var1337 = var1344
			continue
		end
		if var1338 == protoModule.wireTypes.lengthDelimited then
			if var1342 == 1 then
				local _ = nil
				local var1345, var1346 = protoModule.readBuffer(p61, var1337)
				var1337 = var1346
				var1336.kind = { type = "literal", value = buffer.tostring(var1345) }
			elseif var1342 == 2 then
				local _ = nil
				local var1347, var1348 = protoModule.readBuffer(p61, var1337)
				var1337 = var1348
				var1336.kind = { type = "binding_path", value = buffer.tostring(var1347) }
			elseif var1342 == 3 then
				local _ = nil
				local var1349, var1350 = protoModule.readBuffer(p61, var1337)
				var1337 = var1350
				var1336.kind = {
					type = "conditional",
					value = t.IconProp_ConditionalOptions.decode(var1349)
				}
			else
				local _ = nil
				local var1351, var1352 = protoModule.readVarInt(p61, var1337)
				var1337 = var1352 + var1351
			end
		elseif var1338 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1353, var1354 = protoModule.readFixed32(p61, var1337)
			local _ = var1353
			var1337 = var1354
		elseif var1338 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1355, var1356 = protoModule.readFixed64(p61, var1337)
			local _ = var1355
			var1337 = var1356
		else
			error("Unsupported wire type: " .. var2095)
		end
	end
	return var1336
end

function t_61:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_61:jsonDecode()
	-- upvalues: t_61 (ref), t (ref)
	local var1357 = t_61.new()
	
	if self.literal ~= nil then
		var1357.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1357.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1357.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var1357.kind = {
			type = "conditional",
			value = t.IconProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1357
end

t_61.descriptor = {
	name = "IconProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
}
t.IconProp = t_61
typeRegistryModule.default:register(t.IconProp)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p62)
	-- upvalues: t_62 (ref)
	return setmetatable({
		condition = if p62 == nil or p62.condition == nil then nil else p62.condition,
		kind = if p62 == nil or p62.kind == nil then nil else p62.kind
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1357 = 0
	
	if self.condition ~= nil then
		local var1358 = self.condition:encode()
		local var1359, var1360 = protoModule.writeTag(buff, var1357, 1, protoModule.wireTypes.lengthDelimited)
		var1359, var2120 = protoModule.writeBuffer(var1359, var1360, var1358, buffer.len(var1358))
		buff = var1359
		var1357 = var1360
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1361, var1362 = protoModule.writeTag(buff, var1357, 2, protoModule.wireTypes.lengthDelimited)
			var1361, var2122 = protoModule.writeString(var1361, var1362, self.kind.value)
			buff = var1361
			var1357 = var1362
		elseif self.kind.type == "binding_path" then
			local var1363, var1364 = protoModule.writeTag(buff, var1357, 3, protoModule.wireTypes.lengthDelimited)
			var1363, var2124 = protoModule.writeString(var1363, var1364, self.kind.value)
			buff = var1363
			var1357 = var1364
		end
	end
	local buff_1 = buffer.create(var1357)
	buffer.copy(buff_1, 0, buff, 0, var1357)
	
	return buff_1
end

function t_62.decode(p62)
	-- upvalues: t_62 (ref), protoModule (ref), propConditionModule (ref)
	local var1357 = t_62.new()
	local var1358 = 0
	while var1358 < buffer.len(p62) do
		local _ = nil
		local var1359 = nil
		local var1360, var1361, var1362 = protoModule.readTag(p62, var1358)
		local var1363 = var1360
		var1359 = var1361
		var1358 = var1362
		
		if var1359 == protoModule.wireTypes.varint then
			local _ = nil
			local var1364, var1365 = protoModule.readVarInt(p62, var1358)
			local _ = var1364
			var1358 = var1365
			continue
		end
		if var1359 == protoModule.wireTypes.lengthDelimited then
			if var1363 == 1 then
				local _ = nil
				local var1366, var1367 = protoModule.readBuffer(p62, var1358)
				var1358 = var1367
				var1357.condition = propConditionModule.PropCondition.decode(var1366)
			elseif var1363 == 2 then
				local _ = nil
				local var1368, var1369 = protoModule.readBuffer(p62, var1358)
				var1358 = var1369
				var1357.kind = { type = "literal", value = buffer.tostring(var1368) }
			elseif var1363 == 3 then
				local _ = nil
				local var1370, var1371 = protoModule.readBuffer(p62, var1358)
				var1358 = var1371
				var1357.kind = { type = "binding_path", value = buffer.tostring(var1370) }
			else
				local _ = nil
				local var1372, var1373 = protoModule.readVarInt(p62, var1358)
				var1358 = var1373 + var1372
			end
		elseif var1359 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1374, var1375 = protoModule.readFixed32(p62, var1358)
			local _ = var1374
			var1358 = var1375
		elseif var1359 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1376, var1377 = protoModule.readFixed64(p62, var1358)
			local _ = var1376
			var1358 = var1377
		else
			error("Unsupported wire type: " .. var2128)
		end
	end
	return var1357
end

function t_62:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_62:jsonDecode()
	-- upvalues: t_62 (ref), propConditionModule (ref)
	local var1378 = t_62.new()
	
	if self.condition ~= nil then
		var1378.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1378.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1378.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1378.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1378
end

t_62.descriptor = {
	name = "IconProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.IconProp_ConditionalOption = t_62
typeRegistryModule.default:register(t.IconProp_ConditionalOption)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p63)
	-- upvalues: t_63 (ref)
	return setmetatable({
		options = if p63 == nil or p63.options == nil then {} else p63.options
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1378 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1379 = v:encode()
			local var1380, var1381 = protoModule.writeTag(buff, var1378, 1, protoModule.wireTypes.lengthDelimited)
			var1380, var2153 = protoModule.writeBuffer(var1380, var1381, var1379, buffer.len(var1379))
			buff = var1380
			var1378 = var1381
		end
	end
	local buff_1 = buffer.create(var1378)
	buffer.copy(buff_1, 0, buff, 0, var1378)
	
	return buff_1
end

function t_63.decode(p63)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var1382 = t_63.new()
	local var1383 = 0
	while var1383 < buffer.len(p63) do
		local _ = nil
		local var1384 = nil
		local var1385, var1386, var1387 = protoModule.readTag(p63, var1383)
		local var1388 = var1385
		var1384 = var1386
		var1383 = var1387
		
		if var1384 == protoModule.wireTypes.varint then
			local _ = nil
			local var1389, var1390 = protoModule.readVarInt(p63, var1383)
			local _ = var1389
			var1383 = var1390
			continue
		end
		if var1384 == protoModule.wireTypes.lengthDelimited then
			if var1388 == 1 then
				local _ = nil
				local var1391, var1392 = protoModule.readBuffer(p63, var1383)
				var1383 = var1392
				table.insert(var1382.options, t.IconProp_ConditionalOption.decode(var1391))
			else
				local _ = nil
				local var1393, var1394 = protoModule.readVarInt(p63, var1383)
				var1383 = var1394 + var1393
			end
		elseif var1384 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1395, var1396 = protoModule.readFixed32(p63, var1383)
			local _ = var1395
			var1383 = var1396
		elseif var1384 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1397, var1398 = protoModule.readFixed64(p63, var1383)
			local _ = var1397
			var1383 = var1398
		else
			error("Unsupported wire type: " .. var2157)
		end
	end
	return var1382
end

function t_63:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_63:jsonDecode()
	-- upvalues: t_63 (ref), t (ref)
	local var1399 = t_63.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.IconProp_ConditionalOption.jsonDecode(v))
		end
		var1399.options = t_1
	end
	return var1399
end

t_63.descriptor = {
	name = "IconProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.IconProp_ConditionalOptions = t_63
typeRegistryModule.default:register(t.IconProp_ConditionalOptions)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p64)
	-- upvalues: t_64 (ref)
	return setmetatable({
		kind = if p64 == nil or p64.kind == nil then nil else p64.kind
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1400 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1401 = self.kind.value:encode()
			local var1402, var1403 = protoModule.writeTag(buff, var1400, 1, protoModule.wireTypes.lengthDelimited)
			var1402, var2180 = protoModule.writeBuffer(var1402, var1403, var1401, buffer.len(var1401))
			buff = var1402
			var1400 = var1403
		elseif self.kind.type == "binding_path" then
			local var1404, var1405 = protoModule.writeTag(buff, var1400, 2, protoModule.wireTypes.lengthDelimited)
			var1404, var2182 = protoModule.writeString(var1404, var1405, self.kind.value)
			buff = var1404
			var1400 = var1405
		elseif self.kind.type == "conditional" then
			local var1406 = self.kind.value:encode()
			local var1407, var1408 = protoModule.writeTag(buff, var1400, 3, protoModule.wireTypes.lengthDelimited)
			var1407, var2185 = protoModule.writeBuffer(var1407, var1408, var1406, buffer.len(var1406))
			buff = var1407
			var1400 = var1408
		end
	end
	local buff_1 = buffer.create(var1400)
	buffer.copy(buff_1, 0, buff, 0, var1400)
	
	return buff_1
end

function t_64.decode(p64)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var1400 = t_64.new()
	local var1401 = 0
	while var1401 < buffer.len(p64) do
		local _ = nil
		local var1402 = nil
		local var1403, var1404, var1405 = protoModule.readTag(p64, var1401)
		local var1406 = var1403
		var1402 = var1404
		var1401 = var1405
		
		if var1402 == protoModule.wireTypes.varint then
			local _ = nil
			local var1407, var1408 = protoModule.readVarInt(p64, var1401)
			local _ = var1407
			var1401 = var1408
			continue
		end
		if var1402 == protoModule.wireTypes.lengthDelimited then
			if var1406 == 1 then
				local _ = nil
				local var1409, var1410 = protoModule.readBuffer(p64, var1401)
				var1401 = var1410
				var1400.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var1409)
				}
			elseif var1406 == 2 then
				local _ = nil
				local var1411, var1412 = protoModule.readBuffer(p64, var1401)
				var1401 = var1412
				var1400.kind = { type = "binding_path", value = buffer.tostring(var1411) }
			elseif var1406 == 3 then
				local _ = nil
				local var1413, var1414 = protoModule.readBuffer(p64, var1401)
				var1401 = var1414
				var1400.kind = {
					type = "conditional",
					value = t.FoundationIconConfigProp_ConditionalOptions.decode(var1413)
				}
			else
				local _ = nil
				local var1415, var1416 = protoModule.readVarInt(p64, var1401)
				var1401 = var1416 + var1415
			end
		elseif var1402 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1417, var1418 = protoModule.readFixed32(p64, var1401)
			local _ = var1417
			var1401 = var1418
		elseif var1402 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1419, var1420 = protoModule.readFixed64(p64, var1401)
			local _ = var1419
			var1401 = var1420
		else
			error("Unsupported wire type: " .. var2189)
		end
	end
	return var1400
end

function t_64:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_64:jsonDecode()
	-- upvalues: t_64 (ref), t (ref)
	local var1421 = t_64.new()
	
	if self.literal ~= nil then
		var1421.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1421.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1421.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var1421.kind = {
			type = "conditional",
			value = t.FoundationIconConfigProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1421
end

t_64.descriptor = {
	name = "FoundationIconConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfigProp"
}
t.FoundationIconConfigProp = t_64
typeRegistryModule.default:register(t.FoundationIconConfigProp)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p65)
	-- upvalues: t_65 (ref)
	return setmetatable({
		condition = if p65 == nil or p65.condition == nil then nil else p65.condition,
		kind = if p65 == nil or p65.kind == nil then nil else p65.kind
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1421 = 0
	
	if self.condition ~= nil then
		local var1422 = self.condition:encode()
		local var1423, var1424 = protoModule.writeTag(buff, var1421, 1, protoModule.wireTypes.lengthDelimited)
		var1423, var2214 = protoModule.writeBuffer(var1423, var1424, var1422, buffer.len(var1422))
		buff = var1423
		var1421 = var1424
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1425 = self.kind.value:encode()
			local var1426, var1427 = protoModule.writeTag(buff, var1421, 2, protoModule.wireTypes.lengthDelimited)
			var1426, var2217 = protoModule.writeBuffer(var1426, var1427, var1425, buffer.len(var1425))
			buff = var1426
			var1421 = var1427
		elseif self.kind.type == "binding_path" then
			local var1428, var1429 = protoModule.writeTag(buff, var1421, 3, protoModule.wireTypes.lengthDelimited)
			var1428, var2219 = protoModule.writeString(var1428, var1429, self.kind.value)
			buff = var1428
			var1421 = var1429
		end
	end
	local buff_1 = buffer.create(var1421)
	buffer.copy(buff_1, 0, buff, 0, var1421)
	
	return buff_1
end

function t_65.decode(p65)
	-- upvalues: t_65 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1421 = t_65.new()
	local var1422 = 0
	while var1422 < buffer.len(p65) do
		local _ = nil
		local var1423 = nil
		local var1424, var1425, var1426 = protoModule.readTag(p65, var1422)
		local var1427 = var1424
		var1423 = var1425
		var1422 = var1426
		
		if var1423 == protoModule.wireTypes.varint then
			local _ = nil
			local var1428, var1429 = protoModule.readVarInt(p65, var1422)
			local _ = var1428
			var1422 = var1429
			continue
		end
		if var1423 == protoModule.wireTypes.lengthDelimited then
			if var1427 == 1 then
				local _ = nil
				local var1430, var1431 = protoModule.readBuffer(p65, var1422)
				var1422 = var1431
				var1421.condition = propConditionModule.PropCondition.decode(var1430)
			elseif var1427 == 2 then
				local _ = nil
				local var1432, var1433 = protoModule.readBuffer(p65, var1422)
				var1422 = var1433
				var1421.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var1432)
				}
			elseif var1427 == 3 then
				local _ = nil
				local var1434, var1435 = protoModule.readBuffer(p65, var1422)
				var1422 = var1435
				var1421.kind = { type = "binding_path", value = buffer.tostring(var1434) }
			else
				local _ = nil
				local var1436, var1437 = protoModule.readVarInt(p65, var1422)
				var1422 = var1437 + var1436
			end
		elseif var1423 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1438, var1439 = protoModule.readFixed32(p65, var1422)
			local _ = var1438
			var1422 = var1439
		elseif var1423 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1440, var1441 = protoModule.readFixed64(p65, var1422)
			local _ = var1440
			var1422 = var1441
		else
			error("Unsupported wire type: " .. var2223)
		end
	end
	return var1421
end

function t_65:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_65:jsonDecode()
	-- upvalues: t_65 (ref), propConditionModule (ref), t (ref)
	local var1442 = t_65.new()
	
	if self.condition ~= nil then
		var1442.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1442.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1442.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1442.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1442
end

t_65.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FoundationIconConfigProp_ConditionalOption = t_65
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOption)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p66)
	-- upvalues: t_66 (ref)
	return setmetatable({
		options = if p66 == nil or p66.options == nil then {} else p66.options
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1442 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1443 = v:encode()
			local var1444, var1445 = protoModule.writeTag(buff, var1442, 1, protoModule.wireTypes.lengthDelimited)
			var1444, var2248 = protoModule.writeBuffer(var1444, var1445, var1443, buffer.len(var1443))
			buff = var1444
			var1442 = var1445
		end
	end
	local buff_1 = buffer.create(var1442)
	buffer.copy(buff_1, 0, buff, 0, var1442)
	
	return buff_1
end

function t_66.decode(p66)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var1446 = t_66.new()
	local var1447 = 0
	while var1447 < buffer.len(p66) do
		local _ = nil
		local var1448 = nil
		local var1449, var1450, var1451 = protoModule.readTag(p66, var1447)
		local var1452 = var1449
		var1448 = var1450
		var1447 = var1451
		
		if var1448 == protoModule.wireTypes.varint then
			local _ = nil
			local var1453, var1454 = protoModule.readVarInt(p66, var1447)
			local _ = var1453
			var1447 = var1454
			continue
		end
		if var1448 == protoModule.wireTypes.lengthDelimited then
			if var1452 == 1 then
				local _ = nil
				local var1455, var1456 = protoModule.readBuffer(p66, var1447)
				var1447 = var1456
				table.insert(var1446.options, t.FoundationIconConfigProp_ConditionalOption.decode(var1455))
			else
				local _ = nil
				local var1457, var1458 = protoModule.readVarInt(p66, var1447)
				var1447 = var1458 + var1457
			end
		elseif var1448 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1459, var1460 = protoModule.readFixed32(p66, var1447)
			local _ = var1459
			var1447 = var1460
		elseif var1448 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1461, var1462 = protoModule.readFixed64(p66, var1447)
			local _ = var1461
			var1447 = var1462
		else
			error("Unsupported wire type: " .. var2252)
		end
	end
	return var1446
end

function t_66:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_66:jsonDecode()
	-- upvalues: t_66 (ref), t (ref)
	local var1463 = t_66.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FoundationIconConfigProp_ConditionalOption.jsonDecode(v))
		end
		var1463.options = t_1
	end
	return var1463
end

t_66.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FoundationIconConfigProp_ConditionalOptions = t_66
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOptions)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p67)
	-- upvalues: t_67 (ref)
	return setmetatable({
		name = if p67 == nil or p67.name == nil then nil else p67.name,
		variant = if p67 == nil or p67.variant == nil then nil else p67.variant
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1464 = 0
	
	if self.name ~= nil then
		local var1465 = self.name:encode()
		local var1466, var1467 = protoModule.writeTag(buff, var1464, 1, protoModule.wireTypes.lengthDelimited)
		var1466, var2275 = protoModule.writeBuffer(var1466, var1467, var1465, buffer.len(var1465))
		buff = var1466
		var1464 = var1467
	end
	if self.variant ~= nil then
		local var1468 = self.variant:encode()
		local var1469, var1470 = protoModule.writeTag(buff, var1464, 2, protoModule.wireTypes.lengthDelimited)
		var1469, var2278 = protoModule.writeBuffer(var1469, var1470, var1468, buffer.len(var1468))
		buff = var1469
		var1464 = var1470
	end
	local buff_1 = buffer.create(var1464)
	buffer.copy(buff_1, 0, buff, 0, var1464)
	
	return buff_1
end

function t_67.decode(p67)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var1464 = t_67.new()
	local var1465 = 0
	while var1465 < buffer.len(p67) do
		local _ = nil
		local var1466 = nil
		local var1467, var1468, var1469 = protoModule.readTag(p67, var1465)
		local var1470 = var1467
		var1466 = var1468
		var1465 = var1469
		
		if var1466 == protoModule.wireTypes.varint then
			local _ = nil
			local var1471, var1472 = protoModule.readVarInt(p67, var1465)
			local _ = var1471
			var1465 = var1472
			continue
		end
		if var1466 == protoModule.wireTypes.lengthDelimited then
			if var1470 == 1 then
				local _ = nil
				local var1473, var1474 = protoModule.readBuffer(p67, var1465)
				var1465 = var1474
				var1464.name = t.StringProp.decode(var1473)
			elseif var1470 == 2 then
				local _ = nil
				local var1475, var1476 = protoModule.readBuffer(p67, var1465)
				var1465 = var1476
				var1464.variant = t.StringProp.decode(var1475)
			else
				local _ = nil
				local var1477, var1478 = protoModule.readVarInt(p67, var1465)
				var1465 = var1478 + var1477
			end
		elseif var1466 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1479, var1480 = protoModule.readFixed32(p67, var1465)
			local _ = var1479
			var1465 = var1480
		elseif var1466 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1481, var1482 = protoModule.readFixed64(p67, var1465)
			local _ = var1481
			var1465 = var1482
		else
			error("Unsupported wire type: " .. var2282)
		end
	end
	return var1464
end

function t_67:jsonEncode()
	local t = {}
	
	if self.name ~= nil then
		t.name = self.name:jsonEncode()
	end
	if self.variant ~= nil then
		t.variant = self.variant:jsonEncode()
	end
	return t
end

function t_67:jsonDecode()
	-- upvalues: t_67 (ref), t (ref)
	local var1483 = t_67.new()
	
	if self.name ~= nil then
		var1483.name = t.StringProp.jsonDecode(self.name)
	end
	if self.variant ~= nil then
		var1483.variant = t.StringProp.jsonDecode(self.variant)
	end
	return var1483
end

t_67.descriptor = {
	name = "FoundationIconConfigProp_FoundationIconConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfig"
}
t.FoundationIconConfigProp_FoundationIconConfig = t_67
typeRegistryModule.default:register(t.FoundationIconConfigProp_FoundationIconConfig)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p68)
	-- upvalues: t_68 (ref)
	return setmetatable({
		oneof_prop = if p68 == nil or p68.oneof_prop == nil then nil else p68.oneof_prop
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1483 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local var1484 = self.oneof_prop.value:encode()
			local var1485, var1486 = protoModule.writeTag(buff, var1483, 1, protoModule.wireTypes.lengthDelimited)
			var1485, var2305 = protoModule.writeBuffer(var1485, var1486, var1484, buffer.len(var1484))
			buff = var1485
			var1483 = var1486
		elseif self.oneof_prop.type == "int32_prop" then
			local var1487 = self.oneof_prop.value:encode()
			local var1488, var1489 = protoModule.writeTag(buff, var1483, 2, protoModule.wireTypes.lengthDelimited)
			var1488, var2308 = protoModule.writeBuffer(var1488, var1489, var1487, buffer.len(var1487))
			buff = var1488
			var1483 = var1489
		end
	end
	local buff_1 = buffer.create(var1483)
	buffer.copy(buff_1, 0, buff, 0, var1483)
	
	return buff_1
end

function t_68.decode(p68)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var1483 = t_68.new()
	local var1484 = 0
	while var1484 < buffer.len(p68) do
		local _ = nil
		local var1485 = nil
		local var1486, var1487, var1488 = protoModule.readTag(p68, var1484)
		local var1489 = var1486
		var1485 = var1487
		var1484 = var1488
		
		if var1485 == protoModule.wireTypes.varint then
			local _ = nil
			local var1490, var1491 = protoModule.readVarInt(p68, var1484)
			local _ = var1490
			var1484 = var1491
			continue
		end
		if var1485 == protoModule.wireTypes.lengthDelimited then
			if var1489 == 1 then
				local _ = nil
				local var1492, var1493 = protoModule.readBuffer(p68, var1484)
				var1484 = var1493
				var1483.oneof_prop = {
					type = "string_prop",
					value = t.StringProp.decode(var1492)
				}
			elseif var1489 == 2 then
				local _ = nil
				local var1494, var1495 = protoModule.readBuffer(p68, var1484)
				var1484 = var1495
				var1483.oneof_prop = { type = "int32_prop", value = t.Int32Prop.decode(var1494) }
			else
				local _ = nil
				local var1496, var1497 = protoModule.readVarInt(p68, var1484)
				var1484 = var1497 + var1496
			end
		elseif var1485 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1498, var1499 = protoModule.readFixed32(p68, var1484)
			local _ = var1498
			var1484 = var1499
		elseif var1485 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1500, var1501 = protoModule.readFixed64(p68, var1484)
			local _ = var1500
			var1484 = var1501
		else
			error("Unsupported wire type: " .. var2312)
		end
	end
	return var1483
end

function t_68:jsonEncode()
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			t.stringProp = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "int32_prop" then
			t.int32Prop = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function t_68:jsonDecode()
	-- upvalues: t_68 (ref), t (ref)
	local var1502 = t_68.new()
	
	if self.string_prop ~= nil then
		var1502.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		var1502.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		var1502.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		var1502.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	return var1502
end

t_68.descriptor = {
	name = "IconSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconSizeProp"
}
t.IconSizeProp = t_68
typeRegistryModule.default:register(t.IconSizeProp)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p69)
	-- upvalues: t_69 (ref)
	return setmetatable({
		kind = if p69 == nil or p69.kind == nil then nil else p69.kind
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1502 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1503 = self.kind.value:encode()
			local var1504, var1505 = protoModule.writeTag(buff, var1502, 1, protoModule.wireTypes.lengthDelimited)
			var1504, var2335 = protoModule.writeBuffer(var1504, var1505, var1503, buffer.len(var1503))
			buff = var1504
			var1502 = var1505
		elseif self.kind.type == "conditional" then
			local var1506 = self.kind.value:encode()
			local var1507, var1508 = protoModule.writeTag(buff, var1502, 2, protoModule.wireTypes.lengthDelimited)
			var1507, var2338 = protoModule.writeBuffer(var1507, var1508, var1506, buffer.len(var1506))
			buff = var1507
			var1502 = var1508
		elseif self.kind.type == "binding_path" then
			local var1509, var1510 = protoModule.writeTag(buff, var1502, 3, protoModule.wireTypes.lengthDelimited)
			var1509, var2340 = protoModule.writeString(var1509, var1510, self.kind.value)
			buff = var1509
			var1502 = var1510
		end
	end
	local buff_1 = buffer.create(var1502)
	buffer.copy(buff_1, 0, buff, 0, var1502)
	
	return buff_1
end

function t_69.decode(p69)
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var1502 = t_69.new()
	local var1503 = 0
	while var1503 < buffer.len(p69) do
		local _ = nil
		local var1504 = nil
		local var1505, var1506, var1507 = protoModule.readTag(p69, var1503)
		local var1508 = var1505
		var1504 = var1506
		var1503 = var1507
		
		if var1504 == protoModule.wireTypes.varint then
			local _ = nil
			local var1509, var1510 = protoModule.readVarInt(p69, var1503)
			local _ = var1509
			var1503 = var1510
			continue
		end
		if var1504 == protoModule.wireTypes.lengthDelimited then
			if var1508 == 1 then
				local _ = nil
				local var1511, var1512 = protoModule.readBuffer(p69, var1503)
				var1503 = var1512
				var1502.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var1511)
				}
			elseif var1508 == 2 then
				local _ = nil
				local var1513, var1514 = protoModule.readBuffer(p69, var1503)
				var1503 = var1514
				var1502.kind = {
					type = "conditional",
					value = t.GradientProp_ConditionalOptions.decode(var1513)
				}
			elseif var1508 == 3 then
				local _ = nil
				local var1515, var1516 = protoModule.readBuffer(p69, var1503)
				var1503 = var1516
				var1502.kind = { type = "binding_path", value = buffer.tostring(var1515) }
			else
				local _ = nil
				local var1517, var1518 = protoModule.readVarInt(p69, var1503)
				var1503 = var1518 + var1517
			end
		elseif var1504 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1519, var1520 = protoModule.readFixed32(p69, var1503)
			local _ = var1519
			var1503 = var1520
		elseif var1504 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1521, var1522 = protoModule.readFixed64(p69, var1503)
			local _ = var1521
			var1503 = var1522
		else
			error("Unsupported wire type: " .. var2344)
		end
	end
	return var1502
end

function t_69:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_69:jsonDecode()
	-- upvalues: t_69 (ref), t (ref)
	local var1523 = t_69.new()
	
	if self.literal ~= nil then
		var1523.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var1523.kind = {
			type = "conditional",
			value = t.GradientProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1523.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1523.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1523
end

t_69.descriptor = {
	name = "GradientProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
}
t.GradientProp = t_69
typeRegistryModule.default:register(t.GradientProp)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p70)
	-- upvalues: t_70 (ref)
	return setmetatable({
		condition = if p70 == nil or p70.condition == nil then nil else p70.condition,
		kind = if p70 == nil or p70.kind == nil then nil else p70.kind
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1523 = 0
	
	if self.condition ~= nil then
		local var1524 = self.condition:encode()
		local var1525, var1526 = protoModule.writeTag(buff, var1523, 1, protoModule.wireTypes.lengthDelimited)
		var1525, var2369 = protoModule.writeBuffer(var1525, var1526, var1524, buffer.len(var1524))
		buff = var1525
		var1523 = var1526
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1527 = self.kind.value:encode()
			local var1528, var1529 = protoModule.writeTag(buff, var1523, 2, protoModule.wireTypes.lengthDelimited)
			var1528, var2372 = protoModule.writeBuffer(var1528, var1529, var1527, buffer.len(var1527))
			buff = var1528
			var1523 = var1529
		elseif self.kind.type == "binding_path" then
			local var1530, var1531 = protoModule.writeTag(buff, var1523, 3, protoModule.wireTypes.lengthDelimited)
			var1530, var2374 = protoModule.writeString(var1530, var1531, self.kind.value)
			buff = var1530
			var1523 = var1531
		end
	end
	local buff_1 = buffer.create(var1523)
	buffer.copy(buff_1, 0, buff, 0, var1523)
	
	return buff_1
end

function t_70.decode(p70)
	-- upvalues: t_70 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1523 = t_70.new()
	local var1524 = 0
	while var1524 < buffer.len(p70) do
		local _ = nil
		local var1525 = nil
		local var1526, var1527, var1528 = protoModule.readTag(p70, var1524)
		local var1529 = var1526
		var1525 = var1527
		var1524 = var1528
		
		if var1525 == protoModule.wireTypes.varint then
			local _ = nil
			local var1530, var1531 = protoModule.readVarInt(p70, var1524)
			local _ = var1530
			var1524 = var1531
			continue
		end
		if var1525 == protoModule.wireTypes.lengthDelimited then
			if var1529 == 1 then
				local _ = nil
				local var1532, var1533 = protoModule.readBuffer(p70, var1524)
				var1524 = var1533
				var1523.condition = propConditionModule.PropCondition.decode(var1532)
			elseif var1529 == 2 then
				local _ = nil
				local var1534, var1535 = protoModule.readBuffer(p70, var1524)
				var1524 = var1535
				var1523.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var1534)
				}
			elseif var1529 == 3 then
				local _ = nil
				local var1536, var1537 = protoModule.readBuffer(p70, var1524)
				var1524 = var1537
				var1523.kind = { type = "binding_path", value = buffer.tostring(var1536) }
			else
				local _ = nil
				local var1538, var1539 = protoModule.readVarInt(p70, var1524)
				var1524 = var1539 + var1538
			end
		elseif var1525 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1540, var1541 = protoModule.readFixed32(p70, var1524)
			local _ = var1540
			var1524 = var1541
		elseif var1525 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1542, var1543 = protoModule.readFixed64(p70, var1524)
			local _ = var1542
			var1524 = var1543
		else
			error("Unsupported wire type: " .. var2378)
		end
	end
	return var1523
end

function t_70:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_70:jsonDecode()
	-- upvalues: t_70 (ref), propConditionModule (ref), t (ref)
	local var1544 = t_70.new()
	
	if self.condition ~= nil then
		var1544.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1544.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1544.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1544.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1544
end

t_70.descriptor = {
	name = "GradientProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.GradientProp_ConditionalOption = t_70
typeRegistryModule.default:register(t.GradientProp_ConditionalOption)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p71)
	-- upvalues: t_71 (ref)
	return setmetatable({
		options = if p71 == nil or p71.options == nil then {} else p71.options
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1544 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1545 = v:encode()
			local var1546, var1547 = protoModule.writeTag(buff, var1544, 1, protoModule.wireTypes.lengthDelimited)
			var1546, var2403 = protoModule.writeBuffer(var1546, var1547, var1545, buffer.len(var1545))
			buff = var1546
			var1544 = var1547
		end
	end
	local buff_1 = buffer.create(var1544)
	buffer.copy(buff_1, 0, buff, 0, var1544)
	
	return buff_1
end

function t_71.decode(p71)
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var1548 = t_71.new()
	local var1549 = 0
	while var1549 < buffer.len(p71) do
		local _ = nil
		local var1550 = nil
		local var1551, var1552, var1553 = protoModule.readTag(p71, var1549)
		local var1554 = var1551
		var1550 = var1552
		var1549 = var1553
		
		if var1550 == protoModule.wireTypes.varint then
			local _ = nil
			local var1555, var1556 = protoModule.readVarInt(p71, var1549)
			local _ = var1555
			var1549 = var1556
			continue
		end
		if var1550 == protoModule.wireTypes.lengthDelimited then
			if var1554 == 1 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p71, var1549)
				var1549 = var1558
				table.insert(var1548.options, t.GradientProp_ConditionalOption.decode(var1557))
			else
				local _ = nil
				local var1559, var1560 = protoModule.readVarInt(p71, var1549)
				var1549 = var1560 + var1559
			end
		elseif var1550 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1561, var1562 = protoModule.readFixed32(p71, var1549)
			local _ = var1561
			var1549 = var1562
		elseif var1550 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1563, var1564 = protoModule.readFixed64(p71, var1549)
			local _ = var1563
			var1549 = var1564
		else
			error("Unsupported wire type: " .. var2407)
		end
	end
	return var1548
end

function t_71:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_71:jsonDecode()
	-- upvalues: t_71 (ref), t (ref)
	local var1565 = t_71.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.GradientProp_ConditionalOption.jsonDecode(v))
		end
		var1565.options = t_1
	end
	return var1565
end

t_71.descriptor = {
	name = "GradientProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.GradientProp_ConditionalOptions = t_71
typeRegistryModule.default:register(t.GradientProp_ConditionalOptions)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p72)
	-- upvalues: t_72 (ref)
	return setmetatable({
		start_color = if p72 == nil or p72.start_color == nil then "" else p72.start_color,
		end_color = if p72 == nil or p72.end_color == nil then "" else p72.end_color,
		start_opacity = if p72 == nil or p72.start_opacity == nil then 0 else p72.start_opacity,
		end_opacity = if p72 == nil or p72.end_opacity == nil then 0 else p72.end_opacity,
		degree = if p72 == nil or p72.degree == nil then 0 else p72.degree,
		midpoint_percent = if p72 == nil or p72.midpoint_percent == nil then 0 else p72.midpoint_percent
	}, t_72)
end

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1566 = 0
	
	if self.start_color ~= nil and self.start_color ~= "" then
		local var1567, var1568 = protoModule.writeTag(buff, var1566, 1, protoModule.wireTypes.lengthDelimited)
		var1567, var2429 = protoModule.writeString(var1567, var1568, self.start_color)
		buff = var1567
		var1566 = var1568
	end
	if self.end_color ~= nil and self.end_color ~= "" then
		local var1569, var1570 = protoModule.writeTag(buff, var1566, 2, protoModule.wireTypes.lengthDelimited)
		var1569, var2431 = protoModule.writeString(var1569, var1570, self.end_color)
		buff = var1569
		var1566 = var1570
	end
	if self.start_opacity ~= nil and self.start_opacity ~= 0 then
		local var1571, var1572 = protoModule.writeTag(buff, var1566, 3, protoModule.wireTypes.i32)
		var1571, var2433 = protoModule.writeFloat(var1571, var1572, self.start_opacity)
		buff = var1571
		var1566 = var1572
	end
	if self.end_opacity ~= nil and self.end_opacity ~= 0 then
		local var1573, var1574 = protoModule.writeTag(buff, var1566, 4, protoModule.wireTypes.i32)
		var1573, var2435 = protoModule.writeFloat(var1573, var1574, self.end_opacity)
		buff = var1573
		var1566 = var1574
	end
	if self.degree ~= nil and self.degree ~= 0 then
		local var1575, var1576 = protoModule.writeTag(buff, var1566, 5, protoModule.wireTypes.varint)
		var1575, var2437 = protoModule.writeVarInt(var1575, var1576, self.degree)
		buff = var1575
		var1566 = var1576
	end
	if self.midpoint_percent ~= nil and self.midpoint_percent ~= 0 then
		local var1577, var1578 = protoModule.writeTag(buff, var1566, 6, protoModule.wireTypes.i32)
		var1577, var2439 = protoModule.writeFloat(var1577, var1578, self.midpoint_percent)
		buff = var1577
		var1566 = var1578
	end
	local buff_1 = buffer.create(var1566)
	buffer.copy(buff_1, 0, buff, 0, var1566)
	
	return buff_1
end

function t_72.decode(p72)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var1566 = t_72.new()
	local var1567 = 0
	while var1567 < buffer.len(p72) do
		local _ = nil
		local var1568 = nil
		local var1569, var1570, var1571 = protoModule.readTag(p72, var1567)
		local var1572 = var1569
		var1568 = var1570
		var1567 = var1571
		
		if var1568 == protoModule.wireTypes.varint then
			if var1572 == 5 then
				local _ = nil
				local var1573, var1574 = protoModule.readVarIntI32(p72, var1567)
				var1567 = var1574
				var1566.degree = var1573
			else
				local _ = nil
				local var1575, var1576 = protoModule.readVarInt(p72, var1567)
				local _ = var1575
				var1567 = var1576
			end
		end
		if var1568 == protoModule.wireTypes.lengthDelimited then
			if var1572 == 1 then
				local _ = nil
				local var1577, var1578 = protoModule.readBuffer(p72, var1567)
				var1567 = var1578
				var1566.start_color = buffer.tostring(var1577)
			elseif var1572 == 2 then
				local _ = nil
				local var1579, var1580 = protoModule.readBuffer(p72, var1567)
				var1567 = var1580
				var1566.end_color = buffer.tostring(var1579)
			else
				local _ = nil
				local var1581, var1582 = protoModule.readVarInt(p72, var1567)
				var1567 = var1582 + var1581
			end
		elseif var1568 == protoModule.wireTypes.i32 then
			if var1572 == 3 then
				local _ = nil
				local var1583, var1584 = protoModule.readFloat(p72, var1567)
				var1567 = var1584
				var1566.start_opacity = var1583
			elseif var1572 == 4 then
				local _ = nil
				local var1585, var1586 = protoModule.readFloat(p72, var1567)
				var1567 = var1586
				var1566.end_opacity = var1585
			elseif var1572 == 6 then
				local _ = nil
				local var1587, var1588 = protoModule.readFloat(p72, var1567)
				var1567 = var1588
				var1566.midpoint_percent = var1587
			else
				local _ = nil
				local var1589, var1590 = protoModule.readFixed32(p72, var1567)
				local _ = var1589
				var1567 = var1590
			end
		elseif var1568 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1591, var1592 = protoModule.readFixed64(p72, var1567)
			local _ = var1591
			var1567 = var1592
		else
			error("Unsupported wire type: " .. var2443)
		end
	end
	return var1566
end

function t_72:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.start_color ~= nil and self.start_color ~= "" then
		t.startColor = self.start_color
	end
	if self.end_color ~= nil and self.end_color ~= "" then
		t.endColor = self.end_color
	end
	if self.start_opacity ~= nil and self.start_opacity ~= 0 then
		t.startOpacity = protoModule.json.serializeNumber(self.start_opacity)
	end
	if self.end_opacity ~= nil and self.end_opacity ~= 0 then
		t.endOpacity = protoModule.json.serializeNumber(self.end_opacity)
	end
	if self.degree ~= nil and self.degree ~= 0 then
		t.degree = self.degree
	end
	if self.midpoint_percent ~= nil and self.midpoint_percent ~= 0 then
		t.midpointPercent = protoModule.json.serializeNumber(self.midpoint_percent)
	end
	return t
end

function t_72:jsonDecode()
	-- upvalues: t_72 (ref), protoModule (ref)
	local var1593 = t_72.new()
	
	if self.start_color ~= nil then
		var1593.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var1593.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var1593.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var1593.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var1593.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var1593.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var1593.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var1593.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var1593.degree = self.degree
	end
	if self.midpoint_percent ~= nil then
		var1593.midpoint_percent = protoModule.json.deserializeNumber(self.midpoint_percent)
	end
	if self.midpointPercent ~= nil then
		var1593.midpoint_percent = protoModule.json.deserializeNumber(self.midpointPercent)
	end
	return var1593
end

t_72.descriptor = {
	name = "GradientProp_GradientData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
}
t.GradientProp_GradientData = t_72
typeRegistryModule.default:register(t.GradientProp_GradientData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p73)
	-- upvalues: t_73 (ref)
	return setmetatable({
		kind = if p73 == nil or p73.kind == nil then nil else p73.kind
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1593 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1594 = self.kind.value:encode()
			local var1595, var1596 = protoModule.writeTag(buff, var1593, 1, protoModule.wireTypes.lengthDelimited)
			var1595, var2474 = protoModule.writeBuffer(var1595, var1596, var1594, buffer.len(var1594))
			buff = var1595
			var1593 = var1596
		elseif self.kind.type == "binding_path" then
			local var1597, var1598 = protoModule.writeTag(buff, var1593, 2, protoModule.wireTypes.lengthDelimited)
			var1597, var2476 = protoModule.writeString(var1597, var1598, self.kind.value)
			buff = var1597
			var1593 = var1598
		elseif self.kind.type == "conditional" then
			local var1599 = self.kind.value:encode()
			local var1600, var1601 = protoModule.writeTag(buff, var1593, 3, protoModule.wireTypes.lengthDelimited)
			var1600, var2479 = protoModule.writeBuffer(var1600, var1601, var1599, buffer.len(var1599))
			buff = var1600
			var1593 = var1601
		end
	end
	local buff_1 = buffer.create(var1593)
	buffer.copy(buff_1, 0, buff, 0, var1593)
	
	return buff_1
end

function t_73.decode(p73)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var1593 = t_73.new()
	local var1594 = 0
	while var1594 < buffer.len(p73) do
		local _ = nil
		local var1595 = nil
		local var1596, var1597, var1598 = protoModule.readTag(p73, var1594)
		local var1599 = var1596
		var1595 = var1597
		var1594 = var1598
		
		if var1595 == protoModule.wireTypes.varint then
			local _ = nil
			local var1600, var1601 = protoModule.readVarInt(p73, var1594)
			local _ = var1600
			var1594 = var1601
			continue
		end
		if var1595 == protoModule.wireTypes.lengthDelimited then
			if var1599 == 1 then
				local _ = nil
				local var1602, var1603 = protoModule.readBuffer(p73, var1594)
				var1594 = var1603
				var1593.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var1602)
				}
			elseif var1599 == 2 then
				local _ = nil
				local var1604, var1605 = protoModule.readBuffer(p73, var1594)
				var1594 = var1605
				var1593.kind = { type = "binding_path", value = buffer.tostring(var1604) }
			elseif var1599 == 3 then
				local _ = nil
				local var1606, var1607 = protoModule.readBuffer(p73, var1594)
				var1594 = var1607
				var1593.kind = {
					type = "conditional",
					value = t.ArrayOfStructProp_ConditionalOptions.decode(var1606)
				}
			else
				local _ = nil
				local var1608, var1609 = protoModule.readVarInt(p73, var1594)
				var1594 = var1609 + var1608
			end
		elseif var1595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1610, var1611 = protoModule.readFixed32(p73, var1594)
			local _ = var1610
			var1594 = var1611
		elseif var1595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1612, var1613 = protoModule.readFixed64(p73, var1594)
			local _ = var1612
			var1594 = var1613
		else
			error("Unsupported wire type: " .. var2483)
		end
	end
	return var1593
end

function t_73:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_73:jsonDecode()
	-- upvalues: t_73 (ref), t (ref)
	local var1614 = t_73.new()
	
	if self.literal ~= nil then
		var1614.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1614.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1614.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var1614.kind = {
			type = "conditional",
			value = t.ArrayOfStructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1614
end

t_73.descriptor = {
	name = "ArrayOfStructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
}
t.ArrayOfStructProp = t_73
typeRegistryModule.default:register(t.ArrayOfStructProp)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p74)
	-- upvalues: t_74 (ref)
	return setmetatable({
		condition = if p74 == nil or p74.condition == nil then nil else p74.condition,
		kind = if p74 == nil or p74.kind == nil then nil else p74.kind
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1614 = 0
	
	if self.condition ~= nil then
		local var1615 = self.condition:encode()
		local var1616, var1617 = protoModule.writeTag(buff, var1614, 1, protoModule.wireTypes.lengthDelimited)
		var1616, var2508 = protoModule.writeBuffer(var1616, var1617, var1615, buffer.len(var1615))
		buff = var1616
		var1614 = var1617
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1618 = self.kind.value:encode()
			local var1619, var1620 = protoModule.writeTag(buff, var1614, 2, protoModule.wireTypes.lengthDelimited)
			var1619, var2511 = protoModule.writeBuffer(var1619, var1620, var1618, buffer.len(var1618))
			buff = var1619
			var1614 = var1620
		elseif self.kind.type == "binding_path" then
			local var1621, var1622 = protoModule.writeTag(buff, var1614, 3, protoModule.wireTypes.lengthDelimited)
			var1621, var2513 = protoModule.writeString(var1621, var1622, self.kind.value)
			buff = var1621
			var1614 = var1622
		end
	end
	local buff_1 = buffer.create(var1614)
	buffer.copy(buff_1, 0, buff, 0, var1614)
	
	return buff_1
end

function t_74.decode(p74)
	-- upvalues: t_74 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1614 = t_74.new()
	local var1615 = 0
	while var1615 < buffer.len(p74) do
		local _ = nil
		local var1616 = nil
		local var1617, var1618, var1619 = protoModule.readTag(p74, var1615)
		local var1620 = var1617
		var1616 = var1618
		var1615 = var1619
		
		if var1616 == protoModule.wireTypes.varint then
			local _ = nil
			local var1621, var1622 = protoModule.readVarInt(p74, var1615)
			local _ = var1621
			var1615 = var1622
			continue
		end
		if var1616 == protoModule.wireTypes.lengthDelimited then
			if var1620 == 1 then
				local _ = nil
				local var1623, var1624 = protoModule.readBuffer(p74, var1615)
				var1615 = var1624
				var1614.condition = propConditionModule.PropCondition.decode(var1623)
			elseif var1620 == 2 then
				local _ = nil
				local var1625, var1626 = protoModule.readBuffer(p74, var1615)
				var1615 = var1626
				var1614.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var1625)
				}
			elseif var1620 == 3 then
				local _ = nil
				local var1627, var1628 = protoModule.readBuffer(p74, var1615)
				var1615 = var1628
				var1614.kind = { type = "binding_path", value = buffer.tostring(var1627) }
			else
				local _ = nil
				local var1629, var1630 = protoModule.readVarInt(p74, var1615)
				var1615 = var1630 + var1629
			end
		elseif var1616 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1631, var1632 = protoModule.readFixed32(p74, var1615)
			local _ = var1631
			var1615 = var1632
		elseif var1616 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1633, var1634 = protoModule.readFixed64(p74, var1615)
			local _ = var1633
			var1615 = var1634
		else
			error("Unsupported wire type: " .. var2517)
		end
	end
	return var1614
end

function t_74:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_74:jsonDecode()
	-- upvalues: t_74 (ref), propConditionModule (ref), t (ref)
	local var1635 = t_74.new()
	
	if self.condition ~= nil then
		var1635.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1635.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1635.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1635.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1635
end

t_74.descriptor = {
	name = "ArrayOfStructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfStructProp_ConditionalOption = t_74
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOption)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p75)
	-- upvalues: t_75 (ref)
	return setmetatable({
		options = if p75 == nil or p75.options == nil then {} else p75.options
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1635 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1636 = v:encode()
			local var1637, var1638 = protoModule.writeTag(buff, var1635, 1, protoModule.wireTypes.lengthDelimited)
			var1637, var2542 = protoModule.writeBuffer(var1637, var1638, var1636, buffer.len(var1636))
			buff = var1637
			var1635 = var1638
		end
	end
	local buff_1 = buffer.create(var1635)
	buffer.copy(buff_1, 0, buff, 0, var1635)
	
	return buff_1
end

function t_75.decode(p75)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var1639 = t_75.new()
	local var1640 = 0
	while var1640 < buffer.len(p75) do
		local _ = nil
		local var1641 = nil
		local var1642, var1643, var1644 = protoModule.readTag(p75, var1640)
		local var1645 = var1642
		var1641 = var1643
		var1640 = var1644
		
		if var1641 == protoModule.wireTypes.varint then
			local _ = nil
			local var1646, var1647 = protoModule.readVarInt(p75, var1640)
			local _ = var1646
			var1640 = var1647
			continue
		end
		if var1641 == protoModule.wireTypes.lengthDelimited then
			if var1645 == 1 then
				local _ = nil
				local var1648, var1649 = protoModule.readBuffer(p75, var1640)
				var1640 = var1649
				table.insert(var1639.options, t.ArrayOfStructProp_ConditionalOption.decode(var1648))
			else
				local _ = nil
				local var1650, var1651 = protoModule.readVarInt(p75, var1640)
				var1640 = var1651 + var1650
			end
		elseif var1641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1652, var1653 = protoModule.readFixed32(p75, var1640)
			local _ = var1652
			var1640 = var1653
		elseif var1641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1654, var1655 = protoModule.readFixed64(p75, var1640)
			local _ = var1654
			var1640 = var1655
		else
			error("Unsupported wire type: " .. var2546)
		end
	end
	return var1639
end

function t_75:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_75:jsonDecode()
	-- upvalues: t_75 (ref), t (ref)
	local var1656 = t_75.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfStructProp_ConditionalOption.jsonDecode(v))
		end
		var1656.options = t_1
	end
	return var1656
end

t_75.descriptor = {
	name = "ArrayOfStructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfStructProp_ConditionalOptions = t_75
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOptions)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p76)
	-- upvalues: t_76 (ref)
	return setmetatable({
		entry = if p76 == nil or p76.entry == nil then {} else p76.entry
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1657 = 0
	
	if self.entry ~= nil and #self.entry > 0 then
		for i, v in self.entry do
			local var1658 = v:encode()
			local var1659, var1660 = protoModule.writeTag(buff, var1657, 1, protoModule.wireTypes.lengthDelimited)
			var1659, var2569 = protoModule.writeBuffer(var1659, var1660, var1658, buffer.len(var1658))
			buff = var1659
			var1657 = var1660
		end
	end
	local buff_1 = buffer.create(var1657)
	buffer.copy(buff_1, 0, buff, 0, var1657)
	
	return buff_1
end

function t_76.decode(p76)
	-- upvalues: t_76 (ref), protoModule (ref), structModule (ref)
	local var1661 = t_76.new()
	local var1662 = 0
	while var1662 < buffer.len(p76) do
		local _ = nil
		local var1663 = nil
		local var1664, var1665, var1666 = protoModule.readTag(p76, var1662)
		local var1667 = var1664
		var1663 = var1665
		var1662 = var1666
		
		if var1663 == protoModule.wireTypes.varint then
			local _ = nil
			local var1668, var1669 = protoModule.readVarInt(p76, var1662)
			local _ = var1668
			var1662 = var1669
			continue
		end
		if var1663 == protoModule.wireTypes.lengthDelimited then
			if var1667 == 1 then
				local _ = nil
				local var1670, var1671 = protoModule.readBuffer(p76, var1662)
				var1662 = var1671
				table.insert(var1661.entry, structModule.Struct.decode(var1670))
			else
				local _ = nil
				local var1672, var1673 = protoModule.readVarInt(p76, var1662)
				var1662 = var1673 + var1672
			end
		elseif var1663 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1674, var1675 = protoModule.readFixed32(p76, var1662)
			local _ = var1674
			var1662 = var1675
		elseif var1663 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1676, var1677 = protoModule.readFixed64(p76, var1662)
			local _ = var1676
			var1662 = var1677
		else
			error("Unsupported wire type: " .. var2573)
		end
	end
	return var1661
end

function t_76:jsonEncode()
	local t = {}
	
	if self.entry ~= nil and #self.entry > 0 then
		local t_1 = {}
		
		for i, v in self.entry do
			table.insert(t_1, v:jsonEncode())
		end
		t.entry = t_1
	end
	return t
end

function t_76:jsonDecode()
	-- upvalues: t_76 (ref), structModule (ref)
	local var1678 = t_76.new()
	
	if self.entry ~= nil then
		local t = {}
		
		for i, v in self.entry do
			table.insert(t, structModule.Struct.jsonDecode(v))
		end
		var1678.entry = t
	end
	return var1678
end

t_76.descriptor = {
	name = "ArrayOfStructProp_ArrayOfStructs",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
}
t.ArrayOfStructProp_ArrayOfStructs = t_76
typeRegistryModule.default:register(t.ArrayOfStructProp_ArrayOfStructs)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p77)
	-- upvalues: t_77 (ref)
	return setmetatable({
		kind = if p77 == nil or p77.kind == nil then nil else p77.kind
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1679 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1680, var1681 = protoModule.writeTag(buff, var1679, 1, protoModule.wireTypes.lengthDelimited)
			var1680, var2595 = protoModule.writeString(var1680, var1681, self.kind.value)
			buff = var1680
			var1679 = var1681
		elseif self.kind.type == "token" then
			local var1682, var1683 = protoModule.writeTag(buff, var1679, 2, protoModule.wireTypes.lengthDelimited)
			var1682, var2597 = protoModule.writeString(var1682, var1683, self.kind.value)
			buff = var1682
			var1679 = var1683
		elseif self.kind.type == "conditional" then
			local var1684 = self.kind.value:encode()
			local var1685, var1686 = protoModule.writeTag(buff, var1679, 3, protoModule.wireTypes.lengthDelimited)
			var1685, var2600 = protoModule.writeBuffer(var1685, var1686, var1684, buffer.len(var1684))
			buff = var1685
			var1679 = var1686
		elseif self.kind.type == "binding_path" then
			local var1687, var1688 = protoModule.writeTag(buff, var1679, 4, protoModule.wireTypes.lengthDelimited)
			var1687, var2602 = protoModule.writeString(var1687, var1688, self.kind.value)
			buff = var1687
			var1679 = var1688
		end
	end
	local buff_1 = buffer.create(var1679)
	buffer.copy(buff_1, 0, buff, 0, var1679)
	
	return buff_1
end

function t_77.decode(p77)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var1679 = t_77.new()
	local var1680 = 0
	while var1680 < buffer.len(p77) do
		local _ = nil
		local var1681 = nil
		local var1682, var1683, var1684 = protoModule.readTag(p77, var1680)
		local var1685 = var1682
		var1681 = var1683
		var1680 = var1684
		
		if var1681 == protoModule.wireTypes.varint then
			local _ = nil
			local var1686, var1687 = protoModule.readVarInt(p77, var1680)
			local _ = var1686
			var1680 = var1687
			continue
		end
		if var1681 == protoModule.wireTypes.lengthDelimited then
			if var1685 == 1 then
				local _ = nil
				local var1688, var1689 = protoModule.readBuffer(p77, var1680)
				var1680 = var1689
				var1679.kind = { type = "literal", value = buffer.tostring(var1688) }
			elseif var1685 == 2 then
				local _ = nil
				local var1690, var1691 = protoModule.readBuffer(p77, var1680)
				var1680 = var1691
				var1679.kind = { type = "token", value = buffer.tostring(var1690) }
			elseif var1685 == 3 then
				local _ = nil
				local var1692, var1693 = protoModule.readBuffer(p77, var1680)
				var1680 = var1693
				var1679.kind = {
					type = "conditional",
					value = t.UiScaledFloatProp_ConditionalOptions.decode(var1692)
				}
			elseif var1685 == 4 then
				local _ = nil
				local var1694, var1695 = protoModule.readBuffer(p77, var1680)
				var1680 = var1695
				var1679.kind = { type = "binding_path", value = buffer.tostring(var1694) }
			else
				local _ = nil
				local var1696, var1697 = protoModule.readVarInt(p77, var1680)
				var1680 = var1697 + var1696
			end
		elseif var1681 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1698, var1699 = protoModule.readFixed32(p77, var1680)
			local _ = var1698
			var1680 = var1699
		elseif var1681 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1700, var1701 = protoModule.readFixed64(p77, var1680)
			local _ = var1700
			var1680 = var1701
		else
			error("Unsupported wire type: " .. var2606)
		end
	end
	return var1679
end

function t_77:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_77:jsonDecode()
	-- upvalues: t_77 (ref), t (ref)
	local var1702 = t_77.new()
	
	if self.literal ~= nil then
		var1702.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1702.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1702.kind = {
			type = "conditional",
			value = t.UiScaledFloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1702.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1702.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1702
end

t_77.descriptor = {
	name = "UiScaledFloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
}
t.UiScaledFloatProp = t_77
typeRegistryModule.default:register(t.UiScaledFloatProp)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p78)
	-- upvalues: t_78 (ref)
	return setmetatable({
		condition = if p78 == nil or p78.condition == nil then nil else p78.condition,
		kind = if p78 == nil or p78.kind == nil then nil else p78.kind
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1702 = 0
	
	if self.condition ~= nil then
		local var1703 = self.condition:encode()
		local var1704, var1705 = protoModule.writeTag(buff, var1702, 1, protoModule.wireTypes.lengthDelimited)
		var1704, var2633 = protoModule.writeBuffer(var1704, var1705, var1703, buffer.len(var1703))
		buff = var1704
		var1702 = var1705
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1706, var1707 = protoModule.writeTag(buff, var1702, 2, protoModule.wireTypes.lengthDelimited)
			var1706, var2635 = protoModule.writeString(var1706, var1707, self.kind.value)
			buff = var1706
			var1702 = var1707
		elseif self.kind.type == "token" then
			local var1708, var1709 = protoModule.writeTag(buff, var1702, 3, protoModule.wireTypes.lengthDelimited)
			var1708, var2637 = protoModule.writeString(var1708, var1709, self.kind.value)
			buff = var1708
			var1702 = var1709
		elseif self.kind.type == "binding_path" then
			local var1710, var1711 = protoModule.writeTag(buff, var1702, 4, protoModule.wireTypes.lengthDelimited)
			var1710, var2639 = protoModule.writeString(var1710, var1711, self.kind.value)
			buff = var1710
			var1702 = var1711
		end
	end
	local buff_1 = buffer.create(var1702)
	buffer.copy(buff_1, 0, buff, 0, var1702)
	
	return buff_1
end

function t_78.decode(p78)
	-- upvalues: t_78 (ref), protoModule (ref), propConditionModule (ref)
	local var1702 = t_78.new()
	local var1703 = 0
	while var1703 < buffer.len(p78) do
		local _ = nil
		local var1704 = nil
		local var1705, var1706, var1707 = protoModule.readTag(p78, var1703)
		local var1708 = var1705
		var1704 = var1706
		var1703 = var1707
		
		if var1704 == protoModule.wireTypes.varint then
			local _ = nil
			local var1709, var1710 = protoModule.readVarInt(p78, var1703)
			local _ = var1709
			var1703 = var1710
			continue
		end
		if var1704 == protoModule.wireTypes.lengthDelimited then
			if var1708 == 1 then
				local _ = nil
				local var1711, var1712 = protoModule.readBuffer(p78, var1703)
				var1703 = var1712
				var1702.condition = propConditionModule.PropCondition.decode(var1711)
			elseif var1708 == 2 then
				local _ = nil
				local var1713, var1714 = protoModule.readBuffer(p78, var1703)
				var1703 = var1714
				var1702.kind = { type = "literal", value = buffer.tostring(var1713) }
			elseif var1708 == 3 then
				local _ = nil
				local var1715, var1716 = protoModule.readBuffer(p78, var1703)
				var1703 = var1716
				var1702.kind = { type = "token", value = buffer.tostring(var1715) }
			elseif var1708 == 4 then
				local _ = nil
				local var1717, var1718 = protoModule.readBuffer(p78, var1703)
				var1703 = var1718
				var1702.kind = { type = "binding_path", value = buffer.tostring(var1717) }
			else
				local _ = nil
				local var1719, var1720 = protoModule.readVarInt(p78, var1703)
				var1703 = var1720 + var1719
			end
		elseif var1704 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1721, var1722 = protoModule.readFixed32(p78, var1703)
			local _ = var1721
			var1703 = var1722
		elseif var1704 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1723, var1724 = protoModule.readFixed64(p78, var1703)
			local _ = var1723
			var1703 = var1724
		else
			error("Unsupported wire type: " .. var2643)
		end
	end
	return var1702
end

function t_78:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_78:jsonDecode()
	-- upvalues: t_78 (ref), propConditionModule (ref)
	local var1725 = t_78.new()
	
	if self.condition ~= nil then
		var1725.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1725.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1725.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1725.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1725.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1725
end

t_78.descriptor = {
	name = "UiScaledFloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledFloatProp_ConditionalOption = t_78
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p79)
	-- upvalues: t_79 (ref)
	return setmetatable({
		options = if p79 == nil or p79.options == nil then {} else p79.options
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1725 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1726 = v:encode()
			local var1727, var1728 = protoModule.writeTag(buff, var1725, 1, protoModule.wireTypes.lengthDelimited)
			var1727, var2670 = protoModule.writeBuffer(var1727, var1728, var1726, buffer.len(var1726))
			buff = var1727
			var1725 = var1728
		end
	end
	local buff_1 = buffer.create(var1725)
	buffer.copy(buff_1, 0, buff, 0, var1725)
	
	return buff_1
end

function t_79.decode(p79)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var1729 = t_79.new()
	local var1730 = 0
	while var1730 < buffer.len(p79) do
		local _ = nil
		local var1731 = nil
		local var1732, var1733, var1734 = protoModule.readTag(p79, var1730)
		local var1735 = var1732
		var1731 = var1733
		var1730 = var1734
		
		if var1731 == protoModule.wireTypes.varint then
			local _ = nil
			local var1736, var1737 = protoModule.readVarInt(p79, var1730)
			local _ = var1736
			var1730 = var1737
			continue
		end
		if var1731 == protoModule.wireTypes.lengthDelimited then
			if var1735 == 1 then
				local _ = nil
				local var1738, var1739 = protoModule.readBuffer(p79, var1730)
				var1730 = var1739
				table.insert(var1729.options, t.UiScaledFloatProp_ConditionalOption.decode(var1738))
			else
				local _ = nil
				local var1740, var1741 = protoModule.readVarInt(p79, var1730)
				var1730 = var1741 + var1740
			end
		elseif var1731 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1742, var1743 = protoModule.readFixed32(p79, var1730)
			local _ = var1742
			var1730 = var1743
		elseif var1731 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1744, var1745 = protoModule.readFixed64(p79, var1730)
			local _ = var1744
			var1730 = var1745
		else
			error("Unsupported wire type: " .. var2674)
		end
	end
	return var1729
end

function t_79:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), t (ref)
	local var1746 = t_79.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledFloatProp_ConditionalOption.jsonDecode(v))
		end
		var1746.options = t_1
	end
	return var1746
end

t_79.descriptor = {
	name = "UiScaledFloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledFloatProp_ConditionalOptions = t_79
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOptions)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p80)
	-- upvalues: t_80 (ref)
	return setmetatable({
		kind = if p80 == nil or p80.kind == nil then nil else p80.kind
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1747 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1748, var1749 = protoModule.writeTag(buff, var1747, 1, protoModule.wireTypes.lengthDelimited)
			var1748, var2696 = protoModule.writeString(var1748, var1749, self.kind.value)
			buff = var1748
			var1747 = var1749
		elseif self.kind.type == "token" then
			local var1750, var1751 = protoModule.writeTag(buff, var1747, 2, protoModule.wireTypes.lengthDelimited)
			var1750, var2698 = protoModule.writeString(var1750, var1751, self.kind.value)
			buff = var1750
			var1747 = var1751
		elseif self.kind.type == "conditional" then
			local var1752 = self.kind.value:encode()
			local var1753, var1754 = protoModule.writeTag(buff, var1747, 3, protoModule.wireTypes.lengthDelimited)
			var1753, var2701 = protoModule.writeBuffer(var1753, var1754, var1752, buffer.len(var1752))
			buff = var1753
			var1747 = var1754
		elseif self.kind.type == "binding_path" then
			local var1755, var1756 = protoModule.writeTag(buff, var1747, 4, protoModule.wireTypes.lengthDelimited)
			var1755, var2703 = protoModule.writeString(var1755, var1756, self.kind.value)
			buff = var1755
			var1747 = var1756
		end
	end
	local buff_1 = buffer.create(var1747)
	buffer.copy(buff_1, 0, buff, 0, var1747)
	
	return buff_1
end

function t_80.decode(p80)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var1747 = t_80.new()
	local var1748 = 0
	while var1748 < buffer.len(p80) do
		local _ = nil
		local var1749 = nil
		local var1750, var1751, var1752 = protoModule.readTag(p80, var1748)
		local var1753 = var1750
		var1749 = var1751
		var1748 = var1752
		
		if var1749 == protoModule.wireTypes.varint then
			local _ = nil
			local var1754, var1755 = protoModule.readVarInt(p80, var1748)
			local _ = var1754
			var1748 = var1755
			continue
		end
		if var1749 == protoModule.wireTypes.lengthDelimited then
			if var1753 == 1 then
				local _ = nil
				local var1756, var1757 = protoModule.readBuffer(p80, var1748)
				var1748 = var1757
				var1747.kind = { type = "literal", value = buffer.tostring(var1756) }
			elseif var1753 == 2 then
				local _ = nil
				local var1758, var1759 = protoModule.readBuffer(p80, var1748)
				var1748 = var1759
				var1747.kind = { type = "token", value = buffer.tostring(var1758) }
			elseif var1753 == 3 then
				local _ = nil
				local var1760, var1761 = protoModule.readBuffer(p80, var1748)
				var1748 = var1761
				var1747.kind = {
					type = "conditional",
					value = t.UiScaledUDimProp_ConditionalOptions.decode(var1760)
				}
			elseif var1753 == 4 then
				local _ = nil
				local var1762, var1763 = protoModule.readBuffer(p80, var1748)
				var1748 = var1763
				var1747.kind = { type = "binding_path", value = buffer.tostring(var1762) }
			else
				local _ = nil
				local var1764, var1765 = protoModule.readVarInt(p80, var1748)
				var1748 = var1765 + var1764
			end
		elseif var1749 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1766, var1767 = protoModule.readFixed32(p80, var1748)
			local _ = var1766
			var1748 = var1767
		elseif var1749 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1768, var1769 = protoModule.readFixed64(p80, var1748)
			local _ = var1768
			var1748 = var1769
		else
			error("Unsupported wire type: " .. var2707)
		end
	end
	return var1747
end

function t_80:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_80:jsonDecode()
	-- upvalues: t_80 (ref), t (ref)
	local var1770 = t_80.new()
	
	if self.literal ~= nil then
		var1770.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1770.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1770.kind = {
			type = "conditional",
			value = t.UiScaledUDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1770.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1770.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1770
end

t_80.descriptor = {
	name = "UiScaledUDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
}
t.UiScaledUDimProp = t_80
typeRegistryModule.default:register(t.UiScaledUDimProp)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p81)
	-- upvalues: t_81 (ref)
	return setmetatable({
		condition = if p81 == nil or p81.condition == nil then nil else p81.condition,
		kind = if p81 == nil or p81.kind == nil then nil else p81.kind
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1770 = 0
	
	if self.condition ~= nil then
		local var1771 = self.condition:encode()
		local var1772, var1773 = protoModule.writeTag(buff, var1770, 1, protoModule.wireTypes.lengthDelimited)
		var1772, var2734 = protoModule.writeBuffer(var1772, var1773, var1771, buffer.len(var1771))
		buff = var1772
		var1770 = var1773
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1774, var1775 = protoModule.writeTag(buff, var1770, 2, protoModule.wireTypes.lengthDelimited)
			var1774, var2736 = protoModule.writeString(var1774, var1775, self.kind.value)
			buff = var1774
			var1770 = var1775
		elseif self.kind.type == "token" then
			local var1776, var1777 = protoModule.writeTag(buff, var1770, 3, protoModule.wireTypes.lengthDelimited)
			var1776, var2738 = protoModule.writeString(var1776, var1777, self.kind.value)
			buff = var1776
			var1770 = var1777
		elseif self.kind.type == "binding_path" then
			local var1778, var1779 = protoModule.writeTag(buff, var1770, 4, protoModule.wireTypes.lengthDelimited)
			var1778, var2740 = protoModule.writeString(var1778, var1779, self.kind.value)
			buff = var1778
			var1770 = var1779
		end
	end
	local buff_1 = buffer.create(var1770)
	buffer.copy(buff_1, 0, buff, 0, var1770)
	
	return buff_1
end

function t_81.decode(p81)
	-- upvalues: t_81 (ref), protoModule (ref), propConditionModule (ref)
	local var1770 = t_81.new()
	local var1771 = 0
	while var1771 < buffer.len(p81) do
		local _ = nil
		local var1772 = nil
		local var1773, var1774, var1775 = protoModule.readTag(p81, var1771)
		local var1776 = var1773
		var1772 = var1774
		var1771 = var1775
		
		if var1772 == protoModule.wireTypes.varint then
			local _ = nil
			local var1777, var1778 = protoModule.readVarInt(p81, var1771)
			local _ = var1777
			var1771 = var1778
			continue
		end
		if var1772 == protoModule.wireTypes.lengthDelimited then
			if var1776 == 1 then
				local _ = nil
				local var1779, var1780 = protoModule.readBuffer(p81, var1771)
				var1771 = var1780
				var1770.condition = propConditionModule.PropCondition.decode(var1779)
			elseif var1776 == 2 then
				local _ = nil
				local var1781, var1782 = protoModule.readBuffer(p81, var1771)
				var1771 = var1782
				var1770.kind = { type = "literal", value = buffer.tostring(var1781) }
			elseif var1776 == 3 then
				local _ = nil
				local var1783, var1784 = protoModule.readBuffer(p81, var1771)
				var1771 = var1784
				var1770.kind = { type = "token", value = buffer.tostring(var1783) }
			elseif var1776 == 4 then
				local _ = nil
				local var1785, var1786 = protoModule.readBuffer(p81, var1771)
				var1771 = var1786
				var1770.kind = { type = "binding_path", value = buffer.tostring(var1785) }
			else
				local _ = nil
				local var1787, var1788 = protoModule.readVarInt(p81, var1771)
				var1771 = var1788 + var1787
			end
		elseif var1772 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1789, var1790 = protoModule.readFixed32(p81, var1771)
			local _ = var1789
			var1771 = var1790
		elseif var1772 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1791, var1792 = protoModule.readFixed64(p81, var1771)
			local _ = var1791
			var1771 = var1792
		else
			error("Unsupported wire type: " .. var2744)
		end
	end
	return var1770
end

function t_81:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), propConditionModule (ref)
	local var1793 = t_81.new()
	
	if self.condition ~= nil then
		var1793.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1793.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1793.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1793.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1793.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1793
end

t_81.descriptor = {
	name = "UiScaledUDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDimProp_ConditionalOption = t_81
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOption)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p82)
	-- upvalues: t_82 (ref)
	return setmetatable({
		options = if p82 == nil or p82.options == nil then {} else p82.options
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1793 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1794 = v:encode()
			local var1795, var1796 = protoModule.writeTag(buff, var1793, 1, protoModule.wireTypes.lengthDelimited)
			var1795, var2771 = protoModule.writeBuffer(var1795, var1796, var1794, buffer.len(var1794))
			buff = var1795
			var1793 = var1796
		end
	end
	local buff_1 = buffer.create(var1793)
	buffer.copy(buff_1, 0, buff, 0, var1793)
	
	return buff_1
end

function t_82.decode(p82)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var1797 = t_82.new()
	local var1798 = 0
	while var1798 < buffer.len(p82) do
		local _ = nil
		local var1799 = nil
		local var1800, var1801, var1802 = protoModule.readTag(p82, var1798)
		local var1803 = var1800
		var1799 = var1801
		var1798 = var1802
		
		if var1799 == protoModule.wireTypes.varint then
			local _ = nil
			local var1804, var1805 = protoModule.readVarInt(p82, var1798)
			local _ = var1804
			var1798 = var1805
			continue
		end
		if var1799 == protoModule.wireTypes.lengthDelimited then
			if var1803 == 1 then
				local _ = nil
				local var1806, var1807 = protoModule.readBuffer(p82, var1798)
				var1798 = var1807
				table.insert(var1797.options, t.UiScaledUDimProp_ConditionalOption.decode(var1806))
			else
				local _ = nil
				local var1808, var1809 = protoModule.readVarInt(p82, var1798)
				var1798 = var1809 + var1808
			end
		elseif var1799 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1810, var1811 = protoModule.readFixed32(p82, var1798)
			local _ = var1810
			var1798 = var1811
		elseif var1799 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1812, var1813 = protoModule.readFixed64(p82, var1798)
			local _ = var1812
			var1798 = var1813
		else
			error("Unsupported wire type: " .. var2775)
		end
	end
	return var1797
end

function t_82:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_82:jsonDecode()
	-- upvalues: t_82 (ref), t (ref)
	local var1814 = t_82.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDimProp_ConditionalOption.jsonDecode(v))
		end
		var1814.options = t_1
	end
	return var1814
end

t_82.descriptor = {
	name = "UiScaledUDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDimProp_ConditionalOptions = t_82
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOptions)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p83)
	-- upvalues: t_83 (ref)
	return setmetatable({
		kind = if p83 == nil or p83.kind == nil then nil else p83.kind
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1815 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1816, var1817 = protoModule.writeTag(buff, var1815, 1, protoModule.wireTypes.lengthDelimited)
			var1816, var2797 = protoModule.writeString(var1816, var1817, self.kind.value)
			buff = var1816
			var1815 = var1817
		elseif self.kind.type == "token" then
			local var1818, var1819 = protoModule.writeTag(buff, var1815, 2, protoModule.wireTypes.lengthDelimited)
			var1818, var2799 = protoModule.writeString(var1818, var1819, self.kind.value)
			buff = var1818
			var1815 = var1819
		elseif self.kind.type == "conditional" then
			local var1820 = self.kind.value:encode()
			local var1821, var1822 = protoModule.writeTag(buff, var1815, 3, protoModule.wireTypes.lengthDelimited)
			var1821, var2802 = protoModule.writeBuffer(var1821, var1822, var1820, buffer.len(var1820))
			buff = var1821
			var1815 = var1822
		elseif self.kind.type == "binding_path" then
			local var1823, var1824 = protoModule.writeTag(buff, var1815, 4, protoModule.wireTypes.lengthDelimited)
			var1823, var2804 = protoModule.writeString(var1823, var1824, self.kind.value)
			buff = var1823
			var1815 = var1824
		end
	end
	local buff_1 = buffer.create(var1815)
	buffer.copy(buff_1, 0, buff, 0, var1815)
	
	return buff_1
end

function t_83.decode(p83)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var1815 = t_83.new()
	local var1816 = 0
	while var1816 < buffer.len(p83) do
		local _ = nil
		local var1817 = nil
		local var1818, var1819, var1820 = protoModule.readTag(p83, var1816)
		local var1821 = var1818
		var1817 = var1819
		var1816 = var1820
		
		if var1817 == protoModule.wireTypes.varint then
			local _ = nil
			local var1822, var1823 = protoModule.readVarInt(p83, var1816)
			local _ = var1822
			var1816 = var1823
			continue
		end
		if var1817 == protoModule.wireTypes.lengthDelimited then
			if var1821 == 1 then
				local _ = nil
				local var1824, var1825 = protoModule.readBuffer(p83, var1816)
				var1816 = var1825
				var1815.kind = { type = "literal", value = buffer.tostring(var1824) }
			elseif var1821 == 2 then
				local _ = nil
				local var1826, var1827 = protoModule.readBuffer(p83, var1816)
				var1816 = var1827
				var1815.kind = { type = "token", value = buffer.tostring(var1826) }
			elseif var1821 == 3 then
				local _ = nil
				local var1828, var1829 = protoModule.readBuffer(p83, var1816)
				var1816 = var1829
				var1815.kind = {
					type = "conditional",
					value = t.UiScaledUDim2Prop_ConditionalOptions.decode(var1828)
				}
			elseif var1821 == 4 then
				local _ = nil
				local var1830, var1831 = protoModule.readBuffer(p83, var1816)
				var1816 = var1831
				var1815.kind = { type = "binding_path", value = buffer.tostring(var1830) }
			else
				local _ = nil
				local var1832, var1833 = protoModule.readVarInt(p83, var1816)
				var1816 = var1833 + var1832
			end
		elseif var1817 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1834, var1835 = protoModule.readFixed32(p83, var1816)
			local _ = var1834
			var1816 = var1835
		elseif var1817 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1836, var1837 = protoModule.readFixed64(p83, var1816)
			local _ = var1836
			var1816 = var1837
		else
			error("Unsupported wire type: " .. var2808)
		end
	end
	return var1815
end

function t_83:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_83:jsonDecode()
	-- upvalues: t_83 (ref), t (ref)
	local var1838 = t_83.new()
	
	if self.literal ~= nil then
		var1838.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1838.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1838.kind = {
			type = "conditional",
			value = t.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1838.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1838.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1838
end

t_83.descriptor = {
	name = "UiScaledUDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
}
t.UiScaledUDim2Prop = t_83
typeRegistryModule.default:register(t.UiScaledUDim2Prop)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p84)
	-- upvalues: t_84 (ref)
	return setmetatable({
		condition = if p84 == nil or p84.condition == nil then nil else p84.condition,
		kind = if p84 == nil or p84.kind == nil then nil else p84.kind
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1838 = 0
	
	if self.condition ~= nil then
		local var1839 = self.condition:encode()
		local var1840, var1841 = protoModule.writeTag(buff, var1838, 1, protoModule.wireTypes.lengthDelimited)
		var1840, var2835 = protoModule.writeBuffer(var1840, var1841, var1839, buffer.len(var1839))
		buff = var1840
		var1838 = var1841
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1842, var1843 = protoModule.writeTag(buff, var1838, 2, protoModule.wireTypes.lengthDelimited)
			var1842, var2837 = protoModule.writeString(var1842, var1843, self.kind.value)
			buff = var1842
			var1838 = var1843
		elseif self.kind.type == "token" then
			local var1844, var1845 = protoModule.writeTag(buff, var1838, 3, protoModule.wireTypes.lengthDelimited)
			var1844, var2839 = protoModule.writeString(var1844, var1845, self.kind.value)
			buff = var1844
			var1838 = var1845
		elseif self.kind.type == "binding_path" then
			local var1846, var1847 = protoModule.writeTag(buff, var1838, 4, protoModule.wireTypes.lengthDelimited)
			var1846, var2841 = protoModule.writeString(var1846, var1847, self.kind.value)
			buff = var1846
			var1838 = var1847
		end
	end
	local buff_1 = buffer.create(var1838)
	buffer.copy(buff_1, 0, buff, 0, var1838)
	
	return buff_1
end

function t_84.decode(p84)
	-- upvalues: t_84 (ref), protoModule (ref), propConditionModule (ref)
	local var1838 = t_84.new()
	local var1839 = 0
	while var1839 < buffer.len(p84) do
		local _ = nil
		local var1840 = nil
		local var1841, var1842, var1843 = protoModule.readTag(p84, var1839)
		local var1844 = var1841
		var1840 = var1842
		var1839 = var1843
		
		if var1840 == protoModule.wireTypes.varint then
			local _ = nil
			local var1845, var1846 = protoModule.readVarInt(p84, var1839)
			local _ = var1845
			var1839 = var1846
			continue
		end
		if var1840 == protoModule.wireTypes.lengthDelimited then
			if var1844 == 1 then
				local _ = nil
				local var1847, var1848 = protoModule.readBuffer(p84, var1839)
				var1839 = var1848
				var1838.condition = propConditionModule.PropCondition.decode(var1847)
			elseif var1844 == 2 then
				local _ = nil
				local var1849, var1850 = protoModule.readBuffer(p84, var1839)
				var1839 = var1850
				var1838.kind = { type = "literal", value = buffer.tostring(var1849) }
			elseif var1844 == 3 then
				local _ = nil
				local var1851, var1852 = protoModule.readBuffer(p84, var1839)
				var1839 = var1852
				var1838.kind = { type = "token", value = buffer.tostring(var1851) }
			elseif var1844 == 4 then
				local _ = nil
				local var1853, var1854 = protoModule.readBuffer(p84, var1839)
				var1839 = var1854
				var1838.kind = { type = "binding_path", value = buffer.tostring(var1853) }
			else
				local _ = nil
				local var1855, var1856 = protoModule.readVarInt(p84, var1839)
				var1839 = var1856 + var1855
			end
		elseif var1840 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1857, var1858 = protoModule.readFixed32(p84, var1839)
			local _ = var1857
			var1839 = var1858
		elseif var1840 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1859, var1860 = protoModule.readFixed64(p84, var1839)
			local _ = var1859
			var1839 = var1860
		else
			error("Unsupported wire type: " .. var2845)
		end
	end
	return var1838
end

function t_84:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		elseif self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), propConditionModule (ref)
	local var1861 = t_84.new()
	
	if self.condition ~= nil then
		var1861.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1861.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1861.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1861.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1861.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1861
end

t_84.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDim2Prop_ConditionalOption = t_84
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOption)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p85)
	-- upvalues: t_85 (ref)
	return setmetatable({
		options = if p85 == nil or p85.options == nil then {} else p85.options
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1861 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1862 = v:encode()
			local var1863, var1864 = protoModule.writeTag(buff, var1861, 1, protoModule.wireTypes.lengthDelimited)
			var1863, var2872 = protoModule.writeBuffer(var1863, var1864, var1862, buffer.len(var1862))
			buff = var1863
			var1861 = var1864
		end
	end
	local buff_1 = buffer.create(var1861)
	buffer.copy(buff_1, 0, buff, 0, var1861)
	
	return buff_1
end

function t_85.decode(p85)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var1865 = t_85.new()
	local var1866 = 0
	while var1866 < buffer.len(p85) do
		local _ = nil
		local var1867 = nil
		local var1868, var1869, var1870 = protoModule.readTag(p85, var1866)
		local var1871 = var1868
		var1867 = var1869
		var1866 = var1870
		
		if var1867 == protoModule.wireTypes.varint then
			local _ = nil
			local var1872, var1873 = protoModule.readVarInt(p85, var1866)
			local _ = var1872
			var1866 = var1873
			continue
		end
		if var1867 == protoModule.wireTypes.lengthDelimited then
			if var1871 == 1 then
				local _ = nil
				local var1874, var1875 = protoModule.readBuffer(p85, var1866)
				var1866 = var1875
				table.insert(var1865.options, t.UiScaledUDim2Prop_ConditionalOption.decode(var1874))
			else
				local _ = nil
				local var1876, var1877 = protoModule.readVarInt(p85, var1866)
				var1866 = var1877 + var1876
			end
		elseif var1867 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1878, var1879 = protoModule.readFixed32(p85, var1866)
			local _ = var1878
			var1866 = var1879
		elseif var1867 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1880, var1881 = protoModule.readFixed64(p85, var1866)
			local _ = var1880
			var1866 = var1881
		else
			error("Unsupported wire type: " .. var2876)
		end
	end
	return var1865
end

function t_85:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), t (ref)
	local var1882 = t_85.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var1882.options = t_1
	end
	return var1882
end

t_85.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDim2Prop_ConditionalOptions = t_85
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOptions)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p86)
	-- upvalues: t_86 (ref)
	return setmetatable({
		user_id = if p86 == nil or p86.user_id == nil then nil else p86.user_id,
		user_presence = if p86 == nil or p86.user_presence == nil then nil else p86.user_presence
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1883 = 0
	
	if self.user_id ~= nil then
		local var1884 = self.user_id:encode()
		local var1885, var1886 = protoModule.writeTag(buff, var1883, 1, protoModule.wireTypes.lengthDelimited)
		var1885, var2899 = protoModule.writeBuffer(var1885, var1886, var1884, buffer.len(var1884))
		buff = var1885
		var1883 = var1886
	end
	if self.user_presence ~= nil then
		local var1887 = self.user_presence:encode()
		local var1888, var1889 = protoModule.writeTag(buff, var1883, 2, protoModule.wireTypes.lengthDelimited)
		var1888, var2902 = protoModule.writeBuffer(var1888, var1889, var1887, buffer.len(var1887))
		buff = var1888
		var1883 = var1889
	end
	local buff_1 = buffer.create(var1883)
	buffer.copy(buff_1, 0, buff, 0, var1883)
	
	return buff_1
end

function t_86.decode(p86)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var1883 = t_86.new()
	local var1884 = 0
	while var1884 < buffer.len(p86) do
		local _ = nil
		local var1885 = nil
		local var1886, var1887, var1888 = protoModule.readTag(p86, var1884)
		local var1889 = var1886
		var1885 = var1887
		var1884 = var1888
		
		if var1885 == protoModule.wireTypes.varint then
			local _ = nil
			local var1890, var1891 = protoModule.readVarInt(p86, var1884)
			local _ = var1890
			var1884 = var1891
			continue
		end
		if var1885 == protoModule.wireTypes.lengthDelimited then
			if var1889 == 1 then
				local _ = nil
				local var1892, var1893 = protoModule.readBuffer(p86, var1884)
				var1884 = var1893
				var1883.user_id = t.Int64Prop.decode(var1892)
			elseif var1889 == 2 then
				local _ = nil
				local var1894, var1895 = protoModule.readBuffer(p86, var1884)
				var1884 = var1895
				var1883.user_presence = t.StringProp.decode(var1894)
			else
				local _ = nil
				local var1896, var1897 = protoModule.readVarInt(p86, var1884)
				var1884 = var1897 + var1896
			end
		elseif var1885 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1898, var1899 = protoModule.readFixed32(p86, var1884)
			local _ = var1898
			var1884 = var1899
		elseif var1885 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1900, var1901 = protoModule.readFixed64(p86, var1884)
			local _ = var1900
			var1884 = var1901
		else
			error("Unsupported wire type: " .. var2906)
		end
	end
	return var1883
end

function t_86:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.user_presence ~= nil then
		t.userPresence = self.user_presence:jsonEncode()
	end
	return t
end

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), t (ref)
	local var1902 = t_86.new()
	
	if self.user_id ~= nil then
		var1902.user_id = t.Int64Prop.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var1902.user_id = t.Int64Prop.jsonDecode(self.userId)
	end
	if self.user_presence ~= nil then
		var1902.user_presence = t.StringProp.jsonDecode(self.user_presence)
	end
	if self.userPresence ~= nil then
		var1902.user_presence = t.StringProp.jsonDecode(self.userPresence)
	end
	return var1902
end

t_86.descriptor = {
	name = "AvatarConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarConfigProp"
}
t.AvatarConfigProp = t_86
typeRegistryModule.default:register(t.AvatarConfigProp)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p87)
	-- upvalues: t_87 (ref)
	return setmetatable({
		oneof_prop = if p87 == nil or p87.oneof_prop == nil then nil else p87.oneof_prop
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1902 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "user_id" then
			local var1903 = self.oneof_prop.value:encode()
			local var1904, var1905 = protoModule.writeTag(buff, var1902, 1, protoModule.wireTypes.lengthDelimited)
			var1904, var2929 = protoModule.writeBuffer(var1904, var1905, var1903, buffer.len(var1903))
			buff = var1904
			var1902 = var1905
		elseif self.oneof_prop.type == "avatar_config" then
			local var1906 = self.oneof_prop.value:encode()
			local var1907, var1908 = protoModule.writeTag(buff, var1902, 2, protoModule.wireTypes.lengthDelimited)
			var1907, var2932 = protoModule.writeBuffer(var1907, var1908, var1906, buffer.len(var1906))
			buff = var1907
			var1902 = var1908
		end
	end
	local buff_1 = buffer.create(var1902)
	buffer.copy(buff_1, 0, buff, 0, var1902)
	
	return buff_1
end

function t_87.decode(p87)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var1902 = t_87.new()
	local var1903 = 0
	while var1903 < buffer.len(p87) do
		local _ = nil
		local var1904 = nil
		local var1905, var1906, var1907 = protoModule.readTag(p87, var1903)
		local var1908 = var1905
		var1904 = var1906
		var1903 = var1907
		
		if var1904 == protoModule.wireTypes.varint then
			local _ = nil
			local var1909, var1910 = protoModule.readVarInt(p87, var1903)
			local _ = var1909
			var1903 = var1910
			continue
		end
		if var1904 == protoModule.wireTypes.lengthDelimited then
			if var1908 == 1 then
				local _ = nil
				local var1911, var1912 = protoModule.readBuffer(p87, var1903)
				var1903 = var1912
				var1902.oneof_prop = { type = "user_id", value = t.Int64Prop.decode(var1911) }
			elseif var1908 == 2 then
				local _ = nil
				local var1913, var1914 = protoModule.readBuffer(p87, var1903)
				var1903 = var1914
				var1902.oneof_prop = {
					type = "avatar_config",
					value = t.AvatarConfigProp.decode(var1913)
				}
			else
				local _ = nil
				local var1915, var1916 = protoModule.readVarInt(p87, var1903)
				var1903 = var1916 + var1915
			end
		elseif var1904 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1917, var1918 = protoModule.readFixed32(p87, var1903)
			local _ = var1917
			var1903 = var1918
		elseif var1904 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1919, var1920 = protoModule.readFixed64(p87, var1903)
			local _ = var1919
			var1903 = var1920
		else
			error("Unsupported wire type: " .. var2936)
		end
	end
	return var1902
end

function t_87:jsonEncode()
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "user_id" then
			t.userId = self.oneof_prop.value:jsonEncode()
			
			return t
		elseif self.oneof_prop.type == "avatar_config" then
			t.avatarConfig = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function t_87:jsonDecode()
	-- upvalues: t_87 (ref), t (ref)
	local var1921 = t_87.new()
	
	if self.user_id ~= nil then
		var1921.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.user_id)
		}
	end
	if self.userId ~= nil then
		var1921.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.userId)
		}
	end
	if self.avatar_config ~= nil then
		var1921.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatar_config)
		}
	end
	if self.avatarConfig ~= nil then
		var1921.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatarConfig)
		}
	end
	return var1921
end

t_87.descriptor = {
	name = "AvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarProp"
}
t.AvatarProp = t_87
typeRegistryModule.default:register(t.AvatarProp)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p88)
	-- upvalues: t_88 (ref)
	return setmetatable({
		kind = if p88 == nil or p88.kind == nil then nil else p88.kind
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1921 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1922 = self.kind.value:encode()
			local var1923, var1924 = protoModule.writeTag(buff, var1921, 1, protoModule.wireTypes.lengthDelimited)
			var1923, var2959 = protoModule.writeBuffer(var1923, var1924, var1922, buffer.len(var1922))
			buff = var1923
			var1921 = var1924
		elseif self.kind.type == "binding_path" then
			local var1925, var1926 = protoModule.writeTag(buff, var1921, 2, protoModule.wireTypes.lengthDelimited)
			var1925, var2961 = protoModule.writeString(var1925, var1926, self.kind.value)
			buff = var1925
			var1921 = var1926
		elseif self.kind.type == "conditional" then
			local var1927 = self.kind.value:encode()
			local var1928, var1929 = protoModule.writeTag(buff, var1921, 3, protoModule.wireTypes.lengthDelimited)
			var1928, var2964 = protoModule.writeBuffer(var1928, var1929, var1927, buffer.len(var1927))
			buff = var1928
			var1921 = var1929
		elseif self.kind.type == "array_map" then
			local var1930 = self.kind.value:encode()
			local var1931, var1932 = protoModule.writeTag(buff, var1921, 4, protoModule.wireTypes.lengthDelimited)
			var1931, var2967 = protoModule.writeBuffer(var1931, var1932, var1930, buffer.len(var1930))
			buff = var1931
			var1921 = var1932
		end
	end
	local buff_1 = buffer.create(var1921)
	buffer.copy(buff_1, 0, buff, 0, var1921)
	
	return buff_1
end

function t_88.decode(p88)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var1921 = t_88.new()
	local var1922 = 0
	while var1922 < buffer.len(p88) do
		local _ = nil
		local var1923 = nil
		local var1924, var1925, var1926 = protoModule.readTag(p88, var1922)
		local var1927 = var1924
		var1923 = var1925
		var1922 = var1926
		
		if var1923 == protoModule.wireTypes.varint then
			local _ = nil
			local var1928, var1929 = protoModule.readVarInt(p88, var1922)
			local _ = var1928
			var1922 = var1929
			continue
		end
		if var1923 == protoModule.wireTypes.lengthDelimited then
			if var1927 == 1 then
				local _ = nil
				local var1930, var1931 = protoModule.readBuffer(p88, var1922)
				var1922 = var1931
				var1921.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var1930)
				}
			elseif var1927 == 2 then
				local _ = nil
				local var1932, var1933 = protoModule.readBuffer(p88, var1922)
				var1922 = var1933
				var1921.kind = { type = "binding_path", value = buffer.tostring(var1932) }
			elseif var1927 == 3 then
				local _ = nil
				local var1934, var1935 = protoModule.readBuffer(p88, var1922)
				var1922 = var1935
				var1921.kind = {
					type = "conditional",
					value = t.ArrayOfAvatarProp_ConditionalOptions.decode(var1934)
				}
			elseif var1927 == 4 then
				local _ = nil
				local var1936, var1937 = protoModule.readBuffer(p88, var1922)
				var1922 = var1937
				var1921.kind = {
					type = "array_map",
					value = t.ArrayOfAvatarProp_ArrayMap.decode(var1936)
				}
			else
				local _ = nil
				local var1938, var1939 = protoModule.readVarInt(p88, var1922)
				var1922 = var1939 + var1938
			end
		elseif var1923 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1940, var1941 = protoModule.readFixed32(p88, var1922)
			local _ = var1940
			var1922 = var1941
		elseif var1923 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1942, var1943 = protoModule.readFixed64(p88, var1922)
			local _ = var1942
			var1922 = var1943
		else
			error("Unsupported wire type: " .. var2971)
		end
	end
	return var1921
end

function t_88:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "array_map" then
			t.arrayMap = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_88:jsonDecode()
	-- upvalues: t_88 (ref), t (ref)
	local var1944 = t_88.new()
	
	if self.literal ~= nil then
		var1944.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1944.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1944.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var1944.kind = {
			type = "conditional",
			value = t.ArrayOfAvatarProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var1944.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var1944.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var1944
end

t_88.descriptor = {
	name = "ArrayOfAvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatarProp"
}
t.ArrayOfAvatarProp = t_88
typeRegistryModule.default:register(t.ArrayOfAvatarProp)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p89)
	-- upvalues: t_89 (ref)
	return setmetatable({
		condition = if p89 == nil or p89.condition == nil then nil else p89.condition,
		kind = if p89 == nil or p89.kind == nil then nil else p89.kind
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1944 = 0
	
	if self.condition ~= nil then
		local var1945 = self.condition:encode()
		local var1946, var1947 = protoModule.writeTag(buff, var1944, 1, protoModule.wireTypes.lengthDelimited)
		var1946, var2998 = protoModule.writeBuffer(var1946, var1947, var1945, buffer.len(var1945))
		buff = var1946
		var1944 = var1947
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1948 = self.kind.value:encode()
			local var1949, var1950 = protoModule.writeTag(buff, var1944, 2, protoModule.wireTypes.lengthDelimited)
			var1949, var3001 = protoModule.writeBuffer(var1949, var1950, var1948, buffer.len(var1948))
			buff = var1949
			var1944 = var1950
		elseif self.kind.type == "binding_path" then
			local var1951, var1952 = protoModule.writeTag(buff, var1944, 3, protoModule.wireTypes.lengthDelimited)
			var1951, var3003 = protoModule.writeString(var1951, var1952, self.kind.value)
			buff = var1951
			var1944 = var1952
		end
	end
	local buff_1 = buffer.create(var1944)
	buffer.copy(buff_1, 0, buff, 0, var1944)
	
	return buff_1
end

function t_89.decode(p89)
	-- upvalues: t_89 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1944 = t_89.new()
	local var1945 = 0
	while var1945 < buffer.len(p89) do
		local _ = nil
		local var1946 = nil
		local var1947, var1948, var1949 = protoModule.readTag(p89, var1945)
		local var1950 = var1947
		var1946 = var1948
		var1945 = var1949
		
		if var1946 == protoModule.wireTypes.varint then
			local _ = nil
			local var1951, var1952 = protoModule.readVarInt(p89, var1945)
			local _ = var1951
			var1945 = var1952
			continue
		end
		if var1946 == protoModule.wireTypes.lengthDelimited then
			if var1950 == 1 then
				local _ = nil
				local var1953, var1954 = protoModule.readBuffer(p89, var1945)
				var1945 = var1954
				var1944.condition = propConditionModule.PropCondition.decode(var1953)
			elseif var1950 == 2 then
				local _ = nil
				local var1955, var1956 = protoModule.readBuffer(p89, var1945)
				var1945 = var1956
				var1944.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var1955)
				}
			elseif var1950 == 3 then
				local _ = nil
				local var1957, var1958 = protoModule.readBuffer(p89, var1945)
				var1945 = var1958
				var1944.kind = { type = "binding_path", value = buffer.tostring(var1957) }
			else
				local _ = nil
				local var1959, var1960 = protoModule.readVarInt(p89, var1945)
				var1945 = var1960 + var1959
			end
		elseif var1946 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1961, var1962 = protoModule.readFixed32(p89, var1945)
			local _ = var1961
			var1945 = var1962
		elseif var1946 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1963, var1964 = protoModule.readFixed64(p89, var1945)
			local _ = var1963
			var1945 = var1964
		else
			error("Unsupported wire type: " .. var3007)
		end
	end
	return var1944
end

function t_89:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), propConditionModule (ref), t (ref)
	local var1965 = t_89.new()
	
	if self.condition ~= nil then
		var1965.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1965.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var1965.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1965.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1965
end

t_89.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfAvatarProp_ConditionalOption = t_89
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOption)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p90)
	-- upvalues: t_90 (ref)
	return setmetatable({
		options = if p90 == nil or p90.options == nil then {} else p90.options
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1965 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1966 = v:encode()
			local var1967, var1968 = protoModule.writeTag(buff, var1965, 1, protoModule.wireTypes.lengthDelimited)
			var1967, var3032 = protoModule.writeBuffer(var1967, var1968, var1966, buffer.len(var1966))
			buff = var1967
			var1965 = var1968
		end
	end
	local buff_1 = buffer.create(var1965)
	buffer.copy(buff_1, 0, buff, 0, var1965)
	
	return buff_1
end

function t_90.decode(p90)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var1969 = t_90.new()
	local var1970 = 0
	while var1970 < buffer.len(p90) do
		local _ = nil
		local var1971 = nil
		local var1972, var1973, var1974 = protoModule.readTag(p90, var1970)
		local var1975 = var1972
		var1971 = var1973
		var1970 = var1974
		
		if var1971 == protoModule.wireTypes.varint then
			local _ = nil
			local var1976, var1977 = protoModule.readVarInt(p90, var1970)
			local _ = var1976
			var1970 = var1977
			continue
		end
		if var1971 == protoModule.wireTypes.lengthDelimited then
			if var1975 == 1 then
				local _ = nil
				local var1978, var1979 = protoModule.readBuffer(p90, var1970)
				var1970 = var1979
				table.insert(var1969.options, t.ArrayOfAvatarProp_ConditionalOption.decode(var1978))
			else
				local _ = nil
				local var1980, var1981 = protoModule.readVarInt(p90, var1970)
				var1970 = var1981 + var1980
			end
		elseif var1971 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1982, var1983 = protoModule.readFixed32(p90, var1970)
			local _ = var1982
			var1970 = var1983
		elseif var1971 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1984, var1985 = protoModule.readFixed64(p90, var1970)
			local _ = var1984
			var1970 = var1985
		else
			error("Unsupported wire type: " .. var3036)
		end
	end
	return var1969
end

function t_90:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_90:jsonDecode()
	-- upvalues: t_90 (ref), t (ref)
	local var1986 = t_90.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfAvatarProp_ConditionalOption.jsonDecode(v))
		end
		var1986.options = t_1
	end
	return var1986
end

t_90.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfAvatarProp_ConditionalOptions = t_90
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOptions)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p91)
	-- upvalues: t_91 (ref)
	return setmetatable({
		array = if p91 == nil or p91.array == nil then {} else p91.array
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1987 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var1988 = v:encode()
			local var1989, var1990 = protoModule.writeTag(buff, var1987, 1, protoModule.wireTypes.lengthDelimited)
			var1989, var3059 = protoModule.writeBuffer(var1989, var1990, var1988, buffer.len(var1988))
			buff = var1989
			var1987 = var1990
		end
	end
	local buff_1 = buffer.create(var1987)
	buffer.copy(buff_1, 0, buff, 0, var1987)
	
	return buff_1
end

function t_91.decode(p91)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var1991 = t_91.new()
	local var1992 = 0
	while var1992 < buffer.len(p91) do
		local _ = nil
		local var1993 = nil
		local var1994, var1995, var1996 = protoModule.readTag(p91, var1992)
		local var1997 = var1994
		var1993 = var1995
		var1992 = var1996
		
		if var1993 == protoModule.wireTypes.varint then
			local _ = nil
			local var1998, var1999 = protoModule.readVarInt(p91, var1992)
			local _ = var1998
			var1992 = var1999
			continue
		end
		if var1993 == protoModule.wireTypes.lengthDelimited then
			if var1997 == 1 then
				local _ = nil
				local var2000, var2001 = protoModule.readBuffer(p91, var1992)
				var1992 = var2001
				table.insert(var1991.array, t.AvatarProp.decode(var2000))
			else
				local _ = nil
				local var2002, var2003 = protoModule.readVarInt(p91, var1992)
				var1992 = var2003 + var2002
			end
		elseif var1993 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2004, var2005 = protoModule.readFixed32(p91, var1992)
			local _ = var2004
			var1992 = var2005
		elseif var1993 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2006, var2007 = protoModule.readFixed64(p91, var1992)
			local _ = var2006
			var1992 = var2007
		else
			error("Unsupported wire type: " .. var3063)
		end
	end
	return var1991
end

function t_91:jsonEncode()
	local t = {}
	
	if self.array ~= nil and #self.array > 0 then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, v:jsonEncode())
		end
		t.array = t_1
	end
	return t
end

function t_91:jsonDecode()
	-- upvalues: t_91 (ref), t (ref)
	local var2008 = t_91.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.AvatarProp.jsonDecode(v))
		end
		var2008.array = t_1
	end
	return var2008
end

t_91.descriptor = {
	name = "ArrayOfAvatarProp_ArrayOfAvatars",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatars"
}
t.ArrayOfAvatarProp_ArrayOfAvatars = t_91
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayOfAvatars)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p92)
	-- upvalues: t_92 (ref)
	return setmetatable({
		kind = if p92 == nil or p92.kind == nil then nil else p92.kind,
		item_hydration_specs = if p92 == nil or p92.item_hydration_specs == nil then {} else p92.item_hydration_specs,
		field_map = if p92 == nil or p92.field_map == nil then nil else p92.field_map
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2009 = 0
	
	if self.kind ~= nil and self.kind.type == "binding_path" then
		local var2010, var2011 = protoModule.writeTag(buff, var2009, 1, protoModule.wireTypes.lengthDelimited)
		var2010, var3085 = protoModule.writeString(var2010, var2011, self.kind.value)
		buff = var2010
		var2009 = var2011
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var2012 = v:encode()
			local var2013, var2014 = protoModule.writeTag(buff, var2009, 3, protoModule.wireTypes.lengthDelimited)
			var2013, var3088 = protoModule.writeBuffer(var2013, var2014, var2012, buffer.len(var2012))
			buff = var2013
			var2009 = var2014
		end
	end
	if self.field_map ~= nil then
		local var2015 = self.field_map:encode()
		local var2016, var2017 = protoModule.writeTag(buff, var2009, 4, protoModule.wireTypes.lengthDelimited)
		var2016, var3091 = protoModule.writeBuffer(var2016, var2017, var2015, buffer.len(var2015))
		buff = var2016
		var2009 = var2017
	end
	local buff_1 = buffer.create(var2009)
	buffer.copy(buff_1, 0, buff, 0, var2009)
	
	return buff_1
end

function t_92.decode(p92)
	-- upvalues: t_92 (ref), protoModule (ref), hydrationDataSpecModule (ref), t (ref)
	local var2018 = t_92.new()
	local var2019 = 0
	while var2019 < buffer.len(p92) do
		local _ = nil
		local var2020 = nil
		local var2021, var2022, var2023 = protoModule.readTag(p92, var2019)
		local var2024 = var2021
		var2020 = var2022
		var2019 = var2023
		
		if var2020 == protoModule.wireTypes.varint then
			local _ = nil
			local var2025, var2026 = protoModule.readVarInt(p92, var2019)
			local _ = var2025
			var2019 = var2026
			continue
		end
		if var2020 == protoModule.wireTypes.lengthDelimited then
			if var2024 == 1 then
				local _ = nil
				local var2027, var2028 = protoModule.readBuffer(p92, var2019)
				var2019 = var2028
				var2018.kind = { type = "binding_path", value = buffer.tostring(var2027) }
			elseif var2024 == 3 then
				local _ = nil
				local var2029, var2030 = protoModule.readBuffer(p92, var2019)
				var2019 = var2030
				table.insert(var2018.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var2029))
			elseif var2024 == 4 then
				local _ = nil
				local var2031, var2032 = protoModule.readBuffer(p92, var2019)
				var2019 = var2032
				var2018.field_map = t.AvatarConfigProp.decode(var2031)
			else
				local _ = nil
				local var2033, var2034 = protoModule.readVarInt(p92, var2019)
				var2019 = var2034 + var2033
			end
		elseif var2020 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2035, var2036 = protoModule.readFixed32(p92, var2019)
			local _ = var2035
			var2019 = var2036
		elseif var2020 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2037, var2038 = protoModule.readFixed64(p92, var2019)
			local _ = var2037
			var2019 = var2038
		else
			error("Unsupported wire type: " .. var3095)
		end
	end
	return var2018
end

function t_92:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "binding_path" then
		t.bindingPath = self.kind.value
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, v:jsonEncode())
		end
		t.itemHydrationSpecs = t_1
	end
	if self.field_map ~= nil then
		t.fieldMap = self.field_map:jsonEncode()
	end
	return t
end

function t_92:jsonDecode()
	-- upvalues: t_92 (ref), hydrationDataSpecModule (ref), t (ref)
	local var2039 = t_92.new()
	
	if self.binding_path ~= nil then
		var2039.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2039.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var2039.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var2039.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var2039.field_map = t.AvatarConfigProp.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var2039.field_map = t.AvatarConfigProp.jsonDecode(self.fieldMap)
	end
	return var2039
end

t_92.descriptor = {
	name = "ArrayOfAvatarProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfAvatarProp_ArrayMap = t_92
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayMap)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p93)
	-- upvalues: t_93 (ref)
	return setmetatable({
		kind = if p93 == nil or p93.kind == nil then nil else p93.kind
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2040 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2041, var2042 = protoModule.writeTag(buff, var2040, 1, protoModule.wireTypes.varint)
			var2041, var3122 = protoModule.writeVarInt(var2041, var2042, t.ScaleBasis.toNumber(self.kind.value))
			buff = var2041
			var2040 = var2042
		elseif self.kind.type == "binding_path" then
			local var2043, var2044 = protoModule.writeTag(buff, var2040, 2, protoModule.wireTypes.lengthDelimited)
			var2043, var3124 = protoModule.writeString(var2043, var2044, self.kind.value)
			buff = var2043
			var2040 = var2044
		elseif self.kind.type == "conditional" then
			local var2045 = self.kind.value:encode()
			local var2046, var2047 = protoModule.writeTag(buff, var2040, 3, protoModule.wireTypes.lengthDelimited)
			var2046, var3127 = protoModule.writeBuffer(var2046, var2047, var2045, buffer.len(var2045))
			buff = var2046
			var2040 = var2047
		end
	end
	local buff_1 = buffer.create(var2040)
	buffer.copy(buff_1, 0, buff, 0, var2040)
	
	return buff_1
end

function t_93.decode(p93)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var2040 = t_93.new()
	local var2041 = 0
	while var2041 < buffer.len(p93) do
		local _ = nil
		local var2042 = nil
		local var2043, var2044, var2045 = protoModule.readTag(p93, var2041)
		local var2046 = var2043
		var2042 = var2044
		var2041 = var2045
		
		if var2042 == protoModule.wireTypes.varint then
			if var2046 == 1 then
				local _ = nil
				local var2047, var2048 = protoModule.readVarIntI32(p93, var2041)
				local var2049 = var2047
				var2041 = var2048
				var2040.kind = {
					type = "literal",
					value = t.ScaleBasis.fromNumber(var2049) or var2049
				}
			else
				local _ = nil
				local var2050, var2051 = protoModule.readVarInt(p93, var2041)
				local _ = var2050
				var2041 = var2051
			end
		end
		if var2042 == protoModule.wireTypes.lengthDelimited then
			if var2046 == 2 then
				local _ = nil
				local var2052, var2053 = protoModule.readBuffer(p93, var2041)
				var2041 = var2053
				var2040.kind = { type = "binding_path", value = buffer.tostring(var2052) }
			elseif var2046 == 3 then
				local _ = nil
				local var2054, var2055 = protoModule.readBuffer(p93, var2041)
				var2041 = var2055
				var2040.kind = {
					type = "conditional",
					value = t.ScaleBasisProp_ConditionalOptions.decode(var2054)
				}
			else
				local _ = nil
				local var2056, var2057 = protoModule.readVarInt(p93, var2041)
				var2041 = var2057 + var2056
			end
		elseif var2042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2058, var2059 = protoModule.readFixed32(p93, var2041)
			local _ = var2058
			var2041 = var2059
		elseif var2042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2060, var2061 = protoModule.readFixed64(p93, var2041)
			local _ = var2060
			var2041 = var2061
		else
			error("Unsupported wire type: " .. var3131)
		end
	end
	return var2040
end

function t_93:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.ScaleBasis.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
			
			return t_1
		elseif self.kind.type == "conditional" then
			t_1.conditional = self.kind.value:jsonEncode()
		end
	end
	return t_1
end

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), t (ref)
	local var2062 = t_93.new()
	
	if self.literal ~= nil then
		var2062.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleBasis.fromNumber(self.literal) or self.literal else t.ScaleBasis.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var2062.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2062.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2062.kind = {
			type = "conditional",
			value = t.ScaleBasisProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2062
end

t_93.descriptor = {
	name = "ScaleBasisProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ScaleBasisProp"
}
t.ScaleBasisProp = t_93
typeRegistryModule.default:register(t.ScaleBasisProp)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p94)
	-- upvalues: t_94 (ref)
	return setmetatable({
		condition = if p94 == nil or p94.condition == nil then nil else p94.condition,
		kind = if p94 == nil or p94.kind == nil then nil else p94.kind
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2062 = 0
	
	if self.condition ~= nil then
		local var2063 = self.condition:encode()
		local var2064, var2065 = protoModule.writeTag(buff, var2062, 1, protoModule.wireTypes.lengthDelimited)
		var2064, var3157 = protoModule.writeBuffer(var2064, var2065, var2063, buffer.len(var2063))
		buff = var2064
		var2062 = var2065
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2066, var2067 = protoModule.writeTag(buff, var2062, 2, protoModule.wireTypes.varint)
			var2066, var3159 = protoModule.writeVarInt(var2066, var2067, t.ScaleBasis.toNumber(self.kind.value))
			buff = var2066
			var2062 = var2067
		elseif self.kind.type == "binding_path" then
			local var2068, var2069 = protoModule.writeTag(buff, var2062, 3, protoModule.wireTypes.lengthDelimited)
			var2068, var3161 = protoModule.writeString(var2068, var2069, self.kind.value)
			buff = var2068
			var2062 = var2069
		end
	end
	local buff_1 = buffer.create(var2062)
	buffer.copy(buff_1, 0, buff, 0, var2062)
	
	return buff_1
end

function t_94.decode(p94)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var2062 = t_94.new()
	local var2063 = 0
	while var2063 < buffer.len(p94) do
		local _ = nil
		local var2064 = nil
		local var2065, var2066, var2067 = protoModule.readTag(p94, var2063)
		local var2068 = var2065
		var2064 = var2066
		var2063 = var2067
		
		if var2064 == protoModule.wireTypes.varint then
			if var2068 == 2 then
				local _ = nil
				local var2069, var2070 = protoModule.readVarIntI32(p94, var2063)
				local var2071 = var2069
				var2063 = var2070
				var2062.kind = {
					type = "literal",
					value = t.ScaleBasis.fromNumber(var2071) or var2071
				}
			else
				local _ = nil
				local var2072, var2073 = protoModule.readVarInt(p94, var2063)
				local _ = var2072
				var2063 = var2073
			end
		end
		if var2064 == protoModule.wireTypes.lengthDelimited then
			if var2068 == 1 then
				local _ = nil
				local var2074, var2075 = protoModule.readBuffer(p94, var2063)
				var2063 = var2075
				var2062.condition = propConditionModule.PropCondition.decode(var2074)
			elseif var2068 == 3 then
				local _ = nil
				local var2076, var2077 = protoModule.readBuffer(p94, var2063)
				var2063 = var2077
				var2062.kind = { type = "binding_path", value = buffer.tostring(var2076) }
			else
				local _ = nil
				local var2078, var2079 = protoModule.readVarInt(p94, var2063)
				var2063 = var2079 + var2078
			end
		elseif var2064 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2080, var2081 = protoModule.readFixed32(p94, var2063)
			local _ = var2080
			var2063 = var2081
		elseif var2064 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2082, var2083 = protoModule.readFixed64(p94, var2063)
			local _ = var2082
			var2063 = var2083
		else
			error("Unsupported wire type: " .. var3165)
		end
	end
	return var2062
end

function t_94:jsonEncode()
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.condition ~= nil then
		t_1.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t_1.literal = if typeof(self.kind.value) == "number" then self.kind.value else t.ScaleBasis.toNumber(self.kind.value)
			
			return t_1
		elseif self.kind.type == "binding_path" then
			t_1.bindingPath = self.kind.value
		end
	end
	return t_1
end

function t_94:jsonDecode()
	-- upvalues: t_94 (ref), propConditionModule (ref), t (ref)
	local var2084 = t_94.new()
	
	if self.condition ~= nil then
		var2084.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2084.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleBasis.fromNumber(self.literal) or self.literal else t.ScaleBasis.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var2084.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2084.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2084
end

t_94.descriptor = {
	name = "ScaleBasisProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ScaleBasisProp_ConditionalOption = t_94
typeRegistryModule.default:register(t.ScaleBasisProp_ConditionalOption)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p95)
	-- upvalues: t_95 (ref)
	return setmetatable({
		options = if p95 == nil or p95.options == nil then {} else p95.options
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2084 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2085 = v:encode()
			local var2086, var2087 = protoModule.writeTag(buff, var2084, 1, protoModule.wireTypes.lengthDelimited)
			var2086, var3191 = protoModule.writeBuffer(var2086, var2087, var2085, buffer.len(var2085))
			buff = var2086
			var2084 = var2087
		end
	end
	local buff_1 = buffer.create(var2084)
	buffer.copy(buff_1, 0, buff, 0, var2084)
	
	return buff_1
end

function t_95.decode(p95)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var2088 = t_95.new()
	local var2089 = 0
	while var2089 < buffer.len(p95) do
		local _ = nil
		local var2090 = nil
		local var2091, var2092, var2093 = protoModule.readTag(p95, var2089)
		local var2094 = var2091
		var2090 = var2092
		var2089 = var2093
		
		if var2090 == protoModule.wireTypes.varint then
			local _ = nil
			local var2095, var2096 = protoModule.readVarInt(p95, var2089)
			local _ = var2095
			var2089 = var2096
			continue
		end
		if var2090 == protoModule.wireTypes.lengthDelimited then
			if var2094 == 1 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p95, var2089)
				var2089 = var2098
				table.insert(var2088.options, t.ScaleBasisProp_ConditionalOption.decode(var2097))
			else
				local _ = nil
				local var2099, var2100 = protoModule.readVarInt(p95, var2089)
				var2089 = var2100 + var2099
			end
		elseif var2090 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2101, var2102 = protoModule.readFixed32(p95, var2089)
			local _ = var2101
			var2089 = var2102
		elseif var2090 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2103, var2104 = protoModule.readFixed64(p95, var2089)
			local _ = var2103
			var2089 = var2104
		else
			error("Unsupported wire type: " .. var3195)
		end
	end
	return var2088
end

function t_95:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_95:jsonDecode()
	-- upvalues: t_95 (ref), t (ref)
	local var2105 = t_95.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ScaleBasisProp_ConditionalOption.jsonDecode(v))
		end
		var2105.options = t_1
	end
	return var2105
end

t_95.descriptor = {
	name = "ScaleBasisProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ScaleBasisProp_ConditionalOptions = t_95
typeRegistryModule.default:register(t.ScaleBasisProp_ConditionalOptions)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p96)
	-- upvalues: t_96 (ref)
	return setmetatable({
		kind = if p96 == nil or p96.kind == nil then nil else p96.kind
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2106 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2107 = self.kind.value:encode()
			local var2108, var2109 = protoModule.writeTag(buff, var2106, 1, protoModule.wireTypes.lengthDelimited)
			var2108, var3218 = protoModule.writeBuffer(var2108, var2109, var2107, buffer.len(var2107))
			buff = var2108
			var2106 = var2109
		elseif self.kind.type == "binding_path" then
			local var2110, var2111 = protoModule.writeTag(buff, var2106, 2, protoModule.wireTypes.lengthDelimited)
			var2110, var3220 = protoModule.writeString(var2110, var2111, self.kind.value)
			buff = var2110
			var2106 = var2111
		elseif self.kind.type == "conditional" then
			local var2112 = self.kind.value:encode()
			local var2113, var2114 = protoModule.writeTag(buff, var2106, 3, protoModule.wireTypes.lengthDelimited)
			var2113, var3223 = protoModule.writeBuffer(var2113, var2114, var2112, buffer.len(var2112))
			buff = var2113
			var2106 = var2114
		end
	end
	local buff_1 = buffer.create(var2106)
	buffer.copy(buff_1, 0, buff, 0, var2106)
	
	return buff_1
end

function t_96.decode(p96)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var2106 = t_96.new()
	local var2107 = 0
	while var2107 < buffer.len(p96) do
		local _ = nil
		local var2108 = nil
		local var2109, var2110, var2111 = protoModule.readTag(p96, var2107)
		local var2112 = var2109
		var2108 = var2110
		var2107 = var2111
		
		if var2108 == protoModule.wireTypes.varint then
			local _ = nil
			local var2113, var2114 = protoModule.readVarInt(p96, var2107)
			local _ = var2113
			var2107 = var2114
			continue
		end
		if var2108 == protoModule.wireTypes.lengthDelimited then
			if var2112 == 1 then
				local _ = nil
				local var2115, var2116 = protoModule.readBuffer(p96, var2107)
				var2107 = var2116
				var2106.kind = {
					type = "literal",
					value = t.StringArrayProp_LiteralValue.decode(var2115)
				}
			elseif var2112 == 2 then
				local _ = nil
				local var2117, var2118 = protoModule.readBuffer(p96, var2107)
				var2107 = var2118
				var2106.kind = { type = "binding_path", value = buffer.tostring(var2117) }
			elseif var2112 == 3 then
				local _ = nil
				local var2119, var2120 = protoModule.readBuffer(p96, var2107)
				var2107 = var2120
				var2106.kind = {
					type = "conditional",
					value = t.StringArrayProp_ConditionalOptions.decode(var2119)
				}
			else
				local _ = nil
				local var2121, var2122 = protoModule.readVarInt(p96, var2107)
				var2107 = var2122 + var2121
			end
		elseif var2108 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2123, var2124 = protoModule.readFixed32(p96, var2107)
			local _ = var2123
			var2107 = var2124
		elseif var2108 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2125, var2126 = protoModule.readFixed64(p96, var2107)
			local _ = var2125
			var2107 = var2126
		else
			error("Unsupported wire type: " .. var3227)
		end
	end
	return var2106
end

function t_96:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_96:jsonDecode()
	-- upvalues: t_96 (ref), t (ref)
	local var2127 = t_96.new()
	
	if self.literal ~= nil then
		var2127.kind = {
			type = "literal",
			value = t.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2127.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2127.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2127.kind = {
			type = "conditional",
			value = t.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2127
end

t_96.descriptor = {
	name = "StringArrayProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringArrayProp"
}
t.StringArrayProp = t_96
typeRegistryModule.default:register(t.StringArrayProp)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p97)
	-- upvalues: t_97 (ref)
	return setmetatable({
		items = if p97 == nil or p97.items == nil then {} else p97.items
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2127 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2128, var2129 = protoModule.writeTag(buff, var2127, 1, protoModule.wireTypes.lengthDelimited)
			var2128, var3251 = protoModule.writeString(var2128, var2129, v)
			buff = var2128
			var2127 = var2129
		end
	end
	local buff_1 = buffer.create(var2127)
	buffer.copy(buff_1, 0, buff, 0, var2127)
	
	return buff_1
end

function t_97.decode(p97)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var2130 = t_97.new()
	local var2131 = 0
	while var2131 < buffer.len(p97) do
		local _ = nil
		local var2132 = nil
		local var2133, var2134, var2135 = protoModule.readTag(p97, var2131)
		local var2136 = var2133
		var2132 = var2134
		var2131 = var2135
		
		if var2132 == protoModule.wireTypes.varint then
			local _ = nil
			local var2137, var2138 = protoModule.readVarInt(p97, var2131)
			local _ = var2137
			var2131 = var2138
			continue
		end
		if var2132 == protoModule.wireTypes.lengthDelimited then
			if var2136 == 1 then
				local _ = nil
				local var2139, var2140 = protoModule.readBuffer(p97, var2131)
				var2131 = var2140
				table.insert(var2130.items, buffer.tostring(var2139))
			else
				local _ = nil
				local var2141, var2142 = protoModule.readVarInt(p97, var2131)
				var2131 = var2142 + var2141
			end
		elseif var2132 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2143, var2144 = protoModule.readFixed32(p97, var2131)
			local _ = var2143
			var2131 = var2144
		elseif var2132 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2145, var2146 = protoModule.readFixed64(p97, var2131)
			local _ = var2145
			var2131 = var2146
		else
			error("Unsupported wire type: " .. var3255)
		end
	end
	return var2130
end

function t_97:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v)
		end
		t.items = t_1
	end
	return t
end

function t_97:jsonDecode()
	-- upvalues: t_97 (ref)
	local var2147 = t_97.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var2147.items = t
	end
	return var2147
end

t_97.descriptor = {
	name = "StringArrayProp_LiteralValue",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
}
t.StringArrayProp_LiteralValue = t_97
typeRegistryModule.default:register(t.StringArrayProp_LiteralValue)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p98)
	-- upvalues: t_98 (ref)
	return setmetatable({
		condition = if p98 == nil or p98.condition == nil then nil else p98.condition,
		kind = if p98 == nil or p98.kind == nil then nil else p98.kind
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2148 = 0
	
	if self.condition ~= nil then
		local var2149 = self.condition:encode()
		local var2150, var2151 = protoModule.writeTag(buff, var2148, 1, protoModule.wireTypes.lengthDelimited)
		var2150, var3278 = protoModule.writeBuffer(var2150, var2151, var2149, buffer.len(var2149))
		buff = var2150
		var2148 = var2151
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2152 = self.kind.value:encode()
			local var2153, var2154 = protoModule.writeTag(buff, var2148, 2, protoModule.wireTypes.lengthDelimited)
			var2153, var3281 = protoModule.writeBuffer(var2153, var2154, var2152, buffer.len(var2152))
			buff = var2153
			var2148 = var2154
		elseif self.kind.type == "binding_path" then
			local var2155, var2156 = protoModule.writeTag(buff, var2148, 3, protoModule.wireTypes.lengthDelimited)
			var2155, var3283 = protoModule.writeString(var2155, var2156, self.kind.value)
			buff = var2155
			var2148 = var2156
		elseif self.kind.type == "conditional" then
			local var2157 = self.kind.value:encode()
			local var2158, var2159 = protoModule.writeTag(buff, var2148, 4, protoModule.wireTypes.lengthDelimited)
			var2158, var3286 = protoModule.writeBuffer(var2158, var2159, var2157, buffer.len(var2157))
			buff = var2158
			var2148 = var2159
		end
	end
	local buff_1 = buffer.create(var2148)
	buffer.copy(buff_1, 0, buff, 0, var2148)
	
	return buff_1
end

function t_98.decode(p98)
	-- upvalues: t_98 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2148 = t_98.new()
	local var2149 = 0
	while var2149 < buffer.len(p98) do
		local _ = nil
		local var2150 = nil
		local var2151, var2152, var2153 = protoModule.readTag(p98, var2149)
		local var2154 = var2151
		var2150 = var2152
		var2149 = var2153
		
		if var2150 == protoModule.wireTypes.varint then
			local _ = nil
			local var2155, var2156 = protoModule.readVarInt(p98, var2149)
			local _ = var2155
			var2149 = var2156
			continue
		end
		if var2150 == protoModule.wireTypes.lengthDelimited then
			if var2154 == 1 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p98, var2149)
				var2149 = var2158
				var2148.condition = propConditionModule.PropCondition.decode(var2157)
			elseif var2154 == 2 then
				local _ = nil
				local var2159, var2160 = protoModule.readBuffer(p98, var2149)
				var2149 = var2160
				var2148.kind = {
					type = "literal",
					value = t.StringArrayProp_LiteralValue.decode(var2159)
				}
			elseif var2154 == 3 then
				local _ = nil
				local var2161, var2162 = protoModule.readBuffer(p98, var2149)
				var2149 = var2162
				var2148.kind = { type = "binding_path", value = buffer.tostring(var2161) }
			elseif var2154 == 4 then
				local _ = nil
				local var2163, var2164 = protoModule.readBuffer(p98, var2149)
				var2149 = var2164
				var2148.kind = {
					type = "conditional",
					value = t.StringArrayProp_ConditionalOptions.decode(var2163)
				}
			else
				local _ = nil
				local var2165, var2166 = protoModule.readVarInt(p98, var2149)
				var2149 = var2166 + var2165
			end
		elseif var2150 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2167, var2168 = protoModule.readFixed32(p98, var2149)
			local _ = var2167
			var2149 = var2168
		elseif var2150 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2169, var2170 = protoModule.readFixed64(p98, var2149)
			local _ = var2169
			var2149 = var2170
		else
			error("Unsupported wire type: " .. var3290)
		end
	end
	return var2148
end

function t_98:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_98:jsonDecode()
	-- upvalues: t_98 (ref), propConditionModule (ref), t (ref)
	local var2171 = t_98.new()
	
	if self.condition ~= nil then
		var2171.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2171.kind = {
			type = "literal",
			value = t.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2171.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2171.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2171.kind = {
			type = "conditional",
			value = t.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2171
end

t_98.descriptor = {
	name = "StringArrayProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StringArrayProp_ConditionalOption = t_98
typeRegistryModule.default:register(t.StringArrayProp_ConditionalOption)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p99)
	-- upvalues: t_99 (ref)
	return setmetatable({
		options = if p99 == nil or p99.options == nil then {} else p99.options
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2171 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2172 = v:encode()
			local var2173, var2174 = protoModule.writeTag(buff, var2171, 1, protoModule.wireTypes.lengthDelimited)
			var2173, var3317 = protoModule.writeBuffer(var2173, var2174, var2172, buffer.len(var2172))
			buff = var2173
			var2171 = var2174
		end
	end
	local buff_1 = buffer.create(var2171)
	buffer.copy(buff_1, 0, buff, 0, var2171)
	
	return buff_1
end

function t_99.decode(p99)
	-- upvalues: t_99 (ref), protoModule (ref), t (ref)
	local var2175 = t_99.new()
	local var2176 = 0
	while var2176 < buffer.len(p99) do
		local _ = nil
		local var2177 = nil
		local var2178, var2179, var2180 = protoModule.readTag(p99, var2176)
		local var2181 = var2178
		var2177 = var2179
		var2176 = var2180
		
		if var2177 == protoModule.wireTypes.varint then
			local _ = nil
			local var2182, var2183 = protoModule.readVarInt(p99, var2176)
			local _ = var2182
			var2176 = var2183
			continue
		end
		if var2177 == protoModule.wireTypes.lengthDelimited then
			if var2181 == 1 then
				local _ = nil
				local var2184, var2185 = protoModule.readBuffer(p99, var2176)
				var2176 = var2185
				table.insert(var2175.options, t.StringArrayProp_ConditionalOption.decode(var2184))
			else
				local _ = nil
				local var2186, var2187 = protoModule.readVarInt(p99, var2176)
				var2176 = var2187 + var2186
			end
		elseif var2177 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2188, var2189 = protoModule.readFixed32(p99, var2176)
			local _ = var2188
			var2176 = var2189
		elseif var2177 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2190, var2191 = protoModule.readFixed64(p99, var2176)
			local _ = var2190
			var2176 = var2191
		else
			error("Unsupported wire type: " .. var3321)
		end
	end
	return var2175
end

function t_99:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref), t (ref)
	local var2192 = t_99.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StringArrayProp_ConditionalOption.jsonDecode(v))
		end
		var2192.options = t_1
	end
	return var2192
end

t_99.descriptor = {
	name = "StringArrayProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StringArrayProp_ConditionalOptions = t_99
typeRegistryModule.default:register(t.StringArrayProp_ConditionalOptions)
t.ScaleBasis = {
	fromNumber = function(p100)
		return if p100 == 0 then "SCALE_BASIS_INVALID" elseif p100 == 1 then "SCALE_BASIS_PARENT" elseif p100 == 2 then "SCALE_BASIS_VIEWPORT" else nil
	end,
	toNumber = function(p100)
		return if p100 == "SCALE_BASIS_INVALID" then 0 elseif p100 == "SCALE_BASIS_PARENT" then 1 elseif p100 == "SCALE_BASIS_VIEWPORT" then 2 else p100
	end,
	fromName = function(p100)
		return if p100 == "SCALE_BASIS_INVALID" then "SCALE_BASIS_INVALID" elseif p100 == "SCALE_BASIS_PARENT" then "SCALE_BASIS_PARENT" elseif p100 == "SCALE_BASIS_VIEWPORT" then "SCALE_BASIS_VIEWPORT" else nil
	end
}

return {
	TranslationRef = t.TranslationRef,
	StringFormat = t.StringFormat,
	StringFormat_FormatArg = t.StringFormat_FormatArg,
	StringFormat_FormatArg_Formatter = t.StringFormat_FormatArg_Formatter,
	StringFormat_FormatArg_Formatter_DateConfig = t.StringFormat_FormatArg_Formatter_DateConfig,
	StringFormat_FormatArg_Formatter_Type = t.StringFormat_FormatArg_Formatter_Type,
	StringProp = t.StringProp,
	StringProp_ConditionalOption = t.StringProp_ConditionalOption,
	StringProp_ConditionalOptions = t.StringProp_ConditionalOptions,
	FloatProp = t.FloatProp,
	FloatProp_ConditionalOption = t.FloatProp_ConditionalOption,
	FloatProp_ConditionalOptions = t.FloatProp_ConditionalOptions,
	DoubleProp = t.DoubleProp,
	DoubleProp_ConditionalOption = t.DoubleProp_ConditionalOption,
	DoubleProp_ConditionalOptions = t.DoubleProp_ConditionalOptions,
	Int32Prop = t.Int32Prop,
	Int32Prop_ConditionalOption = t.Int32Prop_ConditionalOption,
	Int32Prop_ConditionalOptions = t.Int32Prop_ConditionalOptions,
	Int64Prop = t.Int64Prop,
	Int64Prop_ConditionalOption = t.Int64Prop_ConditionalOption,
	Int64Prop_ConditionalOptions = t.Int64Prop_ConditionalOptions,
	BoolProp = t.BoolProp,
	BoolProp_ConditionalOption = t.BoolProp_ConditionalOption,
	BoolProp_ConditionalOptions = t.BoolProp_ConditionalOptions,
	StructProp = t.StructProp,
	StructProp_ConditionalOption = t.StructProp_ConditionalOption,
	StructProp_ConditionalOptions = t.StructProp_ConditionalOptions,
	ImageStringProp = t.ImageStringProp,
	ImageStringProp_ConditionalOption = t.ImageStringProp_ConditionalOption,
	ImageStringProp_ConditionalOptions = t.ImageStringProp_ConditionalOptions,
	ImageSetProp = t.ImageSetProp,
	ImageSetProp_ConditionalOption = t.ImageSetProp_ConditionalOption,
	ImageSetProp_ConditionalOptions = t.ImageSetProp_ConditionalOptions,
	ColorProp = t.ColorProp,
	ColorProp_ConditionalOption = t.ColorProp_ConditionalOption,
	ColorProp_ConditionalOptions = t.ColorProp_ConditionalOptions,
	TypographyProp = t.TypographyProp,
	TypographyProp_ConditionalOption = t.TypographyProp_ConditionalOption,
	TypographyProp_ConditionalOptions = t.TypographyProp_ConditionalOptions,
	TypographyFontProp = t.TypographyFontProp,
	TypographyFontProp_ConditionalOption = t.TypographyFontProp_ConditionalOption,
	TypographyFontProp_ConditionalOptions = t.TypographyFontProp_ConditionalOptions,
	ColorStyleProp = t.ColorStyleProp,
	ColorStyleProp_ConditionalOption = t.ColorStyleProp_ConditionalOption,
	ColorStyleProp_ConditionalOptions = t.ColorStyleProp_ConditionalOptions,
	FillBehaviorProp = t.FillBehaviorProp,
	FillBehaviorProp_ConditionalOption = t.FillBehaviorProp_ConditionalOption,
	FillBehaviorProp_ConditionalOptions = t.FillBehaviorProp_ConditionalOptions,
	InputSizeProp = t.InputSizeProp,
	InputSizeProp_ConditionalOption = t.InputSizeProp_ConditionalOption,
	InputSizeProp_ConditionalOptions = t.InputSizeProp_ConditionalOptions,
	UDimProp = t.UDimProp,
	UDimProp_ConditionalOption = t.UDimProp_ConditionalOption,
	UDimProp_ConditionalOptions = t.UDimProp_ConditionalOptions,
	UDim2Prop = t.UDim2Prop,
	UDim2Prop_ConditionalOption = t.UDim2Prop_ConditionalOption,
	UDim2Prop_ConditionalOptions = t.UDim2Prop_ConditionalOptions,
	Vector2Prop = t.Vector2Prop,
	Vector2Prop_ConditionalOption = t.Vector2Prop_ConditionalOption,
	Vector2Prop_ConditionalOptions = t.Vector2Prop_ConditionalOptions,
	IconProp = t.IconProp,
	IconProp_ConditionalOption = t.IconProp_ConditionalOption,
	IconProp_ConditionalOptions = t.IconProp_ConditionalOptions,
	FoundationIconConfigProp = t.FoundationIconConfigProp,
	FoundationIconConfigProp_ConditionalOption = t.FoundationIconConfigProp_ConditionalOption,
	FoundationIconConfigProp_ConditionalOptions = t.FoundationIconConfigProp_ConditionalOptions,
	FoundationIconConfigProp_FoundationIconConfig = t.FoundationIconConfigProp_FoundationIconConfig,
	IconSizeProp = t.IconSizeProp,
	GradientProp = t.GradientProp,
	GradientProp_ConditionalOption = t.GradientProp_ConditionalOption,
	GradientProp_ConditionalOptions = t.GradientProp_ConditionalOptions,
	GradientProp_GradientData = t.GradientProp_GradientData,
	ArrayOfStructProp = t.ArrayOfStructProp,
	ArrayOfStructProp_ConditionalOption = t.ArrayOfStructProp_ConditionalOption,
	ArrayOfStructProp_ConditionalOptions = t.ArrayOfStructProp_ConditionalOptions,
	ArrayOfStructProp_ArrayOfStructs = t.ArrayOfStructProp_ArrayOfStructs,
	UiScaledFloatProp = t.UiScaledFloatProp,
	UiScaledFloatProp_ConditionalOption = t.UiScaledFloatProp_ConditionalOption,
	UiScaledFloatProp_ConditionalOptions = t.UiScaledFloatProp_ConditionalOptions,
	UiScaledUDimProp = t.UiScaledUDimProp,
	UiScaledUDimProp_ConditionalOption = t.UiScaledUDimProp_ConditionalOption,
	UiScaledUDimProp_ConditionalOptions = t.UiScaledUDimProp_ConditionalOptions,
	UiScaledUDim2Prop = t.UiScaledUDim2Prop,
	UiScaledUDim2Prop_ConditionalOption = t.UiScaledUDim2Prop_ConditionalOption,
	UiScaledUDim2Prop_ConditionalOptions = t.UiScaledUDim2Prop_ConditionalOptions,
	AvatarConfigProp = t.AvatarConfigProp,
	AvatarProp = t.AvatarProp,
	ArrayOfAvatarProp = t.ArrayOfAvatarProp,
	ArrayOfAvatarProp_ConditionalOption = t.ArrayOfAvatarProp_ConditionalOption,
	ArrayOfAvatarProp_ConditionalOptions = t.ArrayOfAvatarProp_ConditionalOptions,
	ArrayOfAvatarProp_ArrayOfAvatars = t.ArrayOfAvatarProp_ArrayOfAvatars,
	ArrayOfAvatarProp_ArrayMap = t.ArrayOfAvatarProp_ArrayMap,
	ScaleBasisProp = t.ScaleBasisProp,
	ScaleBasisProp_ConditionalOption = t.ScaleBasisProp_ConditionalOption,
	ScaleBasisProp_ConditionalOptions = t.ScaleBasisProp_ConditionalOptions,
	StringArrayProp = t.StringArrayProp,
	StringArrayProp_LiteralValue = t.StringArrayProp_LiteralValue,
	StringArrayProp_ConditionalOption = t.StringArrayProp_ConditionalOption,
	StringArrayProp_ConditionalOptions = t.StringArrayProp_ConditionalOptions,
	ScaleBasis = t.ScaleBasis
}