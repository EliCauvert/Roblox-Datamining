local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local structModule = require(script.Parent.Parent.Parent.Parent.Parent.google.protobuf.struct)
local hydrationDataSpecModule = require(script.Parent.hydration_data_spec)
local propConditionModule = require(script.Parent.prop_condition)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 2813 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		namespace = if p0 == nil or p0.namespace == nil then "" else p0.namespace,
		key = if p0 == nil or p0.key == nil then "" else p0.key,
		map_key = if p0 == nil or p0.map_key == nil then "" else p0.map_key
	}, t_1)
end

function t_1:encode() --[[ line: 2821 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var99 = 0
	
	if self.namespace ~= nil and self.namespace ~= "" then
		local var100, var101 = protoModule.writeTag(buff, var99, 1, protoModule.wireTypes.lengthDelimited)
		var100, var101 = protoModule.writeString(var100, var101, self.namespace)
		buff = var100
		var99 = var101
	end
	if self.key ~= nil and self.key ~= "" then
		local var102, var103 = protoModule.writeTag(buff, var99, 2, protoModule.wireTypes.lengthDelimited)
		var102, var103 = protoModule.writeString(var102, var103, self.key)
		buff = var102
		var99 = var103
	end
	if self.map_key ~= nil and self.map_key ~= "" then
		local var104, var105 = protoModule.writeTag(buff, var99, 3, protoModule.wireTypes.lengthDelimited)
		var104, var105 = protoModule.writeString(var104, var105, self.map_key)
		buff = var104
		var99 = var105
	end
	local buff_1 = buffer.create(var99)
	buffer.copy(buff_1, 0, buff, 0, var99)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 2845 ]]
	-- upvalues: t_1 (ref), protoModule (ref)
	local var107 = t_1.new()
	local var108 = 0
	while var108 < buffer.len(p1) do
		local _ = nil
		local var109 = nil
		local var110, var111, var112 = protoModule.readTag(p1, var108)
		local var113 = var110
		var109 = var111
		var108 = var112
		
		if var109 == protoModule.wireTypes.varint then
			local _ = nil
			local var114, var115 = protoModule.readVarInt(p1, var108)
			local _ = var114
			var108 = var115
			continue
		end
		if var109 == protoModule.wireTypes.lengthDelimited then
			if var113 == 1 then
				local _ = nil
				local var116, var117 = protoModule.readBuffer(p1, var108)
				var108 = var117
				var107.namespace = buffer.tostring(var116)
			elseif var113 == 2 then
				local _ = nil
				local var118, var119 = protoModule.readBuffer(p1, var108)
				var108 = var119
				var107.key = buffer.tostring(var118)
			elseif var113 == 3 then
				local _ = nil
				local var120, var121 = protoModule.readBuffer(p1, var108)
				var108 = var121
				var107.map_key = buffer.tostring(var120)
			else
				local _ = nil
				local var122, var123 = protoModule.readVarInt(p1, var108)
				var108 = var123 + var122
			end
		elseif var109 == protoModule.wireTypes.i32 then
			local _ = nil
			local var124, var125 = protoModule.readFixed32(p1, var108)
			local _ = var124
			var108 = var125
		elseif var109 == protoModule.wireTypes.i64 then
			local _ = nil
			local var126, var127 = protoModule.readFixed64(p1, var108)
			local _ = var126
			var108 = var127
		else
			error("Unsupported wire type: " .. var109)
		end
	end
	return var107
end

function t_1:jsonEncode() --[[ line: 2898 ]]
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

function t_1:jsonDecode() --[[ line: 2916 ]]
	-- upvalues: t_1 (ref)
	local var129 = t_1.new()
	
	if self.namespace ~= nil then
		var129.namespace = self.namespace
	end
	if self.key ~= nil then
		var129.key = self.key
	end
	if self.map_key ~= nil then
		var129.map_key = self.map_key
	end
	if self.mapKey ~= nil then
		var129.map_key = self.mapKey
	end
	return var129
end

t_1.descriptor = {
	name = "TranslationRef",
	fullName = "roblox.apppageplatform.shared.v1beta1.TranslationRef"
}
t.TranslationRef = t_1
typeRegistryModule.default:register(t.TranslationRef)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 2952 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		str = if p2 == nil or p2.str == nil then "" else p2.str,
		args = if p2 == nil or p2.args == nil then {} else p2.args,
		translation = if p2 == nil or p2.translation == nil then nil else p2.translation
	}, t_2)
end

function t_2:encode() --[[ line: 2960 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var131 = 0
	
	if self.str ~= nil and self.str ~= "" then
		local var132, var133 = protoModule.writeTag(buff, var131, 1, protoModule.wireTypes.lengthDelimited)
		var132, var133 = protoModule.writeString(var132, var133, self.str)
		buff = var132
		var131 = var133
	end
	if self.args ~= nil and next(self.args) ~= nil then
		for i, v in self.args do
			local var134, var135 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var134, var135 = protoModule.writeString(var134, var135, i)
			local var136 = v:encode()
			var135, var137 = protoModule.writeTag(var134, var135, 2, protoModule.wireTypes.lengthDelimited)
			var135, var137 = protoModule.writeBuffer(var135, var137, var136, buffer.len(var136))
			local var138 = var135
			local var139 = var137
			local var140, var141 = protoModule.writeTag(buff, var131, 2, protoModule.wireTypes.lengthDelimited)
			var140, var141 = protoModule.writeBuffer(var140, var141, var138, var139)
			buff = var140
			var131 = var141
		end
	end
	if self.translation ~= nil then
		local var142 = self.translation:encode()
		local var143, var144 = protoModule.writeTag(buff, var131, 3, protoModule.wireTypes.lengthDelimited)
		var143, var144 = protoModule.writeBuffer(var143, var144, var142, buffer.len(var142))
		buff = var143
		var131 = var144
	end
	local buff_1 = buffer.create(var131)
	buffer.copy(buff_1, 0, buff, 0, var131)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 2994 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var146 = t_2.new()
	local var147 = 0
	while var147 < buffer.len(p3) do
		local _ = nil
		local var148 = nil
		local var149, var150, var151 = protoModule.readTag(p3, var147)
		local var152 = var149
		var148 = var150
		var147 = var151
		
		if var148 == protoModule.wireTypes.varint then
			local _ = nil
			local var153, var154 = protoModule.readVarInt(p3, var147)
			local _ = var153
			var147 = var154
			continue
		end
		if var148 == protoModule.wireTypes.lengthDelimited then
			if var152 == 1 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p3, var147)
				var147 = var156
				var146.str = buffer.tostring(var155)
			elseif var152 == 2 then
				local _ = nil
				local var157, var158 = protoModule.readBuffer(p3, var147)
				var147 = var158
				var157 = t.StringFormat_ArgsEntry.decode(var157)
				var146.args[var157.key or ""] = var157.value or t.StringFormat_FormatArg.new()
			elseif var152 == 3 then
				local _ = nil
				local var159, var160 = protoModule.readBuffer(p3, var147)
				var147 = var160
				var146.translation = t.TranslationRef.decode(var159)
			else
				local _ = nil
				local var161, var162 = protoModule.readVarInt(p3, var147)
				var147 = var162 + var161
			end
		elseif var148 == protoModule.wireTypes.i32 then
			local _ = nil
			local var163, var164 = protoModule.readFixed32(p3, var147)
			local _ = var163
			var147 = var164
		elseif var148 == protoModule.wireTypes.i64 then
			local _ = nil
			local var165, var166 = protoModule.readFixed64(p3, var147)
			local _ = var165
			var147 = var166
		else
			error("Unsupported wire type: " .. var148)
		end
	end
	return var146
end

function t_2:jsonEncode() --[[ line: 3054 ]]
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

function t_2:jsonDecode() --[[ line: 3076 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var169 = t_2.new()
	
	if self.str ~= nil then
		var169.str = self.str
	end
	if self.args ~= nil then
		local t_1 = {}
		
		for i, v in self.args do
			t_1[i] = t.StringFormat_FormatArg.jsonDecode(v)
		end
		var169.args = t_1
	end
	if self.translation ~= nil then
		var169.translation = t.TranslationRef.jsonDecode(self.translation)
	end
	return var169
end

t_2.descriptor = {
	name = "StringFormat",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringFormat"
}
t.StringFormat = t_2
typeRegistryModule.default:register(t.StringFormat)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 3113 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		kind = if p4 == nil or p4.kind == nil then nil else p4.kind,
		formatter = if p4 == nil or p4.formatter == nil then nil else p4.formatter
	}, t_3)
end

function t_3:encode() --[[ line: 3120 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var172 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var173, var174 = protoModule.writeTag(buff, var172, 1, protoModule.wireTypes.lengthDelimited)
			var173, var174 = protoModule.writeString(var173, var174, self.kind.value)
			buff = var173
			var172 = var174
		elseif self.kind.type == "binding_path" then
			local var175, var176 = protoModule.writeTag(buff, var172, 2, protoModule.wireTypes.lengthDelimited)
			var175, var176 = protoModule.writeString(var175, var176, self.kind.value)
			buff = var175
			var172 = var176
		end
	end
	if self.formatter ~= nil then
		local var177 = self.formatter:encode()
		local var178, var179 = protoModule.writeTag(buff, var172, 3, protoModule.wireTypes.lengthDelimited)
		var178, var179 = protoModule.writeBuffer(var178, var179, var177, buffer.len(var177))
		buff = var178
		var172 = var179
	end
	local buff_1 = buffer.create(var172)
	buffer.copy(buff_1, 0, buff, 0, var172)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 3145 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var181 = t_3.new()
	local var182 = 0
	while var182 < buffer.len(p5) do
		local _ = nil
		local var183 = nil
		local var184, var185, var186 = protoModule.readTag(p5, var182)
		local var187 = var184
		var183 = var185
		var182 = var186
		
		if var183 == protoModule.wireTypes.varint then
			local _ = nil
			local var188, var189 = protoModule.readVarInt(p5, var182)
			local _ = var188
			var182 = var189
			continue
		end
		if var183 == protoModule.wireTypes.lengthDelimited then
			if var187 == 1 then
				local _ = nil
				local var190, var191 = protoModule.readBuffer(p5, var182)
				var182 = var191
				var181.kind = { type = "literal", value = buffer.tostring(var190) }
			elseif var187 == 2 then
				local _ = nil
				local var192, var193 = protoModule.readBuffer(p5, var182)
				var182 = var193
				var181.kind = { type = "binding_path", value = buffer.tostring(var192) }
			elseif var187 == 3 then
				local _ = nil
				local var194, var195 = protoModule.readBuffer(p5, var182)
				var182 = var195
				var181.formatter = t.StringFormat_FormatArg_Formatter.decode(var194)
			else
				local _ = nil
				local var196, var197 = protoModule.readVarInt(p5, var182)
				var182 = var197 + var196
			end
		elseif var183 == protoModule.wireTypes.i32 then
			local _ = nil
			local var198, var199 = protoModule.readFixed32(p5, var182)
			local _ = var198
			var182 = var199
		elseif var183 == protoModule.wireTypes.i64 then
			local _ = nil
			local var200, var201 = protoModule.readFixed64(p5, var182)
			local _ = var200
			var182 = var201
		else
			error("Unsupported wire type: " .. var183)
		end
	end
	return var181
end

function t_3:jsonEncode() --[[ line: 3198 ]]
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

function t_3:jsonDecode() --[[ line: 3216 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var203 = t_3.new()
	
	if self.literal ~= nil then
		var203.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var203.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var203.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.formatter ~= nil then
		var203.formatter = t.StringFormat_FormatArg_Formatter.jsonDecode(self.formatter)
	end
	return var203
end

t_3.descriptor = {
	name = "StringFormat_FormatArg",
	fullName = "roblox.apppageplatform.shared.v1beta1.FormatArg"
}
t.StringFormat_FormatArg = t_3
typeRegistryModule.default:register(t.StringFormat_FormatArg)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 3252 ]]
	-- upvalues: t (ref), t_4 (ref)
	return setmetatable({
		type = if p6 == nil or p6.type == nil then assert(t.StringFormat_FormatArg_Formatter_Type.fromNumber(0), "Enum has no 0 default") else p6.type,
		config = if p6 == nil or p6.config == nil then nil else p6.config
	}, t_4)
end

function t_4:encode() --[[ line: 3263 ]]
	-- upvalues: t (ref), protoModule (ref)
	local buff = buffer.create(0)
	local var205 = 0
	
	if self.type ~= nil and (self.type ~= nil and self.type ~= 0 or self.type ~= t.StringFormat_FormatArg_Formatter_Type.fromNumber(0)) then
		local var206, var207 = protoModule.writeTag(buff, var205, 1, protoModule.wireTypes.varint)
		var206, var207 = protoModule.writeVarInt(var206, var207, t.StringFormat_FormatArg_Formatter_Type.toNumber(self.type))
		buff = var206
		var205 = var207
	end
	if self.config ~= nil and self.config.type == "date_config" then
		local var208 = self.config.value:encode()
		local var209, var210 = protoModule.writeTag(buff, var205, 2, protoModule.wireTypes.lengthDelimited)
		var209, var210 = protoModule.writeBuffer(var209, var210, var208, buffer.len(var208))
		buff = var209
		var205 = var210
	end
	local buff_1 = buffer.create(var205)
	buffer.copy(buff_1, 0, buff, 0, var205)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 3295 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var212 = t_4.new()
	local var213 = 0
	while var213 < buffer.len(p7) do
		local _ = nil
		local var214 = nil
		local var215, var216, var217 = protoModule.readTag(p7, var213)
		local var218 = var215
		var214 = var216
		var213 = var217
		
		if var214 == protoModule.wireTypes.varint then
			if var218 == 1 then
				local _ = nil
				local var219, var220 = protoModule.readVarIntI32(p7, var213)
				local var221 = var219
				var213 = var220
				var212.type = t.StringFormat_FormatArg_Formatter_Type.fromNumber(var221) or var221
			else
				local _ = nil
				local var222, var223 = protoModule.readVarInt(p7, var213)
				local _ = var222
				var213 = var223
			end
		end
		if var214 == protoModule.wireTypes.lengthDelimited then
			if var218 == 2 then
				local _ = nil
				local var224, var225 = protoModule.readBuffer(p7, var213)
				var213 = var225
				var212.config = {
					type = "date_config",
					value = t.StringFormat_FormatArg_Formatter_DateConfig.decode(var224)
				}
			else
				local _ = nil
				local var226, var227 = protoModule.readVarInt(p7, var213)
				var213 = var227 + var226
			end
		elseif var214 == protoModule.wireTypes.i32 then
			local _ = nil
			local var228, var229 = protoModule.readFixed32(p7, var213)
			local _ = var228
			var213 = var229
		elseif var214 == protoModule.wireTypes.i64 then
			local _ = nil
			local var230, var231 = protoModule.readFixed64(p7, var213)
			local _ = var230
			var213 = var231
		else
			error("Unsupported wire type: " .. var214)
		end
	end
	return var212
end

function t_4:jsonEncode() --[[ line: 3346 ]]
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

function t_4:jsonDecode() --[[ line: 3370 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var233 = t_4.new()
	
	if self.type ~= nil then
		var233.type = if typeof(self.type) == "number" then t.StringFormat_FormatArg_Formatter_Type.fromNumber(self.type) or self.type else t.StringFormat_FormatArg_Formatter_Type.fromName(self.type) or self.type
	end
	if self.date_config ~= nil then
		var233.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.date_config)
		}
	end
	if self.dateConfig ~= nil then
		var233.config = {
			type = "date_config",
			value = t.StringFormat_FormatArg_Formatter_DateConfig.jsonDecode(self.dateConfig)
		}
	end
	return var233
end

t_4.descriptor = {
	name = "StringFormat_FormatArg_Formatter",
	fullName = "roblox.apppageplatform.shared.v1beta1.Formatter"
}
t.StringFormat_FormatArg_Formatter = t_4
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 3412 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		pattern = if p8 == nil or p8.pattern == nil then "" else p8.pattern
	}, t_5)
end

function t_5:encode() --[[ line: 3420 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var235 = 0
	
	if self.pattern ~= nil and self.pattern ~= "" then
		local var236, var237 = protoModule.writeTag(buff, var235, 1, protoModule.wireTypes.lengthDelimited)
		var236, var237 = protoModule.writeString(var236, var237, self.pattern)
		buff = var236
		var235 = var237
	end
	local buff_1 = buffer.create(var235)
	buffer.copy(buff_1, 0, buff, 0, var235)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 3436 ]]
	-- upvalues: t_5 (ref), protoModule (ref)
	local var239 = t_5.new()
	local var240 = 0
	while var240 < buffer.len(p9) do
		local _ = nil
		local var241 = nil
		local var242, var243, var244 = protoModule.readTag(p9, var240)
		local var245 = var242
		var241 = var243
		var240 = var244
		
		if var241 == protoModule.wireTypes.varint then
			local _ = nil
			local var246, var247 = protoModule.readVarInt(p9, var240)
			local _ = var246
			var240 = var247
			continue
		end
		if var241 == protoModule.wireTypes.lengthDelimited then
			if var245 == 1 then
				local _ = nil
				local var248, var249 = protoModule.readBuffer(p9, var240)
				var240 = var249
				var239.pattern = buffer.tostring(var248)
			else
				local _ = nil
				local var250, var251 = protoModule.readVarInt(p9, var240)
				var240 = var251 + var250
			end
		elseif var241 == protoModule.wireTypes.i32 then
			local _ = nil
			local var252, var253 = protoModule.readFixed32(p9, var240)
			local _ = var252
			var240 = var253
		elseif var241 == protoModule.wireTypes.i64 then
			local _ = nil
			local var254, var255 = protoModule.readFixed64(p9, var240)
			local _ = var254
			var240 = var255
		else
			error("Unsupported wire type: " .. var241)
		end
	end
	return var239
end

function t_5:jsonEncode() --[[ line: 3481 ]]
	local t = {}
	
	if self.pattern ~= nil and self.pattern ~= "" then
		t.pattern = self.pattern
	end
	return t
end

function t_5:jsonDecode() --[[ line: 3493 ]]
	-- upvalues: t_5 (ref)
	local var257 = t_5.new()
	
	if self.pattern ~= nil then
		var257.pattern = self.pattern
	end
	return var257
end

t_5.descriptor = {
	name = "StringFormat_FormatArg_Formatter_DateConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.DateConfig"
}
t.StringFormat_FormatArg_Formatter_DateConfig = t_5
typeRegistryModule.default:register(t.StringFormat_FormatArg_Formatter_DateConfig)
t.StringFormat_FormatArg_Formatter_Type = {
	fromNumber = function(p10) --[[ line: 3516 ]]
		return if p10 == 0 then "TYPE_INVALID" elseif p10 == 1 then "TYPE_NUMBER_ABBREVIATE" elseif p10 == 2 then "TYPE_NUMBER_LOCALIZE" elseif p10 == 3 then "TYPE_DATE_FORMAT" else nil
	end,
	toNumber = function(p11) --[[ line: 3530 ]]
		return if p11 == "TYPE_INVALID" then 0 elseif p11 == "TYPE_NUMBER_ABBREVIATE" then 1 elseif p11 == "TYPE_NUMBER_LOCALIZE" then 2 elseif p11 == "TYPE_DATE_FORMAT" then 3 else p11
	end,
	fromName = function(p12) --[[ line: 3544 ]]
		return if p12 == "TYPE_INVALID" then "TYPE_INVALID" elseif p12 == "TYPE_NUMBER_ABBREVIATE" then "TYPE_NUMBER_ABBREVIATE" elseif p12 == "TYPE_NUMBER_LOCALIZE" then "TYPE_NUMBER_LOCALIZE" elseif p12 == "TYPE_DATE_FORMAT" then "TYPE_DATE_FORMAT" else nil
	end
}
local t_6 = {}
t_6.__index = t_6

function t_6.new(p13) --[[ line: 3563 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		key = if p13 == nil or p13.key == nil then "" else p13.key,
		value = if p13 == nil or p13.value == nil then nil else p13.value
	}, t_6)
end

function t_6:encode() --[[ line: 3570 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var259 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var260, var261 = protoModule.writeTag(buff, var259, 1, protoModule.wireTypes.lengthDelimited)
		var260, var261 = protoModule.writeString(var260, var261, self.key)
		buff = var260
		var259 = var261
	end
	if self.value ~= nil then
		local var262 = self.value:encode()
		local var263, var264 = protoModule.writeTag(buff, var259, 2, protoModule.wireTypes.lengthDelimited)
		var263, var264 = protoModule.writeBuffer(var263, var264, var262, buffer.len(var262))
		buff = var263
		var259 = var264
	end
	local buff_1 = buffer.create(var259)
	buffer.copy(buff_1, 0, buff, 0, var259)
	
	return buff_1
end

function t_6.decode(p14) --[[ line: 3590 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var266 = t_6.new()
	local var267 = 0
	while var267 < buffer.len(p14) do
		local _ = nil
		local var268 = nil
		local var269, var270, var271 = protoModule.readTag(p14, var267)
		local var272 = var269
		var268 = var270
		var267 = var271
		
		if var268 == protoModule.wireTypes.varint then
			local _ = nil
			local var273, var274 = protoModule.readVarInt(p14, var267)
			local _ = var273
			var267 = var274
			continue
		end
		if var268 == protoModule.wireTypes.lengthDelimited then
			if var272 == 1 then
				local _ = nil
				local var275, var276 = protoModule.readBuffer(p14, var267)
				var267 = var276
				var266.key = buffer.tostring(var275)
			elseif var272 == 2 then
				local _ = nil
				local var277, var278 = protoModule.readBuffer(p14, var267)
				var267 = var278
				var266.value = t.StringFormat_FormatArg.decode(var277)
			else
				local _ = nil
				local var279, var280 = protoModule.readVarInt(p14, var267)
				var267 = var280 + var279
			end
		elseif var268 == protoModule.wireTypes.i32 then
			local _ = nil
			local var281, var282 = protoModule.readFixed32(p14, var267)
			local _ = var281
			var267 = var282
		elseif var268 == protoModule.wireTypes.i64 then
			local _ = nil
			local var283, var284 = protoModule.readFixed64(p14, var267)
			local _ = var283
			var267 = var284
		else
			error("Unsupported wire type: " .. var268)
		end
	end
	return var266
end

function t_6:jsonEncode() --[[ line: 3638 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_6:jsonDecode() --[[ line: 3652 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var286 = t_6.new()
	
	if self.key ~= nil then
		var286.key = self.key
	end
	if self.value ~= nil then
		var286.value = t.StringFormat_FormatArg.jsonDecode(self.value)
	end
	return var286
end

t_6.descriptor = {
	name = "StringFormat_ArgsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArgsEntry"
}
t.StringFormat_ArgsEntry = t_6
typeRegistryModule.default:register(t.StringFormat_ArgsEntry)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p15) --[[ line: 3680 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		kind = if p15 == nil or p15.kind == nil then nil else p15.kind
	}, t_7)
end

function t_7:encode() --[[ line: 3686 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var288 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var289, var290 = protoModule.writeTag(buff, var288, 1, protoModule.wireTypes.lengthDelimited)
			var289, var290 = protoModule.writeString(var289, var290, self.kind.value)
			buff = var289
			var288 = var290
		elseif self.kind.type == "binding_path" then
			local var291, var292 = protoModule.writeTag(buff, var288, 2, protoModule.wireTypes.lengthDelimited)
			var291, var292 = protoModule.writeString(var291, var292, self.kind.value)
			buff = var291
			var288 = var292
		elseif self.kind.type == "token" then
			local var293, var294 = protoModule.writeTag(buff, var288, 3, protoModule.wireTypes.lengthDelimited)
			var293, var294 = protoModule.writeString(var293, var294, self.kind.value)
			buff = var293
			var288 = var294
		elseif self.kind.type == "format" then
			local var295 = self.kind.value:encode()
			local var296, var297 = protoModule.writeTag(buff, var288, 4, protoModule.wireTypes.lengthDelimited)
			var296, var297 = protoModule.writeBuffer(var296, var297, var295, buffer.len(var295))
			buff = var296
			var288 = var297
		elseif self.kind.type == "conditional" then
			local var298 = self.kind.value:encode()
			local var299, var300 = protoModule.writeTag(buff, var288, 5, protoModule.wireTypes.lengthDelimited)
			var299, var300 = protoModule.writeBuffer(var299, var300, var298, buffer.len(var298))
			buff = var299
			var288 = var300
		elseif self.kind.type == "translation" then
			local var301 = self.kind.value:encode()
			local var302, var303 = protoModule.writeTag(buff, var288, 6, protoModule.wireTypes.lengthDelimited)
			var302, var303 = protoModule.writeBuffer(var302, var303, var301, buffer.len(var301))
			buff = var302
			var288 = var303
		end
	end
	local buff_1 = buffer.create(var288)
	buffer.copy(buff_1, 0, buff, 0, var288)
	
	return buff_1
end

function t_7.decode(p16) --[[ line: 3720 ]]
	-- upvalues: t_7 (ref), protoModule (ref), t (ref)
	local var305 = t_7.new()
	local var306 = 0
	while var306 < buffer.len(p16) do
		local _ = nil
		local var307 = nil
		local var308, var309, var310 = protoModule.readTag(p16, var306)
		local var311 = var308
		var307 = var309
		var306 = var310
		
		if var307 == protoModule.wireTypes.varint then
			local _ = nil
			local var312, var313 = protoModule.readVarInt(p16, var306)
			local _ = var312
			var306 = var313
			continue
		end
		if var307 == protoModule.wireTypes.lengthDelimited then
			if var311 == 1 then
				local _ = nil
				local var314, var315 = protoModule.readBuffer(p16, var306)
				var306 = var315
				var305.kind = { type = "literal", value = buffer.tostring(var314) }
			elseif var311 == 2 then
				local _ = nil
				local var316, var317 = protoModule.readBuffer(p16, var306)
				var306 = var317
				var305.kind = { type = "binding_path", value = buffer.tostring(var316) }
			elseif var311 == 3 then
				local _ = nil
				local var318, var319 = protoModule.readBuffer(p16, var306)
				var306 = var319
				var305.kind = { type = "token", value = buffer.tostring(var318) }
			elseif var311 == 4 then
				local _ = nil
				local var320, var321 = protoModule.readBuffer(p16, var306)
				var306 = var321
				var305.kind = { type = "format", value = t.StringFormat.decode(var320) }
			elseif var311 == 5 then
				local _ = nil
				local var322, var323 = protoModule.readBuffer(p16, var306)
				var306 = var323
				var305.kind = {
					type = "conditional",
					value = t.StringProp_ConditionalOptions.decode(var322)
				}
			elseif var311 == 6 then
				local _ = nil
				local var324, var325 = protoModule.readBuffer(p16, var306)
				var306 = var325
				var305.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var324)
				}
			else
				local _ = nil
				local var326, var327 = protoModule.readVarInt(p16, var306)
				var306 = var327 + var326
			end
		elseif var307 == protoModule.wireTypes.i32 then
			local _ = nil
			local var328, var329 = protoModule.readFixed32(p16, var306)
			local _ = var328
			var306 = var329
		elseif var307 == protoModule.wireTypes.i64 then
			local _ = nil
			local var330, var331 = protoModule.readFixed64(p16, var306)
			local _ = var330
			var306 = var331
		else
			error("Unsupported wire type: " .. var307)
		end
	end
	return var305
end

function t_7:jsonEncode() --[[ line: 3788 ]]
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

function t_7:jsonDecode() --[[ line: 3810 ]]
	-- upvalues: t_7 (ref), t (ref)
	local var333 = t_7.new()
	
	if self.literal ~= nil then
		var333.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var333.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var333.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var333.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var333.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var333.kind = {
			type = "conditional",
			value = t.StringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var333.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var333
end

t_7.descriptor = {
	name = "StringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StringProp"
}
t.StringProp = t_7
typeRegistryModule.default:register(t.StringProp)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p17) --[[ line: 3859 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		condition = if p17 == nil or p17.condition == nil then nil else p17.condition,
		kind = if p17 == nil or p17.kind == nil then nil else p17.kind
	}, t_8)
end

function t_8:encode() --[[ line: 3868 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var335 = 0
	
	if self.condition ~= nil then
		local var336 = self.condition:encode()
		local var337, var338 = protoModule.writeTag(buff, var335, 1, protoModule.wireTypes.lengthDelimited)
		var337, var338 = protoModule.writeBuffer(var337, var338, var336, buffer.len(var336))
		buff = var337
		var335 = var338
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var339, var340 = protoModule.writeTag(buff, var335, 2, protoModule.wireTypes.lengthDelimited)
			var339, var340 = protoModule.writeString(var339, var340, self.kind.value)
			buff = var339
			var335 = var340
		elseif self.kind.type == "binding_path" then
			local var341, var342 = protoModule.writeTag(buff, var335, 3, protoModule.wireTypes.lengthDelimited)
			var341, var342 = protoModule.writeString(var341, var342, self.kind.value)
			buff = var341
			var335 = var342
		elseif self.kind.type == "token" then
			local var343, var344 = protoModule.writeTag(buff, var335, 4, protoModule.wireTypes.lengthDelimited)
			var343, var344 = protoModule.writeString(var343, var344, self.kind.value)
			buff = var343
			var335 = var344
		elseif self.kind.type == "format" then
			local var345 = self.kind.value:encode()
			local var346, var347 = protoModule.writeTag(buff, var335, 5, protoModule.wireTypes.lengthDelimited)
			var346, var347 = protoModule.writeBuffer(var346, var347, var345, buffer.len(var345))
			buff = var346
			var335 = var347
		elseif self.kind.type == "translation" then
			local var348 = self.kind.value:encode()
			local var349, var350 = protoModule.writeTag(buff, var335, 6, protoModule.wireTypes.lengthDelimited)
			var349, var350 = protoModule.writeBuffer(var349, var350, var348, buffer.len(var348))
			buff = var349
			var335 = var350
		end
	end
	local buff_1 = buffer.create(var335)
	buffer.copy(buff_1, 0, buff, 0, var335)
	
	return buff_1
end

function t_8.decode(p18) --[[ line: 3904 ]]
	-- upvalues: t_8 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var352 = t_8.new()
	local var353 = 0
	while var353 < buffer.len(p18) do
		local _ = nil
		local var354 = nil
		local var355, var356, var357 = protoModule.readTag(p18, var353)
		local var358 = var355
		var354 = var356
		var353 = var357
		
		if var354 == protoModule.wireTypes.varint then
			local _ = nil
			local var359, var360 = protoModule.readVarInt(p18, var353)
			local _ = var359
			var353 = var360
			continue
		end
		if var354 == protoModule.wireTypes.lengthDelimited then
			if var358 == 1 then
				local _ = nil
				local var361, var362 = protoModule.readBuffer(p18, var353)
				var353 = var362
				var352.condition = propConditionModule.PropCondition.decode(var361)
			elseif var358 == 2 then
				local _ = nil
				local var363, var364 = protoModule.readBuffer(p18, var353)
				var353 = var364
				var352.kind = { type = "literal", value = buffer.tostring(var363) }
			elseif var358 == 3 then
				local _ = nil
				local var365, var366 = protoModule.readBuffer(p18, var353)
				var353 = var366
				var352.kind = { type = "binding_path", value = buffer.tostring(var365) }
			elseif var358 == 4 then
				local _ = nil
				local var367, var368 = protoModule.readBuffer(p18, var353)
				var353 = var368
				var352.kind = { type = "token", value = buffer.tostring(var367) }
			elseif var358 == 5 then
				local _ = nil
				local var369, var370 = protoModule.readBuffer(p18, var353)
				var353 = var370
				var352.kind = { type = "format", value = t.StringFormat.decode(var369) }
			elseif var358 == 6 then
				local _ = nil
				local var371, var372 = protoModule.readBuffer(p18, var353)
				var353 = var372
				var352.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var371)
				}
			else
				local _ = nil
				local var373, var374 = protoModule.readVarInt(p18, var353)
				var353 = var374 + var373
			end
		elseif var354 == protoModule.wireTypes.i32 then
			local _ = nil
			local var375, var376 = protoModule.readFixed32(p18, var353)
			local _ = var375
			var353 = var376
		elseif var354 == protoModule.wireTypes.i64 then
			local _ = nil
			local var377, var378 = protoModule.readFixed64(p18, var353)
			local _ = var377
			var353 = var378
		else
			error("Unsupported wire type: " .. var354)
		end
	end
	return var352
end

function t_8:jsonEncode() --[[ line: 3972 ]]
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

function t_8:jsonDecode() --[[ line: 3996 ]]
	-- upvalues: t_8 (ref), propConditionModule (ref), t (ref)
	local var380 = t_8.new()
	
	if self.condition ~= nil then
		var380.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var380.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var380.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var380.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var380.kind = { type = "token", value = self.token }
	end
	if self.format ~= nil then
		var380.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var380.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var380
end

t_8.descriptor = {
	name = "StringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StringProp_ConditionalOption = t_8
typeRegistryModule.default:register(t.StringProp_ConditionalOption)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p19) --[[ line: 4045 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		options = if p19 == nil or p19.options == nil then {} else p19.options
	}, t_9)
end

function t_9:encode() --[[ line: 4053 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var382 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var383 = v:encode()
			local var384, var385 = protoModule.writeTag(buff, var382, 1, protoModule.wireTypes.lengthDelimited)
			var384, var385 = protoModule.writeBuffer(var384, var385, var383, buffer.len(var383))
			buff = var384
			var382 = var385
		end
	end
	local buff_1 = buffer.create(var382)
	buffer.copy(buff_1, 0, buff, 0, var382)
	
	return buff_1
end

function t_9.decode(p20) --[[ line: 4070 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var387 = t_9.new()
	local var388 = 0
	while var388 < buffer.len(p20) do
		local _ = nil
		local var389 = nil
		local var390, var391, var392 = protoModule.readTag(p20, var388)
		local var393 = var390
		var389 = var391
		var388 = var392
		
		if var389 == protoModule.wireTypes.varint then
			local _ = nil
			local var394, var395 = protoModule.readVarInt(p20, var388)
			local _ = var394
			var388 = var395
			continue
		end
		if var389 == protoModule.wireTypes.lengthDelimited then
			if var393 == 1 then
				local _ = nil
				local var396, var397 = protoModule.readBuffer(p20, var388)
				var388 = var397
				table.insert(var387.options, t.StringProp_ConditionalOption.decode(var396))
			else
				local _ = nil
				local var398, var399 = protoModule.readVarInt(p20, var388)
				var388 = var399 + var398
			end
		elseif var389 == protoModule.wireTypes.i32 then
			local _ = nil
			local var400, var401 = protoModule.readFixed32(p20, var388)
			local _ = var400
			var388 = var401
		elseif var389 == protoModule.wireTypes.i64 then
			local _ = nil
			local var402, var403 = protoModule.readFixed64(p20, var388)
			local _ = var402
			var388 = var403
		else
			error("Unsupported wire type: " .. var389)
		end
	end
	return var387
end

function t_9:jsonEncode() --[[ line: 4113 ]]
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

function t_9:jsonDecode() --[[ line: 4127 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var406 = t_9.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StringProp_ConditionalOption.jsonDecode(v))
		end
		var406.options = t_1
	end
	return var406
end

t_9.descriptor = {
	name = "StringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StringProp_ConditionalOptions = t_9
typeRegistryModule.default:register(t.StringProp_ConditionalOptions)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p21) --[[ line: 4156 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		kind = if p21 == nil or p21.kind == nil then nil else p21.kind
	}, t_10)
end

function t_10:encode() --[[ line: 4162 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var409 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var410, var411 = protoModule.writeTag(buff, var409, 1, protoModule.wireTypes.i32)
			var410, var411 = protoModule.writeFloat(var410, var411, self.kind.value)
			buff = var410
			var409 = var411
		elseif self.kind.type == "binding_path" then
			local var412, var413 = protoModule.writeTag(buff, var409, 2, protoModule.wireTypes.lengthDelimited)
			var412, var413 = protoModule.writeString(var412, var413, self.kind.value)
			buff = var412
			var409 = var413
		elseif self.kind.type == "token" then
			local var414, var415 = protoModule.writeTag(buff, var409, 3, protoModule.wireTypes.lengthDelimited)
			var414, var415 = protoModule.writeString(var414, var415, self.kind.value)
			buff = var414
			var409 = var415
		elseif self.kind.type == "conditional" then
			local var416 = self.kind.value:encode()
			local var417, var418 = protoModule.writeTag(buff, var409, 4, protoModule.wireTypes.lengthDelimited)
			var417, var418 = protoModule.writeBuffer(var417, var418, var416, buffer.len(var416))
			buff = var417
			var409 = var418
		end
	end
	local buff_1 = buffer.create(var409)
	buffer.copy(buff_1, 0, buff, 0, var409)
	
	return buff_1
end

function t_10.decode(p22) --[[ line: 4188 ]]
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var420 = t_10.new()
	local var421 = 0
	while var421 < buffer.len(p22) do
		local _ = nil
		local var422 = nil
		local var423, var424, var425 = protoModule.readTag(p22, var421)
		local var426 = var423
		var422 = var424
		var421 = var425
		
		if var422 == protoModule.wireTypes.varint then
			local _ = nil
			local var427, var428 = protoModule.readVarInt(p22, var421)
			local _ = var427
			var421 = var428
			continue
		end
		if var422 == protoModule.wireTypes.lengthDelimited then
			if var426 == 2 then
				local _ = nil
				local var429, var430 = protoModule.readBuffer(p22, var421)
				var421 = var430
				var420.kind = { type = "binding_path", value = buffer.tostring(var429) }
			elseif var426 == 3 then
				local _ = nil
				local var431, var432 = protoModule.readBuffer(p22, var421)
				var421 = var432
				var420.kind = { type = "token", value = buffer.tostring(var431) }
			elseif var426 == 4 then
				local _ = nil
				local var433, var434 = protoModule.readBuffer(p22, var421)
				var421 = var434
				var420.kind = {
					type = "conditional",
					value = t.FloatProp_ConditionalOptions.decode(var433)
				}
			else
				local _ = nil
				local var435, var436 = protoModule.readVarInt(p22, var421)
				var421 = var436 + var435
			end
		elseif var422 == protoModule.wireTypes.i32 then
			if var426 == 1 then
				local _ = nil
				local var437, var438 = protoModule.readFloat(p22, var421)
				var421 = var438
				var420.kind = { type = "literal", value = var437 }
			else
				local _ = nil
				local var439, var440 = protoModule.readFixed32(p22, var421)
				local _ = var439
				var421 = var440
			end
		elseif var422 == protoModule.wireTypes.i64 then
			local _ = nil
			local var441, var442 = protoModule.readFixed64(p22, var421)
			local _ = var441
			var421 = var442
		else
			error("Unsupported wire type: " .. var422)
		end
	end
	return var420
end

function t_10:jsonEncode() --[[ line: 4246 ]]
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

function t_10:jsonDecode() --[[ line: 4264 ]]
	-- upvalues: t_10 (ref), protoModule (ref), t (ref)
	local var444 = t_10.new()
	
	if self.literal ~= nil then
		var444.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var444.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var444.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var444.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var444.kind = {
			type = "conditional",
			value = t.FloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var444
end

t_10.descriptor = {
	name = "FloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FloatProp"
}
t.FloatProp = t_10
typeRegistryModule.default:register(t.FloatProp)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p23) --[[ line: 4305 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		condition = if p23 == nil or p23.condition == nil then nil else p23.condition,
		kind = if p23 == nil or p23.kind == nil then nil else p23.kind
	}, t_11)
end

function t_11:encode() --[[ line: 4314 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var446 = 0
	
	if self.condition ~= nil then
		local var447 = self.condition:encode()
		local var448, var449 = protoModule.writeTag(buff, var446, 1, protoModule.wireTypes.lengthDelimited)
		var448, var449 = protoModule.writeBuffer(var448, var449, var447, buffer.len(var447))
		buff = var448
		var446 = var449
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var450, var451 = protoModule.writeTag(buff, var446, 2, protoModule.wireTypes.i32)
			var450, var451 = protoModule.writeFloat(var450, var451, self.kind.value)
			buff = var450
			var446 = var451
		elseif self.kind.type == "binding_path" then
			local var452, var453 = protoModule.writeTag(buff, var446, 3, protoModule.wireTypes.lengthDelimited)
			var452, var453 = protoModule.writeString(var452, var453, self.kind.value)
			buff = var452
			var446 = var453
		elseif self.kind.type == "token" then
			local var454, var455 = protoModule.writeTag(buff, var446, 4, protoModule.wireTypes.lengthDelimited)
			var454, var455 = protoModule.writeString(var454, var455, self.kind.value)
			buff = var454
			var446 = var455
		end
	end
	local buff_1 = buffer.create(var446)
	buffer.copy(buff_1, 0, buff, 0, var446)
	
	return buff_1
end

function t_11.decode(p24) --[[ line: 4342 ]]
	-- upvalues: t_11 (ref), protoModule (ref), propConditionModule (ref)
	local var457 = t_11.new()
	local var458 = 0
	while var458 < buffer.len(p24) do
		local _ = nil
		local var459 = nil
		local var460, var461, var462 = protoModule.readTag(p24, var458)
		local var463 = var460
		var459 = var461
		var458 = var462
		
		if var459 == protoModule.wireTypes.varint then
			local _ = nil
			local var464, var465 = protoModule.readVarInt(p24, var458)
			local _ = var464
			var458 = var465
			continue
		end
		if var459 == protoModule.wireTypes.lengthDelimited then
			if var463 == 1 then
				local _ = nil
				local var466, var467 = protoModule.readBuffer(p24, var458)
				var458 = var467
				var457.condition = propConditionModule.PropCondition.decode(var466)
			elseif var463 == 3 then
				local _ = nil
				local var468, var469 = protoModule.readBuffer(p24, var458)
				var458 = var469
				var457.kind = { type = "binding_path", value = buffer.tostring(var468) }
			elseif var463 == 4 then
				local _ = nil
				local var470, var471 = protoModule.readBuffer(p24, var458)
				var458 = var471
				var457.kind = { type = "token", value = buffer.tostring(var470) }
			else
				local _ = nil
				local var472, var473 = protoModule.readVarInt(p24, var458)
				var458 = var473 + var472
			end
		elseif var459 == protoModule.wireTypes.i32 then
			if var463 == 2 then
				local _ = nil
				local var474, var475 = protoModule.readFloat(p24, var458)
				var458 = var475
				var457.kind = { type = "literal", value = var474 }
			else
				local _ = nil
				local var476, var477 = protoModule.readFixed32(p24, var458)
				local _ = var476
				var458 = var477
			end
		elseif var459 == protoModule.wireTypes.i64 then
			local _ = nil
			local var478, var479 = protoModule.readFixed64(p24, var458)
			local _ = var478
			var458 = var479
		else
			error("Unsupported wire type: " .. var459)
		end
	end
	return var457
end

function t_11:jsonEncode() --[[ line: 4400 ]]
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

function t_11:jsonDecode() --[[ line: 4420 ]]
	-- upvalues: t_11 (ref), propConditionModule (ref), protoModule (ref)
	local var481 = t_11.new()
	
	if self.condition ~= nil then
		var481.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var481.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var481.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var481.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var481.kind = { type = "token", value = self.token }
	end
	return var481
end

t_11.descriptor = {
	name = "FloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FloatProp_ConditionalOption = t_11
typeRegistryModule.default:register(t.FloatProp_ConditionalOption)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p25) --[[ line: 4461 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		options = if p25 == nil or p25.options == nil then {} else p25.options
	}, t_12)
end

function t_12:encode() --[[ line: 4469 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var483 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var484 = v:encode()
			local var485, var486 = protoModule.writeTag(buff, var483, 1, protoModule.wireTypes.lengthDelimited)
			var485, var486 = protoModule.writeBuffer(var485, var486, var484, buffer.len(var484))
			buff = var485
			var483 = var486
		end
	end
	local buff_1 = buffer.create(var483)
	buffer.copy(buff_1, 0, buff, 0, var483)
	
	return buff_1
end

function t_12.decode(p26) --[[ line: 4486 ]]
	-- upvalues: t_12 (ref), protoModule (ref), t (ref)
	local var488 = t_12.new()
	local var489 = 0
	while var489 < buffer.len(p26) do
		local _ = nil
		local var490 = nil
		local var491, var492, var493 = protoModule.readTag(p26, var489)
		local var494 = var491
		var490 = var492
		var489 = var493
		
		if var490 == protoModule.wireTypes.varint then
			local _ = nil
			local var495, var496 = protoModule.readVarInt(p26, var489)
			local _ = var495
			var489 = var496
			continue
		end
		if var490 == protoModule.wireTypes.lengthDelimited then
			if var494 == 1 then
				local _ = nil
				local var497, var498 = protoModule.readBuffer(p26, var489)
				var489 = var498
				table.insert(var488.options, t.FloatProp_ConditionalOption.decode(var497))
			else
				local _ = nil
				local var499, var500 = protoModule.readVarInt(p26, var489)
				var489 = var500 + var499
			end
		elseif var490 == protoModule.wireTypes.i32 then
			local _ = nil
			local var501, var502 = protoModule.readFixed32(p26, var489)
			local _ = var501
			var489 = var502
		elseif var490 == protoModule.wireTypes.i64 then
			local _ = nil
			local var503, var504 = protoModule.readFixed64(p26, var489)
			local _ = var503
			var489 = var504
		else
			error("Unsupported wire type: " .. var490)
		end
	end
	return var488
end

function t_12:jsonEncode() --[[ line: 4529 ]]
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

function t_12:jsonDecode() --[[ line: 4543 ]]
	-- upvalues: t_12 (ref), t (ref)
	local var507 = t_12.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FloatProp_ConditionalOption.jsonDecode(v))
		end
		var507.options = t_1
	end
	return var507
end

t_12.descriptor = {
	name = "FloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FloatProp_ConditionalOptions = t_12
typeRegistryModule.default:register(t.FloatProp_ConditionalOptions)
local t_13 = {}
t_13.__index = t_13

function t_13.new(p27) --[[ line: 4572 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({
		kind = if p27 == nil or p27.kind == nil then nil else p27.kind
	}, t_13)
end

function t_13:encode() --[[ line: 4578 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var510 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var511, var512 = protoModule.writeTag(buff, var510, 1, protoModule.wireTypes.i64)
			var511, var512 = protoModule.writeDouble(var511, var512, self.kind.value)
			buff = var511
			var510 = var512
		elseif self.kind.type == "binding_path" then
			local var513, var514 = protoModule.writeTag(buff, var510, 2, protoModule.wireTypes.lengthDelimited)
			var513, var514 = protoModule.writeString(var513, var514, self.kind.value)
			buff = var513
			var510 = var514
		elseif self.kind.type == "token" then
			local var515, var516 = protoModule.writeTag(buff, var510, 3, protoModule.wireTypes.lengthDelimited)
			var515, var516 = protoModule.writeString(var515, var516, self.kind.value)
			buff = var515
			var510 = var516
		elseif self.kind.type == "conditional" then
			local var517 = self.kind.value:encode()
			local var518, var519 = protoModule.writeTag(buff, var510, 4, protoModule.wireTypes.lengthDelimited)
			var518, var519 = protoModule.writeBuffer(var518, var519, var517, buffer.len(var517))
			buff = var518
			var510 = var519
		end
	end
	local buff_1 = buffer.create(var510)
	buffer.copy(buff_1, 0, buff, 0, var510)
	
	return buff_1
end

function t_13.decode(p28) --[[ line: 4604 ]]
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var521 = t_13.new()
	local var522 = 0
	while var522 < buffer.len(p28) do
		local _ = nil
		local var523 = nil
		local var524, var525, var526 = protoModule.readTag(p28, var522)
		local var527 = var524
		var523 = var525
		var522 = var526
		
		if var523 == protoModule.wireTypes.varint then
			local _ = nil
			local var528, var529 = protoModule.readVarInt(p28, var522)
			local _ = var528
			var522 = var529
			continue
		end
		if var523 == protoModule.wireTypes.lengthDelimited then
			if var527 == 2 then
				local _ = nil
				local var530, var531 = protoModule.readBuffer(p28, var522)
				var522 = var531
				var521.kind = { type = "binding_path", value = buffer.tostring(var530) }
			elseif var527 == 3 then
				local _ = nil
				local var532, var533 = protoModule.readBuffer(p28, var522)
				var522 = var533
				var521.kind = { type = "token", value = buffer.tostring(var532) }
			elseif var527 == 4 then
				local _ = nil
				local var534, var535 = protoModule.readBuffer(p28, var522)
				var522 = var535
				var521.kind = {
					type = "conditional",
					value = t.DoubleProp_ConditionalOptions.decode(var534)
				}
			else
				local _ = nil
				local var536, var537 = protoModule.readVarInt(p28, var522)
				var522 = var537 + var536
			end
		elseif var523 == protoModule.wireTypes.i32 then
			local _ = nil
			local var538, var539 = protoModule.readFixed32(p28, var522)
			local _ = var538
			var522 = var539
		elseif var523 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var523)
		elseif var527 == 1 then
			local _ = nil
			local var540, var541 = protoModule.readDouble(p28, var522)
			var522 = var541
			var521.kind = { type = "literal", value = var540 }
		else
			local _ = nil
			local var542, var543 = protoModule.readFixed64(p28, var522)
			local _ = var542
			var522 = var543
		end
	end
	return var521
end

function t_13:jsonEncode() --[[ line: 4662 ]]
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

function t_13:jsonDecode() --[[ line: 4680 ]]
	-- upvalues: t_13 (ref), protoModule (ref), t (ref)
	local var545 = t_13.new()
	
	if self.literal ~= nil then
		var545.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var545.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var545.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var545.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var545.kind = {
			type = "conditional",
			value = t.DoubleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var545
end

t_13.descriptor = {
	name = "DoubleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.DoubleProp"
}
t.DoubleProp = t_13
typeRegistryModule.default:register(t.DoubleProp)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p29) --[[ line: 4721 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		condition = if p29 == nil or p29.condition == nil then nil else p29.condition,
		kind = if p29 == nil or p29.kind == nil then nil else p29.kind
	}, t_14)
end

function t_14:encode() --[[ line: 4730 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var547 = 0
	
	if self.condition ~= nil then
		local var548 = self.condition:encode()
		local var549, var550 = protoModule.writeTag(buff, var547, 1, protoModule.wireTypes.lengthDelimited)
		var549, var550 = protoModule.writeBuffer(var549, var550, var548, buffer.len(var548))
		buff = var549
		var547 = var550
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var551, var552 = protoModule.writeTag(buff, var547, 2, protoModule.wireTypes.i64)
			var551, var552 = protoModule.writeDouble(var551, var552, self.kind.value)
			buff = var551
			var547 = var552
		elseif self.kind.type == "binding_path" then
			local var553, var554 = protoModule.writeTag(buff, var547, 3, protoModule.wireTypes.lengthDelimited)
			var553, var554 = protoModule.writeString(var553, var554, self.kind.value)
			buff = var553
			var547 = var554
		elseif self.kind.type == "token" then
			local var555, var556 = protoModule.writeTag(buff, var547, 4, protoModule.wireTypes.lengthDelimited)
			var555, var556 = protoModule.writeString(var555, var556, self.kind.value)
			buff = var555
			var547 = var556
		end
	end
	local buff_1 = buffer.create(var547)
	buffer.copy(buff_1, 0, buff, 0, var547)
	
	return buff_1
end

function t_14.decode(p30) --[[ line: 4758 ]]
	-- upvalues: t_14 (ref), protoModule (ref), propConditionModule (ref)
	local var558 = t_14.new()
	local var559 = 0
	while var559 < buffer.len(p30) do
		local _ = nil
		local var560 = nil
		local var561, var562, var563 = protoModule.readTag(p30, var559)
		local var564 = var561
		var560 = var562
		var559 = var563
		
		if var560 == protoModule.wireTypes.varint then
			local _ = nil
			local var565, var566 = protoModule.readVarInt(p30, var559)
			local _ = var565
			var559 = var566
			continue
		end
		if var560 == protoModule.wireTypes.lengthDelimited then
			if var564 == 1 then
				local _ = nil
				local var567, var568 = protoModule.readBuffer(p30, var559)
				var559 = var568
				var558.condition = propConditionModule.PropCondition.decode(var567)
			elseif var564 == 3 then
				local _ = nil
				local var569, var570 = protoModule.readBuffer(p30, var559)
				var559 = var570
				var558.kind = { type = "binding_path", value = buffer.tostring(var569) }
			elseif var564 == 4 then
				local _ = nil
				local var571, var572 = protoModule.readBuffer(p30, var559)
				var559 = var572
				var558.kind = { type = "token", value = buffer.tostring(var571) }
			else
				local _ = nil
				local var573, var574 = protoModule.readVarInt(p30, var559)
				var559 = var574 + var573
			end
		elseif var560 == protoModule.wireTypes.i32 then
			local _ = nil
			local var575, var576 = protoModule.readFixed32(p30, var559)
			local _ = var575
			var559 = var576
		elseif var560 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var560)
		elseif var564 == 2 then
			local _ = nil
			local var577, var578 = protoModule.readDouble(p30, var559)
			var559 = var578
			var558.kind = { type = "literal", value = var577 }
		else
			local _ = nil
			local var579, var580 = protoModule.readFixed64(p30, var559)
			local _ = var579
			var559 = var580
		end
	end
	return var558
end

function t_14:jsonEncode() --[[ line: 4816 ]]
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

function t_14:jsonDecode() --[[ line: 4836 ]]
	-- upvalues: t_14 (ref), propConditionModule (ref), protoModule (ref)
	local var582 = t_14.new()
	
	if self.condition ~= nil then
		var582.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var582.kind = {
			type = "literal",
			value = protoModule.json.deserializeNumber(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var582.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var582.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var582.kind = { type = "token", value = self.token }
	end
	return var582
end

t_14.descriptor = {
	name = "DoubleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.DoubleProp_ConditionalOption = t_14
typeRegistryModule.default:register(t.DoubleProp_ConditionalOption)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p31) --[[ line: 4877 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		options = if p31 == nil or p31.options == nil then {} else p31.options
	}, t_15)
end

function t_15:encode() --[[ line: 4885 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var584 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var585 = v:encode()
			local var586, var587 = protoModule.writeTag(buff, var584, 1, protoModule.wireTypes.lengthDelimited)
			var586, var587 = protoModule.writeBuffer(var586, var587, var585, buffer.len(var585))
			buff = var586
			var584 = var587
		end
	end
	local buff_1 = buffer.create(var584)
	buffer.copy(buff_1, 0, buff, 0, var584)
	
	return buff_1
end

function t_15.decode(p32) --[[ line: 4902 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var589 = t_15.new()
	local var590 = 0
	while var590 < buffer.len(p32) do
		local _ = nil
		local var591 = nil
		local var592, var593, var594 = protoModule.readTag(p32, var590)
		local var595 = var592
		var591 = var593
		var590 = var594
		
		if var591 == protoModule.wireTypes.varint then
			local _ = nil
			local var596, var597 = protoModule.readVarInt(p32, var590)
			local _ = var596
			var590 = var597
			continue
		end
		if var591 == protoModule.wireTypes.lengthDelimited then
			if var595 == 1 then
				local _ = nil
				local var598, var599 = protoModule.readBuffer(p32, var590)
				var590 = var599
				table.insert(var589.options, t.DoubleProp_ConditionalOption.decode(var598))
			else
				local _ = nil
				local var600, var601 = protoModule.readVarInt(p32, var590)
				var590 = var601 + var600
			end
		elseif var591 == protoModule.wireTypes.i32 then
			local _ = nil
			local var602, var603 = protoModule.readFixed32(p32, var590)
			local _ = var602
			var590 = var603
		elseif var591 == protoModule.wireTypes.i64 then
			local _ = nil
			local var604, var605 = protoModule.readFixed64(p32, var590)
			local _ = var604
			var590 = var605
		else
			error("Unsupported wire type: " .. var591)
		end
	end
	return var589
end

function t_15:jsonEncode() --[[ line: 4945 ]]
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

function t_15:jsonDecode() --[[ line: 4959 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var608 = t_15.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.DoubleProp_ConditionalOption.jsonDecode(v))
		end
		var608.options = t_1
	end
	return var608
end

t_15.descriptor = {
	name = "DoubleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.DoubleProp_ConditionalOptions = t_15
typeRegistryModule.default:register(t.DoubleProp_ConditionalOptions)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p33) --[[ line: 4988 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		kind = if p33 == nil or p33.kind == nil then nil else p33.kind
	}, t_16)
end

function t_16:encode() --[[ line: 4994 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var611 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var612, var613 = protoModule.writeTag(buff, var611, 1, protoModule.wireTypes.varint)
			var612, var613 = protoModule.writeVarInt(var612, var613, self.kind.value)
			buff = var612
			var611 = var613
		elseif self.kind.type == "binding_path" then
			local var614, var615 = protoModule.writeTag(buff, var611, 2, protoModule.wireTypes.lengthDelimited)
			var614, var615 = protoModule.writeString(var614, var615, self.kind.value)
			buff = var614
			var611 = var615
		elseif self.kind.type == "token" then
			local var616, var617 = protoModule.writeTag(buff, var611, 3, protoModule.wireTypes.lengthDelimited)
			var616, var617 = protoModule.writeString(var616, var617, self.kind.value)
			buff = var616
			var611 = var617
		elseif self.kind.type == "conditional" then
			local var618 = self.kind.value:encode()
			local var619, var620 = protoModule.writeTag(buff, var611, 4, protoModule.wireTypes.lengthDelimited)
			var619, var620 = protoModule.writeBuffer(var619, var620, var618, buffer.len(var618))
			buff = var619
			var611 = var620
		end
	end
	local buff_1 = buffer.create(var611)
	buffer.copy(buff_1, 0, buff, 0, var611)
	
	return buff_1
end

function t_16.decode(p34) --[[ line: 5020 ]]
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var622 = t_16.new()
	local var623 = 0
	while var623 < buffer.len(p34) do
		local _ = nil
		local var624 = nil
		local var625, var626, var627 = protoModule.readTag(p34, var623)
		local var628 = var625
		var624 = var626
		var623 = var627
		
		if var624 == protoModule.wireTypes.varint then
			if var628 == 1 then
				local _ = nil
				local var629, var630 = protoModule.readVarIntI32(p34, var623)
				var623 = var630
				var622.kind = { type = "literal", value = var629 }
			else
				local _ = nil
				local var631, var632 = protoModule.readVarInt(p34, var623)
				local _ = var631
				var623 = var632
			end
		end
		if var624 == protoModule.wireTypes.lengthDelimited then
			if var628 == 2 then
				local _ = nil
				local var633, var634 = protoModule.readBuffer(p34, var623)
				var623 = var634
				var622.kind = { type = "binding_path", value = buffer.tostring(var633) }
			elseif var628 == 3 then
				local _ = nil
				local var635, var636 = protoModule.readBuffer(p34, var623)
				var623 = var636
				var622.kind = { type = "token", value = buffer.tostring(var635) }
			elseif var628 == 4 then
				local _ = nil
				local var637, var638 = protoModule.readBuffer(p34, var623)
				var623 = var638
				var622.kind = {
					type = "conditional",
					value = t.Int32Prop_ConditionalOptions.decode(var637)
				}
			else
				local _ = nil
				local var639, var640 = protoModule.readVarInt(p34, var623)
				var623 = var640 + var639
			end
		elseif var624 == protoModule.wireTypes.i32 then
			local _ = nil
			local var641, var642 = protoModule.readFixed32(p34, var623)
			local _ = var641
			var623 = var642
		elseif var624 == protoModule.wireTypes.i64 then
			local _ = nil
			local var643, var644 = protoModule.readFixed64(p34, var623)
			local _ = var643
			var623 = var644
		else
			error("Unsupported wire type: " .. var624)
		end
	end
	return var622
end

function t_16:jsonEncode() --[[ line: 5078 ]]
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

function t_16:jsonDecode() --[[ line: 5096 ]]
	-- upvalues: t_16 (ref), t (ref)
	local var646 = t_16.new()
	
	if self.literal ~= nil then
		var646.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var646.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var646.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var646.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var646.kind = {
			type = "conditional",
			value = t.Int32Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var646
end

t_16.descriptor = {
	name = "Int32Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int32Prop"
}
t.Int32Prop = t_16
typeRegistryModule.default:register(t.Int32Prop)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p35) --[[ line: 5137 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		condition = if p35 == nil or p35.condition == nil then nil else p35.condition,
		kind = if p35 == nil or p35.kind == nil then nil else p35.kind
	}, t_17)
end

function t_17:encode() --[[ line: 5146 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var648 = 0
	
	if self.condition ~= nil then
		local var649 = self.condition:encode()
		local var650, var651 = protoModule.writeTag(buff, var648, 1, protoModule.wireTypes.lengthDelimited)
		var650, var651 = protoModule.writeBuffer(var650, var651, var649, buffer.len(var649))
		buff = var650
		var648 = var651
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var652, var653 = protoModule.writeTag(buff, var648, 2, protoModule.wireTypes.varint)
			var652, var653 = protoModule.writeVarInt(var652, var653, self.kind.value)
			buff = var652
			var648 = var653
		elseif self.kind.type == "binding_path" then
			local var654, var655 = protoModule.writeTag(buff, var648, 3, protoModule.wireTypes.lengthDelimited)
			var654, var655 = protoModule.writeString(var654, var655, self.kind.value)
			buff = var654
			var648 = var655
		elseif self.kind.type == "token" then
			local var656, var657 = protoModule.writeTag(buff, var648, 4, protoModule.wireTypes.lengthDelimited)
			var656, var657 = protoModule.writeString(var656, var657, self.kind.value)
			buff = var656
			var648 = var657
		end
	end
	local buff_1 = buffer.create(var648)
	buffer.copy(buff_1, 0, buff, 0, var648)
	
	return buff_1
end

function t_17.decode(p36) --[[ line: 5174 ]]
	-- upvalues: t_17 (ref), protoModule (ref), propConditionModule (ref)
	local var659 = t_17.new()
	local var660 = 0
	while var660 < buffer.len(p36) do
		local _ = nil
		local var661 = nil
		local var662, var663, var664 = protoModule.readTag(p36, var660)
		local var665 = var662
		var661 = var663
		var660 = var664
		
		if var661 == protoModule.wireTypes.varint then
			if var665 == 2 then
				local _ = nil
				local var666, var667 = protoModule.readVarIntI32(p36, var660)
				var660 = var667
				var659.kind = { type = "literal", value = var666 }
			else
				local _ = nil
				local var668, var669 = protoModule.readVarInt(p36, var660)
				local _ = var668
				var660 = var669
			end
		end
		if var661 == protoModule.wireTypes.lengthDelimited then
			if var665 == 1 then
				local _ = nil
				local var670, var671 = protoModule.readBuffer(p36, var660)
				var660 = var671
				var659.condition = propConditionModule.PropCondition.decode(var670)
			elseif var665 == 3 then
				local _ = nil
				local var672, var673 = protoModule.readBuffer(p36, var660)
				var660 = var673
				var659.kind = { type = "binding_path", value = buffer.tostring(var672) }
			elseif var665 == 4 then
				local _ = nil
				local var674, var675 = protoModule.readBuffer(p36, var660)
				var660 = var675
				var659.kind = { type = "token", value = buffer.tostring(var674) }
			else
				local _ = nil
				local var676, var677 = protoModule.readVarInt(p36, var660)
				var660 = var677 + var676
			end
		elseif var661 == protoModule.wireTypes.i32 then
			local _ = nil
			local var678, var679 = protoModule.readFixed32(p36, var660)
			local _ = var678
			var660 = var679
		elseif var661 == protoModule.wireTypes.i64 then
			local _ = nil
			local var680, var681 = protoModule.readFixed64(p36, var660)
			local _ = var680
			var660 = var681
		else
			error("Unsupported wire type: " .. var661)
		end
	end
	return var659
end

function t_17:jsonEncode() --[[ line: 5232 ]]
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

function t_17:jsonDecode() --[[ line: 5252 ]]
	-- upvalues: t_17 (ref), propConditionModule (ref)
	local var683 = t_17.new()
	
	if self.condition ~= nil then
		var683.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var683.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var683.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var683.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var683.kind = { type = "token", value = self.token }
	end
	return var683
end

t_17.descriptor = {
	name = "Int32Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int32Prop_ConditionalOption = t_17
typeRegistryModule.default:register(t.Int32Prop_ConditionalOption)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p37) --[[ line: 5293 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		options = if p37 == nil or p37.options == nil then {} else p37.options
	}, t_18)
end

function t_18:encode() --[[ line: 5301 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var685 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var686 = v:encode()
			local var687, var688 = protoModule.writeTag(buff, var685, 1, protoModule.wireTypes.lengthDelimited)
			var687, var688 = protoModule.writeBuffer(var687, var688, var686, buffer.len(var686))
			buff = var687
			var685 = var688
		end
	end
	local buff_1 = buffer.create(var685)
	buffer.copy(buff_1, 0, buff, 0, var685)
	
	return buff_1
end

function t_18.decode(p38) --[[ line: 5318 ]]
	-- upvalues: t_18 (ref), protoModule (ref), t (ref)
	local var690 = t_18.new()
	local var691 = 0
	while var691 < buffer.len(p38) do
		local _ = nil
		local var692 = nil
		local var693, var694, var695 = protoModule.readTag(p38, var691)
		local var696 = var693
		var692 = var694
		var691 = var695
		
		if var692 == protoModule.wireTypes.varint then
			local _ = nil
			local var697, var698 = protoModule.readVarInt(p38, var691)
			local _ = var697
			var691 = var698
			continue
		end
		if var692 == protoModule.wireTypes.lengthDelimited then
			if var696 == 1 then
				local _ = nil
				local var699, var700 = protoModule.readBuffer(p38, var691)
				var691 = var700
				table.insert(var690.options, t.Int32Prop_ConditionalOption.decode(var699))
			else
				local _ = nil
				local var701, var702 = protoModule.readVarInt(p38, var691)
				var691 = var702 + var701
			end
		elseif var692 == protoModule.wireTypes.i32 then
			local _ = nil
			local var703, var704 = protoModule.readFixed32(p38, var691)
			local _ = var703
			var691 = var704
		elseif var692 == protoModule.wireTypes.i64 then
			local _ = nil
			local var705, var706 = protoModule.readFixed64(p38, var691)
			local _ = var705
			var691 = var706
		else
			error("Unsupported wire type: " .. var692)
		end
	end
	return var690
end

function t_18:jsonEncode() --[[ line: 5361 ]]
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

function t_18:jsonDecode() --[[ line: 5375 ]]
	-- upvalues: t_18 (ref), t (ref)
	local var709 = t_18.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int32Prop_ConditionalOption.jsonDecode(v))
		end
		var709.options = t_1
	end
	return var709
end

t_18.descriptor = {
	name = "Int32Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int32Prop_ConditionalOptions = t_18
typeRegistryModule.default:register(t.Int32Prop_ConditionalOptions)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p39) --[[ line: 5404 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		kind = if p39 == nil or p39.kind == nil then nil else p39.kind
	}, t_19)
end

function t_19:encode() --[[ line: 5410 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var712 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var713, var714 = protoModule.writeTag(buff, var712, 1, protoModule.wireTypes.varint)
			var713, var714 = protoModule.writeVarInt(var713, var714, self.kind.value)
			buff = var713
			var712 = var714
		elseif self.kind.type == "binding_path" then
			local var715, var716 = protoModule.writeTag(buff, var712, 2, protoModule.wireTypes.lengthDelimited)
			var715, var716 = protoModule.writeString(var715, var716, self.kind.value)
			buff = var715
			var712 = var716
		elseif self.kind.type == "token" then
			local var717, var718 = protoModule.writeTag(buff, var712, 3, protoModule.wireTypes.lengthDelimited)
			var717, var718 = protoModule.writeString(var717, var718, self.kind.value)
			buff = var717
			var712 = var718
		elseif self.kind.type == "conditional" then
			local var719 = self.kind.value:encode()
			local var720, var721 = protoModule.writeTag(buff, var712, 4, protoModule.wireTypes.lengthDelimited)
			var720, var721 = protoModule.writeBuffer(var720, var721, var719, buffer.len(var719))
			buff = var720
			var712 = var721
		end
	end
	local buff_1 = buffer.create(var712)
	buffer.copy(buff_1, 0, buff, 0, var712)
	
	return buff_1
end

function t_19.decode(p40) --[[ line: 5436 ]]
	-- upvalues: t_19 (ref), protoModule (ref), t (ref)
	local var723 = t_19.new()
	local var724 = 0
	while var724 < buffer.len(p40) do
		local _ = nil
		local var725 = nil
		local var726, var727, var728 = protoModule.readTag(p40, var724)
		local var729 = var726
		var725 = var727
		var724 = var728
		
		if var725 == protoModule.wireTypes.varint then
			if var729 == 1 then
				local _ = nil
				local var730, var731 = protoModule.readVarIntI64(p40, var724)
				var724 = var731
				var723.kind = { type = "literal", value = var730 }
			else
				local _ = nil
				local var732, var733 = protoModule.readVarInt(p40, var724)
				local _ = var732
				var724 = var733
			end
		end
		if var725 == protoModule.wireTypes.lengthDelimited then
			if var729 == 2 then
				local _ = nil
				local var734, var735 = protoModule.readBuffer(p40, var724)
				var724 = var735
				var723.kind = { type = "binding_path", value = buffer.tostring(var734) }
			elseif var729 == 3 then
				local _ = nil
				local var736, var737 = protoModule.readBuffer(p40, var724)
				var724 = var737
				var723.kind = { type = "token", value = buffer.tostring(var736) }
			elseif var729 == 4 then
				local _ = nil
				local var738, var739 = protoModule.readBuffer(p40, var724)
				var724 = var739
				var723.kind = {
					type = "conditional",
					value = t.Int64Prop_ConditionalOptions.decode(var738)
				}
			else
				local _ = nil
				local var740, var741 = protoModule.readVarInt(p40, var724)
				var724 = var741 + var740
			end
		elseif var725 == protoModule.wireTypes.i32 then
			local _ = nil
			local var742, var743 = protoModule.readFixed32(p40, var724)
			local _ = var742
			var724 = var743
		elseif var725 == protoModule.wireTypes.i64 then
			local _ = nil
			local var744, var745 = protoModule.readFixed64(p40, var724)
			local _ = var744
			var724 = var745
		else
			error("Unsupported wire type: " .. var725)
		end
	end
	return var723
end

function t_19:jsonEncode() --[[ line: 5494 ]]
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

function t_19:jsonDecode() --[[ line: 5512 ]]
	-- upvalues: t_19 (ref), t (ref)
	local var747 = t_19.new()
	
	if self.literal ~= nil then
		var747.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var747.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var747.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var747.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var747.kind = {
			type = "conditional",
			value = t.Int64Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var747
end

t_19.descriptor = {
	name = "Int64Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Int64Prop"
}
t.Int64Prop = t_19
typeRegistryModule.default:register(t.Int64Prop)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p41) --[[ line: 5553 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		condition = if p41 == nil or p41.condition == nil then nil else p41.condition,
		kind = if p41 == nil or p41.kind == nil then nil else p41.kind
	}, t_20)
end

function t_20:encode() --[[ line: 5562 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var749 = 0
	
	if self.condition ~= nil then
		local var750 = self.condition:encode()
		local var751, var752 = protoModule.writeTag(buff, var749, 1, protoModule.wireTypes.lengthDelimited)
		var751, var752 = protoModule.writeBuffer(var751, var752, var750, buffer.len(var750))
		buff = var751
		var749 = var752
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var753, var754 = protoModule.writeTag(buff, var749, 2, protoModule.wireTypes.varint)
			var753, var754 = protoModule.writeVarInt(var753, var754, self.kind.value)
			buff = var753
			var749 = var754
		elseif self.kind.type == "binding_path" then
			local var755, var756 = protoModule.writeTag(buff, var749, 3, protoModule.wireTypes.lengthDelimited)
			var755, var756 = protoModule.writeString(var755, var756, self.kind.value)
			buff = var755
			var749 = var756
		elseif self.kind.type == "token" then
			local var757, var758 = protoModule.writeTag(buff, var749, 4, protoModule.wireTypes.lengthDelimited)
			var757, var758 = protoModule.writeString(var757, var758, self.kind.value)
			buff = var757
			var749 = var758
		end
	end
	local buff_1 = buffer.create(var749)
	buffer.copy(buff_1, 0, buff, 0, var749)
	
	return buff_1
end

function t_20.decode(p42) --[[ line: 5590 ]]
	-- upvalues: t_20 (ref), protoModule (ref), propConditionModule (ref)
	local var760 = t_20.new()
	local var761 = 0
	while var761 < buffer.len(p42) do
		local _ = nil
		local var762 = nil
		local var763, var764, var765 = protoModule.readTag(p42, var761)
		local var766 = var763
		var762 = var764
		var761 = var765
		
		if var762 == protoModule.wireTypes.varint then
			if var766 == 2 then
				local _ = nil
				local var767, var768 = protoModule.readVarIntI64(p42, var761)
				var761 = var768
				var760.kind = { type = "literal", value = var767 }
			else
				local _ = nil
				local var769, var770 = protoModule.readVarInt(p42, var761)
				local _ = var769
				var761 = var770
			end
		end
		if var762 == protoModule.wireTypes.lengthDelimited then
			if var766 == 1 then
				local _ = nil
				local var771, var772 = protoModule.readBuffer(p42, var761)
				var761 = var772
				var760.condition = propConditionModule.PropCondition.decode(var771)
			elseif var766 == 3 then
				local _ = nil
				local var773, var774 = protoModule.readBuffer(p42, var761)
				var761 = var774
				var760.kind = { type = "binding_path", value = buffer.tostring(var773) }
			elseif var766 == 4 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p42, var761)
				var761 = var776
				var760.kind = { type = "token", value = buffer.tostring(var775) }
			else
				local _ = nil
				local var777, var778 = protoModule.readVarInt(p42, var761)
				var761 = var778 + var777
			end
		elseif var762 == protoModule.wireTypes.i32 then
			local _ = nil
			local var779, var780 = protoModule.readFixed32(p42, var761)
			local _ = var779
			var761 = var780
		elseif var762 == protoModule.wireTypes.i64 then
			local _ = nil
			local var781, var782 = protoModule.readFixed64(p42, var761)
			local _ = var781
			var761 = var782
		else
			error("Unsupported wire type: " .. var762)
		end
	end
	return var760
end

function t_20:jsonEncode() --[[ line: 5648 ]]
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

function t_20:jsonDecode() --[[ line: 5668 ]]
	-- upvalues: t_20 (ref), propConditionModule (ref)
	local var784 = t_20.new()
	
	if self.condition ~= nil then
		var784.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var784.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var784.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var784.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.token ~= nil then
		var784.kind = { type = "token", value = self.token }
	end
	return var784
end

t_20.descriptor = {
	name = "Int64Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Int64Prop_ConditionalOption = t_20
typeRegistryModule.default:register(t.Int64Prop_ConditionalOption)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p43) --[[ line: 5709 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		options = if p43 == nil or p43.options == nil then {} else p43.options
	}, t_21)
end

function t_21:encode() --[[ line: 5717 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var786 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var787 = v:encode()
			local var788, var789 = protoModule.writeTag(buff, var786, 1, protoModule.wireTypes.lengthDelimited)
			var788, var789 = protoModule.writeBuffer(var788, var789, var787, buffer.len(var787))
			buff = var788
			var786 = var789
		end
	end
	local buff_1 = buffer.create(var786)
	buffer.copy(buff_1, 0, buff, 0, var786)
	
	return buff_1
end

function t_21.decode(p44) --[[ line: 5734 ]]
	-- upvalues: t_21 (ref), protoModule (ref), t (ref)
	local var791 = t_21.new()
	local var792 = 0
	while var792 < buffer.len(p44) do
		local _ = nil
		local var793 = nil
		local var794, var795, var796 = protoModule.readTag(p44, var792)
		local var797 = var794
		var793 = var795
		var792 = var796
		
		if var793 == protoModule.wireTypes.varint then
			local _ = nil
			local var798, var799 = protoModule.readVarInt(p44, var792)
			local _ = var798
			var792 = var799
			continue
		end
		if var793 == protoModule.wireTypes.lengthDelimited then
			if var797 == 1 then
				local _ = nil
				local var800, var801 = protoModule.readBuffer(p44, var792)
				var792 = var801
				table.insert(var791.options, t.Int64Prop_ConditionalOption.decode(var800))
			else
				local _ = nil
				local var802, var803 = protoModule.readVarInt(p44, var792)
				var792 = var803 + var802
			end
		elseif var793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var804, var805 = protoModule.readFixed32(p44, var792)
			local _ = var804
			var792 = var805
		elseif var793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var806, var807 = protoModule.readFixed64(p44, var792)
			local _ = var806
			var792 = var807
		else
			error("Unsupported wire type: " .. var793)
		end
	end
	return var791
end

function t_21:jsonEncode() --[[ line: 5777 ]]
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

function t_21:jsonDecode() --[[ line: 5791 ]]
	-- upvalues: t_21 (ref), t (ref)
	local var810 = t_21.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Int64Prop_ConditionalOption.jsonDecode(v))
		end
		var810.options = t_1
	end
	return var810
end

t_21.descriptor = {
	name = "Int64Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Int64Prop_ConditionalOptions = t_21
typeRegistryModule.default:register(t.Int64Prop_ConditionalOptions)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p45) --[[ line: 5820 ]]
	-- upvalues: t_22 (ref)
	return setmetatable({
		kind = if p45 == nil or p45.kind == nil then nil else p45.kind
	}, t_22)
end

function t_22:encode() --[[ line: 5826 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var813 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var814, var815 = protoModule.writeTag(buff, var813, 1, protoModule.wireTypes.varint)
			var814, var815 = protoModule.writeVarInt(var814, var815, if self.kind.value then 1 else 0)
			buff = var814
			var813 = var815
		elseif self.kind.type == "binding_path" then
			local var816, var817 = protoModule.writeTag(buff, var813, 2, protoModule.wireTypes.lengthDelimited)
			var816, var817 = protoModule.writeString(var816, var817, self.kind.value)
			buff = var816
			var813 = var817
		elseif self.kind.type == "conditional" then
			local var818 = self.kind.value:encode()
			local var819, var820 = protoModule.writeTag(buff, var813, 3, protoModule.wireTypes.lengthDelimited)
			var819, var820 = protoModule.writeBuffer(var819, var820, var818, buffer.len(var818))
			buff = var819
			var813 = var820
		end
	end
	local buff_1 = buffer.create(var813)
	buffer.copy(buff_1, 0, buff, 0, var813)
	
	return buff_1
end

function t_22.decode(p46) --[[ line: 5849 ]]
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var822 = t_22.new()
	local var823 = 0
	while var823 < buffer.len(p46) do
		local _ = nil
		local var824 = nil
		local var825, var826, var827 = protoModule.readTag(p46, var823)
		local var828 = var825
		var824 = var826
		var823 = var827
		
		if var824 == protoModule.wireTypes.varint then
			if var828 == 1 then
				local _ = nil
				local var829, var830 = protoModule.readVarInt(p46, var823)
				var823 = var830
				var822.kind = { type = "literal", value = var829 ~= 0 }
			else
				local _ = nil
				local var831, var832 = protoModule.readVarInt(p46, var823)
				local _ = var831
				var823 = var832
			end
		end
		if var824 == protoModule.wireTypes.lengthDelimited then
			if var828 == 2 then
				local _ = nil
				local var833, var834 = protoModule.readBuffer(p46, var823)
				var823 = var834
				var822.kind = { type = "binding_path", value = buffer.tostring(var833) }
			elseif var828 == 3 then
				local _ = nil
				local var835, var836 = protoModule.readBuffer(p46, var823)
				var823 = var836
				var822.kind = {
					type = "conditional",
					value = t.BoolProp_ConditionalOptions.decode(var835)
				}
			else
				local _ = nil
				local var837, var838 = protoModule.readVarInt(p46, var823)
				var823 = var838 + var837
			end
		elseif var824 == protoModule.wireTypes.i32 then
			local _ = nil
			local var839, var840 = protoModule.readFixed32(p46, var823)
			local _ = var839
			var823 = var840
		elseif var824 == protoModule.wireTypes.i64 then
			local _ = nil
			local var841, var842 = protoModule.readFixed64(p46, var823)
			local _ = var841
			var823 = var842
		else
			error("Unsupported wire type: " .. var824)
		end
	end
	return var822
end

function t_22:jsonEncode() --[[ line: 5902 ]]
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

function t_22:jsonDecode() --[[ line: 5918 ]]
	-- upvalues: t_22 (ref), t (ref)
	local var844 = t_22.new()
	
	if self.literal ~= nil then
		var844.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var844.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var844.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var844.kind = {
			type = "conditional",
			value = t.BoolProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var844
end

t_22.descriptor = {
	name = "BoolProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.BoolProp"
}
t.BoolProp = t_22
typeRegistryModule.default:register(t.BoolProp)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p47) --[[ line: 5955 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		condition = if p47 == nil or p47.condition == nil then nil else p47.condition,
		kind = if p47 == nil or p47.kind == nil then nil else p47.kind
	}, t_23)
end

function t_23:encode() --[[ line: 5964 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var846 = 0
	
	if self.condition ~= nil then
		local var847 = self.condition:encode()
		local var848, var849 = protoModule.writeTag(buff, var846, 1, protoModule.wireTypes.lengthDelimited)
		var848, var849 = protoModule.writeBuffer(var848, var849, var847, buffer.len(var847))
		buff = var848
		var846 = var849
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var850, var851 = protoModule.writeTag(buff, var846, 2, protoModule.wireTypes.varint)
			var850, var851 = protoModule.writeVarInt(var850, var851, if self.kind.value then 1 else 0)
			buff = var850
			var846 = var851
		elseif self.kind.type == "binding_path" then
			local var852, var853 = protoModule.writeTag(buff, var846, 3, protoModule.wireTypes.lengthDelimited)
			var852, var853 = protoModule.writeString(var852, var853, self.kind.value)
			buff = var852
			var846 = var853
		end
	end
	local buff_1 = buffer.create(var846)
	buffer.copy(buff_1, 0, buff, 0, var846)
	
	return buff_1
end

function t_23.decode(p48) --[[ line: 5989 ]]
	-- upvalues: t_23 (ref), protoModule (ref), propConditionModule (ref)
	local var855 = t_23.new()
	local var856 = 0
	while var856 < buffer.len(p48) do
		local _ = nil
		local var857 = nil
		local var858, var859, var860 = protoModule.readTag(p48, var856)
		local var861 = var858
		var857 = var859
		var856 = var860
		
		if var857 == protoModule.wireTypes.varint then
			if var861 == 2 then
				local _ = nil
				local var862, var863 = protoModule.readVarInt(p48, var856)
				var856 = var863
				var855.kind = { type = "literal", value = var862 ~= 0 }
			else
				local _ = nil
				local var864, var865 = protoModule.readVarInt(p48, var856)
				local _ = var864
				var856 = var865
			end
		end
		if var857 == protoModule.wireTypes.lengthDelimited then
			if var861 == 1 then
				local _ = nil
				local var866, var867 = protoModule.readBuffer(p48, var856)
				var856 = var867
				var855.condition = propConditionModule.PropCondition.decode(var866)
			elseif var861 == 3 then
				local _ = nil
				local var868, var869 = protoModule.readBuffer(p48, var856)
				var856 = var869
				var855.kind = { type = "binding_path", value = buffer.tostring(var868) }
			else
				local _ = nil
				local var870, var871 = protoModule.readVarInt(p48, var856)
				var856 = var871 + var870
			end
		elseif var857 == protoModule.wireTypes.i32 then
			local _ = nil
			local var872, var873 = protoModule.readFixed32(p48, var856)
			local _ = var872
			var856 = var873
		elseif var857 == protoModule.wireTypes.i64 then
			local _ = nil
			local var874, var875 = protoModule.readFixed64(p48, var856)
			local _ = var874
			var856 = var875
		else
			error("Unsupported wire type: " .. var857)
		end
	end
	return var855
end

function t_23:jsonEncode() --[[ line: 6042 ]]
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

function t_23:jsonDecode() --[[ line: 6060 ]]
	-- upvalues: t_23 (ref), propConditionModule (ref)
	local var877 = t_23.new()
	
	if self.condition ~= nil then
		var877.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var877.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var877.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var877.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var877
end

t_23.descriptor = {
	name = "BoolProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.BoolProp_ConditionalOption = t_23
typeRegistryModule.default:register(t.BoolProp_ConditionalOption)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p49) --[[ line: 6097 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		options = if p49 == nil or p49.options == nil then {} else p49.options
	}, t_24)
end

function t_24:encode() --[[ line: 6105 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var879 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var880 = v:encode()
			local var881, var882 = protoModule.writeTag(buff, var879, 1, protoModule.wireTypes.lengthDelimited)
			var881, var882 = protoModule.writeBuffer(var881, var882, var880, buffer.len(var880))
			buff = var881
			var879 = var882
		end
	end
	local buff_1 = buffer.create(var879)
	buffer.copy(buff_1, 0, buff, 0, var879)
	
	return buff_1
end

function t_24.decode(p50) --[[ line: 6122 ]]
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var884 = t_24.new()
	local var885 = 0
	while var885 < buffer.len(p50) do
		local _ = nil
		local var886 = nil
		local var887, var888, var889 = protoModule.readTag(p50, var885)
		local var890 = var887
		var886 = var888
		var885 = var889
		
		if var886 == protoModule.wireTypes.varint then
			local _ = nil
			local var891, var892 = protoModule.readVarInt(p50, var885)
			local _ = var891
			var885 = var892
			continue
		end
		if var886 == protoModule.wireTypes.lengthDelimited then
			if var890 == 1 then
				local _ = nil
				local var893, var894 = protoModule.readBuffer(p50, var885)
				var885 = var894
				table.insert(var884.options, t.BoolProp_ConditionalOption.decode(var893))
			else
				local _ = nil
				local var895, var896 = protoModule.readVarInt(p50, var885)
				var885 = var896 + var895
			end
		elseif var886 == protoModule.wireTypes.i32 then
			local _ = nil
			local var897, var898 = protoModule.readFixed32(p50, var885)
			local _ = var897
			var885 = var898
		elseif var886 == protoModule.wireTypes.i64 then
			local _ = nil
			local var899, var900 = protoModule.readFixed64(p50, var885)
			local _ = var899
			var885 = var900
		else
			error("Unsupported wire type: " .. var886)
		end
	end
	return var884
end

function t_24:jsonEncode() --[[ line: 6165 ]]
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

function t_24:jsonDecode() --[[ line: 6179 ]]
	-- upvalues: t_24 (ref), t (ref)
	local var903 = t_24.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.BoolProp_ConditionalOption.jsonDecode(v))
		end
		var903.options = t_1
	end
	return var903
end

t_24.descriptor = {
	name = "BoolProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.BoolProp_ConditionalOptions = t_24
typeRegistryModule.default:register(t.BoolProp_ConditionalOptions)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p51) --[[ line: 6208 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		kind = if p51 == nil or p51.kind == nil then nil else p51.kind
	}, t_25)
end

function t_25:encode() --[[ line: 6214 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var906 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var907 = self.kind.value:encode()
			local var908, var909 = protoModule.writeTag(buff, var906, 1, protoModule.wireTypes.lengthDelimited)
			var908, var909 = protoModule.writeBuffer(var908, var909, var907, buffer.len(var907))
			buff = var908
			var906 = var909
		elseif self.kind.type == "binding_path" then
			local var910, var911 = protoModule.writeTag(buff, var906, 2, protoModule.wireTypes.lengthDelimited)
			var910, var911 = protoModule.writeString(var910, var911, self.kind.value)
			buff = var910
			var906 = var911
		elseif self.kind.type == "conditional" then
			local var912 = self.kind.value:encode()
			local var913, var914 = protoModule.writeTag(buff, var906, 3, protoModule.wireTypes.lengthDelimited)
			var913, var914 = protoModule.writeBuffer(var913, var914, var912, buffer.len(var912))
			buff = var913
			var906 = var914
		end
	end
	local buff_1 = buffer.create(var906)
	buffer.copy(buff_1, 0, buff, 0, var906)
	
	return buff_1
end

function t_25.decode(p52) --[[ line: 6238 ]]
	-- upvalues: t_25 (ref), protoModule (ref), structModule (ref), t (ref)
	local var916 = t_25.new()
	local var917 = 0
	while var917 < buffer.len(p52) do
		local _ = nil
		local var918 = nil
		local var919, var920, var921 = protoModule.readTag(p52, var917)
		local var922 = var919
		var918 = var920
		var917 = var921
		
		if var918 == protoModule.wireTypes.varint then
			local _ = nil
			local var923, var924 = protoModule.readVarInt(p52, var917)
			local _ = var923
			var917 = var924
			continue
		end
		if var918 == protoModule.wireTypes.lengthDelimited then
			if var922 == 1 then
				local _ = nil
				local var925, var926 = protoModule.readBuffer(p52, var917)
				var917 = var926
				var916.kind = {
					type = "literal",
					value = structModule.Struct.decode(var925)
				}
			elseif var922 == 2 then
				local _ = nil
				local var927, var928 = protoModule.readBuffer(p52, var917)
				var917 = var928
				var916.kind = { type = "binding_path", value = buffer.tostring(var927) }
			elseif var922 == 3 then
				local _ = nil
				local var929, var930 = protoModule.readBuffer(p52, var917)
				var917 = var930
				var916.kind = {
					type = "conditional",
					value = t.StructProp_ConditionalOptions.decode(var929)
				}
			else
				local _ = nil
				local var931, var932 = protoModule.readVarInt(p52, var917)
				var917 = var932 + var931
			end
		elseif var918 == protoModule.wireTypes.i32 then
			local _ = nil
			local var933, var934 = protoModule.readFixed32(p52, var917)
			local _ = var933
			var917 = var934
		elseif var918 == protoModule.wireTypes.i64 then
			local _ = nil
			local var935, var936 = protoModule.readFixed64(p52, var917)
			local _ = var935
			var917 = var936
		else
			error("Unsupported wire type: " .. var918)
		end
	end
	return var916
end

function t_25:jsonEncode() --[[ line: 6291 ]]
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

function t_25:jsonDecode() --[[ line: 6307 ]]
	-- upvalues: t_25 (ref), structModule (ref), t (ref)
	local var938 = t_25.new()
	
	if self.literal ~= nil then
		var938.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var938.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var938.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var938.kind = {
			type = "conditional",
			value = t.StructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var938
end

t_25.descriptor = {
	name = "StructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.StructProp"
}
t.StructProp = t_25
typeRegistryModule.default:register(t.StructProp)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p53) --[[ line: 6344 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		condition = if p53 == nil or p53.condition == nil then nil else p53.condition,
		kind = if p53 == nil or p53.kind == nil then nil else p53.kind
	}, t_26)
end

function t_26:encode() --[[ line: 6353 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var940 = 0
	
	if self.condition ~= nil then
		local var941 = self.condition:encode()
		local var942, var943 = protoModule.writeTag(buff, var940, 1, protoModule.wireTypes.lengthDelimited)
		var942, var943 = protoModule.writeBuffer(var942, var943, var941, buffer.len(var941))
		buff = var942
		var940 = var943
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var944 = self.kind.value:encode()
			local var945, var946 = protoModule.writeTag(buff, var940, 2, protoModule.wireTypes.lengthDelimited)
			var945, var946 = protoModule.writeBuffer(var945, var946, var944, buffer.len(var944))
			buff = var945
			var940 = var946
		elseif self.kind.type == "binding_path" then
			local var947, var948 = protoModule.writeTag(buff, var940, 3, protoModule.wireTypes.lengthDelimited)
			var947, var948 = protoModule.writeString(var947, var948, self.kind.value)
			buff = var947
			var940 = var948
		end
	end
	local buff_1 = buffer.create(var940)
	buffer.copy(buff_1, 0, buff, 0, var940)
	
	return buff_1
end

function t_26.decode(p54) --[[ line: 6379 ]]
	-- upvalues: t_26 (ref), protoModule (ref), propConditionModule (ref), structModule (ref)
	local var950 = t_26.new()
	local var951 = 0
	while var951 < buffer.len(p54) do
		local _ = nil
		local var952 = nil
		local var953, var954, var955 = protoModule.readTag(p54, var951)
		local var956 = var953
		var952 = var954
		var951 = var955
		
		if var952 == protoModule.wireTypes.varint then
			local _ = nil
			local var957, var958 = protoModule.readVarInt(p54, var951)
			local _ = var957
			var951 = var958
			continue
		end
		if var952 == protoModule.wireTypes.lengthDelimited then
			if var956 == 1 then
				local _ = nil
				local var959, var960 = protoModule.readBuffer(p54, var951)
				var951 = var960
				var950.condition = propConditionModule.PropCondition.decode(var959)
			elseif var956 == 2 then
				local _ = nil
				local var961, var962 = protoModule.readBuffer(p54, var951)
				var951 = var962
				var950.kind = {
					type = "literal",
					value = structModule.Struct.decode(var961)
				}
			elseif var956 == 3 then
				local _ = nil
				local var963, var964 = protoModule.readBuffer(p54, var951)
				var951 = var964
				var950.kind = { type = "binding_path", value = buffer.tostring(var963) }
			else
				local _ = nil
				local var965, var966 = protoModule.readVarInt(p54, var951)
				var951 = var966 + var965
			end
		elseif var952 == protoModule.wireTypes.i32 then
			local _ = nil
			local var967, var968 = protoModule.readFixed32(p54, var951)
			local _ = var967
			var951 = var968
		elseif var952 == protoModule.wireTypes.i64 then
			local _ = nil
			local var969, var970 = protoModule.readFixed64(p54, var951)
			local _ = var969
			var951 = var970
		else
			error("Unsupported wire type: " .. var952)
		end
	end
	return var950
end

function t_26:jsonEncode() --[[ line: 6432 ]]
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

function t_26:jsonDecode() --[[ line: 6450 ]]
	-- upvalues: t_26 (ref), propConditionModule (ref), structModule (ref)
	local var972 = t_26.new()
	
	if self.condition ~= nil then
		var972.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var972.kind = {
			type = "literal",
			value = structModule.Struct.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var972.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var972.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var972
end

t_26.descriptor = {
	name = "StructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.StructProp_ConditionalOption = t_26
typeRegistryModule.default:register(t.StructProp_ConditionalOption)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p55) --[[ line: 6487 ]]
	-- upvalues: t_27 (ref)
	return setmetatable({
		options = if p55 == nil or p55.options == nil then {} else p55.options
	}, t_27)
end

function t_27:encode() --[[ line: 6495 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var974 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var975 = v:encode()
			local var976, var977 = protoModule.writeTag(buff, var974, 1, protoModule.wireTypes.lengthDelimited)
			var976, var977 = protoModule.writeBuffer(var976, var977, var975, buffer.len(var975))
			buff = var976
			var974 = var977
		end
	end
	local buff_1 = buffer.create(var974)
	buffer.copy(buff_1, 0, buff, 0, var974)
	
	return buff_1
end

function t_27.decode(p56) --[[ line: 6512 ]]
	-- upvalues: t_27 (ref), protoModule (ref), t (ref)
	local var979 = t_27.new()
	local var980 = 0
	while var980 < buffer.len(p56) do
		local _ = nil
		local var981 = nil
		local var982, var983, var984 = protoModule.readTag(p56, var980)
		local var985 = var982
		var981 = var983
		var980 = var984
		
		if var981 == protoModule.wireTypes.varint then
			local _ = nil
			local var986, var987 = protoModule.readVarInt(p56, var980)
			local _ = var986
			var980 = var987
			continue
		end
		if var981 == protoModule.wireTypes.lengthDelimited then
			if var985 == 1 then
				local _ = nil
				local var988, var989 = protoModule.readBuffer(p56, var980)
				var980 = var989
				table.insert(var979.options, t.StructProp_ConditionalOption.decode(var988))
			else
				local _ = nil
				local var990, var991 = protoModule.readVarInt(p56, var980)
				var980 = var991 + var990
			end
		elseif var981 == protoModule.wireTypes.i32 then
			local _ = nil
			local var992, var993 = protoModule.readFixed32(p56, var980)
			local _ = var992
			var980 = var993
		elseif var981 == protoModule.wireTypes.i64 then
			local _ = nil
			local var994, var995 = protoModule.readFixed64(p56, var980)
			local _ = var994
			var980 = var995
		else
			error("Unsupported wire type: " .. var981)
		end
	end
	return var979
end

function t_27:jsonEncode() --[[ line: 6555 ]]
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

function t_27:jsonDecode() --[[ line: 6569 ]]
	-- upvalues: t_27 (ref), t (ref)
	local var998 = t_27.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.StructProp_ConditionalOption.jsonDecode(v))
		end
		var998.options = t_1
	end
	return var998
end

t_27.descriptor = {
	name = "StructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.StructProp_ConditionalOptions = t_27
typeRegistryModule.default:register(t.StructProp_ConditionalOptions)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p57) --[[ line: 6598 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		kind = if p57 == nil or p57.kind == nil then nil else p57.kind,
		alt = if p57 == nil or p57.alt == nil then nil else p57.alt
	}, t_28)
end

function t_28:encode() --[[ line: 6605 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1001 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1002, var1003 = protoModule.writeTag(buff, var1001, 1, protoModule.wireTypes.lengthDelimited)
			var1002, var1003 = protoModule.writeString(var1002, var1003, self.kind.value)
			buff = var1002
			var1001 = var1003
		elseif self.kind.type == "binding_path" then
			local var1004, var1005 = protoModule.writeTag(buff, var1001, 2, protoModule.wireTypes.lengthDelimited)
			var1004, var1005 = protoModule.writeString(var1004, var1005, self.kind.value)
			buff = var1004
			var1001 = var1005
		elseif self.kind.type == "format" then
			local var1006 = self.kind.value:encode()
			local var1007, var1008 = protoModule.writeTag(buff, var1001, 3, protoModule.wireTypes.lengthDelimited)
			var1007, var1008 = protoModule.writeBuffer(var1007, var1008, var1006, buffer.len(var1006))
			buff = var1007
			var1001 = var1008
		elseif self.kind.type == "conditional" then
			local var1009 = self.kind.value:encode()
			local var1010, var1011 = protoModule.writeTag(buff, var1001, 4, protoModule.wireTypes.lengthDelimited)
			var1010, var1011 = protoModule.writeBuffer(var1010, var1011, var1009, buffer.len(var1009))
			buff = var1010
			var1001 = var1011
		elseif self.kind.type == "translation" then
			local var1012 = self.kind.value:encode()
			local var1013, var1014 = protoModule.writeTag(buff, var1001, 5, protoModule.wireTypes.lengthDelimited)
			var1013, var1014 = protoModule.writeBuffer(var1013, var1014, var1012, buffer.len(var1012))
			buff = var1013
			var1001 = var1014
		end
	end
	if self.alt ~= nil then
		local var1015 = self.alt:encode()
		local var1016, var1017 = protoModule.writeTag(buff, var1001, 6, protoModule.wireTypes.lengthDelimited)
		var1016, var1017 = protoModule.writeBuffer(var1016, var1017, var1015, buffer.len(var1015))
		buff = var1016
		var1001 = var1017
	end
	local buff_1 = buffer.create(var1001)
	buffer.copy(buff_1, 0, buff, 0, var1001)
	
	return buff_1
end

function t_28.decode(p58) --[[ line: 6642 ]]
	-- upvalues: t_28 (ref), protoModule (ref), t (ref)
	local var1019 = t_28.new()
	local var1020 = 0
	while var1020 < buffer.len(p58) do
		local _ = nil
		local var1021 = nil
		local var1022, var1023, var1024 = protoModule.readTag(p58, var1020)
		local var1025 = var1022
		var1021 = var1023
		var1020 = var1024
		
		if var1021 == protoModule.wireTypes.varint then
			local _ = nil
			local var1026, var1027 = protoModule.readVarInt(p58, var1020)
			local _ = var1026
			var1020 = var1027
			continue
		end
		if var1021 == protoModule.wireTypes.lengthDelimited then
			if var1025 == 1 then
				local _ = nil
				local var1028, var1029 = protoModule.readBuffer(p58, var1020)
				var1020 = var1029
				var1019.kind = { type = "literal", value = buffer.tostring(var1028) }
			elseif var1025 == 2 then
				local _ = nil
				local var1030, var1031 = protoModule.readBuffer(p58, var1020)
				var1020 = var1031
				var1019.kind = { type = "binding_path", value = buffer.tostring(var1030) }
			elseif var1025 == 3 then
				local _ = nil
				local var1032, var1033 = protoModule.readBuffer(p58, var1020)
				var1020 = var1033
				var1019.kind = { type = "format", value = t.StringFormat.decode(var1032) }
			elseif var1025 == 4 then
				local _ = nil
				local var1034, var1035 = protoModule.readBuffer(p58, var1020)
				var1020 = var1035
				var1019.kind = {
					type = "conditional",
					value = t.ImageStringProp_ConditionalOptions.decode(var1034)
				}
			elseif var1025 == 5 then
				local _ = nil
				local var1036, var1037 = protoModule.readBuffer(p58, var1020)
				var1020 = var1037
				var1019.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1036)
				}
			elseif var1025 == 6 then
				local _ = nil
				local var1038, var1039 = protoModule.readBuffer(p58, var1020)
				var1020 = var1039
				var1019.alt = t.StringFormat.decode(var1038)
			else
				local _ = nil
				local var1040, var1041 = protoModule.readVarInt(p58, var1020)
				var1020 = var1041 + var1040
			end
		elseif var1021 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1042, var1043 = protoModule.readFixed32(p58, var1020)
			local _ = var1042
			var1020 = var1043
		elseif var1021 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1044, var1045 = protoModule.readFixed64(p58, var1020)
			local _ = var1044
			var1020 = var1045
		else
			error("Unsupported wire type: " .. var1021)
		end
	end
	return var1019
end

function t_28:jsonEncode() --[[ line: 6711 ]]
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

function t_28:jsonDecode() --[[ line: 6735 ]]
	-- upvalues: t_28 (ref), t (ref)
	local var1047 = t_28.new()
	
	if self.literal ~= nil then
		var1047.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1047.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1047.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1047.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var1047.kind = {
			type = "conditional",
			value = t.ImageStringProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var1047.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	if self.alt ~= nil then
		var1047.alt = t.StringFormat.jsonDecode(self.alt)
	end
	return var1047
end

t_28.descriptor = {
	name = "ImageStringProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageStringProp"
}
t.ImageStringProp = t_28
typeRegistryModule.default:register(t.ImageStringProp)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p59) --[[ line: 6786 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		condition = if p59 == nil or p59.condition == nil then nil else p59.condition,
		kind = if p59 == nil or p59.kind == nil then nil else p59.kind
	}, t_29)
end

function t_29:encode() --[[ line: 6795 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1049 = 0
	
	if self.condition ~= nil then
		local var1050 = self.condition:encode()
		local var1051, var1052 = protoModule.writeTag(buff, var1049, 1, protoModule.wireTypes.lengthDelimited)
		var1051, var1052 = protoModule.writeBuffer(var1051, var1052, var1050, buffer.len(var1050))
		buff = var1051
		var1049 = var1052
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1053, var1054 = protoModule.writeTag(buff, var1049, 2, protoModule.wireTypes.lengthDelimited)
			var1053, var1054 = protoModule.writeString(var1053, var1054, self.kind.value)
			buff = var1053
			var1049 = var1054
		elseif self.kind.type == "binding_path" then
			local var1055, var1056 = protoModule.writeTag(buff, var1049, 3, protoModule.wireTypes.lengthDelimited)
			var1055, var1056 = protoModule.writeString(var1055, var1056, self.kind.value)
			buff = var1055
			var1049 = var1056
		elseif self.kind.type == "format" then
			local var1057 = self.kind.value:encode()
			local var1058, var1059 = protoModule.writeTag(buff, var1049, 4, protoModule.wireTypes.lengthDelimited)
			var1058, var1059 = protoModule.writeBuffer(var1058, var1059, var1057, buffer.len(var1057))
			buff = var1058
			var1049 = var1059
		elseif self.kind.type == "translation" then
			local var1060 = self.kind.value:encode()
			local var1061, var1062 = protoModule.writeTag(buff, var1049, 5, protoModule.wireTypes.lengthDelimited)
			var1061, var1062 = protoModule.writeBuffer(var1061, var1062, var1060, buffer.len(var1060))
			buff = var1061
			var1049 = var1062
		end
	end
	local buff_1 = buffer.create(var1049)
	buffer.copy(buff_1, 0, buff, 0, var1049)
	
	return buff_1
end

function t_29.decode(p60) --[[ line: 6828 ]]
	-- upvalues: t_29 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1064 = t_29.new()
	local var1065 = 0
	while var1065 < buffer.len(p60) do
		local _ = nil
		local var1066 = nil
		local var1067, var1068, var1069 = protoModule.readTag(p60, var1065)
		local var1070 = var1067
		var1066 = var1068
		var1065 = var1069
		
		if var1066 == protoModule.wireTypes.varint then
			local _ = nil
			local var1071, var1072 = protoModule.readVarInt(p60, var1065)
			local _ = var1071
			var1065 = var1072
			continue
		end
		if var1066 == protoModule.wireTypes.lengthDelimited then
			if var1070 == 1 then
				local _ = nil
				local var1073, var1074 = protoModule.readBuffer(p60, var1065)
				var1065 = var1074
				var1064.condition = propConditionModule.PropCondition.decode(var1073)
			elseif var1070 == 2 then
				local _ = nil
				local var1075, var1076 = protoModule.readBuffer(p60, var1065)
				var1065 = var1076
				var1064.kind = { type = "literal", value = buffer.tostring(var1075) }
			elseif var1070 == 3 then
				local _ = nil
				local var1077, var1078 = protoModule.readBuffer(p60, var1065)
				var1065 = var1078
				var1064.kind = { type = "binding_path", value = buffer.tostring(var1077) }
			elseif var1070 == 4 then
				local _ = nil
				local var1079, var1080 = protoModule.readBuffer(p60, var1065)
				var1065 = var1080
				var1064.kind = { type = "format", value = t.StringFormat.decode(var1079) }
			elseif var1070 == 5 then
				local _ = nil
				local var1081, var1082 = protoModule.readBuffer(p60, var1065)
				var1065 = var1082
				var1064.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1081)
				}
			else
				local _ = nil
				local var1083, var1084 = protoModule.readVarInt(p60, var1065)
				var1065 = var1084 + var1083
			end
		elseif var1066 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1085, var1086 = protoModule.readFixed32(p60, var1065)
			local _ = var1085
			var1065 = var1086
		elseif var1066 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1087, var1088 = protoModule.readFixed64(p60, var1065)
			local _ = var1087
			var1065 = var1088
		else
			error("Unsupported wire type: " .. var1066)
		end
	end
	return var1064
end

function t_29:jsonEncode() --[[ line: 6891 ]]
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

function t_29:jsonDecode() --[[ line: 6913 ]]
	-- upvalues: t_29 (ref), propConditionModule (ref), t (ref)
	local var1090 = t_29.new()
	
	if self.condition ~= nil then
		var1090.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1090.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1090.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1090.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1090.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var1090.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1090
end

t_29.descriptor = {
	name = "ImageStringProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageStringProp_ConditionalOption = t_29
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOption)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p61) --[[ line: 6960 ]]
	-- upvalues: t_30 (ref)
	return setmetatable({
		options = if p61 == nil or p61.options == nil then {} else p61.options
	}, t_30)
end

function t_30:encode() --[[ line: 6968 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1092 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1093 = v:encode()
			local var1094, var1095 = protoModule.writeTag(buff, var1092, 1, protoModule.wireTypes.lengthDelimited)
			var1094, var1095 = protoModule.writeBuffer(var1094, var1095, var1093, buffer.len(var1093))
			buff = var1094
			var1092 = var1095
		end
	end
	local buff_1 = buffer.create(var1092)
	buffer.copy(buff_1, 0, buff, 0, var1092)
	
	return buff_1
end

function t_30.decode(p62) --[[ line: 6985 ]]
	-- upvalues: t_30 (ref), protoModule (ref), t (ref)
	local var1097 = t_30.new()
	local var1098 = 0
	while var1098 < buffer.len(p62) do
		local _ = nil
		local var1099 = nil
		local var1100, var1101, var1102 = protoModule.readTag(p62, var1098)
		local var1103 = var1100
		var1099 = var1101
		var1098 = var1102
		
		if var1099 == protoModule.wireTypes.varint then
			local _ = nil
			local var1104, var1105 = protoModule.readVarInt(p62, var1098)
			local _ = var1104
			var1098 = var1105
			continue
		end
		if var1099 == protoModule.wireTypes.lengthDelimited then
			if var1103 == 1 then
				local _ = nil
				local var1106, var1107 = protoModule.readBuffer(p62, var1098)
				var1098 = var1107
				table.insert(var1097.options, t.ImageStringProp_ConditionalOption.decode(var1106))
			else
				local _ = nil
				local var1108, var1109 = protoModule.readVarInt(p62, var1098)
				var1098 = var1109 + var1108
			end
		elseif var1099 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1110, var1111 = protoModule.readFixed32(p62, var1098)
			local _ = var1110
			var1098 = var1111
		elseif var1099 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1112, var1113 = protoModule.readFixed64(p62, var1098)
			local _ = var1112
			var1098 = var1113
		else
			error("Unsupported wire type: " .. var1099)
		end
	end
	return var1097
end

function t_30:jsonEncode() --[[ line: 7028 ]]
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

function t_30:jsonDecode() --[[ line: 7042 ]]
	-- upvalues: t_30 (ref), t (ref)
	local var1116 = t_30.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageStringProp_ConditionalOption.jsonDecode(v))
		end
		var1116.options = t_1
	end
	return var1116
end

t_30.descriptor = {
	name = "ImageStringProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageStringProp_ConditionalOptions = t_30
typeRegistryModule.default:register(t.ImageStringProp_ConditionalOptions)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p63) --[[ line: 7073 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		kind = if p63 == nil or p63.kind == nil then nil else p63.kind
	}, t_31)
end

function t_31:encode() --[[ line: 7079 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1119 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1120, var1121 = protoModule.writeTag(buff, var1119, 1, protoModule.wireTypes.lengthDelimited)
			var1120, var1121 = protoModule.writeString(var1120, var1121, self.kind.value)
			buff = var1120
			var1119 = var1121
		elseif self.kind.type == "binding_path" then
			local var1122, var1123 = protoModule.writeTag(buff, var1119, 2, protoModule.wireTypes.lengthDelimited)
			var1122, var1123 = protoModule.writeString(var1122, var1123, self.kind.value)
			buff = var1122
			var1119 = var1123
		elseif self.kind.type == "format" then
			local var1124 = self.kind.value:encode()
			local var1125, var1126 = protoModule.writeTag(buff, var1119, 3, protoModule.wireTypes.lengthDelimited)
			var1125, var1126 = protoModule.writeBuffer(var1125, var1126, var1124, buffer.len(var1124))
			buff = var1125
			var1119 = var1126
		elseif self.kind.type == "conditional" then
			local var1127 = self.kind.value:encode()
			local var1128, var1129 = protoModule.writeTag(buff, var1119, 4, protoModule.wireTypes.lengthDelimited)
			var1128, var1129 = protoModule.writeBuffer(var1128, var1129, var1127, buffer.len(var1127))
			buff = var1128
			var1119 = var1129
		elseif self.kind.type == "translation" then
			local var1130 = self.kind.value:encode()
			local var1131, var1132 = protoModule.writeTag(buff, var1119, 5, protoModule.wireTypes.lengthDelimited)
			var1131, var1132 = protoModule.writeBuffer(var1131, var1132, var1130, buffer.len(var1130))
			buff = var1131
			var1119 = var1132
		end
	end
	local buff_1 = buffer.create(var1119)
	buffer.copy(buff_1, 0, buff, 0, var1119)
	
	return buff_1
end

function t_31.decode(p64) --[[ line: 7110 ]]
	-- upvalues: t_31 (ref), protoModule (ref), t (ref)
	local var1134 = t_31.new()
	local var1135 = 0
	while var1135 < buffer.len(p64) do
		local _ = nil
		local var1136 = nil
		local var1137, var1138, var1139 = protoModule.readTag(p64, var1135)
		local var1140 = var1137
		var1136 = var1138
		var1135 = var1139
		
		if var1136 == protoModule.wireTypes.varint then
			local _ = nil
			local var1141, var1142 = protoModule.readVarInt(p64, var1135)
			local _ = var1141
			var1135 = var1142
			continue
		end
		if var1136 == protoModule.wireTypes.lengthDelimited then
			if var1140 == 1 then
				local _ = nil
				local var1143, var1144 = protoModule.readBuffer(p64, var1135)
				var1135 = var1144
				var1134.kind = { type = "literal", value = buffer.tostring(var1143) }
			elseif var1140 == 2 then
				local _ = nil
				local var1145, var1146 = protoModule.readBuffer(p64, var1135)
				var1135 = var1146
				var1134.kind = { type = "binding_path", value = buffer.tostring(var1145) }
			elseif var1140 == 3 then
				local _ = nil
				local var1147, var1148 = protoModule.readBuffer(p64, var1135)
				var1135 = var1148
				var1134.kind = { type = "format", value = t.StringFormat.decode(var1147) }
			elseif var1140 == 4 then
				local _ = nil
				local var1149, var1150 = protoModule.readBuffer(p64, var1135)
				var1135 = var1150
				var1134.kind = {
					type = "conditional",
					value = t.ImageSetProp_ConditionalOptions.decode(var1149)
				}
			elseif var1140 == 5 then
				local _ = nil
				local var1151, var1152 = protoModule.readBuffer(p64, var1135)
				var1135 = var1152
				var1134.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1151)
				}
			else
				local _ = nil
				local var1153, var1154 = protoModule.readVarInt(p64, var1135)
				var1135 = var1154 + var1153
			end
		elseif var1136 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1155, var1156 = protoModule.readFixed32(p64, var1135)
			local _ = var1155
			var1135 = var1156
		elseif var1136 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1157, var1158 = protoModule.readFixed64(p64, var1135)
			local _ = var1157
			var1135 = var1158
		else
			error("Unsupported wire type: " .. var1136)
		end
	end
	return var1134
end

function t_31:jsonEncode() --[[ line: 7173 ]]
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

function t_31:jsonDecode() --[[ line: 7193 ]]
	-- upvalues: t_31 (ref), t (ref)
	local var1160 = t_31.new()
	
	if self.literal ~= nil then
		var1160.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1160.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1160.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1160.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.conditional ~= nil then
		var1160.kind = {
			type = "conditional",
			value = t.ImageSetProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.translation ~= nil then
		var1160.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1160
end

t_31.descriptor = {
	name = "ImageSetProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageSetProp"
}
t.ImageSetProp = t_31
typeRegistryModule.default:register(t.ImageSetProp)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p65) --[[ line: 7238 ]]
	-- upvalues: t_32 (ref)
	return setmetatable({
		condition = if p65 == nil or p65.condition == nil then nil else p65.condition,
		kind = if p65 == nil or p65.kind == nil then nil else p65.kind
	}, t_32)
end

function t_32:encode() --[[ line: 7247 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1162 = 0
	
	if self.condition ~= nil then
		local var1163 = self.condition:encode()
		local var1164, var1165 = protoModule.writeTag(buff, var1162, 1, protoModule.wireTypes.lengthDelimited)
		var1164, var1165 = protoModule.writeBuffer(var1164, var1165, var1163, buffer.len(var1163))
		buff = var1164
		var1162 = var1165
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1166, var1167 = protoModule.writeTag(buff, var1162, 2, protoModule.wireTypes.lengthDelimited)
			var1166, var1167 = protoModule.writeString(var1166, var1167, self.kind.value)
			buff = var1166
			var1162 = var1167
		elseif self.kind.type == "binding_path" then
			local var1168, var1169 = protoModule.writeTag(buff, var1162, 3, protoModule.wireTypes.lengthDelimited)
			var1168, var1169 = protoModule.writeString(var1168, var1169, self.kind.value)
			buff = var1168
			var1162 = var1169
		elseif self.kind.type == "format" then
			local var1170 = self.kind.value:encode()
			local var1171, var1172 = protoModule.writeTag(buff, var1162, 4, protoModule.wireTypes.lengthDelimited)
			var1171, var1172 = protoModule.writeBuffer(var1171, var1172, var1170, buffer.len(var1170))
			buff = var1171
			var1162 = var1172
		elseif self.kind.type == "translation" then
			local var1173 = self.kind.value:encode()
			local var1174, var1175 = protoModule.writeTag(buff, var1162, 5, protoModule.wireTypes.lengthDelimited)
			var1174, var1175 = protoModule.writeBuffer(var1174, var1175, var1173, buffer.len(var1173))
			buff = var1174
			var1162 = var1175
		end
	end
	local buff_1 = buffer.create(var1162)
	buffer.copy(buff_1, 0, buff, 0, var1162)
	
	return buff_1
end

function t_32.decode(p66) --[[ line: 7280 ]]
	-- upvalues: t_32 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var1177 = t_32.new()
	local var1178 = 0
	while var1178 < buffer.len(p66) do
		local _ = nil
		local var1179 = nil
		local var1180, var1181, var1182 = protoModule.readTag(p66, var1178)
		local var1183 = var1180
		var1179 = var1181
		var1178 = var1182
		
		if var1179 == protoModule.wireTypes.varint then
			local _ = nil
			local var1184, var1185 = protoModule.readVarInt(p66, var1178)
			local _ = var1184
			var1178 = var1185
			continue
		end
		if var1179 == protoModule.wireTypes.lengthDelimited then
			if var1183 == 1 then
				local _ = nil
				local var1186, var1187 = protoModule.readBuffer(p66, var1178)
				var1178 = var1187
				var1177.condition = propConditionModule.PropCondition.decode(var1186)
			elseif var1183 == 2 then
				local _ = nil
				local var1188, var1189 = protoModule.readBuffer(p66, var1178)
				var1178 = var1189
				var1177.kind = { type = "literal", value = buffer.tostring(var1188) }
			elseif var1183 == 3 then
				local _ = nil
				local var1190, var1191 = protoModule.readBuffer(p66, var1178)
				var1178 = var1191
				var1177.kind = { type = "binding_path", value = buffer.tostring(var1190) }
			elseif var1183 == 4 then
				local _ = nil
				local var1192, var1193 = protoModule.readBuffer(p66, var1178)
				var1178 = var1193
				var1177.kind = { type = "format", value = t.StringFormat.decode(var1192) }
			elseif var1183 == 5 then
				local _ = nil
				local var1194, var1195 = protoModule.readBuffer(p66, var1178)
				var1178 = var1195
				var1177.kind = {
					type = "translation",
					value = t.TranslationRef.decode(var1194)
				}
			else
				local _ = nil
				local var1196, var1197 = protoModule.readVarInt(p66, var1178)
				var1178 = var1197 + var1196
			end
		elseif var1179 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1198, var1199 = protoModule.readFixed32(p66, var1178)
			local _ = var1198
			var1178 = var1199
		elseif var1179 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1200, var1201 = protoModule.readFixed64(p66, var1178)
			local _ = var1200
			var1178 = var1201
		else
			error("Unsupported wire type: " .. var1179)
		end
	end
	return var1177
end

function t_32:jsonEncode() --[[ line: 7343 ]]
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

function t_32:jsonDecode() --[[ line: 7365 ]]
	-- upvalues: t_32 (ref), propConditionModule (ref), t (ref)
	local var1203 = t_32.new()
	
	if self.condition ~= nil then
		var1203.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1203.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1203.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1203.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.format ~= nil then
		var1203.kind = {
			type = "format",
			value = t.StringFormat.jsonDecode(self.format)
		}
	end
	if self.translation ~= nil then
		var1203.kind = {
			type = "translation",
			value = t.TranslationRef.jsonDecode(self.translation)
		}
	end
	return var1203
end

t_32.descriptor = {
	name = "ImageSetProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ImageSetProp_ConditionalOption = t_32
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOption)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p67) --[[ line: 7410 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		options = if p67 == nil or p67.options == nil then {} else p67.options
	}, t_33)
end

function t_33:encode() --[[ line: 7418 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1205 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1206 = v:encode()
			local var1207, var1208 = protoModule.writeTag(buff, var1205, 1, protoModule.wireTypes.lengthDelimited)
			var1207, var1208 = protoModule.writeBuffer(var1207, var1208, var1206, buffer.len(var1206))
			buff = var1207
			var1205 = var1208
		end
	end
	local buff_1 = buffer.create(var1205)
	buffer.copy(buff_1, 0, buff, 0, var1205)
	
	return buff_1
end

function t_33.decode(p68) --[[ line: 7435 ]]
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1210 = t_33.new()
	local var1211 = 0
	while var1211 < buffer.len(p68) do
		local _ = nil
		local var1212 = nil
		local var1213, var1214, var1215 = protoModule.readTag(p68, var1211)
		local var1216 = var1213
		var1212 = var1214
		var1211 = var1215
		
		if var1212 == protoModule.wireTypes.varint then
			local _ = nil
			local var1217, var1218 = protoModule.readVarInt(p68, var1211)
			local _ = var1217
			var1211 = var1218
			continue
		end
		if var1212 == protoModule.wireTypes.lengthDelimited then
			if var1216 == 1 then
				local _ = nil
				local var1219, var1220 = protoModule.readBuffer(p68, var1211)
				var1211 = var1220
				table.insert(var1210.options, t.ImageSetProp_ConditionalOption.decode(var1219))
			else
				local _ = nil
				local var1221, var1222 = protoModule.readVarInt(p68, var1211)
				var1211 = var1222 + var1221
			end
		elseif var1212 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1223, var1224 = protoModule.readFixed32(p68, var1211)
			local _ = var1223
			var1211 = var1224
		elseif var1212 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1225, var1226 = protoModule.readFixed64(p68, var1211)
			local _ = var1225
			var1211 = var1226
		else
			error("Unsupported wire type: " .. var1212)
		end
	end
	return var1210
end

function t_33:jsonEncode() --[[ line: 7478 ]]
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

function t_33:jsonDecode() --[[ line: 7492 ]]
	-- upvalues: t_33 (ref), t (ref)
	local var1229 = t_33.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ImageSetProp_ConditionalOption.jsonDecode(v))
		end
		var1229.options = t_1
	end
	return var1229
end

t_33.descriptor = {
	name = "ImageSetProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ImageSetProp_ConditionalOptions = t_33
typeRegistryModule.default:register(t.ImageSetProp_ConditionalOptions)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p69) --[[ line: 7521 ]]
	-- upvalues: t_34 (ref)
	return setmetatable({
		kind = if p69 == nil or p69.kind == nil then nil else p69.kind
	}, t_34)
end

function t_34:encode() --[[ line: 7527 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1232 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1233, var1234 = protoModule.writeTag(buff, var1232, 1, protoModule.wireTypes.lengthDelimited)
			var1233, var1234 = protoModule.writeString(var1233, var1234, self.kind.value)
			buff = var1233
			var1232 = var1234
		elseif self.kind.type == "token" then
			local var1235, var1236 = protoModule.writeTag(buff, var1232, 2, protoModule.wireTypes.lengthDelimited)
			var1235, var1236 = protoModule.writeString(var1235, var1236, self.kind.value)
			buff = var1235
			var1232 = var1236
		elseif self.kind.type == "conditional" then
			local var1237 = self.kind.value:encode()
			local var1238, var1239 = protoModule.writeTag(buff, var1232, 3, protoModule.wireTypes.lengthDelimited)
			var1238, var1239 = protoModule.writeBuffer(var1238, var1239, var1237, buffer.len(var1237))
			buff = var1238
			var1232 = var1239
		elseif self.kind.type == "binding_path" then
			local var1240, var1241 = protoModule.writeTag(buff, var1232, 4, protoModule.wireTypes.lengthDelimited)
			var1240, var1241 = protoModule.writeString(var1240, var1241, self.kind.value)
			buff = var1240
			var1232 = var1241
		end
	end
	local buff_1 = buffer.create(var1232)
	buffer.copy(buff_1, 0, buff, 0, var1232)
	
	return buff_1
end

function t_34.decode(p70) --[[ line: 7553 ]]
	-- upvalues: t_34 (ref), protoModule (ref), t (ref)
	local var1243 = t_34.new()
	local var1244 = 0
	while var1244 < buffer.len(p70) do
		local _ = nil
		local var1245 = nil
		local var1246, var1247, var1248 = protoModule.readTag(p70, var1244)
		local var1249 = var1246
		var1245 = var1247
		var1244 = var1248
		
		if var1245 == protoModule.wireTypes.varint then
			local _ = nil
			local var1250, var1251 = protoModule.readVarInt(p70, var1244)
			local _ = var1250
			var1244 = var1251
			continue
		end
		if var1245 == protoModule.wireTypes.lengthDelimited then
			if var1249 == 1 then
				local _ = nil
				local var1252, var1253 = protoModule.readBuffer(p70, var1244)
				var1244 = var1253
				var1243.kind = { type = "literal", value = buffer.tostring(var1252) }
			elseif var1249 == 2 then
				local _ = nil
				local var1254, var1255 = protoModule.readBuffer(p70, var1244)
				var1244 = var1255
				var1243.kind = { type = "token", value = buffer.tostring(var1254) }
			elseif var1249 == 3 then
				local _ = nil
				local var1256, var1257 = protoModule.readBuffer(p70, var1244)
				var1244 = var1257
				var1243.kind = {
					type = "conditional",
					value = t.ColorProp_ConditionalOptions.decode(var1256)
				}
			elseif var1249 == 4 then
				local _ = nil
				local var1258, var1259 = protoModule.readBuffer(p70, var1244)
				var1244 = var1259
				var1243.kind = { type = "binding_path", value = buffer.tostring(var1258) }
			else
				local _ = nil
				local var1260, var1261 = protoModule.readVarInt(p70, var1244)
				var1244 = var1261 + var1260
			end
		elseif var1245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1262, var1263 = protoModule.readFixed32(p70, var1244)
			local _ = var1262
			var1244 = var1263
		elseif var1245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1264, var1265 = protoModule.readFixed64(p70, var1244)
			local _ = var1264
			var1244 = var1265
		else
			error("Unsupported wire type: " .. var1245)
		end
	end
	return var1243
end

function t_34:jsonEncode() --[[ line: 7611 ]]
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

function t_34:jsonDecode() --[[ line: 7629 ]]
	-- upvalues: t_34 (ref), t (ref)
	local var1267 = t_34.new()
	
	if self.literal ~= nil then
		var1267.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1267.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1267.kind = {
			type = "conditional",
			value = t.ColorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1267.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1267.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1267
end

t_34.descriptor = {
	name = "ColorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorProp"
}
t.ColorProp = t_34
typeRegistryModule.default:register(t.ColorProp)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p71) --[[ line: 7670 ]]
	-- upvalues: t_35 (ref)
	return setmetatable({
		condition = if p71 == nil or p71.condition == nil then nil else p71.condition,
		kind = if p71 == nil or p71.kind == nil then nil else p71.kind
	}, t_35)
end

function t_35:encode() --[[ line: 7679 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1269 = 0
	
	if self.condition ~= nil then
		local var1270 = self.condition:encode()
		local var1271, var1272 = protoModule.writeTag(buff, var1269, 1, protoModule.wireTypes.lengthDelimited)
		var1271, var1272 = protoModule.writeBuffer(var1271, var1272, var1270, buffer.len(var1270))
		buff = var1271
		var1269 = var1272
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1273, var1274 = protoModule.writeTag(buff, var1269, 2, protoModule.wireTypes.lengthDelimited)
			var1273, var1274 = protoModule.writeString(var1273, var1274, self.kind.value)
			buff = var1273
			var1269 = var1274
		elseif self.kind.type == "token" then
			local var1275, var1276 = protoModule.writeTag(buff, var1269, 3, protoModule.wireTypes.lengthDelimited)
			var1275, var1276 = protoModule.writeString(var1275, var1276, self.kind.value)
			buff = var1275
			var1269 = var1276
		elseif self.kind.type == "binding_path" then
			local var1277, var1278 = protoModule.writeTag(buff, var1269, 4, protoModule.wireTypes.lengthDelimited)
			var1277, var1278 = protoModule.writeString(var1277, var1278, self.kind.value)
			buff = var1277
			var1269 = var1278
		end
	end
	local buff_1 = buffer.create(var1269)
	buffer.copy(buff_1, 0, buff, 0, var1269)
	
	return buff_1
end

function t_35.decode(p72) --[[ line: 7707 ]]
	-- upvalues: t_35 (ref), protoModule (ref), propConditionModule (ref)
	local var1280 = t_35.new()
	local var1281 = 0
	while var1281 < buffer.len(p72) do
		local _ = nil
		local var1282 = nil
		local var1283, var1284, var1285 = protoModule.readTag(p72, var1281)
		local var1286 = var1283
		var1282 = var1284
		var1281 = var1285
		
		if var1282 == protoModule.wireTypes.varint then
			local _ = nil
			local var1287, var1288 = protoModule.readVarInt(p72, var1281)
			local _ = var1287
			var1281 = var1288
			continue
		end
		if var1282 == protoModule.wireTypes.lengthDelimited then
			if var1286 == 1 then
				local _ = nil
				local var1289, var1290 = protoModule.readBuffer(p72, var1281)
				var1281 = var1290
				var1280.condition = propConditionModule.PropCondition.decode(var1289)
			elseif var1286 == 2 then
				local _ = nil
				local var1291, var1292 = protoModule.readBuffer(p72, var1281)
				var1281 = var1292
				var1280.kind = { type = "literal", value = buffer.tostring(var1291) }
			elseif var1286 == 3 then
				local _ = nil
				local var1293, var1294 = protoModule.readBuffer(p72, var1281)
				var1281 = var1294
				var1280.kind = { type = "token", value = buffer.tostring(var1293) }
			elseif var1286 == 4 then
				local _ = nil
				local var1295, var1296 = protoModule.readBuffer(p72, var1281)
				var1281 = var1296
				var1280.kind = { type = "binding_path", value = buffer.tostring(var1295) }
			else
				local _ = nil
				local var1297, var1298 = protoModule.readVarInt(p72, var1281)
				var1281 = var1298 + var1297
			end
		elseif var1282 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1299, var1300 = protoModule.readFixed32(p72, var1281)
			local _ = var1299
			var1281 = var1300
		elseif var1282 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1301, var1302 = protoModule.readFixed64(p72, var1281)
			local _ = var1301
			var1281 = var1302
		else
			error("Unsupported wire type: " .. var1282)
		end
	end
	return var1280
end

function t_35:jsonEncode() --[[ line: 7765 ]]
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

function t_35:jsonDecode() --[[ line: 7785 ]]
	-- upvalues: t_35 (ref), propConditionModule (ref)
	local var1304 = t_35.new()
	
	if self.condition ~= nil then
		var1304.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1304.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1304.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1304.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1304.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1304
end

t_35.descriptor = {
	name = "ColorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorProp_ConditionalOption = t_35
typeRegistryModule.default:register(t.ColorProp_ConditionalOption)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p73) --[[ line: 7826 ]]
	-- upvalues: t_36 (ref)
	return setmetatable({
		options = if p73 == nil or p73.options == nil then {} else p73.options
	}, t_36)
end

function t_36:encode() --[[ line: 7834 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1306 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1307 = v:encode()
			local var1308, var1309 = protoModule.writeTag(buff, var1306, 1, protoModule.wireTypes.lengthDelimited)
			var1308, var1309 = protoModule.writeBuffer(var1308, var1309, var1307, buffer.len(var1307))
			buff = var1308
			var1306 = var1309
		end
	end
	local buff_1 = buffer.create(var1306)
	buffer.copy(buff_1, 0, buff, 0, var1306)
	
	return buff_1
end

function t_36.decode(p74) --[[ line: 7851 ]]
	-- upvalues: t_36 (ref), protoModule (ref), t (ref)
	local var1311 = t_36.new()
	local var1312 = 0
	while var1312 < buffer.len(p74) do
		local _ = nil
		local var1313 = nil
		local var1314, var1315, var1316 = protoModule.readTag(p74, var1312)
		local var1317 = var1314
		var1313 = var1315
		var1312 = var1316
		
		if var1313 == protoModule.wireTypes.varint then
			local _ = nil
			local var1318, var1319 = protoModule.readVarInt(p74, var1312)
			local _ = var1318
			var1312 = var1319
			continue
		end
		if var1313 == protoModule.wireTypes.lengthDelimited then
			if var1317 == 1 then
				local _ = nil
				local var1320, var1321 = protoModule.readBuffer(p74, var1312)
				var1312 = var1321
				table.insert(var1311.options, t.ColorProp_ConditionalOption.decode(var1320))
			else
				local _ = nil
				local var1322, var1323 = protoModule.readVarInt(p74, var1312)
				var1312 = var1323 + var1322
			end
		elseif var1313 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1324, var1325 = protoModule.readFixed32(p74, var1312)
			local _ = var1324
			var1312 = var1325
		elseif var1313 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1326, var1327 = protoModule.readFixed64(p74, var1312)
			local _ = var1326
			var1312 = var1327
		else
			error("Unsupported wire type: " .. var1313)
		end
	end
	return var1311
end

function t_36:jsonEncode() --[[ line: 7894 ]]
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

function t_36:jsonDecode() --[[ line: 7908 ]]
	-- upvalues: t_36 (ref), t (ref)
	local var1330 = t_36.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorProp_ConditionalOption.jsonDecode(v))
		end
		var1330.options = t_1
	end
	return var1330
end

t_36.descriptor = {
	name = "ColorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorProp_ConditionalOptions = t_36
typeRegistryModule.default:register(t.ColorProp_ConditionalOptions)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p75) --[[ line: 7937 ]]
	-- upvalues: t_37 (ref)
	return setmetatable({
		kind = if p75 == nil or p75.kind == nil then nil else p75.kind
	}, t_37)
end

function t_37:encode() --[[ line: 7943 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1333 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1334, var1335 = protoModule.writeTag(buff, var1333, 1, protoModule.wireTypes.lengthDelimited)
			var1334, var1335 = protoModule.writeString(var1334, var1335, self.kind.value)
			buff = var1334
			var1333 = var1335
		elseif self.kind.type == "conditional" then
			local var1336 = self.kind.value:encode()
			local var1337, var1338 = protoModule.writeTag(buff, var1333, 2, protoModule.wireTypes.lengthDelimited)
			var1337, var1338 = protoModule.writeBuffer(var1337, var1338, var1336, buffer.len(var1336))
			buff = var1337
			var1333 = var1338
		end
	end
	local buff_1 = buffer.create(var1333)
	buffer.copy(buff_1, 0, buff, 0, var1333)
	
	return buff_1
end

function t_37.decode(p76) --[[ line: 7963 ]]
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1340 = t_37.new()
	local var1341 = 0
	while var1341 < buffer.len(p76) do
		local _ = nil
		local var1342 = nil
		local var1343, var1344, var1345 = protoModule.readTag(p76, var1341)
		local var1346 = var1343
		var1342 = var1344
		var1341 = var1345
		
		if var1342 == protoModule.wireTypes.varint then
			local _ = nil
			local var1347, var1348 = protoModule.readVarInt(p76, var1341)
			local _ = var1347
			var1341 = var1348
			continue
		end
		if var1342 == protoModule.wireTypes.lengthDelimited then
			if var1346 == 1 then
				local _ = nil
				local var1349, var1350 = protoModule.readBuffer(p76, var1341)
				var1341 = var1350
				var1340.kind = { type = "token", value = buffer.tostring(var1349) }
			elseif var1346 == 2 then
				local _ = nil
				local var1351, var1352 = protoModule.readBuffer(p76, var1341)
				var1341 = var1352
				var1340.kind = {
					type = "conditional",
					value = t.TypographyProp_ConditionalOptions.decode(var1351)
				}
			else
				local _ = nil
				local var1353, var1354 = protoModule.readVarInt(p76, var1341)
				var1341 = var1354 + var1353
			end
		elseif var1342 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1355, var1356 = protoModule.readFixed32(p76, var1341)
			local _ = var1355
			var1341 = var1356
		elseif var1342 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1357, var1358 = protoModule.readFixed64(p76, var1341)
			local _ = var1357
			var1341 = var1358
		else
			error("Unsupported wire type: " .. var1342)
		end
	end
	return var1340
end

function t_37:jsonEncode() --[[ line: 8012 ]]
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

function t_37:jsonDecode() --[[ line: 8026 ]]
	-- upvalues: t_37 (ref), t (ref)
	local var1360 = t_37.new()
	
	if self.token ~= nil then
		var1360.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1360.kind = {
			type = "conditional",
			value = t.TypographyProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1360
end

t_37.descriptor = {
	name = "TypographyProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyProp"
}
t.TypographyProp = t_37
typeRegistryModule.default:register(t.TypographyProp)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p77) --[[ line: 8057 ]]
	-- upvalues: t_38 (ref)
	return setmetatable({
		condition = if p77 == nil or p77.condition == nil then nil else p77.condition,
		kind = if p77 == nil or p77.kind == nil then nil else p77.kind
	}, t_38)
end

function t_38:encode() --[[ line: 8066 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1362 = 0
	
	if self.condition ~= nil then
		local var1363 = self.condition:encode()
		local var1364, var1365 = protoModule.writeTag(buff, var1362, 1, protoModule.wireTypes.lengthDelimited)
		var1364, var1365 = protoModule.writeBuffer(var1364, var1365, var1363, buffer.len(var1363))
		buff = var1364
		var1362 = var1365
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1366, var1367 = protoModule.writeTag(buff, var1362, 2, protoModule.wireTypes.lengthDelimited)
		var1366, var1367 = protoModule.writeString(var1366, var1367, self.kind.value)
		buff = var1366
		var1362 = var1367
	end
	local buff_1 = buffer.create(var1362)
	buffer.copy(buff_1, 0, buff, 0, var1362)
	
	return buff_1
end

function t_38.decode(p78) --[[ line: 8088 ]]
	-- upvalues: t_38 (ref), protoModule (ref), propConditionModule (ref)
	local var1369 = t_38.new()
	local var1370 = 0
	while var1370 < buffer.len(p78) do
		local _ = nil
		local var1371 = nil
		local var1372, var1373, var1374 = protoModule.readTag(p78, var1370)
		local var1375 = var1372
		var1371 = var1373
		var1370 = var1374
		
		if var1371 == protoModule.wireTypes.varint then
			local _ = nil
			local var1376, var1377 = protoModule.readVarInt(p78, var1370)
			local _ = var1376
			var1370 = var1377
			continue
		end
		if var1371 == protoModule.wireTypes.lengthDelimited then
			if var1375 == 1 then
				local _ = nil
				local var1378, var1379 = protoModule.readBuffer(p78, var1370)
				var1370 = var1379
				var1369.condition = propConditionModule.PropCondition.decode(var1378)
			elseif var1375 == 2 then
				local _ = nil
				local var1380, var1381 = protoModule.readBuffer(p78, var1370)
				var1370 = var1381
				var1369.kind = { type = "token", value = buffer.tostring(var1380) }
			else
				local _ = nil
				local var1382, var1383 = protoModule.readVarInt(p78, var1370)
				var1370 = var1383 + var1382
			end
		elseif var1371 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1384, var1385 = protoModule.readFixed32(p78, var1370)
			local _ = var1384
			var1370 = var1385
		elseif var1371 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1386, var1387 = protoModule.readFixed64(p78, var1370)
			local _ = var1386
			var1370 = var1387
		else
			error("Unsupported wire type: " .. var1371)
		end
	end
	return var1369
end

function t_38:jsonEncode() --[[ line: 8136 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_38:jsonDecode() --[[ line: 8152 ]]
	-- upvalues: t_38 (ref), propConditionModule (ref)
	local var1389 = t_38.new()
	
	if self.condition ~= nil then
		var1389.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1389.kind = { type = "token", value = self.token }
	end
	return var1389
end

t_38.descriptor = {
	name = "TypographyProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyProp_ConditionalOption = t_38
typeRegistryModule.default:register(t.TypographyProp_ConditionalOption)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p79) --[[ line: 8183 ]]
	-- upvalues: t_39 (ref)
	return setmetatable({
		options = if p79 == nil or p79.options == nil then {} else p79.options
	}, t_39)
end

function t_39:encode() --[[ line: 8191 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1391 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1392 = v:encode()
			local var1393, var1394 = protoModule.writeTag(buff, var1391, 1, protoModule.wireTypes.lengthDelimited)
			var1393, var1394 = protoModule.writeBuffer(var1393, var1394, var1392, buffer.len(var1392))
			buff = var1393
			var1391 = var1394
		end
	end
	local buff_1 = buffer.create(var1391)
	buffer.copy(buff_1, 0, buff, 0, var1391)
	
	return buff_1
end

function t_39.decode(p80) --[[ line: 8208 ]]
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1396 = t_39.new()
	local var1397 = 0
	while var1397 < buffer.len(p80) do
		local _ = nil
		local var1398 = nil
		local var1399, var1400, var1401 = protoModule.readTag(p80, var1397)
		local var1402 = var1399
		var1398 = var1400
		var1397 = var1401
		
		if var1398 == protoModule.wireTypes.varint then
			local _ = nil
			local var1403, var1404 = protoModule.readVarInt(p80, var1397)
			local _ = var1403
			var1397 = var1404
			continue
		end
		if var1398 == protoModule.wireTypes.lengthDelimited then
			if var1402 == 1 then
				local _ = nil
				local var1405, var1406 = protoModule.readBuffer(p80, var1397)
				var1397 = var1406
				table.insert(var1396.options, t.TypographyProp_ConditionalOption.decode(var1405))
			else
				local _ = nil
				local var1407, var1408 = protoModule.readVarInt(p80, var1397)
				var1397 = var1408 + var1407
			end
		elseif var1398 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1409, var1410 = protoModule.readFixed32(p80, var1397)
			local _ = var1409
			var1397 = var1410
		elseif var1398 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1411, var1412 = protoModule.readFixed64(p80, var1397)
			local _ = var1411
			var1397 = var1412
		else
			error("Unsupported wire type: " .. var1398)
		end
	end
	return var1396
end

function t_39:jsonEncode() --[[ line: 8251 ]]
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

function t_39:jsonDecode() --[[ line: 8265 ]]
	-- upvalues: t_39 (ref), t (ref)
	local var1415 = t_39.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyProp_ConditionalOption.jsonDecode(v))
		end
		var1415.options = t_1
	end
	return var1415
end

t_39.descriptor = {
	name = "TypographyProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyProp_ConditionalOptions = t_39
typeRegistryModule.default:register(t.TypographyProp_ConditionalOptions)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p81) --[[ line: 8296 ]]
	-- upvalues: t_40 (ref)
	return setmetatable({
		kind = if p81 == nil or p81.kind == nil then nil else p81.kind
	}, t_40)
end

function t_40:encode() --[[ line: 8302 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1418 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1419, var1420 = protoModule.writeTag(buff, var1418, 1, protoModule.wireTypes.lengthDelimited)
			var1419, var1420 = protoModule.writeString(var1419, var1420, self.kind.value)
			buff = var1419
			var1418 = var1420
		elseif self.kind.type == "conditional" then
			local var1421 = self.kind.value:encode()
			local var1422, var1423 = protoModule.writeTag(buff, var1418, 2, protoModule.wireTypes.lengthDelimited)
			var1422, var1423 = protoModule.writeBuffer(var1422, var1423, var1421, buffer.len(var1421))
			buff = var1422
			var1418 = var1423
		end
	end
	local buff_1 = buffer.create(var1418)
	buffer.copy(buff_1, 0, buff, 0, var1418)
	
	return buff_1
end

function t_40.decode(p82) --[[ line: 8322 ]]
	-- upvalues: t_40 (ref), protoModule (ref), t (ref)
	local var1425 = t_40.new()
	local var1426 = 0
	while var1426 < buffer.len(p82) do
		local _ = nil
		local var1427 = nil
		local var1428, var1429, var1430 = protoModule.readTag(p82, var1426)
		local var1431 = var1428
		var1427 = var1429
		var1426 = var1430
		
		if var1427 == protoModule.wireTypes.varint then
			local _ = nil
			local var1432, var1433 = protoModule.readVarInt(p82, var1426)
			local _ = var1432
			var1426 = var1433
			continue
		end
		if var1427 == protoModule.wireTypes.lengthDelimited then
			if var1431 == 1 then
				local _ = nil
				local var1434, var1435 = protoModule.readBuffer(p82, var1426)
				var1426 = var1435
				var1425.kind = { type = "token", value = buffer.tostring(var1434) }
			elseif var1431 == 2 then
				local _ = nil
				local var1436, var1437 = protoModule.readBuffer(p82, var1426)
				var1426 = var1437
				var1425.kind = {
					type = "conditional",
					value = t.TypographyFontProp_ConditionalOptions.decode(var1436)
				}
			else
				local _ = nil
				local var1438, var1439 = protoModule.readVarInt(p82, var1426)
				var1426 = var1439 + var1438
			end
		elseif var1427 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1440, var1441 = protoModule.readFixed32(p82, var1426)
			local _ = var1440
			var1426 = var1441
		elseif var1427 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1442, var1443 = protoModule.readFixed64(p82, var1426)
			local _ = var1442
			var1426 = var1443
		else
			error("Unsupported wire type: " .. var1427)
		end
	end
	return var1425
end

function t_40:jsonEncode() --[[ line: 8371 ]]
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

function t_40:jsonDecode() --[[ line: 8385 ]]
	-- upvalues: t_40 (ref), t (ref)
	local var1445 = t_40.new()
	
	if self.token ~= nil then
		var1445.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1445.kind = {
			type = "conditional",
			value = t.TypographyFontProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1445
end

t_40.descriptor = {
	name = "TypographyFontProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.TypographyFontProp"
}
t.TypographyFontProp = t_40
typeRegistryModule.default:register(t.TypographyFontProp)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p83) --[[ line: 8416 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		condition = if p83 == nil or p83.condition == nil then nil else p83.condition,
		kind = if p83 == nil or p83.kind == nil then nil else p83.kind
	}, t_41)
end

function t_41:encode() --[[ line: 8425 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1447 = 0
	
	if self.condition ~= nil then
		local var1448 = self.condition:encode()
		local var1449, var1450 = protoModule.writeTag(buff, var1447, 1, protoModule.wireTypes.lengthDelimited)
		var1449, var1450 = protoModule.writeBuffer(var1449, var1450, var1448, buffer.len(var1448))
		buff = var1449
		var1447 = var1450
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1451, var1452 = protoModule.writeTag(buff, var1447, 2, protoModule.wireTypes.lengthDelimited)
		var1451, var1452 = protoModule.writeString(var1451, var1452, self.kind.value)
		buff = var1451
		var1447 = var1452
	end
	local buff_1 = buffer.create(var1447)
	buffer.copy(buff_1, 0, buff, 0, var1447)
	
	return buff_1
end

function t_41.decode(p84) --[[ line: 8447 ]]
	-- upvalues: t_41 (ref), protoModule (ref), propConditionModule (ref)
	local var1454 = t_41.new()
	local var1455 = 0
	while var1455 < buffer.len(p84) do
		local _ = nil
		local var1456 = nil
		local var1457, var1458, var1459 = protoModule.readTag(p84, var1455)
		local var1460 = var1457
		var1456 = var1458
		var1455 = var1459
		
		if var1456 == protoModule.wireTypes.varint then
			local _ = nil
			local var1461, var1462 = protoModule.readVarInt(p84, var1455)
			local _ = var1461
			var1455 = var1462
			continue
		end
		if var1456 == protoModule.wireTypes.lengthDelimited then
			if var1460 == 1 then
				local _ = nil
				local var1463, var1464 = protoModule.readBuffer(p84, var1455)
				var1455 = var1464
				var1454.condition = propConditionModule.PropCondition.decode(var1463)
			elseif var1460 == 2 then
				local _ = nil
				local var1465, var1466 = protoModule.readBuffer(p84, var1455)
				var1455 = var1466
				var1454.kind = { type = "token", value = buffer.tostring(var1465) }
			else
				local _ = nil
				local var1467, var1468 = protoModule.readVarInt(p84, var1455)
				var1455 = var1468 + var1467
			end
		elseif var1456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1469, var1470 = protoModule.readFixed32(p84, var1455)
			local _ = var1469
			var1455 = var1470
		elseif var1456 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1471, var1472 = protoModule.readFixed64(p84, var1455)
			local _ = var1471
			var1455 = var1472
		else
			error("Unsupported wire type: " .. var1456)
		end
	end
	return var1454
end

function t_41:jsonEncode() --[[ line: 8495 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_41:jsonDecode() --[[ line: 8511 ]]
	-- upvalues: t_41 (ref), propConditionModule (ref)
	local var1474 = t_41.new()
	
	if self.condition ~= nil then
		var1474.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1474.kind = { type = "token", value = self.token }
	end
	return var1474
end

t_41.descriptor = {
	name = "TypographyFontProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.TypographyFontProp_ConditionalOption = t_41
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOption)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p85) --[[ line: 8542 ]]
	-- upvalues: t_42 (ref)
	return setmetatable({
		options = if p85 == nil or p85.options == nil then {} else p85.options
	}, t_42)
end

function t_42:encode() --[[ line: 8550 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1476 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1477 = v:encode()
			local var1478, var1479 = protoModule.writeTag(buff, var1476, 1, protoModule.wireTypes.lengthDelimited)
			var1478, var1479 = protoModule.writeBuffer(var1478, var1479, var1477, buffer.len(var1477))
			buff = var1478
			var1476 = var1479
		end
	end
	local buff_1 = buffer.create(var1476)
	buffer.copy(buff_1, 0, buff, 0, var1476)
	
	return buff_1
end

function t_42.decode(p86) --[[ line: 8567 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1481 = t_42.new()
	local var1482 = 0
	while var1482 < buffer.len(p86) do
		local _ = nil
		local var1483 = nil
		local var1484, var1485, var1486 = protoModule.readTag(p86, var1482)
		local var1487 = var1484
		var1483 = var1485
		var1482 = var1486
		
		if var1483 == protoModule.wireTypes.varint then
			local _ = nil
			local var1488, var1489 = protoModule.readVarInt(p86, var1482)
			local _ = var1488
			var1482 = var1489
			continue
		end
		if var1483 == protoModule.wireTypes.lengthDelimited then
			if var1487 == 1 then
				local _ = nil
				local var1490, var1491 = protoModule.readBuffer(p86, var1482)
				var1482 = var1491
				table.insert(var1481.options, t.TypographyFontProp_ConditionalOption.decode(var1490))
			else
				local _ = nil
				local var1492, var1493 = protoModule.readVarInt(p86, var1482)
				var1482 = var1493 + var1492
			end
		elseif var1483 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1494, var1495 = protoModule.readFixed32(p86, var1482)
			local _ = var1494
			var1482 = var1495
		elseif var1483 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1496, var1497 = protoModule.readFixed64(p86, var1482)
			local _ = var1496
			var1482 = var1497
		else
			error("Unsupported wire type: " .. var1483)
		end
	end
	return var1481
end

function t_42:jsonEncode() --[[ line: 8610 ]]
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

function t_42:jsonDecode() --[[ line: 8624 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1500 = t_42.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.TypographyFontProp_ConditionalOption.jsonDecode(v))
		end
		var1500.options = t_1
	end
	return var1500
end

t_42.descriptor = {
	name = "TypographyFontProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.TypographyFontProp_ConditionalOptions = t_42
typeRegistryModule.default:register(t.TypographyFontProp_ConditionalOptions)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p87) --[[ line: 8655 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		kind = if p87 == nil or p87.kind == nil then nil else p87.kind
	}, t_43)
end

function t_43:encode() --[[ line: 8661 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1503 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "token" then
			local var1504, var1505 = protoModule.writeTag(buff, var1503, 1, protoModule.wireTypes.lengthDelimited)
			var1504, var1505 = protoModule.writeString(var1504, var1505, self.kind.value)
			buff = var1504
			var1503 = var1505
		elseif self.kind.type == "conditional" then
			local var1506 = self.kind.value:encode()
			local var1507, var1508 = protoModule.writeTag(buff, var1503, 2, protoModule.wireTypes.lengthDelimited)
			var1507, var1508 = protoModule.writeBuffer(var1507, var1508, var1506, buffer.len(var1506))
			buff = var1507
			var1503 = var1508
		end
	end
	local buff_1 = buffer.create(var1503)
	buffer.copy(buff_1, 0, buff, 0, var1503)
	
	return buff_1
end

function t_43.decode(p88) --[[ line: 8681 ]]
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1510 = t_43.new()
	local var1511 = 0
	while var1511 < buffer.len(p88) do
		local _ = nil
		local var1512 = nil
		local var1513, var1514, var1515 = protoModule.readTag(p88, var1511)
		local var1516 = var1513
		var1512 = var1514
		var1511 = var1515
		
		if var1512 == protoModule.wireTypes.varint then
			local _ = nil
			local var1517, var1518 = protoModule.readVarInt(p88, var1511)
			local _ = var1517
			var1511 = var1518
			continue
		end
		if var1512 == protoModule.wireTypes.lengthDelimited then
			if var1516 == 1 then
				local _ = nil
				local var1519, var1520 = protoModule.readBuffer(p88, var1511)
				var1511 = var1520
				var1510.kind = { type = "token", value = buffer.tostring(var1519) }
			elseif var1516 == 2 then
				local _ = nil
				local var1521, var1522 = protoModule.readBuffer(p88, var1511)
				var1511 = var1522
				var1510.kind = {
					type = "conditional",
					value = t.ColorStyleProp_ConditionalOptions.decode(var1521)
				}
			else
				local _ = nil
				local var1523, var1524 = protoModule.readVarInt(p88, var1511)
				var1511 = var1524 + var1523
			end
		elseif var1512 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1525, var1526 = protoModule.readFixed32(p88, var1511)
			local _ = var1525
			var1511 = var1526
		elseif var1512 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1527, var1528 = protoModule.readFixed64(p88, var1511)
			local _ = var1527
			var1511 = var1528
		else
			error("Unsupported wire type: " .. var1512)
		end
	end
	return var1510
end

function t_43:jsonEncode() --[[ line: 8730 ]]
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

function t_43:jsonDecode() --[[ line: 8744 ]]
	-- upvalues: t_43 (ref), t (ref)
	local var1530 = t_43.new()
	
	if self.token ~= nil then
		var1530.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1530.kind = {
			type = "conditional",
			value = t.ColorStyleProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var1530
end

t_43.descriptor = {
	name = "ColorStyleProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ColorStyleProp"
}
t.ColorStyleProp = t_43
typeRegistryModule.default:register(t.ColorStyleProp)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p89) --[[ line: 8775 ]]
	-- upvalues: t_44 (ref)
	return setmetatable({
		condition = if p89 == nil or p89.condition == nil then nil else p89.condition,
		kind = if p89 == nil or p89.kind == nil then nil else p89.kind
	}, t_44)
end

function t_44:encode() --[[ line: 8784 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1532 = 0
	
	if self.condition ~= nil then
		local var1533 = self.condition:encode()
		local var1534, var1535 = protoModule.writeTag(buff, var1532, 1, protoModule.wireTypes.lengthDelimited)
		var1534, var1535 = protoModule.writeBuffer(var1534, var1535, var1533, buffer.len(var1533))
		buff = var1534
		var1532 = var1535
	end
	if self.kind ~= nil and self.kind.type == "token" then
		local var1536, var1537 = protoModule.writeTag(buff, var1532, 2, protoModule.wireTypes.lengthDelimited)
		var1536, var1537 = protoModule.writeString(var1536, var1537, self.kind.value)
		buff = var1536
		var1532 = var1537
	end
	local buff_1 = buffer.create(var1532)
	buffer.copy(buff_1, 0, buff, 0, var1532)
	
	return buff_1
end

function t_44.decode(p90) --[[ line: 8806 ]]
	-- upvalues: t_44 (ref), protoModule (ref), propConditionModule (ref)
	local var1539 = t_44.new()
	local var1540 = 0
	while var1540 < buffer.len(p90) do
		local _ = nil
		local var1541 = nil
		local var1542, var1543, var1544 = protoModule.readTag(p90, var1540)
		local var1545 = var1542
		var1541 = var1543
		var1540 = var1544
		
		if var1541 == protoModule.wireTypes.varint then
			local _ = nil
			local var1546, var1547 = protoModule.readVarInt(p90, var1540)
			local _ = var1546
			var1540 = var1547
			continue
		end
		if var1541 == protoModule.wireTypes.lengthDelimited then
			if var1545 == 1 then
				local _ = nil
				local var1548, var1549 = protoModule.readBuffer(p90, var1540)
				var1540 = var1549
				var1539.condition = propConditionModule.PropCondition.decode(var1548)
			elseif var1545 == 2 then
				local _ = nil
				local var1550, var1551 = protoModule.readBuffer(p90, var1540)
				var1540 = var1551
				var1539.kind = { type = "token", value = buffer.tostring(var1550) }
			else
				local _ = nil
				local var1552, var1553 = protoModule.readVarInt(p90, var1540)
				var1540 = var1553 + var1552
			end
		elseif var1541 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1554, var1555 = protoModule.readFixed32(p90, var1540)
			local _ = var1554
			var1540 = var1555
		elseif var1541 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1556, var1557 = protoModule.readFixed64(p90, var1540)
			local _ = var1556
			var1540 = var1557
		else
			error("Unsupported wire type: " .. var1541)
		end
	end
	return var1539
end

function t_44:jsonEncode() --[[ line: 8854 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "token" then
		t.token = self.kind.value
	end
	return t
end

function t_44:jsonDecode() --[[ line: 8870 ]]
	-- upvalues: t_44 (ref), propConditionModule (ref)
	local var1559 = t_44.new()
	
	if self.condition ~= nil then
		var1559.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.token ~= nil then
		var1559.kind = { type = "token", value = self.token }
	end
	return var1559
end

t_44.descriptor = {
	name = "ColorStyleProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ColorStyleProp_ConditionalOption = t_44
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOption)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p91) --[[ line: 8901 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		options = if p91 == nil or p91.options == nil then {} else p91.options
	}, t_45)
end

function t_45:encode() --[[ line: 8909 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1561 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1562 = v:encode()
			local var1563, var1564 = protoModule.writeTag(buff, var1561, 1, protoModule.wireTypes.lengthDelimited)
			var1563, var1564 = protoModule.writeBuffer(var1563, var1564, var1562, buffer.len(var1562))
			buff = var1563
			var1561 = var1564
		end
	end
	local buff_1 = buffer.create(var1561)
	buffer.copy(buff_1, 0, buff, 0, var1561)
	
	return buff_1
end

function t_45.decode(p92) --[[ line: 8926 ]]
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1566 = t_45.new()
	local var1567 = 0
	while var1567 < buffer.len(p92) do
		local _ = nil
		local var1568 = nil
		local var1569, var1570, var1571 = protoModule.readTag(p92, var1567)
		local var1572 = var1569
		var1568 = var1570
		var1567 = var1571
		
		if var1568 == protoModule.wireTypes.varint then
			local _ = nil
			local var1573, var1574 = protoModule.readVarInt(p92, var1567)
			local _ = var1573
			var1567 = var1574
			continue
		end
		if var1568 == protoModule.wireTypes.lengthDelimited then
			if var1572 == 1 then
				local _ = nil
				local var1575, var1576 = protoModule.readBuffer(p92, var1567)
				var1567 = var1576
				table.insert(var1566.options, t.ColorStyleProp_ConditionalOption.decode(var1575))
			else
				local _ = nil
				local var1577, var1578 = protoModule.readVarInt(p92, var1567)
				var1567 = var1578 + var1577
			end
		elseif var1568 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1579, var1580 = protoModule.readFixed32(p92, var1567)
			local _ = var1579
			var1567 = var1580
		elseif var1568 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1581, var1582 = protoModule.readFixed64(p92, var1567)
			local _ = var1581
			var1567 = var1582
		else
			error("Unsupported wire type: " .. var1568)
		end
	end
	return var1566
end

function t_45:jsonEncode() --[[ line: 8969 ]]
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

function t_45:jsonDecode() --[[ line: 8983 ]]
	-- upvalues: t_45 (ref), t (ref)
	local var1585 = t_45.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ColorStyleProp_ConditionalOption.jsonDecode(v))
		end
		var1585.options = t_1
	end
	return var1585
end

t_45.descriptor = {
	name = "ColorStyleProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ColorStyleProp_ConditionalOptions = t_45
typeRegistryModule.default:register(t.ColorStyleProp_ConditionalOptions)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p93) --[[ line: 9014 ]]
	-- upvalues: t_46 (ref)
	return setmetatable({
		kind = if p93 == nil or p93.kind == nil then nil else p93.kind
	}, t_46)
end

function t_46:encode() --[[ line: 9020 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1588 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1589, var1590 = protoModule.writeTag(buff, var1588, 1, protoModule.wireTypes.lengthDelimited)
			var1589, var1590 = protoModule.writeString(var1589, var1590, self.kind.value)
			buff = var1589
			var1588 = var1590
		elseif self.kind.type == "conditional" then
			local var1591 = self.kind.value:encode()
			local var1592, var1593 = protoModule.writeTag(buff, var1588, 2, protoModule.wireTypes.lengthDelimited)
			var1592, var1593 = protoModule.writeBuffer(var1592, var1593, var1591, buffer.len(var1591))
			buff = var1592
			var1588 = var1593
		elseif self.kind.type == "binding_path" then
			local var1594, var1595 = protoModule.writeTag(buff, var1588, 3, protoModule.wireTypes.lengthDelimited)
			var1594, var1595 = protoModule.writeString(var1594, var1595, self.kind.value)
			buff = var1594
			var1588 = var1595
		end
	end
	local buff_1 = buffer.create(var1588)
	buffer.copy(buff_1, 0, buff, 0, var1588)
	
	return buff_1
end

function t_46.decode(p94) --[[ line: 9043 ]]
	-- upvalues: t_46 (ref), protoModule (ref), t (ref)
	local var1597 = t_46.new()
	local var1598 = 0
	while var1598 < buffer.len(p94) do
		local _ = nil
		local var1599 = nil
		local var1600, var1601, var1602 = protoModule.readTag(p94, var1598)
		local var1603 = var1600
		var1599 = var1601
		var1598 = var1602
		
		if var1599 == protoModule.wireTypes.varint then
			local _ = nil
			local var1604, var1605 = protoModule.readVarInt(p94, var1598)
			local _ = var1604
			var1598 = var1605
			continue
		end
		if var1599 == protoModule.wireTypes.lengthDelimited then
			if var1603 == 1 then
				local _ = nil
				local var1606, var1607 = protoModule.readBuffer(p94, var1598)
				var1598 = var1607
				var1597.kind = { type = "literal", value = buffer.tostring(var1606) }
			elseif var1603 == 2 then
				local _ = nil
				local var1608, var1609 = protoModule.readBuffer(p94, var1598)
				var1598 = var1609
				var1597.kind = {
					type = "conditional",
					value = t.FillBehaviorProp_ConditionalOptions.decode(var1608)
				}
			elseif var1603 == 3 then
				local _ = nil
				local var1610, var1611 = protoModule.readBuffer(p94, var1598)
				var1598 = var1611
				var1597.kind = { type = "binding_path", value = buffer.tostring(var1610) }
			else
				local _ = nil
				local var1612, var1613 = protoModule.readVarInt(p94, var1598)
				var1598 = var1613 + var1612
			end
		elseif var1599 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1614, var1615 = protoModule.readFixed32(p94, var1598)
			local _ = var1614
			var1598 = var1615
		elseif var1599 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1616, var1617 = protoModule.readFixed64(p94, var1598)
			local _ = var1616
			var1598 = var1617
		else
			error("Unsupported wire type: " .. var1599)
		end
	end
	return var1597
end

function t_46:jsonEncode() --[[ line: 9097 ]]
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

function t_46:jsonDecode() --[[ line: 9113 ]]
	-- upvalues: t_46 (ref), t (ref)
	local var1619 = t_46.new()
	
	if self.literal ~= nil then
		var1619.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1619.kind = {
			type = "conditional",
			value = t.FillBehaviorProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1619.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1619.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1619
end

t_46.descriptor = {
	name = "FillBehaviorProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FillBehaviorProp"
}
t.FillBehaviorProp = t_46
typeRegistryModule.default:register(t.FillBehaviorProp)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p95) --[[ line: 9152 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		condition = if p95 == nil or p95.condition == nil then nil else p95.condition,
		kind = if p95 == nil or p95.kind == nil then nil else p95.kind
	}, t_47)
end

function t_47:encode() --[[ line: 9161 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1621 = 0
	
	if self.condition ~= nil then
		local var1622 = self.condition:encode()
		local var1623, var1624 = protoModule.writeTag(buff, var1621, 1, protoModule.wireTypes.lengthDelimited)
		var1623, var1624 = protoModule.writeBuffer(var1623, var1624, var1622, buffer.len(var1622))
		buff = var1623
		var1621 = var1624
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1625, var1626 = protoModule.writeTag(buff, var1621, 2, protoModule.wireTypes.lengthDelimited)
			var1625, var1626 = protoModule.writeString(var1625, var1626, self.kind.value)
			buff = var1625
			var1621 = var1626
		elseif self.kind.type == "binding_path" then
			local var1627, var1628 = protoModule.writeTag(buff, var1621, 3, protoModule.wireTypes.lengthDelimited)
			var1627, var1628 = protoModule.writeString(var1627, var1628, self.kind.value)
			buff = var1627
			var1621 = var1628
		end
	end
	local buff_1 = buffer.create(var1621)
	buffer.copy(buff_1, 0, buff, 0, var1621)
	
	return buff_1
end

function t_47.decode(p96) --[[ line: 9186 ]]
	-- upvalues: t_47 (ref), protoModule (ref), propConditionModule (ref)
	local var1630 = t_47.new()
	local var1631 = 0
	while var1631 < buffer.len(p96) do
		local _ = nil
		local var1632 = nil
		local var1633, var1634, var1635 = protoModule.readTag(p96, var1631)
		local var1636 = var1633
		var1632 = var1634
		var1631 = var1635
		
		if var1632 == protoModule.wireTypes.varint then
			local _ = nil
			local var1637, var1638 = protoModule.readVarInt(p96, var1631)
			local _ = var1637
			var1631 = var1638
			continue
		end
		if var1632 == protoModule.wireTypes.lengthDelimited then
			if var1636 == 1 then
				local _ = nil
				local var1639, var1640 = protoModule.readBuffer(p96, var1631)
				var1631 = var1640
				var1630.condition = propConditionModule.PropCondition.decode(var1639)
			elseif var1636 == 2 then
				local _ = nil
				local var1641, var1642 = protoModule.readBuffer(p96, var1631)
				var1631 = var1642
				var1630.kind = { type = "literal", value = buffer.tostring(var1641) }
			elseif var1636 == 3 then
				local _ = nil
				local var1643, var1644 = protoModule.readBuffer(p96, var1631)
				var1631 = var1644
				var1630.kind = { type = "binding_path", value = buffer.tostring(var1643) }
			else
				local _ = nil
				local var1645, var1646 = protoModule.readVarInt(p96, var1631)
				var1631 = var1646 + var1645
			end
		elseif var1632 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1647, var1648 = protoModule.readFixed32(p96, var1631)
			local _ = var1647
			var1631 = var1648
		elseif var1632 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1649, var1650 = protoModule.readFixed64(p96, var1631)
			local _ = var1649
			var1631 = var1650
		else
			error("Unsupported wire type: " .. var1632)
		end
	end
	return var1630
end

function t_47:jsonEncode() --[[ line: 9239 ]]
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

function t_47:jsonDecode() --[[ line: 9257 ]]
	-- upvalues: t_47 (ref), propConditionModule (ref)
	local var1652 = t_47.new()
	
	if self.condition ~= nil then
		var1652.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1652.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1652.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1652.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1652
end

t_47.descriptor = {
	name = "FillBehaviorProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FillBehaviorProp_ConditionalOption = t_47
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOption)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p97) --[[ line: 9296 ]]
	-- upvalues: t_48 (ref)
	return setmetatable({
		options = if p97 == nil or p97.options == nil then {} else p97.options
	}, t_48)
end

function t_48:encode() --[[ line: 9304 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1654 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1655 = v:encode()
			local var1656, var1657 = protoModule.writeTag(buff, var1654, 1, protoModule.wireTypes.lengthDelimited)
			var1656, var1657 = protoModule.writeBuffer(var1656, var1657, var1655, buffer.len(var1655))
			buff = var1656
			var1654 = var1657
		end
	end
	local buff_1 = buffer.create(var1654)
	buffer.copy(buff_1, 0, buff, 0, var1654)
	
	return buff_1
end

function t_48.decode(p98) --[[ line: 9321 ]]
	-- upvalues: t_48 (ref), protoModule (ref), t (ref)
	local var1659 = t_48.new()
	local var1660 = 0
	while var1660 < buffer.len(p98) do
		local _ = nil
		local var1661 = nil
		local var1662, var1663, var1664 = protoModule.readTag(p98, var1660)
		local var1665 = var1662
		var1661 = var1663
		var1660 = var1664
		
		if var1661 == protoModule.wireTypes.varint then
			local _ = nil
			local var1666, var1667 = protoModule.readVarInt(p98, var1660)
			local _ = var1666
			var1660 = var1667
			continue
		end
		if var1661 == protoModule.wireTypes.lengthDelimited then
			if var1665 == 1 then
				local _ = nil
				local var1668, var1669 = protoModule.readBuffer(p98, var1660)
				var1660 = var1669
				table.insert(var1659.options, t.FillBehaviorProp_ConditionalOption.decode(var1668))
			else
				local _ = nil
				local var1670, var1671 = protoModule.readVarInt(p98, var1660)
				var1660 = var1671 + var1670
			end
		elseif var1661 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1672, var1673 = protoModule.readFixed32(p98, var1660)
			local _ = var1672
			var1660 = var1673
		elseif var1661 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1674, var1675 = protoModule.readFixed64(p98, var1660)
			local _ = var1674
			var1660 = var1675
		else
			error("Unsupported wire type: " .. var1661)
		end
	end
	return var1659
end

function t_48:jsonEncode() --[[ line: 9364 ]]
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

function t_48:jsonDecode() --[[ line: 9378 ]]
	-- upvalues: t_48 (ref), t (ref)
	local var1678 = t_48.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FillBehaviorProp_ConditionalOption.jsonDecode(v))
		end
		var1678.options = t_1
	end
	return var1678
end

t_48.descriptor = {
	name = "FillBehaviorProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FillBehaviorProp_ConditionalOptions = t_48
typeRegistryModule.default:register(t.FillBehaviorProp_ConditionalOptions)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p99) --[[ line: 9409 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		kind = if p99 == nil or p99.kind == nil then nil else p99.kind
	}, t_49)
end

function t_49:encode() --[[ line: 9415 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1681 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1682, var1683 = protoModule.writeTag(buff, var1681, 1, protoModule.wireTypes.lengthDelimited)
			var1682, var1683 = protoModule.writeString(var1682, var1683, self.kind.value)
			buff = var1682
			var1681 = var1683
		elseif self.kind.type == "conditional" then
			local var1684 = self.kind.value:encode()
			local var1685, var1686 = protoModule.writeTag(buff, var1681, 2, protoModule.wireTypes.lengthDelimited)
			var1685, var1686 = protoModule.writeBuffer(var1685, var1686, var1684, buffer.len(var1684))
			buff = var1685
			var1681 = var1686
		elseif self.kind.type == "binding_path" then
			local var1687, var1688 = protoModule.writeTag(buff, var1681, 3, protoModule.wireTypes.lengthDelimited)
			var1687, var1688 = protoModule.writeString(var1687, var1688, self.kind.value)
			buff = var1687
			var1681 = var1688
		end
	end
	local buff_1 = buffer.create(var1681)
	buffer.copy(buff_1, 0, buff, 0, var1681)
	
	return buff_1
end

function t_49.decode(p100) --[[ line: 9438 ]]
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var1690 = t_49.new()
	local var1691 = 0
	while var1691 < buffer.len(p100) do
		local _ = nil
		local var1692 = nil
		local var1693, var1694, var1695 = protoModule.readTag(p100, var1691)
		local var1696 = var1693
		var1692 = var1694
		var1691 = var1695
		
		if var1692 == protoModule.wireTypes.varint then
			local _ = nil
			local var1697, var1698 = protoModule.readVarInt(p100, var1691)
			local _ = var1697
			var1691 = var1698
			continue
		end
		if var1692 == protoModule.wireTypes.lengthDelimited then
			if var1696 == 1 then
				local _ = nil
				local var1699, var1700 = protoModule.readBuffer(p100, var1691)
				var1691 = var1700
				var1690.kind = { type = "literal", value = buffer.tostring(var1699) }
			elseif var1696 == 2 then
				local _ = nil
				local var1701, var1702 = protoModule.readBuffer(p100, var1691)
				var1691 = var1702
				var1690.kind = {
					type = "conditional",
					value = t.InputSizeProp_ConditionalOptions.decode(var1701)
				}
			elseif var1696 == 3 then
				local _ = nil
				local var1703, var1704 = protoModule.readBuffer(p100, var1691)
				var1691 = var1704
				var1690.kind = { type = "binding_path", value = buffer.tostring(var1703) }
			else
				local _ = nil
				local var1705, var1706 = protoModule.readVarInt(p100, var1691)
				var1691 = var1706 + var1705
			end
		elseif var1692 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1707, var1708 = protoModule.readFixed32(p100, var1691)
			local _ = var1707
			var1691 = var1708
		elseif var1692 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1709, var1710 = protoModule.readFixed64(p100, var1691)
			local _ = var1709
			var1691 = var1710
		else
			error("Unsupported wire type: " .. var1692)
		end
	end
	return var1690
end

function t_49:jsonEncode() --[[ line: 9492 ]]
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

function t_49:jsonDecode() --[[ line: 9508 ]]
	-- upvalues: t_49 (ref), t (ref)
	local var1712 = t_49.new()
	
	if self.literal ~= nil then
		var1712.kind = { type = "literal", value = self.literal }
	end
	if self.conditional ~= nil then
		var1712.kind = {
			type = "conditional",
			value = t.InputSizeProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1712.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1712.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1712
end

t_49.descriptor = {
	name = "InputSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.InputSizeProp"
}
t.InputSizeProp = t_49
typeRegistryModule.default:register(t.InputSizeProp)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p101) --[[ line: 9547 ]]
	-- upvalues: t_50 (ref)
	return setmetatable({
		condition = if p101 == nil or p101.condition == nil then nil else p101.condition,
		kind = if p101 == nil or p101.kind == nil then nil else p101.kind
	}, t_50)
end

function t_50:encode() --[[ line: 9556 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1714 = 0
	
	if self.condition ~= nil then
		local var1715 = self.condition:encode()
		local var1716, var1717 = protoModule.writeTag(buff, var1714, 1, protoModule.wireTypes.lengthDelimited)
		var1716, var1717 = protoModule.writeBuffer(var1716, var1717, var1715, buffer.len(var1715))
		buff = var1716
		var1714 = var1717
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1718, var1719 = protoModule.writeTag(buff, var1714, 2, protoModule.wireTypes.lengthDelimited)
			var1718, var1719 = protoModule.writeString(var1718, var1719, self.kind.value)
			buff = var1718
			var1714 = var1719
		elseif self.kind.type == "binding_path" then
			local var1720, var1721 = protoModule.writeTag(buff, var1714, 3, protoModule.wireTypes.lengthDelimited)
			var1720, var1721 = protoModule.writeString(var1720, var1721, self.kind.value)
			buff = var1720
			var1714 = var1721
		end
	end
	local buff_1 = buffer.create(var1714)
	buffer.copy(buff_1, 0, buff, 0, var1714)
	
	return buff_1
end

function t_50.decode(p102) --[[ line: 9581 ]]
	-- upvalues: t_50 (ref), protoModule (ref), propConditionModule (ref)
	local var1723 = t_50.new()
	local var1724 = 0
	while var1724 < buffer.len(p102) do
		local _ = nil
		local var1725 = nil
		local var1726, var1727, var1728 = protoModule.readTag(p102, var1724)
		local var1729 = var1726
		var1725 = var1727
		var1724 = var1728
		
		if var1725 == protoModule.wireTypes.varint then
			local _ = nil
			local var1730, var1731 = protoModule.readVarInt(p102, var1724)
			local _ = var1730
			var1724 = var1731
			continue
		end
		if var1725 == protoModule.wireTypes.lengthDelimited then
			if var1729 == 1 then
				local _ = nil
				local var1732, var1733 = protoModule.readBuffer(p102, var1724)
				var1724 = var1733
				var1723.condition = propConditionModule.PropCondition.decode(var1732)
			elseif var1729 == 2 then
				local _ = nil
				local var1734, var1735 = protoModule.readBuffer(p102, var1724)
				var1724 = var1735
				var1723.kind = { type = "literal", value = buffer.tostring(var1734) }
			elseif var1729 == 3 then
				local _ = nil
				local var1736, var1737 = protoModule.readBuffer(p102, var1724)
				var1724 = var1737
				var1723.kind = { type = "binding_path", value = buffer.tostring(var1736) }
			else
				local _ = nil
				local var1738, var1739 = protoModule.readVarInt(p102, var1724)
				var1724 = var1739 + var1738
			end
		elseif var1725 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1740, var1741 = protoModule.readFixed32(p102, var1724)
			local _ = var1740
			var1724 = var1741
		elseif var1725 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1742, var1743 = protoModule.readFixed64(p102, var1724)
			local _ = var1742
			var1724 = var1743
		else
			error("Unsupported wire type: " .. var1725)
		end
	end
	return var1723
end

function t_50:jsonEncode() --[[ line: 9634 ]]
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

function t_50:jsonDecode() --[[ line: 9652 ]]
	-- upvalues: t_50 (ref), propConditionModule (ref)
	local var1745 = t_50.new()
	
	if self.condition ~= nil then
		var1745.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1745.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var1745.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1745.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1745
end

t_50.descriptor = {
	name = "InputSizeProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.InputSizeProp_ConditionalOption = t_50
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOption)
local t_51 = {}
t_51.__index = t_51

function t_51.new(p103) --[[ line: 9689 ]]
	-- upvalues: t_51 (ref)
	return setmetatable({
		options = if p103 == nil or p103.options == nil then {} else p103.options
	}, t_51)
end

function t_51:encode() --[[ line: 9697 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1747 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1748 = v:encode()
			local var1749, var1750 = protoModule.writeTag(buff, var1747, 1, protoModule.wireTypes.lengthDelimited)
			var1749, var1750 = protoModule.writeBuffer(var1749, var1750, var1748, buffer.len(var1748))
			buff = var1749
			var1747 = var1750
		end
	end
	local buff_1 = buffer.create(var1747)
	buffer.copy(buff_1, 0, buff, 0, var1747)
	
	return buff_1
end

function t_51.decode(p104) --[[ line: 9714 ]]
	-- upvalues: t_51 (ref), protoModule (ref), t (ref)
	local var1752 = t_51.new()
	local var1753 = 0
	while var1753 < buffer.len(p104) do
		local _ = nil
		local var1754 = nil
		local var1755, var1756, var1757 = protoModule.readTag(p104, var1753)
		local var1758 = var1755
		var1754 = var1756
		var1753 = var1757
		
		if var1754 == protoModule.wireTypes.varint then
			local _ = nil
			local var1759, var1760 = protoModule.readVarInt(p104, var1753)
			local _ = var1759
			var1753 = var1760
			continue
		end
		if var1754 == protoModule.wireTypes.lengthDelimited then
			if var1758 == 1 then
				local _ = nil
				local var1761, var1762 = protoModule.readBuffer(p104, var1753)
				var1753 = var1762
				table.insert(var1752.options, t.InputSizeProp_ConditionalOption.decode(var1761))
			else
				local _ = nil
				local var1763, var1764 = protoModule.readVarInt(p104, var1753)
				var1753 = var1764 + var1763
			end
		elseif var1754 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1765, var1766 = protoModule.readFixed32(p104, var1753)
			local _ = var1765
			var1753 = var1766
		elseif var1754 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1767, var1768 = protoModule.readFixed64(p104, var1753)
			local _ = var1767
			var1753 = var1768
		else
			error("Unsupported wire type: " .. var1754)
		end
	end
	return var1752
end

function t_51:jsonEncode() --[[ line: 9757 ]]
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

function t_51:jsonDecode() --[[ line: 9771 ]]
	-- upvalues: t_51 (ref), t (ref)
	local var1771 = t_51.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.InputSizeProp_ConditionalOption.jsonDecode(v))
		end
		var1771.options = t_1
	end
	return var1771
end

t_51.descriptor = {
	name = "InputSizeProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.InputSizeProp_ConditionalOptions = t_51
typeRegistryModule.default:register(t.InputSizeProp_ConditionalOptions)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p105) --[[ line: 9802 ]]
	-- upvalues: t_52 (ref)
	return setmetatable({
		kind = if p105 == nil or p105.kind == nil then nil else p105.kind
	}, t_52)
end

function t_52:encode() --[[ line: 9808 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1774 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1775, var1776 = protoModule.writeTag(buff, var1774, 1, protoModule.wireTypes.lengthDelimited)
			var1775, var1776 = protoModule.writeString(var1775, var1776, self.kind.value)
			buff = var1775
			var1774 = var1776
		elseif self.kind.type == "token" then
			local var1777, var1778 = protoModule.writeTag(buff, var1774, 2, protoModule.wireTypes.lengthDelimited)
			var1777, var1778 = protoModule.writeString(var1777, var1778, self.kind.value)
			buff = var1777
			var1774 = var1778
		elseif self.kind.type == "conditional" then
			local var1779 = self.kind.value:encode()
			local var1780, var1781 = protoModule.writeTag(buff, var1774, 3, protoModule.wireTypes.lengthDelimited)
			var1780, var1781 = protoModule.writeBuffer(var1780, var1781, var1779, buffer.len(var1779))
			buff = var1780
			var1774 = var1781
		elseif self.kind.type == "binding_path" then
			local var1782, var1783 = protoModule.writeTag(buff, var1774, 4, protoModule.wireTypes.lengthDelimited)
			var1782, var1783 = protoModule.writeString(var1782, var1783, self.kind.value)
			buff = var1782
			var1774 = var1783
		end
	end
	local buff_1 = buffer.create(var1774)
	buffer.copy(buff_1, 0, buff, 0, var1774)
	
	return buff_1
end

function t_52.decode(p106) --[[ line: 9834 ]]
	-- upvalues: t_52 (ref), protoModule (ref), t (ref)
	local var1785 = t_52.new()
	local var1786 = 0
	while var1786 < buffer.len(p106) do
		local _ = nil
		local var1787 = nil
		local var1788, var1789, var1790 = protoModule.readTag(p106, var1786)
		local var1791 = var1788
		var1787 = var1789
		var1786 = var1790
		
		if var1787 == protoModule.wireTypes.varint then
			local _ = nil
			local var1792, var1793 = protoModule.readVarInt(p106, var1786)
			local _ = var1792
			var1786 = var1793
			continue
		end
		if var1787 == protoModule.wireTypes.lengthDelimited then
			if var1791 == 1 then
				local _ = nil
				local var1794, var1795 = protoModule.readBuffer(p106, var1786)
				var1786 = var1795
				var1785.kind = { type = "literal", value = buffer.tostring(var1794) }
			elseif var1791 == 2 then
				local _ = nil
				local var1796, var1797 = protoModule.readBuffer(p106, var1786)
				var1786 = var1797
				var1785.kind = { type = "token", value = buffer.tostring(var1796) }
			elseif var1791 == 3 then
				local _ = nil
				local var1798, var1799 = protoModule.readBuffer(p106, var1786)
				var1786 = var1799
				var1785.kind = {
					type = "conditional",
					value = t.UDimProp_ConditionalOptions.decode(var1798)
				}
			elseif var1791 == 4 then
				local _ = nil
				local var1800, var1801 = protoModule.readBuffer(p106, var1786)
				var1786 = var1801
				var1785.kind = { type = "binding_path", value = buffer.tostring(var1800) }
			else
				local _ = nil
				local var1802, var1803 = protoModule.readVarInt(p106, var1786)
				var1786 = var1803 + var1802
			end
		elseif var1787 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1804, var1805 = protoModule.readFixed32(p106, var1786)
			local _ = var1804
			var1786 = var1805
		elseif var1787 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1806, var1807 = protoModule.readFixed64(p106, var1786)
			local _ = var1806
			var1786 = var1807
		else
			error("Unsupported wire type: " .. var1787)
		end
	end
	return var1785
end

function t_52:jsonEncode() --[[ line: 9892 ]]
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

function t_52:jsonDecode() --[[ line: 9910 ]]
	-- upvalues: t_52 (ref), t (ref)
	local var1809 = t_52.new()
	
	if self.literal ~= nil then
		var1809.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1809.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1809.kind = {
			type = "conditional",
			value = t.UDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1809.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1809.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1809
end

t_52.descriptor = {
	name = "UDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDimProp"
}
t.UDimProp = t_52
typeRegistryModule.default:register(t.UDimProp)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p107) --[[ line: 9951 ]]
	-- upvalues: t_53 (ref)
	return setmetatable({
		condition = if p107 == nil or p107.condition == nil then nil else p107.condition,
		kind = if p107 == nil or p107.kind == nil then nil else p107.kind
	}, t_53)
end

function t_53:encode() --[[ line: 9960 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1811 = 0
	
	if self.condition ~= nil then
		local var1812 = self.condition:encode()
		local var1813, var1814 = protoModule.writeTag(buff, var1811, 1, protoModule.wireTypes.lengthDelimited)
		var1813, var1814 = protoModule.writeBuffer(var1813, var1814, var1812, buffer.len(var1812))
		buff = var1813
		var1811 = var1814
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1815, var1816 = protoModule.writeTag(buff, var1811, 2, protoModule.wireTypes.lengthDelimited)
			var1815, var1816 = protoModule.writeString(var1815, var1816, self.kind.value)
			buff = var1815
			var1811 = var1816
		elseif self.kind.type == "token" then
			local var1817, var1818 = protoModule.writeTag(buff, var1811, 3, protoModule.wireTypes.lengthDelimited)
			var1817, var1818 = protoModule.writeString(var1817, var1818, self.kind.value)
			buff = var1817
			var1811 = var1818
		elseif self.kind.type == "binding_path" then
			local var1819, var1820 = protoModule.writeTag(buff, var1811, 4, protoModule.wireTypes.lengthDelimited)
			var1819, var1820 = protoModule.writeString(var1819, var1820, self.kind.value)
			buff = var1819
			var1811 = var1820
		end
	end
	local buff_1 = buffer.create(var1811)
	buffer.copy(buff_1, 0, buff, 0, var1811)
	
	return buff_1
end

function t_53.decode(p108) --[[ line: 9988 ]]
	-- upvalues: t_53 (ref), protoModule (ref), propConditionModule (ref)
	local var1822 = t_53.new()
	local var1823 = 0
	while var1823 < buffer.len(p108) do
		local _ = nil
		local var1824 = nil
		local var1825, var1826, var1827 = protoModule.readTag(p108, var1823)
		local var1828 = var1825
		var1824 = var1826
		var1823 = var1827
		
		if var1824 == protoModule.wireTypes.varint then
			local _ = nil
			local var1829, var1830 = protoModule.readVarInt(p108, var1823)
			local _ = var1829
			var1823 = var1830
			continue
		end
		if var1824 == protoModule.wireTypes.lengthDelimited then
			if var1828 == 1 then
				local _ = nil
				local var1831, var1832 = protoModule.readBuffer(p108, var1823)
				var1823 = var1832
				var1822.condition = propConditionModule.PropCondition.decode(var1831)
			elseif var1828 == 2 then
				local _ = nil
				local var1833, var1834 = protoModule.readBuffer(p108, var1823)
				var1823 = var1834
				var1822.kind = { type = "literal", value = buffer.tostring(var1833) }
			elseif var1828 == 3 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p108, var1823)
				var1823 = var1836
				var1822.kind = { type = "token", value = buffer.tostring(var1835) }
			elseif var1828 == 4 then
				local _ = nil
				local var1837, var1838 = protoModule.readBuffer(p108, var1823)
				var1823 = var1838
				var1822.kind = { type = "binding_path", value = buffer.tostring(var1837) }
			else
				local _ = nil
				local var1839, var1840 = protoModule.readVarInt(p108, var1823)
				var1823 = var1840 + var1839
			end
		elseif var1824 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1841, var1842 = protoModule.readFixed32(p108, var1823)
			local _ = var1841
			var1823 = var1842
		elseif var1824 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1843, var1844 = protoModule.readFixed64(p108, var1823)
			local _ = var1843
			var1823 = var1844
		else
			error("Unsupported wire type: " .. var1824)
		end
	end
	return var1822
end

function t_53:jsonEncode() --[[ line: 10046 ]]
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

function t_53:jsonDecode() --[[ line: 10066 ]]
	-- upvalues: t_53 (ref), propConditionModule (ref)
	local var1846 = t_53.new()
	
	if self.condition ~= nil then
		var1846.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1846.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1846.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1846.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1846.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1846
end

t_53.descriptor = {
	name = "UDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDimProp_ConditionalOption = t_53
typeRegistryModule.default:register(t.UDimProp_ConditionalOption)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p109) --[[ line: 10107 ]]
	-- upvalues: t_54 (ref)
	return setmetatable({
		options = if p109 == nil or p109.options == nil then {} else p109.options
	}, t_54)
end

function t_54:encode() --[[ line: 10115 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1848 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1849 = v:encode()
			local var1850, var1851 = protoModule.writeTag(buff, var1848, 1, protoModule.wireTypes.lengthDelimited)
			var1850, var1851 = protoModule.writeBuffer(var1850, var1851, var1849, buffer.len(var1849))
			buff = var1850
			var1848 = var1851
		end
	end
	local buff_1 = buffer.create(var1848)
	buffer.copy(buff_1, 0, buff, 0, var1848)
	
	return buff_1
end

function t_54.decode(p110) --[[ line: 10132 ]]
	-- upvalues: t_54 (ref), protoModule (ref), t (ref)
	local var1853 = t_54.new()
	local var1854 = 0
	while var1854 < buffer.len(p110) do
		local _ = nil
		local var1855 = nil
		local var1856, var1857, var1858 = protoModule.readTag(p110, var1854)
		local var1859 = var1856
		var1855 = var1857
		var1854 = var1858
		
		if var1855 == protoModule.wireTypes.varint then
			local _ = nil
			local var1860, var1861 = protoModule.readVarInt(p110, var1854)
			local _ = var1860
			var1854 = var1861
			continue
		end
		if var1855 == protoModule.wireTypes.lengthDelimited then
			if var1859 == 1 then
				local _ = nil
				local var1862, var1863 = protoModule.readBuffer(p110, var1854)
				var1854 = var1863
				table.insert(var1853.options, t.UDimProp_ConditionalOption.decode(var1862))
			else
				local _ = nil
				local var1864, var1865 = protoModule.readVarInt(p110, var1854)
				var1854 = var1865 + var1864
			end
		elseif var1855 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1866, var1867 = protoModule.readFixed32(p110, var1854)
			local _ = var1866
			var1854 = var1867
		elseif var1855 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1868, var1869 = protoModule.readFixed64(p110, var1854)
			local _ = var1868
			var1854 = var1869
		else
			error("Unsupported wire type: " .. var1855)
		end
	end
	return var1853
end

function t_54:jsonEncode() --[[ line: 10175 ]]
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

function t_54:jsonDecode() --[[ line: 10189 ]]
	-- upvalues: t_54 (ref), t (ref)
	local var1872 = t_54.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDimProp_ConditionalOption.jsonDecode(v))
		end
		var1872.options = t_1
	end
	return var1872
end

t_54.descriptor = {
	name = "UDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDimProp_ConditionalOptions = t_54
typeRegistryModule.default:register(t.UDimProp_ConditionalOptions)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p111) --[[ line: 10218 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		kind = if p111 == nil or p111.kind == nil then nil else p111.kind
	}, t_55)
end

function t_55:encode() --[[ line: 10224 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1875 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1876, var1877 = protoModule.writeTag(buff, var1875, 1, protoModule.wireTypes.lengthDelimited)
			var1876, var1877 = protoModule.writeString(var1876, var1877, self.kind.value)
			buff = var1876
			var1875 = var1877
		elseif self.kind.type == "token" then
			local var1878, var1879 = protoModule.writeTag(buff, var1875, 2, protoModule.wireTypes.lengthDelimited)
			var1878, var1879 = protoModule.writeString(var1878, var1879, self.kind.value)
			buff = var1878
			var1875 = var1879
		elseif self.kind.type == "conditional" then
			local var1880 = self.kind.value:encode()
			local var1881, var1882 = protoModule.writeTag(buff, var1875, 3, protoModule.wireTypes.lengthDelimited)
			var1881, var1882 = protoModule.writeBuffer(var1881, var1882, var1880, buffer.len(var1880))
			buff = var1881
			var1875 = var1882
		elseif self.kind.type == "binding_path" then
			local var1883, var1884 = protoModule.writeTag(buff, var1875, 4, protoModule.wireTypes.lengthDelimited)
			var1883, var1884 = protoModule.writeString(var1883, var1884, self.kind.value)
			buff = var1883
			var1875 = var1884
		end
	end
	local buff_1 = buffer.create(var1875)
	buffer.copy(buff_1, 0, buff, 0, var1875)
	
	return buff_1
end

function t_55.decode(p112) --[[ line: 10250 ]]
	-- upvalues: t_55 (ref), protoModule (ref), t (ref)
	local var1886 = t_55.new()
	local var1887 = 0
	while var1887 < buffer.len(p112) do
		local _ = nil
		local var1888 = nil
		local var1889, var1890, var1891 = protoModule.readTag(p112, var1887)
		local var1892 = var1889
		var1888 = var1890
		var1887 = var1891
		
		if var1888 == protoModule.wireTypes.varint then
			local _ = nil
			local var1893, var1894 = protoModule.readVarInt(p112, var1887)
			local _ = var1893
			var1887 = var1894
			continue
		end
		if var1888 == protoModule.wireTypes.lengthDelimited then
			if var1892 == 1 then
				local _ = nil
				local var1895, var1896 = protoModule.readBuffer(p112, var1887)
				var1887 = var1896
				var1886.kind = { type = "literal", value = buffer.tostring(var1895) }
			elseif var1892 == 2 then
				local _ = nil
				local var1897, var1898 = protoModule.readBuffer(p112, var1887)
				var1887 = var1898
				var1886.kind = { type = "token", value = buffer.tostring(var1897) }
			elseif var1892 == 3 then
				local _ = nil
				local var1899, var1900 = protoModule.readBuffer(p112, var1887)
				var1887 = var1900
				var1886.kind = {
					type = "conditional",
					value = t.UDim2Prop_ConditionalOptions.decode(var1899)
				}
			elseif var1892 == 4 then
				local _ = nil
				local var1901, var1902 = protoModule.readBuffer(p112, var1887)
				var1887 = var1902
				var1886.kind = { type = "binding_path", value = buffer.tostring(var1901) }
			else
				local _ = nil
				local var1903, var1904 = protoModule.readVarInt(p112, var1887)
				var1887 = var1904 + var1903
			end
		elseif var1888 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1905, var1906 = protoModule.readFixed32(p112, var1887)
			local _ = var1905
			var1887 = var1906
		elseif var1888 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1907, var1908 = protoModule.readFixed64(p112, var1887)
			local _ = var1907
			var1887 = var1908
		else
			error("Unsupported wire type: " .. var1888)
		end
	end
	return var1886
end

function t_55:jsonEncode() --[[ line: 10308 ]]
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

function t_55:jsonDecode() --[[ line: 10326 ]]
	-- upvalues: t_55 (ref), t (ref)
	local var1910 = t_55.new()
	
	if self.literal ~= nil then
		var1910.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1910.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var1910.kind = {
			type = "conditional",
			value = t.UDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var1910.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1910.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1910
end

t_55.descriptor = {
	name = "UDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UDim2Prop"
}
t.UDim2Prop = t_55
typeRegistryModule.default:register(t.UDim2Prop)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p113) --[[ line: 10367 ]]
	-- upvalues: t_56 (ref)
	return setmetatable({
		condition = if p113 == nil or p113.condition == nil then nil else p113.condition,
		kind = if p113 == nil or p113.kind == nil then nil else p113.kind
	}, t_56)
end

function t_56:encode() --[[ line: 10376 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1912 = 0
	
	if self.condition ~= nil then
		local var1913 = self.condition:encode()
		local var1914, var1915 = protoModule.writeTag(buff, var1912, 1, protoModule.wireTypes.lengthDelimited)
		var1914, var1915 = protoModule.writeBuffer(var1914, var1915, var1913, buffer.len(var1913))
		buff = var1914
		var1912 = var1915
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1916, var1917 = protoModule.writeTag(buff, var1912, 2, protoModule.wireTypes.lengthDelimited)
			var1916, var1917 = protoModule.writeString(var1916, var1917, self.kind.value)
			buff = var1916
			var1912 = var1917
		elseif self.kind.type == "token" then
			local var1918, var1919 = protoModule.writeTag(buff, var1912, 3, protoModule.wireTypes.lengthDelimited)
			var1918, var1919 = protoModule.writeString(var1918, var1919, self.kind.value)
			buff = var1918
			var1912 = var1919
		elseif self.kind.type == "binding_path" then
			local var1920, var1921 = protoModule.writeTag(buff, var1912, 4, protoModule.wireTypes.lengthDelimited)
			var1920, var1921 = protoModule.writeString(var1920, var1921, self.kind.value)
			buff = var1920
			var1912 = var1921
		end
	end
	local buff_1 = buffer.create(var1912)
	buffer.copy(buff_1, 0, buff, 0, var1912)
	
	return buff_1
end

function t_56.decode(p114) --[[ line: 10404 ]]
	-- upvalues: t_56 (ref), protoModule (ref), propConditionModule (ref)
	local var1923 = t_56.new()
	local var1924 = 0
	while var1924 < buffer.len(p114) do
		local _ = nil
		local var1925 = nil
		local var1926, var1927, var1928 = protoModule.readTag(p114, var1924)
		local var1929 = var1926
		var1925 = var1927
		var1924 = var1928
		
		if var1925 == protoModule.wireTypes.varint then
			local _ = nil
			local var1930, var1931 = protoModule.readVarInt(p114, var1924)
			local _ = var1930
			var1924 = var1931
			continue
		end
		if var1925 == protoModule.wireTypes.lengthDelimited then
			if var1929 == 1 then
				local _ = nil
				local var1932, var1933 = protoModule.readBuffer(p114, var1924)
				var1924 = var1933
				var1923.condition = propConditionModule.PropCondition.decode(var1932)
			elseif var1929 == 2 then
				local _ = nil
				local var1934, var1935 = protoModule.readBuffer(p114, var1924)
				var1924 = var1935
				var1923.kind = { type = "literal", value = buffer.tostring(var1934) }
			elseif var1929 == 3 then
				local _ = nil
				local var1936, var1937 = protoModule.readBuffer(p114, var1924)
				var1924 = var1937
				var1923.kind = { type = "token", value = buffer.tostring(var1936) }
			elseif var1929 == 4 then
				local _ = nil
				local var1938, var1939 = protoModule.readBuffer(p114, var1924)
				var1924 = var1939
				var1923.kind = { type = "binding_path", value = buffer.tostring(var1938) }
			else
				local _ = nil
				local var1940, var1941 = protoModule.readVarInt(p114, var1924)
				var1924 = var1941 + var1940
			end
		elseif var1925 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1942, var1943 = protoModule.readFixed32(p114, var1924)
			local _ = var1942
			var1924 = var1943
		elseif var1925 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1944, var1945 = protoModule.readFixed64(p114, var1924)
			local _ = var1944
			var1924 = var1945
		else
			error("Unsupported wire type: " .. var1925)
		end
	end
	return var1923
end

function t_56:jsonEncode() --[[ line: 10462 ]]
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

function t_56:jsonDecode() --[[ line: 10482 ]]
	-- upvalues: t_56 (ref), propConditionModule (ref)
	local var1947 = t_56.new()
	
	if self.condition ~= nil then
		var1947.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var1947.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var1947.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var1947.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var1947.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var1947
end

t_56.descriptor = {
	name = "UDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UDim2Prop_ConditionalOption = t_56
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOption)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p115) --[[ line: 10523 ]]
	-- upvalues: t_57 (ref)
	return setmetatable({
		options = if p115 == nil or p115.options == nil then {} else p115.options
	}, t_57)
end

function t_57:encode() --[[ line: 10531 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1949 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var1950 = v:encode()
			local var1951, var1952 = protoModule.writeTag(buff, var1949, 1, protoModule.wireTypes.lengthDelimited)
			var1951, var1952 = protoModule.writeBuffer(var1951, var1952, var1950, buffer.len(var1950))
			buff = var1951
			var1949 = var1952
		end
	end
	local buff_1 = buffer.create(var1949)
	buffer.copy(buff_1, 0, buff, 0, var1949)
	
	return buff_1
end

function t_57.decode(p116) --[[ line: 10548 ]]
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var1954 = t_57.new()
	local var1955 = 0
	while var1955 < buffer.len(p116) do
		local _ = nil
		local var1956 = nil
		local var1957, var1958, var1959 = protoModule.readTag(p116, var1955)
		local var1960 = var1957
		var1956 = var1958
		var1955 = var1959
		
		if var1956 == protoModule.wireTypes.varint then
			local _ = nil
			local var1961, var1962 = protoModule.readVarInt(p116, var1955)
			local _ = var1961
			var1955 = var1962
			continue
		end
		if var1956 == protoModule.wireTypes.lengthDelimited then
			if var1960 == 1 then
				local _ = nil
				local var1963, var1964 = protoModule.readBuffer(p116, var1955)
				var1955 = var1964
				table.insert(var1954.options, t.UDim2Prop_ConditionalOption.decode(var1963))
			else
				local _ = nil
				local var1965, var1966 = protoModule.readVarInt(p116, var1955)
				var1955 = var1966 + var1965
			end
		elseif var1956 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1967, var1968 = protoModule.readFixed32(p116, var1955)
			local _ = var1967
			var1955 = var1968
		elseif var1956 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1969, var1970 = protoModule.readFixed64(p116, var1955)
			local _ = var1969
			var1955 = var1970
		else
			error("Unsupported wire type: " .. var1956)
		end
	end
	return var1954
end

function t_57:jsonEncode() --[[ line: 10591 ]]
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

function t_57:jsonDecode() --[[ line: 10605 ]]
	-- upvalues: t_57 (ref), t (ref)
	local var1973 = t_57.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var1973.options = t_1
	end
	return var1973
end

t_57.descriptor = {
	name = "UDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UDim2Prop_ConditionalOptions = t_57
typeRegistryModule.default:register(t.UDim2Prop_ConditionalOptions)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p117) --[[ line: 10634 ]]
	-- upvalues: t_58 (ref)
	return setmetatable({
		kind = if p117 == nil or p117.kind == nil then nil else p117.kind
	}, t_58)
end

function t_58:encode() --[[ line: 10640 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1976 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var1977, var1978 = protoModule.writeTag(buff, var1976, 1, protoModule.wireTypes.lengthDelimited)
			var1977, var1978 = protoModule.writeString(var1977, var1978, self.kind.value)
			buff = var1977
			var1976 = var1978
		elseif self.kind.type == "token" then
			local var1979, var1980 = protoModule.writeTag(buff, var1976, 2, protoModule.wireTypes.lengthDelimited)
			var1979, var1980 = protoModule.writeString(var1979, var1980, self.kind.value)
			buff = var1979
			var1976 = var1980
		elseif self.kind.type == "conditional" then
			local var1981 = self.kind.value:encode()
			local var1982, var1983 = protoModule.writeTag(buff, var1976, 3, protoModule.wireTypes.lengthDelimited)
			var1982, var1983 = protoModule.writeBuffer(var1982, var1983, var1981, buffer.len(var1981))
			buff = var1982
			var1976 = var1983
		elseif self.kind.type == "binding_path" then
			local var1984, var1985 = protoModule.writeTag(buff, var1976, 4, protoModule.wireTypes.lengthDelimited)
			var1984, var1985 = protoModule.writeString(var1984, var1985, self.kind.value)
			buff = var1984
			var1976 = var1985
		end
	end
	local buff_1 = buffer.create(var1976)
	buffer.copy(buff_1, 0, buff, 0, var1976)
	
	return buff_1
end

function t_58.decode(p118) --[[ line: 10666 ]]
	-- upvalues: t_58 (ref), protoModule (ref), t (ref)
	local var1987 = t_58.new()
	local var1988 = 0
	while var1988 < buffer.len(p118) do
		local _ = nil
		local var1989 = nil
		local var1990, var1991, var1992 = protoModule.readTag(p118, var1988)
		local var1993 = var1990
		var1989 = var1991
		var1988 = var1992
		
		if var1989 == protoModule.wireTypes.varint then
			local _ = nil
			local var1994, var1995 = protoModule.readVarInt(p118, var1988)
			local _ = var1994
			var1988 = var1995
			continue
		end
		if var1989 == protoModule.wireTypes.lengthDelimited then
			if var1993 == 1 then
				local _ = nil
				local var1996, var1997 = protoModule.readBuffer(p118, var1988)
				var1988 = var1997
				var1987.kind = { type = "literal", value = buffer.tostring(var1996) }
			elseif var1993 == 2 then
				local _ = nil
				local var1998, var1999 = protoModule.readBuffer(p118, var1988)
				var1988 = var1999
				var1987.kind = { type = "token", value = buffer.tostring(var1998) }
			elseif var1993 == 3 then
				local _ = nil
				local var2000, var2001 = protoModule.readBuffer(p118, var1988)
				var1988 = var2001
				var1987.kind = {
					type = "conditional",
					value = t.Vector2Prop_ConditionalOptions.decode(var2000)
				}
			elseif var1993 == 4 then
				local _ = nil
				local var2002, var2003 = protoModule.readBuffer(p118, var1988)
				var1988 = var2003
				var1987.kind = { type = "binding_path", value = buffer.tostring(var2002) }
			else
				local _ = nil
				local var2004, var2005 = protoModule.readVarInt(p118, var1988)
				var1988 = var2005 + var2004
			end
		elseif var1989 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2006, var2007 = protoModule.readFixed32(p118, var1988)
			local _ = var2006
			var1988 = var2007
		elseif var1989 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2008, var2009 = protoModule.readFixed64(p118, var1988)
			local _ = var2008
			var1988 = var2009
		else
			error("Unsupported wire type: " .. var1989)
		end
	end
	return var1987
end

function t_58:jsonEncode() --[[ line: 10724 ]]
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

function t_58:jsonDecode() --[[ line: 10742 ]]
	-- upvalues: t_58 (ref), t (ref)
	local var2011 = t_58.new()
	
	if self.literal ~= nil then
		var2011.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2011.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2011.kind = {
			type = "conditional",
			value = t.Vector2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2011.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2011.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2011
end

t_58.descriptor = {
	name = "Vector2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.Vector2Prop"
}
t.Vector2Prop = t_58
typeRegistryModule.default:register(t.Vector2Prop)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p119) --[[ line: 10783 ]]
	-- upvalues: t_59 (ref)
	return setmetatable({
		condition = if p119 == nil or p119.condition == nil then nil else p119.condition,
		kind = if p119 == nil or p119.kind == nil then nil else p119.kind
	}, t_59)
end

function t_59:encode() --[[ line: 10792 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2013 = 0
	
	if self.condition ~= nil then
		local var2014 = self.condition:encode()
		local var2015, var2016 = protoModule.writeTag(buff, var2013, 1, protoModule.wireTypes.lengthDelimited)
		var2015, var2016 = protoModule.writeBuffer(var2015, var2016, var2014, buffer.len(var2014))
		buff = var2015
		var2013 = var2016
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2017, var2018 = protoModule.writeTag(buff, var2013, 2, protoModule.wireTypes.lengthDelimited)
			var2017, var2018 = protoModule.writeString(var2017, var2018, self.kind.value)
			buff = var2017
			var2013 = var2018
		elseif self.kind.type == "token" then
			local var2019, var2020 = protoModule.writeTag(buff, var2013, 3, protoModule.wireTypes.lengthDelimited)
			var2019, var2020 = protoModule.writeString(var2019, var2020, self.kind.value)
			buff = var2019
			var2013 = var2020
		elseif self.kind.type == "binding_path" then
			local var2021, var2022 = protoModule.writeTag(buff, var2013, 4, protoModule.wireTypes.lengthDelimited)
			var2021, var2022 = protoModule.writeString(var2021, var2022, self.kind.value)
			buff = var2021
			var2013 = var2022
		end
	end
	local buff_1 = buffer.create(var2013)
	buffer.copy(buff_1, 0, buff, 0, var2013)
	
	return buff_1
end

function t_59.decode(p120) --[[ line: 10820 ]]
	-- upvalues: t_59 (ref), protoModule (ref), propConditionModule (ref)
	local var2024 = t_59.new()
	local var2025 = 0
	while var2025 < buffer.len(p120) do
		local _ = nil
		local var2026 = nil
		local var2027, var2028, var2029 = protoModule.readTag(p120, var2025)
		local var2030 = var2027
		var2026 = var2028
		var2025 = var2029
		
		if var2026 == protoModule.wireTypes.varint then
			local _ = nil
			local var2031, var2032 = protoModule.readVarInt(p120, var2025)
			local _ = var2031
			var2025 = var2032
			continue
		end
		if var2026 == protoModule.wireTypes.lengthDelimited then
			if var2030 == 1 then
				local _ = nil
				local var2033, var2034 = protoModule.readBuffer(p120, var2025)
				var2025 = var2034
				var2024.condition = propConditionModule.PropCondition.decode(var2033)
			elseif var2030 == 2 then
				local _ = nil
				local var2035, var2036 = protoModule.readBuffer(p120, var2025)
				var2025 = var2036
				var2024.kind = { type = "literal", value = buffer.tostring(var2035) }
			elseif var2030 == 3 then
				local _ = nil
				local var2037, var2038 = protoModule.readBuffer(p120, var2025)
				var2025 = var2038
				var2024.kind = { type = "token", value = buffer.tostring(var2037) }
			elseif var2030 == 4 then
				local _ = nil
				local var2039, var2040 = protoModule.readBuffer(p120, var2025)
				var2025 = var2040
				var2024.kind = { type = "binding_path", value = buffer.tostring(var2039) }
			else
				local _ = nil
				local var2041, var2042 = protoModule.readVarInt(p120, var2025)
				var2025 = var2042 + var2041
			end
		elseif var2026 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2043, var2044 = protoModule.readFixed32(p120, var2025)
			local _ = var2043
			var2025 = var2044
		elseif var2026 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2045, var2046 = protoModule.readFixed64(p120, var2025)
			local _ = var2045
			var2025 = var2046
		else
			error("Unsupported wire type: " .. var2026)
		end
	end
	return var2024
end

function t_59:jsonEncode() --[[ line: 10878 ]]
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

function t_59:jsonDecode() --[[ line: 10898 ]]
	-- upvalues: t_59 (ref), propConditionModule (ref)
	local var2048 = t_59.new()
	
	if self.condition ~= nil then
		var2048.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2048.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2048.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2048.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2048.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2048
end

t_59.descriptor = {
	name = "Vector2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.Vector2Prop_ConditionalOption = t_59
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOption)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p121) --[[ line: 10939 ]]
	-- upvalues: t_60 (ref)
	return setmetatable({
		options = if p121 == nil or p121.options == nil then {} else p121.options
	}, t_60)
end

function t_60:encode() --[[ line: 10947 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2050 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2051 = v:encode()
			local var2052, var2053 = protoModule.writeTag(buff, var2050, 1, protoModule.wireTypes.lengthDelimited)
			var2052, var2053 = protoModule.writeBuffer(var2052, var2053, var2051, buffer.len(var2051))
			buff = var2052
			var2050 = var2053
		end
	end
	local buff_1 = buffer.create(var2050)
	buffer.copy(buff_1, 0, buff, 0, var2050)
	
	return buff_1
end

function t_60.decode(p122) --[[ line: 10964 ]]
	-- upvalues: t_60 (ref), protoModule (ref), t (ref)
	local var2055 = t_60.new()
	local var2056 = 0
	while var2056 < buffer.len(p122) do
		local _ = nil
		local var2057 = nil
		local var2058, var2059, var2060 = protoModule.readTag(p122, var2056)
		local var2061 = var2058
		var2057 = var2059
		var2056 = var2060
		
		if var2057 == protoModule.wireTypes.varint then
			local _ = nil
			local var2062, var2063 = protoModule.readVarInt(p122, var2056)
			local _ = var2062
			var2056 = var2063
			continue
		end
		if var2057 == protoModule.wireTypes.lengthDelimited then
			if var2061 == 1 then
				local _ = nil
				local var2064, var2065 = protoModule.readBuffer(p122, var2056)
				var2056 = var2065
				table.insert(var2055.options, t.Vector2Prop_ConditionalOption.decode(var2064))
			else
				local _ = nil
				local var2066, var2067 = protoModule.readVarInt(p122, var2056)
				var2056 = var2067 + var2066
			end
		elseif var2057 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2068, var2069 = protoModule.readFixed32(p122, var2056)
			local _ = var2068
			var2056 = var2069
		elseif var2057 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2070, var2071 = protoModule.readFixed64(p122, var2056)
			local _ = var2070
			var2056 = var2071
		else
			error("Unsupported wire type: " .. var2057)
		end
	end
	return var2055
end

function t_60:jsonEncode() --[[ line: 11007 ]]
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

function t_60:jsonDecode() --[[ line: 11021 ]]
	-- upvalues: t_60 (ref), t (ref)
	local var2074 = t_60.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.Vector2Prop_ConditionalOption.jsonDecode(v))
		end
		var2074.options = t_1
	end
	return var2074
end

t_60.descriptor = {
	name = "Vector2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.Vector2Prop_ConditionalOptions = t_60
typeRegistryModule.default:register(t.Vector2Prop_ConditionalOptions)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p123) --[[ line: 11050 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		kind = if p123 == nil or p123.kind == nil then nil else p123.kind
	}, t_61)
end

function t_61:encode() --[[ line: 11056 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2077 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2078, var2079 = protoModule.writeTag(buff, var2077, 1, protoModule.wireTypes.lengthDelimited)
			var2078, var2079 = protoModule.writeString(var2078, var2079, self.kind.value)
			buff = var2078
			var2077 = var2079
		elseif self.kind.type == "binding_path" then
			local var2080, var2081 = protoModule.writeTag(buff, var2077, 2, protoModule.wireTypes.lengthDelimited)
			var2080, var2081 = protoModule.writeString(var2080, var2081, self.kind.value)
			buff = var2080
			var2077 = var2081
		elseif self.kind.type == "conditional" then
			local var2082 = self.kind.value:encode()
			local var2083, var2084 = protoModule.writeTag(buff, var2077, 3, protoModule.wireTypes.lengthDelimited)
			var2083, var2084 = protoModule.writeBuffer(var2083, var2084, var2082, buffer.len(var2082))
			buff = var2083
			var2077 = var2084
		end
	end
	local buff_1 = buffer.create(var2077)
	buffer.copy(buff_1, 0, buff, 0, var2077)
	
	return buff_1
end

function t_61.decode(p124) --[[ line: 11079 ]]
	-- upvalues: t_61 (ref), protoModule (ref), t (ref)
	local var2086 = t_61.new()
	local var2087 = 0
	while var2087 < buffer.len(p124) do
		local _ = nil
		local var2088 = nil
		local var2089, var2090, var2091 = protoModule.readTag(p124, var2087)
		local var2092 = var2089
		var2088 = var2090
		var2087 = var2091
		
		if var2088 == protoModule.wireTypes.varint then
			local _ = nil
			local var2093, var2094 = protoModule.readVarInt(p124, var2087)
			local _ = var2093
			var2087 = var2094
			continue
		end
		if var2088 == protoModule.wireTypes.lengthDelimited then
			if var2092 == 1 then
				local _ = nil
				local var2095, var2096 = protoModule.readBuffer(p124, var2087)
				var2087 = var2096
				var2086.kind = { type = "literal", value = buffer.tostring(var2095) }
			elseif var2092 == 2 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p124, var2087)
				var2087 = var2098
				var2086.kind = { type = "binding_path", value = buffer.tostring(var2097) }
			elseif var2092 == 3 then
				local _ = nil
				local var2099, var2100 = protoModule.readBuffer(p124, var2087)
				var2087 = var2100
				var2086.kind = {
					type = "conditional",
					value = t.IconProp_ConditionalOptions.decode(var2099)
				}
			else
				local _ = nil
				local var2101, var2102 = protoModule.readVarInt(p124, var2087)
				var2087 = var2102 + var2101
			end
		elseif var2088 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2103, var2104 = protoModule.readFixed32(p124, var2087)
			local _ = var2103
			var2087 = var2104
		elseif var2088 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2105, var2106 = protoModule.readFixed64(p124, var2087)
			local _ = var2105
			var2087 = var2106
		else
			error("Unsupported wire type: " .. var2088)
		end
	end
	return var2086
end

function t_61:jsonEncode() --[[ line: 11132 ]]
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

function t_61:jsonDecode() --[[ line: 11148 ]]
	-- upvalues: t_61 (ref), t (ref)
	local var2108 = t_61.new()
	
	if self.literal ~= nil then
		var2108.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var2108.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2108.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2108.kind = {
			type = "conditional",
			value = t.IconProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2108
end

t_61.descriptor = {
	name = "IconProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconProp"
}
t.IconProp = t_61
typeRegistryModule.default:register(t.IconProp)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p125) --[[ line: 11185 ]]
	-- upvalues: t_62 (ref)
	return setmetatable({
		condition = if p125 == nil or p125.condition == nil then nil else p125.condition,
		kind = if p125 == nil or p125.kind == nil then nil else p125.kind
	}, t_62)
end

function t_62:encode() --[[ line: 11194 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2110 = 0
	
	if self.condition ~= nil then
		local var2111 = self.condition:encode()
		local var2112, var2113 = protoModule.writeTag(buff, var2110, 1, protoModule.wireTypes.lengthDelimited)
		var2112, var2113 = protoModule.writeBuffer(var2112, var2113, var2111, buffer.len(var2111))
		buff = var2112
		var2110 = var2113
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2114, var2115 = protoModule.writeTag(buff, var2110, 2, protoModule.wireTypes.lengthDelimited)
			var2114, var2115 = protoModule.writeString(var2114, var2115, self.kind.value)
			buff = var2114
			var2110 = var2115
		elseif self.kind.type == "binding_path" then
			local var2116, var2117 = protoModule.writeTag(buff, var2110, 3, protoModule.wireTypes.lengthDelimited)
			var2116, var2117 = protoModule.writeString(var2116, var2117, self.kind.value)
			buff = var2116
			var2110 = var2117
		end
	end
	local buff_1 = buffer.create(var2110)
	buffer.copy(buff_1, 0, buff, 0, var2110)
	
	return buff_1
end

function t_62.decode(p126) --[[ line: 11219 ]]
	-- upvalues: t_62 (ref), protoModule (ref), propConditionModule (ref)
	local var2119 = t_62.new()
	local var2120 = 0
	while var2120 < buffer.len(p126) do
		local _ = nil
		local var2121 = nil
		local var2122, var2123, var2124 = protoModule.readTag(p126, var2120)
		local var2125 = var2122
		var2121 = var2123
		var2120 = var2124
		
		if var2121 == protoModule.wireTypes.varint then
			local _ = nil
			local var2126, var2127 = protoModule.readVarInt(p126, var2120)
			local _ = var2126
			var2120 = var2127
			continue
		end
		if var2121 == protoModule.wireTypes.lengthDelimited then
			if var2125 == 1 then
				local _ = nil
				local var2128, var2129 = protoModule.readBuffer(p126, var2120)
				var2120 = var2129
				var2119.condition = propConditionModule.PropCondition.decode(var2128)
			elseif var2125 == 2 then
				local _ = nil
				local var2130, var2131 = protoModule.readBuffer(p126, var2120)
				var2120 = var2131
				var2119.kind = { type = "literal", value = buffer.tostring(var2130) }
			elseif var2125 == 3 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p126, var2120)
				var2120 = var2133
				var2119.kind = { type = "binding_path", value = buffer.tostring(var2132) }
			else
				local _ = nil
				local var2134, var2135 = protoModule.readVarInt(p126, var2120)
				var2120 = var2135 + var2134
			end
		elseif var2121 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2136, var2137 = protoModule.readFixed32(p126, var2120)
			local _ = var2136
			var2120 = var2137
		elseif var2121 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2138, var2139 = protoModule.readFixed64(p126, var2120)
			local _ = var2138
			var2120 = var2139
		else
			error("Unsupported wire type: " .. var2121)
		end
	end
	return var2119
end

function t_62:jsonEncode() --[[ line: 11272 ]]
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

function t_62:jsonDecode() --[[ line: 11290 ]]
	-- upvalues: t_62 (ref), propConditionModule (ref)
	local var2141 = t_62.new()
	
	if self.condition ~= nil then
		var2141.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2141.kind = { type = "literal", value = self.literal }
	end
	if self.binding_path ~= nil then
		var2141.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2141.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2141
end

t_62.descriptor = {
	name = "IconProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.IconProp_ConditionalOption = t_62
typeRegistryModule.default:register(t.IconProp_ConditionalOption)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p127) --[[ line: 11327 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		options = if p127 == nil or p127.options == nil then {} else p127.options
	}, t_63)
end

function t_63:encode() --[[ line: 11335 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2143 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2144 = v:encode()
			local var2145, var2146 = protoModule.writeTag(buff, var2143, 1, protoModule.wireTypes.lengthDelimited)
			var2145, var2146 = protoModule.writeBuffer(var2145, var2146, var2144, buffer.len(var2144))
			buff = var2145
			var2143 = var2146
		end
	end
	local buff_1 = buffer.create(var2143)
	buffer.copy(buff_1, 0, buff, 0, var2143)
	
	return buff_1
end

function t_63.decode(p128) --[[ line: 11352 ]]
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2148 = t_63.new()
	local var2149 = 0
	while var2149 < buffer.len(p128) do
		local _ = nil
		local var2150 = nil
		local var2151, var2152, var2153 = protoModule.readTag(p128, var2149)
		local var2154 = var2151
		var2150 = var2152
		var2149 = var2153
		
		if var2150 == protoModule.wireTypes.varint then
			local _ = nil
			local var2155, var2156 = protoModule.readVarInt(p128, var2149)
			local _ = var2155
			var2149 = var2156
			continue
		end
		if var2150 == protoModule.wireTypes.lengthDelimited then
			if var2154 == 1 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p128, var2149)
				var2149 = var2158
				table.insert(var2148.options, t.IconProp_ConditionalOption.decode(var2157))
			else
				local _ = nil
				local var2159, var2160 = protoModule.readVarInt(p128, var2149)
				var2149 = var2160 + var2159
			end
		elseif var2150 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2161, var2162 = protoModule.readFixed32(p128, var2149)
			local _ = var2161
			var2149 = var2162
		elseif var2150 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2163, var2164 = protoModule.readFixed64(p128, var2149)
			local _ = var2163
			var2149 = var2164
		else
			error("Unsupported wire type: " .. var2150)
		end
	end
	return var2148
end

function t_63:jsonEncode() --[[ line: 11395 ]]
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

function t_63:jsonDecode() --[[ line: 11409 ]]
	-- upvalues: t_63 (ref), t (ref)
	local var2167 = t_63.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.IconProp_ConditionalOption.jsonDecode(v))
		end
		var2167.options = t_1
	end
	return var2167
end

t_63.descriptor = {
	name = "IconProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.IconProp_ConditionalOptions = t_63
typeRegistryModule.default:register(t.IconProp_ConditionalOptions)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p129) --[[ line: 11438 ]]
	-- upvalues: t_64 (ref)
	return setmetatable({
		kind = if p129 == nil or p129.kind == nil then nil else p129.kind
	}, t_64)
end

function t_64:encode() --[[ line: 11444 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2170 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2171 = self.kind.value:encode()
			local var2172, var2173 = protoModule.writeTag(buff, var2170, 1, protoModule.wireTypes.lengthDelimited)
			var2172, var2173 = protoModule.writeBuffer(var2172, var2173, var2171, buffer.len(var2171))
			buff = var2172
			var2170 = var2173
		elseif self.kind.type == "binding_path" then
			local var2174, var2175 = protoModule.writeTag(buff, var2170, 2, protoModule.wireTypes.lengthDelimited)
			var2174, var2175 = protoModule.writeString(var2174, var2175, self.kind.value)
			buff = var2174
			var2170 = var2175
		elseif self.kind.type == "conditional" then
			local var2176 = self.kind.value:encode()
			local var2177, var2178 = protoModule.writeTag(buff, var2170, 3, protoModule.wireTypes.lengthDelimited)
			var2177, var2178 = protoModule.writeBuffer(var2177, var2178, var2176, buffer.len(var2176))
			buff = var2177
			var2170 = var2178
		end
	end
	local buff_1 = buffer.create(var2170)
	buffer.copy(buff_1, 0, buff, 0, var2170)
	
	return buff_1
end

function t_64.decode(p130) --[[ line: 11468 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2180 = t_64.new()
	local var2181 = 0
	while var2181 < buffer.len(p130) do
		local _ = nil
		local var2182 = nil
		local var2183, var2184, var2185 = protoModule.readTag(p130, var2181)
		local var2186 = var2183
		var2182 = var2184
		var2181 = var2185
		
		if var2182 == protoModule.wireTypes.varint then
			local _ = nil
			local var2187, var2188 = protoModule.readVarInt(p130, var2181)
			local _ = var2187
			var2181 = var2188
			continue
		end
		if var2182 == protoModule.wireTypes.lengthDelimited then
			if var2186 == 1 then
				local _ = nil
				local var2189, var2190 = protoModule.readBuffer(p130, var2181)
				var2181 = var2190
				var2180.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var2189)
				}
			elseif var2186 == 2 then
				local _ = nil
				local var2191, var2192 = protoModule.readBuffer(p130, var2181)
				var2181 = var2192
				var2180.kind = { type = "binding_path", value = buffer.tostring(var2191) }
			elseif var2186 == 3 then
				local _ = nil
				local var2193, var2194 = protoModule.readBuffer(p130, var2181)
				var2181 = var2194
				var2180.kind = {
					type = "conditional",
					value = t.FoundationIconConfigProp_ConditionalOptions.decode(var2193)
				}
			else
				local _ = nil
				local var2195, var2196 = protoModule.readVarInt(p130, var2181)
				var2181 = var2196 + var2195
			end
		elseif var2182 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2197, var2198 = protoModule.readFixed32(p130, var2181)
			local _ = var2197
			var2181 = var2198
		elseif var2182 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2199, var2200 = protoModule.readFixed64(p130, var2181)
			local _ = var2199
			var2181 = var2200
		else
			error("Unsupported wire type: " .. var2182)
		end
	end
	return var2180
end

function t_64:jsonEncode() --[[ line: 11527 ]]
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

function t_64:jsonDecode() --[[ line: 11543 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2202 = t_64.new()
	
	if self.literal ~= nil then
		var2202.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2202.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2202.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2202.kind = {
			type = "conditional",
			value = t.FoundationIconConfigProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2202
end

t_64.descriptor = {
	name = "FoundationIconConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfigProp"
}
t.FoundationIconConfigProp = t_64
typeRegistryModule.default:register(t.FoundationIconConfigProp)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p131) --[[ line: 11585 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		condition = if p131 == nil or p131.condition == nil then nil else p131.condition,
		kind = if p131 == nil or p131.kind == nil then nil else p131.kind
	}, t_65)
end

function t_65:encode() --[[ line: 11594 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2204 = 0
	
	if self.condition ~= nil then
		local var2205 = self.condition:encode()
		local var2206, var2207 = protoModule.writeTag(buff, var2204, 1, protoModule.wireTypes.lengthDelimited)
		var2206, var2207 = protoModule.writeBuffer(var2206, var2207, var2205, buffer.len(var2205))
		buff = var2206
		var2204 = var2207
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2208 = self.kind.value:encode()
			local var2209, var2210 = protoModule.writeTag(buff, var2204, 2, protoModule.wireTypes.lengthDelimited)
			var2209, var2210 = protoModule.writeBuffer(var2209, var2210, var2208, buffer.len(var2208))
			buff = var2209
			var2204 = var2210
		elseif self.kind.type == "binding_path" then
			local var2211, var2212 = protoModule.writeTag(buff, var2204, 3, protoModule.wireTypes.lengthDelimited)
			var2211, var2212 = protoModule.writeString(var2211, var2212, self.kind.value)
			buff = var2211
			var2204 = var2212
		end
	end
	local buff_1 = buffer.create(var2204)
	buffer.copy(buff_1, 0, buff, 0, var2204)
	
	return buff_1
end

function t_65.decode(p132) --[[ line: 11622 ]]
	-- upvalues: t_65 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2214 = t_65.new()
	local var2215 = 0
	while var2215 < buffer.len(p132) do
		local _ = nil
		local var2216 = nil
		local var2217, var2218, var2219 = protoModule.readTag(p132, var2215)
		local var2220 = var2217
		var2216 = var2218
		var2215 = var2219
		
		if var2216 == protoModule.wireTypes.varint then
			local _ = nil
			local var2221, var2222 = protoModule.readVarInt(p132, var2215)
			local _ = var2221
			var2215 = var2222
			continue
		end
		if var2216 == protoModule.wireTypes.lengthDelimited then
			if var2220 == 1 then
				local _ = nil
				local var2223, var2224 = protoModule.readBuffer(p132, var2215)
				var2215 = var2224
				var2214.condition = propConditionModule.PropCondition.decode(var2223)
			elseif var2220 == 2 then
				local _ = nil
				local var2225, var2226 = protoModule.readBuffer(p132, var2215)
				var2215 = var2226
				var2214.kind = {
					type = "literal",
					value = t.FoundationIconConfigProp_FoundationIconConfig.decode(var2225)
				}
			elseif var2220 == 3 then
				local _ = nil
				local var2227, var2228 = protoModule.readBuffer(p132, var2215)
				var2215 = var2228
				var2214.kind = { type = "binding_path", value = buffer.tostring(var2227) }
			else
				local _ = nil
				local var2229, var2230 = protoModule.readVarInt(p132, var2215)
				var2215 = var2230 + var2229
			end
		elseif var2216 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2231, var2232 = protoModule.readFixed32(p132, var2215)
			local _ = var2231
			var2215 = var2232
		elseif var2216 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2233, var2234 = protoModule.readFixed64(p132, var2215)
			local _ = var2233
			var2215 = var2234
		else
			error("Unsupported wire type: " .. var2216)
		end
	end
	return var2214
end

function t_65:jsonEncode() --[[ line: 11680 ]]
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

function t_65:jsonDecode() --[[ line: 11700 ]]
	-- upvalues: t_65 (ref), propConditionModule (ref), t (ref)
	local var2236 = t_65.new()
	
	if self.condition ~= nil then
		var2236.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2236.kind = {
			type = "literal",
			value = t.FoundationIconConfigProp_FoundationIconConfig.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2236.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2236.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2236
end

t_65.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.FoundationIconConfigProp_ConditionalOption = t_65
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOption)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p133) --[[ line: 11742 ]]
	-- upvalues: t_66 (ref)
	return setmetatable({
		options = if p133 == nil or p133.options == nil then {} else p133.options
	}, t_66)
end

function t_66:encode() --[[ line: 11750 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2238 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2239 = v:encode()
			local var2240, var2241 = protoModule.writeTag(buff, var2238, 1, protoModule.wireTypes.lengthDelimited)
			var2240, var2241 = protoModule.writeBuffer(var2240, var2241, var2239, buffer.len(var2239))
			buff = var2240
			var2238 = var2241
		end
	end
	local buff_1 = buffer.create(var2238)
	buffer.copy(buff_1, 0, buff, 0, var2238)
	
	return buff_1
end

function t_66.decode(p134) --[[ line: 11769 ]]
	-- upvalues: t_66 (ref), protoModule (ref), t (ref)
	local var2243 = t_66.new()
	local var2244 = 0
	while var2244 < buffer.len(p134) do
		local _ = nil
		local var2245 = nil
		local var2246, var2247, var2248 = protoModule.readTag(p134, var2244)
		local var2249 = var2246
		var2245 = var2247
		var2244 = var2248
		
		if var2245 == protoModule.wireTypes.varint then
			local _ = nil
			local var2250, var2251 = protoModule.readVarInt(p134, var2244)
			local _ = var2250
			var2244 = var2251
			continue
		end
		if var2245 == protoModule.wireTypes.lengthDelimited then
			if var2249 == 1 then
				local _ = nil
				local var2252, var2253 = protoModule.readBuffer(p134, var2244)
				var2244 = var2253
				table.insert(var2243.options, t.FoundationIconConfigProp_ConditionalOption.decode(var2252))
			else
				local _ = nil
				local var2254, var2255 = protoModule.readVarInt(p134, var2244)
				var2244 = var2255 + var2254
			end
		elseif var2245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2256, var2257 = protoModule.readFixed32(p134, var2244)
			local _ = var2256
			var2244 = var2257
		elseif var2245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2258, var2259 = protoModule.readFixed64(p134, var2244)
			local _ = var2258
			var2244 = var2259
		else
			error("Unsupported wire type: " .. var2245)
		end
	end
	return var2243
end

function t_66:jsonEncode() --[[ line: 11814 ]]
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

function t_66:jsonDecode() --[[ line: 11830 ]]
	-- upvalues: t_66 (ref), t (ref)
	local var2262 = t_66.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FoundationIconConfigProp_ConditionalOption.jsonDecode(v))
		end
		var2262.options = t_1
	end
	return var2262
end

t_66.descriptor = {
	name = "FoundationIconConfigProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.FoundationIconConfigProp_ConditionalOptions = t_66
typeRegistryModule.default:register(t.FoundationIconConfigProp_ConditionalOptions)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p135) --[[ line: 11861 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		name = if p135 == nil or p135.name == nil then nil else p135.name,
		variant = if p135 == nil or p135.variant == nil then nil else p135.variant
	}, t_67)
end

function t_67:encode() --[[ line: 11870 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2265 = 0
	
	if self.name ~= nil then
		local var2266 = self.name:encode()
		local var2267, var2268 = protoModule.writeTag(buff, var2265, 1, protoModule.wireTypes.lengthDelimited)
		var2267, var2268 = protoModule.writeBuffer(var2267, var2268, var2266, buffer.len(var2266))
		buff = var2267
		var2265 = var2268
	end
	if self.variant ~= nil then
		local var2269 = self.variant:encode()
		local var2270, var2271 = protoModule.writeTag(buff, var2265, 2, protoModule.wireTypes.lengthDelimited)
		var2270, var2271 = protoModule.writeBuffer(var2270, var2271, var2269, buffer.len(var2269))
		buff = var2270
		var2265 = var2271
	end
	local buff_1 = buffer.create(var2265)
	buffer.copy(buff_1, 0, buff, 0, var2265)
	
	return buff_1
end

function t_67.decode(p136) --[[ line: 11893 ]]
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var2273 = t_67.new()
	local var2274 = 0
	while var2274 < buffer.len(p136) do
		local _ = nil
		local var2275 = nil
		local var2276, var2277, var2278 = protoModule.readTag(p136, var2274)
		local var2279 = var2276
		var2275 = var2277
		var2274 = var2278
		
		if var2275 == protoModule.wireTypes.varint then
			local _ = nil
			local var2280, var2281 = protoModule.readVarInt(p136, var2274)
			local _ = var2280
			var2274 = var2281
			continue
		end
		if var2275 == protoModule.wireTypes.lengthDelimited then
			if var2279 == 1 then
				local _ = nil
				local var2282, var2283 = protoModule.readBuffer(p136, var2274)
				var2274 = var2283
				var2273.name = t.StringProp.decode(var2282)
			elseif var2279 == 2 then
				local _ = nil
				local var2284, var2285 = protoModule.readBuffer(p136, var2274)
				var2274 = var2285
				var2273.variant = t.StringProp.decode(var2284)
			else
				local _ = nil
				local var2286, var2287 = protoModule.readVarInt(p136, var2274)
				var2274 = var2287 + var2286
			end
		elseif var2275 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2288, var2289 = protoModule.readFixed32(p136, var2274)
			local _ = var2288
			var2274 = var2289
		elseif var2275 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2290, var2291 = protoModule.readFixed64(p136, var2274)
			local _ = var2290
			var2274 = var2291
		else
			error("Unsupported wire type: " .. var2275)
		end
	end
	return var2273
end

function t_67:jsonEncode() --[[ line: 11943 ]]
	local t = {}
	
	if self.name ~= nil then
		t.name = self.name:jsonEncode()
	end
	if self.variant ~= nil then
		t.variant = self.variant:jsonEncode()
	end
	return t
end

function t_67:jsonDecode() --[[ line: 11959 ]]
	-- upvalues: t_67 (ref), t (ref)
	local var2293 = t_67.new()
	
	if self.name ~= nil then
		var2293.name = t.StringProp.jsonDecode(self.name)
	end
	if self.variant ~= nil then
		var2293.variant = t.StringProp.jsonDecode(self.variant)
	end
	return var2293
end

t_67.descriptor = {
	name = "FoundationIconConfigProp_FoundationIconConfig",
	fullName = "roblox.apppageplatform.shared.v1beta1.FoundationIconConfig"
}
t.FoundationIconConfigProp_FoundationIconConfig = t_67
typeRegistryModule.default:register(t.FoundationIconConfigProp_FoundationIconConfig)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p137) --[[ line: 11989 ]]
	-- upvalues: t_68 (ref)
	return setmetatable({
		oneof_prop = if p137 == nil or p137.oneof_prop == nil then nil else p137.oneof_prop
	}, t_68)
end

function t_68:encode() --[[ line: 11995 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2295 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "string_prop" then
			local var2296 = self.oneof_prop.value:encode()
			local var2297, var2298 = protoModule.writeTag(buff, var2295, 1, protoModule.wireTypes.lengthDelimited)
			var2297, var2298 = protoModule.writeBuffer(var2297, var2298, var2296, buffer.len(var2296))
			buff = var2297
			var2295 = var2298
		elseif self.oneof_prop.type == "int32_prop" then
			local var2299 = self.oneof_prop.value:encode()
			local var2300, var2301 = protoModule.writeTag(buff, var2295, 2, protoModule.wireTypes.lengthDelimited)
			var2300, var2301 = protoModule.writeBuffer(var2300, var2301, var2299, buffer.len(var2299))
			buff = var2300
			var2295 = var2301
		end
	end
	local buff_1 = buffer.create(var2295)
	buffer.copy(buff_1, 0, buff, 0, var2295)
	
	return buff_1
end

function t_68.decode(p138) --[[ line: 12016 ]]
	-- upvalues: t_68 (ref), protoModule (ref), t (ref)
	local var2303 = t_68.new()
	local var2304 = 0
	while var2304 < buffer.len(p138) do
		local _ = nil
		local var2305 = nil
		local var2306, var2307, var2308 = protoModule.readTag(p138, var2304)
		local var2309 = var2306
		var2305 = var2307
		var2304 = var2308
		
		if var2305 == protoModule.wireTypes.varint then
			local _ = nil
			local var2310, var2311 = protoModule.readVarInt(p138, var2304)
			local _ = var2310
			var2304 = var2311
			continue
		end
		if var2305 == protoModule.wireTypes.lengthDelimited then
			if var2309 == 1 then
				local _ = nil
				local var2312, var2313 = protoModule.readBuffer(p138, var2304)
				var2304 = var2313
				var2303.oneof_prop = {
					type = "string_prop",
					value = t.StringProp.decode(var2312)
				}
			elseif var2309 == 2 then
				local _ = nil
				local var2314, var2315 = protoModule.readBuffer(p138, var2304)
				var2304 = var2315
				var2303.oneof_prop = { type = "int32_prop", value = t.Int32Prop.decode(var2314) }
			else
				local _ = nil
				local var2316, var2317 = protoModule.readVarInt(p138, var2304)
				var2304 = var2317 + var2316
			end
		elseif var2305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2318, var2319 = protoModule.readFixed32(p138, var2304)
			local _ = var2318
			var2304 = var2319
		elseif var2305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2320, var2321 = protoModule.readFixed64(p138, var2304)
			local _ = var2320
			var2304 = var2321
		else
			error("Unsupported wire type: " .. var2305)
		end
	end
	return var2303
end

function t_68:jsonEncode() --[[ line: 12064 ]]
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

function t_68:jsonDecode() --[[ line: 12078 ]]
	-- upvalues: t_68 (ref), t (ref)
	local var2323 = t_68.new()
	
	if self.string_prop ~= nil then
		var2323.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.string_prop)
		}
	end
	if self.stringProp ~= nil then
		var2323.oneof_prop = {
			type = "string_prop",
			value = t.StringProp.jsonDecode(self.stringProp)
		}
	end
	if self.int32_prop ~= nil then
		var2323.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32_prop)
		}
	end
	if self.int32Prop ~= nil then
		var2323.oneof_prop = {
			type = "int32_prop",
			value = t.Int32Prop.jsonDecode(self.int32Prop)
		}
	end
	return var2323
end

t_68.descriptor = {
	name = "IconSizeProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.IconSizeProp"
}
t.IconSizeProp = t_68
typeRegistryModule.default:register(t.IconSizeProp)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p139) --[[ line: 12114 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		kind = if p139 == nil or p139.kind == nil then nil else p139.kind
	}, t_69)
end

function t_69:encode() --[[ line: 12120 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2325 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2326 = self.kind.value:encode()
			local var2327, var2328 = protoModule.writeTag(buff, var2325, 1, protoModule.wireTypes.lengthDelimited)
			var2327, var2328 = protoModule.writeBuffer(var2327, var2328, var2326, buffer.len(var2326))
			buff = var2327
			var2325 = var2328
		elseif self.kind.type == "conditional" then
			local var2329 = self.kind.value:encode()
			local var2330, var2331 = protoModule.writeTag(buff, var2325, 2, protoModule.wireTypes.lengthDelimited)
			var2330, var2331 = protoModule.writeBuffer(var2330, var2331, var2329, buffer.len(var2329))
			buff = var2330
			var2325 = var2331
		end
	end
	local buff_1 = buffer.create(var2325)
	buffer.copy(buff_1, 0, buff, 0, var2325)
	
	return buff_1
end

function t_69.decode(p140) --[[ line: 12141 ]]
	-- upvalues: t_69 (ref), protoModule (ref), t (ref)
	local var2333 = t_69.new()
	local var2334 = 0
	while var2334 < buffer.len(p140) do
		local _ = nil
		local var2335 = nil
		local var2336, var2337, var2338 = protoModule.readTag(p140, var2334)
		local var2339 = var2336
		var2335 = var2337
		var2334 = var2338
		
		if var2335 == protoModule.wireTypes.varint then
			local _ = nil
			local var2340, var2341 = protoModule.readVarInt(p140, var2334)
			local _ = var2340
			var2334 = var2341
			continue
		end
		if var2335 == protoModule.wireTypes.lengthDelimited then
			if var2339 == 1 then
				local _ = nil
				local var2342, var2343 = protoModule.readBuffer(p140, var2334)
				var2334 = var2343
				var2333.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var2342)
				}
			elseif var2339 == 2 then
				local _ = nil
				local var2344, var2345 = protoModule.readBuffer(p140, var2334)
				var2334 = var2345
				var2333.kind = {
					type = "conditional",
					value = t.GradientProp_ConditionalOptions.decode(var2344)
				}
			else
				local _ = nil
				local var2346, var2347 = protoModule.readVarInt(p140, var2334)
				var2334 = var2347 + var2346
			end
		elseif var2335 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2348, var2349 = protoModule.readFixed32(p140, var2334)
			local _ = var2348
			var2334 = var2349
		elseif var2335 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2350, var2351 = protoModule.readFixed64(p140, var2334)
			local _ = var2350
			var2334 = var2351
		else
			error("Unsupported wire type: " .. var2335)
		end
	end
	return var2333
end

function t_69:jsonEncode() --[[ line: 12189 ]]
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

function t_69:jsonDecode() --[[ line: 12203 ]]
	-- upvalues: t_69 (ref), t (ref)
	local var2353 = t_69.new()
	
	if self.literal ~= nil then
		var2353.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	if self.conditional ~= nil then
		var2353.kind = {
			type = "conditional",
			value = t.GradientProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2353
end

t_69.descriptor = {
	name = "GradientProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientProp"
}
t.GradientProp = t_69
typeRegistryModule.default:register(t.GradientProp)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p141) --[[ line: 12232 ]]
	-- upvalues: t_70 (ref)
	return setmetatable({
		condition = if p141 == nil or p141.condition == nil then nil else p141.condition,
		kind = if p141 == nil or p141.kind == nil then nil else p141.kind
	}, t_70)
end

function t_70:encode() --[[ line: 12241 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2355 = 0
	
	if self.condition ~= nil then
		local var2356 = self.condition:encode()
		local var2357, var2358 = protoModule.writeTag(buff, var2355, 1, protoModule.wireTypes.lengthDelimited)
		var2357, var2358 = protoModule.writeBuffer(var2357, var2358, var2356, buffer.len(var2356))
		buff = var2357
		var2355 = var2358
	end
	if self.kind ~= nil and self.kind.type == "literal" then
		local var2359 = self.kind.value:encode()
		local var2360, var2361 = protoModule.writeTag(buff, var2355, 2, protoModule.wireTypes.lengthDelimited)
		var2360, var2361 = protoModule.writeBuffer(var2360, var2361, var2359, buffer.len(var2359))
		buff = var2360
		var2355 = var2361
	end
	local buff_1 = buffer.create(var2355)
	buffer.copy(buff_1, 0, buff, 0, var2355)
	
	return buff_1
end

function t_70.decode(p142) --[[ line: 12264 ]]
	-- upvalues: t_70 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2363 = t_70.new()
	local var2364 = 0
	while var2364 < buffer.len(p142) do
		local _ = nil
		local var2365 = nil
		local var2366, var2367, var2368 = protoModule.readTag(p142, var2364)
		local var2369 = var2366
		var2365 = var2367
		var2364 = var2368
		
		if var2365 == protoModule.wireTypes.varint then
			local _ = nil
			local var2370, var2371 = protoModule.readVarInt(p142, var2364)
			local _ = var2370
			var2364 = var2371
			continue
		end
		if var2365 == protoModule.wireTypes.lengthDelimited then
			if var2369 == 1 then
				local _ = nil
				local var2372, var2373 = protoModule.readBuffer(p142, var2364)
				var2364 = var2373
				var2363.condition = propConditionModule.PropCondition.decode(var2372)
			elseif var2369 == 2 then
				local _ = nil
				local var2374, var2375 = protoModule.readBuffer(p142, var2364)
				var2364 = var2375
				var2363.kind = {
					type = "literal",
					value = t.GradientProp_GradientData.decode(var2374)
				}
			else
				local _ = nil
				local var2376, var2377 = protoModule.readVarInt(p142, var2364)
				var2364 = var2377 + var2376
			end
		elseif var2365 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2378, var2379 = protoModule.readFixed32(p142, var2364)
			local _ = var2378
			var2364 = var2379
		elseif var2365 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2380, var2381 = protoModule.readFixed64(p142, var2364)
			local _ = var2380
			var2364 = var2381
		else
			error("Unsupported wire type: " .. var2365)
		end
	end
	return var2363
end

function t_70:jsonEncode() --[[ line: 12312 ]]
	local t = {}
	
	if self.condition ~= nil then
		t.condition = self.condition:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "literal" then
		t.literal = self.kind.value:jsonEncode()
	end
	return t
end

function t_70:jsonDecode() --[[ line: 12328 ]]
	-- upvalues: t_70 (ref), propConditionModule (ref), t (ref)
	local var2383 = t_70.new()
	
	if self.condition ~= nil then
		var2383.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2383.kind = {
			type = "literal",
			value = t.GradientProp_GradientData.jsonDecode(self.literal)
		}
	end
	return var2383
end

t_70.descriptor = {
	name = "GradientProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.GradientProp_ConditionalOption = t_70
typeRegistryModule.default:register(t.GradientProp_ConditionalOption)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p143) --[[ line: 12357 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		options = if p143 == nil or p143.options == nil then {} else p143.options
	}, t_71)
end

function t_71:encode() --[[ line: 12365 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2385 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2386 = v:encode()
			local var2387, var2388 = protoModule.writeTag(buff, var2385, 1, protoModule.wireTypes.lengthDelimited)
			var2387, var2388 = protoModule.writeBuffer(var2387, var2388, var2386, buffer.len(var2386))
			buff = var2387
			var2385 = var2388
		end
	end
	local buff_1 = buffer.create(var2385)
	buffer.copy(buff_1, 0, buff, 0, var2385)
	
	return buff_1
end

function t_71.decode(p144) --[[ line: 12382 ]]
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2390 = t_71.new()
	local var2391 = 0
	while var2391 < buffer.len(p144) do
		local _ = nil
		local var2392 = nil
		local var2393, var2394, var2395 = protoModule.readTag(p144, var2391)
		local var2396 = var2393
		var2392 = var2394
		var2391 = var2395
		
		if var2392 == protoModule.wireTypes.varint then
			local _ = nil
			local var2397, var2398 = protoModule.readVarInt(p144, var2391)
			local _ = var2397
			var2391 = var2398
			continue
		end
		if var2392 == protoModule.wireTypes.lengthDelimited then
			if var2396 == 1 then
				local _ = nil
				local var2399, var2400 = protoModule.readBuffer(p144, var2391)
				var2391 = var2400
				table.insert(var2390.options, t.GradientProp_ConditionalOption.decode(var2399))
			else
				local _ = nil
				local var2401, var2402 = protoModule.readVarInt(p144, var2391)
				var2391 = var2402 + var2401
			end
		elseif var2392 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2403, var2404 = protoModule.readFixed32(p144, var2391)
			local _ = var2403
			var2391 = var2404
		elseif var2392 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2405, var2406 = protoModule.readFixed64(p144, var2391)
			local _ = var2405
			var2391 = var2406
		else
			error("Unsupported wire type: " .. var2392)
		end
	end
	return var2390
end

function t_71:jsonEncode() --[[ line: 12425 ]]
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

function t_71:jsonDecode() --[[ line: 12439 ]]
	-- upvalues: t_71 (ref), t (ref)
	local var2409 = t_71.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.GradientProp_ConditionalOption.jsonDecode(v))
		end
		var2409.options = t_1
	end
	return var2409
end

t_71.descriptor = {
	name = "GradientProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.GradientProp_ConditionalOptions = t_71
typeRegistryModule.default:register(t.GradientProp_ConditionalOptions)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p145) --[[ line: 12468 ]]
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

function t_72:encode() --[[ line: 12481 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2412 = 0
	
	if self.start_color ~= nil and self.start_color ~= "" then
		local var2413, var2414 = protoModule.writeTag(buff, var2412, 1, protoModule.wireTypes.lengthDelimited)
		var2413, var2414 = protoModule.writeString(var2413, var2414, self.start_color)
		buff = var2413
		var2412 = var2414
	end
	if self.end_color ~= nil and self.end_color ~= "" then
		local var2415, var2416 = protoModule.writeTag(buff, var2412, 2, protoModule.wireTypes.lengthDelimited)
		var2415, var2416 = protoModule.writeString(var2415, var2416, self.end_color)
		buff = var2415
		var2412 = var2416
	end
	if self.start_opacity ~= nil and self.start_opacity ~= 0 then
		local var2417, var2418 = protoModule.writeTag(buff, var2412, 3, protoModule.wireTypes.i32)
		var2417, var2418 = protoModule.writeFloat(var2417, var2418, self.start_opacity)
		buff = var2417
		var2412 = var2418
	end
	if self.end_opacity ~= nil and self.end_opacity ~= 0 then
		local var2419, var2420 = protoModule.writeTag(buff, var2412, 4, protoModule.wireTypes.i32)
		var2419, var2420 = protoModule.writeFloat(var2419, var2420, self.end_opacity)
		buff = var2419
		var2412 = var2420
	end
	if self.degree ~= nil and self.degree ~= 0 then
		local var2421, var2422 = protoModule.writeTag(buff, var2412, 5, protoModule.wireTypes.varint)
		var2421, var2422 = protoModule.writeVarInt(var2421, var2422, self.degree)
		buff = var2421
		var2412 = var2422
	end
	if self.midpoint_percent ~= nil and self.midpoint_percent ~= 0 then
		local var2423, var2424 = protoModule.writeTag(buff, var2412, 6, protoModule.wireTypes.i32)
		var2423, var2424 = protoModule.writeFloat(var2423, var2424, self.midpoint_percent)
		buff = var2423
		var2412 = var2424
	end
	local buff_1 = buffer.create(var2412)
	buffer.copy(buff_1, 0, buff, 0, var2412)
	
	return buff_1
end

function t_72.decode(p146) --[[ line: 12520 ]]
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2426 = t_72.new()
	local var2427 = 0
	while var2427 < buffer.len(p146) do
		local _ = nil
		local var2428 = nil
		local var2429, var2430, var2431 = protoModule.readTag(p146, var2427)
		local var2432 = var2429
		var2428 = var2430
		var2427 = var2431
		
		if var2428 == protoModule.wireTypes.varint then
			if var2432 == 5 then
				local _ = nil
				local var2433, var2434 = protoModule.readVarIntI32(p146, var2427)
				var2427 = var2434
				var2426.degree = var2433
			else
				local _ = nil
				local var2435, var2436 = protoModule.readVarInt(p146, var2427)
				local _ = var2435
				var2427 = var2436
			end
		end
		if var2428 == protoModule.wireTypes.lengthDelimited then
			if var2432 == 1 then
				local _ = nil
				local var2437, var2438 = protoModule.readBuffer(p146, var2427)
				var2427 = var2438
				var2426.start_color = buffer.tostring(var2437)
			elseif var2432 == 2 then
				local _ = nil
				local var2439, var2440 = protoModule.readBuffer(p146, var2427)
				var2427 = var2440
				var2426.end_color = buffer.tostring(var2439)
			else
				local _ = nil
				local var2441, var2442 = protoModule.readVarInt(p146, var2427)
				var2427 = var2442 + var2441
			end
		elseif var2428 == protoModule.wireTypes.i32 then
			if var2432 == 3 then
				local _ = nil
				local var2443, var2444 = protoModule.readFloat(p146, var2427)
				var2427 = var2444
				var2426.start_opacity = var2443
			elseif var2432 == 4 then
				local _ = nil
				local var2445, var2446 = protoModule.readFloat(p146, var2427)
				var2427 = var2446
				var2426.end_opacity = var2445
			elseif var2432 == 6 then
				local _ = nil
				local var2447, var2448 = protoModule.readFloat(p146, var2427)
				var2427 = var2448
				var2426.midpoint_percent = var2447
			else
				local _ = nil
				local var2449, var2450 = protoModule.readFixed32(p146, var2427)
				local _ = var2449
				var2427 = var2450
			end
		elseif var2428 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2451, var2452 = protoModule.readFixed64(p146, var2427)
			local _ = var2451
			var2427 = var2452
		else
			error("Unsupported wire type: " .. var2428)
		end
	end
	return var2426
end

function t_72:jsonEncode() --[[ line: 12588 ]]
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

function t_72:jsonDecode() --[[ line: 12618 ]]
	-- upvalues: t_72 (ref), protoModule (ref)
	local var2454 = t_72.new()
	
	if self.start_color ~= nil then
		var2454.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var2454.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var2454.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var2454.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var2454.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var2454.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var2454.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var2454.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var2454.degree = self.degree
	end
	if self.midpoint_percent ~= nil then
		var2454.midpoint_percent = protoModule.json.deserializeNumber(self.midpoint_percent)
	end
	if self.midpointPercent ~= nil then
		var2454.midpoint_percent = protoModule.json.deserializeNumber(self.midpointPercent)
	end
	return var2454
end

t_72.descriptor = {
	name = "GradientProp_GradientData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GradientData"
}
t.GradientProp_GradientData = t_72
typeRegistryModule.default:register(t.GradientProp_GradientData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p147) --[[ line: 12682 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		kind = if p147 == nil or p147.kind == nil then nil else p147.kind
	}, t_73)
end

function t_73:encode() --[[ line: 12688 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2456 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2457 = self.kind.value:encode()
			local var2458, var2459 = protoModule.writeTag(buff, var2456, 1, protoModule.wireTypes.lengthDelimited)
			var2458, var2459 = protoModule.writeBuffer(var2458, var2459, var2457, buffer.len(var2457))
			buff = var2458
			var2456 = var2459
		elseif self.kind.type == "binding_path" then
			local var2460, var2461 = protoModule.writeTag(buff, var2456, 2, protoModule.wireTypes.lengthDelimited)
			var2460, var2461 = protoModule.writeString(var2460, var2461, self.kind.value)
			buff = var2460
			var2456 = var2461
		elseif self.kind.type == "conditional" then
			local var2462 = self.kind.value:encode()
			local var2463, var2464 = protoModule.writeTag(buff, var2456, 3, protoModule.wireTypes.lengthDelimited)
			var2463, var2464 = protoModule.writeBuffer(var2463, var2464, var2462, buffer.len(var2462))
			buff = var2463
			var2456 = var2464
		end
	end
	local buff_1 = buffer.create(var2456)
	buffer.copy(buff_1, 0, buff, 0, var2456)
	
	return buff_1
end

function t_73.decode(p148) --[[ line: 12712 ]]
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2466 = t_73.new()
	local var2467 = 0
	while var2467 < buffer.len(p148) do
		local _ = nil
		local var2468 = nil
		local var2469, var2470, var2471 = protoModule.readTag(p148, var2467)
		local var2472 = var2469
		var2468 = var2470
		var2467 = var2471
		
		if var2468 == protoModule.wireTypes.varint then
			local _ = nil
			local var2473, var2474 = protoModule.readVarInt(p148, var2467)
			local _ = var2473
			var2467 = var2474
			continue
		end
		if var2468 == protoModule.wireTypes.lengthDelimited then
			if var2472 == 1 then
				local _ = nil
				local var2475, var2476 = protoModule.readBuffer(p148, var2467)
				var2467 = var2476
				var2466.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var2475)
				}
			elseif var2472 == 2 then
				local _ = nil
				local var2477, var2478 = protoModule.readBuffer(p148, var2467)
				var2467 = var2478
				var2466.kind = { type = "binding_path", value = buffer.tostring(var2477) }
			elseif var2472 == 3 then
				local _ = nil
				local var2479, var2480 = protoModule.readBuffer(p148, var2467)
				var2467 = var2480
				var2466.kind = {
					type = "conditional",
					value = t.ArrayOfStructProp_ConditionalOptions.decode(var2479)
				}
			else
				local _ = nil
				local var2481, var2482 = protoModule.readVarInt(p148, var2467)
				var2467 = var2482 + var2481
			end
		elseif var2468 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2483, var2484 = protoModule.readFixed32(p148, var2467)
			local _ = var2483
			var2467 = var2484
		elseif var2468 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2485, var2486 = protoModule.readFixed64(p148, var2467)
			local _ = var2485
			var2467 = var2486
		else
			error("Unsupported wire type: " .. var2468)
		end
	end
	return var2466
end

function t_73:jsonEncode() --[[ line: 12766 ]]
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

function t_73:jsonDecode() --[[ line: 12782 ]]
	-- upvalues: t_73 (ref), t (ref)
	local var2488 = t_73.new()
	
	if self.literal ~= nil then
		var2488.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2488.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2488.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2488.kind = {
			type = "conditional",
			value = t.ArrayOfStructProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	return var2488
end

t_73.descriptor = {
	name = "ArrayOfStructProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructProp"
}
t.ArrayOfStructProp = t_73
typeRegistryModule.default:register(t.ArrayOfStructProp)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p149) --[[ line: 12822 ]]
	-- upvalues: t_74 (ref)
	return setmetatable({
		condition = if p149 == nil or p149.condition == nil then nil else p149.condition,
		kind = if p149 == nil or p149.kind == nil then nil else p149.kind
	}, t_74)
end

function t_74:encode() --[[ line: 12831 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2490 = 0
	
	if self.condition ~= nil then
		local var2491 = self.condition:encode()
		local var2492, var2493 = protoModule.writeTag(buff, var2490, 1, protoModule.wireTypes.lengthDelimited)
		var2492, var2493 = protoModule.writeBuffer(var2492, var2493, var2491, buffer.len(var2491))
		buff = var2492
		var2490 = var2493
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2494 = self.kind.value:encode()
			local var2495, var2496 = protoModule.writeTag(buff, var2490, 2, protoModule.wireTypes.lengthDelimited)
			var2495, var2496 = protoModule.writeBuffer(var2495, var2496, var2494, buffer.len(var2494))
			buff = var2495
			var2490 = var2496
		elseif self.kind.type == "binding_path" then
			local var2497, var2498 = protoModule.writeTag(buff, var2490, 3, protoModule.wireTypes.lengthDelimited)
			var2497, var2498 = protoModule.writeString(var2497, var2498, self.kind.value)
			buff = var2497
			var2490 = var2498
		end
	end
	local buff_1 = buffer.create(var2490)
	buffer.copy(buff_1, 0, buff, 0, var2490)
	
	return buff_1
end

function t_74.decode(p150) --[[ line: 12857 ]]
	-- upvalues: t_74 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2500 = t_74.new()
	local var2501 = 0
	while var2501 < buffer.len(p150) do
		local _ = nil
		local var2502 = nil
		local var2503, var2504, var2505 = protoModule.readTag(p150, var2501)
		local var2506 = var2503
		var2502 = var2504
		var2501 = var2505
		
		if var2502 == protoModule.wireTypes.varint then
			local _ = nil
			local var2507, var2508 = protoModule.readVarInt(p150, var2501)
			local _ = var2507
			var2501 = var2508
			continue
		end
		if var2502 == protoModule.wireTypes.lengthDelimited then
			if var2506 == 1 then
				local _ = nil
				local var2509, var2510 = protoModule.readBuffer(p150, var2501)
				var2501 = var2510
				var2500.condition = propConditionModule.PropCondition.decode(var2509)
			elseif var2506 == 2 then
				local _ = nil
				local var2511, var2512 = protoModule.readBuffer(p150, var2501)
				var2501 = var2512
				var2500.kind = {
					type = "literal",
					value = t.ArrayOfStructProp_ArrayOfStructs.decode(var2511)
				}
			elseif var2506 == 3 then
				local _ = nil
				local var2513, var2514 = protoModule.readBuffer(p150, var2501)
				var2501 = var2514
				var2500.kind = { type = "binding_path", value = buffer.tostring(var2513) }
			else
				local _ = nil
				local var2515, var2516 = protoModule.readVarInt(p150, var2501)
				var2501 = var2516 + var2515
			end
		elseif var2502 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2517, var2518 = protoModule.readFixed32(p150, var2501)
			local _ = var2517
			var2501 = var2518
		elseif var2502 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2519, var2520 = protoModule.readFixed64(p150, var2501)
			local _ = var2519
			var2501 = var2520
		else
			error("Unsupported wire type: " .. var2502)
		end
	end
	return var2500
end

function t_74:jsonEncode() --[[ line: 12910 ]]
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

function t_74:jsonDecode() --[[ line: 12928 ]]
	-- upvalues: t_74 (ref), propConditionModule (ref), t (ref)
	local var2522 = t_74.new()
	
	if self.condition ~= nil then
		var2522.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2522.kind = {
			type = "literal",
			value = t.ArrayOfStructProp_ArrayOfStructs.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2522.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2522.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2522
end

t_74.descriptor = {
	name = "ArrayOfStructProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfStructProp_ConditionalOption = t_74
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOption)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p151) --[[ line: 12968 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		options = if p151 == nil or p151.options == nil then {} else p151.options
	}, t_75)
end

function t_75:encode() --[[ line: 12976 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2524 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2525 = v:encode()
			local var2526, var2527 = protoModule.writeTag(buff, var2524, 1, protoModule.wireTypes.lengthDelimited)
			var2526, var2527 = protoModule.writeBuffer(var2526, var2527, var2525, buffer.len(var2525))
			buff = var2526
			var2524 = var2527
		end
	end
	local buff_1 = buffer.create(var2524)
	buffer.copy(buff_1, 0, buff, 0, var2524)
	
	return buff_1
end

function t_75.decode(p152) --[[ line: 12993 ]]
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var2529 = t_75.new()
	local var2530 = 0
	while var2530 < buffer.len(p152) do
		local _ = nil
		local var2531 = nil
		local var2532, var2533, var2534 = protoModule.readTag(p152, var2530)
		local var2535 = var2532
		var2531 = var2533
		var2530 = var2534
		
		if var2531 == protoModule.wireTypes.varint then
			local _ = nil
			local var2536, var2537 = protoModule.readVarInt(p152, var2530)
			local _ = var2536
			var2530 = var2537
			continue
		end
		if var2531 == protoModule.wireTypes.lengthDelimited then
			if var2535 == 1 then
				local _ = nil
				local var2538, var2539 = protoModule.readBuffer(p152, var2530)
				var2530 = var2539
				table.insert(var2529.options, t.ArrayOfStructProp_ConditionalOption.decode(var2538))
			else
				local _ = nil
				local var2540, var2541 = protoModule.readVarInt(p152, var2530)
				var2530 = var2541 + var2540
			end
		elseif var2531 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2542, var2543 = protoModule.readFixed32(p152, var2530)
			local _ = var2542
			var2530 = var2543
		elseif var2531 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2544, var2545 = protoModule.readFixed64(p152, var2530)
			local _ = var2544
			var2530 = var2545
		else
			error("Unsupported wire type: " .. var2531)
		end
	end
	return var2529
end

function t_75:jsonEncode() --[[ line: 13036 ]]
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

function t_75:jsonDecode() --[[ line: 13050 ]]
	-- upvalues: t_75 (ref), t (ref)
	local var2548 = t_75.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfStructProp_ConditionalOption.jsonDecode(v))
		end
		var2548.options = t_1
	end
	return var2548
end

t_75.descriptor = {
	name = "ArrayOfStructProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfStructProp_ConditionalOptions = t_75
typeRegistryModule.default:register(t.ArrayOfStructProp_ConditionalOptions)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p153) --[[ line: 13081 ]]
	-- upvalues: t_76 (ref)
	return setmetatable({
		entry = if p153 == nil or p153.entry == nil then {} else p153.entry
	}, t_76)
end

function t_76:encode() --[[ line: 13089 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2551 = 0
	
	if self.entry ~= nil and #self.entry > 0 then
		for i, v in self.entry do
			local var2552 = v:encode()
			local var2553, var2554 = protoModule.writeTag(buff, var2551, 1, protoModule.wireTypes.lengthDelimited)
			var2553, var2554 = protoModule.writeBuffer(var2553, var2554, var2552, buffer.len(var2552))
			buff = var2553
			var2551 = var2554
		end
	end
	local buff_1 = buffer.create(var2551)
	buffer.copy(buff_1, 0, buff, 0, var2551)
	
	return buff_1
end

function t_76.decode(p154) --[[ line: 13106 ]]
	-- upvalues: t_76 (ref), protoModule (ref), structModule (ref)
	local var2556 = t_76.new()
	local var2557 = 0
	while var2557 < buffer.len(p154) do
		local _ = nil
		local var2558 = nil
		local var2559, var2560, var2561 = protoModule.readTag(p154, var2557)
		local var2562 = var2559
		var2558 = var2560
		var2557 = var2561
		
		if var2558 == protoModule.wireTypes.varint then
			local _ = nil
			local var2563, var2564 = protoModule.readVarInt(p154, var2557)
			local _ = var2563
			var2557 = var2564
			continue
		end
		if var2558 == protoModule.wireTypes.lengthDelimited then
			if var2562 == 1 then
				local _ = nil
				local var2565, var2566 = protoModule.readBuffer(p154, var2557)
				var2557 = var2566
				table.insert(var2556.entry, structModule.Struct.decode(var2565))
			else
				local _ = nil
				local var2567, var2568 = protoModule.readVarInt(p154, var2557)
				var2557 = var2568 + var2567
			end
		elseif var2558 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2569, var2570 = protoModule.readFixed32(p154, var2557)
			local _ = var2569
			var2557 = var2570
		elseif var2558 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2571, var2572 = protoModule.readFixed64(p154, var2557)
			local _ = var2571
			var2557 = var2572
		else
			error("Unsupported wire type: " .. var2558)
		end
	end
	return var2556
end

function t_76:jsonEncode() --[[ line: 13149 ]]
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

function t_76:jsonDecode() --[[ line: 13163 ]]
	-- upvalues: t_76 (ref), structModule (ref)
	local var2575 = t_76.new()
	
	if self.entry ~= nil then
		local t = {}
		
		for i, v in self.entry do
			table.insert(t, structModule.Struct.jsonDecode(v))
		end
		var2575.entry = t
	end
	return var2575
end

t_76.descriptor = {
	name = "ArrayOfStructProp_ArrayOfStructs",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfStructs"
}
t.ArrayOfStructProp_ArrayOfStructs = t_76
typeRegistryModule.default:register(t.ArrayOfStructProp_ArrayOfStructs)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p155) --[[ line: 13194 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		kind = if p155 == nil or p155.kind == nil then nil else p155.kind
	}, t_77)
end

function t_77:encode() --[[ line: 13200 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2578 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2579, var2580 = protoModule.writeTag(buff, var2578, 1, protoModule.wireTypes.lengthDelimited)
			var2579, var2580 = protoModule.writeString(var2579, var2580, self.kind.value)
			buff = var2579
			var2578 = var2580
		elseif self.kind.type == "token" then
			local var2581, var2582 = protoModule.writeTag(buff, var2578, 2, protoModule.wireTypes.lengthDelimited)
			var2581, var2582 = protoModule.writeString(var2581, var2582, self.kind.value)
			buff = var2581
			var2578 = var2582
		elseif self.kind.type == "conditional" then
			local var2583 = self.kind.value:encode()
			local var2584, var2585 = protoModule.writeTag(buff, var2578, 3, protoModule.wireTypes.lengthDelimited)
			var2584, var2585 = protoModule.writeBuffer(var2584, var2585, var2583, buffer.len(var2583))
			buff = var2584
			var2578 = var2585
		elseif self.kind.type == "binding_path" then
			local var2586, var2587 = protoModule.writeTag(buff, var2578, 4, protoModule.wireTypes.lengthDelimited)
			var2586, var2587 = protoModule.writeString(var2586, var2587, self.kind.value)
			buff = var2586
			var2578 = var2587
		end
	end
	local buff_1 = buffer.create(var2578)
	buffer.copy(buff_1, 0, buff, 0, var2578)
	
	return buff_1
end

function t_77.decode(p156) --[[ line: 13226 ]]
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var2589 = t_77.new()
	local var2590 = 0
	while var2590 < buffer.len(p156) do
		local _ = nil
		local var2591 = nil
		local var2592, var2593, var2594 = protoModule.readTag(p156, var2590)
		local var2595 = var2592
		var2591 = var2593
		var2590 = var2594
		
		if var2591 == protoModule.wireTypes.varint then
			local _ = nil
			local var2596, var2597 = protoModule.readVarInt(p156, var2590)
			local _ = var2596
			var2590 = var2597
			continue
		end
		if var2591 == protoModule.wireTypes.lengthDelimited then
			if var2595 == 1 then
				local _ = nil
				local var2598, var2599 = protoModule.readBuffer(p156, var2590)
				var2590 = var2599
				var2589.kind = { type = "literal", value = buffer.tostring(var2598) }
			elseif var2595 == 2 then
				local _ = nil
				local var2600, var2601 = protoModule.readBuffer(p156, var2590)
				var2590 = var2601
				var2589.kind = { type = "token", value = buffer.tostring(var2600) }
			elseif var2595 == 3 then
				local _ = nil
				local var2602, var2603 = protoModule.readBuffer(p156, var2590)
				var2590 = var2603
				var2589.kind = {
					type = "conditional",
					value = t.UiScaledFloatProp_ConditionalOptions.decode(var2602)
				}
			elseif var2595 == 4 then
				local _ = nil
				local var2604, var2605 = protoModule.readBuffer(p156, var2590)
				var2590 = var2605
				var2589.kind = { type = "binding_path", value = buffer.tostring(var2604) }
			else
				local _ = nil
				local var2606, var2607 = protoModule.readVarInt(p156, var2590)
				var2590 = var2607 + var2606
			end
		elseif var2591 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2608, var2609 = protoModule.readFixed32(p156, var2590)
			local _ = var2608
			var2590 = var2609
		elseif var2591 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2610, var2611 = protoModule.readFixed64(p156, var2590)
			local _ = var2610
			var2590 = var2611
		else
			error("Unsupported wire type: " .. var2591)
		end
	end
	return var2589
end

function t_77:jsonEncode() --[[ line: 13285 ]]
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

function t_77:jsonDecode() --[[ line: 13303 ]]
	-- upvalues: t_77 (ref), t (ref)
	local var2613 = t_77.new()
	
	if self.literal ~= nil then
		var2613.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2613.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2613.kind = {
			type = "conditional",
			value = t.UiScaledFloatProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2613.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2613.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2613
end

t_77.descriptor = {
	name = "UiScaledFloatProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledFloatProp"
}
t.UiScaledFloatProp = t_77
typeRegistryModule.default:register(t.UiScaledFloatProp)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p157) --[[ line: 13346 ]]
	-- upvalues: t_78 (ref)
	return setmetatable({
		condition = if p157 == nil or p157.condition == nil then nil else p157.condition,
		kind = if p157 == nil or p157.kind == nil then nil else p157.kind
	}, t_78)
end

function t_78:encode() --[[ line: 13355 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2615 = 0
	
	if self.condition ~= nil then
		local var2616 = self.condition:encode()
		local var2617, var2618 = protoModule.writeTag(buff, var2615, 1, protoModule.wireTypes.lengthDelimited)
		var2617, var2618 = protoModule.writeBuffer(var2617, var2618, var2616, buffer.len(var2616))
		buff = var2617
		var2615 = var2618
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2619, var2620 = protoModule.writeTag(buff, var2615, 2, protoModule.wireTypes.lengthDelimited)
			var2619, var2620 = protoModule.writeString(var2619, var2620, self.kind.value)
			buff = var2619
			var2615 = var2620
		elseif self.kind.type == "token" then
			local var2621, var2622 = protoModule.writeTag(buff, var2615, 3, protoModule.wireTypes.lengthDelimited)
			var2621, var2622 = protoModule.writeString(var2621, var2622, self.kind.value)
			buff = var2621
			var2615 = var2622
		elseif self.kind.type == "binding_path" then
			local var2623, var2624 = protoModule.writeTag(buff, var2615, 4, protoModule.wireTypes.lengthDelimited)
			var2623, var2624 = protoModule.writeString(var2623, var2624, self.kind.value)
			buff = var2623
			var2615 = var2624
		end
	end
	local buff_1 = buffer.create(var2615)
	buffer.copy(buff_1, 0, buff, 0, var2615)
	
	return buff_1
end

function t_78.decode(p158) --[[ line: 13383 ]]
	-- upvalues: t_78 (ref), protoModule (ref), propConditionModule (ref)
	local var2626 = t_78.new()
	local var2627 = 0
	while var2627 < buffer.len(p158) do
		local _ = nil
		local var2628 = nil
		local var2629, var2630, var2631 = protoModule.readTag(p158, var2627)
		local var2632 = var2629
		var2628 = var2630
		var2627 = var2631
		
		if var2628 == protoModule.wireTypes.varint then
			local _ = nil
			local var2633, var2634 = protoModule.readVarInt(p158, var2627)
			local _ = var2633
			var2627 = var2634
			continue
		end
		if var2628 == protoModule.wireTypes.lengthDelimited then
			if var2632 == 1 then
				local _ = nil
				local var2635, var2636 = protoModule.readBuffer(p158, var2627)
				var2627 = var2636
				var2626.condition = propConditionModule.PropCondition.decode(var2635)
			elseif var2632 == 2 then
				local _ = nil
				local var2637, var2638 = protoModule.readBuffer(p158, var2627)
				var2627 = var2638
				var2626.kind = { type = "literal", value = buffer.tostring(var2637) }
			elseif var2632 == 3 then
				local _ = nil
				local var2639, var2640 = protoModule.readBuffer(p158, var2627)
				var2627 = var2640
				var2626.kind = { type = "token", value = buffer.tostring(var2639) }
			elseif var2632 == 4 then
				local _ = nil
				local var2641, var2642 = protoModule.readBuffer(p158, var2627)
				var2627 = var2642
				var2626.kind = { type = "binding_path", value = buffer.tostring(var2641) }
			else
				local _ = nil
				local var2643, var2644 = protoModule.readVarInt(p158, var2627)
				var2627 = var2644 + var2643
			end
		elseif var2628 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2645, var2646 = protoModule.readFixed32(p158, var2627)
			local _ = var2645
			var2627 = var2646
		elseif var2628 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2647, var2648 = protoModule.readFixed64(p158, var2627)
			local _ = var2647
			var2627 = var2648
		else
			error("Unsupported wire type: " .. var2628)
		end
	end
	return var2626
end

function t_78:jsonEncode() --[[ line: 13441 ]]
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

function t_78:jsonDecode() --[[ line: 13461 ]]
	-- upvalues: t_78 (ref), propConditionModule (ref)
	local var2650 = t_78.new()
	
	if self.condition ~= nil then
		var2650.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2650.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2650.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2650.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2650.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2650
end

t_78.descriptor = {
	name = "UiScaledFloatProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledFloatProp_ConditionalOption = t_78
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p159) --[[ line: 13504 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		options = if p159 == nil or p159.options == nil then {} else p159.options
	}, t_79)
end

function t_79:encode() --[[ line: 13512 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2652 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2653 = v:encode()
			local var2654, var2655 = protoModule.writeTag(buff, var2652, 1, protoModule.wireTypes.lengthDelimited)
			var2654, var2655 = protoModule.writeBuffer(var2654, var2655, var2653, buffer.len(var2653))
			buff = var2654
			var2652 = var2655
		end
	end
	local buff_1 = buffer.create(var2652)
	buffer.copy(buff_1, 0, buff, 0, var2652)
	
	return buff_1
end

function t_79.decode(p160) --[[ line: 13529 ]]
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var2657 = t_79.new()
	local var2658 = 0
	while var2658 < buffer.len(p160) do
		local _ = nil
		local var2659 = nil
		local var2660, var2661, var2662 = protoModule.readTag(p160, var2658)
		local var2663 = var2660
		var2659 = var2661
		var2658 = var2662
		
		if var2659 == protoModule.wireTypes.varint then
			local _ = nil
			local var2664, var2665 = protoModule.readVarInt(p160, var2658)
			local _ = var2664
			var2658 = var2665
			continue
		end
		if var2659 == protoModule.wireTypes.lengthDelimited then
			if var2663 == 1 then
				local _ = nil
				local var2666, var2667 = protoModule.readBuffer(p160, var2658)
				var2658 = var2667
				table.insert(var2657.options, t.UiScaledFloatProp_ConditionalOption.decode(var2666))
			else
				local _ = nil
				local var2668, var2669 = protoModule.readVarInt(p160, var2658)
				var2658 = var2669 + var2668
			end
		elseif var2659 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2670, var2671 = protoModule.readFixed32(p160, var2658)
			local _ = var2670
			var2658 = var2671
		elseif var2659 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2672, var2673 = protoModule.readFixed64(p160, var2658)
			local _ = var2672
			var2658 = var2673
		else
			error("Unsupported wire type: " .. var2659)
		end
	end
	return var2657
end

function t_79:jsonEncode() --[[ line: 13572 ]]
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

function t_79:jsonDecode() --[[ line: 13586 ]]
	-- upvalues: t_79 (ref), t (ref)
	local var2676 = t_79.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledFloatProp_ConditionalOption.jsonDecode(v))
		end
		var2676.options = t_1
	end
	return var2676
end

t_79.descriptor = {
	name = "UiScaledFloatProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledFloatProp_ConditionalOptions = t_79
typeRegistryModule.default:register(t.UiScaledFloatProp_ConditionalOptions)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p161) --[[ line: 13617 ]]
	-- upvalues: t_80 (ref)
	return setmetatable({
		kind = if p161 == nil or p161.kind == nil then nil else p161.kind
	}, t_80)
end

function t_80:encode() --[[ line: 13623 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2679 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2680, var2681 = protoModule.writeTag(buff, var2679, 1, protoModule.wireTypes.lengthDelimited)
			var2680, var2681 = protoModule.writeString(var2680, var2681, self.kind.value)
			buff = var2680
			var2679 = var2681
		elseif self.kind.type == "token" then
			local var2682, var2683 = protoModule.writeTag(buff, var2679, 2, protoModule.wireTypes.lengthDelimited)
			var2682, var2683 = protoModule.writeString(var2682, var2683, self.kind.value)
			buff = var2682
			var2679 = var2683
		elseif self.kind.type == "conditional" then
			local var2684 = self.kind.value:encode()
			local var2685, var2686 = protoModule.writeTag(buff, var2679, 3, protoModule.wireTypes.lengthDelimited)
			var2685, var2686 = protoModule.writeBuffer(var2685, var2686, var2684, buffer.len(var2684))
			buff = var2685
			var2679 = var2686
		elseif self.kind.type == "binding_path" then
			local var2687, var2688 = protoModule.writeTag(buff, var2679, 4, protoModule.wireTypes.lengthDelimited)
			var2687, var2688 = protoModule.writeString(var2687, var2688, self.kind.value)
			buff = var2687
			var2679 = var2688
		end
	end
	local buff_1 = buffer.create(var2679)
	buffer.copy(buff_1, 0, buff, 0, var2679)
	
	return buff_1
end

function t_80.decode(p162) --[[ line: 13649 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var2690 = t_80.new()
	local var2691 = 0
	while var2691 < buffer.len(p162) do
		local _ = nil
		local var2692 = nil
		local var2693, var2694, var2695 = protoModule.readTag(p162, var2691)
		local var2696 = var2693
		var2692 = var2694
		var2691 = var2695
		
		if var2692 == protoModule.wireTypes.varint then
			local _ = nil
			local var2697, var2698 = protoModule.readVarInt(p162, var2691)
			local _ = var2697
			var2691 = var2698
			continue
		end
		if var2692 == protoModule.wireTypes.lengthDelimited then
			if var2696 == 1 then
				local _ = nil
				local var2699, var2700 = protoModule.readBuffer(p162, var2691)
				var2691 = var2700
				var2690.kind = { type = "literal", value = buffer.tostring(var2699) }
			elseif var2696 == 2 then
				local _ = nil
				local var2701, var2702 = protoModule.readBuffer(p162, var2691)
				var2691 = var2702
				var2690.kind = { type = "token", value = buffer.tostring(var2701) }
			elseif var2696 == 3 then
				local _ = nil
				local var2703, var2704 = protoModule.readBuffer(p162, var2691)
				var2691 = var2704
				var2690.kind = {
					type = "conditional",
					value = t.UiScaledUDimProp_ConditionalOptions.decode(var2703)
				}
			elseif var2696 == 4 then
				local _ = nil
				local var2705, var2706 = protoModule.readBuffer(p162, var2691)
				var2691 = var2706
				var2690.kind = { type = "binding_path", value = buffer.tostring(var2705) }
			else
				local _ = nil
				local var2707, var2708 = protoModule.readVarInt(p162, var2691)
				var2691 = var2708 + var2707
			end
		elseif var2692 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2709, var2710 = protoModule.readFixed32(p162, var2691)
			local _ = var2709
			var2691 = var2710
		elseif var2692 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2711, var2712 = protoModule.readFixed64(p162, var2691)
			local _ = var2711
			var2691 = var2712
		else
			error("Unsupported wire type: " .. var2692)
		end
	end
	return var2690
end

function t_80:jsonEncode() --[[ line: 13708 ]]
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

function t_80:jsonDecode() --[[ line: 13726 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var2714 = t_80.new()
	
	if self.literal ~= nil then
		var2714.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2714.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2714.kind = {
			type = "conditional",
			value = t.UiScaledUDimProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2714.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2714.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2714
end

t_80.descriptor = {
	name = "UiScaledUDimProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDimProp"
}
t.UiScaledUDimProp = t_80
typeRegistryModule.default:register(t.UiScaledUDimProp)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p163) --[[ line: 13769 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		condition = if p163 == nil or p163.condition == nil then nil else p163.condition,
		kind = if p163 == nil or p163.kind == nil then nil else p163.kind
	}, t_81)
end

function t_81:encode() --[[ line: 13778 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2716 = 0
	
	if self.condition ~= nil then
		local var2717 = self.condition:encode()
		local var2718, var2719 = protoModule.writeTag(buff, var2716, 1, protoModule.wireTypes.lengthDelimited)
		var2718, var2719 = protoModule.writeBuffer(var2718, var2719, var2717, buffer.len(var2717))
		buff = var2718
		var2716 = var2719
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2720, var2721 = protoModule.writeTag(buff, var2716, 2, protoModule.wireTypes.lengthDelimited)
			var2720, var2721 = protoModule.writeString(var2720, var2721, self.kind.value)
			buff = var2720
			var2716 = var2721
		elseif self.kind.type == "token" then
			local var2722, var2723 = protoModule.writeTag(buff, var2716, 3, protoModule.wireTypes.lengthDelimited)
			var2722, var2723 = protoModule.writeString(var2722, var2723, self.kind.value)
			buff = var2722
			var2716 = var2723
		elseif self.kind.type == "binding_path" then
			local var2724, var2725 = protoModule.writeTag(buff, var2716, 4, protoModule.wireTypes.lengthDelimited)
			var2724, var2725 = protoModule.writeString(var2724, var2725, self.kind.value)
			buff = var2724
			var2716 = var2725
		end
	end
	local buff_1 = buffer.create(var2716)
	buffer.copy(buff_1, 0, buff, 0, var2716)
	
	return buff_1
end

function t_81.decode(p164) --[[ line: 13806 ]]
	-- upvalues: t_81 (ref), protoModule (ref), propConditionModule (ref)
	local var2727 = t_81.new()
	local var2728 = 0
	while var2728 < buffer.len(p164) do
		local _ = nil
		local var2729 = nil
		local var2730, var2731, var2732 = protoModule.readTag(p164, var2728)
		local var2733 = var2730
		var2729 = var2731
		var2728 = var2732
		
		if var2729 == protoModule.wireTypes.varint then
			local _ = nil
			local var2734, var2735 = protoModule.readVarInt(p164, var2728)
			local _ = var2734
			var2728 = var2735
			continue
		end
		if var2729 == protoModule.wireTypes.lengthDelimited then
			if var2733 == 1 then
				local _ = nil
				local var2736, var2737 = protoModule.readBuffer(p164, var2728)
				var2728 = var2737
				var2727.condition = propConditionModule.PropCondition.decode(var2736)
			elseif var2733 == 2 then
				local _ = nil
				local var2738, var2739 = protoModule.readBuffer(p164, var2728)
				var2728 = var2739
				var2727.kind = { type = "literal", value = buffer.tostring(var2738) }
			elseif var2733 == 3 then
				local _ = nil
				local var2740, var2741 = protoModule.readBuffer(p164, var2728)
				var2728 = var2741
				var2727.kind = { type = "token", value = buffer.tostring(var2740) }
			elseif var2733 == 4 then
				local _ = nil
				local var2742, var2743 = protoModule.readBuffer(p164, var2728)
				var2728 = var2743
				var2727.kind = { type = "binding_path", value = buffer.tostring(var2742) }
			else
				local _ = nil
				local var2744, var2745 = protoModule.readVarInt(p164, var2728)
				var2728 = var2745 + var2744
			end
		elseif var2729 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2746, var2747 = protoModule.readFixed32(p164, var2728)
			local _ = var2746
			var2728 = var2747
		elseif var2729 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2748, var2749 = protoModule.readFixed64(p164, var2728)
			local _ = var2748
			var2728 = var2749
		else
			error("Unsupported wire type: " .. var2729)
		end
	end
	return var2727
end

function t_81:jsonEncode() --[[ line: 13864 ]]
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

function t_81:jsonDecode() --[[ line: 13884 ]]
	-- upvalues: t_81 (ref), propConditionModule (ref)
	local var2751 = t_81.new()
	
	if self.condition ~= nil then
		var2751.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2751.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2751.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2751.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2751.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2751
end

t_81.descriptor = {
	name = "UiScaledUDimProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDimProp_ConditionalOption = t_81
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOption)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p165) --[[ line: 13927 ]]
	-- upvalues: t_82 (ref)
	return setmetatable({
		options = if p165 == nil or p165.options == nil then {} else p165.options
	}, t_82)
end

function t_82:encode() --[[ line: 13935 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2753 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2754 = v:encode()
			local var2755, var2756 = protoModule.writeTag(buff, var2753, 1, protoModule.wireTypes.lengthDelimited)
			var2755, var2756 = protoModule.writeBuffer(var2755, var2756, var2754, buffer.len(var2754))
			buff = var2755
			var2753 = var2756
		end
	end
	local buff_1 = buffer.create(var2753)
	buffer.copy(buff_1, 0, buff, 0, var2753)
	
	return buff_1
end

function t_82.decode(p166) --[[ line: 13952 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var2758 = t_82.new()
	local var2759 = 0
	while var2759 < buffer.len(p166) do
		local _ = nil
		local var2760 = nil
		local var2761, var2762, var2763 = protoModule.readTag(p166, var2759)
		local var2764 = var2761
		var2760 = var2762
		var2759 = var2763
		
		if var2760 == protoModule.wireTypes.varint then
			local _ = nil
			local var2765, var2766 = protoModule.readVarInt(p166, var2759)
			local _ = var2765
			var2759 = var2766
			continue
		end
		if var2760 == protoModule.wireTypes.lengthDelimited then
			if var2764 == 1 then
				local _ = nil
				local var2767, var2768 = protoModule.readBuffer(p166, var2759)
				var2759 = var2768
				table.insert(var2758.options, t.UiScaledUDimProp_ConditionalOption.decode(var2767))
			else
				local _ = nil
				local var2769, var2770 = protoModule.readVarInt(p166, var2759)
				var2759 = var2770 + var2769
			end
		elseif var2760 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2771, var2772 = protoModule.readFixed32(p166, var2759)
			local _ = var2771
			var2759 = var2772
		elseif var2760 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2773, var2774 = protoModule.readFixed64(p166, var2759)
			local _ = var2773
			var2759 = var2774
		else
			error("Unsupported wire type: " .. var2760)
		end
	end
	return var2758
end

function t_82:jsonEncode() --[[ line: 13995 ]]
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

function t_82:jsonDecode() --[[ line: 14009 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var2777 = t_82.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDimProp_ConditionalOption.jsonDecode(v))
		end
		var2777.options = t_1
	end
	return var2777
end

t_82.descriptor = {
	name = "UiScaledUDimProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDimProp_ConditionalOptions = t_82
typeRegistryModule.default:register(t.UiScaledUDimProp_ConditionalOptions)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p167) --[[ line: 14040 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		kind = if p167 == nil or p167.kind == nil then nil else p167.kind
	}, t_83)
end

function t_83:encode() --[[ line: 14046 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2780 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2781, var2782 = protoModule.writeTag(buff, var2780, 1, protoModule.wireTypes.lengthDelimited)
			var2781, var2782 = protoModule.writeString(var2781, var2782, self.kind.value)
			buff = var2781
			var2780 = var2782
		elseif self.kind.type == "token" then
			local var2783, var2784 = protoModule.writeTag(buff, var2780, 2, protoModule.wireTypes.lengthDelimited)
			var2783, var2784 = protoModule.writeString(var2783, var2784, self.kind.value)
			buff = var2783
			var2780 = var2784
		elseif self.kind.type == "conditional" then
			local var2785 = self.kind.value:encode()
			local var2786, var2787 = protoModule.writeTag(buff, var2780, 3, protoModule.wireTypes.lengthDelimited)
			var2786, var2787 = protoModule.writeBuffer(var2786, var2787, var2785, buffer.len(var2785))
			buff = var2786
			var2780 = var2787
		elseif self.kind.type == "binding_path" then
			local var2788, var2789 = protoModule.writeTag(buff, var2780, 4, protoModule.wireTypes.lengthDelimited)
			var2788, var2789 = protoModule.writeString(var2788, var2789, self.kind.value)
			buff = var2788
			var2780 = var2789
		end
	end
	local buff_1 = buffer.create(var2780)
	buffer.copy(buff_1, 0, buff, 0, var2780)
	
	return buff_1
end

function t_83.decode(p168) --[[ line: 14072 ]]
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var2791 = t_83.new()
	local var2792 = 0
	while var2792 < buffer.len(p168) do
		local _ = nil
		local var2793 = nil
		local var2794, var2795, var2796 = protoModule.readTag(p168, var2792)
		local var2797 = var2794
		var2793 = var2795
		var2792 = var2796
		
		if var2793 == protoModule.wireTypes.varint then
			local _ = nil
			local var2798, var2799 = protoModule.readVarInt(p168, var2792)
			local _ = var2798
			var2792 = var2799
			continue
		end
		if var2793 == protoModule.wireTypes.lengthDelimited then
			if var2797 == 1 then
				local _ = nil
				local var2800, var2801 = protoModule.readBuffer(p168, var2792)
				var2792 = var2801
				var2791.kind = { type = "literal", value = buffer.tostring(var2800) }
			elseif var2797 == 2 then
				local _ = nil
				local var2802, var2803 = protoModule.readBuffer(p168, var2792)
				var2792 = var2803
				var2791.kind = { type = "token", value = buffer.tostring(var2802) }
			elseif var2797 == 3 then
				local _ = nil
				local var2804, var2805 = protoModule.readBuffer(p168, var2792)
				var2792 = var2805
				var2791.kind = {
					type = "conditional",
					value = t.UiScaledUDim2Prop_ConditionalOptions.decode(var2804)
				}
			elseif var2797 == 4 then
				local _ = nil
				local var2806, var2807 = protoModule.readBuffer(p168, var2792)
				var2792 = var2807
				var2791.kind = { type = "binding_path", value = buffer.tostring(var2806) }
			else
				local _ = nil
				local var2808, var2809 = protoModule.readVarInt(p168, var2792)
				var2792 = var2809 + var2808
			end
		elseif var2793 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2810, var2811 = protoModule.readFixed32(p168, var2792)
			local _ = var2810
			var2792 = var2811
		elseif var2793 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2812, var2813 = protoModule.readFixed64(p168, var2792)
			local _ = var2812
			var2792 = var2813
		else
			error("Unsupported wire type: " .. var2793)
		end
	end
	return var2791
end

function t_83:jsonEncode() --[[ line: 14131 ]]
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

function t_83:jsonDecode() --[[ line: 14149 ]]
	-- upvalues: t_83 (ref), t (ref)
	local var2815 = t_83.new()
	
	if self.literal ~= nil then
		var2815.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2815.kind = { type = "token", value = self.token }
	end
	if self.conditional ~= nil then
		var2815.kind = {
			type = "conditional",
			value = t.UiScaledUDim2Prop_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.binding_path ~= nil then
		var2815.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2815.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2815
end

t_83.descriptor = {
	name = "UiScaledUDim2Prop",
	fullName = "roblox.apppageplatform.shared.v1beta1.UiScaledUDim2Prop"
}
t.UiScaledUDim2Prop = t_83
typeRegistryModule.default:register(t.UiScaledUDim2Prop)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p169) --[[ line: 14192 ]]
	-- upvalues: t_84 (ref)
	return setmetatable({
		condition = if p169 == nil or p169.condition == nil then nil else p169.condition,
		kind = if p169 == nil or p169.kind == nil then nil else p169.kind
	}, t_84)
end

function t_84:encode() --[[ line: 14201 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2817 = 0
	
	if self.condition ~= nil then
		local var2818 = self.condition:encode()
		local var2819, var2820 = protoModule.writeTag(buff, var2817, 1, protoModule.wireTypes.lengthDelimited)
		var2819, var2820 = protoModule.writeBuffer(var2819, var2820, var2818, buffer.len(var2818))
		buff = var2819
		var2817 = var2820
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2821, var2822 = protoModule.writeTag(buff, var2817, 2, protoModule.wireTypes.lengthDelimited)
			var2821, var2822 = protoModule.writeString(var2821, var2822, self.kind.value)
			buff = var2821
			var2817 = var2822
		elseif self.kind.type == "token" then
			local var2823, var2824 = protoModule.writeTag(buff, var2817, 3, protoModule.wireTypes.lengthDelimited)
			var2823, var2824 = protoModule.writeString(var2823, var2824, self.kind.value)
			buff = var2823
			var2817 = var2824
		elseif self.kind.type == "binding_path" then
			local var2825, var2826 = protoModule.writeTag(buff, var2817, 4, protoModule.wireTypes.lengthDelimited)
			var2825, var2826 = protoModule.writeString(var2825, var2826, self.kind.value)
			buff = var2825
			var2817 = var2826
		end
	end
	local buff_1 = buffer.create(var2817)
	buffer.copy(buff_1, 0, buff, 0, var2817)
	
	return buff_1
end

function t_84.decode(p170) --[[ line: 14229 ]]
	-- upvalues: t_84 (ref), protoModule (ref), propConditionModule (ref)
	local var2828 = t_84.new()
	local var2829 = 0
	while var2829 < buffer.len(p170) do
		local _ = nil
		local var2830 = nil
		local var2831, var2832, var2833 = protoModule.readTag(p170, var2829)
		local var2834 = var2831
		var2830 = var2832
		var2829 = var2833
		
		if var2830 == protoModule.wireTypes.varint then
			local _ = nil
			local var2835, var2836 = protoModule.readVarInt(p170, var2829)
			local _ = var2835
			var2829 = var2836
			continue
		end
		if var2830 == protoModule.wireTypes.lengthDelimited then
			if var2834 == 1 then
				local _ = nil
				local var2837, var2838 = protoModule.readBuffer(p170, var2829)
				var2829 = var2838
				var2828.condition = propConditionModule.PropCondition.decode(var2837)
			elseif var2834 == 2 then
				local _ = nil
				local var2839, var2840 = protoModule.readBuffer(p170, var2829)
				var2829 = var2840
				var2828.kind = { type = "literal", value = buffer.tostring(var2839) }
			elseif var2834 == 3 then
				local _ = nil
				local var2841, var2842 = protoModule.readBuffer(p170, var2829)
				var2829 = var2842
				var2828.kind = { type = "token", value = buffer.tostring(var2841) }
			elseif var2834 == 4 then
				local _ = nil
				local var2843, var2844 = protoModule.readBuffer(p170, var2829)
				var2829 = var2844
				var2828.kind = { type = "binding_path", value = buffer.tostring(var2843) }
			else
				local _ = nil
				local var2845, var2846 = protoModule.readVarInt(p170, var2829)
				var2829 = var2846 + var2845
			end
		elseif var2830 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2847, var2848 = protoModule.readFixed32(p170, var2829)
			local _ = var2847
			var2829 = var2848
		elseif var2830 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2849, var2850 = protoModule.readFixed64(p170, var2829)
			local _ = var2849
			var2829 = var2850
		else
			error("Unsupported wire type: " .. var2830)
		end
	end
	return var2828
end

function t_84:jsonEncode() --[[ line: 14287 ]]
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

function t_84:jsonDecode() --[[ line: 14307 ]]
	-- upvalues: t_84 (ref), propConditionModule (ref)
	local var2852 = t_84.new()
	
	if self.condition ~= nil then
		var2852.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var2852.kind = { type = "literal", value = self.literal }
	end
	if self.token ~= nil then
		var2852.kind = { type = "token", value = self.token }
	end
	if self.binding_path ~= nil then
		var2852.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2852.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var2852
end

t_84.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.UiScaledUDim2Prop_ConditionalOption = t_84
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOption)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p171) --[[ line: 14350 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		options = if p171 == nil or p171.options == nil then {} else p171.options
	}, t_85)
end

function t_85:encode() --[[ line: 14358 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2854 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2855 = v:encode()
			local var2856, var2857 = protoModule.writeTag(buff, var2854, 1, protoModule.wireTypes.lengthDelimited)
			var2856, var2857 = protoModule.writeBuffer(var2856, var2857, var2855, buffer.len(var2855))
			buff = var2856
			var2854 = var2857
		end
	end
	local buff_1 = buffer.create(var2854)
	buffer.copy(buff_1, 0, buff, 0, var2854)
	
	return buff_1
end

function t_85.decode(p172) --[[ line: 14375 ]]
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var2859 = t_85.new()
	local var2860 = 0
	while var2860 < buffer.len(p172) do
		local _ = nil
		local var2861 = nil
		local var2862, var2863, var2864 = protoModule.readTag(p172, var2860)
		local var2865 = var2862
		var2861 = var2863
		var2860 = var2864
		
		if var2861 == protoModule.wireTypes.varint then
			local _ = nil
			local var2866, var2867 = protoModule.readVarInt(p172, var2860)
			local _ = var2866
			var2860 = var2867
			continue
		end
		if var2861 == protoModule.wireTypes.lengthDelimited then
			if var2865 == 1 then
				local _ = nil
				local var2868, var2869 = protoModule.readBuffer(p172, var2860)
				var2860 = var2869
				table.insert(var2859.options, t.UiScaledUDim2Prop_ConditionalOption.decode(var2868))
			else
				local _ = nil
				local var2870, var2871 = protoModule.readVarInt(p172, var2860)
				var2860 = var2871 + var2870
			end
		elseif var2861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2872, var2873 = protoModule.readFixed32(p172, var2860)
			local _ = var2872
			var2860 = var2873
		elseif var2861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2874, var2875 = protoModule.readFixed64(p172, var2860)
			local _ = var2874
			var2860 = var2875
		else
			error("Unsupported wire type: " .. var2861)
		end
	end
	return var2859
end

function t_85:jsonEncode() --[[ line: 14418 ]]
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

function t_85:jsonDecode() --[[ line: 14432 ]]
	-- upvalues: t_85 (ref), t (ref)
	local var2878 = t_85.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.UiScaledUDim2Prop_ConditionalOption.jsonDecode(v))
		end
		var2878.options = t_1
	end
	return var2878
end

t_85.descriptor = {
	name = "UiScaledUDim2Prop_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.UiScaledUDim2Prop_ConditionalOptions = t_85
typeRegistryModule.default:register(t.UiScaledUDim2Prop_ConditionalOptions)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p173) --[[ line: 14463 ]]
	-- upvalues: t_86 (ref)
	return setmetatable({
		user_id = if p173 == nil or p173.user_id == nil then nil else p173.user_id,
		user_presence = if p173 == nil or p173.user_presence == nil then nil else p173.user_presence
	}, t_86)
end

function t_86:encode() --[[ line: 14470 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2881 = 0
	
	if self.user_id ~= nil then
		local var2882 = self.user_id:encode()
		local var2883, var2884 = protoModule.writeTag(buff, var2881, 1, protoModule.wireTypes.lengthDelimited)
		var2883, var2884 = protoModule.writeBuffer(var2883, var2884, var2882, buffer.len(var2882))
		buff = var2883
		var2881 = var2884
	end
	if self.user_presence ~= nil then
		local var2885 = self.user_presence:encode()
		local var2886, var2887 = protoModule.writeTag(buff, var2881, 2, protoModule.wireTypes.lengthDelimited)
		var2886, var2887 = protoModule.writeBuffer(var2886, var2887, var2885, buffer.len(var2885))
		buff = var2886
		var2881 = var2887
	end
	local buff_1 = buffer.create(var2881)
	buffer.copy(buff_1, 0, buff, 0, var2881)
	
	return buff_1
end

function t_86.decode(p174) --[[ line: 14491 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var2889 = t_86.new()
	local var2890 = 0
	while var2890 < buffer.len(p174) do
		local _ = nil
		local var2891 = nil
		local var2892, var2893, var2894 = protoModule.readTag(p174, var2890)
		local var2895 = var2892
		var2891 = var2893
		var2890 = var2894
		
		if var2891 == protoModule.wireTypes.varint then
			local _ = nil
			local var2896, var2897 = protoModule.readVarInt(p174, var2890)
			local _ = var2896
			var2890 = var2897
			continue
		end
		if var2891 == protoModule.wireTypes.lengthDelimited then
			if var2895 == 1 then
				local _ = nil
				local var2898, var2899 = protoModule.readBuffer(p174, var2890)
				var2890 = var2899
				var2889.user_id = t.Int64Prop.decode(var2898)
			elseif var2895 == 2 then
				local _ = nil
				local var2900, var2901 = protoModule.readBuffer(p174, var2890)
				var2890 = var2901
				var2889.user_presence = t.StringProp.decode(var2900)
			else
				local _ = nil
				local var2902, var2903 = protoModule.readVarInt(p174, var2890)
				var2890 = var2903 + var2902
			end
		elseif var2891 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2904, var2905 = protoModule.readFixed32(p174, var2890)
			local _ = var2904
			var2890 = var2905
		elseif var2891 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2906, var2907 = protoModule.readFixed64(p174, var2890)
			local _ = var2906
			var2890 = var2907
		else
			error("Unsupported wire type: " .. var2891)
		end
	end
	return var2889
end

function t_86:jsonEncode() --[[ line: 14539 ]]
	local t = {}
	
	if self.user_id ~= nil then
		t.userId = self.user_id:jsonEncode()
	end
	if self.user_presence ~= nil then
		t.userPresence = self.user_presence:jsonEncode()
	end
	return t
end

function t_86:jsonDecode() --[[ line: 14553 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var2909 = t_86.new()
	
	if self.user_id ~= nil then
		var2909.user_id = t.Int64Prop.jsonDecode(self.user_id)
	end
	if self.userId ~= nil then
		var2909.user_id = t.Int64Prop.jsonDecode(self.userId)
	end
	if self.user_presence ~= nil then
		var2909.user_presence = t.StringProp.jsonDecode(self.user_presence)
	end
	if self.userPresence ~= nil then
		var2909.user_presence = t.StringProp.jsonDecode(self.userPresence)
	end
	return var2909
end

t_86.descriptor = {
	name = "AvatarConfigProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarConfigProp"
}
t.AvatarConfigProp = t_86
typeRegistryModule.default:register(t.AvatarConfigProp)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p175) --[[ line: 14589 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		oneof_prop = if p175 == nil or p175.oneof_prop == nil then nil else p175.oneof_prop
	}, t_87)
end

function t_87:encode() --[[ line: 14595 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2911 = 0
	
	if self.oneof_prop ~= nil then
		if self.oneof_prop.type == "user_id" then
			local var2912 = self.oneof_prop.value:encode()
			local var2913, var2914 = protoModule.writeTag(buff, var2911, 1, protoModule.wireTypes.lengthDelimited)
			var2913, var2914 = protoModule.writeBuffer(var2913, var2914, var2912, buffer.len(var2912))
			buff = var2913
			var2911 = var2914
		elseif self.oneof_prop.type == "avatar_config" then
			local var2915 = self.oneof_prop.value:encode()
			local var2916, var2917 = protoModule.writeTag(buff, var2911, 2, protoModule.wireTypes.lengthDelimited)
			var2916, var2917 = protoModule.writeBuffer(var2916, var2917, var2915, buffer.len(var2915))
			buff = var2916
			var2911 = var2917
		end
	end
	local buff_1 = buffer.create(var2911)
	buffer.copy(buff_1, 0, buff, 0, var2911)
	
	return buff_1
end

function t_87.decode(p176) --[[ line: 14616 ]]
	-- upvalues: t_87 (ref), protoModule (ref), t (ref)
	local var2919 = t_87.new()
	local var2920 = 0
	while var2920 < buffer.len(p176) do
		local _ = nil
		local var2921 = nil
		local var2922, var2923, var2924 = protoModule.readTag(p176, var2920)
		local var2925 = var2922
		var2921 = var2923
		var2920 = var2924
		
		if var2921 == protoModule.wireTypes.varint then
			local _ = nil
			local var2926, var2927 = protoModule.readVarInt(p176, var2920)
			local _ = var2926
			var2920 = var2927
			continue
		end
		if var2921 == protoModule.wireTypes.lengthDelimited then
			if var2925 == 1 then
				local _ = nil
				local var2928, var2929 = protoModule.readBuffer(p176, var2920)
				var2920 = var2929
				var2919.oneof_prop = { type = "user_id", value = t.Int64Prop.decode(var2928) }
			elseif var2925 == 2 then
				local _ = nil
				local var2930, var2931 = protoModule.readBuffer(p176, var2920)
				var2920 = var2931
				var2919.oneof_prop = {
					type = "avatar_config",
					value = t.AvatarConfigProp.decode(var2930)
				}
			else
				local _ = nil
				local var2932, var2933 = protoModule.readVarInt(p176, var2920)
				var2920 = var2933 + var2932
			end
		elseif var2921 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2934, var2935 = protoModule.readFixed32(p176, var2920)
			local _ = var2934
			var2920 = var2935
		elseif var2921 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2936, var2937 = protoModule.readFixed64(p176, var2920)
			local _ = var2936
			var2920 = var2937
		else
			error("Unsupported wire type: " .. var2921)
		end
	end
	return var2919
end

function t_87:jsonEncode() --[[ line: 14664 ]]
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

function t_87:jsonDecode() --[[ line: 14678 ]]
	-- upvalues: t_87 (ref), t (ref)
	local var2939 = t_87.new()
	
	if self.user_id ~= nil then
		var2939.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.user_id)
		}
	end
	if self.userId ~= nil then
		var2939.oneof_prop = {
			type = "user_id",
			value = t.Int64Prop.jsonDecode(self.userId)
		}
	end
	if self.avatar_config ~= nil then
		var2939.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatar_config)
		}
	end
	if self.avatarConfig ~= nil then
		var2939.oneof_prop = {
			type = "avatar_config",
			value = t.AvatarConfigProp.jsonDecode(self.avatarConfig)
		}
	end
	return var2939
end

t_87.descriptor = {
	name = "AvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.AvatarProp"
}
t.AvatarProp = t_87
typeRegistryModule.default:register(t.AvatarProp)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p177) --[[ line: 14716 ]]
	-- upvalues: t_88 (ref)
	return setmetatable({
		kind = if p177 == nil or p177.kind == nil then nil else p177.kind
	}, t_88)
end

function t_88:encode() --[[ line: 14722 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2941 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2942 = self.kind.value:encode()
			local var2943, var2944 = protoModule.writeTag(buff, var2941, 1, protoModule.wireTypes.lengthDelimited)
			var2943, var2944 = protoModule.writeBuffer(var2943, var2944, var2942, buffer.len(var2942))
			buff = var2943
			var2941 = var2944
		elseif self.kind.type == "binding_path" then
			local var2945, var2946 = protoModule.writeTag(buff, var2941, 2, protoModule.wireTypes.lengthDelimited)
			var2945, var2946 = protoModule.writeString(var2945, var2946, self.kind.value)
			buff = var2945
			var2941 = var2946
		elseif self.kind.type == "conditional" then
			local var2947 = self.kind.value:encode()
			local var2948, var2949 = protoModule.writeTag(buff, var2941, 3, protoModule.wireTypes.lengthDelimited)
			var2948, var2949 = protoModule.writeBuffer(var2948, var2949, var2947, buffer.len(var2947))
			buff = var2948
			var2941 = var2949
		elseif self.kind.type == "array_map" then
			local var2950 = self.kind.value:encode()
			local var2951, var2952 = protoModule.writeTag(buff, var2941, 4, protoModule.wireTypes.lengthDelimited)
			var2951, var2952 = protoModule.writeBuffer(var2951, var2952, var2950, buffer.len(var2950))
			buff = var2951
			var2941 = var2952
		end
	end
	local buff_1 = buffer.create(var2941)
	buffer.copy(buff_1, 0, buff, 0, var2941)
	
	return buff_1
end

function t_88.decode(p178) --[[ line: 14750 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var2954 = t_88.new()
	local var2955 = 0
	while var2955 < buffer.len(p178) do
		local _ = nil
		local var2956 = nil
		local var2957, var2958, var2959 = protoModule.readTag(p178, var2955)
		local var2960 = var2957
		var2956 = var2958
		var2955 = var2959
		
		if var2956 == protoModule.wireTypes.varint then
			local _ = nil
			local var2961, var2962 = protoModule.readVarInt(p178, var2955)
			local _ = var2961
			var2955 = var2962
			continue
		end
		if var2956 == protoModule.wireTypes.lengthDelimited then
			if var2960 == 1 then
				local _ = nil
				local var2963, var2964 = protoModule.readBuffer(p178, var2955)
				var2955 = var2964
				var2954.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var2963)
				}
			elseif var2960 == 2 then
				local _ = nil
				local var2965, var2966 = protoModule.readBuffer(p178, var2955)
				var2955 = var2966
				var2954.kind = { type = "binding_path", value = buffer.tostring(var2965) }
			elseif var2960 == 3 then
				local _ = nil
				local var2967, var2968 = protoModule.readBuffer(p178, var2955)
				var2955 = var2968
				var2954.kind = {
					type = "conditional",
					value = t.ArrayOfAvatarProp_ConditionalOptions.decode(var2967)
				}
			elseif var2960 == 4 then
				local _ = nil
				local var2969, var2970 = protoModule.readBuffer(p178, var2955)
				var2955 = var2970
				var2954.kind = {
					type = "array_map",
					value = t.ArrayOfAvatarProp_ArrayMap.decode(var2969)
				}
			else
				local _ = nil
				local var2971, var2972 = protoModule.readVarInt(p178, var2955)
				var2955 = var2972 + var2971
			end
		elseif var2956 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2973, var2974 = protoModule.readFixed32(p178, var2955)
			local _ = var2973
			var2955 = var2974
		elseif var2956 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2975, var2976 = protoModule.readFixed64(p178, var2955)
			local _ = var2975
			var2955 = var2976
		else
			error("Unsupported wire type: " .. var2956)
		end
	end
	return var2954
end

function t_88:jsonEncode() --[[ line: 14809 ]]
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

function t_88:jsonDecode() --[[ line: 14827 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var2978 = t_88.new()
	
	if self.literal ~= nil then
		var2978.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var2978.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var2978.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.conditional ~= nil then
		var2978.kind = {
			type = "conditional",
			value = t.ArrayOfAvatarProp_ConditionalOptions.jsonDecode(self.conditional)
		}
	end
	if self.array_map ~= nil then
		var2978.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.array_map)
		}
	end
	if self.arrayMap ~= nil then
		var2978.kind = {
			type = "array_map",
			value = t.ArrayOfAvatarProp_ArrayMap.jsonDecode(self.arrayMap)
		}
	end
	return var2978
end

t_88.descriptor = {
	name = "ArrayOfAvatarProp",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatarProp"
}
t.ArrayOfAvatarProp = t_88
typeRegistryModule.default:register(t.ArrayOfAvatarProp)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p179) --[[ line: 14875 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		condition = if p179 == nil or p179.condition == nil then nil else p179.condition,
		kind = if p179 == nil or p179.kind == nil then nil else p179.kind
	}, t_89)
end

function t_89:encode() --[[ line: 14884 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2980 = 0
	
	if self.condition ~= nil then
		local var2981 = self.condition:encode()
		local var2982, var2983 = protoModule.writeTag(buff, var2980, 1, protoModule.wireTypes.lengthDelimited)
		var2982, var2983 = protoModule.writeBuffer(var2982, var2983, var2981, buffer.len(var2981))
		buff = var2982
		var2980 = var2983
	end
	if self.kind ~= nil then
		if self.kind.type == "literal" then
			local var2984 = self.kind.value:encode()
			local var2985, var2986 = protoModule.writeTag(buff, var2980, 2, protoModule.wireTypes.lengthDelimited)
			var2985, var2986 = protoModule.writeBuffer(var2985, var2986, var2984, buffer.len(var2984))
			buff = var2985
			var2980 = var2986
		elseif self.kind.type == "binding_path" then
			local var2987, var2988 = protoModule.writeTag(buff, var2980, 3, protoModule.wireTypes.lengthDelimited)
			var2987, var2988 = protoModule.writeString(var2987, var2988, self.kind.value)
			buff = var2987
			var2980 = var2988
		end
	end
	local buff_1 = buffer.create(var2980)
	buffer.copy(buff_1, 0, buff, 0, var2980)
	
	return buff_1
end

function t_89.decode(p180) --[[ line: 14910 ]]
	-- upvalues: t_89 (ref), protoModule (ref), propConditionModule (ref), t (ref)
	local var2990 = t_89.new()
	local var2991 = 0
	while var2991 < buffer.len(p180) do
		local _ = nil
		local var2992 = nil
		local var2993, var2994, var2995 = protoModule.readTag(p180, var2991)
		local var2996 = var2993
		var2992 = var2994
		var2991 = var2995
		
		if var2992 == protoModule.wireTypes.varint then
			local _ = nil
			local var2997, var2998 = protoModule.readVarInt(p180, var2991)
			local _ = var2997
			var2991 = var2998
			continue
		end
		if var2992 == protoModule.wireTypes.lengthDelimited then
			if var2996 == 1 then
				local _ = nil
				local var2999, var3000 = protoModule.readBuffer(p180, var2991)
				var2991 = var3000
				var2990.condition = propConditionModule.PropCondition.decode(var2999)
			elseif var2996 == 2 then
				local _ = nil
				local var3001, var3002 = protoModule.readBuffer(p180, var2991)
				var2991 = var3002
				var2990.kind = {
					type = "literal",
					value = t.ArrayOfAvatarProp_ArrayOfAvatars.decode(var3001)
				}
			elseif var2996 == 3 then
				local _ = nil
				local var3003, var3004 = protoModule.readBuffer(p180, var2991)
				var2991 = var3004
				var2990.kind = { type = "binding_path", value = buffer.tostring(var3003) }
			else
				local _ = nil
				local var3005, var3006 = protoModule.readVarInt(p180, var2991)
				var2991 = var3006 + var3005
			end
		elseif var2992 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3007, var3008 = protoModule.readFixed32(p180, var2991)
			local _ = var3007
			var2991 = var3008
		elseif var2992 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3009, var3010 = protoModule.readFixed64(p180, var2991)
			local _ = var3009
			var2991 = var3010
		else
			error("Unsupported wire type: " .. var2992)
		end
	end
	return var2990
end

function t_89:jsonEncode() --[[ line: 14963 ]]
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

function t_89:jsonDecode() --[[ line: 14981 ]]
	-- upvalues: t_89 (ref), propConditionModule (ref), t (ref)
	local var3012 = t_89.new()
	
	if self.condition ~= nil then
		var3012.condition = propConditionModule.PropCondition.jsonDecode(self.condition)
	end
	if self.literal ~= nil then
		var3012.kind = {
			type = "literal",
			value = t.ArrayOfAvatarProp_ArrayOfAvatars.jsonDecode(self.literal)
		}
	end
	if self.binding_path ~= nil then
		var3012.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3012.kind = { type = "binding_path", value = self.bindingPath }
	end
	return var3012
end

t_89.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOption"
}
t.ArrayOfAvatarProp_ConditionalOption = t_89
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOption)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p181) --[[ line: 15021 ]]
	-- upvalues: t_90 (ref)
	return setmetatable({
		options = if p181 == nil or p181.options == nil then {} else p181.options
	}, t_90)
end

function t_90:encode() --[[ line: 15029 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3014 = 0
	
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3015 = v:encode()
			local var3016, var3017 = protoModule.writeTag(buff, var3014, 1, protoModule.wireTypes.lengthDelimited)
			var3016, var3017 = protoModule.writeBuffer(var3016, var3017, var3015, buffer.len(var3015))
			buff = var3016
			var3014 = var3017
		end
	end
	local buff_1 = buffer.create(var3014)
	buffer.copy(buff_1, 0, buff, 0, var3014)
	
	return buff_1
end

function t_90.decode(p182) --[[ line: 15046 ]]
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var3019 = t_90.new()
	local var3020 = 0
	while var3020 < buffer.len(p182) do
		local _ = nil
		local var3021 = nil
		local var3022, var3023, var3024 = protoModule.readTag(p182, var3020)
		local var3025 = var3022
		var3021 = var3023
		var3020 = var3024
		
		if var3021 == protoModule.wireTypes.varint then
			local _ = nil
			local var3026, var3027 = protoModule.readVarInt(p182, var3020)
			local _ = var3026
			var3020 = var3027
			continue
		end
		if var3021 == protoModule.wireTypes.lengthDelimited then
			if var3025 == 1 then
				local _ = nil
				local var3028, var3029 = protoModule.readBuffer(p182, var3020)
				var3020 = var3029
				table.insert(var3019.options, t.ArrayOfAvatarProp_ConditionalOption.decode(var3028))
			else
				local _ = nil
				local var3030, var3031 = protoModule.readVarInt(p182, var3020)
				var3020 = var3031 + var3030
			end
		elseif var3021 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3032, var3033 = protoModule.readFixed32(p182, var3020)
			local _ = var3032
			var3020 = var3033
		elseif var3021 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3034, var3035 = protoModule.readFixed64(p182, var3020)
			local _ = var3034
			var3020 = var3035
		else
			error("Unsupported wire type: " .. var3021)
		end
	end
	return var3019
end

function t_90:jsonEncode() --[[ line: 15089 ]]
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

function t_90:jsonDecode() --[[ line: 15103 ]]
	-- upvalues: t_90 (ref), t (ref)
	local var3038 = t_90.new()
	
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.ArrayOfAvatarProp_ConditionalOption.jsonDecode(v))
		end
		var3038.options = t_1
	end
	return var3038
end

t_90.descriptor = {
	name = "ArrayOfAvatarProp_ConditionalOptions",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConditionalOptions"
}
t.ArrayOfAvatarProp_ConditionalOptions = t_90
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ConditionalOptions)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p183) --[[ line: 15134 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		array = if p183 == nil or p183.array == nil then {} else p183.array
	}, t_91)
end

function t_91:encode() --[[ line: 15142 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3041 = 0
	
	if self.array ~= nil and #self.array > 0 then
		for i, v in self.array do
			local var3042 = v:encode()
			local var3043, var3044 = protoModule.writeTag(buff, var3041, 1, protoModule.wireTypes.lengthDelimited)
			var3043, var3044 = protoModule.writeBuffer(var3043, var3044, var3042, buffer.len(var3042))
			buff = var3043
			var3041 = var3044
		end
	end
	local buff_1 = buffer.create(var3041)
	buffer.copy(buff_1, 0, buff, 0, var3041)
	
	return buff_1
end

function t_91.decode(p184) --[[ line: 15159 ]]
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3046 = t_91.new()
	local var3047 = 0
	while var3047 < buffer.len(p184) do
		local _ = nil
		local var3048 = nil
		local var3049, var3050, var3051 = protoModule.readTag(p184, var3047)
		local var3052 = var3049
		var3048 = var3050
		var3047 = var3051
		
		if var3048 == protoModule.wireTypes.varint then
			local _ = nil
			local var3053, var3054 = protoModule.readVarInt(p184, var3047)
			local _ = var3053
			var3047 = var3054
			continue
		end
		if var3048 == protoModule.wireTypes.lengthDelimited then
			if var3052 == 1 then
				local _ = nil
				local var3055, var3056 = protoModule.readBuffer(p184, var3047)
				var3047 = var3056
				table.insert(var3046.array, t.AvatarProp.decode(var3055))
			else
				local _ = nil
				local var3057, var3058 = protoModule.readVarInt(p184, var3047)
				var3047 = var3058 + var3057
			end
		elseif var3048 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3059, var3060 = protoModule.readFixed32(p184, var3047)
			local _ = var3059
			var3047 = var3060
		elseif var3048 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3061, var3062 = protoModule.readFixed64(p184, var3047)
			local _ = var3061
			var3047 = var3062
		else
			error("Unsupported wire type: " .. var3048)
		end
	end
	return var3046
end

function t_91:jsonEncode() --[[ line: 15202 ]]
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

function t_91:jsonDecode() --[[ line: 15216 ]]
	-- upvalues: t_91 (ref), t (ref)
	local var3065 = t_91.new()
	
	if self.array ~= nil then
		local t_1 = {}
		
		for i, v in self.array do
			table.insert(t_1, t.AvatarProp.jsonDecode(v))
		end
		var3065.array = t_1
	end
	return var3065
end

t_91.descriptor = {
	name = "ArrayOfAvatarProp_ArrayOfAvatars",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayOfAvatars"
}
t.ArrayOfAvatarProp_ArrayOfAvatars = t_91
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayOfAvatars)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p185) --[[ line: 15247 ]]
	-- upvalues: t_92 (ref)
	return setmetatable({
		kind = if p185 == nil or p185.kind == nil then nil else p185.kind,
		item_hydration_specs = if p185 == nil or p185.item_hydration_specs == nil then {} else p185.item_hydration_specs,
		field_map = if p185 == nil or p185.field_map == nil then nil else p185.field_map
	}, t_92)
end

function t_92:encode() --[[ line: 15259 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3068 = 0
	
	if self.kind ~= nil and self.kind.type == "binding_path" then
		local var3069, var3070 = protoModule.writeTag(buff, var3068, 1, protoModule.wireTypes.lengthDelimited)
		var3069, var3070 = protoModule.writeString(var3069, var3070, self.kind.value)
		buff = var3069
		var3068 = var3070
	end
	if self.item_hydration_specs ~= nil and #self.item_hydration_specs > 0 then
		for i, v in self.item_hydration_specs do
			local var3071 = v:encode()
			local var3072, var3073 = protoModule.writeTag(buff, var3068, 3, protoModule.wireTypes.lengthDelimited)
			var3072, var3073 = protoModule.writeBuffer(var3072, var3073, var3071, buffer.len(var3071))
			buff = var3072
			var3068 = var3073
		end
	end
	if self.field_map ~= nil then
		local var3074 = self.field_map:encode()
		local var3075, var3076 = protoModule.writeTag(buff, var3068, 4, protoModule.wireTypes.lengthDelimited)
		var3075, var3076 = protoModule.writeBuffer(var3075, var3076, var3074, buffer.len(var3074))
		buff = var3075
		var3068 = var3076
	end
	local buff_1 = buffer.create(var3068)
	buffer.copy(buff_1, 0, buff, 0, var3068)
	
	return buff_1
end

function t_92.decode(p186) --[[ line: 15289 ]]
	-- upvalues: t_92 (ref), protoModule (ref), hydrationDataSpecModule (ref), t (ref)
	local var3078 = t_92.new()
	local var3079 = 0
	while var3079 < buffer.len(p186) do
		local _ = nil
		local var3080 = nil
		local var3081, var3082, var3083 = protoModule.readTag(p186, var3079)
		local var3084 = var3081
		var3080 = var3082
		var3079 = var3083
		
		if var3080 == protoModule.wireTypes.varint then
			local _ = nil
			local var3085, var3086 = protoModule.readVarInt(p186, var3079)
			local _ = var3085
			var3079 = var3086
			continue
		end
		if var3080 == protoModule.wireTypes.lengthDelimited then
			if var3084 == 1 then
				local _ = nil
				local var3087, var3088 = protoModule.readBuffer(p186, var3079)
				var3079 = var3088
				var3078.kind = { type = "binding_path", value = buffer.tostring(var3087) }
			elseif var3084 == 3 then
				local _ = nil
				local var3089, var3090 = protoModule.readBuffer(p186, var3079)
				var3079 = var3090
				table.insert(var3078.item_hydration_specs, hydrationDataSpecModule.HydrationDataSpec.decode(var3089))
			elseif var3084 == 4 then
				local _ = nil
				local var3091, var3092 = protoModule.readBuffer(p186, var3079)
				var3079 = var3092
				var3078.field_map = t.AvatarConfigProp.decode(var3091)
			else
				local _ = nil
				local var3093, var3094 = protoModule.readVarInt(p186, var3079)
				var3079 = var3094 + var3093
			end
		elseif var3080 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3095, var3096 = protoModule.readFixed32(p186, var3079)
			local _ = var3095
			var3079 = var3096
		elseif var3080 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3097, var3098 = protoModule.readFixed64(p186, var3079)
			local _ = var3097
			var3079 = var3098
		else
			error("Unsupported wire type: " .. var3080)
		end
	end
	return var3078
end

function t_92:jsonEncode() --[[ line: 15345 ]]
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

function t_92:jsonDecode() --[[ line: 15369 ]]
	-- upvalues: t_92 (ref), hydrationDataSpecModule (ref), t (ref)
	local var3101 = t_92.new()
	
	if self.binding_path ~= nil then
		var3101.kind = { type = "binding_path", value = self.binding_path }
	end
	if self.bindingPath ~= nil then
		var3101.kind = { type = "binding_path", value = self.bindingPath }
	end
	if self.item_hydration_specs ~= nil then
		local t_1 = {}
		
		for i, v in self.item_hydration_specs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var3101.item_hydration_specs = t_1
	end
	if self.itemHydrationSpecs ~= nil then
		local t_1 = {}
		
		for i, v in self.itemHydrationSpecs do
			table.insert(t_1, hydrationDataSpecModule.HydrationDataSpec.jsonDecode(v))
		end
		var3101.item_hydration_specs = t_1
	end
	if self.field_map ~= nil then
		var3101.field_map = t.AvatarConfigProp.jsonDecode(self.field_map)
	end
	if self.fieldMap ~= nil then
		var3101.field_map = t.AvatarConfigProp.jsonDecode(self.fieldMap)
	end
	return var3101
end

t_92.descriptor = {
	name = "ArrayOfAvatarProp_ArrayMap",
	fullName = "roblox.apppageplatform.shared.v1beta1.ArrayMap"
}
t.ArrayOfAvatarProp_ArrayMap = t_92
typeRegistryModule.default:register(t.ArrayOfAvatarProp_ArrayMap)

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
	ArrayOfAvatarProp_ArrayMap = t.ArrayOfAvatarProp_ArrayMap
}