local ProtoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local TypeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local StructModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local HydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local PropConditionModule = require(script.Parent.prop_condition)
local Module = {}
Module.__index = Module

function Module.new(p1)
	-- upvalues: Module (copy)
	return (setmetatable({
		namespace = if p1 == nil or p1.namespace == nil then "" else p1.namespace,
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		map_key = if p1 == nil or p1.map_key == nil then "" else p1.map_key
	}, Module))
end

function Module:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.namespace ~= nil and self.namespace ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.namespace)
	end
	if self.key ~= nil and self.key ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.key)
	end
	if self.map_key ~= nil and self.map_key ~= "" then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.map_key)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module.decode(Buf)
	-- upvalues: Module (copy), ProtoModule (copy)
	local NewModule = Module.new()
	local v1 = 0
	while v1 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v119 = ProtoModule.readTag(Buf, v1)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v119 = ProtoModule.readVarInt(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v119 = ProtoModule.readBuffer(Buf, v1)
				NewModule.namespace = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v119 = ProtoModule.readBuffer(Buf, v1)
				NewModule.key = buffer.tostring(Buffer2)
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v119 = ProtoModule.readBuffer(Buf, v1)
				NewModule.map_key = buffer.tostring(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v1)
				v1 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v119 = ProtoModule.readFixed32(Buf, v1)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v119 = ProtoModule.readFixed64(Buf, v1)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module:jsonEncode()
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

function Module:jsonDecode()
	-- upvalues: Module (copy)
	local NewModule = Module.new()
	
	if self.namespace ~= nil then
		NewModule.namespace = self.namespace
	end
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.map_key ~= nil then
		NewModule.map_key = self.map_key
	end
	if self.mapKey ~= nil then
		NewModule.map_key = self.mapKey
	end
	return NewModule
end

Module.descriptor = {
	name = "TranslationRef",
	fullName = "roblox.apppageplatform.shared.v1beta1.TranslationRef"
}
local config = { TranslationRef = Module }
TypeRegistryModule.default:register(config.TranslationRef)
local Module1 = {}
Module1.__index = Module1

function Module1.new(p1)
	-- upvalues: Module1 (copy)
	return (setmetatable({
		str = if p1 == nil or p1.str == nil then "" else p1.str,
		args = if p1 == nil or p1.args == nil then {} else p1.args,
		translation = if p1 == nil or p1.translation == nil then nil else p1.translation
	}, Module1))
end

function Module1:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.str ~= nil and self.str ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.str)
	end
	if self.args ~= nil and next(self.args) ~= nil then
		for i, arg in self.args do
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(buffer.create(0), 0, 1, ProtoModule.wireTypes.lengthDelimited)
			local WriteStringResult, WriteStringResult2 = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, i)
			local EncodeResult = arg:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(WriteStringResult, WriteStringResult2, 2, ProtoModule.wireTypes.lengthDelimited)
			local WriteBufferResult, WriteBufferResult2 = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, WriteBufferResult, WriteBufferResult2)
		end
	end
	if self.translation ~= nil then
		local EncodeResult = self.translation:encode()
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module1.decode(Buf)
	-- upvalues: Module1 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module1.new()
	local v2 = 0
	while v2 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v151 = ProtoModule.readTag(Buf, v2)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v151 = ProtoModule.readVarInt(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v151 = ProtoModule.readBuffer(Buf, v2)
				NewModule.str = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v151 = ProtoModule.readBuffer(Buf, v2)
				local DecodeResult = config.StringFormat_ArgsEntry.decode(Buffer2)
				local NewResult = config.StringFormat_FormatArg.new()
				NewModule.args[DecodeResult.key or ""] = DecodeResult.value or NewResult
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v151 = ProtoModule.readBuffer(Buf, v2)
				NewModule.translation = config.TranslationRef.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v2)
				v2 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v151 = ProtoModule.readFixed32(Buf, v2)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v151 = ProtoModule.readFixed64(Buf, v2)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module1:jsonEncode()
	local t = {}
	
	if self.str ~= nil and self.str ~= "" then
		t.str = self.str
	end
	if self.args ~= nil and next(self.args) ~= nil then
		local Args = {}
		
		for i, arg in self.args do
			Args[i] = arg:jsonEncode()
		end
		t.args = Args
	end
	if self.translation ~= nil then
		t.translation = self.translation:jsonEncode()
	end
	return t
end

function Module1:jsonDecode()
	-- upvalues: Module1 (copy), config (copy)
	local NewModule = Module1.new()
	
	if self.str ~= nil then
		NewModule.str = self.str
	end
	if self.args ~= nil then
		local Args = {}
		
		for i, arg in self.args do
			Args[i] = config.StringFormat_FormatArg.jsonDecode(arg)
		end
		NewModule.args = Args
	end
	if self.translation ~= nil then
		NewModule.translation = config.TranslationRef.jsonDecode(self.translation)
	end
	return NewModule
end

Module1.descriptor = {
	name = "StringFormat",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
}
config.StringFormat = Module1
TypeRegistryModule.default:register(config.StringFormat)
local Module2 = {}
Module2.__index = Module2

function Module2.new(p1)
	-- upvalues: Module2 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		formatter = if p1 == nil or p1.formatter == nil then nil else p1.formatter
	}, Module2))
end

function Module2:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		end
	end
	if self.formatter ~= nil then
		local EncodeResult = self.formatter:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module2.decode(Buf)
	-- upvalues: Module2 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module2.new()
	local v3 = 0
	while v3 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v178 = ProtoModule.readTag(Buf, v3)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v178 = ProtoModule.readVarInt(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v178 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v178 = ProtoModule.readBuffer(Buf, v3)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v178 = ProtoModule.readBuffer(Buf, v3)
				NewModule.formatter = config.StringFormat_FormatArg_Formatter.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v3)
				v3 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v178 = ProtoModule.readFixed32(Buf, v3)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v178 = ProtoModule.readFixed64(Buf, v3)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module2:jsonEncode()
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

function Module2:jsonDecode()
	-- upvalues: Module2 (copy), config (copy)
	local NewModule = Module2.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.formatter ~= nil then
		NewModule.formatter = config.StringFormat_FormatArg_Formatter.jsonDecode(self.formatter)
	end
	return NewModule
end

Module2.descriptor = {
	name = "StringFormat_FormatArg",
	fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
}
config.StringFormat_FormatArg = Module2
TypeRegistryModule.default:register(config.StringFormat_FormatArg)
local Module3 = {}
Module3.__index = Module3

function Module3.new(p1)
	-- upvalues: config (copy), Module3 (copy)
	return (setmetatable({
		type = if p1 == nil or p1.type == nil then assert(config.StringFormat_FormatArg_Formatter_Type.fromNumber(0), "Enum has no 0 default") else p1.type,
		config = if p1 == nil or p1.config == nil then nil else p1.config
	}, Module3))
end

function Module3:encode()
	-- upvalues: config (copy), ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= config.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, config.StringFormat_FormatArg_Formatter_Type.toNumber(self.type))
	end
	if self.config ~= nil and self.config.type == "date_config" then
		local EncodeResult = self.config.value:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module3.decode(Buf)
	-- upvalues: Module3 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module3.new()
	local v4 = 0
	while v4 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v199 = ProtoModule.readTag(Buf, v4)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v199 = ProtoModule.readVarIntI32(Buf, v4)
				NewModule.type = config.StringFormat_FormatArg_Formatter_Type.fromNumber(VarIntI32) or VarIntI32
			else
				local _
				_, v199 = ProtoModule.readVarInt(Buf, v4)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v199 = ProtoModule.readBuffer(Buf, v4)
				NewModule.config = {
					type = "date_config",
					value = config.StringFormat_FormatArg_Formatter_DateConfig.decode(Buffer1)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v4)
				v4 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v199 = ProtoModule.readFixed32(Buf, v4)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v199 = ProtoModule.readFixed64(Buf, v4)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module3:jsonEncode()
	-- upvalues: config (copy)
	local t = {}
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= config.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		t.type = if typeof(self.type) == "number" then self.type else config.StringFormat_FormatArg_Formatter_Type.toNumber(self.type)
	end
	if self.config ~= nil and self.config.type == "date_config" then
		t.dateConfig = self.config.value:jsonEncode()
	end
	return t
end

function Module3:jsonDecode()
	-- upvalues: Module3 (copy), config (copy)
	local NewModule = Module3.new()
	
	if self.type ~= nil then
		NewModule.type = (if typeof(self.type) == "number" then config.StringFormat_FormatArg_Formatter_Type.fromNumber(self.type) else config.StringFormat_FormatArg_Formatter_Type.fromName(self.type)) or self.type
	end
	if self.date_config ~= nil then
		NewModule.config = {
			type = "date_config",
			value = config.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.date_config)
		}
	end
	if self.dateConfig ~= nil then
		NewModule.config = {
			type = "date_config",
			value = config.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.dateConfig)
		}
	end
	return NewModule
end

Module3.descriptor = {
	name = "StringFormat_FormatArg_Formatter",
	fullName = "roblox.apppageplatform.shared.v1beta1.Formatter"
}
config.StringFormat_FormatArg_Formatter = Module3
TypeRegistryModule.default:register(config.StringFormat_FormatArg_Formatter)
local Module4 = {}
Module4.__index = Module4

function Module4.new(p1)
	-- upvalues: Module4 (copy)
	return (setmetatable({
		pattern = if p1 == nil or p1.pattern == nil then "" else p1.pattern
	}, Module4))
end

function Module4:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.pattern ~= nil and self.pattern ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.pattern)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module4.decode(Buf)
	-- upvalues: Module4 (copy), ProtoModule (copy)
	local NewModule = Module4.new()
	local v5 = 0
	while v5 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v216 = ProtoModule.readTag(Buf, v5)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v216 = ProtoModule.readVarInt(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v216 = ProtoModule.readBuffer(Buf, v5)
				NewModule.pattern = buffer.tostring(Buffer1)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v5)
				v5 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v216 = ProtoModule.readFixed32(Buf, v5)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v216 = ProtoModule.readFixed64(Buf, v5)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module4:jsonEncode()
	local t = {}
	
	if self.pattern ~= nil and self.pattern ~= "" then
		t.pattern = self.pattern
	end
	return t
end

function Module4:jsonDecode()
	-- upvalues: Module4 (copy)
	local NewModule = Module4.new()
	
	if self.pattern ~= nil then
		NewModule.pattern = self.pattern
	end
	return NewModule
end

Module4.descriptor = {
	name = "StringFormat_FormatArg_Formatter_DateConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.DateConfig"
}
config.StringFormat_FormatArg_Formatter_DateConfig = Module4
TypeRegistryModule.default:register(config.StringFormat_FormatArg_Formatter_DateConfig)
config.StringFormat_FormatArg_Formatter_Type = {
	fromNumber = function(p1)
		return if p1 == 0 then "TYPE_INVALID" elseif p1 == 1 then "TYPE_NUMBER_ABBREVIATE" elseif p1 == 2 then "TYPE_NUMBER_LOCALIZE" elseif p1 == 3 then "TYPE_DATE_FORMAT" else nil
	end,
	toNumber = function(p1)
		return if p1 == "TYPE_INVALID" then 0 elseif p1 == "TYPE_NUMBER_ABBREVIATE" then 1 elseif p1 == "TYPE_NUMBER_LOCALIZE" then 2 elseif p1 == "TYPE_DATE_FORMAT" then 3 else p1
	end,
	fromName = function(p1)
		return if p1 == "TYPE_INVALID" then "TYPE_INVALID" elseif p1 == "TYPE_NUMBER_ABBREVIATE" then "TYPE_NUMBER_ABBREVIATE" elseif p1 == "TYPE_NUMBER_LOCALIZE" then "TYPE_NUMBER_LOCALIZE" elseif p1 == "TYPE_DATE_FORMAT" then "TYPE_DATE_FORMAT" else nil
	end
}
local Module5 = {}
Module5.__index = Module5

function Module5.new(p1)
	-- upvalues: Module5 (copy)
	return (setmetatable({
		key = if p1 == nil or p1.key == nil then "" else p1.key,
		value = if p1 == nil or p1.value == nil then nil else p1.value
	}, Module5))
end

function Module5:encode()
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

function Module5.decode(Buf)
	-- upvalues: Module5 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module5.new()
	local v6 = 0
	while v6 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v235 = ProtoModule.readTag(Buf, v6)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v235 = ProtoModule.readVarInt(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v235 = ProtoModule.readBuffer(Buf, v6)
				NewModule.key = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v235 = ProtoModule.readBuffer(Buf, v6)
				NewModule.value = config.StringFormat_FormatArg.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v6)
				v6 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v235 = ProtoModule.readFixed32(Buf, v6)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v235 = ProtoModule.readFixed64(Buf, v6)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module5:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function Module5:jsonDecode()
	-- upvalues: Module5 (copy), config (copy)
	local NewModule = Module5.new()
	
	if self.key ~= nil then
		NewModule.key = self.key
	end
	if self.value ~= nil then
		NewModule.value = config.StringFormat_FormatArg.jsonDecode(self.value)
	end
	return NewModule
end

Module5.descriptor = {
	name = "StringFormat_ArgsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
}
config.StringFormat_ArgsEntry = Module5
TypeRegistryModule.default:register(config.StringFormat_ArgsEntry)
local Module6 = {}
Module6.__index = Module6

function Module6.new(p1)
	-- upvalues: Module6 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module6))
end

function Module6:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "format" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "translation" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module6.decode(Buf)
	-- upvalues: Module6 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module6.new()
	local v7 = 0
	while v7 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v265 = ProtoModule.readTag(Buf, v7)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v265 = ProtoModule.readVarInt(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v265 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v265 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v265 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v265 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = {
					type = "format",
					value = config.StringFormat.decode(Buffer4)
				}
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v265 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = {
					type = "conditional",
					value = config.StringProp_ConditionalOptions.decode(Buffer5)
				}
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v265 = ProtoModule.readBuffer(Buf, v7)
				NewModule.kind = {
					type = "translation",
					value = config.TranslationRef.decode(Buffer6)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v7)
				v7 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v265 = ProtoModule.readFixed32(Buf, v7)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v265 = ProtoModule.readFixed64(Buf, v7)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module6:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module6:jsonDecode()
	-- upvalues: Module6 (copy), config (copy)
	local NewModule = Module6.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		NewModule.kind = {
			type = "format",
			value = config.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.StringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		NewModule.kind = {
			type = "translation",
			value = config.TranslationRef.jsonDecode(self.translation)
		}
	end
	return NewModule
end

Module6.descriptor = {
	name = "StringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
}
config.StringProp = Module6
TypeRegistryModule.default:register(config.StringProp)
local Module7 = {}
Module7.__index = Module7

function Module7.new(p1)
	-- upvalues: Module7 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module7))
end

function Module7:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		elseif self.kind.type == "format" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "translation" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module7.decode(Buf)
	-- upvalues: Module7 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module7.new()
	local v8 = 0
	while v8 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v299 = ProtoModule.readTag(Buf, v8)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v299 = ProtoModule.readVarInt(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v299 = ProtoModule.readBuffer(Buf, v8)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v299 = ProtoModule.readBuffer(Buf, v8)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v299 = ProtoModule.readBuffer(Buf, v8)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v299 = ProtoModule.readBuffer(Buf, v8)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer4) }
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v299 = ProtoModule.readBuffer(Buf, v8)
				NewModule.kind = {
					type = "format",
					value = config.StringFormat.decode(Buffer5)
				}
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v299 = ProtoModule.readBuffer(Buf, v8)
				NewModule.kind = {
					type = "translation",
					value = config.TranslationRef.decode(Buffer6)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v8)
				v8 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v299 = ProtoModule.readFixed32(Buf, v8)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v299 = ProtoModule.readFixed64(Buf, v8)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module7:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module7:jsonDecode()
	-- upvalues: Module7 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module7.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		NewModule.kind = {
			type = "format",
			value = config.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		NewModule.kind = {
			type = "translation",
			value = config.TranslationRef.jsonDecode(self.translation)
		}
	end
	return NewModule
end

Module7.descriptor = {
	name = "StringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.StringProp_ConditionalOption = Module7
TypeRegistryModule.default:register(config.StringProp_ConditionalOption)
local Module8 = {}
Module8.__index = Module8

function Module8.new(p1)
	-- upvalues: Module8 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module8))
end

function Module8:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module8.decode(Buf)
	-- upvalues: Module8 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module8.new()
	local v9 = 0
	while v9 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v321 = ProtoModule.readTag(Buf, v9)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v321 = ProtoModule.readVarInt(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v321 = ProtoModule.readBuffer(Buf, v9)
				table.insert(NewModule.options, config.StringProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v9)
				v9 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v321 = ProtoModule.readFixed32(Buf, v9)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v321 = ProtoModule.readFixed64(Buf, v9)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module8:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module8:jsonDecode()
	-- upvalues: Module8 (copy), config (copy)
	local NewModule = Module8.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.StringProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module8.descriptor = {
	name = "StringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.StringProp_ConditionalOptions = Module8
TypeRegistryModule.default:register(config.StringProp_ConditionalOptions)
local Module9 = {}
Module9.__index = Module9

function Module9.new(p1)
	-- upvalues: Module9 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module9))
end

function Module9:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.i32)
			Buf, Count = ProtoModule.writeFloat(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module9.decode(Buf)
	-- upvalues: Module9 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module9.new()
	local v10 = 0
	while v10 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v346 = ProtoModule.readTag(Buf, v10)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v346 = ProtoModule.readVarInt(Buf, v10)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v346 = ProtoModule.readBuffer(Buf, v10)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v346 = ProtoModule.readBuffer(Buf, v10)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v346 = ProtoModule.readBuffer(Buf, v10)
				NewModule.kind = {
					type = "conditional",
					value = config.FloatProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v10)
				v10 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 1 then
				local Float
				Float, v346 = ProtoModule.readFloat(Buf, v10)
				NewModule.kind = { type = "literal", value = Float }
			else
				local _
				_, v346 = ProtoModule.readFixed32(Buf, v10)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v346 = ProtoModule.readFixed64(Buf, v10)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module9:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = ProtoModule.json.serializeNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module9:jsonDecode()
	-- upvalues: Module9 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module9.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = ProtoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.FloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module9.descriptor = {
	name = "FloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
}
config.FloatProp = Module9
TypeRegistryModule.default:register(config.FloatProp)
local Module10 = {}
Module10.__index = Module10

function Module10.new(p1)
	-- upvalues: Module10 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module10))
end

function Module10:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i32)
			Buf, Count = ProtoModule.writeFloat(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module10.decode(Buf)
	-- upvalues: Module10 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module10.new()
	local v11 = 0
	while v11 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v372 = ProtoModule.readTag(Buf, v11)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v372 = ProtoModule.readVarInt(Buf, v11)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v372 = ProtoModule.readBuffer(Buf, v11)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v372 = ProtoModule.readBuffer(Buf, v11)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v372 = ProtoModule.readBuffer(Buf, v11)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v11)
				v11 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 2 then
				local Float
				Float, v372 = ProtoModule.readFloat(Buf, v11)
				NewModule.kind = { type = "literal", value = Float }
			else
				local _
				_, v372 = ProtoModule.readFixed32(Buf, v11)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v372 = ProtoModule.readFixed64(Buf, v11)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module10:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = ProtoModule.json.serializeNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function Module10:jsonDecode()
	-- upvalues: Module10 (copy), PropConditionModule (copy), ProtoModule (copy)
	local NewModule = Module10.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = ProtoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	return NewModule
end

Module10.descriptor = {
	name = "FloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.FloatProp_ConditionalOption = Module10
TypeRegistryModule.default:register(config.FloatProp_ConditionalOption)
local Module11 = {}
Module11.__index = Module11

function Module11.new(p1)
	-- upvalues: Module11 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module11))
end

function Module11:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module11.decode(Buf)
	-- upvalues: Module11 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module11.new()
	local v12 = 0
	while v12 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v392 = ProtoModule.readTag(Buf, v12)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v392 = ProtoModule.readVarInt(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v392 = ProtoModule.readBuffer(Buf, v12)
				table.insert(NewModule.options, config.FloatProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v12)
				v12 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v392 = ProtoModule.readFixed32(Buf, v12)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v392 = ProtoModule.readFixed64(Buf, v12)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module11:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module11:jsonDecode()
	-- upvalues: Module11 (copy), config (copy)
	local NewModule = Module11.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.FloatProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module11.descriptor = {
	name = "FloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.FloatProp_ConditionalOptions = Module11
TypeRegistryModule.default:register(config.FloatProp_ConditionalOptions)
local Module12 = {}
Module12.__index = Module12

function Module12.new(p1)
	-- upvalues: Module12 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module12))
end

function Module12:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.i64)
			Buf, Count = ProtoModule.writeDouble(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module12.decode(Buf)
	-- upvalues: Module12 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module12.new()
	local v13 = 0
	while v13 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v417 = ProtoModule.readTag(Buf, v13)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v417 = ProtoModule.readVarInt(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v417 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v417 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v417 = ProtoModule.readBuffer(Buf, v13)
				NewModule.kind = {
					type = "conditional",
					value = config.DoubleProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v13)
				v13 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v417 = ProtoModule.readFixed32(Buf, v13)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 1 then
				local Double
				Double, v417 = ProtoModule.readDouble(Buf, v13)
				NewModule.kind = { type = "literal", value = Double }
			else
				local _
				_, v417 = ProtoModule.readFixed64(Buf, v13)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module12:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = ProtoModule.json.serializeNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module12:jsonDecode()
	-- upvalues: Module12 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module12.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = ProtoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.DoubleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module12.descriptor = {
	name = "DoubleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
}
config.DoubleProp = Module12
TypeRegistryModule.default:register(config.DoubleProp)
local Module13 = {}
Module13.__index = Module13

function Module13.new(p1)
	-- upvalues: Module13 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module13))
end

function Module13:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.i64)
			Buf, Count = ProtoModule.writeDouble(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module13.decode(Buf)
	-- upvalues: Module13 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module13.new()
	local v14 = 0
	while v14 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v443 = ProtoModule.readTag(Buf, v14)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v443 = ProtoModule.readVarInt(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v443 = ProtoModule.readBuffer(Buf, v14)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v443 = ProtoModule.readBuffer(Buf, v14)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v443 = ProtoModule.readBuffer(Buf, v14)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v14)
				v14 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v443 = ProtoModule.readFixed32(Buf, v14)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			if Tag == 2 then
				local Double
				Double, v443 = ProtoModule.readDouble(Buf, v14)
				NewModule.kind = { type = "literal", value = Double }
			else
				local _
				_, v443 = ProtoModule.readFixed64(Buf, v14)
			end
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module13:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = ProtoModule.json.serializeNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function Module13:jsonDecode()
	-- upvalues: Module13 (copy), PropConditionModule (copy), ProtoModule (copy)
	local NewModule = Module13.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = ProtoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	return NewModule
end

Module13.descriptor = {
	name = "DoubleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.DoubleProp_ConditionalOption = Module13
TypeRegistryModule.default:register(config.DoubleProp_ConditionalOption)
local Module14 = {}
Module14.__index = Module14

function Module14.new(p1)
	-- upvalues: Module14 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module14))
end

function Module14:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module14.decode(Buf)
	-- upvalues: Module14 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module14.new()
	local v15 = 0
	while v15 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v463 = ProtoModule.readTag(Buf, v15)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v463 = ProtoModule.readVarInt(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v463 = ProtoModule.readBuffer(Buf, v15)
				table.insert(NewModule.options, config.DoubleProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v15)
				v15 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v463 = ProtoModule.readFixed32(Buf, v15)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v463 = ProtoModule.readFixed64(Buf, v15)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module14:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module14:jsonDecode()
	-- upvalues: Module14 (copy), config (copy)
	local NewModule = Module14.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.DoubleProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module14.descriptor = {
	name = "DoubleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.DoubleProp_ConditionalOptions = Module14
TypeRegistryModule.default:register(config.DoubleProp_ConditionalOptions)
local Module15 = {}
Module15.__index = Module15

function Module15.new(p1)
	-- upvalues: Module15 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module15))
end

function Module15:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module15.decode(Buf)
	-- upvalues: Module15 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module15.new()
	local v16 = 0
	while v16 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v488 = ProtoModule.readTag(Buf, v16)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v488 = ProtoModule.readVarIntI32(Buf, v16)
				NewModule.kind = { type = "literal", value = VarIntI32 }
			else
				local _
				_, v488 = ProtoModule.readVarInt(Buf, v16)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v488 = ProtoModule.readBuffer(Buf, v16)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v488 = ProtoModule.readBuffer(Buf, v16)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v488 = ProtoModule.readBuffer(Buf, v16)
				NewModule.kind = {
					type = "conditional",
					value = config.Int32Prop_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v16)
				v16 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v488 = ProtoModule.readFixed32(Buf, v16)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v488 = ProtoModule.readFixed64(Buf, v16)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module15:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module15:jsonDecode()
	-- upvalues: Module15 (copy), config (copy)
	local NewModule = Module15.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.Int32Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module15.descriptor = {
	name = "Int32Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
}
config.Int32Prop = Module15
TypeRegistryModule.default:register(config.Int32Prop)
local Module16 = {}
Module16.__index = Module16

function Module16.new(p1)
	-- upvalues: Module16 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module16))
end

function Module16:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module16.decode(Buf)
	-- upvalues: Module16 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module16.new()
	local v17 = 0
	while v17 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v514 = ProtoModule.readTag(Buf, v17)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v514 = ProtoModule.readVarIntI32(Buf, v17)
				NewModule.kind = { type = "literal", value = VarIntI32 }
			else
				local _
				_, v514 = ProtoModule.readVarInt(Buf, v17)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v514 = ProtoModule.readBuffer(Buf, v17)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v514 = ProtoModule.readBuffer(Buf, v17)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v514 = ProtoModule.readBuffer(Buf, v17)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v17)
				v17 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v514 = ProtoModule.readFixed32(Buf, v17)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v514 = ProtoModule.readFixed64(Buf, v17)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module16:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function Module16:jsonDecode()
	-- upvalues: Module16 (copy), PropConditionModule (copy)
	local NewModule = Module16.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	return NewModule
end

Module16.descriptor = {
	name = "Int32Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.Int32Prop_ConditionalOption = Module16
TypeRegistryModule.default:register(config.Int32Prop_ConditionalOption)
local Module17 = {}
Module17.__index = Module17

function Module17.new(p1)
	-- upvalues: Module17 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module17))
end

function Module17:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module17.decode(Buf)
	-- upvalues: Module17 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module17.new()
	local v18 = 0
	while v18 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v534 = ProtoModule.readTag(Buf, v18)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v534 = ProtoModule.readVarInt(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v534 = ProtoModule.readBuffer(Buf, v18)
				table.insert(NewModule.options, config.Int32Prop_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v18)
				v18 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v534 = ProtoModule.readFixed32(Buf, v18)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v534 = ProtoModule.readFixed64(Buf, v18)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module17:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module17:jsonDecode()
	-- upvalues: Module17 (copy), config (copy)
	local NewModule = Module17.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.Int32Prop_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module17.descriptor = {
	name = "Int32Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.Int32Prop_ConditionalOptions = Module17
TypeRegistryModule.default:register(config.Int32Prop_ConditionalOptions)
local Module18 = {}
Module18.__index = Module18

function Module18.new(p1)
	-- upvalues: Module18 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module18))
end

function Module18:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module18.decode(Buf)
	-- upvalues: Module18 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module18.new()
	local v19 = 0
	while v19 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v559 = ProtoModule.readTag(Buf, v19)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI64
				VarIntI64, v559 = ProtoModule.readVarIntI64(Buf, v19)
				NewModule.kind = { type = "literal", value = VarIntI64 }
			else
				local _
				_, v559 = ProtoModule.readVarInt(Buf, v19)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v559 = ProtoModule.readBuffer(Buf, v19)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v559 = ProtoModule.readBuffer(Buf, v19)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v559 = ProtoModule.readBuffer(Buf, v19)
				NewModule.kind = {
					type = "conditional",
					value = config.Int64Prop_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v19)
				v19 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v559 = ProtoModule.readFixed32(Buf, v19)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v559 = ProtoModule.readFixed64(Buf, v19)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module18:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module18:jsonDecode()
	-- upvalues: Module18 (copy), config (copy)
	local NewModule = Module18.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.Int64Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module18.descriptor = {
	name = "Int64Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
}
config.Int64Prop = Module18
TypeRegistryModule.default:register(config.Int64Prop)
local Module19 = {}
Module19.__index = Module19

function Module19.new(p1)
	-- upvalues: Module19 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module19))
end

function Module19:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module19.decode(Buf)
	-- upvalues: Module19 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module19.new()
	local v20 = 0
	while v20 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v585 = ProtoModule.readTag(Buf, v20)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI64
				VarIntI64, v585 = ProtoModule.readVarIntI64(Buf, v20)
				NewModule.kind = { type = "literal", value = VarIntI64 }
			else
				local _
				_, v585 = ProtoModule.readVarInt(Buf, v20)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v585 = ProtoModule.readBuffer(Buf, v20)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v585 = ProtoModule.readBuffer(Buf, v20)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v585 = ProtoModule.readBuffer(Buf, v20)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v20)
				v20 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v585 = ProtoModule.readFixed32(Buf, v20)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v585 = ProtoModule.readFixed64(Buf, v20)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module19:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
		end
	end
	return t
end

function Module19:jsonDecode()
	-- upvalues: Module19 (copy), PropConditionModule (copy)
	local NewModule = Module19.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	return NewModule
end

Module19.descriptor = {
	name = "Int64Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.Int64Prop_ConditionalOption = Module19
TypeRegistryModule.default:register(config.Int64Prop_ConditionalOption)
local Module20 = {}
Module20.__index = Module20

function Module20.new(p1)
	-- upvalues: Module20 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module20))
end

function Module20:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module20.decode(Buf)
	-- upvalues: Module20 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module20.new()
	local v21 = 0
	while v21 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v605 = ProtoModule.readTag(Buf, v21)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v605 = ProtoModule.readVarInt(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v605 = ProtoModule.readBuffer(Buf, v21)
				table.insert(NewModule.options, config.Int64Prop_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v21)
				v21 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v605 = ProtoModule.readFixed32(Buf, v21)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v605 = ProtoModule.readFixed64(Buf, v21)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module20:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module20:jsonDecode()
	-- upvalues: Module20 (copy), config (copy)
	local NewModule = Module20.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.Int64Prop_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module20.descriptor = {
	name = "Int64Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.Int64Prop_ConditionalOptions = Module20
TypeRegistryModule.default:register(config.Int64Prop_ConditionalOptions)
local Module21 = {}
Module21.__index = Module21

function Module21.new(p1)
	-- upvalues: Module21 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module21))
end

function Module21:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, if self.kind.value then 1 else 0)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module21.decode(Buf)
	-- upvalues: Module21 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module21.new()
	local v22 = 0
	while v22 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v628 = ProtoModule.readTag(Buf, v22)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarInt
				VarInt, v628 = ProtoModule.readVarInt(Buf, v22)
				NewModule.kind = { type = "literal", value = VarInt ~= 0 }
			else
				local _
				_, v628 = ProtoModule.readVarInt(Buf, v22)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v628 = ProtoModule.readBuffer(Buf, v22)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v628 = ProtoModule.readBuffer(Buf, v22)
				NewModule.kind = {
					type = "conditional",
					value = config.BoolProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v22)
				v22 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v628 = ProtoModule.readFixed32(Buf, v22)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v628 = ProtoModule.readFixed64(Buf, v22)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module21:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module21:jsonDecode()
	-- upvalues: Module21 (copy), config (copy)
	local NewModule = Module21.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.BoolProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module21.descriptor = {
	name = "BoolProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
}
config.BoolProp = Module21
TypeRegistryModule.default:register(config.BoolProp)
local Module22 = {}
Module22.__index = Module22

function Module22.new(p1)
	-- upvalues: Module22 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module22))
end

function Module22:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.kind.value then 1 else 0)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module22.decode(Buf)
	-- upvalues: Module22 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module22.new()
	local v23 = 0
	while v23 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v651 = ProtoModule.readTag(Buf, v23)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v651 = ProtoModule.readVarInt(Buf, v23)
				NewModule.kind = { type = "literal", value = VarInt ~= 0 }
			else
				local _
				_, v651 = ProtoModule.readVarInt(Buf, v23)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v651 = ProtoModule.readBuffer(Buf, v23)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v651 = ProtoModule.readBuffer(Buf, v23)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v23)
				v23 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v651 = ProtoModule.readFixed32(Buf, v23)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v651 = ProtoModule.readFixed64(Buf, v23)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module22:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module22:jsonDecode()
	-- upvalues: Module22 (copy), PropConditionModule (copy)
	local NewModule = Module22.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module22.descriptor = {
	name = "BoolProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.BoolProp_ConditionalOption = Module22
TypeRegistryModule.default:register(config.BoolProp_ConditionalOption)
local Module23 = {}
Module23.__index = Module23

function Module23.new(p1)
	-- upvalues: Module23 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module23))
end

function Module23:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module23.decode(Buf)
	-- upvalues: Module23 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module23.new()
	local v24 = 0
	while v24 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v670 = ProtoModule.readTag(Buf, v24)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v670 = ProtoModule.readVarInt(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v670 = ProtoModule.readBuffer(Buf, v24)
				table.insert(NewModule.options, config.BoolProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v24)
				v24 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v670 = ProtoModule.readFixed32(Buf, v24)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v670 = ProtoModule.readFixed64(Buf, v24)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module23:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module23:jsonDecode()
	-- upvalues: Module23 (copy), config (copy)
	local NewModule = Module23.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.BoolProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module23.descriptor = {
	name = "BoolProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.BoolProp_ConditionalOptions = Module23
TypeRegistryModule.default:register(config.BoolProp_ConditionalOptions)
local Module24 = {}
Module24.__index = Module24

function Module24.new(p1)
	-- upvalues: Module24 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module24))
end

function Module24:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module24.decode(Buf)
	-- upvalues: Module24 (copy), ProtoModule (copy), StructModule (copy), config (copy)
	local NewModule = Module24.new()
	local v25 = 0
	while v25 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v694 = ProtoModule.readTag(Buf, v25)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v694 = ProtoModule.readVarInt(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v694 = ProtoModule.readBuffer(Buf, v25)
				NewModule.kind = {
					type = "literal",
					value = StructModule.Struct.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v694 = ProtoModule.readBuffer(Buf, v25)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v694 = ProtoModule.readBuffer(Buf, v25)
				NewModule.kind = {
					type = "conditional",
					value = config.StructProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v25)
				v25 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v694 = ProtoModule.readFixed32(Buf, v25)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v694 = ProtoModule.readFixed64(Buf, v25)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module24:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module24:jsonDecode()
	-- upvalues: Module24 (copy), StructModule (copy), config (copy)
	local NewModule = Module24.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = StructModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.StructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module24.descriptor = {
	name = "StructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
}
config.StructProp = Module24
TypeRegistryModule.default:register(config.StructProp)
local Module25 = {}
Module25.__index = Module25

function Module25.new(p1)
	-- upvalues: Module25 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module25))
end

function Module25:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module25.decode(Buf)
	-- upvalues: Module25 (copy), ProtoModule (copy), PropConditionModule (copy), StructModule (copy)
	local NewModule = Module25.new()
	local v26 = 0
	while v26 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v718 = ProtoModule.readTag(Buf, v26)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v718 = ProtoModule.readVarInt(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v718 = ProtoModule.readBuffer(Buf, v26)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v718 = ProtoModule.readBuffer(Buf, v26)
				NewModule.kind = {
					type = "literal",
					value = StructModule.Struct.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v718 = ProtoModule.readBuffer(Buf, v26)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v26)
				v26 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v718 = ProtoModule.readFixed32(Buf, v26)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v718 = ProtoModule.readFixed64(Buf, v26)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module25:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module25:jsonDecode()
	-- upvalues: Module25 (copy), PropConditionModule (copy), StructModule (copy)
	local NewModule = Module25.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = StructModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module25.descriptor = {
	name = "StructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.StructProp_ConditionalOption = Module25
TypeRegistryModule.default:register(config.StructProp_ConditionalOption)
local Module26 = {}
Module26.__index = Module26

function Module26.new(p1)
	-- upvalues: Module26 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module26))
end

function Module26:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module26.decode(Buf)
	-- upvalues: Module26 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module26.new()
	local v27 = 0
	while v27 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v737 = ProtoModule.readTag(Buf, v27)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v737 = ProtoModule.readVarInt(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v737 = ProtoModule.readBuffer(Buf, v27)
				table.insert(NewModule.options, config.StructProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v27)
				v27 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v737 = ProtoModule.readFixed32(Buf, v27)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v737 = ProtoModule.readFixed64(Buf, v27)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module26:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module26:jsonDecode()
	-- upvalues: Module26 (copy), config (copy)
	local NewModule = Module26.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.StructProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module26.descriptor = {
	name = "StructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.StructProp_ConditionalOptions = Module26
TypeRegistryModule.default:register(config.StructProp_ConditionalOptions)
local Module27 = {}
Module27.__index = Module27

function Module27.new(p1)
	-- upvalues: Module27 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		alt = if p1 == nil or p1.alt == nil then nil else p1.alt
	}, Module27))
end

function Module27:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "format" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "translation" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.alt ~= nil then
		local EncodeResult = self.alt:encode()
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult6, WriteTagResult2_5, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module27.decode(Buf)
	-- upvalues: Module27 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module27.new()
	local v28 = 0
	while v28 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v769 = ProtoModule.readTag(Buf, v28)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v769 = ProtoModule.readVarInt(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v769 = ProtoModule.readBuffer(Buf, v28)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v769 = ProtoModule.readBuffer(Buf, v28)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v769 = ProtoModule.readBuffer(Buf, v28)
				NewModule.kind = {
					type = "format",
					value = config.StringFormat.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v769 = ProtoModule.readBuffer(Buf, v28)
				NewModule.kind = {
					type = "conditional",
					value = config.ImageStringProp_ConditionalOptions.decode(Buffer4)
				}
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v769 = ProtoModule.readBuffer(Buf, v28)
				NewModule.kind = {
					type = "translation",
					value = config.TranslationRef.decode(Buffer5)
				}
			elseif Tag == 6 then
				local Buffer6
				Buffer6, v769 = ProtoModule.readBuffer(Buf, v28)
				NewModule.alt = config.StringFormat.decode(Buffer6)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v28)
				v28 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v769 = ProtoModule.readFixed32(Buf, v28)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v769 = ProtoModule.readFixed64(Buf, v28)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module27:jsonEncode()
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

function Module27:jsonDecode()
	-- upvalues: Module27 (copy), config (copy)
	local NewModule = Module27.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		NewModule.kind = {
			type = "format",
			value = config.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ImageStringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		NewModule.kind = {
			type = "translation",
			value = config.TranslationRef.jsonDecode(self.translation)
		}
	end
	if self.alt ~= nil then
		NewModule.alt = config.StringFormat.jsonDecode(self.alt)
	end
	return NewModule
end

Module27.descriptor = {
	name = "ImageStringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
}
config.ImageStringProp = Module27
TypeRegistryModule.default:register(config.ImageStringProp)
local Module28 = {}
Module28.__index = Module28

function Module28.new(p1)
	-- upvalues: Module28 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module28))
end

function Module28:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "format" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "translation" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module28.decode(Buf)
	-- upvalues: Module28 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module28.new()
	local v29 = 0
	while v29 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v801 = ProtoModule.readTag(Buf, v29)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v801 = ProtoModule.readVarInt(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v801 = ProtoModule.readBuffer(Buf, v29)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v801 = ProtoModule.readBuffer(Buf, v29)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v801 = ProtoModule.readBuffer(Buf, v29)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v801 = ProtoModule.readBuffer(Buf, v29)
				NewModule.kind = {
					type = "format",
					value = config.StringFormat.decode(Buffer4)
				}
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v801 = ProtoModule.readBuffer(Buf, v29)
				NewModule.kind = {
					type = "translation",
					value = config.TranslationRef.decode(Buffer5)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v29)
				v29 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v801 = ProtoModule.readFixed32(Buf, v29)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v801 = ProtoModule.readFixed64(Buf, v29)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module28:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module28:jsonDecode()
	-- upvalues: Module28 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module28.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		NewModule.kind = {
			type = "format",
			value = config.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		NewModule.kind = {
			type = "translation",
			value = config.TranslationRef.jsonDecode(self.translation)
		}
	end
	return NewModule
end

Module28.descriptor = {
	name = "ImageStringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ImageStringProp_ConditionalOption = Module28
TypeRegistryModule.default:register(config.ImageStringProp_ConditionalOption)
local Module29 = {}
Module29.__index = Module29

function Module29.new(p1)
	-- upvalues: Module29 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module29))
end

function Module29:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module29.decode(Buf)
	-- upvalues: Module29 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module29.new()
	local v30 = 0
	while v30 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v822 = ProtoModule.readTag(Buf, v30)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v822 = ProtoModule.readVarInt(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v822 = ProtoModule.readBuffer(Buf, v30)
				table.insert(NewModule.options, config.ImageStringProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v30)
				v30 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v822 = ProtoModule.readFixed32(Buf, v30)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v822 = ProtoModule.readFixed64(Buf, v30)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module29:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module29:jsonDecode()
	-- upvalues: Module29 (copy), config (copy)
	local NewModule = Module29.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ImageStringProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module29.descriptor = {
	name = "ImageStringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ImageStringProp_ConditionalOptions = Module29
TypeRegistryModule.default:register(config.ImageStringProp_ConditionalOptions)
local Module30 = {}
Module30.__index = Module30

function Module30.new(p1)
	-- upvalues: Module30 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module30))
end

function Module30:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "format" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "translation" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module30.decode(Buf)
	-- upvalues: Module30 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module30.new()
	local v31 = 0
	while v31 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v851 = ProtoModule.readTag(Buf, v31)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v851 = ProtoModule.readVarInt(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v851 = ProtoModule.readBuffer(Buf, v31)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v851 = ProtoModule.readBuffer(Buf, v31)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v851 = ProtoModule.readBuffer(Buf, v31)
				NewModule.kind = {
					type = "format",
					value = config.StringFormat.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v851 = ProtoModule.readBuffer(Buf, v31)
				NewModule.kind = {
					type = "conditional",
					value = config.ImageSetProp_ConditionalOptions.decode(Buffer4)
				}
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v851 = ProtoModule.readBuffer(Buf, v31)
				NewModule.kind = {
					type = "translation",
					value = config.TranslationRef.decode(Buffer5)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v31)
				v31 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v851 = ProtoModule.readFixed32(Buf, v31)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v851 = ProtoModule.readFixed64(Buf, v31)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module30:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module30:jsonDecode()
	-- upvalues: Module30 (copy), config (copy)
	local NewModule = Module30.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		NewModule.kind = {
			type = "format",
			value = config.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ImageSetProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		NewModule.kind = {
			type = "translation",
			value = config.TranslationRef.jsonDecode(self.translation)
		}
	end
	return NewModule
end

Module30.descriptor = {
	name = "ImageSetProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
}
config.ImageSetProp = Module30
TypeRegistryModule.default:register(config.ImageSetProp)
local Module31 = {}
Module31.__index = Module31

function Module31.new(p1)
	-- upvalues: Module31 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module31))
end

function Module31:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "format" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "translation" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult5, WriteTagResult2_4, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module31.decode(Buf)
	-- upvalues: Module31 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module31.new()
	local v32 = 0
	while v32 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v882 = ProtoModule.readTag(Buf, v32)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v882 = ProtoModule.readVarInt(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v882 = ProtoModule.readBuffer(Buf, v32)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v882 = ProtoModule.readBuffer(Buf, v32)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v882 = ProtoModule.readBuffer(Buf, v32)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v882 = ProtoModule.readBuffer(Buf, v32)
				NewModule.kind = {
					type = "format",
					value = config.StringFormat.decode(Buffer4)
				}
			elseif Tag == 5 then
				local Buffer5
				Buffer5, v882 = ProtoModule.readBuffer(Buf, v32)
				NewModule.kind = {
					type = "translation",
					value = config.TranslationRef.decode(Buffer5)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v32)
				v32 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v882 = ProtoModule.readFixed32(Buf, v32)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v882 = ProtoModule.readFixed64(Buf, v32)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module31:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "format" then
			t.format = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "translation" then
			t.translation = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module31:jsonDecode()
	-- upvalues: Module31 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module31.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		NewModule.kind = {
			type = "format",
			value = config.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		NewModule.kind = {
			type = "translation",
			value = config.TranslationRef.jsonDecode(self.translation)
		}
	end
	return NewModule
end

Module31.descriptor = {
	name = "ImageSetProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ImageSetProp_ConditionalOption = Module31
TypeRegistryModule.default:register(config.ImageSetProp_ConditionalOption)
local Module32 = {}
Module32.__index = Module32

function Module32.new(p1)
	-- upvalues: Module32 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module32))
end

function Module32:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module32.decode(Buf)
	-- upvalues: Module32 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module32.new()
	local v33 = 0
	while v33 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v903 = ProtoModule.readTag(Buf, v33)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v903 = ProtoModule.readVarInt(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v903 = ProtoModule.readBuffer(Buf, v33)
				table.insert(NewModule.options, config.ImageSetProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v33)
				v33 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v903 = ProtoModule.readFixed32(Buf, v33)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v903 = ProtoModule.readFixed64(Buf, v33)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module32:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module32:jsonDecode()
	-- upvalues: Module32 (copy), config (copy)
	local NewModule = Module32.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ImageSetProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module32.descriptor = {
	name = "ImageSetProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ImageSetProp_ConditionalOptions = Module32
TypeRegistryModule.default:register(config.ImageSetProp_ConditionalOptions)
local Module33 = {}
Module33.__index = Module33

function Module33.new(p1)
	-- upvalues: Module33 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module33))
end

function Module33:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module33.decode(Buf)
	-- upvalues: Module33 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module33.new()
	local v34 = 0
	while v34 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v928 = ProtoModule.readTag(Buf, v34)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v928 = ProtoModule.readVarInt(Buf, v34)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v928 = ProtoModule.readBuffer(Buf, v34)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v928 = ProtoModule.readBuffer(Buf, v34)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v928 = ProtoModule.readBuffer(Buf, v34)
				NewModule.kind = {
					type = "conditional",
					value = config.ColorProp_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v928 = ProtoModule.readBuffer(Buf, v34)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v34)
				v34 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v928 = ProtoModule.readFixed32(Buf, v34)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v928 = ProtoModule.readFixed64(Buf, v34)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module33:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module33:jsonDecode()
	-- upvalues: Module33 (copy), config (copy)
	local NewModule = Module33.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ColorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module33.descriptor = {
	name = "ColorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
}
config.ColorProp = Module33
TypeRegistryModule.default:register(config.ColorProp)
local Module34 = {}
Module34.__index = Module34

function Module34.new(p1)
	-- upvalues: Module34 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module34))
end

function Module34:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module34.decode(Buf)
	-- upvalues: Module34 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module34.new()
	local v35 = 0
	while v35 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v954 = ProtoModule.readTag(Buf, v35)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v954 = ProtoModule.readVarInt(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v954 = ProtoModule.readBuffer(Buf, v35)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v954 = ProtoModule.readBuffer(Buf, v35)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v954 = ProtoModule.readBuffer(Buf, v35)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v954 = ProtoModule.readBuffer(Buf, v35)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v35)
				v35 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v954 = ProtoModule.readFixed32(Buf, v35)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v954 = ProtoModule.readFixed64(Buf, v35)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module34:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module34:jsonDecode()
	-- upvalues: Module34 (copy), PropConditionModule (copy)
	local NewModule = Module34.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module34.descriptor = {
	name = "ColorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ColorProp_ConditionalOption = Module34
TypeRegistryModule.default:register(config.ColorProp_ConditionalOption)
local Module35 = {}
Module35.__index = Module35

function Module35.new(p1)
	-- upvalues: Module35 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module35))
end

function Module35:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module35.decode(Buf)
	-- upvalues: Module35 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module35.new()
	local v36 = 0
	while v36 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v974 = ProtoModule.readTag(Buf, v36)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v974 = ProtoModule.readVarInt(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v974 = ProtoModule.readBuffer(Buf, v36)
				table.insert(NewModule.options, config.ColorProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v36)
				v36 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v974 = ProtoModule.readFixed32(Buf, v36)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v974 = ProtoModule.readFixed64(Buf, v36)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module35:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module35:jsonDecode()
	-- upvalues: Module35 (copy), config (copy)
	local NewModule = Module35.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ColorProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module35.descriptor = {
	name = "ColorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ColorProp_ConditionalOptions = Module35
TypeRegistryModule.default:register(config.ColorProp_ConditionalOptions)
local Module36 = {}
Module36.__index = Module36

function Module36.new(p1)
	-- upvalues: Module36 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module36))
end

function Module36:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module36.decode(Buf)
	-- upvalues: Module36 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module36.new()
	local v37 = 0
	while v37 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v995 = ProtoModule.readTag(Buf, v37)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v995 = ProtoModule.readVarInt(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v995 = ProtoModule.readBuffer(Buf, v37)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v995 = ProtoModule.readBuffer(Buf, v37)
				NewModule.kind = {
					type = "conditional",
					value = config.TypographyProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v37)
				v37 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v995 = ProtoModule.readFixed32(Buf, v37)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v995 = ProtoModule.readFixed64(Buf, v37)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module36:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module36:jsonDecode()
	-- upvalues: Module36 (copy), config (copy)
	local NewModule = Module36.new()
	
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.TypographyProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module36.descriptor = {
	name = "TypographyProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
}
config.TypographyProp = Module36
TypeRegistryModule.default:register(config.TypographyProp)
local Module37 = {}
Module37.__index = Module37

function Module37.new(p1)
	-- upvalues: Module37 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module37))
end

function Module37:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module37.decode(Buf)
	-- upvalues: Module37 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module37.new()
	local v38 = 0
	while v38 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1015 = ProtoModule.readTag(Buf, v38)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1015 = ProtoModule.readVarInt(Buf, v38)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1015 = ProtoModule.readBuffer(Buf, v38)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1015 = ProtoModule.readBuffer(Buf, v38)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v38)
				v38 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1015 = ProtoModule.readFixed32(Buf, v38)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1015 = ProtoModule.readFixed64(Buf, v38)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module37:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function Module37:jsonDecode()
	-- upvalues: Module37 (copy), PropConditionModule (copy)
	local NewModule = Module37.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	return NewModule
end

Module37.descriptor = {
	name = "TypographyProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.TypographyProp_ConditionalOption = Module37
TypeRegistryModule.default:register(config.TypographyProp_ConditionalOption)
local Module38 = {}
Module38.__index = Module38

function Module38.new(p1)
	-- upvalues: Module38 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module38))
end

function Module38:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module38.decode(Buf)
	-- upvalues: Module38 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module38.new()
	local v39 = 0
	while v39 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1033 = ProtoModule.readTag(Buf, v39)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1033 = ProtoModule.readVarInt(Buf, v39)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1033 = ProtoModule.readBuffer(Buf, v39)
				table.insert(NewModule.options, config.TypographyProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v39)
				v39 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1033 = ProtoModule.readFixed32(Buf, v39)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1033 = ProtoModule.readFixed64(Buf, v39)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module38:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module38:jsonDecode()
	-- upvalues: Module38 (copy), config (copy)
	local NewModule = Module38.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.TypographyProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module38.descriptor = {
	name = "TypographyProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.TypographyProp_ConditionalOptions = Module38
TypeRegistryModule.default:register(config.TypographyProp_ConditionalOptions)
local Module39 = {}
Module39.__index = Module39

function Module39.new(p1)
	-- upvalues: Module39 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module39))
end

function Module39:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module39.decode(Buf)
	-- upvalues: Module39 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module39.new()
	local v40 = 0
	while v40 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1054 = ProtoModule.readTag(Buf, v40)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1054 = ProtoModule.readVarInt(Buf, v40)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1054 = ProtoModule.readBuffer(Buf, v40)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1054 = ProtoModule.readBuffer(Buf, v40)
				NewModule.kind = {
					type = "conditional",
					value = config.TypographyFontProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v40)
				v40 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1054 = ProtoModule.readFixed32(Buf, v40)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1054 = ProtoModule.readFixed64(Buf, v40)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module39:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module39:jsonDecode()
	-- upvalues: Module39 (copy), config (copy)
	local NewModule = Module39.new()
	
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.TypographyFontProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module39.descriptor = {
	name = "TypographyFontProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
}
config.TypographyFontProp = Module39
TypeRegistryModule.default:register(config.TypographyFontProp)
local Module40 = {}
Module40.__index = Module40

function Module40.new(p1)
	-- upvalues: Module40 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module40))
end

function Module40:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module40.decode(Buf)
	-- upvalues: Module40 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module40.new()
	local v41 = 0
	while v41 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1074 = ProtoModule.readTag(Buf, v41)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1074 = ProtoModule.readVarInt(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1074 = ProtoModule.readBuffer(Buf, v41)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1074 = ProtoModule.readBuffer(Buf, v41)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v41)
				v41 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1074 = ProtoModule.readFixed32(Buf, v41)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1074 = ProtoModule.readFixed64(Buf, v41)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module40:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function Module40:jsonDecode()
	-- upvalues: Module40 (copy), PropConditionModule (copy)
	local NewModule = Module40.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	return NewModule
end

Module40.descriptor = {
	name = "TypographyFontProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.TypographyFontProp_ConditionalOption = Module40
TypeRegistryModule.default:register(config.TypographyFontProp_ConditionalOption)
local Module41 = {}
Module41.__index = Module41

function Module41.new(p1)
	-- upvalues: Module41 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module41))
end

function Module41:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module41.decode(Buf)
	-- upvalues: Module41 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module41.new()
	local v42 = 0
	while v42 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1092 = ProtoModule.readTag(Buf, v42)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1092 = ProtoModule.readVarInt(Buf, v42)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1092 = ProtoModule.readBuffer(Buf, v42)
				table.insert(NewModule.options, config.TypographyFontProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v42)
				v42 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1092 = ProtoModule.readFixed32(Buf, v42)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1092 = ProtoModule.readFixed64(Buf, v42)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module41:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module41:jsonDecode()
	-- upvalues: Module41 (copy), config (copy)
	local NewModule = Module41.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.TypographyFontProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module41.descriptor = {
	name = "TypographyFontProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.TypographyFontProp_ConditionalOptions = Module41
TypeRegistryModule.default:register(config.TypographyFontProp_ConditionalOptions)
local Module42 = {}
Module42.__index = Module42

function Module42.new(p1)
	-- upvalues: Module42 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module42))
end

function Module42:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module42.decode(Buf)
	-- upvalues: Module42 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module42.new()
	local v43 = 0
	while v43 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1113 = ProtoModule.readTag(Buf, v43)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1113 = ProtoModule.readVarInt(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1113 = ProtoModule.readBuffer(Buf, v43)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1113 = ProtoModule.readBuffer(Buf, v43)
				NewModule.kind = {
					type = "conditional",
					value = config.ColorStyleProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v43)
				v43 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1113 = ProtoModule.readFixed32(Buf, v43)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1113 = ProtoModule.readFixed64(Buf, v43)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module42:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module42:jsonDecode()
	-- upvalues: Module42 (copy), config (copy)
	local NewModule = Module42.new()
	
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ColorStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module42.descriptor = {
	name = "ColorStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
}
config.ColorStyleProp = Module42
TypeRegistryModule.default:register(config.ColorStyleProp)
local Module43 = {}
Module43.__index = Module43

function Module43.new(p1)
	-- upvalues: Module43 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module43))
end

function Module43:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module43.decode(Buf)
	-- upvalues: Module43 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module43.new()
	local v44 = 0
	while v44 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1133 = ProtoModule.readTag(Buf, v44)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1133 = ProtoModule.readVarInt(Buf, v44)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1133 = ProtoModule.readBuffer(Buf, v44)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1133 = ProtoModule.readBuffer(Buf, v44)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v44)
				v44 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1133 = ProtoModule.readFixed32(Buf, v44)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1133 = ProtoModule.readFixed64(Buf, v44)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module43:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function Module43:jsonDecode()
	-- upvalues: Module43 (copy), PropConditionModule (copy)
	local NewModule = Module43.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	return NewModule
end

Module43.descriptor = {
	name = "ColorStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ColorStyleProp_ConditionalOption = Module43
TypeRegistryModule.default:register(config.ColorStyleProp_ConditionalOption)
local Module44 = {}
Module44.__index = Module44

function Module44.new(p1)
	-- upvalues: Module44 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module44))
end

function Module44:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module44.decode(Buf)
	-- upvalues: Module44 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module44.new()
	local v45 = 0
	while v45 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1151 = ProtoModule.readTag(Buf, v45)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1151 = ProtoModule.readVarInt(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1151 = ProtoModule.readBuffer(Buf, v45)
				table.insert(NewModule.options, config.ColorStyleProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v45)
				v45 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1151 = ProtoModule.readFixed32(Buf, v45)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1151 = ProtoModule.readFixed64(Buf, v45)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module44:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module44:jsonDecode()
	-- upvalues: Module44 (copy), config (copy)
	local NewModule = Module44.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ColorStyleProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module44.descriptor = {
	name = "ColorStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ColorStyleProp_ConditionalOptions = Module44
TypeRegistryModule.default:register(config.ColorStyleProp_ConditionalOptions)
local Module45 = {}
Module45.__index = Module45

function Module45.new(p1)
	-- upvalues: Module45 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module45))
end

function Module45:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module45.decode(Buf)
	-- upvalues: Module45 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module45.new()
	local v46 = 0
	while v46 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1174 = ProtoModule.readTag(Buf, v46)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1174 = ProtoModule.readVarInt(Buf, v46)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1174 = ProtoModule.readBuffer(Buf, v46)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1174 = ProtoModule.readBuffer(Buf, v46)
				NewModule.kind = {
					type = "conditional",
					value = config.FillBehaviorProp_ConditionalOptions.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1174 = ProtoModule.readBuffer(Buf, v46)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v46)
				v46 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1174 = ProtoModule.readFixed32(Buf, v46)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1174 = ProtoModule.readFixed64(Buf, v46)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module45:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module45:jsonDecode()
	-- upvalues: Module45 (copy), config (copy)
	local NewModule = Module45.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.FillBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module45.descriptor = {
	name = "FillBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
}
config.FillBehaviorProp = Module45
TypeRegistryModule.default:register(config.FillBehaviorProp)
local Module46 = {}
Module46.__index = Module46

function Module46.new(p1)
	-- upvalues: Module46 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module46))
end

function Module46:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module46.decode(Buf)
	-- upvalues: Module46 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module46.new()
	local v47 = 0
	while v47 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1197 = ProtoModule.readTag(Buf, v47)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1197 = ProtoModule.readVarInt(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1197 = ProtoModule.readBuffer(Buf, v47)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1197 = ProtoModule.readBuffer(Buf, v47)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1197 = ProtoModule.readBuffer(Buf, v47)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v47)
				v47 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1197 = ProtoModule.readFixed32(Buf, v47)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1197 = ProtoModule.readFixed64(Buf, v47)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module46:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module46:jsonDecode()
	-- upvalues: Module46 (copy), PropConditionModule (copy)
	local NewModule = Module46.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module46.descriptor = {
	name = "FillBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.FillBehaviorProp_ConditionalOption = Module46
TypeRegistryModule.default:register(config.FillBehaviorProp_ConditionalOption)
local Module47 = {}
Module47.__index = Module47

function Module47.new(p1)
	-- upvalues: Module47 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module47))
end

function Module47:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module47.decode(Buf)
	-- upvalues: Module47 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module47.new()
	local v48 = 0
	while v48 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1216 = ProtoModule.readTag(Buf, v48)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1216 = ProtoModule.readVarInt(Buf, v48)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1216 = ProtoModule.readBuffer(Buf, v48)
				table.insert(NewModule.options, config.FillBehaviorProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v48)
				v48 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1216 = ProtoModule.readFixed32(Buf, v48)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1216 = ProtoModule.readFixed64(Buf, v48)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module47:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module47:jsonDecode()
	-- upvalues: Module47 (copy), config (copy)
	local NewModule = Module47.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.FillBehaviorProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module47.descriptor = {
	name = "FillBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.FillBehaviorProp_ConditionalOptions = Module47
TypeRegistryModule.default:register(config.FillBehaviorProp_ConditionalOptions)
local Module48 = {}
Module48.__index = Module48

function Module48.new(p1)
	-- upvalues: Module48 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module48))
end

function Module48:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module48.decode(Buf)
	-- upvalues: Module48 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module48.new()
	local v49 = 0
	while v49 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1239 = ProtoModule.readTag(Buf, v49)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1239 = ProtoModule.readVarInt(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1239 = ProtoModule.readBuffer(Buf, v49)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1239 = ProtoModule.readBuffer(Buf, v49)
				NewModule.kind = {
					type = "conditional",
					value = config.InputSizeProp_ConditionalOptions.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1239 = ProtoModule.readBuffer(Buf, v49)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v49)
				v49 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1239 = ProtoModule.readFixed32(Buf, v49)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1239 = ProtoModule.readFixed64(Buf, v49)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module48:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module48:jsonDecode()
	-- upvalues: Module48 (copy), config (copy)
	local NewModule = Module48.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.InputSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module48.descriptor = {
	name = "InputSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
}
config.InputSizeProp = Module48
TypeRegistryModule.default:register(config.InputSizeProp)
local Module49 = {}
Module49.__index = Module49

function Module49.new(p1)
	-- upvalues: Module49 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module49))
end

function Module49:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module49.decode(Buf)
	-- upvalues: Module49 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module49.new()
	local v50 = 0
	while v50 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1262 = ProtoModule.readTag(Buf, v50)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1262 = ProtoModule.readVarInt(Buf, v50)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1262 = ProtoModule.readBuffer(Buf, v50)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1262 = ProtoModule.readBuffer(Buf, v50)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1262 = ProtoModule.readBuffer(Buf, v50)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v50)
				v50 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1262 = ProtoModule.readFixed32(Buf, v50)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1262 = ProtoModule.readFixed64(Buf, v50)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module49:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module49:jsonDecode()
	-- upvalues: Module49 (copy), PropConditionModule (copy)
	local NewModule = Module49.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module49.descriptor = {
	name = "InputSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.InputSizeProp_ConditionalOption = Module49
TypeRegistryModule.default:register(config.InputSizeProp_ConditionalOption)
local Module50 = {}
Module50.__index = Module50

function Module50.new(p1)
	-- upvalues: Module50 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module50))
end

function Module50:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module50.decode(Buf)
	-- upvalues: Module50 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module50.new()
	local v51 = 0
	while v51 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1281 = ProtoModule.readTag(Buf, v51)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1281 = ProtoModule.readVarInt(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1281 = ProtoModule.readBuffer(Buf, v51)
				table.insert(NewModule.options, config.InputSizeProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v51)
				v51 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1281 = ProtoModule.readFixed32(Buf, v51)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1281 = ProtoModule.readFixed64(Buf, v51)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module50:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module50:jsonDecode()
	-- upvalues: Module50 (copy), config (copy)
	local NewModule = Module50.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.InputSizeProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module50.descriptor = {
	name = "InputSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.InputSizeProp_ConditionalOptions = Module50
TypeRegistryModule.default:register(config.InputSizeProp_ConditionalOptions)
local Module51 = {}
Module51.__index = Module51

function Module51.new(p1)
	-- upvalues: Module51 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module51))
end

function Module51:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module51.decode(Buf)
	-- upvalues: Module51 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module51.new()
	local v52 = 0
	while v52 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1306 = ProtoModule.readTag(Buf, v52)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1306 = ProtoModule.readVarInt(Buf, v52)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1306 = ProtoModule.readBuffer(Buf, v52)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1306 = ProtoModule.readBuffer(Buf, v52)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1306 = ProtoModule.readBuffer(Buf, v52)
				NewModule.kind = {
					type = "conditional",
					value = config.UDimProp_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1306 = ProtoModule.readBuffer(Buf, v52)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v52)
				v52 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1306 = ProtoModule.readFixed32(Buf, v52)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1306 = ProtoModule.readFixed64(Buf, v52)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module51:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module51:jsonDecode()
	-- upvalues: Module51 (copy), config (copy)
	local NewModule = Module51.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.UDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module51.descriptor = {
	name = "UDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
}
config.UDimProp = Module51
TypeRegistryModule.default:register(config.UDimProp)
local Module52 = {}
Module52.__index = Module52

function Module52.new(p1)
	-- upvalues: Module52 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module52))
end

function Module52:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module52.decode(Buf)
	-- upvalues: Module52 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module52.new()
	local v53 = 0
	while v53 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1332 = ProtoModule.readTag(Buf, v53)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1332 = ProtoModule.readVarInt(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1332 = ProtoModule.readBuffer(Buf, v53)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1332 = ProtoModule.readBuffer(Buf, v53)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1332 = ProtoModule.readBuffer(Buf, v53)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1332 = ProtoModule.readBuffer(Buf, v53)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v53)
				v53 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1332 = ProtoModule.readFixed32(Buf, v53)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1332 = ProtoModule.readFixed64(Buf, v53)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module52:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module52:jsonDecode()
	-- upvalues: Module52 (copy), PropConditionModule (copy)
	local NewModule = Module52.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module52.descriptor = {
	name = "UDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.UDimProp_ConditionalOption = Module52
TypeRegistryModule.default:register(config.UDimProp_ConditionalOption)
local Module53 = {}
Module53.__index = Module53

function Module53.new(p1)
	-- upvalues: Module53 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module53))
end

function Module53:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module53.decode(Buf)
	-- upvalues: Module53 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module53.new()
	local v54 = 0
	while v54 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1352 = ProtoModule.readTag(Buf, v54)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1352 = ProtoModule.readVarInt(Buf, v54)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1352 = ProtoModule.readBuffer(Buf, v54)
				table.insert(NewModule.options, config.UDimProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v54)
				v54 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1352 = ProtoModule.readFixed32(Buf, v54)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1352 = ProtoModule.readFixed64(Buf, v54)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module53:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module53:jsonDecode()
	-- upvalues: Module53 (copy), config (copy)
	local NewModule = Module53.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.UDimProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module53.descriptor = {
	name = "UDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.UDimProp_ConditionalOptions = Module53
TypeRegistryModule.default:register(config.UDimProp_ConditionalOptions)
local Module54 = {}
Module54.__index = Module54

function Module54.new(p1)
	-- upvalues: Module54 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module54))
end

function Module54:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module54.decode(Buf)
	-- upvalues: Module54 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module54.new()
	local v55 = 0
	while v55 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1377 = ProtoModule.readTag(Buf, v55)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1377 = ProtoModule.readVarInt(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1377 = ProtoModule.readBuffer(Buf, v55)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1377 = ProtoModule.readBuffer(Buf, v55)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1377 = ProtoModule.readBuffer(Buf, v55)
				NewModule.kind = {
					type = "conditional",
					value = config.UDim2Prop_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1377 = ProtoModule.readBuffer(Buf, v55)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v55)
				v55 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1377 = ProtoModule.readFixed32(Buf, v55)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1377 = ProtoModule.readFixed64(Buf, v55)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module54:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module54:jsonDecode()
	-- upvalues: Module54 (copy), config (copy)
	local NewModule = Module54.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.UDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module54.descriptor = {
	name = "UDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
}
config.UDim2Prop = Module54
TypeRegistryModule.default:register(config.UDim2Prop)
local Module55 = {}
Module55.__index = Module55

function Module55.new(p1)
	-- upvalues: Module55 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module55))
end

function Module55:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module55.decode(Buf)
	-- upvalues: Module55 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module55.new()
	local v56 = 0
	while v56 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1403 = ProtoModule.readTag(Buf, v56)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1403 = ProtoModule.readVarInt(Buf, v56)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1403 = ProtoModule.readBuffer(Buf, v56)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1403 = ProtoModule.readBuffer(Buf, v56)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1403 = ProtoModule.readBuffer(Buf, v56)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1403 = ProtoModule.readBuffer(Buf, v56)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v56)
				v56 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1403 = ProtoModule.readFixed32(Buf, v56)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1403 = ProtoModule.readFixed64(Buf, v56)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module55:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module55:jsonDecode()
	-- upvalues: Module55 (copy), PropConditionModule (copy)
	local NewModule = Module55.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module55.descriptor = {
	name = "UDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.UDim2Prop_ConditionalOption = Module55
TypeRegistryModule.default:register(config.UDim2Prop_ConditionalOption)
local Module56 = {}
Module56.__index = Module56

function Module56.new(p1)
	-- upvalues: Module56 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module56))
end

function Module56:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module56.decode(Buf)
	-- upvalues: Module56 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module56.new()
	local v57 = 0
	while v57 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1423 = ProtoModule.readTag(Buf, v57)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1423 = ProtoModule.readVarInt(Buf, v57)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1423 = ProtoModule.readBuffer(Buf, v57)
				table.insert(NewModule.options, config.UDim2Prop_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v57)
				v57 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1423 = ProtoModule.readFixed32(Buf, v57)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1423 = ProtoModule.readFixed64(Buf, v57)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module56:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module56:jsonDecode()
	-- upvalues: Module56 (copy), config (copy)
	local NewModule = Module56.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.UDim2Prop_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module56.descriptor = {
	name = "UDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.UDim2Prop_ConditionalOptions = Module56
TypeRegistryModule.default:register(config.UDim2Prop_ConditionalOptions)
local Module57 = {}
Module57.__index = Module57

function Module57.new(p1)
	-- upvalues: Module57 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module57))
end

function Module57:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module57.decode(Buf)
	-- upvalues: Module57 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module57.new()
	local v58 = 0
	while v58 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1448 = ProtoModule.readTag(Buf, v58)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1448 = ProtoModule.readVarInt(Buf, v58)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1448 = ProtoModule.readBuffer(Buf, v58)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1448 = ProtoModule.readBuffer(Buf, v58)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1448 = ProtoModule.readBuffer(Buf, v58)
				NewModule.kind = {
					type = "conditional",
					value = config.Vector2Prop_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1448 = ProtoModule.readBuffer(Buf, v58)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v58)
				v58 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1448 = ProtoModule.readFixed32(Buf, v58)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1448 = ProtoModule.readFixed64(Buf, v58)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module57:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module57:jsonDecode()
	-- upvalues: Module57 (copy), config (copy)
	local NewModule = Module57.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.Vector2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module57.descriptor = {
	name = "Vector2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
}
config.Vector2Prop = Module57
TypeRegistryModule.default:register(config.Vector2Prop)
local Module58 = {}
Module58.__index = Module58

function Module58.new(p1)
	-- upvalues: Module58 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module58))
end

function Module58:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module58.decode(Buf)
	-- upvalues: Module58 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module58.new()
	local v59 = 0
	while v59 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1474 = ProtoModule.readTag(Buf, v59)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1474 = ProtoModule.readVarInt(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1474 = ProtoModule.readBuffer(Buf, v59)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1474 = ProtoModule.readBuffer(Buf, v59)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1474 = ProtoModule.readBuffer(Buf, v59)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1474 = ProtoModule.readBuffer(Buf, v59)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v59)
				v59 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1474 = ProtoModule.readFixed32(Buf, v59)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1474 = ProtoModule.readFixed64(Buf, v59)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module58:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module58:jsonDecode()
	-- upvalues: Module58 (copy), PropConditionModule (copy)
	local NewModule = Module58.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module58.descriptor = {
	name = "Vector2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.Vector2Prop_ConditionalOption = Module58
TypeRegistryModule.default:register(config.Vector2Prop_ConditionalOption)
local Module59 = {}
Module59.__index = Module59

function Module59.new(p1)
	-- upvalues: Module59 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module59))
end

function Module59:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module59.decode(Buf)
	-- upvalues: Module59 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module59.new()
	local v60 = 0
	while v60 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1494 = ProtoModule.readTag(Buf, v60)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1494 = ProtoModule.readVarInt(Buf, v60)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1494 = ProtoModule.readBuffer(Buf, v60)
				table.insert(NewModule.options, config.Vector2Prop_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v60)
				v60 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1494 = ProtoModule.readFixed32(Buf, v60)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1494 = ProtoModule.readFixed64(Buf, v60)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module59:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module59:jsonDecode()
	-- upvalues: Module59 (copy), config (copy)
	local NewModule = Module59.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.Vector2Prop_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module59.descriptor = {
	name = "Vector2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.Vector2Prop_ConditionalOptions = Module59
TypeRegistryModule.default:register(config.Vector2Prop_ConditionalOptions)
local Module60 = {}
Module60.__index = Module60

function Module60.new(p1)
	-- upvalues: Module60 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module60))
end

function Module60:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module60.decode(Buf)
	-- upvalues: Module60 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module60.new()
	local v61 = 0
	while v61 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1517 = ProtoModule.readTag(Buf, v61)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1517 = ProtoModule.readVarInt(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1517 = ProtoModule.readBuffer(Buf, v61)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1517 = ProtoModule.readBuffer(Buf, v61)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1517 = ProtoModule.readBuffer(Buf, v61)
				NewModule.kind = {
					type = "conditional",
					value = config.IconProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v61)
				v61 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1517 = ProtoModule.readFixed32(Buf, v61)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1517 = ProtoModule.readFixed64(Buf, v61)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module60:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module60:jsonDecode()
	-- upvalues: Module60 (copy), config (copy)
	local NewModule = Module60.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.IconProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module60.descriptor = {
	name = "IconProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
}
config.IconProp = Module60
TypeRegistryModule.default:register(config.IconProp)
local Module61 = {}
Module61.__index = Module61

function Module61.new(p1)
	-- upvalues: Module61 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module61))
end

function Module61:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module61.decode(Buf)
	-- upvalues: Module61 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module61.new()
	local v62 = 0
	while v62 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1540 = ProtoModule.readTag(Buf, v62)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1540 = ProtoModule.readVarInt(Buf, v62)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1540 = ProtoModule.readBuffer(Buf, v62)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1540 = ProtoModule.readBuffer(Buf, v62)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1540 = ProtoModule.readBuffer(Buf, v62)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v62)
				v62 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1540 = ProtoModule.readFixed32(Buf, v62)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1540 = ProtoModule.readFixed64(Buf, v62)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module61:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module61:jsonDecode()
	-- upvalues: Module61 (copy), PropConditionModule (copy)
	local NewModule = Module61.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module61.descriptor = {
	name = "IconProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.IconProp_ConditionalOption = Module61
TypeRegistryModule.default:register(config.IconProp_ConditionalOption)
local Module62 = {}
Module62.__index = Module62

function Module62.new(p1)
	-- upvalues: Module62 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module62))
end

function Module62:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module62.decode(Buf)
	-- upvalues: Module62 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module62.new()
	local v63 = 0
	while v63 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1559 = ProtoModule.readTag(Buf, v63)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1559 = ProtoModule.readVarInt(Buf, v63)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1559 = ProtoModule.readBuffer(Buf, v63)
				table.insert(NewModule.options, config.IconProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v63)
				v63 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1559 = ProtoModule.readFixed32(Buf, v63)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1559 = ProtoModule.readFixed64(Buf, v63)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module62:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module62:jsonDecode()
	-- upvalues: Module62 (copy), config (copy)
	local NewModule = Module62.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.IconProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module62.descriptor = {
	name = "IconProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.IconProp_ConditionalOptions = Module62
TypeRegistryModule.default:register(config.IconProp_ConditionalOptions)
local Module63 = {}
Module63.__index = Module63

function Module63.new(p1)
	-- upvalues: Module63 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module63))
end

function Module63:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module63.decode(Buf)
	-- upvalues: Module63 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module63.new()
	local v64 = 0
	while v64 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1583 = ProtoModule.readTag(Buf, v64)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1583 = ProtoModule.readVarInt(Buf, v64)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1583 = ProtoModule.readBuffer(Buf, v64)
				NewModule.kind = {
					type = "literal",
					value = config.FoundationIconConfigProp_FoundationIconConfig.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1583 = ProtoModule.readBuffer(Buf, v64)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1583 = ProtoModule.readBuffer(Buf, v64)
				NewModule.kind = {
					type = "conditional",
					value = config.FoundationIconConfigProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v64)
				v64 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1583 = ProtoModule.readFixed32(Buf, v64)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1583 = ProtoModule.readFixed64(Buf, v64)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module63:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module63:jsonDecode()
	-- upvalues: Module63 (copy), config (copy)
	local NewModule = Module63.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.FoundationIconConfigProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module63.descriptor = {
	name = "FoundationIconConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfigProp"
}
config.FoundationIconConfigProp = Module63
TypeRegistryModule.default:register(config.FoundationIconConfigProp)
local Module64 = {}
Module64.__index = Module64

function Module64.new(p1)
	-- upvalues: Module64 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module64))
end

function Module64:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module64.decode(Buf)
	-- upvalues: Module64 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module64.new()
	local v65 = 0
	while v65 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1607 = ProtoModule.readTag(Buf, v65)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1607 = ProtoModule.readVarInt(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1607 = ProtoModule.readBuffer(Buf, v65)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1607 = ProtoModule.readBuffer(Buf, v65)
				NewModule.kind = {
					type = "literal",
					value = config.FoundationIconConfigProp_FoundationIconConfig.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1607 = ProtoModule.readBuffer(Buf, v65)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v65)
				v65 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1607 = ProtoModule.readFixed32(Buf, v65)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1607 = ProtoModule.readFixed64(Buf, v65)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module64:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module64:jsonDecode()
	-- upvalues: Module64 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module64.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module64.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.FoundationIconConfigProp_ConditionalOption = Module64
TypeRegistryModule.default:register(config.FoundationIconConfigProp_ConditionalOption)
local Module65 = {}
Module65.__index = Module65

function Module65.new(p1)
	-- upvalues: Module65 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module65))
end

function Module65:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module65.decode(Buf)
	-- upvalues: Module65 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module65.new()
	local v66 = 0
	while v66 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1626 = ProtoModule.readTag(Buf, v66)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1626 = ProtoModule.readVarInt(Buf, v66)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1626 = ProtoModule.readBuffer(Buf, v66)
				table.insert(NewModule.options, config.FoundationIconConfigProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v66)
				v66 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1626 = ProtoModule.readFixed32(Buf, v66)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1626 = ProtoModule.readFixed64(Buf, v66)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module65:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module65:jsonDecode()
	-- upvalues: Module65 (copy), config (copy)
	local NewModule = Module65.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.FoundationIconConfigProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module65.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.FoundationIconConfigProp_ConditionalOptions = Module65
TypeRegistryModule.default:register(config.FoundationIconConfigProp_ConditionalOptions)
local Module66 = {}
Module66.__index = Module66

function Module66.new(p1)
	-- upvalues: Module66 (copy)
	return (setmetatable({
		name = if p1 == nil or p1.name == nil then nil else p1.name,
		variant = if p1 == nil or p1.variant == nil then nil else p1.variant
	}, Module66))
end

function Module66:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.name ~= nil then
		local EncodeResult = self.name:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.variant ~= nil then
		local EncodeResult = self.variant:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module66.decode(Buf)
	-- upvalues: Module66 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module66.new()
	local v67 = 0
	while v67 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1648 = ProtoModule.readTag(Buf, v67)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1648 = ProtoModule.readVarInt(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1648 = ProtoModule.readBuffer(Buf, v67)
				NewModule.name = config.StringProp.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1648 = ProtoModule.readBuffer(Buf, v67)
				NewModule.variant = config.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v67)
				v67 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1648 = ProtoModule.readFixed32(Buf, v67)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1648 = ProtoModule.readFixed64(Buf, v67)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module66:jsonEncode()
	local t = {}
	
	if self.name ~= nil then
		t.name = self.name:jsonEncode()
	end
	if self.variant ~= nil then
		t.variant = self.variant:jsonEncode()
	end
	return t
end

function Module66:jsonDecode()
	-- upvalues: Module66 (copy), config (copy)
	local NewModule = Module66.new()
	
	if self.name ~= nil then
		NewModule.name = config.StringProp.jsonDecode(self.name)
	end
	if self.variant ~= nil then
		NewModule.variant = config.StringProp.jsonDecode(self.variant)
	end
	return NewModule
end

Module66.descriptor = {
	name = "FoundationIconConfigProp_FoundationIconConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfig"
}
config.FoundationIconConfigProp_FoundationIconConfig = Module66
TypeRegistryModule.default:register(config.FoundationIconConfigProp_FoundationIconConfig)
local Module67 = {}
Module67.__index = Module67

function Module67.new(p1)
	-- upvalues: Module67 (copy)
	return (setmetatable({
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, Module67))
end

function Module67:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "int32_prop" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module67.decode(Buf)
	-- upvalues: Module67 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module67.new()
	local v68 = 0
	while v68 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1669 = ProtoModule.readTag(Buf, v68)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1669 = ProtoModule.readVarInt(Buf, v68)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1669 = ProtoModule.readBuffer(Buf, v68)
				NewModule.oneof_prop = {
					type = "string_prop",
					value = config.StringProp.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1669 = ProtoModule.readBuffer(Buf, v68)
				NewModule.oneof_prop = {
					type = "int32_prop",
					value = config.Int32Prop.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v68)
				v68 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1669 = ProtoModule.readFixed32(Buf, v68)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1669 = ProtoModule.readFixed64(Buf, v68)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module67:jsonEncode()
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			t.stringProp = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "int32_prop" then
			t.int32Prop = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function Module67:jsonDecode()
	-- upvalues: Module67 (copy), config (copy)
	local NewModule = Module67.new()
	
	if self.string_prop ~= nil then
		NewModule.oneof_prop = {
			type = "string_prop",
			value = config.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		NewModule.oneof_prop = {
			type = "string_prop",
			value = config.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		NewModule.oneof_prop = {
			type = "int32_prop",
			value = config.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		NewModule.oneof_prop = {
			type = "int32_prop",
			value = config.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	return NewModule
end

Module67.descriptor = {
	name = "IconSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconSizeProp"
}
config.IconSizeProp = Module67
TypeRegistryModule.default:register(config.IconSizeProp)
local Module68 = {}
Module68.__index = Module68

function Module68.new(p1)
	-- upvalues: Module68 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module68))
end

function Module68:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module68.decode(Buf)
	-- upvalues: Module68 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module68.new()
	local v69 = 0
	while v69 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1692 = ProtoModule.readTag(Buf, v69)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1692 = ProtoModule.readVarInt(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1692 = ProtoModule.readBuffer(Buf, v69)
				NewModule.kind = {
					type = "literal",
					value = config.GradientProp_GradientData.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1692 = ProtoModule.readBuffer(Buf, v69)
				NewModule.kind = {
					type = "conditional",
					value = config.GradientProp_ConditionalOptions.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1692 = ProtoModule.readBuffer(Buf, v69)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v69)
				v69 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1692 = ProtoModule.readFixed32(Buf, v69)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1692 = ProtoModule.readFixed64(Buf, v69)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module68:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module68:jsonDecode()
	-- upvalues: Module68 (copy), config (copy)
	local NewModule = Module68.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.GradientProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module68.descriptor = {
	name = "GradientProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
}
config.GradientProp = Module68
TypeRegistryModule.default:register(config.GradientProp)
local Module69 = {}
Module69.__index = Module69

function Module69.new(p1)
	-- upvalues: Module69 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module69))
end

function Module69:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module69.decode(Buf)
	-- upvalues: Module69 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module69.new()
	local v70 = 0
	while v70 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1716 = ProtoModule.readTag(Buf, v70)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1716 = ProtoModule.readVarInt(Buf, v70)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1716 = ProtoModule.readBuffer(Buf, v70)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1716 = ProtoModule.readBuffer(Buf, v70)
				NewModule.kind = {
					type = "literal",
					value = config.GradientProp_GradientData.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1716 = ProtoModule.readBuffer(Buf, v70)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v70)
				v70 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1716 = ProtoModule.readFixed32(Buf, v70)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1716 = ProtoModule.readFixed64(Buf, v70)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module69:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module69:jsonDecode()
	-- upvalues: Module69 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module69.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module69.descriptor = {
	name = "GradientProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.GradientProp_ConditionalOption = Module69
TypeRegistryModule.default:register(config.GradientProp_ConditionalOption)
local Module70 = {}
Module70.__index = Module70

function Module70.new(p1)
	-- upvalues: Module70 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module70))
end

function Module70:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module70.decode(Buf)
	-- upvalues: Module70 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module70.new()
	local v71 = 0
	while v71 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1735 = ProtoModule.readTag(Buf, v71)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1735 = ProtoModule.readVarInt(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1735 = ProtoModule.readBuffer(Buf, v71)
				table.insert(NewModule.options, config.GradientProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v71)
				v71 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1735 = ProtoModule.readFixed32(Buf, v71)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1735 = ProtoModule.readFixed64(Buf, v71)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module70:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module70:jsonDecode()
	-- upvalues: Module70 (copy), config (copy)
	local NewModule = Module70.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.GradientProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module70.descriptor = {
	name = "GradientProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.GradientProp_ConditionalOptions = Module70
TypeRegistryModule.default:register(config.GradientProp_ConditionalOptions)
local Module71 = {}
Module71.__index = Module71

function Module71.new(p1)
	-- upvalues: Module71 (copy)
	return (setmetatable({
		start_color = if p1 == nil or p1.start_color == nil then "" else p1.start_color,
		end_color = if p1 == nil or p1.end_color == nil then "" else p1.end_color,
		start_opacity = if p1 == nil or p1.start_opacity == nil then 0 else p1.start_opacity,
		end_opacity = if p1 == nil or p1.end_opacity == nil then 0 else p1.end_opacity,
		degree = if p1 == nil or p1.degree == nil then 0 else p1.degree,
		midpoint_percent = if p1 == nil or p1.midpoint_percent == nil then 0 else p1.midpoint_percent
	}, Module71))
end

function Module71:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.start_color ~= nil and self.start_color ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.start_color)
	end
	if self.end_color ~= nil and self.end_color ~= "" then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.end_color)
	end
	if self.start_opacity ~= nil and self.start_opacity ~= 0 then
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult3, WriteTagResult2_2, self.start_opacity)
	end
	if self.end_opacity ~= nil and self.end_opacity ~= 0 then
		local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult4, WriteTagResult2_3, self.end_opacity)
	end
	if self.degree ~= nil and self.degree ~= 0 then
		local WriteTagResult5, WriteTagResult2_4 = ProtoModule.writeTag(Buf, Count, 5, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult5, WriteTagResult2_4, self.degree)
	end
	if self.midpoint_percent ~= nil and self.midpoint_percent ~= 0 then
		local WriteTagResult6, WriteTagResult2_5 = ProtoModule.writeTag(Buf, Count, 6, ProtoModule.wireTypes.i32)
		Buf, Count = ProtoModule.writeFloat(WriteTagResult6, WriteTagResult2_5, self.midpoint_percent)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module71.decode(Buf)
	-- upvalues: Module71 (copy), ProtoModule (copy)
	local NewModule = Module71.new()
	local v72 = 0
	while v72 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1763 = ProtoModule.readTag(Buf, v72)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 5 then
				NewModule.degree, v1763 = ProtoModule.readVarIntI32(Buf, v72)
			else
				local _
				_, v1763 = ProtoModule.readVarInt(Buf, v72)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1763 = ProtoModule.readBuffer(Buf, v72)
				NewModule.start_color = buffer.tostring(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1763 = ProtoModule.readBuffer(Buf, v72)
				NewModule.end_color = buffer.tostring(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v72)
				v72 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			if Tag == 3 then
				NewModule.start_opacity, v1763 = ProtoModule.readFloat(Buf, v72)
			elseif Tag == 4 then
				NewModule.end_opacity, v1763 = ProtoModule.readFloat(Buf, v72)
			elseif Tag == 6 then
				NewModule.midpoint_percent, v1763 = ProtoModule.readFloat(Buf, v72)
			else
				local _
				_, v1763 = ProtoModule.readFixed32(Buf, v72)
			end
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1763 = ProtoModule.readFixed64(Buf, v72)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module71:jsonEncode()
	-- upvalues: ProtoModule (copy)
	local t = {}
	
	if self.start_color ~= nil and self.start_color ~= "" then
		t.startColor = self.start_color
	end
	if self.end_color ~= nil and self.end_color ~= "" then
		t.endColor = self.end_color
	end
	if self.start_opacity ~= nil and self.start_opacity ~= 0 then
		t.startOpacity = ProtoModule.json.serializeNumber(self.start_opacity)
	end
	if self.end_opacity ~= nil and self.end_opacity ~= 0 then
		t.endOpacity = ProtoModule.json.serializeNumber(self.end_opacity)
	end
	if self.degree ~= nil and self.degree ~= 0 then
		t.degree = self.degree
	end
	if self.midpoint_percent ~= nil and self.midpoint_percent ~= 0 then
		t.midpointPercent = ProtoModule.json.serializeNumber(self.midpoint_percent)
	end
	return t
end

function Module71:jsonDecode()
	-- upvalues: Module71 (copy), ProtoModule (copy)
	local NewModule = Module71.new()
	
	if self.start_color ~= nil then
		NewModule.start_color = self.start_color
	end
	if self.startColor ~= nil then
		NewModule.start_color = self.startColor
	end
	if self.end_color ~= nil then
		NewModule.end_color = self.end_color
	end
	if self.endColor ~= nil then
		NewModule.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		NewModule.start_opacity = ProtoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		NewModule.start_opacity = ProtoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		NewModule.end_opacity = ProtoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		NewModule.end_opacity = ProtoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		NewModule.degree = self.degree
	end
	if self.midpoint_percent ~= nil then
		NewModule.midpoint_percent = ProtoModule.json.deserializeNumber(self.midpoint_percent)
	end
	if self.midpointPercent ~= nil then
		NewModule.midpoint_percent = ProtoModule.json.deserializeNumber(self.midpointPercent)
	end
	return NewModule
end

Module71.descriptor = {
	name = "GradientProp_GradientData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
}
config.GradientProp_GradientData = Module71
TypeRegistryModule.default:register(config.GradientProp_GradientData)
local Module72 = {}
Module72.__index = Module72

function Module72.new(p1)
	-- upvalues: Module72 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module72))
end

function Module72:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module72.decode(Buf)
	-- upvalues: Module72 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module72.new()
	local v73 = 0
	while v73 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1786 = ProtoModule.readTag(Buf, v73)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1786 = ProtoModule.readVarInt(Buf, v73)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1786 = ProtoModule.readBuffer(Buf, v73)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfStructProp_ArrayOfStructs.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1786 = ProtoModule.readBuffer(Buf, v73)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1786 = ProtoModule.readBuffer(Buf, v73)
				NewModule.kind = {
					type = "conditional",
					value = config.ArrayOfStructProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v73)
				v73 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1786 = ProtoModule.readFixed32(Buf, v73)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1786 = ProtoModule.readFixed64(Buf, v73)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module72:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module72:jsonDecode()
	-- upvalues: Module72 (copy), config (copy)
	local NewModule = Module72.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ArrayOfStructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module72.descriptor = {
	name = "ArrayOfStructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
}
config.ArrayOfStructProp = Module72
TypeRegistryModule.default:register(config.ArrayOfStructProp)
local Module73 = {}
Module73.__index = Module73

function Module73.new(p1)
	-- upvalues: Module73 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module73))
end

function Module73:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module73.decode(Buf)
	-- upvalues: Module73 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module73.new()
	local v74 = 0
	while v74 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1810 = ProtoModule.readTag(Buf, v74)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1810 = ProtoModule.readVarInt(Buf, v74)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1810 = ProtoModule.readBuffer(Buf, v74)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1810 = ProtoModule.readBuffer(Buf, v74)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfStructProp_ArrayOfStructs.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1810 = ProtoModule.readBuffer(Buf, v74)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v74)
				v74 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1810 = ProtoModule.readFixed32(Buf, v74)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1810 = ProtoModule.readFixed64(Buf, v74)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module73:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module73:jsonDecode()
	-- upvalues: Module73 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module73.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module73.descriptor = {
	name = "ArrayOfStructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ArrayOfStructProp_ConditionalOption = Module73
TypeRegistryModule.default:register(config.ArrayOfStructProp_ConditionalOption)
local Module74 = {}
Module74.__index = Module74

function Module74.new(p1)
	-- upvalues: Module74 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module74))
end

function Module74:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module74.decode(Buf)
	-- upvalues: Module74 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module74.new()
	local v75 = 0
	while v75 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1829 = ProtoModule.readTag(Buf, v75)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1829 = ProtoModule.readVarInt(Buf, v75)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1829 = ProtoModule.readBuffer(Buf, v75)
				table.insert(NewModule.options, config.ArrayOfStructProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v75)
				v75 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1829 = ProtoModule.readFixed32(Buf, v75)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1829 = ProtoModule.readFixed64(Buf, v75)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module74:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module74:jsonDecode()
	-- upvalues: Module74 (copy), config (copy)
	local NewModule = Module74.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ArrayOfStructProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module74.descriptor = {
	name = "ArrayOfStructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ArrayOfStructProp_ConditionalOptions = Module74
TypeRegistryModule.default:register(config.ArrayOfStructProp_ConditionalOptions)
local Module75 = {}
Module75.__index = Module75

function Module75.new(p1)
	-- upvalues: Module75 (copy)
	return (setmetatable({
		entry = if p1 == nil or p1.entry == nil then {} else p1.entry
	}, Module75))
end

function Module75:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.entry ~= nil and #self.entry > 0 then
		for _, value in self.entry do
			local EncodeResult = value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module75.decode(Buf)
	-- upvalues: Module75 (copy), ProtoModule (copy), StructModule (copy)
	local NewModule = Module75.new()
	local v76 = 0
	while v76 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1848 = ProtoModule.readTag(Buf, v76)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1848 = ProtoModule.readVarInt(Buf, v76)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1848 = ProtoModule.readBuffer(Buf, v76)
				table.insert(NewModule.entry, StructModule.Struct.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v76)
				v76 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1848 = ProtoModule.readFixed32(Buf, v76)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1848 = ProtoModule.readFixed64(Buf, v76)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module75:jsonEncode()
	local t = {}
	
	if self.entry ~= nil and #self.entry > 0 then
		local Entry = {}
		
		for _, value in self.entry do
			table.insert(Entry, value:jsonEncode())
		end
		t.entry = Entry
	end
	return t
end

function Module75:jsonDecode()
	-- upvalues: Module75 (copy), StructModule (copy)
	local NewModule = Module75.new()
	
	if self.entry ~= nil then
		local Entry = {}
		
		for _, value in self.entry do
			table.insert(Entry, StructModule.Struct.jsonDecode(value))
		end
		NewModule.entry = Entry
	end
	return NewModule
end

Module75.descriptor = {
	name = "ArrayOfStructProp_ArrayOfStructs",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
}
config.ArrayOfStructProp_ArrayOfStructs = Module75
TypeRegistryModule.default:register(config.ArrayOfStructProp_ArrayOfStructs)
local Module76 = {}
Module76.__index = Module76

function Module76.new(p1)
	-- upvalues: Module76 (copy)
	return (setmetatable({
		item_id = if p1 == nil or p1.item_id == nil then "" else p1.item_id,
		has_pending_friend_request = p1 ~= nil and p1.has_pending_friend_request ~= nil and p1.has_pending_friend_request
	}, Module76))
end

function Module76:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.item_id)
	end
	if self.has_pending_friend_request then
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
		Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, if self.has_pending_friend_request then 1 else 0)
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module76.decode(Buf)
	-- upvalues: Module76 (copy), ProtoModule (copy)
	local NewModule = Module76.new()
	local v77 = 0
	while v77 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1868 = ProtoModule.readTag(Buf, v77)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarInt
				VarInt, v1868 = ProtoModule.readVarInt(Buf, v77)
				NewModule.has_pending_friend_request = VarInt ~= 0
			else
				local _
				_, v1868 = ProtoModule.readVarInt(Buf, v77)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1868 = ProtoModule.readBuffer(Buf, v77)
				NewModule.item_id = buffer.tostring(Buffer1)
			else
				local VarInt1, VarInt2 = ProtoModule.readVarInt(Buf, v77)
				v77 = VarInt2 + VarInt1
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1868 = ProtoModule.readFixed32(Buf, v77)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1868 = ProtoModule.readFixed64(Buf, v77)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module76:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function Module76:jsonDecode()
	-- upvalues: Module76 (copy)
	local NewModule = Module76.new()
	
	if self.item_id ~= nil then
		NewModule.item_id = self.item_id
	end
	if self.itemId ~= nil then
		NewModule.item_id = self.itemId
	end
	if self.has_pending_friend_request ~= nil then
		NewModule.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		NewModule.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return NewModule
end

Module76.descriptor = {
	name = "PymkItemData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PymkItemData"
}
config.PymkItemData = Module76
TypeRegistryModule.default:register(config.PymkItemData)
local Module77 = {}
Module77.__index = Module77

function Module77.new(p1)
	-- upvalues: Module77 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module77))
end

function Module77:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module77.decode(Buf)
	-- upvalues: Module77 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module77.new()
	local v78 = 0
	while v78 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1891 = ProtoModule.readTag(Buf, v78)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1891 = ProtoModule.readVarInt(Buf, v78)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1891 = ProtoModule.readBuffer(Buf, v78)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfPymkItemDataProp_PymkItems.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1891 = ProtoModule.readBuffer(Buf, v78)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1891 = ProtoModule.readBuffer(Buf, v78)
				NewModule.kind = {
					type = "conditional",
					value = config.ArrayOfPymkItemDataProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v78)
				v78 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1891 = ProtoModule.readFixed32(Buf, v78)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1891 = ProtoModule.readFixed64(Buf, v78)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module77:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module77:jsonDecode()
	-- upvalues: Module77 (copy), config (copy)
	local NewModule = Module77.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfPymkItemDataProp_PymkItems.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ArrayOfPymkItemDataProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module77.descriptor = {
	name = "ArrayOfPymkItemDataProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfPymkItemDataProp"
}
config.ArrayOfPymkItemDataProp = Module77
TypeRegistryModule.default:register(config.ArrayOfPymkItemDataProp)
local Module78 = {}
Module78.__index = Module78

function Module78.new(p1)
	-- upvalues: Module78 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module78))
end

function Module78:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module78.decode(Buf)
	-- upvalues: Module78 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module78.new()
	local v79 = 0
	while v79 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1915 = ProtoModule.readTag(Buf, v79)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1915 = ProtoModule.readVarInt(Buf, v79)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1915 = ProtoModule.readBuffer(Buf, v79)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1915 = ProtoModule.readBuffer(Buf, v79)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfPymkItemDataProp_PymkItems.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1915 = ProtoModule.readBuffer(Buf, v79)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v79)
				v79 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1915 = ProtoModule.readFixed32(Buf, v79)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1915 = ProtoModule.readFixed64(Buf, v79)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module78:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module78:jsonDecode()
	-- upvalues: Module78 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module78.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfPymkItemDataProp_PymkItems.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module78.descriptor = {
	name = "ArrayOfPymkItemDataProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ArrayOfPymkItemDataProp_ConditionalOption = Module78
TypeRegistryModule.default:register(config.ArrayOfPymkItemDataProp_ConditionalOption)
local Module79 = {}
Module79.__index = Module79

function Module79.new(p1)
	-- upvalues: Module79 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module79))
end

function Module79:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module79.decode(Buf)
	-- upvalues: Module79 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module79.new()
	local v80 = 0
	while v80 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1934 = ProtoModule.readTag(Buf, v80)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1934 = ProtoModule.readVarInt(Buf, v80)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1934 = ProtoModule.readBuffer(Buf, v80)
				table.insert(NewModule.options, config.ArrayOfPymkItemDataProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v80)
				v80 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1934 = ProtoModule.readFixed32(Buf, v80)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1934 = ProtoModule.readFixed64(Buf, v80)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module79:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module79:jsonDecode()
	-- upvalues: Module79 (copy), config (copy)
	local NewModule = Module79.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ArrayOfPymkItemDataProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module79.descriptor = {
	name = "ArrayOfPymkItemDataProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ArrayOfPymkItemDataProp_ConditionalOptions = Module79
TypeRegistryModule.default:register(config.ArrayOfPymkItemDataProp_ConditionalOptions)
local Module80 = {}
Module80.__index = Module80

function Module80.new(p1)
	-- upvalues: Module80 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, Module80))
end

function Module80:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local EncodeResult = item:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module80.decode(Buf)
	-- upvalues: Module80 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module80.new()
	local v81 = 0
	while v81 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1953 = ProtoModule.readTag(Buf, v81)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1953 = ProtoModule.readVarInt(Buf, v81)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1953 = ProtoModule.readBuffer(Buf, v81)
				table.insert(NewModule.items, config.PymkItemData.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v81)
				v81 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1953 = ProtoModule.readFixed32(Buf, v81)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1953 = ProtoModule.readFixed64(Buf, v81)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module80:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item:jsonEncode())
		end
		t.items = Items
	end
	return t
end

function Module80:jsonDecode()
	-- upvalues: Module80 (copy), config (copy)
	local NewModule = Module80.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, config.PymkItemData.jsonDecode(item))
		end
		NewModule.items = Items
	end
	return NewModule
end

Module80.descriptor = {
	name = "ArrayOfPymkItemDataProp_PymkItems",
	fullName = "roblox.apppageplatform.shared.v1beta1.PymkItems"
}
config.ArrayOfPymkItemDataProp_PymkItems = Module80
TypeRegistryModule.default:register(config.ArrayOfPymkItemDataProp_PymkItems)
local Module81 = {}
Module81.__index = Module81

function Module81.new(p1)
	-- upvalues: Module81 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module81))
end

function Module81:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module81.decode(Buf)
	-- upvalues: Module81 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module81.new()
	local v82 = 0
	while v82 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v1978 = ProtoModule.readTag(Buf, v82)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v1978 = ProtoModule.readVarInt(Buf, v82)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v1978 = ProtoModule.readBuffer(Buf, v82)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v1978 = ProtoModule.readBuffer(Buf, v82)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v1978 = ProtoModule.readBuffer(Buf, v82)
				NewModule.kind = {
					type = "conditional",
					value = config.UiScaledFloatProp_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v1978 = ProtoModule.readBuffer(Buf, v82)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v82)
				v82 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v1978 = ProtoModule.readFixed32(Buf, v82)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v1978 = ProtoModule.readFixed64(Buf, v82)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module81:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module81:jsonDecode()
	-- upvalues: Module81 (copy), config (copy)
	local NewModule = Module81.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.UiScaledFloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module81.descriptor = {
	name = "UiScaledFloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
}
config.UiScaledFloatProp = Module81
TypeRegistryModule.default:register(config.UiScaledFloatProp)
local Module82 = {}
Module82.__index = Module82

function Module82.new(p1)
	-- upvalues: Module82 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module82))
end

function Module82:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module82.decode(Buf)
	-- upvalues: Module82 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module82.new()
	local v83 = 0
	while v83 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2004 = ProtoModule.readTag(Buf, v83)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2004 = ProtoModule.readVarInt(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2004 = ProtoModule.readBuffer(Buf, v83)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2004 = ProtoModule.readBuffer(Buf, v83)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2004 = ProtoModule.readBuffer(Buf, v83)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2004 = ProtoModule.readBuffer(Buf, v83)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v83)
				v83 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2004 = ProtoModule.readFixed32(Buf, v83)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2004 = ProtoModule.readFixed64(Buf, v83)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module82:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module82:jsonDecode()
	-- upvalues: Module82 (copy), PropConditionModule (copy)
	local NewModule = Module82.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module82.descriptor = {
	name = "UiScaledFloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.UiScaledFloatProp_ConditionalOption = Module82
TypeRegistryModule.default:register(config.UiScaledFloatProp_ConditionalOption)
local Module83 = {}
Module83.__index = Module83

function Module83.new(p1)
	-- upvalues: Module83 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module83))
end

function Module83:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module83.decode(Buf)
	-- upvalues: Module83 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module83.new()
	local v84 = 0
	while v84 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2024 = ProtoModule.readTag(Buf, v84)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2024 = ProtoModule.readVarInt(Buf, v84)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2024 = ProtoModule.readBuffer(Buf, v84)
				table.insert(NewModule.options, config.UiScaledFloatProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v84)
				v84 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2024 = ProtoModule.readFixed32(Buf, v84)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2024 = ProtoModule.readFixed64(Buf, v84)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module83:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module83:jsonDecode()
	-- upvalues: Module83 (copy), config (copy)
	local NewModule = Module83.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.UiScaledFloatProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module83.descriptor = {
	name = "UiScaledFloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.UiScaledFloatProp_ConditionalOptions = Module83
TypeRegistryModule.default:register(config.UiScaledFloatProp_ConditionalOptions)
local Module84 = {}
Module84.__index = Module84

function Module84.new(p1)
	-- upvalues: Module84 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module84))
end

function Module84:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module84.decode(Buf)
	-- upvalues: Module84 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module84.new()
	local v85 = 0
	while v85 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2049 = ProtoModule.readTag(Buf, v85)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2049 = ProtoModule.readVarInt(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2049 = ProtoModule.readBuffer(Buf, v85)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2049 = ProtoModule.readBuffer(Buf, v85)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2049 = ProtoModule.readBuffer(Buf, v85)
				NewModule.kind = {
					type = "conditional",
					value = config.UiScaledUDimProp_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2049 = ProtoModule.readBuffer(Buf, v85)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v85)
				v85 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2049 = ProtoModule.readFixed32(Buf, v85)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2049 = ProtoModule.readFixed64(Buf, v85)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module84:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module84:jsonDecode()
	-- upvalues: Module84 (copy), config (copy)
	local NewModule = Module84.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.UiScaledUDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module84.descriptor = {
	name = "UiScaledUDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
}
config.UiScaledUDimProp = Module84
TypeRegistryModule.default:register(config.UiScaledUDimProp)
local Module85 = {}
Module85.__index = Module85

function Module85.new(p1)
	-- upvalues: Module85 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module85))
end

function Module85:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module85.decode(Buf)
	-- upvalues: Module85 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module85.new()
	local v86 = 0
	while v86 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2075 = ProtoModule.readTag(Buf, v86)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2075 = ProtoModule.readVarInt(Buf, v86)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2075 = ProtoModule.readBuffer(Buf, v86)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2075 = ProtoModule.readBuffer(Buf, v86)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2075 = ProtoModule.readBuffer(Buf, v86)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2075 = ProtoModule.readBuffer(Buf, v86)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v86)
				v86 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2075 = ProtoModule.readFixed32(Buf, v86)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2075 = ProtoModule.readFixed64(Buf, v86)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module85:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module85:jsonDecode()
	-- upvalues: Module85 (copy), PropConditionModule (copy)
	local NewModule = Module85.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module85.descriptor = {
	name = "UiScaledUDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.UiScaledUDimProp_ConditionalOption = Module85
TypeRegistryModule.default:register(config.UiScaledUDimProp_ConditionalOption)
local Module86 = {}
Module86.__index = Module86

function Module86.new(p1)
	-- upvalues: Module86 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module86))
end

function Module86:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module86.decode(Buf)
	-- upvalues: Module86 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module86.new()
	local v87 = 0
	while v87 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2095 = ProtoModule.readTag(Buf, v87)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2095 = ProtoModule.readVarInt(Buf, v87)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2095 = ProtoModule.readBuffer(Buf, v87)
				table.insert(NewModule.options, config.UiScaledUDimProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v87)
				v87 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2095 = ProtoModule.readFixed32(Buf, v87)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2095 = ProtoModule.readFixed64(Buf, v87)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module86:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module86:jsonDecode()
	-- upvalues: Module86 (copy), config (copy)
	local NewModule = Module86.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.UiScaledUDimProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module86.descriptor = {
	name = "UiScaledUDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.UiScaledUDimProp_ConditionalOptions = Module86
TypeRegistryModule.default:register(config.UiScaledUDimProp_ConditionalOptions)
local Module87 = {}
Module87.__index = Module87

function Module87.new(p1)
	-- upvalues: Module87 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module87))
end

function Module87:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module87.decode(Buf)
	-- upvalues: Module87 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module87.new()
	local v88 = 0
	while v88 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2120 = ProtoModule.readTag(Buf, v88)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2120 = ProtoModule.readVarInt(Buf, v88)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2120 = ProtoModule.readBuffer(Buf, v88)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer1) }
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2120 = ProtoModule.readBuffer(Buf, v88)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2120 = ProtoModule.readBuffer(Buf, v88)
				NewModule.kind = {
					type = "conditional",
					value = config.UiScaledUDim2Prop_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2120 = ProtoModule.readBuffer(Buf, v88)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v88)
				v88 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2120 = ProtoModule.readFixed32(Buf, v88)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2120 = ProtoModule.readFixed64(Buf, v88)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module87:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module87:jsonDecode()
	-- upvalues: Module87 (copy), config (copy)
	local NewModule = Module87.new()
	
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module87.descriptor = {
	name = "UiScaledUDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
}
config.UiScaledUDim2Prop = Module87
TypeRegistryModule.default:register(config.UiScaledUDim2Prop)
local Module88 = {}
Module88.__index = Module88

function Module88.new(p1)
	-- upvalues: Module88 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module88))
end

function Module88:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "token" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "binding_path" then
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult4, WriteTagResult2_3, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module88.decode(Buf)
	-- upvalues: Module88 (copy), ProtoModule (copy), PropConditionModule (copy)
	local NewModule = Module88.new()
	local v89 = 0
	while v89 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2146 = ProtoModule.readTag(Buf, v89)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2146 = ProtoModule.readVarInt(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2146 = ProtoModule.readBuffer(Buf, v89)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2146 = ProtoModule.readBuffer(Buf, v89)
				NewModule.kind = { type = "literal", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2146 = ProtoModule.readBuffer(Buf, v89)
				NewModule.kind = { type = "token", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2146 = ProtoModule.readBuffer(Buf, v89)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer4) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v89)
				v89 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2146 = ProtoModule.readFixed32(Buf, v89)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2146 = ProtoModule.readFixed64(Buf, v89)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module88:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value
			
			return t
		end
		if self.kind.type == "token" then
			t.token = self.kind.value
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module88:jsonDecode()
	-- upvalues: Module88 (copy), PropConditionModule (copy)
	local NewModule = Module88.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		NewModule.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module88.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.UiScaledUDim2Prop_ConditionalOption = Module88
TypeRegistryModule.default:register(config.UiScaledUDim2Prop_ConditionalOption)
local Module89 = {}
Module89.__index = Module89

function Module89.new(p1)
	-- upvalues: Module89 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module89))
end

function Module89:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module89.decode(Buf)
	-- upvalues: Module89 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module89.new()
	local v90 = 0
	while v90 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2166 = ProtoModule.readTag(Buf, v90)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2166 = ProtoModule.readVarInt(Buf, v90)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2166 = ProtoModule.readBuffer(Buf, v90)
				table.insert(NewModule.options, config.UiScaledUDim2Prop_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v90)
				v90 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2166 = ProtoModule.readFixed32(Buf, v90)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2166 = ProtoModule.readFixed64(Buf, v90)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module89:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module89:jsonDecode()
	-- upvalues: Module89 (copy), config (copy)
	local NewModule = Module89.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.UiScaledUDim2Prop_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module89.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.UiScaledUDim2Prop_ConditionalOptions = Module89
TypeRegistryModule.default:register(config.UiScaledUDim2Prop_ConditionalOptions)
local Module90 = {}
Module90.__index = Module90

function Module90.new(p1)
	-- upvalues: Module90 (copy)
	return (setmetatable({
		user_id = if p1 == nil or p1.user_id == nil then nil else p1.user_id,
		user_presence = if p1 == nil or p1.user_presence == nil then nil else p1.user_presence
	}, Module90))
end

function Module90:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.user_id ~= nil then
		local EncodeResult = self.user_id:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.user_presence ~= nil then
		local EncodeResult = self.user_presence:encode()
		local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module90.decode(Buf)
	-- upvalues: Module90 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module90.new()
	local v91 = 0
	while v91 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2188 = ProtoModule.readTag(Buf, v91)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2188 = ProtoModule.readVarInt(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2188 = ProtoModule.readBuffer(Buf, v91)
				NewModule.user_id = config.Int64Prop.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2188 = ProtoModule.readBuffer(Buf, v91)
				NewModule.user_presence = config.StringProp.decode(Buffer2)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v91)
				v91 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2188 = ProtoModule.readFixed32(Buf, v91)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2188 = ProtoModule.readFixed64(Buf, v91)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module90:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.user_presence ~= nil then
		t.userPresence = self.user_presence:jsonEncode()
	end
	return t
end

function Module90:jsonDecode()
	-- upvalues: Module90 (copy), config (copy)
	local NewModule = Module90.new()
	
	if self.user_id ~= nil then
		NewModule.user_id = config.Int64Prop.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		NewModule.user_id = config.Int64Prop.jsonDecode(self.userId)
	end
	if self.user_presence ~= nil then
		NewModule.user_presence = config.StringProp.jsonDecode(self.user_presence)
	end
	if self.userPresence ~= nil then
		NewModule.user_presence = config.StringProp.jsonDecode(self.userPresence)
	end
	return NewModule
end

Module90.descriptor = {
	name = "AvatarConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarConfigProp"
}
config.AvatarConfigProp = Module90
TypeRegistryModule.default:register(config.AvatarConfigProp)
local Module91 = {}
Module91.__index = Module91

function Module91.new(p1)
	-- upvalues: Module91 (copy)
	return (setmetatable({
		oneof_prop = if p1 == nil or p1.oneof_prop == nil then nil else p1.oneof_prop
	}, Module91))
end

function Module91:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "user_id" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.oneof_prop.type == "avatar_config" then
			local EncodeResult = self.oneof_prop.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module91.decode(Buf)
	-- upvalues: Module91 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module91.new()
	local v92 = 0
	while v92 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2209 = ProtoModule.readTag(Buf, v92)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2209 = ProtoModule.readVarInt(Buf, v92)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2209 = ProtoModule.readBuffer(Buf, v92)
				NewModule.oneof_prop = {
					type = "user_id",
					value = config.Int64Prop.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2209 = ProtoModule.readBuffer(Buf, v92)
				NewModule.oneof_prop = {
					type = "avatar_config",
					value = config.AvatarConfigProp.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v92)
				v92 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2209 = ProtoModule.readFixed32(Buf, v92)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2209 = ProtoModule.readFixed64(Buf, v92)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module91:jsonEncode()
	local t = {}
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "user_id" then
			t.userId = self.oneof_prop.value:jsonEncode()
			
			return t
		end
		if self.oneof_prop.type == "avatar_config" then
			t.avatarConfig = self.oneof_prop.value:jsonEncode()
		end
	end
	return t
end

function Module91:jsonDecode()
	-- upvalues: Module91 (copy), config (copy)
	local NewModule = Module91.new()
	
	if self.user_id ~= nil then
		NewModule.oneof_prop = {
			type = "user_id",
			value = config.Int64Prop.jsonDecode(self.user_id)
		}
	end
	if self.userId ~= nil then
		NewModule.oneof_prop = {
			type = "user_id",
			value = config.Int64Prop.jsonDecode(self.userId)
		}
	end
	if self.avatar_config ~= nil then
		NewModule.oneof_prop = {
			type = "avatar_config",
			value = config.AvatarConfigProp.jsonDecode(self.avatar_config)
		}
	end
	if self.avatarConfig ~= nil then
		NewModule.oneof_prop = {
			type = "avatar_config",
			value = config.AvatarConfigProp.jsonDecode(self.avatarConfig)
		}
	end
	return NewModule
end

Module91.descriptor = {
	name = "AvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarProp"
}
config.AvatarProp = Module91
TypeRegistryModule.default:register(config.AvatarProp)
local Module92 = {}
Module92.__index = Module92

function Module92.new(p1)
	-- upvalues: Module92 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module92))
end

function Module92:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "array_map" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module92.decode(Buf)
	-- upvalues: Module92 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module92.new()
	local v93 = 0
	while v93 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2235 = ProtoModule.readTag(Buf, v93)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2235 = ProtoModule.readVarInt(Buf, v93)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2235 = ProtoModule.readBuffer(Buf, v93)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfAvatarProp_ArrayOfAvatars.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2235 = ProtoModule.readBuffer(Buf, v93)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2235 = ProtoModule.readBuffer(Buf, v93)
				NewModule.kind = {
					type = "conditional",
					value = config.ArrayOfAvatarProp_ConditionalOptions.decode(Buffer3)
				}
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2235 = ProtoModule.readBuffer(Buf, v93)
				NewModule.kind = {
					type = "array_map",
					value = config.ArrayOfAvatarProp_ArrayMap.decode(Buffer4)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v93)
				v93 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2235 = ProtoModule.readFixed32(Buf, v93)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2235 = ProtoModule.readFixed64(Buf, v93)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module92:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "array_map" then
			t.arrayMap = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module92:jsonDecode()
	-- upvalues: Module92 (copy), config (copy)
	local NewModule = Module92.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ArrayOfAvatarProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		NewModule.kind = {
			type = "array_map",
			value = config.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		NewModule.kind = {
			type = "array_map",
			value = config.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return NewModule
end

Module92.descriptor = {
	name = "ArrayOfAvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatarProp"
}
config.ArrayOfAvatarProp = Module92
TypeRegistryModule.default:register(config.ArrayOfAvatarProp)
local Module93 = {}
Module93.__index = Module93

function Module93.new(p1)
	-- upvalues: Module93 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module93))
end

function Module93:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module93.decode(Buf)
	-- upvalues: Module93 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module93.new()
	local v94 = 0
	while v94 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2260 = ProtoModule.readTag(Buf, v94)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2260 = ProtoModule.readVarInt(Buf, v94)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2260 = ProtoModule.readBuffer(Buf, v94)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2260 = ProtoModule.readBuffer(Buf, v94)
				NewModule.kind = {
					type = "literal",
					value = config.ArrayOfAvatarProp_ArrayOfAvatars.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2260 = ProtoModule.readBuffer(Buf, v94)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v94)
				v94 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2260 = ProtoModule.readFixed32(Buf, v94)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2260 = ProtoModule.readFixed64(Buf, v94)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module93:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module93:jsonDecode()
	-- upvalues: Module93 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module93.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module93.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ArrayOfAvatarProp_ConditionalOption = Module93
TypeRegistryModule.default:register(config.ArrayOfAvatarProp_ConditionalOption)
local Module94 = {}
Module94.__index = Module94

function Module94.new(p1)
	-- upvalues: Module94 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module94))
end

function Module94:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module94.decode(Buf)
	-- upvalues: Module94 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module94.new()
	local v95 = 0
	while v95 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2279 = ProtoModule.readTag(Buf, v95)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2279 = ProtoModule.readVarInt(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2279 = ProtoModule.readBuffer(Buf, v95)
				table.insert(NewModule.options, config.ArrayOfAvatarProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v95)
				v95 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2279 = ProtoModule.readFixed32(Buf, v95)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2279 = ProtoModule.readFixed64(Buf, v95)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module94:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module94:jsonDecode()
	-- upvalues: Module94 (copy), config (copy)
	local NewModule = Module94.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ArrayOfAvatarProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module94.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ArrayOfAvatarProp_ConditionalOptions = Module94
TypeRegistryModule.default:register(config.ArrayOfAvatarProp_ConditionalOptions)
local Module95 = {}
Module95.__index = Module95

function Module95.new(p1)
	-- upvalues: Module95 (copy)
	return (setmetatable({
		array = if p1 == nil or p1.array == nil then {} else p1.array
	}, Module95))
end

function Module95:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.array ~= nil and #self.array > 0 then
		for _, value in self.array do
			local EncodeResult = value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module95.decode(Buf)
	-- upvalues: Module95 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module95.new()
	local v96 = 0
	while v96 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2298 = ProtoModule.readTag(Buf, v96)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2298 = ProtoModule.readVarInt(Buf, v96)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2298 = ProtoModule.readBuffer(Buf, v96)
				table.insert(NewModule.array, config.AvatarProp.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v96)
				v96 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2298 = ProtoModule.readFixed32(Buf, v96)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2298 = ProtoModule.readFixed64(Buf, v96)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module95:jsonEncode()
	local t = {}
	
	if self.array ~= nil and #self.array > 0 then
		local Array = {}
		
		for _, value in self.array do
			table.insert(Array, value:jsonEncode())
		end
		t.array = Array
	end
	return t
end

function Module95:jsonDecode()
	-- upvalues: Module95 (copy), config (copy)
	local NewModule = Module95.new()
	
	if self.array ~= nil then
		local Array = {}
		
		for _, value in self.array do
			table.insert(Array, config.AvatarProp.jsonDecode(value))
		end
		NewModule.array = Array
	end
	return NewModule
end

Module95.descriptor = {
	name = "ArrayOfAvatarProp_ArrayOfAvatars",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatars"
}
config.ArrayOfAvatarProp_ArrayOfAvatars = Module95
TypeRegistryModule.default:register(config.ArrayOfAvatarProp_ArrayOfAvatars)
local Module96 = {}
Module96.__index = Module96

function Module96.new(p1)
	-- upvalues: Module96 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind,
		item_hydration_specs = if p1 == nil or p1.item_hydration_specs == nil then {} else p1.item_hydration_specs,
		field_map = if p1 == nil or p1.field_map == nil then nil else p1.field_map
	}, Module96))
end

function Module96:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil and self.kind.type == "binding_path" then
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, self.kind.value)
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for _, itemHydrationSpec in self.item_hydration_specs do
			local EncodeResult = itemHydrationSpec:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		end
	end
	if self.field_map ~= nil then
		local EncodeResult = self.field_map:encode()
		local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module96.decode(Buf)
	-- upvalues: Module96 (copy), ProtoModule (copy), HydrationDataSpecModule (copy), config (copy)
	local NewModule = Module96.new()
	local v97 = 0
	while v97 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2322 = ProtoModule.readTag(Buf, v97)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2322 = ProtoModule.readVarInt(Buf, v97)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2322 = ProtoModule.readBuffer(Buf, v97)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2322 = ProtoModule.readBuffer(Buf, v97)
				table.insert(NewModule.item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.decode(Buffer2))
			elseif Tag == 4 then
				local Buffer3
				Buffer3, v2322 = ProtoModule.readBuffer(Buf, v97)
				NewModule.field_map = config.AvatarConfigProp.decode(Buffer3)
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v97)
				v97 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2322 = ProtoModule.readFixed32(Buf, v97)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2322 = ProtoModule.readFixed64(Buf, v97)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module96:jsonEncode()
	local t = {}
	
	if self.kind ~= nil and self.kind.type == "binding_path" then
		t.bindingPath = self.kind.value
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		local ItemHydrationSpecs = {}
		
		for _, itemHydrationSpec in self.item_hydration_specs do
			table.insert(ItemHydrationSpecs, itemHydrationSpec:jsonEncode())
		end
		t.itemHydrationSpecs = ItemHydrationSpecs
	end
	if self.field_map ~= nil then
		t.fieldMap = self.field_map:jsonEncode()
	end
	return t
end

function Module96:jsonDecode()
	-- upvalues: Module96 (copy), HydrationDataSpecModule (copy), config (copy)
	local NewModule = Module96.new()
	
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.item_hydration_specs ~= nil then
		local Item_hydration_specs = {}
		
		for _, itemHydrationSpec in self.item_hydration_specs do
			table.insert(Item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.jsonDecode(itemHydrationSpec))
		end
		NewModule.item_hydration_specs = Item_hydration_specs
	end
	if self.itemHydrationSpecs ~= nil then
		local Item_hydration_specs = {}
		
		for _, itemHydrationSpec1 in self.itemHydrationSpecs do
			table.insert(Item_hydration_specs, HydrationDataSpecModule.HydrationDataSpec.jsonDecode(itemHydrationSpec1))
		end
		NewModule.item_hydration_specs = Item_hydration_specs
	end
	if self.field_map ~= nil then
		NewModule.field_map = config.AvatarConfigProp.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		NewModule.field_map = config.AvatarConfigProp.jsonDecode(self.fieldMap)
	end
	return NewModule
end

Module96.descriptor = {
	name = "ArrayOfAvatarProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
config.ArrayOfAvatarProp_ArrayMap = Module96
TypeRegistryModule.default:register(config.ArrayOfAvatarProp_ArrayMap)
local Module97 = {}
Module97.__index = Module97

function Module97.new(p1)
	-- upvalues: Module97 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module97))
end

function Module97:encode()
	-- upvalues: ProtoModule (copy), config (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult, WriteTagResult2, config.ScaleBasis.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module97.decode(Buf)
	-- upvalues: Module97 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module97.new()
	local v98 = 0
	while v98 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2348 = ProtoModule.readTag(Buf, v98)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 1 then
				local VarIntI32
				VarIntI32, v2348 = ProtoModule.readVarIntI32(Buf, v98)
				NewModule.kind = {
					type = "literal",
					value = config.ScaleBasis.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v2348 = ProtoModule.readVarInt(Buf, v98)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 2 then
				local Buffer1
				Buffer1, v2348 = ProtoModule.readBuffer(Buf, v98)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer1) }
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2348 = ProtoModule.readBuffer(Buf, v98)
				NewModule.kind = {
					type = "conditional",
					value = config.ScaleBasisProp_ConditionalOptions.decode(Buffer2)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v98)
				v98 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2348 = ProtoModule.readFixed32(Buf, v98)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2348 = ProtoModule.readFixed64(Buf, v98)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module97:jsonEncode()
	-- upvalues: config (copy)
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else config.ScaleBasis.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module97:jsonDecode()
	-- upvalues: Module97 (copy), config (copy)
	local NewModule = Module97.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then config.ScaleBasis.fromNumber(self.literal) else config.ScaleBasis.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.ScaleBasisProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module97.descriptor = {
	name = "ScaleBasisProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ScaleBasisProp"
}
config.ScaleBasisProp = Module97
TypeRegistryModule.default:register(config.ScaleBasisProp)
local Module98 = {}
Module98.__index = Module98

function Module98.new(p1)
	-- upvalues: Module98 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module98))
end

function Module98:encode()
	-- upvalues: ProtoModule (copy), config (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.varint)
			Buf, Count = ProtoModule.writeVarInt(WriteTagResult1, WriteTagResult2_1, config.ScaleBasis.toNumber(self.kind.value))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module98.decode(Buf)
	-- upvalues: Module98 (copy), ProtoModule (copy), config (copy), PropConditionModule (copy)
	local NewModule = Module98.new()
	local v99 = 0
	while v99 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2371 = ProtoModule.readTag(Buf, v99)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			if Tag == 2 then
				local VarIntI32
				VarIntI32, v2371 = ProtoModule.readVarIntI32(Buf, v99)
				NewModule.kind = {
					type = "literal",
					value = config.ScaleBasis.fromNumber(VarIntI32) or VarIntI32
				}
			else
				local _
				_, v2371 = ProtoModule.readVarInt(Buf, v99)
			end
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2371 = ProtoModule.readBuffer(Buf, v99)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 3 then
				local Buffer2
				Buffer2, v2371 = ProtoModule.readBuffer(Buf, v99)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v99)
				v99 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2371 = ProtoModule.readFixed32(Buf, v99)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2371 = ProtoModule.readFixed64(Buf, v99)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module98:jsonEncode()
	-- upvalues: config (copy)
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = if typeof(self.kind.value) == "number" then self.kind.value else config.ScaleBasis.toNumber(self.kind.value)
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
		end
	end
	return t
end

function Module98:jsonDecode()
	-- upvalues: Module98 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module98.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = (if typeof(self.literal) == "number" then config.ScaleBasis.fromNumber(self.literal) else config.ScaleBasis.fromName(self.literal)) or self.literal
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	return NewModule
end

Module98.descriptor = {
	name = "ScaleBasisProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.ScaleBasisProp_ConditionalOption = Module98
TypeRegistryModule.default:register(config.ScaleBasisProp_ConditionalOption)
local Module99 = {}
Module99.__index = Module99

function Module99.new(p1)
	-- upvalues: Module99 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module99))
end

function Module99:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module99.decode(Buf)
	-- upvalues: Module99 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module99.new()
	local v100 = 0
	while v100 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2390 = ProtoModule.readTag(Buf, v100)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2390 = ProtoModule.readVarInt(Buf, v100)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2390 = ProtoModule.readBuffer(Buf, v100)
				table.insert(NewModule.options, config.ScaleBasisProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v100)
				v100 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2390 = ProtoModule.readFixed32(Buf, v100)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2390 = ProtoModule.readFixed64(Buf, v100)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module99:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module99:jsonDecode()
	-- upvalues: Module99 (copy), config (copy)
	local NewModule = Module99.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.ScaleBasisProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module99.descriptor = {
	name = "ScaleBasisProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.ScaleBasisProp_ConditionalOptions = Module99
TypeRegistryModule.default:register(config.ScaleBasisProp_ConditionalOptions)
local Module100 = {}
Module100.__index = Module100

function Module100.new(p1)
	-- upvalues: Module100 (copy)
	return (setmetatable({
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module100))
end

function Module100:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult1, WriteTagResult2_1, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult3, WriteTagResult2_2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module100.decode(Buf)
	-- upvalues: Module100 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module100.new()
	local v101 = 0
	while v101 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2414 = ProtoModule.readTag(Buf, v101)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2414 = ProtoModule.readVarInt(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2414 = ProtoModule.readBuffer(Buf, v101)
				NewModule.kind = {
					type = "literal",
					value = config.StringArrayProp_LiteralValue.decode(Buffer1)
				}
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2414 = ProtoModule.readBuffer(Buf, v101)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer2) }
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2414 = ProtoModule.readBuffer(Buf, v101)
				NewModule.kind = {
					type = "conditional",
					value = config.StringArrayProp_ConditionalOptions.decode(Buffer3)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v101)
				v101 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2414 = ProtoModule.readFixed32(Buf, v101)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2414 = ProtoModule.readFixed64(Buf, v101)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module100:jsonEncode()
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module100:jsonDecode()
	-- upvalues: Module100 (copy), config (copy)
	local NewModule = Module100.new()
	
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module100.descriptor = {
	name = "StringArrayProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringArrayProp"
}
config.StringArrayProp = Module100
TypeRegistryModule.default:register(config.StringArrayProp)
local Module101 = {}
Module101.__index = Module101

function Module101.new(p1)
	-- upvalues: Module101 (copy)
	return (setmetatable({
		items = if p1 == nil or p1.items == nil then {} else p1.items
	}, Module101))
end

function Module101:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.items ~= nil and #self.items > 0 then
		for _, item in self.items do
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult, WriteTagResult2, item)
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module101.decode(Buf)
	-- upvalues: Module101 (copy), ProtoModule (copy)
	local NewModule = Module101.new()
	local v102 = 0
	while v102 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2432 = ProtoModule.readTag(Buf, v102)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2432 = ProtoModule.readVarInt(Buf, v102)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2432 = ProtoModule.readBuffer(Buf, v102)
				table.insert(NewModule.items, buffer.tostring(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v102)
				v102 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2432 = ProtoModule.readFixed32(Buf, v102)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2432 = ProtoModule.readFixed64(Buf, v102)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module101:jsonEncode()
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item)
		end
		t.items = Items
	end
	return t
end

function Module101:jsonDecode()
	-- upvalues: Module101 (copy)
	local NewModule = Module101.new()
	
	if self.items ~= nil then
		local Items = {}
		
		for _, item in self.items do
			table.insert(Items, item)
		end
		NewModule.items = Items
	end
	return NewModule
end

Module101.descriptor = {
	name = "StringArrayProp_LiteralValue",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
}
config.StringArrayProp_LiteralValue = Module101
TypeRegistryModule.default:register(config.StringArrayProp_LiteralValue)
local Module102 = {}
Module102.__index = Module102

function Module102.new(p1)
	-- upvalues: Module102 (copy)
	return (setmetatable({
		condition = if p1 == nil or p1.condition == nil then nil else p1.condition,
		kind = if p1 == nil or p1.kind == nil then nil else p1.kind
	}, Module102))
end

function Module102:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.condition ~= nil then
		local EncodeResult = self.condition:encode()
		local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
		Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult1, WriteTagResult2_1 = ProtoModule.writeTag(Buf, Count, 2, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult1, WriteTagResult2_1, EncodeResult, buffer.len(EncodeResult))
		elseif self.kind.type == "binding_path" then
			local WriteTagResult3, WriteTagResult2_2 = ProtoModule.writeTag(Buf, Count, 3, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeString(WriteTagResult3, WriteTagResult2_2, self.kind.value)
		elseif self.kind.type == "conditional" then
			local EncodeResult = self.kind.value:encode()
			local WriteTagResult4, WriteTagResult2_3 = ProtoModule.writeTag(Buf, Count, 4, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult4, WriteTagResult2_3, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module102.decode(Buf)
	-- upvalues: Module102 (copy), ProtoModule (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module102.new()
	local v103 = 0
	while v103 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2459 = ProtoModule.readTag(Buf, v103)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2459 = ProtoModule.readVarInt(Buf, v103)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2459 = ProtoModule.readBuffer(Buf, v103)
				NewModule.condition = PropConditionModule.PropCondition.decode(Buffer1)
			elseif Tag == 2 then
				local Buffer2
				Buffer2, v2459 = ProtoModule.readBuffer(Buf, v103)
				NewModule.kind = {
					type = "literal",
					value = config.StringArrayProp_LiteralValue.decode(Buffer2)
				}
			elseif Tag == 3 then
				local Buffer3
				Buffer3, v2459 = ProtoModule.readBuffer(Buf, v103)
				NewModule.kind = { type = "binding_path", value = buffer.tostring(Buffer3) }
			elseif Tag == 4 then
				local Buffer4
				Buffer4, v2459 = ProtoModule.readBuffer(Buf, v103)
				NewModule.kind = {
					type = "conditional",
					value = config.StringArrayProp_ConditionalOptions.decode(Buffer4)
				}
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v103)
				v103 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2459 = ProtoModule.readFixed32(Buf, v103)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2459 = ProtoModule.readFixed64(Buf, v103)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module102:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		end
		if self.kind.type == "binding_path" then
			t.bindingPath = self.kind.value
			
			return t
		end
		if self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function Module102:jsonDecode()
	-- upvalues: Module102 (copy), PropConditionModule (copy), config (copy)
	local NewModule = Module102.new()
	
	if self.condition ~= nil then
		NewModule.condition = PropConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		NewModule.kind = {
			type = "literal",
			value = config.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		NewModule.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		NewModule.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		NewModule.kind = {
			type = "conditional",
			value = config.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return NewModule
end

Module102.descriptor = {
	name = "StringArrayProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
config.StringArrayProp_ConditionalOption = Module102
TypeRegistryModule.default:register(config.StringArrayProp_ConditionalOption)
local Module103 = {}
Module103.__index = Module103

function Module103.new(p1)
	-- upvalues: Module103 (copy)
	return (setmetatable({
		options = if p1 == nil or p1.options == nil then {} else p1.options
	}, Module103))
end

function Module103:encode()
	-- upvalues: ProtoModule (copy)
	local Buf = buffer.create(0)
	local Count = 0
	
	if self.options ~= nil and #self.options > 0 then
		for _, option in self.options do
			local EncodeResult = option:encode()
			local WriteTagResult, WriteTagResult2 = ProtoModule.writeTag(Buf, Count, 1, ProtoModule.wireTypes.lengthDelimited)
			Buf, Count = ProtoModule.writeBuffer(WriteTagResult, WriteTagResult2, EncodeResult, buffer.len(EncodeResult))
		end
	end
	local Buf1 = buffer.create(Count)
	buffer.copy(Buf1, 0, Buf, 0, Count)
	
	return Buf1
end

function Module103.decode(Buf)
	-- upvalues: Module103 (copy), ProtoModule (copy), config (copy)
	local NewModule = Module103.new()
	local v104 = 0
	while v104 < buffer.len(Buf) do
		local Tag, Tag2
		Tag, Tag2, v2479 = ProtoModule.readTag(Buf, v104)
		
		if Tag2 == ProtoModule.wireTypes.varint then
			local _
			_, v2479 = ProtoModule.readVarInt(Buf, v104)
		elseif Tag2 == ProtoModule.wireTypes.lengthDelimited then
			if Tag == 1 then
				local Buffer1
				Buffer1, v2479 = ProtoModule.readBuffer(Buf, v104)
				table.insert(NewModule.options, config.StringArrayProp_ConditionalOption.decode(Buffer1))
			else
				local VarInt, VarInt2 = ProtoModule.readVarInt(Buf, v104)
				v104 = VarInt2 + VarInt
			end
		elseif Tag2 == ProtoModule.wireTypes.i32 then
			local _
			_, v2479 = ProtoModule.readFixed32(Buf, v104)
		elseif Tag2 == ProtoModule.wireTypes.i64 then
			local _
			_, v2479 = ProtoModule.readFixed64(Buf, v104)
		else
			error("Unsupported wire type: " .. Tag2)
		end
	end
	return NewModule
end

function Module103:jsonEncode()
	local t = {}
	
	if self.options ~= nil and #self.options > 0 then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, option:jsonEncode())
		end
		t.options = Options
	end
	return t
end

function Module103:jsonDecode()
	-- upvalues: Module103 (copy), config (copy)
	local NewModule = Module103.new()
	
	if self.options ~= nil then
		local Options = {}
		
		for _, option in self.options do
			table.insert(Options, config.StringArrayProp_ConditionalOption.jsonDecode(option))
		end
		NewModule.options = Options
	end
	return NewModule
end

Module103.descriptor = {
	name = "StringArrayProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
config.StringArrayProp_ConditionalOptions = Module103
TypeRegistryModule.default:register(config.StringArrayProp_ConditionalOptions)
config.ScaleBasis = {
	fromNumber = function(p1)
		return if p1 == 0 then "SCALE_BASIS_INVALID" elseif p1 == 1 then "SCALE_BASIS_PARENT" elseif p1 == 2 then "SCALE_BASIS_VIEWPORT" else nil
	end,
	toNumber = function(p1)
		return if p1 == "SCALE_BASIS_INVALID" then 0 elseif p1 == "SCALE_BASIS_PARENT" then 1 elseif p1 == "SCALE_BASIS_VIEWPORT" then 2 else p1
	end,
	fromName = function(p1)
		return if p1 == "SCALE_BASIS_INVALID" then "SCALE_BASIS_INVALID" elseif p1 == "SCALE_BASIS_PARENT" then "SCALE_BASIS_PARENT" elseif p1 == "SCALE_BASIS_VIEWPORT" then "SCALE_BASIS_VIEWPORT" else nil
	end
}

return {
	TranslationRef = config.TranslationRef,
	StringFormat = config.StringFormat,
	StringFormat_FormatArg = config.StringFormat_FormatArg,
	StringFormat_FormatArg_Formatter = config.StringFormat_FormatArg_Formatter,
	StringFormat_FormatArg_Formatter_DateConfig = config.StringFormat_FormatArg_Formatter_DateConfig,
	StringFormat_FormatArg_Formatter_Type = config.StringFormat_FormatArg_Formatter_Type,
	StringProp = config.StringProp,
	StringProp_ConditionalOption = config.StringProp_ConditionalOption,
	StringProp_ConditionalOptions = config.StringProp_ConditionalOptions,
	FloatProp = config.FloatProp,
	FloatProp_ConditionalOption = config.FloatProp_ConditionalOption,
	FloatProp_ConditionalOptions = config.FloatProp_ConditionalOptions,
	DoubleProp = config.DoubleProp,
	DoubleProp_ConditionalOption = config.DoubleProp_ConditionalOption,
	DoubleProp_ConditionalOptions = config.DoubleProp_ConditionalOptions,
	Int32Prop = config.Int32Prop,
	Int32Prop_ConditionalOption = config.Int32Prop_ConditionalOption,
	Int32Prop_ConditionalOptions = config.Int32Prop_ConditionalOptions,
	Int64Prop = config.Int64Prop,
	Int64Prop_ConditionalOption = config.Int64Prop_ConditionalOption,
	Int64Prop_ConditionalOptions = config.Int64Prop_ConditionalOptions,
	BoolProp = config.BoolProp,
	BoolProp_ConditionalOption = config.BoolProp_ConditionalOption,
	BoolProp_ConditionalOptions = config.BoolProp_ConditionalOptions,
	StructProp = config.StructProp,
	StructProp_ConditionalOption = config.StructProp_ConditionalOption,
	StructProp_ConditionalOptions = config.StructProp_ConditionalOptions,
	ImageStringProp = config.ImageStringProp,
	ImageStringProp_ConditionalOption = config.ImageStringProp_ConditionalOption,
	ImageStringProp_ConditionalOptions = config.ImageStringProp_ConditionalOptions,
	ImageSetProp = config.ImageSetProp,
	ImageSetProp_ConditionalOption = config.ImageSetProp_ConditionalOption,
	ImageSetProp_ConditionalOptions = config.ImageSetProp_ConditionalOptions,
	ColorProp = config.ColorProp,
	ColorProp_ConditionalOption = config.ColorProp_ConditionalOption,
	ColorProp_ConditionalOptions = config.ColorProp_ConditionalOptions,
	TypographyProp = config.TypographyProp,
	TypographyProp_ConditionalOption = config.TypographyProp_ConditionalOption,
	TypographyProp_ConditionalOptions = config.TypographyProp_ConditionalOptions,
	TypographyFontProp = config.TypographyFontProp,
	TypographyFontProp_ConditionalOption = config.TypographyFontProp_ConditionalOption,
	TypographyFontProp_ConditionalOptions = config.TypographyFontProp_ConditionalOptions,
	ColorStyleProp = config.ColorStyleProp,
	ColorStyleProp_ConditionalOption = config.ColorStyleProp_ConditionalOption,
	ColorStyleProp_ConditionalOptions = config.ColorStyleProp_ConditionalOptions,
	FillBehaviorProp = config.FillBehaviorProp,
	FillBehaviorProp_ConditionalOption = config.FillBehaviorProp_ConditionalOption,
	FillBehaviorProp_ConditionalOptions = config.FillBehaviorProp_ConditionalOptions,
	InputSizeProp = config.InputSizeProp,
	InputSizeProp_ConditionalOption = config.InputSizeProp_ConditionalOption,
	InputSizeProp_ConditionalOptions = config.InputSizeProp_ConditionalOptions,
	UDimProp = config.UDimProp,
	UDimProp_ConditionalOption = config.UDimProp_ConditionalOption,
	UDimProp_ConditionalOptions = config.UDimProp_ConditionalOptions,
	UDim2Prop = config.UDim2Prop,
	UDim2Prop_ConditionalOption = config.UDim2Prop_ConditionalOption,
	UDim2Prop_ConditionalOptions = config.UDim2Prop_ConditionalOptions,
	Vector2Prop = config.Vector2Prop,
	Vector2Prop_ConditionalOption = config.Vector2Prop_ConditionalOption,
	Vector2Prop_ConditionalOptions = config.Vector2Prop_ConditionalOptions,
	IconProp = config.IconProp,
	IconProp_ConditionalOption = config.IconProp_ConditionalOption,
	IconProp_ConditionalOptions = config.IconProp_ConditionalOptions,
	FoundationIconConfigProp = config.FoundationIconConfigProp,
	FoundationIconConfigProp_ConditionalOption = config.FoundationIconConfigProp_ConditionalOption,
	FoundationIconConfigProp_ConditionalOptions = config.FoundationIconConfigProp_ConditionalOptions,
	FoundationIconConfigProp_FoundationIconConfig = config.FoundationIconConfigProp_FoundationIconConfig,
	IconSizeProp = config.IconSizeProp,
	GradientProp = config.GradientProp,
	GradientProp_ConditionalOption = config.GradientProp_ConditionalOption,
	GradientProp_ConditionalOptions = config.GradientProp_ConditionalOptions,
	GradientProp_GradientData = config.GradientProp_GradientData,
	ArrayOfStructProp = config.ArrayOfStructProp,
	ArrayOfStructProp_ConditionalOption = config.ArrayOfStructProp_ConditionalOption,
	ArrayOfStructProp_ConditionalOptions = config.ArrayOfStructProp_ConditionalOptions,
	ArrayOfStructProp_ArrayOfStructs = config.ArrayOfStructProp_ArrayOfStructs,
	PymkItemData = config.PymkItemData,
	ArrayOfPymkItemDataProp = config.ArrayOfPymkItemDataProp,
	ArrayOfPymkItemDataProp_ConditionalOption = config.ArrayOfPymkItemDataProp_ConditionalOption,
	ArrayOfPymkItemDataProp_ConditionalOptions = config.ArrayOfPymkItemDataProp_ConditionalOptions,
	ArrayOfPymkItemDataProp_PymkItems = config.ArrayOfPymkItemDataProp_PymkItems,
	UiScaledFloatProp = config.UiScaledFloatProp,
	UiScaledFloatProp_ConditionalOption = config.UiScaledFloatProp_ConditionalOption,
	UiScaledFloatProp_ConditionalOptions = config.UiScaledFloatProp_ConditionalOptions,
	UiScaledUDimProp = config.UiScaledUDimProp,
	UiScaledUDimProp_ConditionalOption = config.UiScaledUDimProp_ConditionalOption,
	UiScaledUDimProp_ConditionalOptions = config.UiScaledUDimProp_ConditionalOptions,
	UiScaledUDim2Prop = config.UiScaledUDim2Prop,
	UiScaledUDim2Prop_ConditionalOption = config.UiScaledUDim2Prop_ConditionalOption,
	UiScaledUDim2Prop_ConditionalOptions = config.UiScaledUDim2Prop_ConditionalOptions,
	AvatarConfigProp = config.AvatarConfigProp,
	AvatarProp = config.AvatarProp,
	ArrayOfAvatarProp = config.ArrayOfAvatarProp,
	ArrayOfAvatarProp_ConditionalOption = config.ArrayOfAvatarProp_ConditionalOption,
	ArrayOfAvatarProp_ConditionalOptions = config.ArrayOfAvatarProp_ConditionalOptions,
	ArrayOfAvatarProp_ArrayOfAvatars = config.ArrayOfAvatarProp_ArrayOfAvatars,
	ArrayOfAvatarProp_ArrayMap = config.ArrayOfAvatarProp_ArrayMap,
	ScaleBasisProp = config.ScaleBasisProp,
	ScaleBasisProp_ConditionalOption = config.ScaleBasisProp_ConditionalOption,
	ScaleBasisProp_ConditionalOptions = config.ScaleBasisProp_ConditionalOptions,
	StringArrayProp = config.StringArrayProp,
	StringArrayProp_LiteralValue = config.StringArrayProp_LiteralValue,
	StringArrayProp_ConditionalOption = config.StringArrayProp_ConditionalOption,
	StringArrayProp_ConditionalOptions = config.StringArrayProp_ConditionalOptions,
	ScaleBasis = config.ScaleBasis
}