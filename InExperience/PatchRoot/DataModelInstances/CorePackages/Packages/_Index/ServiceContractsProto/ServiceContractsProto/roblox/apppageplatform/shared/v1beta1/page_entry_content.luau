local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local pageEntryModule = require(script.Parent.page_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 4053 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entry = if p0 == nil or p0.page_entry == nil then nil else p0.page_entry,
		input_data = if p0 == nil or p0.input_data == nil then nil else p0.input_data
	}, t_1)
end

function t_1:encode() --[[ line: 4060 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var132 = 0
	
	if self.page_entry ~= nil then
		local var133 = self.page_entry:encode()
		local var134, var135 = protoModule.writeTag(buff, var132, 1, protoModule.wireTypes.lengthDelimited)
		var134, var135 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
		buff = var134
		var132 = var135
	end
	if self.input_data ~= nil then
		local var136 = self.input_data:encode()
		local var137, var138 = protoModule.writeTag(buff, var132, 2, protoModule.wireTypes.lengthDelimited)
		var137, var138 = protoModule.writeBuffer(var137, var138, var136, buffer.len(var136))
		buff = var137
		var132 = var138
	end
	local buff_1 = buffer.create(var132)
	buffer.copy(buff_1, 0, buff, 0, var132)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 4081 ]]
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var140 = t_1.new()
	local var141 = 0
	while var141 < buffer.len(p1) do
		local _ = nil
		local var142 = nil
		local var143, var144, var145 = protoModule.readTag(p1, var141)
		local var146 = var143
		var142 = var144
		var141 = var145
		
		if var142 == protoModule.wireTypes.varint then
			local _ = nil
			local var147, var148 = protoModule.readVarInt(p1, var141)
			local _ = var147
			var141 = var148
			continue
		end
		if var142 == protoModule.wireTypes.lengthDelimited then
			if var146 == 1 then
				local _ = nil
				local var149, var150 = protoModule.readBuffer(p1, var141)
				var141 = var150
				var140.page_entry = pageEntryModule.PageEntry.decode(var149)
			elseif var146 == 2 then
				local _ = nil
				local var151, var152 = protoModule.readBuffer(p1, var141)
				var141 = var152
				var140.input_data = t.PageEntryInputData.decode(var151)
			else
				local _ = nil
				local var153, var154 = protoModule.readVarInt(p1, var141)
				var141 = var154 + var153
			end
		elseif var142 == protoModule.wireTypes.i32 then
			local _ = nil
			local var155, var156 = protoModule.readFixed32(p1, var141)
			local _ = var155
			var141 = var156
		elseif var142 == protoModule.wireTypes.i64 then
			local _ = nil
			local var157, var158 = protoModule.readFixed64(p1, var141)
			local _ = var157
			var141 = var158
		else
			error("Unsupported wire type: " .. var142)
		end
	end
	return var140
end

function t_1:jsonEncode() --[[ line: 4129 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 4143 ]]
	-- upvalues: t_1 (ref), pageEntryModule (ref), t (ref)
	local var160 = t_1.new()
	
	if self.page_entry ~= nil then
		var160.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var160.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var160.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var160.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var160
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 4179 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p2 == nil or p2.input_data == nil then nil else p2.input_data,
		roblox_component = if p2 == nil or p2.roblox_component == nil then "" else p2.roblox_component
	}, t_2)
end

function t_2:encode() --[[ line: 4186 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var162 = 0
	
	if self.input_data ~= nil then
		local var163 = self.input_data:encode()
		local var164, var165 = protoModule.writeTag(buff, var162, 1, protoModule.wireTypes.lengthDelimited)
		var164, var165 = protoModule.writeBuffer(var164, var165, var163, buffer.len(var163))
		buff = var164
		var162 = var165
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var166, var167 = protoModule.writeTag(buff, var162, 2, protoModule.wireTypes.lengthDelimited)
		var166, var167 = protoModule.writeString(var166, var167, self.roblox_component)
		buff = var166
		var162 = var167
	end
	local buff_1 = buffer.create(var162)
	buffer.copy(buff_1, 0, buff, 0, var162)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 4206 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var169 = t_2.new()
	local var170 = 0
	while var170 < buffer.len(p3) do
		local _ = nil
		local var171 = nil
		local var172, var173, var174 = protoModule.readTag(p3, var170)
		local var175 = var172
		var171 = var173
		var170 = var174
		
		if var171 == protoModule.wireTypes.varint then
			local _ = nil
			local var176, var177 = protoModule.readVarInt(p3, var170)
			local _ = var176
			var170 = var177
			continue
		end
		if var171 == protoModule.wireTypes.lengthDelimited then
			if var175 == 1 then
				local _ = nil
				local var178, var179 = protoModule.readBuffer(p3, var170)
				var170 = var179
				var169.input_data = t.PageEntryInputData.decode(var178)
			elseif var175 == 2 then
				local _ = nil
				local var180, var181 = protoModule.readBuffer(p3, var170)
				var170 = var181
				var169.roblox_component = buffer.tostring(var180)
			else
				local _ = nil
				local var182, var183 = protoModule.readVarInt(p3, var170)
				var170 = var183 + var182
			end
		elseif var171 == protoModule.wireTypes.i32 then
			local _ = nil
			local var184, var185 = protoModule.readFixed32(p3, var170)
			local _ = var184
			var170 = var185
		elseif var171 == protoModule.wireTypes.i64 then
			local _ = nil
			local var186, var187 = protoModule.readFixed64(p3, var170)
			local _ = var186
			var170 = var187
		else
			error("Unsupported wire type: " .. var171)
		end
	end
	return var169
end

function t_2:jsonEncode() --[[ line: 4254 ]]
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_2:jsonDecode() --[[ line: 4268 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var189 = t_2.new()
	
	if self.input_data ~= nil then
		var189.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var189.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var189.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var189.roblox_component = self.robloxComponent
	end
	return var189
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 4304 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p4 == nil or p4.roblox_component == nil then "" else p4.roblox_component,
		input_data = if p4 == nil or p4.input_data == nil then nil else p4.input_data,
		cta_buttons = if p4 == nil or p4.cta_buttons == nil then nil else p4.cta_buttons
	}, t_3)
end

function t_3:encode() --[[ line: 4312 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var191 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var192, var193 = protoModule.writeTag(buff, var191, 1, protoModule.wireTypes.lengthDelimited)
		var192, var193 = protoModule.writeString(var192, var193, self.roblox_component)
		buff = var192
		var191 = var193
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var194 = self.input_data.value:encode()
		local var195, var196 = protoModule.writeTag(buff, var191, 2, protoModule.wireTypes.lengthDelimited)
		var195, var196 = protoModule.writeBuffer(var195, var196, var194, buffer.len(var194))
		buff = var195
		var191 = var196
	end
	if self.cta_buttons ~= nil then
		local var197 = self.cta_buttons:encode()
		local var198, var199 = protoModule.writeTag(buff, var191, 3, protoModule.wireTypes.lengthDelimited)
		var198, var199 = protoModule.writeBuffer(var198, var199, var197, buffer.len(var197))
		buff = var198
		var191 = var199
	end
	local buff_1 = buffer.create(var191)
	buffer.copy(buff_1, 0, buff, 0, var191)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 4340 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var201 = t_3.new()
	local var202 = 0
	while var202 < buffer.len(p5) do
		local _ = nil
		local var203 = nil
		local var204, var205, var206 = protoModule.readTag(p5, var202)
		local var207 = var204
		var203 = var205
		var202 = var206
		
		if var203 == protoModule.wireTypes.varint then
			local _ = nil
			local var208, var209 = protoModule.readVarInt(p5, var202)
			local _ = var208
			var202 = var209
			continue
		end
		if var203 == protoModule.wireTypes.lengthDelimited then
			if var207 == 1 then
				local _ = nil
				local var210, var211 = protoModule.readBuffer(p5, var202)
				var202 = var211
				var201.roblox_component = buffer.tostring(var210)
			elseif var207 == 2 then
				local _ = nil
				local var212, var213 = protoModule.readBuffer(p5, var202)
				var202 = var213
				var201.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var212)
				}
			elseif var207 == 3 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p5, var202)
				var202 = var215
				var201.cta_buttons = t.CtaButtonsInputData.decode(var214)
			else
				local _ = nil
				local var216, var217 = protoModule.readVarInt(p5, var202)
				var202 = var217 + var216
			end
		elseif var203 == protoModule.wireTypes.i32 then
			local _ = nil
			local var218, var219 = protoModule.readFixed32(p5, var202)
			local _ = var218
			var202 = var219
		elseif var203 == protoModule.wireTypes.i64 then
			local _ = nil
			local var220, var221 = protoModule.readFixed64(p5, var202)
			local _ = var220
			var202 = var221
		else
			error("Unsupported wire type: " .. var203)
		end
	end
	return var201
end

function t_3:jsonEncode() --[[ line: 4394 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		t.attributionRow = self.input_data.value:jsonEncode()
	end
	if self.cta_buttons ~= nil then
		t.ctaButtons = self.cta_buttons:jsonEncode()
	end
	return t
end

function t_3:jsonDecode() --[[ line: 4414 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var223 = t_3.new()
	
	if self.roblox_component ~= nil then
		var223.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var223.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var223.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var223.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	if self.cta_buttons ~= nil then
		var223.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		var223.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
	end
	return var223
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 4460 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p6 == nil or p6.roblox_component == nil then "" else p6.roblox_component,
		input_data = if p6 == nil or p6.input_data == nil then nil else p6.input_data
	}, t_4)
end

function t_4:encode() --[[ line: 4467 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var225 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var226, var227 = protoModule.writeTag(buff, var225, 1, protoModule.wireTypes.lengthDelimited)
		var226, var227 = protoModule.writeString(var226, var227, self.roblox_component)
		buff = var226
		var225 = var227
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var228 = self.input_data.value:encode()
			local var229, var230 = protoModule.writeTag(buff, var225, 2, protoModule.wireTypes.lengthDelimited)
			var229, var230 = protoModule.writeBuffer(var229, var230, var228, buffer.len(var228))
			buff = var229
			var225 = var230
		elseif self.input_data.type == "video" then
			local var231 = self.input_data.value:encode()
			local var232, var233 = protoModule.writeTag(buff, var225, 3, protoModule.wireTypes.lengthDelimited)
			var232, var233 = protoModule.writeBuffer(var232, var233, var231, buffer.len(var231))
			buff = var232
			var225 = var233
		end
	end
	local buff_1 = buffer.create(var225)
	buffer.copy(buff_1, 0, buff, 0, var225)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 4493 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var235 = t_4.new()
	local var236 = 0
	while var236 < buffer.len(p7) do
		local _ = nil
		local var237 = nil
		local var238, var239, var240 = protoModule.readTag(p7, var236)
		local var241 = var238
		var237 = var239
		var236 = var240
		
		if var237 == protoModule.wireTypes.varint then
			local _ = nil
			local var242, var243 = protoModule.readVarInt(p7, var236)
			local _ = var242
			var236 = var243
			continue
		end
		if var237 == protoModule.wireTypes.lengthDelimited then
			if var241 == 1 then
				local _ = nil
				local var244, var245 = protoModule.readBuffer(p7, var236)
				var236 = var245
				var235.roblox_component = buffer.tostring(var244)
			elseif var241 == 2 then
				local _ = nil
				local var246, var247 = protoModule.readBuffer(p7, var236)
				var236 = var247
				var235.input_data = { type = "image", value = t.ImageInputData.decode(var246) }
			elseif var241 == 3 then
				local _ = nil
				local var248, var249 = protoModule.readBuffer(p7, var236)
				var236 = var249
				var235.input_data = { type = "video", value = t.VideoInputData.decode(var248) }
			else
				local _ = nil
				local var250, var251 = protoModule.readVarInt(p7, var236)
				var236 = var251 + var250
			end
		elseif var237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var252, var253 = protoModule.readFixed32(p7, var236)
			local _ = var252
			var236 = var253
		elseif var237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var254, var255 = protoModule.readFixed64(p7, var236)
			local _ = var254
			var236 = var255
		else
			error("Unsupported wire type: " .. var237)
		end
	end
	return var235
end

function t_4:jsonEncode() --[[ line: 4546 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			t.image = self.input_data.value:jsonEncode()
			
			return t
		elseif self.input_data.type == "video" then
			t.video = self.input_data.value:jsonEncode()
		end
	end
	return t
end

function t_4:jsonDecode() --[[ line: 4564 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var257 = t_4.new()
	
	if self.roblox_component ~= nil then
		var257.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var257.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var257.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	if self.video ~= nil then
		var257.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
		}
	end
	return var257
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 4600 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode() --[[ line: 4606 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var259 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var260 = self.kind.value:encode()
			local var261, var262 = protoModule.writeTag(buff, var259, 1, protoModule.wireTypes.lengthDelimited)
			var261, var262 = protoModule.writeBuffer(var261, var262, var260, buffer.len(var260))
			buff = var261
			var259 = var262
		elseif self.kind.type == "badge_details" then
			local var263 = self.kind.value:encode()
			local var264, var265 = protoModule.writeTag(buff, var259, 2, protoModule.wireTypes.lengthDelimited)
			var264, var265 = protoModule.writeBuffer(var264, var265, var263, buffer.len(var263))
			buff = var264
			var259 = var265
		elseif self.kind.type == "static_content" then
			local var266 = self.kind.value:encode()
			local var267, var268 = protoModule.writeTag(buff, var259, 3, protoModule.wireTypes.lengthDelimited)
			var267, var268 = protoModule.writeBuffer(var267, var268, var266, buffer.len(var266))
			buff = var267
			var259 = var268
		elseif self.kind.type == "experience_attribution_row" then
			local var269 = self.kind.value:encode()
			local var270, var271 = protoModule.writeTag(buff, var259, 4, protoModule.wireTypes.lengthDelimited)
			var270, var271 = protoModule.writeBuffer(var270, var271, var269, buffer.len(var269))
			buff = var270
			var259 = var271
		elseif self.kind.type == "experience_action_module" then
			local var272 = self.kind.value:encode()
			local var273, var274 = protoModule.writeTag(buff, var259, 5, protoModule.wireTypes.lengthDelimited)
			var273, var274 = protoModule.writeBuffer(var273, var274, var272, buffer.len(var272))
			buff = var273
			var259 = var274
		elseif self.kind.type == "experience_media_gallery" then
			local var275 = self.kind.value:encode()
			local var276, var277 = protoModule.writeTag(buff, var259, 6, protoModule.wireTypes.lengthDelimited)
			var276, var277 = protoModule.writeBuffer(var276, var277, var275, buffer.len(var275))
			buff = var276
			var259 = var277
		elseif self.kind.type == "experience_description" then
			local var278 = self.kind.value:encode()
			local var279, var280 = protoModule.writeTag(buff, var259, 7, protoModule.wireTypes.lengthDelimited)
			var279, var280 = protoModule.writeBuffer(var279, var280, var278, buffer.len(var278))
			buff = var279
			var259 = var280
		elseif self.kind.type == "experience_stat_row" then
			local var281 = self.kind.value:encode()
			local var282, var283 = protoModule.writeTag(buff, var259, 8, protoModule.wireTypes.lengthDelimited)
			var282, var283 = protoModule.writeBuffer(var282, var283, var281, buffer.len(var281))
			buff = var282
			var259 = var283
		elseif self.kind.type == "experience_info_table" then
			local var284 = self.kind.value:encode()
			local var285, var286 = protoModule.writeTag(buff, var259, 9, protoModule.wireTypes.lengthDelimited)
			var285, var286 = protoModule.writeBuffer(var285, var286, var284, buffer.len(var284))
			buff = var285
			var259 = var286
		elseif self.kind.type == "social_link_row" then
			local var287 = self.kind.value:encode()
			local var288, var289 = protoModule.writeTag(buff, var259, 10, protoModule.wireTypes.lengthDelimited)
			var288, var289 = protoModule.writeBuffer(var288, var289, var287, buffer.len(var287))
			buff = var288
			var259 = var289
		elseif self.kind.type == "experience_carousel" then
			local var290 = self.kind.value:encode()
			local var291, var292 = protoModule.writeTag(buff, var259, 11, protoModule.wireTypes.lengthDelimited)
			var291, var292 = protoModule.writeBuffer(var291, var292, var290, buffer.len(var290))
			buff = var291
			var259 = var292
		elseif self.kind.type == "song_carousel" then
			local var293 = self.kind.value:encode()
			local var294, var295 = protoModule.writeTag(buff, var259, 12, protoModule.wireTypes.lengthDelimited)
			var294, var295 = protoModule.writeBuffer(var294, var295, var293, buffer.len(var293))
			buff = var294
			var259 = var295
		elseif self.kind.type == "events_carousel" then
			local var296 = self.kind.value:encode()
			local var297, var298 = protoModule.writeTag(buff, var259, 13, protoModule.wireTypes.lengthDelimited)
			var297, var298 = protoModule.writeBuffer(var297, var298, var296, buffer.len(var296))
			buff = var297
			var259 = var298
		elseif self.kind.type == "game_pass_collection" then
			local var299 = self.kind.value:encode()
			local var300, var301 = protoModule.writeTag(buff, var259, 14, protoModule.wireTypes.lengthDelimited)
			var300, var301 = protoModule.writeBuffer(var300, var301, var299, buffer.len(var299))
			buff = var300
			var259 = var301
		elseif self.kind.type == "developer_product_collection" then
			local var302 = self.kind.value:encode()
			local var303, var304 = protoModule.writeTag(buff, var259, 15, protoModule.wireTypes.lengthDelimited)
			var303, var304 = protoModule.writeBuffer(var303, var304, var302, buffer.len(var302))
			buff = var303
			var259 = var304
		elseif self.kind.type == "subscription_collection" then
			local var305 = self.kind.value:encode()
			local var306, var307 = protoModule.writeTag(buff, var259, 16, protoModule.wireTypes.lengthDelimited)
			var306, var307 = protoModule.writeBuffer(var306, var307, var305, buffer.len(var305))
			buff = var306
			var259 = var307
		elseif self.kind.type == "dynamic_store_category" then
			local var308 = self.kind.value:encode()
			local var309, var310 = protoModule.writeTag(buff, var259, 17, protoModule.wireTypes.lengthDelimited)
			var309, var310 = protoModule.writeBuffer(var309, var310, var308, buffer.len(var308))
			buff = var309
			var259 = var310
		elseif self.kind.type == "card_container" then
			local var311 = self.kind.value:encode()
			local var312, var313 = protoModule.writeTag(buff, var259, 20, protoModule.wireTypes.lengthDelimited)
			var312, var313 = protoModule.writeBuffer(var312, var313, var311, buffer.len(var311))
			buff = var312
			var259 = var313
		elseif self.kind.type == "card" then
			local var314 = self.kind.value:encode()
			local var315, var316 = protoModule.writeTag(buff, var259, 21, protoModule.wireTypes.lengthDelimited)
			var315, var316 = protoModule.writeBuffer(var315, var316, var314, buffer.len(var314))
			buff = var315
			var259 = var316
		elseif self.kind.type == "dialog" then
			local var317 = self.kind.value:encode()
			local var318, var319 = protoModule.writeTag(buff, var259, 22, protoModule.wireTypes.lengthDelimited)
			var318, var319 = protoModule.writeBuffer(var318, var319, var317, buffer.len(var317))
			buff = var318
			var259 = var319
		elseif self.kind.type == "banner" then
			local var320 = self.kind.value:encode()
			local var321, var322 = protoModule.writeTag(buff, var259, 23, protoModule.wireTypes.lengthDelimited)
			var321, var322 = protoModule.writeBuffer(var321, var322, var320, buffer.len(var320))
			buff = var321
			var259 = var322
		elseif self.kind.type == "tooltip" then
			local var323 = self.kind.value:encode()
			local var324, var325 = protoModule.writeTag(buff, var259, 24, protoModule.wireTypes.lengthDelimited)
			var324, var325 = protoModule.writeBuffer(var324, var325, var323, buffer.len(var323))
			buff = var324
			var259 = var325
		elseif self.kind.type == "coachmark" then
			local var326 = self.kind.value:encode()
			local var327, var328 = protoModule.writeTag(buff, var259, 25, protoModule.wireTypes.lengthDelimited)
			var327, var328 = protoModule.writeBuffer(var327, var328, var326, buffer.len(var326))
			buff = var327
			var259 = var328
		elseif self.kind.type == "system_banner_prompt" then
			local var329 = self.kind.value:encode()
			local var330, var331 = protoModule.writeTag(buff, var259, 28, protoModule.wireTypes.lengthDelimited)
			var330, var331 = protoModule.writeBuffer(var330, var331, var329, buffer.len(var329))
			buff = var330
			var259 = var331
		elseif self.kind.type == "age_check_upsell" then
			local var332 = self.kind.value:encode()
			local var333, var334 = protoModule.writeTag(buff, var259, 29, protoModule.wireTypes.lengthDelimited)
			var333, var334 = protoModule.writeBuffer(var333, var334, var332, buffer.len(var332))
			buff = var333
			var259 = var334
		elseif self.kind.type == "catalog_item_list" then
			local var335 = self.kind.value:encode()
			local var336, var337 = protoModule.writeTag(buff, var259, 26, protoModule.wireTypes.lengthDelimited)
			var336, var337 = protoModule.writeBuffer(var336, var337, var335, buffer.len(var335))
			buff = var336
			var259 = var337
		elseif self.kind.type == "user_list" then
			local var338 = self.kind.value:encode()
			local var339, var340 = protoModule.writeTag(buff, var259, 27, protoModule.wireTypes.lengthDelimited)
			var339, var340 = protoModule.writeBuffer(var339, var340, var338, buffer.len(var338))
			buff = var339
			var259 = var340
		elseif self.kind.type == "experience_content_rating_label" then
			local var341 = self.kind.value:encode()
			local var342, var343 = protoModule.writeTag(buff, var259, 30, protoModule.wireTypes.lengthDelimited)
			var342, var343 = protoModule.writeBuffer(var342, var343, var341, buffer.len(var341))
			buff = var342
			var259 = var343
		elseif self.kind.type == "experience_refund_policy" then
			local var344 = self.kind.value:encode()
			local var345, var346 = protoModule.writeTag(buff, var259, 31, protoModule.wireTypes.lengthDelimited)
			var345, var346 = protoModule.writeBuffer(var345, var346, var344, buffer.len(var344))
			buff = var345
			var259 = var346
		elseif self.kind.type == "experience_play_with_reward" then
			local var347 = self.kind.value:encode()
			local var348, var349 = protoModule.writeTag(buff, var259, 32, protoModule.wireTypes.lengthDelimited)
			var348, var349 = protoModule.writeBuffer(var348, var349, var347, buffer.len(var347))
			buff = var348
			var259 = var349
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var350 = self.kind.value:encode()
			local var351, var352 = protoModule.writeTag(buff, var259, 33, protoModule.wireTypes.lengthDelimited)
			var351, var352 = protoModule.writeBuffer(var351, var352, var350, buffer.len(var350))
			buff = var351
			var259 = var352
		elseif self.kind.type == "community_section" then
			local var353 = self.kind.value:encode()
			local var354, var355 = protoModule.writeTag(buff, var259, 35, protoModule.wireTypes.lengthDelimited)
			var354, var355 = protoModule.writeBuffer(var354, var355, var353, buffer.len(var353))
			buff = var354
			var259 = var355
		elseif self.kind.type == "moments_carousel" then
			local var356 = self.kind.value:encode()
			local var357, var358 = protoModule.writeTag(buff, var259, 34, protoModule.wireTypes.lengthDelimited)
			var357, var358 = protoModule.writeBuffer(var357, var358, var356, buffer.len(var356))
			buff = var357
			var259 = var358
		elseif self.kind.type == "text" then
			local var359 = self.kind.value:encode()
			local var360, var361 = protoModule.writeTag(buff, var259, 40, protoModule.wireTypes.lengthDelimited)
			var360, var361 = protoModule.writeBuffer(var360, var361, var359, buffer.len(var359))
			buff = var360
			var259 = var361
		elseif self.kind.type == "vertical_feed" then
			local var362 = self.kind.value:encode()
			local var363, var364 = protoModule.writeTag(buff, var259, 41, protoModule.wireTypes.lengthDelimited)
			var363, var364 = protoModule.writeBuffer(var363, var364, var362, buffer.len(var362))
			buff = var363
			var259 = var364
		elseif self.kind.type == "page_header" then
			local var365 = self.kind.value:encode()
			local var366, var367 = protoModule.writeTag(buff, var259, 42, protoModule.wireTypes.lengthDelimited)
			var366, var367 = protoModule.writeBuffer(var366, var367, var365, buffer.len(var365))
			buff = var366
			var259 = var367
		elseif self.kind.type == "image_cta_section" then
			local var368 = self.kind.value:encode()
			local var369, var370 = protoModule.writeTag(buff, var259, 43, protoModule.wireTypes.lengthDelimited)
			var369, var370 = protoModule.writeBuffer(var369, var370, var368, buffer.len(var368))
			buff = var369
			var259 = var370
		elseif self.kind.type == "experience_details_feed" then
			local var371 = self.kind.value:encode()
			local var372, var373 = protoModule.writeTag(buff, var259, 500, protoModule.wireTypes.lengthDelimited)
			var372, var373 = protoModule.writeBuffer(var372, var373, var371, buffer.len(var371))
			buff = var372
			var259 = var373
		elseif self.kind.type == "experience_details_action_bar" then
			local var374 = self.kind.value:encode()
			local var375, var376 = protoModule.writeTag(buff, var259, 501, protoModule.wireTypes.lengthDelimited)
			var375, var376 = protoModule.writeBuffer(var375, var376, var374, buffer.len(var374))
			buff = var375
			var259 = var376
		elseif self.kind.type == "experience_details_banner_image" then
			local var377 = self.kind.value:encode()
			local var378, var379 = protoModule.writeTag(buff, var259, 502, protoModule.wireTypes.lengthDelimited)
			var378, var379 = protoModule.writeBuffer(var378, var379, var377, buffer.len(var377))
			buff = var378
			var259 = var379
		elseif self.kind.type == "experience_details_sticky_header" then
			local var380 = self.kind.value:encode()
			local var381, var382 = protoModule.writeTag(buff, var259, 503, protoModule.wireTypes.lengthDelimited)
			var381, var382 = protoModule.writeBuffer(var381, var382, var380, buffer.len(var380))
			buff = var381
			var259 = var382
		elseif self.kind.type == "event_details_feed" then
			local var383 = self.kind.value:encode()
			local var384, var385 = protoModule.writeTag(buff, var259, 600, protoModule.wireTypes.lengthDelimited)
			var384, var385 = protoModule.writeBuffer(var384, var385, var383, buffer.len(var383))
			buff = var384
			var259 = var385
		elseif self.kind.type == "event_details_action_bar" then
			local var386 = self.kind.value:encode()
			local var387, var388 = protoModule.writeTag(buff, var259, 601, protoModule.wireTypes.lengthDelimited)
			var387, var388 = protoModule.writeBuffer(var387, var388, var386, buffer.len(var386))
			buff = var387
			var259 = var388
		elseif self.kind.type == "event_attribution_row" then
			local var389 = self.kind.value:encode()
			local var390, var391 = protoModule.writeTag(buff, var259, 602, protoModule.wireTypes.lengthDelimited)
			var390, var391 = protoModule.writeBuffer(var390, var391, var389, buffer.len(var389))
			buff = var390
			var259 = var391
		elseif self.kind.type == "event_description" then
			local var392 = self.kind.value:encode()
			local var393, var394 = protoModule.writeTag(buff, var259, 603, protoModule.wireTypes.lengthDelimited)
			var393, var394 = protoModule.writeBuffer(var393, var394, var392, buffer.len(var392))
			buff = var393
			var259 = var394
		elseif self.kind.type == "event_info_table" then
			local var395 = self.kind.value:encode()
			local var396, var397 = protoModule.writeTag(buff, var259, 604, protoModule.wireTypes.lengthDelimited)
			var396, var397 = protoModule.writeBuffer(var396, var397, var395, buffer.len(var395))
			buff = var396
			var259 = var397
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var398 = self.kind.value:encode()
			local var399, var400 = protoModule.writeTag(buff, var259, 605, protoModule.wireTypes.lengthDelimited)
			var399, var400 = protoModule.writeBuffer(var399, var400, var398, buffer.len(var398))
			buff = var399
			var259 = var400
		elseif self.kind.type == "event_notifications_modal" then
			local var401 = self.kind.value:encode()
			local var402, var403 = protoModule.writeTag(buff, var259, 606, protoModule.wireTypes.lengthDelimited)
			var402, var403 = protoModule.writeBuffer(var402, var403, var401, buffer.len(var401))
			buff = var402
			var259 = var403
		elseif self.kind.type == "dev_store_feed" then
			local var404 = self.kind.value:encode()
			local var405, var406 = protoModule.writeTag(buff, var259, 700, protoModule.wireTypes.lengthDelimited)
			var405, var406 = protoModule.writeBuffer(var405, var406, var404, buffer.len(var404))
			buff = var405
			var259 = var406
		elseif self.kind.type == "charts_feed" then
			local var407 = self.kind.value:encode()
			local var408, var409 = protoModule.writeTag(buff, var259, 800, protoModule.wireTypes.lengthDelimited)
			var408, var409 = protoModule.writeBuffer(var408, var409, var407, buffer.len(var407))
			buff = var408
			var259 = var409
		elseif self.kind.type == "filter_pills" then
			local var410 = self.kind.value:encode()
			local var411, var412 = protoModule.writeTag(buff, var259, 801, protoModule.wireTypes.lengthDelimited)
			var411, var412 = protoModule.writeBuffer(var411, var412, var410, buffer.len(var410))
			buff = var411
			var259 = var412
		elseif self.kind.type == "sort_selector" then
			local var413 = self.kind.value:encode()
			local var414, var415 = protoModule.writeTag(buff, var259, 802, protoModule.wireTypes.lengthDelimited)
			var414, var415 = protoModule.writeBuffer(var414, var415, var413, buffer.len(var413))
			buff = var414
			var259 = var415
		elseif self.kind.type == "genre_selector" then
			local var416 = self.kind.value:encode()
			local var417, var418 = protoModule.writeTag(buff, var259, 803, protoModule.wireTypes.lengthDelimited)
			var417, var418 = protoModule.writeBuffer(var417, var418, var416, buffer.len(var416))
			buff = var417
			var259 = var418
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var419 = self.kind.value:encode()
			local var420, var421 = protoModule.writeTag(buff, var259, 900, protoModule.wireTypes.lengthDelimited)
			var420, var421 = protoModule.writeBuffer(var420, var421, var419, buffer.len(var419))
			buff = var420
			var259 = var421
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var422 = self.kind.value:encode()
			local var423, var424 = protoModule.writeTag(buff, var259, 901, protoModule.wireTypes.lengthDelimited)
			var423, var424 = protoModule.writeBuffer(var423, var424, var422, buffer.len(var422))
			buff = var423
			var259 = var424
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var425 = self.kind.value:encode()
			local var426, var427 = protoModule.writeTag(buff, var259, 902, protoModule.wireTypes.lengthDelimited)
			var426, var427 = protoModule.writeBuffer(var426, var427, var425, buffer.len(var425))
			buff = var426
			var259 = var427
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var428 = self.kind.value:encode()
			local var429, var430 = protoModule.writeTag(buff, var259, 903, protoModule.wireTypes.lengthDelimited)
			var429, var430 = protoModule.writeBuffer(var429, var430, var428, buffer.len(var428))
			buff = var429
			var259 = var430
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var431 = self.kind.value:encode()
			local var432, var433 = protoModule.writeTag(buff, var259, 904, protoModule.wireTypes.lengthDelimited)
			var432, var433 = protoModule.writeBuffer(var432, var433, var431, buffer.len(var431))
			buff = var432
			var259 = var433
		elseif self.kind.type == "catalog_item_grid" then
			local var434 = self.kind.value:encode()
			local var435, var436 = protoModule.writeTag(buff, var259, 905, protoModule.wireTypes.lengthDelimited)
			var435, var436 = protoModule.writeBuffer(var435, var436, var434, buffer.len(var434))
			buff = var435
			var259 = var436
		elseif self.kind.type == "marketplace_offer_modal" then
			local var437 = self.kind.value:encode()
			local var438, var439 = protoModule.writeTag(buff, var259, 906, protoModule.wireTypes.lengthDelimited)
			var438, var439 = protoModule.writeBuffer(var438, var439, var437, buffer.len(var437))
			buff = var438
			var259 = var439
		elseif self.kind.type == "search_results_feed" then
			local var440 = self.kind.value:encode()
			local var441, var442 = protoModule.writeTag(buff, var259, 1000, protoModule.wireTypes.lengthDelimited)
			var441, var442 = protoModule.writeBuffer(var441, var442, var440, buffer.len(var440))
			buff = var441
			var259 = var442
		elseif self.kind.type == "power_search_ai_overview" then
			local var443 = self.kind.value:encode()
			local var444, var445 = protoModule.writeTag(buff, var259, 1001, protoModule.wireTypes.lengthDelimited)
			var444, var445 = protoModule.writeBuffer(var444, var445, var443, buffer.len(var443))
			buff = var444
			var259 = var445
		elseif self.kind.type == "experience_emphasis_tile" then
			local var446 = self.kind.value:encode()
			local var447, var448 = protoModule.writeTag(buff, var259, 1002, protoModule.wireTypes.lengthDelimited)
			var447, var448 = protoModule.writeBuffer(var447, var448, var446, buffer.len(var446))
			buff = var447
			var259 = var448
		elseif self.kind.type == "option_selector_carousel" then
			local var449 = self.kind.value:encode()
			local var450, var451 = protoModule.writeTag(buff, var259, 1100, protoModule.wireTypes.lengthDelimited)
			var450, var451 = protoModule.writeBuffer(var450, var451, var449, buffer.len(var449))
			buff = var450
			var259 = var451
		elseif self.kind.type == "game_items_carousel" then
			local var452 = self.kind.value:encode()
			local var453, var454 = protoModule.writeTag(buff, var259, 1101, protoModule.wireTypes.lengthDelimited)
			var453, var454 = protoModule.writeBuffer(var453, var454, var452, buffer.len(var452))
			buff = var453
			var259 = var454
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var455 = self.kind.value:encode()
			local var456, var457 = protoModule.writeTag(buff, var259, 1103, protoModule.wireTypes.lengthDelimited)
			var456, var457 = protoModule.writeBuffer(var456, var457, var455, buffer.len(var455))
			buff = var456
			var259 = var457
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var458 = self.kind.value:encode()
			local var459, var460 = protoModule.writeTag(buff, var259, 1200, protoModule.wireTypes.lengthDelimited)
			var459, var460 = protoModule.writeBuffer(var459, var460, var458, buffer.len(var458))
			buff = var459
			var259 = var460
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var461 = self.kind.value:encode()
			local var462, var463 = protoModule.writeTag(buff, var259, 1300, protoModule.wireTypes.lengthDelimited)
			var462, var463 = protoModule.writeBuffer(var462, var463, var461, buffer.len(var461))
			buff = var462
			var259 = var463
		end
	end
	local buff_1 = buffer.create(var259)
	buffer.copy(buff_1, 0, buff, 0, var259)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 4891 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var465 = t_5.new()
	local var466 = 0
	while var466 < buffer.len(p9) do
		local _ = nil
		local var467 = nil
		local var468, var469, var470 = protoModule.readTag(p9, var466)
		local var471 = var468
		var467 = var469
		var466 = var470
		
		if var467 == protoModule.wireTypes.varint then
			local _ = nil
			local var472, var473 = protoModule.readVarInt(p9, var466)
			local _ = var472
			var466 = var473
			continue
		end
		if var467 == protoModule.wireTypes.lengthDelimited then
			if var471 == 1 then
				local _ = nil
				local var474, var475 = protoModule.readBuffer(p9, var466)
				var466 = var475
				var465.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var474)
				}
			elseif var471 == 2 then
				local _ = nil
				local var476, var477 = protoModule.readBuffer(p9, var466)
				var466 = var477
				var465.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var476)
				}
			elseif var471 == 3 then
				local _ = nil
				local var478, var479 = protoModule.readBuffer(p9, var466)
				var466 = var479
				var465.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var478)
				}
			elseif var471 == 4 then
				local _ = nil
				local var480, var481 = protoModule.readBuffer(p9, var466)
				var466 = var481
				var465.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var480)
				}
			elseif var471 == 5 then
				local _ = nil
				local var482, var483 = protoModule.readBuffer(p9, var466)
				var466 = var483
				var465.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var482)
				}
			elseif var471 == 6 then
				local _ = nil
				local var484, var485 = protoModule.readBuffer(p9, var466)
				var466 = var485
				var465.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var484)
				}
			elseif var471 == 7 then
				local _ = nil
				local var486, var487 = protoModule.readBuffer(p9, var466)
				var466 = var487
				var465.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var486)
				}
			elseif var471 == 8 then
				local _ = nil
				local var488, var489 = protoModule.readBuffer(p9, var466)
				var466 = var489
				var465.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var488)
				}
			elseif var471 == 9 then
				local _ = nil
				local var490, var491 = protoModule.readBuffer(p9, var466)
				var466 = var491
				var465.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var490)
				}
			elseif var471 == 10 then
				local _ = nil
				local var492, var493 = protoModule.readBuffer(p9, var466)
				var466 = var493
				var465.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var492)
				}
			elseif var471 == 11 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p9, var466)
				var466 = var495
				var465.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var494)
				}
			elseif var471 == 12 then
				local _ = nil
				local var496, var497 = protoModule.readBuffer(p9, var466)
				var466 = var497
				var465.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var496)
				}
			elseif var471 == 13 then
				local _ = nil
				local var498, var499 = protoModule.readBuffer(p9, var466)
				var466 = var499
				var465.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var498)
				}
			elseif var471 == 14 then
				local _ = nil
				local var500, var501 = protoModule.readBuffer(p9, var466)
				var466 = var501
				var465.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var500)
				}
			elseif var471 == 15 then
				local _ = nil
				local var502, var503 = protoModule.readBuffer(p9, var466)
				var466 = var503
				var465.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var502)
				}
			elseif var471 == 16 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p9, var466)
				var466 = var505
				var465.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var504)
				}
			elseif var471 == 17 then
				local _ = nil
				local var506, var507 = protoModule.readBuffer(p9, var466)
				var466 = var507
				var465.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(var506)
				}
			elseif var471 == 20 then
				local _ = nil
				local var508, var509 = protoModule.readBuffer(p9, var466)
				var466 = var509
				var465.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var508)
				}
			elseif var471 == 21 then
				local _ = nil
				local var510, var511 = protoModule.readBuffer(p9, var466)
				var466 = var511
				var465.kind = { type = "card", value = t.CardInputData.decode(var510) }
			elseif var471 == 22 then
				local _ = nil
				local var512, var513 = protoModule.readBuffer(p9, var466)
				var466 = var513
				var465.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var512)
				}
			elseif var471 == 23 then
				local _ = nil
				local var514, var515 = protoModule.readBuffer(p9, var466)
				var466 = var515
				var465.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var514)
				}
			elseif var471 == 24 then
				local _ = nil
				local var516, var517 = protoModule.readBuffer(p9, var466)
				var466 = var517
				var465.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var516)
				}
			elseif var471 == 25 then
				local _ = nil
				local var518, var519 = protoModule.readBuffer(p9, var466)
				var466 = var519
				var465.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var518)
				}
			elseif var471 == 26 then
				local _ = nil
				local var520, var521 = protoModule.readBuffer(p9, var466)
				var466 = var521
				var465.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var520)
				}
			elseif var471 == 27 then
				local _ = nil
				local var522, var523 = protoModule.readBuffer(p9, var466)
				var466 = var523
				var465.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var522)
				}
			elseif var471 == 28 then
				local _ = nil
				local var524, var525 = protoModule.readBuffer(p9, var466)
				var466 = var525
				var465.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var524)
				}
			elseif var471 == 29 then
				local _ = nil
				local var526, var527 = protoModule.readBuffer(p9, var466)
				var466 = var527
				var465.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var526)
				}
			elseif var471 == 30 then
				local _ = nil
				local var528, var529 = protoModule.readBuffer(p9, var466)
				var466 = var529
				var465.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var528)
				}
			elseif var471 == 31 then
				local _ = nil
				local var530, var531 = protoModule.readBuffer(p9, var466)
				var466 = var531
				var465.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var530)
				}
			elseif var471 == 32 then
				local _ = nil
				local var532, var533 = protoModule.readBuffer(p9, var466)
				var466 = var533
				var465.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var532)
				}
			elseif var471 == 33 then
				local _ = nil
				local var534, var535 = protoModule.readBuffer(p9, var466)
				var466 = var535
				var465.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var534)
				}
			elseif var471 == 34 then
				local _ = nil
				local var536, var537 = protoModule.readBuffer(p9, var466)
				var466 = var537
				var465.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var536)
				}
			elseif var471 == 35 then
				local _ = nil
				local var538, var539 = protoModule.readBuffer(p9, var466)
				var466 = var539
				var465.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(var538)
				}
			elseif var471 == 40 then
				local _ = nil
				local var540, var541 = protoModule.readBuffer(p9, var466)
				var466 = var541
				var465.kind = { type = "text", value = t.TextInputData.decode(var540) }
			elseif var471 == 41 then
				local _ = nil
				local var542, var543 = protoModule.readBuffer(p9, var466)
				var466 = var543
				var465.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var542)
				}
			elseif var471 == 42 then
				local _ = nil
				local var544, var545 = protoModule.readBuffer(p9, var466)
				var466 = var545
				var465.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var544)
				}
			elseif var471 == 43 then
				local _ = nil
				local var546, var547 = protoModule.readBuffer(p9, var466)
				var466 = var547
				var465.kind = {
					type = "image_cta_section",
					value = t.ImageCtaSectionInputData.decode(var546)
				}
			elseif var471 == 500 then
				local _ = nil
				local var548, var549 = protoModule.readBuffer(p9, var466)
				var466 = var549
				var465.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var548)
				}
			elseif var471 == 501 then
				local _ = nil
				local var550, var551 = protoModule.readBuffer(p9, var466)
				var466 = var551
				var465.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var550)
				}
			elseif var471 == 502 then
				local _ = nil
				local var552, var553 = protoModule.readBuffer(p9, var466)
				var466 = var553
				var465.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var552)
				}
			elseif var471 == 503 then
				local _ = nil
				local var554, var555 = protoModule.readBuffer(p9, var466)
				var466 = var555
				var465.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var554)
				}
			elseif var471 == 600 then
				local _ = nil
				local var556, var557 = protoModule.readBuffer(p9, var466)
				var466 = var557
				var465.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var556)
				}
			elseif var471 == 601 then
				local _ = nil
				local var558, var559 = protoModule.readBuffer(p9, var466)
				var466 = var559
				var465.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var558)
				}
			elseif var471 == 602 then
				local _ = nil
				local var560, var561 = protoModule.readBuffer(p9, var466)
				var466 = var561
				var465.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var560)
				}
			elseif var471 == 603 then
				local _ = nil
				local var562, var563 = protoModule.readBuffer(p9, var466)
				var466 = var563
				var465.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var562)
				}
			elseif var471 == 604 then
				local _ = nil
				local var564, var565 = protoModule.readBuffer(p9, var466)
				var466 = var565
				var465.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var564)
				}
			elseif var471 == 605 then
				local _ = nil
				local var566, var567 = protoModule.readBuffer(p9, var466)
				var466 = var567
				var465.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var566)
				}
			elseif var471 == 606 then
				local _ = nil
				local var568, var569 = protoModule.readBuffer(p9, var466)
				var466 = var569
				var465.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var568)
				}
			elseif var471 == 700 then
				local _ = nil
				local var570, var571 = protoModule.readBuffer(p9, var466)
				var466 = var571
				var465.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var570)
				}
			elseif var471 == 800 then
				local _ = nil
				local var572, var573 = protoModule.readBuffer(p9, var466)
				var466 = var573
				var465.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var572)
				}
			elseif var471 == 801 then
				local _ = nil
				local var574, var575 = protoModule.readBuffer(p9, var466)
				var466 = var575
				var465.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var574)
				}
			elseif var471 == 802 then
				local _ = nil
				local var576, var577 = protoModule.readBuffer(p9, var466)
				var466 = var577
				var465.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var576)
				}
			elseif var471 == 803 then
				local _ = nil
				local var578, var579 = protoModule.readBuffer(p9, var466)
				var466 = var579
				var465.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var578)
				}
			elseif var471 == 900 then
				local _ = nil
				local var580, var581 = protoModule.readBuffer(p9, var466)
				var466 = var581
				var465.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var580)
				}
			elseif var471 == 901 then
				local _ = nil
				local var582, var583 = protoModule.readBuffer(p9, var466)
				var466 = var583
				var465.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var582)
				}
			elseif var471 == 902 then
				local _ = nil
				local var584, var585 = protoModule.readBuffer(p9, var466)
				var466 = var585
				var465.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var584)
				}
			elseif var471 == 903 then
				local _ = nil
				local var586, var587 = protoModule.readBuffer(p9, var466)
				var466 = var587
				var465.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var586)
				}
			elseif var471 == 904 then
				local _ = nil
				local var588, var589 = protoModule.readBuffer(p9, var466)
				var466 = var589
				var465.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var588)
				}
			elseif var471 == 905 then
				local _ = nil
				local var590, var591 = protoModule.readBuffer(p9, var466)
				var466 = var591
				var465.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var590)
				}
			elseif var471 == 906 then
				local _ = nil
				local var592, var593 = protoModule.readBuffer(p9, var466)
				var466 = var593
				var465.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var592)
				}
			elseif var471 == 1000 then
				local _ = nil
				local var594, var595 = protoModule.readBuffer(p9, var466)
				var466 = var595
				var465.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var594)
				}
			elseif var471 == 1001 then
				local _ = nil
				local var596, var597 = protoModule.readBuffer(p9, var466)
				var466 = var597
				var465.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var596)
				}
			elseif var471 == 1002 then
				local _ = nil
				local var598, var599 = protoModule.readBuffer(p9, var466)
				var466 = var599
				var465.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var598)
				}
			elseif var471 == 1100 then
				local _ = nil
				local var600, var601 = protoModule.readBuffer(p9, var466)
				var466 = var601
				var465.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var600)
				}
			elseif var471 == 1101 then
				local _ = nil
				local var602, var603 = protoModule.readBuffer(p9, var466)
				var466 = var603
				var465.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(var602)
				}
			elseif var471 == 1103 then
				local _ = nil
				local var604, var605 = protoModule.readBuffer(p9, var466)
				var466 = var605
				var465.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var604)
				}
			elseif var471 == 1200 then
				local _ = nil
				local var606, var607 = protoModule.readBuffer(p9, var466)
				var466 = var607
				var465.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var606)
				}
			elseif var471 == 1300 then
				local _ = nil
				local var608, var609 = protoModule.readBuffer(p9, var466)
				var466 = var609
				var465.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var608)
				}
			else
				local _ = nil
				local var610, var611 = protoModule.readVarInt(p9, var466)
				var466 = var611 + var610
			end
		elseif var467 == protoModule.wireTypes.i32 then
			local _ = nil
			local var612, var613 = protoModule.readFixed32(p9, var466)
			local _ = var612
			var466 = var613
		elseif var467 == protoModule.wireTypes.i64 then
			local _ = nil
			local var614, var615 = protoModule.readFixed64(p9, var466)
			local _ = var614
			var466 = var615
		else
			error("Unsupported wire type: " .. var467)
		end
	end
	return var465
end

function t_5:jsonEncode() --[[ line: 5367 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			t.badgesGrid = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "badge_details" then
			t.badgeDetails = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "static_content" then
			t.staticContent = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_attribution_row" then
			t.experienceAttributionRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_action_module" then
			t.experienceActionModule = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_media_gallery" then
			t.experienceMediaGallery = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_description" then
			t.experienceDescription = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_stat_row" then
			t.experienceStatRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_info_table" then
			t.experienceInfoTable = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "social_link_row" then
			t.socialLinkRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_carousel" then
			t.experienceCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "song_carousel" then
			t.songCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "events_carousel" then
			t.eventsCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "game_pass_collection" then
			t.gamePassCollection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "developer_product_collection" then
			t.developerProductCollection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "subscription_collection" then
			t.subscriptionCollection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "dynamic_store_category" then
			t.dynamicStoreCategory = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "card_container" then
			t.cardContainer = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "card" then
			t.card = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "dialog" then
			t.dialog = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "banner" then
			t.banner = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "tooltip" then
			t.tooltip = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "coachmark" then
			t.coachmark = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "system_banner_prompt" then
			t.systemBannerPrompt = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "age_check_upsell" then
			t.ageCheckUpsell = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "catalog_item_list" then
			t.catalogItemList = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "user_list" then
			t.userList = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_content_rating_label" then
			t.experienceContentRatingLabel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_refund_policy" then
			t.experienceRefundPolicy = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_play_with_reward" then
			t.experiencePlayWithReward = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_guidelines_dialog" then
			t.experienceGuidelinesDialog = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "community_section" then
			t.communitySection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "moments_carousel" then
			t.momentsCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "text" then
			t.text = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "vertical_feed" then
			t.verticalFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "page_header" then
			t.pageHeader = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "image_cta_section" then
			t.imageCtaSection = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_feed" then
			t.experienceDetailsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_action_bar" then
			t.experienceDetailsActionBar = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_banner_image" then
			t.experienceDetailsBannerImage = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_details_sticky_header" then
			t.experienceDetailsStickyHeader = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_details_feed" then
			t.eventDetailsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_details_action_bar" then
			t.eventDetailsActionBar = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_attribution_row" then
			t.eventAttributionRow = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_description" then
			t.eventDescription = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_info_table" then
			t.eventInfoTable = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			t.eventDetailsSheetFullBleed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "event_notifications_modal" then
			t.eventNotificationsModal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "dev_store_feed" then
			t.devStoreFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "charts_feed" then
			t.chartsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "filter_pills" then
			t.filterPills = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "sort_selector" then
			t.sortSelector = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "genre_selector" then
			t.genreSelector = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_feed" then
			t.marketplaceCatalogFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			t.marketplaceCatalogCategoryMenu = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_item_group" then
			t.marketplaceCatalogItemGroup = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			t.marketplaceCatalogItemCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			t.marketplaceCatalogHeroUnit = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "catalog_item_grid" then
			t.catalogItemGrid = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "marketplace_offer_modal" then
			t.marketplaceOfferModal = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "search_results_feed" then
			t.searchResultsFeed = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "power_search_ai_overview" then
			t.powerSearchAiOverview = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "experience_emphasis_tile" then
			t.experienceEmphasisTile = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "option_selector_carousel" then
			t.optionSelectorCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "game_items_carousel" then
			t.gameItemsCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "friend_recommendation_carousel" then
			t.friendRecommendationCarousel = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "party_chat_conversation_upsell" then
			t.partyChatConversationUpsell = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			t.preAuthLandingStickyHeader = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_5:jsonDecode() --[[ line: 5513 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var617 = t_5.new()
	
	if self.badges_grid ~= nil then
		var617.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var617.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var617.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var617.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var617.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var617.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var617.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var617.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var617.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var617.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var617.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var617.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var617.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var617.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var617.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var617.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var617.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var617.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var617.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var617.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var617.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var617.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var617.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var617.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var617.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var617.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var617.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var617.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var617.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var617.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var617.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var617.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var617.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var617.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var617.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var617.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var617.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var617.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var617.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var617.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var617.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var617.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var617.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var617.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var617.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var617.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var617.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var617.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var617.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var617.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var617.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var617.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var617.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var617.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var617.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var617.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var617.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var617.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var617.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var617.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var617.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var617.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var617.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var617.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var617.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var617.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var617.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var617.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var617.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var617.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var617.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var617.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var617.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var617.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var617.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var617.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var617.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var617.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var617.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var617.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var617.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var617.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var617.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var617.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var617.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var617.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var617.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var617.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var617.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var617.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var617.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var617.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var617.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var617.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var617.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var617.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var617.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var617.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var617.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var617.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var617.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var617.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var617.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var617.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var617.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var617.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var617.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var617.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var617.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var617.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var617.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var617.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var617.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var617.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var617.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var617.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var617.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var617.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var617.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var617.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var617.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var617.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var617.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var617.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var617.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var617.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var617.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var617.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var617.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var617.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	return var617
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 6369 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p10 == nil or p10.section_title == nil then "" else p10.section_title,
		badges = if p10 == nil or p10.badges == nil then {} else p10.badges,
		collection_id = if p10 == nil or p10.collection_id == nil then "" else p10.collection_id,
		collection_position = if p10 == nil or p10.collection_position == nil then "" else p10.collection_position,
		universe_id = if p10 == nil or p10.universe_id == nil then "" else p10.universe_id
	}, t_6)
end

function t_6:encode() --[[ line: 6381 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var619 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var620, var621 = protoModule.writeTag(buff, var619, 1, protoModule.wireTypes.lengthDelimited)
		var620, var621 = protoModule.writeString(var620, var621, self.section_title)
		buff = var620
		var619 = var621
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var622 = v:encode()
			local var623, var624 = protoModule.writeTag(buff, var619, 2, protoModule.wireTypes.lengthDelimited)
			var623, var624 = protoModule.writeBuffer(var623, var624, var622, buffer.len(var622))
			buff = var623
			var619 = var624
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var625, var626 = protoModule.writeTag(buff, var619, 3, protoModule.wireTypes.lengthDelimited)
		var625, var626 = protoModule.writeString(var625, var626, self.collection_id)
		buff = var625
		var619 = var626
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var627, var628 = protoModule.writeTag(buff, var619, 4, protoModule.wireTypes.lengthDelimited)
		var627, var628 = protoModule.writeString(var627, var628, self.collection_position)
		buff = var627
		var619 = var628
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var629, var630 = protoModule.writeTag(buff, var619, 5, protoModule.wireTypes.lengthDelimited)
		var629, var630 = protoModule.writeString(var629, var630, self.universe_id)
		buff = var629
		var619 = var630
	end
	local buff_1 = buffer.create(var619)
	buffer.copy(buff_1, 0, buff, 0, var619)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 6418 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var632 = t_6.new()
	local var633 = 0
	while var633 < buffer.len(p11) do
		local _ = nil
		local var634 = nil
		local var635, var636, var637 = protoModule.readTag(p11, var633)
		local var638 = var635
		var634 = var636
		var633 = var637
		
		if var634 == protoModule.wireTypes.varint then
			local _ = nil
			local var639, var640 = protoModule.readVarInt(p11, var633)
			local _ = var639
			var633 = var640
			continue
		end
		if var634 == protoModule.wireTypes.lengthDelimited then
			if var638 == 1 then
				local _ = nil
				local var641, var642 = protoModule.readBuffer(p11, var633)
				var633 = var642
				var632.section_title = buffer.tostring(var641)
			elseif var638 == 2 then
				local _ = nil
				local var643, var644 = protoModule.readBuffer(p11, var633)
				var633 = var644
				table.insert(var632.badges, t.BadgesGridInputData_BadgeInputData.decode(var643))
			elseif var638 == 3 then
				local _ = nil
				local var645, var646 = protoModule.readBuffer(p11, var633)
				var633 = var646
				var632.collection_id = buffer.tostring(var645)
			elseif var638 == 4 then
				local _ = nil
				local var647, var648 = protoModule.readBuffer(p11, var633)
				var633 = var648
				var632.collection_position = buffer.tostring(var647)
			elseif var638 == 5 then
				local _ = nil
				local var649, var650 = protoModule.readBuffer(p11, var633)
				var633 = var650
				var632.universe_id = buffer.tostring(var649)
			else
				local _ = nil
				local var651, var652 = protoModule.readVarInt(p11, var633)
				var633 = var652 + var651
			end
		elseif var634 == protoModule.wireTypes.i32 then
			local _ = nil
			local var653, var654 = protoModule.readFixed32(p11, var633)
			local _ = var653
			var633 = var654
		elseif var634 == protoModule.wireTypes.i64 then
			local _ = nil
			local var655, var656 = protoModule.readFixed64(p11, var633)
			local _ = var655
			var633 = var656
		else
			error("Unsupported wire type: " .. var634)
		end
	end
	return var632
end

function t_6:jsonEncode() --[[ line: 6481 ]]
	local t = {}
	
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.badges ~= nil and #self.badges > 0 then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, v:jsonEncode())
		end
		t.badges = t_1
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		t.collectionId = self.collection_id
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		t.collectionPosition = self.collection_position
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_6:jsonDecode() --[[ line: 6511 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var659 = t_6.new()
	
	if self.section_title ~= nil then
		var659.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var659.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var659.badges = t_1
	end
	if self.collection_id ~= nil then
		var659.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var659.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var659.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var659.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var659.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var659.universe_id = self.universeId
	end
	return var659
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 6572 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p12 == nil or p12.badge_id == nil then "" else p12.badge_id
	}, t_7)
end

function t_7:encode() --[[ line: 6580 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var662 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var663, var664 = protoModule.writeTag(buff, var662, 1, protoModule.wireTypes.lengthDelimited)
		var663, var664 = protoModule.writeString(var663, var664, self.badge_id)
		buff = var663
		var662 = var664
	end
	local buff_1 = buffer.create(var662)
	buffer.copy(buff_1, 0, buff, 0, var662)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 6594 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var666 = t_7.new()
	local var667 = 0
	while var667 < buffer.len(p13) do
		local _ = nil
		local var668 = nil
		local var669, var670, var671 = protoModule.readTag(p13, var667)
		local var672 = var669
		var668 = var670
		var667 = var671
		
		if var668 == protoModule.wireTypes.varint then
			local _ = nil
			local var673, var674 = protoModule.readVarInt(p13, var667)
			local _ = var673
			var667 = var674
			continue
		end
		if var668 == protoModule.wireTypes.lengthDelimited then
			if var672 == 1 then
				local _ = nil
				local var675, var676 = protoModule.readBuffer(p13, var667)
				var667 = var676
				var666.badge_id = buffer.tostring(var675)
			else
				local _ = nil
				local var677, var678 = protoModule.readVarInt(p13, var667)
				var667 = var678 + var677
			end
		elseif var668 == protoModule.wireTypes.i32 then
			local _ = nil
			local var679, var680 = protoModule.readFixed32(p13, var667)
			local _ = var679
			var667 = var680
		elseif var668 == protoModule.wireTypes.i64 then
			local _ = nil
			local var681, var682 = protoModule.readFixed64(p13, var667)
			local _ = var681
			var667 = var682
		else
			error("Unsupported wire type: " .. var668)
		end
	end
	return var666
end

function t_7:jsonEncode() --[[ line: 6637 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_7:jsonDecode() --[[ line: 6647 ]]
	-- upvalues: t_7 (ref)
	local var684 = t_7.new()
	
	if self.badge_id ~= nil then
		var684.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var684.badge_id = self.badgeId
	end
	return var684
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 6677 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p14 == nil or p14.badge_id == nil then "" else p14.badge_id,
		universe_id = if p14 == nil or p14.universe_id == nil then "" else p14.universe_id,
		localized_literals = if p14 == nil or p14.localized_literals == nil then nil else p14.localized_literals,
		creator_key = if p14 == nil or p14.creator_key == nil then "" else p14.creator_key
	}, t_8)
end

function t_8:encode() --[[ line: 6686 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var686 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var687, var688 = protoModule.writeTag(buff, var686, 1, protoModule.wireTypes.lengthDelimited)
		var687, var688 = protoModule.writeString(var687, var688, self.badge_id)
		buff = var687
		var686 = var688
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var689, var690 = protoModule.writeTag(buff, var686, 2, protoModule.wireTypes.lengthDelimited)
		var689, var690 = protoModule.writeString(var689, var690, self.universe_id)
		buff = var689
		var686 = var690
	end
	if self.localized_literals ~= nil then
		local var691 = self.localized_literals:encode()
		local var692, var693 = protoModule.writeTag(buff, var686, 3, protoModule.wireTypes.lengthDelimited)
		var692, var693 = protoModule.writeBuffer(var692, var693, var691, buffer.len(var691))
		buff = var692
		var686 = var693
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var694, var695 = protoModule.writeTag(buff, var686, 4, protoModule.wireTypes.lengthDelimited)
		var694, var695 = protoModule.writeString(var694, var695, self.creator_key)
		buff = var694
		var686 = var695
	end
	local buff_1 = buffer.create(var686)
	buffer.copy(buff_1, 0, buff, 0, var686)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 6716 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var697 = t_8.new()
	local var698 = 0
	while var698 < buffer.len(p15) do
		local _ = nil
		local var699 = nil
		local var700, var701, var702 = protoModule.readTag(p15, var698)
		local var703 = var700
		var699 = var701
		var698 = var702
		
		if var699 == protoModule.wireTypes.varint then
			local _ = nil
			local var704, var705 = protoModule.readVarInt(p15, var698)
			local _ = var704
			var698 = var705
			continue
		end
		if var699 == protoModule.wireTypes.lengthDelimited then
			if var703 == 1 then
				local _ = nil
				local var706, var707 = protoModule.readBuffer(p15, var698)
				var698 = var707
				var697.badge_id = buffer.tostring(var706)
			elseif var703 == 2 then
				local _ = nil
				local var708, var709 = protoModule.readBuffer(p15, var698)
				var698 = var709
				var697.universe_id = buffer.tostring(var708)
			elseif var703 == 3 then
				local _ = nil
				local var710, var711 = protoModule.readBuffer(p15, var698)
				var698 = var711
				var697.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var710)
			elseif var703 == 4 then
				local _ = nil
				local var712, var713 = protoModule.readBuffer(p15, var698)
				var698 = var713
				var697.creator_key = buffer.tostring(var712)
			else
				local _ = nil
				local var714, var715 = protoModule.readVarInt(p15, var698)
				var698 = var715 + var714
			end
		elseif var699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var716, var717 = protoModule.readFixed32(p15, var698)
			local _ = var716
			var698 = var717
		elseif var699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var718, var719 = protoModule.readFixed64(p15, var698)
			local _ = var718
			var698 = var719
		else
			error("Unsupported wire type: " .. var699)
		end
	end
	return var697
end

function t_8:jsonEncode() --[[ line: 6774 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.localized_literals ~= nil then
		t.localizedLiterals = self.localized_literals:jsonEncode()
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_8:jsonDecode() --[[ line: 6796 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var721 = t_8.new()
	
	if self.badge_id ~= nil then
		var721.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var721.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var721.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var721.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var721.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var721.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var721.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var721.creator_key = self.creatorKey
	end
	return var721
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 6850 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p16 == nil or p16.info_table == nil then nil else p16.info_table,
		action_module = if p16 == nil or p16.action_module == nil then nil else p16.action_module,
		overflow_menu = if p16 == nil or p16.overflow_menu == nil then nil else p16.overflow_menu
	}, t_9)
end

function t_9:encode() --[[ line: 6860 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var723 = 0
	
	if self.info_table ~= nil then
		local var724 = self.info_table:encode()
		local var725, var726 = protoModule.writeTag(buff, var723, 1, protoModule.wireTypes.lengthDelimited)
		var725, var726 = protoModule.writeBuffer(var725, var726, var724, buffer.len(var724))
		buff = var725
		var723 = var726
	end
	if self.action_module ~= nil then
		local var727 = self.action_module:encode()
		local var728, var729 = protoModule.writeTag(buff, var723, 2, protoModule.wireTypes.lengthDelimited)
		var728, var729 = protoModule.writeBuffer(var728, var729, var727, buffer.len(var727))
		buff = var728
		var723 = var729
	end
	if self.overflow_menu ~= nil then
		local var730 = self.overflow_menu:encode()
		local var731, var732 = protoModule.writeTag(buff, var723, 3, protoModule.wireTypes.lengthDelimited)
		var731, var732 = protoModule.writeBuffer(var731, var732, var730, buffer.len(var730))
		buff = var731
		var723 = var732
	end
	local buff_1 = buffer.create(var723)
	buffer.copy(buff_1, 0, buff, 0, var723)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 6887 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var734 = t_9.new()
	local var735 = 0
	while var735 < buffer.len(p17) do
		local _ = nil
		local var736 = nil
		local var737, var738, var739 = protoModule.readTag(p17, var735)
		local var740 = var737
		var736 = var738
		var735 = var739
		
		if var736 == protoModule.wireTypes.varint then
			local _ = nil
			local var741, var742 = protoModule.readVarInt(p17, var735)
			local _ = var741
			var735 = var742
			continue
		end
		if var736 == protoModule.wireTypes.lengthDelimited then
			if var740 == 1 then
				local _ = nil
				local var743, var744 = protoModule.readBuffer(p17, var735)
				var735 = var744
				var734.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var743)
			elseif var740 == 2 then
				local _ = nil
				local var745, var746 = protoModule.readBuffer(p17, var735)
				var735 = var746
				var734.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var745)
			elseif var740 == 3 then
				local _ = nil
				local var747, var748 = protoModule.readBuffer(p17, var735)
				var735 = var748
				var734.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var747)
			else
				local _ = nil
				local var749, var750 = protoModule.readVarInt(p17, var735)
				var735 = var750 + var749
			end
		elseif var736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var751, var752 = protoModule.readFixed32(p17, var735)
			local _ = var751
			var735 = var752
		elseif var736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var753, var754 = protoModule.readFixed64(p17, var735)
			local _ = var753
			var735 = var754
		else
			error("Unsupported wire type: " .. var736)
		end
	end
	return var734
end

function t_9:jsonEncode() --[[ line: 6940 ]]
	local t = {}
	
	if self.info_table ~= nil then
		t.infoTable = self.info_table:jsonEncode()
	end
	if self.action_module ~= nil then
		t.actionModule = self.action_module:jsonEncode()
	end
	if self.overflow_menu ~= nil then
		t.overflowMenu = self.overflow_menu:jsonEncode()
	end
	return t
end

function t_9:jsonDecode() --[[ line: 6958 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var756 = t_9.new()
	
	if self.info_table ~= nil then
		var756.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var756.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var756.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var756.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var756.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var756.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var756
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 7009 ]]
	-- upvalues: t_10 (ref)
	return setmetatable({
		type_label = if p18 == nil or p18.type_label == nil then "" else p18.type_label,
		earned_label = if p18 == nil or p18.earned_label == nil then "" else p18.earned_label,
		updated_label = if p18 == nil or p18.updated_label == nil then "" else p18.updated_label,
		experience_label = if p18 == nil or p18.experience_label == nil then "" else p18.experience_label,
		rarity_label = if p18 == nil or p18.rarity_label == nil then "" else p18.rarity_label,
		won_yesterday_label = if p18 == nil or p18.won_yesterday_label == nil then "" else p18.won_yesterday_label,
		won_ever_label = if p18 == nil or p18.won_ever_label == nil then "" else p18.won_ever_label
	}, t_10)
end

function t_10:encode() --[[ line: 7028 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var758 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var759, var760 = protoModule.writeTag(buff, var758, 1, protoModule.wireTypes.lengthDelimited)
		var759, var760 = protoModule.writeString(var759, var760, self.type_label)
		buff = var759
		var758 = var760
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var761, var762 = protoModule.writeTag(buff, var758, 2, protoModule.wireTypes.lengthDelimited)
		var761, var762 = protoModule.writeString(var761, var762, self.earned_label)
		buff = var761
		var758 = var762
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var763, var764 = protoModule.writeTag(buff, var758, 3, protoModule.wireTypes.lengthDelimited)
		var763, var764 = protoModule.writeString(var763, var764, self.updated_label)
		buff = var763
		var758 = var764
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var765, var766 = protoModule.writeTag(buff, var758, 4, protoModule.wireTypes.lengthDelimited)
		var765, var766 = protoModule.writeString(var765, var766, self.experience_label)
		buff = var765
		var758 = var766
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var767, var768 = protoModule.writeTag(buff, var758, 5, protoModule.wireTypes.lengthDelimited)
		var767, var768 = protoModule.writeString(var767, var768, self.rarity_label)
		buff = var767
		var758 = var768
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var769, var770 = protoModule.writeTag(buff, var758, 6, protoModule.wireTypes.lengthDelimited)
		var769, var770 = protoModule.writeString(var769, var770, self.won_yesterday_label)
		buff = var769
		var758 = var770
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var771, var772 = protoModule.writeTag(buff, var758, 7, protoModule.wireTypes.lengthDelimited)
		var771, var772 = protoModule.writeString(var771, var772, self.won_ever_label)
		buff = var771
		var758 = var772
	end
	local buff_1 = buffer.create(var758)
	buffer.copy(buff_1, 0, buff, 0, var758)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 7074 ]]
	-- upvalues: t_10 (ref), protoModule (ref)
	local var774 = t_10.new()
	local var775 = 0
	while var775 < buffer.len(p19) do
		local _ = nil
		local var776 = nil
		local var777, var778, var779 = protoModule.readTag(p19, var775)
		local var780 = var777
		var776 = var778
		var775 = var779
		
		if var776 == protoModule.wireTypes.varint then
			local _ = nil
			local var781, var782 = protoModule.readVarInt(p19, var775)
			local _ = var781
			var775 = var782
			continue
		end
		if var776 == protoModule.wireTypes.lengthDelimited then
			if var780 == 1 then
				local _ = nil
				local var783, var784 = protoModule.readBuffer(p19, var775)
				var775 = var784
				var774.type_label = buffer.tostring(var783)
			elseif var780 == 2 then
				local _ = nil
				local var785, var786 = protoModule.readBuffer(p19, var775)
				var775 = var786
				var774.earned_label = buffer.tostring(var785)
			elseif var780 == 3 then
				local _ = nil
				local var787, var788 = protoModule.readBuffer(p19, var775)
				var775 = var788
				var774.updated_label = buffer.tostring(var787)
			elseif var780 == 4 then
				local _ = nil
				local var789, var790 = protoModule.readBuffer(p19, var775)
				var775 = var790
				var774.experience_label = buffer.tostring(var789)
			elseif var780 == 5 then
				local _ = nil
				local var791, var792 = protoModule.readBuffer(p19, var775)
				var775 = var792
				var774.rarity_label = buffer.tostring(var791)
			elseif var780 == 6 then
				local _ = nil
				local var793, var794 = protoModule.readBuffer(p19, var775)
				var775 = var794
				var774.won_yesterday_label = buffer.tostring(var793)
			elseif var780 == 7 then
				local _ = nil
				local var795, var796 = protoModule.readBuffer(p19, var775)
				var775 = var796
				var774.won_ever_label = buffer.tostring(var795)
			else
				local _ = nil
				local var797, var798 = protoModule.readVarInt(p19, var775)
				var775 = var798 + var797
			end
		elseif var776 == protoModule.wireTypes.i32 then
			local _ = nil
			local var799, var800 = protoModule.readFixed32(p19, var775)
			local _ = var799
			var775 = var800
		elseif var776 == protoModule.wireTypes.i64 then
			local _ = nil
			local var801, var802 = protoModule.readFixed64(p19, var775)
			local _ = var801
			var775 = var802
		else
			error("Unsupported wire type: " .. var776)
		end
	end
	return var774
end

function t_10:jsonEncode() --[[ line: 7149 ]]
	local t = {}
	
	if self.type_label ~= nil and self.type_label ~= "" then
		t.typeLabel = self.type_label
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		t.earnedLabel = self.earned_label
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		t.updatedLabel = self.updated_label
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		t.experienceLabel = self.experience_label
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		t.rarityLabel = self.rarity_label
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		t.wonYesterdayLabel = self.won_yesterday_label
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		t.wonEverLabel = self.won_ever_label
	end
	return t
end

function t_10:jsonDecode() --[[ line: 7185 ]]
	-- upvalues: t_10 (ref)
	local var804 = t_10.new()
	
	if self.type_label ~= nil then
		var804.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var804.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var804.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var804.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var804.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var804.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var804.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var804.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var804.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var804.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var804.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var804.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var804.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var804.won_ever_label = self.wonEverLabel
	end
	return var804
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 7265 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p20 == nil or p20.share == nil then "" else p20.share,
		report = if p20 == nil or p20.report == nil then "" else p20.report
	}, t_11)
end

function t_11:encode() --[[ line: 7277 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var806 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var807, var808 = protoModule.writeTag(buff, var806, 1, protoModule.wireTypes.lengthDelimited)
		var807, var808 = protoModule.writeString(var807, var808, self.share)
		buff = var807
		var806 = var808
	end
	if self.report ~= nil and self.report ~= "" then
		local var809, var810 = protoModule.writeTag(buff, var806, 2, protoModule.wireTypes.lengthDelimited)
		var809, var810 = protoModule.writeString(var809, var810, self.report)
		buff = var809
		var806 = var810
	end
	local buff_1 = buffer.create(var806)
	buffer.copy(buff_1, 0, buff, 0, var806)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 7298 ]]
	-- upvalues: t_11 (ref), protoModule (ref)
	local var812 = t_11.new()
	local var813 = 0
	while var813 < buffer.len(p21) do
		local _ = nil
		local var814 = nil
		local var815, var816, var817 = protoModule.readTag(p21, var813)
		local var818 = var815
		var814 = var816
		var813 = var817
		
		if var814 == protoModule.wireTypes.varint then
			local _ = nil
			local var819, var820 = protoModule.readVarInt(p21, var813)
			local _ = var819
			var813 = var820
			continue
		end
		if var814 == protoModule.wireTypes.lengthDelimited then
			if var818 == 1 then
				local _ = nil
				local var821, var822 = protoModule.readBuffer(p21, var813)
				var813 = var822
				var812.share = buffer.tostring(var821)
			elseif var818 == 2 then
				local _ = nil
				local var823, var824 = protoModule.readBuffer(p21, var813)
				var813 = var824
				var812.report = buffer.tostring(var823)
			else
				local _ = nil
				local var825, var826 = protoModule.readVarInt(p21, var813)
				var813 = var826 + var825
			end
		elseif var814 == protoModule.wireTypes.i32 then
			local _ = nil
			local var827, var828 = protoModule.readFixed32(p21, var813)
			local _ = var827
			var813 = var828
		elseif var814 == protoModule.wireTypes.i64 then
			local _ = nil
			local var829, var830 = protoModule.readFixed64(p21, var813)
			local _ = var829
			var813 = var830
		else
			error("Unsupported wire type: " .. var814)
		end
	end
	return var812
end

function t_11:jsonEncode() --[[ line: 7348 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_11:jsonDecode() --[[ line: 7364 ]]
	-- upvalues: t_11 (ref)
	local var832 = t_11.new()
	
	if self.share ~= nil then
		var832.share = self.share
	end
	if self.report ~= nil then
		var832.report = self.report
	end
	return var832
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 7396 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p22 == nil or p22.report == nil then "" else p22.report,
		remove = if p22 == nil or p22.remove == nil then "" else p22.remove
	}, t_12)
end

function t_12:encode() --[[ line: 7408 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var834 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var835, var836 = protoModule.writeTag(buff, var834, 1, protoModule.wireTypes.lengthDelimited)
		var835, var836 = protoModule.writeString(var835, var836, self.report)
		buff = var835
		var834 = var836
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var837, var838 = protoModule.writeTag(buff, var834, 2, protoModule.wireTypes.lengthDelimited)
		var837, var838 = protoModule.writeString(var837, var838, self.remove)
		buff = var837
		var834 = var838
	end
	local buff_1 = buffer.create(var834)
	buffer.copy(buff_1, 0, buff, 0, var834)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 7429 ]]
	-- upvalues: t_12 (ref), protoModule (ref)
	local var840 = t_12.new()
	local var841 = 0
	while var841 < buffer.len(p23) do
		local _ = nil
		local var842 = nil
		local var843, var844, var845 = protoModule.readTag(p23, var841)
		local var846 = var843
		var842 = var844
		var841 = var845
		
		if var842 == protoModule.wireTypes.varint then
			local _ = nil
			local var847, var848 = protoModule.readVarInt(p23, var841)
			local _ = var847
			var841 = var848
			continue
		end
		if var842 == protoModule.wireTypes.lengthDelimited then
			if var846 == 1 then
				local _ = nil
				local var849, var850 = protoModule.readBuffer(p23, var841)
				var841 = var850
				var840.report = buffer.tostring(var849)
			elseif var846 == 2 then
				local _ = nil
				local var851, var852 = protoModule.readBuffer(p23, var841)
				var841 = var852
				var840.remove = buffer.tostring(var851)
			else
				local _ = nil
				local var853, var854 = protoModule.readVarInt(p23, var841)
				var841 = var854 + var853
			end
		elseif var842 == protoModule.wireTypes.i32 then
			local _ = nil
			local var855, var856 = protoModule.readFixed32(p23, var841)
			local _ = var855
			var841 = var856
		elseif var842 == protoModule.wireTypes.i64 then
			local _ = nil
			local var857, var858 = protoModule.readFixed64(p23, var841)
			local _ = var857
			var841 = var858
		else
			error("Unsupported wire type: " .. var842)
		end
	end
	return var840
end

function t_12:jsonEncode() --[[ line: 7479 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_12:jsonDecode() --[[ line: 7495 ]]
	-- upvalues: t_12 (ref)
	local var860 = t_12.new()
	
	if self.report ~= nil then
		var860.report = self.report
	end
	if self.remove ~= nil then
		var860.remove = self.remove
	end
	return var860
end

t_12.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t_12
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local t_13 = {}
t_13.__index = t_13

function t_13.new(_) --[[ line: 7526 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({}, t_13)
end

function t_13.encode(_) --[[ line: 7530 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_13.decode(p24) --[[ line: 7539 ]]
	-- upvalues: t_13 (ref), protoModule (ref)
	local var862 = t_13.new()
	local var863 = 0
	while var863 < buffer.len(p24) do
		local var864 = nil
		local _ = nil
		local var865, var866, var867 = protoModule.readTag(p24, var863)
		var864 = var865
		local var868 = var866
		var863 = var867
		
		if var868 == protoModule.wireTypes.varint then
			local _ = nil
			local var869, var870 = protoModule.readVarInt(p24, var863)
			local _ = var869
			var863 = var870
		elseif var868 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var871, var872 = protoModule.readVarInt(p24, var863)
			var863 = var872 + var871
		elseif var868 == protoModule.wireTypes.i32 then
			local _ = nil
			local var873, var874 = protoModule.readFixed32(p24, var863)
			local _ = var873
			var863 = var874
		elseif var868 == protoModule.wireTypes.i64 then
			local _ = nil
			local var875, var876 = protoModule.readFixed64(p24, var863)
			local _ = var875
			var863 = var876
		else
			error("Unsupported wire type: " .. var868)
		end
	end
	return var862
end

function t_13.jsonEncode(_) --[[ line: 7577 ]]
	return {}
end

function t_13.jsonDecode(_) --[[ line: 7583 ]]
	-- upvalues: t_13 (ref)
	return t_13.new()
end

t_13.descriptor = {
	name = "StaticInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.StaticInputData"
}
t.StaticInputData = t_13
typeRegistryModule.default:register(t.StaticInputData)
local t_14 = {}
t_14.__index = t_14

function t_14.new(p25) --[[ line: 7603 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p25 == nil or p25.universe_id == nil then "" else p25.universe_id,
		creator_key = if p25 == nil or p25.creator_key == nil then "" else p25.creator_key,
		entry_map = if p25 == nil or p25.entry_map == nil then {} else p25.entry_map,
		entry_order = if p25 == nil or p25.entry_order == nil then {} else p25.entry_order,
		entry_order_map = if p25 == nil or p25.entry_order_map == nil then {} else p25.entry_order_map
	}, t_14)
end

function t_14:encode() --[[ line: 7615 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var878 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var879, var880 = protoModule.writeTag(buff, var878, 1, protoModule.wireTypes.lengthDelimited)
		var879, var880 = protoModule.writeString(var879, var880, self.universe_id)
		buff = var879
		var878 = var880
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var881, var882 = protoModule.writeTag(buff, var878, 2, protoModule.wireTypes.lengthDelimited)
		var881, var882 = protoModule.writeString(var881, var882, self.creator_key)
		buff = var881
		var878 = var882
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var883, var884 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var883, var884 = protoModule.writeString(var883, var884, i)
			local var885 = v:encode()
			var884, var886 = protoModule.writeTag(var883, var884, 2, protoModule.wireTypes.lengthDelimited)
			var884, var886 = protoModule.writeBuffer(var884, var886, var885, buffer.len(var885))
			local var887 = var884
			local var888 = var886
			local var889, var890 = protoModule.writeTag(buff, var878, 3, protoModule.wireTypes.lengthDelimited)
			var889, var890 = protoModule.writeBuffer(var889, var890, var887, var888)
			buff = var889
			var878 = var890
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var891, var892 = protoModule.writeTag(buff, var878, 4, protoModule.wireTypes.lengthDelimited)
			var891, var892 = protoModule.writeString(var891, var892, v)
			buff = var891
			var878 = var892
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var893, var894 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var893, var894 = protoModule.writeString(var893, var894, i)
			local var895 = v:encode()
			var894, var896 = protoModule.writeTag(var893, var894, 2, protoModule.wireTypes.lengthDelimited)
			var894, var896 = protoModule.writeBuffer(var894, var896, var895, buffer.len(var895))
			local var897 = var894
			local var898 = var896
			local var899, var900 = protoModule.writeTag(buff, var878, 5, protoModule.wireTypes.lengthDelimited)
			var899, var900 = protoModule.writeBuffer(var899, var900, var897, var898)
			buff = var899
			var878 = var900
		end
	end
	local buff_1 = buffer.create(var878)
	buffer.copy(buff_1, 0, buff, 0, var878)
	
	return buff_1
end

function t_14.decode(p26) --[[ line: 7669 ]]
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var902 = t_14.new()
	local var903 = 0
	while var903 < buffer.len(p26) do
		local _ = nil
		local var904 = nil
		local var905, var906, var907 = protoModule.readTag(p26, var903)
		local var908 = var905
		var904 = var906
		var903 = var907
		
		if var904 == protoModule.wireTypes.varint then
			local _ = nil
			local var909, var910 = protoModule.readVarInt(p26, var903)
			local _ = var909
			var903 = var910
			continue
		end
		if var904 == protoModule.wireTypes.lengthDelimited then
			if var908 == 1 then
				local _ = nil
				local var911, var912 = protoModule.readBuffer(p26, var903)
				var903 = var912
				var902.universe_id = buffer.tostring(var911)
			elseif var908 == 2 then
				local _ = nil
				local var913, var914 = protoModule.readBuffer(p26, var903)
				var903 = var914
				var902.creator_key = buffer.tostring(var913)
			elseif var908 == 3 then
				local _ = nil
				local var915, var916 = protoModule.readBuffer(p26, var903)
				var903 = var916
				var915 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var915)
				var902.entry_map[var915.key or ""] = var915.value or t.FeedEntry.new()
			elseif var908 == 4 then
				local _ = nil
				local var917, var918 = protoModule.readBuffer(p26, var903)
				var903 = var918
				table.insert(var902.entry_order, buffer.tostring(var917))
			elseif var908 == 5 then
				local _ = nil
				local var919, var920 = protoModule.readBuffer(p26, var903)
				var903 = var920
				var919 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var919)
				var902.entry_order_map[var919.key or ""] = var919.value or t.EntryOrder.new()
			else
				local _ = nil
				local var921, var922 = protoModule.readVarInt(p26, var903)
				var903 = var922 + var921
			end
		elseif var904 == protoModule.wireTypes.i32 then
			local _ = nil
			local var923, var924 = protoModule.readFixed32(p26, var903)
			local _ = var923
			var903 = var924
		elseif var904 == protoModule.wireTypes.i64 then
			local _ = nil
			local var925, var926 = protoModule.readFixed64(p26, var903)
			local _ = var925
			var903 = var926
		else
			error("Unsupported wire type: " .. var904)
		end
	end
	return var902
end

function t_14:jsonEncode() --[[ line: 7746 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryOrderMap = t_1
	end
	return t
end

function t_14:jsonDecode() --[[ line: 7784 ]]
	-- upvalues: t_14 (ref), t (ref)
	local var931 = t_14.new()
	
	if self.universe_id ~= nil then
		var931.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var931.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var931.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var931.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var931.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var931.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var931.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var931.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var931.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var931.entry_order_map = t_1
	end
	return var931
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p27) --[[ line: 7874 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p27 == nil or p27.key == nil then "" else p27.key,
		value = if p27 == nil or p27.value == nil then nil else p27.value
	}, t_15)
end

function t_15:encode() --[[ line: 7883 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var939 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var940, var941 = protoModule.writeTag(buff, var939, 1, protoModule.wireTypes.lengthDelimited)
		var940, var941 = protoModule.writeString(var940, var941, self.key)
		buff = var940
		var939 = var941
	end
	if self.value ~= nil then
		local var942 = self.value:encode()
		local var943, var944 = protoModule.writeTag(buff, var939, 2, protoModule.wireTypes.lengthDelimited)
		var943, var944 = protoModule.writeBuffer(var943, var944, var942, buffer.len(var942))
		buff = var943
		var939 = var944
	end
	local buff_1 = buffer.create(var939)
	buffer.copy(buff_1, 0, buff, 0, var939)
	
	return buff_1
end

function t_15.decode(p28) --[[ line: 7905 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var946 = t_15.new()
	local var947 = 0
	while var947 < buffer.len(p28) do
		local _ = nil
		local var948 = nil
		local var949, var950, var951 = protoModule.readTag(p28, var947)
		local var952 = var949
		var948 = var950
		var947 = var951
		
		if var948 == protoModule.wireTypes.varint then
			local _ = nil
			local var953, var954 = protoModule.readVarInt(p28, var947)
			local _ = var953
			var947 = var954
			continue
		end
		if var948 == protoModule.wireTypes.lengthDelimited then
			if var952 == 1 then
				local _ = nil
				local var955, var956 = protoModule.readBuffer(p28, var947)
				var947 = var956
				var946.key = buffer.tostring(var955)
			elseif var952 == 2 then
				local _ = nil
				local var957, var958 = protoModule.readBuffer(p28, var947)
				var947 = var958
				var946.value = t.FeedEntry.decode(var957)
			else
				local _ = nil
				local var959, var960 = protoModule.readVarInt(p28, var947)
				var947 = var960 + var959
			end
		elseif var948 == protoModule.wireTypes.i32 then
			local _ = nil
			local var961, var962 = protoModule.readFixed32(p28, var947)
			local _ = var961
			var947 = var962
		elseif var948 == protoModule.wireTypes.i64 then
			local _ = nil
			local var963, var964 = protoModule.readFixed64(p28, var947)
			local _ = var963
			var947 = var964
		else
			error("Unsupported wire type: " .. var948)
		end
	end
	return var946
end

function t_15:jsonEncode() --[[ line: 7955 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode() --[[ line: 7971 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var966 = t_15.new()
	
	if self.key ~= nil then
		var966.key = self.key
	end
	if self.value ~= nil then
		var966.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var966
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p29) --[[ line: 8002 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p29 == nil or p29.key == nil then "" else p29.key,
		value = if p29 == nil or p29.value == nil then nil else p29.value
	}, t_16)
end

function t_16:encode() --[[ line: 8014 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var968 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var969, var970 = protoModule.writeTag(buff, var968, 1, protoModule.wireTypes.lengthDelimited)
		var969, var970 = protoModule.writeString(var969, var970, self.key)
		buff = var969
		var968 = var970
	end
	if self.value ~= nil then
		local var971 = self.value:encode()
		local var972, var973 = protoModule.writeTag(buff, var968, 2, protoModule.wireTypes.lengthDelimited)
		var972, var973 = protoModule.writeBuffer(var972, var973, var971, buffer.len(var971))
		buff = var972
		var968 = var973
	end
	local buff_1 = buffer.create(var968)
	buffer.copy(buff_1, 0, buff, 0, var968)
	
	return buff_1
end

function t_16.decode(p30) --[[ line: 8036 ]]
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var975 = t_16.new()
	local var976 = 0
	while var976 < buffer.len(p30) do
		local _ = nil
		local var977 = nil
		local var978, var979, var980 = protoModule.readTag(p30, var976)
		local var981 = var978
		var977 = var979
		var976 = var980
		
		if var977 == protoModule.wireTypes.varint then
			local _ = nil
			local var982, var983 = protoModule.readVarInt(p30, var976)
			local _ = var982
			var976 = var983
			continue
		end
		if var977 == protoModule.wireTypes.lengthDelimited then
			if var981 == 1 then
				local _ = nil
				local var984, var985 = protoModule.readBuffer(p30, var976)
				var976 = var985
				var975.key = buffer.tostring(var984)
			elseif var981 == 2 then
				local _ = nil
				local var986, var987 = protoModule.readBuffer(p30, var976)
				var976 = var987
				var975.value = t.EntryOrder.decode(var986)
			else
				local _ = nil
				local var988, var989 = protoModule.readVarInt(p30, var976)
				var976 = var989 + var988
			end
		elseif var977 == protoModule.wireTypes.i32 then
			local _ = nil
			local var990, var991 = protoModule.readFixed32(p30, var976)
			local _ = var990
			var976 = var991
		elseif var977 == protoModule.wireTypes.i64 then
			local _ = nil
			local var992, var993 = protoModule.readFixed64(p30, var976)
			local _ = var992
			var976 = var993
		else
			error("Unsupported wire type: " .. var977)
		end
	end
	return var975
end

function t_16:jsonEncode() --[[ line: 8086 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode() --[[ line: 8102 ]]
	-- upvalues: t_16 (ref), t (ref)
	local var995 = t_16.new()
	
	if self.key ~= nil then
		var995.key = self.key
	end
	if self.value ~= nil then
		var995.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var995
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p31) --[[ line: 8133 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p31 == nil or p31.items == nil then {} else p31.items
	}, t_17)
end

function t_17:encode() --[[ line: 8139 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var997 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var998, var999 = protoModule.writeTag(buff, var997, 1, protoModule.wireTypes.lengthDelimited)
			var998, var999 = protoModule.writeString(var998, var999, v)
			buff = var998
			var997 = var999
		end
	end
	local buff_1 = buffer.create(var997)
	buffer.copy(buff_1, 0, buff, 0, var997)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 8155 ]]
	-- upvalues: t_17 (ref), protoModule (ref)
	local var1001 = t_17.new()
	local var1002 = 0
	while var1002 < buffer.len(p32) do
		local _ = nil
		local var1003 = nil
		local var1004, var1005, var1006 = protoModule.readTag(p32, var1002)
		local var1007 = var1004
		var1003 = var1005
		var1002 = var1006
		
		if var1003 == protoModule.wireTypes.varint then
			local _ = nil
			local var1008, var1009 = protoModule.readVarInt(p32, var1002)
			local _ = var1008
			var1002 = var1009
			continue
		end
		if var1003 == protoModule.wireTypes.lengthDelimited then
			if var1007 == 1 then
				local _ = nil
				local var1010, var1011 = protoModule.readBuffer(p32, var1002)
				var1002 = var1011
				table.insert(var1001.items, buffer.tostring(var1010))
			else
				local _ = nil
				local var1012, var1013 = protoModule.readVarInt(p32, var1002)
				var1002 = var1013 + var1012
			end
		elseif var1003 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1014, var1015 = protoModule.readFixed32(p32, var1002)
			local _ = var1014
			var1002 = var1015
		elseif var1003 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1016, var1017 = protoModule.readFixed64(p32, var1002)
			local _ = var1016
			var1002 = var1017
		else
			error("Unsupported wire type: " .. var1003)
		end
	end
	return var1001
end

function t_17:jsonEncode() --[[ line: 8198 ]]
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

function t_17:jsonDecode() --[[ line: 8212 ]]
	-- upvalues: t_17 (ref)
	local var1020 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var1020.items = t
	end
	return var1020
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p33) --[[ line: 8241 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p33 == nil or p33.universe_id == nil then "" else p33.universe_id,
		user_owns_experience = if p33 == nil or p33.user_owns_experience == nil then false else p33.user_owns_experience
	}, t_18)
end

function t_18:encode() --[[ line: 8252 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1023 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1024, var1025 = protoModule.writeTag(buff, var1023, 1, protoModule.wireTypes.lengthDelimited)
		var1024, var1025 = protoModule.writeString(var1024, var1025, self.universe_id)
		buff = var1024
		var1023 = var1025
	end
	if self.user_owns_experience then
		local var1026, var1027 = protoModule.writeTag(buff, var1023, 2, protoModule.wireTypes.varint)
		var1026, var1027 = protoModule.writeVarInt(var1026, var1027, if self.user_owns_experience then 1 else 0)
		buff = var1026
		var1023 = var1027
	end
	local buff_1 = buffer.create(var1023)
	buffer.copy(buff_1, 0, buff, 0, var1023)
	
	return buff_1
end

function t_18.decode(p34) --[[ line: 8271 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var1029 = t_18.new()
	local var1030 = 0
	while var1030 < buffer.len(p34) do
		local _ = nil
		local var1031 = nil
		local var1032, var1033, var1034 = protoModule.readTag(p34, var1030)
		local var1035 = var1032
		var1031 = var1033
		var1030 = var1034
		
		if var1031 == protoModule.wireTypes.varint then
			if var1035 == 2 then
				local _ = nil
				local var1036, var1037 = protoModule.readVarInt(p34, var1030)
				var1030 = var1037
				var1029.user_owns_experience = var1036 ~= 0
			else
				local _ = nil
				local var1038, var1039 = protoModule.readVarInt(p34, var1030)
				local _ = var1038
				var1030 = var1039
			end
		end
		if var1031 == protoModule.wireTypes.lengthDelimited then
			if var1035 == 1 then
				local _ = nil
				local var1040, var1041 = protoModule.readBuffer(p34, var1030)
				var1030 = var1041
				var1029.universe_id = buffer.tostring(var1040)
			else
				local _ = nil
				local var1042, var1043 = protoModule.readVarInt(p34, var1030)
				var1030 = var1043 + var1042
			end
		elseif var1031 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1044, var1045 = protoModule.readFixed32(p34, var1030)
			local _ = var1044
			var1030 = var1045
		elseif var1031 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1046, var1047 = protoModule.readFixed64(p34, var1030)
			local _ = var1046
			var1030 = var1047
		else
			error("Unsupported wire type: " .. var1031)
		end
	end
	return var1029
end

function t_18:jsonEncode() --[[ line: 8319 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_18:jsonDecode() --[[ line: 8333 ]]
	-- upvalues: t_18 (ref)
	local var1049 = t_18.new()
	
	if self.universe_id ~= nil then
		var1049.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1049.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1049.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1049.user_owns_experience = self.userOwnsExperience
	end
	return var1049
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p35) --[[ line: 8371 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p35 == nil or p35.media_asset_id == nil then "" else p35.media_asset_id
	}, t_19)
end

function t_19:encode() --[[ line: 8379 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1051 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1052, var1053 = protoModule.writeTag(buff, var1051, 1, protoModule.wireTypes.lengthDelimited)
		var1052, var1053 = protoModule.writeString(var1052, var1053, self.media_asset_id)
		buff = var1052
		var1051 = var1053
	end
	local buff_1 = buffer.create(var1051)
	buffer.copy(buff_1, 0, buff, 0, var1051)
	
	return buff_1
end

function t_19.decode(p36) --[[ line: 8393 ]]
	-- upvalues: t_19 (ref), protoModule (ref)
	local var1055 = t_19.new()
	local var1056 = 0
	while var1056 < buffer.len(p36) do
		local _ = nil
		local var1057 = nil
		local var1058, var1059, var1060 = protoModule.readTag(p36, var1056)
		local var1061 = var1058
		var1057 = var1059
		var1056 = var1060
		
		if var1057 == protoModule.wireTypes.varint then
			local _ = nil
			local var1062, var1063 = protoModule.readVarInt(p36, var1056)
			local _ = var1062
			var1056 = var1063
			continue
		end
		if var1057 == protoModule.wireTypes.lengthDelimited then
			if var1061 == 1 then
				local _ = nil
				local var1064, var1065 = protoModule.readBuffer(p36, var1056)
				var1056 = var1065
				var1055.media_asset_id = buffer.tostring(var1064)
			else
				local _ = nil
				local var1066, var1067 = protoModule.readVarInt(p36, var1056)
				var1056 = var1067 + var1066
			end
		elseif var1057 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1068, var1069 = protoModule.readFixed32(p36, var1056)
			local _ = var1068
			var1056 = var1069
		elseif var1057 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1070, var1071 = protoModule.readFixed64(p36, var1056)
			local _ = var1070
			var1056 = var1071
		else
			error("Unsupported wire type: " .. var1057)
		end
	end
	return var1055
end

function t_19:jsonEncode() --[[ line: 8436 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_19:jsonDecode() --[[ line: 8446 ]]
	-- upvalues: t_19 (ref)
	local var1073 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var1073.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1073.media_asset_id = self.mediaAssetId
	end
	return var1073
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p37) --[[ line: 8476 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p37 == nil or p37.universe_id == nil then "" else p37.universe_id
	}, t_20)
end

function t_20:encode() --[[ line: 8484 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1075 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1076, var1077 = protoModule.writeTag(buff, var1075, 1, protoModule.wireTypes.lengthDelimited)
		var1076, var1077 = protoModule.writeString(var1076, var1077, self.universe_id)
		buff = var1076
		var1075 = var1077
	end
	local buff_1 = buffer.create(var1075)
	buffer.copy(buff_1, 0, buff, 0, var1075)
	
	return buff_1
end

function t_20.decode(p38) --[[ line: 8498 ]]
	-- upvalues: t_20 (ref), protoModule (ref)
	local var1079 = t_20.new()
	local var1080 = 0
	while var1080 < buffer.len(p38) do
		local _ = nil
		local var1081 = nil
		local var1082, var1083, var1084 = protoModule.readTag(p38, var1080)
		local var1085 = var1082
		var1081 = var1083
		var1080 = var1084
		
		if var1081 == protoModule.wireTypes.varint then
			local _ = nil
			local var1086, var1087 = protoModule.readVarInt(p38, var1080)
			local _ = var1086
			var1080 = var1087
			continue
		end
		if var1081 == protoModule.wireTypes.lengthDelimited then
			if var1085 == 1 then
				local _ = nil
				local var1088, var1089 = protoModule.readBuffer(p38, var1080)
				var1080 = var1089
				var1079.universe_id = buffer.tostring(var1088)
			else
				local _ = nil
				local var1090, var1091 = protoModule.readVarInt(p38, var1080)
				var1080 = var1091 + var1090
			end
		elseif var1081 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1092, var1093 = protoModule.readFixed32(p38, var1080)
			local _ = var1092
			var1080 = var1093
		elseif var1081 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1094, var1095 = protoModule.readFixed64(p38, var1080)
			local _ = var1094
			var1080 = var1095
		else
			error("Unsupported wire type: " .. var1081)
		end
	end
	return var1079
end

function t_20:jsonEncode() --[[ line: 8541 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_20:jsonDecode() --[[ line: 8551 ]]
	-- upvalues: t_20 (ref)
	local var1097 = t_20.new()
	
	if self.universe_id ~= nil then
		var1097.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1097.universe_id = self.universeId
	end
	return var1097
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p39) --[[ line: 8581 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p39 == nil or p39.universe_id == nil then "" else p39.universe_id,
		creator_key = if p39 == nil or p39.creator_key == nil then "" else p39.creator_key
	}, t_21)
end

function t_21:encode() --[[ line: 8590 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1099 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1100, var1101 = protoModule.writeTag(buff, var1099, 1, protoModule.wireTypes.lengthDelimited)
		var1100, var1101 = protoModule.writeString(var1100, var1101, self.universe_id)
		buff = var1100
		var1099 = var1101
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1102, var1103 = protoModule.writeTag(buff, var1099, 2, protoModule.wireTypes.lengthDelimited)
		var1102, var1103 = protoModule.writeString(var1102, var1103, self.creator_key)
		buff = var1102
		var1099 = var1103
	end
	local buff_1 = buffer.create(var1099)
	buffer.copy(buff_1, 0, buff, 0, var1099)
	
	return buff_1
end

function t_21.decode(p40) --[[ line: 8609 ]]
	-- upvalues: t_21 (ref), protoModule (ref)
	local var1105 = t_21.new()
	local var1106 = 0
	while var1106 < buffer.len(p40) do
		local _ = nil
		local var1107 = nil
		local var1108, var1109, var1110 = protoModule.readTag(p40, var1106)
		local var1111 = var1108
		var1107 = var1109
		var1106 = var1110
		
		if var1107 == protoModule.wireTypes.varint then
			local _ = nil
			local var1112, var1113 = protoModule.readVarInt(p40, var1106)
			local _ = var1112
			var1106 = var1113
			continue
		end
		if var1107 == protoModule.wireTypes.lengthDelimited then
			if var1111 == 1 then
				local _ = nil
				local var1114, var1115 = protoModule.readBuffer(p40, var1106)
				var1106 = var1115
				var1105.universe_id = buffer.tostring(var1114)
			elseif var1111 == 2 then
				local _ = nil
				local var1116, var1117 = protoModule.readBuffer(p40, var1106)
				var1106 = var1117
				var1105.creator_key = buffer.tostring(var1116)
			else
				local _ = nil
				local var1118, var1119 = protoModule.readVarInt(p40, var1106)
				var1106 = var1119 + var1118
			end
		elseif var1107 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1120, var1121 = protoModule.readFixed32(p40, var1106)
			local _ = var1120
			var1106 = var1121
		elseif var1107 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1122, var1123 = protoModule.readFixed64(p40, var1106)
			local _ = var1122
			var1106 = var1123
		else
			error("Unsupported wire type: " .. var1107)
		end
	end
	return var1105
end

function t_21:jsonEncode() --[[ line: 8657 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_21:jsonDecode() --[[ line: 8671 ]]
	-- upvalues: t_21 (ref)
	local var1125 = t_21.new()
	
	if self.universe_id ~= nil then
		var1125.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1125.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1125.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1125.creator_key = self.creatorKey
	end
	return var1125
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p41) --[[ line: 8709 ]]
	-- upvalues: t_22 (ref)
	return setmetatable({
		universe_id = if p41 == nil or p41.universe_id == nil then "" else p41.universe_id,
		root_place_id = if p41 == nil or p41.root_place_id == nil then "" else p41.root_place_id,
		connection_played_display_name = if p41 == nil or p41.connection_played_display_name == nil then "" else p41.connection_played_display_name,
		upsell_prompt = if p41 == nil or p41.upsell_prompt == nil then "" else p41.upsell_prompt,
		connection_played_users = if p41 == nil or p41.connection_played_users == nil then {} else p41.connection_played_users,
		connection_played_num_others = if p41 == nil or p41.connection_played_num_others == nil then 0 else p41.connection_played_num_others,
		connection_played_total_count = if p41 == nil or p41.connection_played_total_count == nil then 0 else p41.connection_played_total_count
	}, t_22)
end

function t_22:encode() --[[ line: 8731 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1127 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1128, var1129 = protoModule.writeTag(buff, var1127, 1, protoModule.wireTypes.lengthDelimited)
		var1128, var1129 = protoModule.writeString(var1128, var1129, self.universe_id)
		buff = var1128
		var1127 = var1129
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var1130, var1131 = protoModule.writeTag(buff, var1127, 2, protoModule.wireTypes.lengthDelimited)
		var1130, var1131 = protoModule.writeString(var1130, var1131, self.root_place_id)
		buff = var1130
		var1127 = var1131
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var1132, var1133 = protoModule.writeTag(buff, var1127, 3, protoModule.wireTypes.lengthDelimited)
		var1132, var1133 = protoModule.writeString(var1132, var1133, self.connection_played_display_name)
		buff = var1132
		var1127 = var1133
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1134, var1135 = protoModule.writeTag(buff, var1127, 4, protoModule.wireTypes.lengthDelimited)
		var1134, var1135 = protoModule.writeString(var1134, var1135, self.upsell_prompt)
		buff = var1134
		var1127 = var1135
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var1136 = v:encode()
			local var1137, var1138 = protoModule.writeTag(buff, var1127, 5, protoModule.wireTypes.lengthDelimited)
			var1137, var1138 = protoModule.writeBuffer(var1137, var1138, var1136, buffer.len(var1136))
			buff = var1137
			var1127 = var1138
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var1139, var1140 = protoModule.writeTag(buff, var1127, 6, protoModule.wireTypes.varint)
		var1139, var1140 = protoModule.writeVarInt(var1139, var1140, self.connection_played_num_others)
		buff = var1139
		var1127 = var1140
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var1141, var1142 = protoModule.writeTag(buff, var1127, 7, protoModule.wireTypes.varint)
		var1141, var1142 = protoModule.writeVarInt(var1141, var1142, self.connection_played_total_count)
		buff = var1141
		var1127 = var1142
	end
	local buff_1 = buffer.create(var1127)
	buffer.copy(buff_1, 0, buff, 0, var1127)
	
	return buff_1
end

function t_22.decode(p42) --[[ line: 8778 ]]
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var1144 = t_22.new()
	local var1145 = 0
	while var1145 < buffer.len(p42) do
		local _ = nil
		local var1146 = nil
		local var1147, var1148, var1149 = protoModule.readTag(p42, var1145)
		local var1150 = var1147
		var1146 = var1148
		var1145 = var1149
		
		if var1146 == protoModule.wireTypes.varint then
			if var1150 == 6 then
				local _ = nil
				local var1151, var1152 = protoModule.readVarIntI32(p42, var1145)
				var1145 = var1152
				var1144.connection_played_num_others = var1151
			elseif var1150 == 7 then
				local _ = nil
				local var1153, var1154 = protoModule.readVarIntI32(p42, var1145)
				var1145 = var1154
				var1144.connection_played_total_count = var1153
			else
				local _ = nil
				local var1155, var1156 = protoModule.readVarInt(p42, var1145)
				local _ = var1155
				var1145 = var1156
			end
		end
		if var1146 == protoModule.wireTypes.lengthDelimited then
			if var1150 == 1 then
				local _ = nil
				local var1157, var1158 = protoModule.readBuffer(p42, var1145)
				var1145 = var1158
				var1144.universe_id = buffer.tostring(var1157)
			elseif var1150 == 2 then
				local _ = nil
				local var1159, var1160 = protoModule.readBuffer(p42, var1145)
				var1145 = var1160
				var1144.root_place_id = buffer.tostring(var1159)
			elseif var1150 == 3 then
				local _ = nil
				local var1161, var1162 = protoModule.readBuffer(p42, var1145)
				var1145 = var1162
				var1144.connection_played_display_name = buffer.tostring(var1161)
			elseif var1150 == 4 then
				local _ = nil
				local var1163, var1164 = protoModule.readBuffer(p42, var1145)
				var1145 = var1164
				var1144.upsell_prompt = buffer.tostring(var1163)
			elseif var1150 == 5 then
				local _ = nil
				local var1165, var1166 = protoModule.readBuffer(p42, var1145)
				var1145 = var1166
				table.insert(var1144.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var1165))
			else
				local _ = nil
				local var1167, var1168 = protoModule.readVarInt(p42, var1145)
				var1145 = var1168 + var1167
			end
		elseif var1146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1169, var1170 = protoModule.readFixed32(p42, var1145)
			local _ = var1169
			var1145 = var1170
		elseif var1146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1171, var1172 = protoModule.readFixed64(p42, var1145)
			local _ = var1171
			var1145 = var1172
		else
			error("Unsupported wire type: " .. var1146)
		end
	end
	return var1144
end

function t_22:jsonEncode() --[[ line: 8854 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		t.rootPlaceId = self.root_place_id
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		t.connectionPlayedDisplayName = self.connection_played_display_name
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, v:jsonEncode())
		end
		t.connectionPlayedUsers = t_1
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		t.connectionPlayedNumOthers = self.connection_played_num_others
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		t.connectionPlayedTotalCount = self.connection_played_total_count
	end
	return t
end

function t_22:jsonDecode() --[[ line: 8892 ]]
	-- upvalues: t_22 (ref), t (ref)
	local var1175 = t_22.new()
	
	if self.universe_id ~= nil then
		var1175.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1175.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var1175.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var1175.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var1175.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var1175.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var1175.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1175.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1175.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1175.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var1175.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var1175.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var1175.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var1175.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var1175
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p43) --[[ line: 8979 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p43 == nil or p43.user_id == nil then "" else p43.user_id
	}, t_23)
end

function t_23:encode() --[[ line: 8990 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1179 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1180, var1181 = protoModule.writeTag(buff, var1179, 1, protoModule.wireTypes.lengthDelimited)
		var1180, var1181 = protoModule.writeString(var1180, var1181, self.user_id)
		buff = var1180
		var1179 = var1181
	end
	local buff_1 = buffer.create(var1179)
	buffer.copy(buff_1, 0, buff, 0, var1179)
	
	return buff_1
end

function t_23.decode(p44) --[[ line: 9006 ]]
	-- upvalues: t_23 (ref), protoModule (ref)
	local var1183 = t_23.new()
	local var1184 = 0
	while var1184 < buffer.len(p44) do
		local _ = nil
		local var1185 = nil
		local var1186, var1187, var1188 = protoModule.readTag(p44, var1184)
		local var1189 = var1186
		var1185 = var1187
		var1184 = var1188
		
		if var1185 == protoModule.wireTypes.varint then
			local _ = nil
			local var1190, var1191 = protoModule.readVarInt(p44, var1184)
			local _ = var1190
			var1184 = var1191
			continue
		end
		if var1185 == protoModule.wireTypes.lengthDelimited then
			if var1189 == 1 then
				local _ = nil
				local var1192, var1193 = protoModule.readBuffer(p44, var1184)
				var1184 = var1193
				var1183.user_id = buffer.tostring(var1192)
			else
				local _ = nil
				local var1194, var1195 = protoModule.readVarInt(p44, var1184)
				var1184 = var1195 + var1194
			end
		elseif var1185 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1196, var1197 = protoModule.readFixed32(p44, var1184)
			local _ = var1196
			var1184 = var1197
		elseif var1185 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1198, var1199 = protoModule.readFixed64(p44, var1184)
			local _ = var1198
			var1184 = var1199
		else
			error("Unsupported wire type: " .. var1185)
		end
	end
	return var1183
end

function t_23:jsonEncode() --[[ line: 9051 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_23:jsonDecode() --[[ line: 9063 ]]
	-- upvalues: t_23 (ref)
	local var1201 = t_23.new()
	
	if self.user_id ~= nil then
		var1201.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1201.user_id = self.userId
	end
	return var1201
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p45) --[[ line: 9094 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p45 == nil or p45.media_items == nil then {} else p45.media_items,
		universe_id = if p45 == nil or p45.universe_id == nil then "" else p45.universe_id,
		place_id = if p45 == nil or p45.place_id == nil then "" else p45.place_id
	}, t_24)
end

function t_24:encode() --[[ line: 9104 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1203 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var1204 = v:encode()
			local var1205, var1206 = protoModule.writeTag(buff, var1203, 1, protoModule.wireTypes.lengthDelimited)
			var1205, var1206 = protoModule.writeBuffer(var1205, var1206, var1204, buffer.len(var1204))
			buff = var1205
			var1203 = var1206
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1207, var1208 = protoModule.writeTag(buff, var1203, 2, protoModule.wireTypes.lengthDelimited)
		var1207, var1208 = protoModule.writeString(var1207, var1208, self.universe_id)
		buff = var1207
		var1203 = var1208
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1209, var1210 = protoModule.writeTag(buff, var1203, 3, protoModule.wireTypes.lengthDelimited)
		var1209, var1210 = protoModule.writeString(var1209, var1210, self.place_id)
		buff = var1209
		var1203 = var1210
	end
	local buff_1 = buffer.create(var1203)
	buffer.copy(buff_1, 0, buff, 0, var1203)
	
	return buff_1
end

function t_24.decode(p46) --[[ line: 9131 ]]
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var1212 = t_24.new()
	local var1213 = 0
	while var1213 < buffer.len(p46) do
		local _ = nil
		local var1214 = nil
		local var1215, var1216, var1217 = protoModule.readTag(p46, var1213)
		local var1218 = var1215
		var1214 = var1216
		var1213 = var1217
		
		if var1214 == protoModule.wireTypes.varint then
			local _ = nil
			local var1219, var1220 = protoModule.readVarInt(p46, var1213)
			local _ = var1219
			var1213 = var1220
			continue
		end
		if var1214 == protoModule.wireTypes.lengthDelimited then
			if var1218 == 1 then
				local _ = nil
				local var1221, var1222 = protoModule.readBuffer(p46, var1213)
				var1213 = var1222
				table.insert(var1212.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var1221))
			elseif var1218 == 2 then
				local _ = nil
				local var1223, var1224 = protoModule.readBuffer(p46, var1213)
				var1213 = var1224
				var1212.universe_id = buffer.tostring(var1223)
			elseif var1218 == 3 then
				local _ = nil
				local var1225, var1226 = protoModule.readBuffer(p46, var1213)
				var1213 = var1226
				var1212.place_id = buffer.tostring(var1225)
			else
				local _ = nil
				local var1227, var1228 = protoModule.readVarInt(p46, var1213)
				var1213 = var1228 + var1227
			end
		elseif var1214 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1229, var1230 = protoModule.readFixed32(p46, var1213)
			local _ = var1229
			var1213 = var1230
		elseif var1214 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1231, var1232 = protoModule.readFixed64(p46, var1213)
			local _ = var1231
			var1213 = var1232
		else
			error("Unsupported wire type: " .. var1214)
		end
	end
	return var1212
end

function t_24:jsonEncode() --[[ line: 9184 ]]
	local t = {}
	
	if self.media_items ~= nil and #self.media_items > 0 then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.mediaItems = t_1
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_24:jsonDecode() --[[ line: 9206 ]]
	-- upvalues: t_24 (ref), t (ref)
	local var1235 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1235.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1235.media_items = t_1
	end
	if self.universe_id ~= nil then
		var1235.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1235.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1235.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1235.place_id = self.placeId
	end
	return var1235
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p47) --[[ line: 9260 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p47 == nil or p47.media_asset_id == nil then "" else p47.media_asset_id
	}, t_25)
end

function t_25:encode() --[[ line: 9268 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1239 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1240, var1241 = protoModule.writeTag(buff, var1239, 1, protoModule.wireTypes.lengthDelimited)
		var1240, var1241 = protoModule.writeString(var1240, var1241, self.media_asset_id)
		buff = var1240
		var1239 = var1241
	end
	local buff_1 = buffer.create(var1239)
	buffer.copy(buff_1, 0, buff, 0, var1239)
	
	return buff_1
end

function t_25.decode(p48) --[[ line: 9284 ]]
	-- upvalues: t_25 (ref), protoModule (ref)
	local var1243 = t_25.new()
	local var1244 = 0
	while var1244 < buffer.len(p48) do
		local _ = nil
		local var1245 = nil
		local var1246, var1247, var1248 = protoModule.readTag(p48, var1244)
		local var1249 = var1246
		var1245 = var1247
		var1244 = var1248
		
		if var1245 == protoModule.wireTypes.varint then
			local _ = nil
			local var1250, var1251 = protoModule.readVarInt(p48, var1244)
			local _ = var1250
			var1244 = var1251
			continue
		end
		if var1245 == protoModule.wireTypes.lengthDelimited then
			if var1249 == 1 then
				local _ = nil
				local var1252, var1253 = protoModule.readBuffer(p48, var1244)
				var1244 = var1253
				var1243.media_asset_id = buffer.tostring(var1252)
			else
				local _ = nil
				local var1254, var1255 = protoModule.readVarInt(p48, var1244)
				var1244 = var1255 + var1254
			end
		elseif var1245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1256, var1257 = protoModule.readFixed32(p48, var1244)
			local _ = var1256
			var1244 = var1257
		elseif var1245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1258, var1259 = protoModule.readFixed64(p48, var1244)
			local _ = var1258
			var1244 = var1259
		else
			error("Unsupported wire type: " .. var1245)
		end
	end
	return var1243
end

function t_25:jsonEncode() --[[ line: 9329 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_25:jsonDecode() --[[ line: 9341 ]]
	-- upvalues: t_25 (ref)
	local var1261 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var1261.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1261.media_asset_id = self.mediaAssetId
	end
	return var1261
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p49) --[[ line: 9371 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		universe_id = if p49 == nil or p49.universe_id == nil then "" else p49.universe_id
	}, t_26)
end

function t_26:encode() --[[ line: 9379 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1263 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1264, var1265 = protoModule.writeTag(buff, var1263, 1, protoModule.wireTypes.lengthDelimited)
		var1264, var1265 = protoModule.writeString(var1264, var1265, self.universe_id)
		buff = var1264
		var1263 = var1265
	end
	local buff_1 = buffer.create(var1263)
	buffer.copy(buff_1, 0, buff, 0, var1263)
	
	return buff_1
end

function t_26.decode(p50) --[[ line: 9393 ]]
	-- upvalues: t_26 (ref), protoModule (ref)
	local var1267 = t_26.new()
	local var1268 = 0
	while var1268 < buffer.len(p50) do
		local _ = nil
		local var1269 = nil
		local var1270, var1271, var1272 = protoModule.readTag(p50, var1268)
		local var1273 = var1270
		var1269 = var1271
		var1268 = var1272
		
		if var1269 == protoModule.wireTypes.varint then
			local _ = nil
			local var1274, var1275 = protoModule.readVarInt(p50, var1268)
			local _ = var1274
			var1268 = var1275
			continue
		end
		if var1269 == protoModule.wireTypes.lengthDelimited then
			if var1273 == 1 then
				local _ = nil
				local var1276, var1277 = protoModule.readBuffer(p50, var1268)
				var1268 = var1277
				var1267.universe_id = buffer.tostring(var1276)
			else
				local _ = nil
				local var1278, var1279 = protoModule.readVarInt(p50, var1268)
				var1268 = var1279 + var1278
			end
		elseif var1269 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1280, var1281 = protoModule.readFixed32(p50, var1268)
			local _ = var1280
			var1268 = var1281
		elseif var1269 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1282, var1283 = protoModule.readFixed64(p50, var1268)
			local _ = var1282
			var1268 = var1283
		else
			error("Unsupported wire type: " .. var1269)
		end
	end
	return var1267
end

function t_26:jsonEncode() --[[ line: 9436 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_26:jsonDecode() --[[ line: 9446 ]]
	-- upvalues: t_26 (ref)
	local var1285 = t_26.new()
	
	if self.universe_id ~= nil then
		var1285.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1285.universe_id = self.universeId
	end
	return var1285
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p51) --[[ line: 9474 ]]
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p51 == nil or p51.universe_id == nil then "" else p51.universe_id
	}, t_27)
end

function t_27:encode() --[[ line: 9482 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1287 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1288, var1289 = protoModule.writeTag(buff, var1287, 1, protoModule.wireTypes.lengthDelimited)
		var1288, var1289 = protoModule.writeString(var1288, var1289, self.universe_id)
		buff = var1288
		var1287 = var1289
	end
	local buff_1 = buffer.create(var1287)
	buffer.copy(buff_1, 0, buff, 0, var1287)
	
	return buff_1
end

function t_27.decode(p52) --[[ line: 9496 ]]
	-- upvalues: t_27 (ref), protoModule (ref)
	local var1291 = t_27.new()
	local var1292 = 0
	while var1292 < buffer.len(p52) do
		local _ = nil
		local var1293 = nil
		local var1294, var1295, var1296 = protoModule.readTag(p52, var1292)
		local var1297 = var1294
		var1293 = var1295
		var1292 = var1296
		
		if var1293 == protoModule.wireTypes.varint then
			local _ = nil
			local var1298, var1299 = protoModule.readVarInt(p52, var1292)
			local _ = var1298
			var1292 = var1299
			continue
		end
		if var1293 == protoModule.wireTypes.lengthDelimited then
			if var1297 == 1 then
				local _ = nil
				local var1300, var1301 = protoModule.readBuffer(p52, var1292)
				var1292 = var1301
				var1291.universe_id = buffer.tostring(var1300)
			else
				local _ = nil
				local var1302, var1303 = protoModule.readVarInt(p52, var1292)
				var1292 = var1303 + var1302
			end
		elseif var1293 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1304, var1305 = protoModule.readFixed32(p52, var1292)
			local _ = var1304
			var1292 = var1305
		elseif var1293 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1306, var1307 = protoModule.readFixed64(p52, var1292)
			local _ = var1306
			var1292 = var1307
		else
			error("Unsupported wire type: " .. var1293)
		end
	end
	return var1291
end

function t_27:jsonEncode() --[[ line: 9539 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_27:jsonDecode() --[[ line: 9549 ]]
	-- upvalues: t_27 (ref)
	local var1309 = t_27.new()
	
	if self.universe_id ~= nil then
		var1309.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1309.universe_id = self.universeId
	end
	return var1309
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p53) --[[ line: 9577 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p53 == nil or p53.universe_id == nil then "" else p53.universe_id,
		has_store_items = if p53 == nil or p53.has_store_items == nil then false else p53.has_store_items,
		has_badges = if p53 == nil or p53.has_badges == nil then false else p53.has_badges,
		has_game_passes = if p53 == nil or p53.has_game_passes == nil then false else p53.has_game_passes
	}, t_28)
end

function t_28:encode() --[[ line: 9588 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1311 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1312, var1313 = protoModule.writeTag(buff, var1311, 1, protoModule.wireTypes.lengthDelimited)
		var1312, var1313 = protoModule.writeString(var1312, var1313, self.universe_id)
		buff = var1312
		var1311 = var1313
	end
	if self.has_store_items then
		local var1314, var1315 = protoModule.writeTag(buff, var1311, 2, protoModule.wireTypes.varint)
		var1314, var1315 = protoModule.writeVarInt(var1314, var1315, if self.has_store_items then 1 else 0)
		buff = var1314
		var1311 = var1315
	end
	if self.has_badges then
		local var1316, var1317 = protoModule.writeTag(buff, var1311, 3, protoModule.wireTypes.varint)
		var1316, var1317 = protoModule.writeVarInt(var1316, var1317, if self.has_badges then 1 else 0)
		buff = var1316
		var1311 = var1317
	end
	if self.has_game_passes then
		local var1318, var1319 = protoModule.writeTag(buff, var1311, 4, protoModule.wireTypes.varint)
		var1318, var1319 = protoModule.writeVarInt(var1318, var1319, if self.has_game_passes then 1 else 0)
		buff = var1318
		var1311 = var1319
	end
	local buff_1 = buffer.create(var1311)
	buffer.copy(buff_1, 0, buff, 0, var1311)
	
	return buff_1
end

function t_28.decode(p54) --[[ line: 9617 ]]
	-- upvalues: t_28 (ref), protoModule (ref)
	local var1321 = t_28.new()
	local var1322 = 0
	while var1322 < buffer.len(p54) do
		local _ = nil
		local var1323 = nil
		local var1324, var1325, var1326 = protoModule.readTag(p54, var1322)
		local var1327 = var1324
		var1323 = var1325
		var1322 = var1326
		
		if var1323 == protoModule.wireTypes.varint then
			if var1327 == 2 then
				local _ = nil
				local var1328, var1329 = protoModule.readVarInt(p54, var1322)
				var1322 = var1329
				var1321.has_store_items = var1328 ~= 0
			elseif var1327 == 3 then
				local _ = nil
				local var1330, var1331 = protoModule.readVarInt(p54, var1322)
				var1322 = var1331
				var1321.has_badges = var1330 ~= 0
			elseif var1327 == 4 then
				local _ = nil
				local var1332, var1333 = protoModule.readVarInt(p54, var1322)
				var1322 = var1333
				var1321.has_game_passes = var1332 ~= 0
			else
				local _ = nil
				local var1334, var1335 = protoModule.readVarInt(p54, var1322)
				local _ = var1334
				var1322 = var1335
			end
		end
		if var1323 == protoModule.wireTypes.lengthDelimited then
			if var1327 == 1 then
				local _ = nil
				local var1336, var1337 = protoModule.readBuffer(p54, var1322)
				var1322 = var1337
				var1321.universe_id = buffer.tostring(var1336)
			else
				local _ = nil
				local var1338, var1339 = protoModule.readVarInt(p54, var1322)
				var1322 = var1339 + var1338
			end
		elseif var1323 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1340, var1341 = protoModule.readFixed32(p54, var1322)
			local _ = var1340
			var1322 = var1341
		elseif var1323 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1342, var1343 = protoModule.readFixed64(p54, var1322)
			local _ = var1342
			var1322 = var1343
		else
			error("Unsupported wire type: " .. var1323)
		end
	end
	return var1321
end

function t_28:jsonEncode() --[[ line: 9675 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.has_store_items then
		t.hasStoreItems = self.has_store_items
	end
	if self.has_badges then
		t.hasBadges = self.has_badges
	end
	if self.has_game_passes then
		t.hasGamePasses = self.has_game_passes
	end
	return t
end

function t_28:jsonDecode() --[[ line: 9697 ]]
	-- upvalues: t_28 (ref)
	local var1345 = t_28.new()
	
	if self.universe_id ~= nil then
		var1345.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1345.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var1345.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var1345.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var1345.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var1345.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var1345.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var1345.has_game_passes = self.hasGamePasses
	end
	return var1345
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p55) --[[ line: 9749 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p55 == nil or p55.universe_id == nil then "" else p55.universe_id
	}, t_29)
end

function t_29:encode() --[[ line: 9757 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1347 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1348, var1349 = protoModule.writeTag(buff, var1347, 1, protoModule.wireTypes.lengthDelimited)
		var1348, var1349 = protoModule.writeString(var1348, var1349, self.universe_id)
		buff = var1348
		var1347 = var1349
	end
	local buff_1 = buffer.create(var1347)
	buffer.copy(buff_1, 0, buff, 0, var1347)
	
	return buff_1
end

function t_29.decode(p56) --[[ line: 9771 ]]
	-- upvalues: t_29 (ref), protoModule (ref)
	local var1351 = t_29.new()
	local var1352 = 0
	while var1352 < buffer.len(p56) do
		local _ = nil
		local var1353 = nil
		local var1354, var1355, var1356 = protoModule.readTag(p56, var1352)
		local var1357 = var1354
		var1353 = var1355
		var1352 = var1356
		
		if var1353 == protoModule.wireTypes.varint then
			local _ = nil
			local var1358, var1359 = protoModule.readVarInt(p56, var1352)
			local _ = var1358
			var1352 = var1359
			continue
		end
		if var1353 == protoModule.wireTypes.lengthDelimited then
			if var1357 == 1 then
				local _ = nil
				local var1360, var1361 = protoModule.readBuffer(p56, var1352)
				var1352 = var1361
				var1351.universe_id = buffer.tostring(var1360)
			else
				local _ = nil
				local var1362, var1363 = protoModule.readVarInt(p56, var1352)
				var1352 = var1363 + var1362
			end
		elseif var1353 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1364, var1365 = protoModule.readFixed32(p56, var1352)
			local _ = var1364
			var1352 = var1365
		elseif var1353 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1366, var1367 = protoModule.readFixed64(p56, var1352)
			local _ = var1366
			var1352 = var1367
		else
			error("Unsupported wire type: " .. var1353)
		end
	end
	return var1351
end

function t_29:jsonEncode() --[[ line: 9814 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_29:jsonDecode() --[[ line: 9824 ]]
	-- upvalues: t_29 (ref)
	local var1369 = t_29.new()
	
	if self.universe_id ~= nil then
		var1369.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1369.universe_id = self.universeId
	end
	return var1369
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p57) --[[ line: 9854 ]]
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p57 == nil or p57.universe_id == nil then "" else p57.universe_id,
		user_owns_experience = if p57 == nil or p57.user_owns_experience == nil then false else p57.user_owns_experience
	}, t_30)
end

function t_30:encode() --[[ line: 9865 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1371 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1372, var1373 = protoModule.writeTag(buff, var1371, 1, protoModule.wireTypes.lengthDelimited)
		var1372, var1373 = protoModule.writeString(var1372, var1373, self.universe_id)
		buff = var1372
		var1371 = var1373
	end
	if self.user_owns_experience then
		local var1374, var1375 = protoModule.writeTag(buff, var1371, 2, protoModule.wireTypes.varint)
		var1374, var1375 = protoModule.writeVarInt(var1374, var1375, if self.user_owns_experience then 1 else 0)
		buff = var1374
		var1371 = var1375
	end
	local buff_1 = buffer.create(var1371)
	buffer.copy(buff_1, 0, buff, 0, var1371)
	
	return buff_1
end

function t_30.decode(p58) --[[ line: 9884 ]]
	-- upvalues: t_30 (ref), protoModule (ref)
	local var1377 = t_30.new()
	local var1378 = 0
	while var1378 < buffer.len(p58) do
		local _ = nil
		local var1379 = nil
		local var1380, var1381, var1382 = protoModule.readTag(p58, var1378)
		local var1383 = var1380
		var1379 = var1381
		var1378 = var1382
		
		if var1379 == protoModule.wireTypes.varint then
			if var1383 == 2 then
				local _ = nil
				local var1384, var1385 = protoModule.readVarInt(p58, var1378)
				var1378 = var1385
				var1377.user_owns_experience = var1384 ~= 0
			else
				local _ = nil
				local var1386, var1387 = protoModule.readVarInt(p58, var1378)
				local _ = var1386
				var1378 = var1387
			end
		end
		if var1379 == protoModule.wireTypes.lengthDelimited then
			if var1383 == 1 then
				local _ = nil
				local var1388, var1389 = protoModule.readBuffer(p58, var1378)
				var1378 = var1389
				var1377.universe_id = buffer.tostring(var1388)
			else
				local _ = nil
				local var1390, var1391 = protoModule.readVarInt(p58, var1378)
				var1378 = var1391 + var1390
			end
		elseif var1379 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1392, var1393 = protoModule.readFixed32(p58, var1378)
			local _ = var1392
			var1378 = var1393
		elseif var1379 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1394, var1395 = protoModule.readFixed64(p58, var1378)
			local _ = var1394
			var1378 = var1395
		else
			error("Unsupported wire type: " .. var1379)
		end
	end
	return var1377
end

function t_30:jsonEncode() --[[ line: 9932 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_30:jsonDecode() --[[ line: 9946 ]]
	-- upvalues: t_30 (ref)
	local var1397 = t_30.new()
	
	if self.universe_id ~= nil then
		var1397.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1397.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1397.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1397.user_owns_experience = self.userOwnsExperience
	end
	return var1397
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p59) --[[ line: 9982 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p59 == nil or p59.universe_id == nil then "" else p59.universe_id,
		place_id = if p59 == nil or p59.place_id == nil then "" else p59.place_id
	}, t_31)
end

function t_31:encode() --[[ line: 9991 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1399 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1400, var1401 = protoModule.writeTag(buff, var1399, 1, protoModule.wireTypes.lengthDelimited)
		var1400, var1401 = protoModule.writeString(var1400, var1401, self.universe_id)
		buff = var1400
		var1399 = var1401
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1402, var1403 = protoModule.writeTag(buff, var1399, 2, protoModule.wireTypes.lengthDelimited)
		var1402, var1403 = protoModule.writeString(var1402, var1403, self.place_id)
		buff = var1402
		var1399 = var1403
	end
	local buff_1 = buffer.create(var1399)
	buffer.copy(buff_1, 0, buff, 0, var1399)
	
	return buff_1
end

function t_31.decode(p60) --[[ line: 10010 ]]
	-- upvalues: t_31 (ref), protoModule (ref)
	local var1405 = t_31.new()
	local var1406 = 0
	while var1406 < buffer.len(p60) do
		local _ = nil
		local var1407 = nil
		local var1408, var1409, var1410 = protoModule.readTag(p60, var1406)
		local var1411 = var1408
		var1407 = var1409
		var1406 = var1410
		
		if var1407 == protoModule.wireTypes.varint then
			local _ = nil
			local var1412, var1413 = protoModule.readVarInt(p60, var1406)
			local _ = var1412
			var1406 = var1413
			continue
		end
		if var1407 == protoModule.wireTypes.lengthDelimited then
			if var1411 == 1 then
				local _ = nil
				local var1414, var1415 = protoModule.readBuffer(p60, var1406)
				var1406 = var1415
				var1405.universe_id = buffer.tostring(var1414)
			elseif var1411 == 2 then
				local _ = nil
				local var1416, var1417 = protoModule.readBuffer(p60, var1406)
				var1406 = var1417
				var1405.place_id = buffer.tostring(var1416)
			else
				local _ = nil
				local var1418, var1419 = protoModule.readVarInt(p60, var1406)
				var1406 = var1419 + var1418
			end
		elseif var1407 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1420, var1421 = protoModule.readFixed32(p60, var1406)
			local _ = var1420
			var1406 = var1421
		elseif var1407 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1422, var1423 = protoModule.readFixed64(p60, var1406)
			local _ = var1422
			var1406 = var1423
		else
			error("Unsupported wire type: " .. var1407)
		end
	end
	return var1405
end

function t_31:jsonEncode() --[[ line: 10058 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_31:jsonDecode() --[[ line: 10072 ]]
	-- upvalues: t_31 (ref)
	local var1425 = t_31.new()
	
	if self.universe_id ~= nil then
		var1425.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1425.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1425.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1425.place_id = self.placeId
	end
	return var1425
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p61) --[[ line: 10110 ]]
	-- upvalues: t_32 (ref)
	return setmetatable({
		community_id = if p61 == nil or p61.community_id == nil then "" else p61.community_id
	}, t_32)
end

function t_32:encode() --[[ line: 10118 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1427 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var1428, var1429 = protoModule.writeTag(buff, var1427, 1, protoModule.wireTypes.lengthDelimited)
		var1428, var1429 = protoModule.writeString(var1428, var1429, self.community_id)
		buff = var1428
		var1427 = var1429
	end
	local buff_1 = buffer.create(var1427)
	buffer.copy(buff_1, 0, buff, 0, var1427)
	
	return buff_1
end

function t_32.decode(p62) --[[ line: 10132 ]]
	-- upvalues: t_32 (ref), protoModule (ref)
	local var1431 = t_32.new()
	local var1432 = 0
	while var1432 < buffer.len(p62) do
		local _ = nil
		local var1433 = nil
		local var1434, var1435, var1436 = protoModule.readTag(p62, var1432)
		local var1437 = var1434
		var1433 = var1435
		var1432 = var1436
		
		if var1433 == protoModule.wireTypes.varint then
			local _ = nil
			local var1438, var1439 = protoModule.readVarInt(p62, var1432)
			local _ = var1438
			var1432 = var1439
			continue
		end
		if var1433 == protoModule.wireTypes.lengthDelimited then
			if var1437 == 1 then
				local _ = nil
				local var1440, var1441 = protoModule.readBuffer(p62, var1432)
				var1432 = var1441
				var1431.community_id = buffer.tostring(var1440)
			else
				local _ = nil
				local var1442, var1443 = protoModule.readVarInt(p62, var1432)
				var1432 = var1443 + var1442
			end
		elseif var1433 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1444, var1445 = protoModule.readFixed32(p62, var1432)
			local _ = var1444
			var1432 = var1445
		elseif var1433 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1446, var1447 = protoModule.readFixed64(p62, var1432)
			local _ = var1446
			var1432 = var1447
		else
			error("Unsupported wire type: " .. var1433)
		end
	end
	return var1431
end

function t_32:jsonEncode() --[[ line: 10175 ]]
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_32:jsonDecode() --[[ line: 10185 ]]
	-- upvalues: t_32 (ref)
	local var1449 = t_32.new()
	
	if self.community_id ~= nil then
		var1449.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var1449.community_id = self.communityId
	end
	return var1449
end

t_32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_32
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p63) --[[ line: 10213 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_items = if p63 == nil or p63.social_link_items == nil then {} else p63.social_link_items
	}, t_33)
end

function t_33:encode() --[[ line: 10219 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1451 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var1452 = v:encode()
			local var1453, var1454 = protoModule.writeTag(buff, var1451, 1, protoModule.wireTypes.lengthDelimited)
			var1453, var1454 = protoModule.writeBuffer(var1453, var1454, var1452, buffer.len(var1452))
			buff = var1453
			var1451 = var1454
		end
	end
	local buff_1 = buffer.create(var1451)
	buffer.copy(buff_1, 0, buff, 0, var1451)
	
	return buff_1
end

function t_33.decode(p64) --[[ line: 10236 ]]
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1456 = t_33.new()
	local var1457 = 0
	while var1457 < buffer.len(p64) do
		local _ = nil
		local var1458 = nil
		local var1459, var1460, var1461 = protoModule.readTag(p64, var1457)
		local var1462 = var1459
		var1458 = var1460
		var1457 = var1461
		
		if var1458 == protoModule.wireTypes.varint then
			local _ = nil
			local var1463, var1464 = protoModule.readVarInt(p64, var1457)
			local _ = var1463
			var1457 = var1464
			continue
		end
		if var1458 == protoModule.wireTypes.lengthDelimited then
			if var1462 == 1 then
				local _ = nil
				local var1465, var1466 = protoModule.readBuffer(p64, var1457)
				var1457 = var1466
				table.insert(var1456.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var1465))
			else
				local _ = nil
				local var1467, var1468 = protoModule.readVarInt(p64, var1457)
				var1457 = var1468 + var1467
			end
		elseif var1458 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1469, var1470 = protoModule.readFixed32(p64, var1457)
			local _ = var1469
			var1457 = var1470
		elseif var1458 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1471, var1472 = protoModule.readFixed64(p64, var1457)
			local _ = var1471
			var1457 = var1472
		else
			error("Unsupported wire type: " .. var1458)
		end
	end
	return var1456
end

function t_33:jsonEncode() --[[ line: 10279 ]]
	local t = {}
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.socialLinkItems = t_1
	end
	return t
end

function t_33:jsonDecode() --[[ line: 10293 ]]
	-- upvalues: t_33 (ref), t (ref)
	local var1475 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1475.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1475.social_link_items = t_1
	end
	return var1475
end

t_33.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p65) --[[ line: 10331 ]]
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_id = if p65 == nil or p65.social_link_id == nil then "" else p65.social_link_id
	}, t_34)
end

function t_34:encode() --[[ line: 10339 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1479 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var1480, var1481 = protoModule.writeTag(buff, var1479, 1, protoModule.wireTypes.lengthDelimited)
		var1480, var1481 = protoModule.writeString(var1480, var1481, self.social_link_id)
		buff = var1480
		var1479 = var1481
	end
	local buff_1 = buffer.create(var1479)
	buffer.copy(buff_1, 0, buff, 0, var1479)
	
	return buff_1
end

function t_34.decode(p66) --[[ line: 10353 ]]
	-- upvalues: t_34 (ref), protoModule (ref)
	local var1483 = t_34.new()
	local var1484 = 0
	while var1484 < buffer.len(p66) do
		local _ = nil
		local var1485 = nil
		local var1486, var1487, var1488 = protoModule.readTag(p66, var1484)
		local var1489 = var1486
		var1485 = var1487
		var1484 = var1488
		
		if var1485 == protoModule.wireTypes.varint then
			local _ = nil
			local var1490, var1491 = protoModule.readVarInt(p66, var1484)
			local _ = var1490
			var1484 = var1491
			continue
		end
		if var1485 == protoModule.wireTypes.lengthDelimited then
			if var1489 == 1 then
				local _ = nil
				local var1492, var1493 = protoModule.readBuffer(p66, var1484)
				var1484 = var1493
				var1483.social_link_id = buffer.tostring(var1492)
			else
				local _ = nil
				local var1494, var1495 = protoModule.readVarInt(p66, var1484)
				var1484 = var1495 + var1494
			end
		elseif var1485 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1496, var1497 = protoModule.readFixed32(p66, var1484)
			local _ = var1496
			var1484 = var1497
		elseif var1485 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1498, var1499 = protoModule.readFixed64(p66, var1484)
			local _ = var1498
			var1484 = var1499
		else
			error("Unsupported wire type: " .. var1485)
		end
	end
	return var1483
end

function t_34:jsonEncode() --[[ line: 10396 ]]
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_34:jsonDecode() --[[ line: 10406 ]]
	-- upvalues: t_34 (ref)
	local var1501 = t_34.new()
	
	if self.social_link_id ~= nil then
		var1501.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1501.social_link_id = self.socialLinkId
	end
	return var1501
end

t_34.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p67) --[[ line: 10436 ]]
	-- upvalues: t_35 (ref)
	return setmetatable({
		title = if p67 == nil or p67.title == nil then "" else p67.title,
		universe_items = if p67 == nil or p67.universe_items == nil then {} else p67.universe_items,
		next_page_token = if p67 == nil or p67.next_page_token == nil then "" else p67.next_page_token,
		sort_id = if p67 == nil or p67.sort_id == nil then "" else p67.sort_id,
		secondary_sort_id = if p67 == nil or p67.secondary_sort_id == nil then 0 else p67.secondary_sort_id,
		max_visible_rows = if p67 == nil or p67.max_visible_rows == nil then 0 else p67.max_visible_rows,
		subtitle = if p67 == nil or p67.subtitle == nil then "" else p67.subtitle,
		info_text = if p67 == nil or p67.info_text == nil then "" else p67.info_text,
		subtitle_link_path = if p67 == nil or p67.subtitle_link_path == nil then "" else p67.subtitle_link_path,
		is_placeholder = if p67 == nil or p67.is_placeholder == nil then nil else p67.is_placeholder,
		primary_sort_id = if p67 == nil or p67.primary_sort_id == nil then nil else p67.primary_sort_id,
		applied_filters = if p67 == nil or p67.applied_filters == nil then nil else p67.applied_filters,
		pool_id = if p67 == nil or p67.pool_id == nil then nil else p67.pool_id,
		has_emphasized_tile = if p67 == nil or p67.has_emphasized_tile == nil then false else p67.has_emphasized_tile,
		tile_activation_mode = if p67 == nil or p67.tile_activation_mode == nil then "" else p67.tile_activation_mode
	}, t_35)
end

function t_35:encode() --[[ line: 10462 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1503 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1504, var1505 = protoModule.writeTag(buff, var1503, 1, protoModule.wireTypes.lengthDelimited)
		var1504, var1505 = protoModule.writeString(var1504, var1505, self.title)
		buff = var1504
		var1503 = var1505
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var1506 = v:encode()
			local var1507, var1508 = protoModule.writeTag(buff, var1503, 2, protoModule.wireTypes.lengthDelimited)
			var1507, var1508 = protoModule.writeBuffer(var1507, var1508, var1506, buffer.len(var1506))
			buff = var1507
			var1503 = var1508
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1509, var1510 = protoModule.writeTag(buff, var1503, 3, protoModule.wireTypes.lengthDelimited)
		var1509, var1510 = protoModule.writeString(var1509, var1510, self.next_page_token)
		buff = var1509
		var1503 = var1510
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1511, var1512 = protoModule.writeTag(buff, var1503, 4, protoModule.wireTypes.lengthDelimited)
		var1511, var1512 = protoModule.writeString(var1511, var1512, self.sort_id)
		buff = var1511
		var1503 = var1512
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1513, var1514 = protoModule.writeTag(buff, var1503, 5, protoModule.wireTypes.varint)
		var1513, var1514 = protoModule.writeVarInt(var1513, var1514, self.secondary_sort_id)
		buff = var1513
		var1503 = var1514
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var1515, var1516 = protoModule.writeTag(buff, var1503, 6, protoModule.wireTypes.varint)
		var1515, var1516 = protoModule.writeVarInt(var1515, var1516, self.max_visible_rows)
		buff = var1515
		var1503 = var1516
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1517, var1518 = protoModule.writeTag(buff, var1503, 7, protoModule.wireTypes.lengthDelimited)
		var1517, var1518 = protoModule.writeString(var1517, var1518, self.subtitle)
		buff = var1517
		var1503 = var1518
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1519, var1520 = protoModule.writeTag(buff, var1503, 8, protoModule.wireTypes.lengthDelimited)
		var1519, var1520 = protoModule.writeString(var1519, var1520, self.info_text)
		buff = var1519
		var1503 = var1520
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1521, var1522 = protoModule.writeTag(buff, var1503, 9, protoModule.wireTypes.lengthDelimited)
		var1521, var1522 = protoModule.writeString(var1521, var1522, self.subtitle_link_path)
		buff = var1521
		var1503 = var1522
	end
	if self.is_placeholder ~= nil then
		local var1523, var1524 = protoModule.writeTag(buff, var1503, 10, protoModule.wireTypes.varint)
		var1523, var1524 = protoModule.writeVarInt(var1523, var1524, if self.is_placeholder then 1 else 0)
		buff = var1523
		var1503 = var1524
	end
	if self.primary_sort_id ~= nil then
		local var1525, var1526 = protoModule.writeTag(buff, var1503, 11, protoModule.wireTypes.varint)
		var1525, var1526 = protoModule.writeVarInt(var1525, var1526, self.primary_sort_id)
		buff = var1525
		var1503 = var1526
	end
	if self.applied_filters ~= nil then
		local var1527, var1528 = protoModule.writeTag(buff, var1503, 12, protoModule.wireTypes.lengthDelimited)
		var1527, var1528 = protoModule.writeString(var1527, var1528, self.applied_filters)
		buff = var1527
		var1503 = var1528
	end
	if self.pool_id ~= nil then
		local var1529, var1530 = protoModule.writeTag(buff, var1503, 13, protoModule.wireTypes.lengthDelimited)
		var1529, var1530 = protoModule.writeString(var1529, var1530, self.pool_id)
		buff = var1529
		var1503 = var1530
	end
	if self.has_emphasized_tile then
		local var1531, var1532 = protoModule.writeTag(buff, var1503, 14, protoModule.wireTypes.varint)
		var1531, var1532 = protoModule.writeVarInt(var1531, var1532, if self.has_emphasized_tile then 1 else 0)
		buff = var1531
		var1503 = var1532
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var1533, var1534 = protoModule.writeTag(buff, var1503, 15, protoModule.wireTypes.lengthDelimited)
		var1533, var1534 = protoModule.writeString(var1533, var1534, self.tile_activation_mode)
		buff = var1533
		var1503 = var1534
	end
	local buff_1 = buffer.create(var1503)
	buffer.copy(buff_1, 0, buff, 0, var1503)
	
	return buff_1
end

function t_35.decode(p68) --[[ line: 10549 ]]
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var1536 = t_35.new()
	local var1537 = 0
	while var1537 < buffer.len(p68) do
		local _ = nil
		local var1538 = nil
		local var1539, var1540, var1541 = protoModule.readTag(p68, var1537)
		local var1542 = var1539
		var1538 = var1540
		var1537 = var1541
		
		if var1538 == protoModule.wireTypes.varint then
			if var1542 == 5 then
				local _ = nil
				local var1543, var1544 = protoModule.readVarIntI32(p68, var1537)
				var1537 = var1544
				var1536.secondary_sort_id = var1543
			elseif var1542 == 6 then
				local _ = nil
				local var1545, var1546 = protoModule.readVarIntI32(p68, var1537)
				var1537 = var1546
				var1536.max_visible_rows = var1545
			elseif var1542 == 10 then
				local _ = nil
				local var1547, var1548 = protoModule.readVarInt(p68, var1537)
				var1537 = var1548
				var1536.is_placeholder = var1547 ~= 0
			elseif var1542 == 11 then
				local _ = nil
				local var1549, var1550 = protoModule.readVarIntI32(p68, var1537)
				var1537 = var1550
				var1536.primary_sort_id = var1549
			elseif var1542 == 14 then
				local _ = nil
				local var1551, var1552 = protoModule.readVarInt(p68, var1537)
				var1537 = var1552
				var1536.has_emphasized_tile = var1551 ~= 0
			else
				local _ = nil
				local var1553, var1554 = protoModule.readVarInt(p68, var1537)
				local _ = var1553
				var1537 = var1554
			end
		end
		if var1538 == protoModule.wireTypes.lengthDelimited then
			if var1542 == 1 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p68, var1537)
				var1537 = var1556
				var1536.title = buffer.tostring(var1555)
			elseif var1542 == 2 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p68, var1537)
				var1537 = var1558
				table.insert(var1536.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var1557))
			elseif var1542 == 3 then
				local _ = nil
				local var1559, var1560 = protoModule.readBuffer(p68, var1537)
				var1537 = var1560
				var1536.next_page_token = buffer.tostring(var1559)
			elseif var1542 == 4 then
				local _ = nil
				local var1561, var1562 = protoModule.readBuffer(p68, var1537)
				var1537 = var1562
				var1536.sort_id = buffer.tostring(var1561)
			elseif var1542 == 7 then
				local _ = nil
				local var1563, var1564 = protoModule.readBuffer(p68, var1537)
				var1537 = var1564
				var1536.subtitle = buffer.tostring(var1563)
			elseif var1542 == 8 then
				local _ = nil
				local var1565, var1566 = protoModule.readBuffer(p68, var1537)
				var1537 = var1566
				var1536.info_text = buffer.tostring(var1565)
			elseif var1542 == 9 then
				local _ = nil
				local var1567, var1568 = protoModule.readBuffer(p68, var1537)
				var1537 = var1568
				var1536.subtitle_link_path = buffer.tostring(var1567)
			elseif var1542 == 12 then
				local _ = nil
				local var1569, var1570 = protoModule.readBuffer(p68, var1537)
				var1537 = var1570
				var1536.applied_filters = buffer.tostring(var1569)
			elseif var1542 == 13 then
				local _ = nil
				local var1571, var1572 = protoModule.readBuffer(p68, var1537)
				var1537 = var1572
				var1536.pool_id = buffer.tostring(var1571)
			elseif var1542 == 15 then
				local _ = nil
				local var1573, var1574 = protoModule.readBuffer(p68, var1537)
				var1537 = var1574
				var1536.tile_activation_mode = buffer.tostring(var1573)
			else
				local _ = nil
				local var1575, var1576 = protoModule.readVarInt(p68, var1537)
				var1537 = var1576 + var1575
			end
		elseif var1538 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1577, var1578 = protoModule.readFixed32(p68, var1537)
			local _ = var1577
			var1537 = var1578
		elseif var1538 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1579, var1580 = protoModule.readFixed64(p68, var1537)
			local _ = var1579
			var1537 = var1580
		else
			error("Unsupported wire type: " .. var1538)
		end
	end
	return var1536
end

function t_35:jsonEncode() --[[ line: 10662 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.universeItems = t_1
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		t.subtitleLinkPath = self.subtitle_link_path
	end
	if self.is_placeholder ~= nil then
		t.isPlaceholder = self.is_placeholder
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	if self.pool_id ~= nil then
		t.poolId = self.pool_id
	end
	if self.has_emphasized_tile then
		t.hasEmphasizedTile = self.has_emphasized_tile
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		t.tileActivationMode = self.tile_activation_mode
	end
	return t
end

function t_35:jsonDecode() --[[ line: 10732 ]]
	-- upvalues: t_35 (ref), t (ref)
	local var1583 = t_35.new()
	
	if self.title ~= nil then
		var1583.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1583.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1583.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1583.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1583.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1583.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1583.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1583.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1583.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1583.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1583.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1583.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1583.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1583.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1583.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1583.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1583.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1583.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1583.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1583.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1583.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1583.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1583.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1583.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1583.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1583.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1583.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1583.tile_activation_mode = self.tileActivationMode
	end
	return var1583
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p69) --[[ line: 10874 ]]
	-- upvalues: t_36 (ref)
	return setmetatable({
		universe_id = if p69 == nil or p69.universe_id == nil then "" else p69.universe_id,
		is_sponsored = if p69 == nil or p69.is_sponsored == nil then false else p69.is_sponsored,
		roblox_component = if p69 == nil or p69.roblox_component == nil then "" else p69.roblox_component,
		native_ad_data = if p69 == nil or p69.native_ad_data == nil then "" else p69.native_ad_data,
		is_content_locked = if p69 == nil or p69.is_content_locked == nil then false else p69.is_content_locked,
		title = if p69 == nil or p69.title == nil then "" else p69.title,
		subtitle = if p69 == nil or p69.subtitle == nil then "" else p69.subtitle,
		image_asset_id = if p69 == nil or p69.image_asset_id == nil then "" else p69.image_asset_id,
		video_asset_id = if p69 == nil or p69.video_asset_id == nil then "" else p69.video_asset_id,
		badge_text = if p69 == nil or p69.badge_text == nil then "" else p69.badge_text,
		player_count = if p69 == nil or p69.player_count == nil then nil else p69.player_count,
		creator_key = if p69 == nil or p69.creator_key == nil then "" else p69.creator_key,
		rank = if p69 == nil or p69.rank == nil then nil else p69.rank
	}, t_36)
end

function t_36:encode() --[[ line: 10894 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1587 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1588, var1589 = protoModule.writeTag(buff, var1587, 1, protoModule.wireTypes.lengthDelimited)
		var1588, var1589 = protoModule.writeString(var1588, var1589, self.universe_id)
		buff = var1588
		var1587 = var1589
	end
	if self.is_sponsored then
		local var1590, var1591 = protoModule.writeTag(buff, var1587, 2, protoModule.wireTypes.varint)
		var1590, var1591 = protoModule.writeVarInt(var1590, var1591, if self.is_sponsored then 1 else 0)
		buff = var1590
		var1587 = var1591
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1592, var1593 = protoModule.writeTag(buff, var1587, 3, protoModule.wireTypes.lengthDelimited)
		var1592, var1593 = protoModule.writeString(var1592, var1593, self.roblox_component)
		buff = var1592
		var1587 = var1593
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1594, var1595 = protoModule.writeTag(buff, var1587, 4, protoModule.wireTypes.lengthDelimited)
		var1594, var1595 = protoModule.writeString(var1594, var1595, self.native_ad_data)
		buff = var1594
		var1587 = var1595
	end
	if self.is_content_locked then
		local var1596, var1597 = protoModule.writeTag(buff, var1587, 5, protoModule.wireTypes.varint)
		var1596, var1597 = protoModule.writeVarInt(var1596, var1597, if self.is_content_locked then 1 else 0)
		buff = var1596
		var1587 = var1597
	end
	if self.title ~= nil and self.title ~= "" then
		local var1598, var1599 = protoModule.writeTag(buff, var1587, 6, protoModule.wireTypes.lengthDelimited)
		var1598, var1599 = protoModule.writeString(var1598, var1599, self.title)
		buff = var1598
		var1587 = var1599
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1600, var1601 = protoModule.writeTag(buff, var1587, 7, protoModule.wireTypes.lengthDelimited)
		var1600, var1601 = protoModule.writeString(var1600, var1601, self.subtitle)
		buff = var1600
		var1587 = var1601
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1602, var1603 = protoModule.writeTag(buff, var1587, 8, protoModule.wireTypes.lengthDelimited)
		var1602, var1603 = protoModule.writeString(var1602, var1603, self.image_asset_id)
		buff = var1602
		var1587 = var1603
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1604, var1605 = protoModule.writeTag(buff, var1587, 9, protoModule.wireTypes.lengthDelimited)
		var1604, var1605 = protoModule.writeString(var1604, var1605, self.video_asset_id)
		buff = var1604
		var1587 = var1605
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1606, var1607 = protoModule.writeTag(buff, var1587, 10, protoModule.wireTypes.lengthDelimited)
		var1606, var1607 = protoModule.writeString(var1606, var1607, self.badge_text)
		buff = var1606
		var1587 = var1607
	end
	if self.player_count ~= nil then
		local var1608, var1609 = protoModule.writeTag(buff, var1587, 11, protoModule.wireTypes.varint)
		var1608, var1609 = protoModule.writeVarInt(var1608, var1609, self.player_count)
		buff = var1608
		var1587 = var1609
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1610, var1611 = protoModule.writeTag(buff, var1587, 12, protoModule.wireTypes.lengthDelimited)
		var1610, var1611 = protoModule.writeString(var1610, var1611, self.creator_key)
		buff = var1610
		var1587 = var1611
	end
	if self.rank ~= nil then
		local var1612, var1613 = protoModule.writeTag(buff, var1587, 13, protoModule.wireTypes.varint)
		var1612, var1613 = protoModule.writeVarInt(var1612, var1613, self.rank)
		buff = var1612
		var1587 = var1613
	end
	local buff_1 = buffer.create(var1587)
	buffer.copy(buff_1, 0, buff, 0, var1587)
	
	return buff_1
end

function t_36.decode(p70) --[[ line: 10970 ]]
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1615 = t_36.new()
	local var1616 = 0
	while var1616 < buffer.len(p70) do
		local _ = nil
		local var1617 = nil
		local var1618, var1619, var1620 = protoModule.readTag(p70, var1616)
		local var1621 = var1618
		var1617 = var1619
		var1616 = var1620
		
		if var1617 == protoModule.wireTypes.varint then
			if var1621 == 2 then
				local _ = nil
				local var1622, var1623 = protoModule.readVarInt(p70, var1616)
				var1616 = var1623
				var1615.is_sponsored = var1622 ~= 0
			elseif var1621 == 5 then
				local _ = nil
				local var1624, var1625 = protoModule.readVarInt(p70, var1616)
				var1616 = var1625
				var1615.is_content_locked = var1624 ~= 0
			elseif var1621 == 11 then
				local _ = nil
				local var1626, var1627 = protoModule.readVarIntI64(p70, var1616)
				var1616 = var1627
				var1615.player_count = var1626
			elseif var1621 == 13 then
				local _ = nil
				local var1628, var1629 = protoModule.readVarIntI32(p70, var1616)
				var1616 = var1629
				var1615.rank = var1628
			else
				local _ = nil
				local var1630, var1631 = protoModule.readVarInt(p70, var1616)
				local _ = var1630
				var1616 = var1631
			end
		end
		if var1617 == protoModule.wireTypes.lengthDelimited then
			if var1621 == 1 then
				local _ = nil
				local var1632, var1633 = protoModule.readBuffer(p70, var1616)
				var1616 = var1633
				var1615.universe_id = buffer.tostring(var1632)
			elseif var1621 == 3 then
				local _ = nil
				local var1634, var1635 = protoModule.readBuffer(p70, var1616)
				var1616 = var1635
				var1615.roblox_component = buffer.tostring(var1634)
			elseif var1621 == 4 then
				local _ = nil
				local var1636, var1637 = protoModule.readBuffer(p70, var1616)
				var1616 = var1637
				var1615.native_ad_data = buffer.tostring(var1636)
			elseif var1621 == 6 then
				local _ = nil
				local var1638, var1639 = protoModule.readBuffer(p70, var1616)
				var1616 = var1639
				var1615.title = buffer.tostring(var1638)
			elseif var1621 == 7 then
				local _ = nil
				local var1640, var1641 = protoModule.readBuffer(p70, var1616)
				var1616 = var1641
				var1615.subtitle = buffer.tostring(var1640)
			elseif var1621 == 8 then
				local _ = nil
				local var1642, var1643 = protoModule.readBuffer(p70, var1616)
				var1616 = var1643
				var1615.image_asset_id = buffer.tostring(var1642)
			elseif var1621 == 9 then
				local _ = nil
				local var1644, var1645 = protoModule.readBuffer(p70, var1616)
				var1616 = var1645
				var1615.video_asset_id = buffer.tostring(var1644)
			elseif var1621 == 10 then
				local _ = nil
				local var1646, var1647 = protoModule.readBuffer(p70, var1616)
				var1616 = var1647
				var1615.badge_text = buffer.tostring(var1646)
			elseif var1621 == 12 then
				local _ = nil
				local var1648, var1649 = protoModule.readBuffer(p70, var1616)
				var1616 = var1649
				var1615.creator_key = buffer.tostring(var1648)
			else
				local _ = nil
				local var1650, var1651 = protoModule.readVarInt(p70, var1616)
				var1616 = var1651 + var1650
			end
		elseif var1617 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1652, var1653 = protoModule.readFixed32(p70, var1616)
			local _ = var1652
			var1616 = var1653
		elseif var1617 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1654, var1655 = protoModule.readFixed64(p70, var1616)
			local _ = var1654
			var1616 = var1655
		else
			error("Unsupported wire type: " .. var1617)
		end
	end
	return var1615
end

function t_36:jsonEncode() --[[ line: 11075 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_sponsored then
		t.isSponsored = self.is_sponsored
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		t.nativeAdData = self.native_ad_data
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		t.badgeText = self.badge_text
	end
	if self.player_count ~= nil then
		t.playerCount = self.player_count
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.rank ~= nil then
		t.rank = self.rank
	end
	return t
end

function t_36:jsonDecode() --[[ line: 11135 ]]
	-- upvalues: t_36 (ref)
	local var1657 = t_36.new()
	
	if self.universe_id ~= nil then
		var1657.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1657.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1657.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1657.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1657.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1657.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1657.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1657.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1657.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1657.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1657.title = self.title
	end
	if self.subtitle ~= nil then
		var1657.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1657.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1657.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1657.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1657.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1657.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1657.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1657.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1657.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1657.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1657.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1657.rank = self.rank
	end
	return var1657
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p71) --[[ line: 11249 ]]
	-- upvalues: t_37 (ref)
	return setmetatable({
		title = if p71 == nil or p71.title == nil then "" else p71.title,
		song_items = if p71 == nil or p71.song_items == nil then {} else p71.song_items,
		next_page_token = if p71 == nil or p71.next_page_token == nil then "" else p71.next_page_token,
		sort_id = if p71 == nil or p71.sort_id == nil then "" else p71.sort_id,
		secondary_sort_id = if p71 == nil or p71.secondary_sort_id == nil then 0 else p71.secondary_sort_id,
		subtitle = if p71 == nil or p71.subtitle == nil then "" else p71.subtitle,
		info_text = if p71 == nil or p71.info_text == nil then "" else p71.info_text,
		subtitle_link_path = if p71 == nil or p71.subtitle_link_path == nil then "" else p71.subtitle_link_path,
		is_placeholder = if p71 == nil or p71.is_placeholder == nil then nil else p71.is_placeholder,
		primary_sort_id = if p71 == nil or p71.primary_sort_id == nil then nil else p71.primary_sort_id,
		applied_filters = if p71 == nil or p71.applied_filters == nil then nil else p71.applied_filters
	}, t_37)
end

function t_37:encode() --[[ line: 11265 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1659 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1660, var1661 = protoModule.writeTag(buff, var1659, 1, protoModule.wireTypes.lengthDelimited)
		var1660, var1661 = protoModule.writeString(var1660, var1661, self.title)
		buff = var1660
		var1659 = var1661
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1662 = v:encode()
			local var1663, var1664 = protoModule.writeTag(buff, var1659, 2, protoModule.wireTypes.lengthDelimited)
			var1663, var1664 = protoModule.writeBuffer(var1663, var1664, var1662, buffer.len(var1662))
			buff = var1663
			var1659 = var1664
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1665, var1666 = protoModule.writeTag(buff, var1659, 3, protoModule.wireTypes.lengthDelimited)
		var1665, var1666 = protoModule.writeString(var1665, var1666, self.next_page_token)
		buff = var1665
		var1659 = var1666
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1667, var1668 = protoModule.writeTag(buff, var1659, 4, protoModule.wireTypes.lengthDelimited)
		var1667, var1668 = protoModule.writeString(var1667, var1668, self.sort_id)
		buff = var1667
		var1659 = var1668
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1669, var1670 = protoModule.writeTag(buff, var1659, 5, protoModule.wireTypes.varint)
		var1669, var1670 = protoModule.writeVarInt(var1669, var1670, self.secondary_sort_id)
		buff = var1669
		var1659 = var1670
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1671, var1672 = protoModule.writeTag(buff, var1659, 6, protoModule.wireTypes.lengthDelimited)
		var1671, var1672 = protoModule.writeString(var1671, var1672, self.subtitle)
		buff = var1671
		var1659 = var1672
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1673, var1674 = protoModule.writeTag(buff, var1659, 7, protoModule.wireTypes.lengthDelimited)
		var1673, var1674 = protoModule.writeString(var1673, var1674, self.info_text)
		buff = var1673
		var1659 = var1674
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1675, var1676 = protoModule.writeTag(buff, var1659, 8, protoModule.wireTypes.lengthDelimited)
		var1675, var1676 = protoModule.writeString(var1675, var1676, self.subtitle_link_path)
		buff = var1675
		var1659 = var1676
	end
	if self.is_placeholder ~= nil then
		local var1677, var1678 = protoModule.writeTag(buff, var1659, 9, protoModule.wireTypes.varint)
		var1677, var1678 = protoModule.writeVarInt(var1677, var1678, if self.is_placeholder then 1 else 0)
		buff = var1677
		var1659 = var1678
	end
	if self.primary_sort_id ~= nil then
		local var1679, var1680 = protoModule.writeTag(buff, var1659, 10, protoModule.wireTypes.varint)
		var1679, var1680 = protoModule.writeVarInt(var1679, var1680, self.primary_sort_id)
		buff = var1679
		var1659 = var1680
	end
	if self.applied_filters ~= nil then
		local var1681, var1682 = protoModule.writeTag(buff, var1659, 11, protoModule.wireTypes.lengthDelimited)
		var1681, var1682 = protoModule.writeString(var1681, var1682, self.applied_filters)
		buff = var1681
		var1659 = var1682
	end
	local buff_1 = buffer.create(var1659)
	buffer.copy(buff_1, 0, buff, 0, var1659)
	
	return buff_1
end

function t_37.decode(p72) --[[ line: 11332 ]]
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1684 = t_37.new()
	local var1685 = 0
	while var1685 < buffer.len(p72) do
		local _ = nil
		local var1686 = nil
		local var1687, var1688, var1689 = protoModule.readTag(p72, var1685)
		local var1690 = var1687
		var1686 = var1688
		var1685 = var1689
		
		if var1686 == protoModule.wireTypes.varint then
			if var1690 == 5 then
				local _ = nil
				local var1691, var1692 = protoModule.readVarIntI32(p72, var1685)
				var1685 = var1692
				var1684.secondary_sort_id = var1691
			elseif var1690 == 9 then
				local _ = nil
				local var1693, var1694 = protoModule.readVarInt(p72, var1685)
				var1685 = var1694
				var1684.is_placeholder = var1693 ~= 0
			elseif var1690 == 10 then
				local _ = nil
				local var1695, var1696 = protoModule.readVarIntI32(p72, var1685)
				var1685 = var1696
				var1684.primary_sort_id = var1695
			else
				local _ = nil
				local var1697, var1698 = protoModule.readVarInt(p72, var1685)
				local _ = var1697
				var1685 = var1698
			end
		end
		if var1686 == protoModule.wireTypes.lengthDelimited then
			if var1690 == 1 then
				local _ = nil
				local var1699, var1700 = protoModule.readBuffer(p72, var1685)
				var1685 = var1700
				var1684.title = buffer.tostring(var1699)
			elseif var1690 == 2 then
				local _ = nil
				local var1701, var1702 = protoModule.readBuffer(p72, var1685)
				var1685 = var1702
				table.insert(var1684.song_items, t.SongCarouselInputData_SongItem.decode(var1701))
			elseif var1690 == 3 then
				local _ = nil
				local var1703, var1704 = protoModule.readBuffer(p72, var1685)
				var1685 = var1704
				var1684.next_page_token = buffer.tostring(var1703)
			elseif var1690 == 4 then
				local _ = nil
				local var1705, var1706 = protoModule.readBuffer(p72, var1685)
				var1685 = var1706
				var1684.sort_id = buffer.tostring(var1705)
			elseif var1690 == 6 then
				local _ = nil
				local var1707, var1708 = protoModule.readBuffer(p72, var1685)
				var1685 = var1708
				var1684.subtitle = buffer.tostring(var1707)
			elseif var1690 == 7 then
				local _ = nil
				local var1709, var1710 = protoModule.readBuffer(p72, var1685)
				var1685 = var1710
				var1684.info_text = buffer.tostring(var1709)
			elseif var1690 == 8 then
				local _ = nil
				local var1711, var1712 = protoModule.readBuffer(p72, var1685)
				var1685 = var1712
				var1684.subtitle_link_path = buffer.tostring(var1711)
			elseif var1690 == 11 then
				local _ = nil
				local var1713, var1714 = protoModule.readBuffer(p72, var1685)
				var1685 = var1714
				var1684.applied_filters = buffer.tostring(var1713)
			else
				local _ = nil
				local var1715, var1716 = protoModule.readVarInt(p72, var1685)
				var1685 = var1716 + var1715
			end
		elseif var1686 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1717, var1718 = protoModule.readFixed32(p72, var1685)
			local _ = var1717
			var1685 = var1718
		elseif var1686 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1719, var1720 = protoModule.readFixed64(p72, var1685)
			local _ = var1719
			var1685 = var1720
		else
			error("Unsupported wire type: " .. var1686)
		end
	end
	return var1684
end

function t_37:jsonEncode() --[[ line: 11425 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.songItems = t_1
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		t.subtitleLinkPath = self.subtitle_link_path
	end
	if self.is_placeholder ~= nil then
		t.isPlaceholder = self.is_placeholder
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function t_37:jsonDecode() --[[ line: 11479 ]]
	-- upvalues: t_37 (ref), t (ref)
	local var1723 = t_37.new()
	
	if self.title ~= nil then
		var1723.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1723.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1723.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1723.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1723.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1723.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1723.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1723.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1723.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1723.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1723.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1723.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1723.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1723.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1723.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1723.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1723.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1723.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1723.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1723.applied_filters = self.appliedFilters
	end
	return var1723
end

t_37.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_37
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p73) --[[ line: 11589 ]]
	-- upvalues: t_38 (ref)
	return setmetatable({
		song_id = if p73 == nil or p73.song_id == nil then "" else p73.song_id
	}, t_38)
end

function t_38:encode() --[[ line: 11597 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1727 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1728, var1729 = protoModule.writeTag(buff, var1727, 1, protoModule.wireTypes.lengthDelimited)
		var1728, var1729 = protoModule.writeString(var1728, var1729, self.song_id)
		buff = var1728
		var1727 = var1729
	end
	local buff_1 = buffer.create(var1727)
	buffer.copy(buff_1, 0, buff, 0, var1727)
	
	return buff_1
end

function t_38.decode(p74) --[[ line: 11611 ]]
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1731 = t_38.new()
	local var1732 = 0
	while var1732 < buffer.len(p74) do
		local _ = nil
		local var1733 = nil
		local var1734, var1735, var1736 = protoModule.readTag(p74, var1732)
		local var1737 = var1734
		var1733 = var1735
		var1732 = var1736
		
		if var1733 == protoModule.wireTypes.varint then
			local _ = nil
			local var1738, var1739 = protoModule.readVarInt(p74, var1732)
			local _ = var1738
			var1732 = var1739
			continue
		end
		if var1733 == protoModule.wireTypes.lengthDelimited then
			if var1737 == 1 then
				local _ = nil
				local var1740, var1741 = protoModule.readBuffer(p74, var1732)
				var1732 = var1741
				var1731.song_id = buffer.tostring(var1740)
			else
				local _ = nil
				local var1742, var1743 = protoModule.readVarInt(p74, var1732)
				var1732 = var1743 + var1742
			end
		elseif var1733 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1744, var1745 = protoModule.readFixed32(p74, var1732)
			local _ = var1744
			var1732 = var1745
		elseif var1733 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1746, var1747 = protoModule.readFixed64(p74, var1732)
			local _ = var1746
			var1732 = var1747
		else
			error("Unsupported wire type: " .. var1733)
		end
	end
	return var1731
end

function t_38:jsonEncode() --[[ line: 11654 ]]
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_38:jsonDecode() --[[ line: 11664 ]]
	-- upvalues: t_38 (ref)
	local var1749 = t_38.new()
	
	if self.song_id ~= nil then
		var1749.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1749.song_id = self.songId
	end
	return var1749
end

t_38.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_38
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p75) --[[ line: 11692 ]]
	-- upvalues: t_39 (ref)
	return setmetatable({
		title = if p75 == nil or p75.title == nil then "" else p75.title,
		event_items = if p75 == nil or p75.event_items == nil then {} else p75.event_items,
		universe_id = if p75 == nil or p75.universe_id == nil then "" else p75.universe_id,
		sort_id = if p75 == nil or p75.sort_id == nil then "" else p75.sort_id,
		subtitle = if p75 == nil or p75.subtitle == nil then "" else p75.subtitle,
		info_text = if p75 == nil or p75.info_text == nil then "" else p75.info_text
	}, t_39)
end

function t_39:encode() --[[ line: 11703 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1751 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1752, var1753 = protoModule.writeTag(buff, var1751, 1, protoModule.wireTypes.lengthDelimited)
		var1752, var1753 = protoModule.writeString(var1752, var1753, self.title)
		buff = var1752
		var1751 = var1753
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1754 = v:encode()
			local var1755, var1756 = protoModule.writeTag(buff, var1751, 2, protoModule.wireTypes.lengthDelimited)
			var1755, var1756 = protoModule.writeBuffer(var1755, var1756, var1754, buffer.len(var1754))
			buff = var1755
			var1751 = var1756
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1757, var1758 = protoModule.writeTag(buff, var1751, 3, protoModule.wireTypes.lengthDelimited)
		var1757, var1758 = protoModule.writeString(var1757, var1758, self.universe_id)
		buff = var1757
		var1751 = var1758
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1759, var1760 = protoModule.writeTag(buff, var1751, 4, protoModule.wireTypes.lengthDelimited)
		var1759, var1760 = protoModule.writeString(var1759, var1760, self.sort_id)
		buff = var1759
		var1751 = var1760
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1761, var1762 = protoModule.writeTag(buff, var1751, 5, protoModule.wireTypes.lengthDelimited)
		var1761, var1762 = protoModule.writeString(var1761, var1762, self.subtitle)
		buff = var1761
		var1751 = var1762
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1763, var1764 = protoModule.writeTag(buff, var1751, 6, protoModule.wireTypes.lengthDelimited)
		var1763, var1764 = protoModule.writeString(var1763, var1764, self.info_text)
		buff = var1763
		var1751 = var1764
	end
	local buff_1 = buffer.create(var1751)
	buffer.copy(buff_1, 0, buff, 0, var1751)
	
	return buff_1
end

function t_39.decode(p76) --[[ line: 11745 ]]
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1766 = t_39.new()
	local var1767 = 0
	while var1767 < buffer.len(p76) do
		local _ = nil
		local var1768 = nil
		local var1769, var1770, var1771 = protoModule.readTag(p76, var1767)
		local var1772 = var1769
		var1768 = var1770
		var1767 = var1771
		
		if var1768 == protoModule.wireTypes.varint then
			local _ = nil
			local var1773, var1774 = protoModule.readVarInt(p76, var1767)
			local _ = var1773
			var1767 = var1774
			continue
		end
		if var1768 == protoModule.wireTypes.lengthDelimited then
			if var1772 == 1 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p76, var1767)
				var1767 = var1776
				var1766.title = buffer.tostring(var1775)
			elseif var1772 == 2 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p76, var1767)
				var1767 = var1778
				table.insert(var1766.event_items, t.EventsCarouselInputData_EventItem.decode(var1777))
			elseif var1772 == 3 then
				local _ = nil
				local var1779, var1780 = protoModule.readBuffer(p76, var1767)
				var1767 = var1780
				var1766.universe_id = buffer.tostring(var1779)
			elseif var1772 == 4 then
				local _ = nil
				local var1781, var1782 = protoModule.readBuffer(p76, var1767)
				var1767 = var1782
				var1766.sort_id = buffer.tostring(var1781)
			elseif var1772 == 5 then
				local _ = nil
				local var1783, var1784 = protoModule.readBuffer(p76, var1767)
				var1767 = var1784
				var1766.subtitle = buffer.tostring(var1783)
			elseif var1772 == 6 then
				local _ = nil
				local var1785, var1786 = protoModule.readBuffer(p76, var1767)
				var1767 = var1786
				var1766.info_text = buffer.tostring(var1785)
			else
				local _ = nil
				local var1787, var1788 = protoModule.readVarInt(p76, var1767)
				var1767 = var1788 + var1787
			end
		elseif var1768 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1789, var1790 = protoModule.readFixed32(p76, var1767)
			local _ = var1789
			var1767 = var1790
		elseif var1768 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1791, var1792 = protoModule.readFixed64(p76, var1767)
			local _ = var1791
			var1767 = var1792
		else
			error("Unsupported wire type: " .. var1768)
		end
	end
	return var1766
end

function t_39:jsonEncode() --[[ line: 11813 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.eventItems = t_1
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	return t
end

function t_39:jsonDecode() --[[ line: 11847 ]]
	-- upvalues: t_39 (ref), t (ref)
	local var1795 = t_39.new()
	
	if self.title ~= nil then
		var1795.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1795.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1795.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1795.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1795.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1795.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1795.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1795.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1795.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1795.info_text = self.infoText
	end
	return var1795
end

t_39.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p77) --[[ line: 11917 ]]
	-- upvalues: t_40 (ref)
	return setmetatable({
		event_id = if p77 == nil or p77.event_id == nil then "" else p77.event_id
	}, t_40)
end

function t_40:encode() --[[ line: 11925 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1799 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1800, var1801 = protoModule.writeTag(buff, var1799, 1, protoModule.wireTypes.lengthDelimited)
		var1800, var1801 = protoModule.writeString(var1800, var1801, self.event_id)
		buff = var1800
		var1799 = var1801
	end
	local buff_1 = buffer.create(var1799)
	buffer.copy(buff_1, 0, buff, 0, var1799)
	
	return buff_1
end

function t_40.decode(p78) --[[ line: 11939 ]]
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1803 = t_40.new()
	local var1804 = 0
	while var1804 < buffer.len(p78) do
		local _ = nil
		local var1805 = nil
		local var1806, var1807, var1808 = protoModule.readTag(p78, var1804)
		local var1809 = var1806
		var1805 = var1807
		var1804 = var1808
		
		if var1805 == protoModule.wireTypes.varint then
			local _ = nil
			local var1810, var1811 = protoModule.readVarInt(p78, var1804)
			local _ = var1810
			var1804 = var1811
			continue
		end
		if var1805 == protoModule.wireTypes.lengthDelimited then
			if var1809 == 1 then
				local _ = nil
				local var1812, var1813 = protoModule.readBuffer(p78, var1804)
				var1804 = var1813
				var1803.event_id = buffer.tostring(var1812)
			else
				local _ = nil
				local var1814, var1815 = protoModule.readVarInt(p78, var1804)
				var1804 = var1815 + var1814
			end
		elseif var1805 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1816, var1817 = protoModule.readFixed32(p78, var1804)
			local _ = var1816
			var1804 = var1817
		elseif var1805 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1818, var1819 = protoModule.readFixed64(p78, var1804)
			local _ = var1818
			var1804 = var1819
		else
			error("Unsupported wire type: " .. var1805)
		end
	end
	return var1803
end

function t_40:jsonEncode() --[[ line: 11982 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_40:jsonDecode() --[[ line: 11992 ]]
	-- upvalues: t_40 (ref)
	local var1821 = t_40.new()
	
	if self.event_id ~= nil then
		var1821.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1821.event_id = self.eventId
	end
	return var1821
end

t_40.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p79) --[[ line: 12022 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		universe_id = if p79 == nil or p79.universe_id == nil then "" else p79.universe_id,
		entry_map = if p79 == nil or p79.entry_map == nil then {} else p79.entry_map,
		entry_order = if p79 == nil or p79.entry_order == nil then {} else p79.entry_order,
		creator_key = if p79 == nil or p79.creator_key == nil then "" else p79.creator_key
	}, t_41)
end

function t_41:encode() --[[ line: 12031 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1823 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1824, var1825 = protoModule.writeTag(buff, var1823, 1, protoModule.wireTypes.lengthDelimited)
		var1824, var1825 = protoModule.writeString(var1824, var1825, self.universe_id)
		buff = var1824
		var1823 = var1825
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1826, var1827 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1826, var1827 = protoModule.writeString(var1826, var1827, i)
			local var1828 = v:encode()
			var1827, var1829 = protoModule.writeTag(var1826, var1827, 2, protoModule.wireTypes.lengthDelimited)
			var1827, var1829 = protoModule.writeBuffer(var1827, var1829, var1828, buffer.len(var1828))
			local var1830 = var1827
			local var1831 = var1829
			local var1832, var1833 = protoModule.writeTag(buff, var1823, 2, protoModule.wireTypes.lengthDelimited)
			var1832, var1833 = protoModule.writeBuffer(var1832, var1833, var1830, var1831)
			buff = var1832
			var1823 = var1833
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1834, var1835 = protoModule.writeTag(buff, var1823, 3, protoModule.wireTypes.lengthDelimited)
			var1834, var1835 = protoModule.writeString(var1834, var1835, v)
			buff = var1834
			var1823 = var1835
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1836, var1837 = protoModule.writeTag(buff, var1823, 4, protoModule.wireTypes.lengthDelimited)
		var1836, var1837 = protoModule.writeString(var1836, var1837, self.creator_key)
		buff = var1836
		var1823 = var1837
	end
	local buff_1 = buffer.create(var1823)
	buffer.copy(buff_1, 0, buff, 0, var1823)
	
	return buff_1
end

function t_41.decode(p80) --[[ line: 12071 ]]
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1839 = t_41.new()
	local var1840 = 0
	while var1840 < buffer.len(p80) do
		local _ = nil
		local var1841 = nil
		local var1842, var1843, var1844 = protoModule.readTag(p80, var1840)
		local var1845 = var1842
		var1841 = var1843
		var1840 = var1844
		
		if var1841 == protoModule.wireTypes.varint then
			local _ = nil
			local var1846, var1847 = protoModule.readVarInt(p80, var1840)
			local _ = var1846
			var1840 = var1847
			continue
		end
		if var1841 == protoModule.wireTypes.lengthDelimited then
			if var1845 == 1 then
				local _ = nil
				local var1848, var1849 = protoModule.readBuffer(p80, var1840)
				var1840 = var1849
				var1839.universe_id = buffer.tostring(var1848)
			elseif var1845 == 2 then
				local _ = nil
				local var1850, var1851 = protoModule.readBuffer(p80, var1840)
				var1840 = var1851
				var1850 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1850)
				var1839.entry_map[var1850.key or ""] = var1850.value or t.FeedEntry.new()
			elseif var1845 == 3 then
				local _ = nil
				local var1852, var1853 = protoModule.readBuffer(p80, var1840)
				var1840 = var1853
				table.insert(var1839.entry_order, buffer.tostring(var1852))
			elseif var1845 == 4 then
				local _ = nil
				local var1854, var1855 = protoModule.readBuffer(p80, var1840)
				var1840 = var1855
				var1839.creator_key = buffer.tostring(var1854)
			else
				local _ = nil
				local var1856, var1857 = protoModule.readVarInt(p80, var1840)
				var1840 = var1857 + var1856
			end
		elseif var1841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1858, var1859 = protoModule.readFixed32(p80, var1840)
			local _ = var1858
			var1840 = var1859
		elseif var1841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1860, var1861 = protoModule.readFixed64(p80, var1840)
			local _ = var1860
			var1840 = var1861
		else
			error("Unsupported wire type: " .. var1841)
		end
	end
	return var1839
end

function t_41:jsonEncode() --[[ line: 12136 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_41:jsonDecode() --[[ line: 12166 ]]
	-- upvalues: t_41 (ref), t (ref)
	local var1865 = t_41.new()
	
	if self.universe_id ~= nil then
		var1865.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1865.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1865.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1865.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1865.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1865.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1865.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1865.creator_key = self.creatorKey
	end
	return var1865
end

t_41.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p81) --[[ line: 12238 ]]
	-- upvalues: t_42 (ref)
	return setmetatable({
		key = if p81 == nil or p81.key == nil then "" else p81.key,
		value = if p81 == nil or p81.value == nil then nil else p81.value
	}, t_42)
end

function t_42:encode() --[[ line: 12247 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1871 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1872, var1873 = protoModule.writeTag(buff, var1871, 1, protoModule.wireTypes.lengthDelimited)
		var1872, var1873 = protoModule.writeString(var1872, var1873, self.key)
		buff = var1872
		var1871 = var1873
	end
	if self.value ~= nil then
		local var1874 = self.value:encode()
		local var1875, var1876 = protoModule.writeTag(buff, var1871, 2, protoModule.wireTypes.lengthDelimited)
		var1875, var1876 = protoModule.writeBuffer(var1875, var1876, var1874, buffer.len(var1874))
		buff = var1875
		var1871 = var1876
	end
	local buff_1 = buffer.create(var1871)
	buffer.copy(buff_1, 0, buff, 0, var1871)
	
	return buff_1
end

function t_42.decode(p82) --[[ line: 12267 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1878 = t_42.new()
	local var1879 = 0
	while var1879 < buffer.len(p82) do
		local _ = nil
		local var1880 = nil
		local var1881, var1882, var1883 = protoModule.readTag(p82, var1879)
		local var1884 = var1881
		var1880 = var1882
		var1879 = var1883
		
		if var1880 == protoModule.wireTypes.varint then
			local _ = nil
			local var1885, var1886 = protoModule.readVarInt(p82, var1879)
			local _ = var1885
			var1879 = var1886
			continue
		end
		if var1880 == protoModule.wireTypes.lengthDelimited then
			if var1884 == 1 then
				local _ = nil
				local var1887, var1888 = protoModule.readBuffer(p82, var1879)
				var1879 = var1888
				var1878.key = buffer.tostring(var1887)
			elseif var1884 == 2 then
				local _ = nil
				local var1889, var1890 = protoModule.readBuffer(p82, var1879)
				var1879 = var1890
				var1878.value = t.FeedEntry.decode(var1889)
			else
				local _ = nil
				local var1891, var1892 = protoModule.readVarInt(p82, var1879)
				var1879 = var1892 + var1891
			end
		elseif var1880 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1893, var1894 = protoModule.readFixed32(p82, var1879)
			local _ = var1893
			var1879 = var1894
		elseif var1880 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1895, var1896 = protoModule.readFixed64(p82, var1879)
			local _ = var1895
			var1879 = var1896
		else
			error("Unsupported wire type: " .. var1880)
		end
	end
	return var1878
end

function t_42:jsonEncode() --[[ line: 12315 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_42:jsonDecode() --[[ line: 12329 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1898 = t_42.new()
	
	if self.key ~= nil then
		var1898.key = self.key
	end
	if self.value ~= nil then
		var1898.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1898
end

t_42.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p83) --[[ line: 12359 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		game_passes = if p83 == nil or p83.game_passes == nil then {} else p83.game_passes
	}, t_43)
end

function t_43:encode() --[[ line: 12367 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1900 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1901 = v:encode()
			local var1902, var1903 = protoModule.writeTag(buff, var1900, 1, protoModule.wireTypes.lengthDelimited)
			var1902, var1903 = protoModule.writeBuffer(var1902, var1903, var1901, buffer.len(var1901))
			buff = var1902
			var1900 = var1903
		end
	end
	local buff_1 = buffer.create(var1900)
	buffer.copy(buff_1, 0, buff, 0, var1900)
	
	return buff_1
end

function t_43.decode(p84) --[[ line: 12384 ]]
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1905 = t_43.new()
	local var1906 = 0
	while var1906 < buffer.len(p84) do
		local _ = nil
		local var1907 = nil
		local var1908, var1909, var1910 = protoModule.readTag(p84, var1906)
		local var1911 = var1908
		var1907 = var1909
		var1906 = var1910
		
		if var1907 == protoModule.wireTypes.varint then
			local _ = nil
			local var1912, var1913 = protoModule.readVarInt(p84, var1906)
			local _ = var1912
			var1906 = var1913
			continue
		end
		if var1907 == protoModule.wireTypes.lengthDelimited then
			if var1911 == 1 then
				local _ = nil
				local var1914, var1915 = protoModule.readBuffer(p84, var1906)
				var1906 = var1915
				table.insert(var1905.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1914))
			else
				local _ = nil
				local var1916, var1917 = protoModule.readVarInt(p84, var1906)
				var1906 = var1917 + var1916
			end
		elseif var1907 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1918, var1919 = protoModule.readFixed32(p84, var1906)
			local _ = var1918
			var1906 = var1919
		elseif var1907 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1920, var1921 = protoModule.readFixed64(p84, var1906)
			local _ = var1920
			var1906 = var1921
		else
			error("Unsupported wire type: " .. var1907)
		end
	end
	return var1905
end

function t_43:jsonEncode() --[[ line: 12427 ]]
	local t = {}
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, v:jsonEncode())
		end
		t.gamePasses = t_1
	end
	return t
end

function t_43:jsonDecode() --[[ line: 12441 ]]
	-- upvalues: t_43 (ref), t (ref)
	local var1924 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1924.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1924.game_passes = t_1
	end
	return var1924
end

t_43.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p85) --[[ line: 12479 ]]
	-- upvalues: t_44 (ref)
	return setmetatable({
		game_pass_id = if p85 == nil or p85.game_pass_id == nil then "" else p85.game_pass_id
	}, t_44)
end

function t_44:encode() --[[ line: 12487 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1928 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1929, var1930 = protoModule.writeTag(buff, var1928, 1, protoModule.wireTypes.lengthDelimited)
		var1929, var1930 = protoModule.writeString(var1929, var1930, self.game_pass_id)
		buff = var1929
		var1928 = var1930
	end
	local buff_1 = buffer.create(var1928)
	buffer.copy(buff_1, 0, buff, 0, var1928)
	
	return buff_1
end

function t_44.decode(p86) --[[ line: 12503 ]]
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1932 = t_44.new()
	local var1933 = 0
	while var1933 < buffer.len(p86) do
		local _ = nil
		local var1934 = nil
		local var1935, var1936, var1937 = protoModule.readTag(p86, var1933)
		local var1938 = var1935
		var1934 = var1936
		var1933 = var1937
		
		if var1934 == protoModule.wireTypes.varint then
			local _ = nil
			local var1939, var1940 = protoModule.readVarInt(p86, var1933)
			local _ = var1939
			var1933 = var1940
			continue
		end
		if var1934 == protoModule.wireTypes.lengthDelimited then
			if var1938 == 1 then
				local _ = nil
				local var1941, var1942 = protoModule.readBuffer(p86, var1933)
				var1933 = var1942
				var1932.game_pass_id = buffer.tostring(var1941)
			else
				local _ = nil
				local var1943, var1944 = protoModule.readVarInt(p86, var1933)
				var1933 = var1944 + var1943
			end
		elseif var1934 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1945, var1946 = protoModule.readFixed32(p86, var1933)
			local _ = var1945
			var1933 = var1946
		elseif var1934 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1947, var1948 = protoModule.readFixed64(p86, var1933)
			local _ = var1947
			var1933 = var1948
		else
			error("Unsupported wire type: " .. var1934)
		end
	end
	return var1932
end

function t_44:jsonEncode() --[[ line: 12548 ]]
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_44:jsonDecode() --[[ line: 12560 ]]
	-- upvalues: t_44 (ref)
	local var1950 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1950.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1950.game_pass_id = self.gamePassId
	end
	return var1950
end

t_44.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_44
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p87) --[[ line: 12590 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_products = if p87 == nil or p87.developer_products == nil then {} else p87.developer_products
	}, t_45)
end

function t_45:encode() --[[ line: 12598 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1952 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1953 = v:encode()
			local var1954, var1955 = protoModule.writeTag(buff, var1952, 1, protoModule.wireTypes.lengthDelimited)
			var1954, var1955 = protoModule.writeBuffer(var1954, var1955, var1953, buffer.len(var1953))
			buff = var1954
			var1952 = var1955
		end
	end
	local buff_1 = buffer.create(var1952)
	buffer.copy(buff_1, 0, buff, 0, var1952)
	
	return buff_1
end

function t_45.decode(p88) --[[ line: 12615 ]]
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1957 = t_45.new()
	local var1958 = 0
	while var1958 < buffer.len(p88) do
		local _ = nil
		local var1959 = nil
		local var1960, var1961, var1962 = protoModule.readTag(p88, var1958)
		local var1963 = var1960
		var1959 = var1961
		var1958 = var1962
		
		if var1959 == protoModule.wireTypes.varint then
			local _ = nil
			local var1964, var1965 = protoModule.readVarInt(p88, var1958)
			local _ = var1964
			var1958 = var1965
			continue
		end
		if var1959 == protoModule.wireTypes.lengthDelimited then
			if var1963 == 1 then
				local _ = nil
				local var1966, var1967 = protoModule.readBuffer(p88, var1958)
				var1958 = var1967
				table.insert(var1957.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1966))
			else
				local _ = nil
				local var1968, var1969 = protoModule.readVarInt(p88, var1958)
				var1958 = var1969 + var1968
			end
		elseif var1959 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1970, var1971 = protoModule.readFixed32(p88, var1958)
			local _ = var1970
			var1958 = var1971
		elseif var1959 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1972, var1973 = protoModule.readFixed64(p88, var1958)
			local _ = var1972
			var1958 = var1973
		else
			error("Unsupported wire type: " .. var1959)
		end
	end
	return var1957
end

function t_45:jsonEncode() --[[ line: 12661 ]]
	local t = {}
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, v:jsonEncode())
		end
		t.developerProducts = t_1
	end
	return t
end

function t_45:jsonDecode() --[[ line: 12675 ]]
	-- upvalues: t_45 (ref), t (ref)
	local var1976 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1976.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1976.developer_products = t_1
	end
	return var1976
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p89) --[[ line: 12722 ]]
	-- upvalues: t_46 (ref)
	return setmetatable({
		developer_product_id = if p89 == nil or p89.developer_product_id == nil then "" else p89.developer_product_id
	}, t_46)
end

function t_46:encode() --[[ line: 12735 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1980 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1981, var1982 = protoModule.writeTag(buff, var1980, 1, protoModule.wireTypes.lengthDelimited)
		var1981, var1982 = protoModule.writeString(var1981, var1982, self.developer_product_id)
		buff = var1981
		var1980 = var1982
	end
	local buff_1 = buffer.create(var1980)
	buffer.copy(buff_1, 0, buff, 0, var1980)
	
	return buff_1
end

function t_46.decode(p90) --[[ line: 12751 ]]
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1984 = t_46.new()
	local var1985 = 0
	while var1985 < buffer.len(p90) do
		local _ = nil
		local var1986 = nil
		local var1987, var1988, var1989 = protoModule.readTag(p90, var1985)
		local var1990 = var1987
		var1986 = var1988
		var1985 = var1989
		
		if var1986 == protoModule.wireTypes.varint then
			local _ = nil
			local var1991, var1992 = protoModule.readVarInt(p90, var1985)
			local _ = var1991
			var1985 = var1992
			continue
		end
		if var1986 == protoModule.wireTypes.lengthDelimited then
			if var1990 == 1 then
				local _ = nil
				local var1993, var1994 = protoModule.readBuffer(p90, var1985)
				var1985 = var1994
				var1984.developer_product_id = buffer.tostring(var1993)
			else
				local _ = nil
				local var1995, var1996 = protoModule.readVarInt(p90, var1985)
				var1985 = var1996 + var1995
			end
		elseif var1986 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1997, var1998 = protoModule.readFixed32(p90, var1985)
			local _ = var1997
			var1985 = var1998
		elseif var1986 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1999, var2000 = protoModule.readFixed64(p90, var1985)
			local _ = var1999
			var1985 = var2000
		else
			error("Unsupported wire type: " .. var1986)
		end
	end
	return var1984
end

function t_46:jsonEncode() --[[ line: 12796 ]]
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_46:jsonDecode() --[[ line: 12808 ]]
	-- upvalues: t_46 (ref)
	local var2002 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var2002.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var2002.developer_product_id = self.developerProductId
	end
	return var2002
end

t_46.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_46
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p91) --[[ line: 12839 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscriptions = if p91 == nil or p91.subscriptions == nil then {} else p91.subscriptions
	}, t_47)
end

function t_47:encode() --[[ line: 12847 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2004 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var2005 = v:encode()
			local var2006, var2007 = protoModule.writeTag(buff, var2004, 1, protoModule.wireTypes.lengthDelimited)
			var2006, var2007 = protoModule.writeBuffer(var2006, var2007, var2005, buffer.len(var2005))
			buff = var2006
			var2004 = var2007
		end
	end
	local buff_1 = buffer.create(var2004)
	buffer.copy(buff_1, 0, buff, 0, var2004)
	
	return buff_1
end

function t_47.decode(p92) --[[ line: 12864 ]]
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var2009 = t_47.new()
	local var2010 = 0
	while var2010 < buffer.len(p92) do
		local _ = nil
		local var2011 = nil
		local var2012, var2013, var2014 = protoModule.readTag(p92, var2010)
		local var2015 = var2012
		var2011 = var2013
		var2010 = var2014
		
		if var2011 == protoModule.wireTypes.varint then
			local _ = nil
			local var2016, var2017 = protoModule.readVarInt(p92, var2010)
			local _ = var2016
			var2010 = var2017
			continue
		end
		if var2011 == protoModule.wireTypes.lengthDelimited then
			if var2015 == 1 then
				local _ = nil
				local var2018, var2019 = protoModule.readBuffer(p92, var2010)
				var2010 = var2019
				table.insert(var2009.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var2018))
			else
				local _ = nil
				local var2020, var2021 = protoModule.readVarInt(p92, var2010)
				var2010 = var2021 + var2020
			end
		elseif var2011 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2022, var2023 = protoModule.readFixed32(p92, var2010)
			local _ = var2022
			var2010 = var2023
		elseif var2011 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2024, var2025 = protoModule.readFixed64(p92, var2010)
			local _ = var2024
			var2010 = var2025
		else
			error("Unsupported wire type: " .. var2011)
		end
	end
	return var2009
end

function t_47:jsonEncode() --[[ line: 12910 ]]
	local t = {}
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, v:jsonEncode())
		end
		t.subscriptions = t_1
	end
	return t
end

function t_47:jsonDecode() --[[ line: 12924 ]]
	-- upvalues: t_47 (ref), t (ref)
	local var2028 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var2028.subscriptions = t_1
	end
	return var2028
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p93) --[[ line: 12954 ]]
	-- upvalues: t_48 (ref)
	return setmetatable({
		subscription_id = if p93 == nil or p93.subscription_id == nil then "" else p93.subscription_id
	}, t_48)
end

function t_48:encode() --[[ line: 12965 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2031 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var2032, var2033 = protoModule.writeTag(buff, var2031, 1, protoModule.wireTypes.lengthDelimited)
		var2032, var2033 = protoModule.writeString(var2032, var2033, self.subscription_id)
		buff = var2032
		var2031 = var2033
	end
	local buff_1 = buffer.create(var2031)
	buffer.copy(buff_1, 0, buff, 0, var2031)
	
	return buff_1
end

function t_48.decode(p94) --[[ line: 12981 ]]
	-- upvalues: t_48 (ref), protoModule (ref)
	local var2035 = t_48.new()
	local var2036 = 0
	while var2036 < buffer.len(p94) do
		local _ = nil
		local var2037 = nil
		local var2038, var2039, var2040 = protoModule.readTag(p94, var2036)
		local var2041 = var2038
		var2037 = var2039
		var2036 = var2040
		
		if var2037 == protoModule.wireTypes.varint then
			local _ = nil
			local var2042, var2043 = protoModule.readVarInt(p94, var2036)
			local _ = var2042
			var2036 = var2043
			continue
		end
		if var2037 == protoModule.wireTypes.lengthDelimited then
			if var2041 == 1 then
				local _ = nil
				local var2044, var2045 = protoModule.readBuffer(p94, var2036)
				var2036 = var2045
				var2035.subscription_id = buffer.tostring(var2044)
			else
				local _ = nil
				local var2046, var2047 = protoModule.readVarInt(p94, var2036)
				var2036 = var2047 + var2046
			end
		elseif var2037 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2048, var2049 = protoModule.readFixed32(p94, var2036)
			local _ = var2048
			var2036 = var2049
		elseif var2037 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2050, var2051 = protoModule.readFixed64(p94, var2036)
			local _ = var2050
			var2036 = var2051
		else
			error("Unsupported wire type: " .. var2037)
		end
	end
	return var2035
end

function t_48:jsonEncode() --[[ line: 13026 ]]
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_48:jsonDecode() --[[ line: 13038 ]]
	-- upvalues: t_48 (ref)
	local var2053 = t_48.new()
	
	if self.subscription_id ~= nil then
		var2053.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var2053.subscription_id = self.subscriptionId
	end
	return var2053
end

t_48.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_48
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p95) --[[ line: 13069 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		items = if p95 == nil or p95.items == nil then {} else p95.items,
		universe_id = if p95 == nil or p95.universe_id == nil then "" else p95.universe_id,
		section_title = if p95 == nil or p95.section_title == nil then "" else p95.section_title,
		creator_key = if p95 == nil or p95.creator_key == nil then "" else p95.creator_key,
		collection_item_size = if p95 == nil or p95.collection_item_size == nil then "" else p95.collection_item_size,
		item_height_mode = if p95 == nil or p95.item_height_mode == nil then "" else p95.item_height_mode,
		experience_store_product_type = if p95 == nil or p95.experience_store_product_type == nil then "" else p95.experience_store_product_type,
		content_type = if p95 == nil or p95.content_type == nil then "" else p95.content_type,
		item_type = if p95 == nil or p95.item_type == nil then "" else p95.item_type
	}, t_49)
end

function t_49:encode() --[[ line: 13089 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2055 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2056 = v:encode()
			local var2057, var2058 = protoModule.writeTag(buff, var2055, 1, protoModule.wireTypes.lengthDelimited)
			var2057, var2058 = protoModule.writeBuffer(var2057, var2058, var2056, buffer.len(var2056))
			buff = var2057
			var2055 = var2058
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2059, var2060 = protoModule.writeTag(buff, var2055, 2, protoModule.wireTypes.lengthDelimited)
		var2059, var2060 = protoModule.writeString(var2059, var2060, self.universe_id)
		buff = var2059
		var2055 = var2060
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var2061, var2062 = protoModule.writeTag(buff, var2055, 3, protoModule.wireTypes.lengthDelimited)
		var2061, var2062 = protoModule.writeString(var2061, var2062, self.section_title)
		buff = var2061
		var2055 = var2062
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var2063, var2064 = protoModule.writeTag(buff, var2055, 4, protoModule.wireTypes.lengthDelimited)
		var2063, var2064 = protoModule.writeString(var2063, var2064, self.creator_key)
		buff = var2063
		var2055 = var2064
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var2065, var2066 = protoModule.writeTag(buff, var2055, 5, protoModule.wireTypes.lengthDelimited)
		var2065, var2066 = protoModule.writeString(var2065, var2066, self.collection_item_size)
		buff = var2065
		var2055 = var2066
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var2067, var2068 = protoModule.writeTag(buff, var2055, 6, protoModule.wireTypes.lengthDelimited)
		var2067, var2068 = protoModule.writeString(var2067, var2068, self.item_height_mode)
		buff = var2067
		var2055 = var2068
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var2069, var2070 = protoModule.writeTag(buff, var2055, 7, protoModule.wireTypes.lengthDelimited)
		var2069, var2070 = protoModule.writeString(var2069, var2070, self.experience_store_product_type)
		buff = var2069
		var2055 = var2070
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2071, var2072 = protoModule.writeTag(buff, var2055, 8, protoModule.wireTypes.lengthDelimited)
		var2071, var2072 = protoModule.writeString(var2071, var2072, self.content_type)
		buff = var2071
		var2055 = var2072
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2073, var2074 = protoModule.writeTag(buff, var2055, 9, protoModule.wireTypes.lengthDelimited)
		var2073, var2074 = protoModule.writeString(var2073, var2074, self.item_type)
		buff = var2073
		var2055 = var2074
	end
	local buff_1 = buffer.create(var2055)
	buffer.copy(buff_1, 0, buff, 0, var2055)
	
	return buff_1
end

function t_49.decode(p96) --[[ line: 13146 ]]
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var2076 = t_49.new()
	local var2077 = 0
	while var2077 < buffer.len(p96) do
		local _ = nil
		local var2078 = nil
		local var2079, var2080, var2081 = protoModule.readTag(p96, var2077)
		local var2082 = var2079
		var2078 = var2080
		var2077 = var2081
		
		if var2078 == protoModule.wireTypes.varint then
			local _ = nil
			local var2083, var2084 = protoModule.readVarInt(p96, var2077)
			local _ = var2083
			var2077 = var2084
			continue
		end
		if var2078 == protoModule.wireTypes.lengthDelimited then
			if var2082 == 1 then
				local _ = nil
				local var2085, var2086 = protoModule.readBuffer(p96, var2077)
				var2077 = var2086
				table.insert(var2076.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var2085))
			elseif var2082 == 2 then
				local _ = nil
				local var2087, var2088 = protoModule.readBuffer(p96, var2077)
				var2077 = var2088
				var2076.universe_id = buffer.tostring(var2087)
			elseif var2082 == 3 then
				local _ = nil
				local var2089, var2090 = protoModule.readBuffer(p96, var2077)
				var2077 = var2090
				var2076.section_title = buffer.tostring(var2089)
			elseif var2082 == 4 then
				local _ = nil
				local var2091, var2092 = protoModule.readBuffer(p96, var2077)
				var2077 = var2092
				var2076.creator_key = buffer.tostring(var2091)
			elseif var2082 == 5 then
				local _ = nil
				local var2093, var2094 = protoModule.readBuffer(p96, var2077)
				var2077 = var2094
				var2076.collection_item_size = buffer.tostring(var2093)
			elseif var2082 == 6 then
				local _ = nil
				local var2095, var2096 = protoModule.readBuffer(p96, var2077)
				var2077 = var2096
				var2076.item_height_mode = buffer.tostring(var2095)
			elseif var2082 == 7 then
				local _ = nil
				local var2097, var2098 = protoModule.readBuffer(p96, var2077)
				var2077 = var2098
				var2076.experience_store_product_type = buffer.tostring(var2097)
			elseif var2082 == 8 then
				local _ = nil
				local var2099, var2100 = protoModule.readBuffer(p96, var2077)
				var2077 = var2100
				var2076.content_type = buffer.tostring(var2099)
			elseif var2082 == 9 then
				local _ = nil
				local var2101, var2102 = protoModule.readBuffer(p96, var2077)
				var2077 = var2102
				var2076.item_type = buffer.tostring(var2101)
			else
				local _ = nil
				local var2103, var2104 = protoModule.readVarInt(p96, var2077)
				var2077 = var2104 + var2103
			end
		elseif var2078 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2105, var2106 = protoModule.readFixed32(p96, var2077)
			local _ = var2105
			var2077 = var2106
		elseif var2078 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2107, var2108 = protoModule.readFixed64(p96, var2077)
			local _ = var2107
			var2077 = var2108
		else
			error("Unsupported wire type: " .. var2078)
		end
	end
	return var2076
end

function t_49:jsonEncode() --[[ line: 13232 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		t.sectionTitle = self.section_title
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		t.collectionItemSize = self.collection_item_size
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		t.itemHeightMode = self.item_height_mode
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		t.experienceStoreProductType = self.experience_store_product_type
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_49:jsonDecode() --[[ line: 13278 ]]
	-- upvalues: t_49 (ref), t (ref)
	local var2111 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var2111.items = t_1
	end
	if self.universe_id ~= nil then
		var2111.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2111.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var2111.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var2111.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var2111.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var2111.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var2111.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var2111.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var2111.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var2111.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var2111.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var2111.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var2111.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2111.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var2111.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2111.item_type = self.itemType
	end
	return var2111
end

t_49.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_49
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p97) --[[ line: 13375 ]]
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		item_id = if p97 == nil or p97.item_id == nil then "" else p97.item_id,
		identifier = if p97 == nil or p97.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p97.identifier
	}, t_50)
end

function t_50:encode() --[[ line: 13392 ]]
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2114 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2115, var2116 = protoModule.writeTag(buff, var2114, 1, protoModule.wireTypes.lengthDelimited)
		var2115, var2116 = protoModule.writeString(var2115, var2116, self.item_id)
		buff = var2115
		var2114 = var2116
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var2117, var2118 = protoModule.writeTag(buff, var2114, 2, protoModule.wireTypes.varint)
		var2117, var2118 = protoModule.writeVarInt(var2117, var2118, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var2117
		var2114 = var2118
	end
	local buff_1 = buffer.create(var2114)
	buffer.copy(buff_1, 0, buff, 0, var2114)
	
	return buff_1
end

function t_50.decode(p98) --[[ line: 13424 ]]
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var2120 = t_50.new()
	local var2121 = 0
	while var2121 < buffer.len(p98) do
		local _ = nil
		local var2122 = nil
		local var2123, var2124, var2125 = protoModule.readTag(p98, var2121)
		local var2126 = var2123
		var2122 = var2124
		var2121 = var2125
		
		if var2122 == protoModule.wireTypes.varint then
			if var2126 == 2 then
				local _ = nil
				local var2127, var2128 = protoModule.readVarIntI32(p98, var2121)
				local var2129 = var2127
				var2121 = var2128
				var2120.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var2129) or var2129
			else
				local _ = nil
				local var2130, var2131 = protoModule.readVarInt(p98, var2121)
				local _ = var2130
				var2121 = var2131
			end
		end
		if var2122 == protoModule.wireTypes.lengthDelimited then
			if var2126 == 1 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p98, var2121)
				var2121 = var2133
				var2120.item_id = buffer.tostring(var2132)
			else
				local _ = nil
				local var2134, var2135 = protoModule.readVarInt(p98, var2121)
				var2121 = var2135 + var2134
			end
		elseif var2122 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2136, var2137 = protoModule.readFixed32(p98, var2121)
			local _ = var2136
			var2121 = var2137
		elseif var2122 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2138, var2139 = protoModule.readFixed64(p98, var2121)
			local _ = var2138
			var2121 = var2139
		else
			error("Unsupported wire type: " .. var2122)
		end
	end
	return var2120
end

function t_50:jsonEncode() --[[ line: 13476 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t_1.itemId = self.item_id
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		t_1.identifier = if typeof(self.identifier) == "number" then self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier)
	end
	return t_1
end

function t_50:jsonDecode() --[[ line: 13503 ]]
	-- upvalues: t_50 (ref), t (ref)
	local var2141 = t_50.new()
	
	if self.item_id ~= nil then
		var2141.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2141.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var2141.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var2141
end

t_50.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_50
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p99) --[[ line: 13542 ]]
		return if p99 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p99 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p99 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p99 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p100) --[[ line: 13556 ]]
		return if p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p100
	end,
	fromName = function(p101) --[[ line: 13570 ]]
		return if p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_51 = {}
t_51.__index = t_51

function t_51.new(p102) --[[ line: 13589 ]]
	-- upvalues: t_51 (ref)
	return setmetatable({
		roblox_component = if p102 == nil or p102.roblox_component == nil then "" else p102.roblox_component,
		identifier = if p102 == nil or p102.identifier == nil then "" else p102.identifier,
		title = if p102 == nil or p102.title == nil then "" else p102.title,
		user_id = if p102 == nil or p102.user_id == nil then "" else p102.user_id,
		description = if p102 == nil or p102.description == nil then "" else p102.description,
		cta_text = if p102 == nil or p102.cta_text == nil then "" else p102.cta_text,
		prompt_id = if p102 == nil or p102.prompt_id == nil then "" else p102.prompt_id,
		prompt_type = if p102 == nil or p102.prompt_type == nil then "" else p102.prompt_type,
		entity_id = if p102 == nil or p102.entity_id == nil then "" else p102.entity_id
	}, t_51)
end

function t_51:encode() --[[ line: 13605 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2143 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2144, var2145 = protoModule.writeTag(buff, var2143, 1, protoModule.wireTypes.lengthDelimited)
		var2144, var2145 = protoModule.writeString(var2144, var2145, self.roblox_component)
		buff = var2144
		var2143 = var2145
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var2146, var2147 = protoModule.writeTag(buff, var2143, 2, protoModule.wireTypes.lengthDelimited)
		var2146, var2147 = protoModule.writeString(var2146, var2147, self.identifier)
		buff = var2146
		var2143 = var2147
	end
	if self.title ~= nil and self.title ~= "" then
		local var2148, var2149 = protoModule.writeTag(buff, var2143, 3, protoModule.wireTypes.lengthDelimited)
		var2148, var2149 = protoModule.writeString(var2148, var2149, self.title)
		buff = var2148
		var2143 = var2149
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2150, var2151 = protoModule.writeTag(buff, var2143, 4, protoModule.wireTypes.lengthDelimited)
		var2150, var2151 = protoModule.writeString(var2150, var2151, self.user_id)
		buff = var2150
		var2143 = var2151
	end
	if self.description ~= nil and self.description ~= "" then
		local var2152, var2153 = protoModule.writeTag(buff, var2143, 5, protoModule.wireTypes.lengthDelimited)
		var2152, var2153 = protoModule.writeString(var2152, var2153, self.description)
		buff = var2152
		var2143 = var2153
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2154, var2155 = protoModule.writeTag(buff, var2143, 6, protoModule.wireTypes.lengthDelimited)
		var2154, var2155 = protoModule.writeString(var2154, var2155, self.cta_text)
		buff = var2154
		var2143 = var2155
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2156, var2157 = protoModule.writeTag(buff, var2143, 7, protoModule.wireTypes.lengthDelimited)
		var2156, var2157 = protoModule.writeString(var2156, var2157, self.prompt_id)
		buff = var2156
		var2143 = var2157
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2158, var2159 = protoModule.writeTag(buff, var2143, 8, protoModule.wireTypes.lengthDelimited)
		var2158, var2159 = protoModule.writeString(var2158, var2159, self.prompt_type)
		buff = var2158
		var2143 = var2159
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2160, var2161 = protoModule.writeTag(buff, var2143, 9, protoModule.wireTypes.lengthDelimited)
		var2160, var2161 = protoModule.writeString(var2160, var2161, self.entity_id)
		buff = var2160
		var2143 = var2161
	end
	local buff_1 = buffer.create(var2143)
	buffer.copy(buff_1, 0, buff, 0, var2143)
	
	return buff_1
end

function t_51.decode(p103) --[[ line: 13659 ]]
	-- upvalues: t_51 (ref), protoModule (ref)
	local var2163 = t_51.new()
	local var2164 = 0
	while var2164 < buffer.len(p103) do
		local _ = nil
		local var2165 = nil
		local var2166, var2167, var2168 = protoModule.readTag(p103, var2164)
		local var2169 = var2166
		var2165 = var2167
		var2164 = var2168
		
		if var2165 == protoModule.wireTypes.varint then
			local _ = nil
			local var2170, var2171 = protoModule.readVarInt(p103, var2164)
			local _ = var2170
			var2164 = var2171
			continue
		end
		if var2165 == protoModule.wireTypes.lengthDelimited then
			if var2169 == 1 then
				local _ = nil
				local var2172, var2173 = protoModule.readBuffer(p103, var2164)
				var2164 = var2173
				var2163.roblox_component = buffer.tostring(var2172)
			elseif var2169 == 2 then
				local _ = nil
				local var2174, var2175 = protoModule.readBuffer(p103, var2164)
				var2164 = var2175
				var2163.identifier = buffer.tostring(var2174)
			elseif var2169 == 3 then
				local _ = nil
				local var2176, var2177 = protoModule.readBuffer(p103, var2164)
				var2164 = var2177
				var2163.title = buffer.tostring(var2176)
			elseif var2169 == 4 then
				local _ = nil
				local var2178, var2179 = protoModule.readBuffer(p103, var2164)
				var2164 = var2179
				var2163.user_id = buffer.tostring(var2178)
			elseif var2169 == 5 then
				local _ = nil
				local var2180, var2181 = protoModule.readBuffer(p103, var2164)
				var2164 = var2181
				var2163.description = buffer.tostring(var2180)
			elseif var2169 == 6 then
				local _ = nil
				local var2182, var2183 = protoModule.readBuffer(p103, var2164)
				var2164 = var2183
				var2163.cta_text = buffer.tostring(var2182)
			elseif var2169 == 7 then
				local _ = nil
				local var2184, var2185 = protoModule.readBuffer(p103, var2164)
				var2164 = var2185
				var2163.prompt_id = buffer.tostring(var2184)
			elseif var2169 == 8 then
				local _ = nil
				local var2186, var2187 = protoModule.readBuffer(p103, var2164)
				var2164 = var2187
				var2163.prompt_type = buffer.tostring(var2186)
			elseif var2169 == 9 then
				local _ = nil
				local var2188, var2189 = protoModule.readBuffer(p103, var2164)
				var2164 = var2189
				var2163.entity_id = buffer.tostring(var2188)
			else
				local _ = nil
				local var2190, var2191 = protoModule.readVarInt(p103, var2164)
				var2164 = var2191 + var2190
			end
		elseif var2165 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2192, var2193 = protoModule.readFixed32(p103, var2164)
			local _ = var2192
			var2164 = var2193
		elseif var2165 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2194, var2195 = protoModule.readFixed64(p103, var2164)
			local _ = var2194
			var2164 = var2195
		else
			error("Unsupported wire type: " .. var2165)
		end
	end
	return var2163
end

function t_51:jsonEncode() --[[ line: 13742 ]]
	local t = {}
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		t.identifier = self.identifier
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		t.ctaText = self.cta_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		t.entityId = self.entity_id
	end
	return t
end

function t_51:jsonDecode() --[[ line: 13784 ]]
	-- upvalues: t_51 (ref)
	local var2197 = t_51.new()
	
	if self.roblox_component ~= nil then
		var2197.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var2197.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var2197.identifier = self.identifier
	end
	if self.title ~= nil then
		var2197.title = self.title
	end
	if self.user_id ~= nil then
		var2197.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2197.user_id = self.userId
	end
	if self.description ~= nil then
		var2197.description = self.description
	end
	if self.cta_text ~= nil then
		var2197.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2197.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2197.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2197.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2197.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2197.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2197.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2197.entity_id = self.entityId
	end
	return var2197
end

t_51.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_51
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p104) --[[ line: 13864 ]]
	-- upvalues: t_52 (ref)
	return setmetatable({
		group_id = if p104 == nil or p104.group_id == nil then "" else p104.group_id,
		experience_id = if p104 == nil or p104.experience_id == nil then "" else p104.experience_id
	}, t_52)
end

function t_52:encode() --[[ line: 13873 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2199 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var2200, var2201 = protoModule.writeTag(buff, var2199, 1, protoModule.wireTypes.lengthDelimited)
		var2200, var2201 = protoModule.writeString(var2200, var2201, self.group_id)
		buff = var2200
		var2199 = var2201
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var2202, var2203 = protoModule.writeTag(buff, var2199, 2, protoModule.wireTypes.lengthDelimited)
		var2202, var2203 = protoModule.writeString(var2202, var2203, self.experience_id)
		buff = var2202
		var2199 = var2203
	end
	local buff_1 = buffer.create(var2199)
	buffer.copy(buff_1, 0, buff, 0, var2199)
	
	return buff_1
end

function t_52.decode(p105) --[[ line: 13892 ]]
	-- upvalues: t_52 (ref), protoModule (ref)
	local var2205 = t_52.new()
	local var2206 = 0
	while var2206 < buffer.len(p105) do
		local _ = nil
		local var2207 = nil
		local var2208, var2209, var2210 = protoModule.readTag(p105, var2206)
		local var2211 = var2208
		var2207 = var2209
		var2206 = var2210
		
		if var2207 == protoModule.wireTypes.varint then
			local _ = nil
			local var2212, var2213 = protoModule.readVarInt(p105, var2206)
			local _ = var2212
			var2206 = var2213
			continue
		end
		if var2207 == protoModule.wireTypes.lengthDelimited then
			if var2211 == 1 then
				local _ = nil
				local var2214, var2215 = protoModule.readBuffer(p105, var2206)
				var2206 = var2215
				var2205.group_id = buffer.tostring(var2214)
			elseif var2211 == 2 then
				local _ = nil
				local var2216, var2217 = protoModule.readBuffer(p105, var2206)
				var2206 = var2217
				var2205.experience_id = buffer.tostring(var2216)
			else
				local _ = nil
				local var2218, var2219 = protoModule.readVarInt(p105, var2206)
				var2206 = var2219 + var2218
			end
		elseif var2207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2220, var2221 = protoModule.readFixed32(p105, var2206)
			local _ = var2220
			var2206 = var2221
		elseif var2207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2222, var2223 = protoModule.readFixed64(p105, var2206)
			local _ = var2222
			var2206 = var2223
		else
			error("Unsupported wire type: " .. var2207)
		end
	end
	return var2205
end

function t_52:jsonEncode() --[[ line: 13940 ]]
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_52:jsonDecode() --[[ line: 13954 ]]
	-- upvalues: t_52 (ref)
	local var2225 = t_52.new()
	
	if self.group_id ~= nil then
		var2225.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var2225.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var2225.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var2225.experience_id = self.experienceId
	end
	return var2225
end

t_52.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_52
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p106) --[[ line: 13990 ]]
	-- upvalues: t_53 (ref)
	return setmetatable({
		title = if p106 == nil or p106.title == nil then "" else p106.title,
		dismiss_text = if p106 == nil or p106.dismiss_text == nil then "" else p106.dismiss_text,
		user_id = if p106 == nil or p106.user_id == nil then "" else p106.user_id,
		cards = if p106 == nil or p106.cards == nil then {} else p106.cards,
		prompt_id = if p106 == nil or p106.prompt_id == nil then "" else p106.prompt_id,
		prompt_type = if p106 == nil or p106.prompt_type == nil then "" else p106.prompt_type,
		sort_id = if p106 == nil or p106.sort_id == nil then "" else p106.sort_id,
		feed_item_key = if p106 == nil or p106.feed_item_key == nil then "" else p106.feed_item_key,
		client_attributes = if p106 == nil or p106.client_attributes == nil then nil else p106.client_attributes
	}, t_53)
end

function t_53:encode() --[[ line: 14004 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2227 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2228, var2229 = protoModule.writeTag(buff, var2227, 1, protoModule.wireTypes.lengthDelimited)
		var2228, var2229 = protoModule.writeString(var2228, var2229, self.title)
		buff = var2228
		var2227 = var2229
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var2230, var2231 = protoModule.writeTag(buff, var2227, 2, protoModule.wireTypes.lengthDelimited)
		var2230, var2231 = protoModule.writeString(var2230, var2231, self.dismiss_text)
		buff = var2230
		var2227 = var2231
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2232, var2233 = protoModule.writeTag(buff, var2227, 3, protoModule.wireTypes.lengthDelimited)
		var2232, var2233 = protoModule.writeString(var2232, var2233, self.user_id)
		buff = var2232
		var2227 = var2233
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var2234 = v:encode()
			local var2235, var2236 = protoModule.writeTag(buff, var2227, 4, protoModule.wireTypes.lengthDelimited)
			var2235, var2236 = protoModule.writeBuffer(var2235, var2236, var2234, buffer.len(var2234))
			buff = var2235
			var2227 = var2236
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2237, var2238 = protoModule.writeTag(buff, var2227, 5, protoModule.wireTypes.lengthDelimited)
		var2237, var2238 = protoModule.writeString(var2237, var2238, self.prompt_id)
		buff = var2237
		var2227 = var2238
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2239, var2240 = protoModule.writeTag(buff, var2227, 6, protoModule.wireTypes.lengthDelimited)
		var2239, var2240 = protoModule.writeString(var2239, var2240, self.prompt_type)
		buff = var2239
		var2227 = var2240
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2241, var2242 = protoModule.writeTag(buff, var2227, 7, protoModule.wireTypes.lengthDelimited)
		var2241, var2242 = protoModule.writeString(var2241, var2242, self.sort_id)
		buff = var2241
		var2227 = var2242
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var2243, var2244 = protoModule.writeTag(buff, var2227, 8, protoModule.wireTypes.lengthDelimited)
		var2243, var2244 = protoModule.writeString(var2243, var2244, self.feed_item_key)
		buff = var2243
		var2227 = var2244
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var2245 = self.client_attributes.value:encode()
		local var2246, var2247 = protoModule.writeTag(buff, var2227, 9, protoModule.wireTypes.lengthDelimited)
		var2246, var2247 = protoModule.writeBuffer(var2246, var2247, var2245, buffer.len(var2245))
		buff = var2246
		var2227 = var2247
	end
	local buff_1 = buffer.create(var2227)
	buffer.copy(buff_1, 0, buff, 0, var2227)
	
	return buff_1
end

function t_53.decode(p107) --[[ line: 14064 ]]
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var2249 = t_53.new()
	local var2250 = 0
	while var2250 < buffer.len(p107) do
		local _ = nil
		local var2251 = nil
		local var2252, var2253, var2254 = protoModule.readTag(p107, var2250)
		local var2255 = var2252
		var2251 = var2253
		var2250 = var2254
		
		if var2251 == protoModule.wireTypes.varint then
			local _ = nil
			local var2256, var2257 = protoModule.readVarInt(p107, var2250)
			local _ = var2256
			var2250 = var2257
			continue
		end
		if var2251 == protoModule.wireTypes.lengthDelimited then
			if var2255 == 1 then
				local _ = nil
				local var2258, var2259 = protoModule.readBuffer(p107, var2250)
				var2250 = var2259
				var2249.title = buffer.tostring(var2258)
			elseif var2255 == 2 then
				local _ = nil
				local var2260, var2261 = protoModule.readBuffer(p107, var2250)
				var2250 = var2261
				var2249.dismiss_text = buffer.tostring(var2260)
			elseif var2255 == 3 then
				local _ = nil
				local var2262, var2263 = protoModule.readBuffer(p107, var2250)
				var2250 = var2263
				var2249.user_id = buffer.tostring(var2262)
			elseif var2255 == 4 then
				local _ = nil
				local var2264, var2265 = protoModule.readBuffer(p107, var2250)
				var2250 = var2265
				table.insert(var2249.cards, t.CardContainerCardInputData.decode(var2264))
			elseif var2255 == 5 then
				local _ = nil
				local var2266, var2267 = protoModule.readBuffer(p107, var2250)
				var2250 = var2267
				var2249.prompt_id = buffer.tostring(var2266)
			elseif var2255 == 6 then
				local _ = nil
				local var2268, var2269 = protoModule.readBuffer(p107, var2250)
				var2250 = var2269
				var2249.prompt_type = buffer.tostring(var2268)
			elseif var2255 == 7 then
				local _ = nil
				local var2270, var2271 = protoModule.readBuffer(p107, var2250)
				var2250 = var2271
				var2249.sort_id = buffer.tostring(var2270)
			elseif var2255 == 8 then
				local _ = nil
				local var2272, var2273 = protoModule.readBuffer(p107, var2250)
				var2250 = var2273
				var2249.feed_item_key = buffer.tostring(var2272)
			elseif var2255 == 9 then
				local _ = nil
				local var2274, var2275 = protoModule.readBuffer(p107, var2250)
				var2250 = var2275
				var2249.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var2274)
				}
			else
				local _ = nil
				local var2276, var2277 = protoModule.readVarInt(p107, var2250)
				var2250 = var2277 + var2276
			end
		elseif var2251 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2278, var2279 = protoModule.readFixed32(p107, var2250)
			local _ = var2278
			var2250 = var2279
		elseif var2251 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2280, var2281 = protoModule.readFixed64(p107, var2250)
			local _ = var2280
			var2250 = var2281
		else
			error("Unsupported wire type: " .. var2251)
		end
	end
	return var2249
end

function t_53:jsonEncode() --[[ line: 14150 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		t.dismissText = self.dismiss_text
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.cards ~= nil and #self.cards > 0 then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, v:jsonEncode())
		end
		t.cards = t_1
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		t.feedItemKey = self.feed_item_key
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		t.communitiesClientAttributes = self.client_attributes.value:jsonEncode()
	end
	return t
end

function t_53:jsonDecode() --[[ line: 14198 ]]
	-- upvalues: t_53 (ref), t (ref)
	local var2284 = t_53.new()
	
	if self.title ~= nil then
		var2284.title = self.title
	end
	if self.dismiss_text ~= nil then
		var2284.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var2284.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var2284.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2284.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var2284.cards = t_1
	end
	if self.prompt_id ~= nil then
		var2284.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2284.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2284.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2284.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var2284.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2284.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var2284.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var2284.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var2284.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var2284.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var2284
end

t_53.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_53
typeRegistryModule.default:register(t.CardContainerInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p108) --[[ line: 14293 ]]
	-- upvalues: t_54 (ref)
	return setmetatable({
		title = if p108 == nil or p108.title == nil then "" else p108.title,
		user_id = if p108 == nil or p108.user_id == nil then "" else p108.user_id,
		description = if p108 == nil or p108.description == nil then "" else p108.description,
		cta_text = if p108 == nil or p108.cta_text == nil then "" else p108.cta_text,
		prompt_id = if p108 == nil or p108.prompt_id == nil then "" else p108.prompt_id,
		prompt_type = if p108 == nil or p108.prompt_type == nil then "" else p108.prompt_type,
		entity_id = if p108 == nil or p108.entity_id == nil then "" else p108.entity_id
	}, t_54)
end

function t_54:encode() --[[ line: 14305 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2287 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2288, var2289 = protoModule.writeTag(buff, var2287, 1, protoModule.wireTypes.lengthDelimited)
		var2288, var2289 = protoModule.writeString(var2288, var2289, self.title)
		buff = var2288
		var2287 = var2289
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2290, var2291 = protoModule.writeTag(buff, var2287, 2, protoModule.wireTypes.lengthDelimited)
		var2290, var2291 = protoModule.writeString(var2290, var2291, self.user_id)
		buff = var2290
		var2287 = var2291
	end
	if self.description ~= nil and self.description ~= "" then
		local var2292, var2293 = protoModule.writeTag(buff, var2287, 3, protoModule.wireTypes.lengthDelimited)
		var2292, var2293 = protoModule.writeString(var2292, var2293, self.description)
		buff = var2292
		var2287 = var2293
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2294, var2295 = protoModule.writeTag(buff, var2287, 4, protoModule.wireTypes.lengthDelimited)
		var2294, var2295 = protoModule.writeString(var2294, var2295, self.cta_text)
		buff = var2294
		var2287 = var2295
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2296, var2297 = protoModule.writeTag(buff, var2287, 5, protoModule.wireTypes.lengthDelimited)
		var2296, var2297 = protoModule.writeString(var2296, var2297, self.prompt_id)
		buff = var2296
		var2287 = var2297
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2298, var2299 = protoModule.writeTag(buff, var2287, 6, protoModule.wireTypes.lengthDelimited)
		var2298, var2299 = protoModule.writeString(var2298, var2299, self.prompt_type)
		buff = var2298
		var2287 = var2299
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2300, var2301 = protoModule.writeTag(buff, var2287, 7, protoModule.wireTypes.lengthDelimited)
		var2300, var2301 = protoModule.writeString(var2300, var2301, self.entity_id)
		buff = var2300
		var2287 = var2301
	end
	local buff_1 = buffer.create(var2287)
	buffer.copy(buff_1, 0, buff, 0, var2287)
	
	return buff_1
end

function t_54.decode(p109) --[[ line: 14349 ]]
	-- upvalues: t_54 (ref), protoModule (ref)
	local var2303 = t_54.new()
	local var2304 = 0
	while var2304 < buffer.len(p109) do
		local _ = nil
		local var2305 = nil
		local var2306, var2307, var2308 = protoModule.readTag(p109, var2304)
		local var2309 = var2306
		var2305 = var2307
		var2304 = var2308
		
		if var2305 == protoModule.wireTypes.varint then
			local _ = nil
			local var2310, var2311 = protoModule.readVarInt(p109, var2304)
			local _ = var2310
			var2304 = var2311
			continue
		end
		if var2305 == protoModule.wireTypes.lengthDelimited then
			if var2309 == 1 then
				local _ = nil
				local var2312, var2313 = protoModule.readBuffer(p109, var2304)
				var2304 = var2313
				var2303.title = buffer.tostring(var2312)
			elseif var2309 == 2 then
				local _ = nil
				local var2314, var2315 = protoModule.readBuffer(p109, var2304)
				var2304 = var2315
				var2303.user_id = buffer.tostring(var2314)
			elseif var2309 == 3 then
				local _ = nil
				local var2316, var2317 = protoModule.readBuffer(p109, var2304)
				var2304 = var2317
				var2303.description = buffer.tostring(var2316)
			elseif var2309 == 4 then
				local _ = nil
				local var2318, var2319 = protoModule.readBuffer(p109, var2304)
				var2304 = var2319
				var2303.cta_text = buffer.tostring(var2318)
			elseif var2309 == 5 then
				local _ = nil
				local var2320, var2321 = protoModule.readBuffer(p109, var2304)
				var2304 = var2321
				var2303.prompt_id = buffer.tostring(var2320)
			elseif var2309 == 6 then
				local _ = nil
				local var2322, var2323 = protoModule.readBuffer(p109, var2304)
				var2304 = var2323
				var2303.prompt_type = buffer.tostring(var2322)
			elseif var2309 == 7 then
				local _ = nil
				local var2324, var2325 = protoModule.readBuffer(p109, var2304)
				var2304 = var2325
				var2303.entity_id = buffer.tostring(var2324)
			else
				local _ = nil
				local var2326, var2327 = protoModule.readVarInt(p109, var2304)
				var2304 = var2327 + var2326
			end
		elseif var2305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2328, var2329 = protoModule.readFixed32(p109, var2304)
			local _ = var2328
			var2304 = var2329
		elseif var2305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2330, var2331 = protoModule.readFixed64(p109, var2304)
			local _ = var2330
			var2304 = var2331
		else
			error("Unsupported wire type: " .. var2305)
		end
	end
	return var2303
end

function t_54:jsonEncode() --[[ line: 14422 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		t.ctaText = self.cta_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		t.entityId = self.entity_id
	end
	return t
end

function t_54:jsonDecode() --[[ line: 14456 ]]
	-- upvalues: t_54 (ref)
	local var2333 = t_54.new()
	
	if self.title ~= nil then
		var2333.title = self.title
	end
	if self.user_id ~= nil then
		var2333.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2333.user_id = self.userId
	end
	if self.description ~= nil then
		var2333.description = self.description
	end
	if self.cta_text ~= nil then
		var2333.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2333.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2333.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2333.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2333.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2333.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2333.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2333.entity_id = self.entityId
	end
	return var2333
end

t_54.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_54
typeRegistryModule.default:register(t.CardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p110) --[[ line: 14524 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p110 == nil or p110.prompt_id == nil then "" else p110.prompt_id,
		prompt_type = if p110 == nil or p110.prompt_type == nil then "" else p110.prompt_type,
		user_id = if p110 == nil or p110.user_id == nil then "" else p110.user_id,
		audit_data = if p110 == nil or p110.audit_data == nil then "" else p110.audit_data
	}, t_55)
end

function t_55:encode() --[[ line: 14533 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2335 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2336, var2337 = protoModule.writeTag(buff, var2335, 1, protoModule.wireTypes.lengthDelimited)
		var2336, var2337 = protoModule.writeString(var2336, var2337, self.prompt_id)
		buff = var2336
		var2335 = var2337
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2338, var2339 = protoModule.writeTag(buff, var2335, 2, protoModule.wireTypes.lengthDelimited)
		var2338, var2339 = protoModule.writeString(var2338, var2339, self.prompt_type)
		buff = var2338
		var2335 = var2339
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2340, var2341 = protoModule.writeTag(buff, var2335, 3, protoModule.wireTypes.lengthDelimited)
		var2340, var2341 = protoModule.writeString(var2340, var2341, self.user_id)
		buff = var2340
		var2335 = var2341
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var2342, var2343 = protoModule.writeTag(buff, var2335, 4, protoModule.wireTypes.lengthDelimited)
		var2342, var2343 = protoModule.writeString(var2342, var2343, self.audit_data)
		buff = var2342
		var2335 = var2343
	end
	local buff_1 = buffer.create(var2335)
	buffer.copy(buff_1, 0, buff, 0, var2335)
	
	return buff_1
end

function t_55.decode(p111) --[[ line: 14562 ]]
	-- upvalues: t_55 (ref), protoModule (ref)
	local var2345 = t_55.new()
	local var2346 = 0
	while var2346 < buffer.len(p111) do
		local _ = nil
		local var2347 = nil
		local var2348, var2349, var2350 = protoModule.readTag(p111, var2346)
		local var2351 = var2348
		var2347 = var2349
		var2346 = var2350
		
		if var2347 == protoModule.wireTypes.varint then
			local _ = nil
			local var2352, var2353 = protoModule.readVarInt(p111, var2346)
			local _ = var2352
			var2346 = var2353
			continue
		end
		if var2347 == protoModule.wireTypes.lengthDelimited then
			if var2351 == 1 then
				local _ = nil
				local var2354, var2355 = protoModule.readBuffer(p111, var2346)
				var2346 = var2355
				var2345.prompt_id = buffer.tostring(var2354)
			elseif var2351 == 2 then
				local _ = nil
				local var2356, var2357 = protoModule.readBuffer(p111, var2346)
				var2346 = var2357
				var2345.prompt_type = buffer.tostring(var2356)
			elseif var2351 == 3 then
				local _ = nil
				local var2358, var2359 = protoModule.readBuffer(p111, var2346)
				var2346 = var2359
				var2345.user_id = buffer.tostring(var2358)
			elseif var2351 == 4 then
				local _ = nil
				local var2360, var2361 = protoModule.readBuffer(p111, var2346)
				var2346 = var2361
				var2345.audit_data = buffer.tostring(var2360)
			else
				local _ = nil
				local var2362, var2363 = protoModule.readVarInt(p111, var2346)
				var2346 = var2363 + var2362
			end
		elseif var2347 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2364, var2365 = protoModule.readFixed32(p111, var2346)
			local _ = var2364
			var2346 = var2365
		elseif var2347 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2366, var2367 = protoModule.readFixed64(p111, var2346)
			local _ = var2366
			var2346 = var2367
		else
			error("Unsupported wire type: " .. var2347)
		end
	end
	return var2345
end

function t_55:jsonEncode() --[[ line: 14620 ]]
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		t.auditData = self.audit_data
	end
	return t
end

function t_55:jsonDecode() --[[ line: 14642 ]]
	-- upvalues: t_55 (ref)
	local var2369 = t_55.new()
	
	if self.prompt_id ~= nil then
		var2369.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2369.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2369.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2369.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var2369.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2369.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var2369.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var2369.audit_data = self.auditData
	end
	return var2369
end

t_55.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_55
typeRegistryModule.default:register(t.DialogInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p112) --[[ line: 14694 ]]
	-- upvalues: t_56 (ref)
	return setmetatable({
		sender_count = if p112 == nil or p112.sender_count == nil then 0 else p112.sender_count,
		total_robux_amount = if p112 == nil or p112.total_robux_amount == nil then 0 else p112.total_robux_amount
	}, t_56)
end

function t_56:encode() --[[ line: 14701 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2371 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var2372, var2373 = protoModule.writeTag(buff, var2371, 1, protoModule.wireTypes.varint)
		var2372, var2373 = protoModule.writeVarInt(var2372, var2373, self.sender_count)
		buff = var2372
		var2371 = var2373
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var2374, var2375 = protoModule.writeTag(buff, var2371, 2, protoModule.wireTypes.varint)
		var2374, var2375 = protoModule.writeVarInt(var2374, var2375, self.total_robux_amount)
		buff = var2374
		var2371 = var2375
	end
	local buff_1 = buffer.create(var2371)
	buffer.copy(buff_1, 0, buff, 0, var2371)
	
	return buff_1
end

function t_56.decode(p113) --[[ line: 14720 ]]
	-- upvalues: t_56 (ref), protoModule (ref)
	local var2377 = t_56.new()
	local var2378 = 0
	while var2378 < buffer.len(p113) do
		local _ = nil
		local _ = nil
		local var2379, var2380, var2381 = protoModule.readTag(p113, var2378)
		local var2382 = var2379
		local var2383 = var2380
		var2378 = var2381
		
		if var2383 == protoModule.wireTypes.varint then
			if var2382 == 1 then
				local _ = nil
				local var2384, var2385 = protoModule.readVarIntI32(p113, var2378)
				var2378 = var2385
				var2377.sender_count = var2384
			elseif var2382 == 2 then
				local _ = nil
				local var2386, var2387 = protoModule.readVarIntI64(p113, var2378)
				var2378 = var2387
				var2377.total_robux_amount = var2386
			else
				local _ = nil
				local var2388, var2389 = protoModule.readVarInt(p113, var2378)
				local _ = var2388
				var2378 = var2389
			end
		elseif var2383 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2390, var2391 = protoModule.readVarInt(p113, var2378)
			var2378 = var2391 + var2390
		elseif var2383 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2392, var2393 = protoModule.readFixed32(p113, var2378)
			local _ = var2392
			var2378 = var2393
		elseif var2383 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2394, var2395 = protoModule.readFixed64(p113, var2378)
			local _ = var2394
			var2378 = var2395
		else
			error("Unsupported wire type: " .. var2383)
		end
	end
	return var2377
end

function t_56:jsonEncode() --[[ line: 14768 ]]
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_56:jsonDecode() --[[ line: 14782 ]]
	-- upvalues: t_56 (ref)
	local var2397 = t_56.new()
	
	if self.sender_count ~= nil then
		var2397.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var2397.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var2397.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var2397.total_robux_amount = self.totalRobuxAmount
	end
	return var2397
end

t_56.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_56
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p114) --[[ line: 14818 ]]
	-- upvalues: t_57 (ref)
	return setmetatable({
		title = if p114 == nil or p114.title == nil then "" else p114.title,
		description = if p114 == nil or p114.description == nil then "" else p114.description,
		primary_text = if p114 == nil or p114.primary_text == nil then "" else p114.primary_text,
		secondary_text = if p114 == nil or p114.secondary_text == nil then "" else p114.secondary_text,
		prompt_id = if p114 == nil or p114.prompt_id == nil then "" else p114.prompt_id,
		prompt_type = if p114 == nil or p114.prompt_type == nil then "" else p114.prompt_type,
		times_seen = if p114 == nil or p114.times_seen == nil then 0 else p114.times_seen,
		content = if p114 == nil or p114.content == nil then nil else p114.content
	}, t_57)
end

function t_57:encode() --[[ line: 14831 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2399 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2400, var2401 = protoModule.writeTag(buff, var2399, 1, protoModule.wireTypes.lengthDelimited)
		var2400, var2401 = protoModule.writeString(var2400, var2401, self.title)
		buff = var2400
		var2399 = var2401
	end
	if self.description ~= nil and self.description ~= "" then
		local var2402, var2403 = protoModule.writeTag(buff, var2399, 2, protoModule.wireTypes.lengthDelimited)
		var2402, var2403 = protoModule.writeString(var2402, var2403, self.description)
		buff = var2402
		var2399 = var2403
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var2404, var2405 = protoModule.writeTag(buff, var2399, 3, protoModule.wireTypes.lengthDelimited)
		var2404, var2405 = protoModule.writeString(var2404, var2405, self.primary_text)
		buff = var2404
		var2399 = var2405
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var2406, var2407 = protoModule.writeTag(buff, var2399, 4, protoModule.wireTypes.lengthDelimited)
		var2406, var2407 = protoModule.writeString(var2406, var2407, self.secondary_text)
		buff = var2406
		var2399 = var2407
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2408, var2409 = protoModule.writeTag(buff, var2399, 5, protoModule.wireTypes.lengthDelimited)
		var2408, var2409 = protoModule.writeString(var2408, var2409, self.prompt_id)
		buff = var2408
		var2399 = var2409
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2410, var2411 = protoModule.writeTag(buff, var2399, 6, protoModule.wireTypes.lengthDelimited)
		var2410, var2411 = protoModule.writeString(var2410, var2411, self.prompt_type)
		buff = var2410
		var2399 = var2411
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var2412, var2413 = protoModule.writeTag(buff, var2399, 7, protoModule.wireTypes.varint)
		var2412, var2413 = protoModule.writeVarInt(var2412, var2413, self.times_seen)
		buff = var2412
		var2399 = var2413
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var2414 = self.content.value:encode()
		local var2415, var2416 = protoModule.writeTag(buff, var2399, 8, protoModule.wireTypes.lengthDelimited)
		var2415, var2416 = protoModule.writeBuffer(var2415, var2416, var2414, buffer.len(var2414))
		buff = var2415
		var2399 = var2416
	end
	local buff_1 = buffer.create(var2399)
	buffer.copy(buff_1, 0, buff, 0, var2399)
	
	return buff_1
end

function t_57.decode(p115) --[[ line: 14883 ]]
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var2418 = t_57.new()
	local var2419 = 0
	while var2419 < buffer.len(p115) do
		local _ = nil
		local var2420 = nil
		local var2421, var2422, var2423 = protoModule.readTag(p115, var2419)
		local var2424 = var2421
		var2420 = var2422
		var2419 = var2423
		
		if var2420 == protoModule.wireTypes.varint then
			if var2424 == 7 then
				local _ = nil
				local var2425, var2426 = protoModule.readVarIntI32(p115, var2419)
				var2419 = var2426
				var2418.times_seen = var2425
			else
				local _ = nil
				local var2427, var2428 = protoModule.readVarInt(p115, var2419)
				local _ = var2427
				var2419 = var2428
			end
		end
		if var2420 == protoModule.wireTypes.lengthDelimited then
			if var2424 == 1 then
				local _ = nil
				local var2429, var2430 = protoModule.readBuffer(p115, var2419)
				var2419 = var2430
				var2418.title = buffer.tostring(var2429)
			elseif var2424 == 2 then
				local _ = nil
				local var2431, var2432 = protoModule.readBuffer(p115, var2419)
				var2419 = var2432
				var2418.description = buffer.tostring(var2431)
			elseif var2424 == 3 then
				local _ = nil
				local var2433, var2434 = protoModule.readBuffer(p115, var2419)
				var2419 = var2434
				var2418.primary_text = buffer.tostring(var2433)
			elseif var2424 == 4 then
				local _ = nil
				local var2435, var2436 = protoModule.readBuffer(p115, var2419)
				var2419 = var2436
				var2418.secondary_text = buffer.tostring(var2435)
			elseif var2424 == 5 then
				local _ = nil
				local var2437, var2438 = protoModule.readBuffer(p115, var2419)
				var2419 = var2438
				var2418.prompt_id = buffer.tostring(var2437)
			elseif var2424 == 6 then
				local _ = nil
				local var2439, var2440 = protoModule.readBuffer(p115, var2419)
				var2419 = var2440
				var2418.prompt_type = buffer.tostring(var2439)
			elseif var2424 == 8 then
				local _ = nil
				local var2441, var2442 = protoModule.readBuffer(p115, var2419)
				var2419 = var2442
				var2418.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var2441)
				}
			else
				local _ = nil
				local var2443, var2444 = protoModule.readVarInt(p115, var2419)
				var2419 = var2444 + var2443
			end
		elseif var2420 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2445, var2446 = protoModule.readFixed32(p115, var2419)
			local _ = var2445
			var2419 = var2446
		elseif var2420 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2447, var2448 = protoModule.readFixed64(p115, var2419)
			local _ = var2447
			var2419 = var2448
		else
			error("Unsupported wire type: " .. var2420)
		end
	end
	return var2418
end

function t_57:jsonEncode() --[[ line: 14962 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		t.primaryText = self.primary_text
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		t.secondaryText = self.secondary_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		t.timesSeen = self.times_seen
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		t.incomingTransferContent = self.content.value:jsonEncode()
	end
	return t
end

function t_57:jsonDecode() --[[ line: 15002 ]]
	-- upvalues: t_57 (ref), t (ref)
	local var2450 = t_57.new()
	
	if self.title ~= nil then
		var2450.title = self.title
	end
	if self.description ~= nil then
		var2450.description = self.description
	end
	if self.primary_text ~= nil then
		var2450.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var2450.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var2450.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var2450.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var2450.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2450.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2450.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2450.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var2450.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var2450.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var2450.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var2450.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var2450
end

t_57.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_57
typeRegistryModule.default:register(t.BannerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p116) --[[ line: 15084 ]]
	-- upvalues: t_58 (ref)
	return setmetatable({
		tooltip_text = if p116 == nil or p116.tooltip_text == nil then "" else p116.tooltip_text,
		prompt_id = if p116 == nil or p116.prompt_id == nil then "" else p116.prompt_id,
		prompt_type = if p116 == nil or p116.prompt_type == nil then "" else p116.prompt_type
	}, t_58)
end

function t_58:encode() --[[ line: 15092 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2452 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var2453, var2454 = protoModule.writeTag(buff, var2452, 1, protoModule.wireTypes.lengthDelimited)
		var2453, var2454 = protoModule.writeString(var2453, var2454, self.tooltip_text)
		buff = var2453
		var2452 = var2454
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2455, var2456 = protoModule.writeTag(buff, var2452, 2, protoModule.wireTypes.lengthDelimited)
		var2455, var2456 = protoModule.writeString(var2455, var2456, self.prompt_id)
		buff = var2455
		var2452 = var2456
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2457, var2458 = protoModule.writeTag(buff, var2452, 3, protoModule.wireTypes.lengthDelimited)
		var2457, var2458 = protoModule.writeString(var2457, var2458, self.prompt_type)
		buff = var2457
		var2452 = var2458
	end
	local buff_1 = buffer.create(var2452)
	buffer.copy(buff_1, 0, buff, 0, var2452)
	
	return buff_1
end

function t_58.decode(p117) --[[ line: 15116 ]]
	-- upvalues: t_58 (ref), protoModule (ref)
	local var2460 = t_58.new()
	local var2461 = 0
	while var2461 < buffer.len(p117) do
		local _ = nil
		local var2462 = nil
		local var2463, var2464, var2465 = protoModule.readTag(p117, var2461)
		local var2466 = var2463
		var2462 = var2464
		var2461 = var2465
		
		if var2462 == protoModule.wireTypes.varint then
			local _ = nil
			local var2467, var2468 = protoModule.readVarInt(p117, var2461)
			local _ = var2467
			var2461 = var2468
			continue
		end
		if var2462 == protoModule.wireTypes.lengthDelimited then
			if var2466 == 1 then
				local _ = nil
				local var2469, var2470 = protoModule.readBuffer(p117, var2461)
				var2461 = var2470
				var2460.tooltip_text = buffer.tostring(var2469)
			elseif var2466 == 2 then
				local _ = nil
				local var2471, var2472 = protoModule.readBuffer(p117, var2461)
				var2461 = var2472
				var2460.prompt_id = buffer.tostring(var2471)
			elseif var2466 == 3 then
				local _ = nil
				local var2473, var2474 = protoModule.readBuffer(p117, var2461)
				var2461 = var2474
				var2460.prompt_type = buffer.tostring(var2473)
			else
				local _ = nil
				local var2475, var2476 = protoModule.readVarInt(p117, var2461)
				var2461 = var2476 + var2475
			end
		elseif var2462 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2477, var2478 = protoModule.readFixed32(p117, var2461)
			local _ = var2477
			var2461 = var2478
		elseif var2462 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2479, var2480 = protoModule.readFixed64(p117, var2461)
			local _ = var2479
			var2461 = var2480
		else
			error("Unsupported wire type: " .. var2462)
		end
	end
	return var2460
end

function t_58:jsonEncode() --[[ line: 15169 ]]
	local t = {}
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		t.tooltipText = self.tooltip_text
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_58:jsonDecode() --[[ line: 15187 ]]
	-- upvalues: t_58 (ref)
	local var2482 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var2482.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var2482.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var2482.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2482.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2482.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2482.prompt_type = self.promptType
	end
	return var2482
end

t_58.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_58
typeRegistryModule.default:register(t.TooltipInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p118) --[[ line: 15231 ]]
	-- upvalues: t_59 (ref)
	return setmetatable({
		media_id = if p118 == nil or p118.media_id == nil then "" else p118.media_id,
		title = if p118 == nil or p118.title == nil then "" else p118.title,
		description = if p118 == nil or p118.description == nil then "" else p118.description,
		prompt_id = if p118 == nil or p118.prompt_id == nil then "" else p118.prompt_id,
		prompt_type = if p118 == nil or p118.prompt_type == nil then "" else p118.prompt_type,
		anchor_tag = if p118 == nil or p118.anchor_tag == nil then "" else p118.anchor_tag
	}, t_59)
end

function t_59:encode() --[[ line: 15242 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2484 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var2485, var2486 = protoModule.writeTag(buff, var2484, 1, protoModule.wireTypes.lengthDelimited)
		var2485, var2486 = protoModule.writeString(var2485, var2486, self.media_id)
		buff = var2485
		var2484 = var2486
	end
	if self.title ~= nil and self.title ~= "" then
		local var2487, var2488 = protoModule.writeTag(buff, var2484, 2, protoModule.wireTypes.lengthDelimited)
		var2487, var2488 = protoModule.writeString(var2487, var2488, self.title)
		buff = var2487
		var2484 = var2488
	end
	if self.description ~= nil and self.description ~= "" then
		local var2489, var2490 = protoModule.writeTag(buff, var2484, 3, protoModule.wireTypes.lengthDelimited)
		var2489, var2490 = protoModule.writeString(var2489, var2490, self.description)
		buff = var2489
		var2484 = var2490
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2491, var2492 = protoModule.writeTag(buff, var2484, 4, protoModule.wireTypes.lengthDelimited)
		var2491, var2492 = protoModule.writeString(var2491, var2492, self.prompt_id)
		buff = var2491
		var2484 = var2492
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2493, var2494 = protoModule.writeTag(buff, var2484, 5, protoModule.wireTypes.lengthDelimited)
		var2493, var2494 = protoModule.writeString(var2493, var2494, self.prompt_type)
		buff = var2493
		var2484 = var2494
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var2495, var2496 = protoModule.writeTag(buff, var2484, 6, protoModule.wireTypes.lengthDelimited)
		var2495, var2496 = protoModule.writeString(var2495, var2496, self.anchor_tag)
		buff = var2495
		var2484 = var2496
	end
	local buff_1 = buffer.create(var2484)
	buffer.copy(buff_1, 0, buff, 0, var2484)
	
	return buff_1
end

function t_59.decode(p119) --[[ line: 15281 ]]
	-- upvalues: t_59 (ref), protoModule (ref)
	local var2498 = t_59.new()
	local var2499 = 0
	while var2499 < buffer.len(p119) do
		local _ = nil
		local var2500 = nil
		local var2501, var2502, var2503 = protoModule.readTag(p119, var2499)
		local var2504 = var2501
		var2500 = var2502
		var2499 = var2503
		
		if var2500 == protoModule.wireTypes.varint then
			local _ = nil
			local var2505, var2506 = protoModule.readVarInt(p119, var2499)
			local _ = var2505
			var2499 = var2506
			continue
		end
		if var2500 == protoModule.wireTypes.lengthDelimited then
			if var2504 == 1 then
				local _ = nil
				local var2507, var2508 = protoModule.readBuffer(p119, var2499)
				var2499 = var2508
				var2498.media_id = buffer.tostring(var2507)
			elseif var2504 == 2 then
				local _ = nil
				local var2509, var2510 = protoModule.readBuffer(p119, var2499)
				var2499 = var2510
				var2498.title = buffer.tostring(var2509)
			elseif var2504 == 3 then
				local _ = nil
				local var2511, var2512 = protoModule.readBuffer(p119, var2499)
				var2499 = var2512
				var2498.description = buffer.tostring(var2511)
			elseif var2504 == 4 then
				local _ = nil
				local var2513, var2514 = protoModule.readBuffer(p119, var2499)
				var2499 = var2514
				var2498.prompt_id = buffer.tostring(var2513)
			elseif var2504 == 5 then
				local _ = nil
				local var2515, var2516 = protoModule.readBuffer(p119, var2499)
				var2499 = var2516
				var2498.prompt_type = buffer.tostring(var2515)
			elseif var2504 == 6 then
				local _ = nil
				local var2517, var2518 = protoModule.readBuffer(p119, var2499)
				var2499 = var2518
				var2498.anchor_tag = buffer.tostring(var2517)
			else
				local _ = nil
				local var2519, var2520 = protoModule.readVarInt(p119, var2499)
				var2499 = var2520 + var2519
			end
		elseif var2500 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2521, var2522 = protoModule.readFixed32(p119, var2499)
			local _ = var2521
			var2499 = var2522
		elseif var2500 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2523, var2524 = protoModule.readFixed64(p119, var2499)
			local _ = var2523
			var2499 = var2524
		else
			error("Unsupported wire type: " .. var2500)
		end
	end
	return var2498
end

function t_59:jsonEncode() --[[ line: 15349 ]]
	local t = {}
	
	if self.media_id ~= nil and self.media_id ~= "" then
		t.mediaId = self.media_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.description ~= nil and self.description ~= "" then
		t.description = self.description
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		t.anchorTag = self.anchor_tag
	end
	return t
end

function t_59:jsonDecode() --[[ line: 15379 ]]
	-- upvalues: t_59 (ref)
	local var2526 = t_59.new()
	
	if self.media_id ~= nil then
		var2526.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var2526.media_id = self.mediaId
	end
	if self.title ~= nil then
		var2526.title = self.title
	end
	if self.description ~= nil then
		var2526.description = self.description
	end
	if self.prompt_id ~= nil then
		var2526.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2526.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2526.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2526.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var2526.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var2526.anchor_tag = self.anchorTag
	end
	return var2526
end

t_59.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_59
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p120) --[[ line: 15439 ]]
	-- upvalues: t_60 (ref)
	return setmetatable({
		prompt_id = if p120 == nil or p120.prompt_id == nil then "" else p120.prompt_id,
		prompt_type = if p120 == nil or p120.prompt_type == nil then "" else p120.prompt_type
	}, t_60)
end

function t_60:encode() --[[ line: 15446 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2528 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2529, var2530 = protoModule.writeTag(buff, var2528, 1, protoModule.wireTypes.lengthDelimited)
		var2529, var2530 = protoModule.writeString(var2529, var2530, self.prompt_id)
		buff = var2529
		var2528 = var2530
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2531, var2532 = protoModule.writeTag(buff, var2528, 2, protoModule.wireTypes.lengthDelimited)
		var2531, var2532 = protoModule.writeString(var2531, var2532, self.prompt_type)
		buff = var2531
		var2528 = var2532
	end
	local buff_1 = buffer.create(var2528)
	buffer.copy(buff_1, 0, buff, 0, var2528)
	
	return buff_1
end

function t_60.decode(p121) --[[ line: 15465 ]]
	-- upvalues: t_60 (ref), protoModule (ref)
	local var2534 = t_60.new()
	local var2535 = 0
	while var2535 < buffer.len(p121) do
		local _ = nil
		local var2536 = nil
		local var2537, var2538, var2539 = protoModule.readTag(p121, var2535)
		local var2540 = var2537
		var2536 = var2538
		var2535 = var2539
		
		if var2536 == protoModule.wireTypes.varint then
			local _ = nil
			local var2541, var2542 = protoModule.readVarInt(p121, var2535)
			local _ = var2541
			var2535 = var2542
			continue
		end
		if var2536 == protoModule.wireTypes.lengthDelimited then
			if var2540 == 1 then
				local _ = nil
				local var2543, var2544 = protoModule.readBuffer(p121, var2535)
				var2535 = var2544
				var2534.prompt_id = buffer.tostring(var2543)
			elseif var2540 == 2 then
				local _ = nil
				local var2545, var2546 = protoModule.readBuffer(p121, var2535)
				var2535 = var2546
				var2534.prompt_type = buffer.tostring(var2545)
			else
				local _ = nil
				local var2547, var2548 = protoModule.readVarInt(p121, var2535)
				var2535 = var2548 + var2547
			end
		elseif var2536 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2549, var2550 = protoModule.readFixed32(p121, var2535)
			local _ = var2549
			var2535 = var2550
		elseif var2536 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2551, var2552 = protoModule.readFixed64(p121, var2535)
			local _ = var2551
			var2535 = var2552
		else
			error("Unsupported wire type: " .. var2536)
		end
	end
	return var2534
end

function t_60:jsonEncode() --[[ line: 15513 ]]
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_60:jsonDecode() --[[ line: 15527 ]]
	-- upvalues: t_60 (ref)
	local var2554 = t_60.new()
	
	if self.prompt_id ~= nil then
		var2554.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2554.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2554.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2554.prompt_type = self.promptType
	end
	return var2554
end

t_60.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_60
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p122) --[[ line: 15563 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		upsell_prompt = if p122 == nil or p122.upsell_prompt == nil then "" else p122.upsell_prompt
	}, t_61)
end

function t_61:encode() --[[ line: 15569 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2556 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2557, var2558 = protoModule.writeTag(buff, var2556, 1, protoModule.wireTypes.lengthDelimited)
		var2557, var2558 = protoModule.writeString(var2557, var2558, self.upsell_prompt)
		buff = var2557
		var2556 = var2558
	end
	local buff_1 = buffer.create(var2556)
	buffer.copy(buff_1, 0, buff, 0, var2556)
	
	return buff_1
end

function t_61.decode(p123) --[[ line: 15583 ]]
	-- upvalues: t_61 (ref), protoModule (ref)
	local var2560 = t_61.new()
	local var2561 = 0
	while var2561 < buffer.len(p123) do
		local _ = nil
		local var2562 = nil
		local var2563, var2564, var2565 = protoModule.readTag(p123, var2561)
		local var2566 = var2563
		var2562 = var2564
		var2561 = var2565
		
		if var2562 == protoModule.wireTypes.varint then
			local _ = nil
			local var2567, var2568 = protoModule.readVarInt(p123, var2561)
			local _ = var2567
			var2561 = var2568
			continue
		end
		if var2562 == protoModule.wireTypes.lengthDelimited then
			if var2566 == 1 then
				local _ = nil
				local var2569, var2570 = protoModule.readBuffer(p123, var2561)
				var2561 = var2570
				var2560.upsell_prompt = buffer.tostring(var2569)
			else
				local _ = nil
				local var2571, var2572 = protoModule.readVarInt(p123, var2561)
				var2561 = var2572 + var2571
			end
		elseif var2562 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2573, var2574 = protoModule.readFixed32(p123, var2561)
			local _ = var2573
			var2561 = var2574
		elseif var2562 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2575, var2576 = protoModule.readFixed64(p123, var2561)
			local _ = var2575
			var2561 = var2576
		else
			error("Unsupported wire type: " .. var2562)
		end
	end
	return var2560
end

function t_61:jsonEncode() --[[ line: 15626 ]]
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_61:jsonDecode() --[[ line: 15636 ]]
	-- upvalues: t_61 (ref)
	local var2578 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var2578.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var2578.upsell_prompt = self.upsellPrompt
	end
	return var2578
end

t_61.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_61
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p124) --[[ line: 15664 ]]
	-- upvalues: t_62 (ref)
	return setmetatable({
		modal_variant = if p124 == nil or p124.modal_variant == nil then "" else p124.modal_variant,
		modal_sequence = if p124 == nil or p124.modal_sequence == nil then "" else p124.modal_sequence,
		conversation_id = if p124 == nil or p124.conversation_id == nil then "" else p124.conversation_id,
		friend_id = if p124 == nil or p124.friend_id == nil then "" else p124.friend_id
	}, t_62)
end

function t_62:encode() --[[ line: 15675 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2580 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2581, var2582 = protoModule.writeTag(buff, var2580, 1, protoModule.wireTypes.lengthDelimited)
		var2581, var2582 = protoModule.writeString(var2581, var2582, self.modal_variant)
		buff = var2581
		var2580 = var2582
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var2583, var2584 = protoModule.writeTag(buff, var2580, 2, protoModule.wireTypes.lengthDelimited)
		var2583, var2584 = protoModule.writeString(var2583, var2584, self.modal_sequence)
		buff = var2583
		var2580 = var2584
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var2585, var2586 = protoModule.writeTag(buff, var2580, 3, protoModule.wireTypes.lengthDelimited)
		var2585, var2586 = protoModule.writeString(var2585, var2586, self.conversation_id)
		buff = var2585
		var2580 = var2586
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var2587, var2588 = protoModule.writeTag(buff, var2580, 4, protoModule.wireTypes.lengthDelimited)
		var2587, var2588 = protoModule.writeString(var2587, var2588, self.friend_id)
		buff = var2587
		var2580 = var2588
	end
	local buff_1 = buffer.create(var2580)
	buffer.copy(buff_1, 0, buff, 0, var2580)
	
	return buff_1
end

function t_62.decode(p125) --[[ line: 15704 ]]
	-- upvalues: t_62 (ref), protoModule (ref)
	local var2590 = t_62.new()
	local var2591 = 0
	while var2591 < buffer.len(p125) do
		local _ = nil
		local var2592 = nil
		local var2593, var2594, var2595 = protoModule.readTag(p125, var2591)
		local var2596 = var2593
		var2592 = var2594
		var2591 = var2595
		
		if var2592 == protoModule.wireTypes.varint then
			local _ = nil
			local var2597, var2598 = protoModule.readVarInt(p125, var2591)
			local _ = var2597
			var2591 = var2598
			continue
		end
		if var2592 == protoModule.wireTypes.lengthDelimited then
			if var2596 == 1 then
				local _ = nil
				local var2599, var2600 = protoModule.readBuffer(p125, var2591)
				var2591 = var2600
				var2590.modal_variant = buffer.tostring(var2599)
			elseif var2596 == 2 then
				local _ = nil
				local var2601, var2602 = protoModule.readBuffer(p125, var2591)
				var2591 = var2602
				var2590.modal_sequence = buffer.tostring(var2601)
			elseif var2596 == 3 then
				local _ = nil
				local var2603, var2604 = protoModule.readBuffer(p125, var2591)
				var2591 = var2604
				var2590.conversation_id = buffer.tostring(var2603)
			elseif var2596 == 4 then
				local _ = nil
				local var2605, var2606 = protoModule.readBuffer(p125, var2591)
				var2591 = var2606
				var2590.friend_id = buffer.tostring(var2605)
			else
				local _ = nil
				local var2607, var2608 = protoModule.readVarInt(p125, var2591)
				var2591 = var2608 + var2607
			end
		elseif var2592 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2609, var2610 = protoModule.readFixed32(p125, var2591)
			local _ = var2609
			var2591 = var2610
		elseif var2592 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2611, var2612 = protoModule.readFixed64(p125, var2591)
			local _ = var2611
			var2591 = var2612
		else
			error("Unsupported wire type: " .. var2592)
		end
	end
	return var2590
end

function t_62:jsonEncode() --[[ line: 15762 ]]
	local t = {}
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		t.modalVariant = self.modal_variant
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		t.modalSequence = self.modal_sequence
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		t.conversationId = self.conversation_id
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		t.friendId = self.friend_id
	end
	return t
end

function t_62:jsonDecode() --[[ line: 15784 ]]
	-- upvalues: t_62 (ref)
	local var2614 = t_62.new()
	
	if self.modal_variant ~= nil then
		var2614.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var2614.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var2614.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var2614.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var2614.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var2614.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var2614.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var2614.friend_id = self.friendId
	end
	return var2614
end

t_62.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_62
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p126) --[[ line: 15838 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p126 == nil or p126.event_id == nil then "" else p126.event_id,
		universe_id = if p126 == nil or p126.universe_id == nil then "" else p126.universe_id,
		entry_map = if p126 == nil or p126.entry_map == nil then {} else p126.entry_map,
		entry_order = if p126 == nil or p126.entry_order == nil then {} else p126.entry_order
	}, t_63)
end

function t_63:encode() --[[ line: 15849 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2616 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2617, var2618 = protoModule.writeTag(buff, var2616, 1, protoModule.wireTypes.lengthDelimited)
		var2617, var2618 = protoModule.writeString(var2617, var2618, self.event_id)
		buff = var2617
		var2616 = var2618
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2619, var2620 = protoModule.writeTag(buff, var2616, 2, protoModule.wireTypes.lengthDelimited)
		var2619, var2620 = protoModule.writeString(var2619, var2620, self.universe_id)
		buff = var2619
		var2616 = var2620
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2621, var2622 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2621, var2622 = protoModule.writeString(var2621, var2622, i)
			local var2623 = v:encode()
			var2622, var2624 = protoModule.writeTag(var2621, var2622, 2, protoModule.wireTypes.lengthDelimited)
			var2622, var2624 = protoModule.writeBuffer(var2622, var2624, var2623, buffer.len(var2623))
			local var2625 = var2622
			local var2626 = var2624
			local var2627, var2628 = protoModule.writeTag(buff, var2616, 3, protoModule.wireTypes.lengthDelimited)
			var2627, var2628 = protoModule.writeBuffer(var2627, var2628, var2625, var2626)
			buff = var2627
			var2616 = var2628
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2629, var2630 = protoModule.writeTag(buff, var2616, 4, protoModule.wireTypes.lengthDelimited)
			var2629, var2630 = protoModule.writeString(var2629, var2630, v)
			buff = var2629
			var2616 = var2630
		end
	end
	local buff_1 = buffer.create(var2616)
	buffer.copy(buff_1, 0, buff, 0, var2616)
	
	return buff_1
end

function t_63.decode(p127) --[[ line: 15889 ]]
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2632 = t_63.new()
	local var2633 = 0
	while var2633 < buffer.len(p127) do
		local _ = nil
		local var2634 = nil
		local var2635, var2636, var2637 = protoModule.readTag(p127, var2633)
		local var2638 = var2635
		var2634 = var2636
		var2633 = var2637
		
		if var2634 == protoModule.wireTypes.varint then
			local _ = nil
			local var2639, var2640 = protoModule.readVarInt(p127, var2633)
			local _ = var2639
			var2633 = var2640
			continue
		end
		if var2634 == protoModule.wireTypes.lengthDelimited then
			if var2638 == 1 then
				local _ = nil
				local var2641, var2642 = protoModule.readBuffer(p127, var2633)
				var2633 = var2642
				var2632.event_id = buffer.tostring(var2641)
			elseif var2638 == 2 then
				local _ = nil
				local var2643, var2644 = protoModule.readBuffer(p127, var2633)
				var2633 = var2644
				var2632.universe_id = buffer.tostring(var2643)
			elseif var2638 == 3 then
				local _ = nil
				local var2645, var2646 = protoModule.readBuffer(p127, var2633)
				var2633 = var2646
				var2645 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var2645)
				var2632.entry_map[var2645.key or ""] = var2645.value or t.FeedEntry.new()
			elseif var2638 == 4 then
				local _ = nil
				local var2647, var2648 = protoModule.readBuffer(p127, var2633)
				var2633 = var2648
				table.insert(var2632.entry_order, buffer.tostring(var2647))
			else
				local _ = nil
				local var2649, var2650 = protoModule.readVarInt(p127, var2633)
				var2633 = var2650 + var2649
			end
		elseif var2634 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2651, var2652 = protoModule.readFixed32(p127, var2633)
			local _ = var2651
			var2633 = var2652
		elseif var2634 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2653, var2654 = protoModule.readFixed64(p127, var2633)
			local _ = var2653
			var2633 = var2654
		else
			error("Unsupported wire type: " .. var2634)
		end
	end
	return var2632
end

function t_63:jsonEncode() --[[ line: 15954 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	return t
end

function t_63:jsonDecode() --[[ line: 15984 ]]
	-- upvalues: t_63 (ref), t (ref)
	local var2658 = t_63.new()
	
	if self.event_id ~= nil then
		var2658.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2658.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2658.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2658.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2658.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2658.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2658.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2658.entry_order = t_1
	end
	return var2658
end

t_63.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_63
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p128) --[[ line: 16056 ]]
	-- upvalues: t_64 (ref)
	return setmetatable({
		key = if p128 == nil or p128.key == nil then "" else p128.key,
		value = if p128 == nil or p128.value == nil then nil else p128.value
	}, t_64)
end

function t_64:encode() --[[ line: 16065 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2664 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2665, var2666 = protoModule.writeTag(buff, var2664, 1, protoModule.wireTypes.lengthDelimited)
		var2665, var2666 = protoModule.writeString(var2665, var2666, self.key)
		buff = var2665
		var2664 = var2666
	end
	if self.value ~= nil then
		local var2667 = self.value:encode()
		local var2668, var2669 = protoModule.writeTag(buff, var2664, 2, protoModule.wireTypes.lengthDelimited)
		var2668, var2669 = protoModule.writeBuffer(var2668, var2669, var2667, buffer.len(var2667))
		buff = var2668
		var2664 = var2669
	end
	local buff_1 = buffer.create(var2664)
	buffer.copy(buff_1, 0, buff, 0, var2664)
	
	return buff_1
end

function t_64.decode(p129) --[[ line: 16085 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2671 = t_64.new()
	local var2672 = 0
	while var2672 < buffer.len(p129) do
		local _ = nil
		local var2673 = nil
		local var2674, var2675, var2676 = protoModule.readTag(p129, var2672)
		local var2677 = var2674
		var2673 = var2675
		var2672 = var2676
		
		if var2673 == protoModule.wireTypes.varint then
			local _ = nil
			local var2678, var2679 = protoModule.readVarInt(p129, var2672)
			local _ = var2678
			var2672 = var2679
			continue
		end
		if var2673 == protoModule.wireTypes.lengthDelimited then
			if var2677 == 1 then
				local _ = nil
				local var2680, var2681 = protoModule.readBuffer(p129, var2672)
				var2672 = var2681
				var2671.key = buffer.tostring(var2680)
			elseif var2677 == 2 then
				local _ = nil
				local var2682, var2683 = protoModule.readBuffer(p129, var2672)
				var2672 = var2683
				var2671.value = t.FeedEntry.decode(var2682)
			else
				local _ = nil
				local var2684, var2685 = protoModule.readVarInt(p129, var2672)
				var2672 = var2685 + var2684
			end
		elseif var2673 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2686, var2687 = protoModule.readFixed32(p129, var2672)
			local _ = var2686
			var2672 = var2687
		elseif var2673 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2688, var2689 = protoModule.readFixed64(p129, var2672)
			local _ = var2688
			var2672 = var2689
		else
			error("Unsupported wire type: " .. var2673)
		end
	end
	return var2671
end

function t_64:jsonEncode() --[[ line: 16133 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_64:jsonDecode() --[[ line: 16147 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2691 = t_64.new()
	
	if self.key ~= nil then
		var2691.key = self.key
	end
	if self.value ~= nil then
		var2691.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2691
end

t_64.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_64
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p130) --[[ line: 16177 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p130 == nil or p130.event_id == nil then "" else p130.event_id,
		universe_id = if p130 == nil or p130.universe_id == nil then "" else p130.universe_id
	}, t_65)
end

function t_65:encode() --[[ line: 16186 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2693 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2694, var2695 = protoModule.writeTag(buff, var2693, 1, protoModule.wireTypes.lengthDelimited)
		var2694, var2695 = protoModule.writeString(var2694, var2695, self.event_id)
		buff = var2694
		var2693 = var2695
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2696, var2697 = protoModule.writeTag(buff, var2693, 2, protoModule.wireTypes.lengthDelimited)
		var2696, var2697 = protoModule.writeString(var2696, var2697, self.universe_id)
		buff = var2696
		var2693 = var2697
	end
	local buff_1 = buffer.create(var2693)
	buffer.copy(buff_1, 0, buff, 0, var2693)
	
	return buff_1
end

function t_65.decode(p131) --[[ line: 16205 ]]
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2699 = t_65.new()
	local var2700 = 0
	while var2700 < buffer.len(p131) do
		local _ = nil
		local var2701 = nil
		local var2702, var2703, var2704 = protoModule.readTag(p131, var2700)
		local var2705 = var2702
		var2701 = var2703
		var2700 = var2704
		
		if var2701 == protoModule.wireTypes.varint then
			local _ = nil
			local var2706, var2707 = protoModule.readVarInt(p131, var2700)
			local _ = var2706
			var2700 = var2707
			continue
		end
		if var2701 == protoModule.wireTypes.lengthDelimited then
			if var2705 == 1 then
				local _ = nil
				local var2708, var2709 = protoModule.readBuffer(p131, var2700)
				var2700 = var2709
				var2699.event_id = buffer.tostring(var2708)
			elseif var2705 == 2 then
				local _ = nil
				local var2710, var2711 = protoModule.readBuffer(p131, var2700)
				var2700 = var2711
				var2699.universe_id = buffer.tostring(var2710)
			else
				local _ = nil
				local var2712, var2713 = protoModule.readVarInt(p131, var2700)
				var2700 = var2713 + var2712
			end
		elseif var2701 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2714, var2715 = protoModule.readFixed32(p131, var2700)
			local _ = var2714
			var2700 = var2715
		elseif var2701 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2716, var2717 = protoModule.readFixed64(p131, var2700)
			local _ = var2716
			var2700 = var2717
		else
			error("Unsupported wire type: " .. var2701)
		end
	end
	return var2699
end

function t_65:jsonEncode() --[[ line: 16253 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_65:jsonDecode() --[[ line: 16267 ]]
	-- upvalues: t_65 (ref)
	local var2719 = t_65.new()
	
	if self.event_id ~= nil then
		var2719.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2719.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2719.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2719.universe_id = self.universeId
	end
	return var2719
end

t_65.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_65
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p132) --[[ line: 16303 ]]
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p132 == nil or p132.event_id == nil then "" else p132.event_id
	}, t_66)
end

function t_66:encode() --[[ line: 16311 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2721 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2722, var2723 = protoModule.writeTag(buff, var2721, 1, protoModule.wireTypes.lengthDelimited)
		var2722, var2723 = protoModule.writeString(var2722, var2723, self.event_id)
		buff = var2722
		var2721 = var2723
	end
	local buff_1 = buffer.create(var2721)
	buffer.copy(buff_1, 0, buff, 0, var2721)
	
	return buff_1
end

function t_66.decode(p133) --[[ line: 16325 ]]
	-- upvalues: t_66 (ref), protoModule (ref)
	local var2725 = t_66.new()
	local var2726 = 0
	while var2726 < buffer.len(p133) do
		local _ = nil
		local var2727 = nil
		local var2728, var2729, var2730 = protoModule.readTag(p133, var2726)
		local var2731 = var2728
		var2727 = var2729
		var2726 = var2730
		
		if var2727 == protoModule.wireTypes.varint then
			local _ = nil
			local var2732, var2733 = protoModule.readVarInt(p133, var2726)
			local _ = var2732
			var2726 = var2733
			continue
		end
		if var2727 == protoModule.wireTypes.lengthDelimited then
			if var2731 == 1 then
				local _ = nil
				local var2734, var2735 = protoModule.readBuffer(p133, var2726)
				var2726 = var2735
				var2725.event_id = buffer.tostring(var2734)
			else
				local _ = nil
				local var2736, var2737 = protoModule.readVarInt(p133, var2726)
				var2726 = var2737 + var2736
			end
		elseif var2727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2738, var2739 = protoModule.readFixed32(p133, var2726)
			local _ = var2738
			var2726 = var2739
		elseif var2727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2740, var2741 = protoModule.readFixed64(p133, var2726)
			local _ = var2740
			var2726 = var2741
		else
			error("Unsupported wire type: " .. var2727)
		end
	end
	return var2725
end

function t_66:jsonEncode() --[[ line: 16368 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_66:jsonDecode() --[[ line: 16378 ]]
	-- upvalues: t_66 (ref)
	local var2743 = t_66.new()
	
	if self.event_id ~= nil then
		var2743.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2743.event_id = self.eventId
	end
	return var2743
end

t_66.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_66
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p134) --[[ line: 16406 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p134 == nil or p134.event_id == nil then "" else p134.event_id,
		universe_id = if p134 == nil or p134.universe_id == nil then "" else p134.universe_id,
		rsvp_users = if p134 == nil or p134.rsvp_users == nil then {} else p134.rsvp_users
	}, t_67)
end

function t_67:encode() --[[ line: 16416 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2745 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2746, var2747 = protoModule.writeTag(buff, var2745, 1, protoModule.wireTypes.lengthDelimited)
		var2746, var2747 = protoModule.writeString(var2746, var2747, self.event_id)
		buff = var2746
		var2745 = var2747
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2748, var2749 = protoModule.writeTag(buff, var2745, 2, protoModule.wireTypes.lengthDelimited)
		var2748, var2749 = protoModule.writeString(var2748, var2749, self.universe_id)
		buff = var2748
		var2745 = var2749
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2750 = v:encode()
			local var2751, var2752 = protoModule.writeTag(buff, var2745, 3, protoModule.wireTypes.lengthDelimited)
			var2751, var2752 = protoModule.writeBuffer(var2751, var2752, var2750, buffer.len(var2750))
			buff = var2751
			var2745 = var2752
		end
	end
	local buff_1 = buffer.create(var2745)
	buffer.copy(buff_1, 0, buff, 0, var2745)
	
	return buff_1
end

function t_67.decode(p135) --[[ line: 16443 ]]
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var2754 = t_67.new()
	local var2755 = 0
	while var2755 < buffer.len(p135) do
		local _ = nil
		local var2756 = nil
		local var2757, var2758, var2759 = protoModule.readTag(p135, var2755)
		local var2760 = var2757
		var2756 = var2758
		var2755 = var2759
		
		if var2756 == protoModule.wireTypes.varint then
			local _ = nil
			local var2761, var2762 = protoModule.readVarInt(p135, var2755)
			local _ = var2761
			var2755 = var2762
			continue
		end
		if var2756 == protoModule.wireTypes.lengthDelimited then
			if var2760 == 1 then
				local _ = nil
				local var2763, var2764 = protoModule.readBuffer(p135, var2755)
				var2755 = var2764
				var2754.event_id = buffer.tostring(var2763)
			elseif var2760 == 2 then
				local _ = nil
				local var2765, var2766 = protoModule.readBuffer(p135, var2755)
				var2755 = var2766
				var2754.universe_id = buffer.tostring(var2765)
			elseif var2760 == 3 then
				local _ = nil
				local var2767, var2768 = protoModule.readBuffer(p135, var2755)
				var2755 = var2768
				table.insert(var2754.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2767))
			else
				local _ = nil
				local var2769, var2770 = protoModule.readVarInt(p135, var2755)
				var2755 = var2770 + var2769
			end
		elseif var2756 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2771, var2772 = protoModule.readFixed32(p135, var2755)
			local _ = var2771
			var2755 = var2772
		elseif var2756 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2773, var2774 = protoModule.readFixed64(p135, var2755)
			local _ = var2773
			var2755 = var2774
		else
			error("Unsupported wire type: " .. var2756)
		end
	end
	return var2754
end

function t_67:jsonEncode() --[[ line: 16496 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, v:jsonEncode())
		end
		t.rsvpUsers = t_1
	end
	return t
end

function t_67:jsonDecode() --[[ line: 16518 ]]
	-- upvalues: t_67 (ref), t (ref)
	local var2777 = t_67.new()
	
	if self.event_id ~= nil then
		var2777.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2777.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2777.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2777.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2777.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2777.rsvp_users = t_1
	end
	return var2777
end

t_67.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_67
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p136) --[[ line: 16572 ]]
	-- upvalues: t_68 (ref)
	return setmetatable({
		user_id = if p136 == nil or p136.user_id == nil then 0 else p136.user_id
	}, t_68)
end

function t_68:encode() --[[ line: 16580 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2781 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2782, var2783 = protoModule.writeTag(buff, var2781, 1, protoModule.wireTypes.varint)
		var2782, var2783 = protoModule.writeVarInt(var2782, var2783, self.user_id)
		buff = var2782
		var2781 = var2783
	end
	local buff_1 = buffer.create(var2781)
	buffer.copy(buff_1, 0, buff, 0, var2781)
	
	return buff_1
end

function t_68.decode(p137) --[[ line: 16594 ]]
	-- upvalues: t_68 (ref), protoModule (ref)
	local var2785 = t_68.new()
	local var2786 = 0
	while var2786 < buffer.len(p137) do
		local _ = nil
		local _ = nil
		local var2787, var2788, var2789 = protoModule.readTag(p137, var2786)
		local var2790 = var2787
		local var2791 = var2788
		var2786 = var2789
		
		if var2791 == protoModule.wireTypes.varint then
			if var2790 == 1 then
				local _ = nil
				local var2792, var2793 = protoModule.readVarIntI64(p137, var2786)
				var2786 = var2793
				var2785.user_id = var2792
			else
				local _ = nil
				local var2794, var2795 = protoModule.readVarInt(p137, var2786)
				local _ = var2794
				var2786 = var2795
			end
		elseif var2791 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2796, var2797 = protoModule.readVarInt(p137, var2786)
			var2786 = var2797 + var2796
		elseif var2791 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2798, var2799 = protoModule.readFixed32(p137, var2786)
			local _ = var2798
			var2786 = var2799
		elseif var2791 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2800, var2801 = protoModule.readFixed64(p137, var2786)
			local _ = var2800
			var2786 = var2801
		else
			error("Unsupported wire type: " .. var2791)
		end
	end
	return var2785
end

function t_68:jsonEncode() --[[ line: 16637 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_68:jsonDecode() --[[ line: 16647 ]]
	-- upvalues: t_68 (ref)
	local var2803 = t_68.new()
	
	if self.user_id ~= nil then
		var2803.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2803.user_id = self.userId
	end
	return var2803
end

t_68.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_68
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p138) --[[ line: 16677 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p138 == nil or p138.event_id == nil then "" else p138.event_id
	}, t_69)
end

function t_69:encode() --[[ line: 16683 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2805 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2806, var2807 = protoModule.writeTag(buff, var2805, 1, protoModule.wireTypes.lengthDelimited)
		var2806, var2807 = protoModule.writeString(var2806, var2807, self.event_id)
		buff = var2806
		var2805 = var2807
	end
	local buff_1 = buffer.create(var2805)
	buffer.copy(buff_1, 0, buff, 0, var2805)
	
	return buff_1
end

function t_69.decode(p139) --[[ line: 16697 ]]
	-- upvalues: t_69 (ref), protoModule (ref)
	local var2809 = t_69.new()
	local var2810 = 0
	while var2810 < buffer.len(p139) do
		local _ = nil
		local var2811 = nil
		local var2812, var2813, var2814 = protoModule.readTag(p139, var2810)
		local var2815 = var2812
		var2811 = var2813
		var2810 = var2814
		
		if var2811 == protoModule.wireTypes.varint then
			local _ = nil
			local var2816, var2817 = protoModule.readVarInt(p139, var2810)
			local _ = var2816
			var2810 = var2817
			continue
		end
		if var2811 == protoModule.wireTypes.lengthDelimited then
			if var2815 == 1 then
				local _ = nil
				local var2818, var2819 = protoModule.readBuffer(p139, var2810)
				var2810 = var2819
				var2809.event_id = buffer.tostring(var2818)
			else
				local _ = nil
				local var2820, var2821 = protoModule.readVarInt(p139, var2810)
				var2810 = var2821 + var2820
			end
		elseif var2811 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2822, var2823 = protoModule.readFixed32(p139, var2810)
			local _ = var2822
			var2810 = var2823
		elseif var2811 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2824, var2825 = protoModule.readFixed64(p139, var2810)
			local _ = var2824
			var2810 = var2825
		else
			error("Unsupported wire type: " .. var2811)
		end
	end
	return var2809
end

function t_69:jsonEncode() --[[ line: 16740 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_69:jsonDecode() --[[ line: 16750 ]]
	-- upvalues: t_69 (ref)
	local var2827 = t_69.new()
	
	if self.event_id ~= nil then
		var2827.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2827.event_id = self.eventId
	end
	return var2827
end

t_69.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_69
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p140) --[[ line: 16778 ]]
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p140 == nil or p140.event_id == nil then "" else p140.event_id
	}, t_70)
end

function t_70:encode() --[[ line: 16786 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2829 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2830, var2831 = protoModule.writeTag(buff, var2829, 1, protoModule.wireTypes.lengthDelimited)
		var2830, var2831 = protoModule.writeString(var2830, var2831, self.event_id)
		buff = var2830
		var2829 = var2831
	end
	local buff_1 = buffer.create(var2829)
	buffer.copy(buff_1, 0, buff, 0, var2829)
	
	return buff_1
end

function t_70.decode(p141) --[[ line: 16800 ]]
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2833 = t_70.new()
	local var2834 = 0
	while var2834 < buffer.len(p141) do
		local _ = nil
		local var2835 = nil
		local var2836, var2837, var2838 = protoModule.readTag(p141, var2834)
		local var2839 = var2836
		var2835 = var2837
		var2834 = var2838
		
		if var2835 == protoModule.wireTypes.varint then
			local _ = nil
			local var2840, var2841 = protoModule.readVarInt(p141, var2834)
			local _ = var2840
			var2834 = var2841
			continue
		end
		if var2835 == protoModule.wireTypes.lengthDelimited then
			if var2839 == 1 then
				local _ = nil
				local var2842, var2843 = protoModule.readBuffer(p141, var2834)
				var2834 = var2843
				var2833.event_id = buffer.tostring(var2842)
			else
				local _ = nil
				local var2844, var2845 = protoModule.readVarInt(p141, var2834)
				var2834 = var2845 + var2844
			end
		elseif var2835 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2846, var2847 = protoModule.readFixed32(p141, var2834)
			local _ = var2846
			var2834 = var2847
		elseif var2835 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2848, var2849 = protoModule.readFixed64(p141, var2834)
			local _ = var2848
			var2834 = var2849
		else
			error("Unsupported wire type: " .. var2835)
		end
	end
	return var2833
end

function t_70:jsonEncode() --[[ line: 16843 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_70:jsonDecode() --[[ line: 16853 ]]
	-- upvalues: t_70 (ref)
	local var2851 = t_70.new()
	
	if self.event_id ~= nil then
		var2851.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2851.event_id = self.eventId
	end
	return var2851
end

t_70.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_70
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p142) --[[ line: 16883 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p142 == nil or p142.event_id == nil then "" else p142.event_id,
		universe_id = if p142 == nil or p142.universe_id == nil then "" else p142.universe_id
	}, t_71)
end

function t_71:encode() --[[ line: 16892 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2853 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2854, var2855 = protoModule.writeTag(buff, var2853, 1, protoModule.wireTypes.lengthDelimited)
		var2854, var2855 = protoModule.writeString(var2854, var2855, self.event_id)
		buff = var2854
		var2853 = var2855
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2856, var2857 = protoModule.writeTag(buff, var2853, 2, protoModule.wireTypes.lengthDelimited)
		var2856, var2857 = protoModule.writeString(var2856, var2857, self.universe_id)
		buff = var2856
		var2853 = var2857
	end
	local buff_1 = buffer.create(var2853)
	buffer.copy(buff_1, 0, buff, 0, var2853)
	
	return buff_1
end

function t_71.decode(p143) --[[ line: 16911 ]]
	-- upvalues: t_71 (ref), protoModule (ref)
	local var2859 = t_71.new()
	local var2860 = 0
	while var2860 < buffer.len(p143) do
		local _ = nil
		local var2861 = nil
		local var2862, var2863, var2864 = protoModule.readTag(p143, var2860)
		local var2865 = var2862
		var2861 = var2863
		var2860 = var2864
		
		if var2861 == protoModule.wireTypes.varint then
			local _ = nil
			local var2866, var2867 = protoModule.readVarInt(p143, var2860)
			local _ = var2866
			var2860 = var2867
			continue
		end
		if var2861 == protoModule.wireTypes.lengthDelimited then
			if var2865 == 1 then
				local _ = nil
				local var2868, var2869 = protoModule.readBuffer(p143, var2860)
				var2860 = var2869
				var2859.event_id = buffer.tostring(var2868)
			elseif var2865 == 2 then
				local _ = nil
				local var2870, var2871 = protoModule.readBuffer(p143, var2860)
				var2860 = var2871
				var2859.universe_id = buffer.tostring(var2870)
			else
				local _ = nil
				local var2872, var2873 = protoModule.readVarInt(p143, var2860)
				var2860 = var2873 + var2872
			end
		elseif var2861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2874, var2875 = protoModule.readFixed32(p143, var2860)
			local _ = var2874
			var2860 = var2875
		elseif var2861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2876, var2877 = protoModule.readFixed64(p143, var2860)
			local _ = var2876
			var2860 = var2877
		else
			error("Unsupported wire type: " .. var2861)
		end
	end
	return var2859
end

function t_71:jsonEncode() --[[ line: 16959 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_71:jsonDecode() --[[ line: 16973 ]]
	-- upvalues: t_71 (ref)
	local var2879 = t_71.new()
	
	if self.event_id ~= nil then
		var2879.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2879.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2879.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2879.universe_id = self.universeId
	end
	return var2879
end

t_71.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_71
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p144) --[[ line: 17011 ]]
	-- upvalues: t_72 (ref)
	return setmetatable({
		entry_map = if p144 == nil or p144.entry_map == nil then {} else p144.entry_map,
		entry_order = if p144 == nil or p144.entry_order == nil then {} else p144.entry_order,
		next_page_token = if p144 == nil or p144.next_page_token == nil then "" else p144.next_page_token,
		sticky_filter_pills = if p144 == nil or p144.sticky_filter_pills == nil then nil else p144.sticky_filter_pills,
		applied_filters = if p144 == nil or p144.applied_filters == nil then "" else p144.applied_filters
	}, t_72)
end

function t_72:encode() --[[ line: 17023 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2881 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2882, var2883 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2882, var2883 = protoModule.writeString(var2882, var2883, i)
			local var2884 = v:encode()
			var2883, var2885 = protoModule.writeTag(var2882, var2883, 2, protoModule.wireTypes.lengthDelimited)
			var2883, var2885 = protoModule.writeBuffer(var2883, var2885, var2884, buffer.len(var2884))
			local var2886 = var2883
			local var2887 = var2885
			local var2888, var2889 = protoModule.writeTag(buff, var2881, 1, protoModule.wireTypes.lengthDelimited)
			var2888, var2889 = protoModule.writeBuffer(var2888, var2889, var2886, var2887)
			buff = var2888
			var2881 = var2889
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2890, var2891 = protoModule.writeTag(buff, var2881, 2, protoModule.wireTypes.lengthDelimited)
			var2890, var2891 = protoModule.writeString(var2890, var2891, v)
			buff = var2890
			var2881 = var2891
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2892, var2893 = protoModule.writeTag(buff, var2881, 3, protoModule.wireTypes.lengthDelimited)
		var2892, var2893 = protoModule.writeString(var2892, var2893, self.next_page_token)
		buff = var2892
		var2881 = var2893
	end
	if self.sticky_filter_pills ~= nil then
		local var2894 = self.sticky_filter_pills:encode()
		local var2895, var2896 = protoModule.writeTag(buff, var2881, 4, protoModule.wireTypes.lengthDelimited)
		var2895, var2896 = protoModule.writeBuffer(var2895, var2896, var2894, buffer.len(var2894))
		buff = var2895
		var2881 = var2896
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2897, var2898 = protoModule.writeTag(buff, var2881, 5, protoModule.wireTypes.lengthDelimited)
		var2897, var2898 = protoModule.writeString(var2897, var2898, self.applied_filters)
		buff = var2897
		var2881 = var2898
	end
	local buff_1 = buffer.create(var2881)
	buffer.copy(buff_1, 0, buff, 0, var2881)
	
	return buff_1
end

function t_72.decode(p145) --[[ line: 17069 ]]
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2900 = t_72.new()
	local var2901 = 0
	while var2901 < buffer.len(p145) do
		local _ = nil
		local var2902 = nil
		local var2903, var2904, var2905 = protoModule.readTag(p145, var2901)
		local var2906 = var2903
		var2902 = var2904
		var2901 = var2905
		
		if var2902 == protoModule.wireTypes.varint then
			local _ = nil
			local var2907, var2908 = protoModule.readVarInt(p145, var2901)
			local _ = var2907
			var2901 = var2908
			continue
		end
		if var2902 == protoModule.wireTypes.lengthDelimited then
			if var2906 == 1 then
				local _ = nil
				local var2909, var2910 = protoModule.readBuffer(p145, var2901)
				var2901 = var2910
				var2909 = t.ChartsFeedInputData_EntryMapEntry.decode(var2909)
				var2900.entry_map[var2909.key or ""] = var2909.value or t.FeedEntry.new()
			elseif var2906 == 2 then
				local _ = nil
				local var2911, var2912 = protoModule.readBuffer(p145, var2901)
				var2901 = var2912
				table.insert(var2900.entry_order, buffer.tostring(var2911))
			elseif var2906 == 3 then
				local _ = nil
				local var2913, var2914 = protoModule.readBuffer(p145, var2901)
				var2901 = var2914
				var2900.next_page_token = buffer.tostring(var2913)
			elseif var2906 == 4 then
				local _ = nil
				local var2915, var2916 = protoModule.readBuffer(p145, var2901)
				var2901 = var2916
				var2900.sticky_filter_pills = t.FilterPillsInputData.decode(var2915)
			elseif var2906 == 5 then
				local _ = nil
				local var2917, var2918 = protoModule.readBuffer(p145, var2901)
				var2901 = var2918
				var2900.applied_filters = buffer.tostring(var2917)
			else
				local _ = nil
				local var2919, var2920 = protoModule.readVarInt(p145, var2901)
				var2901 = var2920 + var2919
			end
		elseif var2902 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2921, var2922 = protoModule.readFixed32(p145, var2901)
			local _ = var2921
			var2901 = var2922
		elseif var2902 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2923, var2924 = protoModule.readFixed64(p145, var2901)
			local _ = var2923
			var2901 = var2924
		else
			error("Unsupported wire type: " .. var2902)
		end
	end
	return var2900
end

function t_72:jsonEncode() --[[ line: 17139 ]]
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		t.nextPageToken = self.next_page_token
	end
	if self.sticky_filter_pills ~= nil then
		t.stickyFilterPills = self.sticky_filter_pills:jsonEncode()
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function t_72:jsonDecode() --[[ line: 17173 ]]
	-- upvalues: t_72 (ref), t (ref)
	local var2928 = t_72.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2928.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2928.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2928.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2928.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2928.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2928.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2928.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2928.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2928.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2928.applied_filters = self.appliedFilters
	end
	return var2928
end

t_72.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_72
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p146) --[[ line: 17253 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		key = if p146 == nil or p146.key == nil then "" else p146.key,
		value = if p146 == nil or p146.value == nil then nil else p146.value
	}, t_73)
end

function t_73:encode() --[[ line: 17262 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2934 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2935, var2936 = protoModule.writeTag(buff, var2934, 1, protoModule.wireTypes.lengthDelimited)
		var2935, var2936 = protoModule.writeString(var2935, var2936, self.key)
		buff = var2935
		var2934 = var2936
	end
	if self.value ~= nil then
		local var2937 = self.value:encode()
		local var2938, var2939 = protoModule.writeTag(buff, var2934, 2, protoModule.wireTypes.lengthDelimited)
		var2938, var2939 = protoModule.writeBuffer(var2938, var2939, var2937, buffer.len(var2937))
		buff = var2938
		var2934 = var2939
	end
	local buff_1 = buffer.create(var2934)
	buffer.copy(buff_1, 0, buff, 0, var2934)
	
	return buff_1
end

function t_73.decode(p147) --[[ line: 17282 ]]
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2941 = t_73.new()
	local var2942 = 0
	while var2942 < buffer.len(p147) do
		local _ = nil
		local var2943 = nil
		local var2944, var2945, var2946 = protoModule.readTag(p147, var2942)
		local var2947 = var2944
		var2943 = var2945
		var2942 = var2946
		
		if var2943 == protoModule.wireTypes.varint then
			local _ = nil
			local var2948, var2949 = protoModule.readVarInt(p147, var2942)
			local _ = var2948
			var2942 = var2949
			continue
		end
		if var2943 == protoModule.wireTypes.lengthDelimited then
			if var2947 == 1 then
				local _ = nil
				local var2950, var2951 = protoModule.readBuffer(p147, var2942)
				var2942 = var2951
				var2941.key = buffer.tostring(var2950)
			elseif var2947 == 2 then
				local _ = nil
				local var2952, var2953 = protoModule.readBuffer(p147, var2942)
				var2942 = var2953
				var2941.value = t.FeedEntry.decode(var2952)
			else
				local _ = nil
				local var2954, var2955 = protoModule.readVarInt(p147, var2942)
				var2942 = var2955 + var2954
			end
		elseif var2943 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2956, var2957 = protoModule.readFixed32(p147, var2942)
			local _ = var2956
			var2942 = var2957
		elseif var2943 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2958, var2959 = protoModule.readFixed64(p147, var2942)
			local _ = var2958
			var2942 = var2959
		else
			error("Unsupported wire type: " .. var2943)
		end
	end
	return var2941
end

function t_73:jsonEncode() --[[ line: 17330 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_73:jsonDecode() --[[ line: 17344 ]]
	-- upvalues: t_73 (ref), t (ref)
	local var2961 = t_73.new()
	
	if self.key ~= nil then
		var2961.key = self.key
	end
	if self.value ~= nil then
		var2961.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2961
end

t_73.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_73
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p148) --[[ line: 17374 ]]
	-- upvalues: t_74 (ref)
	return setmetatable({
		filter_groups = if p148 == nil or p148.filter_groups == nil then {} else p148.filter_groups,
		sort_id = if p148 == nil or p148.sort_id == nil then "" else p148.sort_id,
		secondary_sort_id = if p148 == nil or p148.secondary_sort_id == nil then 0 else p148.secondary_sort_id,
		title = if p148 == nil or p148.title == nil then "" else p148.title,
		primary_sort_id = if p148 == nil or p148.primary_sort_id == nil then nil else p148.primary_sort_id,
		applied_filters = if p148 == nil or p148.applied_filters == nil then nil else p148.applied_filters
	}, t_74)
end

function t_74:encode() --[[ line: 17385 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2963 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2964 = v:encode()
			local var2965, var2966 = protoModule.writeTag(buff, var2963, 1, protoModule.wireTypes.lengthDelimited)
			var2965, var2966 = protoModule.writeBuffer(var2965, var2966, var2964, buffer.len(var2964))
			buff = var2965
			var2963 = var2966
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2967, var2968 = protoModule.writeTag(buff, var2963, 2, protoModule.wireTypes.lengthDelimited)
		var2967, var2968 = protoModule.writeString(var2967, var2968, self.sort_id)
		buff = var2967
		var2963 = var2968
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2969, var2970 = protoModule.writeTag(buff, var2963, 3, protoModule.wireTypes.varint)
		var2969, var2970 = protoModule.writeVarInt(var2969, var2970, self.secondary_sort_id)
		buff = var2969
		var2963 = var2970
	end
	if self.title ~= nil and self.title ~= "" then
		local var2971, var2972 = protoModule.writeTag(buff, var2963, 4, protoModule.wireTypes.lengthDelimited)
		var2971, var2972 = protoModule.writeString(var2971, var2972, self.title)
		buff = var2971
		var2963 = var2972
	end
	if self.primary_sort_id ~= nil then
		local var2973, var2974 = protoModule.writeTag(buff, var2963, 5, protoModule.wireTypes.varint)
		var2973, var2974 = protoModule.writeVarInt(var2973, var2974, self.primary_sort_id)
		buff = var2973
		var2963 = var2974
	end
	if self.applied_filters ~= nil then
		local var2975, var2976 = protoModule.writeTag(buff, var2963, 6, protoModule.wireTypes.lengthDelimited)
		var2975, var2976 = protoModule.writeString(var2975, var2976, self.applied_filters)
		buff = var2975
		var2963 = var2976
	end
	local buff_1 = buffer.create(var2963)
	buffer.copy(buff_1, 0, buff, 0, var2963)
	
	return buff_1
end

function t_74.decode(p149) --[[ line: 17427 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2978 = t_74.new()
	local var2979 = 0
	while var2979 < buffer.len(p149) do
		local _ = nil
		local var2980 = nil
		local var2981, var2982, var2983 = protoModule.readTag(p149, var2979)
		local var2984 = var2981
		var2980 = var2982
		var2979 = var2983
		
		if var2980 == protoModule.wireTypes.varint then
			if var2984 == 3 then
				local _ = nil
				local var2985, var2986 = protoModule.readVarIntI32(p149, var2979)
				var2979 = var2986
				var2978.secondary_sort_id = var2985
			elseif var2984 == 5 then
				local _ = nil
				local var2987, var2988 = protoModule.readVarIntI32(p149, var2979)
				var2979 = var2988
				var2978.primary_sort_id = var2987
			else
				local _ = nil
				local var2989, var2990 = protoModule.readVarInt(p149, var2979)
				local _ = var2989
				var2979 = var2990
			end
		end
		if var2980 == protoModule.wireTypes.lengthDelimited then
			if var2984 == 1 then
				local _ = nil
				local var2991, var2992 = protoModule.readBuffer(p149, var2979)
				var2979 = var2992
				table.insert(var2978.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2991))
			elseif var2984 == 2 then
				local _ = nil
				local var2993, var2994 = protoModule.readBuffer(p149, var2979)
				var2979 = var2994
				var2978.sort_id = buffer.tostring(var2993)
			elseif var2984 == 4 then
				local _ = nil
				local var2995, var2996 = protoModule.readBuffer(p149, var2979)
				var2979 = var2996
				var2978.title = buffer.tostring(var2995)
			elseif var2984 == 6 then
				local _ = nil
				local var2997, var2998 = protoModule.readBuffer(p149, var2979)
				var2979 = var2998
				var2978.applied_filters = buffer.tostring(var2997)
			else
				local _ = nil
				local var2999, var3000 = protoModule.readVarInt(p149, var2979)
				var2979 = var3000 + var2999
			end
		elseif var2980 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3001, var3002 = protoModule.readFixed32(p149, var2979)
			local _ = var3001
			var2979 = var3002
		elseif var2980 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3003, var3004 = protoModule.readFixed64(p149, var2979)
			local _ = var3003
			var2979 = var3004
		else
			error("Unsupported wire type: " .. var2980)
		end
	end
	return var2978
end

function t_74:jsonEncode() --[[ line: 17495 ]]
	local t = {}
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, v:jsonEncode())
		end
		t.filterGroups = t_1
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		t.secondarySortId = self.secondary_sort_id
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.primary_sort_id ~= nil then
		t.primarySortId = self.primary_sort_id
	end
	if self.applied_filters ~= nil then
		t.appliedFilters = self.applied_filters
	end
	return t
end

function t_74:jsonDecode() --[[ line: 17529 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var3007 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var3007.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var3007.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var3007.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3007.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var3007.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var3007.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var3007.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var3007.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var3007.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var3007.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var3007.applied_filters = self.appliedFilters
	end
	return var3007
end

t_74.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_74
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p150) --[[ line: 17603 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		filter_id = if p150 == nil or p150.filter_id == nil then "" else p150.filter_id,
		display_name = if p150 == nil or p150.display_name == nil then "" else p150.display_name,
		options = if p150 == nil or p150.options == nil then {} else p150.options,
		default_option_id = if p150 == nil or p150.default_option_id == nil then "" else p150.default_option_id,
		selected_option_id = if p150 == nil or p150.selected_option_id == nil then "" else p150.selected_option_id,
		filter_type = if p150 == nil or p150.filter_type == nil then "" else p150.filter_type,
		inactive_option_ids = if p150 == nil or p150.inactive_option_ids == nil then {} else p150.inactive_option_ids,
		info_text = if p150 == nil or p150.info_text == nil then "" else p150.info_text
	}, t_75)
end

function t_75:encode() --[[ line: 17620 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3011 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var3012, var3013 = protoModule.writeTag(buff, var3011, 1, protoModule.wireTypes.lengthDelimited)
		var3012, var3013 = protoModule.writeString(var3012, var3013, self.filter_id)
		buff = var3012
		var3011 = var3013
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3014, var3015 = protoModule.writeTag(buff, var3011, 2, protoModule.wireTypes.lengthDelimited)
		var3014, var3015 = protoModule.writeString(var3014, var3015, self.display_name)
		buff = var3014
		var3011 = var3015
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3016 = v:encode()
			local var3017, var3018 = protoModule.writeTag(buff, var3011, 3, protoModule.wireTypes.lengthDelimited)
			var3017, var3018 = protoModule.writeBuffer(var3017, var3018, var3016, buffer.len(var3016))
			buff = var3017
			var3011 = var3018
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var3019, var3020 = protoModule.writeTag(buff, var3011, 4, protoModule.wireTypes.lengthDelimited)
		var3019, var3020 = protoModule.writeString(var3019, var3020, self.default_option_id)
		buff = var3019
		var3011 = var3020
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var3021, var3022 = protoModule.writeTag(buff, var3011, 5, protoModule.wireTypes.lengthDelimited)
		var3021, var3022 = protoModule.writeString(var3021, var3022, self.selected_option_id)
		buff = var3021
		var3011 = var3022
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var3023, var3024 = protoModule.writeTag(buff, var3011, 6, protoModule.wireTypes.lengthDelimited)
		var3023, var3024 = protoModule.writeString(var3023, var3024, self.filter_type)
		buff = var3023
		var3011 = var3024
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var3025, var3026 = protoModule.writeTag(buff, var3011, 7, protoModule.wireTypes.lengthDelimited)
			var3025, var3026 = protoModule.writeString(var3025, var3026, v)
			buff = var3025
			var3011 = var3026
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var3027, var3028 = protoModule.writeTag(buff, var3011, 8, protoModule.wireTypes.lengthDelimited)
		var3027, var3028 = protoModule.writeString(var3027, var3028, self.info_text)
		buff = var3027
		var3011 = var3028
	end
	local buff_1 = buffer.create(var3011)
	buffer.copy(buff_1, 0, buff, 0, var3011)
	
	return buff_1
end

function t_75.decode(p151) --[[ line: 17674 ]]
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var3030 = t_75.new()
	local var3031 = 0
	while var3031 < buffer.len(p151) do
		local _ = nil
		local var3032 = nil
		local var3033, var3034, var3035 = protoModule.readTag(p151, var3031)
		local var3036 = var3033
		var3032 = var3034
		var3031 = var3035
		
		if var3032 == protoModule.wireTypes.varint then
			local _ = nil
			local var3037, var3038 = protoModule.readVarInt(p151, var3031)
			local _ = var3037
			var3031 = var3038
			continue
		end
		if var3032 == protoModule.wireTypes.lengthDelimited then
			if var3036 == 1 then
				local _ = nil
				local var3039, var3040 = protoModule.readBuffer(p151, var3031)
				var3031 = var3040
				var3030.filter_id = buffer.tostring(var3039)
			elseif var3036 == 2 then
				local _ = nil
				local var3041, var3042 = protoModule.readBuffer(p151, var3031)
				var3031 = var3042
				var3030.display_name = buffer.tostring(var3041)
			elseif var3036 == 3 then
				local _ = nil
				local var3043, var3044 = protoModule.readBuffer(p151, var3031)
				var3031 = var3044
				table.insert(var3030.options, t.FilterPillsInputData_FilterOption.decode(var3043))
			elseif var3036 == 4 then
				local _ = nil
				local var3045, var3046 = protoModule.readBuffer(p151, var3031)
				var3031 = var3046
				var3030.default_option_id = buffer.tostring(var3045)
			elseif var3036 == 5 then
				local _ = nil
				local var3047, var3048 = protoModule.readBuffer(p151, var3031)
				var3031 = var3048
				var3030.selected_option_id = buffer.tostring(var3047)
			elseif var3036 == 6 then
				local _ = nil
				local var3049, var3050 = protoModule.readBuffer(p151, var3031)
				var3031 = var3050
				var3030.filter_type = buffer.tostring(var3049)
			elseif var3036 == 7 then
				local _ = nil
				local var3051, var3052 = protoModule.readBuffer(p151, var3031)
				var3031 = var3052
				table.insert(var3030.inactive_option_ids, buffer.tostring(var3051))
			elseif var3036 == 8 then
				local _ = nil
				local var3053, var3054 = protoModule.readBuffer(p151, var3031)
				var3031 = var3054
				var3030.info_text = buffer.tostring(var3053)
			else
				local _ = nil
				local var3055, var3056 = protoModule.readVarInt(p151, var3031)
				var3031 = var3056 + var3055
			end
		elseif var3032 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3057, var3058 = protoModule.readFixed32(p151, var3031)
			local _ = var3057
			var3031 = var3058
		elseif var3032 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3059, var3060 = protoModule.readFixed64(p151, var3031)
			local _ = var3059
			var3031 = var3060
		else
			error("Unsupported wire type: " .. var3032)
		end
	end
	return var3030
end

function t_75:jsonEncode() --[[ line: 17752 ]]
	local t = {}
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		t.filterId = self.filter_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		t.defaultOptionId = self.default_option_id
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		t.selectedOptionId = self.selected_option_id
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		t.filterType = self.filter_type
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		t.inactiveOptionIds = t_1
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		t.infoText = self.info_text
	end
	return t
end

function t_75:jsonDecode() --[[ line: 17798 ]]
	-- upvalues: t_75 (ref), t (ref)
	local var3064 = t_75.new()
	
	if self.filter_id ~= nil then
		var3064.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var3064.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var3064.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3064.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var3064.options = t_1
	end
	if self.default_option_id ~= nil then
		var3064.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var3064.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var3064.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var3064.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var3064.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var3064.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var3064.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var3064.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var3064.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var3064.info_text = self.infoText
	end
	return var3064
end

t_75.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_75
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p152) --[[ line: 17895 ]]
	-- upvalues: t_76 (ref)
	return setmetatable({
		option_id = if p152 == nil or p152.option_id == nil then "" else p152.option_id,
		display_name = if p152 == nil or p152.display_name == nil then "" else p152.display_name,
		option_context_tag = if p152 == nil or p152.option_context_tag == nil then "" else p152.option_context_tag
	}, t_76)
end

function t_76:encode() --[[ line: 17905 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3069 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var3070, var3071 = protoModule.writeTag(buff, var3069, 1, protoModule.wireTypes.lengthDelimited)
		var3070, var3071 = protoModule.writeString(var3070, var3071, self.option_id)
		buff = var3070
		var3069 = var3071
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3072, var3073 = protoModule.writeTag(buff, var3069, 2, protoModule.wireTypes.lengthDelimited)
		var3072, var3073 = protoModule.writeString(var3072, var3073, self.display_name)
		buff = var3072
		var3069 = var3073
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var3074, var3075 = protoModule.writeTag(buff, var3069, 3, protoModule.wireTypes.lengthDelimited)
		var3074, var3075 = protoModule.writeString(var3074, var3075, self.option_context_tag)
		buff = var3074
		var3069 = var3075
	end
	local buff_1 = buffer.create(var3069)
	buffer.copy(buff_1, 0, buff, 0, var3069)
	
	return buff_1
end

function t_76.decode(p153) --[[ line: 17929 ]]
	-- upvalues: t_76 (ref), protoModule (ref)
	local var3077 = t_76.new()
	local var3078 = 0
	while var3078 < buffer.len(p153) do
		local _ = nil
		local var3079 = nil
		local var3080, var3081, var3082 = protoModule.readTag(p153, var3078)
		local var3083 = var3080
		var3079 = var3081
		var3078 = var3082
		
		if var3079 == protoModule.wireTypes.varint then
			local _ = nil
			local var3084, var3085 = protoModule.readVarInt(p153, var3078)
			local _ = var3084
			var3078 = var3085
			continue
		end
		if var3079 == protoModule.wireTypes.lengthDelimited then
			if var3083 == 1 then
				local _ = nil
				local var3086, var3087 = protoModule.readBuffer(p153, var3078)
				var3078 = var3087
				var3077.option_id = buffer.tostring(var3086)
			elseif var3083 == 2 then
				local _ = nil
				local var3088, var3089 = protoModule.readBuffer(p153, var3078)
				var3078 = var3089
				var3077.display_name = buffer.tostring(var3088)
			elseif var3083 == 3 then
				local _ = nil
				local var3090, var3091 = protoModule.readBuffer(p153, var3078)
				var3078 = var3091
				var3077.option_context_tag = buffer.tostring(var3090)
			else
				local _ = nil
				local var3092, var3093 = protoModule.readVarInt(p153, var3078)
				var3078 = var3093 + var3092
			end
		elseif var3079 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3094, var3095 = protoModule.readFixed32(p153, var3078)
			local _ = var3094
			var3078 = var3095
		elseif var3079 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3096, var3097 = protoModule.readFixed64(p153, var3078)
			local _ = var3096
			var3078 = var3097
		else
			error("Unsupported wire type: " .. var3079)
		end
	end
	return var3077
end

function t_76:jsonEncode() --[[ line: 17982 ]]
	local t = {}
	
	if self.option_id ~= nil and self.option_id ~= "" then
		t.optionId = self.option_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		t.optionContextTag = self.option_context_tag
	end
	return t
end

function t_76:jsonDecode() --[[ line: 18000 ]]
	-- upvalues: t_76 (ref)
	local var3099 = t_76.new()
	
	if self.option_id ~= nil then
		var3099.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var3099.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var3099.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3099.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var3099.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var3099.option_context_tag = self.optionContextTag
	end
	return var3099
end

t_76.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_76
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p154) --[[ line: 18046 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		sort_options = if p154 == nil or p154.sort_options == nil then {} else p154.sort_options,
		selected_sort_id = if p154 == nil or p154.selected_sort_id == nil then "" else p154.selected_sort_id
	}, t_77)
end

function t_77:encode() --[[ line: 18053 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3101 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var3102 = v:encode()
			local var3103, var3104 = protoModule.writeTag(buff, var3101, 1, protoModule.wireTypes.lengthDelimited)
			var3103, var3104 = protoModule.writeBuffer(var3103, var3104, var3102, buffer.len(var3102))
			buff = var3103
			var3101 = var3104
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var3105, var3106 = protoModule.writeTag(buff, var3101, 2, protoModule.wireTypes.lengthDelimited)
		var3105, var3106 = protoModule.writeString(var3105, var3106, self.selected_sort_id)
		buff = var3105
		var3101 = var3106
	end
	local buff_1 = buffer.create(var3101)
	buffer.copy(buff_1, 0, buff, 0, var3101)
	
	return buff_1
end

function t_77.decode(p155) --[[ line: 18075 ]]
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var3108 = t_77.new()
	local var3109 = 0
	while var3109 < buffer.len(p155) do
		local _ = nil
		local var3110 = nil
		local var3111, var3112, var3113 = protoModule.readTag(p155, var3109)
		local var3114 = var3111
		var3110 = var3112
		var3109 = var3113
		
		if var3110 == protoModule.wireTypes.varint then
			local _ = nil
			local var3115, var3116 = protoModule.readVarInt(p155, var3109)
			local _ = var3115
			var3109 = var3116
			continue
		end
		if var3110 == protoModule.wireTypes.lengthDelimited then
			if var3114 == 1 then
				local _ = nil
				local var3117, var3118 = protoModule.readBuffer(p155, var3109)
				var3109 = var3118
				table.insert(var3108.sort_options, t.SortSelectorInputData_SortOption.decode(var3117))
			elseif var3114 == 2 then
				local _ = nil
				local var3119, var3120 = protoModule.readBuffer(p155, var3109)
				var3109 = var3120
				var3108.selected_sort_id = buffer.tostring(var3119)
			else
				local _ = nil
				local var3121, var3122 = protoModule.readVarInt(p155, var3109)
				var3109 = var3122 + var3121
			end
		elseif var3110 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3123, var3124 = protoModule.readFixed32(p155, var3109)
			local _ = var3123
			var3109 = var3124
		elseif var3110 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3125, var3126 = protoModule.readFixed64(p155, var3109)
			local _ = var3125
			var3109 = var3126
		else
			error("Unsupported wire type: " .. var3110)
		end
	end
	return var3108
end

function t_77:jsonEncode() --[[ line: 18123 ]]
	local t = {}
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, v:jsonEncode())
		end
		t.sortOptions = t_1
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		t.selectedSortId = self.selected_sort_id
	end
	return t
end

function t_77:jsonDecode() --[[ line: 18141 ]]
	-- upvalues: t_77 (ref), t (ref)
	local var3129 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3129.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3129.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var3129.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var3129.selected_sort_id = self.selectedSortId
	end
	return var3129
end

t_77.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_77
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p156) --[[ line: 18187 ]]
	-- upvalues: t_78 (ref)
	return setmetatable({
		sort_id = if p156 == nil or p156.sort_id == nil then "" else p156.sort_id,
		display_name = if p156 == nil or p156.display_name == nil then "" else p156.display_name,
		content_type = if p156 == nil or p156.content_type == nil then "" else p156.content_type
	}, t_78)
end

function t_78:encode() --[[ line: 18197 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3133 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3134, var3135 = protoModule.writeTag(buff, var3133, 1, protoModule.wireTypes.lengthDelimited)
		var3134, var3135 = protoModule.writeString(var3134, var3135, self.sort_id)
		buff = var3134
		var3133 = var3135
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3136, var3137 = protoModule.writeTag(buff, var3133, 2, protoModule.wireTypes.lengthDelimited)
		var3136, var3137 = protoModule.writeString(var3136, var3137, self.display_name)
		buff = var3136
		var3133 = var3137
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var3138, var3139 = protoModule.writeTag(buff, var3133, 3, protoModule.wireTypes.lengthDelimited)
		var3138, var3139 = protoModule.writeString(var3138, var3139, self.content_type)
		buff = var3138
		var3133 = var3139
	end
	local buff_1 = buffer.create(var3133)
	buffer.copy(buff_1, 0, buff, 0, var3133)
	
	return buff_1
end

function t_78.decode(p157) --[[ line: 18221 ]]
	-- upvalues: t_78 (ref), protoModule (ref)
	local var3141 = t_78.new()
	local var3142 = 0
	while var3142 < buffer.len(p157) do
		local _ = nil
		local var3143 = nil
		local var3144, var3145, var3146 = protoModule.readTag(p157, var3142)
		local var3147 = var3144
		var3143 = var3145
		var3142 = var3146
		
		if var3143 == protoModule.wireTypes.varint then
			local _ = nil
			local var3148, var3149 = protoModule.readVarInt(p157, var3142)
			local _ = var3148
			var3142 = var3149
			continue
		end
		if var3143 == protoModule.wireTypes.lengthDelimited then
			if var3147 == 1 then
				local _ = nil
				local var3150, var3151 = protoModule.readBuffer(p157, var3142)
				var3142 = var3151
				var3141.sort_id = buffer.tostring(var3150)
			elseif var3147 == 2 then
				local _ = nil
				local var3152, var3153 = protoModule.readBuffer(p157, var3142)
				var3142 = var3153
				var3141.display_name = buffer.tostring(var3152)
			elseif var3147 == 3 then
				local _ = nil
				local var3154, var3155 = protoModule.readBuffer(p157, var3142)
				var3142 = var3155
				var3141.content_type = buffer.tostring(var3154)
			else
				local _ = nil
				local var3156, var3157 = protoModule.readVarInt(p157, var3142)
				var3142 = var3157 + var3156
			end
		elseif var3143 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3158, var3159 = protoModule.readFixed32(p157, var3142)
			local _ = var3158
			var3142 = var3159
		elseif var3143 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3160, var3161 = protoModule.readFixed64(p157, var3142)
			local _ = var3160
			var3142 = var3161
		else
			error("Unsupported wire type: " .. var3143)
		end
	end
	return var3141
end

function t_78:jsonEncode() --[[ line: 18274 ]]
	local t = {}
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		t.contentType = self.content_type
	end
	return t
end

function t_78:jsonDecode() --[[ line: 18292 ]]
	-- upvalues: t_78 (ref)
	local var3163 = t_78.new()
	
	if self.sort_id ~= nil then
		var3163.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3163.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var3163.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3163.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var3163.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var3163.content_type = self.contentType
	end
	return var3163
end

t_78.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_78
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p158) --[[ line: 18338 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		selected_option = if p158 == nil or p158.selected_option == nil then "" else p158.selected_option,
		options = if p158 == nil or p158.options == nil then {} else p158.options,
		experience_carousel = if p158 == nil or p158.experience_carousel == nil then nil else p158.experience_carousel
	}, t_79)
end

function t_79:encode() --[[ line: 18350 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3165 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3166, var3167 = protoModule.writeTag(buff, var3165, 1, protoModule.wireTypes.lengthDelimited)
		var3166, var3167 = protoModule.writeString(var3166, var3167, self.selected_option)
		buff = var3166
		var3165 = var3167
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3168 = v:encode()
			local var3169, var3170 = protoModule.writeTag(buff, var3165, 2, protoModule.wireTypes.lengthDelimited)
			var3169, var3170 = protoModule.writeBuffer(var3169, var3170, var3168, buffer.len(var3168))
			buff = var3169
			var3165 = var3170
		end
	end
	if self.experience_carousel ~= nil then
		local var3171 = self.experience_carousel:encode()
		local var3172, var3173 = protoModule.writeTag(buff, var3165, 3, protoModule.wireTypes.lengthDelimited)
		var3172, var3173 = protoModule.writeBuffer(var3172, var3173, var3171, buffer.len(var3171))
		buff = var3172
		var3165 = var3173
	end
	local buff_1 = buffer.create(var3165)
	buffer.copy(buff_1, 0, buff, 0, var3165)
	
	return buff_1
end

function t_79.decode(p159) --[[ line: 18378 ]]
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var3175 = t_79.new()
	local var3176 = 0
	while var3176 < buffer.len(p159) do
		local _ = nil
		local var3177 = nil
		local var3178, var3179, var3180 = protoModule.readTag(p159, var3176)
		local var3181 = var3178
		var3177 = var3179
		var3176 = var3180
		
		if var3177 == protoModule.wireTypes.varint then
			local _ = nil
			local var3182, var3183 = protoModule.readVarInt(p159, var3176)
			local _ = var3182
			var3176 = var3183
			continue
		end
		if var3177 == protoModule.wireTypes.lengthDelimited then
			if var3181 == 1 then
				local _ = nil
				local var3184, var3185 = protoModule.readBuffer(p159, var3176)
				var3176 = var3185
				var3175.selected_option = buffer.tostring(var3184)
			elseif var3181 == 2 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p159, var3176)
				var3176 = var3187
				table.insert(var3175.options, t.SelectorOption.decode(var3186))
			elseif var3181 == 3 then
				local _ = nil
				local var3188, var3189 = protoModule.readBuffer(p159, var3176)
				var3176 = var3189
				var3175.experience_carousel = t.ExperienceCarouselInputData.decode(var3188)
			else
				local _ = nil
				local var3190, var3191 = protoModule.readVarInt(p159, var3176)
				var3176 = var3191 + var3190
			end
		elseif var3177 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3192, var3193 = protoModule.readFixed32(p159, var3176)
			local _ = var3192
			var3176 = var3193
		elseif var3177 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3194, var3195 = protoModule.readFixed64(p159, var3176)
			local _ = var3194
			var3176 = var3195
		else
			error("Unsupported wire type: " .. var3177)
		end
	end
	return var3175
end

function t_79:jsonEncode() --[[ line: 18431 ]]
	local t = {}
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		t.selectedOption = self.selected_option
	end
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	if self.experience_carousel ~= nil then
		t.experienceCarousel = self.experience_carousel:jsonEncode()
	end
	return t
end

function t_79:jsonDecode() --[[ line: 18453 ]]
	-- upvalues: t_79 (ref), t (ref)
	local var3198 = t_79.new()
	
	if self.selected_option ~= nil then
		var3198.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3198.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3198.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3198.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3198.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var3198
end

t_79.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_79
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p160) --[[ line: 18498 ]]
	-- upvalues: t_80 (ref)
	return setmetatable({
		id = if p160 == nil or p160.id == nil then "" else p160.id,
		preview_rows = if p160 == nil or p160.preview_rows == nil then 0 else p160.preview_rows,
		widget_style = if p160 == nil or p160.widget_style == nil then nil else p160.widget_style,
		see_all_button = if p160 == nil or p160.see_all_button == nil then false else p160.see_all_button,
		information_popover_text = if p160 == nil or p160.information_popover_text == nil then "" else p160.information_popover_text
	}, t_80)
end

function t_80:encode() --[[ line: 18512 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3201 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3202, var3203 = protoModule.writeTag(buff, var3201, 1, protoModule.wireTypes.lengthDelimited)
		var3202, var3203 = protoModule.writeString(var3202, var3203, self.id)
		buff = var3202
		var3201 = var3203
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var3204, var3205 = protoModule.writeTag(buff, var3201, 4, protoModule.wireTypes.varint)
		var3204, var3205 = protoModule.writeVarInt(var3204, var3205, self.preview_rows)
		buff = var3204
		var3201 = var3205
	end
	if self.widget_style ~= nil then
		local var3206 = self.widget_style:encode()
		local var3207, var3208 = protoModule.writeTag(buff, var3201, 3, protoModule.wireTypes.lengthDelimited)
		var3207, var3208 = protoModule.writeBuffer(var3207, var3208, var3206, buffer.len(var3206))
		buff = var3207
		var3201 = var3208
	end
	if self.see_all_button then
		local var3209, var3210 = protoModule.writeTag(buff, var3201, 5, protoModule.wireTypes.varint)
		var3209, var3210 = protoModule.writeVarInt(var3209, var3210, if self.see_all_button then 1 else 0)
		buff = var3209
		var3201 = var3210
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3211, var3212 = protoModule.writeTag(buff, var3201, 6, protoModule.wireTypes.lengthDelimited)
		var3211, var3212 = protoModule.writeString(var3211, var3212, self.information_popover_text)
		buff = var3211
		var3201 = var3212
	end
	local buff_1 = buffer.create(var3201)
	buffer.copy(buff_1, 0, buff, 0, var3201)
	
	return buff_1
end

function t_80.decode(p161) --[[ line: 18547 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var3214 = t_80.new()
	local var3215 = 0
	while var3215 < buffer.len(p161) do
		local _ = nil
		local var3216 = nil
		local var3217, var3218, var3219 = protoModule.readTag(p161, var3215)
		local var3220 = var3217
		var3216 = var3218
		var3215 = var3219
		
		if var3216 == protoModule.wireTypes.varint then
			if var3220 == 4 then
				local _ = nil
				local var3221, var3222 = protoModule.readVarIntI64(p161, var3215)
				var3215 = var3222
				var3214.preview_rows = var3221
			elseif var3220 == 5 then
				local _ = nil
				local var3223, var3224 = protoModule.readVarInt(p161, var3215)
				var3215 = var3224
				var3214.see_all_button = var3223 ~= 0
			else
				local _ = nil
				local var3225, var3226 = protoModule.readVarInt(p161, var3215)
				local _ = var3225
				var3215 = var3226
			end
		end
		if var3216 == protoModule.wireTypes.lengthDelimited then
			if var3220 == 1 then
				local _ = nil
				local var3227, var3228 = protoModule.readBuffer(p161, var3215)
				var3215 = var3228
				var3214.id = buffer.tostring(var3227)
			elseif var3220 == 3 then
				local _ = nil
				local var3229, var3230 = protoModule.readBuffer(p161, var3215)
				var3215 = var3230
				var3214.widget_style = t.WidgetStyleData.decode(var3229)
			elseif var3220 == 6 then
				local _ = nil
				local var3231, var3232 = protoModule.readBuffer(p161, var3215)
				var3215 = var3232
				var3214.information_popover_text = buffer.tostring(var3231)
			else
				local _ = nil
				local var3233, var3234 = protoModule.readVarInt(p161, var3215)
				var3215 = var3234 + var3233
			end
		elseif var3216 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3235, var3236 = protoModule.readFixed32(p161, var3215)
			local _ = var3235
			var3215 = var3236
		elseif var3216 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3237, var3238 = protoModule.readFixed64(p161, var3215)
			local _ = var3237
			var3215 = var3238
		else
			error("Unsupported wire type: " .. var3216)
		end
	end
	return var3214
end

function t_80:jsonEncode() --[[ line: 18610 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		t.previewRows = self.preview_rows
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	if self.see_all_button then
		t.seeAllButton = self.see_all_button
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		t.informationPopoverText = self.information_popover_text
	end
	return t
end

function t_80:jsonDecode() --[[ line: 18636 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var3240 = t_80.new()
	
	if self.id ~= nil then
		var3240.id = self.id
	end
	if self.preview_rows ~= nil then
		var3240.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var3240.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var3240.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3240.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3240.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3240.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3240.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3240.information_popover_text = self.informationPopoverText
	end
	return var3240
end

t_80.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p162) --[[ line: 18694 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		id = if p162 == nil or p162.id == nil then "" else p162.id,
		num_items_to_show = if p162 == nil or p162.num_items_to_show == nil then 0 else p162.num_items_to_show,
		widget_style = if p162 == nil or p162.widget_style == nil then nil else p162.widget_style,
		see_all_button = if p162 == nil or p162.see_all_button == nil then false else p162.see_all_button,
		information_popover_text = if p162 == nil or p162.information_popover_text == nil then "" else p162.information_popover_text
	}, t_81)
end

function t_81:encode() --[[ line: 18708 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3242 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3243, var3244 = protoModule.writeTag(buff, var3242, 1, protoModule.wireTypes.lengthDelimited)
		var3243, var3244 = protoModule.writeString(var3243, var3244, self.id)
		buff = var3243
		var3242 = var3244
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var3245, var3246 = protoModule.writeTag(buff, var3242, 5, protoModule.wireTypes.varint)
		var3245, var3246 = protoModule.writeVarInt(var3245, var3246, self.num_items_to_show)
		buff = var3245
		var3242 = var3246
	end
	if self.widget_style ~= nil then
		local var3247 = self.widget_style:encode()
		local var3248, var3249 = protoModule.writeTag(buff, var3242, 3, protoModule.wireTypes.lengthDelimited)
		var3248, var3249 = protoModule.writeBuffer(var3248, var3249, var3247, buffer.len(var3247))
		buff = var3248
		var3242 = var3249
	end
	if self.see_all_button then
		local var3250, var3251 = protoModule.writeTag(buff, var3242, 6, protoModule.wireTypes.varint)
		var3250, var3251 = protoModule.writeVarInt(var3250, var3251, if self.see_all_button then 1 else 0)
		buff = var3250
		var3242 = var3251
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3252, var3253 = protoModule.writeTag(buff, var3242, 7, protoModule.wireTypes.lengthDelimited)
		var3252, var3253 = protoModule.writeString(var3252, var3253, self.information_popover_text)
		buff = var3252
		var3242 = var3253
	end
	local buff_1 = buffer.create(var3242)
	buffer.copy(buff_1, 0, buff, 0, var3242)
	
	return buff_1
end

function t_81.decode(p163) --[[ line: 18745 ]]
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var3255 = t_81.new()
	local var3256 = 0
	while var3256 < buffer.len(p163) do
		local _ = nil
		local var3257 = nil
		local var3258, var3259, var3260 = protoModule.readTag(p163, var3256)
		local var3261 = var3258
		var3257 = var3259
		var3256 = var3260
		
		if var3257 == protoModule.wireTypes.varint then
			if var3261 == 5 then
				local _ = nil
				local var3262, var3263 = protoModule.readVarIntI64(p163, var3256)
				var3256 = var3263
				var3255.num_items_to_show = var3262
			elseif var3261 == 6 then
				local _ = nil
				local var3264, var3265 = protoModule.readVarInt(p163, var3256)
				var3256 = var3265
				var3255.see_all_button = var3264 ~= 0
			else
				local _ = nil
				local var3266, var3267 = protoModule.readVarInt(p163, var3256)
				local _ = var3266
				var3256 = var3267
			end
		end
		if var3257 == protoModule.wireTypes.lengthDelimited then
			if var3261 == 1 then
				local _ = nil
				local var3268, var3269 = protoModule.readBuffer(p163, var3256)
				var3256 = var3269
				var3255.id = buffer.tostring(var3268)
			elseif var3261 == 3 then
				local _ = nil
				local var3270, var3271 = protoModule.readBuffer(p163, var3256)
				var3256 = var3271
				var3255.widget_style = t.WidgetStyleData.decode(var3270)
			elseif var3261 == 7 then
				local _ = nil
				local var3272, var3273 = protoModule.readBuffer(p163, var3256)
				var3256 = var3273
				var3255.information_popover_text = buffer.tostring(var3272)
			else
				local _ = nil
				local var3274, var3275 = protoModule.readVarInt(p163, var3256)
				var3256 = var3275 + var3274
			end
		elseif var3257 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3276, var3277 = protoModule.readFixed32(p163, var3256)
			local _ = var3276
			var3256 = var3277
		elseif var3257 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3278, var3279 = protoModule.readFixed64(p163, var3256)
			local _ = var3278
			var3256 = var3279
		else
			error("Unsupported wire type: " .. var3257)
		end
	end
	return var3255
end

function t_81:jsonEncode() --[[ line: 18810 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		t.numItemsToShow = self.num_items_to_show
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	if self.see_all_button then
		t.seeAllButton = self.see_all_button
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		t.informationPopoverText = self.information_popover_text
	end
	return t
end

function t_81:jsonDecode() --[[ line: 18838 ]]
	-- upvalues: t_81 (ref), t (ref)
	local var3281 = t_81.new()
	
	if self.id ~= nil then
		var3281.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var3281.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var3281.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var3281.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3281.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3281.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3281.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3281.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3281.information_popover_text = self.informationPopoverText
	end
	return var3281
end

t_81.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_81
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p164) --[[ line: 18896 ]]
	-- upvalues: t_82 (ref)
	return setmetatable({
		background_layers = if p164 == nil or p164.background_layers == nil then {} else p164.background_layers
	}, t_82)
end

function t_82:encode() --[[ line: 18902 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3283 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var3284 = v:encode()
			local var3285, var3286 = protoModule.writeTag(buff, var3283, 1, protoModule.wireTypes.lengthDelimited)
			var3285, var3286 = protoModule.writeBuffer(var3285, var3286, var3284, buffer.len(var3284))
			buff = var3285
			var3283 = var3286
		end
	end
	local buff_1 = buffer.create(var3283)
	buffer.copy(buff_1, 0, buff, 0, var3283)
	
	return buff_1
end

function t_82.decode(p165) --[[ line: 18919 ]]
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var3288 = t_82.new()
	local var3289 = 0
	while var3289 < buffer.len(p165) do
		local _ = nil
		local var3290 = nil
		local var3291, var3292, var3293 = protoModule.readTag(p165, var3289)
		local var3294 = var3291
		var3290 = var3292
		var3289 = var3293
		
		if var3290 == protoModule.wireTypes.varint then
			local _ = nil
			local var3295, var3296 = protoModule.readVarInt(p165, var3289)
			local _ = var3295
			var3289 = var3296
			continue
		end
		if var3290 == protoModule.wireTypes.lengthDelimited then
			if var3294 == 1 then
				local _ = nil
				local var3297, var3298 = protoModule.readBuffer(p165, var3289)
				var3289 = var3298
				table.insert(var3288.background_layers, backgroundLayerModule.BackgroundLayer.decode(var3297))
			else
				local _ = nil
				local var3299, var3300 = protoModule.readVarInt(p165, var3289)
				var3289 = var3300 + var3299
			end
		elseif var3290 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3301, var3302 = protoModule.readFixed32(p165, var3289)
			local _ = var3301
			var3289 = var3302
		elseif var3290 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3303, var3304 = protoModule.readFixed64(p165, var3289)
			local _ = var3303
			var3289 = var3304
		else
			error("Unsupported wire type: " .. var3290)
		end
	end
	return var3288
end

function t_82:jsonEncode() --[[ line: 18965 ]]
	local t = {}
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		local t_1 = {}
		
		for i, v in self.background_layers do
			table.insert(t_1, v:jsonEncode())
		end
		t.backgroundLayers = t_1
	end
	return t
end

function t_82:jsonDecode() --[[ line: 18979 ]]
	-- upvalues: t_82 (ref), backgroundLayerModule (ref)
	local var3307 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3307.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3307.background_layers = t
	end
	return var3307
end

t_82.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_82
typeRegistryModule.default:register(t.WidgetStyleData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p166) --[[ line: 19023 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		id = if p166 == nil or p166.id == nil then "" else p166.id,
		available_until = if p166 == nil or p166.available_until == nil then "" else p166.available_until,
		widget_style = if p166 == nil or p166.widget_style == nil then nil else p166.widget_style
	}, t_83)
end

function t_83:encode() --[[ line: 19033 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3311 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3312, var3313 = protoModule.writeTag(buff, var3311, 1, protoModule.wireTypes.lengthDelimited)
		var3312, var3313 = protoModule.writeString(var3312, var3313, self.id)
		buff = var3312
		var3311 = var3313
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var3314, var3315 = protoModule.writeTag(buff, var3311, 2, protoModule.wireTypes.lengthDelimited)
		var3314, var3315 = protoModule.writeString(var3314, var3315, self.available_until)
		buff = var3314
		var3311 = var3315
	end
	if self.widget_style ~= nil then
		local var3316 = self.widget_style:encode()
		local var3317, var3318 = protoModule.writeTag(buff, var3311, 3, protoModule.wireTypes.lengthDelimited)
		var3317, var3318 = protoModule.writeBuffer(var3317, var3318, var3316, buffer.len(var3316))
		buff = var3317
		var3311 = var3318
	end
	local buff_1 = buffer.create(var3311)
	buffer.copy(buff_1, 0, buff, 0, var3311)
	
	return buff_1
end

function t_83.decode(p167) --[[ line: 19058 ]]
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var3320 = t_83.new()
	local var3321 = 0
	while var3321 < buffer.len(p167) do
		local _ = nil
		local var3322 = nil
		local var3323, var3324, var3325 = protoModule.readTag(p167, var3321)
		local var3326 = var3323
		var3322 = var3324
		var3321 = var3325
		
		if var3322 == protoModule.wireTypes.varint then
			local _ = nil
			local var3327, var3328 = protoModule.readVarInt(p167, var3321)
			local _ = var3327
			var3321 = var3328
			continue
		end
		if var3322 == protoModule.wireTypes.lengthDelimited then
			if var3326 == 1 then
				local _ = nil
				local var3329, var3330 = protoModule.readBuffer(p167, var3321)
				var3321 = var3330
				var3320.id = buffer.tostring(var3329)
			elseif var3326 == 2 then
				local _ = nil
				local var3331, var3332 = protoModule.readBuffer(p167, var3321)
				var3321 = var3332
				var3320.available_until = buffer.tostring(var3331)
			elseif var3326 == 3 then
				local _ = nil
				local var3333, var3334 = protoModule.readBuffer(p167, var3321)
				var3321 = var3334
				var3320.widget_style = t.WidgetStyleData.decode(var3333)
			else
				local _ = nil
				local var3335, var3336 = protoModule.readVarInt(p167, var3321)
				var3321 = var3336 + var3335
			end
		elseif var3322 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3337, var3338 = protoModule.readFixed32(p167, var3321)
			local _ = var3337
			var3321 = var3338
		elseif var3322 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3339, var3340 = protoModule.readFixed64(p167, var3321)
			local _ = var3339
			var3321 = var3340
		else
			error("Unsupported wire type: " .. var3322)
		end
	end
	return var3320
end

function t_83:jsonEncode() --[[ line: 19111 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		t.availableUntil = self.available_until
	end
	if self.widget_style ~= nil then
		t.widgetStyle = self.widget_style:jsonEncode()
	end
	return t
end

function t_83:jsonDecode() --[[ line: 19129 ]]
	-- upvalues: t_83 (ref), t (ref)
	local var3342 = t_83.new()
	
	if self.id ~= nil then
		var3342.id = self.id
	end
	if self.available_until ~= nil then
		var3342.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var3342.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var3342.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3342.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var3342
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p168) --[[ line: 19171 ]]
	-- upvalues: t_84 (ref)
	return setmetatable({
		entry_map = if p168 == nil or p168.entry_map == nil then {} else p168.entry_map,
		entry_order = if p168 == nil or p168.entry_order == nil then {} else p168.entry_order
	}, t_84)
end

function t_84:encode() --[[ line: 19180 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3344 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3345, var3346 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3345, var3346 = protoModule.writeString(var3345, var3346, i)
			local var3347 = v:encode()
			var3346, var3348 = protoModule.writeTag(var3345, var3346, 2, protoModule.wireTypes.lengthDelimited)
			var3346, var3348 = protoModule.writeBuffer(var3346, var3348, var3347, buffer.len(var3347))
			local var3349 = var3346
			local var3350 = var3348
			local var3351, var3352 = protoModule.writeTag(buff, var3344, 1, protoModule.wireTypes.lengthDelimited)
			var3351, var3352 = protoModule.writeBuffer(var3351, var3352, var3349, var3350)
			buff = var3351
			var3344 = var3352
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3353, var3354 = protoModule.writeTag(buff, var3344, 2, protoModule.wireTypes.lengthDelimited)
			var3353, var3354 = protoModule.writeString(var3353, var3354, v)
			buff = var3353
			var3344 = var3354
		end
	end
	local buff_1 = buffer.create(var3344)
	buffer.copy(buff_1, 0, buff, 0, var3344)
	
	return buff_1
end

function t_84.decode(p169) --[[ line: 19210 ]]
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var3356 = t_84.new()
	local var3357 = 0
	while var3357 < buffer.len(p169) do
		local _ = nil
		local var3358 = nil
		local var3359, var3360, var3361 = protoModule.readTag(p169, var3357)
		local var3362 = var3359
		var3358 = var3360
		var3357 = var3361
		
		if var3358 == protoModule.wireTypes.varint then
			local _ = nil
			local var3363, var3364 = protoModule.readVarInt(p169, var3357)
			local _ = var3363
			var3357 = var3364
			continue
		end
		if var3358 == protoModule.wireTypes.lengthDelimited then
			if var3362 == 1 then
				local _ = nil
				local var3365, var3366 = protoModule.readBuffer(p169, var3357)
				var3357 = var3366
				var3365 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var3365)
				var3356.entry_map[var3365.key or ""] = var3365.value or t.FeedEntry.new()
			elseif var3362 == 2 then
				local _ = nil
				local var3367, var3368 = protoModule.readBuffer(p169, var3357)
				var3357 = var3368
				table.insert(var3356.entry_order, buffer.tostring(var3367))
			else
				local _ = nil
				local var3369, var3370 = protoModule.readVarInt(p169, var3357)
				var3357 = var3370 + var3369
			end
		elseif var3358 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3371, var3372 = protoModule.readFixed32(p169, var3357)
			local _ = var3371
			var3357 = var3372
		elseif var3358 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3373, var3374 = protoModule.readFixed64(p169, var3357)
			local _ = var3373
			var3357 = var3374
		else
			error("Unsupported wire type: " .. var3358)
		end
	end
	return var3356
end

function t_84:jsonEncode() --[[ line: 19265 ]]
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	return t
end

function t_84:jsonDecode() --[[ line: 19287 ]]
	-- upvalues: t_84 (ref), t (ref)
	local var3378 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3378.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3378.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3378.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3378.entry_order = t_1
	end
	return var3378
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p170) --[[ line: 19345 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		key = if p170 == nil or p170.key == nil then "" else p170.key,
		value = if p170 == nil or p170.value == nil then nil else p170.value
	}, t_85)
end

function t_85:encode() --[[ line: 19354 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3384 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3385, var3386 = protoModule.writeTag(buff, var3384, 1, protoModule.wireTypes.lengthDelimited)
		var3385, var3386 = protoModule.writeString(var3385, var3386, self.key)
		buff = var3385
		var3384 = var3386
	end
	if self.value ~= nil then
		local var3387 = self.value:encode()
		local var3388, var3389 = protoModule.writeTag(buff, var3384, 2, protoModule.wireTypes.lengthDelimited)
		var3388, var3389 = protoModule.writeBuffer(var3388, var3389, var3387, buffer.len(var3387))
		buff = var3388
		var3384 = var3389
	end
	local buff_1 = buffer.create(var3384)
	buffer.copy(buff_1, 0, buff, 0, var3384)
	
	return buff_1
end

function t_85.decode(p171) --[[ line: 19376 ]]
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var3391 = t_85.new()
	local var3392 = 0
	while var3392 < buffer.len(p171) do
		local _ = nil
		local var3393 = nil
		local var3394, var3395, var3396 = protoModule.readTag(p171, var3392)
		local var3397 = var3394
		var3393 = var3395
		var3392 = var3396
		
		if var3393 == protoModule.wireTypes.varint then
			local _ = nil
			local var3398, var3399 = protoModule.readVarInt(p171, var3392)
			local _ = var3398
			var3392 = var3399
			continue
		end
		if var3393 == protoModule.wireTypes.lengthDelimited then
			if var3397 == 1 then
				local _ = nil
				local var3400, var3401 = protoModule.readBuffer(p171, var3392)
				var3392 = var3401
				var3391.key = buffer.tostring(var3400)
			elseif var3397 == 2 then
				local _ = nil
				local var3402, var3403 = protoModule.readBuffer(p171, var3392)
				var3392 = var3403
				var3391.value = t.FeedEntry.decode(var3402)
			else
				local _ = nil
				local var3404, var3405 = protoModule.readVarInt(p171, var3392)
				var3392 = var3405 + var3404
			end
		elseif var3393 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3406, var3407 = protoModule.readFixed32(p171, var3392)
			local _ = var3406
			var3392 = var3407
		elseif var3393 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3408, var3409 = protoModule.readFixed64(p171, var3392)
			local _ = var3408
			var3392 = var3409
		else
			error("Unsupported wire type: " .. var3393)
		end
	end
	return var3391
end

function t_85:jsonEncode() --[[ line: 19426 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_85:jsonDecode() --[[ line: 19442 ]]
	-- upvalues: t_85 (ref), t (ref)
	local var3411 = t_85.new()
	
	if self.key ~= nil then
		var3411.key = self.key
	end
	if self.value ~= nil then
		var3411.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3411
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p172) --[[ line: 19473 ]]
	-- upvalues: t_86 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p172 == nil or p172.marketplace_catalog_category_items == nil then {} else p172.marketplace_catalog_category_items,
		active_category_id = if p172 == nil or p172.active_category_id == nil then "" else p172.active_category_id,
		active_tooltip_idx = if p172 == nil or p172.active_tooltip_idx == nil then 0 else p172.active_tooltip_idx
	}, t_86)
end

function t_86:encode() --[[ line: 19486 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3413 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var3414 = v:encode()
			local var3415, var3416 = protoModule.writeTag(buff, var3413, 1, protoModule.wireTypes.lengthDelimited)
			var3415, var3416 = protoModule.writeBuffer(var3415, var3416, var3414, buffer.len(var3414))
			buff = var3415
			var3413 = var3416
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var3417, var3418 = protoModule.writeTag(buff, var3413, 2, protoModule.wireTypes.lengthDelimited)
		var3417, var3418 = protoModule.writeString(var3417, var3418, self.active_category_id)
		buff = var3417
		var3413 = var3418
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var3419, var3420 = protoModule.writeTag(buff, var3413, 3, protoModule.wireTypes.varint)
		var3419, var3420 = protoModule.writeVarInt(var3419, var3420, self.active_tooltip_idx)
		buff = var3419
		var3413 = var3420
	end
	local buff_1 = buffer.create(var3413)
	buffer.copy(buff_1, 0, buff, 0, var3413)
	
	return buff_1
end

function t_86.decode(p173) --[[ line: 19515 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var3422 = t_86.new()
	local var3423 = 0
	while var3423 < buffer.len(p173) do
		local _ = nil
		local var3424 = nil
		local var3425, var3426, var3427 = protoModule.readTag(p173, var3423)
		local var3428 = var3425
		var3424 = var3426
		var3423 = var3427
		
		if var3424 == protoModule.wireTypes.varint then
			if var3428 == 3 then
				local _ = nil
				local var3429, var3430 = protoModule.readVarIntI64(p173, var3423)
				var3423 = var3430
				var3422.active_tooltip_idx = var3429
			else
				local _ = nil
				local var3431, var3432 = protoModule.readVarInt(p173, var3423)
				local _ = var3431
				var3423 = var3432
			end
		end
		if var3424 == protoModule.wireTypes.lengthDelimited then
			if var3428 == 1 then
				local _ = nil
				local var3433, var3434 = protoModule.readBuffer(p173, var3423)
				var3423 = var3434
				table.insert(var3422.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var3433))
			elseif var3428 == 2 then
				local _ = nil
				local var3435, var3436 = protoModule.readBuffer(p173, var3423)
				var3423 = var3436
				var3422.active_category_id = buffer.tostring(var3435)
			else
				local _ = nil
				local var3437, var3438 = protoModule.readVarInt(p173, var3423)
				var3423 = var3438 + var3437
			end
		elseif var3424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3439, var3440 = protoModule.readFixed32(p173, var3423)
			local _ = var3439
			var3423 = var3440
		elseif var3424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3441, var3442 = protoModule.readFixed64(p173, var3423)
			local _ = var3441
			var3423 = var3442
		else
			error("Unsupported wire type: " .. var3424)
		end
	end
	return var3422
end

function t_86:jsonEncode() --[[ line: 19573 ]]
	local t = {}
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.marketplaceCatalogCategoryItems = t_1
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		t.activeCategoryId = self.active_category_id
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		t.activeTooltipIdx = self.active_tooltip_idx
	end
	return t
end

function t_86:jsonDecode() --[[ line: 19597 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var3445 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3445.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3445.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var3445.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var3445.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var3445.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var3445.active_tooltip_idx = self.activeTooltipIdx
	end
	return var3445
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p174) --[[ line: 19660 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p174 == nil or p174.marketplace_catalog_category_item_id == nil then "" else p174.marketplace_catalog_category_item_id
	}, t_87)
end

function t_87:encode() --[[ line: 19674 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3449 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var3450, var3451 = protoModule.writeTag(buff, var3449, 1, protoModule.wireTypes.lengthDelimited)
		var3450, var3451 = protoModule.writeString(var3450, var3451, self.marketplace_catalog_category_item_id)
		buff = var3450
		var3449 = var3451
	end
	local buff_1 = buffer.create(var3449)
	buffer.copy(buff_1, 0, buff, 0, var3449)
	
	return buff_1
end

function t_87.decode(p175) --[[ line: 19690 ]]
	-- upvalues: t_87 (ref), protoModule (ref)
	local var3453 = t_87.new()
	local var3454 = 0
	while var3454 < buffer.len(p175) do
		local _ = nil
		local var3455 = nil
		local var3456, var3457, var3458 = protoModule.readTag(p175, var3454)
		local var3459 = var3456
		var3455 = var3457
		var3454 = var3458
		
		if var3455 == protoModule.wireTypes.varint then
			local _ = nil
			local var3460, var3461 = protoModule.readVarInt(p175, var3454)
			local _ = var3460
			var3454 = var3461
			continue
		end
		if var3455 == protoModule.wireTypes.lengthDelimited then
			if var3459 == 1 then
				local _ = nil
				local var3462, var3463 = protoModule.readBuffer(p175, var3454)
				var3454 = var3463
				var3453.marketplace_catalog_category_item_id = buffer.tostring(var3462)
			else
				local _ = nil
				local var3464, var3465 = protoModule.readVarInt(p175, var3454)
				var3454 = var3465 + var3464
			end
		elseif var3455 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3466, var3467 = protoModule.readFixed32(p175, var3454)
			local _ = var3466
			var3454 = var3467
		elseif var3455 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3468, var3469 = protoModule.readFixed64(p175, var3454)
			local _ = var3468
			var3454 = var3469
		else
			error("Unsupported wire type: " .. var3455)
		end
	end
	return var3453
end

function t_87:jsonEncode() --[[ line: 19735 ]]
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_87:jsonDecode() --[[ line: 19747 ]]
	-- upvalues: t_87 (ref)
	local var3471 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var3471.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var3471.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var3471
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p176) --[[ line: 19780 ]]
	-- upvalues: t_88 (ref)
	return setmetatable({
		hero_icon = if p176 == nil or p176.hero_icon == nil then nil else p176.hero_icon,
		body_dismiss_button_text = if p176 == nil or p176.body_dismiss_button_text == nil then "" else p176.body_dismiss_button_text,
		body_title = if p176 == nil or p176.body_title == nil then "" else p176.body_title,
		body_rich_text = if p176 == nil or p176.body_rich_text == nil then "" else p176.body_rich_text,
		terms_link_text = if p176 == nil or p176.terms_link_text == nil then nil else p176.terms_link_text,
		terms_title = if p176 == nil or p176.terms_title == nil then nil else p176.terms_title,
		terms_body_rich_text = if p176 == nil or p176.terms_body_rich_text == nil then nil else p176.terms_body_rich_text,
		terms_dismiss_button_text = if p176 == nil or p176.terms_dismiss_button_text == nil then nil else p176.terms_dismiss_button_text,
		offer_id = if p176 == nil or p176.offer_id == nil then "" else p176.offer_id
	}, t_88)
end

function t_88:encode() --[[ line: 19802 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3473 = 0
	
	if self.hero_icon ~= nil then
		local var3474, var3475 = protoModule.writeTag(buff, var3473, 1, protoModule.wireTypes.lengthDelimited)
		var3474, var3475 = protoModule.writeString(var3474, var3475, self.hero_icon)
		buff = var3474
		var3473 = var3475
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var3476, var3477 = protoModule.writeTag(buff, var3473, 2, protoModule.wireTypes.lengthDelimited)
		var3476, var3477 = protoModule.writeString(var3476, var3477, self.body_dismiss_button_text)
		buff = var3476
		var3473 = var3477
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var3478, var3479 = protoModule.writeTag(buff, var3473, 3, protoModule.wireTypes.lengthDelimited)
		var3478, var3479 = protoModule.writeString(var3478, var3479, self.body_title)
		buff = var3478
		var3473 = var3479
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var3480, var3481 = protoModule.writeTag(buff, var3473, 4, protoModule.wireTypes.lengthDelimited)
		var3480, var3481 = protoModule.writeString(var3480, var3481, self.body_rich_text)
		buff = var3480
		var3473 = var3481
	end
	if self.terms_link_text ~= nil then
		local var3482, var3483 = protoModule.writeTag(buff, var3473, 5, protoModule.wireTypes.lengthDelimited)
		var3482, var3483 = protoModule.writeString(var3482, var3483, self.terms_link_text)
		buff = var3482
		var3473 = var3483
	end
	if self.terms_title ~= nil then
		local var3484, var3485 = protoModule.writeTag(buff, var3473, 6, protoModule.wireTypes.lengthDelimited)
		var3484, var3485 = protoModule.writeString(var3484, var3485, self.terms_title)
		buff = var3484
		var3473 = var3485
	end
	if self.terms_body_rich_text ~= nil then
		local var3486, var3487 = protoModule.writeTag(buff, var3473, 7, protoModule.wireTypes.lengthDelimited)
		var3486, var3487 = protoModule.writeString(var3486, var3487, self.terms_body_rich_text)
		buff = var3486
		var3473 = var3487
	end
	if self.terms_dismiss_button_text ~= nil then
		local var3488, var3489 = protoModule.writeTag(buff, var3473, 8, protoModule.wireTypes.lengthDelimited)
		var3488, var3489 = protoModule.writeString(var3488, var3489, self.terms_dismiss_button_text)
		buff = var3488
		var3473 = var3489
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var3490, var3491 = protoModule.writeTag(buff, var3473, 9, protoModule.wireTypes.lengthDelimited)
		var3490, var3491 = protoModule.writeString(var3490, var3491, self.offer_id)
		buff = var3490
		var3473 = var3491
	end
	local buff_1 = buffer.create(var3473)
	buffer.copy(buff_1, 0, buff, 0, var3473)
	
	return buff_1
end

function t_88.decode(p177) --[[ line: 19856 ]]
	-- upvalues: t_88 (ref), protoModule (ref)
	local var3493 = t_88.new()
	local var3494 = 0
	while var3494 < buffer.len(p177) do
		local _ = nil
		local var3495 = nil
		local var3496, var3497, var3498 = protoModule.readTag(p177, var3494)
		local var3499 = var3496
		var3495 = var3497
		var3494 = var3498
		
		if var3495 == protoModule.wireTypes.varint then
			local _ = nil
			local var3500, var3501 = protoModule.readVarInt(p177, var3494)
			local _ = var3500
			var3494 = var3501
			continue
		end
		if var3495 == protoModule.wireTypes.lengthDelimited then
			if var3499 == 1 then
				local _ = nil
				local var3502, var3503 = protoModule.readBuffer(p177, var3494)
				var3494 = var3503
				var3493.hero_icon = buffer.tostring(var3502)
			elseif var3499 == 2 then
				local _ = nil
				local var3504, var3505 = protoModule.readBuffer(p177, var3494)
				var3494 = var3505
				var3493.body_dismiss_button_text = buffer.tostring(var3504)
			elseif var3499 == 3 then
				local _ = nil
				local var3506, var3507 = protoModule.readBuffer(p177, var3494)
				var3494 = var3507
				var3493.body_title = buffer.tostring(var3506)
			elseif var3499 == 4 then
				local _ = nil
				local var3508, var3509 = protoModule.readBuffer(p177, var3494)
				var3494 = var3509
				var3493.body_rich_text = buffer.tostring(var3508)
			elseif var3499 == 5 then
				local _ = nil
				local var3510, var3511 = protoModule.readBuffer(p177, var3494)
				var3494 = var3511
				var3493.terms_link_text = buffer.tostring(var3510)
			elseif var3499 == 6 then
				local _ = nil
				local var3512, var3513 = protoModule.readBuffer(p177, var3494)
				var3494 = var3513
				var3493.terms_title = buffer.tostring(var3512)
			elseif var3499 == 7 then
				local _ = nil
				local var3514, var3515 = protoModule.readBuffer(p177, var3494)
				var3494 = var3515
				var3493.terms_body_rich_text = buffer.tostring(var3514)
			elseif var3499 == 8 then
				local _ = nil
				local var3516, var3517 = protoModule.readBuffer(p177, var3494)
				var3494 = var3517
				var3493.terms_dismiss_button_text = buffer.tostring(var3516)
			elseif var3499 == 9 then
				local _ = nil
				local var3518, var3519 = protoModule.readBuffer(p177, var3494)
				var3494 = var3519
				var3493.offer_id = buffer.tostring(var3518)
			else
				local _ = nil
				local var3520, var3521 = protoModule.readVarInt(p177, var3494)
				var3494 = var3521 + var3520
			end
		elseif var3495 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3522, var3523 = protoModule.readFixed32(p177, var3494)
			local _ = var3522
			var3494 = var3523
		elseif var3495 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3524, var3525 = protoModule.readFixed64(p177, var3494)
			local _ = var3524
			var3494 = var3525
		else
			error("Unsupported wire type: " .. var3495)
		end
	end
	return var3493
end

function t_88:jsonEncode() --[[ line: 19939 ]]
	local t = {}
	
	if self.hero_icon ~= nil then
		t.heroIcon = self.hero_icon
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		t.bodyDismissButtonText = self.body_dismiss_button_text
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		t.bodyTitle = self.body_title
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		t.bodyRichText = self.body_rich_text
	end
	if self.terms_link_text ~= nil then
		t.termsLinkText = self.terms_link_text
	end
	if self.terms_title ~= nil then
		t.termsTitle = self.terms_title
	end
	if self.terms_body_rich_text ~= nil then
		t.termsBodyRichText = self.terms_body_rich_text
	end
	if self.terms_dismiss_button_text ~= nil then
		t.termsDismissButtonText = self.terms_dismiss_button_text
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		t.offerId = self.offer_id
	end
	return t
end

function t_88:jsonDecode() --[[ line: 19981 ]]
	-- upvalues: t_88 (ref)
	local var3527 = t_88.new()
	
	if self.hero_icon ~= nil then
		var3527.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var3527.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var3527.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var3527.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var3527.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var3527.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var3527.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var3527.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var3527.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var3527.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var3527.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var3527.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var3527.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var3527.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var3527.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var3527.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var3527.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var3527.offer_id = self.offerId
	end
	return var3527
end

t_88.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_88
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p178) --[[ line: 20073 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		items = if p178 == nil or p178.items == nil then {} else p178.items,
		preview_columns = if p178 == nil or p178.preview_columns == nil then 0 else p178.preview_columns,
		impression_id = if p178 == nil or p178.impression_id == nil then "" else p178.impression_id
	}, t_89)
end

function t_89:encode() --[[ line: 20081 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3529 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3530 = v:encode()
			local var3531, var3532 = protoModule.writeTag(buff, var3529, 1, protoModule.wireTypes.lengthDelimited)
			var3531, var3532 = protoModule.writeBuffer(var3531, var3532, var3530, buffer.len(var3530))
			buff = var3531
			var3529 = var3532
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var3533, var3534 = protoModule.writeTag(buff, var3529, 2, protoModule.wireTypes.varint)
		var3533, var3534 = protoModule.writeVarInt(var3533, var3534, self.preview_columns)
		buff = var3533
		var3529 = var3534
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var3535, var3536 = protoModule.writeTag(buff, var3529, 3, protoModule.wireTypes.lengthDelimited)
		var3535, var3536 = protoModule.writeString(var3535, var3536, self.impression_id)
		buff = var3535
		var3529 = var3536
	end
	local buff_1 = buffer.create(var3529)
	buffer.copy(buff_1, 0, buff, 0, var3529)
	
	return buff_1
end

function t_89.decode(p179) --[[ line: 20108 ]]
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var3538 = t_89.new()
	local var3539 = 0
	while var3539 < buffer.len(p179) do
		local _ = nil
		local var3540 = nil
		local var3541, var3542, var3543 = protoModule.readTag(p179, var3539)
		local var3544 = var3541
		var3540 = var3542
		var3539 = var3543
		
		if var3540 == protoModule.wireTypes.varint then
			if var3544 == 2 then
				local _ = nil
				local var3545, var3546 = protoModule.readVarIntI32(p179, var3539)
				var3539 = var3546
				var3538.preview_columns = var3545
			else
				local _ = nil
				local var3547, var3548 = protoModule.readVarInt(p179, var3539)
				local _ = var3547
				var3539 = var3548
			end
		end
		if var3540 == protoModule.wireTypes.lengthDelimited then
			if var3544 == 1 then
				local _ = nil
				local var3549, var3550 = protoModule.readBuffer(p179, var3539)
				var3539 = var3550
				table.insert(var3538.items, t.CatalogItemGridInputData_CatalogItem.decode(var3549))
			elseif var3544 == 3 then
				local _ = nil
				local var3551, var3552 = protoModule.readBuffer(p179, var3539)
				var3539 = var3552
				var3538.impression_id = buffer.tostring(var3551)
			else
				local _ = nil
				local var3553, var3554 = protoModule.readVarInt(p179, var3539)
				var3539 = var3554 + var3553
			end
		elseif var3540 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3555, var3556 = protoModule.readFixed32(p179, var3539)
			local _ = var3555
			var3539 = var3556
		elseif var3540 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3557, var3558 = protoModule.readFixed64(p179, var3539)
			local _ = var3557
			var3539 = var3558
		else
			error("Unsupported wire type: " .. var3540)
		end
	end
	return var3538
end

function t_89:jsonEncode() --[[ line: 20161 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		t.previewColumns = self.preview_columns
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		t.impressionId = self.impression_id
	end
	return t
end

function t_89:jsonDecode() --[[ line: 20183 ]]
	-- upvalues: t_89 (ref), t (ref)
	local var3561 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var3561.items = t_1
	end
	if self.preview_columns ~= nil then
		var3561.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var3561.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var3561.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var3561.impression_id = self.impressionId
	end
	return var3561
end

t_89.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_89
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p180) --[[ line: 20228 ]]
	-- upvalues: t_90 (ref)
	return setmetatable({
		id = if p180 == nil or p180.id == nil then "" else p180.id,
		type = if p180 == nil or p180.type == nil then "" else p180.type
	}, t_90)
end

function t_90:encode() --[[ line: 20237 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3564 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3565, var3566 = protoModule.writeTag(buff, var3564, 1, protoModule.wireTypes.lengthDelimited)
		var3565, var3566 = protoModule.writeString(var3565, var3566, self.id)
		buff = var3565
		var3564 = var3566
	end
	if self.type ~= nil and self.type ~= "" then
		local var3567, var3568 = protoModule.writeTag(buff, var3564, 2, protoModule.wireTypes.lengthDelimited)
		var3567, var3568 = protoModule.writeString(var3567, var3568, self.type)
		buff = var3567
		var3564 = var3568
	end
	local buff_1 = buffer.create(var3564)
	buffer.copy(buff_1, 0, buff, 0, var3564)
	
	return buff_1
end

function t_90.decode(p181) --[[ line: 20256 ]]
	-- upvalues: t_90 (ref), protoModule (ref)
	local var3570 = t_90.new()
	local var3571 = 0
	while var3571 < buffer.len(p181) do
		local _ = nil
		local var3572 = nil
		local var3573, var3574, var3575 = protoModule.readTag(p181, var3571)
		local var3576 = var3573
		var3572 = var3574
		var3571 = var3575
		
		if var3572 == protoModule.wireTypes.varint then
			local _ = nil
			local var3577, var3578 = protoModule.readVarInt(p181, var3571)
			local _ = var3577
			var3571 = var3578
			continue
		end
		if var3572 == protoModule.wireTypes.lengthDelimited then
			if var3576 == 1 then
				local _ = nil
				local var3579, var3580 = protoModule.readBuffer(p181, var3571)
				var3571 = var3580
				var3570.id = buffer.tostring(var3579)
			elseif var3576 == 2 then
				local _ = nil
				local var3581, var3582 = protoModule.readBuffer(p181, var3571)
				var3571 = var3582
				var3570.type = buffer.tostring(var3581)
			else
				local _ = nil
				local var3583, var3584 = protoModule.readVarInt(p181, var3571)
				var3571 = var3584 + var3583
			end
		elseif var3572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3585, var3586 = protoModule.readFixed32(p181, var3571)
			local _ = var3585
			var3571 = var3586
		elseif var3572 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3587, var3588 = protoModule.readFixed64(p181, var3571)
			local _ = var3587
			var3571 = var3588
		else
			error("Unsupported wire type: " .. var3572)
		end
	end
	return var3570
end

function t_90:jsonEncode() --[[ line: 20304 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_90:jsonDecode() --[[ line: 20318 ]]
	-- upvalues: t_90 (ref)
	local var3590 = t_90.new()
	
	if self.id ~= nil then
		var3590.id = self.id
	end
	if self.type ~= nil then
		var3590.type = self.type
	end
	return var3590
end

t_90.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_90
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p182) --[[ line: 20348 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		entry_map = if p182 == nil or p182.entry_map == nil then {} else p182.entry_map,
		entry_order = if p182 == nil or p182.entry_order == nil then {} else p182.entry_order,
		content_pools = if p182 == nil or p182.content_pools == nil then {} else p182.content_pools,
		search_session_id = if p182 == nil or p182.search_session_id == nil then "" else p182.search_session_id
	}, t_91)
end

function t_91:encode() --[[ line: 20359 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3592 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3593, var3594 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3593, var3594 = protoModule.writeString(var3593, var3594, i)
			local var3595 = v:encode()
			var3594, var3596 = protoModule.writeTag(var3593, var3594, 2, protoModule.wireTypes.lengthDelimited)
			var3594, var3596 = protoModule.writeBuffer(var3594, var3596, var3595, buffer.len(var3595))
			local var3597 = var3594
			local var3598 = var3596
			local var3599, var3600 = protoModule.writeTag(buff, var3592, 1, protoModule.wireTypes.lengthDelimited)
			var3599, var3600 = protoModule.writeBuffer(var3599, var3600, var3597, var3598)
			buff = var3599
			var3592 = var3600
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3601, var3602 = protoModule.writeTag(buff, var3592, 2, protoModule.wireTypes.lengthDelimited)
			var3601, var3602 = protoModule.writeString(var3601, var3602, v)
			buff = var3601
			var3592 = var3602
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3603, var3604 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3603, var3604 = protoModule.writeString(var3603, var3604, i)
			local var3605 = v:encode()
			var3604, var3606 = protoModule.writeTag(var3603, var3604, 2, protoModule.wireTypes.lengthDelimited)
			var3604, var3606 = protoModule.writeBuffer(var3604, var3606, var3605, buffer.len(var3605))
			local var3607 = var3604
			local var3608 = var3606
			local var3609, var3610 = protoModule.writeTag(buff, var3592, 3, protoModule.wireTypes.lengthDelimited)
			var3609, var3610 = protoModule.writeBuffer(var3609, var3610, var3607, var3608)
			buff = var3609
			var3592 = var3610
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var3611, var3612 = protoModule.writeTag(buff, var3592, 4, protoModule.wireTypes.lengthDelimited)
		var3611, var3612 = protoModule.writeString(var3611, var3612, self.search_session_id)
		buff = var3611
		var3592 = var3612
	end
	local buff_1 = buffer.create(var3592)
	buffer.copy(buff_1, 0, buff, 0, var3592)
	
	return buff_1
end

function t_91.decode(p183) --[[ line: 20408 ]]
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3614 = t_91.new()
	local var3615 = 0
	while var3615 < buffer.len(p183) do
		local _ = nil
		local var3616 = nil
		local var3617, var3618, var3619 = protoModule.readTag(p183, var3615)
		local var3620 = var3617
		var3616 = var3618
		var3615 = var3619
		
		if var3616 == protoModule.wireTypes.varint then
			local _ = nil
			local var3621, var3622 = protoModule.readVarInt(p183, var3615)
			local _ = var3621
			var3615 = var3622
			continue
		end
		if var3616 == protoModule.wireTypes.lengthDelimited then
			if var3620 == 1 then
				local _ = nil
				local var3623, var3624 = protoModule.readBuffer(p183, var3615)
				var3615 = var3624
				var3623 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var3623)
				var3614.entry_map[var3623.key or ""] = var3623.value or t.FeedEntry.new()
			elseif var3620 == 2 then
				local _ = nil
				local var3625, var3626 = protoModule.readBuffer(p183, var3615)
				var3615 = var3626
				table.insert(var3614.entry_order, buffer.tostring(var3625))
			elseif var3620 == 3 then
				local _ = nil
				local var3627, var3628 = protoModule.readBuffer(p183, var3615)
				var3615 = var3628
				var3627 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var3627)
				var3614.content_pools[var3627.key or ""] = var3627.value or t.ContentPool.new()
			elseif var3620 == 4 then
				local _ = nil
				local var3629, var3630 = protoModule.readBuffer(p183, var3615)
				var3615 = var3630
				var3614.search_session_id = buffer.tostring(var3629)
			else
				local _ = nil
				local var3631, var3632 = protoModule.readVarInt(p183, var3615)
				var3615 = var3632 + var3631
			end
		elseif var3616 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3633, var3634 = protoModule.readFixed32(p183, var3615)
			local _ = var3633
			var3615 = var3634
		elseif var3616 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3635, var3636 = protoModule.readFixed64(p183, var3615)
			local _ = var3635
			var3615 = var3636
		else
			error("Unsupported wire type: " .. var3616)
		end
	end
	return var3614
end

function t_91:jsonEncode() --[[ line: 20480 ]]
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = v:jsonEncode()
		end
		t.contentPools = t_1
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		t.searchSessionId = self.search_session_id
	end
	return t
end

function t_91:jsonDecode() --[[ line: 20514 ]]
	-- upvalues: t_91 (ref), t (ref)
	local var3641 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3641.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3641.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3641.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3641.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3641.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3641.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var3641.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var3641.search_session_id = self.searchSessionId
	end
	return var3641
end

t_91.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_91
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p184) --[[ line: 20596 ]]
	-- upvalues: t_92 (ref)
	return setmetatable({
		key = if p184 == nil or p184.key == nil then "" else p184.key,
		value = if p184 == nil or p184.value == nil then nil else p184.value
	}, t_92)
end

function t_92:encode() --[[ line: 20605 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3649 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3650, var3651 = protoModule.writeTag(buff, var3649, 1, protoModule.wireTypes.lengthDelimited)
		var3650, var3651 = protoModule.writeString(var3650, var3651, self.key)
		buff = var3650
		var3649 = var3651
	end
	if self.value ~= nil then
		local var3652 = self.value:encode()
		local var3653, var3654 = protoModule.writeTag(buff, var3649, 2, protoModule.wireTypes.lengthDelimited)
		var3653, var3654 = protoModule.writeBuffer(var3653, var3654, var3652, buffer.len(var3652))
		buff = var3653
		var3649 = var3654
	end
	local buff_1 = buffer.create(var3649)
	buffer.copy(buff_1, 0, buff, 0, var3649)
	
	return buff_1
end

function t_92.decode(p185) --[[ line: 20627 ]]
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3656 = t_92.new()
	local var3657 = 0
	while var3657 < buffer.len(p185) do
		local _ = nil
		local var3658 = nil
		local var3659, var3660, var3661 = protoModule.readTag(p185, var3657)
		local var3662 = var3659
		var3658 = var3660
		var3657 = var3661
		
		if var3658 == protoModule.wireTypes.varint then
			local _ = nil
			local var3663, var3664 = protoModule.readVarInt(p185, var3657)
			local _ = var3663
			var3657 = var3664
			continue
		end
		if var3658 == protoModule.wireTypes.lengthDelimited then
			if var3662 == 1 then
				local _ = nil
				local var3665, var3666 = protoModule.readBuffer(p185, var3657)
				var3657 = var3666
				var3656.key = buffer.tostring(var3665)
			elseif var3662 == 2 then
				local _ = nil
				local var3667, var3668 = protoModule.readBuffer(p185, var3657)
				var3657 = var3668
				var3656.value = t.FeedEntry.decode(var3667)
			else
				local _ = nil
				local var3669, var3670 = protoModule.readVarInt(p185, var3657)
				var3657 = var3670 + var3669
			end
		elseif var3658 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3671, var3672 = protoModule.readFixed32(p185, var3657)
			local _ = var3671
			var3657 = var3672
		elseif var3658 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3673, var3674 = protoModule.readFixed64(p185, var3657)
			local _ = var3673
			var3657 = var3674
		else
			error("Unsupported wire type: " .. var3658)
		end
	end
	return var3656
end

function t_92:jsonEncode() --[[ line: 20677 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_92:jsonDecode() --[[ line: 20693 ]]
	-- upvalues: t_92 (ref), t (ref)
	local var3676 = t_92.new()
	
	if self.key ~= nil then
		var3676.key = self.key
	end
	if self.value ~= nil then
		var3676.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3676
end

t_92.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_92
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p186) --[[ line: 20723 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		key = if p186 == nil or p186.key == nil then "" else p186.key,
		value = if p186 == nil or p186.value == nil then nil else p186.value
	}, t_93)
end

function t_93:encode() --[[ line: 20732 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3678 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3679, var3680 = protoModule.writeTag(buff, var3678, 1, protoModule.wireTypes.lengthDelimited)
		var3679, var3680 = protoModule.writeString(var3679, var3680, self.key)
		buff = var3679
		var3678 = var3680
	end
	if self.value ~= nil then
		local var3681 = self.value:encode()
		local var3682, var3683 = protoModule.writeTag(buff, var3678, 2, protoModule.wireTypes.lengthDelimited)
		var3682, var3683 = protoModule.writeBuffer(var3682, var3683, var3681, buffer.len(var3681))
		buff = var3682
		var3678 = var3683
	end
	local buff_1 = buffer.create(var3678)
	buffer.copy(buff_1, 0, buff, 0, var3678)
	
	return buff_1
end

function t_93.decode(p187) --[[ line: 20754 ]]
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var3685 = t_93.new()
	local var3686 = 0
	while var3686 < buffer.len(p187) do
		local _ = nil
		local var3687 = nil
		local var3688, var3689, var3690 = protoModule.readTag(p187, var3686)
		local var3691 = var3688
		var3687 = var3689
		var3686 = var3690
		
		if var3687 == protoModule.wireTypes.varint then
			local _ = nil
			local var3692, var3693 = protoModule.readVarInt(p187, var3686)
			local _ = var3692
			var3686 = var3693
			continue
		end
		if var3687 == protoModule.wireTypes.lengthDelimited then
			if var3691 == 1 then
				local _ = nil
				local var3694, var3695 = protoModule.readBuffer(p187, var3686)
				var3686 = var3695
				var3685.key = buffer.tostring(var3694)
			elseif var3691 == 2 then
				local _ = nil
				local var3696, var3697 = protoModule.readBuffer(p187, var3686)
				var3686 = var3697
				var3685.value = t.ContentPool.decode(var3696)
			else
				local _ = nil
				local var3698, var3699 = protoModule.readVarInt(p187, var3686)
				var3686 = var3699 + var3698
			end
		elseif var3687 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3700, var3701 = protoModule.readFixed32(p187, var3686)
			local _ = var3700
			var3686 = var3701
		elseif var3687 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3702, var3703 = protoModule.readFixed64(p187, var3686)
			local _ = var3702
			var3686 = var3703
		else
			error("Unsupported wire type: " .. var3687)
		end
	end
	return var3685
end

function t_93:jsonEncode() --[[ line: 20804 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_93:jsonDecode() --[[ line: 20820 ]]
	-- upvalues: t_93 (ref), t (ref)
	local var3705 = t_93.new()
	
	if self.key ~= nil then
		var3705.key = self.key
	end
	if self.value ~= nil then
		var3705.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3705
end

t_93.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_93
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p188) --[[ line: 20850 ]]
	-- upvalues: t_94 (ref)
	return setmetatable({
		universe_id = if p188 == nil or p188.universe_id == nil then "" else p188.universe_id,
		is_content_locked = if p188 == nil or p188.is_content_locked == nil then false else p188.is_content_locked
	}, t_94)
end

function t_94:encode() --[[ line: 20859 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3707 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3708, var3709 = protoModule.writeTag(buff, var3707, 1, protoModule.wireTypes.lengthDelimited)
		var3708, var3709 = protoModule.writeString(var3708, var3709, self.universe_id)
		buff = var3708
		var3707 = var3709
	end
	if self.is_content_locked then
		local var3710, var3711 = protoModule.writeTag(buff, var3707, 2, protoModule.wireTypes.varint)
		var3710, var3711 = protoModule.writeVarInt(var3710, var3711, if self.is_content_locked then 1 else 0)
		buff = var3710
		var3707 = var3711
	end
	local buff_1 = buffer.create(var3707)
	buffer.copy(buff_1, 0, buff, 0, var3707)
	
	return buff_1
end

function t_94.decode(p189) --[[ line: 20878 ]]
	-- upvalues: t_94 (ref), protoModule (ref)
	local var3713 = t_94.new()
	local var3714 = 0
	while var3714 < buffer.len(p189) do
		local _ = nil
		local var3715 = nil
		local var3716, var3717, var3718 = protoModule.readTag(p189, var3714)
		local var3719 = var3716
		var3715 = var3717
		var3714 = var3718
		
		if var3715 == protoModule.wireTypes.varint then
			if var3719 == 2 then
				local _ = nil
				local var3720, var3721 = protoModule.readVarInt(p189, var3714)
				var3714 = var3721
				var3713.is_content_locked = var3720 ~= 0
			else
				local _ = nil
				local var3722, var3723 = protoModule.readVarInt(p189, var3714)
				local _ = var3722
				var3714 = var3723
			end
		end
		if var3715 == protoModule.wireTypes.lengthDelimited then
			if var3719 == 1 then
				local _ = nil
				local var3724, var3725 = protoModule.readBuffer(p189, var3714)
				var3714 = var3725
				var3713.universe_id = buffer.tostring(var3724)
			else
				local _ = nil
				local var3726, var3727 = protoModule.readVarInt(p189, var3714)
				var3714 = var3727 + var3726
			end
		elseif var3715 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3728, var3729 = protoModule.readFixed32(p189, var3714)
			local _ = var3728
			var3714 = var3729
		elseif var3715 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3730, var3731 = protoModule.readFixed64(p189, var3714)
			local _ = var3730
			var3714 = var3731
		else
			error("Unsupported wire type: " .. var3715)
		end
	end
	return var3713
end

function t_94:jsonEncode() --[[ line: 20926 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_94:jsonDecode() --[[ line: 20940 ]]
	-- upvalues: t_94 (ref)
	local var3733 = t_94.new()
	
	if self.universe_id ~= nil then
		var3733.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3733.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var3733.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var3733.is_content_locked = self.isContentLocked
	end
	return var3733
end

t_94.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_94
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p190) --[[ line: 20976 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		overview_rich_text = if p190 == nil or p190.overview_rich_text == nil then "" else p190.overview_rich_text,
		result_entry = if p190 == nil or p190.result_entry == nil then nil else p190.result_entry,
		follow_up_queries = if p190 == nil or p190.follow_up_queries == nil then {} else p190.follow_up_queries,
		show_loading = if p190 == nil or p190.show_loading == nil then false else p190.show_loading,
		title = if p190 == nil or p190.title == nil then "" else p190.title,
		search_query = if p190 == nil or p190.search_query == nil then "" else p190.search_query,
		universe_ids = if p190 == nil or p190.universe_ids == nil then "" else p190.universe_ids
	}, t_95)
end

function t_95:encode() --[[ line: 20990 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3735 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var3736, var3737 = protoModule.writeTag(buff, var3735, 1, protoModule.wireTypes.lengthDelimited)
		var3736, var3737 = protoModule.writeString(var3736, var3737, self.overview_rich_text)
		buff = var3736
		var3735 = var3737
	end
	if self.result_entry ~= nil then
		local var3738 = self.result_entry:encode()
		local var3739, var3740 = protoModule.writeTag(buff, var3735, 2, protoModule.wireTypes.lengthDelimited)
		var3739, var3740 = protoModule.writeBuffer(var3739, var3740, var3738, buffer.len(var3738))
		buff = var3739
		var3735 = var3740
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var3741, var3742 = protoModule.writeTag(buff, var3735, 3, protoModule.wireTypes.lengthDelimited)
			var3741, var3742 = protoModule.writeString(var3741, var3742, v)
			buff = var3741
			var3735 = var3742
		end
	end
	if self.show_loading then
		local var3743, var3744 = protoModule.writeTag(buff, var3735, 4, protoModule.wireTypes.varint)
		var3743, var3744 = protoModule.writeVarInt(var3743, var3744, if self.show_loading then 1 else 0)
		buff = var3743
		var3735 = var3744
	end
	if self.title ~= nil and self.title ~= "" then
		local var3745, var3746 = protoModule.writeTag(buff, var3735, 5, protoModule.wireTypes.lengthDelimited)
		var3745, var3746 = protoModule.writeString(var3745, var3746, self.title)
		buff = var3745
		var3735 = var3746
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var3747, var3748 = protoModule.writeTag(buff, var3735, 6, protoModule.wireTypes.lengthDelimited)
		var3747, var3748 = protoModule.writeString(var3747, var3748, self.search_query)
		buff = var3747
		var3735 = var3748
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var3749, var3750 = protoModule.writeTag(buff, var3735, 8, protoModule.wireTypes.lengthDelimited)
		var3749, var3750 = protoModule.writeString(var3749, var3750, self.universe_ids)
		buff = var3749
		var3735 = var3750
	end
	local buff_1 = buffer.create(var3735)
	buffer.copy(buff_1, 0, buff, 0, var3735)
	
	return buff_1
end

function t_95.decode(p191) --[[ line: 21037 ]]
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var3752 = t_95.new()
	local var3753 = 0
	while var3753 < buffer.len(p191) do
		local _ = nil
		local var3754 = nil
		local var3755, var3756, var3757 = protoModule.readTag(p191, var3753)
		local var3758 = var3755
		var3754 = var3756
		var3753 = var3757
		
		if var3754 == protoModule.wireTypes.varint then
			if var3758 == 4 then
				local _ = nil
				local var3759, var3760 = protoModule.readVarInt(p191, var3753)
				var3753 = var3760
				var3752.show_loading = var3759 ~= 0
			else
				local _ = nil
				local var3761, var3762 = protoModule.readVarInt(p191, var3753)
				local _ = var3761
				var3753 = var3762
			end
		end
		if var3754 == protoModule.wireTypes.lengthDelimited then
			if var3758 == 1 then
				local _ = nil
				local var3763, var3764 = protoModule.readBuffer(p191, var3753)
				var3753 = var3764
				var3752.overview_rich_text = buffer.tostring(var3763)
			elseif var3758 == 2 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p191, var3753)
				var3753 = var3766
				var3752.result_entry = t.FeedEntry.decode(var3765)
			elseif var3758 == 3 then
				local _ = nil
				local var3767, var3768 = protoModule.readBuffer(p191, var3753)
				var3753 = var3768
				table.insert(var3752.follow_up_queries, buffer.tostring(var3767))
			elseif var3758 == 5 then
				local _ = nil
				local var3769, var3770 = protoModule.readBuffer(p191, var3753)
				var3753 = var3770
				var3752.title = buffer.tostring(var3769)
			elseif var3758 == 6 then
				local _ = nil
				local var3771, var3772 = protoModule.readBuffer(p191, var3753)
				var3753 = var3772
				var3752.search_query = buffer.tostring(var3771)
			elseif var3758 == 8 then
				local _ = nil
				local var3773, var3774 = protoModule.readBuffer(p191, var3753)
				var3753 = var3774
				var3752.universe_ids = buffer.tostring(var3773)
			else
				local _ = nil
				local var3775, var3776 = protoModule.readVarInt(p191, var3753)
				var3753 = var3776 + var3775
			end
		elseif var3754 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3777, var3778 = protoModule.readFixed32(p191, var3753)
			local _ = var3777
			var3753 = var3778
		elseif var3754 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3779, var3780 = protoModule.readFixed64(p191, var3753)
			local _ = var3779
			var3753 = var3780
		else
			error("Unsupported wire type: " .. var3754)
		end
	end
	return var3752
end

function t_95:jsonEncode() --[[ line: 21110 ]]
	local t = {}
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		t.overviewRichText = self.overview_rich_text
	end
	if self.result_entry ~= nil then
		t.resultEntry = self.result_entry:jsonEncode()
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		t.followUpQueries = t_1
	end
	if self.show_loading then
		t.showLoading = self.show_loading
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		t.searchQuery = self.search_query
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		t.universeIds = self.universe_ids
	end
	return t
end

function t_95:jsonDecode() --[[ line: 21148 ]]
	-- upvalues: t_95 (ref), t (ref)
	local var3783 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var3783.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var3783.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var3783.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var3783.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var3783.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var3783.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var3783.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var3783.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var3783.title = self.title
	end
	if self.search_query ~= nil then
		var3783.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var3783.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var3783.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var3783.universe_ids = self.universeIds
	end
	return var3783
end

t_95.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_95
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p192) --[[ line: 21230 ]]
	-- upvalues: t_96 (ref)
	return setmetatable({
		title = if p192 == nil or p192.title == nil then "" else p192.title,
		user_items = if p192 == nil or p192.user_items == nil then {} else p192.user_items,
		max_visible_rows = if p192 == nil or p192.max_visible_rows == nil then 0 else p192.max_visible_rows,
		sort_id = if p192 == nil or p192.sort_id == nil then nil else p192.sort_id
	}, t_96)
end

function t_96:encode() --[[ line: 21239 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3787 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3788, var3789 = protoModule.writeTag(buff, var3787, 1, protoModule.wireTypes.lengthDelimited)
		var3788, var3789 = protoModule.writeString(var3788, var3789, self.title)
		buff = var3788
		var3787 = var3789
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var3790 = v:encode()
			local var3791, var3792 = protoModule.writeTag(buff, var3787, 2, protoModule.wireTypes.lengthDelimited)
			var3791, var3792 = protoModule.writeBuffer(var3791, var3792, var3790, buffer.len(var3790))
			buff = var3791
			var3787 = var3792
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3793, var3794 = protoModule.writeTag(buff, var3787, 3, protoModule.wireTypes.varint)
		var3793, var3794 = protoModule.writeVarInt(var3793, var3794, self.max_visible_rows)
		buff = var3793
		var3787 = var3794
	end
	if self.sort_id ~= nil then
		local var3795, var3796 = protoModule.writeTag(buff, var3787, 4, protoModule.wireTypes.lengthDelimited)
		var3795, var3796 = protoModule.writeString(var3795, var3796, self.sort_id)
		buff = var3795
		var3787 = var3796
	end
	local buff_1 = buffer.create(var3787)
	buffer.copy(buff_1, 0, buff, 0, var3787)
	
	return buff_1
end

function t_96.decode(p193) --[[ line: 21271 ]]
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3798 = t_96.new()
	local var3799 = 0
	while var3799 < buffer.len(p193) do
		local _ = nil
		local var3800 = nil
		local var3801, var3802, var3803 = protoModule.readTag(p193, var3799)
		local var3804 = var3801
		var3800 = var3802
		var3799 = var3803
		
		if var3800 == protoModule.wireTypes.varint then
			if var3804 == 3 then
				local _ = nil
				local var3805, var3806 = protoModule.readVarIntI32(p193, var3799)
				var3799 = var3806
				var3798.max_visible_rows = var3805
			else
				local _ = nil
				local var3807, var3808 = protoModule.readVarInt(p193, var3799)
				local _ = var3807
				var3799 = var3808
			end
		end
		if var3800 == protoModule.wireTypes.lengthDelimited then
			if var3804 == 1 then
				local _ = nil
				local var3809, var3810 = protoModule.readBuffer(p193, var3799)
				var3799 = var3810
				var3798.title = buffer.tostring(var3809)
			elseif var3804 == 2 then
				local _ = nil
				local var3811, var3812 = protoModule.readBuffer(p193, var3799)
				var3799 = var3812
				table.insert(var3798.user_items, t.UserListInputData_UserItem.decode(var3811))
			elseif var3804 == 4 then
				local _ = nil
				local var3813, var3814 = protoModule.readBuffer(p193, var3799)
				var3799 = var3814
				var3798.sort_id = buffer.tostring(var3813)
			else
				local _ = nil
				local var3815, var3816 = protoModule.readVarInt(p193, var3799)
				var3799 = var3816 + var3815
			end
		elseif var3800 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3817, var3818 = protoModule.readFixed32(p193, var3799)
			local _ = var3817
			var3799 = var3818
		elseif var3800 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3819, var3820 = protoModule.readFixed64(p193, var3799)
			local _ = var3819
			var3799 = var3820
		else
			error("Unsupported wire type: " .. var3800)
		end
	end
	return var3798
end

function t_96:jsonEncode() --[[ line: 21329 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.userItems = t_1
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function t_96:jsonDecode() --[[ line: 21355 ]]
	-- upvalues: t_96 (ref), t (ref)
	local var3823 = t_96.new()
	
	if self.title ~= nil then
		var3823.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3823.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3823.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3823.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3823.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3823.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3823.sort_id = self.sortId
	end
	return var3823
end

t_96.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_96
typeRegistryModule.default:register(t.UserListInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p194) --[[ line: 21413 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		user_id = if p194 == nil or p194.user_id == nil then "" else p194.user_id
	}, t_97)
end

function t_97:encode() --[[ line: 21421 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3827 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3828, var3829 = protoModule.writeTag(buff, var3827, 1, protoModule.wireTypes.lengthDelimited)
		var3828, var3829 = protoModule.writeString(var3828, var3829, self.user_id)
		buff = var3828
		var3827 = var3829
	end
	local buff_1 = buffer.create(var3827)
	buffer.copy(buff_1, 0, buff, 0, var3827)
	
	return buff_1
end

function t_97.decode(p195) --[[ line: 21435 ]]
	-- upvalues: t_97 (ref), protoModule (ref)
	local var3831 = t_97.new()
	local var3832 = 0
	while var3832 < buffer.len(p195) do
		local _ = nil
		local var3833 = nil
		local var3834, var3835, var3836 = protoModule.readTag(p195, var3832)
		local var3837 = var3834
		var3833 = var3835
		var3832 = var3836
		
		if var3833 == protoModule.wireTypes.varint then
			local _ = nil
			local var3838, var3839 = protoModule.readVarInt(p195, var3832)
			local _ = var3838
			var3832 = var3839
			continue
		end
		if var3833 == protoModule.wireTypes.lengthDelimited then
			if var3837 == 1 then
				local _ = nil
				local var3840, var3841 = protoModule.readBuffer(p195, var3832)
				var3832 = var3841
				var3831.user_id = buffer.tostring(var3840)
			else
				local _ = nil
				local var3842, var3843 = protoModule.readVarInt(p195, var3832)
				var3832 = var3843 + var3842
			end
		elseif var3833 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3844, var3845 = protoModule.readFixed32(p195, var3832)
			local _ = var3844
			var3832 = var3845
		elseif var3833 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3846, var3847 = protoModule.readFixed64(p195, var3832)
			local _ = var3846
			var3832 = var3847
		else
			error("Unsupported wire type: " .. var3833)
		end
	end
	return var3831
end

function t_97:jsonEncode() --[[ line: 21478 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_97:jsonDecode() --[[ line: 21488 ]]
	-- upvalues: t_97 (ref)
	local var3849 = t_97.new()
	
	if self.user_id ~= nil then
		var3849.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3849.user_id = self.userId
	end
	return var3849
end

t_97.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_97
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p196) --[[ line: 21516 ]]
	-- upvalues: t_98 (ref)
	return setmetatable({
		title = if p196 == nil or p196.title == nil then "" else p196.title,
		items = if p196 == nil or p196.items == nil then {} else p196.items,
		max_visible_rows = if p196 == nil or p196.max_visible_rows == nil then 0 else p196.max_visible_rows,
		sort_id = if p196 == nil or p196.sort_id == nil then nil else p196.sort_id
	}, t_98)
end

function t_98:encode() --[[ line: 21525 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3851 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3852, var3853 = protoModule.writeTag(buff, var3851, 1, protoModule.wireTypes.lengthDelimited)
		var3852, var3853 = protoModule.writeString(var3852, var3853, self.title)
		buff = var3852
		var3851 = var3853
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3854 = v:encode()
			local var3855, var3856 = protoModule.writeTag(buff, var3851, 2, protoModule.wireTypes.lengthDelimited)
			var3855, var3856 = protoModule.writeBuffer(var3855, var3856, var3854, buffer.len(var3854))
			buff = var3855
			var3851 = var3856
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3857, var3858 = protoModule.writeTag(buff, var3851, 3, protoModule.wireTypes.varint)
		var3857, var3858 = protoModule.writeVarInt(var3857, var3858, self.max_visible_rows)
		buff = var3857
		var3851 = var3858
	end
	if self.sort_id ~= nil then
		local var3859, var3860 = protoModule.writeTag(buff, var3851, 4, protoModule.wireTypes.lengthDelimited)
		var3859, var3860 = protoModule.writeString(var3859, var3860, self.sort_id)
		buff = var3859
		var3851 = var3860
	end
	local buff_1 = buffer.create(var3851)
	buffer.copy(buff_1, 0, buff, 0, var3851)
	
	return buff_1
end

function t_98.decode(p197) --[[ line: 21557 ]]
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var3862 = t_98.new()
	local var3863 = 0
	while var3863 < buffer.len(p197) do
		local _ = nil
		local var3864 = nil
		local var3865, var3866, var3867 = protoModule.readTag(p197, var3863)
		local var3868 = var3865
		var3864 = var3866
		var3863 = var3867
		
		if var3864 == protoModule.wireTypes.varint then
			if var3868 == 3 then
				local _ = nil
				local var3869, var3870 = protoModule.readVarIntI32(p197, var3863)
				var3863 = var3870
				var3862.max_visible_rows = var3869
			else
				local _ = nil
				local var3871, var3872 = protoModule.readVarInt(p197, var3863)
				local _ = var3871
				var3863 = var3872
			end
		end
		if var3864 == protoModule.wireTypes.lengthDelimited then
			if var3868 == 1 then
				local _ = nil
				local var3873, var3874 = protoModule.readBuffer(p197, var3863)
				var3863 = var3874
				var3862.title = buffer.tostring(var3873)
			elseif var3868 == 2 then
				local _ = nil
				local var3875, var3876 = protoModule.readBuffer(p197, var3863)
				var3863 = var3876
				table.insert(var3862.items, t.CatalogItemListInputData_CatalogItem.decode(var3875))
			elseif var3868 == 4 then
				local _ = nil
				local var3877, var3878 = protoModule.readBuffer(p197, var3863)
				var3863 = var3878
				var3862.sort_id = buffer.tostring(var3877)
			else
				local _ = nil
				local var3879, var3880 = protoModule.readVarInt(p197, var3863)
				var3863 = var3880 + var3879
			end
		elseif var3864 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3881, var3882 = protoModule.readFixed32(p197, var3863)
			local _ = var3881
			var3863 = var3882
		elseif var3864 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3883, var3884 = protoModule.readFixed64(p197, var3863)
			local _ = var3883
			var3863 = var3884
		else
			error("Unsupported wire type: " .. var3864)
		end
	end
	return var3862
end

function t_98:jsonEncode() --[[ line: 21615 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		t.maxVisibleRows = self.max_visible_rows
	end
	if self.sort_id ~= nil then
		t.sortId = self.sort_id
	end
	return t
end

function t_98:jsonDecode() --[[ line: 21641 ]]
	-- upvalues: t_98 (ref), t (ref)
	local var3887 = t_98.new()
	
	if self.title ~= nil then
		var3887.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3887.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3887.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3887.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3887.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3887.sort_id = self.sortId
	end
	return var3887
end

t_98.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_98
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p198) --[[ line: 21690 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		item_id = if p198 == nil or p198.item_id == nil then "" else p198.item_id,
		item_type = if p198 == nil or p198.item_type == nil then "" else p198.item_type
	}, t_99)
end

function t_99:encode() --[[ line: 21699 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3890 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3891, var3892 = protoModule.writeTag(buff, var3890, 1, protoModule.wireTypes.lengthDelimited)
		var3891, var3892 = protoModule.writeString(var3891, var3892, self.item_id)
		buff = var3891
		var3890 = var3892
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3893, var3894 = protoModule.writeTag(buff, var3890, 2, protoModule.wireTypes.lengthDelimited)
		var3893, var3894 = protoModule.writeString(var3893, var3894, self.item_type)
		buff = var3893
		var3890 = var3894
	end
	local buff_1 = buffer.create(var3890)
	buffer.copy(buff_1, 0, buff, 0, var3890)
	
	return buff_1
end

function t_99.decode(p199) --[[ line: 21718 ]]
	-- upvalues: t_99 (ref), protoModule (ref)
	local var3896 = t_99.new()
	local var3897 = 0
	while var3897 < buffer.len(p199) do
		local _ = nil
		local var3898 = nil
		local var3899, var3900, var3901 = protoModule.readTag(p199, var3897)
		local var3902 = var3899
		var3898 = var3900
		var3897 = var3901
		
		if var3898 == protoModule.wireTypes.varint then
			local _ = nil
			local var3903, var3904 = protoModule.readVarInt(p199, var3897)
			local _ = var3903
			var3897 = var3904
			continue
		end
		if var3898 == protoModule.wireTypes.lengthDelimited then
			if var3902 == 1 then
				local _ = nil
				local var3905, var3906 = protoModule.readBuffer(p199, var3897)
				var3897 = var3906
				var3896.item_id = buffer.tostring(var3905)
			elseif var3902 == 2 then
				local _ = nil
				local var3907, var3908 = protoModule.readBuffer(p199, var3897)
				var3897 = var3908
				var3896.item_type = buffer.tostring(var3907)
			else
				local _ = nil
				local var3909, var3910 = protoModule.readVarInt(p199, var3897)
				var3897 = var3910 + var3909
			end
		elseif var3898 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3911, var3912 = protoModule.readFixed32(p199, var3897)
			local _ = var3911
			var3897 = var3912
		elseif var3898 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3913, var3914 = protoModule.readFixed64(p199, var3897)
			local _ = var3913
			var3897 = var3914
		else
			error("Unsupported wire type: " .. var3898)
		end
	end
	return var3896
end

function t_99:jsonEncode() --[[ line: 21766 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_99:jsonDecode() --[[ line: 21780 ]]
	-- upvalues: t_99 (ref)
	local var3916 = t_99.new()
	
	if self.item_id ~= nil then
		var3916.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3916.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3916.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3916.item_type = self.itemType
	end
	return var3916
end

t_99.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_99
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p200) --[[ line: 21818 ]]
	-- upvalues: t_100 (ref)
	return setmetatable({
		universe_id = if p200 == nil or p200.universe_id == nil then "" else p200.universe_id
	}, t_100)
end

function t_100:encode() --[[ line: 21826 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3918 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3919, var3920 = protoModule.writeTag(buff, var3918, 1, protoModule.wireTypes.lengthDelimited)
		var3919, var3920 = protoModule.writeString(var3919, var3920, self.universe_id)
		buff = var3919
		var3918 = var3920
	end
	local buff_1 = buffer.create(var3918)
	buffer.copy(buff_1, 0, buff, 0, var3918)
	
	return buff_1
end

function t_100.decode(p201) --[[ line: 21840 ]]
	-- upvalues: t_100 (ref), protoModule (ref)
	local var3922 = t_100.new()
	local var3923 = 0
	while var3923 < buffer.len(p201) do
		local _ = nil
		local var3924 = nil
		local var3925, var3926, var3927 = protoModule.readTag(p201, var3923)
		local var3928 = var3925
		var3924 = var3926
		var3923 = var3927
		
		if var3924 == protoModule.wireTypes.varint then
			local _ = nil
			local var3929, var3930 = protoModule.readVarInt(p201, var3923)
			local _ = var3929
			var3923 = var3930
			continue
		end
		if var3924 == protoModule.wireTypes.lengthDelimited then
			if var3928 == 1 then
				local _ = nil
				local var3931, var3932 = protoModule.readBuffer(p201, var3923)
				var3923 = var3932
				var3922.universe_id = buffer.tostring(var3931)
			else
				local _ = nil
				local var3933, var3934 = protoModule.readVarInt(p201, var3923)
				var3923 = var3934 + var3933
			end
		elseif var3924 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3935, var3936 = protoModule.readFixed32(p201, var3923)
			local _ = var3935
			var3923 = var3936
		elseif var3924 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3937, var3938 = protoModule.readFixed64(p201, var3923)
			local _ = var3937
			var3923 = var3938
		else
			error("Unsupported wire type: " .. var3924)
		end
	end
	return var3922
end

function t_100:jsonEncode() --[[ line: 21883 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_100:jsonDecode() --[[ line: 21893 ]]
	-- upvalues: t_100 (ref)
	local var3940 = t_100.new()
	
	if self.universe_id ~= nil then
		var3940.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3940.universe_id = self.universeId
	end
	return var3940
end

t_100.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_100
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p202) --[[ line: 21923 ]]
	-- upvalues: t_101 (ref)
	return setmetatable({
		title = if p202 == nil or p202.title == nil then "" else p202.title,
		subtitle = if p202 == nil or p202.subtitle == nil then "" else p202.subtitle,
		moment_items = if p202 == nil or p202.moment_items == nil then {} else p202.moment_items
	}, t_101)
end

function t_101:encode() --[[ line: 21931 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3942 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3943, var3944 = protoModule.writeTag(buff, var3942, 1, protoModule.wireTypes.lengthDelimited)
		var3943, var3944 = protoModule.writeString(var3943, var3944, self.title)
		buff = var3943
		var3942 = var3944
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3945, var3946 = protoModule.writeTag(buff, var3942, 2, protoModule.wireTypes.lengthDelimited)
		var3945, var3946 = protoModule.writeString(var3945, var3946, self.subtitle)
		buff = var3945
		var3942 = var3946
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3947 = v:encode()
			local var3948, var3949 = protoModule.writeTag(buff, var3942, 3, protoModule.wireTypes.lengthDelimited)
			var3948, var3949 = protoModule.writeBuffer(var3948, var3949, var3947, buffer.len(var3947))
			buff = var3948
			var3942 = var3949
		end
	end
	local buff_1 = buffer.create(var3942)
	buffer.copy(buff_1, 0, buff, 0, var3942)
	
	return buff_1
end

function t_101.decode(p203) --[[ line: 21958 ]]
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var3951 = t_101.new()
	local var3952 = 0
	while var3952 < buffer.len(p203) do
		local _ = nil
		local var3953 = nil
		local var3954, var3955, var3956 = protoModule.readTag(p203, var3952)
		local var3957 = var3954
		var3953 = var3955
		var3952 = var3956
		
		if var3953 == protoModule.wireTypes.varint then
			local _ = nil
			local var3958, var3959 = protoModule.readVarInt(p203, var3952)
			local _ = var3958
			var3952 = var3959
			continue
		end
		if var3953 == protoModule.wireTypes.lengthDelimited then
			if var3957 == 1 then
				local _ = nil
				local var3960, var3961 = protoModule.readBuffer(p203, var3952)
				var3952 = var3961
				var3951.title = buffer.tostring(var3960)
			elseif var3957 == 2 then
				local _ = nil
				local var3962, var3963 = protoModule.readBuffer(p203, var3952)
				var3952 = var3963
				var3951.subtitle = buffer.tostring(var3962)
			elseif var3957 == 3 then
				local _ = nil
				local var3964, var3965 = protoModule.readBuffer(p203, var3952)
				var3952 = var3965
				table.insert(var3951.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3964))
			else
				local _ = nil
				local var3966, var3967 = protoModule.readVarInt(p203, var3952)
				var3952 = var3967 + var3966
			end
		elseif var3953 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3968, var3969 = protoModule.readFixed32(p203, var3952)
			local _ = var3968
			var3952 = var3969
		elseif var3953 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3970, var3971 = protoModule.readFixed64(p203, var3952)
			local _ = var3970
			var3952 = var3971
		else
			error("Unsupported wire type: " .. var3953)
		end
	end
	return var3951
end

function t_101:jsonEncode() --[[ line: 22011 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, v:jsonEncode())
		end
		t.momentItems = t_1
	end
	return t
end

function t_101:jsonDecode() --[[ line: 22033 ]]
	-- upvalues: t_101 (ref), t (ref)
	local var3974 = t_101.new()
	
	if self.title ~= nil then
		var3974.title = self.title
	end
	if self.subtitle ~= nil then
		var3974.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3974.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3974.moment_items = t_1
	end
	return var3974
end

t_101.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_101
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p204) --[[ line: 22079 ]]
	-- upvalues: t_102 (ref)
	return setmetatable({
		moment_id = if p204 == nil or p204.moment_id == nil then "" else p204.moment_id,
		video_asset_id = if p204 == nil or p204.video_asset_id == nil then "" else p204.video_asset_id,
		target_universe_id = if p204 == nil or p204.target_universe_id == nil then "" else p204.target_universe_id,
		target_place_id = if p204 == nil or p204.target_place_id == nil then "" else p204.target_place_id,
		feed_item_id = if p204 == nil or p204.feed_item_id == nil then "" else p204.feed_item_id,
		capture_universe_id = if p204 == nil or p204.capture_universe_id == nil then "" else p204.capture_universe_id
	}, t_102)
end

function t_102:encode() --[[ line: 22094 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3978 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3979, var3980 = protoModule.writeTag(buff, var3978, 1, protoModule.wireTypes.lengthDelimited)
		var3979, var3980 = protoModule.writeString(var3979, var3980, self.moment_id)
		buff = var3979
		var3978 = var3980
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3981, var3982 = protoModule.writeTag(buff, var3978, 2, protoModule.wireTypes.lengthDelimited)
		var3981, var3982 = protoModule.writeString(var3981, var3982, self.video_asset_id)
		buff = var3981
		var3978 = var3982
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3983, var3984 = protoModule.writeTag(buff, var3978, 3, protoModule.wireTypes.lengthDelimited)
		var3983, var3984 = protoModule.writeString(var3983, var3984, self.target_universe_id)
		buff = var3983
		var3978 = var3984
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3985, var3986 = protoModule.writeTag(buff, var3978, 4, protoModule.wireTypes.lengthDelimited)
		var3985, var3986 = protoModule.writeString(var3985, var3986, self.target_place_id)
		buff = var3985
		var3978 = var3986
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3987, var3988 = protoModule.writeTag(buff, var3978, 5, protoModule.wireTypes.lengthDelimited)
		var3987, var3988 = protoModule.writeString(var3987, var3988, self.feed_item_id)
		buff = var3987
		var3978 = var3988
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3989, var3990 = protoModule.writeTag(buff, var3978, 6, protoModule.wireTypes.lengthDelimited)
		var3989, var3990 = protoModule.writeString(var3989, var3990, self.capture_universe_id)
		buff = var3989
		var3978 = var3990
	end
	local buff_1 = buffer.create(var3978)
	buffer.copy(buff_1, 0, buff, 0, var3978)
	
	return buff_1
end

function t_102.decode(p205) --[[ line: 22133 ]]
	-- upvalues: t_102 (ref), protoModule (ref)
	local var3992 = t_102.new()
	local var3993 = 0
	while var3993 < buffer.len(p205) do
		local _ = nil
		local var3994 = nil
		local var3995, var3996, var3997 = protoModule.readTag(p205, var3993)
		local var3998 = var3995
		var3994 = var3996
		var3993 = var3997
		
		if var3994 == protoModule.wireTypes.varint then
			local _ = nil
			local var3999, var4000 = protoModule.readVarInt(p205, var3993)
			local _ = var3999
			var3993 = var4000
			continue
		end
		if var3994 == protoModule.wireTypes.lengthDelimited then
			if var3998 == 1 then
				local _ = nil
				local var4001, var4002 = protoModule.readBuffer(p205, var3993)
				var3993 = var4002
				var3992.moment_id = buffer.tostring(var4001)
			elseif var3998 == 2 then
				local _ = nil
				local var4003, var4004 = protoModule.readBuffer(p205, var3993)
				var3993 = var4004
				var3992.video_asset_id = buffer.tostring(var4003)
			elseif var3998 == 3 then
				local _ = nil
				local var4005, var4006 = protoModule.readBuffer(p205, var3993)
				var3993 = var4006
				var3992.target_universe_id = buffer.tostring(var4005)
			elseif var3998 == 4 then
				local _ = nil
				local var4007, var4008 = protoModule.readBuffer(p205, var3993)
				var3993 = var4008
				var3992.target_place_id = buffer.tostring(var4007)
			elseif var3998 == 5 then
				local _ = nil
				local var4009, var4010 = protoModule.readBuffer(p205, var3993)
				var3993 = var4010
				var3992.feed_item_id = buffer.tostring(var4009)
			elseif var3998 == 6 then
				local _ = nil
				local var4011, var4012 = protoModule.readBuffer(p205, var3993)
				var3993 = var4012
				var3992.capture_universe_id = buffer.tostring(var4011)
			else
				local _ = nil
				local var4013, var4014 = protoModule.readVarInt(p205, var3993)
				var3993 = var4014 + var4013
			end
		elseif var3994 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4015, var4016 = protoModule.readFixed32(p205, var3993)
			local _ = var4015
			var3993 = var4016
		elseif var3994 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4017, var4018 = protoModule.readFixed64(p205, var3993)
			local _ = var4017
			var3993 = var4018
		else
			error("Unsupported wire type: " .. var3994)
		end
	end
	return var3992
end

function t_102:jsonEncode() --[[ line: 22201 ]]
	local t = {}
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		t.momentId = self.moment_id
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		t.targetUniverseId = self.target_universe_id
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		t.targetPlaceId = self.target_place_id
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		t.feedItemId = self.feed_item_id
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		t.captureUniverseId = self.capture_universe_id
	end
	return t
end

function t_102:jsonDecode() --[[ line: 22231 ]]
	-- upvalues: t_102 (ref)
	local var4020 = t_102.new()
	
	if self.moment_id ~= nil then
		var4020.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var4020.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var4020.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4020.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var4020.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var4020.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var4020.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var4020.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var4020.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var4020.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var4020.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var4020.capture_universe_id = self.captureUniverseId
	end
	return var4020
end

t_102.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_102
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p206) --[[ line: 22301 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		title = if p206 == nil or p206.title == nil then "" else p206.title,
		subtitle = if p206 == nil or p206.subtitle == nil then "" else p206.subtitle
	}, t_103)
end

function t_103:encode() --[[ line: 22308 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4022 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var4023, var4024 = protoModule.writeTag(buff, var4022, 1, protoModule.wireTypes.lengthDelimited)
		var4023, var4024 = protoModule.writeString(var4023, var4024, self.title)
		buff = var4023
		var4022 = var4024
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var4025, var4026 = protoModule.writeTag(buff, var4022, 2, protoModule.wireTypes.lengthDelimited)
		var4025, var4026 = protoModule.writeString(var4025, var4026, self.subtitle)
		buff = var4025
		var4022 = var4026
	end
	local buff_1 = buffer.create(var4022)
	buffer.copy(buff_1, 0, buff, 0, var4022)
	
	return buff_1
end

function t_103.decode(p207) --[[ line: 22327 ]]
	-- upvalues: t_103 (ref), protoModule (ref)
	local var4028 = t_103.new()
	local var4029 = 0
	while var4029 < buffer.len(p207) do
		local _ = nil
		local var4030 = nil
		local var4031, var4032, var4033 = protoModule.readTag(p207, var4029)
		local var4034 = var4031
		var4030 = var4032
		var4029 = var4033
		
		if var4030 == protoModule.wireTypes.varint then
			local _ = nil
			local var4035, var4036 = protoModule.readVarInt(p207, var4029)
			local _ = var4035
			var4029 = var4036
			continue
		end
		if var4030 == protoModule.wireTypes.lengthDelimited then
			if var4034 == 1 then
				local _ = nil
				local var4037, var4038 = protoModule.readBuffer(p207, var4029)
				var4029 = var4038
				var4028.title = buffer.tostring(var4037)
			elseif var4034 == 2 then
				local _ = nil
				local var4039, var4040 = protoModule.readBuffer(p207, var4029)
				var4029 = var4040
				var4028.subtitle = buffer.tostring(var4039)
			else
				local _ = nil
				local var4041, var4042 = protoModule.readVarInt(p207, var4029)
				var4029 = var4042 + var4041
			end
		elseif var4030 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4043, var4044 = protoModule.readFixed32(p207, var4029)
			local _ = var4043
			var4029 = var4044
		elseif var4030 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4045, var4046 = protoModule.readFixed64(p207, var4029)
			local _ = var4045
			var4029 = var4046
		else
			error("Unsupported wire type: " .. var4030)
		end
	end
	return var4028
end

function t_103:jsonEncode() --[[ line: 22375 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_103:jsonDecode() --[[ line: 22389 ]]
	-- upvalues: t_103 (ref)
	local var4048 = t_103.new()
	
	if self.title ~= nil then
		var4048.title = self.title
	end
	if self.subtitle ~= nil then
		var4048.subtitle = self.subtitle
	end
	return var4048
end

t_103.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_103
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p208) --[[ line: 22417 ]]
	-- upvalues: t_104 (ref)
	return setmetatable({
		primary_cta_button_text = if p208 == nil or p208.primary_cta_button_text == nil then "" else p208.primary_cta_button_text,
		secondary_cta_button_text = if p208 == nil or p208.secondary_cta_button_text == nil then "" else p208.secondary_cta_button_text,
		primary_cta_type = if p208 == nil or p208.primary_cta_type == nil then "" else p208.primary_cta_type,
		secondary_cta_type = if p208 == nil or p208.secondary_cta_type == nil then "" else p208.secondary_cta_type
	}, t_104)
end

function t_104:encode() --[[ line: 22430 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4050 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var4051, var4052 = protoModule.writeTag(buff, var4050, 1, protoModule.wireTypes.lengthDelimited)
		var4051, var4052 = protoModule.writeString(var4051, var4052, self.primary_cta_button_text)
		buff = var4051
		var4050 = var4052
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var4053, var4054 = protoModule.writeTag(buff, var4050, 2, protoModule.wireTypes.lengthDelimited)
		var4053, var4054 = protoModule.writeString(var4053, var4054, self.secondary_cta_button_text)
		buff = var4053
		var4050 = var4054
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var4055, var4056 = protoModule.writeTag(buff, var4050, 3, protoModule.wireTypes.lengthDelimited)
		var4055, var4056 = protoModule.writeString(var4055, var4056, self.primary_cta_type)
		buff = var4055
		var4050 = var4056
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var4057, var4058 = protoModule.writeTag(buff, var4050, 4, protoModule.wireTypes.lengthDelimited)
		var4057, var4058 = protoModule.writeString(var4057, var4058, self.secondary_cta_type)
		buff = var4057
		var4050 = var4058
	end
	local buff_1 = buffer.create(var4050)
	buffer.copy(buff_1, 0, buff, 0, var4050)
	
	return buff_1
end

function t_104.decode(p209) --[[ line: 22459 ]]
	-- upvalues: t_104 (ref), protoModule (ref)
	local var4060 = t_104.new()
	local var4061 = 0
	while var4061 < buffer.len(p209) do
		local _ = nil
		local var4062 = nil
		local var4063, var4064, var4065 = protoModule.readTag(p209, var4061)
		local var4066 = var4063
		var4062 = var4064
		var4061 = var4065
		
		if var4062 == protoModule.wireTypes.varint then
			local _ = nil
			local var4067, var4068 = protoModule.readVarInt(p209, var4061)
			local _ = var4067
			var4061 = var4068
			continue
		end
		if var4062 == protoModule.wireTypes.lengthDelimited then
			if var4066 == 1 then
				local _ = nil
				local var4069, var4070 = protoModule.readBuffer(p209, var4061)
				var4061 = var4070
				var4060.primary_cta_button_text = buffer.tostring(var4069)
			elseif var4066 == 2 then
				local _ = nil
				local var4071, var4072 = protoModule.readBuffer(p209, var4061)
				var4061 = var4072
				var4060.secondary_cta_button_text = buffer.tostring(var4071)
			elseif var4066 == 3 then
				local _ = nil
				local var4073, var4074 = protoModule.readBuffer(p209, var4061)
				var4061 = var4074
				var4060.primary_cta_type = buffer.tostring(var4073)
			elseif var4066 == 4 then
				local _ = nil
				local var4075, var4076 = protoModule.readBuffer(p209, var4061)
				var4061 = var4076
				var4060.secondary_cta_type = buffer.tostring(var4075)
			else
				local _ = nil
				local var4077, var4078 = protoModule.readVarInt(p209, var4061)
				var4061 = var4078 + var4077
			end
		elseif var4062 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4079, var4080 = protoModule.readFixed32(p209, var4061)
			local _ = var4079
			var4061 = var4080
		elseif var4062 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4081, var4082 = protoModule.readFixed64(p209, var4061)
			local _ = var4081
			var4061 = var4082
		else
			error("Unsupported wire type: " .. var4062)
		end
	end
	return var4060
end

function t_104:jsonEncode() --[[ line: 22517 ]]
	local t = {}
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		t.primaryCtaButtonText = self.primary_cta_button_text
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		t.secondaryCtaButtonText = self.secondary_cta_button_text
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		t.primaryCtaType = self.primary_cta_type
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		t.secondaryCtaType = self.secondary_cta_type
	end
	return t
end

function t_104:jsonDecode() --[[ line: 22539 ]]
	-- upvalues: t_104 (ref)
	local var4084 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var4084.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var4084.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var4084.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var4084.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var4084.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var4084.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var4084.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var4084.secondary_cta_type = self.secondaryCtaType
	end
	return var4084
end

t_104.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_104
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p210) --[[ line: 22591 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		image_asset_id = if p210 == nil or p210.image_asset_id == nil then "" else p210.image_asset_id
	}, t_105)
end

function t_105:encode() --[[ line: 22597 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4086 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var4087, var4088 = protoModule.writeTag(buff, var4086, 1, protoModule.wireTypes.lengthDelimited)
		var4087, var4088 = protoModule.writeString(var4087, var4088, self.image_asset_id)
		buff = var4087
		var4086 = var4088
	end
	local buff_1 = buffer.create(var4086)
	buffer.copy(buff_1, 0, buff, 0, var4086)
	
	return buff_1
end

function t_105.decode(p211) --[[ line: 22611 ]]
	-- upvalues: t_105 (ref), protoModule (ref)
	local var4090 = t_105.new()
	local var4091 = 0
	while var4091 < buffer.len(p211) do
		local _ = nil
		local var4092 = nil
		local var4093, var4094, var4095 = protoModule.readTag(p211, var4091)
		local var4096 = var4093
		var4092 = var4094
		var4091 = var4095
		
		if var4092 == protoModule.wireTypes.varint then
			local _ = nil
			local var4097, var4098 = protoModule.readVarInt(p211, var4091)
			local _ = var4097
			var4091 = var4098
			continue
		end
		if var4092 == protoModule.wireTypes.lengthDelimited then
			if var4096 == 1 then
				local _ = nil
				local var4099, var4100 = protoModule.readBuffer(p211, var4091)
				var4091 = var4100
				var4090.image_asset_id = buffer.tostring(var4099)
			else
				local _ = nil
				local var4101, var4102 = protoModule.readVarInt(p211, var4091)
				var4091 = var4102 + var4101
			end
		elseif var4092 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4103, var4104 = protoModule.readFixed32(p211, var4091)
			local _ = var4103
			var4091 = var4104
		elseif var4092 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4105, var4106 = protoModule.readFixed64(p211, var4091)
			local _ = var4105
			var4091 = var4106
		else
			error("Unsupported wire type: " .. var4092)
		end
	end
	return var4090
end

function t_105:jsonEncode() --[[ line: 22654 ]]
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_105:jsonDecode() --[[ line: 22664 ]]
	-- upvalues: t_105 (ref)
	local var4108 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var4108.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4108.image_asset_id = self.imageAssetId
	end
	return var4108
end

t_105.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_105
typeRegistryModule.default:register(t.ImageInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p212) --[[ line: 22692 ]]
	-- upvalues: t_106 (ref)
	return setmetatable({
		video_asset_id = if p212 == nil or p212.video_asset_id == nil then "" else p212.video_asset_id,
		loading_image_asset_id = if p212 == nil or p212.loading_image_asset_id == nil then "" else p212.loading_image_asset_id
	}, t_106)
end

function t_106:encode() --[[ line: 22701 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4110 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var4111, var4112 = protoModule.writeTag(buff, var4110, 1, protoModule.wireTypes.lengthDelimited)
		var4111, var4112 = protoModule.writeString(var4111, var4112, self.video_asset_id)
		buff = var4111
		var4110 = var4112
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var4113, var4114 = protoModule.writeTag(buff, var4110, 2, protoModule.wireTypes.lengthDelimited)
		var4113, var4114 = protoModule.writeString(var4113, var4114, self.loading_image_asset_id)
		buff = var4113
		var4110 = var4114
	end
	local buff_1 = buffer.create(var4110)
	buffer.copy(buff_1, 0, buff, 0, var4110)
	
	return buff_1
end

function t_106.decode(p213) --[[ line: 22720 ]]
	-- upvalues: t_106 (ref), protoModule (ref)
	local var4116 = t_106.new()
	local var4117 = 0
	while var4117 < buffer.len(p213) do
		local _ = nil
		local var4118 = nil
		local var4119, var4120, var4121 = protoModule.readTag(p213, var4117)
		local var4122 = var4119
		var4118 = var4120
		var4117 = var4121
		
		if var4118 == protoModule.wireTypes.varint then
			local _ = nil
			local var4123, var4124 = protoModule.readVarInt(p213, var4117)
			local _ = var4123
			var4117 = var4124
			continue
		end
		if var4118 == protoModule.wireTypes.lengthDelimited then
			if var4122 == 1 then
				local _ = nil
				local var4125, var4126 = protoModule.readBuffer(p213, var4117)
				var4117 = var4126
				var4116.video_asset_id = buffer.tostring(var4125)
			elseif var4122 == 2 then
				local _ = nil
				local var4127, var4128 = protoModule.readBuffer(p213, var4117)
				var4117 = var4128
				var4116.loading_image_asset_id = buffer.tostring(var4127)
			else
				local _ = nil
				local var4129, var4130 = protoModule.readVarInt(p213, var4117)
				var4117 = var4130 + var4129
			end
		elseif var4118 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4131, var4132 = protoModule.readFixed32(p213, var4117)
			local _ = var4131
			var4117 = var4132
		elseif var4118 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4133, var4134 = protoModule.readFixed64(p213, var4117)
			local _ = var4133
			var4117 = var4134
		else
			error("Unsupported wire type: " .. var4118)
		end
	end
	return var4116
end

function t_106:jsonEncode() --[[ line: 22768 ]]
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		t.loadingImageAssetId = self.loading_image_asset_id
	end
	return t
end

function t_106:jsonDecode() --[[ line: 22782 ]]
	-- upvalues: t_106 (ref)
	local var4136 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var4136.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4136.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var4136.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var4136.loading_image_asset_id = self.loadingImageAssetId
	end
	return var4136
end

t_106.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_106
typeRegistryModule.default:register(t.VideoInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p214) --[[ line: 22818 ]]
	-- upvalues: t_107 (ref)
	return setmetatable({
		text = if p214 == nil or p214.text == nil then "" else p214.text,
		is_rendered_text = if p214 == nil or p214.is_rendered_text == nil then false else p214.is_rendered_text
	}, t_107)
end

function t_107:encode() --[[ line: 22825 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4138 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var4139, var4140 = protoModule.writeTag(buff, var4138, 1, protoModule.wireTypes.lengthDelimited)
		var4139, var4140 = protoModule.writeString(var4139, var4140, self.text)
		buff = var4139
		var4138 = var4140
	end
	if self.is_rendered_text then
		local var4141, var4142 = protoModule.writeTag(buff, var4138, 2, protoModule.wireTypes.varint)
		var4141, var4142 = protoModule.writeVarInt(var4141, var4142, if self.is_rendered_text then 1 else 0)
		buff = var4141
		var4138 = var4142
	end
	local buff_1 = buffer.create(var4138)
	buffer.copy(buff_1, 0, buff, 0, var4138)
	
	return buff_1
end

function t_107.decode(p215) --[[ line: 22844 ]]
	-- upvalues: t_107 (ref), protoModule (ref)
	local var4144 = t_107.new()
	local var4145 = 0
	while var4145 < buffer.len(p215) do
		local _ = nil
		local var4146 = nil
		local var4147, var4148, var4149 = protoModule.readTag(p215, var4145)
		local var4150 = var4147
		var4146 = var4148
		var4145 = var4149
		
		if var4146 == protoModule.wireTypes.varint then
			if var4150 == 2 then
				local _ = nil
				local var4151, var4152 = protoModule.readVarInt(p215, var4145)
				var4145 = var4152
				var4144.is_rendered_text = var4151 ~= 0
			else
				local _ = nil
				local var4153, var4154 = protoModule.readVarInt(p215, var4145)
				local _ = var4153
				var4145 = var4154
			end
		end
		if var4146 == protoModule.wireTypes.lengthDelimited then
			if var4150 == 1 then
				local _ = nil
				local var4155, var4156 = protoModule.readBuffer(p215, var4145)
				var4145 = var4156
				var4144.text = buffer.tostring(var4155)
			else
				local _ = nil
				local var4157, var4158 = protoModule.readVarInt(p215, var4145)
				var4145 = var4158 + var4157
			end
		elseif var4146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4159, var4160 = protoModule.readFixed32(p215, var4145)
			local _ = var4159
			var4145 = var4160
		elseif var4146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4161, var4162 = protoModule.readFixed64(p215, var4145)
			local _ = var4161
			var4145 = var4162
		else
			error("Unsupported wire type: " .. var4146)
		end
	end
	return var4144
end

function t_107:jsonEncode() --[[ line: 22892 ]]
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_107:jsonDecode() --[[ line: 22906 ]]
	-- upvalues: t_107 (ref)
	local var4164 = t_107.new()
	
	if self.text ~= nil then
		var4164.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var4164.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var4164.is_rendered_text = self.isRenderedText
	end
	return var4164
end

t_107.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_107
typeRegistryModule.default:register(t.TextInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p216) --[[ line: 22938 ]]
	-- upvalues: t_108 (ref)
	return setmetatable({
		entry_map = if p216 == nil or p216.entry_map == nil then {} else p216.entry_map,
		entry_order = if p216 == nil or p216.entry_order == nil then {} else p216.entry_order,
		entry_order_map = if p216 == nil or p216.entry_order_map == nil then {} else p216.entry_order_map,
		content_pools = if p216 == nil or p216.content_pools == nil then {} else p216.content_pools
	}, t_108)
end

function t_108:encode() --[[ line: 22947 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4166 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var4167, var4168 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4167, var4168 = protoModule.writeString(var4167, var4168, i)
			local var4169 = v:encode()
			var4168, var4170 = protoModule.writeTag(var4167, var4168, 2, protoModule.wireTypes.lengthDelimited)
			var4168, var4170 = protoModule.writeBuffer(var4168, var4170, var4169, buffer.len(var4169))
			local var4171 = var4168
			local var4172 = var4170
			local var4173, var4174 = protoModule.writeTag(buff, var4166, 1, protoModule.wireTypes.lengthDelimited)
			var4173, var4174 = protoModule.writeBuffer(var4173, var4174, var4171, var4172)
			buff = var4173
			var4166 = var4174
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var4175, var4176 = protoModule.writeTag(buff, var4166, 2, protoModule.wireTypes.lengthDelimited)
			var4175, var4176 = protoModule.writeString(var4175, var4176, v)
			buff = var4175
			var4166 = var4176
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var4177, var4178 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4177, var4178 = protoModule.writeString(var4177, var4178, i)
			local var4179 = v:encode()
			var4178, var4180 = protoModule.writeTag(var4177, var4178, 2, protoModule.wireTypes.lengthDelimited)
			var4178, var4180 = protoModule.writeBuffer(var4178, var4180, var4179, buffer.len(var4179))
			local var4181 = var4178
			local var4182 = var4180
			local var4183, var4184 = protoModule.writeTag(buff, var4166, 3, protoModule.wireTypes.lengthDelimited)
			var4183, var4184 = protoModule.writeBuffer(var4183, var4184, var4181, var4182)
			buff = var4183
			var4166 = var4184
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var4185, var4186 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4185, var4186 = protoModule.writeString(var4185, var4186, i)
			local var4187 = v:encode()
			var4186, var4188 = protoModule.writeTag(var4185, var4186, 2, protoModule.wireTypes.lengthDelimited)
			var4186, var4188 = protoModule.writeBuffer(var4186, var4188, var4187, buffer.len(var4187))
			local var4189 = var4186
			local var4190 = var4188
			local var4191, var4192 = protoModule.writeTag(buff, var4166, 4, protoModule.wireTypes.lengthDelimited)
			var4191, var4192 = protoModule.writeBuffer(var4191, var4192, var4189, var4190)
			buff = var4191
			var4166 = var4192
		end
	end
	local buff_1 = buffer.create(var4166)
	buffer.copy(buff_1, 0, buff, 0, var4166)
	
	return buff_1
end

function t_108.decode(p217) --[[ line: 23005 ]]
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var4194 = t_108.new()
	local var4195 = 0
	while var4195 < buffer.len(p217) do
		local _ = nil
		local var4196 = nil
		local var4197, var4198, var4199 = protoModule.readTag(p217, var4195)
		local var4200 = var4197
		var4196 = var4198
		var4195 = var4199
		
		if var4196 == protoModule.wireTypes.varint then
			local _ = nil
			local var4201, var4202 = protoModule.readVarInt(p217, var4195)
			local _ = var4201
			var4195 = var4202
			continue
		end
		if var4196 == protoModule.wireTypes.lengthDelimited then
			if var4200 == 1 then
				local _ = nil
				local var4203, var4204 = protoModule.readBuffer(p217, var4195)
				var4195 = var4204
				var4203 = t.VerticalFeedInputData_EntryMapEntry.decode(var4203)
				var4194.entry_map[var4203.key or ""] = var4203.value or t.FeedEntry.new()
			elseif var4200 == 2 then
				local _ = nil
				local var4205, var4206 = protoModule.readBuffer(p217, var4195)
				var4195 = var4206
				table.insert(var4194.entry_order, buffer.tostring(var4205))
			elseif var4200 == 3 then
				local _ = nil
				local var4207, var4208 = protoModule.readBuffer(p217, var4195)
				var4195 = var4208
				var4207 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var4207)
				var4194.entry_order_map[var4207.key or ""] = var4207.value or t.EntryOrder.new()
			elseif var4200 == 4 then
				local _ = nil
				local var4209, var4210 = protoModule.readBuffer(p217, var4195)
				var4195 = var4210
				var4209 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var4209)
				var4194.content_pools[var4209.key or ""] = var4209.value or t.ContentPool.new()
			else
				local _ = nil
				local var4211, var4212 = protoModule.readVarInt(p217, var4195)
				var4195 = var4212 + var4211
			end
		elseif var4196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4213, var4214 = protoModule.readFixed32(p217, var4195)
			local _ = var4213
			var4195 = var4214
		elseif var4196 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4215, var4216 = protoModule.readFixed64(p217, var4195)
			local _ = var4215
			var4195 = var4216
		else
			error("Unsupported wire type: " .. var4196)
		end
	end
	return var4194
end

function t_108:jsonEncode() --[[ line: 23084 ]]
	local t = {}
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryMap = t_1
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		t.entryOrder = t_1
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = v:jsonEncode()
		end
		t.entryOrderMap = t_1
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = v:jsonEncode()
		end
		t.contentPools = t_1
	end
	return t
end

function t_108:jsonDecode() --[[ line: 23122 ]]
	-- upvalues: t_108 (ref), t (ref)
	local var4222 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4222.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4222.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var4222.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var4222.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4222.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4222.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4222.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4222.content_pools = t_1
	end
	return var4222
end

t_108.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_108
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p218) --[[ line: 23214 ]]
	-- upvalues: t_109 (ref)
	return setmetatable({
		key = if p218 == nil or p218.key == nil then "" else p218.key,
		value = if p218 == nil or p218.value == nil then nil else p218.value
	}, t_109)
end

function t_109:encode() --[[ line: 23223 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4232 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4233, var4234 = protoModule.writeTag(buff, var4232, 1, protoModule.wireTypes.lengthDelimited)
		var4233, var4234 = protoModule.writeString(var4233, var4234, self.key)
		buff = var4233
		var4232 = var4234
	end
	if self.value ~= nil then
		local var4235 = self.value:encode()
		local var4236, var4237 = protoModule.writeTag(buff, var4232, 2, protoModule.wireTypes.lengthDelimited)
		var4236, var4237 = protoModule.writeBuffer(var4236, var4237, var4235, buffer.len(var4235))
		buff = var4236
		var4232 = var4237
	end
	local buff_1 = buffer.create(var4232)
	buffer.copy(buff_1, 0, buff, 0, var4232)
	
	return buff_1
end

function t_109.decode(p219) --[[ line: 23243 ]]
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var4239 = t_109.new()
	local var4240 = 0
	while var4240 < buffer.len(p219) do
		local _ = nil
		local var4241 = nil
		local var4242, var4243, var4244 = protoModule.readTag(p219, var4240)
		local var4245 = var4242
		var4241 = var4243
		var4240 = var4244
		
		if var4241 == protoModule.wireTypes.varint then
			local _ = nil
			local var4246, var4247 = protoModule.readVarInt(p219, var4240)
			local _ = var4246
			var4240 = var4247
			continue
		end
		if var4241 == protoModule.wireTypes.lengthDelimited then
			if var4245 == 1 then
				local _ = nil
				local var4248, var4249 = protoModule.readBuffer(p219, var4240)
				var4240 = var4249
				var4239.key = buffer.tostring(var4248)
			elseif var4245 == 2 then
				local _ = nil
				local var4250, var4251 = protoModule.readBuffer(p219, var4240)
				var4240 = var4251
				var4239.value = t.FeedEntry.decode(var4250)
			else
				local _ = nil
				local var4252, var4253 = protoModule.readVarInt(p219, var4240)
				var4240 = var4253 + var4252
			end
		elseif var4241 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4254, var4255 = protoModule.readFixed32(p219, var4240)
			local _ = var4254
			var4240 = var4255
		elseif var4241 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4256, var4257 = protoModule.readFixed64(p219, var4240)
			local _ = var4256
			var4240 = var4257
		else
			error("Unsupported wire type: " .. var4241)
		end
	end
	return var4239
end

function t_109:jsonEncode() --[[ line: 23291 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_109:jsonDecode() --[[ line: 23305 ]]
	-- upvalues: t_109 (ref), t (ref)
	local var4259 = t_109.new()
	
	if self.key ~= nil then
		var4259.key = self.key
	end
	if self.value ~= nil then
		var4259.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var4259
end

t_109.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_109
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p220) --[[ line: 23335 ]]
	-- upvalues: t_110 (ref)
	return setmetatable({
		key = if p220 == nil or p220.key == nil then "" else p220.key,
		value = if p220 == nil or p220.value == nil then nil else p220.value
	}, t_110)
end

function t_110:encode() --[[ line: 23344 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4261 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4262, var4263 = protoModule.writeTag(buff, var4261, 1, protoModule.wireTypes.lengthDelimited)
		var4262, var4263 = protoModule.writeString(var4262, var4263, self.key)
		buff = var4262
		var4261 = var4263
	end
	if self.value ~= nil then
		local var4264 = self.value:encode()
		local var4265, var4266 = protoModule.writeTag(buff, var4261, 2, protoModule.wireTypes.lengthDelimited)
		var4265, var4266 = protoModule.writeBuffer(var4265, var4266, var4264, buffer.len(var4264))
		buff = var4265
		var4261 = var4266
	end
	local buff_1 = buffer.create(var4261)
	buffer.copy(buff_1, 0, buff, 0, var4261)
	
	return buff_1
end

function t_110.decode(p221) --[[ line: 23366 ]]
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var4268 = t_110.new()
	local var4269 = 0
	while var4269 < buffer.len(p221) do
		local _ = nil
		local var4270 = nil
		local var4271, var4272, var4273 = protoModule.readTag(p221, var4269)
		local var4274 = var4271
		var4270 = var4272
		var4269 = var4273
		
		if var4270 == protoModule.wireTypes.varint then
			local _ = nil
			local var4275, var4276 = protoModule.readVarInt(p221, var4269)
			local _ = var4275
			var4269 = var4276
			continue
		end
		if var4270 == protoModule.wireTypes.lengthDelimited then
			if var4274 == 1 then
				local _ = nil
				local var4277, var4278 = protoModule.readBuffer(p221, var4269)
				var4269 = var4278
				var4268.key = buffer.tostring(var4277)
			elseif var4274 == 2 then
				local _ = nil
				local var4279, var4280 = protoModule.readBuffer(p221, var4269)
				var4269 = var4280
				var4268.value = t.EntryOrder.decode(var4279)
			else
				local _ = nil
				local var4281, var4282 = protoModule.readVarInt(p221, var4269)
				var4269 = var4282 + var4281
			end
		elseif var4270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4283, var4284 = protoModule.readFixed32(p221, var4269)
			local _ = var4283
			var4269 = var4284
		elseif var4270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4285, var4286 = protoModule.readFixed64(p221, var4269)
			local _ = var4285
			var4269 = var4286
		else
			error("Unsupported wire type: " .. var4270)
		end
	end
	return var4268
end

function t_110:jsonEncode() --[[ line: 23416 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_110:jsonDecode() --[[ line: 23432 ]]
	-- upvalues: t_110 (ref), t (ref)
	local var4288 = t_110.new()
	
	if self.key ~= nil then
		var4288.key = self.key
	end
	if self.value ~= nil then
		var4288.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var4288
end

t_110.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p222) --[[ line: 23462 ]]
	-- upvalues: t_111 (ref)
	return setmetatable({
		key = if p222 == nil or p222.key == nil then "" else p222.key,
		value = if p222 == nil or p222.value == nil then nil else p222.value
	}, t_111)
end

function t_111:encode() --[[ line: 23471 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4290 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4291, var4292 = protoModule.writeTag(buff, var4290, 1, protoModule.wireTypes.lengthDelimited)
		var4291, var4292 = protoModule.writeString(var4291, var4292, self.key)
		buff = var4291
		var4290 = var4292
	end
	if self.value ~= nil then
		local var4293 = self.value:encode()
		local var4294, var4295 = protoModule.writeTag(buff, var4290, 2, protoModule.wireTypes.lengthDelimited)
		var4294, var4295 = protoModule.writeBuffer(var4294, var4295, var4293, buffer.len(var4293))
		buff = var4294
		var4290 = var4295
	end
	local buff_1 = buffer.create(var4290)
	buffer.copy(buff_1, 0, buff, 0, var4290)
	
	return buff_1
end

function t_111.decode(p223) --[[ line: 23491 ]]
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var4297 = t_111.new()
	local var4298 = 0
	while var4298 < buffer.len(p223) do
		local _ = nil
		local var4299 = nil
		local var4300, var4301, var4302 = protoModule.readTag(p223, var4298)
		local var4303 = var4300
		var4299 = var4301
		var4298 = var4302
		
		if var4299 == protoModule.wireTypes.varint then
			local _ = nil
			local var4304, var4305 = protoModule.readVarInt(p223, var4298)
			local _ = var4304
			var4298 = var4305
			continue
		end
		if var4299 == protoModule.wireTypes.lengthDelimited then
			if var4303 == 1 then
				local _ = nil
				local var4306, var4307 = protoModule.readBuffer(p223, var4298)
				var4298 = var4307
				var4297.key = buffer.tostring(var4306)
			elseif var4303 == 2 then
				local _ = nil
				local var4308, var4309 = protoModule.readBuffer(p223, var4298)
				var4298 = var4309
				var4297.value = t.ContentPool.decode(var4308)
			else
				local _ = nil
				local var4310, var4311 = protoModule.readVarInt(p223, var4298)
				var4298 = var4311 + var4310
			end
		elseif var4299 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4312, var4313 = protoModule.readFixed32(p223, var4298)
			local _ = var4312
			var4298 = var4313
		elseif var4299 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4314, var4315 = protoModule.readFixed64(p223, var4298)
			local _ = var4314
			var4298 = var4315
		else
			error("Unsupported wire type: " .. var4299)
		end
	end
	return var4297
end

function t_111:jsonEncode() --[[ line: 23539 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_111:jsonDecode() --[[ line: 23553 ]]
	-- upvalues: t_111 (ref), t (ref)
	local var4317 = t_111.new()
	
	if self.key ~= nil then
		var4317.key = self.key
	end
	if self.value ~= nil then
		var4317.value = t.ContentPool.jsonDecode(self.value)
	end
	return var4317
end

t_111.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_111
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p224) --[[ line: 23583 ]]
	-- upvalues: t_112 (ref)
	return setmetatable({
		foreground_header_entry = if p224 == nil or p224.foreground_header_entry == nil then nil else p224.foreground_header_entry,
		background_header_entry = if p224 == nil or p224.background_header_entry == nil then nil else p224.background_header_entry,
		layout_variant = if p224 == nil or p224.layout_variant == nil then "" else p224.layout_variant
	}, t_112)
end

function t_112:encode() --[[ line: 23595 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4319 = 0
	
	if self.foreground_header_entry ~= nil then
		local var4320 = self.foreground_header_entry:encode()
		local var4321, var4322 = protoModule.writeTag(buff, var4319, 1, protoModule.wireTypes.lengthDelimited)
		var4321, var4322 = protoModule.writeBuffer(var4321, var4322, var4320, buffer.len(var4320))
		buff = var4321
		var4319 = var4322
	end
	if self.background_header_entry ~= nil then
		local var4323 = self.background_header_entry:encode()
		local var4324, var4325 = protoModule.writeTag(buff, var4319, 2, protoModule.wireTypes.lengthDelimited)
		var4324, var4325 = protoModule.writeBuffer(var4324, var4325, var4323, buffer.len(var4323))
		buff = var4324
		var4319 = var4325
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var4326, var4327 = protoModule.writeTag(buff, var4319, 3, protoModule.wireTypes.lengthDelimited)
		var4326, var4327 = protoModule.writeString(var4326, var4327, self.layout_variant)
		buff = var4326
		var4319 = var4327
	end
	local buff_1 = buffer.create(var4319)
	buffer.copy(buff_1, 0, buff, 0, var4319)
	
	return buff_1
end

function t_112.decode(p225) --[[ line: 23621 ]]
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var4329 = t_112.new()
	local var4330 = 0
	while var4330 < buffer.len(p225) do
		local _ = nil
		local var4331 = nil
		local var4332, var4333, var4334 = protoModule.readTag(p225, var4330)
		local var4335 = var4332
		var4331 = var4333
		var4330 = var4334
		
		if var4331 == protoModule.wireTypes.varint then
			local _ = nil
			local var4336, var4337 = protoModule.readVarInt(p225, var4330)
			local _ = var4336
			var4330 = var4337
			continue
		end
		if var4331 == protoModule.wireTypes.lengthDelimited then
			if var4335 == 1 then
				local _ = nil
				local var4338, var4339 = protoModule.readBuffer(p225, var4330)
				var4330 = var4339
				var4329.foreground_header_entry = t.ForegroundHeaderEntry.decode(var4338)
			elseif var4335 == 2 then
				local _ = nil
				local var4340, var4341 = protoModule.readBuffer(p225, var4330)
				var4330 = var4341
				var4329.background_header_entry = t.BackgroundHeaderEntry.decode(var4340)
			elseif var4335 == 3 then
				local _ = nil
				local var4342, var4343 = protoModule.readBuffer(p225, var4330)
				var4330 = var4343
				var4329.layout_variant = buffer.tostring(var4342)
			else
				local _ = nil
				local var4344, var4345 = protoModule.readVarInt(p225, var4330)
				var4330 = var4345 + var4344
			end
		elseif var4331 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4346, var4347 = protoModule.readFixed32(p225, var4330)
			local _ = var4346
			var4330 = var4347
		elseif var4331 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4348, var4349 = protoModule.readFixed64(p225, var4330)
			local _ = var4348
			var4330 = var4349
		else
			error("Unsupported wire type: " .. var4331)
		end
	end
	return var4329
end

function t_112:jsonEncode() --[[ line: 23674 ]]
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		t.layoutVariant = self.layout_variant
	end
	return t
end

function t_112:jsonDecode() --[[ line: 23692 ]]
	-- upvalues: t_112 (ref), t (ref)
	local var4351 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var4351.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var4351.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var4351.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var4351.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var4351.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var4351.layout_variant = self.layoutVariant
	end
	return var4351
end

t_112.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_112
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p226) --[[ line: 23736 ]]
	-- upvalues: t_113 (ref)
	return setmetatable({
		cta_button_text = if p226 == nil or p226.cta_button_text == nil then "" else p226.cta_button_text,
		cta_type = if p226 == nil or p226.cta_type == nil then "" else p226.cta_type
	}, t_113)
end

function t_113:encode() --[[ line: 23745 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4353 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4354, var4355 = protoModule.writeTag(buff, var4353, 1, protoModule.wireTypes.lengthDelimited)
		var4354, var4355 = protoModule.writeString(var4354, var4355, self.cta_button_text)
		buff = var4354
		var4353 = var4355
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var4356, var4357 = protoModule.writeTag(buff, var4353, 2, protoModule.wireTypes.lengthDelimited)
		var4356, var4357 = protoModule.writeString(var4356, var4357, self.cta_type)
		buff = var4356
		var4353 = var4357
	end
	local buff_1 = buffer.create(var4353)
	buffer.copy(buff_1, 0, buff, 0, var4353)
	
	return buff_1
end

function t_113.decode(p227) --[[ line: 23764 ]]
	-- upvalues: t_113 (ref), protoModule (ref)
	local var4359 = t_113.new()
	local var4360 = 0
	while var4360 < buffer.len(p227) do
		local _ = nil
		local var4361 = nil
		local var4362, var4363, var4364 = protoModule.readTag(p227, var4360)
		local var4365 = var4362
		var4361 = var4363
		var4360 = var4364
		
		if var4361 == protoModule.wireTypes.varint then
			local _ = nil
			local var4366, var4367 = protoModule.readVarInt(p227, var4360)
			local _ = var4366
			var4360 = var4367
			continue
		end
		if var4361 == protoModule.wireTypes.lengthDelimited then
			if var4365 == 1 then
				local _ = nil
				local var4368, var4369 = protoModule.readBuffer(p227, var4360)
				var4360 = var4369
				var4359.cta_button_text = buffer.tostring(var4368)
			elseif var4365 == 2 then
				local _ = nil
				local var4370, var4371 = protoModule.readBuffer(p227, var4360)
				var4360 = var4371
				var4359.cta_type = buffer.tostring(var4370)
			else
				local _ = nil
				local var4372, var4373 = protoModule.readVarInt(p227, var4360)
				var4360 = var4373 + var4372
			end
		elseif var4361 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4374, var4375 = protoModule.readFixed32(p227, var4360)
			local _ = var4374
			var4360 = var4375
		elseif var4361 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4376, var4377 = protoModule.readFixed64(p227, var4360)
			local _ = var4376
			var4360 = var4377
		else
			error("Unsupported wire type: " .. var4361)
		end
	end
	return var4359
end

function t_113:jsonEncode() --[[ line: 23812 ]]
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_113:jsonDecode() --[[ line: 23826 ]]
	-- upvalues: t_113 (ref)
	local var4379 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var4379.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4379.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var4379.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var4379.cta_type = self.ctaType
	end
	return var4379
end

t_113.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_113
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p228) --[[ line: 23864 ]]
	-- upvalues: t_114 (ref)
	return setmetatable({
		title = if p228 == nil or p228.title == nil then "" else p228.title,
		cta_button_text = if p228 == nil or p228.cta_button_text == nil then "" else p228.cta_button_text,
		image_asset_id = if p228 == nil or p228.image_asset_id == nil then "" else p228.image_asset_id,
		cta_type = if p228 == nil or p228.cta_type == nil then "" else p228.cta_type
	}, t_114)
end

function t_114:encode() --[[ line: 23873 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4381 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var4382, var4383 = protoModule.writeTag(buff, var4381, 1, protoModule.wireTypes.lengthDelimited)
		var4382, var4383 = protoModule.writeString(var4382, var4383, self.title)
		buff = var4382
		var4381 = var4383
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4384, var4385 = protoModule.writeTag(buff, var4381, 2, protoModule.wireTypes.lengthDelimited)
		var4384, var4385 = protoModule.writeString(var4384, var4385, self.cta_button_text)
		buff = var4384
		var4381 = var4385
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var4386, var4387 = protoModule.writeTag(buff, var4381, 3, protoModule.wireTypes.lengthDelimited)
		var4386, var4387 = protoModule.writeString(var4386, var4387, self.image_asset_id)
		buff = var4386
		var4381 = var4387
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var4388, var4389 = protoModule.writeTag(buff, var4381, 4, protoModule.wireTypes.lengthDelimited)
		var4388, var4389 = protoModule.writeString(var4388, var4389, self.cta_type)
		buff = var4388
		var4381 = var4389
	end
	local buff_1 = buffer.create(var4381)
	buffer.copy(buff_1, 0, buff, 0, var4381)
	
	return buff_1
end

function t_114.decode(p229) --[[ line: 23902 ]]
	-- upvalues: t_114 (ref), protoModule (ref)
	local var4391 = t_114.new()
	local var4392 = 0
	while var4392 < buffer.len(p229) do
		local _ = nil
		local var4393 = nil
		local var4394, var4395, var4396 = protoModule.readTag(p229, var4392)
		local var4397 = var4394
		var4393 = var4395
		var4392 = var4396
		
		if var4393 == protoModule.wireTypes.varint then
			local _ = nil
			local var4398, var4399 = protoModule.readVarInt(p229, var4392)
			local _ = var4398
			var4392 = var4399
			continue
		end
		if var4393 == protoModule.wireTypes.lengthDelimited then
			if var4397 == 1 then
				local _ = nil
				local var4400, var4401 = protoModule.readBuffer(p229, var4392)
				var4392 = var4401
				var4391.title = buffer.tostring(var4400)
			elseif var4397 == 2 then
				local _ = nil
				local var4402, var4403 = protoModule.readBuffer(p229, var4392)
				var4392 = var4403
				var4391.cta_button_text = buffer.tostring(var4402)
			elseif var4397 == 3 then
				local _ = nil
				local var4404, var4405 = protoModule.readBuffer(p229, var4392)
				var4392 = var4405
				var4391.image_asset_id = buffer.tostring(var4404)
			elseif var4397 == 4 then
				local _ = nil
				local var4406, var4407 = protoModule.readBuffer(p229, var4392)
				var4392 = var4407
				var4391.cta_type = buffer.tostring(var4406)
			else
				local _ = nil
				local var4408, var4409 = protoModule.readVarInt(p229, var4392)
				var4392 = var4409 + var4408
			end
		elseif var4393 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4410, var4411 = protoModule.readFixed32(p229, var4392)
			local _ = var4410
			var4392 = var4411
		elseif var4393 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4412, var4413 = protoModule.readFixed64(p229, var4392)
			local _ = var4412
			var4392 = var4413
		else
			error("Unsupported wire type: " .. var4393)
		end
	end
	return var4391
end

function t_114:jsonEncode() --[[ line: 23960 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_114:jsonDecode() --[[ line: 23982 ]]
	-- upvalues: t_114 (ref)
	local var4415 = t_114.new()
	
	if self.title ~= nil then
		var4415.title = self.title
	end
	if self.cta_button_text ~= nil then
		var4415.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4415.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var4415.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4415.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var4415.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var4415.cta_type = self.ctaType
	end
	return var4415
end

t_114.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_114
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p230) --[[ line: 24030 ]]
	-- upvalues: t_115 (ref)
	return setmetatable({
		items = if p230 == nil or p230.items == nil then {} else p230.items,
		sort_id = if p230 == nil or p230.sort_id == nil then "" else p230.sort_id,
		recommendation_request_id = if p230 == nil or p230.recommendation_request_id == nil then "" else p230.recommendation_request_id
	}, t_115)
end

function t_115:encode() --[[ line: 24042 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4417 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4418 = v:encode()
			local var4419, var4420 = protoModule.writeTag(buff, var4417, 1, protoModule.wireTypes.lengthDelimited)
			var4419, var4420 = protoModule.writeBuffer(var4419, var4420, var4418, buffer.len(var4418))
			buff = var4419
			var4417 = var4420
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4421, var4422 = protoModule.writeTag(buff, var4417, 2, protoModule.wireTypes.lengthDelimited)
		var4421, var4422 = protoModule.writeString(var4421, var4422, self.sort_id)
		buff = var4421
		var4417 = var4422
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var4423, var4424 = protoModule.writeTag(buff, var4417, 3, protoModule.wireTypes.lengthDelimited)
		var4423, var4424 = protoModule.writeString(var4423, var4424, self.recommendation_request_id)
		buff = var4423
		var4417 = var4424
	end
	local buff_1 = buffer.create(var4417)
	buffer.copy(buff_1, 0, buff, 0, var4417)
	
	return buff_1
end

function t_115.decode(p231) --[[ line: 24069 ]]
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var4426 = t_115.new()
	local var4427 = 0
	while var4427 < buffer.len(p231) do
		local _ = nil
		local var4428 = nil
		local var4429, var4430, var4431 = protoModule.readTag(p231, var4427)
		local var4432 = var4429
		var4428 = var4430
		var4427 = var4431
		
		if var4428 == protoModule.wireTypes.varint then
			local _ = nil
			local var4433, var4434 = protoModule.readVarInt(p231, var4427)
			local _ = var4433
			var4427 = var4434
			continue
		end
		if var4428 == protoModule.wireTypes.lengthDelimited then
			if var4432 == 1 then
				local _ = nil
				local var4435, var4436 = protoModule.readBuffer(p231, var4427)
				var4427 = var4436
				table.insert(var4426.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var4435))
			elseif var4432 == 2 then
				local _ = nil
				local var4437, var4438 = protoModule.readBuffer(p231, var4427)
				var4427 = var4438
				var4426.sort_id = buffer.tostring(var4437)
			elseif var4432 == 3 then
				local _ = nil
				local var4439, var4440 = protoModule.readBuffer(p231, var4427)
				var4427 = var4440
				var4426.recommendation_request_id = buffer.tostring(var4439)
			else
				local _ = nil
				local var4441, var4442 = protoModule.readVarInt(p231, var4427)
				var4427 = var4442 + var4441
			end
		elseif var4428 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4443, var4444 = protoModule.readFixed32(p231, var4427)
			local _ = var4443
			var4427 = var4444
		elseif var4428 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4445, var4446 = protoModule.readFixed64(p231, var4427)
			local _ = var4445
			var4427 = var4446
		else
			error("Unsupported wire type: " .. var4428)
		end
	end
	return var4426
end

function t_115:jsonEncode() --[[ line: 24125 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		t.recommendationRequestId = self.recommendation_request_id
	end
	return t
end

function t_115:jsonDecode() --[[ line: 24147 ]]
	-- upvalues: t_115 (ref), t (ref)
	local var4449 = t_115.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var4449.items = t_1
	end
	if self.sort_id ~= nil then
		var4449.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4449.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var4449.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var4449.recommendation_request_id = self.recommendationRequestId
	end
	return var4449
end

t_115.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_115
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p232) --[[ line: 24198 ]]
	-- upvalues: t_116 (ref)
	return setmetatable({
		user_id = if p232 == nil or p232.user_id == nil then "" else p232.user_id
	}, t_116)
end

function t_116:encode() --[[ line: 24209 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4452 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var4453, var4454 = protoModule.writeTag(buff, var4452, 1, protoModule.wireTypes.lengthDelimited)
		var4453, var4454 = protoModule.writeString(var4453, var4454, self.user_id)
		buff = var4453
		var4452 = var4454
	end
	local buff_1 = buffer.create(var4452)
	buffer.copy(buff_1, 0, buff, 0, var4452)
	
	return buff_1
end

function t_116.decode(p233) --[[ line: 24225 ]]
	-- upvalues: t_116 (ref), protoModule (ref)
	local var4456 = t_116.new()
	local var4457 = 0
	while var4457 < buffer.len(p233) do
		local _ = nil
		local var4458 = nil
		local var4459, var4460, var4461 = protoModule.readTag(p233, var4457)
		local var4462 = var4459
		var4458 = var4460
		var4457 = var4461
		
		if var4458 == protoModule.wireTypes.varint then
			local _ = nil
			local var4463, var4464 = protoModule.readVarInt(p233, var4457)
			local _ = var4463
			var4457 = var4464
			continue
		end
		if var4458 == protoModule.wireTypes.lengthDelimited then
			if var4462 == 1 then
				local _ = nil
				local var4465, var4466 = protoModule.readBuffer(p233, var4457)
				var4457 = var4466
				var4456.user_id = buffer.tostring(var4465)
			else
				local _ = nil
				local var4467, var4468 = protoModule.readVarInt(p233, var4457)
				var4457 = var4468 + var4467
			end
		elseif var4458 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4469, var4470 = protoModule.readFixed32(p233, var4457)
			local _ = var4469
			var4457 = var4470
		elseif var4458 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4471, var4472 = protoModule.readFixed64(p233, var4457)
			local _ = var4471
			var4457 = var4472
		else
			error("Unsupported wire type: " .. var4458)
		end
	end
	return var4456
end

function t_116:jsonEncode() --[[ line: 24270 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_116:jsonDecode() --[[ line: 24282 ]]
	-- upvalues: t_116 (ref)
	local var4474 = t_116.new()
	
	if self.user_id ~= nil then
		var4474.user_id = self.user_id
	end
	if self.userId ~= nil then
		var4474.user_id = self.userId
	end
	return var4474
end

t_116.descriptor = {
	name = "FriendRecommendationCarouselInputData_UserRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendation"
}
t.FriendRecommendationCarouselInputData_UserRecommendation = t_116
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_UserRecommendation)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p234) --[[ line: 24314 ]]
	-- upvalues: t_117 (ref)
	return setmetatable({
		contact_id = if p234 == nil or p234.contact_id == nil then "" else p234.contact_id
	}, t_117)
end

function t_117:encode() --[[ line: 24325 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4476 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var4477, var4478 = protoModule.writeTag(buff, var4476, 1, protoModule.wireTypes.lengthDelimited)
		var4477, var4478 = protoModule.writeString(var4477, var4478, self.contact_id)
		buff = var4477
		var4476 = var4478
	end
	local buff_1 = buffer.create(var4476)
	buffer.copy(buff_1, 0, buff, 0, var4476)
	
	return buff_1
end

function t_117.decode(p235) --[[ line: 24341 ]]
	-- upvalues: t_117 (ref), protoModule (ref)
	local var4480 = t_117.new()
	local var4481 = 0
	while var4481 < buffer.len(p235) do
		local _ = nil
		local var4482 = nil
		local var4483, var4484, var4485 = protoModule.readTag(p235, var4481)
		local var4486 = var4483
		var4482 = var4484
		var4481 = var4485
		
		if var4482 == protoModule.wireTypes.varint then
			local _ = nil
			local var4487, var4488 = protoModule.readVarInt(p235, var4481)
			local _ = var4487
			var4481 = var4488
			continue
		end
		if var4482 == protoModule.wireTypes.lengthDelimited then
			if var4486 == 1 then
				local _ = nil
				local var4489, var4490 = protoModule.readBuffer(p235, var4481)
				var4481 = var4490
				var4480.contact_id = buffer.tostring(var4489)
			else
				local _ = nil
				local var4491, var4492 = protoModule.readVarInt(p235, var4481)
				var4481 = var4492 + var4491
			end
		elseif var4482 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4493, var4494 = protoModule.readFixed32(p235, var4481)
			local _ = var4493
			var4481 = var4494
		elseif var4482 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4495, var4496 = protoModule.readFixed64(p235, var4481)
			local _ = var4495
			var4481 = var4496
		else
			error("Unsupported wire type: " .. var4482)
		end
	end
	return var4480
end

function t_117:jsonEncode() --[[ line: 24386 ]]
	local t = {}
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		t.contactId = self.contact_id
	end
	return t
end

function t_117:jsonDecode() --[[ line: 24398 ]]
	-- upvalues: t_117 (ref)
	local var4498 = t_117.new()
	
	if self.contact_id ~= nil then
		var4498.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var4498.contact_id = self.contactId
	end
	return var4498
end

t_117.descriptor = {
	name = "FriendRecommendationCarouselInputData_ContactRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactRecommendation"
}
t.FriendRecommendationCarouselInputData_ContactRecommendation = t_117
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_ContactRecommendation)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p236) --[[ line: 24430 ]]
	-- upvalues: t_118 (ref)
	return setmetatable({
		kind = if p236 == nil or p236.kind == nil then nil else p236.kind,
		has_pending_friend_request = if p236 == nil or p236.has_pending_friend_request == nil then false else p236.has_pending_friend_request
	}, t_118)
end

function t_118:encode() --[[ line: 24444 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4500 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var4501 = self.kind.value:encode()
			local var4502, var4503 = protoModule.writeTag(buff, var4500, 1, protoModule.wireTypes.lengthDelimited)
			var4502, var4503 = protoModule.writeBuffer(var4502, var4503, var4501, buffer.len(var4501))
			buff = var4502
			var4500 = var4503
		elseif self.kind.type == "contact" then
			local var4504 = self.kind.value:encode()
			local var4505, var4506 = protoModule.writeTag(buff, var4500, 2, protoModule.wireTypes.lengthDelimited)
			var4505, var4506 = protoModule.writeBuffer(var4505, var4506, var4504, buffer.len(var4504))
			buff = var4505
			var4500 = var4506
		end
	end
	if self.has_pending_friend_request then
		local var4507, var4508 = protoModule.writeTag(buff, var4500, 3, protoModule.wireTypes.varint)
		var4507, var4508 = protoModule.writeVarInt(var4507, var4508, if self.has_pending_friend_request then 1 else 0)
		buff = var4507
		var4500 = var4508
	end
	local buff_1 = buffer.create(var4500)
	buffer.copy(buff_1, 0, buff, 0, var4500)
	
	return buff_1
end

function t_118.decode(p237) --[[ line: 24472 ]]
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var4510 = t_118.new()
	local var4511 = 0
	while var4511 < buffer.len(p237) do
		local _ = nil
		local var4512 = nil
		local var4513, var4514, var4515 = protoModule.readTag(p237, var4511)
		local var4516 = var4513
		var4512 = var4514
		var4511 = var4515
		
		if var4512 == protoModule.wireTypes.varint then
			if var4516 == 3 then
				local _ = nil
				local var4517, var4518 = protoModule.readVarInt(p237, var4511)
				var4511 = var4518
				var4510.has_pending_friend_request = var4517 ~= 0
			else
				local _ = nil
				local var4519, var4520 = protoModule.readVarInt(p237, var4511)
				local _ = var4519
				var4511 = var4520
			end
		end
		if var4512 == protoModule.wireTypes.lengthDelimited then
			if var4516 == 1 then
				local _ = nil
				local var4521, var4522 = protoModule.readBuffer(p237, var4511)
				var4511 = var4522
				var4510.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var4521)
				}
			elseif var4516 == 2 then
				local _ = nil
				local var4523, var4524 = protoModule.readBuffer(p237, var4511)
				var4511 = var4524
				var4510.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var4523)
				}
			else
				local _ = nil
				local var4525, var4526 = protoModule.readVarInt(p237, var4511)
				var4511 = var4526 + var4525
			end
		elseif var4512 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4527, var4528 = protoModule.readFixed32(p237, var4511)
			local _ = var4527
			var4511 = var4528
		elseif var4512 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4529, var4530 = protoModule.readFixed64(p237, var4511)
			local _ = var4529
			var4511 = var4530
		else
			error("Unsupported wire type: " .. var4512)
		end
	end
	return var4510
end

function t_118:jsonEncode() --[[ line: 24533 ]]
	local t = {}
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			t.user = self.kind.value:jsonEncode()
		elseif self.kind.type == "contact" then
			t.contact = self.kind.value:jsonEncode()
		end
	end
	if self.has_pending_friend_request then
		t.hasPendingFriendRequest = self.has_pending_friend_request
	end
	return t
end

function t_118:jsonDecode() --[[ line: 24553 ]]
	-- upvalues: t_118 (ref), t (ref)
	local var4532 = t_118.new()
	
	if self.user ~= nil then
		var4532.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var4532.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var4532.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var4532.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var4532
end

t_118.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_118
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p238) --[[ line: 24598 ]]
	-- upvalues: t_119 (ref)
	return setmetatable({
		selected_option = if p238 == nil or p238.selected_option == nil then "" else p238.selected_option,
		sort_id = if p238 == nil or p238.sort_id == nil then "" else p238.sort_id,
		options = if p238 == nil or p238.options == nil then {} else p238.options,
		experience_carousel = if p238 == nil or p238.experience_carousel == nil then nil else p238.experience_carousel,
		feed_item_key = if p238 == nil or p238.feed_item_key == nil then "" else p238.feed_item_key
	}, t_119)
end

function t_119:encode() --[[ line: 24612 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4534 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var4535, var4536 = protoModule.writeTag(buff, var4534, 1, protoModule.wireTypes.lengthDelimited)
		var4535, var4536 = protoModule.writeString(var4535, var4536, self.selected_option)
		buff = var4535
		var4534 = var4536
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4537, var4538 = protoModule.writeTag(buff, var4534, 2, protoModule.wireTypes.lengthDelimited)
		var4537, var4538 = protoModule.writeString(var4537, var4538, self.sort_id)
		buff = var4537
		var4534 = var4538
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var4539 = v:encode()
			local var4540, var4541 = protoModule.writeTag(buff, var4534, 3, protoModule.wireTypes.lengthDelimited)
			var4540, var4541 = protoModule.writeBuffer(var4540, var4541, var4539, buffer.len(var4539))
			buff = var4540
			var4534 = var4541
		end
	end
	if self.experience_carousel ~= nil then
		local var4542 = self.experience_carousel:encode()
		local var4543, var4544 = protoModule.writeTag(buff, var4534, 4, protoModule.wireTypes.lengthDelimited)
		var4543, var4544 = protoModule.writeBuffer(var4543, var4544, var4542, buffer.len(var4542))
		buff = var4543
		var4534 = var4544
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var4545, var4546 = protoModule.writeTag(buff, var4534, 5, protoModule.wireTypes.lengthDelimited)
		var4545, var4546 = protoModule.writeString(var4545, var4546, self.feed_item_key)
		buff = var4545
		var4534 = var4546
	end
	local buff_1 = buffer.create(var4534)
	buffer.copy(buff_1, 0, buff, 0, var4534)
	
	return buff_1
end

function t_119.decode(p239) --[[ line: 24650 ]]
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var4548 = t_119.new()
	local var4549 = 0
	while var4549 < buffer.len(p239) do
		local _ = nil
		local var4550 = nil
		local var4551, var4552, var4553 = protoModule.readTag(p239, var4549)
		local var4554 = var4551
		var4550 = var4552
		var4549 = var4553
		
		if var4550 == protoModule.wireTypes.varint then
			local _ = nil
			local var4555, var4556 = protoModule.readVarInt(p239, var4549)
			local _ = var4555
			var4549 = var4556
			continue
		end
		if var4550 == protoModule.wireTypes.lengthDelimited then
			if var4554 == 1 then
				local _ = nil
				local var4557, var4558 = protoModule.readBuffer(p239, var4549)
				var4549 = var4558
				var4548.selected_option = buffer.tostring(var4557)
			elseif var4554 == 2 then
				local _ = nil
				local var4559, var4560 = protoModule.readBuffer(p239, var4549)
				var4549 = var4560
				var4548.sort_id = buffer.tostring(var4559)
			elseif var4554 == 3 then
				local _ = nil
				local var4561, var4562 = protoModule.readBuffer(p239, var4549)
				var4549 = var4562
				table.insert(var4548.options, t.SelectorOption.decode(var4561))
			elseif var4554 == 4 then
				local _ = nil
				local var4563, var4564 = protoModule.readBuffer(p239, var4549)
				var4549 = var4564
				var4548.experience_carousel = t.ExperienceCarouselInputData.decode(var4563)
			elseif var4554 == 5 then
				local _ = nil
				local var4565, var4566 = protoModule.readBuffer(p239, var4549)
				var4549 = var4566
				var4548.feed_item_key = buffer.tostring(var4565)
			else
				local _ = nil
				local var4567, var4568 = protoModule.readVarInt(p239, var4549)
				var4549 = var4568 + var4567
			end
		elseif var4550 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4569, var4570 = protoModule.readFixed32(p239, var4549)
			local _ = var4569
			var4549 = var4570
		elseif var4550 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4571, var4572 = protoModule.readFixed64(p239, var4549)
			local _ = var4571
			var4549 = var4572
		else
			error("Unsupported wire type: " .. var4550)
		end
	end
	return var4548
end

function t_119:jsonEncode() --[[ line: 24713 ]]
	local t = {}
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		t.selectedOption = self.selected_option
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		t.sortId = self.sort_id
	end
	if self.options ~= nil and #self.options > 0 then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, v:jsonEncode())
		end
		t.options = t_1
	end
	if self.experience_carousel ~= nil then
		t.experienceCarousel = self.experience_carousel:jsonEncode()
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		t.feedItemKey = self.feed_item_key
	end
	return t
end

function t_119:jsonDecode() --[[ line: 24743 ]]
	-- upvalues: t_119 (ref), t (ref)
	local var4575 = t_119.new()
	
	if self.selected_option ~= nil then
		var4575.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var4575.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var4575.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4575.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var4575.options = t_1
	end
	if self.experience_carousel ~= nil then
		var4575.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var4575.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var4575.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var4575.feed_item_key = self.feedItemKey
	end
	return var4575
end

t_119.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_119
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p240) --[[ line: 24804 ]]
	-- upvalues: t_120 (ref)
	return setmetatable({
		id = if p240 == nil or p240.id == nil then "" else p240.id,
		display_name = if p240 == nil or p240.display_name == nil then "" else p240.display_name,
		is_selected = if p240 == nil or p240.is_selected == nil then false else p240.is_selected
	}, t_120)
end

function t_120:encode() --[[ line: 24812 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4578 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var4579, var4580 = protoModule.writeTag(buff, var4578, 1, protoModule.wireTypes.lengthDelimited)
		var4579, var4580 = protoModule.writeString(var4579, var4580, self.id)
		buff = var4579
		var4578 = var4580
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4581, var4582 = protoModule.writeTag(buff, var4578, 2, protoModule.wireTypes.lengthDelimited)
		var4581, var4582 = protoModule.writeString(var4581, var4582, self.display_name)
		buff = var4581
		var4578 = var4582
	end
	if self.is_selected then
		local var4583, var4584 = protoModule.writeTag(buff, var4578, 3, protoModule.wireTypes.varint)
		var4583, var4584 = protoModule.writeVarInt(var4583, var4584, if self.is_selected then 1 else 0)
		buff = var4583
		var4578 = var4584
	end
	local buff_1 = buffer.create(var4578)
	buffer.copy(buff_1, 0, buff, 0, var4578)
	
	return buff_1
end

function t_120.decode(p241) --[[ line: 24836 ]]
	-- upvalues: t_120 (ref), protoModule (ref)
	local var4586 = t_120.new()
	local var4587 = 0
	while var4587 < buffer.len(p241) do
		local _ = nil
		local var4588 = nil
		local var4589, var4590, var4591 = protoModule.readTag(p241, var4587)
		local var4592 = var4589
		var4588 = var4590
		var4587 = var4591
		
		if var4588 == protoModule.wireTypes.varint then
			if var4592 == 3 then
				local _ = nil
				local var4593, var4594 = protoModule.readVarInt(p241, var4587)
				var4587 = var4594
				var4586.is_selected = var4593 ~= 0
			else
				local _ = nil
				local var4595, var4596 = protoModule.readVarInt(p241, var4587)
				local _ = var4595
				var4587 = var4596
			end
		end
		if var4588 == protoModule.wireTypes.lengthDelimited then
			if var4592 == 1 then
				local _ = nil
				local var4597, var4598 = protoModule.readBuffer(p241, var4587)
				var4587 = var4598
				var4586.id = buffer.tostring(var4597)
			elseif var4592 == 2 then
				local _ = nil
				local var4599, var4600 = protoModule.readBuffer(p241, var4587)
				var4587 = var4600
				var4586.display_name = buffer.tostring(var4599)
			else
				local _ = nil
				local var4601, var4602 = protoModule.readVarInt(p241, var4587)
				var4587 = var4602 + var4601
			end
		elseif var4588 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4603, var4604 = protoModule.readFixed32(p241, var4587)
			local _ = var4603
			var4587 = var4604
		elseif var4588 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4605, var4606 = protoModule.readFixed64(p241, var4587)
			local _ = var4605
			var4587 = var4606
		else
			error("Unsupported wire type: " .. var4588)
		end
	end
	return var4586
end

function t_120:jsonEncode() --[[ line: 24889 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		t.displayName = self.display_name
	end
	if self.is_selected then
		t.isSelected = self.is_selected
	end
	return t
end

function t_120:jsonDecode() --[[ line: 24907 ]]
	-- upvalues: t_120 (ref)
	local var4608 = t_120.new()
	
	if self.id ~= nil then
		var4608.id = self.id
	end
	if self.display_name ~= nil then
		var4608.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var4608.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var4608.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var4608.is_selected = self.isSelected
	end
	return var4608
end

t_120.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_120
typeRegistryModule.default:register(t.SelectorOption)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p242) --[[ line: 24947 ]]
	-- upvalues: t_121 (ref)
	return setmetatable({
		cards = if p242 == nil or p242.cards == nil then {} else p242.cards,
		title = if p242 == nil or p242.title == nil then "" else p242.title
	}, t_121)
end

function t_121:encode() --[[ line: 24956 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4610 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var4611 = v:encode()
			local var4612, var4613 = protoModule.writeTag(buff, var4610, 1, protoModule.wireTypes.lengthDelimited)
			var4612, var4613 = protoModule.writeBuffer(var4612, var4613, var4611, buffer.len(var4611))
			buff = var4612
			var4610 = var4613
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var4614, var4615 = protoModule.writeTag(buff, var4610, 2, protoModule.wireTypes.lengthDelimited)
		var4614, var4615 = protoModule.writeString(var4614, var4615, self.title)
		buff = var4614
		var4610 = var4615
	end
	local buff_1 = buffer.create(var4610)
	buffer.copy(buff_1, 0, buff, 0, var4610)
	
	return buff_1
end

function t_121.decode(p243) --[[ line: 24978 ]]
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var4617 = t_121.new()
	local var4618 = 0
	while var4618 < buffer.len(p243) do
		local _ = nil
		local var4619 = nil
		local var4620, var4621, var4622 = protoModule.readTag(p243, var4618)
		local var4623 = var4620
		var4619 = var4621
		var4618 = var4622
		
		if var4619 == protoModule.wireTypes.varint then
			local _ = nil
			local var4624, var4625 = protoModule.readVarInt(p243, var4618)
			local _ = var4624
			var4618 = var4625
			continue
		end
		if var4619 == protoModule.wireTypes.lengthDelimited then
			if var4623 == 1 then
				local _ = nil
				local var4626, var4627 = protoModule.readBuffer(p243, var4618)
				var4618 = var4627
				table.insert(var4617.cards, t.GameItemsCardInputData.decode(var4626))
			elseif var4623 == 2 then
				local _ = nil
				local var4628, var4629 = protoModule.readBuffer(p243, var4618)
				var4618 = var4629
				var4617.title = buffer.tostring(var4628)
			else
				local _ = nil
				local var4630, var4631 = protoModule.readVarInt(p243, var4618)
				var4618 = var4631 + var4630
			end
		elseif var4619 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4632, var4633 = protoModule.readFixed32(p243, var4618)
			local _ = var4632
			var4618 = var4633
		elseif var4619 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4634, var4635 = protoModule.readFixed64(p243, var4618)
			local _ = var4634
			var4618 = var4635
		else
			error("Unsupported wire type: " .. var4619)
		end
	end
	return var4617
end

function t_121:jsonEncode() --[[ line: 25026 ]]
	local t = {}
	
	if self.cards ~= nil and #self.cards > 0 then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, v:jsonEncode())
		end
		t.cards = t_1
	end
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	return t
end

function t_121:jsonDecode() --[[ line: 25044 ]]
	-- upvalues: t_121 (ref), t (ref)
	local var4638 = t_121.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var4638.cards = t_1
	end
	if self.title ~= nil then
		var4638.title = self.title
	end
	return var4638
end

t_121.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_121
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p244) --[[ line: 25077 ]]
	-- upvalues: t_122 (ref)
	return setmetatable({
		universe_id = if p244 == nil or p244.universe_id == nil then "" else p244.universe_id,
		items = if p244 == nil or p244.items == nil then {} else p244.items
	}, t_122)
end

function t_122:encode() --[[ line: 25084 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4641 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var4642, var4643 = protoModule.writeTag(buff, var4641, 1, protoModule.wireTypes.lengthDelimited)
		var4642, var4643 = protoModule.writeString(var4642, var4643, self.universe_id)
		buff = var4642
		var4641 = var4643
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4644 = v:encode()
			local var4645, var4646 = protoModule.writeTag(buff, var4641, 2, protoModule.wireTypes.lengthDelimited)
			var4645, var4646 = protoModule.writeBuffer(var4645, var4646, var4644, buffer.len(var4644))
			buff = var4645
			var4641 = var4646
		end
	end
	local buff_1 = buffer.create(var4641)
	buffer.copy(buff_1, 0, buff, 0, var4641)
	
	return buff_1
end

function t_122.decode(p245) --[[ line: 25106 ]]
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var4648 = t_122.new()
	local var4649 = 0
	while var4649 < buffer.len(p245) do
		local _ = nil
		local var4650 = nil
		local var4651, var4652, var4653 = protoModule.readTag(p245, var4649)
		local var4654 = var4651
		var4650 = var4652
		var4649 = var4653
		
		if var4650 == protoModule.wireTypes.varint then
			local _ = nil
			local var4655, var4656 = protoModule.readVarInt(p245, var4649)
			local _ = var4655
			var4649 = var4656
			continue
		end
		if var4650 == protoModule.wireTypes.lengthDelimited then
			if var4654 == 1 then
				local _ = nil
				local var4657, var4658 = protoModule.readBuffer(p245, var4649)
				var4649 = var4658
				var4648.universe_id = buffer.tostring(var4657)
			elseif var4654 == 2 then
				local _ = nil
				local var4659, var4660 = protoModule.readBuffer(p245, var4649)
				var4649 = var4660
				table.insert(var4648.items, t.GameItemInputData.decode(var4659))
			else
				local _ = nil
				local var4661, var4662 = protoModule.readVarInt(p245, var4649)
				var4649 = var4662 + var4661
			end
		elseif var4650 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4663, var4664 = protoModule.readFixed32(p245, var4649)
			local _ = var4663
			var4649 = var4664
		elseif var4650 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4665, var4666 = protoModule.readFixed64(p245, var4649)
			local _ = var4665
			var4649 = var4666
		else
			error("Unsupported wire type: " .. var4650)
		end
	end
	return var4648
end

function t_122:jsonEncode() --[[ line: 25154 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	return t
end

function t_122:jsonDecode() --[[ line: 25172 ]]
	-- upvalues: t_122 (ref), t (ref)
	local var4669 = t_122.new()
	
	if self.universe_id ~= nil then
		var4669.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var4669.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var4669.items = t_1
	end
	return var4669
end

t_122.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_122
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p246) --[[ line: 25209 ]]
	-- upvalues: t_123 (ref)
	return setmetatable({
		item_id = if p246 == nil or p246.item_id == nil then "" else p246.item_id,
		item_type = if p246 == nil or p246.item_type == nil then "" else p246.item_type
	}, t_123)
end

function t_123:encode() --[[ line: 25216 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4672 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var4673, var4674 = protoModule.writeTag(buff, var4672, 1, protoModule.wireTypes.lengthDelimited)
		var4673, var4674 = protoModule.writeString(var4673, var4674, self.item_id)
		buff = var4673
		var4672 = var4674
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var4675, var4676 = protoModule.writeTag(buff, var4672, 2, protoModule.wireTypes.lengthDelimited)
		var4675, var4676 = protoModule.writeString(var4675, var4676, self.item_type)
		buff = var4675
		var4672 = var4676
	end
	local buff_1 = buffer.create(var4672)
	buffer.copy(buff_1, 0, buff, 0, var4672)
	
	return buff_1
end

function t_123.decode(p247) --[[ line: 25235 ]]
	-- upvalues: t_123 (ref), protoModule (ref)
	local var4678 = t_123.new()
	local var4679 = 0
	while var4679 < buffer.len(p247) do
		local _ = nil
		local var4680 = nil
		local var4681, var4682, var4683 = protoModule.readTag(p247, var4679)
		local var4684 = var4681
		var4680 = var4682
		var4679 = var4683
		
		if var4680 == protoModule.wireTypes.varint then
			local _ = nil
			local var4685, var4686 = protoModule.readVarInt(p247, var4679)
			local _ = var4685
			var4679 = var4686
			continue
		end
		if var4680 == protoModule.wireTypes.lengthDelimited then
			if var4684 == 1 then
				local _ = nil
				local var4687, var4688 = protoModule.readBuffer(p247, var4679)
				var4679 = var4688
				var4678.item_id = buffer.tostring(var4687)
			elseif var4684 == 2 then
				local _ = nil
				local var4689, var4690 = protoModule.readBuffer(p247, var4679)
				var4679 = var4690
				var4678.item_type = buffer.tostring(var4689)
			else
				local _ = nil
				local var4691, var4692 = protoModule.readVarInt(p247, var4679)
				var4679 = var4692 + var4691
			end
		elseif var4680 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4693, var4694 = protoModule.readFixed32(p247, var4679)
			local _ = var4693
			var4679 = var4694
		elseif var4680 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4695, var4696 = protoModule.readFixed64(p247, var4679)
			local _ = var4695
			var4679 = var4696
		else
			error("Unsupported wire type: " .. var4680)
		end
	end
	return var4678
end

function t_123:jsonEncode() --[[ line: 25283 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_123:jsonDecode() --[[ line: 25297 ]]
	-- upvalues: t_123 (ref)
	local var4698 = t_123.new()
	
	if self.item_id ~= nil then
		var4698.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var4698.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var4698.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var4698.item_type = self.itemType
	end
	return var4698
end

t_123.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_123
typeRegistryModule.default:register(t.GameItemInputData)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p248) --[[ line: 25333 ]]
	-- upvalues: t_124 (ref)
	return setmetatable({
		layout = if p248 == nil or p248.layout == nil then nil else p248.layout,
		kind = if p248 == nil or p248.kind == nil then nil else p248.kind
	}, t_124)
end

function t_124:encode() --[[ line: 25340 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4700 = 0
	
	if self.layout ~= nil then
		local var4701 = self.layout:encode()
		local var4702, var4703 = protoModule.writeTag(buff, var4700, 1, protoModule.wireTypes.lengthDelimited)
		var4702, var4703 = protoModule.writeBuffer(var4702, var4703, var4701, buffer.len(var4701))
		buff = var4702
		var4700 = var4703
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		local var4704 = self.kind.value:encode()
		local var4705, var4706 = protoModule.writeTag(buff, var4700, 2, protoModule.wireTypes.lengthDelimited)
		var4705, var4706 = protoModule.writeBuffer(var4705, var4706, var4704, buffer.len(var4704))
		buff = var4705
		var4700 = var4706
	end
	local buff_1 = buffer.create(var4700)
	buffer.copy(buff_1, 0, buff, 0, var4700)
	
	return buff_1
end

function t_124.decode(p249) --[[ line: 25363 ]]
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var4708 = t_124.new()
	local var4709 = 0
	while var4709 < buffer.len(p249) do
		local _ = nil
		local var4710 = nil
		local var4711, var4712, var4713 = protoModule.readTag(p249, var4709)
		local var4714 = var4711
		var4710 = var4712
		var4709 = var4713
		
		if var4710 == protoModule.wireTypes.varint then
			local _ = nil
			local var4715, var4716 = protoModule.readVarInt(p249, var4709)
			local _ = var4715
			var4709 = var4716
			continue
		end
		if var4710 == protoModule.wireTypes.lengthDelimited then
			if var4714 == 1 then
				local _ = nil
				local var4717, var4718 = protoModule.readBuffer(p249, var4709)
				var4709 = var4718
				var4708.layout = t.ItemLayout.decode(var4717)
			elseif var4714 == 2 then
				local _ = nil
				local var4719, var4720 = protoModule.readBuffer(p249, var4709)
				var4709 = var4720
				var4708.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var4719)
				}
			else
				local _ = nil
				local var4721, var4722 = protoModule.readVarInt(p249, var4709)
				var4709 = var4722 + var4721
			end
		elseif var4710 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4723, var4724 = protoModule.readFixed32(p249, var4709)
			local _ = var4723
			var4709 = var4724
		elseif var4710 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4725, var4726 = protoModule.readFixed64(p249, var4709)
			local _ = var4725
			var4709 = var4726
		else
			error("Unsupported wire type: " .. var4710)
		end
	end
	return var4708
end

function t_124:jsonEncode() --[[ line: 25412 ]]
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		t.universe = self.kind.value:jsonEncode()
	end
	return t
end

function t_124:jsonDecode() --[[ line: 25428 ]]
	-- upvalues: t_124 (ref), t (ref)
	local var4728 = t_124.new()
	
	if self.layout ~= nil then
		var4728.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var4728.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	return var4728
end

t_124.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_124
typeRegistryModule.default:register(t.ItemWithLayout)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p250) --[[ line: 25459 ]]
	-- upvalues: t_125 (ref)
	return setmetatable({
		items = if p250 == nil or p250.items == nil then {} else p250.items,
		collection_item_size = if p250 == nil or p250.collection_item_size == nil then nil else p250.collection_item_size
	}, t_125)
end

function t_125:encode() --[[ line: 25468 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4730 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4731 = v:encode()
			local var4732, var4733 = protoModule.writeTag(buff, var4730, 1, protoModule.wireTypes.lengthDelimited)
			var4732, var4733 = protoModule.writeBuffer(var4732, var4733, var4731, buffer.len(var4731))
			buff = var4732
			var4730 = var4733
		end
	end
	if self.collection_item_size ~= nil then
		local var4734, var4735 = protoModule.writeTag(buff, var4730, 2, protoModule.wireTypes.lengthDelimited)
		var4734, var4735 = protoModule.writeString(var4734, var4735, self.collection_item_size)
		buff = var4734
		var4730 = var4735
	end
	local buff_1 = buffer.create(var4730)
	buffer.copy(buff_1, 0, buff, 0, var4730)
	
	return buff_1
end

function t_125.decode(p251) --[[ line: 25490 ]]
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var4737 = t_125.new()
	local var4738 = 0
	while var4738 < buffer.len(p251) do
		local _ = nil
		local var4739 = nil
		local var4740, var4741, var4742 = protoModule.readTag(p251, var4738)
		local var4743 = var4740
		var4739 = var4741
		var4738 = var4742
		
		if var4739 == protoModule.wireTypes.varint then
			local _ = nil
			local var4744, var4745 = protoModule.readVarInt(p251, var4738)
			local _ = var4744
			var4738 = var4745
			continue
		end
		if var4739 == protoModule.wireTypes.lengthDelimited then
			if var4743 == 1 then
				local _ = nil
				local var4746, var4747 = protoModule.readBuffer(p251, var4738)
				var4738 = var4747
				table.insert(var4737.items, t.ItemWithLayout.decode(var4746))
			elseif var4743 == 2 then
				local _ = nil
				local var4748, var4749 = protoModule.readBuffer(p251, var4738)
				var4738 = var4749
				var4737.collection_item_size = buffer.tostring(var4748)
			else
				local _ = nil
				local var4750, var4751 = protoModule.readVarInt(p251, var4738)
				var4738 = var4751 + var4750
			end
		elseif var4739 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4752, var4753 = protoModule.readFixed32(p251, var4738)
			local _ = var4752
			var4738 = var4753
		elseif var4739 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4754, var4755 = protoModule.readFixed64(p251, var4738)
			local _ = var4754
			var4738 = var4755
		else
			error("Unsupported wire type: " .. var4739)
		end
	end
	return var4737
end

function t_125:jsonEncode() --[[ line: 25538 ]]
	local t = {}
	
	if self.items ~= nil and #self.items > 0 then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, v:jsonEncode())
		end
		t.items = t_1
	end
	if self.collection_item_size ~= nil then
		t.collectionItemSize = self.collection_item_size
	end
	return t
end

function t_125:jsonDecode() --[[ line: 25556 ]]
	-- upvalues: t_125 (ref), t (ref)
	local var4758 = t_125.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var4758.items = t_1
	end
	if self.collection_item_size ~= nil then
		var4758.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var4758.collection_item_size = self.collectionItemSize
	end
	return var4758
end

t_125.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_125
typeRegistryModule.default:register(t.ContentPool)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p252) --[[ line: 25593 ]]
	-- upvalues: t_126 (ref)
	return setmetatable({
		col_span = if p252 == nil or p252.col_span == nil then 0 else p252.col_span,
		row_span = if p252 == nil or p252.row_span == nil then 0 else p252.row_span,
		alignment_type = if p252 == nil or p252.alignment_type == nil then "" else p252.alignment_type,
		min_row_padding = if p252 == nil or p252.min_row_padding == nil then 0 else p252.min_row_padding
	}, t_126)
end

function t_126:encode() --[[ line: 25602 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4761 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var4762, var4763 = protoModule.writeTag(buff, var4761, 1, protoModule.wireTypes.varint)
		var4762, var4763 = protoModule.writeVarInt(var4762, var4763, self.col_span)
		buff = var4762
		var4761 = var4763
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var4764, var4765 = protoModule.writeTag(buff, var4761, 2, protoModule.wireTypes.varint)
		var4764, var4765 = protoModule.writeVarInt(var4764, var4765, self.row_span)
		buff = var4764
		var4761 = var4765
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var4766, var4767 = protoModule.writeTag(buff, var4761, 3, protoModule.wireTypes.lengthDelimited)
		var4766, var4767 = protoModule.writeString(var4766, var4767, self.alignment_type)
		buff = var4766
		var4761 = var4767
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var4768, var4769 = protoModule.writeTag(buff, var4761, 4, protoModule.wireTypes.varint)
		var4768, var4769 = protoModule.writeVarInt(var4768, var4769, self.min_row_padding)
		buff = var4768
		var4761 = var4769
	end
	local buff_1 = buffer.create(var4761)
	buffer.copy(buff_1, 0, buff, 0, var4761)
	
	return buff_1
end

function t_126.decode(p253) --[[ line: 25631 ]]
	-- upvalues: t_126 (ref), protoModule (ref)
	local var4771 = t_126.new()
	local var4772 = 0
	while var4772 < buffer.len(p253) do
		local _ = nil
		local var4773 = nil
		local var4774, var4775, var4776 = protoModule.readTag(p253, var4772)
		local var4777 = var4774
		var4773 = var4775
		var4772 = var4776
		
		if var4773 == protoModule.wireTypes.varint then
			if var4777 == 1 then
				local _ = nil
				local var4778, var4779 = protoModule.readVarIntI32(p253, var4772)
				var4772 = var4779
				var4771.col_span = var4778
			elseif var4777 == 2 then
				local _ = nil
				local var4780, var4781 = protoModule.readVarIntI32(p253, var4772)
				var4772 = var4781
				var4771.row_span = var4780
			elseif var4777 == 4 then
				local _ = nil
				local var4782, var4783 = protoModule.readVarIntI32(p253, var4772)
				var4772 = var4783
				var4771.min_row_padding = var4782
			else
				local _ = nil
				local var4784, var4785 = protoModule.readVarInt(p253, var4772)
				local _ = var4784
				var4772 = var4785
			end
		end
		if var4773 == protoModule.wireTypes.lengthDelimited then
			if var4777 == 3 then
				local _ = nil
				local var4786, var4787 = protoModule.readBuffer(p253, var4772)
				var4772 = var4787
				var4771.alignment_type = buffer.tostring(var4786)
			else
				local _ = nil
				local var4788, var4789 = protoModule.readVarInt(p253, var4772)
				var4772 = var4789 + var4788
			end
		elseif var4773 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4790, var4791 = protoModule.readFixed32(p253, var4772)
			local _ = var4790
			var4772 = var4791
		elseif var4773 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4792, var4793 = protoModule.readFixed64(p253, var4772)
			local _ = var4792
			var4772 = var4793
		else
			error("Unsupported wire type: " .. var4773)
		end
	end
	return var4771
end

function t_126:jsonEncode() --[[ line: 25689 ]]
	local t = {}
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		t.colSpan = self.col_span
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		t.rowSpan = self.row_span
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		t.alignmentType = self.alignment_type
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		t.minRowPadding = self.min_row_padding
	end
	return t
end

function t_126:jsonDecode() --[[ line: 25711 ]]
	-- upvalues: t_126 (ref)
	local var4795 = t_126.new()
	
	if self.col_span ~= nil then
		var4795.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var4795.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var4795.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var4795.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var4795.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var4795.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var4795.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var4795.min_row_padding = self.minRowPadding
	end
	return var4795
end

t_126.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_126
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p254) --[[ line: 25760 ]]
		return if p254 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p254 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p255) --[[ line: 25770 ]]
		return if p255 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p255 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p255
	end,
	fromName = function(p256) --[[ line: 25780 ]]
		return if p256 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p256 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end
}

return {
	UniversalPageEntry = t.UniversalPageEntry,
	FeedEntry = t.FeedEntry,
	ForegroundHeaderEntry = t.ForegroundHeaderEntry,
	BackgroundHeaderEntry = t.BackgroundHeaderEntry,
	PageEntryInputData = t.PageEntryInputData,
	BadgesGridInputData = t.BadgesGridInputData,
	BadgesGridInputData_BadgeInputData = t.BadgesGridInputData_BadgeInputData,
	BadgeDetailsInputData = t.BadgeDetailsInputData,
	BadgeDetailsInputData_LocalizedLiterals = t.BadgeDetailsInputData_LocalizedLiterals,
	BadgeDetailsInputData_LocalizedLiterals_InfoTable = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable,
	BadgeDetailsInputData_LocalizedLiterals_ActionModule = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule,
	BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu,
	StaticInputData = t.StaticInputData,
	ExperienceDetailsFeedInputData = t.ExperienceDetailsFeedInputData,
	EntryOrder = t.EntryOrder,
	ExperienceDetailsActionBarInputData = t.ExperienceDetailsActionBarInputData,
	ExperienceDetailsBannerImageInputData = t.ExperienceDetailsBannerImageInputData,
	ExperienceDetailsStickyHeaderInputData = t.ExperienceDetailsStickyHeaderInputData,
	ExperienceAttributionRowInputData = t.ExperienceAttributionRowInputData,
	ExperienceActionModuleInputData = t.ExperienceActionModuleInputData,
	ExperienceActionModuleInputData_ConnectionPlayedUser = t.ExperienceActionModuleInputData_ConnectionPlayedUser,
	ExperienceMediaGalleryInputData = t.ExperienceMediaGalleryInputData,
	ExperienceMediaGalleryInputData_MediaItem = t.ExperienceMediaGalleryInputData_MediaItem,
	ExperienceDescriptionInputData = t.ExperienceDescriptionInputData,
	ExperienceStatRowInputData = t.ExperienceStatRowInputData,
	ExperienceInfoTableInputData = t.ExperienceInfoTableInputData,
	ExperienceContentRatingLabelInputData = t.ExperienceContentRatingLabelInputData,
	ExperienceRefundPolicyInputData = t.ExperienceRefundPolicyInputData,
	ExperiencePlayWithRewardInputData = t.ExperiencePlayWithRewardInputData,
	CommunitySectionInputData = t.CommunitySectionInputData,
	SocialLinkRowInputData = t.SocialLinkRowInputData,
	SocialLinkRowInputData_SocialLinkItem = t.SocialLinkRowInputData_SocialLinkItem,
	ExperienceCarouselInputData = t.ExperienceCarouselInputData,
	ExperienceCarouselInputData_UniverseItem = t.ExperienceCarouselInputData_UniverseItem,
	SongCarouselInputData = t.SongCarouselInputData,
	SongCarouselInputData_SongItem = t.SongCarouselInputData_SongItem,
	EventsCarouselInputData = t.EventsCarouselInputData,
	EventsCarouselInputData_EventItem = t.EventsCarouselInputData_EventItem,
	DevStoreFeedInputData = t.DevStoreFeedInputData,
	GamePassCollectionInputData = t.GamePassCollectionInputData,
	GamePassCollectionInputData_GamePassItem = t.GamePassCollectionInputData_GamePassItem,
	DeveloperProductCollectionInputData = t.DeveloperProductCollectionInputData,
	DeveloperProductCollectionInputData_DeveloperProductItem = t.DeveloperProductCollectionInputData_DeveloperProductItem,
	SubscriptionCollectionInputData = t.SubscriptionCollectionInputData,
	SubscriptionCollectionInputData_SubscriptionItem = t.SubscriptionCollectionInputData_SubscriptionItem,
	DynamicStoreCategoryInputData = t.DynamicStoreCategoryInputData,
	DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem,
	DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType,
	CardContainerCardInputData = t.CardContainerCardInputData,
	CommunitiesCardClientAttributes = t.CommunitiesCardClientAttributes,
	CardContainerInputData = t.CardContainerInputData,
	CardInputData = t.CardInputData,
	DialogInputData = t.DialogInputData,
	IncomingTransferContent = t.IncomingTransferContent,
	BannerInputData = t.BannerInputData,
	TooltipInputData = t.TooltipInputData,
	CoachmarkInputData = t.CoachmarkInputData,
	SystemBannerInputData = t.SystemBannerInputData,
	AgeCheckUpsellInputData = t.AgeCheckUpsellInputData,
	PartyChatConversationUpsellInputData = t.PartyChatConversationUpsellInputData,
	EventDetailsFeedInputData = t.EventDetailsFeedInputData,
	EventDetailsActionBarInputData = t.EventDetailsActionBarInputData,
	EventDescriptionInputData = t.EventDescriptionInputData,
	EventAttributionRowInputData = t.EventAttributionRowInputData,
	EventAttributionRowInputData_RsvpUser = t.EventAttributionRowInputData_RsvpUser,
	EventInfoTableInputData = t.EventInfoTableInputData,
	EventDetailsSheetFullBleedInputData = t.EventDetailsSheetFullBleedInputData,
	EventNotificationsModalInputData = t.EventNotificationsModalInputData,
	ChartsFeedInputData = t.ChartsFeedInputData,
	FilterPillsInputData = t.FilterPillsInputData,
	FilterPillsInputData_FilterGroup = t.FilterPillsInputData_FilterGroup,
	FilterPillsInputData_FilterOption = t.FilterPillsInputData_FilterOption,
	SortSelectorInputData = t.SortSelectorInputData,
	SortSelectorInputData_SortOption = t.SortSelectorInputData_SortOption,
	ChartsGenreSelectorInputData = t.ChartsGenreSelectorInputData,
	UAMarketplaceCatalogItemGroupInputData = t.UAMarketplaceCatalogItemGroupInputData,
	UAMarketplaceCatalogItemCarouselInputData = t.UAMarketplaceCatalogItemCarouselInputData,
	WidgetStyleData = t.WidgetStyleData,
	UAMarketplaceCatalogHeroUnitInputData = t.UAMarketplaceCatalogHeroUnitInputData,
	UAMarketplaceCatalogFeedInputData = t.UAMarketplaceCatalogFeedInputData,
	UAMarketplaceCatalogCategoryMenuInputData = t.UAMarketplaceCatalogCategoryMenuInputData,
	UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem,
	MarketplaceOfferModalInputData = t.MarketplaceOfferModalInputData,
	CatalogItemGridInputData = t.CatalogItemGridInputData,
	CatalogItemGridInputData_CatalogItem = t.CatalogItemGridInputData_CatalogItem,
	SearchResultsFeedInputData = t.SearchResultsFeedInputData,
	ExperienceEmphasisTileInputData = t.ExperienceEmphasisTileInputData,
	PowerSearchAIOverviewInputData = t.PowerSearchAIOverviewInputData,
	UserListInputData = t.UserListInputData,
	UserListInputData_UserItem = t.UserListInputData_UserItem,
	CatalogItemListInputData = t.CatalogItemListInputData,
	CatalogItemListInputData_CatalogItem = t.CatalogItemListInputData_CatalogItem,
	ExperienceGuidelinesDialogInputData = t.ExperienceGuidelinesDialogInputData,
	MomentsCarouselInputData = t.MomentsCarouselInputData,
	MomentsCarouselInputData_MomentItem = t.MomentsCarouselInputData_MomentItem,
	AttributionRowInputData = t.AttributionRowInputData,
	CtaButtonsInputData = t.CtaButtonsInputData,
	ImageInputData = t.ImageInputData,
	VideoInputData = t.VideoInputData,
	TextInputData = t.TextInputData,
	VerticalFeedInputData = t.VerticalFeedInputData,
	PageHeaderInputData = t.PageHeaderInputData,
	PreAuthLandingStickyHeaderInputData = t.PreAuthLandingStickyHeaderInputData,
	ImageCtaSectionInputData = t.ImageCtaSectionInputData,
	FriendRecommendationCarouselInputData = t.FriendRecommendationCarouselInputData,
	FriendRecommendationCarouselInputData_UserRecommendation = t.FriendRecommendationCarouselInputData_UserRecommendation,
	FriendRecommendationCarouselInputData_ContactRecommendation = t.FriendRecommendationCarouselInputData_ContactRecommendation,
	FriendRecommendationCarouselInputData_RecommendationItem = t.FriendRecommendationCarouselInputData_RecommendationItem,
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	GameItemsCarouselInputData = t.GameItemsCarouselInputData,
	GameItemsCardInputData = t.GameItemsCardInputData,
	GameItemInputData = t.GameItemInputData,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	PageEntryFormat = t.PageEntryFormat
}