local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 2937 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		namespace = if p0 == nil or p0.namespace == nil then "" else p0.namespace,
		key = if p0 == nil or p0.key == nil then "" else p0.key,
		map_key = if p0 == nil or p0.map_key == nil then "" else p0.map_key
	}, t_1)
end

function t_1:encode() --[[ line: 2945 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var103 = 0
	
	if self.namespace ~= nil and self.namespace ~= "" then
		local var104, var105 = protoModule.writeTag(buff, var103, 1, protoModule.wireTypes.lengthDelimited)
		var104, var105 = protoModule.writeString(var104, var105, self.namespace)
		buff = var104
		var103 = var105
	end
	if self.key ~= nil and self.key ~= "" then
		local var106, var107 = protoModule.writeTag(buff, var103, 2, protoModule.wireTypes.lengthDelimited)
		var106, var107 = protoModule.writeString(var106, var107, self.key)
		buff = var106
		var103 = var107
	end
	if self.map_key ~= nil and self.map_key ~= "" then
		local var108, var109 = protoModule.writeTag(buff, var103, 3, protoModule.wireTypes.lengthDelimited)
		var108, var109 = protoModule.writeString(var108, var109, self.map_key)
		buff = var108
		var103 = var109
	end
	local buff_1 = buffer.create(var103)
	buffer.copy(buff_1, 0, buff, 0, var103)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 2969 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var111 = t_1.new()
	local var112 = 0
	while var112 < buffer.len(p1) do
		local _ = nil
		local var113 = nil
		local var114, var115, var116 = protoModule.readTag(p1, var112)
		local var117 = var114
		var113 = var115
		var112 = var116
		
		if var113 == protoModule.wireTypes.varint then
			local _ = nil
			local var118, var119 = protoModule.readVarInt(p1, var112)
			local _ = var118
			var112 = var119
			continue
		end
		if var113 == protoModule.wireTypes.lengthDelimited then
			if var117 == 1 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p1, var112)
				var112 = var121
				var111.namespace = buffer.tostring(var120)
			elseif var117 == 2 then
				local _ = nil
				local var122, var123 = protoModule.readBuffer(p1, var112)
				var112 = var123
				var111.key = buffer.tostring(var122)
			elseif var117 == 3 then
				local _ = nil
				local var124, var125 = protoModule.readBuffer(p1, var112)
				var112 = var125
				var111.map_key = buffer.tostring(var124)
			else
				local _ = nil
				local var126, var127 = protoModule.readVarInt(p1, var112)
				var112 = var127 + var126
			end
		elseif var113 == protoModule.wireTypes.i32 then
			local _ = nil
			local var128, var129 = protoModule.readFixed32(p1, var112)
			local _ = var128
			var112 = var129
		elseif var113 == protoModule.wireTypes.i64 then
			local _ = nil
			local var130, var131 = protoModule.readFixed64(p1, var112)
			local _ = var130
			var112 = var131
		else
			error("Unsupported wire type: " .. var113)
		end
	end
	return var111
end

function t_1:jsonEncode() --[[ line: 3022 ]]
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

function t_1:jsonDecode() --[[ line: 3040 ]]
	-- upvalues: t_1 (ref)
	local var133 = t_1.new()
	
	if self.namespace ~= nil then
		var133.namespace = self.namespace
	end
	if self.key ~= nil then
		var133.key = self.key
	end
	if self.map_key ~= nil then
		var133.map_key = self.map_key
	end
	if self.mapKey ~= nil then
		var133.map_key = self.mapKey
	end
	return var133
end

t_1.descriptor = {
	name = "TranslationRef",
	fullName = "roblox.apppageplatform.shared.v1beta1.TranslationRef"
}
t.TranslationRef = t_1
typeRegistryModule.default:register(t.TranslationRef)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 3076 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		str = if p2 == nil or p2.str == nil then "" else p2.str,
		args = if p2 == nil or p2.args == nil then {} else p2.args,
		translation = if p2 == nil or p2.translation == nil then nil else p2.translation
	}, t_2)
end

function t_2:encode() --[[ line: 3084 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var135 = 0
	
	if self.str ~= nil and self.str ~= "" then
		local var136, var137 = protoModule.writeTag(buff, var135, 1, protoModule.wireTypes.lengthDelimited)
		var136, var137 = protoModule.writeString(var136, var137, self.str)
		buff = var136
		var135 = var137
	end
	if self.args ~= nil and next(self.args) ~= nil then
		for i, v in self.args do
			local var138, var139 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var138, var139 = protoModule.writeString(var138, var139, i)
			local var140 = v:encode()
			var139, var141 = protoModule.writeTag(var138, var139, 2, protoModule.wireTypes.lengthDelimited)
			var139, var141 = protoModule.writeBuffer(var139, var141, var140, buffer.len(var140))
			local var142 = var139
			local var143 = var141
			local var144, var145 = protoModule.writeTag(buff, var135, 2, protoModule.wireTypes.lengthDelimited)
			var144, var145 = protoModule.writeBuffer(var144, var145, var142, var143)
			buff = var144
			var135 = var145
		end
	end
	if self.translation ~= nil then
		local var146 = self.translation:encode()
		local var147, var148 = protoModule.writeTag(buff, var135, 3, protoModule.wireTypes.lengthDelimited)
		var147, var148 = protoModule.writeBuffer(var147, var148, var146, buffer.len(var146))
		buff = var147
		var135 = var148
	end
	local buff_1 = buffer.create(var135)
	buffer.copy(buff_1, 0, buff, 0, var135)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 3118 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var150 = t_2.new()
	local var151 = 0
	while var151 < buffer.len(p3) do
		local _ = nil
		local var152 = nil
		local var153, var154, var155 = protoModule.readTag(p3, var151)
		local var156 = var153
		var152 = var154
		var151 = var155
		
		if var152 == protoModule.wireTypes.varint then
			local _ = nil
			local var157, var158 = protoModule.readVarInt(p3, var151)
			local _ = var157
			var151 = var158
			continue
		end
		if var152 == protoModule.wireTypes.lengthDelimited then
			if var156 == 1 then
				local _ = nil
				local var159, var160 = protoModule.readBuffer(p3, var151)
				var151 = var160
				var150.str = buffer.tostring(var159)
			elseif var156 == 2 then
				local _ = nil
				local var161, var162 = protoModule.readBuffer(p3, var151)
				var151 = var162
				var161 = t.StringFormat_ArgsEntry.decode(var161)
				var150.args[var161.key or ""] = var161.value or t.StringFormat_FormatArg.new()
			elseif var156 == 3 then
				local _ = nil
				local var163, var164 = protoModule.readBuffer(p3, var151)
				var151 = var164
				var150.translation = t.TranslationRef.decode(var163)
			else
				local _ = nil
				local var165, var166 = protoModule.readVarInt(p3, var151)
				var151 = var166 + var165
			end
		elseif var152 == protoModule.wireTypes.i32 then
			local _ = nil
			local var167, var168 = protoModule.readFixed32(p3, var151)
			local _ = var167
			var151 = var168
		elseif var152 == protoModule.wireTypes.i64 then
			local _ = nil
			local var169, var170 = protoModule.readFixed64(p3, var151)
			local _ = var169
			var151 = var170
		else
			error("Unsupported wire type: " .. var152)
		end
	end
	return var150
end

function t_2:jsonEncode() --[[ line: 3178 ]]
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

function t_2:jsonDecode() --[[ line: 3200 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var173 = t_2.new()
	
	if self.str ~= nil then
		var173.str = self.str
	end
	if self.args ~= nil then
		local t_1 = {}
		
		for i, v in self.args do
			t_1[i] = t.StringFormat_FormatArg.jsonDecode(v)
		end
		var173.args = t_1
	end
	if self.translation ~= nil then
		var173.translation = t.TranslationRef.jsonDecode(self.translation)
	end
	return var173
end

t_2.descriptor = {
	name = "StringFormat",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
}
t.StringFormat = t_2
typeRegistryModule.default:register(t.StringFormat)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 3237 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind,
		formatter = if p4 == nil or p4.formatter == nil then nil else p4.formatter
	}, t_3)
end

function t_3:encode() --[[ line: 3244 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var176 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var177, var178 = protoModule.writeTag(buff, var176, 1, protoModule.wireTypes.lengthDelimited)
			var177, var178 = protoModule.writeString(var177, var178, self.kind.value)
			buff = var177
			var176 = var178
		elseif self.kind.type == "binding_path" then
			local var179, var180 = protoModule.writeTag(buff, var176, 2, protoModule.wireTypes.lengthDelimited)
			var179, var180 = protoModule.writeString(var179, var180, self.kind.value)
			buff = var179
			var176 = var180
		end
	end
	if self.formatter ~= nil then
		local var181 = self.formatter:encode()
		local var182, var183 = protoModule.writeTag(buff, var176, 3, protoModule.wireTypes.lengthDelimited)
		var182, var183 = protoModule.writeBuffer(var182, var183, var181, buffer.len(var181))
		buff = var182
		var176 = var183
	end
	local buff_1 = buffer.create(var176)
	buffer.copy(buff_1, 0, buff, 0, var176)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 3269 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var185 = t_3.new()
	local var186 = 0
	while var186 < buffer.len(p5) do
		local _ = nil
		local var187 = nil
		local var188, var189, var190 = protoModule.readTag(p5, var186)
		local var191 = var188
		var187 = var189
		var186 = var190
		
		if var187 == protoModule.wireTypes.varint then
			local _ = nil
			local var192, var193 = protoModule.readVarInt(p5, var186)
			local _ = var192
			var186 = var193
			continue
		end
		if var187 == protoModule.wireTypes.lengthDelimited then
			if var191 == 1 then
				local _ = nil
				local var194, var195 = protoModule.readBuffer(p5, var186)
				var186 = var195
				var185.kind = { type = "literal", value = buffer.tostring(var194) }
			elseif var191 == 2 then
				local _ = nil
				local var196, var197 = protoModule.readBuffer(p5, var186)
				var186 = var197
				var185.kind = { type = "binding_path", value = buffer.tostring(var196) }
			elseif var191 == 3 then
				local _ = nil
				local var198, var199 = protoModule.readBuffer(p5, var186)
				var186 = var199
				var185.formatter = t.StringFormat_FormatArg_Formatter.decode(var198)
			else
				local _ = nil
				local var200, var201 = protoModule.readVarInt(p5, var186)
				var186 = var201 + var200
			end
		elseif var187 == protoModule.wireTypes.i32 then
			local _ = nil
			local var202, var203 = protoModule.readFixed32(p5, var186)
			local _ = var202
			var186 = var203
		elseif var187 == protoModule.wireTypes.i64 then
			local _ = nil
			local var204, var205 = protoModule.readFixed64(p5, var186)
			local _ = var204
			var186 = var205
		else
			error("Unsupported wire type: " .. var187)
		end
	end
	return var185
end

function t_3:jsonEncode() --[[ line: 3322 ]]
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

function t_3:jsonDecode() --[[ line: 3340 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var207 = t_3.new()
	
	if self.literal ~= nil then
		var207.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var207.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var207.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.formatter ~= nil then
		var207.formatter = t.StringFormat_FormatArg_Formatter.jsonDecode(self.formatter)
	end
	return var207
end

t_3.descriptor = {
	name = "StringFormat_FormatArg",
	fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
}
t.StringFormat_FormatArg = t_3
typeRegistryModule.default:register(t.StringFormat_FormatArg)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 3376 ]]
	-- upvalues: t (ref), t_4 (ref)
	return setmetatable({
		type = if p6 == nil or p6.type == nil then assert(t.StringFormat_FormatArg_Formatter_Type.fromNumber(0), "Enum has no 0 default") else p6.type,
		config = if p6 == nil or p6.config == nil then nil else p6.config
	}, t_4)
end

function t_4:encode() --[[ line: 3387 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var209 = 0
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= t.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		local var210, var211 = protoModule.writeTag(buff, var209, 1, protoModule.wireTypes.varint)
		var210, var211 = protoModule.writeVarInt(var210, var211, t.StringFormat_FormatArg_Formatter_Type.toNumber(self.type))
		buff = var210
		var209 = var211
	end
	if self.config ~= nil and self.config.type == "date_config" then
		local var212 = self.config.value:encode()
		local var213, var214 = protoModule.writeTag(buff, var209, 2, protoModule.wireTypes.lengthDelimited)
		var213, var214 = protoModule.writeBuffer(var213, var214, var212, buffer.len(var212))
		buff = var213
		var209 = var214
	end
	local buff_1 = buffer.create(var209)
	buffer.copy(buff_1, 0, buff, 0, var209)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 3419 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var216 = t_4.new()
	local var217 = 0
	while var217 < buffer.len(p7) do
		local _ = nil
		local var218 = nil
		local var219, var220, var221 = protoModule.readTag(p7, var217)
		local var222 = var219
		var218 = var220
		var217 = var221
		
		if var218 == protoModule.wireTypes.varint then
			if var222 == 1 then
				local _ = nil
				local var223, var224 = protoModule.readVarIntI32(p7, var217)
				local var225 = var223
				var217 = var224
				var216.type = t.StringFormat_FormatArg_Formatter_Type.fromNumber(var225) or var225
			else
				local _ = nil
				local var226, var227 = protoModule.readVarInt(p7, var217)
				local _ = var226
				var217 = var227
			end
		end
		if var218 == protoModule.wireTypes.lengthDelimited then
			if var222 == 2 then
				local _ = nil
				local var228, var229 = protoModule.readBuffer(p7, var217)
				var217 = var229
				var216.config = {
					type = "date_config",
					value = t.StringFormat_FormatArg_Formatter_DateConfig.decode(var228)
				}
			else
				local _ = nil
				local var230, var231 = protoModule.readVarInt(p7, var217)
				var217 = var231 + var230
			end
		elseif var218 == protoModule.wireTypes.i32 then
			local _ = nil
			local var232, var233 = protoModule.readFixed32(p7, var217)
			local _ = var232
			var217 = var233
		elseif var218 == protoModule.wireTypes.i64 then
			local _ = nil
			local var234, var235 = protoModule.readFixed64(p7, var217)
			local _ = var234
			var217 = var235
		else
			error("Unsupported wire type: " .. var218)
		end
	end
	return var216
end

function t_4:jsonEncode() --[[ line: 3470 ]]
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

function t_4:jsonDecode() --[[ line: 3494 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var237 = t_4.new()
	
	if self.type ~= nil then
		var237.type = if typeof(self.type) == "number" then t.StringFormat_FormatArg_Formatter_Type.fromNumber(self.type) or self.type else t.StringFormat_FormatArg_Formatter_Type.fromName(self.type) or self.type
	end
	if self.date_config ~= nil then
		var237.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.date_config)
		}
	end
	if self.dateConfig ~= nil then
		var237.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.dateConfig)
		}
	end
	return var237
end

t_4.descriptor = {
	name = "StringFormat_FormatArg_Formatter",
	fullName = "roblox.apppageplatform.shared.v1beta1.Formatter"
}
t.StringFormat_FormatArg_Formatter = t_4
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 3536 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		pattern = if p8 == nil or p8.pattern == nil then "" else p8.pattern
	}, t_5)
end

function t_5:encode() --[[ line: 3544 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var239 = 0
	
	if self.pattern ~= nil and self.pattern ~= "" then
		local var240, var241 = protoModule.writeTag(buff, var239, 1, protoModule.wireTypes.lengthDelimited)
		var240, var241 = protoModule.writeString(var240, var241, self.pattern)
		buff = var240
		var239 = var241
	end
	local buff_1 = buffer.create(var239)
	buffer.copy(buff_1, 0, buff, 0, var239)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 3560 ]]
	-- upvalues: t_5 (ref), protoModule (ref)
	local var243 = t_5.new()
	local var244 = 0
	while var244 < buffer.len(p9) do
		local _ = nil
		local var245 = nil
		local var246, var247, var248 = protoModule.readTag(p9, var244)
		local var249 = var246
		var245 = var247
		var244 = var248
		
		if var245 == protoModule.wireTypes.varint then
			local _ = nil
			local var250, var251 = protoModule.readVarInt(p9, var244)
			local _ = var250
			var244 = var251
			continue
		end
		if var245 == protoModule.wireTypes.lengthDelimited then
			if var249 == 1 then
				local _ = nil
				local var252, var253 = protoModule.readBuffer(p9, var244)
				var244 = var253
				var243.pattern = buffer.tostring(var252)
			else
				local _ = nil
				local var254, var255 = protoModule.readVarInt(p9, var244)
				var244 = var255 + var254
			end
		elseif var245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var256, var257 = protoModule.readFixed32(p9, var244)
			local _ = var256
			var244 = var257
		elseif var245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var258, var259 = protoModule.readFixed64(p9, var244)
			local _ = var258
			var244 = var259
		else
			error("Unsupported wire type: " .. var245)
		end
	end
	return var243
end

function t_5:jsonEncode() --[[ line: 3605 ]]
	local t = {}
	
	if self.pattern ~= nil and self.pattern ~= "" then
		t.pattern = self.pattern
	end
	return t
end

function t_5:jsonDecode() --[[ line: 3617 ]]
	-- upvalues: t_5 (ref)
	local var261 = t_5.new()
	
	if self.pattern ~= nil then
		var261.pattern = self.pattern
	end
	return var261
end

t_5.descriptor = {
	name = "StringFormat_FormatArg_Formatter_DateConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.DateConfig"
}
t.StringFormat_FormatArg_Formatter_DateConfig = t_5
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter_DateConfig)
t.StringFormat_FormatArg_Formatter_Type = {
	fromNumber = function(p10) --[[ line: 3640 ]]
		return if p10 == 0 then "TYPE_INVALID" elseif p10 == 1 then "TYPE_NUMBER_ABBREVIATE" elseif p10 == 2 then "TYPE_NUMBER_LOCALIZE" elseif p10 == 3 then "TYPE_DATE_FORMAT" else nil
	end,
	toNumber = function(p11) --[[ line: 3654 ]]
		return if p11 == "TYPE_INVALID" then 0 elseif p11 == "TYPE_NUMBER_ABBREVIATE" then 1 elseif p11 == "TYPE_NUMBER_LOCALIZE" then 2 elseif p11 == "TYPE_DATE_FORMAT" then 3 else p11
	end,
	fromName = function(p12) --[[ line: 3668 ]]
		return if p12 == "TYPE_INVALID" then "TYPE_INVALID" elseif p12 == "TYPE_NUMBER_ABBREVIATE" then "TYPE_NUMBER_ABBREVIATE" elseif p12 == "TYPE_NUMBER_LOCALIZE" then "TYPE_NUMBER_LOCALIZE" elseif p12 == "TYPE_DATE_FORMAT" then "TYPE_DATE_FORMAT" else nil
	end
}
local t_6 = {}
t_6.__index = t_6

function t_6.new(p13) --[[ line: 3687 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p13 == nil or p13.key == nil then "" else p13.key,
		value = if p13 == nil or p13.value == nil then nil else p13.value
	}, t_6)
end

function t_6:encode() --[[ line: 3694 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var263 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var264, var265 = protoModule.writeTag(buff, var263, 1, protoModule.wireTypes.lengthDelimited)
		var264, var265 = protoModule.writeString(var264, var265, self.key)
		buff = var264
		var263 = var265
	end
	if self.value ~= nil then
		local var266 = self.value:encode()
		local var267, var268 = protoModule.writeTag(buff, var263, 2, protoModule.wireTypes.lengthDelimited)
		var267, var268 = protoModule.writeBuffer(var267, var268, var266, buffer.len(var266))
		buff = var267
		var263 = var268
	end
	local buff_1 = buffer.create(var263)
	buffer.copy(buff_1, 0, buff, 0, var263)
	
	return buff_1
end

function t_6.decode(p14) --[[ line: 3714 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var270 = t_6.new()
	local var271 = 0
	while var271 < buffer.len(p14) do
		local _ = nil
		local var272 = nil
		local var273, var274, var275 = protoModule.readTag(p14, var271)
		local var276 = var273
		var272 = var274
		var271 = var275
		
		if var272 == protoModule.wireTypes.varint then
			local _ = nil
			local var277, var278 = protoModule.readVarInt(p14, var271)
			local _ = var277
			var271 = var278
			continue
		end
		if var272 == protoModule.wireTypes.lengthDelimited then
			if var276 == 1 then
				local _ = nil
				local var279, var280 = protoModule.readBuffer(p14, var271)
				var271 = var280
				var270.key = buffer.tostring(var279)
			elseif var276 == 2 then
				local _ = nil
				local var281, var282 = protoModule.readBuffer(p14, var271)
				var271 = var282
				var270.value = t.StringFormat_FormatArg.decode(var281)
			else
				local _ = nil
				local var283, var284 = protoModule.readVarInt(p14, var271)
				var271 = var284 + var283
			end
		elseif var272 == protoModule.wireTypes.i32 then
			local _ = nil
			local var285, var286 = protoModule.readFixed32(p14, var271)
			local _ = var285
			var271 = var286
		elseif var272 == protoModule.wireTypes.i64 then
			local _ = nil
			local var287, var288 = protoModule.readFixed64(p14, var271)
			local _ = var287
			var271 = var288
		else
			error("Unsupported wire type: " .. var272)
		end
	end
	return var270
end

function t_6:jsonEncode() --[[ line: 3762 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 3776 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var290 = t_6.new()
	
	if self.key ~= nil then
		var290.key = self.key
	end
	if self.value ~= nil then
		var290.value = t.StringFormat_FormatArg.jsonDecode(self.value)
	end
	return var290
end

t_6.descriptor = {
	name = "StringFormat_ArgsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
}
t.StringFormat_ArgsEntry = t_6
typeRegistryModule.default:register(t.StringFormat_ArgsEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p15) --[[ line: 3804 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		kind = if p15 == nil or p15.kind == nil then nil else p15.kind
	}, t_7)
end

function t_7:encode() --[[ line: 3810 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var292 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var293, var294 = protoModule.writeTag(buff, var292, 1, protoModule.wireTypes.lengthDelimited)
			var293, var294 = protoModule.writeString(var293, var294, self.kind.value)
			buff = var293
			var292 = var294
		elseif self.kind.type == "binding_path" then
			local var295, var296 = protoModule.writeTag(buff, var292, 2, protoModule.wireTypes.lengthDelimited)
			var295, var296 = protoModule.writeString(var295, var296, self.kind.value)
			buff = var295
			var292 = var296
		elseif self.kind.type == "token" then
			local var297, var298 = protoModule.writeTag(buff, var292, 3, protoModule.wireTypes.lengthDelimited)
			var297, var298 = protoModule.writeString(var297, var298, self.kind.value)
			buff = var297
			var292 = var298
		elseif self.kind.type == "format" then
			local var299 = self.kind.value:encode()
			local var300, var301 = protoModule.writeTag(buff, var292, 4, protoModule.wireTypes.lengthDelimited)
			var300, var301 = protoModule.writeBuffer(var300, var301, var299, buffer.len(var299))
			buff = var300
			var292 = var301
		elseif self.kind.type == "conditional" then
			local var302 = self.kind.value:encode()
			local var303, var304 = protoModule.writeTag(buff, var292, 5, protoModule.wireTypes.lengthDelimited)
			var303, var304 = protoModule.writeBuffer(var303, var304, var302, buffer.len(var302))
			buff = var303
			var292 = var304
		elseif self.kind.type == "translation" then
			local var305 = self.kind.value:encode()
			local var306, var307 = protoModule.writeTag(buff, var292, 6, protoModule.wireTypes.lengthDelimited)
			var306, var307 = protoModule.writeBuffer(var306, var307, var305, buffer.len(var305))
			buff = var306
			var292 = var307
		end
	end
	local buff_1 = buffer.create(var292)
	buffer.copy(buff_1, 0, buff, 0, var292)
	
	return buff_1
end

function t_7.decode(p16) --[[ line: 3844 ]]
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var309 = t_7.new()
	local var310 = 0
	while var310 < buffer.len(p16) do
		local _ = nil
		local var311 = nil
		local var312, var313, var314 = protoModule.readTag(p16, var310)
		local var315 = var312
		var311 = var313
		var310 = var314
		
		if var311 == protoModule.wireTypes.varint then
			local _ = nil
			local var316, var317 = protoModule.readVarInt(p16, var310)
			local _ = var316
			var310 = var317
			continue
		end
		if var311 == protoModule.wireTypes.lengthDelimited then
			if var315 == 1 then
				local _ = nil
				local var318, var319 = protoModule.readBuffer(p16, var310)
				var310 = var319
				var309.kind = { type = "literal", value = buffer.tostring(var318) }
			elseif var315 == 2 then
				local _ = nil
				local var320, var321 = protoModule.readBuffer(p16, var310)
				var310 = var321
				var309.kind = { type = "binding_path", value = buffer.tostring(var320) }
			elseif var315 == 3 then
				local _ = nil
				local var322, var323 = protoModule.readBuffer(p16, var310)
				var310 = var323
				var309.kind = { type = "token", value = buffer.tostring(var322) }
			elseif var315 == 4 then
				local _ = nil
				local var324, var325 = protoModule.readBuffer(p16, var310)
				var310 = var325
				var309.kind = { type = "format", value = t.StringFormat.decode(var324) }
			elseif var315 == 5 then
				local _ = nil
				local var326, var327 = protoModule.readBuffer(p16, var310)
				var310 = var327
				var309.kind = {
					type = "conditional",
					value = t.StringProp_ConditionalOptions.decode(var326)
				}
			elseif var315 == 6 then
				local _ = nil
				local var328, var329 = protoModule.readBuffer(p16, var310)
				var310 = var329
				var309.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var328)
				}
			else
				local _ = nil
				local var330, var331 = protoModule.readVarInt(p16, var310)
				var310 = var331 + var330
			end
		elseif var311 == protoModule.wireTypes.i32 then
			local _ = nil
			local var332, var333 = protoModule.readFixed32(p16, var310)
			local _ = var332
			var310 = var333
		elseif var311 == protoModule.wireTypes.i64 then
			local _ = nil
			local var334, var335 = protoModule.readFixed64(p16, var310)
			local _ = var334
			var310 = var335
		else
			error("Unsupported wire type: " .. var311)
		end
	end
	return var309
end

function t_7:jsonEncode() --[[ line: 3912 ]]
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

function t_7:jsonDecode() --[[ line: 3934 ]]
	-- upvalues: t_7 (ref), t (ref)
	local var337 = t_7.new()
	
	if self.literal ~= nil then
		var337.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var337.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var337.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var337.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var337.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var337.kind = {
			type = "conditional",
			value = t.StringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var337.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var337
end

t_7.descriptor = {
	name = "StringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
}
t.StringProp = t_7
typeRegistryModule.default:register(t.StringProp)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p17) --[[ line: 3983 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		condition = if p17 == nil or p17.condition == nil then nil else p17.condition,
		kind = if p17 == nil or p17.kind == nil then nil else p17.kind
	}, t_8)
end

function t_8:encode() --[[ line: 3992 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var339 = 0
	
	if self.condition ~= nil then
		local var340 = self.condition:encode()
		local var341, var342 = protoModule.writeTag(buff, var339, 1, protoModule.wireTypes.lengthDelimited)
		var341, var342 = protoModule.writeBuffer(var341, var342, var340, buffer.len(var340))
		buff = var341
		var339 = var342
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var343, var344 = protoModule.writeTag(buff, var339, 2, protoModule.wireTypes.lengthDelimited)
			var343, var344 = protoModule.writeString(var343, var344, self.kind.value)
			buff = var343
			var339 = var344
		elseif self.kind.type == "binding_path" then
			local var345, var346 = protoModule.writeTag(buff, var339, 3, protoModule.wireTypes.lengthDelimited)
			var345, var346 = protoModule.writeString(var345, var346, self.kind.value)
			buff = var345
			var339 = var346
		elseif self.kind.type == "token" then
			local var347, var348 = protoModule.writeTag(buff, var339, 4, protoModule.wireTypes.lengthDelimited)
			var347, var348 = protoModule.writeString(var347, var348, self.kind.value)
			buff = var347
			var339 = var348
		elseif self.kind.type == "format" then
			local var349 = self.kind.value:encode()
			local var350, var351 = protoModule.writeTag(buff, var339, 5, protoModule.wireTypes.lengthDelimited)
			var350, var351 = protoModule.writeBuffer(var350, var351, var349, buffer.len(var349))
			buff = var350
			var339 = var351
		elseif self.kind.type == "translation" then
			local var352 = self.kind.value:encode()
			local var353, var354 = protoModule.writeTag(buff, var339, 6, protoModule.wireTypes.lengthDelimited)
			var353, var354 = protoModule.writeBuffer(var353, var354, var352, buffer.len(var352))
			buff = var353
			var339 = var354
		end
	end
	local buff_1 = buffer.create(var339)
	buffer.copy(buff_1, 0, buff, 0, var339)
	
	return buff_1
end

function t_8.decode(p18) --[[ line: 4028 ]]
	-- upvalues: t_8 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var356 = t_8.new()
	local var357 = 0
	while var357 < buffer.len(p18) do
		local _ = nil
		local var358 = nil
		local var359, var360, var361 = protoModule.readTag(p18, var357)
		local var362 = var359
		var358 = var360
		var357 = var361
		
		if var358 == protoModule.wireTypes.varint then
			local _ = nil
			local var363, var364 = protoModule.readVarInt(p18, var357)
			local _ = var363
			var357 = var364
			continue
		end
		if var358 == protoModule.wireTypes.lengthDelimited then
			if var362 == 1 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p18, var357)
				var357 = var366
				var356.condition = propConditionModule.PropCondition.decode(var365)
			elseif var362 == 2 then
				local _ = nil
				local var367, var368 = protoModule.readBuffer(p18, var357)
				var357 = var368
				var356.kind = { type = "literal", value = buffer.tostring(var367) }
			elseif var362 == 3 then
				local _ = nil
				local var369, var370 = protoModule.readBuffer(p18, var357)
				var357 = var370
				var356.kind = { type = "binding_path", value = buffer.tostring(var369) }
			elseif var362 == 4 then
				local _ = nil
				local var371, var372 = protoModule.readBuffer(p18, var357)
				var357 = var372
				var356.kind = { type = "token", value = buffer.tostring(var371) }
			elseif var362 == 5 then
				local _ = nil
				local var373, var374 = protoModule.readBuffer(p18, var357)
				var357 = var374
				var356.kind = { type = "format", value = t.StringFormat.decode(var373) }
			elseif var362 == 6 then
				local _ = nil
				local var375, var376 = protoModule.readBuffer(p18, var357)
				var357 = var376
				var356.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var375)
				}
			else
				local _ = nil
				local var377, var378 = protoModule.readVarInt(p18, var357)
				var357 = var378 + var377
			end
		elseif var358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var379, var380 = protoModule.readFixed32(p18, var357)
			local _ = var379
			var357 = var380
		elseif var358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var381, var382 = protoModule.readFixed64(p18, var357)
			local _ = var381
			var357 = var382
		else
			error("Unsupported wire type: " .. var358)
		end
	end
	return var356
end

function t_8:jsonEncode() --[[ line: 4096 ]]
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

function t_8:jsonDecode() --[[ line: 4120 ]]
	-- upvalues: t_8 (ref), propConditionModule (ref), t (ref)
	local var384 = t_8.new()
	
	if self.condition ~= nil then
		var384.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var384.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var384.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var384.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var384.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var384.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var384.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var384
end

t_8.descriptor = {
	name = "StringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StringProp_ConditionalOption = t_8
typeRegistryModule.default:register(t.StringProp_ConditionalOption)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p19) --[[ line: 4169 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		options = if p19 == nil or p19.options == nil then {} else p19.options
	}, t_9)
end

function t_9:encode() --[[ line: 4177 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var386 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var387 = v:encode()
			local var388, var389 = protoModule.writeTag(buff, var386, 1, protoModule.wireTypes.lengthDelimited)
			var388, var389 = protoModule.writeBuffer(var388, var389, var387, buffer.len(var387))
			buff = var388
			var386 = var389
		end
	end
	local buff_1 = buffer.create(var386)
	buffer.copy(buff_1, 0, buff, 0, var386)
	
	return buff_1
end

function t_9.decode(p20) --[[ line: 4194 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var391 = t_9.new()
	local var392 = 0
	while var392 < buffer.len(p20) do
		local _ = nil
		local var393 = nil
		local var394, var395, var396 = protoModule.readTag(p20, var392)
		local var397 = var394
		var393 = var395
		var392 = var396
		
		if var393 == protoModule.wireTypes.varint then
			local _ = nil
			local var398, var399 = protoModule.readVarInt(p20, var392)
			local _ = var398
			var392 = var399
			continue
		end
		if var393 == protoModule.wireTypes.lengthDelimited then
			if var397 == 1 then
				local _ = nil
				local var400, var401 = protoModule.readBuffer(p20, var392)
				var392 = var401
				table.insert(var391.options, t.StringProp_ConditionalOption.decode(var400))
			else
				local _ = nil
				local var402, var403 = protoModule.readVarInt(p20, var392)
				var392 = var403 + var402
			end
		elseif var393 == protoModule.wireTypes.i32 then
			local _ = nil
			local var404, var405 = protoModule.readFixed32(p20, var392)
			local _ = var404
			var392 = var405
		elseif var393 == protoModule.wireTypes.i64 then
			local _ = nil
			local var406, var407 = protoModule.readFixed64(p20, var392)
			local _ = var406
			var392 = var407
		else
			error("Unsupported wire type: " .. var393)
		end
	end
	return var391
end

function t_9:jsonEncode() --[[ line: 4237 ]]
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

function t_9:jsonDecode() --[[ line: 4251 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var410 = t_9.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StringProp_ConditionalOption.jsonDecode(v))
		end
		var410.options = t_1
	end
	return var410
end

t_9.descriptor = {
	name = "StringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StringProp_ConditionalOptions = t_9
typeRegistryModule.default:register(t.StringProp_ConditionalOptions)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p21) --[[ line: 4280 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		kind = if p21 == nil or p21.kind == nil then nil else p21.kind
	}, t_10)
end

function t_10:encode() --[[ line: 4286 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var413 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var414, var415 = protoModule.writeTag(buff, var413, 1, protoModule.wireTypes.i32)
			var414, var415 = protoModule.writeFloat(var414, var415, self.kind.value)
			buff = var414
			var413 = var415
		elseif self.kind.type == "binding_path" then
			local var416, var417 = protoModule.writeTag(buff, var413, 2, protoModule.wireTypes.lengthDelimited)
			var416, var417 = protoModule.writeString(var416, var417, self.kind.value)
			buff = var416
			var413 = var417
		elseif self.kind.type == "token" then
			local var418, var419 = protoModule.writeTag(buff, var413, 3, protoModule.wireTypes.lengthDelimited)
			var418, var419 = protoModule.writeString(var418, var419, self.kind.value)
			buff = var418
			var413 = var419
		elseif self.kind.type == "conditional" then
			local var420 = self.kind.value:encode()
			local var421, var422 = protoModule.writeTag(buff, var413, 4, protoModule.wireTypes.lengthDelimited)
			var421, var422 = protoModule.writeBuffer(var421, var422, var420, buffer.len(var420))
			buff = var421
			var413 = var422
		end
	end
	local buff_1 = buffer.create(var413)
	buffer.copy(buff_1, 0, buff, 0, var413)
	
	return buff_1
end

function t_10.decode(p22) --[[ line: 4312 ]]
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var424 = t_10.new()
	local var425 = 0
	while var425 < buffer.len(p22) do
		local _ = nil
		local var426 = nil
		local var427, var428, var429 = protoModule.readTag(p22, var425)
		local var430 = var427
		var426 = var428
		var425 = var429
		
		if var426 == protoModule.wireTypes.varint then
			local _ = nil
			local var431, var432 = protoModule.readVarInt(p22, var425)
			local _ = var431
			var425 = var432
			continue
		end
		if var426 == protoModule.wireTypes.lengthDelimited then
			if var430 == 2 then
				local _ = nil
				local var433, var434 = protoModule.readBuffer(p22, var425)
				var425 = var434
				var424.kind = { type = "binding_path", value = buffer.tostring(var433) }
			elseif var430 == 3 then
				local _ = nil
				local var435, var436 = protoModule.readBuffer(p22, var425)
				var425 = var436
				var424.kind = { type = "token", value = buffer.tostring(var435) }
			elseif var430 == 4 then
				local _ = nil
				local var437, var438 = protoModule.readBuffer(p22, var425)
				var425 = var438
				var424.kind = {
					type = "conditional",
					value = t.FloatProp_ConditionalOptions.decode(var437)
				}
			else
				local _ = nil
				local var439, var440 = protoModule.readVarInt(p22, var425)
				var425 = var440 + var439
			end
		elseif var426 == protoModule.wireTypes.i32 then
			if var430 == 1 then
				local _ = nil
				local var441, var442 = protoModule.readFloat(p22, var425)
				var425 = var442
				var424.kind = { type = "literal", value = var441 }
			else
				local _ = nil
				local var443, var444 = protoModule.readFixed32(p22, var425)
				local _ = var443
				var425 = var444
			end
		elseif var426 == protoModule.wireTypes.i64 then
			local _ = nil
			local var445, var446 = protoModule.readFixed64(p22, var425)
			local _ = var445
			var425 = var446
		else
			error("Unsupported wire type: " .. var426)
		end
	end
	return var424
end

function t_10:jsonEncode() --[[ line: 4370 ]]
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

function t_10:jsonDecode() --[[ line: 4388 ]]
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var448 = t_10.new()
	
	if self.literal ~= nil then
		var448.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var448.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var448.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var448.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var448.kind = {
			type = "conditional",
			value = t.FloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var448
end

t_10.descriptor = {
	name = "FloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
}
t.FloatProp = t_10
typeRegistryModule.default:register(t.FloatProp)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p23) --[[ line: 4429 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		condition = if p23 == nil or p23.condition == nil then nil else p23.condition,
		kind = if p23 == nil or p23.kind == nil then nil else p23.kind
	}, t_11)
end

function t_11:encode() --[[ line: 4438 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var450 = 0
	
	if self.condition ~= nil then
		local var451 = self.condition:encode()
		local var452, var453 = protoModule.writeTag(buff, var450, 1, protoModule.wireTypes.lengthDelimited)
		var452, var453 = protoModule.writeBuffer(var452, var453, var451, buffer.len(var451))
		buff = var452
		var450 = var453
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var454, var455 = protoModule.writeTag(buff, var450, 2, protoModule.wireTypes.i32)
			var454, var455 = protoModule.writeFloat(var454, var455, self.kind.value)
			buff = var454
			var450 = var455
		elseif self.kind.type == "binding_path" then
			local var456, var457 = protoModule.writeTag(buff, var450, 3, protoModule.wireTypes.lengthDelimited)
			var456, var457 = protoModule.writeString(var456, var457, self.kind.value)
			buff = var456
			var450 = var457
		elseif self.kind.type == "token" then
			local var458, var459 = protoModule.writeTag(buff, var450, 4, protoModule.wireTypes.lengthDelimited)
			var458, var459 = protoModule.writeString(var458, var459, self.kind.value)
			buff = var458
			var450 = var459
		end
	end
	local buff_1 = buffer.create(var450)
	buffer.copy(buff_1, 0, buff, 0, var450)
	
	return buff_1
end

function t_11.decode(p24) --[[ line: 4466 ]]
	-- upvalues: t_11 (ref), protoModule (ref), propConditionModule (ref)
	local var461 = t_11.new()
	local var462 = 0
	while var462 < buffer.len(p24) do
		local _ = nil
		local var463 = nil
		local var464, var465, var466 = protoModule.readTag(p24, var462)
		local var467 = var464
		var463 = var465
		var462 = var466
		
		if var463 == protoModule.wireTypes.varint then
			local _ = nil
			local var468, var469 = protoModule.readVarInt(p24, var462)
			local _ = var468
			var462 = var469
			continue
		end
		if var463 == protoModule.wireTypes.lengthDelimited then
			if var467 == 1 then
				local _ = nil
				local var470, var471 = protoModule.readBuffer(p24, var462)
				var462 = var471
				var461.condition = propConditionModule.PropCondition.decode(var470)
			elseif var467 == 3 then
				local _ = nil
				local var472, var473 = protoModule.readBuffer(p24, var462)
				var462 = var473
				var461.kind = { type = "binding_path", value = buffer.tostring(var472) }
			elseif var467 == 4 then
				local _ = nil
				local var474, var475 = protoModule.readBuffer(p24, var462)
				var462 = var475
				var461.kind = { type = "token", value = buffer.tostring(var474) }
			else
				local _ = nil
				local var476, var477 = protoModule.readVarInt(p24, var462)
				var462 = var477 + var476
			end
		elseif var463 == protoModule.wireTypes.i32 then
			if var467 == 2 then
				local _ = nil
				local var478, var479 = protoModule.readFloat(p24, var462)
				var462 = var479
				var461.kind = { type = "literal", value = var478 }
			else
				local _ = nil
				local var480, var481 = protoModule.readFixed32(p24, var462)
				local _ = var480
				var462 = var481
			end
		elseif var463 == protoModule.wireTypes.i64 then
			local _ = nil
			local var482, var483 = protoModule.readFixed64(p24, var462)
			local _ = var482
			var462 = var483
		else
			error("Unsupported wire type: " .. var463)
		end
	end
	return var461
end

function t_11:jsonEncode() --[[ line: 4524 ]]
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

function t_11:jsonDecode() --[[ line: 4544 ]]
	-- upvalues: t_11 (ref), propConditionModule (ref), protoModule (ref)
	local var485 = t_11.new()
	
	if self.condition ~= nil then
		var485.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var485.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var485.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var485.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var485.kind = { type = "token", value = self.token }
	end
	return var485
end

t_11.descriptor = {
	name = "FloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FloatProp_ConditionalOption = t_11
typeRegistryModule.default:register(t.FloatProp_ConditionalOption)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p25) --[[ line: 4585 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		options = if p25 == nil or p25.options == nil then {} else p25.options
	}, t_12)
end

function t_12:encode() --[[ line: 4593 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var487 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var488 = v:encode()
			local var489, var490 = protoModule.writeTag(buff, var487, 1, protoModule.wireTypes.lengthDelimited)
			var489, var490 = protoModule.writeBuffer(var489, var490, var488, buffer.len(var488))
			buff = var489
			var487 = var490
		end
	end
	local buff_1 = buffer.create(var487)
	buffer.copy(buff_1, 0, buff, 0, var487)
	
	return buff_1
end

function t_12.decode(p26) --[[ line: 4610 ]]
	-- upvalues: t_12 (ref), protoModule (ref), t (ref)
	local var492 = t_12.new()
	local var493 = 0
	while var493 < buffer.len(p26) do
		local _ = nil
		local var494 = nil
		local var495, var496, var497 = protoModule.readTag(p26, var493)
		local var498 = var495
		var494 = var496
		var493 = var497
		
		if var494 == protoModule.wireTypes.varint then
			local _ = nil
			local var499, var500 = protoModule.readVarInt(p26, var493)
			local _ = var499
			var493 = var500
			continue
		end
		if var494 == protoModule.wireTypes.lengthDelimited then
			if var498 == 1 then
				local _ = nil
				local var501, var502 = protoModule.readBuffer(p26, var493)
				var493 = var502
				table.insert(var492.options, t.FloatProp_ConditionalOption.decode(var501))
			else
				local _ = nil
				local var503, var504 = protoModule.readVarInt(p26, var493)
				var493 = var504 + var503
			end
		elseif var494 == protoModule.wireTypes.i32 then
			local _ = nil
			local var505, var506 = protoModule.readFixed32(p26, var493)
			local _ = var505
			var493 = var506
		elseif var494 == protoModule.wireTypes.i64 then
			local _ = nil
			local var507, var508 = protoModule.readFixed64(p26, var493)
			local _ = var507
			var493 = var508
		else
			error("Unsupported wire type: " .. var494)
		end
	end
	return var492
end

function t_12:jsonEncode() --[[ line: 4653 ]]
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

function t_12:jsonDecode() --[[ line: 4667 ]]
	-- upvalues: t_12 (ref), t (ref)
	local var511 = t_12.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FloatProp_ConditionalOption.jsonDecode(v))
		end
		var511.options = t_1
	end
	return var511
end

t_12.descriptor = {
	name = "FloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FloatProp_ConditionalOptions = t_12
typeRegistryModule.default:register(t.FloatProp_ConditionalOptions)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p27) --[[ line: 4696 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p27 == nil or p27.kind == nil then nil else p27.kind
	}, t_13)
end

function t_13:encode() --[[ line: 4702 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var514 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var515, var516 = protoModule.writeTag(buff, var514, 1, protoModule.wireTypes.i64)
			var515, var516 = protoModule.writeDouble(var515, var516, self.kind.value)
			buff = var515
			var514 = var516
		elseif self.kind.type == "binding_path" then
			local var517, var518 = protoModule.writeTag(buff, var514, 2, protoModule.wireTypes.lengthDelimited)
			var517, var518 = protoModule.writeString(var517, var518, self.kind.value)
			buff = var517
			var514 = var518
		elseif self.kind.type == "token" then
			local var519, var520 = protoModule.writeTag(buff, var514, 3, protoModule.wireTypes.lengthDelimited)
			var519, var520 = protoModule.writeString(var519, var520, self.kind.value)
			buff = var519
			var514 = var520
		elseif self.kind.type == "conditional" then
			local var521 = self.kind.value:encode()
			local var522, var523 = protoModule.writeTag(buff, var514, 4, protoModule.wireTypes.lengthDelimited)
			var522, var523 = protoModule.writeBuffer(var522, var523, var521, buffer.len(var521))
			buff = var522
			var514 = var523
		end
	end
	local buff_1 = buffer.create(var514)
	buffer.copy(buff_1, 0, buff, 0, var514)
	
	return buff_1
end

function t_13.decode(p28) --[[ line: 4728 ]]
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var525 = t_13.new()
	local var526 = 0
	while var526 < buffer.len(p28) do
		local _ = nil
		local var527 = nil
		local var528, var529, var530 = protoModule.readTag(p28, var526)
		local var531 = var528
		var527 = var529
		var526 = var530
		
		if var527 == protoModule.wireTypes.varint then
			local _ = nil
			local var532, var533 = protoModule.readVarInt(p28, var526)
			local _ = var532
			var526 = var533
			continue
		end
		if var527 == protoModule.wireTypes.lengthDelimited then
			if var531 == 2 then
				local _ = nil
				local var534, var535 = protoModule.readBuffer(p28, var526)
				var526 = var535
				var525.kind = { type = "binding_path", value = buffer.tostring(var534) }
			elseif var531 == 3 then
				local _ = nil
				local var536, var537 = protoModule.readBuffer(p28, var526)
				var526 = var537
				var525.kind = { type = "token", value = buffer.tostring(var536) }
			elseif var531 == 4 then
				local _ = nil
				local var538, var539 = protoModule.readBuffer(p28, var526)
				var526 = var539
				var525.kind = {
					type = "conditional",
					value = t.DoubleProp_ConditionalOptions.decode(var538)
				}
			else
				local _ = nil
				local var540, var541 = protoModule.readVarInt(p28, var526)
				var526 = var541 + var540
			end
		elseif var527 == protoModule.wireTypes.i32 then
			local _ = nil
			local var542, var543 = protoModule.readFixed32(p28, var526)
			local _ = var542
			var526 = var543
		elseif var527 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var527)
		elseif var531 == 1 then
			local _ = nil
			local var544, var545 = protoModule.readDouble(p28, var526)
			var526 = var545
			var525.kind = { type = "literal", value = var544 }
		else
			local _ = nil
			local var546, var547 = protoModule.readFixed64(p28, var526)
			local _ = var546
			var526 = var547
		end
	end
	return var525
end

function t_13:jsonEncode() --[[ line: 4786 ]]
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

function t_13:jsonDecode() --[[ line: 4804 ]]
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var549 = t_13.new()
	
	if self.literal ~= nil then
		var549.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var549.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var549.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var549.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var549.kind = {
			type = "conditional",
			value = t.DoubleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var549
end

t_13.descriptor = {
	name = "DoubleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
}
t.DoubleProp = t_13
typeRegistryModule.default:register(t.DoubleProp)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p29) --[[ line: 4845 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		condition = if p29 == nil or p29.condition == nil then nil else p29.condition,
		kind = if p29 == nil or p29.kind == nil then nil else p29.kind
	}, t_14)
end

function t_14:encode() --[[ line: 4854 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var551 = 0
	
	if self.condition ~= nil then
		local var552 = self.condition:encode()
		local var553, var554 = protoModule.writeTag(buff, var551, 1, protoModule.wireTypes.lengthDelimited)
		var553, var554 = protoModule.writeBuffer(var553, var554, var552, buffer.len(var552))
		buff = var553
		var551 = var554
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var555, var556 = protoModule.writeTag(buff, var551, 2, protoModule.wireTypes.i64)
			var555, var556 = protoModule.writeDouble(var555, var556, self.kind.value)
			buff = var555
			var551 = var556
		elseif self.kind.type == "binding_path" then
			local var557, var558 = protoModule.writeTag(buff, var551, 3, protoModule.wireTypes.lengthDelimited)
			var557, var558 = protoModule.writeString(var557, var558, self.kind.value)
			buff = var557
			var551 = var558
		elseif self.kind.type == "token" then
			local var559, var560 = protoModule.writeTag(buff, var551, 4, protoModule.wireTypes.lengthDelimited)
			var559, var560 = protoModule.writeString(var559, var560, self.kind.value)
			buff = var559
			var551 = var560
		end
	end
	local buff_1 = buffer.create(var551)
	buffer.copy(buff_1, 0, buff, 0, var551)
	
	return buff_1
end

function t_14.decode(p30) --[[ line: 4882 ]]
	-- upvalues: t_14 (ref), protoModule (ref), propConditionModule (ref)
	local var562 = t_14.new()
	local var563 = 0
	while var563 < buffer.len(p30) do
		local _ = nil
		local var564 = nil
		local var565, var566, var567 = protoModule.readTag(p30, var563)
		local var568 = var565
		var564 = var566
		var563 = var567
		
		if var564 == protoModule.wireTypes.varint then
			local _ = nil
			local var569, var570 = protoModule.readVarInt(p30, var563)
			local _ = var569
			var563 = var570
			continue
		end
		if var564 == protoModule.wireTypes.lengthDelimited then
			if var568 == 1 then
				local _ = nil
				local var571, var572 = protoModule.readBuffer(p30, var563)
				var563 = var572
				var562.condition = propConditionModule.PropCondition.decode(var571)
			elseif var568 == 3 then
				local _ = nil
				local var573, var574 = protoModule.readBuffer(p30, var563)
				var563 = var574
				var562.kind = { type = "binding_path", value = buffer.tostring(var573) }
			elseif var568 == 4 then
				local _ = nil
				local var575, var576 = protoModule.readBuffer(p30, var563)
				var563 = var576
				var562.kind = { type = "token", value = buffer.tostring(var575) }
			else
				local _ = nil
				local var577, var578 = protoModule.readVarInt(p30, var563)
				var563 = var578 + var577
			end
		elseif var564 == protoModule.wireTypes.i32 then
			local _ = nil
			local var579, var580 = protoModule.readFixed32(p30, var563)
			local _ = var579
			var563 = var580
		elseif var564 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var564)
		elseif var568 == 2 then
			local _ = nil
			local var581, var582 = protoModule.readDouble(p30, var563)
			var563 = var582
			var562.kind = { type = "literal", value = var581 }
		else
			local _ = nil
			local var583, var584 = protoModule.readFixed64(p30, var563)
			local _ = var583
			var563 = var584
		end
	end
	return var562
end

function t_14:jsonEncode() --[[ line: 4940 ]]
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

function t_14:jsonDecode() --[[ line: 4960 ]]
	-- upvalues: t_14 (ref), propConditionModule (ref), protoModule (ref)
	local var586 = t_14.new()
	
	if self.condition ~= nil then
		var586.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var586.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var586.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var586.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var586.kind = { type = "token", value = self.token }
	end
	return var586
end

t_14.descriptor = {
	name = "DoubleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.DoubleProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.DoubleProp_ConditionalOption)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p31) --[[ line: 5001 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		options = if p31 == nil or p31.options == nil then {} else p31.options
	}, t_15)
end

function t_15:encode() --[[ line: 5009 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var588 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var589 = v:encode()
			local var590, var591 = protoModule.writeTag(buff, var588, 1, protoModule.wireTypes.lengthDelimited)
			var590, var591 = protoModule.writeBuffer(var590, var591, var589, buffer.len(var589))
			buff = var590
			var588 = var591
		end
	end
	local buff_1 = buffer.create(var588)
	buffer.copy(buff_1, 0, buff, 0, var588)
	
	return buff_1
end

function t_15.decode(p32) --[[ line: 5026 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var593 = t_15.new()
	local var594 = 0
	while var594 < buffer.len(p32) do
		local _ = nil
		local var595 = nil
		local var596, var597, var598 = protoModule.readTag(p32, var594)
		local var599 = var596
		var595 = var597
		var594 = var598
		
		if var595 == protoModule.wireTypes.varint then
			local _ = nil
			local var600, var601 = protoModule.readVarInt(p32, var594)
			local _ = var600
			var594 = var601
			continue
		end
		if var595 == protoModule.wireTypes.lengthDelimited then
			if var599 == 1 then
				local _ = nil
				local var602, var603 = protoModule.readBuffer(p32, var594)
				var594 = var603
				table.insert(var593.options, t.DoubleProp_ConditionalOption.decode(var602))
			else
				local _ = nil
				local var604, var605 = protoModule.readVarInt(p32, var594)
				var594 = var605 + var604
			end
		elseif var595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var606, var607 = protoModule.readFixed32(p32, var594)
			local _ = var606
			var594 = var607
		elseif var595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var608, var609 = protoModule.readFixed64(p32, var594)
			local _ = var608
			var594 = var609
		else
			error("Unsupported wire type: " .. var595)
		end
	end
	return var593
end

function t_15:jsonEncode() --[[ line: 5069 ]]
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

function t_15:jsonDecode() --[[ line: 5083 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var612 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.DoubleProp_ConditionalOption.jsonDecode(v))
		end
		var612.options = t_1
	end
	return var612
end

t_15.descriptor = {
	name = "DoubleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.DoubleProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.DoubleProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p33) --[[ line: 5112 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		kind = if p33 == nil or p33.kind == nil then nil else p33.kind
	}, t_16)
end

function t_16:encode() --[[ line: 5118 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var615 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var616, var617 = protoModule.writeTag(buff, var615, 1, protoModule.wireTypes.varint)
			var616, var617 = protoModule.writeVarInt(var616, var617, self.kind.value)
			buff = var616
			var615 = var617
		elseif self.kind.type == "binding_path" then
			local var618, var619 = protoModule.writeTag(buff, var615, 2, protoModule.wireTypes.lengthDelimited)
			var618, var619 = protoModule.writeString(var618, var619, self.kind.value)
			buff = var618
			var615 = var619
		elseif self.kind.type == "token" then
			local var620, var621 = protoModule.writeTag(buff, var615, 3, protoModule.wireTypes.lengthDelimited)
			var620, var621 = protoModule.writeString(var620, var621, self.kind.value)
			buff = var620
			var615 = var621
		elseif self.kind.type == "conditional" then
			local var622 = self.kind.value:encode()
			local var623, var624 = protoModule.writeTag(buff, var615, 4, protoModule.wireTypes.lengthDelimited)
			var623, var624 = protoModule.writeBuffer(var623, var624, var622, buffer.len(var622))
			buff = var623
			var615 = var624
		end
	end
	local buff_1 = buffer.create(var615)
	buffer.copy(buff_1, 0, buff, 0, var615)
	
	return buff_1
end

function t_16.decode(p34) --[[ line: 5144 ]]
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var626 = t_16.new()
	local var627 = 0
	while var627 < buffer.len(p34) do
		local _ = nil
		local var628 = nil
		local var629, var630, var631 = protoModule.readTag(p34, var627)
		local var632 = var629
		var628 = var630
		var627 = var631
		
		if var628 == protoModule.wireTypes.varint then
			if var632 == 1 then
				local _ = nil
				local var633, var634 = protoModule.readVarIntI32(p34, var627)
				var627 = var634
				var626.kind = { type = "literal", value = var633 }
			else
				local _ = nil
				local var635, var636 = protoModule.readVarInt(p34, var627)
				local _ = var635
				var627 = var636
			end
		end
		if var628 == protoModule.wireTypes.lengthDelimited then
			if var632 == 2 then
				local _ = nil
				local var637, var638 = protoModule.readBuffer(p34, var627)
				var627 = var638
				var626.kind = { type = "binding_path", value = buffer.tostring(var637) }
			elseif var632 == 3 then
				local _ = nil
				local var639, var640 = protoModule.readBuffer(p34, var627)
				var627 = var640
				var626.kind = { type = "token", value = buffer.tostring(var639) }
			elseif var632 == 4 then
				local _ = nil
				local var641, var642 = protoModule.readBuffer(p34, var627)
				var627 = var642
				var626.kind = {
					type = "conditional",
					value = t.Int32Prop_ConditionalOptions.decode(var641)
				}
			else
				local _ = nil
				local var643, var644 = protoModule.readVarInt(p34, var627)
				var627 = var644 + var643
			end
		elseif var628 == protoModule.wireTypes.i32 then
			local _ = nil
			local var645, var646 = protoModule.readFixed32(p34, var627)
			local _ = var645
			var627 = var646
		elseif var628 == protoModule.wireTypes.i64 then
			local _ = nil
			local var647, var648 = protoModule.readFixed64(p34, var627)
			local _ = var647
			var627 = var648
		else
			error("Unsupported wire type: " .. var628)
		end
	end
	return var626
end

function t_16:jsonEncode() --[[ line: 5202 ]]
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

function t_16:jsonDecode() --[[ line: 5220 ]]
	-- upvalues: t_16 (ref), t (ref)
	local var650 = t_16.new()
	
	if self.literal ~= nil then
		var650.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var650.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var650.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var650.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var650.kind = {
			type = "conditional",
			value = t.Int32Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var650
end

t_16.descriptor = {
	name = "Int32Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
}
t.Int32Prop = t_16
typeRegistryModule.default:register(t.Int32Prop)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p35) --[[ line: 5261 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		condition = if p35 == nil or p35.condition == nil then nil else p35.condition,
		kind = if p35 == nil or p35.kind == nil then nil else p35.kind
	}, t_17)
end

function t_17:encode() --[[ line: 5270 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var652 = 0
	
	if self.condition ~= nil then
		local var653 = self.condition:encode()
		local var654, var655 = protoModule.writeTag(buff, var652, 1, protoModule.wireTypes.lengthDelimited)
		var654, var655 = protoModule.writeBuffer(var654, var655, var653, buffer.len(var653))
		buff = var654
		var652 = var655
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var656, var657 = protoModule.writeTag(buff, var652, 2, protoModule.wireTypes.varint)
			var656, var657 = protoModule.writeVarInt(var656, var657, self.kind.value)
			buff = var656
			var652 = var657
		elseif self.kind.type == "binding_path" then
			local var658, var659 = protoModule.writeTag(buff, var652, 3, protoModule.wireTypes.lengthDelimited)
			var658, var659 = protoModule.writeString(var658, var659, self.kind.value)
			buff = var658
			var652 = var659
		elseif self.kind.type == "token" then
			local var660, var661 = protoModule.writeTag(buff, var652, 4, protoModule.wireTypes.lengthDelimited)
			var660, var661 = protoModule.writeString(var660, var661, self.kind.value)
			buff = var660
			var652 = var661
		end
	end
	local buff_1 = buffer.create(var652)
	buffer.copy(buff_1, 0, buff, 0, var652)
	
	return buff_1
end

function t_17.decode(p36) --[[ line: 5298 ]]
	-- upvalues: t_17 (ref), protoModule (ref), propConditionModule (ref)
	local var663 = t_17.new()
	local var664 = 0
	while var664 < buffer.len(p36) do
		local _ = nil
		local var665 = nil
		local var666, var667, var668 = protoModule.readTag(p36, var664)
		local var669 = var666
		var665 = var667
		var664 = var668
		
		if var665 == protoModule.wireTypes.varint then
			if var669 == 2 then
				local _ = nil
				local var670, var671 = protoModule.readVarIntI32(p36, var664)
				var664 = var671
				var663.kind = { type = "literal", value = var670 }
			else
				local _ = nil
				local var672, var673 = protoModule.readVarInt(p36, var664)
				local _ = var672
				var664 = var673
			end
		end
		if var665 == protoModule.wireTypes.lengthDelimited then
			if var669 == 1 then
				local _ = nil
				local var674, var675 = protoModule.readBuffer(p36, var664)
				var664 = var675
				var663.condition = propConditionModule.PropCondition.decode(var674)
			elseif var669 == 3 then
				local _ = nil
				local var676, var677 = protoModule.readBuffer(p36, var664)
				var664 = var677
				var663.kind = { type = "binding_path", value = buffer.tostring(var676) }
			elseif var669 == 4 then
				local _ = nil
				local var678, var679 = protoModule.readBuffer(p36, var664)
				var664 = var679
				var663.kind = { type = "token", value = buffer.tostring(var678) }
			else
				local _ = nil
				local var680, var681 = protoModule.readVarInt(p36, var664)
				var664 = var681 + var680
			end
		elseif var665 == protoModule.wireTypes.i32 then
			local _ = nil
			local var682, var683 = protoModule.readFixed32(p36, var664)
			local _ = var682
			var664 = var683
		elseif var665 == protoModule.wireTypes.i64 then
			local _ = nil
			local var684, var685 = protoModule.readFixed64(p36, var664)
			local _ = var684
			var664 = var685
		else
			error("Unsupported wire type: " .. var665)
		end
	end
	return var663
end

function t_17:jsonEncode() --[[ line: 5356 ]]
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

function t_17:jsonDecode() --[[ line: 5376 ]]
	-- upvalues: t_17 (ref), propConditionModule (ref)
	local var687 = t_17.new()
	
	if self.condition ~= nil then
		var687.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var687.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var687.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var687.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var687.kind = { type = "token", value = self.token }
	end
	return var687
end

t_17.descriptor = {
	name = "Int32Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int32Prop_ConditionalOption = t_17
typeRegistryModule.default:register(t.Int32Prop_ConditionalOption)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p37) --[[ line: 5417 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		options = if p37 == nil or p37.options == nil then {} else p37.options
	}, t_18)
end

function t_18:encode() --[[ line: 5425 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var689 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var690 = v:encode()
			local var691, var692 = protoModule.writeTag(buff, var689, 1, protoModule.wireTypes.lengthDelimited)
			var691, var692 = protoModule.writeBuffer(var691, var692, var690, buffer.len(var690))
			buff = var691
			var689 = var692
		end
	end
	local buff_1 = buffer.create(var689)
	buffer.copy(buff_1, 0, buff, 0, var689)
	
	return buff_1
end

function t_18.decode(p38) --[[ line: 5442 ]]
	-- upvalues: t_18 (ref), protoModule (ref), t (ref)
	local var694 = t_18.new()
	local var695 = 0
	while var695 < buffer.len(p38) do
		local _ = nil
		local var696 = nil
		local var697, var698, var699 = protoModule.readTag(p38, var695)
		local var700 = var697
		var696 = var698
		var695 = var699
		
		if var696 == protoModule.wireTypes.varint then
			local _ = nil
			local var701, var702 = protoModule.readVarInt(p38, var695)
			local _ = var701
			var695 = var702
			continue
		end
		if var696 == protoModule.wireTypes.lengthDelimited then
			if var700 == 1 then
				local _ = nil
				local var703, var704 = protoModule.readBuffer(p38, var695)
				var695 = var704
				table.insert(var694.options, t.Int32Prop_ConditionalOption.decode(var703))
			else
				local _ = nil
				local var705, var706 = protoModule.readVarInt(p38, var695)
				var695 = var706 + var705
			end
		elseif var696 == protoModule.wireTypes.i32 then
			local _ = nil
			local var707, var708 = protoModule.readFixed32(p38, var695)
			local _ = var707
			var695 = var708
		elseif var696 == protoModule.wireTypes.i64 then
			local _ = nil
			local var709, var710 = protoModule.readFixed64(p38, var695)
			local _ = var709
			var695 = var710
		else
			error("Unsupported wire type: " .. var696)
		end
	end
	return var694
end

function t_18:jsonEncode() --[[ line: 5485 ]]
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

function t_18:jsonDecode() --[[ line: 5499 ]]
	-- upvalues: t_18 (ref), t (ref)
	local var713 = t_18.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int32Prop_ConditionalOption.jsonDecode(v))
		end
		var713.options = t_1
	end
	return var713
end

t_18.descriptor = {
	name = "Int32Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int32Prop_ConditionalOptions = t_18
typeRegistryModule.default:register(t.Int32Prop_ConditionalOptions)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p39) --[[ line: 5528 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		kind = if p39 == nil or p39.kind == nil then nil else p39.kind
	}, t_19)
end

function t_19:encode() --[[ line: 5534 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var716 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var717, var718 = protoModule.writeTag(buff, var716, 1, protoModule.wireTypes.varint)
			var717, var718 = protoModule.writeVarInt(var717, var718, self.kind.value)
			buff = var717
			var716 = var718
		elseif self.kind.type == "binding_path" then
			local var719, var720 = protoModule.writeTag(buff, var716, 2, protoModule.wireTypes.lengthDelimited)
			var719, var720 = protoModule.writeString(var719, var720, self.kind.value)
			buff = var719
			var716 = var720
		elseif self.kind.type == "token" then
			local var721, var722 = protoModule.writeTag(buff, var716, 3, protoModule.wireTypes.lengthDelimited)
			var721, var722 = protoModule.writeString(var721, var722, self.kind.value)
			buff = var721
			var716 = var722
		elseif self.kind.type == "conditional" then
			local var723 = self.kind.value:encode()
			local var724, var725 = protoModule.writeTag(buff, var716, 4, protoModule.wireTypes.lengthDelimited)
			var724, var725 = protoModule.writeBuffer(var724, var725, var723, buffer.len(var723))
			buff = var724
			var716 = var725
		end
	end
	local buff_1 = buffer.create(var716)
	buffer.copy(buff_1, 0, buff, 0, var716)
	
	return buff_1
end

function t_19.decode(p40) --[[ line: 5560 ]]
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var727 = t_19.new()
	local var728 = 0
	while var728 < buffer.len(p40) do
		local _ = nil
		local var729 = nil
		local var730, var731, var732 = protoModule.readTag(p40, var728)
		local var733 = var730
		var729 = var731
		var728 = var732
		
		if var729 == protoModule.wireTypes.varint then
			if var733 == 1 then
				local _ = nil
				local var734, var735 = protoModule.readVarIntI64(p40, var728)
				var728 = var735
				var727.kind = { type = "literal", value = var734 }
			else
				local _ = nil
				local var736, var737 = protoModule.readVarInt(p40, var728)
				local _ = var736
				var728 = var737
			end
		end
		if var729 == protoModule.wireTypes.lengthDelimited then
			if var733 == 2 then
				local _ = nil
				local var738, var739 = protoModule.readBuffer(p40, var728)
				var728 = var739
				var727.kind = { type = "binding_path", value = buffer.tostring(var738) }
			elseif var733 == 3 then
				local _ = nil
				local var740, var741 = protoModule.readBuffer(p40, var728)
				var728 = var741
				var727.kind = { type = "token", value = buffer.tostring(var740) }
			elseif var733 == 4 then
				local _ = nil
				local var742, var743 = protoModule.readBuffer(p40, var728)
				var728 = var743
				var727.kind = {
					type = "conditional",
					value = t.Int64Prop_ConditionalOptions.decode(var742)
				}
			else
				local _ = nil
				local var744, var745 = protoModule.readVarInt(p40, var728)
				var728 = var745 + var744
			end
		elseif var729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var746, var747 = protoModule.readFixed32(p40, var728)
			local _ = var746
			var728 = var747
		elseif var729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var748, var749 = protoModule.readFixed64(p40, var728)
			local _ = var748
			var728 = var749
		else
			error("Unsupported wire type: " .. var729)
		end
	end
	return var727
end

function t_19:jsonEncode() --[[ line: 5618 ]]
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

function t_19:jsonDecode() --[[ line: 5636 ]]
	-- upvalues: t_19 (ref), t (ref)
	local var751 = t_19.new()
	
	if self.literal ~= nil then
		var751.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var751.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var751.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var751.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var751.kind = {
			type = "conditional",
			value = t.Int64Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var751
end

t_19.descriptor = {
	name = "Int64Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
}
t.Int64Prop = t_19
typeRegistryModule.default:register(t.Int64Prop)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p41) --[[ line: 5677 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		condition = if p41 == nil or p41.condition == nil then nil else p41.condition,
		kind = if p41 == nil or p41.kind == nil then nil else p41.kind
	}, t_20)
end

function t_20:encode() --[[ line: 5686 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var753 = 0
	
	if self.condition ~= nil then
		local var754 = self.condition:encode()
		local var755, var756 = protoModule.writeTag(buff, var753, 1, protoModule.wireTypes.lengthDelimited)
		var755, var756 = protoModule.writeBuffer(var755, var756, var754, buffer.len(var754))
		buff = var755
		var753 = var756
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var757, var758 = protoModule.writeTag(buff, var753, 2, protoModule.wireTypes.varint)
			var757, var758 = protoModule.writeVarInt(var757, var758, self.kind.value)
			buff = var757
			var753 = var758
		elseif self.kind.type == "binding_path" then
			local var759, var760 = protoModule.writeTag(buff, var753, 3, protoModule.wireTypes.lengthDelimited)
			var759, var760 = protoModule.writeString(var759, var760, self.kind.value)
			buff = var759
			var753 = var760
		elseif self.kind.type == "token" then
			local var761, var762 = protoModule.writeTag(buff, var753, 4, protoModule.wireTypes.lengthDelimited)
			var761, var762 = protoModule.writeString(var761, var762, self.kind.value)
			buff = var761
			var753 = var762
		end
	end
	local buff_1 = buffer.create(var753)
	buffer.copy(buff_1, 0, buff, 0, var753)
	
	return buff_1
end

function t_20.decode(p42) --[[ line: 5714 ]]
	-- upvalues: t_20 (ref), protoModule (ref), propConditionModule (ref)
	local var764 = t_20.new()
	local var765 = 0
	while var765 < buffer.len(p42) do
		local _ = nil
		local var766 = nil
		local var767, var768, var769 = protoModule.readTag(p42, var765)
		local var770 = var767
		var766 = var768
		var765 = var769
		
		if var766 == protoModule.wireTypes.varint then
			if var770 == 2 then
				local _ = nil
				local var771, var772 = protoModule.readVarIntI64(p42, var765)
				var765 = var772
				var764.kind = { type = "literal", value = var771 }
			else
				local _ = nil
				local var773, var774 = protoModule.readVarInt(p42, var765)
				local _ = var773
				var765 = var774
			end
		end
		if var766 == protoModule.wireTypes.lengthDelimited then
			if var770 == 1 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p42, var765)
				var765 = var776
				var764.condition = propConditionModule.PropCondition.decode(var775)
			elseif var770 == 3 then
				local _ = nil
				local var777, var778 = protoModule.readBuffer(p42, var765)
				var765 = var778
				var764.kind = { type = "binding_path", value = buffer.tostring(var777) }
			elseif var770 == 4 then
				local _ = nil
				local var779, var780 = protoModule.readBuffer(p42, var765)
				var765 = var780
				var764.kind = { type = "token", value = buffer.tostring(var779) }
			else
				local _ = nil
				local var781, var782 = protoModule.readVarInt(p42, var765)
				var765 = var782 + var781
			end
		elseif var766 == protoModule.wireTypes.i32 then
			local _ = nil
			local var783, var784 = protoModule.readFixed32(p42, var765)
			local _ = var783
			var765 = var784
		elseif var766 == protoModule.wireTypes.i64 then
			local _ = nil
			local var785, var786 = protoModule.readFixed64(p42, var765)
			local _ = var785
			var765 = var786
		else
			error("Unsupported wire type: " .. var766)
		end
	end
	return var764
end

function t_20:jsonEncode() --[[ line: 5772 ]]
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

function t_20:jsonDecode() --[[ line: 5792 ]]
	-- upvalues: t_20 (ref), propConditionModule (ref)
	local var788 = t_20.new()
	
	if self.condition ~= nil then
		var788.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var788.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var788.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var788.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var788.kind = { type = "token", value = self.token }
	end
	return var788
end

t_20.descriptor = {
	name = "Int64Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int64Prop_ConditionalOption = t_20
typeRegistryModule.default:register(t.Int64Prop_ConditionalOption)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p43) --[[ line: 5833 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		options = if p43 == nil or p43.options == nil then {} else p43.options
	}, t_21)
end

function t_21:encode() --[[ line: 5841 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var790 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var791 = v:encode()
			local var792, var793 = protoModule.writeTag(buff, var790, 1, protoModule.wireTypes.lengthDelimited)
			var792, var793 = protoModule.writeBuffer(var792, var793, var791, buffer.len(var791))
			buff = var792
			var790 = var793
		end
	end
	local buff_1 = buffer.create(var790)
	buffer.copy(buff_1, 0, buff, 0, var790)
	
	return buff_1
end

function t_21.decode(p44) --[[ line: 5858 ]]
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var795 = t_21.new()
	local var796 = 0
	while var796 < buffer.len(p44) do
		local _ = nil
		local var797 = nil
		local var798, var799, var800 = protoModule.readTag(p44, var796)
		local var801 = var798
		var797 = var799
		var796 = var800
		
		if var797 == protoModule.wireTypes.varint then
			local _ = nil
			local var802, var803 = protoModule.readVarInt(p44, var796)
			local _ = var802
			var796 = var803
			continue
		end
		if var797 == protoModule.wireTypes.lengthDelimited then
			if var801 == 1 then
				local _ = nil
				local var804, var805 = protoModule.readBuffer(p44, var796)
				var796 = var805
				table.insert(var795.options, t.Int64Prop_ConditionalOption.decode(var804))
			else
				local _ = nil
				local var806, var807 = protoModule.readVarInt(p44, var796)
				var796 = var807 + var806
			end
		elseif var797 == protoModule.wireTypes.i32 then
			local _ = nil
			local var808, var809 = protoModule.readFixed32(p44, var796)
			local _ = var808
			var796 = var809
		elseif var797 == protoModule.wireTypes.i64 then
			local _ = nil
			local var810, var811 = protoModule.readFixed64(p44, var796)
			local _ = var810
			var796 = var811
		else
			error("Unsupported wire type: " .. var797)
		end
	end
	return var795
end

function t_21:jsonEncode() --[[ line: 5901 ]]
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

function t_21:jsonDecode() --[[ line: 5915 ]]
	-- upvalues: t_21 (ref), t (ref)
	local var814 = t_21.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int64Prop_ConditionalOption.jsonDecode(v))
		end
		var814.options = t_1
	end
	return var814
end

t_21.descriptor = {
	name = "Int64Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int64Prop_ConditionalOptions = t_21
typeRegistryModule.default:register(t.Int64Prop_ConditionalOptions)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p45) --[[ line: 5944 ]]
	-- upvalues: t_22 (ref)
	return setmetatable({
		kind = if p45 == nil or p45.kind == nil then nil else p45.kind
	}, t_22)
end

function t_22:encode() --[[ line: 5950 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var817 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var818, var819 = protoModule.writeTag(buff, var817, 1, protoModule.wireTypes.varint)
			var818, var819 = protoModule.writeVarInt(var818, var819, if self.kind.value then 1 else 0)
			buff = var818
			var817 = var819
		elseif self.kind.type == "binding_path" then
			local var820, var821 = protoModule.writeTag(buff, var817, 2, protoModule.wireTypes.lengthDelimited)
			var820, var821 = protoModule.writeString(var820, var821, self.kind.value)
			buff = var820
			var817 = var821
		elseif self.kind.type == "conditional" then
			local var822 = self.kind.value:encode()
			local var823, var824 = protoModule.writeTag(buff, var817, 3, protoModule.wireTypes.lengthDelimited)
			var823, var824 = protoModule.writeBuffer(var823, var824, var822, buffer.len(var822))
			buff = var823
			var817 = var824
		end
	end
	local buff_1 = buffer.create(var817)
	buffer.copy(buff_1, 0, buff, 0, var817)
	
	return buff_1
end

function t_22.decode(p46) --[[ line: 5973 ]]
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var826 = t_22.new()
	local var827 = 0
	while var827 < buffer.len(p46) do
		local _ = nil
		local var828 = nil
		local var829, var830, var831 = protoModule.readTag(p46, var827)
		local var832 = var829
		var828 = var830
		var827 = var831
		
		if var828 == protoModule.wireTypes.varint then
			if var832 == 1 then
				local _ = nil
				local var833, var834 = protoModule.readVarInt(p46, var827)
				var827 = var834
				var826.kind = { type = "literal", value = var833 ~= 0 }
			else
				local _ = nil
				local var835, var836 = protoModule.readVarInt(p46, var827)
				local _ = var835
				var827 = var836
			end
		end
		if var828 == protoModule.wireTypes.lengthDelimited then
			if var832 == 2 then
				local _ = nil
				local var837, var838 = protoModule.readBuffer(p46, var827)
				var827 = var838
				var826.kind = { type = "binding_path", value = buffer.tostring(var837) }
			elseif var832 == 3 then
				local _ = nil
				local var839, var840 = protoModule.readBuffer(p46, var827)
				var827 = var840
				var826.kind = {
					type = "conditional",
					value = t.BoolProp_ConditionalOptions.decode(var839)
				}
			else
				local _ = nil
				local var841, var842 = protoModule.readVarInt(p46, var827)
				var827 = var842 + var841
			end
		elseif var828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var843, var844 = protoModule.readFixed32(p46, var827)
			local _ = var843
			var827 = var844
		elseif var828 == protoModule.wireTypes.i64 then
			local _ = nil
			local var845, var846 = protoModule.readFixed64(p46, var827)
			local _ = var845
			var827 = var846
		else
			error("Unsupported wire type: " .. var828)
		end
	end
	return var826
end

function t_22:jsonEncode() --[[ line: 6026 ]]
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

function t_22:jsonDecode() --[[ line: 6042 ]]
	-- upvalues: t_22 (ref), t (ref)
	local var848 = t_22.new()
	
	if self.literal ~= nil then
		var848.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var848.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var848.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var848.kind = {
			type = "conditional",
			value = t.BoolProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var848
end

t_22.descriptor = {
	name = "BoolProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
}
t.BoolProp = t_22
typeRegistryModule.default:register(t.BoolProp)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p47) --[[ line: 6079 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		condition = if p47 == nil or p47.condition == nil then nil else p47.condition,
		kind = if p47 == nil or p47.kind == nil then nil else p47.kind
	}, t_23)
end

function t_23:encode() --[[ line: 6088 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var850 = 0
	
	if self.condition ~= nil then
		local var851 = self.condition:encode()
		local var852, var853 = protoModule.writeTag(buff, var850, 1, protoModule.wireTypes.lengthDelimited)
		var852, var853 = protoModule.writeBuffer(var852, var853, var851, buffer.len(var851))
		buff = var852
		var850 = var853
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var854, var855 = protoModule.writeTag(buff, var850, 2, protoModule.wireTypes.varint)
			var854, var855 = protoModule.writeVarInt(var854, var855, if self.kind.value then 1 else 0)
			buff = var854
			var850 = var855
		elseif self.kind.type == "binding_path" then
			local var856, var857 = protoModule.writeTag(buff, var850, 3, protoModule.wireTypes.lengthDelimited)
			var856, var857 = protoModule.writeString(var856, var857, self.kind.value)
			buff = var856
			var850 = var857
		end
	end
	local buff_1 = buffer.create(var850)
	buffer.copy(buff_1, 0, buff, 0, var850)
	
	return buff_1
end

function t_23.decode(p48) --[[ line: 6113 ]]
	-- upvalues: t_23 (ref), protoModule (ref), propConditionModule (ref)
	local var859 = t_23.new()
	local var860 = 0
	while var860 < buffer.len(p48) do
		local _ = nil
		local var861 = nil
		local var862, var863, var864 = protoModule.readTag(p48, var860)
		local var865 = var862
		var861 = var863
		var860 = var864
		
		if var861 == protoModule.wireTypes.varint then
			if var865 == 2 then
				local _ = nil
				local var866, var867 = protoModule.readVarInt(p48, var860)
				var860 = var867
				var859.kind = { type = "literal", value = var866 ~= 0 }
			else
				local _ = nil
				local var868, var869 = protoModule.readVarInt(p48, var860)
				local _ = var868
				var860 = var869
			end
		end
		if var861 == protoModule.wireTypes.lengthDelimited then
			if var865 == 1 then
				local _ = nil
				local var870, var871 = protoModule.readBuffer(p48, var860)
				var860 = var871
				var859.condition = propConditionModule.PropCondition.decode(var870)
			elseif var865 == 3 then
				local _ = nil
				local var872, var873 = protoModule.readBuffer(p48, var860)
				var860 = var873
				var859.kind = { type = "binding_path", value = buffer.tostring(var872) }
			else
				local _ = nil
				local var874, var875 = protoModule.readVarInt(p48, var860)
				var860 = var875 + var874
			end
		elseif var861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var876, var877 = protoModule.readFixed32(p48, var860)
			local _ = var876
			var860 = var877
		elseif var861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var878, var879 = protoModule.readFixed64(p48, var860)
			local _ = var878
			var860 = var879
		else
			error("Unsupported wire type: " .. var861)
		end
	end
	return var859
end

function t_23:jsonEncode() --[[ line: 6166 ]]
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

function t_23:jsonDecode() --[[ line: 6184 ]]
	-- upvalues: t_23 (ref), propConditionModule (ref)
	local var881 = t_23.new()
	
	if self.condition ~= nil then
		var881.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var881.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var881.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var881.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var881
end

t_23.descriptor = {
	name = "BoolProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.BoolProp_ConditionalOption = t_23
typeRegistryModule.default:register(t.BoolProp_ConditionalOption)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p49) --[[ line: 6221 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		options = if p49 == nil or p49.options == nil then {} else p49.options
	}, t_24)
end

function t_24:encode() --[[ line: 6229 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var883 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var884 = v:encode()
			local var885, var886 = protoModule.writeTag(buff, var883, 1, protoModule.wireTypes.lengthDelimited)
			var885, var886 = protoModule.writeBuffer(var885, var886, var884, buffer.len(var884))
			buff = var885
			var883 = var886
		end
	end
	local buff_1 = buffer.create(var883)
	buffer.copy(buff_1, 0, buff, 0, var883)
	
	return buff_1
end

function t_24.decode(p50) --[[ line: 6246 ]]
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var888 = t_24.new()
	local var889 = 0
	while var889 < buffer.len(p50) do
		local _ = nil
		local var890 = nil
		local var891, var892, var893 = protoModule.readTag(p50, var889)
		local var894 = var891
		var890 = var892
		var889 = var893
		
		if var890 == protoModule.wireTypes.varint then
			local _ = nil
			local var895, var896 = protoModule.readVarInt(p50, var889)
			local _ = var895
			var889 = var896
			continue
		end
		if var890 == protoModule.wireTypes.lengthDelimited then
			if var894 == 1 then
				local _ = nil
				local var897, var898 = protoModule.readBuffer(p50, var889)
				var889 = var898
				table.insert(var888.options, t.BoolProp_ConditionalOption.decode(var897))
			else
				local _ = nil
				local var899, var900 = protoModule.readVarInt(p50, var889)
				var889 = var900 + var899
			end
		elseif var890 == protoModule.wireTypes.i32 then
			local _ = nil
			local var901, var902 = protoModule.readFixed32(p50, var889)
			local _ = var901
			var889 = var902
		elseif var890 == protoModule.wireTypes.i64 then
			local _ = nil
			local var903, var904 = protoModule.readFixed64(p50, var889)
			local _ = var903
			var889 = var904
		else
			error("Unsupported wire type: " .. var890)
		end
	end
	return var888
end

function t_24:jsonEncode() --[[ line: 6289 ]]
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

function t_24:jsonDecode() --[[ line: 6303 ]]
	-- upvalues: t_24 (ref), t (ref)
	local var907 = t_24.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.BoolProp_ConditionalOption.jsonDecode(v))
		end
		var907.options = t_1
	end
	return var907
end

t_24.descriptor = {
	name = "BoolProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.BoolProp_ConditionalOptions = t_24
typeRegistryModule.default:register(t.BoolProp_ConditionalOptions)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p51) --[[ line: 6332 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		kind = if p51 == nil or p51.kind == nil then nil else p51.kind
	}, t_25)
end

function t_25:encode() --[[ line: 6338 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var910 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var911 = self.kind.value:encode()
			local var912, var913 = protoModule.writeTag(buff, var910, 1, protoModule.wireTypes.lengthDelimited)
			var912, var913 = protoModule.writeBuffer(var912, var913, var911, buffer.len(var911))
			buff = var912
			var910 = var913
		elseif self.kind.type == "binding_path" then
			local var914, var915 = protoModule.writeTag(buff, var910, 2, protoModule.wireTypes.lengthDelimited)
			var914, var915 = protoModule.writeString(var914, var915, self.kind.value)
			buff = var914
			var910 = var915
		elseif self.kind.type == "conditional" then
			local var916 = self.kind.value:encode()
			local var917, var918 = protoModule.writeTag(buff, var910, 3, protoModule.wireTypes.lengthDelimited)
			var917, var918 = protoModule.writeBuffer(var917, var918, var916, buffer.len(var916))
			buff = var917
			var910 = var918
		end
	end
	local buff_1 = buffer.create(var910)
	buffer.copy(buff_1, 0, buff, 0, var910)
	
	return buff_1
end

function t_25.decode(p52) --[[ line: 6362 ]]
	-- upvalues: t_25 (ref), protoModule (ref), structModule (ref), t (ref)
	local var920 = t_25.new()
	local var921 = 0
	while var921 < buffer.len(p52) do
		local _ = nil
		local var922 = nil
		local var923, var924, var925 = protoModule.readTag(p52, var921)
		local var926 = var923
		var922 = var924
		var921 = var925
		
		if var922 == protoModule.wireTypes.varint then
			local _ = nil
			local var927, var928 = protoModule.readVarInt(p52, var921)
			local _ = var927
			var921 = var928
			continue
		end
		if var922 == protoModule.wireTypes.lengthDelimited then
			if var926 == 1 then
				local _ = nil
				local var929, var930 = protoModule.readBuffer(p52, var921)
				var921 = var930
				var920.kind = {
					type = "literal",
					value = structModule.Struct.decode(var929)
				}
			elseif var926 == 2 then
				local _ = nil
				local var931, var932 = protoModule.readBuffer(p52, var921)
				var921 = var932
				var920.kind = { type = "binding_path", value = buffer.tostring(var931) }
			elseif var926 == 3 then
				local _ = nil
				local var933, var934 = protoModule.readBuffer(p52, var921)
				var921 = var934
				var920.kind = {
					type = "conditional",
					value = t.StructProp_ConditionalOptions.decode(var933)
				}
			else
				local _ = nil
				local var935, var936 = protoModule.readVarInt(p52, var921)
				var921 = var936 + var935
			end
		elseif var922 == protoModule.wireTypes.i32 then
			local _ = nil
			local var937, var938 = protoModule.readFixed32(p52, var921)
			local _ = var937
			var921 = var938
		elseif var922 == protoModule.wireTypes.i64 then
			local _ = nil
			local var939, var940 = protoModule.readFixed64(p52, var921)
			local _ = var939
			var921 = var940
		else
			error("Unsupported wire type: " .. var922)
		end
	end
	return var920
end

function t_25:jsonEncode() --[[ line: 6415 ]]
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

function t_25:jsonDecode() --[[ line: 6431 ]]
	-- upvalues: t_25 (ref), structModule (ref), t (ref)
	local var942 = t_25.new()
	
	if self.literal ~= nil then
		var942.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var942.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var942.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var942.kind = {
			type = "conditional",
			value = t.StructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var942
end

t_25.descriptor = {
	name = "StructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
}
t.StructProp = t_25
typeRegistryModule.default:register(t.StructProp)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p53) --[[ line: 6468 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		condition = if p53 == nil or p53.condition == nil then nil else p53.condition,
		kind = if p53 == nil or p53.kind == nil then nil else p53.kind
	}, t_26)
end

function t_26:encode() --[[ line: 6477 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var944 = 0
	
	if self.condition ~= nil then
		local var945 = self.condition:encode()
		local var946, var947 = protoModule.writeTag(buff, var944, 1, protoModule.wireTypes.lengthDelimited)
		var946, var947 = protoModule.writeBuffer(var946, var947, var945, buffer.len(var945))
		buff = var946
		var944 = var947
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var948 = self.kind.value:encode()
			local var949, var950 = protoModule.writeTag(buff, var944, 2, protoModule.wireTypes.lengthDelimited)
			var949, var950 = protoModule.writeBuffer(var949, var950, var948, buffer.len(var948))
			buff = var949
			var944 = var950
		elseif self.kind.type == "binding_path" then
			local var951, var952 = protoModule.writeTag(buff, var944, 3, protoModule.wireTypes.lengthDelimited)
			var951, var952 = protoModule.writeString(var951, var952, self.kind.value)
			buff = var951
			var944 = var952
		end
	end
	local buff_1 = buffer.create(var944)
	buffer.copy(buff_1, 0, buff, 0, var944)
	
	return buff_1
end

function t_26.decode(p54) --[[ line: 6503 ]]
	-- upvalues: t_26 (ref), protoModule (ref), propConditionModule (ref), structModule (ref)
	local var954 = t_26.new()
	local var955 = 0
	while var955 < buffer.len(p54) do
		local _ = nil
		local var956 = nil
		local var957, var958, var959 = protoModule.readTag(p54, var955)
		local var960 = var957
		var956 = var958
		var955 = var959
		
		if var956 == protoModule.wireTypes.varint then
			local _ = nil
			local var961, var962 = protoModule.readVarInt(p54, var955)
			local _ = var961
			var955 = var962
			continue
		end
		if var956 == protoModule.wireTypes.lengthDelimited then
			if var960 == 1 then
				local _ = nil
				local var963, var964 = protoModule.readBuffer(p54, var955)
				var955 = var964
				var954.condition = propConditionModule.PropCondition.decode(var963)
			elseif var960 == 2 then
				local _ = nil
				local var965, var966 = protoModule.readBuffer(p54, var955)
				var955 = var966
				var954.kind = {
					type = "literal",
					value = structModule.Struct.decode(var965)
				}
			elseif var960 == 3 then
				local _ = nil
				local var967, var968 = protoModule.readBuffer(p54, var955)
				var955 = var968
				var954.kind = { type = "binding_path", value = buffer.tostring(var967) }
			else
				local _ = nil
				local var969, var970 = protoModule.readVarInt(p54, var955)
				var955 = var970 + var969
			end
		elseif var956 == protoModule.wireTypes.i32 then
			local _ = nil
			local var971, var972 = protoModule.readFixed32(p54, var955)
			local _ = var971
			var955 = var972
		elseif var956 == protoModule.wireTypes.i64 then
			local _ = nil
			local var973, var974 = protoModule.readFixed64(p54, var955)
			local _ = var973
			var955 = var974
		else
			error("Unsupported wire type: " .. var956)
		end
	end
	return var954
end

function t_26:jsonEncode() --[[ line: 6556 ]]
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

function t_26:jsonDecode() --[[ line: 6574 ]]
	-- upvalues: t_26 (ref), propConditionModule (ref), structModule (ref)
	local var976 = t_26.new()
	
	if self.condition ~= nil then
		var976.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var976.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var976.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var976.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var976
end

t_26.descriptor = {
	name = "StructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StructProp_ConditionalOption = t_26
typeRegistryModule.default:register(t.StructProp_ConditionalOption)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p55) --[[ line: 6611 ]]
	-- upvalues: t_27 (ref)
	return setmetatable({
		options = if p55 == nil or p55.options == nil then {} else p55.options
	}, t_27)
end

function t_27:encode() --[[ line: 6619 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var978 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var979 = v:encode()
			local var980, var981 = protoModule.writeTag(buff, var978, 1, protoModule.wireTypes.lengthDelimited)
			var980, var981 = protoModule.writeBuffer(var980, var981, var979, buffer.len(var979))
			buff = var980
			var978 = var981
		end
	end
	local buff_1 = buffer.create(var978)
	buffer.copy(buff_1, 0, buff, 0, var978)
	
	return buff_1
end

function t_27.decode(p56) --[[ line: 6636 ]]
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var983 = t_27.new()
	local var984 = 0
	while var984 < buffer.len(p56) do
		local _ = nil
		local var985 = nil
		local var986, var987, var988 = protoModule.readTag(p56, var984)
		local var989 = var986
		var985 = var987
		var984 = var988
		
		if var985 == protoModule.wireTypes.varint then
			local _ = nil
			local var990, var991 = protoModule.readVarInt(p56, var984)
			local _ = var990
			var984 = var991
			continue
		end
		if var985 == protoModule.wireTypes.lengthDelimited then
			if var989 == 1 then
				local _ = nil
				local var992, var993 = protoModule.readBuffer(p56, var984)
				var984 = var993
				table.insert(var983.options, t.StructProp_ConditionalOption.decode(var992))
			else
				local _ = nil
				local var994, var995 = protoModule.readVarInt(p56, var984)
				var984 = var995 + var994
			end
		elseif var985 == protoModule.wireTypes.i32 then
			local _ = nil
			local var996, var997 = protoModule.readFixed32(p56, var984)
			local _ = var996
			var984 = var997
		elseif var985 == protoModule.wireTypes.i64 then
			local _ = nil
			local var998, var999 = protoModule.readFixed64(p56, var984)
			local _ = var998
			var984 = var999
		else
			error("Unsupported wire type: " .. var985)
		end
	end
	return var983
end

function t_27:jsonEncode() --[[ line: 6679 ]]
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

function t_27:jsonDecode() --[[ line: 6693 ]]
	-- upvalues: t_27 (ref), t (ref)
	local var1002 = t_27.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StructProp_ConditionalOption.jsonDecode(v))
		end
		var1002.options = t_1
	end
	return var1002
end

t_27.descriptor = {
	name = "StructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StructProp_ConditionalOptions = t_27
typeRegistryModule.default:register(t.StructProp_ConditionalOptions)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p57) --[[ line: 6722 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		kind = if p57 == nil or p57.kind == nil then nil else p57.kind,
		alt = if p57 == nil or p57.alt == nil then nil else p57.alt
	}, t_28)
end

function t_28:encode() --[[ line: 6729 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1005 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1006, var1007 = protoModule.writeTag(buff, var1005, 1, protoModule.wireTypes.lengthDelimited)
			var1006, var1007 = protoModule.writeString(var1006, var1007, self.kind.value)
			buff = var1006
			var1005 = var1007
		elseif self.kind.type == "binding_path" then
			local var1008, var1009 = protoModule.writeTag(buff, var1005, 2, protoModule.wireTypes.lengthDelimited)
			var1008, var1009 = protoModule.writeString(var1008, var1009, self.kind.value)
			buff = var1008
			var1005 = var1009
		elseif self.kind.type == "format" then
			local var1010 = self.kind.value:encode()
			local var1011, var1012 = protoModule.writeTag(buff, var1005, 3, protoModule.wireTypes.lengthDelimited)
			var1011, var1012 = protoModule.writeBuffer(var1011, var1012, var1010, buffer.len(var1010))
			buff = var1011
			var1005 = var1012
		elseif self.kind.type == "conditional" then
			local var1013 = self.kind.value:encode()
			local var1014, var1015 = protoModule.writeTag(buff, var1005, 4, protoModule.wireTypes.lengthDelimited)
			var1014, var1015 = protoModule.writeBuffer(var1014, var1015, var1013, buffer.len(var1013))
			buff = var1014
			var1005 = var1015
		elseif self.kind.type == "translation" then
			local var1016 = self.kind.value:encode()
			local var1017, var1018 = protoModule.writeTag(buff, var1005, 5, protoModule.wireTypes.lengthDelimited)
			var1017, var1018 = protoModule.writeBuffer(var1017, var1018, var1016, buffer.len(var1016))
			buff = var1017
			var1005 = var1018
		end
	end
	if self.alt ~= nil then
		local var1019 = self.alt:encode()
		local var1020, var1021 = protoModule.writeTag(buff, var1005, 6, protoModule.wireTypes.lengthDelimited)
		var1020, var1021 = protoModule.writeBuffer(var1020, var1021, var1019, buffer.len(var1019))
		buff = var1020
		var1005 = var1021
	end
	local buff_1 = buffer.create(var1005)
	buffer.copy(buff_1, 0, buff, 0, var1005)
	
	return buff_1
end

function t_28.decode(p58) --[[ line: 6766 ]]
	-- upvalues: t_28 (ref), protoModule (ref), t (ref)
	local var1023 = t_28.new()
	local var1024 = 0
	while var1024 < buffer.len(p58) do
		local _ = nil
		local var1025 = nil
		local var1026, var1027, var1028 = protoModule.readTag(p58, var1024)
		local var1029 = var1026
		var1025 = var1027
		var1024 = var1028
		
		if var1025 == protoModule.wireTypes.varint then
			local _ = nil
			local var1030, var1031 = protoModule.readVarInt(p58, var1024)
			local _ = var1030
			var1024 = var1031
			continue
		end
		if var1025 == protoModule.wireTypes.lengthDelimited then
			if var1029 == 1 then
				local _ = nil
				local var1032, var1033 = protoModule.readBuffer(p58, var1024)
				var1024 = var1033
				var1023.kind = { type = "literal", value = buffer.tostring(var1032) }
			elseif var1029 == 2 then
				local _ = nil
				local var1034, var1035 = protoModule.readBuffer(p58, var1024)
				var1024 = var1035
				var1023.kind = { type = "binding_path", value = buffer.tostring(var1034) }
			elseif var1029 == 3 then
				local _ = nil
				local var1036, var1037 = protoModule.readBuffer(p58, var1024)
				var1024 = var1037
				var1023.kind = { type = "format", value = t.StringFormat.decode(var1036) }
			elseif var1029 == 4 then
				local _ = nil
				local var1038, var1039 = protoModule.readBuffer(p58, var1024)
				var1024 = var1039
				var1023.kind = {
					type = "conditional",
					value = t.ImageStringProp_ConditionalOptions.decode(var1038)
				}
			elseif var1029 == 5 then
				local _ = nil
				local var1040, var1041 = protoModule.readBuffer(p58, var1024)
				var1024 = var1041
				var1023.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1040)
				}
			elseif var1029 == 6 then
				local _ = nil
				local var1042, var1043 = protoModule.readBuffer(p58, var1024)
				var1024 = var1043
				var1023.alt = t.StringFormat.decode(var1042)
			else
				local _ = nil
				local var1044, var1045 = protoModule.readVarInt(p58, var1024)
				var1024 = var1045 + var1044
			end
		elseif var1025 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1046, var1047 = protoModule.readFixed32(p58, var1024)
			local _ = var1046
			var1024 = var1047
		elseif var1025 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1048, var1049 = protoModule.readFixed64(p58, var1024)
			local _ = var1048
			var1024 = var1049
		else
			error("Unsupported wire type: " .. var1025)
		end
	end
	return var1023
end

function t_28:jsonEncode() --[[ line: 6835 ]]
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

function t_28:jsonDecode() --[[ line: 6859 ]]
	-- upvalues: t_28 (ref), t (ref)
	local var1051 = t_28.new()
	
	if self.literal ~= nil then
		var1051.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1051.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1051.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1051.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var1051.kind = {
			type = "conditional",
			value = t.ImageStringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var1051.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	if self.alt ~= nil then
		var1051.alt = t.StringFormat.jsonDecode(self.alt)
	end
	return var1051
end

t_28.descriptor = {
	name = "ImageStringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
}
t.ImageStringProp = t_28
typeRegistryModule.default:register(t.ImageStringProp)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p59) --[[ line: 6910 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		condition = if p59 == nil or p59.condition == nil then nil else p59.condition,
		kind = if p59 == nil or p59.kind == nil then nil else p59.kind
	}, t_29)
end

function t_29:encode() --[[ line: 6919 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1053 = 0
	
	if self.condition ~= nil then
		local var1054 = self.condition:encode()
		local var1055, var1056 = protoModule.writeTag(buff, var1053, 1, protoModule.wireTypes.lengthDelimited)
		var1055, var1056 = protoModule.writeBuffer(var1055, var1056, var1054, buffer.len(var1054))
		buff = var1055
		var1053 = var1056
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1057, var1058 = protoModule.writeTag(buff, var1053, 2, protoModule.wireTypes.lengthDelimited)
			var1057, var1058 = protoModule.writeString(var1057, var1058, self.kind.value)
			buff = var1057
			var1053 = var1058
		elseif self.kind.type == "binding_path" then
			local var1059, var1060 = protoModule.writeTag(buff, var1053, 3, protoModule.wireTypes.lengthDelimited)
			var1059, var1060 = protoModule.writeString(var1059, var1060, self.kind.value)
			buff = var1059
			var1053 = var1060
		elseif self.kind.type == "format" then
			local var1061 = self.kind.value:encode()
			local var1062, var1063 = protoModule.writeTag(buff, var1053, 4, protoModule.wireTypes.lengthDelimited)
			var1062, var1063 = protoModule.writeBuffer(var1062, var1063, var1061, buffer.len(var1061))
			buff = var1062
			var1053 = var1063
		elseif self.kind.type == "translation" then
			local var1064 = self.kind.value:encode()
			local var1065, var1066 = protoModule.writeTag(buff, var1053, 5, protoModule.wireTypes.lengthDelimited)
			var1065, var1066 = protoModule.writeBuffer(var1065, var1066, var1064, buffer.len(var1064))
			buff = var1065
			var1053 = var1066
		end
	end
	local buff_1 = buffer.create(var1053)
	buffer.copy(buff_1, 0, buff, 0, var1053)
	
	return buff_1
end

function t_29.decode(p60) --[[ line: 6952 ]]
	-- upvalues: t_29 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1068 = t_29.new()
	local var1069 = 0
	while var1069 < buffer.len(p60) do
		local _ = nil
		local var1070 = nil
		local var1071, var1072, var1073 = protoModule.readTag(p60, var1069)
		local var1074 = var1071
		var1070 = var1072
		var1069 = var1073
		
		if var1070 == protoModule.wireTypes.varint then
			local _ = nil
			local var1075, var1076 = protoModule.readVarInt(p60, var1069)
			local _ = var1075
			var1069 = var1076
			continue
		end
		if var1070 == protoModule.wireTypes.lengthDelimited then
			if var1074 == 1 then
				local _ = nil
				local var1077, var1078 = protoModule.readBuffer(p60, var1069)
				var1069 = var1078
				var1068.condition = propConditionModule.PropCondition.decode(var1077)
			elseif var1074 == 2 then
				local _ = nil
				local var1079, var1080 = protoModule.readBuffer(p60, var1069)
				var1069 = var1080
				var1068.kind = { type = "literal", value = buffer.tostring(var1079) }
			elseif var1074 == 3 then
				local _ = nil
				local var1081, var1082 = protoModule.readBuffer(p60, var1069)
				var1069 = var1082
				var1068.kind = { type = "binding_path", value = buffer.tostring(var1081) }
			elseif var1074 == 4 then
				local _ = nil
				local var1083, var1084 = protoModule.readBuffer(p60, var1069)
				var1069 = var1084
				var1068.kind = { type = "format", value = t.StringFormat.decode(var1083) }
			elseif var1074 == 5 then
				local _ = nil
				local var1085, var1086 = protoModule.readBuffer(p60, var1069)
				var1069 = var1086
				var1068.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1085)
				}
			else
				local _ = nil
				local var1087, var1088 = protoModule.readVarInt(p60, var1069)
				var1069 = var1088 + var1087
			end
		elseif var1070 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1089, var1090 = protoModule.readFixed32(p60, var1069)
			local _ = var1089
			var1069 = var1090
		elseif var1070 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1091, var1092 = protoModule.readFixed64(p60, var1069)
			local _ = var1091
			var1069 = var1092
		else
			error("Unsupported wire type: " .. var1070)
		end
	end
	return var1068
end

function t_29:jsonEncode() --[[ line: 7015 ]]
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

function t_29:jsonDecode() --[[ line: 7037 ]]
	-- upvalues: t_29 (ref), propConditionModule (ref), t (ref)
	local var1094 = t_29.new()
	
	if self.condition ~= nil then
		var1094.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1094.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1094.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1094.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1094.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var1094.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1094
end

t_29.descriptor = {
	name = "ImageStringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageStringProp_ConditionalOption = t_29
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOption)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p61) --[[ line: 7084 ]]
	-- upvalues: t_30 (ref)
	return setmetatable({
		options = if p61 == nil or p61.options == nil then {} else p61.options
	}, t_30)
end

function t_30:encode() --[[ line: 7092 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1096 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1097 = v:encode()
			local var1098, var1099 = protoModule.writeTag(buff, var1096, 1, protoModule.wireTypes.lengthDelimited)
			var1098, var1099 = protoModule.writeBuffer(var1098, var1099, var1097, buffer.len(var1097))
			buff = var1098
			var1096 = var1099
		end
	end
	local buff_1 = buffer.create(var1096)
	buffer.copy(buff_1, 0, buff, 0, var1096)
	
	return buff_1
end

function t_30.decode(p62) --[[ line: 7109 ]]
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var1101 = t_30.new()
	local var1102 = 0
	while var1102 < buffer.len(p62) do
		local _ = nil
		local var1103 = nil
		local var1104, var1105, var1106 = protoModule.readTag(p62, var1102)
		local var1107 = var1104
		var1103 = var1105
		var1102 = var1106
		
		if var1103 == protoModule.wireTypes.varint then
			local _ = nil
			local var1108, var1109 = protoModule.readVarInt(p62, var1102)
			local _ = var1108
			var1102 = var1109
			continue
		end
		if var1103 == protoModule.wireTypes.lengthDelimited then
			if var1107 == 1 then
				local _ = nil
				local var1110, var1111 = protoModule.readBuffer(p62, var1102)
				var1102 = var1111
				table.insert(var1101.options, t.ImageStringProp_ConditionalOption.decode(var1110))
			else
				local _ = nil
				local var1112, var1113 = protoModule.readVarInt(p62, var1102)
				var1102 = var1113 + var1112
			end
		elseif var1103 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1114, var1115 = protoModule.readFixed32(p62, var1102)
			local _ = var1114
			var1102 = var1115
		elseif var1103 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1116, var1117 = protoModule.readFixed64(p62, var1102)
			local _ = var1116
			var1102 = var1117
		else
			error("Unsupported wire type: " .. var1103)
		end
	end
	return var1101
end

function t_30:jsonEncode() --[[ line: 7152 ]]
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

function t_30:jsonDecode() --[[ line: 7166 ]]
	-- upvalues: t_30 (ref), t (ref)
	local var1120 = t_30.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageStringProp_ConditionalOption.jsonDecode(v))
		end
		var1120.options = t_1
	end
	return var1120
end

t_30.descriptor = {
	name = "ImageStringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageStringProp_ConditionalOptions = t_30
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOptions)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p63) --[[ line: 7197 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		kind = if p63 == nil or p63.kind == nil then nil else p63.kind
	}, t_31)
end

function t_31:encode() --[[ line: 7203 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1123 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1124, var1125 = protoModule.writeTag(buff, var1123, 1, protoModule.wireTypes.lengthDelimited)
			var1124, var1125 = protoModule.writeString(var1124, var1125, self.kind.value)
			buff = var1124
			var1123 = var1125
		elseif self.kind.type == "binding_path" then
			local var1126, var1127 = protoModule.writeTag(buff, var1123, 2, protoModule.wireTypes.lengthDelimited)
			var1126, var1127 = protoModule.writeString(var1126, var1127, self.kind.value)
			buff = var1126
			var1123 = var1127
		elseif self.kind.type == "format" then
			local var1128 = self.kind.value:encode()
			local var1129, var1130 = protoModule.writeTag(buff, var1123, 3, protoModule.wireTypes.lengthDelimited)
			var1129, var1130 = protoModule.writeBuffer(var1129, var1130, var1128, buffer.len(var1128))
			buff = var1129
			var1123 = var1130
		elseif self.kind.type == "conditional" then
			local var1131 = self.kind.value:encode()
			local var1132, var1133 = protoModule.writeTag(buff, var1123, 4, protoModule.wireTypes.lengthDelimited)
			var1132, var1133 = protoModule.writeBuffer(var1132, var1133, var1131, buffer.len(var1131))
			buff = var1132
			var1123 = var1133
		elseif self.kind.type == "translation" then
			local var1134 = self.kind.value:encode()
			local var1135, var1136 = protoModule.writeTag(buff, var1123, 5, protoModule.wireTypes.lengthDelimited)
			var1135, var1136 = protoModule.writeBuffer(var1135, var1136, var1134, buffer.len(var1134))
			buff = var1135
			var1123 = var1136
		end
	end
	local buff_1 = buffer.create(var1123)
	buffer.copy(buff_1, 0, buff, 0, var1123)
	
	return buff_1
end

function t_31.decode(p64) --[[ line: 7234 ]]
	-- upvalues: t_31 (ref), protoModule (ref), t (ref)
	local var1138 = t_31.new()
	local var1139 = 0
	while var1139 < buffer.len(p64) do
		local _ = nil
		local var1140 = nil
		local var1141, var1142, var1143 = protoModule.readTag(p64, var1139)
		local var1144 = var1141
		var1140 = var1142
		var1139 = var1143
		
		if var1140 == protoModule.wireTypes.varint then
			local _ = nil
			local var1145, var1146 = protoModule.readVarInt(p64, var1139)
			local _ = var1145
			var1139 = var1146
			continue
		end
		if var1140 == protoModule.wireTypes.lengthDelimited then
			if var1144 == 1 then
				local _ = nil
				local var1147, var1148 = protoModule.readBuffer(p64, var1139)
				var1139 = var1148
				var1138.kind = { type = "literal", value = buffer.tostring(var1147) }
			elseif var1144 == 2 then
				local _ = nil
				local var1149, var1150 = protoModule.readBuffer(p64, var1139)
				var1139 = var1150
				var1138.kind = { type = "binding_path", value = buffer.tostring(var1149) }
			elseif var1144 == 3 then
				local _ = nil
				local var1151, var1152 = protoModule.readBuffer(p64, var1139)
				var1139 = var1152
				var1138.kind = { type = "format", value = t.StringFormat.decode(var1151) }
			elseif var1144 == 4 then
				local _ = nil
				local var1153, var1154 = protoModule.readBuffer(p64, var1139)
				var1139 = var1154
				var1138.kind = {
					type = "conditional",
					value = t.ImageSetProp_ConditionalOptions.decode(var1153)
				}
			elseif var1144 == 5 then
				local _ = nil
				local var1155, var1156 = protoModule.readBuffer(p64, var1139)
				var1139 = var1156
				var1138.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1155)
				}
			else
				local _ = nil
				local var1157, var1158 = protoModule.readVarInt(p64, var1139)
				var1139 = var1158 + var1157
			end
		elseif var1140 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1159, var1160 = protoModule.readFixed32(p64, var1139)
			local _ = var1159
			var1139 = var1160
		elseif var1140 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1161, var1162 = protoModule.readFixed64(p64, var1139)
			local _ = var1161
			var1139 = var1162
		else
			error("Unsupported wire type: " .. var1140)
		end
	end
	return var1138
end

function t_31:jsonEncode() --[[ line: 7297 ]]
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

function t_31:jsonDecode() --[[ line: 7317 ]]
	-- upvalues: t_31 (ref), t (ref)
	local var1164 = t_31.new()
	
	if self.literal ~= nil then
		var1164.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1164.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1164.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1164.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var1164.kind = {
			type = "conditional",
			value = t.ImageSetProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var1164.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1164
end

t_31.descriptor = {
	name = "ImageSetProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
}
t.ImageSetProp = t_31
typeRegistryModule.default:register(t.ImageSetProp)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p65) --[[ line: 7362 ]]
	-- upvalues: t_32 (ref)
	return setmetatable({
		condition = if p65 == nil or p65.condition == nil then nil else p65.condition,
		kind = if p65 == nil or p65.kind == nil then nil else p65.kind
	}, t_32)
end

function t_32:encode() --[[ line: 7371 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1166 = 0
	
	if self.condition ~= nil then
		local var1167 = self.condition:encode()
		local var1168, var1169 = protoModule.writeTag(buff, var1166, 1, protoModule.wireTypes.lengthDelimited)
		var1168, var1169 = protoModule.writeBuffer(var1168, var1169, var1167, buffer.len(var1167))
		buff = var1168
		var1166 = var1169
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1170, var1171 = protoModule.writeTag(buff, var1166, 2, protoModule.wireTypes.lengthDelimited)
			var1170, var1171 = protoModule.writeString(var1170, var1171, self.kind.value)
			buff = var1170
			var1166 = var1171
		elseif self.kind.type == "binding_path" then
			local var1172, var1173 = protoModule.writeTag(buff, var1166, 3, protoModule.wireTypes.lengthDelimited)
			var1172, var1173 = protoModule.writeString(var1172, var1173, self.kind.value)
			buff = var1172
			var1166 = var1173
		elseif self.kind.type == "format" then
			local var1174 = self.kind.value:encode()
			local var1175, var1176 = protoModule.writeTag(buff, var1166, 4, protoModule.wireTypes.lengthDelimited)
			var1175, var1176 = protoModule.writeBuffer(var1175, var1176, var1174, buffer.len(var1174))
			buff = var1175
			var1166 = var1176
		elseif self.kind.type == "translation" then
			local var1177 = self.kind.value:encode()
			local var1178, var1179 = protoModule.writeTag(buff, var1166, 5, protoModule.wireTypes.lengthDelimited)
			var1178, var1179 = protoModule.writeBuffer(var1178, var1179, var1177, buffer.len(var1177))
			buff = var1178
			var1166 = var1179
		end
	end
	local buff_1 = buffer.create(var1166)
	buffer.copy(buff_1, 0, buff, 0, var1166)
	
	return buff_1
end

function t_32.decode(p66) --[[ line: 7404 ]]
	-- upvalues: t_32 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1181 = t_32.new()
	local var1182 = 0
	while var1182 < buffer.len(p66) do
		local _ = nil
		local var1183 = nil
		local var1184, var1185, var1186 = protoModule.readTag(p66, var1182)
		local var1187 = var1184
		var1183 = var1185
		var1182 = var1186
		
		if var1183 == protoModule.wireTypes.varint then
			local _ = nil
			local var1188, var1189 = protoModule.readVarInt(p66, var1182)
			local _ = var1188
			var1182 = var1189
			continue
		end
		if var1183 == protoModule.wireTypes.lengthDelimited then
			if var1187 == 1 then
				local _ = nil
				local var1190, var1191 = protoModule.readBuffer(p66, var1182)
				var1182 = var1191
				var1181.condition = propConditionModule.PropCondition.decode(var1190)
			elseif var1187 == 2 then
				local _ = nil
				local var1192, var1193 = protoModule.readBuffer(p66, var1182)
				var1182 = var1193
				var1181.kind = { type = "literal", value = buffer.tostring(var1192) }
			elseif var1187 == 3 then
				local _ = nil
				local var1194, var1195 = protoModule.readBuffer(p66, var1182)
				var1182 = var1195
				var1181.kind = { type = "binding_path", value = buffer.tostring(var1194) }
			elseif var1187 == 4 then
				local _ = nil
				local var1196, var1197 = protoModule.readBuffer(p66, var1182)
				var1182 = var1197
				var1181.kind = { type = "format", value = t.StringFormat.decode(var1196) }
			elseif var1187 == 5 then
				local _ = nil
				local var1198, var1199 = protoModule.readBuffer(p66, var1182)
				var1182 = var1199
				var1181.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1198)
				}
			else
				local _ = nil
				local var1200, var1201 = protoModule.readVarInt(p66, var1182)
				var1182 = var1201 + var1200
			end
		elseif var1183 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1202, var1203 = protoModule.readFixed32(p66, var1182)
			local _ = var1202
			var1182 = var1203
		elseif var1183 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1204, var1205 = protoModule.readFixed64(p66, var1182)
			local _ = var1204
			var1182 = var1205
		else
			error("Unsupported wire type: " .. var1183)
		end
	end
	return var1181
end

function t_32:jsonEncode() --[[ line: 7467 ]]
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

function t_32:jsonDecode() --[[ line: 7489 ]]
	-- upvalues: t_32 (ref), propConditionModule (ref), t (ref)
	local var1207 = t_32.new()
	
	if self.condition ~= nil then
		var1207.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1207.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1207.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1207.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1207.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var1207.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1207
end

t_32.descriptor = {
	name = "ImageSetProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageSetProp_ConditionalOption = t_32
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOption)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p67) --[[ line: 7534 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		options = if p67 == nil or p67.options == nil then {} else p67.options
	}, t_33)
end

function t_33:encode() --[[ line: 7542 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1209 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1210 = v:encode()
			local var1211, var1212 = protoModule.writeTag(buff, var1209, 1, protoModule.wireTypes.lengthDelimited)
			var1211, var1212 = protoModule.writeBuffer(var1211, var1212, var1210, buffer.len(var1210))
			buff = var1211
			var1209 = var1212
		end
	end
	local buff_1 = buffer.create(var1209)
	buffer.copy(buff_1, 0, buff, 0, var1209)
	
	return buff_1
end

function t_33.decode(p68) --[[ line: 7559 ]]
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1214 = t_33.new()
	local var1215 = 0
	while var1215 < buffer.len(p68) do
		local _ = nil
		local var1216 = nil
		local var1217, var1218, var1219 = protoModule.readTag(p68, var1215)
		local var1220 = var1217
		var1216 = var1218
		var1215 = var1219
		
		if var1216 == protoModule.wireTypes.varint then
			local _ = nil
			local var1221, var1222 = protoModule.readVarInt(p68, var1215)
			local _ = var1221
			var1215 = var1222
			continue
		end
		if var1216 == protoModule.wireTypes.lengthDelimited then
			if var1220 == 1 then
				local _ = nil
				local var1223, var1224 = protoModule.readBuffer(p68, var1215)
				var1215 = var1224
				table.insert(var1214.options, t.ImageSetProp_ConditionalOption.decode(var1223))
			else
				local _ = nil
				local var1225, var1226 = protoModule.readVarInt(p68, var1215)
				var1215 = var1226 + var1225
			end
		elseif var1216 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1227, var1228 = protoModule.readFixed32(p68, var1215)
			local _ = var1227
			var1215 = var1228
		elseif var1216 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1229, var1230 = protoModule.readFixed64(p68, var1215)
			local _ = var1229
			var1215 = var1230
		else
			error("Unsupported wire type: " .. var1216)
		end
	end
	return var1214
end

function t_33:jsonEncode() --[[ line: 7602 ]]
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

function t_33:jsonDecode() --[[ line: 7616 ]]
	-- upvalues: t_33 (ref), t (ref)
	local var1233 = t_33.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageSetProp_ConditionalOption.jsonDecode(v))
		end
		var1233.options = t_1
	end
	return var1233
end

t_33.descriptor = {
	name = "ImageSetProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageSetProp_ConditionalOptions = t_33
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOptions)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p69) --[[ line: 7645 ]]
	-- upvalues: t_34 (ref)
	return setmetatable({
		kind = if p69 == nil or p69.kind == nil then nil else p69.kind
	}, t_34)
end

function t_34:encode() --[[ line: 7651 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1236 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1237, var1238 = protoModule.writeTag(buff, var1236, 1, protoModule.wireTypes.lengthDelimited)
			var1237, var1238 = protoModule.writeString(var1237, var1238, self.kind.value)
			buff = var1237
			var1236 = var1238
		elseif self.kind.type == "token" then
			local var1239, var1240 = protoModule.writeTag(buff, var1236, 2, protoModule.wireTypes.lengthDelimited)
			var1239, var1240 = protoModule.writeString(var1239, var1240, self.kind.value)
			buff = var1239
			var1236 = var1240
		elseif self.kind.type == "conditional" then
			local var1241 = self.kind.value:encode()
			local var1242, var1243 = protoModule.writeTag(buff, var1236, 3, protoModule.wireTypes.lengthDelimited)
			var1242, var1243 = protoModule.writeBuffer(var1242, var1243, var1241, buffer.len(var1241))
			buff = var1242
			var1236 = var1243
		elseif self.kind.type == "binding_path" then
			local var1244, var1245 = protoModule.writeTag(buff, var1236, 4, protoModule.wireTypes.lengthDelimited)
			var1244, var1245 = protoModule.writeString(var1244, var1245, self.kind.value)
			buff = var1244
			var1236 = var1245
		end
	end
	local buff_1 = buffer.create(var1236)
	buffer.copy(buff_1, 0, buff, 0, var1236)
	
	return buff_1
end

function t_34.decode(p70) --[[ line: 7677 ]]
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1247 = t_34.new()
	local var1248 = 0
	while var1248 < buffer.len(p70) do
		local _ = nil
		local var1249 = nil
		local var1250, var1251, var1252 = protoModule.readTag(p70, var1248)
		local var1253 = var1250
		var1249 = var1251
		var1248 = var1252
		
		if var1249 == protoModule.wireTypes.varint then
			local _ = nil
			local var1254, var1255 = protoModule.readVarInt(p70, var1248)
			local _ = var1254
			var1248 = var1255
			continue
		end
		if var1249 == protoModule.wireTypes.lengthDelimited then
			if var1253 == 1 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p70, var1248)
				var1248 = var1257
				var1247.kind = { type = "literal", value = buffer.tostring(var1256) }
			elseif var1253 == 2 then
				local _ = nil
				local var1258, var1259 = protoModule.readBuffer(p70, var1248)
				var1248 = var1259
				var1247.kind = { type = "token", value = buffer.tostring(var1258) }
			elseif var1253 == 3 then
				local _ = nil
				local var1260, var1261 = protoModule.readBuffer(p70, var1248)
				var1248 = var1261
				var1247.kind = {
					type = "conditional",
					value = t.ColorProp_ConditionalOptions.decode(var1260)
				}
			elseif var1253 == 4 then
				local _ = nil
				local var1262, var1263 = protoModule.readBuffer(p70, var1248)
				var1248 = var1263
				var1247.kind = { type = "binding_path", value = buffer.tostring(var1262) }
			else
				local _ = nil
				local var1264, var1265 = protoModule.readVarInt(p70, var1248)
				var1248 = var1265 + var1264
			end
		elseif var1249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1266, var1267 = protoModule.readFixed32(p70, var1248)
			local _ = var1266
			var1248 = var1267
		elseif var1249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1268, var1269 = protoModule.readFixed64(p70, var1248)
			local _ = var1268
			var1248 = var1269
		else
			error("Unsupported wire type: " .. var1249)
		end
	end
	return var1247
end

function t_34:jsonEncode() --[[ line: 7735 ]]
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

function t_34:jsonDecode() --[[ line: 7753 ]]
	-- upvalues: t_34 (ref), t (ref)
	local var1271 = t_34.new()
	
	if self.literal ~= nil then
		var1271.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1271.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1271.kind = {
			type = "conditional",
			value = t.ColorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1271.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1271.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1271
end

t_34.descriptor = {
	name = "ColorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
}
t.ColorProp = t_34
typeRegistryModule.default:register(t.ColorProp)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p71) --[[ line: 7794 ]]
	-- upvalues: t_35 (ref)
	return setmetatable({
		condition = if p71 == nil or p71.condition == nil then nil else p71.condition,
		kind = if p71 == nil or p71.kind == nil then nil else p71.kind
	}, t_35)
end

function t_35:encode() --[[ line: 7803 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1273 = 0
	
	if self.condition ~= nil then
		local var1274 = self.condition:encode()
		local var1275, var1276 = protoModule.writeTag(buff, var1273, 1, protoModule.wireTypes.lengthDelimited)
		var1275, var1276 = protoModule.writeBuffer(var1275, var1276, var1274, buffer.len(var1274))
		buff = var1275
		var1273 = var1276
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1277, var1278 = protoModule.writeTag(buff, var1273, 2, protoModule.wireTypes.lengthDelimited)
			var1277, var1278 = protoModule.writeString(var1277, var1278, self.kind.value)
			buff = var1277
			var1273 = var1278
		elseif self.kind.type == "token" then
			local var1279, var1280 = protoModule.writeTag(buff, var1273, 3, protoModule.wireTypes.lengthDelimited)
			var1279, var1280 = protoModule.writeString(var1279, var1280, self.kind.value)
			buff = var1279
			var1273 = var1280
		elseif self.kind.type == "binding_path" then
			local var1281, var1282 = protoModule.writeTag(buff, var1273, 4, protoModule.wireTypes.lengthDelimited)
			var1281, var1282 = protoModule.writeString(var1281, var1282, self.kind.value)
			buff = var1281
			var1273 = var1282
		end
	end
	local buff_1 = buffer.create(var1273)
	buffer.copy(buff_1, 0, buff, 0, var1273)
	
	return buff_1
end

function t_35.decode(p72) --[[ line: 7831 ]]
	-- upvalues: t_35 (ref), protoModule (ref), propConditionModule (ref)
	local var1284 = t_35.new()
	local var1285 = 0
	while var1285 < buffer.len(p72) do
		local _ = nil
		local var1286 = nil
		local var1287, var1288, var1289 = protoModule.readTag(p72, var1285)
		local var1290 = var1287
		var1286 = var1288
		var1285 = var1289
		
		if var1286 == protoModule.wireTypes.varint then
			local _ = nil
			local var1291, var1292 = protoModule.readVarInt(p72, var1285)
			local _ = var1291
			var1285 = var1292
			continue
		end
		if var1286 == protoModule.wireTypes.lengthDelimited then
			if var1290 == 1 then
				local _ = nil
				local var1293, var1294 = protoModule.readBuffer(p72, var1285)
				var1285 = var1294
				var1284.condition = propConditionModule.PropCondition.decode(var1293)
			elseif var1290 == 2 then
				local _ = nil
				local var1295, var1296 = protoModule.readBuffer(p72, var1285)
				var1285 = var1296
				var1284.kind = { type = "literal", value = buffer.tostring(var1295) }
			elseif var1290 == 3 then
				local _ = nil
				local var1297, var1298 = protoModule.readBuffer(p72, var1285)
				var1285 = var1298
				var1284.kind = { type = "token", value = buffer.tostring(var1297) }
			elseif var1290 == 4 then
				local _ = nil
				local var1299, var1300 = protoModule.readBuffer(p72, var1285)
				var1285 = var1300
				var1284.kind = { type = "binding_path", value = buffer.tostring(var1299) }
			else
				local _ = nil
				local var1301, var1302 = protoModule.readVarInt(p72, var1285)
				var1285 = var1302 + var1301
			end
		elseif var1286 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1303, var1304 = protoModule.readFixed32(p72, var1285)
			local _ = var1303
			var1285 = var1304
		elseif var1286 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1305, var1306 = protoModule.readFixed64(p72, var1285)
			local _ = var1305
			var1285 = var1306
		else
			error("Unsupported wire type: " .. var1286)
		end
	end
	return var1284
end

function t_35:jsonEncode() --[[ line: 7889 ]]
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

function t_35:jsonDecode() --[[ line: 7909 ]]
	-- upvalues: t_35 (ref), propConditionModule (ref)
	local var1308 = t_35.new()
	
	if self.condition ~= nil then
		var1308.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1308.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1308.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1308.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1308.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1308
end

t_35.descriptor = {
	name = "ColorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorProp_ConditionalOption = t_35
typeRegistryModule.default:register(t.ColorProp_ConditionalOption)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p73) --[[ line: 7950 ]]
	-- upvalues: t_36 (ref)
	return setmetatable({
		options = if p73 == nil or p73.options == nil then {} else p73.options
	}, t_36)
end

function t_36:encode() --[[ line: 7958 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1310 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1311 = v:encode()
			local var1312, var1313 = protoModule.writeTag(buff, var1310, 1, protoModule.wireTypes.lengthDelimited)
			var1312, var1313 = protoModule.writeBuffer(var1312, var1313, var1311, buffer.len(var1311))
			buff = var1312
			var1310 = var1313
		end
	end
	local buff_1 = buffer.create(var1310)
	buffer.copy(buff_1, 0, buff, 0, var1310)
	
	return buff_1
end

function t_36.decode(p74) --[[ line: 7975 ]]
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1315 = t_36.new()
	local var1316 = 0
	while var1316 < buffer.len(p74) do
		local _ = nil
		local var1317 = nil
		local var1318, var1319, var1320 = protoModule.readTag(p74, var1316)
		local var1321 = var1318
		var1317 = var1319
		var1316 = var1320
		
		if var1317 == protoModule.wireTypes.varint then
			local _ = nil
			local var1322, var1323 = protoModule.readVarInt(p74, var1316)
			local _ = var1322
			var1316 = var1323
			continue
		end
		if var1317 == protoModule.wireTypes.lengthDelimited then
			if var1321 == 1 then
				local _ = nil
				local var1324, var1325 = protoModule.readBuffer(p74, var1316)
				var1316 = var1325
				table.insert(var1315.options, t.ColorProp_ConditionalOption.decode(var1324))
			else
				local _ = nil
				local var1326, var1327 = protoModule.readVarInt(p74, var1316)
				var1316 = var1327 + var1326
			end
		elseif var1317 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1328, var1329 = protoModule.readFixed32(p74, var1316)
			local _ = var1328
			var1316 = var1329
		elseif var1317 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1330, var1331 = protoModule.readFixed64(p74, var1316)
			local _ = var1330
			var1316 = var1331
		else
			error("Unsupported wire type: " .. var1317)
		end
	end
	return var1315
end

function t_36:jsonEncode() --[[ line: 8018 ]]
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

function t_36:jsonDecode() --[[ line: 8032 ]]
	-- upvalues: t_36 (ref), t (ref)
	local var1334 = t_36.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorProp_ConditionalOption.jsonDecode(v))
		end
		var1334.options = t_1
	end
	return var1334
end

t_36.descriptor = {
	name = "ColorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorProp_ConditionalOptions = t_36
typeRegistryModule.default:register(t.ColorProp_ConditionalOptions)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p75) --[[ line: 8061 ]]
	-- upvalues: t_37 (ref)
	return setmetatable({
		kind = if p75 == nil or p75.kind == nil then nil else p75.kind
	}, t_37)
end

function t_37:encode() --[[ line: 8067 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1337 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1338, var1339 = protoModule.writeTag(buff, var1337, 1, protoModule.wireTypes.lengthDelimited)
			var1338, var1339 = protoModule.writeString(var1338, var1339, self.kind.value)
			buff = var1338
			var1337 = var1339
		elseif self.kind.type == "conditional" then
			local var1340 = self.kind.value:encode()
			local var1341, var1342 = protoModule.writeTag(buff, var1337, 2, protoModule.wireTypes.lengthDelimited)
			var1341, var1342 = protoModule.writeBuffer(var1341, var1342, var1340, buffer.len(var1340))
			buff = var1341
			var1337 = var1342
		end
	end
	local buff_1 = buffer.create(var1337)
	buffer.copy(buff_1, 0, buff, 0, var1337)
	
	return buff_1
end

function t_37.decode(p76) --[[ line: 8087 ]]
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1344 = t_37.new()
	local var1345 = 0
	while var1345 < buffer.len(p76) do
		local _ = nil
		local var1346 = nil
		local var1347, var1348, var1349 = protoModule.readTag(p76, var1345)
		local var1350 = var1347
		var1346 = var1348
		var1345 = var1349
		
		if var1346 == protoModule.wireTypes.varint then
			local _ = nil
			local var1351, var1352 = protoModule.readVarInt(p76, var1345)
			local _ = var1351
			var1345 = var1352
			continue
		end
		if var1346 == protoModule.wireTypes.lengthDelimited then
			if var1350 == 1 then
				local _ = nil
				local var1353, var1354 = protoModule.readBuffer(p76, var1345)
				var1345 = var1354
				var1344.kind = { type = "token", value = buffer.tostring(var1353) }
			elseif var1350 == 2 then
				local _ = nil
				local var1355, var1356 = protoModule.readBuffer(p76, var1345)
				var1345 = var1356
				var1344.kind = {
					type = "conditional",
					value = t.TypographyProp_ConditionalOptions.decode(var1355)
				}
			else
				local _ = nil
				local var1357, var1358 = protoModule.readVarInt(p76, var1345)
				var1345 = var1358 + var1357
			end
		elseif var1346 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1359, var1360 = protoModule.readFixed32(p76, var1345)
			local _ = var1359
			var1345 = var1360
		elseif var1346 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1361, var1362 = protoModule.readFixed64(p76, var1345)
			local _ = var1361
			var1345 = var1362
		else
			error("Unsupported wire type: " .. var1346)
		end
	end
	return var1344
end

function t_37:jsonEncode() --[[ line: 8136 ]]
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

function t_37:jsonDecode() --[[ line: 8150 ]]
	-- upvalues: t_37 (ref), t (ref)
	local var1364 = t_37.new()
	
	if self.token ~= nil then
		var1364.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1364.kind = {
			type = "conditional",
			value = t.TypographyProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1364
end

t_37.descriptor = {
	name = "TypographyProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
}
t.TypographyProp = t_37
typeRegistryModule.default:register(t.TypographyProp)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p77) --[[ line: 8181 ]]
	-- upvalues: t_38 (ref)
	return setmetatable({
		condition = if p77 == nil or p77.condition == nil then nil else p77.condition,
		kind = if p77 == nil or p77.kind == nil then nil else p77.kind
	}, t_38)
end

function t_38:encode() --[[ line: 8190 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1366 = 0
	
	if self.condition ~= nil then
		local var1367 = self.condition:encode()
		local var1368, var1369 = protoModule.writeTag(buff, var1366, 1, protoModule.wireTypes.lengthDelimited)
		var1368, var1369 = protoModule.writeBuffer(var1368, var1369, var1367, buffer.len(var1367))
		buff = var1368
		var1366 = var1369
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1370, var1371 = protoModule.writeTag(buff, var1366, 2, protoModule.wireTypes.lengthDelimited)
		var1370, var1371 = protoModule.writeString(var1370, var1371, self.kind.value)
		buff = var1370
		var1366 = var1371
	end
	local buff_1 = buffer.create(var1366)
	buffer.copy(buff_1, 0, buff, 0, var1366)
	
	return buff_1
end

function t_38.decode(p78) --[[ line: 8212 ]]
	-- upvalues: t_38 (ref), protoModule (ref), propConditionModule (ref)
	local var1373 = t_38.new()
	local var1374 = 0
	while var1374 < buffer.len(p78) do
		local _ = nil
		local var1375 = nil
		local var1376, var1377, var1378 = protoModule.readTag(p78, var1374)
		local var1379 = var1376
		var1375 = var1377
		var1374 = var1378
		
		if var1375 == protoModule.wireTypes.varint then
			local _ = nil
			local var1380, var1381 = protoModule.readVarInt(p78, var1374)
			local _ = var1380
			var1374 = var1381
			continue
		end
		if var1375 == protoModule.wireTypes.lengthDelimited then
			if var1379 == 1 then
				local _ = nil
				local var1382, var1383 = protoModule.readBuffer(p78, var1374)
				var1374 = var1383
				var1373.condition = propConditionModule.PropCondition.decode(var1382)
			elseif var1379 == 2 then
				local _ = nil
				local var1384, var1385 = protoModule.readBuffer(p78, var1374)
				var1374 = var1385
				var1373.kind = { type = "token", value = buffer.tostring(var1384) }
			else
				local _ = nil
				local var1386, var1387 = protoModule.readVarInt(p78, var1374)
				var1374 = var1387 + var1386
			end
		elseif var1375 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1388, var1389 = protoModule.readFixed32(p78, var1374)
			local _ = var1388
			var1374 = var1389
		elseif var1375 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1390, var1391 = protoModule.readFixed64(p78, var1374)
			local _ = var1390
			var1374 = var1391
		else
			error("Unsupported wire type: " .. var1375)
		end
	end
	return var1373
end

function t_38:jsonEncode() --[[ line: 8260 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_38:jsonDecode() --[[ line: 8276 ]]
	-- upvalues: t_38 (ref), propConditionModule (ref)
	local var1393 = t_38.new()
	
	if self.condition ~= nil then
		var1393.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1393.kind = { type = "token", value = self.token }
	end
	return var1393
end

t_38.descriptor = {
	name = "TypographyProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyProp_ConditionalOption = t_38
typeRegistryModule.default:register(t.TypographyProp_ConditionalOption)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p79) --[[ line: 8307 ]]
	-- upvalues: t_39 (ref)
	return setmetatable({
		options = if p79 == nil or p79.options == nil then {} else p79.options
	}, t_39)
end

function t_39:encode() --[[ line: 8315 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1395 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1396 = v:encode()
			local var1397, var1398 = protoModule.writeTag(buff, var1395, 1, protoModule.wireTypes.lengthDelimited)
			var1397, var1398 = protoModule.writeBuffer(var1397, var1398, var1396, buffer.len(var1396))
			buff = var1397
			var1395 = var1398
		end
	end
	local buff_1 = buffer.create(var1395)
	buffer.copy(buff_1, 0, buff, 0, var1395)
	
	return buff_1
end

function t_39.decode(p80) --[[ line: 8332 ]]
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1400 = t_39.new()
	local var1401 = 0
	while var1401 < buffer.len(p80) do
		local _ = nil
		local var1402 = nil
		local var1403, var1404, var1405 = protoModule.readTag(p80, var1401)
		local var1406 = var1403
		var1402 = var1404
		var1401 = var1405
		
		if var1402 == protoModule.wireTypes.varint then
			local _ = nil
			local var1407, var1408 = protoModule.readVarInt(p80, var1401)
			local _ = var1407
			var1401 = var1408
			continue
		end
		if var1402 == protoModule.wireTypes.lengthDelimited then
			if var1406 == 1 then
				local _ = nil
				local var1409, var1410 = protoModule.readBuffer(p80, var1401)
				var1401 = var1410
				table.insert(var1400.options, t.TypographyProp_ConditionalOption.decode(var1409))
			else
				local _ = nil
				local var1411, var1412 = protoModule.readVarInt(p80, var1401)
				var1401 = var1412 + var1411
			end
		elseif var1402 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1413, var1414 = protoModule.readFixed32(p80, var1401)
			local _ = var1413
			var1401 = var1414
		elseif var1402 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1415, var1416 = protoModule.readFixed64(p80, var1401)
			local _ = var1415
			var1401 = var1416
		else
			error("Unsupported wire type: " .. var1402)
		end
	end
	return var1400
end

function t_39:jsonEncode() --[[ line: 8375 ]]
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

function t_39:jsonDecode() --[[ line: 8389 ]]
	-- upvalues: t_39 (ref), t (ref)
	local var1419 = t_39.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyProp_ConditionalOption.jsonDecode(v))
		end
		var1419.options = t_1
	end
	return var1419
end

t_39.descriptor = {
	name = "TypographyProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyProp_ConditionalOptions = t_39
typeRegistryModule.default:register(t.TypographyProp_ConditionalOptions)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p81) --[[ line: 8420 ]]
	-- upvalues: t_40 (ref)
	return setmetatable({
		kind = if p81 == nil or p81.kind == nil then nil else p81.kind
	}, t_40)
end

function t_40:encode() --[[ line: 8426 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1422 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1423, var1424 = protoModule.writeTag(buff, var1422, 1, protoModule.wireTypes.lengthDelimited)
			var1423, var1424 = protoModule.writeString(var1423, var1424, self.kind.value)
			buff = var1423
			var1422 = var1424
		elseif self.kind.type == "conditional" then
			local var1425 = self.kind.value:encode()
			local var1426, var1427 = protoModule.writeTag(buff, var1422, 2, protoModule.wireTypes.lengthDelimited)
			var1426, var1427 = protoModule.writeBuffer(var1426, var1427, var1425, buffer.len(var1425))
			buff = var1426
			var1422 = var1427
		end
	end
	local buff_1 = buffer.create(var1422)
	buffer.copy(buff_1, 0, buff, 0, var1422)
	
	return buff_1
end

function t_40.decode(p82) --[[ line: 8446 ]]
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1429 = t_40.new()
	local var1430 = 0
	while var1430 < buffer.len(p82) do
		local _ = nil
		local var1431 = nil
		local var1432, var1433, var1434 = protoModule.readTag(p82, var1430)
		local var1435 = var1432
		var1431 = var1433
		var1430 = var1434
		
		if var1431 == protoModule.wireTypes.varint then
			local _ = nil
			local var1436, var1437 = protoModule.readVarInt(p82, var1430)
			local _ = var1436
			var1430 = var1437
			continue
		end
		if var1431 == protoModule.wireTypes.lengthDelimited then
			if var1435 == 1 then
				local _ = nil
				local var1438, var1439 = protoModule.readBuffer(p82, var1430)
				var1430 = var1439
				var1429.kind = { type = "token", value = buffer.tostring(var1438) }
			elseif var1435 == 2 then
				local _ = nil
				local var1440, var1441 = protoModule.readBuffer(p82, var1430)
				var1430 = var1441
				var1429.kind = {
					type = "conditional",
					value = t.TypographyFontProp_ConditionalOptions.decode(var1440)
				}
			else
				local _ = nil
				local var1442, var1443 = protoModule.readVarInt(p82, var1430)
				var1430 = var1443 + var1442
			end
		elseif var1431 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1444, var1445 = protoModule.readFixed32(p82, var1430)
			local _ = var1444
			var1430 = var1445
		elseif var1431 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1446, var1447 = protoModule.readFixed64(p82, var1430)
			local _ = var1446
			var1430 = var1447
		else
			error("Unsupported wire type: " .. var1431)
		end
	end
	return var1429
end

function t_40:jsonEncode() --[[ line: 8495 ]]
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

function t_40:jsonDecode() --[[ line: 8509 ]]
	-- upvalues: t_40 (ref), t (ref)
	local var1449 = t_40.new()
	
	if self.token ~= nil then
		var1449.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1449.kind = {
			type = "conditional",
			value = t.TypographyFontProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1449
end

t_40.descriptor = {
	name = "TypographyFontProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
}
t.TypographyFontProp = t_40
typeRegistryModule.default:register(t.TypographyFontProp)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p83) --[[ line: 8540 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		condition = if p83 == nil or p83.condition == nil then nil else p83.condition,
		kind = if p83 == nil or p83.kind == nil then nil else p83.kind
	}, t_41)
end

function t_41:encode() --[[ line: 8549 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1451 = 0
	
	if self.condition ~= nil then
		local var1452 = self.condition:encode()
		local var1453, var1454 = protoModule.writeTag(buff, var1451, 1, protoModule.wireTypes.lengthDelimited)
		var1453, var1454 = protoModule.writeBuffer(var1453, var1454, var1452, buffer.len(var1452))
		buff = var1453
		var1451 = var1454
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1455, var1456 = protoModule.writeTag(buff, var1451, 2, protoModule.wireTypes.lengthDelimited)
		var1455, var1456 = protoModule.writeString(var1455, var1456, self.kind.value)
		buff = var1455
		var1451 = var1456
	end
	local buff_1 = buffer.create(var1451)
	buffer.copy(buff_1, 0, buff, 0, var1451)
	
	return buff_1
end

function t_41.decode(p84) --[[ line: 8571 ]]
	-- upvalues: t_41 (ref), protoModule (ref), propConditionModule (ref)
	local var1458 = t_41.new()
	local var1459 = 0
	while var1459 < buffer.len(p84) do
		local _ = nil
		local var1460 = nil
		local var1461, var1462, var1463 = protoModule.readTag(p84, var1459)
		local var1464 = var1461
		var1460 = var1462
		var1459 = var1463
		
		if var1460 == protoModule.wireTypes.varint then
			local _ = nil
			local var1465, var1466 = protoModule.readVarInt(p84, var1459)
			local _ = var1465
			var1459 = var1466
			continue
		end
		if var1460 == protoModule.wireTypes.lengthDelimited then
			if var1464 == 1 then
				local _ = nil
				local var1467, var1468 = protoModule.readBuffer(p84, var1459)
				var1459 = var1468
				var1458.condition = propConditionModule.PropCondition.decode(var1467)
			elseif var1464 == 2 then
				local _ = nil
				local var1469, var1470 = protoModule.readBuffer(p84, var1459)
				var1459 = var1470
				var1458.kind = { type = "token", value = buffer.tostring(var1469) }
			else
				local _ = nil
				local var1471, var1472 = protoModule.readVarInt(p84, var1459)
				var1459 = var1472 + var1471
			end
		elseif var1460 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1473, var1474 = protoModule.readFixed32(p84, var1459)
			local _ = var1473
			var1459 = var1474
		elseif var1460 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1475, var1476 = protoModule.readFixed64(p84, var1459)
			local _ = var1475
			var1459 = var1476
		else
			error("Unsupported wire type: " .. var1460)
		end
	end
	return var1458
end

function t_41:jsonEncode() --[[ line: 8619 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_41:jsonDecode() --[[ line: 8635 ]]
	-- upvalues: t_41 (ref), propConditionModule (ref)
	local var1478 = t_41.new()
	
	if self.condition ~= nil then
		var1478.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1478.kind = { type = "token", value = self.token }
	end
	return var1478
end

t_41.descriptor = {
	name = "TypographyFontProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyFontProp_ConditionalOption = t_41
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOption)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p85) --[[ line: 8666 ]]
	-- upvalues: t_42 (ref)
	return setmetatable({
		options = if p85 == nil or p85.options == nil then {} else p85.options
	}, t_42)
end

function t_42:encode() --[[ line: 8674 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1480 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1481 = v:encode()
			local var1482, var1483 = protoModule.writeTag(buff, var1480, 1, protoModule.wireTypes.lengthDelimited)
			var1482, var1483 = protoModule.writeBuffer(var1482, var1483, var1481, buffer.len(var1481))
			buff = var1482
			var1480 = var1483
		end
	end
	local buff_1 = buffer.create(var1480)
	buffer.copy(buff_1, 0, buff, 0, var1480)
	
	return buff_1
end

function t_42.decode(p86) --[[ line: 8691 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1485 = t_42.new()
	local var1486 = 0
	while var1486 < buffer.len(p86) do
		local _ = nil
		local var1487 = nil
		local var1488, var1489, var1490 = protoModule.readTag(p86, var1486)
		local var1491 = var1488
		var1487 = var1489
		var1486 = var1490
		
		if var1487 == protoModule.wireTypes.varint then
			local _ = nil
			local var1492, var1493 = protoModule.readVarInt(p86, var1486)
			local _ = var1492
			var1486 = var1493
			continue
		end
		if var1487 == protoModule.wireTypes.lengthDelimited then
			if var1491 == 1 then
				local _ = nil
				local var1494, var1495 = protoModule.readBuffer(p86, var1486)
				var1486 = var1495
				table.insert(var1485.options, t.TypographyFontProp_ConditionalOption.decode(var1494))
			else
				local _ = nil
				local var1496, var1497 = protoModule.readVarInt(p86, var1486)
				var1486 = var1497 + var1496
			end
		elseif var1487 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1498, var1499 = protoModule.readFixed32(p86, var1486)
			local _ = var1498
			var1486 = var1499
		elseif var1487 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1500, var1501 = protoModule.readFixed64(p86, var1486)
			local _ = var1500
			var1486 = var1501
		else
			error("Unsupported wire type: " .. var1487)
		end
	end
	return var1485
end

function t_42:jsonEncode() --[[ line: 8734 ]]
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

function t_42:jsonDecode() --[[ line: 8748 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1504 = t_42.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyFontProp_ConditionalOption.jsonDecode(v))
		end
		var1504.options = t_1
	end
	return var1504
end

t_42.descriptor = {
	name = "TypographyFontProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyFontProp_ConditionalOptions = t_42
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOptions)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p87) --[[ line: 8779 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		kind = if p87 == nil or p87.kind == nil then nil else p87.kind
	}, t_43)
end

function t_43:encode() --[[ line: 8785 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1507 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1508, var1509 = protoModule.writeTag(buff, var1507, 1, protoModule.wireTypes.lengthDelimited)
			var1508, var1509 = protoModule.writeString(var1508, var1509, self.kind.value)
			buff = var1508
			var1507 = var1509
		elseif self.kind.type == "conditional" then
			local var1510 = self.kind.value:encode()
			local var1511, var1512 = protoModule.writeTag(buff, var1507, 2, protoModule.wireTypes.lengthDelimited)
			var1511, var1512 = protoModule.writeBuffer(var1511, var1512, var1510, buffer.len(var1510))
			buff = var1511
			var1507 = var1512
		end
	end
	local buff_1 = buffer.create(var1507)
	buffer.copy(buff_1, 0, buff, 0, var1507)
	
	return buff_1
end

function t_43.decode(p88) --[[ line: 8805 ]]
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1514 = t_43.new()
	local var1515 = 0
	while var1515 < buffer.len(p88) do
		local _ = nil
		local var1516 = nil
		local var1517, var1518, var1519 = protoModule.readTag(p88, var1515)
		local var1520 = var1517
		var1516 = var1518
		var1515 = var1519
		
		if var1516 == protoModule.wireTypes.varint then
			local _ = nil
			local var1521, var1522 = protoModule.readVarInt(p88, var1515)
			local _ = var1521
			var1515 = var1522
			continue
		end
		if var1516 == protoModule.wireTypes.lengthDelimited then
			if var1520 == 1 then
				local _ = nil
				local var1523, var1524 = protoModule.readBuffer(p88, var1515)
				var1515 = var1524
				var1514.kind = { type = "token", value = buffer.tostring(var1523) }
			elseif var1520 == 2 then
				local _ = nil
				local var1525, var1526 = protoModule.readBuffer(p88, var1515)
				var1515 = var1526
				var1514.kind = {
					type = "conditional",
					value = t.ColorStyleProp_ConditionalOptions.decode(var1525)
				}
			else
				local _ = nil
				local var1527, var1528 = protoModule.readVarInt(p88, var1515)
				var1515 = var1528 + var1527
			end
		elseif var1516 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1529, var1530 = protoModule.readFixed32(p88, var1515)
			local _ = var1529
			var1515 = var1530
		elseif var1516 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1531, var1532 = protoModule.readFixed64(p88, var1515)
			local _ = var1531
			var1515 = var1532
		else
			error("Unsupported wire type: " .. var1516)
		end
	end
	return var1514
end

function t_43:jsonEncode() --[[ line: 8854 ]]
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

function t_43:jsonDecode() --[[ line: 8868 ]]
	-- upvalues: t_43 (ref), t (ref)
	local var1534 = t_43.new()
	
	if self.token ~= nil then
		var1534.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1534.kind = {
			type = "conditional",
			value = t.ColorStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1534
end

t_43.descriptor = {
	name = "ColorStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
}
t.ColorStyleProp = t_43
typeRegistryModule.default:register(t.ColorStyleProp)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p89) --[[ line: 8899 ]]
	-- upvalues: t_44 (ref)
	return setmetatable({
		condition = if p89 == nil or p89.condition == nil then nil else p89.condition,
		kind = if p89 == nil or p89.kind == nil then nil else p89.kind
	}, t_44)
end

function t_44:encode() --[[ line: 8908 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1536 = 0
	
	if self.condition ~= nil then
		local var1537 = self.condition:encode()
		local var1538, var1539 = protoModule.writeTag(buff, var1536, 1, protoModule.wireTypes.lengthDelimited)
		var1538, var1539 = protoModule.writeBuffer(var1538, var1539, var1537, buffer.len(var1537))
		buff = var1538
		var1536 = var1539
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1540, var1541 = protoModule.writeTag(buff, var1536, 2, protoModule.wireTypes.lengthDelimited)
		var1540, var1541 = protoModule.writeString(var1540, var1541, self.kind.value)
		buff = var1540
		var1536 = var1541
	end
	local buff_1 = buffer.create(var1536)
	buffer.copy(buff_1, 0, buff, 0, var1536)
	
	return buff_1
end

function t_44.decode(p90) --[[ line: 8930 ]]
	-- upvalues: t_44 (ref), protoModule (ref), propConditionModule (ref)
	local var1543 = t_44.new()
	local var1544 = 0
	while var1544 < buffer.len(p90) do
		local _ = nil
		local var1545 = nil
		local var1546, var1547, var1548 = protoModule.readTag(p90, var1544)
		local var1549 = var1546
		var1545 = var1547
		var1544 = var1548
		
		if var1545 == protoModule.wireTypes.varint then
			local _ = nil
			local var1550, var1551 = protoModule.readVarInt(p90, var1544)
			local _ = var1550
			var1544 = var1551
			continue
		end
		if var1545 == protoModule.wireTypes.lengthDelimited then
			if var1549 == 1 then
				local _ = nil
				local var1552, var1553 = protoModule.readBuffer(p90, var1544)
				var1544 = var1553
				var1543.condition = propConditionModule.PropCondition.decode(var1552)
			elseif var1549 == 2 then
				local _ = nil
				local var1554, var1555 = protoModule.readBuffer(p90, var1544)
				var1544 = var1555
				var1543.kind = { type = "token", value = buffer.tostring(var1554) }
			else
				local _ = nil
				local var1556, var1557 = protoModule.readVarInt(p90, var1544)
				var1544 = var1557 + var1556
			end
		elseif var1545 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1558, var1559 = protoModule.readFixed32(p90, var1544)
			local _ = var1558
			var1544 = var1559
		elseif var1545 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1560, var1561 = protoModule.readFixed64(p90, var1544)
			local _ = var1560
			var1544 = var1561
		else
			error("Unsupported wire type: " .. var1545)
		end
	end
	return var1543
end

function t_44:jsonEncode() --[[ line: 8978 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_44:jsonDecode() --[[ line: 8994 ]]
	-- upvalues: t_44 (ref), propConditionModule (ref)
	local var1563 = t_44.new()
	
	if self.condition ~= nil then
		var1563.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1563.kind = { type = "token", value = self.token }
	end
	return var1563
end

t_44.descriptor = {
	name = "ColorStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorStyleProp_ConditionalOption = t_44
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOption)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p91) --[[ line: 9025 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		options = if p91 == nil or p91.options == nil then {} else p91.options
	}, t_45)
end

function t_45:encode() --[[ line: 9033 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1565 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1566 = v:encode()
			local var1567, var1568 = protoModule.writeTag(buff, var1565, 1, protoModule.wireTypes.lengthDelimited)
			var1567, var1568 = protoModule.writeBuffer(var1567, var1568, var1566, buffer.len(var1566))
			buff = var1567
			var1565 = var1568
		end
	end
	local buff_1 = buffer.create(var1565)
	buffer.copy(buff_1, 0, buff, 0, var1565)
	
	return buff_1
end

function t_45.decode(p92) --[[ line: 9050 ]]
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1570 = t_45.new()
	local var1571 = 0
	while var1571 < buffer.len(p92) do
		local _ = nil
		local var1572 = nil
		local var1573, var1574, var1575 = protoModule.readTag(p92, var1571)
		local var1576 = var1573
		var1572 = var1574
		var1571 = var1575
		
		if var1572 == protoModule.wireTypes.varint then
			local _ = nil
			local var1577, var1578 = protoModule.readVarInt(p92, var1571)
			local _ = var1577
			var1571 = var1578
			continue
		end
		if var1572 == protoModule.wireTypes.lengthDelimited then
			if var1576 == 1 then
				local _ = nil
				local var1579, var1580 = protoModule.readBuffer(p92, var1571)
				var1571 = var1580
				table.insert(var1570.options, t.ColorStyleProp_ConditionalOption.decode(var1579))
			else
				local _ = nil
				local var1581, var1582 = protoModule.readVarInt(p92, var1571)
				var1571 = var1582 + var1581
			end
		elseif var1572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1583, var1584 = protoModule.readFixed32(p92, var1571)
			local _ = var1583
			var1571 = var1584
		elseif var1572 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1585, var1586 = protoModule.readFixed64(p92, var1571)
			local _ = var1585
			var1571 = var1586
		else
			error("Unsupported wire type: " .. var1572)
		end
	end
	return var1570
end

function t_45:jsonEncode() --[[ line: 9093 ]]
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

function t_45:jsonDecode() --[[ line: 9107 ]]
	-- upvalues: t_45 (ref), t (ref)
	local var1589 = t_45.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorStyleProp_ConditionalOption.jsonDecode(v))
		end
		var1589.options = t_1
	end
	return var1589
end

t_45.descriptor = {
	name = "ColorStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorStyleProp_ConditionalOptions = t_45
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOptions)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p93) --[[ line: 9138 ]]
	-- upvalues: t_46 (ref)
	return setmetatable({
		kind = if p93 == nil or p93.kind == nil then nil else p93.kind
	}, t_46)
end

function t_46:encode() --[[ line: 9144 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1592 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1593, var1594 = protoModule.writeTag(buff, var1592, 1, protoModule.wireTypes.lengthDelimited)
			var1593, var1594 = protoModule.writeString(var1593, var1594, self.kind.value)
			buff = var1593
			var1592 = var1594
		elseif self.kind.type == "conditional" then
			local var1595 = self.kind.value:encode()
			local var1596, var1597 = protoModule.writeTag(buff, var1592, 2, protoModule.wireTypes.lengthDelimited)
			var1596, var1597 = protoModule.writeBuffer(var1596, var1597, var1595, buffer.len(var1595))
			buff = var1596
			var1592 = var1597
		elseif self.kind.type == "binding_path" then
			local var1598, var1599 = protoModule.writeTag(buff, var1592, 3, protoModule.wireTypes.lengthDelimited)
			var1598, var1599 = protoModule.writeString(var1598, var1599, self.kind.value)
			buff = var1598
			var1592 = var1599
		end
	end
	local buff_1 = buffer.create(var1592)
	buffer.copy(buff_1, 0, buff, 0, var1592)
	
	return buff_1
end

function t_46.decode(p94) --[[ line: 9167 ]]
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1601 = t_46.new()
	local var1602 = 0
	while var1602 < buffer.len(p94) do
		local _ = nil
		local var1603 = nil
		local var1604, var1605, var1606 = protoModule.readTag(p94, var1602)
		local var1607 = var1604
		var1603 = var1605
		var1602 = var1606
		
		if var1603 == protoModule.wireTypes.varint then
			local _ = nil
			local var1608, var1609 = protoModule.readVarInt(p94, var1602)
			local _ = var1608
			var1602 = var1609
			continue
		end
		if var1603 == protoModule.wireTypes.lengthDelimited then
			if var1607 == 1 then
				local _ = nil
				local var1610, var1611 = protoModule.readBuffer(p94, var1602)
				var1602 = var1611
				var1601.kind = { type = "literal", value = buffer.tostring(var1610) }
			elseif var1607 == 2 then
				local _ = nil
				local var1612, var1613 = protoModule.readBuffer(p94, var1602)
				var1602 = var1613
				var1601.kind = {
					type = "conditional",
					value = t.FillBehaviorProp_ConditionalOptions.decode(var1612)
				}
			elseif var1607 == 3 then
				local _ = nil
				local var1614, var1615 = protoModule.readBuffer(p94, var1602)
				var1602 = var1615
				var1601.kind = { type = "binding_path", value = buffer.tostring(var1614) }
			else
				local _ = nil
				local var1616, var1617 = protoModule.readVarInt(p94, var1602)
				var1602 = var1617 + var1616
			end
		elseif var1603 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1618, var1619 = protoModule.readFixed32(p94, var1602)
			local _ = var1618
			var1602 = var1619
		elseif var1603 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1620, var1621 = protoModule.readFixed64(p94, var1602)
			local _ = var1620
			var1602 = var1621
		else
			error("Unsupported wire type: " .. var1603)
		end
	end
	return var1601
end

function t_46:jsonEncode() --[[ line: 9221 ]]
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

function t_46:jsonDecode() --[[ line: 9237 ]]
	-- upvalues: t_46 (ref), t (ref)
	local var1623 = t_46.new()
	
	if self.literal ~= nil then
		var1623.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1623.kind = {
			type = "conditional",
			value = t.FillBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1623.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1623.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1623
end

t_46.descriptor = {
	name = "FillBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
}
t.FillBehaviorProp = t_46
typeRegistryModule.default:register(t.FillBehaviorProp)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p95) --[[ line: 9276 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		condition = if p95 == nil or p95.condition == nil then nil else p95.condition,
		kind = if p95 == nil or p95.kind == nil then nil else p95.kind
	}, t_47)
end

function t_47:encode() --[[ line: 9285 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1625 = 0
	
	if self.condition ~= nil then
		local var1626 = self.condition:encode()
		local var1627, var1628 = protoModule.writeTag(buff, var1625, 1, protoModule.wireTypes.lengthDelimited)
		var1627, var1628 = protoModule.writeBuffer(var1627, var1628, var1626, buffer.len(var1626))
		buff = var1627
		var1625 = var1628
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1629, var1630 = protoModule.writeTag(buff, var1625, 2, protoModule.wireTypes.lengthDelimited)
			var1629, var1630 = protoModule.writeString(var1629, var1630, self.kind.value)
			buff = var1629
			var1625 = var1630
		elseif self.kind.type == "binding_path" then
			local var1631, var1632 = protoModule.writeTag(buff, var1625, 3, protoModule.wireTypes.lengthDelimited)
			var1631, var1632 = protoModule.writeString(var1631, var1632, self.kind.value)
			buff = var1631
			var1625 = var1632
		end
	end
	local buff_1 = buffer.create(var1625)
	buffer.copy(buff_1, 0, buff, 0, var1625)
	
	return buff_1
end

function t_47.decode(p96) --[[ line: 9310 ]]
	-- upvalues: t_47 (ref), protoModule (ref), propConditionModule (ref)
	local var1634 = t_47.new()
	local var1635 = 0
	while var1635 < buffer.len(p96) do
		local _ = nil
		local var1636 = nil
		local var1637, var1638, var1639 = protoModule.readTag(p96, var1635)
		local var1640 = var1637
		var1636 = var1638
		var1635 = var1639
		
		if var1636 == protoModule.wireTypes.varint then
			local _ = nil
			local var1641, var1642 = protoModule.readVarInt(p96, var1635)
			local _ = var1641
			var1635 = var1642
			continue
		end
		if var1636 == protoModule.wireTypes.lengthDelimited then
			if var1640 == 1 then
				local _ = nil
				local var1643, var1644 = protoModule.readBuffer(p96, var1635)
				var1635 = var1644
				var1634.condition = propConditionModule.PropCondition.decode(var1643)
			elseif var1640 == 2 then
				local _ = nil
				local var1645, var1646 = protoModule.readBuffer(p96, var1635)
				var1635 = var1646
				var1634.kind = { type = "literal", value = buffer.tostring(var1645) }
			elseif var1640 == 3 then
				local _ = nil
				local var1647, var1648 = protoModule.readBuffer(p96, var1635)
				var1635 = var1648
				var1634.kind = { type = "binding_path", value = buffer.tostring(var1647) }
			else
				local _ = nil
				local var1649, var1650 = protoModule.readVarInt(p96, var1635)
				var1635 = var1650 + var1649
			end
		elseif var1636 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1651, var1652 = protoModule.readFixed32(p96, var1635)
			local _ = var1651
			var1635 = var1652
		elseif var1636 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1653, var1654 = protoModule.readFixed64(p96, var1635)
			local _ = var1653
			var1635 = var1654
		else
			error("Unsupported wire type: " .. var1636)
		end
	end
	return var1634
end

function t_47:jsonEncode() --[[ line: 9363 ]]
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

function t_47:jsonDecode() --[[ line: 9381 ]]
	-- upvalues: t_47 (ref), propConditionModule (ref)
	local var1656 = t_47.new()
	
	if self.condition ~= nil then
		var1656.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1656.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1656.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1656.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1656
end

t_47.descriptor = {
	name = "FillBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FillBehaviorProp_ConditionalOption = t_47
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOption)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p97) --[[ line: 9420 ]]
	-- upvalues: t_48 (ref)
	return setmetatable({
		options = if p97 == nil or p97.options == nil then {} else p97.options
	}, t_48)
end

function t_48:encode() --[[ line: 9428 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1658 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1659 = v:encode()
			local var1660, var1661 = protoModule.writeTag(buff, var1658, 1, protoModule.wireTypes.lengthDelimited)
			var1660, var1661 = protoModule.writeBuffer(var1660, var1661, var1659, buffer.len(var1659))
			buff = var1660
			var1658 = var1661
		end
	end
	local buff_1 = buffer.create(var1658)
	buffer.copy(buff_1, 0, buff, 0, var1658)
	
	return buff_1
end

function t_48.decode(p98) --[[ line: 9445 ]]
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1663 = t_48.new()
	local var1664 = 0
	while var1664 < buffer.len(p98) do
		local _ = nil
		local var1665 = nil
		local var1666, var1667, var1668 = protoModule.readTag(p98, var1664)
		local var1669 = var1666
		var1665 = var1667
		var1664 = var1668
		
		if var1665 == protoModule.wireTypes.varint then
			local _ = nil
			local var1670, var1671 = protoModule.readVarInt(p98, var1664)
			local _ = var1670
			var1664 = var1671
			continue
		end
		if var1665 == protoModule.wireTypes.lengthDelimited then
			if var1669 == 1 then
				local _ = nil
				local var1672, var1673 = protoModule.readBuffer(p98, var1664)
				var1664 = var1673
				table.insert(var1663.options, t.FillBehaviorProp_ConditionalOption.decode(var1672))
			else
				local _ = nil
				local var1674, var1675 = protoModule.readVarInt(p98, var1664)
				var1664 = var1675 + var1674
			end
		elseif var1665 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1676, var1677 = protoModule.readFixed32(p98, var1664)
			local _ = var1676
			var1664 = var1677
		elseif var1665 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1678, var1679 = protoModule.readFixed64(p98, var1664)
			local _ = var1678
			var1664 = var1679
		else
			error("Unsupported wire type: " .. var1665)
		end
	end
	return var1663
end

function t_48:jsonEncode() --[[ line: 9488 ]]
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

function t_48:jsonDecode() --[[ line: 9502 ]]
	-- upvalues: t_48 (ref), t (ref)
	local var1682 = t_48.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FillBehaviorProp_ConditionalOption.jsonDecode(v))
		end
		var1682.options = t_1
	end
	return var1682
end

t_48.descriptor = {
	name = "FillBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FillBehaviorProp_ConditionalOptions = t_48
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOptions)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p99) --[[ line: 9533 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		kind = if p99 == nil or p99.kind == nil then nil else p99.kind
	}, t_49)
end

function t_49:encode() --[[ line: 9539 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1685 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1686, var1687 = protoModule.writeTag(buff, var1685, 1, protoModule.wireTypes.lengthDelimited)
			var1686, var1687 = protoModule.writeString(var1686, var1687, self.kind.value)
			buff = var1686
			var1685 = var1687
		elseif self.kind.type == "conditional" then
			local var1688 = self.kind.value:encode()
			local var1689, var1690 = protoModule.writeTag(buff, var1685, 2, protoModule.wireTypes.lengthDelimited)
			var1689, var1690 = protoModule.writeBuffer(var1689, var1690, var1688, buffer.len(var1688))
			buff = var1689
			var1685 = var1690
		elseif self.kind.type == "binding_path" then
			local var1691, var1692 = protoModule.writeTag(buff, var1685, 3, protoModule.wireTypes.lengthDelimited)
			var1691, var1692 = protoModule.writeString(var1691, var1692, self.kind.value)
			buff = var1691
			var1685 = var1692
		end
	end
	local buff_1 = buffer.create(var1685)
	buffer.copy(buff_1, 0, buff, 0, var1685)
	
	return buff_1
end

function t_49.decode(p100) --[[ line: 9562 ]]
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1694 = t_49.new()
	local var1695 = 0
	while var1695 < buffer.len(p100) do
		local _ = nil
		local var1696 = nil
		local var1697, var1698, var1699 = protoModule.readTag(p100, var1695)
		local var1700 = var1697
		var1696 = var1698
		var1695 = var1699
		
		if var1696 == protoModule.wireTypes.varint then
			local _ = nil
			local var1701, var1702 = protoModule.readVarInt(p100, var1695)
			local _ = var1701
			var1695 = var1702
			continue
		end
		if var1696 == protoModule.wireTypes.lengthDelimited then
			if var1700 == 1 then
				local _ = nil
				local var1703, var1704 = protoModule.readBuffer(p100, var1695)
				var1695 = var1704
				var1694.kind = { type = "literal", value = buffer.tostring(var1703) }
			elseif var1700 == 2 then
				local _ = nil
				local var1705, var1706 = protoModule.readBuffer(p100, var1695)
				var1695 = var1706
				var1694.kind = {
					type = "conditional",
					value = t.InputSizeProp_ConditionalOptions.decode(var1705)
				}
			elseif var1700 == 3 then
				local _ = nil
				local var1707, var1708 = protoModule.readBuffer(p100, var1695)
				var1695 = var1708
				var1694.kind = { type = "binding_path", value = buffer.tostring(var1707) }
			else
				local _ = nil
				local var1709, var1710 = protoModule.readVarInt(p100, var1695)
				var1695 = var1710 + var1709
			end
		elseif var1696 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1711, var1712 = protoModule.readFixed32(p100, var1695)
			local _ = var1711
			var1695 = var1712
		elseif var1696 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1713, var1714 = protoModule.readFixed64(p100, var1695)
			local _ = var1713
			var1695 = var1714
		else
			error("Unsupported wire type: " .. var1696)
		end
	end
	return var1694
end

function t_49:jsonEncode() --[[ line: 9616 ]]
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

function t_49:jsonDecode() --[[ line: 9632 ]]
	-- upvalues: t_49 (ref), t (ref)
	local var1716 = t_49.new()
	
	if self.literal ~= nil then
		var1716.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1716.kind = {
			type = "conditional",
			value = t.InputSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1716.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1716.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1716
end

t_49.descriptor = {
	name = "InputSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
}
t.InputSizeProp = t_49
typeRegistryModule.default:register(t.InputSizeProp)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p101) --[[ line: 9671 ]]
	-- upvalues: t_50 (ref)
	return setmetatable({
		condition = if p101 == nil or p101.condition == nil then nil else p101.condition,
		kind = if p101 == nil or p101.kind == nil then nil else p101.kind
	}, t_50)
end

function t_50:encode() --[[ line: 9680 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1718 = 0
	
	if self.condition ~= nil then
		local var1719 = self.condition:encode()
		local var1720, var1721 = protoModule.writeTag(buff, var1718, 1, protoModule.wireTypes.lengthDelimited)
		var1720, var1721 = protoModule.writeBuffer(var1720, var1721, var1719, buffer.len(var1719))
		buff = var1720
		var1718 = var1721
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1722, var1723 = protoModule.writeTag(buff, var1718, 2, protoModule.wireTypes.lengthDelimited)
			var1722, var1723 = protoModule.writeString(var1722, var1723, self.kind.value)
			buff = var1722
			var1718 = var1723
		elseif self.kind.type == "binding_path" then
			local var1724, var1725 = protoModule.writeTag(buff, var1718, 3, protoModule.wireTypes.lengthDelimited)
			var1724, var1725 = protoModule.writeString(var1724, var1725, self.kind.value)
			buff = var1724
			var1718 = var1725
		end
	end
	local buff_1 = buffer.create(var1718)
	buffer.copy(buff_1, 0, buff, 0, var1718)
	
	return buff_1
end

function t_50.decode(p102) --[[ line: 9705 ]]
	-- upvalues: t_50 (ref), protoModule (ref), propConditionModule (ref)
	local var1727 = t_50.new()
	local var1728 = 0
	while var1728 < buffer.len(p102) do
		local _ = nil
		local var1729 = nil
		local var1730, var1731, var1732 = protoModule.readTag(p102, var1728)
		local var1733 = var1730
		var1729 = var1731
		var1728 = var1732
		
		if var1729 == protoModule.wireTypes.varint then
			local _ = nil
			local var1734, var1735 = protoModule.readVarInt(p102, var1728)
			local _ = var1734
			var1728 = var1735
			continue
		end
		if var1729 == protoModule.wireTypes.lengthDelimited then
			if var1733 == 1 then
				local _ = nil
				local var1736, var1737 = protoModule.readBuffer(p102, var1728)
				var1728 = var1737
				var1727.condition = propConditionModule.PropCondition.decode(var1736)
			elseif var1733 == 2 then
				local _ = nil
				local var1738, var1739 = protoModule.readBuffer(p102, var1728)
				var1728 = var1739
				var1727.kind = { type = "literal", value = buffer.tostring(var1738) }
			elseif var1733 == 3 then
				local _ = nil
				local var1740, var1741 = protoModule.readBuffer(p102, var1728)
				var1728 = var1741
				var1727.kind = { type = "binding_path", value = buffer.tostring(var1740) }
			else
				local _ = nil
				local var1742, var1743 = protoModule.readVarInt(p102, var1728)
				var1728 = var1743 + var1742
			end
		elseif var1729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1744, var1745 = protoModule.readFixed32(p102, var1728)
			local _ = var1744
			var1728 = var1745
		elseif var1729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1746, var1747 = protoModule.readFixed64(p102, var1728)
			local _ = var1746
			var1728 = var1747
		else
			error("Unsupported wire type: " .. var1729)
		end
	end
	return var1727
end

function t_50:jsonEncode() --[[ line: 9758 ]]
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

function t_50:jsonDecode() --[[ line: 9776 ]]
	-- upvalues: t_50 (ref), propConditionModule (ref)
	local var1749 = t_50.new()
	
	if self.condition ~= nil then
		var1749.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1749.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1749.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1749.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1749
end

t_50.descriptor = {
	name = "InputSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.InputSizeProp_ConditionalOption = t_50
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOption)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p103) --[[ line: 9813 ]]
	-- upvalues: t_51 (ref)
	return setmetatable({
		options = if p103 == nil or p103.options == nil then {} else p103.options
	}, t_51)
end

function t_51:encode() --[[ line: 9821 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1751 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1752 = v:encode()
			local var1753, var1754 = protoModule.writeTag(buff, var1751, 1, protoModule.wireTypes.lengthDelimited)
			var1753, var1754 = protoModule.writeBuffer(var1753, var1754, var1752, buffer.len(var1752))
			buff = var1753
			var1751 = var1754
		end
	end
	local buff_1 = buffer.create(var1751)
	buffer.copy(buff_1, 0, buff, 0, var1751)
	
	return buff_1
end

function t_51.decode(p104) --[[ line: 9838 ]]
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1756 = t_51.new()
	local var1757 = 0
	while var1757 < buffer.len(p104) do
		local _ = nil
		local var1758 = nil
		local var1759, var1760, var1761 = protoModule.readTag(p104, var1757)
		local var1762 = var1759
		var1758 = var1760
		var1757 = var1761
		
		if var1758 == protoModule.wireTypes.varint then
			local _ = nil
			local var1763, var1764 = protoModule.readVarInt(p104, var1757)
			local _ = var1763
			var1757 = var1764
			continue
		end
		if var1758 == protoModule.wireTypes.lengthDelimited then
			if var1762 == 1 then
				local _ = nil
				local var1765, var1766 = protoModule.readBuffer(p104, var1757)
				var1757 = var1766
				table.insert(var1756.options, t.InputSizeProp_ConditionalOption.decode(var1765))
			else
				local _ = nil
				local var1767, var1768 = protoModule.readVarInt(p104, var1757)
				var1757 = var1768 + var1767
			end
		elseif var1758 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1769, var1770 = protoModule.readFixed32(p104, var1757)
			local _ = var1769
			var1757 = var1770
		elseif var1758 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1771, var1772 = protoModule.readFixed64(p104, var1757)
			local _ = var1771
			var1757 = var1772
		else
			error("Unsupported wire type: " .. var1758)
		end
	end
	return var1756
end

function t_51:jsonEncode() --[[ line: 9881 ]]
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

function t_51:jsonDecode() --[[ line: 9895 ]]
	-- upvalues: t_51 (ref), t (ref)
	local var1775 = t_51.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.InputSizeProp_ConditionalOption.jsonDecode(v))
		end
		var1775.options = t_1
	end
	return var1775
end

t_51.descriptor = {
	name = "InputSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.InputSizeProp_ConditionalOptions = t_51
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOptions)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p105) --[[ line: 9926 ]]
	-- upvalues: t_52 (ref)
	return setmetatable({
		kind = if p105 == nil or p105.kind == nil then nil else p105.kind
	}, t_52)
end

function t_52:encode() --[[ line: 9932 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1778 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1779, var1780 = protoModule.writeTag(buff, var1778, 1, protoModule.wireTypes.lengthDelimited)
			var1779, var1780 = protoModule.writeString(var1779, var1780, self.kind.value)
			buff = var1779
			var1778 = var1780
		elseif self.kind.type == "token" then
			local var1781, var1782 = protoModule.writeTag(buff, var1778, 2, protoModule.wireTypes.lengthDelimited)
			var1781, var1782 = protoModule.writeString(var1781, var1782, self.kind.value)
			buff = var1781
			var1778 = var1782
		elseif self.kind.type == "conditional" then
			local var1783 = self.kind.value:encode()
			local var1784, var1785 = protoModule.writeTag(buff, var1778, 3, protoModule.wireTypes.lengthDelimited)
			var1784, var1785 = protoModule.writeBuffer(var1784, var1785, var1783, buffer.len(var1783))
			buff = var1784
			var1778 = var1785
		elseif self.kind.type == "binding_path" then
			local var1786, var1787 = protoModule.writeTag(buff, var1778, 4, protoModule.wireTypes.lengthDelimited)
			var1786, var1787 = protoModule.writeString(var1786, var1787, self.kind.value)
			buff = var1786
			var1778 = var1787
		end
	end
	local buff_1 = buffer.create(var1778)
	buffer.copy(buff_1, 0, buff, 0, var1778)
	
	return buff_1
end

function t_52.decode(p106) --[[ line: 9958 ]]
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1789 = t_52.new()
	local var1790 = 0
	while var1790 < buffer.len(p106) do
		local _ = nil
		local var1791 = nil
		local var1792, var1793, var1794 = protoModule.readTag(p106, var1790)
		local var1795 = var1792
		var1791 = var1793
		var1790 = var1794
		
		if var1791 == protoModule.wireTypes.varint then
			local _ = nil
			local var1796, var1797 = protoModule.readVarInt(p106, var1790)
			local _ = var1796
			var1790 = var1797
			continue
		end
		if var1791 == protoModule.wireTypes.lengthDelimited then
			if var1795 == 1 then
				local _ = nil
				local var1798, var1799 = protoModule.readBuffer(p106, var1790)
				var1790 = var1799
				var1789.kind = { type = "literal", value = buffer.tostring(var1798) }
			elseif var1795 == 2 then
				local _ = nil
				local var1800, var1801 = protoModule.readBuffer(p106, var1790)
				var1790 = var1801
				var1789.kind = { type = "token", value = buffer.tostring(var1800) }
			elseif var1795 == 3 then
				local _ = nil
				local var1802, var1803 = protoModule.readBuffer(p106, var1790)
				var1790 = var1803
				var1789.kind = {
					type = "conditional",
					value = t.UDimProp_ConditionalOptions.decode(var1802)
				}
			elseif var1795 == 4 then
				local _ = nil
				local var1804, var1805 = protoModule.readBuffer(p106, var1790)
				var1790 = var1805
				var1789.kind = { type = "binding_path", value = buffer.tostring(var1804) }
			else
				local _ = nil
				local var1806, var1807 = protoModule.readVarInt(p106, var1790)
				var1790 = var1807 + var1806
			end
		elseif var1791 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed32(p106, var1790)
			local _ = var1808
			var1790 = var1809
		elseif var1791 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1810, var1811 = protoModule.readFixed64(p106, var1790)
			local _ = var1810
			var1790 = var1811
		else
			error("Unsupported wire type: " .. var1791)
		end
	end
	return var1789
end

function t_52:jsonEncode() --[[ line: 10016 ]]
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

function t_52:jsonDecode() --[[ line: 10034 ]]
	-- upvalues: t_52 (ref), t (ref)
	local var1813 = t_52.new()
	
	if self.literal ~= nil then
		var1813.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1813.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1813.kind = {
			type = "conditional",
			value = t.UDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1813.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1813.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1813
end

t_52.descriptor = {
	name = "UDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
}
t.UDimProp = t_52
typeRegistryModule.default:register(t.UDimProp)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p107) --[[ line: 10075 ]]
	-- upvalues: t_53 (ref)
	return setmetatable({
		condition = if p107 == nil or p107.condition == nil then nil else p107.condition,
		kind = if p107 == nil or p107.kind == nil then nil else p107.kind
	}, t_53)
end

function t_53:encode() --[[ line: 10084 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1815 = 0
	
	if self.condition ~= nil then
		local var1816 = self.condition:encode()
		local var1817, var1818 = protoModule.writeTag(buff, var1815, 1, protoModule.wireTypes.lengthDelimited)
		var1817, var1818 = protoModule.writeBuffer(var1817, var1818, var1816, buffer.len(var1816))
		buff = var1817
		var1815 = var1818
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1819, var1820 = protoModule.writeTag(buff, var1815, 2, protoModule.wireTypes.lengthDelimited)
			var1819, var1820 = protoModule.writeString(var1819, var1820, self.kind.value)
			buff = var1819
			var1815 = var1820
		elseif self.kind.type == "token" then
			local var1821, var1822 = protoModule.writeTag(buff, var1815, 3, protoModule.wireTypes.lengthDelimited)
			var1821, var1822 = protoModule.writeString(var1821, var1822, self.kind.value)
			buff = var1821
			var1815 = var1822
		elseif self.kind.type == "binding_path" then
			local var1823, var1824 = protoModule.writeTag(buff, var1815, 4, protoModule.wireTypes.lengthDelimited)
			var1823, var1824 = protoModule.writeString(var1823, var1824, self.kind.value)
			buff = var1823
			var1815 = var1824
		end
	end
	local buff_1 = buffer.create(var1815)
	buffer.copy(buff_1, 0, buff, 0, var1815)
	
	return buff_1
end

function t_53.decode(p108) --[[ line: 10112 ]]
	-- upvalues: t_53 (ref), protoModule (ref), propConditionModule (ref)
	local var1826 = t_53.new()
	local var1827 = 0
	while var1827 < buffer.len(p108) do
		local _ = nil
		local var1828 = nil
		local var1829, var1830, var1831 = protoModule.readTag(p108, var1827)
		local var1832 = var1829
		var1828 = var1830
		var1827 = var1831
		
		if var1828 == protoModule.wireTypes.varint then
			local _ = nil
			local var1833, var1834 = protoModule.readVarInt(p108, var1827)
			local _ = var1833
			var1827 = var1834
			continue
		end
		if var1828 == protoModule.wireTypes.lengthDelimited then
			if var1832 == 1 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p108, var1827)
				var1827 = var1836
				var1826.condition = propConditionModule.PropCondition.decode(var1835)
			elseif var1832 == 2 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p108, var1827)
				var1827 = var1838
				var1826.kind = { type = "literal", value = buffer.tostring(var1837) }
			elseif var1832 == 3 then
				local _ = nil
				local var1839, var1840 = protoModule.readBuffer(p108, var1827)
				var1827 = var1840
				var1826.kind = { type = "token", value = buffer.tostring(var1839) }
			elseif var1832 == 4 then
				local _ = nil
				local var1841, var1842 = protoModule.readBuffer(p108, var1827)
				var1827 = var1842
				var1826.kind = { type = "binding_path", value = buffer.tostring(var1841) }
			else
				local _ = nil
				local var1843, var1844 = protoModule.readVarInt(p108, var1827)
				var1827 = var1844 + var1843
			end
		elseif var1828 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1845, var1846 = protoModule.readFixed32(p108, var1827)
			local _ = var1845
			var1827 = var1846
		elseif var1828 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1847, var1848 = protoModule.readFixed64(p108, var1827)
			local _ = var1847
			var1827 = var1848
		else
			error("Unsupported wire type: " .. var1828)
		end
	end
	return var1826
end

function t_53:jsonEncode() --[[ line: 10170 ]]
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

function t_53:jsonDecode() --[[ line: 10190 ]]
	-- upvalues: t_53 (ref), propConditionModule (ref)
	local var1850 = t_53.new()
	
	if self.condition ~= nil then
		var1850.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1850.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1850.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1850.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1850.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1850
end

t_53.descriptor = {
	name = "UDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDimProp_ConditionalOption = t_53
typeRegistryModule.default:register(t.UDimProp_ConditionalOption)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p109) --[[ line: 10231 ]]
	-- upvalues: t_54 (ref)
	return setmetatable({
		options = if p109 == nil or p109.options == nil then {} else p109.options
	}, t_54)
end

function t_54:encode() --[[ line: 10239 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1852 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1853 = v:encode()
			local var1854, var1855 = protoModule.writeTag(buff, var1852, 1, protoModule.wireTypes.lengthDelimited)
			var1854, var1855 = protoModule.writeBuffer(var1854, var1855, var1853, buffer.len(var1853))
			buff = var1854
			var1852 = var1855
		end
	end
	local buff_1 = buffer.create(var1852)
	buffer.copy(buff_1, 0, buff, 0, var1852)
	
	return buff_1
end

function t_54.decode(p110) --[[ line: 10256 ]]
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1857 = t_54.new()
	local var1858 = 0
	while var1858 < buffer.len(p110) do
		local _ = nil
		local var1859 = nil
		local var1860, var1861, var1862 = protoModule.readTag(p110, var1858)
		local var1863 = var1860
		var1859 = var1861
		var1858 = var1862
		
		if var1859 == protoModule.wireTypes.varint then
			local _ = nil
			local var1864, var1865 = protoModule.readVarInt(p110, var1858)
			local _ = var1864
			var1858 = var1865
			continue
		end
		if var1859 == protoModule.wireTypes.lengthDelimited then
			if var1863 == 1 then
				local _ = nil
				local var1866, var1867 = protoModule.readBuffer(p110, var1858)
				var1858 = var1867
				table.insert(var1857.options, t.UDimProp_ConditionalOption.decode(var1866))
			else
				local _ = nil
				local var1868, var1869 = protoModule.readVarInt(p110, var1858)
				var1858 = var1869 + var1868
			end
		elseif var1859 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1870, var1871 = protoModule.readFixed32(p110, var1858)
			local _ = var1870
			var1858 = var1871
		elseif var1859 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1872, var1873 = protoModule.readFixed64(p110, var1858)
			local _ = var1872
			var1858 = var1873
		else
			error("Unsupported wire type: " .. var1859)
		end
	end
	return var1857
end

function t_54:jsonEncode() --[[ line: 10299 ]]
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

function t_54:jsonDecode() --[[ line: 10313 ]]
	-- upvalues: t_54 (ref), t (ref)
	local var1876 = t_54.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDimProp_ConditionalOption.jsonDecode(v))
		end
		var1876.options = t_1
	end
	return var1876
end

t_54.descriptor = {
	name = "UDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDimProp_ConditionalOptions = t_54
typeRegistryModule.default:register(t.UDimProp_ConditionalOptions)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p111) --[[ line: 10342 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		kind = if p111 == nil or p111.kind == nil then nil else p111.kind
	}, t_55)
end

function t_55:encode() --[[ line: 10348 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1879 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1880, var1881 = protoModule.writeTag(buff, var1879, 1, protoModule.wireTypes.lengthDelimited)
			var1880, var1881 = protoModule.writeString(var1880, var1881, self.kind.value)
			buff = var1880
			var1879 = var1881
		elseif self.kind.type == "token" then
			local var1882, var1883 = protoModule.writeTag(buff, var1879, 2, protoModule.wireTypes.lengthDelimited)
			var1882, var1883 = protoModule.writeString(var1882, var1883, self.kind.value)
			buff = var1882
			var1879 = var1883
		elseif self.kind.type == "conditional" then
			local var1884 = self.kind.value:encode()
			local var1885, var1886 = protoModule.writeTag(buff, var1879, 3, protoModule.wireTypes.lengthDelimited)
			var1885, var1886 = protoModule.writeBuffer(var1885, var1886, var1884, buffer.len(var1884))
			buff = var1885
			var1879 = var1886
		elseif self.kind.type == "binding_path" then
			local var1887, var1888 = protoModule.writeTag(buff, var1879, 4, protoModule.wireTypes.lengthDelimited)
			var1887, var1888 = protoModule.writeString(var1887, var1888, self.kind.value)
			buff = var1887
			var1879 = var1888
		end
	end
	local buff_1 = buffer.create(var1879)
	buffer.copy(buff_1, 0, buff, 0, var1879)
	
	return buff_1
end

function t_55.decode(p112) --[[ line: 10374 ]]
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1890 = t_55.new()
	local var1891 = 0
	while var1891 < buffer.len(p112) do
		local _ = nil
		local var1892 = nil
		local var1893, var1894, var1895 = protoModule.readTag(p112, var1891)
		local var1896 = var1893
		var1892 = var1894
		var1891 = var1895
		
		if var1892 == protoModule.wireTypes.varint then
			local _ = nil
			local var1897, var1898 = protoModule.readVarInt(p112, var1891)
			local _ = var1897
			var1891 = var1898
			continue
		end
		if var1892 == protoModule.wireTypes.lengthDelimited then
			if var1896 == 1 then
				local _ = nil
				local var1899, var1900 = protoModule.readBuffer(p112, var1891)
				var1891 = var1900
				var1890.kind = { type = "literal", value = buffer.tostring(var1899) }
			elseif var1896 == 2 then
				local _ = nil
				local var1901, var1902 = protoModule.readBuffer(p112, var1891)
				var1891 = var1902
				var1890.kind = { type = "token", value = buffer.tostring(var1901) }
			elseif var1896 == 3 then
				local _ = nil
				local var1903, var1904 = protoModule.readBuffer(p112, var1891)
				var1891 = var1904
				var1890.kind = {
					type = "conditional",
					value = t.UDim2Prop_ConditionalOptions.decode(var1903)
				}
			elseif var1896 == 4 then
				local _ = nil
				local var1905, var1906 = protoModule.readBuffer(p112, var1891)
				var1891 = var1906
				var1890.kind = { type = "binding_path", value = buffer.tostring(var1905) }
			else
				local _ = nil
				local var1907, var1908 = protoModule.readVarInt(p112, var1891)
				var1891 = var1908 + var1907
			end
		elseif var1892 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1909, var1910 = protoModule.readFixed32(p112, var1891)
			local _ = var1909
			var1891 = var1910
		elseif var1892 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1911, var1912 = protoModule.readFixed64(p112, var1891)
			local _ = var1911
			var1891 = var1912
		else
			error("Unsupported wire type: " .. var1892)
		end
	end
	return var1890
end

function t_55:jsonEncode() --[[ line: 10432 ]]
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

function t_55:jsonDecode() --[[ line: 10450 ]]
	-- upvalues: t_55 (ref), t (ref)
	local var1914 = t_55.new()
	
	if self.literal ~= nil then
		var1914.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1914.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1914.kind = {
			type = "conditional",
			value = t.UDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1914.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1914.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1914
end

t_55.descriptor = {
	name = "UDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
}
t.UDim2Prop = t_55
typeRegistryModule.default:register(t.UDim2Prop)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p113) --[[ line: 10491 ]]
	-- upvalues: t_56 (ref)
	return setmetatable({
		condition = if p113 == nil or p113.condition == nil then nil else p113.condition,
		kind = if p113 == nil or p113.kind == nil then nil else p113.kind
	}, t_56)
end

function t_56:encode() --[[ line: 10500 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1916 = 0
	
	if self.condition ~= nil then
		local var1917 = self.condition:encode()
		local var1918, var1919 = protoModule.writeTag(buff, var1916, 1, protoModule.wireTypes.lengthDelimited)
		var1918, var1919 = protoModule.writeBuffer(var1918, var1919, var1917, buffer.len(var1917))
		buff = var1918
		var1916 = var1919
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1920, var1921 = protoModule.writeTag(buff, var1916, 2, protoModule.wireTypes.lengthDelimited)
			var1920, var1921 = protoModule.writeString(var1920, var1921, self.kind.value)
			buff = var1920
			var1916 = var1921
		elseif self.kind.type == "token" then
			local var1922, var1923 = protoModule.writeTag(buff, var1916, 3, protoModule.wireTypes.lengthDelimited)
			var1922, var1923 = protoModule.writeString(var1922, var1923, self.kind.value)
			buff = var1922
			var1916 = var1923
		elseif self.kind.type == "binding_path" then
			local var1924, var1925 = protoModule.writeTag(buff, var1916, 4, protoModule.wireTypes.lengthDelimited)
			var1924, var1925 = protoModule.writeString(var1924, var1925, self.kind.value)
			buff = var1924
			var1916 = var1925
		end
	end
	local buff_1 = buffer.create(var1916)
	buffer.copy(buff_1, 0, buff, 0, var1916)
	
	return buff_1
end

function t_56.decode(p114) --[[ line: 10528 ]]
	-- upvalues: t_56 (ref), protoModule (ref), propConditionModule (ref)
	local var1927 = t_56.new()
	local var1928 = 0
	while var1928 < buffer.len(p114) do
		local _ = nil
		local var1929 = nil
		local var1930, var1931, var1932 = protoModule.readTag(p114, var1928)
		local var1933 = var1930
		var1929 = var1931
		var1928 = var1932
		
		if var1929 == protoModule.wireTypes.varint then
			local _ = nil
			local var1934, var1935 = protoModule.readVarInt(p114, var1928)
			local _ = var1934
			var1928 = var1935
			continue
		end
		if var1929 == protoModule.wireTypes.lengthDelimited then
			if var1933 == 1 then
				local _ = nil
				local var1936, var1937 = protoModule.readBuffer(p114, var1928)
				var1928 = var1937
				var1927.condition = propConditionModule.PropCondition.decode(var1936)
			elseif var1933 == 2 then
				local _ = nil
				local var1938, var1939 = protoModule.readBuffer(p114, var1928)
				var1928 = var1939
				var1927.kind = { type = "literal", value = buffer.tostring(var1938) }
			elseif var1933 == 3 then
				local _ = nil
				local var1940, var1941 = protoModule.readBuffer(p114, var1928)
				var1928 = var1941
				var1927.kind = { type = "token", value = buffer.tostring(var1940) }
			elseif var1933 == 4 then
				local _ = nil
				local var1942, var1943 = protoModule.readBuffer(p114, var1928)
				var1928 = var1943
				var1927.kind = { type = "binding_path", value = buffer.tostring(var1942) }
			else
				local _ = nil
				local var1944, var1945 = protoModule.readVarInt(p114, var1928)
				var1928 = var1945 + var1944
			end
		elseif var1929 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1946, var1947 = protoModule.readFixed32(p114, var1928)
			local _ = var1946
			var1928 = var1947
		elseif var1929 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1948, var1949 = protoModule.readFixed64(p114, var1928)
			local _ = var1948
			var1928 = var1949
		else
			error("Unsupported wire type: " .. var1929)
		end
	end
	return var1927
end

function t_56:jsonEncode() --[[ line: 10586 ]]
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

function t_56:jsonDecode() --[[ line: 10606 ]]
	-- upvalues: t_56 (ref), propConditionModule (ref)
	local var1951 = t_56.new()
	
	if self.condition ~= nil then
		var1951.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1951.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1951.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1951.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1951.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1951
end

t_56.descriptor = {
	name = "UDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDim2Prop_ConditionalOption = t_56
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOption)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p115) --[[ line: 10647 ]]
	-- upvalues: t_57 (ref)
	return setmetatable({
		options = if p115 == nil or p115.options == nil then {} else p115.options
	}, t_57)
end

function t_57:encode() --[[ line: 10655 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1953 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1954 = v:encode()
			local var1955, var1956 = protoModule.writeTag(buff, var1953, 1, protoModule.wireTypes.lengthDelimited)
			var1955, var1956 = protoModule.writeBuffer(var1955, var1956, var1954, buffer.len(var1954))
			buff = var1955
			var1953 = var1956
		end
	end
	local buff_1 = buffer.create(var1953)
	buffer.copy(buff_1, 0, buff, 0, var1953)
	
	return buff_1
end

function t_57.decode(p116) --[[ line: 10672 ]]
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1958 = t_57.new()
	local var1959 = 0
	while var1959 < buffer.len(p116) do
		local _ = nil
		local var1960 = nil
		local var1961, var1962, var1963 = protoModule.readTag(p116, var1959)
		local var1964 = var1961
		var1960 = var1962
		var1959 = var1963
		
		if var1960 == protoModule.wireTypes.varint then
			local _ = nil
			local var1965, var1966 = protoModule.readVarInt(p116, var1959)
			local _ = var1965
			var1959 = var1966
			continue
		end
		if var1960 == protoModule.wireTypes.lengthDelimited then
			if var1964 == 1 then
				local _ = nil
				local var1967, var1968 = protoModule.readBuffer(p116, var1959)
				var1959 = var1968
				table.insert(var1958.options, t.UDim2Prop_ConditionalOption.decode(var1967))
			else
				local _ = nil
				local var1969, var1970 = protoModule.readVarInt(p116, var1959)
				var1959 = var1970 + var1969
			end
		elseif var1960 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1971, var1972 = protoModule.readFixed32(p116, var1959)
			local _ = var1971
			var1959 = var1972
		elseif var1960 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1973, var1974 = protoModule.readFixed64(p116, var1959)
			local _ = var1973
			var1959 = var1974
		else
			error("Unsupported wire type: " .. var1960)
		end
	end
	return var1958
end

function t_57:jsonEncode() --[[ line: 10715 ]]
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

function t_57:jsonDecode() --[[ line: 10729 ]]
	-- upvalues: t_57 (ref), t (ref)
	local var1977 = t_57.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var1977.options = t_1
	end
	return var1977
end

t_57.descriptor = {
	name = "UDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDim2Prop_ConditionalOptions = t_57
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOptions)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p117) --[[ line: 10758 ]]
	-- upvalues: t_58 (ref)
	return setmetatable({
		kind = if p117 == nil or p117.kind == nil then nil else p117.kind
	}, t_58)
end

function t_58:encode() --[[ line: 10764 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1980 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1981, var1982 = protoModule.writeTag(buff, var1980, 1, protoModule.wireTypes.lengthDelimited)
			var1981, var1982 = protoModule.writeString(var1981, var1982, self.kind.value)
			buff = var1981
			var1980 = var1982
		elseif self.kind.type == "token" then
			local var1983, var1984 = protoModule.writeTag(buff, var1980, 2, protoModule.wireTypes.lengthDelimited)
			var1983, var1984 = protoModule.writeString(var1983, var1984, self.kind.value)
			buff = var1983
			var1980 = var1984
		elseif self.kind.type == "conditional" then
			local var1985 = self.kind.value:encode()
			local var1986, var1987 = protoModule.writeTag(buff, var1980, 3, protoModule.wireTypes.lengthDelimited)
			var1986, var1987 = protoModule.writeBuffer(var1986, var1987, var1985, buffer.len(var1985))
			buff = var1986
			var1980 = var1987
		elseif self.kind.type == "binding_path" then
			local var1988, var1989 = protoModule.writeTag(buff, var1980, 4, protoModule.wireTypes.lengthDelimited)
			var1988, var1989 = protoModule.writeString(var1988, var1989, self.kind.value)
			buff = var1988
			var1980 = var1989
		end
	end
	local buff_1 = buffer.create(var1980)
	buffer.copy(buff_1, 0, buff, 0, var1980)
	
	return buff_1
end

function t_58.decode(p118) --[[ line: 10790 ]]
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1991 = t_58.new()
	local var1992 = 0
	while var1992 < buffer.len(p118) do
		local _ = nil
		local var1993 = nil
		local var1994, var1995, var1996 = protoModule.readTag(p118, var1992)
		local var1997 = var1994
		var1993 = var1995
		var1992 = var1996
		
		if var1993 == protoModule.wireTypes.varint then
			local _ = nil
			local var1998, var1999 = protoModule.readVarInt(p118, var1992)
			local _ = var1998
			var1992 = var1999
			continue
		end
		if var1993 == protoModule.wireTypes.lengthDelimited then
			if var1997 == 1 then
				local _ = nil
				local var2000, var2001 = protoModule.readBuffer(p118, var1992)
				var1992 = var2001
				var1991.kind = { type = "literal", value = buffer.tostring(var2000) }
			elseif var1997 == 2 then
				local _ = nil
				local var2002, var2003 = protoModule.readBuffer(p118, var1992)
				var1992 = var2003
				var1991.kind = { type = "token", value = buffer.tostring(var2002) }
			elseif var1997 == 3 then
				local _ = nil
				local var2004, var2005 = protoModule.readBuffer(p118, var1992)
				var1992 = var2005
				var1991.kind = {
					type = "conditional",
					value = t.Vector2Prop_ConditionalOptions.decode(var2004)
				}
			elseif var1997 == 4 then
				local _ = nil
				local var2006, var2007 = protoModule.readBuffer(p118, var1992)
				var1992 = var2007
				var1991.kind = { type = "binding_path", value = buffer.tostring(var2006) }
			else
				local _ = nil
				local var2008, var2009 = protoModule.readVarInt(p118, var1992)
				var1992 = var2009 + var2008
			end
		elseif var1993 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2010, var2011 = protoModule.readFixed32(p118, var1992)
			local _ = var2010
			var1992 = var2011
		elseif var1993 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2012, var2013 = protoModule.readFixed64(p118, var1992)
			local _ = var2012
			var1992 = var2013
		else
			error("Unsupported wire type: " .. var1993)
		end
	end
	return var1991
end

function t_58:jsonEncode() --[[ line: 10848 ]]
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

function t_58:jsonDecode() --[[ line: 10866 ]]
	-- upvalues: t_58 (ref), t (ref)
	local var2015 = t_58.new()
	
	if self.literal ~= nil then
		var2015.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2015.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2015.kind = {
			type = "conditional",
			value = t.Vector2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2015.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2015.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2015
end

t_58.descriptor = {
	name = "Vector2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
}
t.Vector2Prop = t_58
typeRegistryModule.default:register(t.Vector2Prop)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p119) --[[ line: 10907 ]]
	-- upvalues: t_59 (ref)
	return setmetatable({
		condition = if p119 == nil or p119.condition == nil then nil else p119.condition,
		kind = if p119 == nil or p119.kind == nil then nil else p119.kind
	}, t_59)
end

function t_59:encode() --[[ line: 10916 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2017 = 0
	
	if self.condition ~= nil then
		local var2018 = self.condition:encode()
		local var2019, var2020 = protoModule.writeTag(buff, var2017, 1, protoModule.wireTypes.lengthDelimited)
		var2019, var2020 = protoModule.writeBuffer(var2019, var2020, var2018, buffer.len(var2018))
		buff = var2019
		var2017 = var2020
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2021, var2022 = protoModule.writeTag(buff, var2017, 2, protoModule.wireTypes.lengthDelimited)
			var2021, var2022 = protoModule.writeString(var2021, var2022, self.kind.value)
			buff = var2021
			var2017 = var2022
		elseif self.kind.type == "token" then
			local var2023, var2024 = protoModule.writeTag(buff, var2017, 3, protoModule.wireTypes.lengthDelimited)
			var2023, var2024 = protoModule.writeString(var2023, var2024, self.kind.value)
			buff = var2023
			var2017 = var2024
		elseif self.kind.type == "binding_path" then
			local var2025, var2026 = protoModule.writeTag(buff, var2017, 4, protoModule.wireTypes.lengthDelimited)
			var2025, var2026 = protoModule.writeString(var2025, var2026, self.kind.value)
			buff = var2025
			var2017 = var2026
		end
	end
	local buff_1 = buffer.create(var2017)
	buffer.copy(buff_1, 0, buff, 0, var2017)
	
	return buff_1
end

function t_59.decode(p120) --[[ line: 10944 ]]
	-- upvalues: t_59 (ref), protoModule (ref), propConditionModule (ref)
	local var2028 = t_59.new()
	local var2029 = 0
	while var2029 < buffer.len(p120) do
		local _ = nil
		local var2030 = nil
		local var2031, var2032, var2033 = protoModule.readTag(p120, var2029)
		local var2034 = var2031
		var2030 = var2032
		var2029 = var2033
		
		if var2030 == protoModule.wireTypes.varint then
			local _ = nil
			local var2035, var2036 = protoModule.readVarInt(p120, var2029)
			local _ = var2035
			var2029 = var2036
			continue
		end
		if var2030 == protoModule.wireTypes.lengthDelimited then
			if var2034 == 1 then
				local _ = nil
				local var2037, var2038 = protoModule.readBuffer(p120, var2029)
				var2029 = var2038
				var2028.condition = propConditionModule.PropCondition.decode(var2037)
			elseif var2034 == 2 then
				local _ = nil
				local var2039, var2040 = protoModule.readBuffer(p120, var2029)
				var2029 = var2040
				var2028.kind = { type = "literal", value = buffer.tostring(var2039) }
			elseif var2034 == 3 then
				local _ = nil
				local var2041, var2042 = protoModule.readBuffer(p120, var2029)
				var2029 = var2042
				var2028.kind = { type = "token", value = buffer.tostring(var2041) }
			elseif var2034 == 4 then
				local _ = nil
				local var2043, var2044 = protoModule.readBuffer(p120, var2029)
				var2029 = var2044
				var2028.kind = { type = "binding_path", value = buffer.tostring(var2043) }
			else
				local _ = nil
				local var2045, var2046 = protoModule.readVarInt(p120, var2029)
				var2029 = var2046 + var2045
			end
		elseif var2030 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2047, var2048 = protoModule.readFixed32(p120, var2029)
			local _ = var2047
			var2029 = var2048
		elseif var2030 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2049, var2050 = protoModule.readFixed64(p120, var2029)
			local _ = var2049
			var2029 = var2050
		else
			error("Unsupported wire type: " .. var2030)
		end
	end
	return var2028
end

function t_59:jsonEncode() --[[ line: 11002 ]]
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

function t_59:jsonDecode() --[[ line: 11022 ]]
	-- upvalues: t_59 (ref), propConditionModule (ref)
	local var2052 = t_59.new()
	
	if self.condition ~= nil then
		var2052.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2052.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2052.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2052.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2052.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2052
end

t_59.descriptor = {
	name = "Vector2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Vector2Prop_ConditionalOption = t_59
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOption)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p121) --[[ line: 11063 ]]
	-- upvalues: t_60 (ref)
	return setmetatable({
		options = if p121 == nil or p121.options == nil then {} else p121.options
	}, t_60)
end

function t_60:encode() --[[ line: 11071 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2054 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2055 = v:encode()
			local var2056, var2057 = protoModule.writeTag(buff, var2054, 1, protoModule.wireTypes.lengthDelimited)
			var2056, var2057 = protoModule.writeBuffer(var2056, var2057, var2055, buffer.len(var2055))
			buff = var2056
			var2054 = var2057
		end
	end
	local buff_1 = buffer.create(var2054)
	buffer.copy(buff_1, 0, buff, 0, var2054)
	
	return buff_1
end

function t_60.decode(p122) --[[ line: 11088 ]]
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var2059 = t_60.new()
	local var2060 = 0
	while var2060 < buffer.len(p122) do
		local _ = nil
		local var2061 = nil
		local var2062, var2063, var2064 = protoModule.readTag(p122, var2060)
		local var2065 = var2062
		var2061 = var2063
		var2060 = var2064
		
		if var2061 == protoModule.wireTypes.varint then
			local _ = nil
			local var2066, var2067 = protoModule.readVarInt(p122, var2060)
			local _ = var2066
			var2060 = var2067
			continue
		end
		if var2061 == protoModule.wireTypes.lengthDelimited then
			if var2065 == 1 then
				local _ = nil
				local var2068, var2069 = protoModule.readBuffer(p122, var2060)
				var2060 = var2069
				table.insert(var2059.options, t.Vector2Prop_ConditionalOption.decode(var2068))
			else
				local _ = nil
				local var2070, var2071 = protoModule.readVarInt(p122, var2060)
				var2060 = var2071 + var2070
			end
		elseif var2061 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2072, var2073 = protoModule.readFixed32(p122, var2060)
			local _ = var2072
			var2060 = var2073
		elseif var2061 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2074, var2075 = protoModule.readFixed64(p122, var2060)
			local _ = var2074
			var2060 = var2075
		else
			error("Unsupported wire type: " .. var2061)
		end
	end
	return var2059
end

function t_60:jsonEncode() --[[ line: 11131 ]]
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

function t_60:jsonDecode() --[[ line: 11145 ]]
	-- upvalues: t_60 (ref), t (ref)
	local var2078 = t_60.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Vector2Prop_ConditionalOption.jsonDecode(v))
		end
		var2078.options = t_1
	end
	return var2078
end

t_60.descriptor = {
	name = "Vector2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Vector2Prop_ConditionalOptions = t_60
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOptions)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p123) --[[ line: 11174 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		kind = if p123 == nil or p123.kind == nil then nil else p123.kind
	}, t_61)
end

function t_61:encode() --[[ line: 11180 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2081 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2082, var2083 = protoModule.writeTag(buff, var2081, 1, protoModule.wireTypes.lengthDelimited)
			var2082, var2083 = protoModule.writeString(var2082, var2083, self.kind.value)
			buff = var2082
			var2081 = var2083
		elseif self.kind.type == "binding_path" then
			local var2084, var2085 = protoModule.writeTag(buff, var2081, 2, protoModule.wireTypes.lengthDelimited)
			var2084, var2085 = protoModule.writeString(var2084, var2085, self.kind.value)
			buff = var2084
			var2081 = var2085
		elseif self.kind.type == "conditional" then
			local var2086 = self.kind.value:encode()
			local var2087, var2088 = protoModule.writeTag(buff, var2081, 3, protoModule.wireTypes.lengthDelimited)
			var2087, var2088 = protoModule.writeBuffer(var2087, var2088, var2086, buffer.len(var2086))
			buff = var2087
			var2081 = var2088
		end
	end
	local buff_1 = buffer.create(var2081)
	buffer.copy(buff_1, 0, buff, 0, var2081)
	
	return buff_1
end

function t_61.decode(p124) --[[ line: 11203 ]]
	-- upvalues: t_61 (ref), protoModule (ref), t (ref)
	local var2090 = t_61.new()
	local var2091 = 0
	while var2091 < buffer.len(p124) do
		local _ = nil
		local var2092 = nil
		local var2093, var2094, var2095 = protoModule.readTag(p124, var2091)
		local var2096 = var2093
		var2092 = var2094
		var2091 = var2095
		
		if var2092 == protoModule.wireTypes.varint then
			local _ = nil
			local var2097, var2098 = protoModule.readVarInt(p124, var2091)
			local _ = var2097
			var2091 = var2098
			continue
		end
		if var2092 == protoModule.wireTypes.lengthDelimited then
			if var2096 == 1 then
				local _ = nil
				local var2099, var2100 = protoModule.readBuffer(p124, var2091)
				var2091 = var2100
				var2090.kind = { type = "literal", value = buffer.tostring(var2099) }
			elseif var2096 == 2 then
				local _ = nil
				local var2101, var2102 = protoModule.readBuffer(p124, var2091)
				var2091 = var2102
				var2090.kind = { type = "binding_path", value = buffer.tostring(var2101) }
			elseif var2096 == 3 then
				local _ = nil
				local var2103, var2104 = protoModule.readBuffer(p124, var2091)
				var2091 = var2104
				var2090.kind = {
					type = "conditional",
					value = t.IconProp_ConditionalOptions.decode(var2103)
				}
			else
				local _ = nil
				local var2105, var2106 = protoModule.readVarInt(p124, var2091)
				var2091 = var2106 + var2105
			end
		elseif var2092 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2107, var2108 = protoModule.readFixed32(p124, var2091)
			local _ = var2107
			var2091 = var2108
		elseif var2092 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2109, var2110 = protoModule.readFixed64(p124, var2091)
			local _ = var2109
			var2091 = var2110
		else
			error("Unsupported wire type: " .. var2092)
		end
	end
	return var2090
end

function t_61:jsonEncode() --[[ line: 11256 ]]
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

function t_61:jsonDecode() --[[ line: 11272 ]]
	-- upvalues: t_61 (ref), t (ref)
	local var2112 = t_61.new()
	
	if self.literal ~= nil then
		var2112.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var2112.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2112.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2112.kind = {
			type = "conditional",
			value = t.IconProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2112
end

t_61.descriptor = {
	name = "IconProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
}
t.IconProp = t_61
typeRegistryModule.default:register(t.IconProp)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p125) --[[ line: 11309 ]]
	-- upvalues: t_62 (ref)
	return setmetatable({
		condition = if p125 == nil or p125.condition == nil then nil else p125.condition,
		kind = if p125 == nil or p125.kind == nil then nil else p125.kind
	}, t_62)
end

function t_62:encode() --[[ line: 11318 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2114 = 0
	
	if self.condition ~= nil then
		local var2115 = self.condition:encode()
		local var2116, var2117 = protoModule.writeTag(buff, var2114, 1, protoModule.wireTypes.lengthDelimited)
		var2116, var2117 = protoModule.writeBuffer(var2116, var2117, var2115, buffer.len(var2115))
		buff = var2116
		var2114 = var2117
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2118, var2119 = protoModule.writeTag(buff, var2114, 2, protoModule.wireTypes.lengthDelimited)
			var2118, var2119 = protoModule.writeString(var2118, var2119, self.kind.value)
			buff = var2118
			var2114 = var2119
		elseif self.kind.type == "binding_path" then
			local var2120, var2121 = protoModule.writeTag(buff, var2114, 3, protoModule.wireTypes.lengthDelimited)
			var2120, var2121 = protoModule.writeString(var2120, var2121, self.kind.value)
			buff = var2120
			var2114 = var2121
		end
	end
	local buff_1 = buffer.create(var2114)
	buffer.copy(buff_1, 0, buff, 0, var2114)
	
	return buff_1
end

function t_62.decode(p126) --[[ line: 11343 ]]
	-- upvalues: t_62 (ref), protoModule (ref), propConditionModule (ref)
	local var2123 = t_62.new()
	local var2124 = 0
	while var2124 < buffer.len(p126) do
		local _ = nil
		local var2125 = nil
		local var2126, var2127, var2128 = protoModule.readTag(p126, var2124)
		local var2129 = var2126
		var2125 = var2127
		var2124 = var2128
		
		if var2125 == protoModule.wireTypes.varint then
			local _ = nil
			local var2130, var2131 = protoModule.readVarInt(p126, var2124)
			local _ = var2130
			var2124 = var2131
			continue
		end
		if var2125 == protoModule.wireTypes.lengthDelimited then
			if var2129 == 1 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p126, var2124)
				var2124 = var2133
				var2123.condition = propConditionModule.PropCondition.decode(var2132)
			elseif var2129 == 2 then
				local _ = nil
				local var2134, var2135 = protoModule.readBuffer(p126, var2124)
				var2124 = var2135
				var2123.kind = { type = "literal", value = buffer.tostring(var2134) }
			elseif var2129 == 3 then
				local _ = nil
				local var2136, var2137 = protoModule.readBuffer(p126, var2124)
				var2124 = var2137
				var2123.kind = { type = "binding_path", value = buffer.tostring(var2136) }
			else
				local _ = nil
				local var2138, var2139 = protoModule.readVarInt(p126, var2124)
				var2124 = var2139 + var2138
			end
		elseif var2125 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2140, var2141 = protoModule.readFixed32(p126, var2124)
			local _ = var2140
			var2124 = var2141
		elseif var2125 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2142, var2143 = protoModule.readFixed64(p126, var2124)
			local _ = var2142
			var2124 = var2143
		else
			error("Unsupported wire type: " .. var2125)
		end
	end
	return var2123
end

function t_62:jsonEncode() --[[ line: 11396 ]]
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

function t_62:jsonDecode() --[[ line: 11414 ]]
	-- upvalues: t_62 (ref), propConditionModule (ref)
	local var2145 = t_62.new()
	
	if self.condition ~= nil then
		var2145.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2145.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var2145.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2145.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2145
end

t_62.descriptor = {
	name = "IconProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.IconProp_ConditionalOption = t_62
typeRegistryModule.default:register(t.IconProp_ConditionalOption)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p127) --[[ line: 11451 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		options = if p127 == nil or p127.options == nil then {} else p127.options
	}, t_63)
end

function t_63:encode() --[[ line: 11459 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2147 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2148 = v:encode()
			local var2149, var2150 = protoModule.writeTag(buff, var2147, 1, protoModule.wireTypes.lengthDelimited)
			var2149, var2150 = protoModule.writeBuffer(var2149, var2150, var2148, buffer.len(var2148))
			buff = var2149
			var2147 = var2150
		end
	end
	local buff_1 = buffer.create(var2147)
	buffer.copy(buff_1, 0, buff, 0, var2147)
	
	return buff_1
end

function t_63.decode(p128) --[[ line: 11476 ]]
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2152 = t_63.new()
	local var2153 = 0
	while var2153 < buffer.len(p128) do
		local _ = nil
		local var2154 = nil
		local var2155, var2156, var2157 = protoModule.readTag(p128, var2153)
		local var2158 = var2155
		var2154 = var2156
		var2153 = var2157
		
		if var2154 == protoModule.wireTypes.varint then
			local _ = nil
			local var2159, var2160 = protoModule.readVarInt(p128, var2153)
			local _ = var2159
			var2153 = var2160
			continue
		end
		if var2154 == protoModule.wireTypes.lengthDelimited then
			if var2158 == 1 then
				local _ = nil
				local var2161, var2162 = protoModule.readBuffer(p128, var2153)
				var2153 = var2162
				table.insert(var2152.options, t.IconProp_ConditionalOption.decode(var2161))
			else
				local _ = nil
				local var2163, var2164 = protoModule.readVarInt(p128, var2153)
				var2153 = var2164 + var2163
			end
		elseif var2154 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2165, var2166 = protoModule.readFixed32(p128, var2153)
			local _ = var2165
			var2153 = var2166
		elseif var2154 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2167, var2168 = protoModule.readFixed64(p128, var2153)
			local _ = var2167
			var2153 = var2168
		else
			error("Unsupported wire type: " .. var2154)
		end
	end
	return var2152
end

function t_63:jsonEncode() --[[ line: 11519 ]]
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

function t_63:jsonDecode() --[[ line: 11533 ]]
	-- upvalues: t_63 (ref), t (ref)
	local var2171 = t_63.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.IconProp_ConditionalOption.jsonDecode(v))
		end
		var2171.options = t_1
	end
	return var2171
end

t_63.descriptor = {
	name = "IconProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.IconProp_ConditionalOptions = t_63
typeRegistryModule.default:register(t.IconProp_ConditionalOptions)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p129) --[[ line: 11562 ]]
	-- upvalues: t_64 (ref)
	return setmetatable({
		kind = if p129 == nil or p129.kind == nil then nil else p129.kind
	}, t_64)
end

function t_64:encode() --[[ line: 11568 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2174 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2175 = self.kind.value:encode()
			local var2176, var2177 = protoModule.writeTag(buff, var2174, 1, protoModule.wireTypes.lengthDelimited)
			var2176, var2177 = protoModule.writeBuffer(var2176, var2177, var2175, buffer.len(var2175))
			buff = var2176
			var2174 = var2177
		elseif self.kind.type == "binding_path" then
			local var2178, var2179 = protoModule.writeTag(buff, var2174, 2, protoModule.wireTypes.lengthDelimited)
			var2178, var2179 = protoModule.writeString(var2178, var2179, self.kind.value)
			buff = var2178
			var2174 = var2179
		elseif self.kind.type == "conditional" then
			local var2180 = self.kind.value:encode()
			local var2181, var2182 = protoModule.writeTag(buff, var2174, 3, protoModule.wireTypes.lengthDelimited)
			var2181, var2182 = protoModule.writeBuffer(var2181, var2182, var2180, buffer.len(var2180))
			buff = var2181
			var2174 = var2182
		end
	end
	local buff_1 = buffer.create(var2174)
	buffer.copy(buff_1, 0, buff, 0, var2174)
	
	return buff_1
end

function t_64.decode(p130) --[[ line: 11592 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2184 = t_64.new()
	local var2185 = 0
	while var2185 < buffer.len(p130) do
		local _ = nil
		local var2186 = nil
		local var2187, var2188, var2189 = protoModule.readTag(p130, var2185)
		local var2190 = var2187
		var2186 = var2188
		var2185 = var2189
		
		if var2186 == protoModule.wireTypes.varint then
			local _ = nil
			local var2191, var2192 = protoModule.readVarInt(p130, var2185)
			local _ = var2191
			var2185 = var2192
			continue
		end
		if var2186 == protoModule.wireTypes.lengthDelimited then
			if var2190 == 1 then
				local _ = nil
				local var2193, var2194 = protoModule.readBuffer(p130, var2185)
				var2185 = var2194
				var2184.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var2193)
				}
			elseif var2190 == 2 then
				local _ = nil
				local var2195, var2196 = protoModule.readBuffer(p130, var2185)
				var2185 = var2196
				var2184.kind = { type = "binding_path", value = buffer.tostring(var2195) }
			elseif var2190 == 3 then
				local _ = nil
				local var2197, var2198 = protoModule.readBuffer(p130, var2185)
				var2185 = var2198
				var2184.kind = {
					type = "conditional",
					value = t.FoundationIconConfigProp_ConditionalOptions.decode(var2197)
				}
			else
				local _ = nil
				local var2199, var2200 = protoModule.readVarInt(p130, var2185)
				var2185 = var2200 + var2199
			end
		elseif var2186 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2201, var2202 = protoModule.readFixed32(p130, var2185)
			local _ = var2201
			var2185 = var2202
		elseif var2186 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2203, var2204 = protoModule.readFixed64(p130, var2185)
			local _ = var2203
			var2185 = var2204
		else
			error("Unsupported wire type: " .. var2186)
		end
	end
	return var2184
end

function t_64:jsonEncode() --[[ line: 11651 ]]
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

function t_64:jsonDecode() --[[ line: 11667 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2206 = t_64.new()
	
	if self.literal ~= nil then
		var2206.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2206.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2206.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2206.kind = {
			type = "conditional",
			value = t.FoundationIconConfigProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2206
end

t_64.descriptor = {
	name = "FoundationIconConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfigProp"
}
t.FoundationIconConfigProp = t_64
typeRegistryModule.default:register(t.FoundationIconConfigProp)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p131) --[[ line: 11709 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		condition = if p131 == nil or p131.condition == nil then nil else p131.condition,
		kind = if p131 == nil or p131.kind == nil then nil else p131.kind
	}, t_65)
end

function t_65:encode() --[[ line: 11718 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2208 = 0
	
	if self.condition ~= nil then
		local var2209 = self.condition:encode()
		local var2210, var2211 = protoModule.writeTag(buff, var2208, 1, protoModule.wireTypes.lengthDelimited)
		var2210, var2211 = protoModule.writeBuffer(var2210, var2211, var2209, buffer.len(var2209))
		buff = var2210
		var2208 = var2211
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2212 = self.kind.value:encode()
			local var2213, var2214 = protoModule.writeTag(buff, var2208, 2, protoModule.wireTypes.lengthDelimited)
			var2213, var2214 = protoModule.writeBuffer(var2213, var2214, var2212, buffer.len(var2212))
			buff = var2213
			var2208 = var2214
		elseif self.kind.type == "binding_path" then
			local var2215, var2216 = protoModule.writeTag(buff, var2208, 3, protoModule.wireTypes.lengthDelimited)
			var2215, var2216 = protoModule.writeString(var2215, var2216, self.kind.value)
			buff = var2215
			var2208 = var2216
		end
	end
	local buff_1 = buffer.create(var2208)
	buffer.copy(buff_1, 0, buff, 0, var2208)
	
	return buff_1
end

function t_65.decode(p132) --[[ line: 11746 ]]
	-- upvalues: t_65 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2218 = t_65.new()
	local var2219 = 0
	while var2219 < buffer.len(p132) do
		local _ = nil
		local var2220 = nil
		local var2221, var2222, var2223 = protoModule.readTag(p132, var2219)
		local var2224 = var2221
		var2220 = var2222
		var2219 = var2223
		
		if var2220 == protoModule.wireTypes.varint then
			local _ = nil
			local var2225, var2226 = protoModule.readVarInt(p132, var2219)
			local _ = var2225
			var2219 = var2226
			continue
		end
		if var2220 == protoModule.wireTypes.lengthDelimited then
			if var2224 == 1 then
				local _ = nil
				local var2227, var2228 = protoModule.readBuffer(p132, var2219)
				var2219 = var2228
				var2218.condition = propConditionModule.PropCondition.decode(var2227)
			elseif var2224 == 2 then
				local _ = nil
				local var2229, var2230 = protoModule.readBuffer(p132, var2219)
				var2219 = var2230
				var2218.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var2229)
				}
			elseif var2224 == 3 then
				local _ = nil
				local var2231, var2232 = protoModule.readBuffer(p132, var2219)
				var2219 = var2232
				var2218.kind = { type = "binding_path", value = buffer.tostring(var2231) }
			else
				local _ = nil
				local var2233, var2234 = protoModule.readVarInt(p132, var2219)
				var2219 = var2234 + var2233
			end
		elseif var2220 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2235, var2236 = protoModule.readFixed32(p132, var2219)
			local _ = var2235
			var2219 = var2236
		elseif var2220 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2237, var2238 = protoModule.readFixed64(p132, var2219)
			local _ = var2237
			var2219 = var2238
		else
			error("Unsupported wire type: " .. var2220)
		end
	end
	return var2218
end

function t_65:jsonEncode() --[[ line: 11804 ]]
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

function t_65:jsonDecode() --[[ line: 11824 ]]
	-- upvalues: t_65 (ref), propConditionModule (ref), t (ref)
	local var2240 = t_65.new()
	
	if self.condition ~= nil then
		var2240.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2240.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2240.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2240.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2240
end

t_65.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FoundationIconConfigProp_ConditionalOption = t_65
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOption)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p133) --[[ line: 11866 ]]
	-- upvalues: t_66 (ref)
	return setmetatable({
		options = if p133 == nil or p133.options == nil then {} else p133.options
	}, t_66)
end

function t_66:encode() --[[ line: 11874 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2242 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2243 = v:encode()
			local var2244, var2245 = protoModule.writeTag(buff, var2242, 1, protoModule.wireTypes.lengthDelimited)
			var2244, var2245 = protoModule.writeBuffer(var2244, var2245, var2243, buffer.len(var2243))
			buff = var2244
			var2242 = var2245
		end
	end
	local buff_1 = buffer.create(var2242)
	buffer.copy(buff_1, 0, buff, 0, var2242)
	
	return buff_1
end

function t_66.decode(p134) --[[ line: 11893 ]]
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var2247 = t_66.new()
	local var2248 = 0
	while var2248 < buffer.len(p134) do
		local _ = nil
		local var2249 = nil
		local var2250, var2251, var2252 = protoModule.readTag(p134, var2248)
		local var2253 = var2250
		var2249 = var2251
		var2248 = var2252
		
		if var2249 == protoModule.wireTypes.varint then
			local _ = nil
			local var2254, var2255 = protoModule.readVarInt(p134, var2248)
			local _ = var2254
			var2248 = var2255
			continue
		end
		if var2249 == protoModule.wireTypes.lengthDelimited then
			if var2253 == 1 then
				local _ = nil
				local var2256, var2257 = protoModule.readBuffer(p134, var2248)
				var2248 = var2257
				table.insert(var2247.options, t.FoundationIconConfigProp_ConditionalOption.decode(var2256))
			else
				local _ = nil
				local var2258, var2259 = protoModule.readVarInt(p134, var2248)
				var2248 = var2259 + var2258
			end
		elseif var2249 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2260, var2261 = protoModule.readFixed32(p134, var2248)
			local _ = var2260
			var2248 = var2261
		elseif var2249 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2262, var2263 = protoModule.readFixed64(p134, var2248)
			local _ = var2262
			var2248 = var2263
		else
			error("Unsupported wire type: " .. var2249)
		end
	end
	return var2247
end

function t_66:jsonEncode() --[[ line: 11938 ]]
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

function t_66:jsonDecode() --[[ line: 11954 ]]
	-- upvalues: t_66 (ref), t (ref)
	local var2266 = t_66.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FoundationIconConfigProp_ConditionalOption.jsonDecode(v))
		end
		var2266.options = t_1
	end
	return var2266
end

t_66.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FoundationIconConfigProp_ConditionalOptions = t_66
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOptions)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p135) --[[ line: 11985 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		name = if p135 == nil or p135.name == nil then nil else p135.name,
		variant = if p135 == nil or p135.variant == nil then nil else p135.variant
	}, t_67)
end

function t_67:encode() --[[ line: 11994 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2269 = 0
	
	if self.name ~= nil then
		local var2270 = self.name:encode()
		local var2271, var2272 = protoModule.writeTag(buff, var2269, 1, protoModule.wireTypes.lengthDelimited)
		var2271, var2272 = protoModule.writeBuffer(var2271, var2272, var2270, buffer.len(var2270))
		buff = var2271
		var2269 = var2272
	end
	if self.variant ~= nil then
		local var2273 = self.variant:encode()
		local var2274, var2275 = protoModule.writeTag(buff, var2269, 2, protoModule.wireTypes.lengthDelimited)
		var2274, var2275 = protoModule.writeBuffer(var2274, var2275, var2273, buffer.len(var2273))
		buff = var2274
		var2269 = var2275
	end
	local buff_1 = buffer.create(var2269)
	buffer.copy(buff_1, 0, buff, 0, var2269)
	
	return buff_1
end

function t_67.decode(p136) --[[ line: 12017 ]]
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var2277 = t_67.new()
	local var2278 = 0
	while var2278 < buffer.len(p136) do
		local _ = nil
		local var2279 = nil
		local var2280, var2281, var2282 = protoModule.readTag(p136, var2278)
		local var2283 = var2280
		var2279 = var2281
		var2278 = var2282
		
		if var2279 == protoModule.wireTypes.varint then
			local _ = nil
			local var2284, var2285 = protoModule.readVarInt(p136, var2278)
			local _ = var2284
			var2278 = var2285
			continue
		end
		if var2279 == protoModule.wireTypes.lengthDelimited then
			if var2283 == 1 then
				local _ = nil
				local var2286, var2287 = protoModule.readBuffer(p136, var2278)
				var2278 = var2287
				var2277.name = t.StringProp.decode(var2286)
			elseif var2283 == 2 then
				local _ = nil
				local var2288, var2289 = protoModule.readBuffer(p136, var2278)
				var2278 = var2289
				var2277.variant = t.StringProp.decode(var2288)
			else
				local _ = nil
				local var2290, var2291 = protoModule.readVarInt(p136, var2278)
				var2278 = var2291 + var2290
			end
		elseif var2279 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2292, var2293 = protoModule.readFixed32(p136, var2278)
			local _ = var2292
			var2278 = var2293
		elseif var2279 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2294, var2295 = protoModule.readFixed64(p136, var2278)
			local _ = var2294
			var2278 = var2295
		else
			error("Unsupported wire type: " .. var2279)
		end
	end
	return var2277
end

function t_67:jsonEncode() --[[ line: 12067 ]]
	local t = {}
	
	if self.name ~= nil then
		t.name = self.name:jsonEncode()
	end
	if self.variant ~= nil then
		t.variant = self.variant:jsonEncode()
	end
	return t
end

function t_67:jsonDecode() --[[ line: 12083 ]]
	-- upvalues: t_67 (ref), t (ref)
	local var2297 = t_67.new()
	
	if self.name ~= nil then
		var2297.name = t.StringProp.jsonDecode(self.name)
	end
	if self.variant ~= nil then
		var2297.variant = t.StringProp.jsonDecode(self.variant)
	end
	return var2297
end

t_67.descriptor = {
	name = "FoundationIconConfigProp_FoundationIconConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfig"
}
t.FoundationIconConfigProp_FoundationIconConfig = t_67
typeRegistryModule.default:register(t.FoundationIconConfigProp_FoundationIconConfig)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p137) --[[ line: 12113 ]]
	-- upvalues: t_68 (ref)
	return setmetatable({
		oneof_prop = if p137 == nil or p137.oneof_prop == nil then nil else p137.oneof_prop
	}, t_68)
end

function t_68:encode() --[[ line: 12119 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2299 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local var2300 = self.oneof_prop.value:encode()
			local var2301, var2302 = protoModule.writeTag(buff, var2299, 1, protoModule.wireTypes.lengthDelimited)
			var2301, var2302 = protoModule.writeBuffer(var2301, var2302, var2300, buffer.len(var2300))
			buff = var2301
			var2299 = var2302
		elseif self.oneof_prop.type == "int32_prop" then
			local var2303 = self.oneof_prop.value:encode()
			local var2304, var2305 = protoModule.writeTag(buff, var2299, 2, protoModule.wireTypes.lengthDelimited)
			var2304, var2305 = protoModule.writeBuffer(var2304, var2305, var2303, buffer.len(var2303))
			buff = var2304
			var2299 = var2305
		end
	end
	local buff_1 = buffer.create(var2299)
	buffer.copy(buff_1, 0, buff, 0, var2299)
	
	return buff_1
end

function t_68.decode(p138) --[[ line: 12140 ]]
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var2307 = t_68.new()
	local var2308 = 0
	while var2308 < buffer.len(p138) do
		local _ = nil
		local var2309 = nil
		local var2310, var2311, var2312 = protoModule.readTag(p138, var2308)
		local var2313 = var2310
		var2309 = var2311
		var2308 = var2312
		
		if var2309 == protoModule.wireTypes.varint then
			local _ = nil
			local var2314, var2315 = protoModule.readVarInt(p138, var2308)
			local _ = var2314
			var2308 = var2315
			continue
		end
		if var2309 == protoModule.wireTypes.lengthDelimited then
			if var2313 == 1 then
				local _ = nil
				local var2316, var2317 = protoModule.readBuffer(p138, var2308)
				var2308 = var2317
				var2307.oneof_prop = {
					type = "string_prop",
					value = t.StringProp.decode(var2316)
				}
			elseif var2313 == 2 then
				local _ = nil
				local var2318, var2319 = protoModule.readBuffer(p138, var2308)
				var2308 = var2319
				var2307.oneof_prop = { type = "int32_prop", value = t.Int32Prop.decode(var2318) }
			else
				local _ = nil
				local var2320, var2321 = protoModule.readVarInt(p138, var2308)
				var2308 = var2321 + var2320
			end
		elseif var2309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2322, var2323 = protoModule.readFixed32(p138, var2308)
			local _ = var2322
			var2308 = var2323
		elseif var2309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2324, var2325 = protoModule.readFixed64(p138, var2308)
			local _ = var2324
			var2308 = var2325
		else
			error("Unsupported wire type: " .. var2309)
		end
	end
	return var2307
end

function t_68:jsonEncode() --[[ line: 12188 ]]
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

function t_68:jsonDecode() --[[ line: 12202 ]]
	-- upvalues: t_68 (ref), t (ref)
	local var2327 = t_68.new()
	
	if self.string_prop ~= nil then
		var2327.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		var2327.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		var2327.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		var2327.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	return var2327
end

t_68.descriptor = {
	name = "IconSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconSizeProp"
}
t.IconSizeProp = t_68
typeRegistryModule.default:register(t.IconSizeProp)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p139) --[[ line: 12238 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		kind = if p139 == nil or p139.kind == nil then nil else p139.kind
	}, t_69)
end

function t_69:encode() --[[ line: 12244 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2329 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2330 = self.kind.value:encode()
			local var2331, var2332 = protoModule.writeTag(buff, var2329, 1, protoModule.wireTypes.lengthDelimited)
			var2331, var2332 = protoModule.writeBuffer(var2331, var2332, var2330, buffer.len(var2330))
			buff = var2331
			var2329 = var2332
		elseif self.kind.type == "conditional" then
			local var2333 = self.kind.value:encode()
			local var2334, var2335 = protoModule.writeTag(buff, var2329, 2, protoModule.wireTypes.lengthDelimited)
			var2334, var2335 = protoModule.writeBuffer(var2334, var2335, var2333, buffer.len(var2333))
			buff = var2334
			var2329 = var2335
		end
	end
	local buff_1 = buffer.create(var2329)
	buffer.copy(buff_1, 0, buff, 0, var2329)
	
	return buff_1
end

function t_69.decode(p140) --[[ line: 12265 ]]
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var2337 = t_69.new()
	local var2338 = 0
	while var2338 < buffer.len(p140) do
		local _ = nil
		local var2339 = nil
		local var2340, var2341, var2342 = protoModule.readTag(p140, var2338)
		local var2343 = var2340
		var2339 = var2341
		var2338 = var2342
		
		if var2339 == protoModule.wireTypes.varint then
			local _ = nil
			local var2344, var2345 = protoModule.readVarInt(p140, var2338)
			local _ = var2344
			var2338 = var2345
			continue
		end
		if var2339 == protoModule.wireTypes.lengthDelimited then
			if var2343 == 1 then
				local _ = nil
				local var2346, var2347 = protoModule.readBuffer(p140, var2338)
				var2338 = var2347
				var2337.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var2346)
				}
			elseif var2343 == 2 then
				local _ = nil
				local var2348, var2349 = protoModule.readBuffer(p140, var2338)
				var2338 = var2349
				var2337.kind = {
					type = "conditional",
					value = t.GradientProp_ConditionalOptions.decode(var2348)
				}
			else
				local _ = nil
				local var2350, var2351 = protoModule.readVarInt(p140, var2338)
				var2338 = var2351 + var2350
			end
		elseif var2339 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2352, var2353 = protoModule.readFixed32(p140, var2338)
			local _ = var2352
			var2338 = var2353
		elseif var2339 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2354, var2355 = protoModule.readFixed64(p140, var2338)
			local _ = var2354
			var2338 = var2355
		else
			error("Unsupported wire type: " .. var2339)
		end
	end
	return var2337
end

function t_69:jsonEncode() --[[ line: 12313 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			t.literal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "conditional" then
			t.conditional = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_69:jsonDecode() --[[ line: 12327 ]]
	-- upvalues: t_69 (ref), t (ref)
	local var2357 = t_69.new()
	
	if self.literal ~= nil then
		var2357.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var2357.kind = {
			type = "conditional",
			value = t.GradientProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2357
end

t_69.descriptor = {
	name = "GradientProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
}
t.GradientProp = t_69
typeRegistryModule.default:register(t.GradientProp)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p141) --[[ line: 12356 ]]
	-- upvalues: t_70 (ref)
	return setmetatable({
		condition = if p141 == nil or p141.condition == nil then nil else p141.condition,
		kind = if p141 == nil or p141.kind == nil then nil else p141.kind
	}, t_70)
end

function t_70:encode() --[[ line: 12365 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2359 = 0
	
	if self.condition ~= nil then
		local var2360 = self.condition:encode()
		local var2361, var2362 = protoModule.writeTag(buff, var2359, 1, protoModule.wireTypes.lengthDelimited)
		var2361, var2362 = protoModule.writeBuffer(var2361, var2362, var2360, buffer.len(var2360))
		buff = var2361
		var2359 = var2362
	end
	if self.kind ~= nil and self.kind.type == "literal" then
		local var2363 = self.kind.value:encode()
		local var2364, var2365 = protoModule.writeTag(buff, var2359, 2, protoModule.wireTypes.lengthDelimited)
		var2364, var2365 = protoModule.writeBuffer(var2364, var2365, var2363, buffer.len(var2363))
		buff = var2364
		var2359 = var2365
	end
	local buff_1 = buffer.create(var2359)
	buffer.copy(buff_1, 0, buff, 0, var2359)
	
	return buff_1
end

function t_70.decode(p142) --[[ line: 12388 ]]
	-- upvalues: t_70 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2367 = t_70.new()
	local var2368 = 0
	while var2368 < buffer.len(p142) do
		local _ = nil
		local var2369 = nil
		local var2370, var2371, var2372 = protoModule.readTag(p142, var2368)
		local var2373 = var2370
		var2369 = var2371
		var2368 = var2372
		
		if var2369 == protoModule.wireTypes.varint then
			local _ = nil
			local var2374, var2375 = protoModule.readVarInt(p142, var2368)
			local _ = var2374
			var2368 = var2375
			continue
		end
		if var2369 == protoModule.wireTypes.lengthDelimited then
			if var2373 == 1 then
				local _ = nil
				local var2376, var2377 = protoModule.readBuffer(p142, var2368)
				var2368 = var2377
				var2367.condition = propConditionModule.PropCondition.decode(var2376)
			elseif var2373 == 2 then
				local _ = nil
				local var2378, var2379 = protoModule.readBuffer(p142, var2368)
				var2368 = var2379
				var2367.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var2378)
				}
			else
				local _ = nil
				local var2380, var2381 = protoModule.readVarInt(p142, var2368)
				var2368 = var2381 + var2380
			end
		elseif var2369 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2382, var2383 = protoModule.readFixed32(p142, var2368)
			local _ = var2382
			var2368 = var2383
		elseif var2369 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2384, var2385 = protoModule.readFixed64(p142, var2368)
			local _ = var2384
			var2368 = var2385
		else
			error("Unsupported wire type: " .. var2369)
		end
	end
	return var2367
end

function t_70:jsonEncode() --[[ line: 12436 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_70:jsonDecode() --[[ line: 12452 ]]
	-- upvalues: t_70 (ref), propConditionModule (ref), t (ref)
	local var2387 = t_70.new()
	
	if self.condition ~= nil then
		var2387.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2387.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	return var2387
end

t_70.descriptor = {
	name = "GradientProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.GradientProp_ConditionalOption = t_70
typeRegistryModule.default:register(t.GradientProp_ConditionalOption)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p143) --[[ line: 12481 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		options = if p143 == nil or p143.options == nil then {} else p143.options
	}, t_71)
end

function t_71:encode() --[[ line: 12489 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2389 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2390 = v:encode()
			local var2391, var2392 = protoModule.writeTag(buff, var2389, 1, protoModule.wireTypes.lengthDelimited)
			var2391, var2392 = protoModule.writeBuffer(var2391, var2392, var2390, buffer.len(var2390))
			buff = var2391
			var2389 = var2392
		end
	end
	local buff_1 = buffer.create(var2389)
	buffer.copy(buff_1, 0, buff, 0, var2389)
	
	return buff_1
end

function t_71.decode(p144) --[[ line: 12506 ]]
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2394 = t_71.new()
	local var2395 = 0
	while var2395 < buffer.len(p144) do
		local _ = nil
		local var2396 = nil
		local var2397, var2398, var2399 = protoModule.readTag(p144, var2395)
		local var2400 = var2397
		var2396 = var2398
		var2395 = var2399
		
		if var2396 == protoModule.wireTypes.varint then
			local _ = nil
			local var2401, var2402 = protoModule.readVarInt(p144, var2395)
			local _ = var2401
			var2395 = var2402
			continue
		end
		if var2396 == protoModule.wireTypes.lengthDelimited then
			if var2400 == 1 then
				local _ = nil
				local var2403, var2404 = protoModule.readBuffer(p144, var2395)
				var2395 = var2404
				table.insert(var2394.options, t.GradientProp_ConditionalOption.decode(var2403))
			else
				local _ = nil
				local var2405, var2406 = protoModule.readVarInt(p144, var2395)
				var2395 = var2406 + var2405
			end
		elseif var2396 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2407, var2408 = protoModule.readFixed32(p144, var2395)
			local _ = var2407
			var2395 = var2408
		elseif var2396 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2409, var2410 = protoModule.readFixed64(p144, var2395)
			local _ = var2409
			var2395 = var2410
		else
			error("Unsupported wire type: " .. var2396)
		end
	end
	return var2394
end

function t_71:jsonEncode() --[[ line: 12549 ]]
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

function t_71:jsonDecode() --[[ line: 12563 ]]
	-- upvalues: t_71 (ref), t (ref)
	local var2413 = t_71.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.GradientProp_ConditionalOption.jsonDecode(v))
		end
		var2413.options = t_1
	end
	return var2413
end

t_71.descriptor = {
	name = "GradientProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.GradientProp_ConditionalOptions = t_71
typeRegistryModule.default:register(t.GradientProp_ConditionalOptions)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p145) --[[ line: 12592 ]]
	-- upvalues: t_72 (ref)
	return setmetatable({
		start_color = if p145 == nil or p145.start_color == nil then "" else p145.start_color,
		end_color = if p145 == nil or p145.end_color == nil then "" else p145.end_color,
		start_opacity = if p145 == nil or p145.start_opacity == nil then 0 else p145.start_opacity,
		end_opacity = if p145 == nil or p145.end_opacity == nil then 0 else p145.end_opacity,
		degree = if p145 == nil or p145.degree == nil then 0 else p145.degree,
		midpoint_percent = if p145 == nil or p145.midpoint_percent == nil then 0 else p145.midpoint_percent
	}, t_72)
end

function t_72:encode() --[[ line: 12605 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2416 = 0
	
	if self.start_color ~= nil and self.start_color ~= "" then
		local var2417, var2418 = protoModule.writeTag(buff, var2416, 1, protoModule.wireTypes.lengthDelimited)
		var2417, var2418 = protoModule.writeString(var2417, var2418, self.start_color)
		buff = var2417
		var2416 = var2418
	end
	if self.end_color ~= nil and self.end_color ~= "" then
		local var2419, var2420 = protoModule.writeTag(buff, var2416, 2, protoModule.wireTypes.lengthDelimited)
		var2419, var2420 = protoModule.writeString(var2419, var2420, self.end_color)
		buff = var2419
		var2416 = var2420
	end
	if self.start_opacity ~= nil and self.start_opacity ~= 0 then
		local var2421, var2422 = protoModule.writeTag(buff, var2416, 3, protoModule.wireTypes.i32)
		var2421, var2422 = protoModule.writeFloat(var2421, var2422, self.start_opacity)
		buff = var2421
		var2416 = var2422
	end
	if self.end_opacity ~= nil and self.end_opacity ~= 0 then
		local var2423, var2424 = protoModule.writeTag(buff, var2416, 4, protoModule.wireTypes.i32)
		var2423, var2424 = protoModule.writeFloat(var2423, var2424, self.end_opacity)
		buff = var2423
		var2416 = var2424
	end
	if self.degree ~= nil and self.degree ~= 0 then
		local var2425, var2426 = protoModule.writeTag(buff, var2416, 5, protoModule.wireTypes.varint)
		var2425, var2426 = protoModule.writeVarInt(var2425, var2426, self.degree)
		buff = var2425
		var2416 = var2426
	end
	if self.midpoint_percent ~= nil and self.midpoint_percent ~= 0 then
		local var2427, var2428 = protoModule.writeTag(buff, var2416, 6, protoModule.wireTypes.i32)
		var2427, var2428 = protoModule.writeFloat(var2427, var2428, self.midpoint_percent)
		buff = var2427
		var2416 = var2428
	end
	local buff_1 = buffer.create(var2416)
	buffer.copy(buff_1, 0, buff, 0, var2416)
	
	return buff_1
end

function t_72.decode(p146) --[[ line: 12644 ]]
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2430 = t_72.new()
	local var2431 = 0
	while var2431 < buffer.len(p146) do
		local _ = nil
		local var2432 = nil
		local var2433, var2434, var2435 = protoModule.readTag(p146, var2431)
		local var2436 = var2433
		var2432 = var2434
		var2431 = var2435
		
		if var2432 == protoModule.wireTypes.varint then
			if var2436 == 5 then
				local _ = nil
				local var2437, var2438 = protoModule.readVarIntI32(p146, var2431)
				var2431 = var2438
				var2430.degree = var2437
			else
				local _ = nil
				local var2439, var2440 = protoModule.readVarInt(p146, var2431)
				local _ = var2439
				var2431 = var2440
			end
		end
		if var2432 == protoModule.wireTypes.lengthDelimited then
			if var2436 == 1 then
				local _ = nil
				local var2441, var2442 = protoModule.readBuffer(p146, var2431)
				var2431 = var2442
				var2430.start_color = buffer.tostring(var2441)
			elseif var2436 == 2 then
				local _ = nil
				local var2443, var2444 = protoModule.readBuffer(p146, var2431)
				var2431 = var2444
				var2430.end_color = buffer.tostring(var2443)
			else
				local _ = nil
				local var2445, var2446 = protoModule.readVarInt(p146, var2431)
				var2431 = var2446 + var2445
			end
		elseif var2432 == protoModule.wireTypes.i32 then
			if var2436 == 3 then
				local _ = nil
				local var2447, var2448 = protoModule.readFloat(p146, var2431)
				var2431 = var2448
				var2430.start_opacity = var2447
			elseif var2436 == 4 then
				local _ = nil
				local var2449, var2450 = protoModule.readFloat(p146, var2431)
				var2431 = var2450
				var2430.end_opacity = var2449
			elseif var2436 == 6 then
				local _ = nil
				local var2451, var2452 = protoModule.readFloat(p146, var2431)
				var2431 = var2452
				var2430.midpoint_percent = var2451
			else
				local _ = nil
				local var2453, var2454 = protoModule.readFixed32(p146, var2431)
				local _ = var2453
				var2431 = var2454
			end
		elseif var2432 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2455, var2456 = protoModule.readFixed64(p146, var2431)
			local _ = var2455
			var2431 = var2456
		else
			error("Unsupported wire type: " .. var2432)
		end
	end
	return var2430
end

function t_72:jsonEncode() --[[ line: 12712 ]]
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

function t_72:jsonDecode() --[[ line: 12742 ]]
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2458 = t_72.new()
	
	if self.start_color ~= nil then
		var2458.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var2458.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var2458.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var2458.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var2458.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var2458.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var2458.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var2458.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var2458.degree = self.degree
	end
	if self.midpoint_percent ~= nil then
		var2458.midpoint_percent = protoModule.json.deserializeNumber(self.midpoint_percent)
	end
	if self.midpointPercent ~= nil then
		var2458.midpoint_percent = protoModule.json.deserializeNumber(self.midpointPercent)
	end
	return var2458
end

t_72.descriptor = {
	name = "GradientProp_GradientData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
}
t.GradientProp_GradientData = t_72
typeRegistryModule.default:register(t.GradientProp_GradientData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p147) --[[ line: 12806 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		kind = if p147 == nil or p147.kind == nil then nil else p147.kind
	}, t_73)
end

function t_73:encode() --[[ line: 12812 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2460 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2461 = self.kind.value:encode()
			local var2462, var2463 = protoModule.writeTag(buff, var2460, 1, protoModule.wireTypes.lengthDelimited)
			var2462, var2463 = protoModule.writeBuffer(var2462, var2463, var2461, buffer.len(var2461))
			buff = var2462
			var2460 = var2463
		elseif self.kind.type == "binding_path" then
			local var2464, var2465 = protoModule.writeTag(buff, var2460, 2, protoModule.wireTypes.lengthDelimited)
			var2464, var2465 = protoModule.writeString(var2464, var2465, self.kind.value)
			buff = var2464
			var2460 = var2465
		elseif self.kind.type == "conditional" then
			local var2466 = self.kind.value:encode()
			local var2467, var2468 = protoModule.writeTag(buff, var2460, 3, protoModule.wireTypes.lengthDelimited)
			var2467, var2468 = protoModule.writeBuffer(var2467, var2468, var2466, buffer.len(var2466))
			buff = var2467
			var2460 = var2468
		end
	end
	local buff_1 = buffer.create(var2460)
	buffer.copy(buff_1, 0, buff, 0, var2460)
	
	return buff_1
end

function t_73.decode(p148) --[[ line: 12836 ]]
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2470 = t_73.new()
	local var2471 = 0
	while var2471 < buffer.len(p148) do
		local _ = nil
		local var2472 = nil
		local var2473, var2474, var2475 = protoModule.readTag(p148, var2471)
		local var2476 = var2473
		var2472 = var2474
		var2471 = var2475
		
		if var2472 == protoModule.wireTypes.varint then
			local _ = nil
			local var2477, var2478 = protoModule.readVarInt(p148, var2471)
			local _ = var2477
			var2471 = var2478
			continue
		end
		if var2472 == protoModule.wireTypes.lengthDelimited then
			if var2476 == 1 then
				local _ = nil
				local var2479, var2480 = protoModule.readBuffer(p148, var2471)
				var2471 = var2480
				var2470.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var2479)
				}
			elseif var2476 == 2 then
				local _ = nil
				local var2481, var2482 = protoModule.readBuffer(p148, var2471)
				var2471 = var2482
				var2470.kind = { type = "binding_path", value = buffer.tostring(var2481) }
			elseif var2476 == 3 then
				local _ = nil
				local var2483, var2484 = protoModule.readBuffer(p148, var2471)
				var2471 = var2484
				var2470.kind = {
					type = "conditional",
					value = t.ArrayOfStructProp_ConditionalOptions.decode(var2483)
				}
			else
				local _ = nil
				local var2485, var2486 = protoModule.readVarInt(p148, var2471)
				var2471 = var2486 + var2485
			end
		elseif var2472 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2487, var2488 = protoModule.readFixed32(p148, var2471)
			local _ = var2487
			var2471 = var2488
		elseif var2472 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2489, var2490 = protoModule.readFixed64(p148, var2471)
			local _ = var2489
			var2471 = var2490
		else
			error("Unsupported wire type: " .. var2472)
		end
	end
	return var2470
end

function t_73:jsonEncode() --[[ line: 12890 ]]
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

function t_73:jsonDecode() --[[ line: 12906 ]]
	-- upvalues: t_73 (ref), t (ref)
	local var2492 = t_73.new()
	
	if self.literal ~= nil then
		var2492.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2492.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2492.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2492.kind = {
			type = "conditional",
			value = t.ArrayOfStructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2492
end

t_73.descriptor = {
	name = "ArrayOfStructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
}
t.ArrayOfStructProp = t_73
typeRegistryModule.default:register(t.ArrayOfStructProp)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p149) --[[ line: 12946 ]]
	-- upvalues: t_74 (ref)
	return setmetatable({
		condition = if p149 == nil or p149.condition == nil then nil else p149.condition,
		kind = if p149 == nil or p149.kind == nil then nil else p149.kind
	}, t_74)
end

function t_74:encode() --[[ line: 12955 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2494 = 0
	
	if self.condition ~= nil then
		local var2495 = self.condition:encode()
		local var2496, var2497 = protoModule.writeTag(buff, var2494, 1, protoModule.wireTypes.lengthDelimited)
		var2496, var2497 = protoModule.writeBuffer(var2496, var2497, var2495, buffer.len(var2495))
		buff = var2496
		var2494 = var2497
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2498 = self.kind.value:encode()
			local var2499, var2500 = protoModule.writeTag(buff, var2494, 2, protoModule.wireTypes.lengthDelimited)
			var2499, var2500 = protoModule.writeBuffer(var2499, var2500, var2498, buffer.len(var2498))
			buff = var2499
			var2494 = var2500
		elseif self.kind.type == "binding_path" then
			local var2501, var2502 = protoModule.writeTag(buff, var2494, 3, protoModule.wireTypes.lengthDelimited)
			var2501, var2502 = protoModule.writeString(var2501, var2502, self.kind.value)
			buff = var2501
			var2494 = var2502
		end
	end
	local buff_1 = buffer.create(var2494)
	buffer.copy(buff_1, 0, buff, 0, var2494)
	
	return buff_1
end

function t_74.decode(p150) --[[ line: 12981 ]]
	-- upvalues: t_74 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2504 = t_74.new()
	local var2505 = 0
	while var2505 < buffer.len(p150) do
		local _ = nil
		local var2506 = nil
		local var2507, var2508, var2509 = protoModule.readTag(p150, var2505)
		local var2510 = var2507
		var2506 = var2508
		var2505 = var2509
		
		if var2506 == protoModule.wireTypes.varint then
			local _ = nil
			local var2511, var2512 = protoModule.readVarInt(p150, var2505)
			local _ = var2511
			var2505 = var2512
			continue
		end
		if var2506 == protoModule.wireTypes.lengthDelimited then
			if var2510 == 1 then
				local _ = nil
				local var2513, var2514 = protoModule.readBuffer(p150, var2505)
				var2505 = var2514
				var2504.condition = propConditionModule.PropCondition.decode(var2513)
			elseif var2510 == 2 then
				local _ = nil
				local var2515, var2516 = protoModule.readBuffer(p150, var2505)
				var2505 = var2516
				var2504.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var2515)
				}
			elseif var2510 == 3 then
				local _ = nil
				local var2517, var2518 = protoModule.readBuffer(p150, var2505)
				var2505 = var2518
				var2504.kind = { type = "binding_path", value = buffer.tostring(var2517) }
			else
				local _ = nil
				local var2519, var2520 = protoModule.readVarInt(p150, var2505)
				var2505 = var2520 + var2519
			end
		elseif var2506 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2521, var2522 = protoModule.readFixed32(p150, var2505)
			local _ = var2521
			var2505 = var2522
		elseif var2506 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2523, var2524 = protoModule.readFixed64(p150, var2505)
			local _ = var2523
			var2505 = var2524
		else
			error("Unsupported wire type: " .. var2506)
		end
	end
	return var2504
end

function t_74:jsonEncode() --[[ line: 13034 ]]
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

function t_74:jsonDecode() --[[ line: 13052 ]]
	-- upvalues: t_74 (ref), propConditionModule (ref), t (ref)
	local var2526 = t_74.new()
	
	if self.condition ~= nil then
		var2526.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2526.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2526.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2526.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2526
end

t_74.descriptor = {
	name = "ArrayOfStructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfStructProp_ConditionalOption = t_74
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOption)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p151) --[[ line: 13092 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		options = if p151 == nil or p151.options == nil then {} else p151.options
	}, t_75)
end

function t_75:encode() --[[ line: 13100 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2528 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2529 = v:encode()
			local var2530, var2531 = protoModule.writeTag(buff, var2528, 1, protoModule.wireTypes.lengthDelimited)
			var2530, var2531 = protoModule.writeBuffer(var2530, var2531, var2529, buffer.len(var2529))
			buff = var2530
			var2528 = var2531
		end
	end
	local buff_1 = buffer.create(var2528)
	buffer.copy(buff_1, 0, buff, 0, var2528)
	
	return buff_1
end

function t_75.decode(p152) --[[ line: 13117 ]]
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2533 = t_75.new()
	local var2534 = 0
	while var2534 < buffer.len(p152) do
		local _ = nil
		local var2535 = nil
		local var2536, var2537, var2538 = protoModule.readTag(p152, var2534)
		local var2539 = var2536
		var2535 = var2537
		var2534 = var2538
		
		if var2535 == protoModule.wireTypes.varint then
			local _ = nil
			local var2540, var2541 = protoModule.readVarInt(p152, var2534)
			local _ = var2540
			var2534 = var2541
			continue
		end
		if var2535 == protoModule.wireTypes.lengthDelimited then
			if var2539 == 1 then
				local _ = nil
				local var2542, var2543 = protoModule.readBuffer(p152, var2534)
				var2534 = var2543
				table.insert(var2533.options, t.ArrayOfStructProp_ConditionalOption.decode(var2542))
			else
				local _ = nil
				local var2544, var2545 = protoModule.readVarInt(p152, var2534)
				var2534 = var2545 + var2544
			end
		elseif var2535 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2546, var2547 = protoModule.readFixed32(p152, var2534)
			local _ = var2546
			var2534 = var2547
		elseif var2535 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2548, var2549 = protoModule.readFixed64(p152, var2534)
			local _ = var2548
			var2534 = var2549
		else
			error("Unsupported wire type: " .. var2535)
		end
	end
	return var2533
end

function t_75:jsonEncode() --[[ line: 13160 ]]
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

function t_75:jsonDecode() --[[ line: 13174 ]]
	-- upvalues: t_75 (ref), t (ref)
	local var2552 = t_75.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfStructProp_ConditionalOption.jsonDecode(v))
		end
		var2552.options = t_1
	end
	return var2552
end

t_75.descriptor = {
	name = "ArrayOfStructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfStructProp_ConditionalOptions = t_75
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOptions)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p153) --[[ line: 13205 ]]
	-- upvalues: t_76 (ref)
	return setmetatable({
		entry = if p153 == nil or p153.entry == nil then {} else p153.entry
	}, t_76)
end

function t_76:encode() --[[ line: 13213 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2555 = 0
	
	if self.entry ~= nil and #self.entry > 0 then
		for i, v in self.entry do
			local var2556 = v:encode()
			local var2557, var2558 = protoModule.writeTag(buff, var2555, 1, protoModule.wireTypes.lengthDelimited)
			var2557, var2558 = protoModule.writeBuffer(var2557, var2558, var2556, buffer.len(var2556))
			buff = var2557
			var2555 = var2558
		end
	end
	local buff_1 = buffer.create(var2555)
	buffer.copy(buff_1, 0, buff, 0, var2555)
	
	return buff_1
end

function t_76.decode(p154) --[[ line: 13230 ]]
	-- upvalues: t_76 (ref), protoModule (ref), structModule (ref)
	local var2560 = t_76.new()
	local var2561 = 0
	while var2561 < buffer.len(p154) do
		local _ = nil
		local var2562 = nil
		local var2563, var2564, var2565 = protoModule.readTag(p154, var2561)
		local var2566 = var2563
		var2562 = var2564
		var2561 = var2565
		
		if var2562 == protoModule.wireTypes.varint then
			local _ = nil
			local var2567, var2568 = protoModule.readVarInt(p154, var2561)
			local _ = var2567
			var2561 = var2568
			continue
		end
		if var2562 == protoModule.wireTypes.lengthDelimited then
			if var2566 == 1 then
				local _ = nil
				local var2569, var2570 = protoModule.readBuffer(p154, var2561)
				var2561 = var2570
				table.insert(var2560.entry, structModule.Struct.decode(var2569))
			else
				local _ = nil
				local var2571, var2572 = protoModule.readVarInt(p154, var2561)
				var2561 = var2572 + var2571
			end
		elseif var2562 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2573, var2574 = protoModule.readFixed32(p154, var2561)
			local _ = var2573
			var2561 = var2574
		elseif var2562 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2575, var2576 = protoModule.readFixed64(p154, var2561)
			local _ = var2575
			var2561 = var2576
		else
			error("Unsupported wire type: " .. var2562)
		end
	end
	return var2560
end

function t_76:jsonEncode() --[[ line: 13273 ]]
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

function t_76:jsonDecode() --[[ line: 13287 ]]
	-- upvalues: t_76 (ref), structModule (ref)
	local var2579 = t_76.new()
	
	if self.entry ~= nil then
		local t = {}
		
		for i, v in self.entry do
			table.insert(t, structModule.Struct.jsonDecode(v))
		end
		var2579.entry = t
	end
	return var2579
end

t_76.descriptor = {
	name = "ArrayOfStructProp_ArrayOfStructs",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
}
t.ArrayOfStructProp_ArrayOfStructs = t_76
typeRegistryModule.default:register(t.ArrayOfStructProp_ArrayOfStructs)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p155) --[[ line: 13318 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		kind = if p155 == nil or p155.kind == nil then nil else p155.kind
	}, t_77)
end

function t_77:encode() --[[ line: 13324 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2582 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2583, var2584 = protoModule.writeTag(buff, var2582, 1, protoModule.wireTypes.lengthDelimited)
			var2583, var2584 = protoModule.writeString(var2583, var2584, self.kind.value)
			buff = var2583
			var2582 = var2584
		elseif self.kind.type == "token" then
			local var2585, var2586 = protoModule.writeTag(buff, var2582, 2, protoModule.wireTypes.lengthDelimited)
			var2585, var2586 = protoModule.writeString(var2585, var2586, self.kind.value)
			buff = var2585
			var2582 = var2586
		elseif self.kind.type == "conditional" then
			local var2587 = self.kind.value:encode()
			local var2588, var2589 = protoModule.writeTag(buff, var2582, 3, protoModule.wireTypes.lengthDelimited)
			var2588, var2589 = protoModule.writeBuffer(var2588, var2589, var2587, buffer.len(var2587))
			buff = var2588
			var2582 = var2589
		elseif self.kind.type == "binding_path" then
			local var2590, var2591 = protoModule.writeTag(buff, var2582, 4, protoModule.wireTypes.lengthDelimited)
			var2590, var2591 = protoModule.writeString(var2590, var2591, self.kind.value)
			buff = var2590
			var2582 = var2591
		end
	end
	local buff_1 = buffer.create(var2582)
	buffer.copy(buff_1, 0, buff, 0, var2582)
	
	return buff_1
end

function t_77.decode(p156) --[[ line: 13350 ]]
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2593 = t_77.new()
	local var2594 = 0
	while var2594 < buffer.len(p156) do
		local _ = nil
		local var2595 = nil
		local var2596, var2597, var2598 = protoModule.readTag(p156, var2594)
		local var2599 = var2596
		var2595 = var2597
		var2594 = var2598
		
		if var2595 == protoModule.wireTypes.varint then
			local _ = nil
			local var2600, var2601 = protoModule.readVarInt(p156, var2594)
			local _ = var2600
			var2594 = var2601
			continue
		end
		if var2595 == protoModule.wireTypes.lengthDelimited then
			if var2599 == 1 then
				local _ = nil
				local var2602, var2603 = protoModule.readBuffer(p156, var2594)
				var2594 = var2603
				var2593.kind = { type = "literal", value = buffer.tostring(var2602) }
			elseif var2599 == 2 then
				local _ = nil
				local var2604, var2605 = protoModule.readBuffer(p156, var2594)
				var2594 = var2605
				var2593.kind = { type = "token", value = buffer.tostring(var2604) }
			elseif var2599 == 3 then
				local _ = nil
				local var2606, var2607 = protoModule.readBuffer(p156, var2594)
				var2594 = var2607
				var2593.kind = {
					type = "conditional",
					value = t.UiScaledFloatProp_ConditionalOptions.decode(var2606)
				}
			elseif var2599 == 4 then
				local _ = nil
				local var2608, var2609 = protoModule.readBuffer(p156, var2594)
				var2594 = var2609
				var2593.kind = { type = "binding_path", value = buffer.tostring(var2608) }
			else
				local _ = nil
				local var2610, var2611 = protoModule.readVarInt(p156, var2594)
				var2594 = var2611 + var2610
			end
		elseif var2595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2612, var2613 = protoModule.readFixed32(p156, var2594)
			local _ = var2612
			var2594 = var2613
		elseif var2595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2614, var2615 = protoModule.readFixed64(p156, var2594)
			local _ = var2614
			var2594 = var2615
		else
			error("Unsupported wire type: " .. var2595)
		end
	end
	return var2593
end

function t_77:jsonEncode() --[[ line: 13409 ]]
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

function t_77:jsonDecode() --[[ line: 13427 ]]
	-- upvalues: t_77 (ref), t (ref)
	local var2617 = t_77.new()
	
	if self.literal ~= nil then
		var2617.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2617.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2617.kind = {
			type = "conditional",
			value = t.UiScaledFloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2617.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2617.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2617
end

t_77.descriptor = {
	name = "UiScaledFloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
}
t.UiScaledFloatProp = t_77
typeRegistryModule.default:register(t.UiScaledFloatProp)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p157) --[[ line: 13470 ]]
	-- upvalues: t_78 (ref)
	return setmetatable({
		condition = if p157 == nil or p157.condition == nil then nil else p157.condition,
		kind = if p157 == nil or p157.kind == nil then nil else p157.kind
	}, t_78)
end

function t_78:encode() --[[ line: 13479 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2619 = 0
	
	if self.condition ~= nil then
		local var2620 = self.condition:encode()
		local var2621, var2622 = protoModule.writeTag(buff, var2619, 1, protoModule.wireTypes.lengthDelimited)
		var2621, var2622 = protoModule.writeBuffer(var2621, var2622, var2620, buffer.len(var2620))
		buff = var2621
		var2619 = var2622
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2623, var2624 = protoModule.writeTag(buff, var2619, 2, protoModule.wireTypes.lengthDelimited)
			var2623, var2624 = protoModule.writeString(var2623, var2624, self.kind.value)
			buff = var2623
			var2619 = var2624
		elseif self.kind.type == "token" then
			local var2625, var2626 = protoModule.writeTag(buff, var2619, 3, protoModule.wireTypes.lengthDelimited)
			var2625, var2626 = protoModule.writeString(var2625, var2626, self.kind.value)
			buff = var2625
			var2619 = var2626
		elseif self.kind.type == "binding_path" then
			local var2627, var2628 = protoModule.writeTag(buff, var2619, 4, protoModule.wireTypes.lengthDelimited)
			var2627, var2628 = protoModule.writeString(var2627, var2628, self.kind.value)
			buff = var2627
			var2619 = var2628
		end
	end
	local buff_1 = buffer.create(var2619)
	buffer.copy(buff_1, 0, buff, 0, var2619)
	
	return buff_1
end

function t_78.decode(p158) --[[ line: 13507 ]]
	-- upvalues: t_78 (ref), protoModule (ref), propConditionModule (ref)
	local var2630 = t_78.new()
	local var2631 = 0
	while var2631 < buffer.len(p158) do
		local _ = nil
		local var2632 = nil
		local var2633, var2634, var2635 = protoModule.readTag(p158, var2631)
		local var2636 = var2633
		var2632 = var2634
		var2631 = var2635
		
		if var2632 == protoModule.wireTypes.varint then
			local _ = nil
			local var2637, var2638 = protoModule.readVarInt(p158, var2631)
			local _ = var2637
			var2631 = var2638
			continue
		end
		if var2632 == protoModule.wireTypes.lengthDelimited then
			if var2636 == 1 then
				local _ = nil
				local var2639, var2640 = protoModule.readBuffer(p158, var2631)
				var2631 = var2640
				var2630.condition = propConditionModule.PropCondition.decode(var2639)
			elseif var2636 == 2 then
				local _ = nil
				local var2641, var2642 = protoModule.readBuffer(p158, var2631)
				var2631 = var2642
				var2630.kind = { type = "literal", value = buffer.tostring(var2641) }
			elseif var2636 == 3 then
				local _ = nil
				local var2643, var2644 = protoModule.readBuffer(p158, var2631)
				var2631 = var2644
				var2630.kind = { type = "token", value = buffer.tostring(var2643) }
			elseif var2636 == 4 then
				local _ = nil
				local var2645, var2646 = protoModule.readBuffer(p158, var2631)
				var2631 = var2646
				var2630.kind = { type = "binding_path", value = buffer.tostring(var2645) }
			else
				local _ = nil
				local var2647, var2648 = protoModule.readVarInt(p158, var2631)
				var2631 = var2648 + var2647
			end
		elseif var2632 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2649, var2650 = protoModule.readFixed32(p158, var2631)
			local _ = var2649
			var2631 = var2650
		elseif var2632 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2651, var2652 = protoModule.readFixed64(p158, var2631)
			local _ = var2651
			var2631 = var2652
		else
			error("Unsupported wire type: " .. var2632)
		end
	end
	return var2630
end

function t_78:jsonEncode() --[[ line: 13565 ]]
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

function t_78:jsonDecode() --[[ line: 13585 ]]
	-- upvalues: t_78 (ref), propConditionModule (ref)
	local var2654 = t_78.new()
	
	if self.condition ~= nil then
		var2654.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2654.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2654.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2654.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2654.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2654
end

t_78.descriptor = {
	name = "UiScaledFloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledFloatProp_ConditionalOption = t_78
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p159) --[[ line: 13628 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		options = if p159 == nil or p159.options == nil then {} else p159.options
	}, t_79)
end

function t_79:encode() --[[ line: 13636 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2656 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2657 = v:encode()
			local var2658, var2659 = protoModule.writeTag(buff, var2656, 1, protoModule.wireTypes.lengthDelimited)
			var2658, var2659 = protoModule.writeBuffer(var2658, var2659, var2657, buffer.len(var2657))
			buff = var2658
			var2656 = var2659
		end
	end
	local buff_1 = buffer.create(var2656)
	buffer.copy(buff_1, 0, buff, 0, var2656)
	
	return buff_1
end

function t_79.decode(p160) --[[ line: 13653 ]]
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2661 = t_79.new()
	local var2662 = 0
	while var2662 < buffer.len(p160) do
		local _ = nil
		local var2663 = nil
		local var2664, var2665, var2666 = protoModule.readTag(p160, var2662)
		local var2667 = var2664
		var2663 = var2665
		var2662 = var2666
		
		if var2663 == protoModule.wireTypes.varint then
			local _ = nil
			local var2668, var2669 = protoModule.readVarInt(p160, var2662)
			local _ = var2668
			var2662 = var2669
			continue
		end
		if var2663 == protoModule.wireTypes.lengthDelimited then
			if var2667 == 1 then
				local _ = nil
				local var2670, var2671 = protoModule.readBuffer(p160, var2662)
				var2662 = var2671
				table.insert(var2661.options, t.UiScaledFloatProp_ConditionalOption.decode(var2670))
			else
				local _ = nil
				local var2672, var2673 = protoModule.readVarInt(p160, var2662)
				var2662 = var2673 + var2672
			end
		elseif var2663 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2674, var2675 = protoModule.readFixed32(p160, var2662)
			local _ = var2674
			var2662 = var2675
		elseif var2663 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2676, var2677 = protoModule.readFixed64(p160, var2662)
			local _ = var2676
			var2662 = var2677
		else
			error("Unsupported wire type: " .. var2663)
		end
	end
	return var2661
end

function t_79:jsonEncode() --[[ line: 13696 ]]
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

function t_79:jsonDecode() --[[ line: 13710 ]]
	-- upvalues: t_79 (ref), t (ref)
	local var2680 = t_79.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledFloatProp_ConditionalOption.jsonDecode(v))
		end
		var2680.options = t_1
	end
	return var2680
end

t_79.descriptor = {
	name = "UiScaledFloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledFloatProp_ConditionalOptions = t_79
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOptions)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p161) --[[ line: 13741 ]]
	-- upvalues: t_80 (ref)
	return setmetatable({
		kind = if p161 == nil or p161.kind == nil then nil else p161.kind
	}, t_80)
end

function t_80:encode() --[[ line: 13747 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2683 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2684, var2685 = protoModule.writeTag(buff, var2683, 1, protoModule.wireTypes.lengthDelimited)
			var2684, var2685 = protoModule.writeString(var2684, var2685, self.kind.value)
			buff = var2684
			var2683 = var2685
		elseif self.kind.type == "token" then
			local var2686, var2687 = protoModule.writeTag(buff, var2683, 2, protoModule.wireTypes.lengthDelimited)
			var2686, var2687 = protoModule.writeString(var2686, var2687, self.kind.value)
			buff = var2686
			var2683 = var2687
		elseif self.kind.type == "conditional" then
			local var2688 = self.kind.value:encode()
			local var2689, var2690 = protoModule.writeTag(buff, var2683, 3, protoModule.wireTypes.lengthDelimited)
			var2689, var2690 = protoModule.writeBuffer(var2689, var2690, var2688, buffer.len(var2688))
			buff = var2689
			var2683 = var2690
		elseif self.kind.type == "binding_path" then
			local var2691, var2692 = protoModule.writeTag(buff, var2683, 4, protoModule.wireTypes.lengthDelimited)
			var2691, var2692 = protoModule.writeString(var2691, var2692, self.kind.value)
			buff = var2691
			var2683 = var2692
		end
	end
	local buff_1 = buffer.create(var2683)
	buffer.copy(buff_1, 0, buff, 0, var2683)
	
	return buff_1
end

function t_80.decode(p162) --[[ line: 13773 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2694 = t_80.new()
	local var2695 = 0
	while var2695 < buffer.len(p162) do
		local _ = nil
		local var2696 = nil
		local var2697, var2698, var2699 = protoModule.readTag(p162, var2695)
		local var2700 = var2697
		var2696 = var2698
		var2695 = var2699
		
		if var2696 == protoModule.wireTypes.varint then
			local _ = nil
			local var2701, var2702 = protoModule.readVarInt(p162, var2695)
			local _ = var2701
			var2695 = var2702
			continue
		end
		if var2696 == protoModule.wireTypes.lengthDelimited then
			if var2700 == 1 then
				local _ = nil
				local var2703, var2704 = protoModule.readBuffer(p162, var2695)
				var2695 = var2704
				var2694.kind = { type = "literal", value = buffer.tostring(var2703) }
			elseif var2700 == 2 then
				local _ = nil
				local var2705, var2706 = protoModule.readBuffer(p162, var2695)
				var2695 = var2706
				var2694.kind = { type = "token", value = buffer.tostring(var2705) }
			elseif var2700 == 3 then
				local _ = nil
				local var2707, var2708 = protoModule.readBuffer(p162, var2695)
				var2695 = var2708
				var2694.kind = {
					type = "conditional",
					value = t.UiScaledUDimProp_ConditionalOptions.decode(var2707)
				}
			elseif var2700 == 4 then
				local _ = nil
				local var2709, var2710 = protoModule.readBuffer(p162, var2695)
				var2695 = var2710
				var2694.kind = { type = "binding_path", value = buffer.tostring(var2709) }
			else
				local _ = nil
				local var2711, var2712 = protoModule.readVarInt(p162, var2695)
				var2695 = var2712 + var2711
			end
		elseif var2696 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2713, var2714 = protoModule.readFixed32(p162, var2695)
			local _ = var2713
			var2695 = var2714
		elseif var2696 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2715, var2716 = protoModule.readFixed64(p162, var2695)
			local _ = var2715
			var2695 = var2716
		else
			error("Unsupported wire type: " .. var2696)
		end
	end
	return var2694
end

function t_80:jsonEncode() --[[ line: 13832 ]]
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

function t_80:jsonDecode() --[[ line: 13850 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var2718 = t_80.new()
	
	if self.literal ~= nil then
		var2718.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2718.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2718.kind = {
			type = "conditional",
			value = t.UiScaledUDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2718.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2718.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2718
end

t_80.descriptor = {
	name = "UiScaledUDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
}
t.UiScaledUDimProp = t_80
typeRegistryModule.default:register(t.UiScaledUDimProp)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p163) --[[ line: 13893 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		condition = if p163 == nil or p163.condition == nil then nil else p163.condition,
		kind = if p163 == nil or p163.kind == nil then nil else p163.kind
	}, t_81)
end

function t_81:encode() --[[ line: 13902 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2720 = 0
	
	if self.condition ~= nil then
		local var2721 = self.condition:encode()
		local var2722, var2723 = protoModule.writeTag(buff, var2720, 1, protoModule.wireTypes.lengthDelimited)
		var2722, var2723 = protoModule.writeBuffer(var2722, var2723, var2721, buffer.len(var2721))
		buff = var2722
		var2720 = var2723
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2724, var2725 = protoModule.writeTag(buff, var2720, 2, protoModule.wireTypes.lengthDelimited)
			var2724, var2725 = protoModule.writeString(var2724, var2725, self.kind.value)
			buff = var2724
			var2720 = var2725
		elseif self.kind.type == "token" then
			local var2726, var2727 = protoModule.writeTag(buff, var2720, 3, protoModule.wireTypes.lengthDelimited)
			var2726, var2727 = protoModule.writeString(var2726, var2727, self.kind.value)
			buff = var2726
			var2720 = var2727
		elseif self.kind.type == "binding_path" then
			local var2728, var2729 = protoModule.writeTag(buff, var2720, 4, protoModule.wireTypes.lengthDelimited)
			var2728, var2729 = protoModule.writeString(var2728, var2729, self.kind.value)
			buff = var2728
			var2720 = var2729
		end
	end
	local buff_1 = buffer.create(var2720)
	buffer.copy(buff_1, 0, buff, 0, var2720)
	
	return buff_1
end

function t_81.decode(p164) --[[ line: 13930 ]]
	-- upvalues: t_81 (ref), protoModule (ref), propConditionModule (ref)
	local var2731 = t_81.new()
	local var2732 = 0
	while var2732 < buffer.len(p164) do
		local _ = nil
		local var2733 = nil
		local var2734, var2735, var2736 = protoModule.readTag(p164, var2732)
		local var2737 = var2734
		var2733 = var2735
		var2732 = var2736
		
		if var2733 == protoModule.wireTypes.varint then
			local _ = nil
			local var2738, var2739 = protoModule.readVarInt(p164, var2732)
			local _ = var2738
			var2732 = var2739
			continue
		end
		if var2733 == protoModule.wireTypes.lengthDelimited then
			if var2737 == 1 then
				local _ = nil
				local var2740, var2741 = protoModule.readBuffer(p164, var2732)
				var2732 = var2741
				var2731.condition = propConditionModule.PropCondition.decode(var2740)
			elseif var2737 == 2 then
				local _ = nil
				local var2742, var2743 = protoModule.readBuffer(p164, var2732)
				var2732 = var2743
				var2731.kind = { type = "literal", value = buffer.tostring(var2742) }
			elseif var2737 == 3 then
				local _ = nil
				local var2744, var2745 = protoModule.readBuffer(p164, var2732)
				var2732 = var2745
				var2731.kind = { type = "token", value = buffer.tostring(var2744) }
			elseif var2737 == 4 then
				local _ = nil
				local var2746, var2747 = protoModule.readBuffer(p164, var2732)
				var2732 = var2747
				var2731.kind = { type = "binding_path", value = buffer.tostring(var2746) }
			else
				local _ = nil
				local var2748, var2749 = protoModule.readVarInt(p164, var2732)
				var2732 = var2749 + var2748
			end
		elseif var2733 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2750, var2751 = protoModule.readFixed32(p164, var2732)
			local _ = var2750
			var2732 = var2751
		elseif var2733 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2752, var2753 = protoModule.readFixed64(p164, var2732)
			local _ = var2752
			var2732 = var2753
		else
			error("Unsupported wire type: " .. var2733)
		end
	end
	return var2731
end

function t_81:jsonEncode() --[[ line: 13988 ]]
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

function t_81:jsonDecode() --[[ line: 14008 ]]
	-- upvalues: t_81 (ref), propConditionModule (ref)
	local var2755 = t_81.new()
	
	if self.condition ~= nil then
		var2755.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2755.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2755.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2755.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2755.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2755
end

t_81.descriptor = {
	name = "UiScaledUDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDimProp_ConditionalOption = t_81
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOption)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p165) --[[ line: 14051 ]]
	-- upvalues: t_82 (ref)
	return setmetatable({
		options = if p165 == nil or p165.options == nil then {} else p165.options
	}, t_82)
end

function t_82:encode() --[[ line: 14059 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2757 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2758 = v:encode()
			local var2759, var2760 = protoModule.writeTag(buff, var2757, 1, protoModule.wireTypes.lengthDelimited)
			var2759, var2760 = protoModule.writeBuffer(var2759, var2760, var2758, buffer.len(var2758))
			buff = var2759
			var2757 = var2760
		end
	end
	local buff_1 = buffer.create(var2757)
	buffer.copy(buff_1, 0, buff, 0, var2757)
	
	return buff_1
end

function t_82.decode(p166) --[[ line: 14076 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2762 = t_82.new()
	local var2763 = 0
	while var2763 < buffer.len(p166) do
		local _ = nil
		local var2764 = nil
		local var2765, var2766, var2767 = protoModule.readTag(p166, var2763)
		local var2768 = var2765
		var2764 = var2766
		var2763 = var2767
		
		if var2764 == protoModule.wireTypes.varint then
			local _ = nil
			local var2769, var2770 = protoModule.readVarInt(p166, var2763)
			local _ = var2769
			var2763 = var2770
			continue
		end
		if var2764 == protoModule.wireTypes.lengthDelimited then
			if var2768 == 1 then
				local _ = nil
				local var2771, var2772 = protoModule.readBuffer(p166, var2763)
				var2763 = var2772
				table.insert(var2762.options, t.UiScaledUDimProp_ConditionalOption.decode(var2771))
			else
				local _ = nil
				local var2773, var2774 = protoModule.readVarInt(p166, var2763)
				var2763 = var2774 + var2773
			end
		elseif var2764 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2775, var2776 = protoModule.readFixed32(p166, var2763)
			local _ = var2775
			var2763 = var2776
		elseif var2764 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2777, var2778 = protoModule.readFixed64(p166, var2763)
			local _ = var2777
			var2763 = var2778
		else
			error("Unsupported wire type: " .. var2764)
		end
	end
	return var2762
end

function t_82:jsonEncode() --[[ line: 14119 ]]
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

function t_82:jsonDecode() --[[ line: 14133 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var2781 = t_82.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDimProp_ConditionalOption.jsonDecode(v))
		end
		var2781.options = t_1
	end
	return var2781
end

t_82.descriptor = {
	name = "UiScaledUDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDimProp_ConditionalOptions = t_82
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOptions)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p167) --[[ line: 14164 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		kind = if p167 == nil or p167.kind == nil then nil else p167.kind
	}, t_83)
end

function t_83:encode() --[[ line: 14170 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2784 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2785, var2786 = protoModule.writeTag(buff, var2784, 1, protoModule.wireTypes.lengthDelimited)
			var2785, var2786 = protoModule.writeString(var2785, var2786, self.kind.value)
			buff = var2785
			var2784 = var2786
		elseif self.kind.type == "token" then
			local var2787, var2788 = protoModule.writeTag(buff, var2784, 2, protoModule.wireTypes.lengthDelimited)
			var2787, var2788 = protoModule.writeString(var2787, var2788, self.kind.value)
			buff = var2787
			var2784 = var2788
		elseif self.kind.type == "conditional" then
			local var2789 = self.kind.value:encode()
			local var2790, var2791 = protoModule.writeTag(buff, var2784, 3, protoModule.wireTypes.lengthDelimited)
			var2790, var2791 = protoModule.writeBuffer(var2790, var2791, var2789, buffer.len(var2789))
			buff = var2790
			var2784 = var2791
		elseif self.kind.type == "binding_path" then
			local var2792, var2793 = protoModule.writeTag(buff, var2784, 4, protoModule.wireTypes.lengthDelimited)
			var2792, var2793 = protoModule.writeString(var2792, var2793, self.kind.value)
			buff = var2792
			var2784 = var2793
		end
	end
	local buff_1 = buffer.create(var2784)
	buffer.copy(buff_1, 0, buff, 0, var2784)
	
	return buff_1
end

function t_83.decode(p168) --[[ line: 14196 ]]
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2795 = t_83.new()
	local var2796 = 0
	while var2796 < buffer.len(p168) do
		local _ = nil
		local var2797 = nil
		local var2798, var2799, var2800 = protoModule.readTag(p168, var2796)
		local var2801 = var2798
		var2797 = var2799
		var2796 = var2800
		
		if var2797 == protoModule.wireTypes.varint then
			local _ = nil
			local var2802, var2803 = protoModule.readVarInt(p168, var2796)
			local _ = var2802
			var2796 = var2803
			continue
		end
		if var2797 == protoModule.wireTypes.lengthDelimited then
			if var2801 == 1 then
				local _ = nil
				local var2804, var2805 = protoModule.readBuffer(p168, var2796)
				var2796 = var2805
				var2795.kind = { type = "literal", value = buffer.tostring(var2804) }
			elseif var2801 == 2 then
				local _ = nil
				local var2806, var2807 = protoModule.readBuffer(p168, var2796)
				var2796 = var2807
				var2795.kind = { type = "token", value = buffer.tostring(var2806) }
			elseif var2801 == 3 then
				local _ = nil
				local var2808, var2809 = protoModule.readBuffer(p168, var2796)
				var2796 = var2809
				var2795.kind = {
					type = "conditional",
					value = t.UiScaledUDim2Prop_ConditionalOptions.decode(var2808)
				}
			elseif var2801 == 4 then
				local _ = nil
				local var2810, var2811 = protoModule.readBuffer(p168, var2796)
				var2796 = var2811
				var2795.kind = { type = "binding_path", value = buffer.tostring(var2810) }
			else
				local _ = nil
				local var2812, var2813 = protoModule.readVarInt(p168, var2796)
				var2796 = var2813 + var2812
			end
		elseif var2797 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2814, var2815 = protoModule.readFixed32(p168, var2796)
			local _ = var2814
			var2796 = var2815
		elseif var2797 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2816, var2817 = protoModule.readFixed64(p168, var2796)
			local _ = var2816
			var2796 = var2817
		else
			error("Unsupported wire type: " .. var2797)
		end
	end
	return var2795
end

function t_83:jsonEncode() --[[ line: 14255 ]]
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

function t_83:jsonDecode() --[[ line: 14273 ]]
	-- upvalues: t_83 (ref), t (ref)
	local var2819 = t_83.new()
	
	if self.literal ~= nil then
		var2819.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2819.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2819.kind = {
			type = "conditional",
			value = t.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2819.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2819.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2819
end

t_83.descriptor = {
	name = "UiScaledUDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
}
t.UiScaledUDim2Prop = t_83
typeRegistryModule.default:register(t.UiScaledUDim2Prop)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p169) --[[ line: 14316 ]]
	-- upvalues: t_84 (ref)
	return setmetatable({
		condition = if p169 == nil or p169.condition == nil then nil else p169.condition,
		kind = if p169 == nil or p169.kind == nil then nil else p169.kind
	}, t_84)
end

function t_84:encode() --[[ line: 14325 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2821 = 0
	
	if self.condition ~= nil then
		local var2822 = self.condition:encode()
		local var2823, var2824 = protoModule.writeTag(buff, var2821, 1, protoModule.wireTypes.lengthDelimited)
		var2823, var2824 = protoModule.writeBuffer(var2823, var2824, var2822, buffer.len(var2822))
		buff = var2823
		var2821 = var2824
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2825, var2826 = protoModule.writeTag(buff, var2821, 2, protoModule.wireTypes.lengthDelimited)
			var2825, var2826 = protoModule.writeString(var2825, var2826, self.kind.value)
			buff = var2825
			var2821 = var2826
		elseif self.kind.type == "token" then
			local var2827, var2828 = protoModule.writeTag(buff, var2821, 3, protoModule.wireTypes.lengthDelimited)
			var2827, var2828 = protoModule.writeString(var2827, var2828, self.kind.value)
			buff = var2827
			var2821 = var2828
		elseif self.kind.type == "binding_path" then
			local var2829, var2830 = protoModule.writeTag(buff, var2821, 4, protoModule.wireTypes.lengthDelimited)
			var2829, var2830 = protoModule.writeString(var2829, var2830, self.kind.value)
			buff = var2829
			var2821 = var2830
		end
	end
	local buff_1 = buffer.create(var2821)
	buffer.copy(buff_1, 0, buff, 0, var2821)
	
	return buff_1
end

function t_84.decode(p170) --[[ line: 14353 ]]
	-- upvalues: t_84 (ref), protoModule (ref), propConditionModule (ref)
	local var2832 = t_84.new()
	local var2833 = 0
	while var2833 < buffer.len(p170) do
		local _ = nil
		local var2834 = nil
		local var2835, var2836, var2837 = protoModule.readTag(p170, var2833)
		local var2838 = var2835
		var2834 = var2836
		var2833 = var2837
		
		if var2834 == protoModule.wireTypes.varint then
			local _ = nil
			local var2839, var2840 = protoModule.readVarInt(p170, var2833)
			local _ = var2839
			var2833 = var2840
			continue
		end
		if var2834 == protoModule.wireTypes.lengthDelimited then
			if var2838 == 1 then
				local _ = nil
				local var2841, var2842 = protoModule.readBuffer(p170, var2833)
				var2833 = var2842
				var2832.condition = propConditionModule.PropCondition.decode(var2841)
			elseif var2838 == 2 then
				local _ = nil
				local var2843, var2844 = protoModule.readBuffer(p170, var2833)
				var2833 = var2844
				var2832.kind = { type = "literal", value = buffer.tostring(var2843) }
			elseif var2838 == 3 then
				local _ = nil
				local var2845, var2846 = protoModule.readBuffer(p170, var2833)
				var2833 = var2846
				var2832.kind = { type = "token", value = buffer.tostring(var2845) }
			elseif var2838 == 4 then
				local _ = nil
				local var2847, var2848 = protoModule.readBuffer(p170, var2833)
				var2833 = var2848
				var2832.kind = { type = "binding_path", value = buffer.tostring(var2847) }
			else
				local _ = nil
				local var2849, var2850 = protoModule.readVarInt(p170, var2833)
				var2833 = var2850 + var2849
			end
		elseif var2834 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2851, var2852 = protoModule.readFixed32(p170, var2833)
			local _ = var2851
			var2833 = var2852
		elseif var2834 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2853, var2854 = protoModule.readFixed64(p170, var2833)
			local _ = var2853
			var2833 = var2854
		else
			error("Unsupported wire type: " .. var2834)
		end
	end
	return var2832
end

function t_84:jsonEncode() --[[ line: 14411 ]]
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

function t_84:jsonDecode() --[[ line: 14431 ]]
	-- upvalues: t_84 (ref), propConditionModule (ref)
	local var2856 = t_84.new()
	
	if self.condition ~= nil then
		var2856.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2856.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2856.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2856.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2856.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2856
end

t_84.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDim2Prop_ConditionalOption = t_84
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOption)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p171) --[[ line: 14474 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		options = if p171 == nil or p171.options == nil then {} else p171.options
	}, t_85)
end

function t_85:encode() --[[ line: 14482 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2858 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2859 = v:encode()
			local var2860, var2861 = protoModule.writeTag(buff, var2858, 1, protoModule.wireTypes.lengthDelimited)
			var2860, var2861 = protoModule.writeBuffer(var2860, var2861, var2859, buffer.len(var2859))
			buff = var2860
			var2858 = var2861
		end
	end
	local buff_1 = buffer.create(var2858)
	buffer.copy(buff_1, 0, buff, 0, var2858)
	
	return buff_1
end

function t_85.decode(p172) --[[ line: 14499 ]]
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2863 = t_85.new()
	local var2864 = 0
	while var2864 < buffer.len(p172) do
		local _ = nil
		local var2865 = nil
		local var2866, var2867, var2868 = protoModule.readTag(p172, var2864)
		local var2869 = var2866
		var2865 = var2867
		var2864 = var2868
		
		if var2865 == protoModule.wireTypes.varint then
			local _ = nil
			local var2870, var2871 = protoModule.readVarInt(p172, var2864)
			local _ = var2870
			var2864 = var2871
			continue
		end
		if var2865 == protoModule.wireTypes.lengthDelimited then
			if var2869 == 1 then
				local _ = nil
				local var2872, var2873 = protoModule.readBuffer(p172, var2864)
				var2864 = var2873
				table.insert(var2863.options, t.UiScaledUDim2Prop_ConditionalOption.decode(var2872))
			else
				local _ = nil
				local var2874, var2875 = protoModule.readVarInt(p172, var2864)
				var2864 = var2875 + var2874
			end
		elseif var2865 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2876, var2877 = protoModule.readFixed32(p172, var2864)
			local _ = var2876
			var2864 = var2877
		elseif var2865 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2878, var2879 = protoModule.readFixed64(p172, var2864)
			local _ = var2878
			var2864 = var2879
		else
			error("Unsupported wire type: " .. var2865)
		end
	end
	return var2863
end

function t_85:jsonEncode() --[[ line: 14542 ]]
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

function t_85:jsonDecode() --[[ line: 14556 ]]
	-- upvalues: t_85 (ref), t (ref)
	local var2882 = t_85.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var2882.options = t_1
	end
	return var2882
end

t_85.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDim2Prop_ConditionalOptions = t_85
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOptions)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p173) --[[ line: 14587 ]]
	-- upvalues: t_86 (ref)
	return setmetatable({
		user_id = if p173 == nil or p173.user_id == nil then nil else p173.user_id,
		user_presence = if p173 == nil or p173.user_presence == nil then nil else p173.user_presence
	}, t_86)
end

function t_86:encode() --[[ line: 14594 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2885 = 0
	
	if self.user_id ~= nil then
		local var2886 = self.user_id:encode()
		local var2887, var2888 = protoModule.writeTag(buff, var2885, 1, protoModule.wireTypes.lengthDelimited)
		var2887, var2888 = protoModule.writeBuffer(var2887, var2888, var2886, buffer.len(var2886))
		buff = var2887
		var2885 = var2888
	end
	if self.user_presence ~= nil then
		local var2889 = self.user_presence:encode()
		local var2890, var2891 = protoModule.writeTag(buff, var2885, 2, protoModule.wireTypes.lengthDelimited)
		var2890, var2891 = protoModule.writeBuffer(var2890, var2891, var2889, buffer.len(var2889))
		buff = var2890
		var2885 = var2891
	end
	local buff_1 = buffer.create(var2885)
	buffer.copy(buff_1, 0, buff, 0, var2885)
	
	return buff_1
end

function t_86.decode(p174) --[[ line: 14615 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2893 = t_86.new()
	local var2894 = 0
	while var2894 < buffer.len(p174) do
		local _ = nil
		local var2895 = nil
		local var2896, var2897, var2898 = protoModule.readTag(p174, var2894)
		local var2899 = var2896
		var2895 = var2897
		var2894 = var2898
		
		if var2895 == protoModule.wireTypes.varint then
			local _ = nil
			local var2900, var2901 = protoModule.readVarInt(p174, var2894)
			local _ = var2900
			var2894 = var2901
			continue
		end
		if var2895 == protoModule.wireTypes.lengthDelimited then
			if var2899 == 1 then
				local _ = nil
				local var2902, var2903 = protoModule.readBuffer(p174, var2894)
				var2894 = var2903
				var2893.user_id = t.Int64Prop.decode(var2902)
			elseif var2899 == 2 then
				local _ = nil
				local var2904, var2905 = protoModule.readBuffer(p174, var2894)
				var2894 = var2905
				var2893.user_presence = t.StringProp.decode(var2904)
			else
				local _ = nil
				local var2906, var2907 = protoModule.readVarInt(p174, var2894)
				var2894 = var2907 + var2906
			end
		elseif var2895 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2908, var2909 = protoModule.readFixed32(p174, var2894)
			local _ = var2908
			var2894 = var2909
		elseif var2895 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2910, var2911 = protoModule.readFixed64(p174, var2894)
			local _ = var2910
			var2894 = var2911
		else
			error("Unsupported wire type: " .. var2895)
		end
	end
	return var2893
end

function t_86:jsonEncode() --[[ line: 14663 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.user_presence ~= nil then
		t.userPresence = self.user_presence:jsonEncode()
	end
	return t
end

function t_86:jsonDecode() --[[ line: 14677 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var2913 = t_86.new()
	
	if self.user_id ~= nil then
		var2913.user_id = t.Int64Prop.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var2913.user_id = t.Int64Prop.jsonDecode(self.userId)
	end
	if self.user_presence ~= nil then
		var2913.user_presence = t.StringProp.jsonDecode(self.user_presence)
	end
	if self.userPresence ~= nil then
		var2913.user_presence = t.StringProp.jsonDecode(self.userPresence)
	end
	return var2913
end

t_86.descriptor = {
	name = "AvatarConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarConfigProp"
}
t.AvatarConfigProp = t_86
typeRegistryModule.default:register(t.AvatarConfigProp)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p175) --[[ line: 14713 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		oneof_prop = if p175 == nil or p175.oneof_prop == nil then nil else p175.oneof_prop
	}, t_87)
end

function t_87:encode() --[[ line: 14719 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2915 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "user_id" then
			local var2916 = self.oneof_prop.value:encode()
			local var2917, var2918 = protoModule.writeTag(buff, var2915, 1, protoModule.wireTypes.lengthDelimited)
			var2917, var2918 = protoModule.writeBuffer(var2917, var2918, var2916, buffer.len(var2916))
			buff = var2917
			var2915 = var2918
		elseif self.oneof_prop.type == "avatar_config" then
			local var2919 = self.oneof_prop.value:encode()
			local var2920, var2921 = protoModule.writeTag(buff, var2915, 2, protoModule.wireTypes.lengthDelimited)
			var2920, var2921 = protoModule.writeBuffer(var2920, var2921, var2919, buffer.len(var2919))
			buff = var2920
			var2915 = var2921
		end
	end
	local buff_1 = buffer.create(var2915)
	buffer.copy(buff_1, 0, buff, 0, var2915)
	
	return buff_1
end

function t_87.decode(p176) --[[ line: 14740 ]]
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2923 = t_87.new()
	local var2924 = 0
	while var2924 < buffer.len(p176) do
		local _ = nil
		local var2925 = nil
		local var2926, var2927, var2928 = protoModule.readTag(p176, var2924)
		local var2929 = var2926
		var2925 = var2927
		var2924 = var2928
		
		if var2925 == protoModule.wireTypes.varint then
			local _ = nil
			local var2930, var2931 = protoModule.readVarInt(p176, var2924)
			local _ = var2930
			var2924 = var2931
			continue
		end
		if var2925 == protoModule.wireTypes.lengthDelimited then
			if var2929 == 1 then
				local _ = nil
				local var2932, var2933 = protoModule.readBuffer(p176, var2924)
				var2924 = var2933
				var2923.oneof_prop = { type = "user_id", value = t.Int64Prop.decode(var2932) }
			elseif var2929 == 2 then
				local _ = nil
				local var2934, var2935 = protoModule.readBuffer(p176, var2924)
				var2924 = var2935
				var2923.oneof_prop = {
					type = "avatar_config",
					value = t.AvatarConfigProp.decode(var2934)
				}
			else
				local _ = nil
				local var2936, var2937 = protoModule.readVarInt(p176, var2924)
				var2924 = var2937 + var2936
			end
		elseif var2925 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2938, var2939 = protoModule.readFixed32(p176, var2924)
			local _ = var2938
			var2924 = var2939
		elseif var2925 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2940, var2941 = protoModule.readFixed64(p176, var2924)
			local _ = var2940
			var2924 = var2941
		else
			error("Unsupported wire type: " .. var2925)
		end
	end
	return var2923
end

function t_87:jsonEncode() --[[ line: 14788 ]]
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

function t_87:jsonDecode() --[[ line: 14802 ]]
	-- upvalues: t_87 (ref), t (ref)
	local var2943 = t_87.new()
	
	if self.user_id ~= nil then
		var2943.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.user_id)
		}
	end
	if self.userId ~= nil then
		var2943.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.userId)
		}
	end
	if self.avatar_config ~= nil then
		var2943.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatar_config)
		}
	end
	if self.avatarConfig ~= nil then
		var2943.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatarConfig)
		}
	end
	return var2943
end

t_87.descriptor = {
	name = "AvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarProp"
}
t.AvatarProp = t_87
typeRegistryModule.default:register(t.AvatarProp)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p177) --[[ line: 14840 ]]
	-- upvalues: t_88 (ref)
	return setmetatable({
		kind = if p177 == nil or p177.kind == nil then nil else p177.kind
	}, t_88)
end

function t_88:encode() --[[ line: 14846 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2945 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2946 = self.kind.value:encode()
			local var2947, var2948 = protoModule.writeTag(buff, var2945, 1, protoModule.wireTypes.lengthDelimited)
			var2947, var2948 = protoModule.writeBuffer(var2947, var2948, var2946, buffer.len(var2946))
			buff = var2947
			var2945 = var2948
		elseif self.kind.type == "binding_path" then
			local var2949, var2950 = protoModule.writeTag(buff, var2945, 2, protoModule.wireTypes.lengthDelimited)
			var2949, var2950 = protoModule.writeString(var2949, var2950, self.kind.value)
			buff = var2949
			var2945 = var2950
		elseif self.kind.type == "conditional" then
			local var2951 = self.kind.value:encode()
			local var2952, var2953 = protoModule.writeTag(buff, var2945, 3, protoModule.wireTypes.lengthDelimited)
			var2952, var2953 = protoModule.writeBuffer(var2952, var2953, var2951, buffer.len(var2951))
			buff = var2952
			var2945 = var2953
		elseif self.kind.type == "array_map" then
			local var2954 = self.kind.value:encode()
			local var2955, var2956 = protoModule.writeTag(buff, var2945, 4, protoModule.wireTypes.lengthDelimited)
			var2955, var2956 = protoModule.writeBuffer(var2955, var2956, var2954, buffer.len(var2954))
			buff = var2955
			var2945 = var2956
		end
	end
	local buff_1 = buffer.create(var2945)
	buffer.copy(buff_1, 0, buff, 0, var2945)
	
	return buff_1
end

function t_88.decode(p178) --[[ line: 14874 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2958 = t_88.new()
	local var2959 = 0
	while var2959 < buffer.len(p178) do
		local _ = nil
		local var2960 = nil
		local var2961, var2962, var2963 = protoModule.readTag(p178, var2959)
		local var2964 = var2961
		var2960 = var2962
		var2959 = var2963
		
		if var2960 == protoModule.wireTypes.varint then
			local _ = nil
			local var2965, var2966 = protoModule.readVarInt(p178, var2959)
			local _ = var2965
			var2959 = var2966
			continue
		end
		if var2960 == protoModule.wireTypes.lengthDelimited then
			if var2964 == 1 then
				local _ = nil
				local var2967, var2968 = protoModule.readBuffer(p178, var2959)
				var2959 = var2968
				var2958.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var2967)
				}
			elseif var2964 == 2 then
				local _ = nil
				local var2969, var2970 = protoModule.readBuffer(p178, var2959)
				var2959 = var2970
				var2958.kind = { type = "binding_path", value = buffer.tostring(var2969) }
			elseif var2964 == 3 then
				local _ = nil
				local var2971, var2972 = protoModule.readBuffer(p178, var2959)
				var2959 = var2972
				var2958.kind = {
					type = "conditional",
					value = t.ArrayOfAvatarProp_ConditionalOptions.decode(var2971)
				}
			elseif var2964 == 4 then
				local _ = nil
				local var2973, var2974 = protoModule.readBuffer(p178, var2959)
				var2959 = var2974
				var2958.kind = {
					type = "array_map",
					value = t.ArrayOfAvatarProp_ArrayMap.decode(var2973)
				}
			else
				local _ = nil
				local var2975, var2976 = protoModule.readVarInt(p178, var2959)
				var2959 = var2976 + var2975
			end
		elseif var2960 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2977, var2978 = protoModule.readFixed32(p178, var2959)
			local _ = var2977
			var2959 = var2978
		elseif var2960 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2979, var2980 = protoModule.readFixed64(p178, var2959)
			local _ = var2979
			var2959 = var2980
		else
			error("Unsupported wire type: " .. var2960)
		end
	end
	return var2958
end

function t_88:jsonEncode() --[[ line: 14933 ]]
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

function t_88:jsonDecode() --[[ line: 14951 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var2982 = t_88.new()
	
	if self.literal ~= nil then
		var2982.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2982.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2982.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2982.kind = {
			type = "conditional",
			value = t.ArrayOfAvatarProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var2982.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var2982.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var2982
end

t_88.descriptor = {
	name = "ArrayOfAvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatarProp"
}
t.ArrayOfAvatarProp = t_88
typeRegistryModule.default:register(t.ArrayOfAvatarProp)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p179) --[[ line: 14999 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		condition = if p179 == nil or p179.condition == nil then nil else p179.condition,
		kind = if p179 == nil or p179.kind == nil then nil else p179.kind
	}, t_89)
end

function t_89:encode() --[[ line: 15008 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2984 = 0
	
	if self.condition ~= nil then
		local var2985 = self.condition:encode()
		local var2986, var2987 = protoModule.writeTag(buff, var2984, 1, protoModule.wireTypes.lengthDelimited)
		var2986, var2987 = protoModule.writeBuffer(var2986, var2987, var2985, buffer.len(var2985))
		buff = var2986
		var2984 = var2987
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2988 = self.kind.value:encode()
			local var2989, var2990 = protoModule.writeTag(buff, var2984, 2, protoModule.wireTypes.lengthDelimited)
			var2989, var2990 = protoModule.writeBuffer(var2989, var2990, var2988, buffer.len(var2988))
			buff = var2989
			var2984 = var2990
		elseif self.kind.type == "binding_path" then
			local var2991, var2992 = protoModule.writeTag(buff, var2984, 3, protoModule.wireTypes.lengthDelimited)
			var2991, var2992 = protoModule.writeString(var2991, var2992, self.kind.value)
			buff = var2991
			var2984 = var2992
		end
	end
	local buff_1 = buffer.create(var2984)
	buffer.copy(buff_1, 0, buff, 0, var2984)
	
	return buff_1
end

function t_89.decode(p180) --[[ line: 15034 ]]
	-- upvalues: t_89 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2994 = t_89.new()
	local var2995 = 0
	while var2995 < buffer.len(p180) do
		local _ = nil
		local var2996 = nil
		local var2997, var2998, var2999 = protoModule.readTag(p180, var2995)
		local var3000 = var2997
		var2996 = var2998
		var2995 = var2999
		
		if var2996 == protoModule.wireTypes.varint then
			local _ = nil
			local var3001, var3002 = protoModule.readVarInt(p180, var2995)
			local _ = var3001
			var2995 = var3002
			continue
		end
		if var2996 == protoModule.wireTypes.lengthDelimited then
			if var3000 == 1 then
				local _ = nil
				local var3003, var3004 = protoModule.readBuffer(p180, var2995)
				var2995 = var3004
				var2994.condition = propConditionModule.PropCondition.decode(var3003)
			elseif var3000 == 2 then
				local _ = nil
				local var3005, var3006 = protoModule.readBuffer(p180, var2995)
				var2995 = var3006
				var2994.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var3005)
				}
			elseif var3000 == 3 then
				local _ = nil
				local var3007, var3008 = protoModule.readBuffer(p180, var2995)
				var2995 = var3008
				var2994.kind = { type = "binding_path", value = buffer.tostring(var3007) }
			else
				local _ = nil
				local var3009, var3010 = protoModule.readVarInt(p180, var2995)
				var2995 = var3010 + var3009
			end
		elseif var2996 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3011, var3012 = protoModule.readFixed32(p180, var2995)
			local _ = var3011
			var2995 = var3012
		elseif var2996 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3013, var3014 = protoModule.readFixed64(p180, var2995)
			local _ = var3013
			var2995 = var3014
		else
			error("Unsupported wire type: " .. var2996)
		end
	end
	return var2994
end

function t_89:jsonEncode() --[[ line: 15087 ]]
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

function t_89:jsonDecode() --[[ line: 15105 ]]
	-- upvalues: t_89 (ref), propConditionModule (ref), t (ref)
	local var3016 = t_89.new()
	
	if self.condition ~= nil then
		var3016.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3016.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3016.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3016.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3016
end

t_89.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfAvatarProp_ConditionalOption = t_89
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOption)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p181) --[[ line: 15145 ]]
	-- upvalues: t_90 (ref)
	return setmetatable({
		options = if p181 == nil or p181.options == nil then {} else p181.options
	}, t_90)
end

function t_90:encode() --[[ line: 15153 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3018 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3019 = v:encode()
			local var3020, var3021 = protoModule.writeTag(buff, var3018, 1, protoModule.wireTypes.lengthDelimited)
			var3020, var3021 = protoModule.writeBuffer(var3020, var3021, var3019, buffer.len(var3019))
			buff = var3020
			var3018 = var3021
		end
	end
	local buff_1 = buffer.create(var3018)
	buffer.copy(buff_1, 0, buff, 0, var3018)
	
	return buff_1
end

function t_90.decode(p182) --[[ line: 15170 ]]
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var3023 = t_90.new()
	local var3024 = 0
	while var3024 < buffer.len(p182) do
		local _ = nil
		local var3025 = nil
		local var3026, var3027, var3028 = protoModule.readTag(p182, var3024)
		local var3029 = var3026
		var3025 = var3027
		var3024 = var3028
		
		if var3025 == protoModule.wireTypes.varint then
			local _ = nil
			local var3030, var3031 = protoModule.readVarInt(p182, var3024)
			local _ = var3030
			var3024 = var3031
			continue
		end
		if var3025 == protoModule.wireTypes.lengthDelimited then
			if var3029 == 1 then
				local _ = nil
				local var3032, var3033 = protoModule.readBuffer(p182, var3024)
				var3024 = var3033
				table.insert(var3023.options, t.ArrayOfAvatarProp_ConditionalOption.decode(var3032))
			else
				local _ = nil
				local var3034, var3035 = protoModule.readVarInt(p182, var3024)
				var3024 = var3035 + var3034
			end
		elseif var3025 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3036, var3037 = protoModule.readFixed32(p182, var3024)
			local _ = var3036
			var3024 = var3037
		elseif var3025 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3038, var3039 = protoModule.readFixed64(p182, var3024)
			local _ = var3038
			var3024 = var3039
		else
			error("Unsupported wire type: " .. var3025)
		end
	end
	return var3023
end

function t_90:jsonEncode() --[[ line: 15213 ]]
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

function t_90:jsonDecode() --[[ line: 15227 ]]
	-- upvalues: t_90 (ref), t (ref)
	local var3042 = t_90.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfAvatarProp_ConditionalOption.jsonDecode(v))
		end
		var3042.options = t_1
	end
	return var3042
end

t_90.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfAvatarProp_ConditionalOptions = t_90
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOptions)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p183) --[[ line: 15258 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		array = if p183 == nil or p183.array == nil then {} else p183.array
	}, t_91)
end

function t_91:encode() --[[ line: 15266 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3045 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var3046 = v:encode()
			local var3047, var3048 = protoModule.writeTag(buff, var3045, 1, protoModule.wireTypes.lengthDelimited)
			var3047, var3048 = protoModule.writeBuffer(var3047, var3048, var3046, buffer.len(var3046))
			buff = var3047
			var3045 = var3048
		end
	end
	local buff_1 = buffer.create(var3045)
	buffer.copy(buff_1, 0, buff, 0, var3045)
	
	return buff_1
end

function t_91.decode(p184) --[[ line: 15283 ]]
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3050 = t_91.new()
	local var3051 = 0
	while var3051 < buffer.len(p184) do
		local _ = nil
		local var3052 = nil
		local var3053, var3054, var3055 = protoModule.readTag(p184, var3051)
		local var3056 = var3053
		var3052 = var3054
		var3051 = var3055
		
		if var3052 == protoModule.wireTypes.varint then
			local _ = nil
			local var3057, var3058 = protoModule.readVarInt(p184, var3051)
			local _ = var3057
			var3051 = var3058
			continue
		end
		if var3052 == protoModule.wireTypes.lengthDelimited then
			if var3056 == 1 then
				local _ = nil
				local var3059, var3060 = protoModule.readBuffer(p184, var3051)
				var3051 = var3060
				table.insert(var3050.array, t.AvatarProp.decode(var3059))
			else
				local _ = nil
				local var3061, var3062 = protoModule.readVarInt(p184, var3051)
				var3051 = var3062 + var3061
			end
		elseif var3052 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3063, var3064 = protoModule.readFixed32(p184, var3051)
			local _ = var3063
			var3051 = var3064
		elseif var3052 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3065, var3066 = protoModule.readFixed64(p184, var3051)
			local _ = var3065
			var3051 = var3066
		else
			error("Unsupported wire type: " .. var3052)
		end
	end
	return var3050
end

function t_91:jsonEncode() --[[ line: 15326 ]]
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

function t_91:jsonDecode() --[[ line: 15340 ]]
	-- upvalues: t_91 (ref), t (ref)
	local var3069 = t_91.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.AvatarProp.jsonDecode(v))
		end
		var3069.array = t_1
	end
	return var3069
end

t_91.descriptor = {
	name = "ArrayOfAvatarProp_ArrayOfAvatars",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatars"
}
t.ArrayOfAvatarProp_ArrayOfAvatars = t_91
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayOfAvatars)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p185) --[[ line: 15371 ]]
	-- upvalues: t_92 (ref)
	return setmetatable({
		kind = if p185 == nil or p185.kind == nil then nil else p185.kind,
		item_hydration_specs = if p185 == nil or p185.item_hydration_specs == nil then {} else p185.item_hydration_specs,
		field_map = if p185 == nil or p185.field_map == nil then nil else p185.field_map
	}, t_92)
end

function t_92:encode() --[[ line: 15383 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3072 = 0
	
	if self.kind ~= nil and self.kind.type == "binding_path" then
		local var3073, var3074 = protoModule.writeTag(buff, var3072, 1, protoModule.wireTypes.lengthDelimited)
		var3073, var3074 = protoModule.writeString(var3073, var3074, self.kind.value)
		buff = var3073
		var3072 = var3074
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var3075 = v:encode()
			local var3076, var3077 = protoModule.writeTag(buff, var3072, 3, protoModule.wireTypes.lengthDelimited)
			var3076, var3077 = protoModule.writeBuffer(var3076, var3077, var3075, buffer.len(var3075))
			buff = var3076
			var3072 = var3077
		end
	end
	if self.field_map ~= nil then
		local var3078 = self.field_map:encode()
		local var3079, var3080 = protoModule.writeTag(buff, var3072, 4, protoModule.wireTypes.lengthDelimited)
		var3079, var3080 = protoModule.writeBuffer(var3079, var3080, var3078, buffer.len(var3078))
		buff = var3079
		var3072 = var3080
	end
	local buff_1 = buffer.create(var3072)
	buffer.copy(buff_1, 0, buff, 0, var3072)
	
	return buff_1
end

function t_92.decode(p186) --[[ line: 15413 ]]
	-- upvalues: t_92 (ref), protoModule (ref), hydrationDataSpecModule (ref), t (ref)
	local var3082 = t_92.new()
	local var3083 = 0
	while var3083 < buffer.len(p186) do
		local _ = nil
		local var3084 = nil
		local var3085, var3086, var3087 = protoModule.readTag(p186, var3083)
		local var3088 = var3085
		var3084 = var3086
		var3083 = var3087
		
		if var3084 == protoModule.wireTypes.varint then
			local _ = nil
			local var3089, var3090 = protoModule.readVarInt(p186, var3083)
			local _ = var3089
			var3083 = var3090
			continue
		end
		if var3084 == protoModule.wireTypes.lengthDelimited then
			if var3088 == 1 then
				local _ = nil
				local var3091, var3092 = protoModule.readBuffer(p186, var3083)
				var3083 = var3092
				var3082.kind = { type = "binding_path", value = buffer.tostring(var3091) }
			elseif var3088 == 3 then
				local _ = nil
				local var3093, var3094 = protoModule.readBuffer(p186, var3083)
				var3083 = var3094
				table.insert(var3082.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var3093))
			elseif var3088 == 4 then
				local _ = nil
				local var3095, var3096 = protoModule.readBuffer(p186, var3083)
				var3083 = var3096
				var3082.field_map = t.AvatarConfigProp.decode(var3095)
			else
				local _ = nil
				local var3097, var3098 = protoModule.readVarInt(p186, var3083)
				var3083 = var3098 + var3097
			end
		elseif var3084 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3099, var3100 = protoModule.readFixed32(p186, var3083)
			local _ = var3099
			var3083 = var3100
		elseif var3084 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3101, var3102 = protoModule.readFixed64(p186, var3083)
			local _ = var3101
			var3083 = var3102
		else
			error("Unsupported wire type: " .. var3084)
		end
	end
	return var3082
end

function t_92:jsonEncode() --[[ line: 15469 ]]
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

function t_92:jsonDecode() --[[ line: 15493 ]]
	-- upvalues: t_92 (ref), hydrationDataSpecModule (ref), t (ref)
	local var3105 = t_92.new()
	
	if self.binding_path ~= nil then
		var3105.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3105.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var3105.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var3105.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var3105.field_map = t.AvatarConfigProp.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var3105.field_map = t.AvatarConfigProp.jsonDecode(self.fieldMap)
	end
	return var3105
end

t_92.descriptor = {
	name = "ArrayOfAvatarProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfAvatarProp_ArrayMap = t_92
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayMap)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p187) --[[ line: 15553 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		kind = if p187 == nil or p187.kind == nil then nil else p187.kind
	}, t_93)
end

function t_93:encode() --[[ line: 15559 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3109 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3110 = self.kind.value:encode()
			local var3111, var3112 = protoModule.writeTag(buff, var3109, 1, protoModule.wireTypes.lengthDelimited)
			var3111, var3112 = protoModule.writeBuffer(var3111, var3112, var3110, buffer.len(var3110))
			buff = var3111
			var3109 = var3112
		elseif self.kind.type == "binding_path" then
			local var3113, var3114 = protoModule.writeTag(buff, var3109, 2, protoModule.wireTypes.lengthDelimited)
			var3113, var3114 = protoModule.writeString(var3113, var3114, self.kind.value)
			buff = var3113
			var3109 = var3114
		elseif self.kind.type == "conditional" then
			local var3115 = self.kind.value:encode()
			local var3116, var3117 = protoModule.writeTag(buff, var3109, 3, protoModule.wireTypes.lengthDelimited)
			var3116, var3117 = protoModule.writeBuffer(var3116, var3117, var3115, buffer.len(var3115))
			buff = var3116
			var3109 = var3117
		end
	end
	local buff_1 = buffer.create(var3109)
	buffer.copy(buff_1, 0, buff, 0, var3109)
	
	return buff_1
end

function t_93.decode(p188) --[[ line: 15583 ]]
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var3119 = t_93.new()
	local var3120 = 0
	while var3120 < buffer.len(p188) do
		local _ = nil
		local var3121 = nil
		local var3122, var3123, var3124 = protoModule.readTag(p188, var3120)
		local var3125 = var3122
		var3121 = var3123
		var3120 = var3124
		
		if var3121 == protoModule.wireTypes.varint then
			local _ = nil
			local var3126, var3127 = protoModule.readVarInt(p188, var3120)
			local _ = var3126
			var3120 = var3127
			continue
		end
		if var3121 == protoModule.wireTypes.lengthDelimited then
			if var3125 == 1 then
				local _ = nil
				local var3128, var3129 = protoModule.readBuffer(p188, var3120)
				var3120 = var3129
				var3119.kind = {
					type = "literal",
					value = t.StringArrayProp_LiteralValue.decode(var3128)
				}
			elseif var3125 == 2 then
				local _ = nil
				local var3130, var3131 = protoModule.readBuffer(p188, var3120)
				var3120 = var3131
				var3119.kind = { type = "binding_path", value = buffer.tostring(var3130) }
			elseif var3125 == 3 then
				local _ = nil
				local var3132, var3133 = protoModule.readBuffer(p188, var3120)
				var3120 = var3133
				var3119.kind = {
					type = "conditional",
					value = t.StringArrayProp_ConditionalOptions.decode(var3132)
				}
			else
				local _ = nil
				local var3134, var3135 = protoModule.readVarInt(p188, var3120)
				var3120 = var3135 + var3134
			end
		elseif var3121 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3136, var3137 = protoModule.readFixed32(p188, var3120)
			local _ = var3136
			var3120 = var3137
		elseif var3121 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3138, var3139 = protoModule.readFixed64(p188, var3120)
			local _ = var3138
			var3120 = var3139
		else
			error("Unsupported wire type: " .. var3121)
		end
	end
	return var3119
end

function t_93:jsonEncode() --[[ line: 15637 ]]
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

function t_93:jsonDecode() --[[ line: 15653 ]]
	-- upvalues: t_93 (ref), t (ref)
	local var3141 = t_93.new()
	
	if self.literal ~= nil then
		var3141.kind = {
			type = "literal",
			value = t.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3141.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3141.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var3141.kind = {
			type = "conditional",
			value = t.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3141
end

t_93.descriptor = {
	name = "StringArrayProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringArrayProp"
}
t.StringArrayProp = t_93
typeRegistryModule.default:register(t.StringArrayProp)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p189) --[[ line: 15692 ]]
	-- upvalues: t_94 (ref)
	return setmetatable({
		items = if p189 == nil or p189.items == nil then {} else p189.items
	}, t_94)
end

function t_94:encode() --[[ line: 15700 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3143 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3144, var3145 = protoModule.writeTag(buff, var3143, 1, protoModule.wireTypes.lengthDelimited)
			var3144, var3145 = protoModule.writeString(var3144, var3145, v)
			buff = var3144
			var3143 = var3145
		end
	end
	local buff_1 = buffer.create(var3143)
	buffer.copy(buff_1, 0, buff, 0, var3143)
	
	return buff_1
end

function t_94.decode(p190) --[[ line: 15716 ]]
	-- upvalues: t_94 (ref), protoModule (ref)
	local var3147 = t_94.new()
	local var3148 = 0
	while var3148 < buffer.len(p190) do
		local _ = nil
		local var3149 = nil
		local var3150, var3151, var3152 = protoModule.readTag(p190, var3148)
		local var3153 = var3150
		var3149 = var3151
		var3148 = var3152
		
		if var3149 == protoModule.wireTypes.varint then
			local _ = nil
			local var3154, var3155 = protoModule.readVarInt(p190, var3148)
			local _ = var3154
			var3148 = var3155
			continue
		end
		if var3149 == protoModule.wireTypes.lengthDelimited then
			if var3153 == 1 then
				local _ = nil
				local var3156, var3157 = protoModule.readBuffer(p190, var3148)
				var3148 = var3157
				table.insert(var3147.items, buffer.tostring(var3156))
			else
				local _ = nil
				local var3158, var3159 = protoModule.readVarInt(p190, var3148)
				var3148 = var3159 + var3158
			end
		elseif var3149 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3160, var3161 = protoModule.readFixed32(p190, var3148)
			local _ = var3160
			var3148 = var3161
		elseif var3149 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3162, var3163 = protoModule.readFixed64(p190, var3148)
			local _ = var3162
			var3148 = var3163
		else
			error("Unsupported wire type: " .. var3149)
		end
	end
	return var3147
end

function t_94:jsonEncode() --[[ line: 15759 ]]
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

function t_94:jsonDecode() --[[ line: 15773 ]]
	-- upvalues: t_94 (ref)
	local var3166 = t_94.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var3166.items = t
	end
	return var3166
end

t_94.descriptor = {
	name = "StringArrayProp_LiteralValue",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
}
t.StringArrayProp_LiteralValue = t_94
typeRegistryModule.default:register(t.StringArrayProp_LiteralValue)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p191) --[[ line: 15802 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		condition = if p191 == nil or p191.condition == nil then nil else p191.condition,
		kind = if p191 == nil or p191.kind == nil then nil else p191.kind
	}, t_95)
end

function t_95:encode() --[[ line: 15811 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3169 = 0
	
	if self.condition ~= nil then
		local var3170 = self.condition:encode()
		local var3171, var3172 = protoModule.writeTag(buff, var3169, 1, protoModule.wireTypes.lengthDelimited)
		var3171, var3172 = protoModule.writeBuffer(var3171, var3172, var3170, buffer.len(var3170))
		buff = var3171
		var3169 = var3172
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3173 = self.kind.value:encode()
			local var3174, var3175 = protoModule.writeTag(buff, var3169, 2, protoModule.wireTypes.lengthDelimited)
			var3174, var3175 = protoModule.writeBuffer(var3174, var3175, var3173, buffer.len(var3173))
			buff = var3174
			var3169 = var3175
		elseif self.kind.type == "binding_path" then
			local var3176, var3177 = protoModule.writeTag(buff, var3169, 3, protoModule.wireTypes.lengthDelimited)
			var3176, var3177 = protoModule.writeString(var3176, var3177, self.kind.value)
			buff = var3176
			var3169 = var3177
		elseif self.kind.type == "conditional" then
			local var3178 = self.kind.value:encode()
			local var3179, var3180 = protoModule.writeTag(buff, var3169, 4, protoModule.wireTypes.lengthDelimited)
			var3179, var3180 = protoModule.writeBuffer(var3179, var3180, var3178, buffer.len(var3178))
			buff = var3179
			var3169 = var3180
		end
	end
	local buff_1 = buffer.create(var3169)
	buffer.copy(buff_1, 0, buff, 0, var3169)
	
	return buff_1
end

function t_95.decode(p192) --[[ line: 15841 ]]
	-- upvalues: t_95 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3182 = t_95.new()
	local var3183 = 0
	while var3183 < buffer.len(p192) do
		local _ = nil
		local var3184 = nil
		local var3185, var3186, var3187 = protoModule.readTag(p192, var3183)
		local var3188 = var3185
		var3184 = var3186
		var3183 = var3187
		
		if var3184 == protoModule.wireTypes.varint then
			local _ = nil
			local var3189, var3190 = protoModule.readVarInt(p192, var3183)
			local _ = var3189
			var3183 = var3190
			continue
		end
		if var3184 == protoModule.wireTypes.lengthDelimited then
			if var3188 == 1 then
				local _ = nil
				local var3191, var3192 = protoModule.readBuffer(p192, var3183)
				var3183 = var3192
				var3182.condition = propConditionModule.PropCondition.decode(var3191)
			elseif var3188 == 2 then
				local _ = nil
				local var3193, var3194 = protoModule.readBuffer(p192, var3183)
				var3183 = var3194
				var3182.kind = {
					type = "literal",
					value = t.StringArrayProp_LiteralValue.decode(var3193)
				}
			elseif var3188 == 3 then
				local _ = nil
				local var3195, var3196 = protoModule.readBuffer(p192, var3183)
				var3183 = var3196
				var3182.kind = { type = "binding_path", value = buffer.tostring(var3195) }
			elseif var3188 == 4 then
				local _ = nil
				local var3197, var3198 = protoModule.readBuffer(p192, var3183)
				var3183 = var3198
				var3182.kind = {
					type = "conditional",
					value = t.StringArrayProp_ConditionalOptions.decode(var3197)
				}
			else
				local _ = nil
				local var3199, var3200 = protoModule.readVarInt(p192, var3183)
				var3183 = var3200 + var3199
			end
		elseif var3184 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3201, var3202 = protoModule.readFixed32(p192, var3183)
			local _ = var3201
			var3183 = var3202
		elseif var3184 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3203, var3204 = protoModule.readFixed64(p192, var3183)
			local _ = var3203
			var3183 = var3204
		else
			error("Unsupported wire type: " .. var3184)
		end
	end
	return var3182
end

function t_95:jsonEncode() --[[ line: 15900 ]]
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

function t_95:jsonDecode() --[[ line: 15920 ]]
	-- upvalues: t_95 (ref), propConditionModule (ref), t (ref)
	local var3206 = t_95.new()
	
	if self.condition ~= nil then
		var3206.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3206.kind = {
			type = "literal",
			value = t.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3206.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3206.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var3206.kind = {
			type = "conditional",
			value = t.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3206
end

t_95.descriptor = {
	name = "StringArrayProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StringArrayProp_ConditionalOption = t_95
typeRegistryModule.default:register(t.StringArrayProp_ConditionalOption)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p193) --[[ line: 15966 ]]
	-- upvalues: t_96 (ref)
	return setmetatable({
		options = if p193 == nil or p193.options == nil then {} else p193.options
	}, t_96)
end

function t_96:encode() --[[ line: 15974 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3208 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3209 = v:encode()
			local var3210, var3211 = protoModule.writeTag(buff, var3208, 1, protoModule.wireTypes.lengthDelimited)
			var3210, var3211 = protoModule.writeBuffer(var3210, var3211, var3209, buffer.len(var3209))
			buff = var3210
			var3208 = var3211
		end
	end
	local buff_1 = buffer.create(var3208)
	buffer.copy(buff_1, 0, buff, 0, var3208)
	
	return buff_1
end

function t_96.decode(p194) --[[ line: 15991 ]]
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3213 = t_96.new()
	local var3214 = 0
	while var3214 < buffer.len(p194) do
		local _ = nil
		local var3215 = nil
		local var3216, var3217, var3218 = protoModule.readTag(p194, var3214)
		local var3219 = var3216
		var3215 = var3217
		var3214 = var3218
		
		if var3215 == protoModule.wireTypes.varint then
			local _ = nil
			local var3220, var3221 = protoModule.readVarInt(p194, var3214)
			local _ = var3220
			var3214 = var3221
			continue
		end
		if var3215 == protoModule.wireTypes.lengthDelimited then
			if var3219 == 1 then
				local _ = nil
				local var3222, var3223 = protoModule.readBuffer(p194, var3214)
				var3214 = var3223
				table.insert(var3213.options, t.StringArrayProp_ConditionalOption.decode(var3222))
			else
				local _ = nil
				local var3224, var3225 = protoModule.readVarInt(p194, var3214)
				var3214 = var3225 + var3224
			end
		elseif var3215 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3226, var3227 = protoModule.readFixed32(p194, var3214)
			local _ = var3226
			var3214 = var3227
		elseif var3215 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3228, var3229 = protoModule.readFixed64(p194, var3214)
			local _ = var3228
			var3214 = var3229
		else
			error("Unsupported wire type: " .. var3215)
		end
	end
	return var3213
end

function t_96:jsonEncode() --[[ line: 16034 ]]
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

function t_96:jsonDecode() --[[ line: 16048 ]]
	-- upvalues: t_96 (ref), t (ref)
	local var3232 = t_96.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StringArrayProp_ConditionalOption.jsonDecode(v))
		end
		var3232.options = t_1
	end
	return var3232
end

t_96.descriptor = {
	name = "StringArrayProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StringArrayProp_ConditionalOptions = t_96
typeRegistryModule.default:register(t.StringArrayProp_ConditionalOptions)

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
	StringArrayProp = t.StringArrayProp,
	StringArrayProp_LiteralValue = t.StringArrayProp_LiteralValue,
	StringArrayProp_ConditionalOption = t.StringArrayProp_ConditionalOption,
	StringArrayProp_ConditionalOptions = t.StringArrayProp_ConditionalOptions
}