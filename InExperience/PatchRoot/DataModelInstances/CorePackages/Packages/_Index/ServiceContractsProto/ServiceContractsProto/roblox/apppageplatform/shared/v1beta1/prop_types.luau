local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		namespace = if p0 == nil or p0.namespace == nil then "" else p0.namespace,
		key = if p0 == nil or p0.key == nil then "" else p0.key,
		map_key = if p0 == nil or p0.map_key == nil then "" else p0.map_key
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var106 = 0
	
	if self.namespace ~= nil and self.namespace ~= "" then
		local var107, var108 = protoModule.writeTag(buff, var106, 1, protoModule.wireTypes.lengthDelimited)
		var107, var108 = protoModule.writeString(var107, var108, self.namespace)
		buff = var107
		var106 = var108
	end
	if self.key ~= nil and self.key ~= "" then
		local var109, var110 = protoModule.writeTag(buff, var106, 2, protoModule.wireTypes.lengthDelimited)
		var109, var110 = protoModule.writeString(var109, var110, self.key)
		buff = var109
		var106 = var110
	end
	if self.map_key ~= nil and self.map_key ~= "" then
		local var111, var112 = protoModule.writeTag(buff, var106, 3, protoModule.wireTypes.lengthDelimited)
		var111, var112 = protoModule.writeString(var111, var112, self.map_key)
		buff = var111
		var106 = var112
	end
	local buff_1 = buffer.create(var106)
	buffer.copy(buff_1, 0, buff, 0, var106)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref)
	local var114 = t_1.new()
	local var115 = 0
	while var115 < buffer.len(p1) do
		local _ = nil
		local var116 = nil
		local var117, var118, var119 = protoModule.readTag(p1, var115)
		local var120 = var117
		var116 = var118
		var115 = var119
		
		if var116 == protoModule.wireTypes.varint then
			local _ = nil
			local var121, var122 = protoModule.readVarInt(p1, var115)
			local _ = var121
			var115 = var122
			continue
		end
		if var116 == protoModule.wireTypes.lengthDelimited then
			if var120 == 1 then
				local _ = nil
				local var123, var124 = protoModule.readBuffer(p1, var115)
				var115 = var124
				var114.namespace = buffer.tostring(var123)
			elseif var120 == 2 then
				local _ = nil
				local var125, var126 = protoModule.readBuffer(p1, var115)
				var115 = var126
				var114.key = buffer.tostring(var125)
			elseif var120 == 3 then
				local _ = nil
				local var127, var128 = protoModule.readBuffer(p1, var115)
				var115 = var128
				var114.map_key = buffer.tostring(var127)
			else
				local _ = nil
				local var129, var130 = protoModule.readVarInt(p1, var115)
				var115 = var130 + var129
			end
		elseif var116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var131, var132 = protoModule.readFixed32(p1, var115)
			local _ = var131
			var115 = var132
		elseif var116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var133, var134 = protoModule.readFixed64(p1, var115)
			local _ = var133
			var115 = var134
		else
			error("Unsupported wire type: " .. var116)
		end
	end
	return var114
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
	local var136 = t_1.new()
	
	if self.namespace ~= nil then
		var136.namespace = self.namespace
	end
	if self.key ~= nil then
		var136.key = self.key
	end
	if self.map_key ~= nil then
		var136.map_key = self.map_key
	end
	if self.mapKey ~= nil then
		var136.map_key = self.mapKey
	end
	return var136
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
	local var138 = 0
	
	if self.str ~= nil and self.str ~= "" then
		local var139, var140 = protoModule.writeTag(buff, var138, 1, protoModule.wireTypes.lengthDelimited)
		var139, var140 = protoModule.writeString(var139, var140, self.str)
		buff = var139
		var138 = var140
	end
	if self.args ~= nil and next(self.args) ~= nil then
		for i, v in self.args do
			local var141, var142 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var141, var142 = protoModule.writeString(var141, var142, i)
			local var143 = v:encode()
			var142, var144 = protoModule.writeTag(var141, var142, 2, protoModule.wireTypes.lengthDelimited)
			var142, var144 = protoModule.writeBuffer(var142, var144, var143, buffer.len(var143))
			local var145 = var142
			local var146 = var144
			local var147, var148 = protoModule.writeTag(buff, var138, 2, protoModule.wireTypes.lengthDelimited)
			var147, var148 = protoModule.writeBuffer(var147, var148, var145, var146)
			buff = var147
			var138 = var148
		end
	end
	if self.translation ~= nil then
		local var149 = self.translation:encode()
		local var150, var151 = protoModule.writeTag(buff, var138, 3, protoModule.wireTypes.lengthDelimited)
		var150, var151 = protoModule.writeBuffer(var150, var151, var149, buffer.len(var149))
		buff = var150
		var138 = var151
	end
	local buff_1 = buffer.create(var138)
	buffer.copy(buff_1, 0, buff, 0, var138)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var153 = t_2.new()
	local var154 = 0
	while var154 < buffer.len(p3) do
		local _ = nil
		local var155 = nil
		local var156, var157, var158 = protoModule.readTag(p3, var154)
		local var159 = var156
		var155 = var157
		var154 = var158
		
		if var155 == protoModule.wireTypes.varint then
			local _ = nil
			local var160, var161 = protoModule.readVarInt(p3, var154)
			local _ = var160
			var154 = var161
			continue
		end
		if var155 == protoModule.wireTypes.lengthDelimited then
			if var159 == 1 then
				local _ = nil
				local var162, var163 = protoModule.readBuffer(p3, var154)
				var154 = var163
				var153.str = buffer.tostring(var162)
			elseif var159 == 2 then
				local _ = nil
				local var164, var165 = protoModule.readBuffer(p3, var154)
				var154 = var165
				var164 = t.StringFormat_ArgsEntry.decode(var164)
				var153.args[var164.key or ""] = var164.value or t.StringFormat_FormatArg.new()
			elseif var159 == 3 then
				local _ = nil
				local var166, var167 = protoModule.readBuffer(p3, var154)
				var154 = var167
				var153.translation = t.TranslationRef.decode(var166)
			else
				local _ = nil
				local var168, var169 = protoModule.readVarInt(p3, var154)
				var154 = var169 + var168
			end
		elseif var155 == protoModule.wireTypes.i32 then
			local _ = nil
			local var170, var171 = protoModule.readFixed32(p3, var154)
			local _ = var170
			var154 = var171
		elseif var155 == protoModule.wireTypes.i64 then
			local _ = nil
			local var172, var173 = protoModule.readFixed64(p3, var154)
			local _ = var172
			var154 = var173
		else
			error("Unsupported wire type: " .. var155)
		end
	end
	return var153
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
	local var176 = t_2.new()
	
	if self.str ~= nil then
		var176.str = self.str
	end
	if self.args ~= nil then
		local t_1 = {}
		
		for i, v in self.args do
			t_1[i] = t.StringFormat_FormatArg.jsonDecode(v)
		end
		var176.args = t_1
	end
	if self.translation ~= nil then
		var176.translation = t.TranslationRef.jsonDecode(self.translation)
	end
	return var176
end

t_2.descriptor = {
	name = "StringFormat",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
}
t.StringFormat = t_2
typeRegistryModule.default:register(t.StringFormat)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind,
		formatter = if p4 == nil or p4.formatter == nil then nil else p4.formatter
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var179 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var180, var181 = protoModule.writeTag(buff, var179, 1, protoModule.wireTypes.lengthDelimited)
			var180, var181 = protoModule.writeString(var180, var181, self.kind.value)
			buff = var180
			var179 = var181
		elseif self.kind.type == "binding_path" then
			local var182, var183 = protoModule.writeTag(buff, var179, 2, protoModule.wireTypes.lengthDelimited)
			var182, var183 = protoModule.writeString(var182, var183, self.kind.value)
			buff = var182
			var179 = var183
		end
	end
	if self.formatter ~= nil then
		local var184 = self.formatter:encode()
		local var185, var186 = protoModule.writeTag(buff, var179, 3, protoModule.wireTypes.lengthDelimited)
		var185, var186 = protoModule.writeBuffer(var185, var186, var184, buffer.len(var184))
		buff = var185
		var179 = var186
	end
	local buff_1 = buffer.create(var179)
	buffer.copy(buff_1, 0, buff, 0, var179)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var188 = t_3.new()
	local var189 = 0
	while var189 < buffer.len(p5) do
		local _ = nil
		local var190 = nil
		local var191, var192, var193 = protoModule.readTag(p5, var189)
		local var194 = var191
		var190 = var192
		var189 = var193
		
		if var190 == protoModule.wireTypes.varint then
			local _ = nil
			local var195, var196 = protoModule.readVarInt(p5, var189)
			local _ = var195
			var189 = var196
			continue
		end
		if var190 == protoModule.wireTypes.lengthDelimited then
			if var194 == 1 then
				local _ = nil
				local var197, var198 = protoModule.readBuffer(p5, var189)
				var189 = var198
				var188.kind = { type = "literal", value = buffer.tostring(var197) }
			elseif var194 == 2 then
				local _ = nil
				local var199, var200 = protoModule.readBuffer(p5, var189)
				var189 = var200
				var188.kind = { type = "binding_path", value = buffer.tostring(var199) }
			elseif var194 == 3 then
				local _ = nil
				local var201, var202 = protoModule.readBuffer(p5, var189)
				var189 = var202
				var188.formatter = t.StringFormat_FormatArg_Formatter.decode(var201)
			else
				local _ = nil
				local var203, var204 = protoModule.readVarInt(p5, var189)
				var189 = var204 + var203
			end
		elseif var190 == protoModule.wireTypes.i32 then
			local _ = nil
			local var205, var206 = protoModule.readFixed32(p5, var189)
			local _ = var205
			var189 = var206
		elseif var190 == protoModule.wireTypes.i64 then
			local _ = nil
			local var207, var208 = protoModule.readFixed64(p5, var189)
			local _ = var207
			var189 = var208
		else
			error("Unsupported wire type: " .. var190)
		end
	end
	return var188
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
	local var210 = t_3.new()
	
	if self.literal ~= nil then
		var210.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var210.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var210.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.formatter ~= nil then
		var210.formatter = t.StringFormat_FormatArg_Formatter.jsonDecode(self.formatter)
	end
	return var210
end

t_3.descriptor = {
	name = "StringFormat_FormatArg",
	fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
}
t.StringFormat_FormatArg = t_3
typeRegistryModule.default:register(t.StringFormat_FormatArg)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t (ref), t_4 (ref)
	return setmetatable({
		type = if p6 == nil or p6.type == nil then assert(t.StringFormat_FormatArg_Formatter_Type.fromNumber(0), "Enum has no 0 default") else p6.type,
		config = if p6 == nil or p6.config == nil then nil else p6.config
	}, t_4)
end

function t_4:encode()
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var212 = 0
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= t.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		local var213, var214 = protoModule.writeTag(buff, var212, 1, protoModule.wireTypes.varint)
		var213, var214 = protoModule.writeVarInt(var213, var214, t.StringFormat_FormatArg_Formatter_Type.toNumber(self.type))
		buff = var213
		var212 = var214
	end
	if self.config ~= nil and self.config.type == "date_config" then
		local var215 = self.config.value:encode()
		local var216, var217 = protoModule.writeTag(buff, var212, 2, protoModule.wireTypes.lengthDelimited)
		var216, var217 = protoModule.writeBuffer(var216, var217, var215, buffer.len(var215))
		buff = var216
		var212 = var217
	end
	local buff_1 = buffer.create(var212)
	buffer.copy(buff_1, 0, buff, 0, var212)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var219 = t_4.new()
	local var220 = 0
	while var220 < buffer.len(p7) do
		local _ = nil
		local var221 = nil
		local var222, var223, var224 = protoModule.readTag(p7, var220)
		local var225 = var222
		var221 = var223
		var220 = var224
		
		if var221 == protoModule.wireTypes.varint then
			if var225 == 1 then
				local _ = nil
				local var226, var227 = protoModule.readVarIntI32(p7, var220)
				local var228 = var226
				var220 = var227
				var219.type = t.StringFormat_FormatArg_Formatter_Type.fromNumber(var228) or var228
			else
				local _ = nil
				local var229, var230 = protoModule.readVarInt(p7, var220)
				local _ = var229
				var220 = var230
			end
		end
		if var221 == protoModule.wireTypes.lengthDelimited then
			if var225 == 2 then
				local _ = nil
				local var231, var232 = protoModule.readBuffer(p7, var220)
				var220 = var232
				var219.config = {
					type = "date_config",
					value = t.StringFormat_FormatArg_Formatter_DateConfig.decode(var231)
				}
			else
				local _ = nil
				local var233, var234 = protoModule.readVarInt(p7, var220)
				var220 = var234 + var233
			end
		elseif var221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var235, var236 = protoModule.readFixed32(p7, var220)
			local _ = var235
			var220 = var236
		elseif var221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var237, var238 = protoModule.readFixed64(p7, var220)
			local _ = var237
			var220 = var238
		else
			error("Unsupported wire type: " .. var221)
		end
	end
	return var219
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
	local var240 = t_4.new()
	
	if self.type ~= nil then
		var240.type = if typeof(self.type) == "number" then t.StringFormat_FormatArg_Formatter_Type.fromNumber(self.type) or self.type else t.StringFormat_FormatArg_Formatter_Type.fromName(self.type) or self.type
	end
	if self.date_config ~= nil then
		var240.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.date_config)
		}
	end
	if self.dateConfig ~= nil then
		var240.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.dateConfig)
		}
	end
	return var240
end

t_4.descriptor = {
	name = "StringFormat_FormatArg_Formatter",
	fullName = "roblox.apppageplatform.shared.v1beta1.Formatter"
}
t.StringFormat_FormatArg_Formatter = t_4
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		pattern = if p8 == nil or p8.pattern == nil then "" else p8.pattern
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var242 = 0
	
	if self.pattern ~= nil and self.pattern ~= "" then
		local var243, var244 = protoModule.writeTag(buff, var242, 1, protoModule.wireTypes.lengthDelimited)
		var243, var244 = protoModule.writeString(var243, var244, self.pattern)
		buff = var243
		var242 = var244
	end
	local buff_1 = buffer.create(var242)
	buffer.copy(buff_1, 0, buff, 0, var242)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref)
	local var246 = t_5.new()
	local var247 = 0
	while var247 < buffer.len(p9) do
		local _ = nil
		local var248 = nil
		local var249, var250, var251 = protoModule.readTag(p9, var247)
		local var252 = var249
		var248 = var250
		var247 = var251
		
		if var248 == protoModule.wireTypes.varint then
			local _ = nil
			local var253, var254 = protoModule.readVarInt(p9, var247)
			local _ = var253
			var247 = var254
			continue
		end
		if var248 == protoModule.wireTypes.lengthDelimited then
			if var252 == 1 then
				local _ = nil
				local var255, var256 = protoModule.readBuffer(p9, var247)
				var247 = var256
				var246.pattern = buffer.tostring(var255)
			else
				local _ = nil
				local var257, var258 = protoModule.readVarInt(p9, var247)
				var247 = var258 + var257
			end
		elseif var248 == protoModule.wireTypes.i32 then
			local _ = nil
			local var259, var260 = protoModule.readFixed32(p9, var247)
			local _ = var259
			var247 = var260
		elseif var248 == protoModule.wireTypes.i64 then
			local _ = nil
			local var261, var262 = protoModule.readFixed64(p9, var247)
			local _ = var261
			var247 = var262
		else
			error("Unsupported wire type: " .. var248)
		end
	end
	return var246
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
	local var264 = t_5.new()
	
	if self.pattern ~= nil then
		var264.pattern = self.pattern
	end
	return var264
end

t_5.descriptor = {
	name = "StringFormat_FormatArg_Formatter_DateConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.DateConfig"
}
t.StringFormat_FormatArg_Formatter_DateConfig = t_5
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter_DateConfig)
t.StringFormat_FormatArg_Formatter_Type = {
	fromNumber = function(p10)
		return if p10 == 0 then "TYPE_INVALID" elseif p10 == 1 then "TYPE_NUMBER_ABBREVIATE" elseif p10 == 2 then "TYPE_NUMBER_LOCALIZE" elseif p10 == 3 then "TYPE_DATE_FORMAT" else nil
	end,
	toNumber = function(p11)
		return if p11 == "TYPE_INVALID" then 0 elseif p11 == "TYPE_NUMBER_ABBREVIATE" then 1 elseif p11 == "TYPE_NUMBER_LOCALIZE" then 2 elseif p11 == "TYPE_DATE_FORMAT" then 3 else p11
	end,
	fromName = function(p12)
		return if p12 == "TYPE_INVALID" then "TYPE_INVALID" elseif p12 == "TYPE_NUMBER_ABBREVIATE" then "TYPE_NUMBER_ABBREVIATE" elseif p12 == "TYPE_NUMBER_LOCALIZE" then "TYPE_NUMBER_LOCALIZE" elseif p12 == "TYPE_DATE_FORMAT" then "TYPE_DATE_FORMAT" else nil
	end
}
local t_6 = {}
t_6.__index = t_6

function t_6.new(p13)
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p13 == nil or p13.key == nil then "" else p13.key,
		value = if p13 == nil or p13.value == nil then nil else p13.value
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var266 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var267, var268 = protoModule.writeTag(buff, var266, 1, protoModule.wireTypes.lengthDelimited)
		var267, var268 = protoModule.writeString(var267, var268, self.key)
		buff = var267
		var266 = var268
	end
	if self.value ~= nil then
		local var269 = self.value:encode()
		local var270, var271 = protoModule.writeTag(buff, var266, 2, protoModule.wireTypes.lengthDelimited)
		var270, var271 = protoModule.writeBuffer(var270, var271, var269, buffer.len(var269))
		buff = var270
		var266 = var271
	end
	local buff_1 = buffer.create(var266)
	buffer.copy(buff_1, 0, buff, 0, var266)
	
	return buff_1
end

function t_6.decode(p14)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var273 = t_6.new()
	local var274 = 0
	while var274 < buffer.len(p14) do
		local _ = nil
		local var275 = nil
		local var276, var277, var278 = protoModule.readTag(p14, var274)
		local var279 = var276
		var275 = var277
		var274 = var278
		
		if var275 == protoModule.wireTypes.varint then
			local _ = nil
			local var280, var281 = protoModule.readVarInt(p14, var274)
			local _ = var280
			var274 = var281
			continue
		end
		if var275 == protoModule.wireTypes.lengthDelimited then
			if var279 == 1 then
				local _ = nil
				local var282, var283 = protoModule.readBuffer(p14, var274)
				var274 = var283
				var273.key = buffer.tostring(var282)
			elseif var279 == 2 then
				local _ = nil
				local var284, var285 = protoModule.readBuffer(p14, var274)
				var274 = var285
				var273.value = t.StringFormat_FormatArg.decode(var284)
			else
				local _ = nil
				local var286, var287 = protoModule.readVarInt(p14, var274)
				var274 = var287 + var286
			end
		elseif var275 == protoModule.wireTypes.i32 then
			local _ = nil
			local var288, var289 = protoModule.readFixed32(p14, var274)
			local _ = var288
			var274 = var289
		elseif var275 == protoModule.wireTypes.i64 then
			local _ = nil
			local var290, var291 = protoModule.readFixed64(p14, var274)
			local _ = var290
			var274 = var291
		else
			error("Unsupported wire type: " .. var275)
		end
	end
	return var273
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
	local var293 = t_6.new()
	
	if self.key ~= nil then
		var293.key = self.key
	end
	if self.value ~= nil then
		var293.value = t.StringFormat_FormatArg.jsonDecode(self.value)
	end
	return var293
end

t_6.descriptor = {
	name = "StringFormat_ArgsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
}
t.StringFormat_ArgsEntry = t_6
typeRegistryModule.default:register(t.StringFormat_ArgsEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p15)
	-- upvalues: t_7 (ref)
	return setmetatable({
		kind = if p15 == nil or p15.kind == nil then nil else p15.kind
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var295 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var296, var297 = protoModule.writeTag(buff, var295, 1, protoModule.wireTypes.lengthDelimited)
			var296, var297 = protoModule.writeString(var296, var297, self.kind.value)
			buff = var296
			var295 = var297
		elseif self.kind.type == "binding_path" then
			local var298, var299 = protoModule.writeTag(buff, var295, 2, protoModule.wireTypes.lengthDelimited)
			var298, var299 = protoModule.writeString(var298, var299, self.kind.value)
			buff = var298
			var295 = var299
		elseif self.kind.type == "token" then
			local var300, var301 = protoModule.writeTag(buff, var295, 3, protoModule.wireTypes.lengthDelimited)
			var300, var301 = protoModule.writeString(var300, var301, self.kind.value)
			buff = var300
			var295 = var301
		elseif self.kind.type == "format" then
			local var302 = self.kind.value:encode()
			local var303, var304 = protoModule.writeTag(buff, var295, 4, protoModule.wireTypes.lengthDelimited)
			var303, var304 = protoModule.writeBuffer(var303, var304, var302, buffer.len(var302))
			buff = var303
			var295 = var304
		elseif self.kind.type == "conditional" then
			local var305 = self.kind.value:encode()
			local var306, var307 = protoModule.writeTag(buff, var295, 5, protoModule.wireTypes.lengthDelimited)
			var306, var307 = protoModule.writeBuffer(var306, var307, var305, buffer.len(var305))
			buff = var306
			var295 = var307
		elseif self.kind.type == "translation" then
			local var308 = self.kind.value:encode()
			local var309, var310 = protoModule.writeTag(buff, var295, 6, protoModule.wireTypes.lengthDelimited)
			var309, var310 = protoModule.writeBuffer(var309, var310, var308, buffer.len(var308))
			buff = var309
			var295 = var310
		end
	end
	local buff_1 = buffer.create(var295)
	buffer.copy(buff_1, 0, buff, 0, var295)
	
	return buff_1
end

function t_7.decode(p16)
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var312 = t_7.new()
	local var313 = 0
	while var313 < buffer.len(p16) do
		local _ = nil
		local var314 = nil
		local var315, var316, var317 = protoModule.readTag(p16, var313)
		local var318 = var315
		var314 = var316
		var313 = var317
		
		if var314 == protoModule.wireTypes.varint then
			local _ = nil
			local var319, var320 = protoModule.readVarInt(p16, var313)
			local _ = var319
			var313 = var320
			continue
		end
		if var314 == protoModule.wireTypes.lengthDelimited then
			if var318 == 1 then
				local _ = nil
				local var321, var322 = protoModule.readBuffer(p16, var313)
				var313 = var322
				var312.kind = { type = "literal", value = buffer.tostring(var321) }
			elseif var318 == 2 then
				local _ = nil
				local var323, var324 = protoModule.readBuffer(p16, var313)
				var313 = var324
				var312.kind = { type = "binding_path", value = buffer.tostring(var323) }
			elseif var318 == 3 then
				local _ = nil
				local var325, var326 = protoModule.readBuffer(p16, var313)
				var313 = var326
				var312.kind = { type = "token", value = buffer.tostring(var325) }
			elseif var318 == 4 then
				local _ = nil
				local var327, var328 = protoModule.readBuffer(p16, var313)
				var313 = var328
				var312.kind = { type = "format", value = t.StringFormat.decode(var327) }
			elseif var318 == 5 then
				local _ = nil
				local var329, var330 = protoModule.readBuffer(p16, var313)
				var313 = var330
				var312.kind = {
					type = "conditional",
					value = t.StringProp_ConditionalOptions.decode(var329)
				}
			elseif var318 == 6 then
				local _ = nil
				local var331, var332 = protoModule.readBuffer(p16, var313)
				var313 = var332
				var312.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var331)
				}
			else
				local _ = nil
				local var333, var334 = protoModule.readVarInt(p16, var313)
				var313 = var334 + var333
			end
		elseif var314 == protoModule.wireTypes.i32 then
			local _ = nil
			local var335, var336 = protoModule.readFixed32(p16, var313)
			local _ = var335
			var313 = var336
		elseif var314 == protoModule.wireTypes.i64 then
			local _ = nil
			local var337, var338 = protoModule.readFixed64(p16, var313)
			local _ = var337
			var313 = var338
		else
			error("Unsupported wire type: " .. var314)
		end
	end
	return var312
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
	local var340 = t_7.new()
	
	if self.literal ~= nil then
		var340.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var340.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var340.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var340.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var340.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var340.kind = {
			type = "conditional",
			value = t.StringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var340.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var340
end

t_7.descriptor = {
	name = "StringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
}
t.StringProp = t_7
typeRegistryModule.default:register(t.StringProp)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p17)
	-- upvalues: t_8 (ref)
	return setmetatable({
		condition = if p17 == nil or p17.condition == nil then nil else p17.condition,
		kind = if p17 == nil or p17.kind == nil then nil else p17.kind
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var342 = 0
	
	if self.condition ~= nil then
		local var343 = self.condition:encode()
		local var344, var345 = protoModule.writeTag(buff, var342, 1, protoModule.wireTypes.lengthDelimited)
		var344, var345 = protoModule.writeBuffer(var344, var345, var343, buffer.len(var343))
		buff = var344
		var342 = var345
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var346, var347 = protoModule.writeTag(buff, var342, 2, protoModule.wireTypes.lengthDelimited)
			var346, var347 = protoModule.writeString(var346, var347, self.kind.value)
			buff = var346
			var342 = var347
		elseif self.kind.type == "binding_path" then
			local var348, var349 = protoModule.writeTag(buff, var342, 3, protoModule.wireTypes.lengthDelimited)
			var348, var349 = protoModule.writeString(var348, var349, self.kind.value)
			buff = var348
			var342 = var349
		elseif self.kind.type == "token" then
			local var350, var351 = protoModule.writeTag(buff, var342, 4, protoModule.wireTypes.lengthDelimited)
			var350, var351 = protoModule.writeString(var350, var351, self.kind.value)
			buff = var350
			var342 = var351
		elseif self.kind.type == "format" then
			local var352 = self.kind.value:encode()
			local var353, var354 = protoModule.writeTag(buff, var342, 5, protoModule.wireTypes.lengthDelimited)
			var353, var354 = protoModule.writeBuffer(var353, var354, var352, buffer.len(var352))
			buff = var353
			var342 = var354
		elseif self.kind.type == "translation" then
			local var355 = self.kind.value:encode()
			local var356, var357 = protoModule.writeTag(buff, var342, 6, protoModule.wireTypes.lengthDelimited)
			var356, var357 = protoModule.writeBuffer(var356, var357, var355, buffer.len(var355))
			buff = var356
			var342 = var357
		end
	end
	local buff_1 = buffer.create(var342)
	buffer.copy(buff_1, 0, buff, 0, var342)
	
	return buff_1
end

function t_8.decode(p18)
	-- upvalues: t_8 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var359 = t_8.new()
	local var360 = 0
	while var360 < buffer.len(p18) do
		local _ = nil
		local var361 = nil
		local var362, var363, var364 = protoModule.readTag(p18, var360)
		local var365 = var362
		var361 = var363
		var360 = var364
		
		if var361 == protoModule.wireTypes.varint then
			local _ = nil
			local var366, var367 = protoModule.readVarInt(p18, var360)
			local _ = var366
			var360 = var367
			continue
		end
		if var361 == protoModule.wireTypes.lengthDelimited then
			if var365 == 1 then
				local _ = nil
				local var368, var369 = protoModule.readBuffer(p18, var360)
				var360 = var369
				var359.condition = propConditionModule.PropCondition.decode(var368)
			elseif var365 == 2 then
				local _ = nil
				local var370, var371 = protoModule.readBuffer(p18, var360)
				var360 = var371
				var359.kind = { type = "literal", value = buffer.tostring(var370) }
			elseif var365 == 3 then
				local _ = nil
				local var372, var373 = protoModule.readBuffer(p18, var360)
				var360 = var373
				var359.kind = { type = "binding_path", value = buffer.tostring(var372) }
			elseif var365 == 4 then
				local _ = nil
				local var374, var375 = protoModule.readBuffer(p18, var360)
				var360 = var375
				var359.kind = { type = "token", value = buffer.tostring(var374) }
			elseif var365 == 5 then
				local _ = nil
				local var376, var377 = protoModule.readBuffer(p18, var360)
				var360 = var377
				var359.kind = { type = "format", value = t.StringFormat.decode(var376) }
			elseif var365 == 6 then
				local _ = nil
				local var378, var379 = protoModule.readBuffer(p18, var360)
				var360 = var379
				var359.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var378)
				}
			else
				local _ = nil
				local var380, var381 = protoModule.readVarInt(p18, var360)
				var360 = var381 + var380
			end
		elseif var361 == protoModule.wireTypes.i32 then
			local _ = nil
			local var382, var383 = protoModule.readFixed32(p18, var360)
			local _ = var382
			var360 = var383
		elseif var361 == protoModule.wireTypes.i64 then
			local _ = nil
			local var384, var385 = protoModule.readFixed64(p18, var360)
			local _ = var384
			var360 = var385
		else
			error("Unsupported wire type: " .. var361)
		end
	end
	return var359
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
	local var387 = t_8.new()
	
	if self.condition ~= nil then
		var387.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var387.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var387.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var387.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var387.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var387.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var387.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var387
end

t_8.descriptor = {
	name = "StringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StringProp_ConditionalOption = t_8
typeRegistryModule.default:register(t.StringProp_ConditionalOption)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p19)
	-- upvalues: t_9 (ref)
	return setmetatable({
		options = if p19 == nil or p19.options == nil then {} else p19.options
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var389 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var390 = v:encode()
			local var391, var392 = protoModule.writeTag(buff, var389, 1, protoModule.wireTypes.lengthDelimited)
			var391, var392 = protoModule.writeBuffer(var391, var392, var390, buffer.len(var390))
			buff = var391
			var389 = var392
		end
	end
	local buff_1 = buffer.create(var389)
	buffer.copy(buff_1, 0, buff, 0, var389)
	
	return buff_1
end

function t_9.decode(p20)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var394 = t_9.new()
	local var395 = 0
	while var395 < buffer.len(p20) do
		local _ = nil
		local var396 = nil
		local var397, var398, var399 = protoModule.readTag(p20, var395)
		local var400 = var397
		var396 = var398
		var395 = var399
		
		if var396 == protoModule.wireTypes.varint then
			local _ = nil
			local var401, var402 = protoModule.readVarInt(p20, var395)
			local _ = var401
			var395 = var402
			continue
		end
		if var396 == protoModule.wireTypes.lengthDelimited then
			if var400 == 1 then
				local _ = nil
				local var403, var404 = protoModule.readBuffer(p20, var395)
				var395 = var404
				table.insert(var394.options, t.StringProp_ConditionalOption.decode(var403))
			else
				local _ = nil
				local var405, var406 = protoModule.readVarInt(p20, var395)
				var395 = var406 + var405
			end
		elseif var396 == protoModule.wireTypes.i32 then
			local _ = nil
			local var407, var408 = protoModule.readFixed32(p20, var395)
			local _ = var407
			var395 = var408
		elseif var396 == protoModule.wireTypes.i64 then
			local _ = nil
			local var409, var410 = protoModule.readFixed64(p20, var395)
			local _ = var409
			var395 = var410
		else
			error("Unsupported wire type: " .. var396)
		end
	end
	return var394
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
	local var413 = t_9.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StringProp_ConditionalOption.jsonDecode(v))
		end
		var413.options = t_1
	end
	return var413
end

t_9.descriptor = {
	name = "StringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StringProp_ConditionalOptions = t_9
typeRegistryModule.default:register(t.StringProp_ConditionalOptions)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p21)
	-- upvalues: t_10 (ref)
	return setmetatable({
		kind = if p21 == nil or p21.kind == nil then nil else p21.kind
	}, t_10)
end

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var416 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var417, var418 = protoModule.writeTag(buff, var416, 1, protoModule.wireTypes.i32)
			var417, var418 = protoModule.writeFloat(var417, var418, self.kind.value)
			buff = var417
			var416 = var418
		elseif self.kind.type == "binding_path" then
			local var419, var420 = protoModule.writeTag(buff, var416, 2, protoModule.wireTypes.lengthDelimited)
			var419, var420 = protoModule.writeString(var419, var420, self.kind.value)
			buff = var419
			var416 = var420
		elseif self.kind.type == "token" then
			local var421, var422 = protoModule.writeTag(buff, var416, 3, protoModule.wireTypes.lengthDelimited)
			var421, var422 = protoModule.writeString(var421, var422, self.kind.value)
			buff = var421
			var416 = var422
		elseif self.kind.type == "conditional" then
			local var423 = self.kind.value:encode()
			local var424, var425 = protoModule.writeTag(buff, var416, 4, protoModule.wireTypes.lengthDelimited)
			var424, var425 = protoModule.writeBuffer(var424, var425, var423, buffer.len(var423))
			buff = var424
			var416 = var425
		end
	end
	local buff_1 = buffer.create(var416)
	buffer.copy(buff_1, 0, buff, 0, var416)
	
	return buff_1
end

function t_10.decode(p22)
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var427 = t_10.new()
	local var428 = 0
	while var428 < buffer.len(p22) do
		local _ = nil
		local var429 = nil
		local var430, var431, var432 = protoModule.readTag(p22, var428)
		local var433 = var430
		var429 = var431
		var428 = var432
		
		if var429 == protoModule.wireTypes.varint then
			local _ = nil
			local var434, var435 = protoModule.readVarInt(p22, var428)
			local _ = var434
			var428 = var435
			continue
		end
		if var429 == protoModule.wireTypes.lengthDelimited then
			if var433 == 2 then
				local _ = nil
				local var436, var437 = protoModule.readBuffer(p22, var428)
				var428 = var437
				var427.kind = { type = "binding_path", value = buffer.tostring(var436) }
			elseif var433 == 3 then
				local _ = nil
				local var438, var439 = protoModule.readBuffer(p22, var428)
				var428 = var439
				var427.kind = { type = "token", value = buffer.tostring(var438) }
			elseif var433 == 4 then
				local _ = nil
				local var440, var441 = protoModule.readBuffer(p22, var428)
				var428 = var441
				var427.kind = {
					type = "conditional",
					value = t.FloatProp_ConditionalOptions.decode(var440)
				}
			else
				local _ = nil
				local var442, var443 = protoModule.readVarInt(p22, var428)
				var428 = var443 + var442
			end
		elseif var429 == protoModule.wireTypes.i32 then
			if var433 == 1 then
				local _ = nil
				local var444, var445 = protoModule.readFloat(p22, var428)
				var428 = var445
				var427.kind = { type = "literal", value = var444 }
			else
				local _ = nil
				local var446, var447 = protoModule.readFixed32(p22, var428)
				local _ = var446
				var428 = var447
			end
		elseif var429 == protoModule.wireTypes.i64 then
			local _ = nil
			local var448, var449 = protoModule.readFixed64(p22, var428)
			local _ = var448
			var428 = var449
		else
			error("Unsupported wire type: " .. var429)
		end
	end
	return var427
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
	local var451 = t_10.new()
	
	if self.literal ~= nil then
		var451.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var451.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var451.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var451.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var451.kind = {
			type = "conditional",
			value = t.FloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var451
end

t_10.descriptor = {
	name = "FloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
}
t.FloatProp = t_10
typeRegistryModule.default:register(t.FloatProp)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p23)
	-- upvalues: t_11 (ref)
	return setmetatable({
		condition = if p23 == nil or p23.condition == nil then nil else p23.condition,
		kind = if p23 == nil or p23.kind == nil then nil else p23.kind
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var453 = 0
	
	if self.condition ~= nil then
		local var454 = self.condition:encode()
		local var455, var456 = protoModule.writeTag(buff, var453, 1, protoModule.wireTypes.lengthDelimited)
		var455, var456 = protoModule.writeBuffer(var455, var456, var454, buffer.len(var454))
		buff = var455
		var453 = var456
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var457, var458 = protoModule.writeTag(buff, var453, 2, protoModule.wireTypes.i32)
			var457, var458 = protoModule.writeFloat(var457, var458, self.kind.value)
			buff = var457
			var453 = var458
		elseif self.kind.type == "binding_path" then
			local var459, var460 = protoModule.writeTag(buff, var453, 3, protoModule.wireTypes.lengthDelimited)
			var459, var460 = protoModule.writeString(var459, var460, self.kind.value)
			buff = var459
			var453 = var460
		elseif self.kind.type == "token" then
			local var461, var462 = protoModule.writeTag(buff, var453, 4, protoModule.wireTypes.lengthDelimited)
			var461, var462 = protoModule.writeString(var461, var462, self.kind.value)
			buff = var461
			var453 = var462
		end
	end
	local buff_1 = buffer.create(var453)
	buffer.copy(buff_1, 0, buff, 0, var453)
	
	return buff_1
end

function t_11.decode(p24)
	-- upvalues: t_11 (ref), protoModule (ref), propConditionModule (ref)
	local var464 = t_11.new()
	local var465 = 0
	while var465 < buffer.len(p24) do
		local _ = nil
		local var466 = nil
		local var467, var468, var469 = protoModule.readTag(p24, var465)
		local var470 = var467
		var466 = var468
		var465 = var469
		
		if var466 == protoModule.wireTypes.varint then
			local _ = nil
			local var471, var472 = protoModule.readVarInt(p24, var465)
			local _ = var471
			var465 = var472
			continue
		end
		if var466 == protoModule.wireTypes.lengthDelimited then
			if var470 == 1 then
				local _ = nil
				local var473, var474 = protoModule.readBuffer(p24, var465)
				var465 = var474
				var464.condition = propConditionModule.PropCondition.decode(var473)
			elseif var470 == 3 then
				local _ = nil
				local var475, var476 = protoModule.readBuffer(p24, var465)
				var465 = var476
				var464.kind = { type = "binding_path", value = buffer.tostring(var475) }
			elseif var470 == 4 then
				local _ = nil
				local var477, var478 = protoModule.readBuffer(p24, var465)
				var465 = var478
				var464.kind = { type = "token", value = buffer.tostring(var477) }
			else
				local _ = nil
				local var479, var480 = protoModule.readVarInt(p24, var465)
				var465 = var480 + var479
			end
		elseif var466 == protoModule.wireTypes.i32 then
			if var470 == 2 then
				local _ = nil
				local var481, var482 = protoModule.readFloat(p24, var465)
				var465 = var482
				var464.kind = { type = "literal", value = var481 }
			else
				local _ = nil
				local var483, var484 = protoModule.readFixed32(p24, var465)
				local _ = var483
				var465 = var484
			end
		elseif var466 == protoModule.wireTypes.i64 then
			local _ = nil
			local var485, var486 = protoModule.readFixed64(p24, var465)
			local _ = var485
			var465 = var486
		else
			error("Unsupported wire type: " .. var466)
		end
	end
	return var464
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
	local var488 = t_11.new()
	
	if self.condition ~= nil then
		var488.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var488.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var488.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var488.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var488.kind = { type = "token", value = self.token }
	end
	return var488
end

t_11.descriptor = {
	name = "FloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FloatProp_ConditionalOption = t_11
typeRegistryModule.default:register(t.FloatProp_ConditionalOption)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p25)
	-- upvalues: t_12 (ref)
	return setmetatable({
		options = if p25 == nil or p25.options == nil then {} else p25.options
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var490 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var491 = v:encode()
			local var492, var493 = protoModule.writeTag(buff, var490, 1, protoModule.wireTypes.lengthDelimited)
			var492, var493 = protoModule.writeBuffer(var492, var493, var491, buffer.len(var491))
			buff = var492
			var490 = var493
		end
	end
	local buff_1 = buffer.create(var490)
	buffer.copy(buff_1, 0, buff, 0, var490)
	
	return buff_1
end

function t_12.decode(p26)
	-- upvalues: t_12 (ref), protoModule (ref), t (ref)
	local var495 = t_12.new()
	local var496 = 0
	while var496 < buffer.len(p26) do
		local _ = nil
		local var497 = nil
		local var498, var499, var500 = protoModule.readTag(p26, var496)
		local var501 = var498
		var497 = var499
		var496 = var500
		
		if var497 == protoModule.wireTypes.varint then
			local _ = nil
			local var502, var503 = protoModule.readVarInt(p26, var496)
			local _ = var502
			var496 = var503
			continue
		end
		if var497 == protoModule.wireTypes.lengthDelimited then
			if var501 == 1 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p26, var496)
				var496 = var505
				table.insert(var495.options, t.FloatProp_ConditionalOption.decode(var504))
			else
				local _ = nil
				local var506, var507 = protoModule.readVarInt(p26, var496)
				var496 = var507 + var506
			end
		elseif var497 == protoModule.wireTypes.i32 then
			local _ = nil
			local var508, var509 = protoModule.readFixed32(p26, var496)
			local _ = var508
			var496 = var509
		elseif var497 == protoModule.wireTypes.i64 then
			local _ = nil
			local var510, var511 = protoModule.readFixed64(p26, var496)
			local _ = var510
			var496 = var511
		else
			error("Unsupported wire type: " .. var497)
		end
	end
	return var495
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
	local var514 = t_12.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FloatProp_ConditionalOption.jsonDecode(v))
		end
		var514.options = t_1
	end
	return var514
end

t_12.descriptor = {
	name = "FloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FloatProp_ConditionalOptions = t_12
typeRegistryModule.default:register(t.FloatProp_ConditionalOptions)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p27)
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p27 == nil or p27.kind == nil then nil else p27.kind
	}, t_13)
end

function t_13:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var517 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var518, var519 = protoModule.writeTag(buff, var517, 1, protoModule.wireTypes.i64)
			var518, var519 = protoModule.writeDouble(var518, var519, self.kind.value)
			buff = var518
			var517 = var519
		elseif self.kind.type == "binding_path" then
			local var520, var521 = protoModule.writeTag(buff, var517, 2, protoModule.wireTypes.lengthDelimited)
			var520, var521 = protoModule.writeString(var520, var521, self.kind.value)
			buff = var520
			var517 = var521
		elseif self.kind.type == "token" then
			local var522, var523 = protoModule.writeTag(buff, var517, 3, protoModule.wireTypes.lengthDelimited)
			var522, var523 = protoModule.writeString(var522, var523, self.kind.value)
			buff = var522
			var517 = var523
		elseif self.kind.type == "conditional" then
			local var524 = self.kind.value:encode()
			local var525, var526 = protoModule.writeTag(buff, var517, 4, protoModule.wireTypes.lengthDelimited)
			var525, var526 = protoModule.writeBuffer(var525, var526, var524, buffer.len(var524))
			buff = var525
			var517 = var526
		end
	end
	local buff_1 = buffer.create(var517)
	buffer.copy(buff_1, 0, buff, 0, var517)
	
	return buff_1
end

function t_13.decode(p28)
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var528 = t_13.new()
	local var529 = 0
	while var529 < buffer.len(p28) do
		local _ = nil
		local var530 = nil
		local var531, var532, var533 = protoModule.readTag(p28, var529)
		local var534 = var531
		var530 = var532
		var529 = var533
		
		if var530 == protoModule.wireTypes.varint then
			local _ = nil
			local var535, var536 = protoModule.readVarInt(p28, var529)
			local _ = var535
			var529 = var536
			continue
		end
		if var530 == protoModule.wireTypes.lengthDelimited then
			if var534 == 2 then
				local _ = nil
				local var537, var538 = protoModule.readBuffer(p28, var529)
				var529 = var538
				var528.kind = { type = "binding_path", value = buffer.tostring(var537) }
			elseif var534 == 3 then
				local _ = nil
				local var539, var540 = protoModule.readBuffer(p28, var529)
				var529 = var540
				var528.kind = { type = "token", value = buffer.tostring(var539) }
			elseif var534 == 4 then
				local _ = nil
				local var541, var542 = protoModule.readBuffer(p28, var529)
				var529 = var542
				var528.kind = {
					type = "conditional",
					value = t.DoubleProp_ConditionalOptions.decode(var541)
				}
			else
				local _ = nil
				local var543, var544 = protoModule.readVarInt(p28, var529)
				var529 = var544 + var543
			end
		elseif var530 == protoModule.wireTypes.i32 then
			local _ = nil
			local var545, var546 = protoModule.readFixed32(p28, var529)
			local _ = var545
			var529 = var546
		elseif var530 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var530)
		elseif var534 == 1 then
			local _ = nil
			local var547, var548 = protoModule.readDouble(p28, var529)
			var529 = var548
			var528.kind = { type = "literal", value = var547 }
		else
			local _ = nil
			local var549, var550 = protoModule.readFixed64(p28, var529)
			local _ = var549
			var529 = var550
		end
	end
	return var528
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
	local var552 = t_13.new()
	
	if self.literal ~= nil then
		var552.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var552.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var552.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var552.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var552.kind = {
			type = "conditional",
			value = t.DoubleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var552
end

t_13.descriptor = {
	name = "DoubleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
}
t.DoubleProp = t_13
typeRegistryModule.default:register(t.DoubleProp)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p29)
	-- upvalues: t_14 (ref)
	return setmetatable({
		condition = if p29 == nil or p29.condition == nil then nil else p29.condition,
		kind = if p29 == nil or p29.kind == nil then nil else p29.kind
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var554 = 0
	
	if self.condition ~= nil then
		local var555 = self.condition:encode()
		local var556, var557 = protoModule.writeTag(buff, var554, 1, protoModule.wireTypes.lengthDelimited)
		var556, var557 = protoModule.writeBuffer(var556, var557, var555, buffer.len(var555))
		buff = var556
		var554 = var557
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var558, var559 = protoModule.writeTag(buff, var554, 2, protoModule.wireTypes.i64)
			var558, var559 = protoModule.writeDouble(var558, var559, self.kind.value)
			buff = var558
			var554 = var559
		elseif self.kind.type == "binding_path" then
			local var560, var561 = protoModule.writeTag(buff, var554, 3, protoModule.wireTypes.lengthDelimited)
			var560, var561 = protoModule.writeString(var560, var561, self.kind.value)
			buff = var560
			var554 = var561
		elseif self.kind.type == "token" then
			local var562, var563 = protoModule.writeTag(buff, var554, 4, protoModule.wireTypes.lengthDelimited)
			var562, var563 = protoModule.writeString(var562, var563, self.kind.value)
			buff = var562
			var554 = var563
		end
	end
	local buff_1 = buffer.create(var554)
	buffer.copy(buff_1, 0, buff, 0, var554)
	
	return buff_1
end

function t_14.decode(p30)
	-- upvalues: t_14 (ref), protoModule (ref), propConditionModule (ref)
	local var565 = t_14.new()
	local var566 = 0
	while var566 < buffer.len(p30) do
		local _ = nil
		local var567 = nil
		local var568, var569, var570 = protoModule.readTag(p30, var566)
		local var571 = var568
		var567 = var569
		var566 = var570
		
		if var567 == protoModule.wireTypes.varint then
			local _ = nil
			local var572, var573 = protoModule.readVarInt(p30, var566)
			local _ = var572
			var566 = var573
			continue
		end
		if var567 == protoModule.wireTypes.lengthDelimited then
			if var571 == 1 then
				local _ = nil
				local var574, var575 = protoModule.readBuffer(p30, var566)
				var566 = var575
				var565.condition = propConditionModule.PropCondition.decode(var574)
			elseif var571 == 3 then
				local _ = nil
				local var576, var577 = protoModule.readBuffer(p30, var566)
				var566 = var577
				var565.kind = { type = "binding_path", value = buffer.tostring(var576) }
			elseif var571 == 4 then
				local _ = nil
				local var578, var579 = protoModule.readBuffer(p30, var566)
				var566 = var579
				var565.kind = { type = "token", value = buffer.tostring(var578) }
			else
				local _ = nil
				local var580, var581 = protoModule.readVarInt(p30, var566)
				var566 = var581 + var580
			end
		elseif var567 == protoModule.wireTypes.i32 then
			local _ = nil
			local var582, var583 = protoModule.readFixed32(p30, var566)
			local _ = var582
			var566 = var583
		elseif var567 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var567)
		elseif var571 == 2 then
			local _ = nil
			local var584, var585 = protoModule.readDouble(p30, var566)
			var566 = var585
			var565.kind = { type = "literal", value = var584 }
		else
			local _ = nil
			local var586, var587 = protoModule.readFixed64(p30, var566)
			local _ = var586
			var566 = var587
		end
	end
	return var565
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
	local var589 = t_14.new()
	
	if self.condition ~= nil then
		var589.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var589.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var589.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var589.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var589.kind = { type = "token", value = self.token }
	end
	return var589
end

t_14.descriptor = {
	name = "DoubleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.DoubleProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.DoubleProp_ConditionalOption)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p31)
	-- upvalues: t_15 (ref)
	return setmetatable({
		options = if p31 == nil or p31.options == nil then {} else p31.options
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var591 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var592 = v:encode()
			local var593, var594 = protoModule.writeTag(buff, var591, 1, protoModule.wireTypes.lengthDelimited)
			var593, var594 = protoModule.writeBuffer(var593, var594, var592, buffer.len(var592))
			buff = var593
			var591 = var594
		end
	end
	local buff_1 = buffer.create(var591)
	buffer.copy(buff_1, 0, buff, 0, var591)
	
	return buff_1
end

function t_15.decode(p32)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var596 = t_15.new()
	local var597 = 0
	while var597 < buffer.len(p32) do
		local _ = nil
		local var598 = nil
		local var599, var600, var601 = protoModule.readTag(p32, var597)
		local var602 = var599
		var598 = var600
		var597 = var601
		
		if var598 == protoModule.wireTypes.varint then
			local _ = nil
			local var603, var604 = protoModule.readVarInt(p32, var597)
			local _ = var603
			var597 = var604
			continue
		end
		if var598 == protoModule.wireTypes.lengthDelimited then
			if var602 == 1 then
				local _ = nil
				local var605, var606 = protoModule.readBuffer(p32, var597)
				var597 = var606
				table.insert(var596.options, t.DoubleProp_ConditionalOption.decode(var605))
			else
				local _ = nil
				local var607, var608 = protoModule.readVarInt(p32, var597)
				var597 = var608 + var607
			end
		elseif var598 == protoModule.wireTypes.i32 then
			local _ = nil
			local var609, var610 = protoModule.readFixed32(p32, var597)
			local _ = var609
			var597 = var610
		elseif var598 == protoModule.wireTypes.i64 then
			local _ = nil
			local var611, var612 = protoModule.readFixed64(p32, var597)
			local _ = var611
			var597 = var612
		else
			error("Unsupported wire type: " .. var598)
		end
	end
	return var596
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
	local var615 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.DoubleProp_ConditionalOption.jsonDecode(v))
		end
		var615.options = t_1
	end
	return var615
end

t_15.descriptor = {
	name = "DoubleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.DoubleProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.DoubleProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p33)
	-- upvalues: t_16 (ref)
	return setmetatable({
		kind = if p33 == nil or p33.kind == nil then nil else p33.kind
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var618 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var619, var620 = protoModule.writeTag(buff, var618, 1, protoModule.wireTypes.varint)
			var619, var620 = protoModule.writeVarInt(var619, var620, self.kind.value)
			buff = var619
			var618 = var620
		elseif self.kind.type == "binding_path" then
			local var621, var622 = protoModule.writeTag(buff, var618, 2, protoModule.wireTypes.lengthDelimited)
			var621, var622 = protoModule.writeString(var621, var622, self.kind.value)
			buff = var621
			var618 = var622
		elseif self.kind.type == "token" then
			local var623, var624 = protoModule.writeTag(buff, var618, 3, protoModule.wireTypes.lengthDelimited)
			var623, var624 = protoModule.writeString(var623, var624, self.kind.value)
			buff = var623
			var618 = var624
		elseif self.kind.type == "conditional" then
			local var625 = self.kind.value:encode()
			local var626, var627 = protoModule.writeTag(buff, var618, 4, protoModule.wireTypes.lengthDelimited)
			var626, var627 = protoModule.writeBuffer(var626, var627, var625, buffer.len(var625))
			buff = var626
			var618 = var627
		end
	end
	local buff_1 = buffer.create(var618)
	buffer.copy(buff_1, 0, buff, 0, var618)
	
	return buff_1
end

function t_16.decode(p34)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var629 = t_16.new()
	local var630 = 0
	while var630 < buffer.len(p34) do
		local _ = nil
		local var631 = nil
		local var632, var633, var634 = protoModule.readTag(p34, var630)
		local var635 = var632
		var631 = var633
		var630 = var634
		
		if var631 == protoModule.wireTypes.varint then
			if var635 == 1 then
				local _ = nil
				local var636, var637 = protoModule.readVarIntI32(p34, var630)
				var630 = var637
				var629.kind = { type = "literal", value = var636 }
			else
				local _ = nil
				local var638, var639 = protoModule.readVarInt(p34, var630)
				local _ = var638
				var630 = var639
			end
		end
		if var631 == protoModule.wireTypes.lengthDelimited then
			if var635 == 2 then
				local _ = nil
				local var640, var641 = protoModule.readBuffer(p34, var630)
				var630 = var641
				var629.kind = { type = "binding_path", value = buffer.tostring(var640) }
			elseif var635 == 3 then
				local _ = nil
				local var642, var643 = protoModule.readBuffer(p34, var630)
				var630 = var643
				var629.kind = { type = "token", value = buffer.tostring(var642) }
			elseif var635 == 4 then
				local _ = nil
				local var644, var645 = protoModule.readBuffer(p34, var630)
				var630 = var645
				var629.kind = {
					type = "conditional",
					value = t.Int32Prop_ConditionalOptions.decode(var644)
				}
			else
				local _ = nil
				local var646, var647 = protoModule.readVarInt(p34, var630)
				var630 = var647 + var646
			end
		elseif var631 == protoModule.wireTypes.i32 then
			local _ = nil
			local var648, var649 = protoModule.readFixed32(p34, var630)
			local _ = var648
			var630 = var649
		elseif var631 == protoModule.wireTypes.i64 then
			local _ = nil
			local var650, var651 = protoModule.readFixed64(p34, var630)
			local _ = var650
			var630 = var651
		else
			error("Unsupported wire type: " .. var631)
		end
	end
	return var629
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
	local var653 = t_16.new()
	
	if self.literal ~= nil then
		var653.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var653.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var653.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var653.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var653.kind = {
			type = "conditional",
			value = t.Int32Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var653
end

t_16.descriptor = {
	name = "Int32Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
}
t.Int32Prop = t_16
typeRegistryModule.default:register(t.Int32Prop)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p35)
	-- upvalues: t_17 (ref)
	return setmetatable({
		condition = if p35 == nil or p35.condition == nil then nil else p35.condition,
		kind = if p35 == nil or p35.kind == nil then nil else p35.kind
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var655 = 0
	
	if self.condition ~= nil then
		local var656 = self.condition:encode()
		local var657, var658 = protoModule.writeTag(buff, var655, 1, protoModule.wireTypes.lengthDelimited)
		var657, var658 = protoModule.writeBuffer(var657, var658, var656, buffer.len(var656))
		buff = var657
		var655 = var658
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var659, var660 = protoModule.writeTag(buff, var655, 2, protoModule.wireTypes.varint)
			var659, var660 = protoModule.writeVarInt(var659, var660, self.kind.value)
			buff = var659
			var655 = var660
		elseif self.kind.type == "binding_path" then
			local var661, var662 = protoModule.writeTag(buff, var655, 3, protoModule.wireTypes.lengthDelimited)
			var661, var662 = protoModule.writeString(var661, var662, self.kind.value)
			buff = var661
			var655 = var662
		elseif self.kind.type == "token" then
			local var663, var664 = protoModule.writeTag(buff, var655, 4, protoModule.wireTypes.lengthDelimited)
			var663, var664 = protoModule.writeString(var663, var664, self.kind.value)
			buff = var663
			var655 = var664
		end
	end
	local buff_1 = buffer.create(var655)
	buffer.copy(buff_1, 0, buff, 0, var655)
	
	return buff_1
end

function t_17.decode(p36)
	-- upvalues: t_17 (ref), protoModule (ref), propConditionModule (ref)
	local var666 = t_17.new()
	local var667 = 0
	while var667 < buffer.len(p36) do
		local _ = nil
		local var668 = nil
		local var669, var670, var671 = protoModule.readTag(p36, var667)
		local var672 = var669
		var668 = var670
		var667 = var671
		
		if var668 == protoModule.wireTypes.varint then
			if var672 == 2 then
				local _ = nil
				local var673, var674 = protoModule.readVarIntI32(p36, var667)
				var667 = var674
				var666.kind = { type = "literal", value = var673 }
			else
				local _ = nil
				local var675, var676 = protoModule.readVarInt(p36, var667)
				local _ = var675
				var667 = var676
			end
		end
		if var668 == protoModule.wireTypes.lengthDelimited then
			if var672 == 1 then
				local _ = nil
				local var677, var678 = protoModule.readBuffer(p36, var667)
				var667 = var678
				var666.condition = propConditionModule.PropCondition.decode(var677)
			elseif var672 == 3 then
				local _ = nil
				local var679, var680 = protoModule.readBuffer(p36, var667)
				var667 = var680
				var666.kind = { type = "binding_path", value = buffer.tostring(var679) }
			elseif var672 == 4 then
				local _ = nil
				local var681, var682 = protoModule.readBuffer(p36, var667)
				var667 = var682
				var666.kind = { type = "token", value = buffer.tostring(var681) }
			else
				local _ = nil
				local var683, var684 = protoModule.readVarInt(p36, var667)
				var667 = var684 + var683
			end
		elseif var668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var685, var686 = protoModule.readFixed32(p36, var667)
			local _ = var685
			var667 = var686
		elseif var668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var687, var688 = protoModule.readFixed64(p36, var667)
			local _ = var687
			var667 = var688
		else
			error("Unsupported wire type: " .. var668)
		end
	end
	return var666
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
	local var690 = t_17.new()
	
	if self.condition ~= nil then
		var690.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var690.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var690.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var690.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var690.kind = { type = "token", value = self.token }
	end
	return var690
end

t_17.descriptor = {
	name = "Int32Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int32Prop_ConditionalOption = t_17
typeRegistryModule.default:register(t.Int32Prop_ConditionalOption)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p37)
	-- upvalues: t_18 (ref)
	return setmetatable({
		options = if p37 == nil or p37.options == nil then {} else p37.options
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var692 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var693 = v:encode()
			local var694, var695 = protoModule.writeTag(buff, var692, 1, protoModule.wireTypes.lengthDelimited)
			var694, var695 = protoModule.writeBuffer(var694, var695, var693, buffer.len(var693))
			buff = var694
			var692 = var695
		end
	end
	local buff_1 = buffer.create(var692)
	buffer.copy(buff_1, 0, buff, 0, var692)
	
	return buff_1
end

function t_18.decode(p38)
	-- upvalues: t_18 (ref), protoModule (ref), t (ref)
	local var697 = t_18.new()
	local var698 = 0
	while var698 < buffer.len(p38) do
		local _ = nil
		local var699 = nil
		local var700, var701, var702 = protoModule.readTag(p38, var698)
		local var703 = var700
		var699 = var701
		var698 = var702
		
		if var699 == protoModule.wireTypes.varint then
			local _ = nil
			local var704, var705 = protoModule.readVarInt(p38, var698)
			local _ = var704
			var698 = var705
			continue
		end
		if var699 == protoModule.wireTypes.lengthDelimited then
			if var703 == 1 then
				local _ = nil
				local var706, var707 = protoModule.readBuffer(p38, var698)
				var698 = var707
				table.insert(var697.options, t.Int32Prop_ConditionalOption.decode(var706))
			else
				local _ = nil
				local var708, var709 = protoModule.readVarInt(p38, var698)
				var698 = var709 + var708
			end
		elseif var699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var710, var711 = protoModule.readFixed32(p38, var698)
			local _ = var710
			var698 = var711
		elseif var699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var712, var713 = protoModule.readFixed64(p38, var698)
			local _ = var712
			var698 = var713
		else
			error("Unsupported wire type: " .. var699)
		end
	end
	return var697
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
	local var716 = t_18.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int32Prop_ConditionalOption.jsonDecode(v))
		end
		var716.options = t_1
	end
	return var716
end

t_18.descriptor = {
	name = "Int32Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int32Prop_ConditionalOptions = t_18
typeRegistryModule.default:register(t.Int32Prop_ConditionalOptions)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p39)
	-- upvalues: t_19 (ref)
	return setmetatable({
		kind = if p39 == nil or p39.kind == nil then nil else p39.kind
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var719 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var720, var721 = protoModule.writeTag(buff, var719, 1, protoModule.wireTypes.varint)
			var720, var721 = protoModule.writeVarInt(var720, var721, self.kind.value)
			buff = var720
			var719 = var721
		elseif self.kind.type == "binding_path" then
			local var722, var723 = protoModule.writeTag(buff, var719, 2, protoModule.wireTypes.lengthDelimited)
			var722, var723 = protoModule.writeString(var722, var723, self.kind.value)
			buff = var722
			var719 = var723
		elseif self.kind.type == "token" then
			local var724, var725 = protoModule.writeTag(buff, var719, 3, protoModule.wireTypes.lengthDelimited)
			var724, var725 = protoModule.writeString(var724, var725, self.kind.value)
			buff = var724
			var719 = var725
		elseif self.kind.type == "conditional" then
			local var726 = self.kind.value:encode()
			local var727, var728 = protoModule.writeTag(buff, var719, 4, protoModule.wireTypes.lengthDelimited)
			var727, var728 = protoModule.writeBuffer(var727, var728, var726, buffer.len(var726))
			buff = var727
			var719 = var728
		end
	end
	local buff_1 = buffer.create(var719)
	buffer.copy(buff_1, 0, buff, 0, var719)
	
	return buff_1
end

function t_19.decode(p40)
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var730 = t_19.new()
	local var731 = 0
	while var731 < buffer.len(p40) do
		local _ = nil
		local var732 = nil
		local var733, var734, var735 = protoModule.readTag(p40, var731)
		local var736 = var733
		var732 = var734
		var731 = var735
		
		if var732 == protoModule.wireTypes.varint then
			if var736 == 1 then
				local _ = nil
				local var737, var738 = protoModule.readVarIntI64(p40, var731)
				var731 = var738
				var730.kind = { type = "literal", value = var737 }
			else
				local _ = nil
				local var739, var740 = protoModule.readVarInt(p40, var731)
				local _ = var739
				var731 = var740
			end
		end
		if var732 == protoModule.wireTypes.lengthDelimited then
			if var736 == 2 then
				local _ = nil
				local var741, var742 = protoModule.readBuffer(p40, var731)
				var731 = var742
				var730.kind = { type = "binding_path", value = buffer.tostring(var741) }
			elseif var736 == 3 then
				local _ = nil
				local var743, var744 = protoModule.readBuffer(p40, var731)
				var731 = var744
				var730.kind = { type = "token", value = buffer.tostring(var743) }
			elseif var736 == 4 then
				local _ = nil
				local var745, var746 = protoModule.readBuffer(p40, var731)
				var731 = var746
				var730.kind = {
					type = "conditional",
					value = t.Int64Prop_ConditionalOptions.decode(var745)
				}
			else
				local _ = nil
				local var747, var748 = protoModule.readVarInt(p40, var731)
				var731 = var748 + var747
			end
		elseif var732 == protoModule.wireTypes.i32 then
			local _ = nil
			local var749, var750 = protoModule.readFixed32(p40, var731)
			local _ = var749
			var731 = var750
		elseif var732 == protoModule.wireTypes.i64 then
			local _ = nil
			local var751, var752 = protoModule.readFixed64(p40, var731)
			local _ = var751
			var731 = var752
		else
			error("Unsupported wire type: " .. var732)
		end
	end
	return var730
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
	local var754 = t_19.new()
	
	if self.literal ~= nil then
		var754.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var754.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var754.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var754.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var754.kind = {
			type = "conditional",
			value = t.Int64Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var754
end

t_19.descriptor = {
	name = "Int64Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
}
t.Int64Prop = t_19
typeRegistryModule.default:register(t.Int64Prop)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p41)
	-- upvalues: t_20 (ref)
	return setmetatable({
		condition = if p41 == nil or p41.condition == nil then nil else p41.condition,
		kind = if p41 == nil or p41.kind == nil then nil else p41.kind
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var756 = 0
	
	if self.condition ~= nil then
		local var757 = self.condition:encode()
		local var758, var759 = protoModule.writeTag(buff, var756, 1, protoModule.wireTypes.lengthDelimited)
		var758, var759 = protoModule.writeBuffer(var758, var759, var757, buffer.len(var757))
		buff = var758
		var756 = var759
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var760, var761 = protoModule.writeTag(buff, var756, 2, protoModule.wireTypes.varint)
			var760, var761 = protoModule.writeVarInt(var760, var761, self.kind.value)
			buff = var760
			var756 = var761
		elseif self.kind.type == "binding_path" then
			local var762, var763 = protoModule.writeTag(buff, var756, 3, protoModule.wireTypes.lengthDelimited)
			var762, var763 = protoModule.writeString(var762, var763, self.kind.value)
			buff = var762
			var756 = var763
		elseif self.kind.type == "token" then
			local var764, var765 = protoModule.writeTag(buff, var756, 4, protoModule.wireTypes.lengthDelimited)
			var764, var765 = protoModule.writeString(var764, var765, self.kind.value)
			buff = var764
			var756 = var765
		end
	end
	local buff_1 = buffer.create(var756)
	buffer.copy(buff_1, 0, buff, 0, var756)
	
	return buff_1
end

function t_20.decode(p42)
	-- upvalues: t_20 (ref), protoModule (ref), propConditionModule (ref)
	local var767 = t_20.new()
	local var768 = 0
	while var768 < buffer.len(p42) do
		local _ = nil
		local var769 = nil
		local var770, var771, var772 = protoModule.readTag(p42, var768)
		local var773 = var770
		var769 = var771
		var768 = var772
		
		if var769 == protoModule.wireTypes.varint then
			if var773 == 2 then
				local _ = nil
				local var774, var775 = protoModule.readVarIntI64(p42, var768)
				var768 = var775
				var767.kind = { type = "literal", value = var774 }
			else
				local _ = nil
				local var776, var777 = protoModule.readVarInt(p42, var768)
				local _ = var776
				var768 = var777
			end
		end
		if var769 == protoModule.wireTypes.lengthDelimited then
			if var773 == 1 then
				local _ = nil
				local var778, var779 = protoModule.readBuffer(p42, var768)
				var768 = var779
				var767.condition = propConditionModule.PropCondition.decode(var778)
			elseif var773 == 3 then
				local _ = nil
				local var780, var781 = protoModule.readBuffer(p42, var768)
				var768 = var781
				var767.kind = { type = "binding_path", value = buffer.tostring(var780) }
			elseif var773 == 4 then
				local _ = nil
				local var782, var783 = protoModule.readBuffer(p42, var768)
				var768 = var783
				var767.kind = { type = "token", value = buffer.tostring(var782) }
			else
				local _ = nil
				local var784, var785 = protoModule.readVarInt(p42, var768)
				var768 = var785 + var784
			end
		elseif var769 == protoModule.wireTypes.i32 then
			local _ = nil
			local var786, var787 = protoModule.readFixed32(p42, var768)
			local _ = var786
			var768 = var787
		elseif var769 == protoModule.wireTypes.i64 then
			local _ = nil
			local var788, var789 = protoModule.readFixed64(p42, var768)
			local _ = var788
			var768 = var789
		else
			error("Unsupported wire type: " .. var769)
		end
	end
	return var767
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
	local var791 = t_20.new()
	
	if self.condition ~= nil then
		var791.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var791.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var791.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var791.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var791.kind = { type = "token", value = self.token }
	end
	return var791
end

t_20.descriptor = {
	name = "Int64Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int64Prop_ConditionalOption = t_20
typeRegistryModule.default:register(t.Int64Prop_ConditionalOption)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p43)
	-- upvalues: t_21 (ref)
	return setmetatable({
		options = if p43 == nil or p43.options == nil then {} else p43.options
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var793 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var794 = v:encode()
			local var795, var796 = protoModule.writeTag(buff, var793, 1, protoModule.wireTypes.lengthDelimited)
			var795, var796 = protoModule.writeBuffer(var795, var796, var794, buffer.len(var794))
			buff = var795
			var793 = var796
		end
	end
	local buff_1 = buffer.create(var793)
	buffer.copy(buff_1, 0, buff, 0, var793)
	
	return buff_1
end

function t_21.decode(p44)
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var798 = t_21.new()
	local var799 = 0
	while var799 < buffer.len(p44) do
		local _ = nil
		local var800 = nil
		local var801, var802, var803 = protoModule.readTag(p44, var799)
		local var804 = var801
		var800 = var802
		var799 = var803
		
		if var800 == protoModule.wireTypes.varint then
			local _ = nil
			local var805, var806 = protoModule.readVarInt(p44, var799)
			local _ = var805
			var799 = var806
			continue
		end
		if var800 == protoModule.wireTypes.lengthDelimited then
			if var804 == 1 then
				local _ = nil
				local var807, var808 = protoModule.readBuffer(p44, var799)
				var799 = var808
				table.insert(var798.options, t.Int64Prop_ConditionalOption.decode(var807))
			else
				local _ = nil
				local var809, var810 = protoModule.readVarInt(p44, var799)
				var799 = var810 + var809
			end
		elseif var800 == protoModule.wireTypes.i32 then
			local _ = nil
			local var811, var812 = protoModule.readFixed32(p44, var799)
			local _ = var811
			var799 = var812
		elseif var800 == protoModule.wireTypes.i64 then
			local _ = nil
			local var813, var814 = protoModule.readFixed64(p44, var799)
			local _ = var813
			var799 = var814
		else
			error("Unsupported wire type: " .. var800)
		end
	end
	return var798
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
	local var817 = t_21.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int64Prop_ConditionalOption.jsonDecode(v))
		end
		var817.options = t_1
	end
	return var817
end

t_21.descriptor = {
	name = "Int64Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int64Prop_ConditionalOptions = t_21
typeRegistryModule.default:register(t.Int64Prop_ConditionalOptions)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p45)
	-- upvalues: t_22 (ref)
	return setmetatable({
		kind = if p45 == nil or p45.kind == nil then nil else p45.kind
	}, t_22)
end

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var820 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var821, var822 = protoModule.writeTag(buff, var820, 1, protoModule.wireTypes.varint)
			var821, var822 = protoModule.writeVarInt(var821, var822, if self.kind.value then 1 else 0)
			buff = var821
			var820 = var822
		elseif self.kind.type == "binding_path" then
			local var823, var824 = protoModule.writeTag(buff, var820, 2, protoModule.wireTypes.lengthDelimited)
			var823, var824 = protoModule.writeString(var823, var824, self.kind.value)
			buff = var823
			var820 = var824
		elseif self.kind.type == "conditional" then
			local var825 = self.kind.value:encode()
			local var826, var827 = protoModule.writeTag(buff, var820, 3, protoModule.wireTypes.lengthDelimited)
			var826, var827 = protoModule.writeBuffer(var826, var827, var825, buffer.len(var825))
			buff = var826
			var820 = var827
		end
	end
	local buff_1 = buffer.create(var820)
	buffer.copy(buff_1, 0, buff, 0, var820)
	
	return buff_1
end

function t_22.decode(p46)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var829 = t_22.new()
	local var830 = 0
	while var830 < buffer.len(p46) do
		local _ = nil
		local var831 = nil
		local var832, var833, var834 = protoModule.readTag(p46, var830)
		local var835 = var832
		var831 = var833
		var830 = var834
		
		if var831 == protoModule.wireTypes.varint then
			if var835 == 1 then
				local _ = nil
				local var836, var837 = protoModule.readVarInt(p46, var830)
				var830 = var837
				var829.kind = { type = "literal", value = var836 ~= 0 }
			else
				local _ = nil
				local var838, var839 = protoModule.readVarInt(p46, var830)
				local _ = var838
				var830 = var839
			end
		end
		if var831 == protoModule.wireTypes.lengthDelimited then
			if var835 == 2 then
				local _ = nil
				local var840, var841 = protoModule.readBuffer(p46, var830)
				var830 = var841
				var829.kind = { type = "binding_path", value = buffer.tostring(var840) }
			elseif var835 == 3 then
				local _ = nil
				local var842, var843 = protoModule.readBuffer(p46, var830)
				var830 = var843
				var829.kind = {
					type = "conditional",
					value = t.BoolProp_ConditionalOptions.decode(var842)
				}
			else
				local _ = nil
				local var844, var845 = protoModule.readVarInt(p46, var830)
				var830 = var845 + var844
			end
		elseif var831 == protoModule.wireTypes.i32 then
			local _ = nil
			local var846, var847 = protoModule.readFixed32(p46, var830)
			local _ = var846
			var830 = var847
		elseif var831 == protoModule.wireTypes.i64 then
			local _ = nil
			local var848, var849 = protoModule.readFixed64(p46, var830)
			local _ = var848
			var830 = var849
		else
			error("Unsupported wire type: " .. var831)
		end
	end
	return var829
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
	local var851 = t_22.new()
	
	if self.literal ~= nil then
		var851.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var851.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var851.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var851.kind = {
			type = "conditional",
			value = t.BoolProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var851
end

t_22.descriptor = {
	name = "BoolProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
}
t.BoolProp = t_22
typeRegistryModule.default:register(t.BoolProp)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p47)
	-- upvalues: t_23 (ref)
	return setmetatable({
		condition = if p47 == nil or p47.condition == nil then nil else p47.condition,
		kind = if p47 == nil or p47.kind == nil then nil else p47.kind
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var853 = 0
	
	if self.condition ~= nil then
		local var854 = self.condition:encode()
		local var855, var856 = protoModule.writeTag(buff, var853, 1, protoModule.wireTypes.lengthDelimited)
		var855, var856 = protoModule.writeBuffer(var855, var856, var854, buffer.len(var854))
		buff = var855
		var853 = var856
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var857, var858 = protoModule.writeTag(buff, var853, 2, protoModule.wireTypes.varint)
			var857, var858 = protoModule.writeVarInt(var857, var858, if self.kind.value then 1 else 0)
			buff = var857
			var853 = var858
		elseif self.kind.type == "binding_path" then
			local var859, var860 = protoModule.writeTag(buff, var853, 3, protoModule.wireTypes.lengthDelimited)
			var859, var860 = protoModule.writeString(var859, var860, self.kind.value)
			buff = var859
			var853 = var860
		end
	end
	local buff_1 = buffer.create(var853)
	buffer.copy(buff_1, 0, buff, 0, var853)
	
	return buff_1
end

function t_23.decode(p48)
	-- upvalues: t_23 (ref), protoModule (ref), propConditionModule (ref)
	local var862 = t_23.new()
	local var863 = 0
	while var863 < buffer.len(p48) do
		local _ = nil
		local var864 = nil
		local var865, var866, var867 = protoModule.readTag(p48, var863)
		local var868 = var865
		var864 = var866
		var863 = var867
		
		if var864 == protoModule.wireTypes.varint then
			if var868 == 2 then
				local _ = nil
				local var869, var870 = protoModule.readVarInt(p48, var863)
				var863 = var870
				var862.kind = { type = "literal", value = var869 ~= 0 }
			else
				local _ = nil
				local var871, var872 = protoModule.readVarInt(p48, var863)
				local _ = var871
				var863 = var872
			end
		end
		if var864 == protoModule.wireTypes.lengthDelimited then
			if var868 == 1 then
				local _ = nil
				local var873, var874 = protoModule.readBuffer(p48, var863)
				var863 = var874
				var862.condition = propConditionModule.PropCondition.decode(var873)
			elseif var868 == 3 then
				local _ = nil
				local var875, var876 = protoModule.readBuffer(p48, var863)
				var863 = var876
				var862.kind = { type = "binding_path", value = buffer.tostring(var875) }
			else
				local _ = nil
				local var877, var878 = protoModule.readVarInt(p48, var863)
				var863 = var878 + var877
			end
		elseif var864 == protoModule.wireTypes.i32 then
			local _ = nil
			local var879, var880 = protoModule.readFixed32(p48, var863)
			local _ = var879
			var863 = var880
		elseif var864 == protoModule.wireTypes.i64 then
			local _ = nil
			local var881, var882 = protoModule.readFixed64(p48, var863)
			local _ = var881
			var863 = var882
		else
			error("Unsupported wire type: " .. var864)
		end
	end
	return var862
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
	local var884 = t_23.new()
	
	if self.condition ~= nil then
		var884.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var884.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var884.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var884.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var884
end

t_23.descriptor = {
	name = "BoolProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.BoolProp_ConditionalOption = t_23
typeRegistryModule.default:register(t.BoolProp_ConditionalOption)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p49)
	-- upvalues: t_24 (ref)
	return setmetatable({
		options = if p49 == nil or p49.options == nil then {} else p49.options
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var886 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var887 = v:encode()
			local var888, var889 = protoModule.writeTag(buff, var886, 1, protoModule.wireTypes.lengthDelimited)
			var888, var889 = protoModule.writeBuffer(var888, var889, var887, buffer.len(var887))
			buff = var888
			var886 = var889
		end
	end
	local buff_1 = buffer.create(var886)
	buffer.copy(buff_1, 0, buff, 0, var886)
	
	return buff_1
end

function t_24.decode(p50)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var891 = t_24.new()
	local var892 = 0
	while var892 < buffer.len(p50) do
		local _ = nil
		local var893 = nil
		local var894, var895, var896 = protoModule.readTag(p50, var892)
		local var897 = var894
		var893 = var895
		var892 = var896
		
		if var893 == protoModule.wireTypes.varint then
			local _ = nil
			local var898, var899 = protoModule.readVarInt(p50, var892)
			local _ = var898
			var892 = var899
			continue
		end
		if var893 == protoModule.wireTypes.lengthDelimited then
			if var897 == 1 then
				local _ = nil
				local var900, var901 = protoModule.readBuffer(p50, var892)
				var892 = var901
				table.insert(var891.options, t.BoolProp_ConditionalOption.decode(var900))
			else
				local _ = nil
				local var902, var903 = protoModule.readVarInt(p50, var892)
				var892 = var903 + var902
			end
		elseif var893 == protoModule.wireTypes.i32 then
			local _ = nil
			local var904, var905 = protoModule.readFixed32(p50, var892)
			local _ = var904
			var892 = var905
		elseif var893 == protoModule.wireTypes.i64 then
			local _ = nil
			local var906, var907 = protoModule.readFixed64(p50, var892)
			local _ = var906
			var892 = var907
		else
			error("Unsupported wire type: " .. var893)
		end
	end
	return var891
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
	local var910 = t_24.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.BoolProp_ConditionalOption.jsonDecode(v))
		end
		var910.options = t_1
	end
	return var910
end

t_24.descriptor = {
	name = "BoolProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.BoolProp_ConditionalOptions = t_24
typeRegistryModule.default:register(t.BoolProp_ConditionalOptions)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p51)
	-- upvalues: t_25 (ref)
	return setmetatable({
		kind = if p51 == nil or p51.kind == nil then nil else p51.kind
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var913 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var914 = self.kind.value:encode()
			local var915, var916 = protoModule.writeTag(buff, var913, 1, protoModule.wireTypes.lengthDelimited)
			var915, var916 = protoModule.writeBuffer(var915, var916, var914, buffer.len(var914))
			buff = var915
			var913 = var916
		elseif self.kind.type == "binding_path" then
			local var917, var918 = protoModule.writeTag(buff, var913, 2, protoModule.wireTypes.lengthDelimited)
			var917, var918 = protoModule.writeString(var917, var918, self.kind.value)
			buff = var917
			var913 = var918
		elseif self.kind.type == "conditional" then
			local var919 = self.kind.value:encode()
			local var920, var921 = protoModule.writeTag(buff, var913, 3, protoModule.wireTypes.lengthDelimited)
			var920, var921 = protoModule.writeBuffer(var920, var921, var919, buffer.len(var919))
			buff = var920
			var913 = var921
		end
	end
	local buff_1 = buffer.create(var913)
	buffer.copy(buff_1, 0, buff, 0, var913)
	
	return buff_1
end

function t_25.decode(p52)
	-- upvalues: t_25 (ref), protoModule (ref), structModule (ref), t (ref)
	local var923 = t_25.new()
	local var924 = 0
	while var924 < buffer.len(p52) do
		local _ = nil
		local var925 = nil
		local var926, var927, var928 = protoModule.readTag(p52, var924)
		local var929 = var926
		var925 = var927
		var924 = var928
		
		if var925 == protoModule.wireTypes.varint then
			local _ = nil
			local var930, var931 = protoModule.readVarInt(p52, var924)
			local _ = var930
			var924 = var931
			continue
		end
		if var925 == protoModule.wireTypes.lengthDelimited then
			if var929 == 1 then
				local _ = nil
				local var932, var933 = protoModule.readBuffer(p52, var924)
				var924 = var933
				var923.kind = {
					type = "literal",
					value = structModule.Struct.decode(var932)
				}
			elseif var929 == 2 then
				local _ = nil
				local var934, var935 = protoModule.readBuffer(p52, var924)
				var924 = var935
				var923.kind = { type = "binding_path", value = buffer.tostring(var934) }
			elseif var929 == 3 then
				local _ = nil
				local var936, var937 = protoModule.readBuffer(p52, var924)
				var924 = var937
				var923.kind = {
					type = "conditional",
					value = t.StructProp_ConditionalOptions.decode(var936)
				}
			else
				local _ = nil
				local var938, var939 = protoModule.readVarInt(p52, var924)
				var924 = var939 + var938
			end
		elseif var925 == protoModule.wireTypes.i32 then
			local _ = nil
			local var940, var941 = protoModule.readFixed32(p52, var924)
			local _ = var940
			var924 = var941
		elseif var925 == protoModule.wireTypes.i64 then
			local _ = nil
			local var942, var943 = protoModule.readFixed64(p52, var924)
			local _ = var942
			var924 = var943
		else
			error("Unsupported wire type: " .. var925)
		end
	end
	return var923
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
	local var945 = t_25.new()
	
	if self.literal ~= nil then
		var945.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var945.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var945.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var945.kind = {
			type = "conditional",
			value = t.StructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var945
end

t_25.descriptor = {
	name = "StructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
}
t.StructProp = t_25
typeRegistryModule.default:register(t.StructProp)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p53)
	-- upvalues: t_26 (ref)
	return setmetatable({
		condition = if p53 == nil or p53.condition == nil then nil else p53.condition,
		kind = if p53 == nil or p53.kind == nil then nil else p53.kind
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var947 = 0
	
	if self.condition ~= nil then
		local var948 = self.condition:encode()
		local var949, var950 = protoModule.writeTag(buff, var947, 1, protoModule.wireTypes.lengthDelimited)
		var949, var950 = protoModule.writeBuffer(var949, var950, var948, buffer.len(var948))
		buff = var949
		var947 = var950
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var951 = self.kind.value:encode()
			local var952, var953 = protoModule.writeTag(buff, var947, 2, protoModule.wireTypes.lengthDelimited)
			var952, var953 = protoModule.writeBuffer(var952, var953, var951, buffer.len(var951))
			buff = var952
			var947 = var953
		elseif self.kind.type == "binding_path" then
			local var954, var955 = protoModule.writeTag(buff, var947, 3, protoModule.wireTypes.lengthDelimited)
			var954, var955 = protoModule.writeString(var954, var955, self.kind.value)
			buff = var954
			var947 = var955
		end
	end
	local buff_1 = buffer.create(var947)
	buffer.copy(buff_1, 0, buff, 0, var947)
	
	return buff_1
end

function t_26.decode(p54)
	-- upvalues: t_26 (ref), protoModule (ref), propConditionModule (ref), structModule (ref)
	local var957 = t_26.new()
	local var958 = 0
	while var958 < buffer.len(p54) do
		local _ = nil
		local var959 = nil
		local var960, var961, var962 = protoModule.readTag(p54, var958)
		local var963 = var960
		var959 = var961
		var958 = var962
		
		if var959 == protoModule.wireTypes.varint then
			local _ = nil
			local var964, var965 = protoModule.readVarInt(p54, var958)
			local _ = var964
			var958 = var965
			continue
		end
		if var959 == protoModule.wireTypes.lengthDelimited then
			if var963 == 1 then
				local _ = nil
				local var966, var967 = protoModule.readBuffer(p54, var958)
				var958 = var967
				var957.condition = propConditionModule.PropCondition.decode(var966)
			elseif var963 == 2 then
				local _ = nil
				local var968, var969 = protoModule.readBuffer(p54, var958)
				var958 = var969
				var957.kind = {
					type = "literal",
					value = structModule.Struct.decode(var968)
				}
			elseif var963 == 3 then
				local _ = nil
				local var970, var971 = protoModule.readBuffer(p54, var958)
				var958 = var971
				var957.kind = { type = "binding_path", value = buffer.tostring(var970) }
			else
				local _ = nil
				local var972, var973 = protoModule.readVarInt(p54, var958)
				var958 = var973 + var972
			end
		elseif var959 == protoModule.wireTypes.i32 then
			local _ = nil
			local var974, var975 = protoModule.readFixed32(p54, var958)
			local _ = var974
			var958 = var975
		elseif var959 == protoModule.wireTypes.i64 then
			local _ = nil
			local var976, var977 = protoModule.readFixed64(p54, var958)
			local _ = var976
			var958 = var977
		else
			error("Unsupported wire type: " .. var959)
		end
	end
	return var957
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
	local var979 = t_26.new()
	
	if self.condition ~= nil then
		var979.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var979.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var979.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var979.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var979
end

t_26.descriptor = {
	name = "StructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StructProp_ConditionalOption = t_26
typeRegistryModule.default:register(t.StructProp_ConditionalOption)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p55)
	-- upvalues: t_27 (ref)
	return setmetatable({
		options = if p55 == nil or p55.options == nil then {} else p55.options
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var981 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var982 = v:encode()
			local var983, var984 = protoModule.writeTag(buff, var981, 1, protoModule.wireTypes.lengthDelimited)
			var983, var984 = protoModule.writeBuffer(var983, var984, var982, buffer.len(var982))
			buff = var983
			var981 = var984
		end
	end
	local buff_1 = buffer.create(var981)
	buffer.copy(buff_1, 0, buff, 0, var981)
	
	return buff_1
end

function t_27.decode(p56)
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var986 = t_27.new()
	local var987 = 0
	while var987 < buffer.len(p56) do
		local _ = nil
		local var988 = nil
		local var989, var990, var991 = protoModule.readTag(p56, var987)
		local var992 = var989
		var988 = var990
		var987 = var991
		
		if var988 == protoModule.wireTypes.varint then
			local _ = nil
			local var993, var994 = protoModule.readVarInt(p56, var987)
			local _ = var993
			var987 = var994
			continue
		end
		if var988 == protoModule.wireTypes.lengthDelimited then
			if var992 == 1 then
				local _ = nil
				local var995, var996 = protoModule.readBuffer(p56, var987)
				var987 = var996
				table.insert(var986.options, t.StructProp_ConditionalOption.decode(var995))
			else
				local _ = nil
				local var997, var998 = protoModule.readVarInt(p56, var987)
				var987 = var998 + var997
			end
		elseif var988 == protoModule.wireTypes.i32 then
			local _ = nil
			local var999, var1000 = protoModule.readFixed32(p56, var987)
			local _ = var999
			var987 = var1000
		elseif var988 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1001, var1002 = protoModule.readFixed64(p56, var987)
			local _ = var1001
			var987 = var1002
		else
			error("Unsupported wire type: " .. var988)
		end
	end
	return var986
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
	local var1005 = t_27.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StructProp_ConditionalOption.jsonDecode(v))
		end
		var1005.options = t_1
	end
	return var1005
end

t_27.descriptor = {
	name = "StructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StructProp_ConditionalOptions = t_27
typeRegistryModule.default:register(t.StructProp_ConditionalOptions)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p57)
	-- upvalues: t_28 (ref)
	return setmetatable({
		kind = if p57 == nil or p57.kind == nil then nil else p57.kind,
		alt = if p57 == nil or p57.alt == nil then nil else p57.alt
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1008 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1009, var1010 = protoModule.writeTag(buff, var1008, 1, protoModule.wireTypes.lengthDelimited)
			var1009, var1010 = protoModule.writeString(var1009, var1010, self.kind.value)
			buff = var1009
			var1008 = var1010
		elseif self.kind.type == "binding_path" then
			local var1011, var1012 = protoModule.writeTag(buff, var1008, 2, protoModule.wireTypes.lengthDelimited)
			var1011, var1012 = protoModule.writeString(var1011, var1012, self.kind.value)
			buff = var1011
			var1008 = var1012
		elseif self.kind.type == "format" then
			local var1013 = self.kind.value:encode()
			local var1014, var1015 = protoModule.writeTag(buff, var1008, 3, protoModule.wireTypes.lengthDelimited)
			var1014, var1015 = protoModule.writeBuffer(var1014, var1015, var1013, buffer.len(var1013))
			buff = var1014
			var1008 = var1015
		elseif self.kind.type == "conditional" then
			local var1016 = self.kind.value:encode()
			local var1017, var1018 = protoModule.writeTag(buff, var1008, 4, protoModule.wireTypes.lengthDelimited)
			var1017, var1018 = protoModule.writeBuffer(var1017, var1018, var1016, buffer.len(var1016))
			buff = var1017
			var1008 = var1018
		elseif self.kind.type == "translation" then
			local var1019 = self.kind.value:encode()
			local var1020, var1021 = protoModule.writeTag(buff, var1008, 5, protoModule.wireTypes.lengthDelimited)
			var1020, var1021 = protoModule.writeBuffer(var1020, var1021, var1019, buffer.len(var1019))
			buff = var1020
			var1008 = var1021
		end
	end
	if self.alt ~= nil then
		local var1022 = self.alt:encode()
		local var1023, var1024 = protoModule.writeTag(buff, var1008, 6, protoModule.wireTypes.lengthDelimited)
		var1023, var1024 = protoModule.writeBuffer(var1023, var1024, var1022, buffer.len(var1022))
		buff = var1023
		var1008 = var1024
	end
	local buff_1 = buffer.create(var1008)
	buffer.copy(buff_1, 0, buff, 0, var1008)
	
	return buff_1
end

function t_28.decode(p58)
	-- upvalues: t_28 (ref), protoModule (ref), t (ref)
	local var1026 = t_28.new()
	local var1027 = 0
	while var1027 < buffer.len(p58) do
		local _ = nil
		local var1028 = nil
		local var1029, var1030, var1031 = protoModule.readTag(p58, var1027)
		local var1032 = var1029
		var1028 = var1030
		var1027 = var1031
		
		if var1028 == protoModule.wireTypes.varint then
			local _ = nil
			local var1033, var1034 = protoModule.readVarInt(p58, var1027)
			local _ = var1033
			var1027 = var1034
			continue
		end
		if var1028 == protoModule.wireTypes.lengthDelimited then
			if var1032 == 1 then
				local _ = nil
				local var1035, var1036 = protoModule.readBuffer(p58, var1027)
				var1027 = var1036
				var1026.kind = { type = "literal", value = buffer.tostring(var1035) }
			elseif var1032 == 2 then
				local _ = nil
				local var1037, var1038 = protoModule.readBuffer(p58, var1027)
				var1027 = var1038
				var1026.kind = { type = "binding_path", value = buffer.tostring(var1037) }
			elseif var1032 == 3 then
				local _ = nil
				local var1039, var1040 = protoModule.readBuffer(p58, var1027)
				var1027 = var1040
				var1026.kind = { type = "format", value = t.StringFormat.decode(var1039) }
			elseif var1032 == 4 then
				local _ = nil
				local var1041, var1042 = protoModule.readBuffer(p58, var1027)
				var1027 = var1042
				var1026.kind = {
					type = "conditional",
					value = t.ImageStringProp_ConditionalOptions.decode(var1041)
				}
			elseif var1032 == 5 then
				local _ = nil
				local var1043, var1044 = protoModule.readBuffer(p58, var1027)
				var1027 = var1044
				var1026.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1043)
				}
			elseif var1032 == 6 then
				local _ = nil
				local var1045, var1046 = protoModule.readBuffer(p58, var1027)
				var1027 = var1046
				var1026.alt = t.StringFormat.decode(var1045)
			else
				local _ = nil
				local var1047, var1048 = protoModule.readVarInt(p58, var1027)
				var1027 = var1048 + var1047
			end
		elseif var1028 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1049, var1050 = protoModule.readFixed32(p58, var1027)
			local _ = var1049
			var1027 = var1050
		elseif var1028 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1051, var1052 = protoModule.readFixed64(p58, var1027)
			local _ = var1051
			var1027 = var1052
		else
			error("Unsupported wire type: " .. var1028)
		end
	end
	return var1026
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
	local var1054 = t_28.new()
	
	if self.literal ~= nil then
		var1054.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1054.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1054.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1054.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var1054.kind = {
			type = "conditional",
			value = t.ImageStringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var1054.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	if self.alt ~= nil then
		var1054.alt = t.StringFormat.jsonDecode(self.alt)
	end
	return var1054
end

t_28.descriptor = {
	name = "ImageStringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
}
t.ImageStringProp = t_28
typeRegistryModule.default:register(t.ImageStringProp)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p59)
	-- upvalues: t_29 (ref)
	return setmetatable({
		condition = if p59 == nil or p59.condition == nil then nil else p59.condition,
		kind = if p59 == nil or p59.kind == nil then nil else p59.kind
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1056 = 0
	
	if self.condition ~= nil then
		local var1057 = self.condition:encode()
		local var1058, var1059 = protoModule.writeTag(buff, var1056, 1, protoModule.wireTypes.lengthDelimited)
		var1058, var1059 = protoModule.writeBuffer(var1058, var1059, var1057, buffer.len(var1057))
		buff = var1058
		var1056 = var1059
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1060, var1061 = protoModule.writeTag(buff, var1056, 2, protoModule.wireTypes.lengthDelimited)
			var1060, var1061 = protoModule.writeString(var1060, var1061, self.kind.value)
			buff = var1060
			var1056 = var1061
		elseif self.kind.type == "binding_path" then
			local var1062, var1063 = protoModule.writeTag(buff, var1056, 3, protoModule.wireTypes.lengthDelimited)
			var1062, var1063 = protoModule.writeString(var1062, var1063, self.kind.value)
			buff = var1062
			var1056 = var1063
		elseif self.kind.type == "format" then
			local var1064 = self.kind.value:encode()
			local var1065, var1066 = protoModule.writeTag(buff, var1056, 4, protoModule.wireTypes.lengthDelimited)
			var1065, var1066 = protoModule.writeBuffer(var1065, var1066, var1064, buffer.len(var1064))
			buff = var1065
			var1056 = var1066
		elseif self.kind.type == "translation" then
			local var1067 = self.kind.value:encode()
			local var1068, var1069 = protoModule.writeTag(buff, var1056, 5, protoModule.wireTypes.lengthDelimited)
			var1068, var1069 = protoModule.writeBuffer(var1068, var1069, var1067, buffer.len(var1067))
			buff = var1068
			var1056 = var1069
		end
	end
	local buff_1 = buffer.create(var1056)
	buffer.copy(buff_1, 0, buff, 0, var1056)
	
	return buff_1
end

function t_29.decode(p60)
	-- upvalues: t_29 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1071 = t_29.new()
	local var1072 = 0
	while var1072 < buffer.len(p60) do
		local _ = nil
		local var1073 = nil
		local var1074, var1075, var1076 = protoModule.readTag(p60, var1072)
		local var1077 = var1074
		var1073 = var1075
		var1072 = var1076
		
		if var1073 == protoModule.wireTypes.varint then
			local _ = nil
			local var1078, var1079 = protoModule.readVarInt(p60, var1072)
			local _ = var1078
			var1072 = var1079
			continue
		end
		if var1073 == protoModule.wireTypes.lengthDelimited then
			if var1077 == 1 then
				local _ = nil
				local var1080, var1081 = protoModule.readBuffer(p60, var1072)
				var1072 = var1081
				var1071.condition = propConditionModule.PropCondition.decode(var1080)
			elseif var1077 == 2 then
				local _ = nil
				local var1082, var1083 = protoModule.readBuffer(p60, var1072)
				var1072 = var1083
				var1071.kind = { type = "literal", value = buffer.tostring(var1082) }
			elseif var1077 == 3 then
				local _ = nil
				local var1084, var1085 = protoModule.readBuffer(p60, var1072)
				var1072 = var1085
				var1071.kind = { type = "binding_path", value = buffer.tostring(var1084) }
			elseif var1077 == 4 then
				local _ = nil
				local var1086, var1087 = protoModule.readBuffer(p60, var1072)
				var1072 = var1087
				var1071.kind = { type = "format", value = t.StringFormat.decode(var1086) }
			elseif var1077 == 5 then
				local _ = nil
				local var1088, var1089 = protoModule.readBuffer(p60, var1072)
				var1072 = var1089
				var1071.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1088)
				}
			else
				local _ = nil
				local var1090, var1091 = protoModule.readVarInt(p60, var1072)
				var1072 = var1091 + var1090
			end
		elseif var1073 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1092, var1093 = protoModule.readFixed32(p60, var1072)
			local _ = var1092
			var1072 = var1093
		elseif var1073 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1094, var1095 = protoModule.readFixed64(p60, var1072)
			local _ = var1094
			var1072 = var1095
		else
			error("Unsupported wire type: " .. var1073)
		end
	end
	return var1071
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
	local var1097 = t_29.new()
	
	if self.condition ~= nil then
		var1097.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1097.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1097.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1097.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1097.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var1097.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1097
end

t_29.descriptor = {
	name = "ImageStringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageStringProp_ConditionalOption = t_29
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOption)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p61)
	-- upvalues: t_30 (ref)
	return setmetatable({
		options = if p61 == nil or p61.options == nil then {} else p61.options
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1099 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1100 = v:encode()
			local var1101, var1102 = protoModule.writeTag(buff, var1099, 1, protoModule.wireTypes.lengthDelimited)
			var1101, var1102 = protoModule.writeBuffer(var1101, var1102, var1100, buffer.len(var1100))
			buff = var1101
			var1099 = var1102
		end
	end
	local buff_1 = buffer.create(var1099)
	buffer.copy(buff_1, 0, buff, 0, var1099)
	
	return buff_1
end

function t_30.decode(p62)
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var1104 = t_30.new()
	local var1105 = 0
	while var1105 < buffer.len(p62) do
		local _ = nil
		local var1106 = nil
		local var1107, var1108, var1109 = protoModule.readTag(p62, var1105)
		local var1110 = var1107
		var1106 = var1108
		var1105 = var1109
		
		if var1106 == protoModule.wireTypes.varint then
			local _ = nil
			local var1111, var1112 = protoModule.readVarInt(p62, var1105)
			local _ = var1111
			var1105 = var1112
			continue
		end
		if var1106 == protoModule.wireTypes.lengthDelimited then
			if var1110 == 1 then
				local _ = nil
				local var1113, var1114 = protoModule.readBuffer(p62, var1105)
				var1105 = var1114
				table.insert(var1104.options, t.ImageStringProp_ConditionalOption.decode(var1113))
			else
				local _ = nil
				local var1115, var1116 = protoModule.readVarInt(p62, var1105)
				var1105 = var1116 + var1115
			end
		elseif var1106 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1117, var1118 = protoModule.readFixed32(p62, var1105)
			local _ = var1117
			var1105 = var1118
		elseif var1106 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1119, var1120 = protoModule.readFixed64(p62, var1105)
			local _ = var1119
			var1105 = var1120
		else
			error("Unsupported wire type: " .. var1106)
		end
	end
	return var1104
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
	local var1123 = t_30.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageStringProp_ConditionalOption.jsonDecode(v))
		end
		var1123.options = t_1
	end
	return var1123
end

t_30.descriptor = {
	name = "ImageStringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageStringProp_ConditionalOptions = t_30
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOptions)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p63)
	-- upvalues: t_31 (ref)
	return setmetatable({
		kind = if p63 == nil or p63.kind == nil then nil else p63.kind
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1126 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1127, var1128 = protoModule.writeTag(buff, var1126, 1, protoModule.wireTypes.lengthDelimited)
			var1127, var1128 = protoModule.writeString(var1127, var1128, self.kind.value)
			buff = var1127
			var1126 = var1128
		elseif self.kind.type == "binding_path" then
			local var1129, var1130 = protoModule.writeTag(buff, var1126, 2, protoModule.wireTypes.lengthDelimited)
			var1129, var1130 = protoModule.writeString(var1129, var1130, self.kind.value)
			buff = var1129
			var1126 = var1130
		elseif self.kind.type == "format" then
			local var1131 = self.kind.value:encode()
			local var1132, var1133 = protoModule.writeTag(buff, var1126, 3, protoModule.wireTypes.lengthDelimited)
			var1132, var1133 = protoModule.writeBuffer(var1132, var1133, var1131, buffer.len(var1131))
			buff = var1132
			var1126 = var1133
		elseif self.kind.type == "conditional" then
			local var1134 = self.kind.value:encode()
			local var1135, var1136 = protoModule.writeTag(buff, var1126, 4, protoModule.wireTypes.lengthDelimited)
			var1135, var1136 = protoModule.writeBuffer(var1135, var1136, var1134, buffer.len(var1134))
			buff = var1135
			var1126 = var1136
		elseif self.kind.type == "translation" then
			local var1137 = self.kind.value:encode()
			local var1138, var1139 = protoModule.writeTag(buff, var1126, 5, protoModule.wireTypes.lengthDelimited)
			var1138, var1139 = protoModule.writeBuffer(var1138, var1139, var1137, buffer.len(var1137))
			buff = var1138
			var1126 = var1139
		end
	end
	local buff_1 = buffer.create(var1126)
	buffer.copy(buff_1, 0, buff, 0, var1126)
	
	return buff_1
end

function t_31.decode(p64)
	-- upvalues: t_31 (ref), protoModule (ref), t (ref)
	local var1141 = t_31.new()
	local var1142 = 0
	while var1142 < buffer.len(p64) do
		local _ = nil
		local var1143 = nil
		local var1144, var1145, var1146 = protoModule.readTag(p64, var1142)
		local var1147 = var1144
		var1143 = var1145
		var1142 = var1146
		
		if var1143 == protoModule.wireTypes.varint then
			local _ = nil
			local var1148, var1149 = protoModule.readVarInt(p64, var1142)
			local _ = var1148
			var1142 = var1149
			continue
		end
		if var1143 == protoModule.wireTypes.lengthDelimited then
			if var1147 == 1 then
				local _ = nil
				local var1150, var1151 = protoModule.readBuffer(p64, var1142)
				var1142 = var1151
				var1141.kind = { type = "literal", value = buffer.tostring(var1150) }
			elseif var1147 == 2 then
				local _ = nil
				local var1152, var1153 = protoModule.readBuffer(p64, var1142)
				var1142 = var1153
				var1141.kind = { type = "binding_path", value = buffer.tostring(var1152) }
			elseif var1147 == 3 then
				local _ = nil
				local var1154, var1155 = protoModule.readBuffer(p64, var1142)
				var1142 = var1155
				var1141.kind = { type = "format", value = t.StringFormat.decode(var1154) }
			elseif var1147 == 4 then
				local _ = nil
				local var1156, var1157 = protoModule.readBuffer(p64, var1142)
				var1142 = var1157
				var1141.kind = {
					type = "conditional",
					value = t.ImageSetProp_ConditionalOptions.decode(var1156)
				}
			elseif var1147 == 5 then
				local _ = nil
				local var1158, var1159 = protoModule.readBuffer(p64, var1142)
				var1142 = var1159
				var1141.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1158)
				}
			else
				local _ = nil
				local var1160, var1161 = protoModule.readVarInt(p64, var1142)
				var1142 = var1161 + var1160
			end
		elseif var1143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1162, var1163 = protoModule.readFixed32(p64, var1142)
			local _ = var1162
			var1142 = var1163
		elseif var1143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1164, var1165 = protoModule.readFixed64(p64, var1142)
			local _ = var1164
			var1142 = var1165
		else
			error("Unsupported wire type: " .. var1143)
		end
	end
	return var1141
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
	local var1167 = t_31.new()
	
	if self.literal ~= nil then
		var1167.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1167.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1167.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1167.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var1167.kind = {
			type = "conditional",
			value = t.ImageSetProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var1167.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1167
end

t_31.descriptor = {
	name = "ImageSetProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
}
t.ImageSetProp = t_31
typeRegistryModule.default:register(t.ImageSetProp)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p65)
	-- upvalues: t_32 (ref)
	return setmetatable({
		condition = if p65 == nil or p65.condition == nil then nil else p65.condition,
		kind = if p65 == nil or p65.kind == nil then nil else p65.kind
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1169 = 0
	
	if self.condition ~= nil then
		local var1170 = self.condition:encode()
		local var1171, var1172 = protoModule.writeTag(buff, var1169, 1, protoModule.wireTypes.lengthDelimited)
		var1171, var1172 = protoModule.writeBuffer(var1171, var1172, var1170, buffer.len(var1170))
		buff = var1171
		var1169 = var1172
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1173, var1174 = protoModule.writeTag(buff, var1169, 2, protoModule.wireTypes.lengthDelimited)
			var1173, var1174 = protoModule.writeString(var1173, var1174, self.kind.value)
			buff = var1173
			var1169 = var1174
		elseif self.kind.type == "binding_path" then
			local var1175, var1176 = protoModule.writeTag(buff, var1169, 3, protoModule.wireTypes.lengthDelimited)
			var1175, var1176 = protoModule.writeString(var1175, var1176, self.kind.value)
			buff = var1175
			var1169 = var1176
		elseif self.kind.type == "format" then
			local var1177 = self.kind.value:encode()
			local var1178, var1179 = protoModule.writeTag(buff, var1169, 4, protoModule.wireTypes.lengthDelimited)
			var1178, var1179 = protoModule.writeBuffer(var1178, var1179, var1177, buffer.len(var1177))
			buff = var1178
			var1169 = var1179
		elseif self.kind.type == "translation" then
			local var1180 = self.kind.value:encode()
			local var1181, var1182 = protoModule.writeTag(buff, var1169, 5, protoModule.wireTypes.lengthDelimited)
			var1181, var1182 = protoModule.writeBuffer(var1181, var1182, var1180, buffer.len(var1180))
			buff = var1181
			var1169 = var1182
		end
	end
	local buff_1 = buffer.create(var1169)
	buffer.copy(buff_1, 0, buff, 0, var1169)
	
	return buff_1
end

function t_32.decode(p66)
	-- upvalues: t_32 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1184 = t_32.new()
	local var1185 = 0
	while var1185 < buffer.len(p66) do
		local _ = nil
		local var1186 = nil
		local var1187, var1188, var1189 = protoModule.readTag(p66, var1185)
		local var1190 = var1187
		var1186 = var1188
		var1185 = var1189
		
		if var1186 == protoModule.wireTypes.varint then
			local _ = nil
			local var1191, var1192 = protoModule.readVarInt(p66, var1185)
			local _ = var1191
			var1185 = var1192
			continue
		end
		if var1186 == protoModule.wireTypes.lengthDelimited then
			if var1190 == 1 then
				local _ = nil
				local var1193, var1194 = protoModule.readBuffer(p66, var1185)
				var1185 = var1194
				var1184.condition = propConditionModule.PropCondition.decode(var1193)
			elseif var1190 == 2 then
				local _ = nil
				local var1195, var1196 = protoModule.readBuffer(p66, var1185)
				var1185 = var1196
				var1184.kind = { type = "literal", value = buffer.tostring(var1195) }
			elseif var1190 == 3 then
				local _ = nil
				local var1197, var1198 = protoModule.readBuffer(p66, var1185)
				var1185 = var1198
				var1184.kind = { type = "binding_path", value = buffer.tostring(var1197) }
			elseif var1190 == 4 then
				local _ = nil
				local var1199, var1200 = protoModule.readBuffer(p66, var1185)
				var1185 = var1200
				var1184.kind = { type = "format", value = t.StringFormat.decode(var1199) }
			elseif var1190 == 5 then
				local _ = nil
				local var1201, var1202 = protoModule.readBuffer(p66, var1185)
				var1185 = var1202
				var1184.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1201)
				}
			else
				local _ = nil
				local var1203, var1204 = protoModule.readVarInt(p66, var1185)
				var1185 = var1204 + var1203
			end
		elseif var1186 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1205, var1206 = protoModule.readFixed32(p66, var1185)
			local _ = var1205
			var1185 = var1206
		elseif var1186 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1207, var1208 = protoModule.readFixed64(p66, var1185)
			local _ = var1207
			var1185 = var1208
		else
			error("Unsupported wire type: " .. var1186)
		end
	end
	return var1184
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
	local var1210 = t_32.new()
	
	if self.condition ~= nil then
		var1210.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1210.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1210.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1210.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1210.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var1210.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1210
end

t_32.descriptor = {
	name = "ImageSetProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageSetProp_ConditionalOption = t_32
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOption)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p67)
	-- upvalues: t_33 (ref)
	return setmetatable({
		options = if p67 == nil or p67.options == nil then {} else p67.options
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1212 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1213 = v:encode()
			local var1214, var1215 = protoModule.writeTag(buff, var1212, 1, protoModule.wireTypes.lengthDelimited)
			var1214, var1215 = protoModule.writeBuffer(var1214, var1215, var1213, buffer.len(var1213))
			buff = var1214
			var1212 = var1215
		end
	end
	local buff_1 = buffer.create(var1212)
	buffer.copy(buff_1, 0, buff, 0, var1212)
	
	return buff_1
end

function t_33.decode(p68)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1217 = t_33.new()
	local var1218 = 0
	while var1218 < buffer.len(p68) do
		local _ = nil
		local var1219 = nil
		local var1220, var1221, var1222 = protoModule.readTag(p68, var1218)
		local var1223 = var1220
		var1219 = var1221
		var1218 = var1222
		
		if var1219 == protoModule.wireTypes.varint then
			local _ = nil
			local var1224, var1225 = protoModule.readVarInt(p68, var1218)
			local _ = var1224
			var1218 = var1225
			continue
		end
		if var1219 == protoModule.wireTypes.lengthDelimited then
			if var1223 == 1 then
				local _ = nil
				local var1226, var1227 = protoModule.readBuffer(p68, var1218)
				var1218 = var1227
				table.insert(var1217.options, t.ImageSetProp_ConditionalOption.decode(var1226))
			else
				local _ = nil
				local var1228, var1229 = protoModule.readVarInt(p68, var1218)
				var1218 = var1229 + var1228
			end
		elseif var1219 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1230, var1231 = protoModule.readFixed32(p68, var1218)
			local _ = var1230
			var1218 = var1231
		elseif var1219 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1232, var1233 = protoModule.readFixed64(p68, var1218)
			local _ = var1232
			var1218 = var1233
		else
			error("Unsupported wire type: " .. var1219)
		end
	end
	return var1217
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
	local var1236 = t_33.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageSetProp_ConditionalOption.jsonDecode(v))
		end
		var1236.options = t_1
	end
	return var1236
end

t_33.descriptor = {
	name = "ImageSetProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageSetProp_ConditionalOptions = t_33
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOptions)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p69)
	-- upvalues: t_34 (ref)
	return setmetatable({
		kind = if p69 == nil or p69.kind == nil then nil else p69.kind
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1239 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1240, var1241 = protoModule.writeTag(buff, var1239, 1, protoModule.wireTypes.lengthDelimited)
			var1240, var1241 = protoModule.writeString(var1240, var1241, self.kind.value)
			buff = var1240
			var1239 = var1241
		elseif self.kind.type == "token" then
			local var1242, var1243 = protoModule.writeTag(buff, var1239, 2, protoModule.wireTypes.lengthDelimited)
			var1242, var1243 = protoModule.writeString(var1242, var1243, self.kind.value)
			buff = var1242
			var1239 = var1243
		elseif self.kind.type == "conditional" then
			local var1244 = self.kind.value:encode()
			local var1245, var1246 = protoModule.writeTag(buff, var1239, 3, protoModule.wireTypes.lengthDelimited)
			var1245, var1246 = protoModule.writeBuffer(var1245, var1246, var1244, buffer.len(var1244))
			buff = var1245
			var1239 = var1246
		elseif self.kind.type == "binding_path" then
			local var1247, var1248 = protoModule.writeTag(buff, var1239, 4, protoModule.wireTypes.lengthDelimited)
			var1247, var1248 = protoModule.writeString(var1247, var1248, self.kind.value)
			buff = var1247
			var1239 = var1248
		end
	end
	local buff_1 = buffer.create(var1239)
	buffer.copy(buff_1, 0, buff, 0, var1239)
	
	return buff_1
end

function t_34.decode(p70)
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1250 = t_34.new()
	local var1251 = 0
	while var1251 < buffer.len(p70) do
		local _ = nil
		local var1252 = nil
		local var1253, var1254, var1255 = protoModule.readTag(p70, var1251)
		local var1256 = var1253
		var1252 = var1254
		var1251 = var1255
		
		if var1252 == protoModule.wireTypes.varint then
			local _ = nil
			local var1257, var1258 = protoModule.readVarInt(p70, var1251)
			local _ = var1257
			var1251 = var1258
			continue
		end
		if var1252 == protoModule.wireTypes.lengthDelimited then
			if var1256 == 1 then
				local _ = nil
				local var1259, var1260 = protoModule.readBuffer(p70, var1251)
				var1251 = var1260
				var1250.kind = { type = "literal", value = buffer.tostring(var1259) }
			elseif var1256 == 2 then
				local _ = nil
				local var1261, var1262 = protoModule.readBuffer(p70, var1251)
				var1251 = var1262
				var1250.kind = { type = "token", value = buffer.tostring(var1261) }
			elseif var1256 == 3 then
				local _ = nil
				local var1263, var1264 = protoModule.readBuffer(p70, var1251)
				var1251 = var1264
				var1250.kind = {
					type = "conditional",
					value = t.ColorProp_ConditionalOptions.decode(var1263)
				}
			elseif var1256 == 4 then
				local _ = nil
				local var1265, var1266 = protoModule.readBuffer(p70, var1251)
				var1251 = var1266
				var1250.kind = { type = "binding_path", value = buffer.tostring(var1265) }
			else
				local _ = nil
				local var1267, var1268 = protoModule.readVarInt(p70, var1251)
				var1251 = var1268 + var1267
			end
		elseif var1252 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1269, var1270 = protoModule.readFixed32(p70, var1251)
			local _ = var1269
			var1251 = var1270
		elseif var1252 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1271, var1272 = protoModule.readFixed64(p70, var1251)
			local _ = var1271
			var1251 = var1272
		else
			error("Unsupported wire type: " .. var1252)
		end
	end
	return var1250
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
	local var1274 = t_34.new()
	
	if self.literal ~= nil then
		var1274.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1274.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1274.kind = {
			type = "conditional",
			value = t.ColorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1274.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1274.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1274
end

t_34.descriptor = {
	name = "ColorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
}
t.ColorProp = t_34
typeRegistryModule.default:register(t.ColorProp)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p71)
	-- upvalues: t_35 (ref)
	return setmetatable({
		condition = if p71 == nil or p71.condition == nil then nil else p71.condition,
		kind = if p71 == nil or p71.kind == nil then nil else p71.kind
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1276 = 0
	
	if self.condition ~= nil then
		local var1277 = self.condition:encode()
		local var1278, var1279 = protoModule.writeTag(buff, var1276, 1, protoModule.wireTypes.lengthDelimited)
		var1278, var1279 = protoModule.writeBuffer(var1278, var1279, var1277, buffer.len(var1277))
		buff = var1278
		var1276 = var1279
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1280, var1281 = protoModule.writeTag(buff, var1276, 2, protoModule.wireTypes.lengthDelimited)
			var1280, var1281 = protoModule.writeString(var1280, var1281, self.kind.value)
			buff = var1280
			var1276 = var1281
		elseif self.kind.type == "token" then
			local var1282, var1283 = protoModule.writeTag(buff, var1276, 3, protoModule.wireTypes.lengthDelimited)
			var1282, var1283 = protoModule.writeString(var1282, var1283, self.kind.value)
			buff = var1282
			var1276 = var1283
		elseif self.kind.type == "binding_path" then
			local var1284, var1285 = protoModule.writeTag(buff, var1276, 4, protoModule.wireTypes.lengthDelimited)
			var1284, var1285 = protoModule.writeString(var1284, var1285, self.kind.value)
			buff = var1284
			var1276 = var1285
		end
	end
	local buff_1 = buffer.create(var1276)
	buffer.copy(buff_1, 0, buff, 0, var1276)
	
	return buff_1
end

function t_35.decode(p72)
	-- upvalues: t_35 (ref), protoModule (ref), propConditionModule (ref)
	local var1287 = t_35.new()
	local var1288 = 0
	while var1288 < buffer.len(p72) do
		local _ = nil
		local var1289 = nil
		local var1290, var1291, var1292 = protoModule.readTag(p72, var1288)
		local var1293 = var1290
		var1289 = var1291
		var1288 = var1292
		
		if var1289 == protoModule.wireTypes.varint then
			local _ = nil
			local var1294, var1295 = protoModule.readVarInt(p72, var1288)
			local _ = var1294
			var1288 = var1295
			continue
		end
		if var1289 == protoModule.wireTypes.lengthDelimited then
			if var1293 == 1 then
				local _ = nil
				local var1296, var1297 = protoModule.readBuffer(p72, var1288)
				var1288 = var1297
				var1287.condition = propConditionModule.PropCondition.decode(var1296)
			elseif var1293 == 2 then
				local _ = nil
				local var1298, var1299 = protoModule.readBuffer(p72, var1288)
				var1288 = var1299
				var1287.kind = { type = "literal", value = buffer.tostring(var1298) }
			elseif var1293 == 3 then
				local _ = nil
				local var1300, var1301 = protoModule.readBuffer(p72, var1288)
				var1288 = var1301
				var1287.kind = { type = "token", value = buffer.tostring(var1300) }
			elseif var1293 == 4 then
				local _ = nil
				local var1302, var1303 = protoModule.readBuffer(p72, var1288)
				var1288 = var1303
				var1287.kind = { type = "binding_path", value = buffer.tostring(var1302) }
			else
				local _ = nil
				local var1304, var1305 = protoModule.readVarInt(p72, var1288)
				var1288 = var1305 + var1304
			end
		elseif var1289 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1306, var1307 = protoModule.readFixed32(p72, var1288)
			local _ = var1306
			var1288 = var1307
		elseif var1289 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1308, var1309 = protoModule.readFixed64(p72, var1288)
			local _ = var1308
			var1288 = var1309
		else
			error("Unsupported wire type: " .. var1289)
		end
	end
	return var1287
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
	local var1311 = t_35.new()
	
	if self.condition ~= nil then
		var1311.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1311.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1311.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1311.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1311.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1311
end

t_35.descriptor = {
	name = "ColorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorProp_ConditionalOption = t_35
typeRegistryModule.default:register(t.ColorProp_ConditionalOption)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p73)
	-- upvalues: t_36 (ref)
	return setmetatable({
		options = if p73 == nil or p73.options == nil then {} else p73.options
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1313 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1314 = v:encode()
			local var1315, var1316 = protoModule.writeTag(buff, var1313, 1, protoModule.wireTypes.lengthDelimited)
			var1315, var1316 = protoModule.writeBuffer(var1315, var1316, var1314, buffer.len(var1314))
			buff = var1315
			var1313 = var1316
		end
	end
	local buff_1 = buffer.create(var1313)
	buffer.copy(buff_1, 0, buff, 0, var1313)
	
	return buff_1
end

function t_36.decode(p74)
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1318 = t_36.new()
	local var1319 = 0
	while var1319 < buffer.len(p74) do
		local _ = nil
		local var1320 = nil
		local var1321, var1322, var1323 = protoModule.readTag(p74, var1319)
		local var1324 = var1321
		var1320 = var1322
		var1319 = var1323
		
		if var1320 == protoModule.wireTypes.varint then
			local _ = nil
			local var1325, var1326 = protoModule.readVarInt(p74, var1319)
			local _ = var1325
			var1319 = var1326
			continue
		end
		if var1320 == protoModule.wireTypes.lengthDelimited then
			if var1324 == 1 then
				local _ = nil
				local var1327, var1328 = protoModule.readBuffer(p74, var1319)
				var1319 = var1328
				table.insert(var1318.options, t.ColorProp_ConditionalOption.decode(var1327))
			else
				local _ = nil
				local var1329, var1330 = protoModule.readVarInt(p74, var1319)
				var1319 = var1330 + var1329
			end
		elseif var1320 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1331, var1332 = protoModule.readFixed32(p74, var1319)
			local _ = var1331
			var1319 = var1332
		elseif var1320 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1333, var1334 = protoModule.readFixed64(p74, var1319)
			local _ = var1333
			var1319 = var1334
		else
			error("Unsupported wire type: " .. var1320)
		end
	end
	return var1318
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
	local var1337 = t_36.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorProp_ConditionalOption.jsonDecode(v))
		end
		var1337.options = t_1
	end
	return var1337
end

t_36.descriptor = {
	name = "ColorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorProp_ConditionalOptions = t_36
typeRegistryModule.default:register(t.ColorProp_ConditionalOptions)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p75)
	-- upvalues: t_37 (ref)
	return setmetatable({
		kind = if p75 == nil or p75.kind == nil then nil else p75.kind
	}, t_37)
end

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1340 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1341, var1342 = protoModule.writeTag(buff, var1340, 1, protoModule.wireTypes.lengthDelimited)
			var1341, var1342 = protoModule.writeString(var1341, var1342, self.kind.value)
			buff = var1341
			var1340 = var1342
		elseif self.kind.type == "conditional" then
			local var1343 = self.kind.value:encode()
			local var1344, var1345 = protoModule.writeTag(buff, var1340, 2, protoModule.wireTypes.lengthDelimited)
			var1344, var1345 = protoModule.writeBuffer(var1344, var1345, var1343, buffer.len(var1343))
			buff = var1344
			var1340 = var1345
		end
	end
	local buff_1 = buffer.create(var1340)
	buffer.copy(buff_1, 0, buff, 0, var1340)
	
	return buff_1
end

function t_37.decode(p76)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1347 = t_37.new()
	local var1348 = 0
	while var1348 < buffer.len(p76) do
		local _ = nil
		local var1349 = nil
		local var1350, var1351, var1352 = protoModule.readTag(p76, var1348)
		local var1353 = var1350
		var1349 = var1351
		var1348 = var1352
		
		if var1349 == protoModule.wireTypes.varint then
			local _ = nil
			local var1354, var1355 = protoModule.readVarInt(p76, var1348)
			local _ = var1354
			var1348 = var1355
			continue
		end
		if var1349 == protoModule.wireTypes.lengthDelimited then
			if var1353 == 1 then
				local _ = nil
				local var1356, var1357 = protoModule.readBuffer(p76, var1348)
				var1348 = var1357
				var1347.kind = { type = "token", value = buffer.tostring(var1356) }
			elseif var1353 == 2 then
				local _ = nil
				local var1358, var1359 = protoModule.readBuffer(p76, var1348)
				var1348 = var1359
				var1347.kind = {
					type = "conditional",
					value = t.TypographyProp_ConditionalOptions.decode(var1358)
				}
			else
				local _ = nil
				local var1360, var1361 = protoModule.readVarInt(p76, var1348)
				var1348 = var1361 + var1360
			end
		elseif var1349 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1362, var1363 = protoModule.readFixed32(p76, var1348)
			local _ = var1362
			var1348 = var1363
		elseif var1349 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1364, var1365 = protoModule.readFixed64(p76, var1348)
			local _ = var1364
			var1348 = var1365
		else
			error("Unsupported wire type: " .. var1349)
		end
	end
	return var1347
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
	local var1367 = t_37.new()
	
	if self.token ~= nil then
		var1367.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1367.kind = {
			type = "conditional",
			value = t.TypographyProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1367
end

t_37.descriptor = {
	name = "TypographyProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
}
t.TypographyProp = t_37
typeRegistryModule.default:register(t.TypographyProp)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p77)
	-- upvalues: t_38 (ref)
	return setmetatable({
		condition = if p77 == nil or p77.condition == nil then nil else p77.condition,
		kind = if p77 == nil or p77.kind == nil then nil else p77.kind
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1369 = 0
	
	if self.condition ~= nil then
		local var1370 = self.condition:encode()
		local var1371, var1372 = protoModule.writeTag(buff, var1369, 1, protoModule.wireTypes.lengthDelimited)
		var1371, var1372 = protoModule.writeBuffer(var1371, var1372, var1370, buffer.len(var1370))
		buff = var1371
		var1369 = var1372
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1373, var1374 = protoModule.writeTag(buff, var1369, 2, protoModule.wireTypes.lengthDelimited)
		var1373, var1374 = protoModule.writeString(var1373, var1374, self.kind.value)
		buff = var1373
		var1369 = var1374
	end
	local buff_1 = buffer.create(var1369)
	buffer.copy(buff_1, 0, buff, 0, var1369)
	
	return buff_1
end

function t_38.decode(p78)
	-- upvalues: t_38 (ref), protoModule (ref), propConditionModule (ref)
	local var1376 = t_38.new()
	local var1377 = 0
	while var1377 < buffer.len(p78) do
		local _ = nil
		local var1378 = nil
		local var1379, var1380, var1381 = protoModule.readTag(p78, var1377)
		local var1382 = var1379
		var1378 = var1380
		var1377 = var1381
		
		if var1378 == protoModule.wireTypes.varint then
			local _ = nil
			local var1383, var1384 = protoModule.readVarInt(p78, var1377)
			local _ = var1383
			var1377 = var1384
			continue
		end
		if var1378 == protoModule.wireTypes.lengthDelimited then
			if var1382 == 1 then
				local _ = nil
				local var1385, var1386 = protoModule.readBuffer(p78, var1377)
				var1377 = var1386
				var1376.condition = propConditionModule.PropCondition.decode(var1385)
			elseif var1382 == 2 then
				local _ = nil
				local var1387, var1388 = protoModule.readBuffer(p78, var1377)
				var1377 = var1388
				var1376.kind = { type = "token", value = buffer.tostring(var1387) }
			else
				local _ = nil
				local var1389, var1390 = protoModule.readVarInt(p78, var1377)
				var1377 = var1390 + var1389
			end
		elseif var1378 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1391, var1392 = protoModule.readFixed32(p78, var1377)
			local _ = var1391
			var1377 = var1392
		elseif var1378 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1393, var1394 = protoModule.readFixed64(p78, var1377)
			local _ = var1393
			var1377 = var1394
		else
			error("Unsupported wire type: " .. var1378)
		end
	end
	return var1376
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
	local var1396 = t_38.new()
	
	if self.condition ~= nil then
		var1396.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1396.kind = { type = "token", value = self.token }
	end
	return var1396
end

t_38.descriptor = {
	name = "TypographyProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyProp_ConditionalOption = t_38
typeRegistryModule.default:register(t.TypographyProp_ConditionalOption)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p79)
	-- upvalues: t_39 (ref)
	return setmetatable({
		options = if p79 == nil or p79.options == nil then {} else p79.options
	}, t_39)
end

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1398 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1399 = v:encode()
			local var1400, var1401 = protoModule.writeTag(buff, var1398, 1, protoModule.wireTypes.lengthDelimited)
			var1400, var1401 = protoModule.writeBuffer(var1400, var1401, var1399, buffer.len(var1399))
			buff = var1400
			var1398 = var1401
		end
	end
	local buff_1 = buffer.create(var1398)
	buffer.copy(buff_1, 0, buff, 0, var1398)
	
	return buff_1
end

function t_39.decode(p80)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1403 = t_39.new()
	local var1404 = 0
	while var1404 < buffer.len(p80) do
		local _ = nil
		local var1405 = nil
		local var1406, var1407, var1408 = protoModule.readTag(p80, var1404)
		local var1409 = var1406
		var1405 = var1407
		var1404 = var1408
		
		if var1405 == protoModule.wireTypes.varint then
			local _ = nil
			local var1410, var1411 = protoModule.readVarInt(p80, var1404)
			local _ = var1410
			var1404 = var1411
			continue
		end
		if var1405 == protoModule.wireTypes.lengthDelimited then
			if var1409 == 1 then
				local _ = nil
				local var1412, var1413 = protoModule.readBuffer(p80, var1404)
				var1404 = var1413
				table.insert(var1403.options, t.TypographyProp_ConditionalOption.decode(var1412))
			else
				local _ = nil
				local var1414, var1415 = protoModule.readVarInt(p80, var1404)
				var1404 = var1415 + var1414
			end
		elseif var1405 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1416, var1417 = protoModule.readFixed32(p80, var1404)
			local _ = var1416
			var1404 = var1417
		elseif var1405 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1418, var1419 = protoModule.readFixed64(p80, var1404)
			local _ = var1418
			var1404 = var1419
		else
			error("Unsupported wire type: " .. var1405)
		end
	end
	return var1403
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
	local var1422 = t_39.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyProp_ConditionalOption.jsonDecode(v))
		end
		var1422.options = t_1
	end
	return var1422
end

t_39.descriptor = {
	name = "TypographyProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyProp_ConditionalOptions = t_39
typeRegistryModule.default:register(t.TypographyProp_ConditionalOptions)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p81)
	-- upvalues: t_40 (ref)
	return setmetatable({
		kind = if p81 == nil or p81.kind == nil then nil else p81.kind
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1425 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1426, var1427 = protoModule.writeTag(buff, var1425, 1, protoModule.wireTypes.lengthDelimited)
			var1426, var1427 = protoModule.writeString(var1426, var1427, self.kind.value)
			buff = var1426
			var1425 = var1427
		elseif self.kind.type == "conditional" then
			local var1428 = self.kind.value:encode()
			local var1429, var1430 = protoModule.writeTag(buff, var1425, 2, protoModule.wireTypes.lengthDelimited)
			var1429, var1430 = protoModule.writeBuffer(var1429, var1430, var1428, buffer.len(var1428))
			buff = var1429
			var1425 = var1430
		end
	end
	local buff_1 = buffer.create(var1425)
	buffer.copy(buff_1, 0, buff, 0, var1425)
	
	return buff_1
end

function t_40.decode(p82)
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1432 = t_40.new()
	local var1433 = 0
	while var1433 < buffer.len(p82) do
		local _ = nil
		local var1434 = nil
		local var1435, var1436, var1437 = protoModule.readTag(p82, var1433)
		local var1438 = var1435
		var1434 = var1436
		var1433 = var1437
		
		if var1434 == protoModule.wireTypes.varint then
			local _ = nil
			local var1439, var1440 = protoModule.readVarInt(p82, var1433)
			local _ = var1439
			var1433 = var1440
			continue
		end
		if var1434 == protoModule.wireTypes.lengthDelimited then
			if var1438 == 1 then
				local _ = nil
				local var1441, var1442 = protoModule.readBuffer(p82, var1433)
				var1433 = var1442
				var1432.kind = { type = "token", value = buffer.tostring(var1441) }
			elseif var1438 == 2 then
				local _ = nil
				local var1443, var1444 = protoModule.readBuffer(p82, var1433)
				var1433 = var1444
				var1432.kind = {
					type = "conditional",
					value = t.TypographyFontProp_ConditionalOptions.decode(var1443)
				}
			else
				local _ = nil
				local var1445, var1446 = protoModule.readVarInt(p82, var1433)
				var1433 = var1446 + var1445
			end
		elseif var1434 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1447, var1448 = protoModule.readFixed32(p82, var1433)
			local _ = var1447
			var1433 = var1448
		elseif var1434 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1449, var1450 = protoModule.readFixed64(p82, var1433)
			local _ = var1449
			var1433 = var1450
		else
			error("Unsupported wire type: " .. var1434)
		end
	end
	return var1432
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
	local var1452 = t_40.new()
	
	if self.token ~= nil then
		var1452.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1452.kind = {
			type = "conditional",
			value = t.TypographyFontProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1452
end

t_40.descriptor = {
	name = "TypographyFontProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
}
t.TypographyFontProp = t_40
typeRegistryModule.default:register(t.TypographyFontProp)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p83)
	-- upvalues: t_41 (ref)
	return setmetatable({
		condition = if p83 == nil or p83.condition == nil then nil else p83.condition,
		kind = if p83 == nil or p83.kind == nil then nil else p83.kind
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1454 = 0
	
	if self.condition ~= nil then
		local var1455 = self.condition:encode()
		local var1456, var1457 = protoModule.writeTag(buff, var1454, 1, protoModule.wireTypes.lengthDelimited)
		var1456, var1457 = protoModule.writeBuffer(var1456, var1457, var1455, buffer.len(var1455))
		buff = var1456
		var1454 = var1457
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1458, var1459 = protoModule.writeTag(buff, var1454, 2, protoModule.wireTypes.lengthDelimited)
		var1458, var1459 = protoModule.writeString(var1458, var1459, self.kind.value)
		buff = var1458
		var1454 = var1459
	end
	local buff_1 = buffer.create(var1454)
	buffer.copy(buff_1, 0, buff, 0, var1454)
	
	return buff_1
end

function t_41.decode(p84)
	-- upvalues: t_41 (ref), protoModule (ref), propConditionModule (ref)
	local var1461 = t_41.new()
	local var1462 = 0
	while var1462 < buffer.len(p84) do
		local _ = nil
		local var1463 = nil
		local var1464, var1465, var1466 = protoModule.readTag(p84, var1462)
		local var1467 = var1464
		var1463 = var1465
		var1462 = var1466
		
		if var1463 == protoModule.wireTypes.varint then
			local _ = nil
			local var1468, var1469 = protoModule.readVarInt(p84, var1462)
			local _ = var1468
			var1462 = var1469
			continue
		end
		if var1463 == protoModule.wireTypes.lengthDelimited then
			if var1467 == 1 then
				local _ = nil
				local var1470, var1471 = protoModule.readBuffer(p84, var1462)
				var1462 = var1471
				var1461.condition = propConditionModule.PropCondition.decode(var1470)
			elseif var1467 == 2 then
				local _ = nil
				local var1472, var1473 = protoModule.readBuffer(p84, var1462)
				var1462 = var1473
				var1461.kind = { type = "token", value = buffer.tostring(var1472) }
			else
				local _ = nil
				local var1474, var1475 = protoModule.readVarInt(p84, var1462)
				var1462 = var1475 + var1474
			end
		elseif var1463 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1476, var1477 = protoModule.readFixed32(p84, var1462)
			local _ = var1476
			var1462 = var1477
		elseif var1463 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1478, var1479 = protoModule.readFixed64(p84, var1462)
			local _ = var1478
			var1462 = var1479
		else
			error("Unsupported wire type: " .. var1463)
		end
	end
	return var1461
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
	local var1481 = t_41.new()
	
	if self.condition ~= nil then
		var1481.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1481.kind = { type = "token", value = self.token }
	end
	return var1481
end

t_41.descriptor = {
	name = "TypographyFontProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyFontProp_ConditionalOption = t_41
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOption)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p85)
	-- upvalues: t_42 (ref)
	return setmetatable({
		options = if p85 == nil or p85.options == nil then {} else p85.options
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1483 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1484 = v:encode()
			local var1485, var1486 = protoModule.writeTag(buff, var1483, 1, protoModule.wireTypes.lengthDelimited)
			var1485, var1486 = protoModule.writeBuffer(var1485, var1486, var1484, buffer.len(var1484))
			buff = var1485
			var1483 = var1486
		end
	end
	local buff_1 = buffer.create(var1483)
	buffer.copy(buff_1, 0, buff, 0, var1483)
	
	return buff_1
end

function t_42.decode(p86)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1488 = t_42.new()
	local var1489 = 0
	while var1489 < buffer.len(p86) do
		local _ = nil
		local var1490 = nil
		local var1491, var1492, var1493 = protoModule.readTag(p86, var1489)
		local var1494 = var1491
		var1490 = var1492
		var1489 = var1493
		
		if var1490 == protoModule.wireTypes.varint then
			local _ = nil
			local var1495, var1496 = protoModule.readVarInt(p86, var1489)
			local _ = var1495
			var1489 = var1496
			continue
		end
		if var1490 == protoModule.wireTypes.lengthDelimited then
			if var1494 == 1 then
				local _ = nil
				local var1497, var1498 = protoModule.readBuffer(p86, var1489)
				var1489 = var1498
				table.insert(var1488.options, t.TypographyFontProp_ConditionalOption.decode(var1497))
			else
				local _ = nil
				local var1499, var1500 = protoModule.readVarInt(p86, var1489)
				var1489 = var1500 + var1499
			end
		elseif var1490 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1501, var1502 = protoModule.readFixed32(p86, var1489)
			local _ = var1501
			var1489 = var1502
		elseif var1490 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1503, var1504 = protoModule.readFixed64(p86, var1489)
			local _ = var1503
			var1489 = var1504
		else
			error("Unsupported wire type: " .. var1490)
		end
	end
	return var1488
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
	local var1507 = t_42.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyFontProp_ConditionalOption.jsonDecode(v))
		end
		var1507.options = t_1
	end
	return var1507
end

t_42.descriptor = {
	name = "TypographyFontProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyFontProp_ConditionalOptions = t_42
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOptions)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p87)
	-- upvalues: t_43 (ref)
	return setmetatable({
		kind = if p87 == nil or p87.kind == nil then nil else p87.kind
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1510 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1511, var1512 = protoModule.writeTag(buff, var1510, 1, protoModule.wireTypes.lengthDelimited)
			var1511, var1512 = protoModule.writeString(var1511, var1512, self.kind.value)
			buff = var1511
			var1510 = var1512
		elseif self.kind.type == "conditional" then
			local var1513 = self.kind.value:encode()
			local var1514, var1515 = protoModule.writeTag(buff, var1510, 2, protoModule.wireTypes.lengthDelimited)
			var1514, var1515 = protoModule.writeBuffer(var1514, var1515, var1513, buffer.len(var1513))
			buff = var1514
			var1510 = var1515
		end
	end
	local buff_1 = buffer.create(var1510)
	buffer.copy(buff_1, 0, buff, 0, var1510)
	
	return buff_1
end

function t_43.decode(p88)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1517 = t_43.new()
	local var1518 = 0
	while var1518 < buffer.len(p88) do
		local _ = nil
		local var1519 = nil
		local var1520, var1521, var1522 = protoModule.readTag(p88, var1518)
		local var1523 = var1520
		var1519 = var1521
		var1518 = var1522
		
		if var1519 == protoModule.wireTypes.varint then
			local _ = nil
			local var1524, var1525 = protoModule.readVarInt(p88, var1518)
			local _ = var1524
			var1518 = var1525
			continue
		end
		if var1519 == protoModule.wireTypes.lengthDelimited then
			if var1523 == 1 then
				local _ = nil
				local var1526, var1527 = protoModule.readBuffer(p88, var1518)
				var1518 = var1527
				var1517.kind = { type = "token", value = buffer.tostring(var1526) }
			elseif var1523 == 2 then
				local _ = nil
				local var1528, var1529 = protoModule.readBuffer(p88, var1518)
				var1518 = var1529
				var1517.kind = {
					type = "conditional",
					value = t.ColorStyleProp_ConditionalOptions.decode(var1528)
				}
			else
				local _ = nil
				local var1530, var1531 = protoModule.readVarInt(p88, var1518)
				var1518 = var1531 + var1530
			end
		elseif var1519 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1532, var1533 = protoModule.readFixed32(p88, var1518)
			local _ = var1532
			var1518 = var1533
		elseif var1519 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1534, var1535 = protoModule.readFixed64(p88, var1518)
			local _ = var1534
			var1518 = var1535
		else
			error("Unsupported wire type: " .. var1519)
		end
	end
	return var1517
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
	local var1537 = t_43.new()
	
	if self.token ~= nil then
		var1537.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1537.kind = {
			type = "conditional",
			value = t.ColorStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1537
end

t_43.descriptor = {
	name = "ColorStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
}
t.ColorStyleProp = t_43
typeRegistryModule.default:register(t.ColorStyleProp)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p89)
	-- upvalues: t_44 (ref)
	return setmetatable({
		condition = if p89 == nil or p89.condition == nil then nil else p89.condition,
		kind = if p89 == nil or p89.kind == nil then nil else p89.kind
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1539 = 0
	
	if self.condition ~= nil then
		local var1540 = self.condition:encode()
		local var1541, var1542 = protoModule.writeTag(buff, var1539, 1, protoModule.wireTypes.lengthDelimited)
		var1541, var1542 = protoModule.writeBuffer(var1541, var1542, var1540, buffer.len(var1540))
		buff = var1541
		var1539 = var1542
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1543, var1544 = protoModule.writeTag(buff, var1539, 2, protoModule.wireTypes.lengthDelimited)
		var1543, var1544 = protoModule.writeString(var1543, var1544, self.kind.value)
		buff = var1543
		var1539 = var1544
	end
	local buff_1 = buffer.create(var1539)
	buffer.copy(buff_1, 0, buff, 0, var1539)
	
	return buff_1
end

function t_44.decode(p90)
	-- upvalues: t_44 (ref), protoModule (ref), propConditionModule (ref)
	local var1546 = t_44.new()
	local var1547 = 0
	while var1547 < buffer.len(p90) do
		local _ = nil
		local var1548 = nil
		local var1549, var1550, var1551 = protoModule.readTag(p90, var1547)
		local var1552 = var1549
		var1548 = var1550
		var1547 = var1551
		
		if var1548 == protoModule.wireTypes.varint then
			local _ = nil
			local var1553, var1554 = protoModule.readVarInt(p90, var1547)
			local _ = var1553
			var1547 = var1554
			continue
		end
		if var1548 == protoModule.wireTypes.lengthDelimited then
			if var1552 == 1 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p90, var1547)
				var1547 = var1556
				var1546.condition = propConditionModule.PropCondition.decode(var1555)
			elseif var1552 == 2 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p90, var1547)
				var1547 = var1558
				var1546.kind = { type = "token", value = buffer.tostring(var1557) }
			else
				local _ = nil
				local var1559, var1560 = protoModule.readVarInt(p90, var1547)
				var1547 = var1560 + var1559
			end
		elseif var1548 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1561, var1562 = protoModule.readFixed32(p90, var1547)
			local _ = var1561
			var1547 = var1562
		elseif var1548 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1563, var1564 = protoModule.readFixed64(p90, var1547)
			local _ = var1563
			var1547 = var1564
		else
			error("Unsupported wire type: " .. var1548)
		end
	end
	return var1546
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
	local var1566 = t_44.new()
	
	if self.condition ~= nil then
		var1566.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1566.kind = { type = "token", value = self.token }
	end
	return var1566
end

t_44.descriptor = {
	name = "ColorStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorStyleProp_ConditionalOption = t_44
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOption)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p91)
	-- upvalues: t_45 (ref)
	return setmetatable({
		options = if p91 == nil or p91.options == nil then {} else p91.options
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1568 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1569 = v:encode()
			local var1570, var1571 = protoModule.writeTag(buff, var1568, 1, protoModule.wireTypes.lengthDelimited)
			var1570, var1571 = protoModule.writeBuffer(var1570, var1571, var1569, buffer.len(var1569))
			buff = var1570
			var1568 = var1571
		end
	end
	local buff_1 = buffer.create(var1568)
	buffer.copy(buff_1, 0, buff, 0, var1568)
	
	return buff_1
end

function t_45.decode(p92)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1573 = t_45.new()
	local var1574 = 0
	while var1574 < buffer.len(p92) do
		local _ = nil
		local var1575 = nil
		local var1576, var1577, var1578 = protoModule.readTag(p92, var1574)
		local var1579 = var1576
		var1575 = var1577
		var1574 = var1578
		
		if var1575 == protoModule.wireTypes.varint then
			local _ = nil
			local var1580, var1581 = protoModule.readVarInt(p92, var1574)
			local _ = var1580
			var1574 = var1581
			continue
		end
		if var1575 == protoModule.wireTypes.lengthDelimited then
			if var1579 == 1 then
				local _ = nil
				local var1582, var1583 = protoModule.readBuffer(p92, var1574)
				var1574 = var1583
				table.insert(var1573.options, t.ColorStyleProp_ConditionalOption.decode(var1582))
			else
				local _ = nil
				local var1584, var1585 = protoModule.readVarInt(p92, var1574)
				var1574 = var1585 + var1584
			end
		elseif var1575 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1586, var1587 = protoModule.readFixed32(p92, var1574)
			local _ = var1586
			var1574 = var1587
		elseif var1575 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1588, var1589 = protoModule.readFixed64(p92, var1574)
			local _ = var1588
			var1574 = var1589
		else
			error("Unsupported wire type: " .. var1575)
		end
	end
	return var1573
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
	local var1592 = t_45.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorStyleProp_ConditionalOption.jsonDecode(v))
		end
		var1592.options = t_1
	end
	return var1592
end

t_45.descriptor = {
	name = "ColorStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorStyleProp_ConditionalOptions = t_45
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOptions)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p93)
	-- upvalues: t_46 (ref)
	return setmetatable({
		kind = if p93 == nil or p93.kind == nil then nil else p93.kind
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1595 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1596, var1597 = protoModule.writeTag(buff, var1595, 1, protoModule.wireTypes.lengthDelimited)
			var1596, var1597 = protoModule.writeString(var1596, var1597, self.kind.value)
			buff = var1596
			var1595 = var1597
		elseif self.kind.type == "conditional" then
			local var1598 = self.kind.value:encode()
			local var1599, var1600 = protoModule.writeTag(buff, var1595, 2, protoModule.wireTypes.lengthDelimited)
			var1599, var1600 = protoModule.writeBuffer(var1599, var1600, var1598, buffer.len(var1598))
			buff = var1599
			var1595 = var1600
		elseif self.kind.type == "binding_path" then
			local var1601, var1602 = protoModule.writeTag(buff, var1595, 3, protoModule.wireTypes.lengthDelimited)
			var1601, var1602 = protoModule.writeString(var1601, var1602, self.kind.value)
			buff = var1601
			var1595 = var1602
		end
	end
	local buff_1 = buffer.create(var1595)
	buffer.copy(buff_1, 0, buff, 0, var1595)
	
	return buff_1
end

function t_46.decode(p94)
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1604 = t_46.new()
	local var1605 = 0
	while var1605 < buffer.len(p94) do
		local _ = nil
		local var1606 = nil
		local var1607, var1608, var1609 = protoModule.readTag(p94, var1605)
		local var1610 = var1607
		var1606 = var1608
		var1605 = var1609
		
		if var1606 == protoModule.wireTypes.varint then
			local _ = nil
			local var1611, var1612 = protoModule.readVarInt(p94, var1605)
			local _ = var1611
			var1605 = var1612
			continue
		end
		if var1606 == protoModule.wireTypes.lengthDelimited then
			if var1610 == 1 then
				local _ = nil
				local var1613, var1614 = protoModule.readBuffer(p94, var1605)
				var1605 = var1614
				var1604.kind = { type = "literal", value = buffer.tostring(var1613) }
			elseif var1610 == 2 then
				local _ = nil
				local var1615, var1616 = protoModule.readBuffer(p94, var1605)
				var1605 = var1616
				var1604.kind = {
					type = "conditional",
					value = t.FillBehaviorProp_ConditionalOptions.decode(var1615)
				}
			elseif var1610 == 3 then
				local _ = nil
				local var1617, var1618 = protoModule.readBuffer(p94, var1605)
				var1605 = var1618
				var1604.kind = { type = "binding_path", value = buffer.tostring(var1617) }
			else
				local _ = nil
				local var1619, var1620 = protoModule.readVarInt(p94, var1605)
				var1605 = var1620 + var1619
			end
		elseif var1606 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1621, var1622 = protoModule.readFixed32(p94, var1605)
			local _ = var1621
			var1605 = var1622
		elseif var1606 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1623, var1624 = protoModule.readFixed64(p94, var1605)
			local _ = var1623
			var1605 = var1624
		else
			error("Unsupported wire type: " .. var1606)
		end
	end
	return var1604
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
	local var1626 = t_46.new()
	
	if self.literal ~= nil then
		var1626.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1626.kind = {
			type = "conditional",
			value = t.FillBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1626.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1626.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1626
end

t_46.descriptor = {
	name = "FillBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
}
t.FillBehaviorProp = t_46
typeRegistryModule.default:register(t.FillBehaviorProp)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p95)
	-- upvalues: t_47 (ref)
	return setmetatable({
		condition = if p95 == nil or p95.condition == nil then nil else p95.condition,
		kind = if p95 == nil or p95.kind == nil then nil else p95.kind
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1628 = 0
	
	if self.condition ~= nil then
		local var1629 = self.condition:encode()
		local var1630, var1631 = protoModule.writeTag(buff, var1628, 1, protoModule.wireTypes.lengthDelimited)
		var1630, var1631 = protoModule.writeBuffer(var1630, var1631, var1629, buffer.len(var1629))
		buff = var1630
		var1628 = var1631
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1632, var1633 = protoModule.writeTag(buff, var1628, 2, protoModule.wireTypes.lengthDelimited)
			var1632, var1633 = protoModule.writeString(var1632, var1633, self.kind.value)
			buff = var1632
			var1628 = var1633
		elseif self.kind.type == "binding_path" then
			local var1634, var1635 = protoModule.writeTag(buff, var1628, 3, protoModule.wireTypes.lengthDelimited)
			var1634, var1635 = protoModule.writeString(var1634, var1635, self.kind.value)
			buff = var1634
			var1628 = var1635
		end
	end
	local buff_1 = buffer.create(var1628)
	buffer.copy(buff_1, 0, buff, 0, var1628)
	
	return buff_1
end

function t_47.decode(p96)
	-- upvalues: t_47 (ref), protoModule (ref), propConditionModule (ref)
	local var1637 = t_47.new()
	local var1638 = 0
	while var1638 < buffer.len(p96) do
		local _ = nil
		local var1639 = nil
		local var1640, var1641, var1642 = protoModule.readTag(p96, var1638)
		local var1643 = var1640
		var1639 = var1641
		var1638 = var1642
		
		if var1639 == protoModule.wireTypes.varint then
			local _ = nil
			local var1644, var1645 = protoModule.readVarInt(p96, var1638)
			local _ = var1644
			var1638 = var1645
			continue
		end
		if var1639 == protoModule.wireTypes.lengthDelimited then
			if var1643 == 1 then
				local _ = nil
				local var1646, var1647 = protoModule.readBuffer(p96, var1638)
				var1638 = var1647
				var1637.condition = propConditionModule.PropCondition.decode(var1646)
			elseif var1643 == 2 then
				local _ = nil
				local var1648, var1649 = protoModule.readBuffer(p96, var1638)
				var1638 = var1649
				var1637.kind = { type = "literal", value = buffer.tostring(var1648) }
			elseif var1643 == 3 then
				local _ = nil
				local var1650, var1651 = protoModule.readBuffer(p96, var1638)
				var1638 = var1651
				var1637.kind = { type = "binding_path", value = buffer.tostring(var1650) }
			else
				local _ = nil
				local var1652, var1653 = protoModule.readVarInt(p96, var1638)
				var1638 = var1653 + var1652
			end
		elseif var1639 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1654, var1655 = protoModule.readFixed32(p96, var1638)
			local _ = var1654
			var1638 = var1655
		elseif var1639 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1656, var1657 = protoModule.readFixed64(p96, var1638)
			local _ = var1656
			var1638 = var1657
		else
			error("Unsupported wire type: " .. var1639)
		end
	end
	return var1637
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
	local var1659 = t_47.new()
	
	if self.condition ~= nil then
		var1659.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1659.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1659.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1659.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1659
end

t_47.descriptor = {
	name = "FillBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FillBehaviorProp_ConditionalOption = t_47
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOption)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p97)
	-- upvalues: t_48 (ref)
	return setmetatable({
		options = if p97 == nil or p97.options == nil then {} else p97.options
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1661 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1662 = v:encode()
			local var1663, var1664 = protoModule.writeTag(buff, var1661, 1, protoModule.wireTypes.lengthDelimited)
			var1663, var1664 = protoModule.writeBuffer(var1663, var1664, var1662, buffer.len(var1662))
			buff = var1663
			var1661 = var1664
		end
	end
	local buff_1 = buffer.create(var1661)
	buffer.copy(buff_1, 0, buff, 0, var1661)
	
	return buff_1
end

function t_48.decode(p98)
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1666 = t_48.new()
	local var1667 = 0
	while var1667 < buffer.len(p98) do
		local _ = nil
		local var1668 = nil
		local var1669, var1670, var1671 = protoModule.readTag(p98, var1667)
		local var1672 = var1669
		var1668 = var1670
		var1667 = var1671
		
		if var1668 == protoModule.wireTypes.varint then
			local _ = nil
			local var1673, var1674 = protoModule.readVarInt(p98, var1667)
			local _ = var1673
			var1667 = var1674
			continue
		end
		if var1668 == protoModule.wireTypes.lengthDelimited then
			if var1672 == 1 then
				local _ = nil
				local var1675, var1676 = protoModule.readBuffer(p98, var1667)
				var1667 = var1676
				table.insert(var1666.options, t.FillBehaviorProp_ConditionalOption.decode(var1675))
			else
				local _ = nil
				local var1677, var1678 = protoModule.readVarInt(p98, var1667)
				var1667 = var1678 + var1677
			end
		elseif var1668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1679, var1680 = protoModule.readFixed32(p98, var1667)
			local _ = var1679
			var1667 = var1680
		elseif var1668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1681, var1682 = protoModule.readFixed64(p98, var1667)
			local _ = var1681
			var1667 = var1682
		else
			error("Unsupported wire type: " .. var1668)
		end
	end
	return var1666
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
	local var1685 = t_48.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FillBehaviorProp_ConditionalOption.jsonDecode(v))
		end
		var1685.options = t_1
	end
	return var1685
end

t_48.descriptor = {
	name = "FillBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FillBehaviorProp_ConditionalOptions = t_48
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOptions)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p99)
	-- upvalues: t_49 (ref)
	return setmetatable({
		kind = if p99 == nil or p99.kind == nil then nil else p99.kind
	}, t_49)
end

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1688 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1689, var1690 = protoModule.writeTag(buff, var1688, 1, protoModule.wireTypes.lengthDelimited)
			var1689, var1690 = protoModule.writeString(var1689, var1690, self.kind.value)
			buff = var1689
			var1688 = var1690
		elseif self.kind.type == "conditional" then
			local var1691 = self.kind.value:encode()
			local var1692, var1693 = protoModule.writeTag(buff, var1688, 2, protoModule.wireTypes.lengthDelimited)
			var1692, var1693 = protoModule.writeBuffer(var1692, var1693, var1691, buffer.len(var1691))
			buff = var1692
			var1688 = var1693
		elseif self.kind.type == "binding_path" then
			local var1694, var1695 = protoModule.writeTag(buff, var1688, 3, protoModule.wireTypes.lengthDelimited)
			var1694, var1695 = protoModule.writeString(var1694, var1695, self.kind.value)
			buff = var1694
			var1688 = var1695
		end
	end
	local buff_1 = buffer.create(var1688)
	buffer.copy(buff_1, 0, buff, 0, var1688)
	
	return buff_1
end

function t_49.decode(p100)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1697 = t_49.new()
	local var1698 = 0
	while var1698 < buffer.len(p100) do
		local _ = nil
		local var1699 = nil
		local var1700, var1701, var1702 = protoModule.readTag(p100, var1698)
		local var1703 = var1700
		var1699 = var1701
		var1698 = var1702
		
		if var1699 == protoModule.wireTypes.varint then
			local _ = nil
			local var1704, var1705 = protoModule.readVarInt(p100, var1698)
			local _ = var1704
			var1698 = var1705
			continue
		end
		if var1699 == protoModule.wireTypes.lengthDelimited then
			if var1703 == 1 then
				local _ = nil
				local var1706, var1707 = protoModule.readBuffer(p100, var1698)
				var1698 = var1707
				var1697.kind = { type = "literal", value = buffer.tostring(var1706) }
			elseif var1703 == 2 then
				local _ = nil
				local var1708, var1709 = protoModule.readBuffer(p100, var1698)
				var1698 = var1709
				var1697.kind = {
					type = "conditional",
					value = t.InputSizeProp_ConditionalOptions.decode(var1708)
				}
			elseif var1703 == 3 then
				local _ = nil
				local var1710, var1711 = protoModule.readBuffer(p100, var1698)
				var1698 = var1711
				var1697.kind = { type = "binding_path", value = buffer.tostring(var1710) }
			else
				local _ = nil
				local var1712, var1713 = protoModule.readVarInt(p100, var1698)
				var1698 = var1713 + var1712
			end
		elseif var1699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1714, var1715 = protoModule.readFixed32(p100, var1698)
			local _ = var1714
			var1698 = var1715
		elseif var1699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1716, var1717 = protoModule.readFixed64(p100, var1698)
			local _ = var1716
			var1698 = var1717
		else
			error("Unsupported wire type: " .. var1699)
		end
	end
	return var1697
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
	local var1719 = t_49.new()
	
	if self.literal ~= nil then
		var1719.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1719.kind = {
			type = "conditional",
			value = t.InputSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1719.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1719.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1719
end

t_49.descriptor = {
	name = "InputSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
}
t.InputSizeProp = t_49
typeRegistryModule.default:register(t.InputSizeProp)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p101)
	-- upvalues: t_50 (ref)
	return setmetatable({
		condition = if p101 == nil or p101.condition == nil then nil else p101.condition,
		kind = if p101 == nil or p101.kind == nil then nil else p101.kind
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1721 = 0
	
	if self.condition ~= nil then
		local var1722 = self.condition:encode()
		local var1723, var1724 = protoModule.writeTag(buff, var1721, 1, protoModule.wireTypes.lengthDelimited)
		var1723, var1724 = protoModule.writeBuffer(var1723, var1724, var1722, buffer.len(var1722))
		buff = var1723
		var1721 = var1724
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1725, var1726 = protoModule.writeTag(buff, var1721, 2, protoModule.wireTypes.lengthDelimited)
			var1725, var1726 = protoModule.writeString(var1725, var1726, self.kind.value)
			buff = var1725
			var1721 = var1726
		elseif self.kind.type == "binding_path" then
			local var1727, var1728 = protoModule.writeTag(buff, var1721, 3, protoModule.wireTypes.lengthDelimited)
			var1727, var1728 = protoModule.writeString(var1727, var1728, self.kind.value)
			buff = var1727
			var1721 = var1728
		end
	end
	local buff_1 = buffer.create(var1721)
	buffer.copy(buff_1, 0, buff, 0, var1721)
	
	return buff_1
end

function t_50.decode(p102)
	-- upvalues: t_50 (ref), protoModule (ref), propConditionModule (ref)
	local var1730 = t_50.new()
	local var1731 = 0
	while var1731 < buffer.len(p102) do
		local _ = nil
		local var1732 = nil
		local var1733, var1734, var1735 = protoModule.readTag(p102, var1731)
		local var1736 = var1733
		var1732 = var1734
		var1731 = var1735
		
		if var1732 == protoModule.wireTypes.varint then
			local _ = nil
			local var1737, var1738 = protoModule.readVarInt(p102, var1731)
			local _ = var1737
			var1731 = var1738
			continue
		end
		if var1732 == protoModule.wireTypes.lengthDelimited then
			if var1736 == 1 then
				local _ = nil
				local var1739, var1740 = protoModule.readBuffer(p102, var1731)
				var1731 = var1740
				var1730.condition = propConditionModule.PropCondition.decode(var1739)
			elseif var1736 == 2 then
				local _ = nil
				local var1741, var1742 = protoModule.readBuffer(p102, var1731)
				var1731 = var1742
				var1730.kind = { type = "literal", value = buffer.tostring(var1741) }
			elseif var1736 == 3 then
				local _ = nil
				local var1743, var1744 = protoModule.readBuffer(p102, var1731)
				var1731 = var1744
				var1730.kind = { type = "binding_path", value = buffer.tostring(var1743) }
			else
				local _ = nil
				local var1745, var1746 = protoModule.readVarInt(p102, var1731)
				var1731 = var1746 + var1745
			end
		elseif var1732 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1747, var1748 = protoModule.readFixed32(p102, var1731)
			local _ = var1747
			var1731 = var1748
		elseif var1732 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1749, var1750 = protoModule.readFixed64(p102, var1731)
			local _ = var1749
			var1731 = var1750
		else
			error("Unsupported wire type: " .. var1732)
		end
	end
	return var1730
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
	local var1752 = t_50.new()
	
	if self.condition ~= nil then
		var1752.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1752.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1752.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1752.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1752
end

t_50.descriptor = {
	name = "InputSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.InputSizeProp_ConditionalOption = t_50
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOption)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p103)
	-- upvalues: t_51 (ref)
	return setmetatable({
		options = if p103 == nil or p103.options == nil then {} else p103.options
	}, t_51)
end

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1754 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1755 = v:encode()
			local var1756, var1757 = protoModule.writeTag(buff, var1754, 1, protoModule.wireTypes.lengthDelimited)
			var1756, var1757 = protoModule.writeBuffer(var1756, var1757, var1755, buffer.len(var1755))
			buff = var1756
			var1754 = var1757
		end
	end
	local buff_1 = buffer.create(var1754)
	buffer.copy(buff_1, 0, buff, 0, var1754)
	
	return buff_1
end

function t_51.decode(p104)
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1759 = t_51.new()
	local var1760 = 0
	while var1760 < buffer.len(p104) do
		local _ = nil
		local var1761 = nil
		local var1762, var1763, var1764 = protoModule.readTag(p104, var1760)
		local var1765 = var1762
		var1761 = var1763
		var1760 = var1764
		
		if var1761 == protoModule.wireTypes.varint then
			local _ = nil
			local var1766, var1767 = protoModule.readVarInt(p104, var1760)
			local _ = var1766
			var1760 = var1767
			continue
		end
		if var1761 == protoModule.wireTypes.lengthDelimited then
			if var1765 == 1 then
				local _ = nil
				local var1768, var1769 = protoModule.readBuffer(p104, var1760)
				var1760 = var1769
				table.insert(var1759.options, t.InputSizeProp_ConditionalOption.decode(var1768))
			else
				local _ = nil
				local var1770, var1771 = protoModule.readVarInt(p104, var1760)
				var1760 = var1771 + var1770
			end
		elseif var1761 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1772, var1773 = protoModule.readFixed32(p104, var1760)
			local _ = var1772
			var1760 = var1773
		elseif var1761 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1774, var1775 = protoModule.readFixed64(p104, var1760)
			local _ = var1774
			var1760 = var1775
		else
			error("Unsupported wire type: " .. var1761)
		end
	end
	return var1759
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
	local var1778 = t_51.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.InputSizeProp_ConditionalOption.jsonDecode(v))
		end
		var1778.options = t_1
	end
	return var1778
end

t_51.descriptor = {
	name = "InputSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.InputSizeProp_ConditionalOptions = t_51
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOptions)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p105)
	-- upvalues: t_52 (ref)
	return setmetatable({
		kind = if p105 == nil or p105.kind == nil then nil else p105.kind
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1781 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1782, var1783 = protoModule.writeTag(buff, var1781, 1, protoModule.wireTypes.lengthDelimited)
			var1782, var1783 = protoModule.writeString(var1782, var1783, self.kind.value)
			buff = var1782
			var1781 = var1783
		elseif self.kind.type == "token" then
			local var1784, var1785 = protoModule.writeTag(buff, var1781, 2, protoModule.wireTypes.lengthDelimited)
			var1784, var1785 = protoModule.writeString(var1784, var1785, self.kind.value)
			buff = var1784
			var1781 = var1785
		elseif self.kind.type == "conditional" then
			local var1786 = self.kind.value:encode()
			local var1787, var1788 = protoModule.writeTag(buff, var1781, 3, protoModule.wireTypes.lengthDelimited)
			var1787, var1788 = protoModule.writeBuffer(var1787, var1788, var1786, buffer.len(var1786))
			buff = var1787
			var1781 = var1788
		elseif self.kind.type == "binding_path" then
			local var1789, var1790 = protoModule.writeTag(buff, var1781, 4, protoModule.wireTypes.lengthDelimited)
			var1789, var1790 = protoModule.writeString(var1789, var1790, self.kind.value)
			buff = var1789
			var1781 = var1790
		end
	end
	local buff_1 = buffer.create(var1781)
	buffer.copy(buff_1, 0, buff, 0, var1781)
	
	return buff_1
end

function t_52.decode(p106)
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1792 = t_52.new()
	local var1793 = 0
	while var1793 < buffer.len(p106) do
		local _ = nil
		local var1794 = nil
		local var1795, var1796, var1797 = protoModule.readTag(p106, var1793)
		local var1798 = var1795
		var1794 = var1796
		var1793 = var1797
		
		if var1794 == protoModule.wireTypes.varint then
			local _ = nil
			local var1799, var1800 = protoModule.readVarInt(p106, var1793)
			local _ = var1799
			var1793 = var1800
			continue
		end
		if var1794 == protoModule.wireTypes.lengthDelimited then
			if var1798 == 1 then
				local _ = nil
				local var1801, var1802 = protoModule.readBuffer(p106, var1793)
				var1793 = var1802
				var1792.kind = { type = "literal", value = buffer.tostring(var1801) }
			elseif var1798 == 2 then
				local _ = nil
				local var1803, var1804 = protoModule.readBuffer(p106, var1793)
				var1793 = var1804
				var1792.kind = { type = "token", value = buffer.tostring(var1803) }
			elseif var1798 == 3 then
				local _ = nil
				local var1805, var1806 = protoModule.readBuffer(p106, var1793)
				var1793 = var1806
				var1792.kind = {
					type = "conditional",
					value = t.UDimProp_ConditionalOptions.decode(var1805)
				}
			elseif var1798 == 4 then
				local _ = nil
				local var1807, var1808 = protoModule.readBuffer(p106, var1793)
				var1793 = var1808
				var1792.kind = { type = "binding_path", value = buffer.tostring(var1807) }
			else
				local _ = nil
				local var1809, var1810 = protoModule.readVarInt(p106, var1793)
				var1793 = var1810 + var1809
			end
		elseif var1794 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1811, var1812 = protoModule.readFixed32(p106, var1793)
			local _ = var1811
			var1793 = var1812
		elseif var1794 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1813, var1814 = protoModule.readFixed64(p106, var1793)
			local _ = var1813
			var1793 = var1814
		else
			error("Unsupported wire type: " .. var1794)
		end
	end
	return var1792
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
	local var1816 = t_52.new()
	
	if self.literal ~= nil then
		var1816.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1816.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1816.kind = {
			type = "conditional",
			value = t.UDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1816.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1816.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1816
end

t_52.descriptor = {
	name = "UDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
}
t.UDimProp = t_52
typeRegistryModule.default:register(t.UDimProp)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p107)
	-- upvalues: t_53 (ref)
	return setmetatable({
		condition = if p107 == nil or p107.condition == nil then nil else p107.condition,
		kind = if p107 == nil or p107.kind == nil then nil else p107.kind
	}, t_53)
end

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1818 = 0
	
	if self.condition ~= nil then
		local var1819 = self.condition:encode()
		local var1820, var1821 = protoModule.writeTag(buff, var1818, 1, protoModule.wireTypes.lengthDelimited)
		var1820, var1821 = protoModule.writeBuffer(var1820, var1821, var1819, buffer.len(var1819))
		buff = var1820
		var1818 = var1821
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1822, var1823 = protoModule.writeTag(buff, var1818, 2, protoModule.wireTypes.lengthDelimited)
			var1822, var1823 = protoModule.writeString(var1822, var1823, self.kind.value)
			buff = var1822
			var1818 = var1823
		elseif self.kind.type == "token" then
			local var1824, var1825 = protoModule.writeTag(buff, var1818, 3, protoModule.wireTypes.lengthDelimited)
			var1824, var1825 = protoModule.writeString(var1824, var1825, self.kind.value)
			buff = var1824
			var1818 = var1825
		elseif self.kind.type == "binding_path" then
			local var1826, var1827 = protoModule.writeTag(buff, var1818, 4, protoModule.wireTypes.lengthDelimited)
			var1826, var1827 = protoModule.writeString(var1826, var1827, self.kind.value)
			buff = var1826
			var1818 = var1827
		end
	end
	local buff_1 = buffer.create(var1818)
	buffer.copy(buff_1, 0, buff, 0, var1818)
	
	return buff_1
end

function t_53.decode(p108)
	-- upvalues: t_53 (ref), protoModule (ref), propConditionModule (ref)
	local var1829 = t_53.new()
	local var1830 = 0
	while var1830 < buffer.len(p108) do
		local _ = nil
		local var1831 = nil
		local var1832, var1833, var1834 = protoModule.readTag(p108, var1830)
		local var1835 = var1832
		var1831 = var1833
		var1830 = var1834
		
		if var1831 == protoModule.wireTypes.varint then
			local _ = nil
			local var1836, var1837 = protoModule.readVarInt(p108, var1830)
			local _ = var1836
			var1830 = var1837
			continue
		end
		if var1831 == protoModule.wireTypes.lengthDelimited then
			if var1835 == 1 then
				local _ = nil
				local var1838, var1839 = protoModule.readBuffer(p108, var1830)
				var1830 = var1839
				var1829.condition = propConditionModule.PropCondition.decode(var1838)
			elseif var1835 == 2 then
				local _ = nil
				local var1840, var1841 = protoModule.readBuffer(p108, var1830)
				var1830 = var1841
				var1829.kind = { type = "literal", value = buffer.tostring(var1840) }
			elseif var1835 == 3 then
				local _ = nil
				local var1842, var1843 = protoModule.readBuffer(p108, var1830)
				var1830 = var1843
				var1829.kind = { type = "token", value = buffer.tostring(var1842) }
			elseif var1835 == 4 then
				local _ = nil
				local var1844, var1845 = protoModule.readBuffer(p108, var1830)
				var1830 = var1845
				var1829.kind = { type = "binding_path", value = buffer.tostring(var1844) }
			else
				local _ = nil
				local var1846, var1847 = protoModule.readVarInt(p108, var1830)
				var1830 = var1847 + var1846
			end
		elseif var1831 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1848, var1849 = protoModule.readFixed32(p108, var1830)
			local _ = var1848
			var1830 = var1849
		elseif var1831 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1850, var1851 = protoModule.readFixed64(p108, var1830)
			local _ = var1850
			var1830 = var1851
		else
			error("Unsupported wire type: " .. var1831)
		end
	end
	return var1829
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
	local var1853 = t_53.new()
	
	if self.condition ~= nil then
		var1853.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1853.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1853.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1853.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1853.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1853
end

t_53.descriptor = {
	name = "UDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDimProp_ConditionalOption = t_53
typeRegistryModule.default:register(t.UDimProp_ConditionalOption)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p109)
	-- upvalues: t_54 (ref)
	return setmetatable({
		options = if p109 == nil or p109.options == nil then {} else p109.options
	}, t_54)
end

function t_54:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1855 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1856 = v:encode()
			local var1857, var1858 = protoModule.writeTag(buff, var1855, 1, protoModule.wireTypes.lengthDelimited)
			var1857, var1858 = protoModule.writeBuffer(var1857, var1858, var1856, buffer.len(var1856))
			buff = var1857
			var1855 = var1858
		end
	end
	local buff_1 = buffer.create(var1855)
	buffer.copy(buff_1, 0, buff, 0, var1855)
	
	return buff_1
end

function t_54.decode(p110)
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1860 = t_54.new()
	local var1861 = 0
	while var1861 < buffer.len(p110) do
		local _ = nil
		local var1862 = nil
		local var1863, var1864, var1865 = protoModule.readTag(p110, var1861)
		local var1866 = var1863
		var1862 = var1864
		var1861 = var1865
		
		if var1862 == protoModule.wireTypes.varint then
			local _ = nil
			local var1867, var1868 = protoModule.readVarInt(p110, var1861)
			local _ = var1867
			var1861 = var1868
			continue
		end
		if var1862 == protoModule.wireTypes.lengthDelimited then
			if var1866 == 1 then
				local _ = nil
				local var1869, var1870 = protoModule.readBuffer(p110, var1861)
				var1861 = var1870
				table.insert(var1860.options, t.UDimProp_ConditionalOption.decode(var1869))
			else
				local _ = nil
				local var1871, var1872 = protoModule.readVarInt(p110, var1861)
				var1861 = var1872 + var1871
			end
		elseif var1862 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1873, var1874 = protoModule.readFixed32(p110, var1861)
			local _ = var1873
			var1861 = var1874
		elseif var1862 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1875, var1876 = protoModule.readFixed64(p110, var1861)
			local _ = var1875
			var1861 = var1876
		else
			error("Unsupported wire type: " .. var1862)
		end
	end
	return var1860
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
	local var1879 = t_54.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDimProp_ConditionalOption.jsonDecode(v))
		end
		var1879.options = t_1
	end
	return var1879
end

t_54.descriptor = {
	name = "UDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDimProp_ConditionalOptions = t_54
typeRegistryModule.default:register(t.UDimProp_ConditionalOptions)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p111)
	-- upvalues: t_55 (ref)
	return setmetatable({
		kind = if p111 == nil or p111.kind == nil then nil else p111.kind
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1882 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1883, var1884 = protoModule.writeTag(buff, var1882, 1, protoModule.wireTypes.lengthDelimited)
			var1883, var1884 = protoModule.writeString(var1883, var1884, self.kind.value)
			buff = var1883
			var1882 = var1884
		elseif self.kind.type == "token" then
			local var1885, var1886 = protoModule.writeTag(buff, var1882, 2, protoModule.wireTypes.lengthDelimited)
			var1885, var1886 = protoModule.writeString(var1885, var1886, self.kind.value)
			buff = var1885
			var1882 = var1886
		elseif self.kind.type == "conditional" then
			local var1887 = self.kind.value:encode()
			local var1888, var1889 = protoModule.writeTag(buff, var1882, 3, protoModule.wireTypes.lengthDelimited)
			var1888, var1889 = protoModule.writeBuffer(var1888, var1889, var1887, buffer.len(var1887))
			buff = var1888
			var1882 = var1889
		elseif self.kind.type == "binding_path" then
			local var1890, var1891 = protoModule.writeTag(buff, var1882, 4, protoModule.wireTypes.lengthDelimited)
			var1890, var1891 = protoModule.writeString(var1890, var1891, self.kind.value)
			buff = var1890
			var1882 = var1891
		end
	end
	local buff_1 = buffer.create(var1882)
	buffer.copy(buff_1, 0, buff, 0, var1882)
	
	return buff_1
end

function t_55.decode(p112)
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1893 = t_55.new()
	local var1894 = 0
	while var1894 < buffer.len(p112) do
		local _ = nil
		local var1895 = nil
		local var1896, var1897, var1898 = protoModule.readTag(p112, var1894)
		local var1899 = var1896
		var1895 = var1897
		var1894 = var1898
		
		if var1895 == protoModule.wireTypes.varint then
			local _ = nil
			local var1900, var1901 = protoModule.readVarInt(p112, var1894)
			local _ = var1900
			var1894 = var1901
			continue
		end
		if var1895 == protoModule.wireTypes.lengthDelimited then
			if var1899 == 1 then
				local _ = nil
				local var1902, var1903 = protoModule.readBuffer(p112, var1894)
				var1894 = var1903
				var1893.kind = { type = "literal", value = buffer.tostring(var1902) }
			elseif var1899 == 2 then
				local _ = nil
				local var1904, var1905 = protoModule.readBuffer(p112, var1894)
				var1894 = var1905
				var1893.kind = { type = "token", value = buffer.tostring(var1904) }
			elseif var1899 == 3 then
				local _ = nil
				local var1906, var1907 = protoModule.readBuffer(p112, var1894)
				var1894 = var1907
				var1893.kind = {
					type = "conditional",
					value = t.UDim2Prop_ConditionalOptions.decode(var1906)
				}
			elseif var1899 == 4 then
				local _ = nil
				local var1908, var1909 = protoModule.readBuffer(p112, var1894)
				var1894 = var1909
				var1893.kind = { type = "binding_path", value = buffer.tostring(var1908) }
			else
				local _ = nil
				local var1910, var1911 = protoModule.readVarInt(p112, var1894)
				var1894 = var1911 + var1910
			end
		elseif var1895 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1912, var1913 = protoModule.readFixed32(p112, var1894)
			local _ = var1912
			var1894 = var1913
		elseif var1895 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1914, var1915 = protoModule.readFixed64(p112, var1894)
			local _ = var1914
			var1894 = var1915
		else
			error("Unsupported wire type: " .. var1895)
		end
	end
	return var1893
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
	local var1917 = t_55.new()
	
	if self.literal ~= nil then
		var1917.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1917.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1917.kind = {
			type = "conditional",
			value = t.UDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1917.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1917.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1917
end

t_55.descriptor = {
	name = "UDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
}
t.UDim2Prop = t_55
typeRegistryModule.default:register(t.UDim2Prop)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p113)
	-- upvalues: t_56 (ref)
	return setmetatable({
		condition = if p113 == nil or p113.condition == nil then nil else p113.condition,
		kind = if p113 == nil or p113.kind == nil then nil else p113.kind
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1919 = 0
	
	if self.condition ~= nil then
		local var1920 = self.condition:encode()
		local var1921, var1922 = protoModule.writeTag(buff, var1919, 1, protoModule.wireTypes.lengthDelimited)
		var1921, var1922 = protoModule.writeBuffer(var1921, var1922, var1920, buffer.len(var1920))
		buff = var1921
		var1919 = var1922
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1923, var1924 = protoModule.writeTag(buff, var1919, 2, protoModule.wireTypes.lengthDelimited)
			var1923, var1924 = protoModule.writeString(var1923, var1924, self.kind.value)
			buff = var1923
			var1919 = var1924
		elseif self.kind.type == "token" then
			local var1925, var1926 = protoModule.writeTag(buff, var1919, 3, protoModule.wireTypes.lengthDelimited)
			var1925, var1926 = protoModule.writeString(var1925, var1926, self.kind.value)
			buff = var1925
			var1919 = var1926
		elseif self.kind.type == "binding_path" then
			local var1927, var1928 = protoModule.writeTag(buff, var1919, 4, protoModule.wireTypes.lengthDelimited)
			var1927, var1928 = protoModule.writeString(var1927, var1928, self.kind.value)
			buff = var1927
			var1919 = var1928
		end
	end
	local buff_1 = buffer.create(var1919)
	buffer.copy(buff_1, 0, buff, 0, var1919)
	
	return buff_1
end

function t_56.decode(p114)
	-- upvalues: t_56 (ref), protoModule (ref), propConditionModule (ref)
	local var1930 = t_56.new()
	local var1931 = 0
	while var1931 < buffer.len(p114) do
		local _ = nil
		local var1932 = nil
		local var1933, var1934, var1935 = protoModule.readTag(p114, var1931)
		local var1936 = var1933
		var1932 = var1934
		var1931 = var1935
		
		if var1932 == protoModule.wireTypes.varint then
			local _ = nil
			local var1937, var1938 = protoModule.readVarInt(p114, var1931)
			local _ = var1937
			var1931 = var1938
			continue
		end
		if var1932 == protoModule.wireTypes.lengthDelimited then
			if var1936 == 1 then
				local _ = nil
				local var1939, var1940 = protoModule.readBuffer(p114, var1931)
				var1931 = var1940
				var1930.condition = propConditionModule.PropCondition.decode(var1939)
			elseif var1936 == 2 then
				local _ = nil
				local var1941, var1942 = protoModule.readBuffer(p114, var1931)
				var1931 = var1942
				var1930.kind = { type = "literal", value = buffer.tostring(var1941) }
			elseif var1936 == 3 then
				local _ = nil
				local var1943, var1944 = protoModule.readBuffer(p114, var1931)
				var1931 = var1944
				var1930.kind = { type = "token", value = buffer.tostring(var1943) }
			elseif var1936 == 4 then
				local _ = nil
				local var1945, var1946 = protoModule.readBuffer(p114, var1931)
				var1931 = var1946
				var1930.kind = { type = "binding_path", value = buffer.tostring(var1945) }
			else
				local _ = nil
				local var1947, var1948 = protoModule.readVarInt(p114, var1931)
				var1931 = var1948 + var1947
			end
		elseif var1932 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1949, var1950 = protoModule.readFixed32(p114, var1931)
			local _ = var1949
			var1931 = var1950
		elseif var1932 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1951, var1952 = protoModule.readFixed64(p114, var1931)
			local _ = var1951
			var1931 = var1952
		else
			error("Unsupported wire type: " .. var1932)
		end
	end
	return var1930
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
	local var1954 = t_56.new()
	
	if self.condition ~= nil then
		var1954.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1954.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1954.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1954.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1954.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1954
end

t_56.descriptor = {
	name = "UDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDim2Prop_ConditionalOption = t_56
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOption)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p115)
	-- upvalues: t_57 (ref)
	return setmetatable({
		options = if p115 == nil or p115.options == nil then {} else p115.options
	}, t_57)
end

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1956 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1957 = v:encode()
			local var1958, var1959 = protoModule.writeTag(buff, var1956, 1, protoModule.wireTypes.lengthDelimited)
			var1958, var1959 = protoModule.writeBuffer(var1958, var1959, var1957, buffer.len(var1957))
			buff = var1958
			var1956 = var1959
		end
	end
	local buff_1 = buffer.create(var1956)
	buffer.copy(buff_1, 0, buff, 0, var1956)
	
	return buff_1
end

function t_57.decode(p116)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1961 = t_57.new()
	local var1962 = 0
	while var1962 < buffer.len(p116) do
		local _ = nil
		local var1963 = nil
		local var1964, var1965, var1966 = protoModule.readTag(p116, var1962)
		local var1967 = var1964
		var1963 = var1965
		var1962 = var1966
		
		if var1963 == protoModule.wireTypes.varint then
			local _ = nil
			local var1968, var1969 = protoModule.readVarInt(p116, var1962)
			local _ = var1968
			var1962 = var1969
			continue
		end
		if var1963 == protoModule.wireTypes.lengthDelimited then
			if var1967 == 1 then
				local _ = nil
				local var1970, var1971 = protoModule.readBuffer(p116, var1962)
				var1962 = var1971
				table.insert(var1961.options, t.UDim2Prop_ConditionalOption.decode(var1970))
			else
				local _ = nil
				local var1972, var1973 = protoModule.readVarInt(p116, var1962)
				var1962 = var1973 + var1972
			end
		elseif var1963 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1974, var1975 = protoModule.readFixed32(p116, var1962)
			local _ = var1974
			var1962 = var1975
		elseif var1963 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1976, var1977 = protoModule.readFixed64(p116, var1962)
			local _ = var1976
			var1962 = var1977
		else
			error("Unsupported wire type: " .. var1963)
		end
	end
	return var1961
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
	local var1980 = t_57.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var1980.options = t_1
	end
	return var1980
end

t_57.descriptor = {
	name = "UDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDim2Prop_ConditionalOptions = t_57
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOptions)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p117)
	-- upvalues: t_58 (ref)
	return setmetatable({
		kind = if p117 == nil or p117.kind == nil then nil else p117.kind
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1983 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1984, var1985 = protoModule.writeTag(buff, var1983, 1, protoModule.wireTypes.lengthDelimited)
			var1984, var1985 = protoModule.writeString(var1984, var1985, self.kind.value)
			buff = var1984
			var1983 = var1985
		elseif self.kind.type == "token" then
			local var1986, var1987 = protoModule.writeTag(buff, var1983, 2, protoModule.wireTypes.lengthDelimited)
			var1986, var1987 = protoModule.writeString(var1986, var1987, self.kind.value)
			buff = var1986
			var1983 = var1987
		elseif self.kind.type == "conditional" then
			local var1988 = self.kind.value:encode()
			local var1989, var1990 = protoModule.writeTag(buff, var1983, 3, protoModule.wireTypes.lengthDelimited)
			var1989, var1990 = protoModule.writeBuffer(var1989, var1990, var1988, buffer.len(var1988))
			buff = var1989
			var1983 = var1990
		elseif self.kind.type == "binding_path" then
			local var1991, var1992 = protoModule.writeTag(buff, var1983, 4, protoModule.wireTypes.lengthDelimited)
			var1991, var1992 = protoModule.writeString(var1991, var1992, self.kind.value)
			buff = var1991
			var1983 = var1992
		end
	end
	local buff_1 = buffer.create(var1983)
	buffer.copy(buff_1, 0, buff, 0, var1983)
	
	return buff_1
end

function t_58.decode(p118)
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1994 = t_58.new()
	local var1995 = 0
	while var1995 < buffer.len(p118) do
		local _ = nil
		local var1996 = nil
		local var1997, var1998, var1999 = protoModule.readTag(p118, var1995)
		local var2000 = var1997
		var1996 = var1998
		var1995 = var1999
		
		if var1996 == protoModule.wireTypes.varint then
			local _ = nil
			local var2001, var2002 = protoModule.readVarInt(p118, var1995)
			local _ = var2001
			var1995 = var2002
			continue
		end
		if var1996 == protoModule.wireTypes.lengthDelimited then
			if var2000 == 1 then
				local _ = nil
				local var2003, var2004 = protoModule.readBuffer(p118, var1995)
				var1995 = var2004
				var1994.kind = { type = "literal", value = buffer.tostring(var2003) }
			elseif var2000 == 2 then
				local _ = nil
				local var2005, var2006 = protoModule.readBuffer(p118, var1995)
				var1995 = var2006
				var1994.kind = { type = "token", value = buffer.tostring(var2005) }
			elseif var2000 == 3 then
				local _ = nil
				local var2007, var2008 = protoModule.readBuffer(p118, var1995)
				var1995 = var2008
				var1994.kind = {
					type = "conditional",
					value = t.Vector2Prop_ConditionalOptions.decode(var2007)
				}
			elseif var2000 == 4 then
				local _ = nil
				local var2009, var2010 = protoModule.readBuffer(p118, var1995)
				var1995 = var2010
				var1994.kind = { type = "binding_path", value = buffer.tostring(var2009) }
			else
				local _ = nil
				local var2011, var2012 = protoModule.readVarInt(p118, var1995)
				var1995 = var2012 + var2011
			end
		elseif var1996 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2013, var2014 = protoModule.readFixed32(p118, var1995)
			local _ = var2013
			var1995 = var2014
		elseif var1996 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2015, var2016 = protoModule.readFixed64(p118, var1995)
			local _ = var2015
			var1995 = var2016
		else
			error("Unsupported wire type: " .. var1996)
		end
	end
	return var1994
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
	local var2018 = t_58.new()
	
	if self.literal ~= nil then
		var2018.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2018.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2018.kind = {
			type = "conditional",
			value = t.Vector2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2018.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2018.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2018
end

t_58.descriptor = {
	name = "Vector2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
}
t.Vector2Prop = t_58
typeRegistryModule.default:register(t.Vector2Prop)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p119)
	-- upvalues: t_59 (ref)
	return setmetatable({
		condition = if p119 == nil or p119.condition == nil then nil else p119.condition,
		kind = if p119 == nil or p119.kind == nil then nil else p119.kind
	}, t_59)
end

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2020 = 0
	
	if self.condition ~= nil then
		local var2021 = self.condition:encode()
		local var2022, var2023 = protoModule.writeTag(buff, var2020, 1, protoModule.wireTypes.lengthDelimited)
		var2022, var2023 = protoModule.writeBuffer(var2022, var2023, var2021, buffer.len(var2021))
		buff = var2022
		var2020 = var2023
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2024, var2025 = protoModule.writeTag(buff, var2020, 2, protoModule.wireTypes.lengthDelimited)
			var2024, var2025 = protoModule.writeString(var2024, var2025, self.kind.value)
			buff = var2024
			var2020 = var2025
		elseif self.kind.type == "token" then
			local var2026, var2027 = protoModule.writeTag(buff, var2020, 3, protoModule.wireTypes.lengthDelimited)
			var2026, var2027 = protoModule.writeString(var2026, var2027, self.kind.value)
			buff = var2026
			var2020 = var2027
		elseif self.kind.type == "binding_path" then
			local var2028, var2029 = protoModule.writeTag(buff, var2020, 4, protoModule.wireTypes.lengthDelimited)
			var2028, var2029 = protoModule.writeString(var2028, var2029, self.kind.value)
			buff = var2028
			var2020 = var2029
		end
	end
	local buff_1 = buffer.create(var2020)
	buffer.copy(buff_1, 0, buff, 0, var2020)
	
	return buff_1
end

function t_59.decode(p120)
	-- upvalues: t_59 (ref), protoModule (ref), propConditionModule (ref)
	local var2031 = t_59.new()
	local var2032 = 0
	while var2032 < buffer.len(p120) do
		local _ = nil
		local var2033 = nil
		local var2034, var2035, var2036 = protoModule.readTag(p120, var2032)
		local var2037 = var2034
		var2033 = var2035
		var2032 = var2036
		
		if var2033 == protoModule.wireTypes.varint then
			local _ = nil
			local var2038, var2039 = protoModule.readVarInt(p120, var2032)
			local _ = var2038
			var2032 = var2039
			continue
		end
		if var2033 == protoModule.wireTypes.lengthDelimited then
			if var2037 == 1 then
				local _ = nil
				local var2040, var2041 = protoModule.readBuffer(p120, var2032)
				var2032 = var2041
				var2031.condition = propConditionModule.PropCondition.decode(var2040)
			elseif var2037 == 2 then
				local _ = nil
				local var2042, var2043 = protoModule.readBuffer(p120, var2032)
				var2032 = var2043
				var2031.kind = { type = "literal", value = buffer.tostring(var2042) }
			elseif var2037 == 3 then
				local _ = nil
				local var2044, var2045 = protoModule.readBuffer(p120, var2032)
				var2032 = var2045
				var2031.kind = { type = "token", value = buffer.tostring(var2044) }
			elseif var2037 == 4 then
				local _ = nil
				local var2046, var2047 = protoModule.readBuffer(p120, var2032)
				var2032 = var2047
				var2031.kind = { type = "binding_path", value = buffer.tostring(var2046) }
			else
				local _ = nil
				local var2048, var2049 = protoModule.readVarInt(p120, var2032)
				var2032 = var2049 + var2048
			end
		elseif var2033 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2050, var2051 = protoModule.readFixed32(p120, var2032)
			local _ = var2050
			var2032 = var2051
		elseif var2033 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2052, var2053 = protoModule.readFixed64(p120, var2032)
			local _ = var2052
			var2032 = var2053
		else
			error("Unsupported wire type: " .. var2033)
		end
	end
	return var2031
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
	local var2055 = t_59.new()
	
	if self.condition ~= nil then
		var2055.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2055.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2055.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2055.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2055.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2055
end

t_59.descriptor = {
	name = "Vector2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Vector2Prop_ConditionalOption = t_59
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOption)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p121)
	-- upvalues: t_60 (ref)
	return setmetatable({
		options = if p121 == nil or p121.options == nil then {} else p121.options
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2057 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2058 = v:encode()
			local var2059, var2060 = protoModule.writeTag(buff, var2057, 1, protoModule.wireTypes.lengthDelimited)
			var2059, var2060 = protoModule.writeBuffer(var2059, var2060, var2058, buffer.len(var2058))
			buff = var2059
			var2057 = var2060
		end
	end
	local buff_1 = buffer.create(var2057)
	buffer.copy(buff_1, 0, buff, 0, var2057)
	
	return buff_1
end

function t_60.decode(p122)
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var2062 = t_60.new()
	local var2063 = 0
	while var2063 < buffer.len(p122) do
		local _ = nil
		local var2064 = nil
		local var2065, var2066, var2067 = protoModule.readTag(p122, var2063)
		local var2068 = var2065
		var2064 = var2066
		var2063 = var2067
		
		if var2064 == protoModule.wireTypes.varint then
			local _ = nil
			local var2069, var2070 = protoModule.readVarInt(p122, var2063)
			local _ = var2069
			var2063 = var2070
			continue
		end
		if var2064 == protoModule.wireTypes.lengthDelimited then
			if var2068 == 1 then
				local _ = nil
				local var2071, var2072 = protoModule.readBuffer(p122, var2063)
				var2063 = var2072
				table.insert(var2062.options, t.Vector2Prop_ConditionalOption.decode(var2071))
			else
				local _ = nil
				local var2073, var2074 = protoModule.readVarInt(p122, var2063)
				var2063 = var2074 + var2073
			end
		elseif var2064 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2075, var2076 = protoModule.readFixed32(p122, var2063)
			local _ = var2075
			var2063 = var2076
		elseif var2064 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2077, var2078 = protoModule.readFixed64(p122, var2063)
			local _ = var2077
			var2063 = var2078
		else
			error("Unsupported wire type: " .. var2064)
		end
	end
	return var2062
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
	local var2081 = t_60.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Vector2Prop_ConditionalOption.jsonDecode(v))
		end
		var2081.options = t_1
	end
	return var2081
end

t_60.descriptor = {
	name = "Vector2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Vector2Prop_ConditionalOptions = t_60
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOptions)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p123)
	-- upvalues: t_61 (ref)
	return setmetatable({
		kind = if p123 == nil or p123.kind == nil then nil else p123.kind
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2084 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2085, var2086 = protoModule.writeTag(buff, var2084, 1, protoModule.wireTypes.lengthDelimited)
			var2085, var2086 = protoModule.writeString(var2085, var2086, self.kind.value)
			buff = var2085
			var2084 = var2086
		elseif self.kind.type == "binding_path" then
			local var2087, var2088 = protoModule.writeTag(buff, var2084, 2, protoModule.wireTypes.lengthDelimited)
			var2087, var2088 = protoModule.writeString(var2087, var2088, self.kind.value)
			buff = var2087
			var2084 = var2088
		elseif self.kind.type == "conditional" then
			local var2089 = self.kind.value:encode()
			local var2090, var2091 = protoModule.writeTag(buff, var2084, 3, protoModule.wireTypes.lengthDelimited)
			var2090, var2091 = protoModule.writeBuffer(var2090, var2091, var2089, buffer.len(var2089))
			buff = var2090
			var2084 = var2091
		end
	end
	local buff_1 = buffer.create(var2084)
	buffer.copy(buff_1, 0, buff, 0, var2084)
	
	return buff_1
end

function t_61.decode(p124)
	-- upvalues: t_61 (ref), protoModule (ref), t (ref)
	local var2093 = t_61.new()
	local var2094 = 0
	while var2094 < buffer.len(p124) do
		local _ = nil
		local var2095 = nil
		local var2096, var2097, var2098 = protoModule.readTag(p124, var2094)
		local var2099 = var2096
		var2095 = var2097
		var2094 = var2098
		
		if var2095 == protoModule.wireTypes.varint then
			local _ = nil
			local var2100, var2101 = protoModule.readVarInt(p124, var2094)
			local _ = var2100
			var2094 = var2101
			continue
		end
		if var2095 == protoModule.wireTypes.lengthDelimited then
			if var2099 == 1 then
				local _ = nil
				local var2102, var2103 = protoModule.readBuffer(p124, var2094)
				var2094 = var2103
				var2093.kind = { type = "literal", value = buffer.tostring(var2102) }
			elseif var2099 == 2 then
				local _ = nil
				local var2104, var2105 = protoModule.readBuffer(p124, var2094)
				var2094 = var2105
				var2093.kind = { type = "binding_path", value = buffer.tostring(var2104) }
			elseif var2099 == 3 then
				local _ = nil
				local var2106, var2107 = protoModule.readBuffer(p124, var2094)
				var2094 = var2107
				var2093.kind = {
					type = "conditional",
					value = t.IconProp_ConditionalOptions.decode(var2106)
				}
			else
				local _ = nil
				local var2108, var2109 = protoModule.readVarInt(p124, var2094)
				var2094 = var2109 + var2108
			end
		elseif var2095 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2110, var2111 = protoModule.readFixed32(p124, var2094)
			local _ = var2110
			var2094 = var2111
		elseif var2095 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2112, var2113 = protoModule.readFixed64(p124, var2094)
			local _ = var2112
			var2094 = var2113
		else
			error("Unsupported wire type: " .. var2095)
		end
	end
	return var2093
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
	local var2115 = t_61.new()
	
	if self.literal ~= nil then
		var2115.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var2115.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2115.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2115.kind = {
			type = "conditional",
			value = t.IconProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2115
end

t_61.descriptor = {
	name = "IconProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
}
t.IconProp = t_61
typeRegistryModule.default:register(t.IconProp)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p125)
	-- upvalues: t_62 (ref)
	return setmetatable({
		condition = if p125 == nil or p125.condition == nil then nil else p125.condition,
		kind = if p125 == nil or p125.kind == nil then nil else p125.kind
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2117 = 0
	
	if self.condition ~= nil then
		local var2118 = self.condition:encode()
		local var2119, var2120 = protoModule.writeTag(buff, var2117, 1, protoModule.wireTypes.lengthDelimited)
		var2119, var2120 = protoModule.writeBuffer(var2119, var2120, var2118, buffer.len(var2118))
		buff = var2119
		var2117 = var2120
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2121, var2122 = protoModule.writeTag(buff, var2117, 2, protoModule.wireTypes.lengthDelimited)
			var2121, var2122 = protoModule.writeString(var2121, var2122, self.kind.value)
			buff = var2121
			var2117 = var2122
		elseif self.kind.type == "binding_path" then
			local var2123, var2124 = protoModule.writeTag(buff, var2117, 3, protoModule.wireTypes.lengthDelimited)
			var2123, var2124 = protoModule.writeString(var2123, var2124, self.kind.value)
			buff = var2123
			var2117 = var2124
		end
	end
	local buff_1 = buffer.create(var2117)
	buffer.copy(buff_1, 0, buff, 0, var2117)
	
	return buff_1
end

function t_62.decode(p126)
	-- upvalues: t_62 (ref), protoModule (ref), propConditionModule (ref)
	local var2126 = t_62.new()
	local var2127 = 0
	while var2127 < buffer.len(p126) do
		local _ = nil
		local var2128 = nil
		local var2129, var2130, var2131 = protoModule.readTag(p126, var2127)
		local var2132 = var2129
		var2128 = var2130
		var2127 = var2131
		
		if var2128 == protoModule.wireTypes.varint then
			local _ = nil
			local var2133, var2134 = protoModule.readVarInt(p126, var2127)
			local _ = var2133
			var2127 = var2134
			continue
		end
		if var2128 == protoModule.wireTypes.lengthDelimited then
			if var2132 == 1 then
				local _ = nil
				local var2135, var2136 = protoModule.readBuffer(p126, var2127)
				var2127 = var2136
				var2126.condition = propConditionModule.PropCondition.decode(var2135)
			elseif var2132 == 2 then
				local _ = nil
				local var2137, var2138 = protoModule.readBuffer(p126, var2127)
				var2127 = var2138
				var2126.kind = { type = "literal", value = buffer.tostring(var2137) }
			elseif var2132 == 3 then
				local _ = nil
				local var2139, var2140 = protoModule.readBuffer(p126, var2127)
				var2127 = var2140
				var2126.kind = { type = "binding_path", value = buffer.tostring(var2139) }
			else
				local _ = nil
				local var2141, var2142 = protoModule.readVarInt(p126, var2127)
				var2127 = var2142 + var2141
			end
		elseif var2128 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2143, var2144 = protoModule.readFixed32(p126, var2127)
			local _ = var2143
			var2127 = var2144
		elseif var2128 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2145, var2146 = protoModule.readFixed64(p126, var2127)
			local _ = var2145
			var2127 = var2146
		else
			error("Unsupported wire type: " .. var2128)
		end
	end
	return var2126
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
	local var2148 = t_62.new()
	
	if self.condition ~= nil then
		var2148.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2148.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var2148.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2148.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2148
end

t_62.descriptor = {
	name = "IconProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.IconProp_ConditionalOption = t_62
typeRegistryModule.default:register(t.IconProp_ConditionalOption)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p127)
	-- upvalues: t_63 (ref)
	return setmetatable({
		options = if p127 == nil or p127.options == nil then {} else p127.options
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2150 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2151 = v:encode()
			local var2152, var2153 = protoModule.writeTag(buff, var2150, 1, protoModule.wireTypes.lengthDelimited)
			var2152, var2153 = protoModule.writeBuffer(var2152, var2153, var2151, buffer.len(var2151))
			buff = var2152
			var2150 = var2153
		end
	end
	local buff_1 = buffer.create(var2150)
	buffer.copy(buff_1, 0, buff, 0, var2150)
	
	return buff_1
end

function t_63.decode(p128)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2155 = t_63.new()
	local var2156 = 0
	while var2156 < buffer.len(p128) do
		local _ = nil
		local var2157 = nil
		local var2158, var2159, var2160 = protoModule.readTag(p128, var2156)
		local var2161 = var2158
		var2157 = var2159
		var2156 = var2160
		
		if var2157 == protoModule.wireTypes.varint then
			local _ = nil
			local var2162, var2163 = protoModule.readVarInt(p128, var2156)
			local _ = var2162
			var2156 = var2163
			continue
		end
		if var2157 == protoModule.wireTypes.lengthDelimited then
			if var2161 == 1 then
				local _ = nil
				local var2164, var2165 = protoModule.readBuffer(p128, var2156)
				var2156 = var2165
				table.insert(var2155.options, t.IconProp_ConditionalOption.decode(var2164))
			else
				local _ = nil
				local var2166, var2167 = protoModule.readVarInt(p128, var2156)
				var2156 = var2167 + var2166
			end
		elseif var2157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2168, var2169 = protoModule.readFixed32(p128, var2156)
			local _ = var2168
			var2156 = var2169
		elseif var2157 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2170, var2171 = protoModule.readFixed64(p128, var2156)
			local _ = var2170
			var2156 = var2171
		else
			error("Unsupported wire type: " .. var2157)
		end
	end
	return var2155
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
	local var2174 = t_63.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.IconProp_ConditionalOption.jsonDecode(v))
		end
		var2174.options = t_1
	end
	return var2174
end

t_63.descriptor = {
	name = "IconProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.IconProp_ConditionalOptions = t_63
typeRegistryModule.default:register(t.IconProp_ConditionalOptions)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p129)
	-- upvalues: t_64 (ref)
	return setmetatable({
		kind = if p129 == nil or p129.kind == nil then nil else p129.kind
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2177 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2178 = self.kind.value:encode()
			local var2179, var2180 = protoModule.writeTag(buff, var2177, 1, protoModule.wireTypes.lengthDelimited)
			var2179, var2180 = protoModule.writeBuffer(var2179, var2180, var2178, buffer.len(var2178))
			buff = var2179
			var2177 = var2180
		elseif self.kind.type == "binding_path" then
			local var2181, var2182 = protoModule.writeTag(buff, var2177, 2, protoModule.wireTypes.lengthDelimited)
			var2181, var2182 = protoModule.writeString(var2181, var2182, self.kind.value)
			buff = var2181
			var2177 = var2182
		elseif self.kind.type == "conditional" then
			local var2183 = self.kind.value:encode()
			local var2184, var2185 = protoModule.writeTag(buff, var2177, 3, protoModule.wireTypes.lengthDelimited)
			var2184, var2185 = protoModule.writeBuffer(var2184, var2185, var2183, buffer.len(var2183))
			buff = var2184
			var2177 = var2185
		end
	end
	local buff_1 = buffer.create(var2177)
	buffer.copy(buff_1, 0, buff, 0, var2177)
	
	return buff_1
end

function t_64.decode(p130)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2187 = t_64.new()
	local var2188 = 0
	while var2188 < buffer.len(p130) do
		local _ = nil
		local var2189 = nil
		local var2190, var2191, var2192 = protoModule.readTag(p130, var2188)
		local var2193 = var2190
		var2189 = var2191
		var2188 = var2192
		
		if var2189 == protoModule.wireTypes.varint then
			local _ = nil
			local var2194, var2195 = protoModule.readVarInt(p130, var2188)
			local _ = var2194
			var2188 = var2195
			continue
		end
		if var2189 == protoModule.wireTypes.lengthDelimited then
			if var2193 == 1 then
				local _ = nil
				local var2196, var2197 = protoModule.readBuffer(p130, var2188)
				var2188 = var2197
				var2187.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var2196)
				}
			elseif var2193 == 2 then
				local _ = nil
				local var2198, var2199 = protoModule.readBuffer(p130, var2188)
				var2188 = var2199
				var2187.kind = { type = "binding_path", value = buffer.tostring(var2198) }
			elseif var2193 == 3 then
				local _ = nil
				local var2200, var2201 = protoModule.readBuffer(p130, var2188)
				var2188 = var2201
				var2187.kind = {
					type = "conditional",
					value = t.FoundationIconConfigProp_ConditionalOptions.decode(var2200)
				}
			else
				local _ = nil
				local var2202, var2203 = protoModule.readVarInt(p130, var2188)
				var2188 = var2203 + var2202
			end
		elseif var2189 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2204, var2205 = protoModule.readFixed32(p130, var2188)
			local _ = var2204
			var2188 = var2205
		elseif var2189 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2206, var2207 = protoModule.readFixed64(p130, var2188)
			local _ = var2206
			var2188 = var2207
		else
			error("Unsupported wire type: " .. var2189)
		end
	end
	return var2187
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
	local var2209 = t_64.new()
	
	if self.literal ~= nil then
		var2209.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2209.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2209.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2209.kind = {
			type = "conditional",
			value = t.FoundationIconConfigProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2209
end

t_64.descriptor = {
	name = "FoundationIconConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfigProp"
}
t.FoundationIconConfigProp = t_64
typeRegistryModule.default:register(t.FoundationIconConfigProp)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p131)
	-- upvalues: t_65 (ref)
	return setmetatable({
		condition = if p131 == nil or p131.condition == nil then nil else p131.condition,
		kind = if p131 == nil or p131.kind == nil then nil else p131.kind
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2211 = 0
	
	if self.condition ~= nil then
		local var2212 = self.condition:encode()
		local var2213, var2214 = protoModule.writeTag(buff, var2211, 1, protoModule.wireTypes.lengthDelimited)
		var2213, var2214 = protoModule.writeBuffer(var2213, var2214, var2212, buffer.len(var2212))
		buff = var2213
		var2211 = var2214
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2215 = self.kind.value:encode()
			local var2216, var2217 = protoModule.writeTag(buff, var2211, 2, protoModule.wireTypes.lengthDelimited)
			var2216, var2217 = protoModule.writeBuffer(var2216, var2217, var2215, buffer.len(var2215))
			buff = var2216
			var2211 = var2217
		elseif self.kind.type == "binding_path" then
			local var2218, var2219 = protoModule.writeTag(buff, var2211, 3, protoModule.wireTypes.lengthDelimited)
			var2218, var2219 = protoModule.writeString(var2218, var2219, self.kind.value)
			buff = var2218
			var2211 = var2219
		end
	end
	local buff_1 = buffer.create(var2211)
	buffer.copy(buff_1, 0, buff, 0, var2211)
	
	return buff_1
end

function t_65.decode(p132)
	-- upvalues: t_65 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2221 = t_65.new()
	local var2222 = 0
	while var2222 < buffer.len(p132) do
		local _ = nil
		local var2223 = nil
		local var2224, var2225, var2226 = protoModule.readTag(p132, var2222)
		local var2227 = var2224
		var2223 = var2225
		var2222 = var2226
		
		if var2223 == protoModule.wireTypes.varint then
			local _ = nil
			local var2228, var2229 = protoModule.readVarInt(p132, var2222)
			local _ = var2228
			var2222 = var2229
			continue
		end
		if var2223 == protoModule.wireTypes.lengthDelimited then
			if var2227 == 1 then
				local _ = nil
				local var2230, var2231 = protoModule.readBuffer(p132, var2222)
				var2222 = var2231
				var2221.condition = propConditionModule.PropCondition.decode(var2230)
			elseif var2227 == 2 then
				local _ = nil
				local var2232, var2233 = protoModule.readBuffer(p132, var2222)
				var2222 = var2233
				var2221.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var2232)
				}
			elseif var2227 == 3 then
				local _ = nil
				local var2234, var2235 = protoModule.readBuffer(p132, var2222)
				var2222 = var2235
				var2221.kind = { type = "binding_path", value = buffer.tostring(var2234) }
			else
				local _ = nil
				local var2236, var2237 = protoModule.readVarInt(p132, var2222)
				var2222 = var2237 + var2236
			end
		elseif var2223 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2238, var2239 = protoModule.readFixed32(p132, var2222)
			local _ = var2238
			var2222 = var2239
		elseif var2223 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2240, var2241 = protoModule.readFixed64(p132, var2222)
			local _ = var2240
			var2222 = var2241
		else
			error("Unsupported wire type: " .. var2223)
		end
	end
	return var2221
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
	local var2243 = t_65.new()
	
	if self.condition ~= nil then
		var2243.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2243.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2243.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2243.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2243
end

t_65.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FoundationIconConfigProp_ConditionalOption = t_65
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOption)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p133)
	-- upvalues: t_66 (ref)
	return setmetatable({
		options = if p133 == nil or p133.options == nil then {} else p133.options
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2245 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2246 = v:encode()
			local var2247, var2248 = protoModule.writeTag(buff, var2245, 1, protoModule.wireTypes.lengthDelimited)
			var2247, var2248 = protoModule.writeBuffer(var2247, var2248, var2246, buffer.len(var2246))
			buff = var2247
			var2245 = var2248
		end
	end
	local buff_1 = buffer.create(var2245)
	buffer.copy(buff_1, 0, buff, 0, var2245)
	
	return buff_1
end

function t_66.decode(p134)
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var2250 = t_66.new()
	local var2251 = 0
	while var2251 < buffer.len(p134) do
		local _ = nil
		local var2252 = nil
		local var2253, var2254, var2255 = protoModule.readTag(p134, var2251)
		local var2256 = var2253
		var2252 = var2254
		var2251 = var2255
		
		if var2252 == protoModule.wireTypes.varint then
			local _ = nil
			local var2257, var2258 = protoModule.readVarInt(p134, var2251)
			local _ = var2257
			var2251 = var2258
			continue
		end
		if var2252 == protoModule.wireTypes.lengthDelimited then
			if var2256 == 1 then
				local _ = nil
				local var2259, var2260 = protoModule.readBuffer(p134, var2251)
				var2251 = var2260
				table.insert(var2250.options, t.FoundationIconConfigProp_ConditionalOption.decode(var2259))
			else
				local _ = nil
				local var2261, var2262 = protoModule.readVarInt(p134, var2251)
				var2251 = var2262 + var2261
			end
		elseif var2252 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2263, var2264 = protoModule.readFixed32(p134, var2251)
			local _ = var2263
			var2251 = var2264
		elseif var2252 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2265, var2266 = protoModule.readFixed64(p134, var2251)
			local _ = var2265
			var2251 = var2266
		else
			error("Unsupported wire type: " .. var2252)
		end
	end
	return var2250
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
	local var2269 = t_66.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FoundationIconConfigProp_ConditionalOption.jsonDecode(v))
		end
		var2269.options = t_1
	end
	return var2269
end

t_66.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FoundationIconConfigProp_ConditionalOptions = t_66
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOptions)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p135)
	-- upvalues: t_67 (ref)
	return setmetatable({
		name = if p135 == nil or p135.name == nil then nil else p135.name,
		variant = if p135 == nil or p135.variant == nil then nil else p135.variant
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2272 = 0
	
	if self.name ~= nil then
		local var2273 = self.name:encode()
		local var2274, var2275 = protoModule.writeTag(buff, var2272, 1, protoModule.wireTypes.lengthDelimited)
		var2274, var2275 = protoModule.writeBuffer(var2274, var2275, var2273, buffer.len(var2273))
		buff = var2274
		var2272 = var2275
	end
	if self.variant ~= nil then
		local var2276 = self.variant:encode()
		local var2277, var2278 = protoModule.writeTag(buff, var2272, 2, protoModule.wireTypes.lengthDelimited)
		var2277, var2278 = protoModule.writeBuffer(var2277, var2278, var2276, buffer.len(var2276))
		buff = var2277
		var2272 = var2278
	end
	local buff_1 = buffer.create(var2272)
	buffer.copy(buff_1, 0, buff, 0, var2272)
	
	return buff_1
end

function t_67.decode(p136)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var2280 = t_67.new()
	local var2281 = 0
	while var2281 < buffer.len(p136) do
		local _ = nil
		local var2282 = nil
		local var2283, var2284, var2285 = protoModule.readTag(p136, var2281)
		local var2286 = var2283
		var2282 = var2284
		var2281 = var2285
		
		if var2282 == protoModule.wireTypes.varint then
			local _ = nil
			local var2287, var2288 = protoModule.readVarInt(p136, var2281)
			local _ = var2287
			var2281 = var2288
			continue
		end
		if var2282 == protoModule.wireTypes.lengthDelimited then
			if var2286 == 1 then
				local _ = nil
				local var2289, var2290 = protoModule.readBuffer(p136, var2281)
				var2281 = var2290
				var2280.name = t.StringProp.decode(var2289)
			elseif var2286 == 2 then
				local _ = nil
				local var2291, var2292 = protoModule.readBuffer(p136, var2281)
				var2281 = var2292
				var2280.variant = t.StringProp.decode(var2291)
			else
				local _ = nil
				local var2293, var2294 = protoModule.readVarInt(p136, var2281)
				var2281 = var2294 + var2293
			end
		elseif var2282 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2295, var2296 = protoModule.readFixed32(p136, var2281)
			local _ = var2295
			var2281 = var2296
		elseif var2282 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2297, var2298 = protoModule.readFixed64(p136, var2281)
			local _ = var2297
			var2281 = var2298
		else
			error("Unsupported wire type: " .. var2282)
		end
	end
	return var2280
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
	local var2300 = t_67.new()
	
	if self.name ~= nil then
		var2300.name = t.StringProp.jsonDecode(self.name)
	end
	if self.variant ~= nil then
		var2300.variant = t.StringProp.jsonDecode(self.variant)
	end
	return var2300
end

t_67.descriptor = {
	name = "FoundationIconConfigProp_FoundationIconConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfig"
}
t.FoundationIconConfigProp_FoundationIconConfig = t_67
typeRegistryModule.default:register(t.FoundationIconConfigProp_FoundationIconConfig)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p137)
	-- upvalues: t_68 (ref)
	return setmetatable({
		oneof_prop = if p137 == nil or p137.oneof_prop == nil then nil else p137.oneof_prop
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2302 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local var2303 = self.oneof_prop.value:encode()
			local var2304, var2305 = protoModule.writeTag(buff, var2302, 1, protoModule.wireTypes.lengthDelimited)
			var2304, var2305 = protoModule.writeBuffer(var2304, var2305, var2303, buffer.len(var2303))
			buff = var2304
			var2302 = var2305
		elseif self.oneof_prop.type == "int32_prop" then
			local var2306 = self.oneof_prop.value:encode()
			local var2307, var2308 = protoModule.writeTag(buff, var2302, 2, protoModule.wireTypes.lengthDelimited)
			var2307, var2308 = protoModule.writeBuffer(var2307, var2308, var2306, buffer.len(var2306))
			buff = var2307
			var2302 = var2308
		end
	end
	local buff_1 = buffer.create(var2302)
	buffer.copy(buff_1, 0, buff, 0, var2302)
	
	return buff_1
end

function t_68.decode(p138)
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var2310 = t_68.new()
	local var2311 = 0
	while var2311 < buffer.len(p138) do
		local _ = nil
		local var2312 = nil
		local var2313, var2314, var2315 = protoModule.readTag(p138, var2311)
		local var2316 = var2313
		var2312 = var2314
		var2311 = var2315
		
		if var2312 == protoModule.wireTypes.varint then
			local _ = nil
			local var2317, var2318 = protoModule.readVarInt(p138, var2311)
			local _ = var2317
			var2311 = var2318
			continue
		end
		if var2312 == protoModule.wireTypes.lengthDelimited then
			if var2316 == 1 then
				local _ = nil
				local var2319, var2320 = protoModule.readBuffer(p138, var2311)
				var2311 = var2320
				var2310.oneof_prop = {
					type = "string_prop",
					value = t.StringProp.decode(var2319)
				}
			elseif var2316 == 2 then
				local _ = nil
				local var2321, var2322 = protoModule.readBuffer(p138, var2311)
				var2311 = var2322
				var2310.oneof_prop = { type = "int32_prop", value = t.Int32Prop.decode(var2321) }
			else
				local _ = nil
				local var2323, var2324 = protoModule.readVarInt(p138, var2311)
				var2311 = var2324 + var2323
			end
		elseif var2312 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2325, var2326 = protoModule.readFixed32(p138, var2311)
			local _ = var2325
			var2311 = var2326
		elseif var2312 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2327, var2328 = protoModule.readFixed64(p138, var2311)
			local _ = var2327
			var2311 = var2328
		else
			error("Unsupported wire type: " .. var2312)
		end
	end
	return var2310
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
	local var2330 = t_68.new()
	
	if self.string_prop ~= nil then
		var2330.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		var2330.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		var2330.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		var2330.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	return var2330
end

t_68.descriptor = {
	name = "IconSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconSizeProp"
}
t.IconSizeProp = t_68
typeRegistryModule.default:register(t.IconSizeProp)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p139)
	-- upvalues: t_69 (ref)
	return setmetatable({
		kind = if p139 == nil or p139.kind == nil then nil else p139.kind
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2332 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2333 = self.kind.value:encode()
			local var2334, var2335 = protoModule.writeTag(buff, var2332, 1, protoModule.wireTypes.lengthDelimited)
			var2334, var2335 = protoModule.writeBuffer(var2334, var2335, var2333, buffer.len(var2333))
			buff = var2334
			var2332 = var2335
		elseif self.kind.type == "conditional" then
			local var2336 = self.kind.value:encode()
			local var2337, var2338 = protoModule.writeTag(buff, var2332, 2, protoModule.wireTypes.lengthDelimited)
			var2337, var2338 = protoModule.writeBuffer(var2337, var2338, var2336, buffer.len(var2336))
			buff = var2337
			var2332 = var2338
		end
	end
	local buff_1 = buffer.create(var2332)
	buffer.copy(buff_1, 0, buff, 0, var2332)
	
	return buff_1
end

function t_69.decode(p140)
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var2340 = t_69.new()
	local var2341 = 0
	while var2341 < buffer.len(p140) do
		local _ = nil
		local var2342 = nil
		local var2343, var2344, var2345 = protoModule.readTag(p140, var2341)
		local var2346 = var2343
		var2342 = var2344
		var2341 = var2345
		
		if var2342 == protoModule.wireTypes.varint then
			local _ = nil
			local var2347, var2348 = protoModule.readVarInt(p140, var2341)
			local _ = var2347
			var2341 = var2348
			continue
		end
		if var2342 == protoModule.wireTypes.lengthDelimited then
			if var2346 == 1 then
				local _ = nil
				local var2349, var2350 = protoModule.readBuffer(p140, var2341)
				var2341 = var2350
				var2340.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var2349)
				}
			elseif var2346 == 2 then
				local _ = nil
				local var2351, var2352 = protoModule.readBuffer(p140, var2341)
				var2341 = var2352
				var2340.kind = {
					type = "conditional",
					value = t.GradientProp_ConditionalOptions.decode(var2351)
				}
			else
				local _ = nil
				local var2353, var2354 = protoModule.readVarInt(p140, var2341)
				var2341 = var2354 + var2353
			end
		elseif var2342 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2355, var2356 = protoModule.readFixed32(p140, var2341)
			local _ = var2355
			var2341 = var2356
		elseif var2342 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2357, var2358 = protoModule.readFixed64(p140, var2341)
			local _ = var2357
			var2341 = var2358
		else
			error("Unsupported wire type: " .. var2342)
		end
	end
	return var2340
end

function t_69:jsonEncode()
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

function t_69:jsonDecode()
	-- upvalues: t_69 (ref), t (ref)
	local var2360 = t_69.new()
	
	if self.literal ~= nil then
		var2360.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var2360.kind = {
			type = "conditional",
			value = t.GradientProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2360
end

t_69.descriptor = {
	name = "GradientProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
}
t.GradientProp = t_69
typeRegistryModule.default:register(t.GradientProp)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p141)
	-- upvalues: t_70 (ref)
	return setmetatable({
		condition = if p141 == nil or p141.condition == nil then nil else p141.condition,
		kind = if p141 == nil or p141.kind == nil then nil else p141.kind
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2362 = 0
	
	if self.condition ~= nil then
		local var2363 = self.condition:encode()
		local var2364, var2365 = protoModule.writeTag(buff, var2362, 1, protoModule.wireTypes.lengthDelimited)
		var2364, var2365 = protoModule.writeBuffer(var2364, var2365, var2363, buffer.len(var2363))
		buff = var2364
		var2362 = var2365
	end
	if self.kind ~= nil and self.kind.type == "literal" then
		local var2366 = self.kind.value:encode()
		local var2367, var2368 = protoModule.writeTag(buff, var2362, 2, protoModule.wireTypes.lengthDelimited)
		var2367, var2368 = protoModule.writeBuffer(var2367, var2368, var2366, buffer.len(var2366))
		buff = var2367
		var2362 = var2368
	end
	local buff_1 = buffer.create(var2362)
	buffer.copy(buff_1, 0, buff, 0, var2362)
	
	return buff_1
end

function t_70.decode(p142)
	-- upvalues: t_70 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2370 = t_70.new()
	local var2371 = 0
	while var2371 < buffer.len(p142) do
		local _ = nil
		local var2372 = nil
		local var2373, var2374, var2375 = protoModule.readTag(p142, var2371)
		local var2376 = var2373
		var2372 = var2374
		var2371 = var2375
		
		if var2372 == protoModule.wireTypes.varint then
			local _ = nil
			local var2377, var2378 = protoModule.readVarInt(p142, var2371)
			local _ = var2377
			var2371 = var2378
			continue
		end
		if var2372 == protoModule.wireTypes.lengthDelimited then
			if var2376 == 1 then
				local _ = nil
				local var2379, var2380 = protoModule.readBuffer(p142, var2371)
				var2371 = var2380
				var2370.condition = propConditionModule.PropCondition.decode(var2379)
			elseif var2376 == 2 then
				local _ = nil
				local var2381, var2382 = protoModule.readBuffer(p142, var2371)
				var2371 = var2382
				var2370.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var2381)
				}
			else
				local _ = nil
				local var2383, var2384 = protoModule.readVarInt(p142, var2371)
				var2371 = var2384 + var2383
			end
		elseif var2372 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2385, var2386 = protoModule.readFixed32(p142, var2371)
			local _ = var2385
			var2371 = var2386
		elseif var2372 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2387, var2388 = protoModule.readFixed64(p142, var2371)
			local _ = var2387
			var2371 = var2388
		else
			error("Unsupported wire type: " .. var2372)
		end
	end
	return var2370
end

function t_70:jsonEncode()
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_70:jsonDecode()
	-- upvalues: t_70 (ref), propConditionModule (ref), t (ref)
	local var2390 = t_70.new()
	
	if self.condition ~= nil then
		var2390.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2390.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	return var2390
end

t_70.descriptor = {
	name = "GradientProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.GradientProp_ConditionalOption = t_70
typeRegistryModule.default:register(t.GradientProp_ConditionalOption)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p143)
	-- upvalues: t_71 (ref)
	return setmetatable({
		options = if p143 == nil or p143.options == nil then {} else p143.options
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2392 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2393 = v:encode()
			local var2394, var2395 = protoModule.writeTag(buff, var2392, 1, protoModule.wireTypes.lengthDelimited)
			var2394, var2395 = protoModule.writeBuffer(var2394, var2395, var2393, buffer.len(var2393))
			buff = var2394
			var2392 = var2395
		end
	end
	local buff_1 = buffer.create(var2392)
	buffer.copy(buff_1, 0, buff, 0, var2392)
	
	return buff_1
end

function t_71.decode(p144)
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2397 = t_71.new()
	local var2398 = 0
	while var2398 < buffer.len(p144) do
		local _ = nil
		local var2399 = nil
		local var2400, var2401, var2402 = protoModule.readTag(p144, var2398)
		local var2403 = var2400
		var2399 = var2401
		var2398 = var2402
		
		if var2399 == protoModule.wireTypes.varint then
			local _ = nil
			local var2404, var2405 = protoModule.readVarInt(p144, var2398)
			local _ = var2404
			var2398 = var2405
			continue
		end
		if var2399 == protoModule.wireTypes.lengthDelimited then
			if var2403 == 1 then
				local _ = nil
				local var2406, var2407 = protoModule.readBuffer(p144, var2398)
				var2398 = var2407
				table.insert(var2397.options, t.GradientProp_ConditionalOption.decode(var2406))
			else
				local _ = nil
				local var2408, var2409 = protoModule.readVarInt(p144, var2398)
				var2398 = var2409 + var2408
			end
		elseif var2399 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2410, var2411 = protoModule.readFixed32(p144, var2398)
			local _ = var2410
			var2398 = var2411
		elseif var2399 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2412, var2413 = protoModule.readFixed64(p144, var2398)
			local _ = var2412
			var2398 = var2413
		else
			error("Unsupported wire type: " .. var2399)
		end
	end
	return var2397
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
	local var2416 = t_71.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.GradientProp_ConditionalOption.jsonDecode(v))
		end
		var2416.options = t_1
	end
	return var2416
end

t_71.descriptor = {
	name = "GradientProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.GradientProp_ConditionalOptions = t_71
typeRegistryModule.default:register(t.GradientProp_ConditionalOptions)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p145)
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

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2419 = 0
	
	if self.start_color ~= nil and self.start_color ~= "" then
		local var2420, var2421 = protoModule.writeTag(buff, var2419, 1, protoModule.wireTypes.lengthDelimited)
		var2420, var2421 = protoModule.writeString(var2420, var2421, self.start_color)
		buff = var2420
		var2419 = var2421
	end
	if self.end_color ~= nil and self.end_color ~= "" then
		local var2422, var2423 = protoModule.writeTag(buff, var2419, 2, protoModule.wireTypes.lengthDelimited)
		var2422, var2423 = protoModule.writeString(var2422, var2423, self.end_color)
		buff = var2422
		var2419 = var2423
	end
	if self.start_opacity ~= nil and self.start_opacity ~= 0 then
		local var2424, var2425 = protoModule.writeTag(buff, var2419, 3, protoModule.wireTypes.i32)
		var2424, var2425 = protoModule.writeFloat(var2424, var2425, self.start_opacity)
		buff = var2424
		var2419 = var2425
	end
	if self.end_opacity ~= nil and self.end_opacity ~= 0 then
		local var2426, var2427 = protoModule.writeTag(buff, var2419, 4, protoModule.wireTypes.i32)
		var2426, var2427 = protoModule.writeFloat(var2426, var2427, self.end_opacity)
		buff = var2426
		var2419 = var2427
	end
	if self.degree ~= nil and self.degree ~= 0 then
		local var2428, var2429 = protoModule.writeTag(buff, var2419, 5, protoModule.wireTypes.varint)
		var2428, var2429 = protoModule.writeVarInt(var2428, var2429, self.degree)
		buff = var2428
		var2419 = var2429
	end
	if self.midpoint_percent ~= nil and self.midpoint_percent ~= 0 then
		local var2430, var2431 = protoModule.writeTag(buff, var2419, 6, protoModule.wireTypes.i32)
		var2430, var2431 = protoModule.writeFloat(var2430, var2431, self.midpoint_percent)
		buff = var2430
		var2419 = var2431
	end
	local buff_1 = buffer.create(var2419)
	buffer.copy(buff_1, 0, buff, 0, var2419)
	
	return buff_1
end

function t_72.decode(p146)
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2433 = t_72.new()
	local var2434 = 0
	while var2434 < buffer.len(p146) do
		local _ = nil
		local var2435 = nil
		local var2436, var2437, var2438 = protoModule.readTag(p146, var2434)
		local var2439 = var2436
		var2435 = var2437
		var2434 = var2438
		
		if var2435 == protoModule.wireTypes.varint then
			if var2439 == 5 then
				local _ = nil
				local var2440, var2441 = protoModule.readVarIntI32(p146, var2434)
				var2434 = var2441
				var2433.degree = var2440
			else
				local _ = nil
				local var2442, var2443 = protoModule.readVarInt(p146, var2434)
				local _ = var2442
				var2434 = var2443
			end
		end
		if var2435 == protoModule.wireTypes.lengthDelimited then
			if var2439 == 1 then
				local _ = nil
				local var2444, var2445 = protoModule.readBuffer(p146, var2434)
				var2434 = var2445
				var2433.start_color = buffer.tostring(var2444)
			elseif var2439 == 2 then
				local _ = nil
				local var2446, var2447 = protoModule.readBuffer(p146, var2434)
				var2434 = var2447
				var2433.end_color = buffer.tostring(var2446)
			else
				local _ = nil
				local var2448, var2449 = protoModule.readVarInt(p146, var2434)
				var2434 = var2449 + var2448
			end
		elseif var2435 == protoModule.wireTypes.i32 then
			if var2439 == 3 then
				local _ = nil
				local var2450, var2451 = protoModule.readFloat(p146, var2434)
				var2434 = var2451
				var2433.start_opacity = var2450
			elseif var2439 == 4 then
				local _ = nil
				local var2452, var2453 = protoModule.readFloat(p146, var2434)
				var2434 = var2453
				var2433.end_opacity = var2452
			elseif var2439 == 6 then
				local _ = nil
				local var2454, var2455 = protoModule.readFloat(p146, var2434)
				var2434 = var2455
				var2433.midpoint_percent = var2454
			else
				local _ = nil
				local var2456, var2457 = protoModule.readFixed32(p146, var2434)
				local _ = var2456
				var2434 = var2457
			end
		elseif var2435 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2458, var2459 = protoModule.readFixed64(p146, var2434)
			local _ = var2458
			var2434 = var2459
		else
			error("Unsupported wire type: " .. var2435)
		end
	end
	return var2433
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
	local var2461 = t_72.new()
	
	if self.start_color ~= nil then
		var2461.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var2461.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var2461.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var2461.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var2461.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var2461.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var2461.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var2461.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var2461.degree = self.degree
	end
	if self.midpoint_percent ~= nil then
		var2461.midpoint_percent = protoModule.json.deserializeNumber(self.midpoint_percent)
	end
	if self.midpointPercent ~= nil then
		var2461.midpoint_percent = protoModule.json.deserializeNumber(self.midpointPercent)
	end
	return var2461
end

t_72.descriptor = {
	name = "GradientProp_GradientData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
}
t.GradientProp_GradientData = t_72
typeRegistryModule.default:register(t.GradientProp_GradientData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p147)
	-- upvalues: t_73 (ref)
	return setmetatable({
		kind = if p147 == nil or p147.kind == nil then nil else p147.kind
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2463 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2464 = self.kind.value:encode()
			local var2465, var2466 = protoModule.writeTag(buff, var2463, 1, protoModule.wireTypes.lengthDelimited)
			var2465, var2466 = protoModule.writeBuffer(var2465, var2466, var2464, buffer.len(var2464))
			buff = var2465
			var2463 = var2466
		elseif self.kind.type == "binding_path" then
			local var2467, var2468 = protoModule.writeTag(buff, var2463, 2, protoModule.wireTypes.lengthDelimited)
			var2467, var2468 = protoModule.writeString(var2467, var2468, self.kind.value)
			buff = var2467
			var2463 = var2468
		elseif self.kind.type == "conditional" then
			local var2469 = self.kind.value:encode()
			local var2470, var2471 = protoModule.writeTag(buff, var2463, 3, protoModule.wireTypes.lengthDelimited)
			var2470, var2471 = protoModule.writeBuffer(var2470, var2471, var2469, buffer.len(var2469))
			buff = var2470
			var2463 = var2471
		end
	end
	local buff_1 = buffer.create(var2463)
	buffer.copy(buff_1, 0, buff, 0, var2463)
	
	return buff_1
end

function t_73.decode(p148)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2473 = t_73.new()
	local var2474 = 0
	while var2474 < buffer.len(p148) do
		local _ = nil
		local var2475 = nil
		local var2476, var2477, var2478 = protoModule.readTag(p148, var2474)
		local var2479 = var2476
		var2475 = var2477
		var2474 = var2478
		
		if var2475 == protoModule.wireTypes.varint then
			local _ = nil
			local var2480, var2481 = protoModule.readVarInt(p148, var2474)
			local _ = var2480
			var2474 = var2481
			continue
		end
		if var2475 == protoModule.wireTypes.lengthDelimited then
			if var2479 == 1 then
				local _ = nil
				local var2482, var2483 = protoModule.readBuffer(p148, var2474)
				var2474 = var2483
				var2473.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var2482)
				}
			elseif var2479 == 2 then
				local _ = nil
				local var2484, var2485 = protoModule.readBuffer(p148, var2474)
				var2474 = var2485
				var2473.kind = { type = "binding_path", value = buffer.tostring(var2484) }
			elseif var2479 == 3 then
				local _ = nil
				local var2486, var2487 = protoModule.readBuffer(p148, var2474)
				var2474 = var2487
				var2473.kind = {
					type = "conditional",
					value = t.ArrayOfStructProp_ConditionalOptions.decode(var2486)
				}
			else
				local _ = nil
				local var2488, var2489 = protoModule.readVarInt(p148, var2474)
				var2474 = var2489 + var2488
			end
		elseif var2475 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2490, var2491 = protoModule.readFixed32(p148, var2474)
			local _ = var2490
			var2474 = var2491
		elseif var2475 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2492, var2493 = protoModule.readFixed64(p148, var2474)
			local _ = var2492
			var2474 = var2493
		else
			error("Unsupported wire type: " .. var2475)
		end
	end
	return var2473
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
	local var2495 = t_73.new()
	
	if self.literal ~= nil then
		var2495.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2495.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2495.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2495.kind = {
			type = "conditional",
			value = t.ArrayOfStructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2495
end

t_73.descriptor = {
	name = "ArrayOfStructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
}
t.ArrayOfStructProp = t_73
typeRegistryModule.default:register(t.ArrayOfStructProp)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p149)
	-- upvalues: t_74 (ref)
	return setmetatable({
		condition = if p149 == nil or p149.condition == nil then nil else p149.condition,
		kind = if p149 == nil or p149.kind == nil then nil else p149.kind
	}, t_74)
end

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2497 = 0
	
	if self.condition ~= nil then
		local var2498 = self.condition:encode()
		local var2499, var2500 = protoModule.writeTag(buff, var2497, 1, protoModule.wireTypes.lengthDelimited)
		var2499, var2500 = protoModule.writeBuffer(var2499, var2500, var2498, buffer.len(var2498))
		buff = var2499
		var2497 = var2500
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2501 = self.kind.value:encode()
			local var2502, var2503 = protoModule.writeTag(buff, var2497, 2, protoModule.wireTypes.lengthDelimited)
			var2502, var2503 = protoModule.writeBuffer(var2502, var2503, var2501, buffer.len(var2501))
			buff = var2502
			var2497 = var2503
		elseif self.kind.type == "binding_path" then
			local var2504, var2505 = protoModule.writeTag(buff, var2497, 3, protoModule.wireTypes.lengthDelimited)
			var2504, var2505 = protoModule.writeString(var2504, var2505, self.kind.value)
			buff = var2504
			var2497 = var2505
		end
	end
	local buff_1 = buffer.create(var2497)
	buffer.copy(buff_1, 0, buff, 0, var2497)
	
	return buff_1
end

function t_74.decode(p150)
	-- upvalues: t_74 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2507 = t_74.new()
	local var2508 = 0
	while var2508 < buffer.len(p150) do
		local _ = nil
		local var2509 = nil
		local var2510, var2511, var2512 = protoModule.readTag(p150, var2508)
		local var2513 = var2510
		var2509 = var2511
		var2508 = var2512
		
		if var2509 == protoModule.wireTypes.varint then
			local _ = nil
			local var2514, var2515 = protoModule.readVarInt(p150, var2508)
			local _ = var2514
			var2508 = var2515
			continue
		end
		if var2509 == protoModule.wireTypes.lengthDelimited then
			if var2513 == 1 then
				local _ = nil
				local var2516, var2517 = protoModule.readBuffer(p150, var2508)
				var2508 = var2517
				var2507.condition = propConditionModule.PropCondition.decode(var2516)
			elseif var2513 == 2 then
				local _ = nil
				local var2518, var2519 = protoModule.readBuffer(p150, var2508)
				var2508 = var2519
				var2507.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var2518)
				}
			elseif var2513 == 3 then
				local _ = nil
				local var2520, var2521 = protoModule.readBuffer(p150, var2508)
				var2508 = var2521
				var2507.kind = { type = "binding_path", value = buffer.tostring(var2520) }
			else
				local _ = nil
				local var2522, var2523 = protoModule.readVarInt(p150, var2508)
				var2508 = var2523 + var2522
			end
		elseif var2509 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2524, var2525 = protoModule.readFixed32(p150, var2508)
			local _ = var2524
			var2508 = var2525
		elseif var2509 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2526, var2527 = protoModule.readFixed64(p150, var2508)
			local _ = var2526
			var2508 = var2527
		else
			error("Unsupported wire type: " .. var2509)
		end
	end
	return var2507
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
	local var2529 = t_74.new()
	
	if self.condition ~= nil then
		var2529.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2529.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2529.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2529.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2529
end

t_74.descriptor = {
	name = "ArrayOfStructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfStructProp_ConditionalOption = t_74
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOption)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p151)
	-- upvalues: t_75 (ref)
	return setmetatable({
		options = if p151 == nil or p151.options == nil then {} else p151.options
	}, t_75)
end

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2531 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2532 = v:encode()
			local var2533, var2534 = protoModule.writeTag(buff, var2531, 1, protoModule.wireTypes.lengthDelimited)
			var2533, var2534 = protoModule.writeBuffer(var2533, var2534, var2532, buffer.len(var2532))
			buff = var2533
			var2531 = var2534
		end
	end
	local buff_1 = buffer.create(var2531)
	buffer.copy(buff_1, 0, buff, 0, var2531)
	
	return buff_1
end

function t_75.decode(p152)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2536 = t_75.new()
	local var2537 = 0
	while var2537 < buffer.len(p152) do
		local _ = nil
		local var2538 = nil
		local var2539, var2540, var2541 = protoModule.readTag(p152, var2537)
		local var2542 = var2539
		var2538 = var2540
		var2537 = var2541
		
		if var2538 == protoModule.wireTypes.varint then
			local _ = nil
			local var2543, var2544 = protoModule.readVarInt(p152, var2537)
			local _ = var2543
			var2537 = var2544
			continue
		end
		if var2538 == protoModule.wireTypes.lengthDelimited then
			if var2542 == 1 then
				local _ = nil
				local var2545, var2546 = protoModule.readBuffer(p152, var2537)
				var2537 = var2546
				table.insert(var2536.options, t.ArrayOfStructProp_ConditionalOption.decode(var2545))
			else
				local _ = nil
				local var2547, var2548 = protoModule.readVarInt(p152, var2537)
				var2537 = var2548 + var2547
			end
		elseif var2538 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2549, var2550 = protoModule.readFixed32(p152, var2537)
			local _ = var2549
			var2537 = var2550
		elseif var2538 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2551, var2552 = protoModule.readFixed64(p152, var2537)
			local _ = var2551
			var2537 = var2552
		else
			error("Unsupported wire type: " .. var2538)
		end
	end
	return var2536
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
	local var2555 = t_75.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfStructProp_ConditionalOption.jsonDecode(v))
		end
		var2555.options = t_1
	end
	return var2555
end

t_75.descriptor = {
	name = "ArrayOfStructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfStructProp_ConditionalOptions = t_75
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOptions)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p153)
	-- upvalues: t_76 (ref)
	return setmetatable({
		entry = if p153 == nil or p153.entry == nil then {} else p153.entry
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2558 = 0
	
	if self.entry ~= nil and #self.entry > 0 then
		for i, v in self.entry do
			local var2559 = v:encode()
			local var2560, var2561 = protoModule.writeTag(buff, var2558, 1, protoModule.wireTypes.lengthDelimited)
			var2560, var2561 = protoModule.writeBuffer(var2560, var2561, var2559, buffer.len(var2559))
			buff = var2560
			var2558 = var2561
		end
	end
	local buff_1 = buffer.create(var2558)
	buffer.copy(buff_1, 0, buff, 0, var2558)
	
	return buff_1
end

function t_76.decode(p154)
	-- upvalues: t_76 (ref), protoModule (ref), structModule (ref)
	local var2563 = t_76.new()
	local var2564 = 0
	while var2564 < buffer.len(p154) do
		local _ = nil
		local var2565 = nil
		local var2566, var2567, var2568 = protoModule.readTag(p154, var2564)
		local var2569 = var2566
		var2565 = var2567
		var2564 = var2568
		
		if var2565 == protoModule.wireTypes.varint then
			local _ = nil
			local var2570, var2571 = protoModule.readVarInt(p154, var2564)
			local _ = var2570
			var2564 = var2571
			continue
		end
		if var2565 == protoModule.wireTypes.lengthDelimited then
			if var2569 == 1 then
				local _ = nil
				local var2572, var2573 = protoModule.readBuffer(p154, var2564)
				var2564 = var2573
				table.insert(var2563.entry, structModule.Struct.decode(var2572))
			else
				local _ = nil
				local var2574, var2575 = protoModule.readVarInt(p154, var2564)
				var2564 = var2575 + var2574
			end
		elseif var2565 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2576, var2577 = protoModule.readFixed32(p154, var2564)
			local _ = var2576
			var2564 = var2577
		elseif var2565 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2578, var2579 = protoModule.readFixed64(p154, var2564)
			local _ = var2578
			var2564 = var2579
		else
			error("Unsupported wire type: " .. var2565)
		end
	end
	return var2563
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
	local var2582 = t_76.new()
	
	if self.entry ~= nil then
		local t = {}
		
		for i, v in self.entry do
			table.insert(t, structModule.Struct.jsonDecode(v))
		end
		var2582.entry = t
	end
	return var2582
end

t_76.descriptor = {
	name = "ArrayOfStructProp_ArrayOfStructs",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
}
t.ArrayOfStructProp_ArrayOfStructs = t_76
typeRegistryModule.default:register(t.ArrayOfStructProp_ArrayOfStructs)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p155)
	-- upvalues: t_77 (ref)
	return setmetatable({
		kind = if p155 == nil or p155.kind == nil then nil else p155.kind
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2585 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2586, var2587 = protoModule.writeTag(buff, var2585, 1, protoModule.wireTypes.lengthDelimited)
			var2586, var2587 = protoModule.writeString(var2586, var2587, self.kind.value)
			buff = var2586
			var2585 = var2587
		elseif self.kind.type == "token" then
			local var2588, var2589 = protoModule.writeTag(buff, var2585, 2, protoModule.wireTypes.lengthDelimited)
			var2588, var2589 = protoModule.writeString(var2588, var2589, self.kind.value)
			buff = var2588
			var2585 = var2589
		elseif self.kind.type == "conditional" then
			local var2590 = self.kind.value:encode()
			local var2591, var2592 = protoModule.writeTag(buff, var2585, 3, protoModule.wireTypes.lengthDelimited)
			var2591, var2592 = protoModule.writeBuffer(var2591, var2592, var2590, buffer.len(var2590))
			buff = var2591
			var2585 = var2592
		elseif self.kind.type == "binding_path" then
			local var2593, var2594 = protoModule.writeTag(buff, var2585, 4, protoModule.wireTypes.lengthDelimited)
			var2593, var2594 = protoModule.writeString(var2593, var2594, self.kind.value)
			buff = var2593
			var2585 = var2594
		end
	end
	local buff_1 = buffer.create(var2585)
	buffer.copy(buff_1, 0, buff, 0, var2585)
	
	return buff_1
end

function t_77.decode(p156)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2596 = t_77.new()
	local var2597 = 0
	while var2597 < buffer.len(p156) do
		local _ = nil
		local var2598 = nil
		local var2599, var2600, var2601 = protoModule.readTag(p156, var2597)
		local var2602 = var2599
		var2598 = var2600
		var2597 = var2601
		
		if var2598 == protoModule.wireTypes.varint then
			local _ = nil
			local var2603, var2604 = protoModule.readVarInt(p156, var2597)
			local _ = var2603
			var2597 = var2604
			continue
		end
		if var2598 == protoModule.wireTypes.lengthDelimited then
			if var2602 == 1 then
				local _ = nil
				local var2605, var2606 = protoModule.readBuffer(p156, var2597)
				var2597 = var2606
				var2596.kind = { type = "literal", value = buffer.tostring(var2605) }
			elseif var2602 == 2 then
				local _ = nil
				local var2607, var2608 = protoModule.readBuffer(p156, var2597)
				var2597 = var2608
				var2596.kind = { type = "token", value = buffer.tostring(var2607) }
			elseif var2602 == 3 then
				local _ = nil
				local var2609, var2610 = protoModule.readBuffer(p156, var2597)
				var2597 = var2610
				var2596.kind = {
					type = "conditional",
					value = t.UiScaledFloatProp_ConditionalOptions.decode(var2609)
				}
			elseif var2602 == 4 then
				local _ = nil
				local var2611, var2612 = protoModule.readBuffer(p156, var2597)
				var2597 = var2612
				var2596.kind = { type = "binding_path", value = buffer.tostring(var2611) }
			else
				local _ = nil
				local var2613, var2614 = protoModule.readVarInt(p156, var2597)
				var2597 = var2614 + var2613
			end
		elseif var2598 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2615, var2616 = protoModule.readFixed32(p156, var2597)
			local _ = var2615
			var2597 = var2616
		elseif var2598 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2617, var2618 = protoModule.readFixed64(p156, var2597)
			local _ = var2617
			var2597 = var2618
		else
			error("Unsupported wire type: " .. var2598)
		end
	end
	return var2596
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
	local var2620 = t_77.new()
	
	if self.literal ~= nil then
		var2620.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2620.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2620.kind = {
			type = "conditional",
			value = t.UiScaledFloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2620.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2620.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2620
end

t_77.descriptor = {
	name = "UiScaledFloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
}
t.UiScaledFloatProp = t_77
typeRegistryModule.default:register(t.UiScaledFloatProp)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p157)
	-- upvalues: t_78 (ref)
	return setmetatable({
		condition = if p157 == nil or p157.condition == nil then nil else p157.condition,
		kind = if p157 == nil or p157.kind == nil then nil else p157.kind
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2622 = 0
	
	if self.condition ~= nil then
		local var2623 = self.condition:encode()
		local var2624, var2625 = protoModule.writeTag(buff, var2622, 1, protoModule.wireTypes.lengthDelimited)
		var2624, var2625 = protoModule.writeBuffer(var2624, var2625, var2623, buffer.len(var2623))
		buff = var2624
		var2622 = var2625
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2626, var2627 = protoModule.writeTag(buff, var2622, 2, protoModule.wireTypes.lengthDelimited)
			var2626, var2627 = protoModule.writeString(var2626, var2627, self.kind.value)
			buff = var2626
			var2622 = var2627
		elseif self.kind.type == "token" then
			local var2628, var2629 = protoModule.writeTag(buff, var2622, 3, protoModule.wireTypes.lengthDelimited)
			var2628, var2629 = protoModule.writeString(var2628, var2629, self.kind.value)
			buff = var2628
			var2622 = var2629
		elseif self.kind.type == "binding_path" then
			local var2630, var2631 = protoModule.writeTag(buff, var2622, 4, protoModule.wireTypes.lengthDelimited)
			var2630, var2631 = protoModule.writeString(var2630, var2631, self.kind.value)
			buff = var2630
			var2622 = var2631
		end
	end
	local buff_1 = buffer.create(var2622)
	buffer.copy(buff_1, 0, buff, 0, var2622)
	
	return buff_1
end

function t_78.decode(p158)
	-- upvalues: t_78 (ref), protoModule (ref), propConditionModule (ref)
	local var2633 = t_78.new()
	local var2634 = 0
	while var2634 < buffer.len(p158) do
		local _ = nil
		local var2635 = nil
		local var2636, var2637, var2638 = protoModule.readTag(p158, var2634)
		local var2639 = var2636
		var2635 = var2637
		var2634 = var2638
		
		if var2635 == protoModule.wireTypes.varint then
			local _ = nil
			local var2640, var2641 = protoModule.readVarInt(p158, var2634)
			local _ = var2640
			var2634 = var2641
			continue
		end
		if var2635 == protoModule.wireTypes.lengthDelimited then
			if var2639 == 1 then
				local _ = nil
				local var2642, var2643 = protoModule.readBuffer(p158, var2634)
				var2634 = var2643
				var2633.condition = propConditionModule.PropCondition.decode(var2642)
			elseif var2639 == 2 then
				local _ = nil
				local var2644, var2645 = protoModule.readBuffer(p158, var2634)
				var2634 = var2645
				var2633.kind = { type = "literal", value = buffer.tostring(var2644) }
			elseif var2639 == 3 then
				local _ = nil
				local var2646, var2647 = protoModule.readBuffer(p158, var2634)
				var2634 = var2647
				var2633.kind = { type = "token", value = buffer.tostring(var2646) }
			elseif var2639 == 4 then
				local _ = nil
				local var2648, var2649 = protoModule.readBuffer(p158, var2634)
				var2634 = var2649
				var2633.kind = { type = "binding_path", value = buffer.tostring(var2648) }
			else
				local _ = nil
				local var2650, var2651 = protoModule.readVarInt(p158, var2634)
				var2634 = var2651 + var2650
			end
		elseif var2635 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2652, var2653 = protoModule.readFixed32(p158, var2634)
			local _ = var2652
			var2634 = var2653
		elseif var2635 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2654, var2655 = protoModule.readFixed64(p158, var2634)
			local _ = var2654
			var2634 = var2655
		else
			error("Unsupported wire type: " .. var2635)
		end
	end
	return var2633
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
	local var2657 = t_78.new()
	
	if self.condition ~= nil then
		var2657.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2657.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2657.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2657.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2657.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2657
end

t_78.descriptor = {
	name = "UiScaledFloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledFloatProp_ConditionalOption = t_78
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p159)
	-- upvalues: t_79 (ref)
	return setmetatable({
		options = if p159 == nil or p159.options == nil then {} else p159.options
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2659 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2660 = v:encode()
			local var2661, var2662 = protoModule.writeTag(buff, var2659, 1, protoModule.wireTypes.lengthDelimited)
			var2661, var2662 = protoModule.writeBuffer(var2661, var2662, var2660, buffer.len(var2660))
			buff = var2661
			var2659 = var2662
		end
	end
	local buff_1 = buffer.create(var2659)
	buffer.copy(buff_1, 0, buff, 0, var2659)
	
	return buff_1
end

function t_79.decode(p160)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2664 = t_79.new()
	local var2665 = 0
	while var2665 < buffer.len(p160) do
		local _ = nil
		local var2666 = nil
		local var2667, var2668, var2669 = protoModule.readTag(p160, var2665)
		local var2670 = var2667
		var2666 = var2668
		var2665 = var2669
		
		if var2666 == protoModule.wireTypes.varint then
			local _ = nil
			local var2671, var2672 = protoModule.readVarInt(p160, var2665)
			local _ = var2671
			var2665 = var2672
			continue
		end
		if var2666 == protoModule.wireTypes.lengthDelimited then
			if var2670 == 1 then
				local _ = nil
				local var2673, var2674 = protoModule.readBuffer(p160, var2665)
				var2665 = var2674
				table.insert(var2664.options, t.UiScaledFloatProp_ConditionalOption.decode(var2673))
			else
				local _ = nil
				local var2675, var2676 = protoModule.readVarInt(p160, var2665)
				var2665 = var2676 + var2675
			end
		elseif var2666 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2677, var2678 = protoModule.readFixed32(p160, var2665)
			local _ = var2677
			var2665 = var2678
		elseif var2666 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2679, var2680 = protoModule.readFixed64(p160, var2665)
			local _ = var2679
			var2665 = var2680
		else
			error("Unsupported wire type: " .. var2666)
		end
	end
	return var2664
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
	local var2683 = t_79.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledFloatProp_ConditionalOption.jsonDecode(v))
		end
		var2683.options = t_1
	end
	return var2683
end

t_79.descriptor = {
	name = "UiScaledFloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledFloatProp_ConditionalOptions = t_79
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOptions)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p161)
	-- upvalues: t_80 (ref)
	return setmetatable({
		kind = if p161 == nil or p161.kind == nil then nil else p161.kind
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2686 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2687, var2688 = protoModule.writeTag(buff, var2686, 1, protoModule.wireTypes.lengthDelimited)
			var2687, var2688 = protoModule.writeString(var2687, var2688, self.kind.value)
			buff = var2687
			var2686 = var2688
		elseif self.kind.type == "token" then
			local var2689, var2690 = protoModule.writeTag(buff, var2686, 2, protoModule.wireTypes.lengthDelimited)
			var2689, var2690 = protoModule.writeString(var2689, var2690, self.kind.value)
			buff = var2689
			var2686 = var2690
		elseif self.kind.type == "conditional" then
			local var2691 = self.kind.value:encode()
			local var2692, var2693 = protoModule.writeTag(buff, var2686, 3, protoModule.wireTypes.lengthDelimited)
			var2692, var2693 = protoModule.writeBuffer(var2692, var2693, var2691, buffer.len(var2691))
			buff = var2692
			var2686 = var2693
		elseif self.kind.type == "binding_path" then
			local var2694, var2695 = protoModule.writeTag(buff, var2686, 4, protoModule.wireTypes.lengthDelimited)
			var2694, var2695 = protoModule.writeString(var2694, var2695, self.kind.value)
			buff = var2694
			var2686 = var2695
		end
	end
	local buff_1 = buffer.create(var2686)
	buffer.copy(buff_1, 0, buff, 0, var2686)
	
	return buff_1
end

function t_80.decode(p162)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2697 = t_80.new()
	local var2698 = 0
	while var2698 < buffer.len(p162) do
		local _ = nil
		local var2699 = nil
		local var2700, var2701, var2702 = protoModule.readTag(p162, var2698)
		local var2703 = var2700
		var2699 = var2701
		var2698 = var2702
		
		if var2699 == protoModule.wireTypes.varint then
			local _ = nil
			local var2704, var2705 = protoModule.readVarInt(p162, var2698)
			local _ = var2704
			var2698 = var2705
			continue
		end
		if var2699 == protoModule.wireTypes.lengthDelimited then
			if var2703 == 1 then
				local _ = nil
				local var2706, var2707 = protoModule.readBuffer(p162, var2698)
				var2698 = var2707
				var2697.kind = { type = "literal", value = buffer.tostring(var2706) }
			elseif var2703 == 2 then
				local _ = nil
				local var2708, var2709 = protoModule.readBuffer(p162, var2698)
				var2698 = var2709
				var2697.kind = { type = "token", value = buffer.tostring(var2708) }
			elseif var2703 == 3 then
				local _ = nil
				local var2710, var2711 = protoModule.readBuffer(p162, var2698)
				var2698 = var2711
				var2697.kind = {
					type = "conditional",
					value = t.UiScaledUDimProp_ConditionalOptions.decode(var2710)
				}
			elseif var2703 == 4 then
				local _ = nil
				local var2712, var2713 = protoModule.readBuffer(p162, var2698)
				var2698 = var2713
				var2697.kind = { type = "binding_path", value = buffer.tostring(var2712) }
			else
				local _ = nil
				local var2714, var2715 = protoModule.readVarInt(p162, var2698)
				var2698 = var2715 + var2714
			end
		elseif var2699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2716, var2717 = protoModule.readFixed32(p162, var2698)
			local _ = var2716
			var2698 = var2717
		elseif var2699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2718, var2719 = protoModule.readFixed64(p162, var2698)
			local _ = var2718
			var2698 = var2719
		else
			error("Unsupported wire type: " .. var2699)
		end
	end
	return var2697
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
	local var2721 = t_80.new()
	
	if self.literal ~= nil then
		var2721.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2721.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2721.kind = {
			type = "conditional",
			value = t.UiScaledUDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2721.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2721.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2721
end

t_80.descriptor = {
	name = "UiScaledUDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
}
t.UiScaledUDimProp = t_80
typeRegistryModule.default:register(t.UiScaledUDimProp)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p163)
	-- upvalues: t_81 (ref)
	return setmetatable({
		condition = if p163 == nil or p163.condition == nil then nil else p163.condition,
		kind = if p163 == nil or p163.kind == nil then nil else p163.kind
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2723 = 0
	
	if self.condition ~= nil then
		local var2724 = self.condition:encode()
		local var2725, var2726 = protoModule.writeTag(buff, var2723, 1, protoModule.wireTypes.lengthDelimited)
		var2725, var2726 = protoModule.writeBuffer(var2725, var2726, var2724, buffer.len(var2724))
		buff = var2725
		var2723 = var2726
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2727, var2728 = protoModule.writeTag(buff, var2723, 2, protoModule.wireTypes.lengthDelimited)
			var2727, var2728 = protoModule.writeString(var2727, var2728, self.kind.value)
			buff = var2727
			var2723 = var2728
		elseif self.kind.type == "token" then
			local var2729, var2730 = protoModule.writeTag(buff, var2723, 3, protoModule.wireTypes.lengthDelimited)
			var2729, var2730 = protoModule.writeString(var2729, var2730, self.kind.value)
			buff = var2729
			var2723 = var2730
		elseif self.kind.type == "binding_path" then
			local var2731, var2732 = protoModule.writeTag(buff, var2723, 4, protoModule.wireTypes.lengthDelimited)
			var2731, var2732 = protoModule.writeString(var2731, var2732, self.kind.value)
			buff = var2731
			var2723 = var2732
		end
	end
	local buff_1 = buffer.create(var2723)
	buffer.copy(buff_1, 0, buff, 0, var2723)
	
	return buff_1
end

function t_81.decode(p164)
	-- upvalues: t_81 (ref), protoModule (ref), propConditionModule (ref)
	local var2734 = t_81.new()
	local var2735 = 0
	while var2735 < buffer.len(p164) do
		local _ = nil
		local var2736 = nil
		local var2737, var2738, var2739 = protoModule.readTag(p164, var2735)
		local var2740 = var2737
		var2736 = var2738
		var2735 = var2739
		
		if var2736 == protoModule.wireTypes.varint then
			local _ = nil
			local var2741, var2742 = protoModule.readVarInt(p164, var2735)
			local _ = var2741
			var2735 = var2742
			continue
		end
		if var2736 == protoModule.wireTypes.lengthDelimited then
			if var2740 == 1 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p164, var2735)
				var2735 = var2744
				var2734.condition = propConditionModule.PropCondition.decode(var2743)
			elseif var2740 == 2 then
				local _ = nil
				local var2745, var2746 = protoModule.readBuffer(p164, var2735)
				var2735 = var2746
				var2734.kind = { type = "literal", value = buffer.tostring(var2745) }
			elseif var2740 == 3 then
				local _ = nil
				local var2747, var2748 = protoModule.readBuffer(p164, var2735)
				var2735 = var2748
				var2734.kind = { type = "token", value = buffer.tostring(var2747) }
			elseif var2740 == 4 then
				local _ = nil
				local var2749, var2750 = protoModule.readBuffer(p164, var2735)
				var2735 = var2750
				var2734.kind = { type = "binding_path", value = buffer.tostring(var2749) }
			else
				local _ = nil
				local var2751, var2752 = protoModule.readVarInt(p164, var2735)
				var2735 = var2752 + var2751
			end
		elseif var2736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2753, var2754 = protoModule.readFixed32(p164, var2735)
			local _ = var2753
			var2735 = var2754
		elseif var2736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2755, var2756 = protoModule.readFixed64(p164, var2735)
			local _ = var2755
			var2735 = var2756
		else
			error("Unsupported wire type: " .. var2736)
		end
	end
	return var2734
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
	local var2758 = t_81.new()
	
	if self.condition ~= nil then
		var2758.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2758.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2758.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2758.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2758.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2758
end

t_81.descriptor = {
	name = "UiScaledUDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDimProp_ConditionalOption = t_81
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOption)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p165)
	-- upvalues: t_82 (ref)
	return setmetatable({
		options = if p165 == nil or p165.options == nil then {} else p165.options
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2760 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2761 = v:encode()
			local var2762, var2763 = protoModule.writeTag(buff, var2760, 1, protoModule.wireTypes.lengthDelimited)
			var2762, var2763 = protoModule.writeBuffer(var2762, var2763, var2761, buffer.len(var2761))
			buff = var2762
			var2760 = var2763
		end
	end
	local buff_1 = buffer.create(var2760)
	buffer.copy(buff_1, 0, buff, 0, var2760)
	
	return buff_1
end

function t_82.decode(p166)
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2765 = t_82.new()
	local var2766 = 0
	while var2766 < buffer.len(p166) do
		local _ = nil
		local var2767 = nil
		local var2768, var2769, var2770 = protoModule.readTag(p166, var2766)
		local var2771 = var2768
		var2767 = var2769
		var2766 = var2770
		
		if var2767 == protoModule.wireTypes.varint then
			local _ = nil
			local var2772, var2773 = protoModule.readVarInt(p166, var2766)
			local _ = var2772
			var2766 = var2773
			continue
		end
		if var2767 == protoModule.wireTypes.lengthDelimited then
			if var2771 == 1 then
				local _ = nil
				local var2774, var2775 = protoModule.readBuffer(p166, var2766)
				var2766 = var2775
				table.insert(var2765.options, t.UiScaledUDimProp_ConditionalOption.decode(var2774))
			else
				local _ = nil
				local var2776, var2777 = protoModule.readVarInt(p166, var2766)
				var2766 = var2777 + var2776
			end
		elseif var2767 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2778, var2779 = protoModule.readFixed32(p166, var2766)
			local _ = var2778
			var2766 = var2779
		elseif var2767 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2780, var2781 = protoModule.readFixed64(p166, var2766)
			local _ = var2780
			var2766 = var2781
		else
			error("Unsupported wire type: " .. var2767)
		end
	end
	return var2765
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
	local var2784 = t_82.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDimProp_ConditionalOption.jsonDecode(v))
		end
		var2784.options = t_1
	end
	return var2784
end

t_82.descriptor = {
	name = "UiScaledUDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDimProp_ConditionalOptions = t_82
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOptions)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p167)
	-- upvalues: t_83 (ref)
	return setmetatable({
		kind = if p167 == nil or p167.kind == nil then nil else p167.kind
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2787 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2788, var2789 = protoModule.writeTag(buff, var2787, 1, protoModule.wireTypes.lengthDelimited)
			var2788, var2789 = protoModule.writeString(var2788, var2789, self.kind.value)
			buff = var2788
			var2787 = var2789
		elseif self.kind.type == "token" then
			local var2790, var2791 = protoModule.writeTag(buff, var2787, 2, protoModule.wireTypes.lengthDelimited)
			var2790, var2791 = protoModule.writeString(var2790, var2791, self.kind.value)
			buff = var2790
			var2787 = var2791
		elseif self.kind.type == "conditional" then
			local var2792 = self.kind.value:encode()
			local var2793, var2794 = protoModule.writeTag(buff, var2787, 3, protoModule.wireTypes.lengthDelimited)
			var2793, var2794 = protoModule.writeBuffer(var2793, var2794, var2792, buffer.len(var2792))
			buff = var2793
			var2787 = var2794
		elseif self.kind.type == "binding_path" then
			local var2795, var2796 = protoModule.writeTag(buff, var2787, 4, protoModule.wireTypes.lengthDelimited)
			var2795, var2796 = protoModule.writeString(var2795, var2796, self.kind.value)
			buff = var2795
			var2787 = var2796
		end
	end
	local buff_1 = buffer.create(var2787)
	buffer.copy(buff_1, 0, buff, 0, var2787)
	
	return buff_1
end

function t_83.decode(p168)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2798 = t_83.new()
	local var2799 = 0
	while var2799 < buffer.len(p168) do
		local _ = nil
		local var2800 = nil
		local var2801, var2802, var2803 = protoModule.readTag(p168, var2799)
		local var2804 = var2801
		var2800 = var2802
		var2799 = var2803
		
		if var2800 == protoModule.wireTypes.varint then
			local _ = nil
			local var2805, var2806 = protoModule.readVarInt(p168, var2799)
			local _ = var2805
			var2799 = var2806
			continue
		end
		if var2800 == protoModule.wireTypes.lengthDelimited then
			if var2804 == 1 then
				local _ = nil
				local var2807, var2808 = protoModule.readBuffer(p168, var2799)
				var2799 = var2808
				var2798.kind = { type = "literal", value = buffer.tostring(var2807) }
			elseif var2804 == 2 then
				local _ = nil
				local var2809, var2810 = protoModule.readBuffer(p168, var2799)
				var2799 = var2810
				var2798.kind = { type = "token", value = buffer.tostring(var2809) }
			elseif var2804 == 3 then
				local _ = nil
				local var2811, var2812 = protoModule.readBuffer(p168, var2799)
				var2799 = var2812
				var2798.kind = {
					type = "conditional",
					value = t.UiScaledUDim2Prop_ConditionalOptions.decode(var2811)
				}
			elseif var2804 == 4 then
				local _ = nil
				local var2813, var2814 = protoModule.readBuffer(p168, var2799)
				var2799 = var2814
				var2798.kind = { type = "binding_path", value = buffer.tostring(var2813) }
			else
				local _ = nil
				local var2815, var2816 = protoModule.readVarInt(p168, var2799)
				var2799 = var2816 + var2815
			end
		elseif var2800 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2817, var2818 = protoModule.readFixed32(p168, var2799)
			local _ = var2817
			var2799 = var2818
		elseif var2800 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2819, var2820 = protoModule.readFixed64(p168, var2799)
			local _ = var2819
			var2799 = var2820
		else
			error("Unsupported wire type: " .. var2800)
		end
	end
	return var2798
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
	local var2822 = t_83.new()
	
	if self.literal ~= nil then
		var2822.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2822.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2822.kind = {
			type = "conditional",
			value = t.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2822.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2822.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2822
end

t_83.descriptor = {
	name = "UiScaledUDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
}
t.UiScaledUDim2Prop = t_83
typeRegistryModule.default:register(t.UiScaledUDim2Prop)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p169)
	-- upvalues: t_84 (ref)
	return setmetatable({
		condition = if p169 == nil or p169.condition == nil then nil else p169.condition,
		kind = if p169 == nil or p169.kind == nil then nil else p169.kind
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2824 = 0
	
	if self.condition ~= nil then
		local var2825 = self.condition:encode()
		local var2826, var2827 = protoModule.writeTag(buff, var2824, 1, protoModule.wireTypes.lengthDelimited)
		var2826, var2827 = protoModule.writeBuffer(var2826, var2827, var2825, buffer.len(var2825))
		buff = var2826
		var2824 = var2827
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2828, var2829 = protoModule.writeTag(buff, var2824, 2, protoModule.wireTypes.lengthDelimited)
			var2828, var2829 = protoModule.writeString(var2828, var2829, self.kind.value)
			buff = var2828
			var2824 = var2829
		elseif self.kind.type == "token" then
			local var2830, var2831 = protoModule.writeTag(buff, var2824, 3, protoModule.wireTypes.lengthDelimited)
			var2830, var2831 = protoModule.writeString(var2830, var2831, self.kind.value)
			buff = var2830
			var2824 = var2831
		elseif self.kind.type == "binding_path" then
			local var2832, var2833 = protoModule.writeTag(buff, var2824, 4, protoModule.wireTypes.lengthDelimited)
			var2832, var2833 = protoModule.writeString(var2832, var2833, self.kind.value)
			buff = var2832
			var2824 = var2833
		end
	end
	local buff_1 = buffer.create(var2824)
	buffer.copy(buff_1, 0, buff, 0, var2824)
	
	return buff_1
end

function t_84.decode(p170)
	-- upvalues: t_84 (ref), protoModule (ref), propConditionModule (ref)
	local var2835 = t_84.new()
	local var2836 = 0
	while var2836 < buffer.len(p170) do
		local _ = nil
		local var2837 = nil
		local var2838, var2839, var2840 = protoModule.readTag(p170, var2836)
		local var2841 = var2838
		var2837 = var2839
		var2836 = var2840
		
		if var2837 == protoModule.wireTypes.varint then
			local _ = nil
			local var2842, var2843 = protoModule.readVarInt(p170, var2836)
			local _ = var2842
			var2836 = var2843
			continue
		end
		if var2837 == protoModule.wireTypes.lengthDelimited then
			if var2841 == 1 then
				local _ = nil
				local var2844, var2845 = protoModule.readBuffer(p170, var2836)
				var2836 = var2845
				var2835.condition = propConditionModule.PropCondition.decode(var2844)
			elseif var2841 == 2 then
				local _ = nil
				local var2846, var2847 = protoModule.readBuffer(p170, var2836)
				var2836 = var2847
				var2835.kind = { type = "literal", value = buffer.tostring(var2846) }
			elseif var2841 == 3 then
				local _ = nil
				local var2848, var2849 = protoModule.readBuffer(p170, var2836)
				var2836 = var2849
				var2835.kind = { type = "token", value = buffer.tostring(var2848) }
			elseif var2841 == 4 then
				local _ = nil
				local var2850, var2851 = protoModule.readBuffer(p170, var2836)
				var2836 = var2851
				var2835.kind = { type = "binding_path", value = buffer.tostring(var2850) }
			else
				local _ = nil
				local var2852, var2853 = protoModule.readVarInt(p170, var2836)
				var2836 = var2853 + var2852
			end
		elseif var2837 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2854, var2855 = protoModule.readFixed32(p170, var2836)
			local _ = var2854
			var2836 = var2855
		elseif var2837 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2856, var2857 = protoModule.readFixed64(p170, var2836)
			local _ = var2856
			var2836 = var2857
		else
			error("Unsupported wire type: " .. var2837)
		end
	end
	return var2835
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
	local var2859 = t_84.new()
	
	if self.condition ~= nil then
		var2859.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2859.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2859.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2859.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2859.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2859
end

t_84.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDim2Prop_ConditionalOption = t_84
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOption)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p171)
	-- upvalues: t_85 (ref)
	return setmetatable({
		options = if p171 == nil or p171.options == nil then {} else p171.options
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2861 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2862 = v:encode()
			local var2863, var2864 = protoModule.writeTag(buff, var2861, 1, protoModule.wireTypes.lengthDelimited)
			var2863, var2864 = protoModule.writeBuffer(var2863, var2864, var2862, buffer.len(var2862))
			buff = var2863
			var2861 = var2864
		end
	end
	local buff_1 = buffer.create(var2861)
	buffer.copy(buff_1, 0, buff, 0, var2861)
	
	return buff_1
end

function t_85.decode(p172)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2866 = t_85.new()
	local var2867 = 0
	while var2867 < buffer.len(p172) do
		local _ = nil
		local var2868 = nil
		local var2869, var2870, var2871 = protoModule.readTag(p172, var2867)
		local var2872 = var2869
		var2868 = var2870
		var2867 = var2871
		
		if var2868 == protoModule.wireTypes.varint then
			local _ = nil
			local var2873, var2874 = protoModule.readVarInt(p172, var2867)
			local _ = var2873
			var2867 = var2874
			continue
		end
		if var2868 == protoModule.wireTypes.lengthDelimited then
			if var2872 == 1 then
				local _ = nil
				local var2875, var2876 = protoModule.readBuffer(p172, var2867)
				var2867 = var2876
				table.insert(var2866.options, t.UiScaledUDim2Prop_ConditionalOption.decode(var2875))
			else
				local _ = nil
				local var2877, var2878 = protoModule.readVarInt(p172, var2867)
				var2867 = var2878 + var2877
			end
		elseif var2868 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2879, var2880 = protoModule.readFixed32(p172, var2867)
			local _ = var2879
			var2867 = var2880
		elseif var2868 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2881, var2882 = protoModule.readFixed64(p172, var2867)
			local _ = var2881
			var2867 = var2882
		else
			error("Unsupported wire type: " .. var2868)
		end
	end
	return var2866
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
	local var2885 = t_85.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var2885.options = t_1
	end
	return var2885
end

t_85.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDim2Prop_ConditionalOptions = t_85
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOptions)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p173)
	-- upvalues: t_86 (ref)
	return setmetatable({
		user_id = if p173 == nil or p173.user_id == nil then nil else p173.user_id,
		user_presence = if p173 == nil or p173.user_presence == nil then nil else p173.user_presence
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2888 = 0
	
	if self.user_id ~= nil then
		local var2889 = self.user_id:encode()
		local var2890, var2891 = protoModule.writeTag(buff, var2888, 1, protoModule.wireTypes.lengthDelimited)
		var2890, var2891 = protoModule.writeBuffer(var2890, var2891, var2889, buffer.len(var2889))
		buff = var2890
		var2888 = var2891
	end
	if self.user_presence ~= nil then
		local var2892 = self.user_presence:encode()
		local var2893, var2894 = protoModule.writeTag(buff, var2888, 2, protoModule.wireTypes.lengthDelimited)
		var2893, var2894 = protoModule.writeBuffer(var2893, var2894, var2892, buffer.len(var2892))
		buff = var2893
		var2888 = var2894
	end
	local buff_1 = buffer.create(var2888)
	buffer.copy(buff_1, 0, buff, 0, var2888)
	
	return buff_1
end

function t_86.decode(p174)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2896 = t_86.new()
	local var2897 = 0
	while var2897 < buffer.len(p174) do
		local _ = nil
		local var2898 = nil
		local var2899, var2900, var2901 = protoModule.readTag(p174, var2897)
		local var2902 = var2899
		var2898 = var2900
		var2897 = var2901
		
		if var2898 == protoModule.wireTypes.varint then
			local _ = nil
			local var2903, var2904 = protoModule.readVarInt(p174, var2897)
			local _ = var2903
			var2897 = var2904
			continue
		end
		if var2898 == protoModule.wireTypes.lengthDelimited then
			if var2902 == 1 then
				local _ = nil
				local var2905, var2906 = protoModule.readBuffer(p174, var2897)
				var2897 = var2906
				var2896.user_id = t.Int64Prop.decode(var2905)
			elseif var2902 == 2 then
				local _ = nil
				local var2907, var2908 = protoModule.readBuffer(p174, var2897)
				var2897 = var2908
				var2896.user_presence = t.StringProp.decode(var2907)
			else
				local _ = nil
				local var2909, var2910 = protoModule.readVarInt(p174, var2897)
				var2897 = var2910 + var2909
			end
		elseif var2898 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2911, var2912 = protoModule.readFixed32(p174, var2897)
			local _ = var2911
			var2897 = var2912
		elseif var2898 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2913, var2914 = protoModule.readFixed64(p174, var2897)
			local _ = var2913
			var2897 = var2914
		else
			error("Unsupported wire type: " .. var2898)
		end
	end
	return var2896
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
	local var2916 = t_86.new()
	
	if self.user_id ~= nil then
		var2916.user_id = t.Int64Prop.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var2916.user_id = t.Int64Prop.jsonDecode(self.userId)
	end
	if self.user_presence ~= nil then
		var2916.user_presence = t.StringProp.jsonDecode(self.user_presence)
	end
	if self.userPresence ~= nil then
		var2916.user_presence = t.StringProp.jsonDecode(self.userPresence)
	end
	return var2916
end

t_86.descriptor = {
	name = "AvatarConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarConfigProp"
}
t.AvatarConfigProp = t_86
typeRegistryModule.default:register(t.AvatarConfigProp)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p175)
	-- upvalues: t_87 (ref)
	return setmetatable({
		oneof_prop = if p175 == nil or p175.oneof_prop == nil then nil else p175.oneof_prop
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2918 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "user_id" then
			local var2919 = self.oneof_prop.value:encode()
			local var2920, var2921 = protoModule.writeTag(buff, var2918, 1, protoModule.wireTypes.lengthDelimited)
			var2920, var2921 = protoModule.writeBuffer(var2920, var2921, var2919, buffer.len(var2919))
			buff = var2920
			var2918 = var2921
		elseif self.oneof_prop.type == "avatar_config" then
			local var2922 = self.oneof_prop.value:encode()
			local var2923, var2924 = protoModule.writeTag(buff, var2918, 2, protoModule.wireTypes.lengthDelimited)
			var2923, var2924 = protoModule.writeBuffer(var2923, var2924, var2922, buffer.len(var2922))
			buff = var2923
			var2918 = var2924
		end
	end
	local buff_1 = buffer.create(var2918)
	buffer.copy(buff_1, 0, buff, 0, var2918)
	
	return buff_1
end

function t_87.decode(p176)
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2926 = t_87.new()
	local var2927 = 0
	while var2927 < buffer.len(p176) do
		local _ = nil
		local var2928 = nil
		local var2929, var2930, var2931 = protoModule.readTag(p176, var2927)
		local var2932 = var2929
		var2928 = var2930
		var2927 = var2931
		
		if var2928 == protoModule.wireTypes.varint then
			local _ = nil
			local var2933, var2934 = protoModule.readVarInt(p176, var2927)
			local _ = var2933
			var2927 = var2934
			continue
		end
		if var2928 == protoModule.wireTypes.lengthDelimited then
			if var2932 == 1 then
				local _ = nil
				local var2935, var2936 = protoModule.readBuffer(p176, var2927)
				var2927 = var2936
				var2926.oneof_prop = { type = "user_id", value = t.Int64Prop.decode(var2935) }
			elseif var2932 == 2 then
				local _ = nil
				local var2937, var2938 = protoModule.readBuffer(p176, var2927)
				var2927 = var2938
				var2926.oneof_prop = {
					type = "avatar_config",
					value = t.AvatarConfigProp.decode(var2937)
				}
			else
				local _ = nil
				local var2939, var2940 = protoModule.readVarInt(p176, var2927)
				var2927 = var2940 + var2939
			end
		elseif var2928 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2941, var2942 = protoModule.readFixed32(p176, var2927)
			local _ = var2941
			var2927 = var2942
		elseif var2928 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2943, var2944 = protoModule.readFixed64(p176, var2927)
			local _ = var2943
			var2927 = var2944
		else
			error("Unsupported wire type: " .. var2928)
		end
	end
	return var2926
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
	local var2946 = t_87.new()
	
	if self.user_id ~= nil then
		var2946.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.user_id)
		}
	end
	if self.userId ~= nil then
		var2946.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.userId)
		}
	end
	if self.avatar_config ~= nil then
		var2946.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatar_config)
		}
	end
	if self.avatarConfig ~= nil then
		var2946.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatarConfig)
		}
	end
	return var2946
end

t_87.descriptor = {
	name = "AvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarProp"
}
t.AvatarProp = t_87
typeRegistryModule.default:register(t.AvatarProp)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p177)
	-- upvalues: t_88 (ref)
	return setmetatable({
		kind = if p177 == nil or p177.kind == nil then nil else p177.kind
	}, t_88)
end

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2948 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2949 = self.kind.value:encode()
			local var2950, var2951 = protoModule.writeTag(buff, var2948, 1, protoModule.wireTypes.lengthDelimited)
			var2950, var2951 = protoModule.writeBuffer(var2950, var2951, var2949, buffer.len(var2949))
			buff = var2950
			var2948 = var2951
		elseif self.kind.type == "binding_path" then
			local var2952, var2953 = protoModule.writeTag(buff, var2948, 2, protoModule.wireTypes.lengthDelimited)
			var2952, var2953 = protoModule.writeString(var2952, var2953, self.kind.value)
			buff = var2952
			var2948 = var2953
		elseif self.kind.type == "conditional" then
			local var2954 = self.kind.value:encode()
			local var2955, var2956 = protoModule.writeTag(buff, var2948, 3, protoModule.wireTypes.lengthDelimited)
			var2955, var2956 = protoModule.writeBuffer(var2955, var2956, var2954, buffer.len(var2954))
			buff = var2955
			var2948 = var2956
		elseif self.kind.type == "array_map" then
			local var2957 = self.kind.value:encode()
			local var2958, var2959 = protoModule.writeTag(buff, var2948, 4, protoModule.wireTypes.lengthDelimited)
			var2958, var2959 = protoModule.writeBuffer(var2958, var2959, var2957, buffer.len(var2957))
			buff = var2958
			var2948 = var2959
		end
	end
	local buff_1 = buffer.create(var2948)
	buffer.copy(buff_1, 0, buff, 0, var2948)
	
	return buff_1
end

function t_88.decode(p178)
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2961 = t_88.new()
	local var2962 = 0
	while var2962 < buffer.len(p178) do
		local _ = nil
		local var2963 = nil
		local var2964, var2965, var2966 = protoModule.readTag(p178, var2962)
		local var2967 = var2964
		var2963 = var2965
		var2962 = var2966
		
		if var2963 == protoModule.wireTypes.varint then
			local _ = nil
			local var2968, var2969 = protoModule.readVarInt(p178, var2962)
			local _ = var2968
			var2962 = var2969
			continue
		end
		if var2963 == protoModule.wireTypes.lengthDelimited then
			if var2967 == 1 then
				local _ = nil
				local var2970, var2971 = protoModule.readBuffer(p178, var2962)
				var2962 = var2971
				var2961.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var2970)
				}
			elseif var2967 == 2 then
				local _ = nil
				local var2972, var2973 = protoModule.readBuffer(p178, var2962)
				var2962 = var2973
				var2961.kind = { type = "binding_path", value = buffer.tostring(var2972) }
			elseif var2967 == 3 then
				local _ = nil
				local var2974, var2975 = protoModule.readBuffer(p178, var2962)
				var2962 = var2975
				var2961.kind = {
					type = "conditional",
					value = t.ArrayOfAvatarProp_ConditionalOptions.decode(var2974)
				}
			elseif var2967 == 4 then
				local _ = nil
				local var2976, var2977 = protoModule.readBuffer(p178, var2962)
				var2962 = var2977
				var2961.kind = {
					type = "array_map",
					value = t.ArrayOfAvatarProp_ArrayMap.decode(var2976)
				}
			else
				local _ = nil
				local var2978, var2979 = protoModule.readVarInt(p178, var2962)
				var2962 = var2979 + var2978
			end
		elseif var2963 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2980, var2981 = protoModule.readFixed32(p178, var2962)
			local _ = var2980
			var2962 = var2981
		elseif var2963 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2982, var2983 = protoModule.readFixed64(p178, var2962)
			local _ = var2982
			var2962 = var2983
		else
			error("Unsupported wire type: " .. var2963)
		end
	end
	return var2961
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
	local var2985 = t_88.new()
	
	if self.literal ~= nil then
		var2985.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2985.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2985.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2985.kind = {
			type = "conditional",
			value = t.ArrayOfAvatarProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var2985.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var2985.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var2985
end

t_88.descriptor = {
	name = "ArrayOfAvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatarProp"
}
t.ArrayOfAvatarProp = t_88
typeRegistryModule.default:register(t.ArrayOfAvatarProp)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p179)
	-- upvalues: t_89 (ref)
	return setmetatable({
		condition = if p179 == nil or p179.condition == nil then nil else p179.condition,
		kind = if p179 == nil or p179.kind == nil then nil else p179.kind
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2987 = 0
	
	if self.condition ~= nil then
		local var2988 = self.condition:encode()
		local var2989, var2990 = protoModule.writeTag(buff, var2987, 1, protoModule.wireTypes.lengthDelimited)
		var2989, var2990 = protoModule.writeBuffer(var2989, var2990, var2988, buffer.len(var2988))
		buff = var2989
		var2987 = var2990
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2991 = self.kind.value:encode()
			local var2992, var2993 = protoModule.writeTag(buff, var2987, 2, protoModule.wireTypes.lengthDelimited)
			var2992, var2993 = protoModule.writeBuffer(var2992, var2993, var2991, buffer.len(var2991))
			buff = var2992
			var2987 = var2993
		elseif self.kind.type == "binding_path" then
			local var2994, var2995 = protoModule.writeTag(buff, var2987, 3, protoModule.wireTypes.lengthDelimited)
			var2994, var2995 = protoModule.writeString(var2994, var2995, self.kind.value)
			buff = var2994
			var2987 = var2995
		end
	end
	local buff_1 = buffer.create(var2987)
	buffer.copy(buff_1, 0, buff, 0, var2987)
	
	return buff_1
end

function t_89.decode(p180)
	-- upvalues: t_89 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2997 = t_89.new()
	local var2998 = 0
	while var2998 < buffer.len(p180) do
		local _ = nil
		local var2999 = nil
		local var3000, var3001, var3002 = protoModule.readTag(p180, var2998)
		local var3003 = var3000
		var2999 = var3001
		var2998 = var3002
		
		if var2999 == protoModule.wireTypes.varint then
			local _ = nil
			local var3004, var3005 = protoModule.readVarInt(p180, var2998)
			local _ = var3004
			var2998 = var3005
			continue
		end
		if var2999 == protoModule.wireTypes.lengthDelimited then
			if var3003 == 1 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p180, var2998)
				var2998 = var3007
				var2997.condition = propConditionModule.PropCondition.decode(var3006)
			elseif var3003 == 2 then
				local _ = nil
				local var3008, var3009 = protoModule.readBuffer(p180, var2998)
				var2998 = var3009
				var2997.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var3008)
				}
			elseif var3003 == 3 then
				local _ = nil
				local var3010, var3011 = protoModule.readBuffer(p180, var2998)
				var2998 = var3011
				var2997.kind = { type = "binding_path", value = buffer.tostring(var3010) }
			else
				local _ = nil
				local var3012, var3013 = protoModule.readVarInt(p180, var2998)
				var2998 = var3013 + var3012
			end
		elseif var2999 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3014, var3015 = protoModule.readFixed32(p180, var2998)
			local _ = var3014
			var2998 = var3015
		elseif var2999 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3016, var3017 = protoModule.readFixed64(p180, var2998)
			local _ = var3016
			var2998 = var3017
		else
			error("Unsupported wire type: " .. var2999)
		end
	end
	return var2997
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
	local var3019 = t_89.new()
	
	if self.condition ~= nil then
		var3019.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3019.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3019.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3019.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3019
end

t_89.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfAvatarProp_ConditionalOption = t_89
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOption)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p181)
	-- upvalues: t_90 (ref)
	return setmetatable({
		options = if p181 == nil or p181.options == nil then {} else p181.options
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3021 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3022 = v:encode()
			local var3023, var3024 = protoModule.writeTag(buff, var3021, 1, protoModule.wireTypes.lengthDelimited)
			var3023, var3024 = protoModule.writeBuffer(var3023, var3024, var3022, buffer.len(var3022))
			buff = var3023
			var3021 = var3024
		end
	end
	local buff_1 = buffer.create(var3021)
	buffer.copy(buff_1, 0, buff, 0, var3021)
	
	return buff_1
end

function t_90.decode(p182)
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var3026 = t_90.new()
	local var3027 = 0
	while var3027 < buffer.len(p182) do
		local _ = nil
		local var3028 = nil
		local var3029, var3030, var3031 = protoModule.readTag(p182, var3027)
		local var3032 = var3029
		var3028 = var3030
		var3027 = var3031
		
		if var3028 == protoModule.wireTypes.varint then
			local _ = nil
			local var3033, var3034 = protoModule.readVarInt(p182, var3027)
			local _ = var3033
			var3027 = var3034
			continue
		end
		if var3028 == protoModule.wireTypes.lengthDelimited then
			if var3032 == 1 then
				local _ = nil
				local var3035, var3036 = protoModule.readBuffer(p182, var3027)
				var3027 = var3036
				table.insert(var3026.options, t.ArrayOfAvatarProp_ConditionalOption.decode(var3035))
			else
				local _ = nil
				local var3037, var3038 = protoModule.readVarInt(p182, var3027)
				var3027 = var3038 + var3037
			end
		elseif var3028 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3039, var3040 = protoModule.readFixed32(p182, var3027)
			local _ = var3039
			var3027 = var3040
		elseif var3028 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3041, var3042 = protoModule.readFixed64(p182, var3027)
			local _ = var3041
			var3027 = var3042
		else
			error("Unsupported wire type: " .. var3028)
		end
	end
	return var3026
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
	local var3045 = t_90.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfAvatarProp_ConditionalOption.jsonDecode(v))
		end
		var3045.options = t_1
	end
	return var3045
end

t_90.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfAvatarProp_ConditionalOptions = t_90
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOptions)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p183)
	-- upvalues: t_91 (ref)
	return setmetatable({
		array = if p183 == nil or p183.array == nil then {} else p183.array
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3048 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var3049 = v:encode()
			local var3050, var3051 = protoModule.writeTag(buff, var3048, 1, protoModule.wireTypes.lengthDelimited)
			var3050, var3051 = protoModule.writeBuffer(var3050, var3051, var3049, buffer.len(var3049))
			buff = var3050
			var3048 = var3051
		end
	end
	local buff_1 = buffer.create(var3048)
	buffer.copy(buff_1, 0, buff, 0, var3048)
	
	return buff_1
end

function t_91.decode(p184)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3053 = t_91.new()
	local var3054 = 0
	while var3054 < buffer.len(p184) do
		local _ = nil
		local var3055 = nil
		local var3056, var3057, var3058 = protoModule.readTag(p184, var3054)
		local var3059 = var3056
		var3055 = var3057
		var3054 = var3058
		
		if var3055 == protoModule.wireTypes.varint then
			local _ = nil
			local var3060, var3061 = protoModule.readVarInt(p184, var3054)
			local _ = var3060
			var3054 = var3061
			continue
		end
		if var3055 == protoModule.wireTypes.lengthDelimited then
			if var3059 == 1 then
				local _ = nil
				local var3062, var3063 = protoModule.readBuffer(p184, var3054)
				var3054 = var3063
				table.insert(var3053.array, t.AvatarProp.decode(var3062))
			else
				local _ = nil
				local var3064, var3065 = protoModule.readVarInt(p184, var3054)
				var3054 = var3065 + var3064
			end
		elseif var3055 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3066, var3067 = protoModule.readFixed32(p184, var3054)
			local _ = var3066
			var3054 = var3067
		elseif var3055 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3068, var3069 = protoModule.readFixed64(p184, var3054)
			local _ = var3068
			var3054 = var3069
		else
			error("Unsupported wire type: " .. var3055)
		end
	end
	return var3053
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
	local var3072 = t_91.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.AvatarProp.jsonDecode(v))
		end
		var3072.array = t_1
	end
	return var3072
end

t_91.descriptor = {
	name = "ArrayOfAvatarProp_ArrayOfAvatars",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatars"
}
t.ArrayOfAvatarProp_ArrayOfAvatars = t_91
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayOfAvatars)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p185)
	-- upvalues: t_92 (ref)
	return setmetatable({
		kind = if p185 == nil or p185.kind == nil then nil else p185.kind,
		item_hydration_specs = if p185 == nil or p185.item_hydration_specs == nil then {} else p185.item_hydration_specs,
		field_map = if p185 == nil or p185.field_map == nil then nil else p185.field_map
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3075 = 0
	
	if self.kind ~= nil and self.kind.type == "binding_path" then
		local var3076, var3077 = protoModule.writeTag(buff, var3075, 1, protoModule.wireTypes.lengthDelimited)
		var3076, var3077 = protoModule.writeString(var3076, var3077, self.kind.value)
		buff = var3076
		var3075 = var3077
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var3078 = v:encode()
			local var3079, var3080 = protoModule.writeTag(buff, var3075, 3, protoModule.wireTypes.lengthDelimited)
			var3079, var3080 = protoModule.writeBuffer(var3079, var3080, var3078, buffer.len(var3078))
			buff = var3079
			var3075 = var3080
		end
	end
	if self.field_map ~= nil then
		local var3081 = self.field_map:encode()
		local var3082, var3083 = protoModule.writeTag(buff, var3075, 4, protoModule.wireTypes.lengthDelimited)
		var3082, var3083 = protoModule.writeBuffer(var3082, var3083, var3081, buffer.len(var3081))
		buff = var3082
		var3075 = var3083
	end
	local buff_1 = buffer.create(var3075)
	buffer.copy(buff_1, 0, buff, 0, var3075)
	
	return buff_1
end

function t_92.decode(p186)
	-- upvalues: t_92 (ref), protoModule (ref), hydrationDataSpecModule (ref), t (ref)
	local var3085 = t_92.new()
	local var3086 = 0
	while var3086 < buffer.len(p186) do
		local _ = nil
		local var3087 = nil
		local var3088, var3089, var3090 = protoModule.readTag(p186, var3086)
		local var3091 = var3088
		var3087 = var3089
		var3086 = var3090
		
		if var3087 == protoModule.wireTypes.varint then
			local _ = nil
			local var3092, var3093 = protoModule.readVarInt(p186, var3086)
			local _ = var3092
			var3086 = var3093
			continue
		end
		if var3087 == protoModule.wireTypes.lengthDelimited then
			if var3091 == 1 then
				local _ = nil
				local var3094, var3095 = protoModule.readBuffer(p186, var3086)
				var3086 = var3095
				var3085.kind = { type = "binding_path", value = buffer.tostring(var3094) }
			elseif var3091 == 3 then
				local _ = nil
				local var3096, var3097 = protoModule.readBuffer(p186, var3086)
				var3086 = var3097
				table.insert(var3085.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var3096))
			elseif var3091 == 4 then
				local _ = nil
				local var3098, var3099 = protoModule.readBuffer(p186, var3086)
				var3086 = var3099
				var3085.field_map = t.AvatarConfigProp.decode(var3098)
			else
				local _ = nil
				local var3100, var3101 = protoModule.readVarInt(p186, var3086)
				var3086 = var3101 + var3100
			end
		elseif var3087 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3102, var3103 = protoModule.readFixed32(p186, var3086)
			local _ = var3102
			var3086 = var3103
		elseif var3087 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3104, var3105 = protoModule.readFixed64(p186, var3086)
			local _ = var3104
			var3086 = var3105
		else
			error("Unsupported wire type: " .. var3087)
		end
	end
	return var3085
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
	local var3108 = t_92.new()
	
	if self.binding_path ~= nil then
		var3108.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3108.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var3108.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var3108.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var3108.field_map = t.AvatarConfigProp.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var3108.field_map = t.AvatarConfigProp.jsonDecode(self.fieldMap)
	end
	return var3108
end

t_92.descriptor = {
	name = "ArrayOfAvatarProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfAvatarProp_ArrayMap = t_92
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayMap)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p187)
	-- upvalues: t_93 (ref)
	return setmetatable({
		kind = if p187 == nil or p187.kind == nil then nil else p187.kind
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var3112 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3113, var3114 = protoModule.writeTag(buff, var3112, 1, protoModule.wireTypes.varint)
			var3113, var3114 = protoModule.writeVarInt(var3113, var3114, t.ScaleBasis.toNumber(self.kind.value))
			buff = var3113
			var3112 = var3114
		elseif self.kind.type == "binding_path" then
			local var3115, var3116 = protoModule.writeTag(buff, var3112, 2, protoModule.wireTypes.lengthDelimited)
			var3115, var3116 = protoModule.writeString(var3115, var3116, self.kind.value)
			buff = var3115
			var3112 = var3116
		elseif self.kind.type == "conditional" then
			local var3117 = self.kind.value:encode()
			local var3118, var3119 = protoModule.writeTag(buff, var3112, 3, protoModule.wireTypes.lengthDelimited)
			var3118, var3119 = protoModule.writeBuffer(var3118, var3119, var3117, buffer.len(var3117))
			buff = var3118
			var3112 = var3119
		end
	end
	local buff_1 = buffer.create(var3112)
	buffer.copy(buff_1, 0, buff, 0, var3112)
	
	return buff_1
end

function t_93.decode(p188)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var3121 = t_93.new()
	local var3122 = 0
	while var3122 < buffer.len(p188) do
		local _ = nil
		local var3123 = nil
		local var3124, var3125, var3126 = protoModule.readTag(p188, var3122)
		local var3127 = var3124
		var3123 = var3125
		var3122 = var3126
		
		if var3123 == protoModule.wireTypes.varint then
			if var3127 == 1 then
				local _ = nil
				local var3128, var3129 = protoModule.readVarIntI32(p188, var3122)
				local var3130 = var3128
				var3122 = var3129
				var3121.kind = {
					type = "literal",
					value = t.ScaleBasis.fromNumber(var3130) or var3130
				}
			else
				local _ = nil
				local var3131, var3132 = protoModule.readVarInt(p188, var3122)
				local _ = var3131
				var3122 = var3132
			end
		end
		if var3123 == protoModule.wireTypes.lengthDelimited then
			if var3127 == 2 then
				local _ = nil
				local var3133, var3134 = protoModule.readBuffer(p188, var3122)
				var3122 = var3134
				var3121.kind = { type = "binding_path", value = buffer.tostring(var3133) }
			elseif var3127 == 3 then
				local _ = nil
				local var3135, var3136 = protoModule.readBuffer(p188, var3122)
				var3122 = var3136
				var3121.kind = {
					type = "conditional",
					value = t.ScaleBasisProp_ConditionalOptions.decode(var3135)
				}
			else
				local _ = nil
				local var3137, var3138 = protoModule.readVarInt(p188, var3122)
				var3122 = var3138 + var3137
			end
		elseif var3123 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3139, var3140 = protoModule.readFixed32(p188, var3122)
			local _ = var3139
			var3122 = var3140
		elseif var3123 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3141, var3142 = protoModule.readFixed64(p188, var3122)
			local _ = var3141
			var3122 = var3142
		else
			error("Unsupported wire type: " .. var3123)
		end
	end
	return var3121
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
	local var3144 = t_93.new()
	
	if self.literal ~= nil then
		var3144.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleBasis.fromNumber(self.literal) or self.literal else t.ScaleBasis.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var3144.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3144.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var3144.kind = {
			type = "conditional",
			value = t.ScaleBasisProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3144
end

t_93.descriptor = {
	name = "ScaleBasisProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ScaleBasisProp"
}
t.ScaleBasisProp = t_93
typeRegistryModule.default:register(t.ScaleBasisProp)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p189)
	-- upvalues: t_94 (ref)
	return setmetatable({
		condition = if p189 == nil or p189.condition == nil then nil else p189.condition,
		kind = if p189 == nil or p189.kind == nil then nil else p189.kind
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var3146 = 0
	
	if self.condition ~= nil then
		local var3147 = self.condition:encode()
		local var3148, var3149 = protoModule.writeTag(buff, var3146, 1, protoModule.wireTypes.lengthDelimited)
		var3148, var3149 = protoModule.writeBuffer(var3148, var3149, var3147, buffer.len(var3147))
		buff = var3148
		var3146 = var3149
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3150, var3151 = protoModule.writeTag(buff, var3146, 2, protoModule.wireTypes.varint)
			var3150, var3151 = protoModule.writeVarInt(var3150, var3151, t.ScaleBasis.toNumber(self.kind.value))
			buff = var3150
			var3146 = var3151
		elseif self.kind.type == "binding_path" then
			local var3152, var3153 = protoModule.writeTag(buff, var3146, 3, protoModule.wireTypes.lengthDelimited)
			var3152, var3153 = protoModule.writeString(var3152, var3153, self.kind.value)
			buff = var3152
			var3146 = var3153
		end
	end
	local buff_1 = buffer.create(var3146)
	buffer.copy(buff_1, 0, buff, 0, var3146)
	
	return buff_1
end

function t_94.decode(p190)
	-- upvalues: t_94 (ref), protoModule (ref), t (ref), propConditionModule (ref)
	local var3155 = t_94.new()
	local var3156 = 0
	while var3156 < buffer.len(p190) do
		local _ = nil
		local var3157 = nil
		local var3158, var3159, var3160 = protoModule.readTag(p190, var3156)
		local var3161 = var3158
		var3157 = var3159
		var3156 = var3160
		
		if var3157 == protoModule.wireTypes.varint then
			if var3161 == 2 then
				local _ = nil
				local var3162, var3163 = protoModule.readVarIntI32(p190, var3156)
				local var3164 = var3162
				var3156 = var3163
				var3155.kind = {
					type = "literal",
					value = t.ScaleBasis.fromNumber(var3164) or var3164
				}
			else
				local _ = nil
				local var3165, var3166 = protoModule.readVarInt(p190, var3156)
				local _ = var3165
				var3156 = var3166
			end
		end
		if var3157 == protoModule.wireTypes.lengthDelimited then
			if var3161 == 1 then
				local _ = nil
				local var3167, var3168 = protoModule.readBuffer(p190, var3156)
				var3156 = var3168
				var3155.condition = propConditionModule.PropCondition.decode(var3167)
			elseif var3161 == 3 then
				local _ = nil
				local var3169, var3170 = protoModule.readBuffer(p190, var3156)
				var3156 = var3170
				var3155.kind = { type = "binding_path", value = buffer.tostring(var3169) }
			else
				local _ = nil
				local var3171, var3172 = protoModule.readVarInt(p190, var3156)
				var3156 = var3172 + var3171
			end
		elseif var3157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3173, var3174 = protoModule.readFixed32(p190, var3156)
			local _ = var3173
			var3156 = var3174
		elseif var3157 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3175, var3176 = protoModule.readFixed64(p190, var3156)
			local _ = var3175
			var3156 = var3176
		else
			error("Unsupported wire type: " .. var3157)
		end
	end
	return var3155
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
	local var3178 = t_94.new()
	
	if self.condition ~= nil then
		var3178.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3178.kind = {
			type = "literal",
			value = if typeof(self.literal) == "number" then t.ScaleBasis.fromNumber(self.literal) or self.literal else t.ScaleBasis.fromName(self.literal) or self.literal
		}
	end
	if self.binding_path ~= nil then
		var3178.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3178.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3178
end

t_94.descriptor = {
	name = "ScaleBasisProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ScaleBasisProp_ConditionalOption = t_94
typeRegistryModule.default:register(t.ScaleBasisProp_ConditionalOption)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p191)
	-- upvalues: t_95 (ref)
	return setmetatable({
		options = if p191 == nil or p191.options == nil then {} else p191.options
	}, t_95)
end

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3180 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3181 = v:encode()
			local var3182, var3183 = protoModule.writeTag(buff, var3180, 1, protoModule.wireTypes.lengthDelimited)
			var3182, var3183 = protoModule.writeBuffer(var3182, var3183, var3181, buffer.len(var3181))
			buff = var3182
			var3180 = var3183
		end
	end
	local buff_1 = buffer.create(var3180)
	buffer.copy(buff_1, 0, buff, 0, var3180)
	
	return buff_1
end

function t_95.decode(p192)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var3185 = t_95.new()
	local var3186 = 0
	while var3186 < buffer.len(p192) do
		local _ = nil
		local var3187 = nil
		local var3188, var3189, var3190 = protoModule.readTag(p192, var3186)
		local var3191 = var3188
		var3187 = var3189
		var3186 = var3190
		
		if var3187 == protoModule.wireTypes.varint then
			local _ = nil
			local var3192, var3193 = protoModule.readVarInt(p192, var3186)
			local _ = var3192
			var3186 = var3193
			continue
		end
		if var3187 == protoModule.wireTypes.lengthDelimited then
			if var3191 == 1 then
				local _ = nil
				local var3194, var3195 = protoModule.readBuffer(p192, var3186)
				var3186 = var3195
				table.insert(var3185.options, t.ScaleBasisProp_ConditionalOption.decode(var3194))
			else
				local _ = nil
				local var3196, var3197 = protoModule.readVarInt(p192, var3186)
				var3186 = var3197 + var3196
			end
		elseif var3187 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3198, var3199 = protoModule.readFixed32(p192, var3186)
			local _ = var3198
			var3186 = var3199
		elseif var3187 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3200, var3201 = protoModule.readFixed64(p192, var3186)
			local _ = var3200
			var3186 = var3201
		else
			error("Unsupported wire type: " .. var3187)
		end
	end
	return var3185
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
	local var3204 = t_95.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ScaleBasisProp_ConditionalOption.jsonDecode(v))
		end
		var3204.options = t_1
	end
	return var3204
end

t_95.descriptor = {
	name = "ScaleBasisProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ScaleBasisProp_ConditionalOptions = t_95
typeRegistryModule.default:register(t.ScaleBasisProp_ConditionalOptions)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p193)
	-- upvalues: t_96 (ref)
	return setmetatable({
		kind = if p193 == nil or p193.kind == nil then nil else p193.kind
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3207 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3208 = self.kind.value:encode()
			local var3209, var3210 = protoModule.writeTag(buff, var3207, 1, protoModule.wireTypes.lengthDelimited)
			var3209, var3210 = protoModule.writeBuffer(var3209, var3210, var3208, buffer.len(var3208))
			buff = var3209
			var3207 = var3210
		elseif self.kind.type == "binding_path" then
			local var3211, var3212 = protoModule.writeTag(buff, var3207, 2, protoModule.wireTypes.lengthDelimited)
			var3211, var3212 = protoModule.writeString(var3211, var3212, self.kind.value)
			buff = var3211
			var3207 = var3212
		elseif self.kind.type == "conditional" then
			local var3213 = self.kind.value:encode()
			local var3214, var3215 = protoModule.writeTag(buff, var3207, 3, protoModule.wireTypes.lengthDelimited)
			var3214, var3215 = protoModule.writeBuffer(var3214, var3215, var3213, buffer.len(var3213))
			buff = var3214
			var3207 = var3215
		end
	end
	local buff_1 = buffer.create(var3207)
	buffer.copy(buff_1, 0, buff, 0, var3207)
	
	return buff_1
end

function t_96.decode(p194)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3217 = t_96.new()
	local var3218 = 0
	while var3218 < buffer.len(p194) do
		local _ = nil
		local var3219 = nil
		local var3220, var3221, var3222 = protoModule.readTag(p194, var3218)
		local var3223 = var3220
		var3219 = var3221
		var3218 = var3222
		
		if var3219 == protoModule.wireTypes.varint then
			local _ = nil
			local var3224, var3225 = protoModule.readVarInt(p194, var3218)
			local _ = var3224
			var3218 = var3225
			continue
		end
		if var3219 == protoModule.wireTypes.lengthDelimited then
			if var3223 == 1 then
				local _ = nil
				local var3226, var3227 = protoModule.readBuffer(p194, var3218)
				var3218 = var3227
				var3217.kind = {
					type = "literal",
					value = t.StringArrayProp_LiteralValue.decode(var3226)
				}
			elseif var3223 == 2 then
				local _ = nil
				local var3228, var3229 = protoModule.readBuffer(p194, var3218)
				var3218 = var3229
				var3217.kind = { type = "binding_path", value = buffer.tostring(var3228) }
			elseif var3223 == 3 then
				local _ = nil
				local var3230, var3231 = protoModule.readBuffer(p194, var3218)
				var3218 = var3231
				var3217.kind = {
					type = "conditional",
					value = t.StringArrayProp_ConditionalOptions.decode(var3230)
				}
			else
				local _ = nil
				local var3232, var3233 = protoModule.readVarInt(p194, var3218)
				var3218 = var3233 + var3232
			end
		elseif var3219 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3234, var3235 = protoModule.readFixed32(p194, var3218)
			local _ = var3234
			var3218 = var3235
		elseif var3219 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3236, var3237 = protoModule.readFixed64(p194, var3218)
			local _ = var3236
			var3218 = var3237
		else
			error("Unsupported wire type: " .. var3219)
		end
	end
	return var3217
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
	local var3239 = t_96.new()
	
	if self.literal ~= nil then
		var3239.kind = {
			type = "literal",
			value = t.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3239.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3239.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var3239.kind = {
			type = "conditional",
			value = t.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3239
end

t_96.descriptor = {
	name = "StringArrayProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringArrayProp"
}
t.StringArrayProp = t_96
typeRegistryModule.default:register(t.StringArrayProp)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p195)
	-- upvalues: t_97 (ref)
	return setmetatable({
		items = if p195 == nil or p195.items == nil then {} else p195.items
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3241 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3242, var3243 = protoModule.writeTag(buff, var3241, 1, protoModule.wireTypes.lengthDelimited)
			var3242, var3243 = protoModule.writeString(var3242, var3243, v)
			buff = var3242
			var3241 = var3243
		end
	end
	local buff_1 = buffer.create(var3241)
	buffer.copy(buff_1, 0, buff, 0, var3241)
	
	return buff_1
end

function t_97.decode(p196)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var3245 = t_97.new()
	local var3246 = 0
	while var3246 < buffer.len(p196) do
		local _ = nil
		local var3247 = nil
		local var3248, var3249, var3250 = protoModule.readTag(p196, var3246)
		local var3251 = var3248
		var3247 = var3249
		var3246 = var3250
		
		if var3247 == protoModule.wireTypes.varint then
			local _ = nil
			local var3252, var3253 = protoModule.readVarInt(p196, var3246)
			local _ = var3252
			var3246 = var3253
			continue
		end
		if var3247 == protoModule.wireTypes.lengthDelimited then
			if var3251 == 1 then
				local _ = nil
				local var3254, var3255 = protoModule.readBuffer(p196, var3246)
				var3246 = var3255
				table.insert(var3245.items, buffer.tostring(var3254))
			else
				local _ = nil
				local var3256, var3257 = protoModule.readVarInt(p196, var3246)
				var3246 = var3257 + var3256
			end
		elseif var3247 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3258, var3259 = protoModule.readFixed32(p196, var3246)
			local _ = var3258
			var3246 = var3259
		elseif var3247 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3260, var3261 = protoModule.readFixed64(p196, var3246)
			local _ = var3260
			var3246 = var3261
		else
			error("Unsupported wire type: " .. var3247)
		end
	end
	return var3245
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
	local var3264 = t_97.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var3264.items = t
	end
	return var3264
end

t_97.descriptor = {
	name = "StringArrayProp_LiteralValue",
	fullName = "roblox.apppageplatform.shared.v1beta1.LiteralValue"
}
t.StringArrayProp_LiteralValue = t_97
typeRegistryModule.default:register(t.StringArrayProp_LiteralValue)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p197)
	-- upvalues: t_98 (ref)
	return setmetatable({
		condition = if p197 == nil or p197.condition == nil then nil else p197.condition,
		kind = if p197 == nil or p197.kind == nil then nil else p197.kind
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3267 = 0
	
	if self.condition ~= nil then
		local var3268 = self.condition:encode()
		local var3269, var3270 = protoModule.writeTag(buff, var3267, 1, protoModule.wireTypes.lengthDelimited)
		var3269, var3270 = protoModule.writeBuffer(var3269, var3270, var3268, buffer.len(var3268))
		buff = var3269
		var3267 = var3270
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var3271 = self.kind.value:encode()
			local var3272, var3273 = protoModule.writeTag(buff, var3267, 2, protoModule.wireTypes.lengthDelimited)
			var3272, var3273 = protoModule.writeBuffer(var3272, var3273, var3271, buffer.len(var3271))
			buff = var3272
			var3267 = var3273
		elseif self.kind.type == "binding_path" then
			local var3274, var3275 = protoModule.writeTag(buff, var3267, 3, protoModule.wireTypes.lengthDelimited)
			var3274, var3275 = protoModule.writeString(var3274, var3275, self.kind.value)
			buff = var3274
			var3267 = var3275
		elseif self.kind.type == "conditional" then
			local var3276 = self.kind.value:encode()
			local var3277, var3278 = protoModule.writeTag(buff, var3267, 4, protoModule.wireTypes.lengthDelimited)
			var3277, var3278 = protoModule.writeBuffer(var3277, var3278, var3276, buffer.len(var3276))
			buff = var3277
			var3267 = var3278
		end
	end
	local buff_1 = buffer.create(var3267)
	buffer.copy(buff_1, 0, buff, 0, var3267)
	
	return buff_1
end

function t_98.decode(p198)
	-- upvalues: t_98 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var3280 = t_98.new()
	local var3281 = 0
	while var3281 < buffer.len(p198) do
		local _ = nil
		local var3282 = nil
		local var3283, var3284, var3285 = protoModule.readTag(p198, var3281)
		local var3286 = var3283
		var3282 = var3284
		var3281 = var3285
		
		if var3282 == protoModule.wireTypes.varint then
			local _ = nil
			local var3287, var3288 = protoModule.readVarInt(p198, var3281)
			local _ = var3287
			var3281 = var3288
			continue
		end
		if var3282 == protoModule.wireTypes.lengthDelimited then
			if var3286 == 1 then
				local _ = nil
				local var3289, var3290 = protoModule.readBuffer(p198, var3281)
				var3281 = var3290
				var3280.condition = propConditionModule.PropCondition.decode(var3289)
			elseif var3286 == 2 then
				local _ = nil
				local var3291, var3292 = protoModule.readBuffer(p198, var3281)
				var3281 = var3292
				var3280.kind = {
					type = "literal",
					value = t.StringArrayProp_LiteralValue.decode(var3291)
				}
			elseif var3286 == 3 then
				local _ = nil
				local var3293, var3294 = protoModule.readBuffer(p198, var3281)
				var3281 = var3294
				var3280.kind = { type = "binding_path", value = buffer.tostring(var3293) }
			elseif var3286 == 4 then
				local _ = nil
				local var3295, var3296 = protoModule.readBuffer(p198, var3281)
				var3281 = var3296
				var3280.kind = {
					type = "conditional",
					value = t.StringArrayProp_ConditionalOptions.decode(var3295)
				}
			else
				local _ = nil
				local var3297, var3298 = protoModule.readVarInt(p198, var3281)
				var3281 = var3298 + var3297
			end
		elseif var3282 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3299, var3300 = protoModule.readFixed32(p198, var3281)
			local _ = var3299
			var3281 = var3300
		elseif var3282 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3301, var3302 = protoModule.readFixed64(p198, var3281)
			local _ = var3301
			var3281 = var3302
		else
			error("Unsupported wire type: " .. var3282)
		end
	end
	return var3280
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
	local var3304 = t_98.new()
	
	if self.condition ~= nil then
		var3304.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3304.kind = {
			type = "literal",
			value = t.StringArrayProp_LiteralValue.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3304.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3304.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var3304.kind = {
			type = "conditional",
			value = t.StringArrayProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var3304
end

t_98.descriptor = {
	name = "StringArrayProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StringArrayProp_ConditionalOption = t_98
typeRegistryModule.default:register(t.StringArrayProp_ConditionalOption)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p199)
	-- upvalues: t_99 (ref)
	return setmetatable({
		options = if p199 == nil or p199.options == nil then {} else p199.options
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3306 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3307 = v:encode()
			local var3308, var3309 = protoModule.writeTag(buff, var3306, 1, protoModule.wireTypes.lengthDelimited)
			var3308, var3309 = protoModule.writeBuffer(var3308, var3309, var3307, buffer.len(var3307))
			buff = var3308
			var3306 = var3309
		end
	end
	local buff_1 = buffer.create(var3306)
	buffer.copy(buff_1, 0, buff, 0, var3306)
	
	return buff_1
end

function t_99.decode(p200)
	-- upvalues: t_99 (ref), protoModule (ref), t (ref)
	local var3311 = t_99.new()
	local var3312 = 0
	while var3312 < buffer.len(p200) do
		local _ = nil
		local var3313 = nil
		local var3314, var3315, var3316 = protoModule.readTag(p200, var3312)
		local var3317 = var3314
		var3313 = var3315
		var3312 = var3316
		
		if var3313 == protoModule.wireTypes.varint then
			local _ = nil
			local var3318, var3319 = protoModule.readVarInt(p200, var3312)
			local _ = var3318
			var3312 = var3319
			continue
		end
		if var3313 == protoModule.wireTypes.lengthDelimited then
			if var3317 == 1 then
				local _ = nil
				local var3320, var3321 = protoModule.readBuffer(p200, var3312)
				var3312 = var3321
				table.insert(var3311.options, t.StringArrayProp_ConditionalOption.decode(var3320))
			else
				local _ = nil
				local var3322, var3323 = protoModule.readVarInt(p200, var3312)
				var3312 = var3323 + var3322
			end
		elseif var3313 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3324, var3325 = protoModule.readFixed32(p200, var3312)
			local _ = var3324
			var3312 = var3325
		elseif var3313 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3326, var3327 = protoModule.readFixed64(p200, var3312)
			local _ = var3326
			var3312 = var3327
		else
			error("Unsupported wire type: " .. var3313)
		end
	end
	return var3311
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
	local var3330 = t_99.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StringArrayProp_ConditionalOption.jsonDecode(v))
		end
		var3330.options = t_1
	end
	return var3330
end

t_99.descriptor = {
	name = "StringArrayProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StringArrayProp_ConditionalOptions = t_99
typeRegistryModule.default:register(t.StringArrayProp_ConditionalOptions)
t.ScaleBasis = {
	fromNumber = function(p201)
		return if p201 == 0 then "SCALE_BASIS_INVALID" elseif p201 == 1 then "SCALE_BASIS_PARENT" elseif p201 == 2 then "SCALE_BASIS_VIEWPORT" else nil
	end,
	toNumber = function(p202)
		return if p202 == "SCALE_BASIS_INVALID" then 0 elseif p202 == "SCALE_BASIS_PARENT" then 1 elseif p202 == "SCALE_BASIS_VIEWPORT" then 2 else p202
	end,
	fromName = function(p203)
		return if p203 == "SCALE_BASIS_INVALID" then "SCALE_BASIS_INVALID" elseif p203 == "SCALE_BASIS_PARENT" then "SCALE_BASIS_PARENT" elseif p203 == "SCALE_BASIS_VIEWPORT" then "SCALE_BASIS_VIEWPORT" else nil
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