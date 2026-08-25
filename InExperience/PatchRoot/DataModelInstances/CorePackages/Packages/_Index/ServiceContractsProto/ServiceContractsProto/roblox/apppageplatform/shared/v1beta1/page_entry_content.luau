local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local pageEntryModule = require(script.Parent.page_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0)
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entry = if p0 == nil or p0.page_entry == nil then nil else p0.page_entry,
		input_data = if p0 == nil or p0.input_data == nil then nil else p0.input_data
	}, t_1)
end

function t_1:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var136 = 0
	
	if self.page_entry ~= nil then
		local var137 = self.page_entry:encode()
		local var138, var139 = protoModule.writeTag(buff, var136, 1, protoModule.wireTypes.lengthDelimited)
		var138, var139 = protoModule.writeBuffer(var138, var139, var137, buffer.len(var137))
		buff = var138
		var136 = var139
	end
	if self.input_data ~= nil then
		local var140 = self.input_data:encode()
		local var141, var142 = protoModule.writeTag(buff, var136, 2, protoModule.wireTypes.lengthDelimited)
		var141, var142 = protoModule.writeBuffer(var141, var142, var140, buffer.len(var140))
		buff = var141
		var136 = var142
	end
	local buff_1 = buffer.create(var136)
	buffer.copy(buff_1, 0, buff, 0, var136)
	
	return buff_1
end

function t_1.decode(p1)
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var144 = t_1.new()
	local var145 = 0
	while var145 < buffer.len(p1) do
		local _ = nil
		local var146 = nil
		local var147, var148, var149 = protoModule.readTag(p1, var145)
		local var150 = var147
		var146 = var148
		var145 = var149
		
		if var146 == protoModule.wireTypes.varint then
			local _ = nil
			local var151, var152 = protoModule.readVarInt(p1, var145)
			local _ = var151
			var145 = var152
			continue
		end
		if var146 == protoModule.wireTypes.lengthDelimited then
			if var150 == 1 then
				local _ = nil
				local var153, var154 = protoModule.readBuffer(p1, var145)
				var145 = var154
				var144.page_entry = pageEntryModule.PageEntry.decode(var153)
			elseif var150 == 2 then
				local _ = nil
				local var155, var156 = protoModule.readBuffer(p1, var145)
				var145 = var156
				var144.input_data = t.PageEntryInputData.decode(var155)
			else
				local _ = nil
				local var157, var158 = protoModule.readVarInt(p1, var145)
				var145 = var158 + var157
			end
		elseif var146 == protoModule.wireTypes.i32 then
			local _ = nil
			local var159, var160 = protoModule.readFixed32(p1, var145)
			local _ = var159
			var145 = var160
		elseif var146 == protoModule.wireTypes.i64 then
			local _ = nil
			local var161, var162 = protoModule.readFixed64(p1, var145)
			local _ = var161
			var145 = var162
		else
			error("Unsupported wire type: " .. var146)
		end
	end
	return var144
end

function t_1:jsonEncode()
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function t_1:jsonDecode()
	-- upvalues: t_1 (ref), pageEntryModule (ref), t (ref)
	local var164 = t_1.new()
	
	if self.page_entry ~= nil then
		var164.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var164.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var164.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var164.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var164
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2)
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p2 == nil or p2.input_data == nil then nil else p2.input_data,
		roblox_component = if p2 == nil or p2.roblox_component == nil then "" else p2.roblox_component
	}, t_2)
end

function t_2:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var166 = 0
	
	if self.input_data ~= nil then
		local var167 = self.input_data:encode()
		local var168, var169 = protoModule.writeTag(buff, var166, 1, protoModule.wireTypes.lengthDelimited)
		var168, var169 = protoModule.writeBuffer(var168, var169, var167, buffer.len(var167))
		buff = var168
		var166 = var169
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var170, var171 = protoModule.writeTag(buff, var166, 2, protoModule.wireTypes.lengthDelimited)
		var170, var171 = protoModule.writeString(var170, var171, self.roblox_component)
		buff = var170
		var166 = var171
	end
	local buff_1 = buffer.create(var166)
	buffer.copy(buff_1, 0, buff, 0, var166)
	
	return buff_1
end

function t_2.decode(p3)
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var173 = t_2.new()
	local var174 = 0
	while var174 < buffer.len(p3) do
		local _ = nil
		local var175 = nil
		local var176, var177, var178 = protoModule.readTag(p3, var174)
		local var179 = var176
		var175 = var177
		var174 = var178
		
		if var175 == protoModule.wireTypes.varint then
			local _ = nil
			local var180, var181 = protoModule.readVarInt(p3, var174)
			local _ = var180
			var174 = var181
			continue
		end
		if var175 == protoModule.wireTypes.lengthDelimited then
			if var179 == 1 then
				local _ = nil
				local var182, var183 = protoModule.readBuffer(p3, var174)
				var174 = var183
				var173.input_data = t.PageEntryInputData.decode(var182)
			elseif var179 == 2 then
				local _ = nil
				local var184, var185 = protoModule.readBuffer(p3, var174)
				var174 = var185
				var173.roblox_component = buffer.tostring(var184)
			else
				local _ = nil
				local var186, var187 = protoModule.readVarInt(p3, var174)
				var174 = var187 + var186
			end
		elseif var175 == protoModule.wireTypes.i32 then
			local _ = nil
			local var188, var189 = protoModule.readFixed32(p3, var174)
			local _ = var188
			var174 = var189
		elseif var175 == protoModule.wireTypes.i64 then
			local _ = nil
			local var190, var191 = protoModule.readFixed64(p3, var174)
			local _ = var190
			var174 = var191
		else
			error("Unsupported wire type: " .. var175)
		end
	end
	return var173
end

function t_2:jsonEncode()
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_2:jsonDecode()
	-- upvalues: t_2 (ref), t (ref)
	local var193 = t_2.new()
	
	if self.input_data ~= nil then
		var193.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var193.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var193.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var193.roblox_component = self.robloxComponent
	end
	return var193
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p4 == nil or p4.roblox_component == nil then "" else p4.roblox_component,
		input_data = if p4 == nil or p4.input_data == nil then nil else p4.input_data,
		cta_buttons = if p4 == nil or p4.cta_buttons == nil then nil else p4.cta_buttons
	}, t_3)
end

function t_3:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var195 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var196, var197 = protoModule.writeTag(buff, var195, 1, protoModule.wireTypes.lengthDelimited)
		var196, var197 = protoModule.writeString(var196, var197, self.roblox_component)
		buff = var196
		var195 = var197
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var198 = self.input_data.value:encode()
		local var199, var200 = protoModule.writeTag(buff, var195, 2, protoModule.wireTypes.lengthDelimited)
		var199, var200 = protoModule.writeBuffer(var199, var200, var198, buffer.len(var198))
		buff = var199
		var195 = var200
	end
	if self.cta_buttons ~= nil then
		local var201 = self.cta_buttons:encode()
		local var202, var203 = protoModule.writeTag(buff, var195, 3, protoModule.wireTypes.lengthDelimited)
		var202, var203 = protoModule.writeBuffer(var202, var203, var201, buffer.len(var201))
		buff = var202
		var195 = var203
	end
	local buff_1 = buffer.create(var195)
	buffer.copy(buff_1, 0, buff, 0, var195)
	
	return buff_1
end

function t_3.decode(p5)
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var205 = t_3.new()
	local var206 = 0
	while var206 < buffer.len(p5) do
		local _ = nil
		local var207 = nil
		local var208, var209, var210 = protoModule.readTag(p5, var206)
		local var211 = var208
		var207 = var209
		var206 = var210
		
		if var207 == protoModule.wireTypes.varint then
			local _ = nil
			local var212, var213 = protoModule.readVarInt(p5, var206)
			local _ = var212
			var206 = var213
			continue
		end
		if var207 == protoModule.wireTypes.lengthDelimited then
			if var211 == 1 then
				local _ = nil
				local var214, var215 = protoModule.readBuffer(p5, var206)
				var206 = var215
				var205.roblox_component = buffer.tostring(var214)
			elseif var211 == 2 then
				local _ = nil
				local var216, var217 = protoModule.readBuffer(p5, var206)
				var206 = var217
				var205.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var216)
				}
			elseif var211 == 3 then
				local _ = nil
				local var218, var219 = protoModule.readBuffer(p5, var206)
				var206 = var219
				var205.cta_buttons = t.CtaButtonsInputData.decode(var218)
			else
				local _ = nil
				local var220, var221 = protoModule.readVarInt(p5, var206)
				var206 = var221 + var220
			end
		elseif var207 == protoModule.wireTypes.i32 then
			local _ = nil
			local var222, var223 = protoModule.readFixed32(p5, var206)
			local _ = var222
			var206 = var223
		elseif var207 == protoModule.wireTypes.i64 then
			local _ = nil
			local var224, var225 = protoModule.readFixed64(p5, var206)
			local _ = var224
			var206 = var225
		else
			error("Unsupported wire type: " .. var207)
		end
	end
	return var205
end

function t_3:jsonEncode()
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

function t_3:jsonDecode()
	-- upvalues: t_3 (ref), t (ref)
	local var227 = t_3.new()
	
	if self.roblox_component ~= nil then
		var227.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var227.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var227.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var227.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	if self.cta_buttons ~= nil then
		var227.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		var227.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
	end
	return var227
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6)
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p6 == nil or p6.roblox_component == nil then "" else p6.roblox_component,
		input_data = if p6 == nil or p6.input_data == nil then nil else p6.input_data
	}, t_4)
end

function t_4:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var229 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var230, var231 = protoModule.writeTag(buff, var229, 1, protoModule.wireTypes.lengthDelimited)
		var230, var231 = protoModule.writeString(var230, var231, self.roblox_component)
		buff = var230
		var229 = var231
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var232 = self.input_data.value:encode()
			local var233, var234 = protoModule.writeTag(buff, var229, 2, protoModule.wireTypes.lengthDelimited)
			var233, var234 = protoModule.writeBuffer(var233, var234, var232, buffer.len(var232))
			buff = var233
			var229 = var234
		elseif self.input_data.type == "video" then
			local var235 = self.input_data.value:encode()
			local var236, var237 = protoModule.writeTag(buff, var229, 3, protoModule.wireTypes.lengthDelimited)
			var236, var237 = protoModule.writeBuffer(var236, var237, var235, buffer.len(var235))
			buff = var236
			var229 = var237
		end
	end
	local buff_1 = buffer.create(var229)
	buffer.copy(buff_1, 0, buff, 0, var229)
	
	return buff_1
end

function t_4.decode(p7)
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var239 = t_4.new()
	local var240 = 0
	while var240 < buffer.len(p7) do
		local _ = nil
		local var241 = nil
		local var242, var243, var244 = protoModule.readTag(p7, var240)
		local var245 = var242
		var241 = var243
		var240 = var244
		
		if var241 == protoModule.wireTypes.varint then
			local _ = nil
			local var246, var247 = protoModule.readVarInt(p7, var240)
			local _ = var246
			var240 = var247
			continue
		end
		if var241 == protoModule.wireTypes.lengthDelimited then
			if var245 == 1 then
				local _ = nil
				local var248, var249 = protoModule.readBuffer(p7, var240)
				var240 = var249
				var239.roblox_component = buffer.tostring(var248)
			elseif var245 == 2 then
				local _ = nil
				local var250, var251 = protoModule.readBuffer(p7, var240)
				var240 = var251
				var239.input_data = { type = "image", value = t.ImageInputData.decode(var250) }
			elseif var245 == 3 then
				local _ = nil
				local var252, var253 = protoModule.readBuffer(p7, var240)
				var240 = var253
				var239.input_data = { type = "video", value = t.VideoInputData.decode(var252) }
			else
				local _ = nil
				local var254, var255 = protoModule.readVarInt(p7, var240)
				var240 = var255 + var254
			end
		elseif var241 == protoModule.wireTypes.i32 then
			local _ = nil
			local var256, var257 = protoModule.readFixed32(p7, var240)
			local _ = var256
			var240 = var257
		elseif var241 == protoModule.wireTypes.i64 then
			local _ = nil
			local var258, var259 = protoModule.readFixed64(p7, var240)
			local _ = var258
			var240 = var259
		else
			error("Unsupported wire type: " .. var241)
		end
	end
	return var239
end

function t_4:jsonEncode()
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

function t_4:jsonDecode()
	-- upvalues: t_4 (ref), t (ref)
	local var261 = t_4.new()
	
	if self.roblox_component ~= nil then
		var261.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var261.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var261.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	if self.video ~= nil then
		var261.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
		}
	end
	return var261
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8)
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var263 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var264 = self.kind.value:encode()
			local var265, var266 = protoModule.writeTag(buff, var263, 1, protoModule.wireTypes.lengthDelimited)
			var265, var266 = protoModule.writeBuffer(var265, var266, var264, buffer.len(var264))
			buff = var265
			var263 = var266
		elseif self.kind.type == "badge_details" then
			local var267 = self.kind.value:encode()
			local var268, var269 = protoModule.writeTag(buff, var263, 2, protoModule.wireTypes.lengthDelimited)
			var268, var269 = protoModule.writeBuffer(var268, var269, var267, buffer.len(var267))
			buff = var268
			var263 = var269
		elseif self.kind.type == "static_content" then
			local var270 = self.kind.value:encode()
			local var271, var272 = protoModule.writeTag(buff, var263, 3, protoModule.wireTypes.lengthDelimited)
			var271, var272 = protoModule.writeBuffer(var271, var272, var270, buffer.len(var270))
			buff = var271
			var263 = var272
		elseif self.kind.type == "experience_attribution_row" then
			local var273 = self.kind.value:encode()
			local var274, var275 = protoModule.writeTag(buff, var263, 4, protoModule.wireTypes.lengthDelimited)
			var274, var275 = protoModule.writeBuffer(var274, var275, var273, buffer.len(var273))
			buff = var274
			var263 = var275
		elseif self.kind.type == "experience_action_module" then
			local var276 = self.kind.value:encode()
			local var277, var278 = protoModule.writeTag(buff, var263, 5, protoModule.wireTypes.lengthDelimited)
			var277, var278 = protoModule.writeBuffer(var277, var278, var276, buffer.len(var276))
			buff = var277
			var263 = var278
		elseif self.kind.type == "experience_media_gallery" then
			local var279 = self.kind.value:encode()
			local var280, var281 = protoModule.writeTag(buff, var263, 6, protoModule.wireTypes.lengthDelimited)
			var280, var281 = protoModule.writeBuffer(var280, var281, var279, buffer.len(var279))
			buff = var280
			var263 = var281
		elseif self.kind.type == "experience_description" then
			local var282 = self.kind.value:encode()
			local var283, var284 = protoModule.writeTag(buff, var263, 7, protoModule.wireTypes.lengthDelimited)
			var283, var284 = protoModule.writeBuffer(var283, var284, var282, buffer.len(var282))
			buff = var283
			var263 = var284
		elseif self.kind.type == "experience_stat_row" then
			local var285 = self.kind.value:encode()
			local var286, var287 = protoModule.writeTag(buff, var263, 8, protoModule.wireTypes.lengthDelimited)
			var286, var287 = protoModule.writeBuffer(var286, var287, var285, buffer.len(var285))
			buff = var286
			var263 = var287
		elseif self.kind.type == "experience_info_table" then
			local var288 = self.kind.value:encode()
			local var289, var290 = protoModule.writeTag(buff, var263, 9, protoModule.wireTypes.lengthDelimited)
			var289, var290 = protoModule.writeBuffer(var289, var290, var288, buffer.len(var288))
			buff = var289
			var263 = var290
		elseif self.kind.type == "social_link_row" then
			local var291 = self.kind.value:encode()
			local var292, var293 = protoModule.writeTag(buff, var263, 10, protoModule.wireTypes.lengthDelimited)
			var292, var293 = protoModule.writeBuffer(var292, var293, var291, buffer.len(var291))
			buff = var292
			var263 = var293
		elseif self.kind.type == "experience_carousel" then
			local var294 = self.kind.value:encode()
			local var295, var296 = protoModule.writeTag(buff, var263, 11, protoModule.wireTypes.lengthDelimited)
			var295, var296 = protoModule.writeBuffer(var295, var296, var294, buffer.len(var294))
			buff = var295
			var263 = var296
		elseif self.kind.type == "song_carousel" then
			local var297 = self.kind.value:encode()
			local var298, var299 = protoModule.writeTag(buff, var263, 12, protoModule.wireTypes.lengthDelimited)
			var298, var299 = protoModule.writeBuffer(var298, var299, var297, buffer.len(var297))
			buff = var298
			var263 = var299
		elseif self.kind.type == "events_carousel" then
			local var300 = self.kind.value:encode()
			local var301, var302 = protoModule.writeTag(buff, var263, 13, protoModule.wireTypes.lengthDelimited)
			var301, var302 = protoModule.writeBuffer(var301, var302, var300, buffer.len(var300))
			buff = var301
			var263 = var302
		elseif self.kind.type == "game_pass_collection" then
			local var303 = self.kind.value:encode()
			local var304, var305 = protoModule.writeTag(buff, var263, 14, protoModule.wireTypes.lengthDelimited)
			var304, var305 = protoModule.writeBuffer(var304, var305, var303, buffer.len(var303))
			buff = var304
			var263 = var305
		elseif self.kind.type == "developer_product_collection" then
			local var306 = self.kind.value:encode()
			local var307, var308 = protoModule.writeTag(buff, var263, 15, protoModule.wireTypes.lengthDelimited)
			var307, var308 = protoModule.writeBuffer(var307, var308, var306, buffer.len(var306))
			buff = var307
			var263 = var308
		elseif self.kind.type == "subscription_collection" then
			local var309 = self.kind.value:encode()
			local var310, var311 = protoModule.writeTag(buff, var263, 16, protoModule.wireTypes.lengthDelimited)
			var310, var311 = protoModule.writeBuffer(var310, var311, var309, buffer.len(var309))
			buff = var310
			var263 = var311
		elseif self.kind.type == "dynamic_store_category" then
			local var312 = self.kind.value:encode()
			local var313, var314 = protoModule.writeTag(buff, var263, 17, protoModule.wireTypes.lengthDelimited)
			var313, var314 = protoModule.writeBuffer(var313, var314, var312, buffer.len(var312))
			buff = var313
			var263 = var314
		elseif self.kind.type == "card_container" then
			local var315 = self.kind.value:encode()
			local var316, var317 = protoModule.writeTag(buff, var263, 20, protoModule.wireTypes.lengthDelimited)
			var316, var317 = protoModule.writeBuffer(var316, var317, var315, buffer.len(var315))
			buff = var316
			var263 = var317
		elseif self.kind.type == "card" then
			local var318 = self.kind.value:encode()
			local var319, var320 = protoModule.writeTag(buff, var263, 21, protoModule.wireTypes.lengthDelimited)
			var319, var320 = protoModule.writeBuffer(var319, var320, var318, buffer.len(var318))
			buff = var319
			var263 = var320
		elseif self.kind.type == "dialog" then
			local var321 = self.kind.value:encode()
			local var322, var323 = protoModule.writeTag(buff, var263, 22, protoModule.wireTypes.lengthDelimited)
			var322, var323 = protoModule.writeBuffer(var322, var323, var321, buffer.len(var321))
			buff = var322
			var263 = var323
		elseif self.kind.type == "banner" then
			local var324 = self.kind.value:encode()
			local var325, var326 = protoModule.writeTag(buff, var263, 23, protoModule.wireTypes.lengthDelimited)
			var325, var326 = protoModule.writeBuffer(var325, var326, var324, buffer.len(var324))
			buff = var325
			var263 = var326
		elseif self.kind.type == "tooltip" then
			local var327 = self.kind.value:encode()
			local var328, var329 = protoModule.writeTag(buff, var263, 24, protoModule.wireTypes.lengthDelimited)
			var328, var329 = protoModule.writeBuffer(var328, var329, var327, buffer.len(var327))
			buff = var328
			var263 = var329
		elseif self.kind.type == "coachmark" then
			local var330 = self.kind.value:encode()
			local var331, var332 = protoModule.writeTag(buff, var263, 25, protoModule.wireTypes.lengthDelimited)
			var331, var332 = protoModule.writeBuffer(var331, var332, var330, buffer.len(var330))
			buff = var331
			var263 = var332
		elseif self.kind.type == "system_banner_prompt" then
			local var333 = self.kind.value:encode()
			local var334, var335 = protoModule.writeTag(buff, var263, 28, protoModule.wireTypes.lengthDelimited)
			var334, var335 = protoModule.writeBuffer(var334, var335, var333, buffer.len(var333))
			buff = var334
			var263 = var335
		elseif self.kind.type == "age_check_upsell" then
			local var336 = self.kind.value:encode()
			local var337, var338 = protoModule.writeTag(buff, var263, 29, protoModule.wireTypes.lengthDelimited)
			var337, var338 = protoModule.writeBuffer(var337, var338, var336, buffer.len(var336))
			buff = var337
			var263 = var338
		elseif self.kind.type == "catalog_item_list" then
			local var339 = self.kind.value:encode()
			local var340, var341 = protoModule.writeTag(buff, var263, 26, protoModule.wireTypes.lengthDelimited)
			var340, var341 = protoModule.writeBuffer(var340, var341, var339, buffer.len(var339))
			buff = var340
			var263 = var341
		elseif self.kind.type == "user_list" then
			local var342 = self.kind.value:encode()
			local var343, var344 = protoModule.writeTag(buff, var263, 27, protoModule.wireTypes.lengthDelimited)
			var343, var344 = protoModule.writeBuffer(var343, var344, var342, buffer.len(var342))
			buff = var343
			var263 = var344
		elseif self.kind.type == "experience_content_rating_label" then
			local var345 = self.kind.value:encode()
			local var346, var347 = protoModule.writeTag(buff, var263, 30, protoModule.wireTypes.lengthDelimited)
			var346, var347 = protoModule.writeBuffer(var346, var347, var345, buffer.len(var345))
			buff = var346
			var263 = var347
		elseif self.kind.type == "experience_refund_policy" then
			local var348 = self.kind.value:encode()
			local var349, var350 = protoModule.writeTag(buff, var263, 31, protoModule.wireTypes.lengthDelimited)
			var349, var350 = protoModule.writeBuffer(var349, var350, var348, buffer.len(var348))
			buff = var349
			var263 = var350
		elseif self.kind.type == "experience_play_with_reward" then
			local var351 = self.kind.value:encode()
			local var352, var353 = protoModule.writeTag(buff, var263, 32, protoModule.wireTypes.lengthDelimited)
			var352, var353 = protoModule.writeBuffer(var352, var353, var351, buffer.len(var351))
			buff = var352
			var263 = var353
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var354 = self.kind.value:encode()
			local var355, var356 = protoModule.writeTag(buff, var263, 33, protoModule.wireTypes.lengthDelimited)
			var355, var356 = protoModule.writeBuffer(var355, var356, var354, buffer.len(var354))
			buff = var355
			var263 = var356
		elseif self.kind.type == "community_section" then
			local var357 = self.kind.value:encode()
			local var358, var359 = protoModule.writeTag(buff, var263, 35, protoModule.wireTypes.lengthDelimited)
			var358, var359 = protoModule.writeBuffer(var358, var359, var357, buffer.len(var357))
			buff = var358
			var263 = var359
		elseif self.kind.type == "moments_carousel" then
			local var360 = self.kind.value:encode()
			local var361, var362 = protoModule.writeTag(buff, var263, 34, protoModule.wireTypes.lengthDelimited)
			var361, var362 = protoModule.writeBuffer(var361, var362, var360, buffer.len(var360))
			buff = var361
			var263 = var362
		elseif self.kind.type == "text" then
			local var363 = self.kind.value:encode()
			local var364, var365 = protoModule.writeTag(buff, var263, 40, protoModule.wireTypes.lengthDelimited)
			var364, var365 = protoModule.writeBuffer(var364, var365, var363, buffer.len(var363))
			buff = var364
			var263 = var365
		elseif self.kind.type == "vertical_feed" then
			local var366 = self.kind.value:encode()
			local var367, var368 = protoModule.writeTag(buff, var263, 41, protoModule.wireTypes.lengthDelimited)
			var367, var368 = protoModule.writeBuffer(var367, var368, var366, buffer.len(var366))
			buff = var367
			var263 = var368
		elseif self.kind.type == "page_header" then
			local var369 = self.kind.value:encode()
			local var370, var371 = protoModule.writeTag(buff, var263, 42, protoModule.wireTypes.lengthDelimited)
			var370, var371 = protoModule.writeBuffer(var370, var371, var369, buffer.len(var369))
			buff = var370
			var263 = var371
		elseif self.kind.type == "image_cta_section" then
			local var372 = self.kind.value:encode()
			local var373, var374 = protoModule.writeTag(buff, var263, 43, protoModule.wireTypes.lengthDelimited)
			var373, var374 = protoModule.writeBuffer(var373, var374, var372, buffer.len(var372))
			buff = var373
			var263 = var374
		elseif self.kind.type == "experience_details_feed" then
			local var375 = self.kind.value:encode()
			local var376, var377 = protoModule.writeTag(buff, var263, 500, protoModule.wireTypes.lengthDelimited)
			var376, var377 = protoModule.writeBuffer(var376, var377, var375, buffer.len(var375))
			buff = var376
			var263 = var377
		elseif self.kind.type == "experience_details_action_bar" then
			local var378 = self.kind.value:encode()
			local var379, var380 = protoModule.writeTag(buff, var263, 501, protoModule.wireTypes.lengthDelimited)
			var379, var380 = protoModule.writeBuffer(var379, var380, var378, buffer.len(var378))
			buff = var379
			var263 = var380
		elseif self.kind.type == "experience_details_banner_image" then
			local var381 = self.kind.value:encode()
			local var382, var383 = protoModule.writeTag(buff, var263, 502, protoModule.wireTypes.lengthDelimited)
			var382, var383 = protoModule.writeBuffer(var382, var383, var381, buffer.len(var381))
			buff = var382
			var263 = var383
		elseif self.kind.type == "experience_details_sticky_header" then
			local var384 = self.kind.value:encode()
			local var385, var386 = protoModule.writeTag(buff, var263, 503, protoModule.wireTypes.lengthDelimited)
			var385, var386 = protoModule.writeBuffer(var385, var386, var384, buffer.len(var384))
			buff = var385
			var263 = var386
		elseif self.kind.type == "event_details_feed" then
			local var387 = self.kind.value:encode()
			local var388, var389 = protoModule.writeTag(buff, var263, 600, protoModule.wireTypes.lengthDelimited)
			var388, var389 = protoModule.writeBuffer(var388, var389, var387, buffer.len(var387))
			buff = var388
			var263 = var389
		elseif self.kind.type == "event_details_action_bar" then
			local var390 = self.kind.value:encode()
			local var391, var392 = protoModule.writeTag(buff, var263, 601, protoModule.wireTypes.lengthDelimited)
			var391, var392 = protoModule.writeBuffer(var391, var392, var390, buffer.len(var390))
			buff = var391
			var263 = var392
		elseif self.kind.type == "event_attribution_row" then
			local var393 = self.kind.value:encode()
			local var394, var395 = protoModule.writeTag(buff, var263, 602, protoModule.wireTypes.lengthDelimited)
			var394, var395 = protoModule.writeBuffer(var394, var395, var393, buffer.len(var393))
			buff = var394
			var263 = var395
		elseif self.kind.type == "event_description" then
			local var396 = self.kind.value:encode()
			local var397, var398 = protoModule.writeTag(buff, var263, 603, protoModule.wireTypes.lengthDelimited)
			var397, var398 = protoModule.writeBuffer(var397, var398, var396, buffer.len(var396))
			buff = var397
			var263 = var398
		elseif self.kind.type == "event_info_table" then
			local var399 = self.kind.value:encode()
			local var400, var401 = protoModule.writeTag(buff, var263, 604, protoModule.wireTypes.lengthDelimited)
			var400, var401 = protoModule.writeBuffer(var400, var401, var399, buffer.len(var399))
			buff = var400
			var263 = var401
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var402 = self.kind.value:encode()
			local var403, var404 = protoModule.writeTag(buff, var263, 605, protoModule.wireTypes.lengthDelimited)
			var403, var404 = protoModule.writeBuffer(var403, var404, var402, buffer.len(var402))
			buff = var403
			var263 = var404
		elseif self.kind.type == "event_notifications_modal" then
			local var405 = self.kind.value:encode()
			local var406, var407 = protoModule.writeTag(buff, var263, 606, protoModule.wireTypes.lengthDelimited)
			var406, var407 = protoModule.writeBuffer(var406, var407, var405, buffer.len(var405))
			buff = var406
			var263 = var407
		elseif self.kind.type == "dev_store_feed" then
			local var408 = self.kind.value:encode()
			local var409, var410 = protoModule.writeTag(buff, var263, 700, protoModule.wireTypes.lengthDelimited)
			var409, var410 = protoModule.writeBuffer(var409, var410, var408, buffer.len(var408))
			buff = var409
			var263 = var410
		elseif self.kind.type == "charts_feed" then
			local var411 = self.kind.value:encode()
			local var412, var413 = protoModule.writeTag(buff, var263, 800, protoModule.wireTypes.lengthDelimited)
			var412, var413 = protoModule.writeBuffer(var412, var413, var411, buffer.len(var411))
			buff = var412
			var263 = var413
		elseif self.kind.type == "filter_pills" then
			local var414 = self.kind.value:encode()
			local var415, var416 = protoModule.writeTag(buff, var263, 801, protoModule.wireTypes.lengthDelimited)
			var415, var416 = protoModule.writeBuffer(var415, var416, var414, buffer.len(var414))
			buff = var415
			var263 = var416
		elseif self.kind.type == "sort_selector" then
			local var417 = self.kind.value:encode()
			local var418, var419 = protoModule.writeTag(buff, var263, 802, protoModule.wireTypes.lengthDelimited)
			var418, var419 = protoModule.writeBuffer(var418, var419, var417, buffer.len(var417))
			buff = var418
			var263 = var419
		elseif self.kind.type == "genre_selector" then
			local var420 = self.kind.value:encode()
			local var421, var422 = protoModule.writeTag(buff, var263, 803, protoModule.wireTypes.lengthDelimited)
			var421, var422 = protoModule.writeBuffer(var421, var422, var420, buffer.len(var420))
			buff = var421
			var263 = var422
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var423 = self.kind.value:encode()
			local var424, var425 = protoModule.writeTag(buff, var263, 900, protoModule.wireTypes.lengthDelimited)
			var424, var425 = protoModule.writeBuffer(var424, var425, var423, buffer.len(var423))
			buff = var424
			var263 = var425
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var426 = self.kind.value:encode()
			local var427, var428 = protoModule.writeTag(buff, var263, 901, protoModule.wireTypes.lengthDelimited)
			var427, var428 = protoModule.writeBuffer(var427, var428, var426, buffer.len(var426))
			buff = var427
			var263 = var428
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var429 = self.kind.value:encode()
			local var430, var431 = protoModule.writeTag(buff, var263, 902, protoModule.wireTypes.lengthDelimited)
			var430, var431 = protoModule.writeBuffer(var430, var431, var429, buffer.len(var429))
			buff = var430
			var263 = var431
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var432 = self.kind.value:encode()
			local var433, var434 = protoModule.writeTag(buff, var263, 903, protoModule.wireTypes.lengthDelimited)
			var433, var434 = protoModule.writeBuffer(var433, var434, var432, buffer.len(var432))
			buff = var433
			var263 = var434
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var435 = self.kind.value:encode()
			local var436, var437 = protoModule.writeTag(buff, var263, 904, protoModule.wireTypes.lengthDelimited)
			var436, var437 = protoModule.writeBuffer(var436, var437, var435, buffer.len(var435))
			buff = var436
			var263 = var437
		elseif self.kind.type == "catalog_item_grid" then
			local var438 = self.kind.value:encode()
			local var439, var440 = protoModule.writeTag(buff, var263, 905, protoModule.wireTypes.lengthDelimited)
			var439, var440 = protoModule.writeBuffer(var439, var440, var438, buffer.len(var438))
			buff = var439
			var263 = var440
		elseif self.kind.type == "marketplace_offer_modal" then
			local var441 = self.kind.value:encode()
			local var442, var443 = protoModule.writeTag(buff, var263, 906, protoModule.wireTypes.lengthDelimited)
			var442, var443 = protoModule.writeBuffer(var442, var443, var441, buffer.len(var441))
			buff = var442
			var263 = var443
		elseif self.kind.type == "search_results_feed" then
			local var444 = self.kind.value:encode()
			local var445, var446 = protoModule.writeTag(buff, var263, 1000, protoModule.wireTypes.lengthDelimited)
			var445, var446 = protoModule.writeBuffer(var445, var446, var444, buffer.len(var444))
			buff = var445
			var263 = var446
		elseif self.kind.type == "power_search_ai_overview" then
			local var447 = self.kind.value:encode()
			local var448, var449 = protoModule.writeTag(buff, var263, 1001, protoModule.wireTypes.lengthDelimited)
			var448, var449 = protoModule.writeBuffer(var448, var449, var447, buffer.len(var447))
			buff = var448
			var263 = var449
		elseif self.kind.type == "experience_emphasis_tile" then
			local var450 = self.kind.value:encode()
			local var451, var452 = protoModule.writeTag(buff, var263, 1002, protoModule.wireTypes.lengthDelimited)
			var451, var452 = protoModule.writeBuffer(var451, var452, var450, buffer.len(var450))
			buff = var451
			var263 = var452
		elseif self.kind.type == "option_selector_carousel" then
			local var453 = self.kind.value:encode()
			local var454, var455 = protoModule.writeTag(buff, var263, 1100, protoModule.wireTypes.lengthDelimited)
			var454, var455 = protoModule.writeBuffer(var454, var455, var453, buffer.len(var453))
			buff = var454
			var263 = var455
		elseif self.kind.type == "game_items_carousel" then
			local var456 = self.kind.value:encode()
			local var457, var458 = protoModule.writeTag(buff, var263, 1101, protoModule.wireTypes.lengthDelimited)
			var457, var458 = protoModule.writeBuffer(var457, var458, var456, buffer.len(var456))
			buff = var457
			var263 = var458
		elseif self.kind.type == "hero_unit" then
			local var459 = self.kind.value:encode()
			local var460, var461 = protoModule.writeTag(buff, var263, 1102, protoModule.wireTypes.lengthDelimited)
			var460, var461 = protoModule.writeBuffer(var460, var461, var459, buffer.len(var459))
			buff = var460
			var263 = var461
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var462 = self.kind.value:encode()
			local var463, var464 = protoModule.writeTag(buff, var263, 1103, protoModule.wireTypes.lengthDelimited)
			var463, var464 = protoModule.writeBuffer(var463, var464, var462, buffer.len(var462))
			buff = var463
			var263 = var464
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var465 = self.kind.value:encode()
			local var466, var467 = protoModule.writeTag(buff, var263, 1200, protoModule.wireTypes.lengthDelimited)
			var466, var467 = protoModule.writeBuffer(var466, var467, var465, buffer.len(var465))
			buff = var466
			var263 = var467
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var468 = self.kind.value:encode()
			local var469, var470 = protoModule.writeTag(buff, var263, 1300, protoModule.wireTypes.lengthDelimited)
			var469, var470 = protoModule.writeBuffer(var469, var470, var468, buffer.len(var468))
			buff = var469
			var263 = var470
		end
	end
	local buff_1 = buffer.create(var263)
	buffer.copy(buff_1, 0, buff, 0, var263)
	
	return buff_1
end

function t_5.decode(p9)
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var472 = t_5.new()
	local var473 = 0
	while var473 < buffer.len(p9) do
		local _ = nil
		local var474 = nil
		local var475, var476, var477 = protoModule.readTag(p9, var473)
		local var478 = var475
		var474 = var476
		var473 = var477
		
		if var474 == protoModule.wireTypes.varint then
			local _ = nil
			local var479, var480 = protoModule.readVarInt(p9, var473)
			local _ = var479
			var473 = var480
			continue
		end
		if var474 == protoModule.wireTypes.lengthDelimited then
			if var478 == 1 then
				local _ = nil
				local var481, var482 = protoModule.readBuffer(p9, var473)
				var473 = var482
				var472.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var481)
				}
			elseif var478 == 2 then
				local _ = nil
				local var483, var484 = protoModule.readBuffer(p9, var473)
				var473 = var484
				var472.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var483)
				}
			elseif var478 == 3 then
				local _ = nil
				local var485, var486 = protoModule.readBuffer(p9, var473)
				var473 = var486
				var472.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var485)
				}
			elseif var478 == 4 then
				local _ = nil
				local var487, var488 = protoModule.readBuffer(p9, var473)
				var473 = var488
				var472.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var487)
				}
			elseif var478 == 5 then
				local _ = nil
				local var489, var490 = protoModule.readBuffer(p9, var473)
				var473 = var490
				var472.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var489)
				}
			elseif var478 == 6 then
				local _ = nil
				local var491, var492 = protoModule.readBuffer(p9, var473)
				var473 = var492
				var472.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var491)
				}
			elseif var478 == 7 then
				local _ = nil
				local var493, var494 = protoModule.readBuffer(p9, var473)
				var473 = var494
				var472.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var493)
				}
			elseif var478 == 8 then
				local _ = nil
				local var495, var496 = protoModule.readBuffer(p9, var473)
				var473 = var496
				var472.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var495)
				}
			elseif var478 == 9 then
				local _ = nil
				local var497, var498 = protoModule.readBuffer(p9, var473)
				var473 = var498
				var472.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var497)
				}
			elseif var478 == 10 then
				local _ = nil
				local var499, var500 = protoModule.readBuffer(p9, var473)
				var473 = var500
				var472.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var499)
				}
			elseif var478 == 11 then
				local _ = nil
				local var501, var502 = protoModule.readBuffer(p9, var473)
				var473 = var502
				var472.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var501)
				}
			elseif var478 == 12 then
				local _ = nil
				local var503, var504 = protoModule.readBuffer(p9, var473)
				var473 = var504
				var472.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var503)
				}
			elseif var478 == 13 then
				local _ = nil
				local var505, var506 = protoModule.readBuffer(p9, var473)
				var473 = var506
				var472.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var505)
				}
			elseif var478 == 14 then
				local _ = nil
				local var507, var508 = protoModule.readBuffer(p9, var473)
				var473 = var508
				var472.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var507)
				}
			elseif var478 == 15 then
				local _ = nil
				local var509, var510 = protoModule.readBuffer(p9, var473)
				var473 = var510
				var472.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var509)
				}
			elseif var478 == 16 then
				local _ = nil
				local var511, var512 = protoModule.readBuffer(p9, var473)
				var473 = var512
				var472.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var511)
				}
			elseif var478 == 17 then
				local _ = nil
				local var513, var514 = protoModule.readBuffer(p9, var473)
				var473 = var514
				var472.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(var513)
				}
			elseif var478 == 20 then
				local _ = nil
				local var515, var516 = protoModule.readBuffer(p9, var473)
				var473 = var516
				var472.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var515)
				}
			elseif var478 == 21 then
				local _ = nil
				local var517, var518 = protoModule.readBuffer(p9, var473)
				var473 = var518
				var472.kind = { type = "card", value = t.CardInputData.decode(var517) }
			elseif var478 == 22 then
				local _ = nil
				local var519, var520 = protoModule.readBuffer(p9, var473)
				var473 = var520
				var472.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var519)
				}
			elseif var478 == 23 then
				local _ = nil
				local var521, var522 = protoModule.readBuffer(p9, var473)
				var473 = var522
				var472.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var521)
				}
			elseif var478 == 24 then
				local _ = nil
				local var523, var524 = protoModule.readBuffer(p9, var473)
				var473 = var524
				var472.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var523)
				}
			elseif var478 == 25 then
				local _ = nil
				local var525, var526 = protoModule.readBuffer(p9, var473)
				var473 = var526
				var472.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var525)
				}
			elseif var478 == 26 then
				local _ = nil
				local var527, var528 = protoModule.readBuffer(p9, var473)
				var473 = var528
				var472.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var527)
				}
			elseif var478 == 27 then
				local _ = nil
				local var529, var530 = protoModule.readBuffer(p9, var473)
				var473 = var530
				var472.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var529)
				}
			elseif var478 == 28 then
				local _ = nil
				local var531, var532 = protoModule.readBuffer(p9, var473)
				var473 = var532
				var472.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var531)
				}
			elseif var478 == 29 then
				local _ = nil
				local var533, var534 = protoModule.readBuffer(p9, var473)
				var473 = var534
				var472.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var533)
				}
			elseif var478 == 30 then
				local _ = nil
				local var535, var536 = protoModule.readBuffer(p9, var473)
				var473 = var536
				var472.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var535)
				}
			elseif var478 == 31 then
				local _ = nil
				local var537, var538 = protoModule.readBuffer(p9, var473)
				var473 = var538
				var472.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var537)
				}
			elseif var478 == 32 then
				local _ = nil
				local var539, var540 = protoModule.readBuffer(p9, var473)
				var473 = var540
				var472.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var539)
				}
			elseif var478 == 33 then
				local _ = nil
				local var541, var542 = protoModule.readBuffer(p9, var473)
				var473 = var542
				var472.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var541)
				}
			elseif var478 == 34 then
				local _ = nil
				local var543, var544 = protoModule.readBuffer(p9, var473)
				var473 = var544
				var472.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var543)
				}
			elseif var478 == 35 then
				local _ = nil
				local var545, var546 = protoModule.readBuffer(p9, var473)
				var473 = var546
				var472.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(var545)
				}
			elseif var478 == 40 then
				local _ = nil
				local var547, var548 = protoModule.readBuffer(p9, var473)
				var473 = var548
				var472.kind = { type = "text", value = t.TextInputData.decode(var547) }
			elseif var478 == 41 then
				local _ = nil
				local var549, var550 = protoModule.readBuffer(p9, var473)
				var473 = var550
				var472.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var549)
				}
			elseif var478 == 42 then
				local _ = nil
				local var551, var552 = protoModule.readBuffer(p9, var473)
				var473 = var552
				var472.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var551)
				}
			elseif var478 == 43 then
				local _ = nil
				local var553, var554 = protoModule.readBuffer(p9, var473)
				var473 = var554
				var472.kind = {
					type = "image_cta_section",
					value = t.ImageCtaSectionInputData.decode(var553)
				}
			elseif var478 == 500 then
				local _ = nil
				local var555, var556 = protoModule.readBuffer(p9, var473)
				var473 = var556
				var472.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var555)
				}
			elseif var478 == 501 then
				local _ = nil
				local var557, var558 = protoModule.readBuffer(p9, var473)
				var473 = var558
				var472.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var557)
				}
			elseif var478 == 502 then
				local _ = nil
				local var559, var560 = protoModule.readBuffer(p9, var473)
				var473 = var560
				var472.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var559)
				}
			elseif var478 == 503 then
				local _ = nil
				local var561, var562 = protoModule.readBuffer(p9, var473)
				var473 = var562
				var472.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var561)
				}
			elseif var478 == 600 then
				local _ = nil
				local var563, var564 = protoModule.readBuffer(p9, var473)
				var473 = var564
				var472.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var563)
				}
			elseif var478 == 601 then
				local _ = nil
				local var565, var566 = protoModule.readBuffer(p9, var473)
				var473 = var566
				var472.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var565)
				}
			elseif var478 == 602 then
				local _ = nil
				local var567, var568 = protoModule.readBuffer(p9, var473)
				var473 = var568
				var472.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var567)
				}
			elseif var478 == 603 then
				local _ = nil
				local var569, var570 = protoModule.readBuffer(p9, var473)
				var473 = var570
				var472.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var569)
				}
			elseif var478 == 604 then
				local _ = nil
				local var571, var572 = protoModule.readBuffer(p9, var473)
				var473 = var572
				var472.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var571)
				}
			elseif var478 == 605 then
				local _ = nil
				local var573, var574 = protoModule.readBuffer(p9, var473)
				var473 = var574
				var472.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var573)
				}
			elseif var478 == 606 then
				local _ = nil
				local var575, var576 = protoModule.readBuffer(p9, var473)
				var473 = var576
				var472.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var575)
				}
			elseif var478 == 700 then
				local _ = nil
				local var577, var578 = protoModule.readBuffer(p9, var473)
				var473 = var578
				var472.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var577)
				}
			elseif var478 == 800 then
				local _ = nil
				local var579, var580 = protoModule.readBuffer(p9, var473)
				var473 = var580
				var472.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var579)
				}
			elseif var478 == 801 then
				local _ = nil
				local var581, var582 = protoModule.readBuffer(p9, var473)
				var473 = var582
				var472.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var581)
				}
			elseif var478 == 802 then
				local _ = nil
				local var583, var584 = protoModule.readBuffer(p9, var473)
				var473 = var584
				var472.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var583)
				}
			elseif var478 == 803 then
				local _ = nil
				local var585, var586 = protoModule.readBuffer(p9, var473)
				var473 = var586
				var472.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var585)
				}
			elseif var478 == 900 then
				local _ = nil
				local var587, var588 = protoModule.readBuffer(p9, var473)
				var473 = var588
				var472.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var587)
				}
			elseif var478 == 901 then
				local _ = nil
				local var589, var590 = protoModule.readBuffer(p9, var473)
				var473 = var590
				var472.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var589)
				}
			elseif var478 == 902 then
				local _ = nil
				local var591, var592 = protoModule.readBuffer(p9, var473)
				var473 = var592
				var472.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var591)
				}
			elseif var478 == 903 then
				local _ = nil
				local var593, var594 = protoModule.readBuffer(p9, var473)
				var473 = var594
				var472.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var593)
				}
			elseif var478 == 904 then
				local _ = nil
				local var595, var596 = protoModule.readBuffer(p9, var473)
				var473 = var596
				var472.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var595)
				}
			elseif var478 == 905 then
				local _ = nil
				local var597, var598 = protoModule.readBuffer(p9, var473)
				var473 = var598
				var472.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var597)
				}
			elseif var478 == 906 then
				local _ = nil
				local var599, var600 = protoModule.readBuffer(p9, var473)
				var473 = var600
				var472.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var599)
				}
			elseif var478 == 1000 then
				local _ = nil
				local var601, var602 = protoModule.readBuffer(p9, var473)
				var473 = var602
				var472.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var601)
				}
			elseif var478 == 1001 then
				local _ = nil
				local var603, var604 = protoModule.readBuffer(p9, var473)
				var473 = var604
				var472.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var603)
				}
			elseif var478 == 1002 then
				local _ = nil
				local var605, var606 = protoModule.readBuffer(p9, var473)
				var473 = var606
				var472.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var605)
				}
			elseif var478 == 1100 then
				local _ = nil
				local var607, var608 = protoModule.readBuffer(p9, var473)
				var473 = var608
				var472.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var607)
				}
			elseif var478 == 1101 then
				local _ = nil
				local var609, var610 = protoModule.readBuffer(p9, var473)
				var473 = var610
				var472.kind = {
					type = "game_items_carousel",
					value = t.GameItemsCarouselInputData.decode(var609)
				}
			elseif var478 == 1102 then
				local _ = nil
				local var611, var612 = protoModule.readBuffer(p9, var473)
				var473 = var612
				var472.kind = {
					type = "hero_unit",
					value = t.HeroUnitInputData.decode(var611)
				}
			elseif var478 == 1103 then
				local _ = nil
				local var613, var614 = protoModule.readBuffer(p9, var473)
				var473 = var614
				var472.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var613)
				}
			elseif var478 == 1200 then
				local _ = nil
				local var615, var616 = protoModule.readBuffer(p9, var473)
				var473 = var616
				var472.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var615)
				}
			elseif var478 == 1300 then
				local _ = nil
				local var617, var618 = protoModule.readBuffer(p9, var473)
				var473 = var618
				var472.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var617)
				}
			else
				local _ = nil
				local var619, var620 = protoModule.readVarInt(p9, var473)
				var473 = var620 + var619
			end
		elseif var474 == protoModule.wireTypes.i32 then
			local _ = nil
			local var621, var622 = protoModule.readFixed32(p9, var473)
			local _ = var621
			var473 = var622
		elseif var474 == protoModule.wireTypes.i64 then
			local _ = nil
			local var623, var624 = protoModule.readFixed64(p9, var473)
			local _ = var623
			var473 = var624
		else
			error("Unsupported wire type: " .. var474)
		end
	end
	return var472
end

function t_5:jsonEncode()
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
		elseif self.kind.type == "hero_unit" then
			t.heroUnit = self.kind.value:jsonEncode()
			
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

function t_5:jsonDecode()
	-- upvalues: t_5 (ref), t (ref)
	local var626 = t_5.new()
	
	if self.badges_grid ~= nil then
		var626.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var626.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var626.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var626.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var626.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var626.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var626.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var626.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var626.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var626.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var626.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var626.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var626.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var626.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var626.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var626.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var626.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var626.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var626.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var626.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var626.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var626.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var626.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var626.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var626.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var626.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var626.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var626.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var626.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var626.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var626.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var626.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var626.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var626.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var626.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var626.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var626.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var626.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var626.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var626.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var626.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var626.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var626.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var626.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var626.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var626.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var626.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var626.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var626.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var626.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var626.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var626.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var626.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var626.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var626.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var626.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var626.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var626.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var626.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var626.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var626.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var626.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var626.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var626.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var626.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var626.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var626.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var626.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var626.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var626.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var626.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var626.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var626.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var626.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var626.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var626.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var626.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var626.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var626.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var626.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var626.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var626.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var626.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var626.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var626.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var626.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var626.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var626.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var626.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var626.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var626.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var626.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var626.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var626.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var626.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var626.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var626.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var626.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var626.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var626.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var626.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var626.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var626.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var626.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var626.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var626.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var626.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var626.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var626.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var626.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var626.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var626.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var626.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var626.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var626.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var626.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var626.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var626.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var626.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var626.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var626.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var626.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.game_items_carousel ~= nil then
		var626.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.game_items_carousel)
		}
	end
	if self.gameItemsCarousel ~= nil then
		var626.kind = {
			type = "game_items_carousel",
			value = t.GameItemsCarouselInputData.jsonDecode(self.gameItemsCarousel)
		}
	end
	if self.hero_unit ~= nil then
		var626.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.hero_unit)
		}
	end
	if self.heroUnit ~= nil then
		var626.kind = {
			type = "hero_unit",
			value = t.HeroUnitInputData.jsonDecode(self.heroUnit)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var626.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var626.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var626.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var626.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var626.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var626.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	return var626
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10)
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p10 == nil or p10.section_title == nil then "" else p10.section_title,
		badges = if p10 == nil or p10.badges == nil then {} else p10.badges,
		collection_id = if p10 == nil or p10.collection_id == nil then "" else p10.collection_id,
		collection_position = if p10 == nil or p10.collection_position == nil then "" else p10.collection_position,
		universe_id = if p10 == nil or p10.universe_id == nil then "" else p10.universe_id
	}, t_6)
end

function t_6:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var628 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var629, var630 = protoModule.writeTag(buff, var628, 1, protoModule.wireTypes.lengthDelimited)
		var629, var630 = protoModule.writeString(var629, var630, self.section_title)
		buff = var629
		var628 = var630
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var631 = v:encode()
			local var632, var633 = protoModule.writeTag(buff, var628, 2, protoModule.wireTypes.lengthDelimited)
			var632, var633 = protoModule.writeBuffer(var632, var633, var631, buffer.len(var631))
			buff = var632
			var628 = var633
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var634, var635 = protoModule.writeTag(buff, var628, 3, protoModule.wireTypes.lengthDelimited)
		var634, var635 = protoModule.writeString(var634, var635, self.collection_id)
		buff = var634
		var628 = var635
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var636, var637 = protoModule.writeTag(buff, var628, 4, protoModule.wireTypes.lengthDelimited)
		var636, var637 = protoModule.writeString(var636, var637, self.collection_position)
		buff = var636
		var628 = var637
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var638, var639 = protoModule.writeTag(buff, var628, 5, protoModule.wireTypes.lengthDelimited)
		var638, var639 = protoModule.writeString(var638, var639, self.universe_id)
		buff = var638
		var628 = var639
	end
	local buff_1 = buffer.create(var628)
	buffer.copy(buff_1, 0, buff, 0, var628)
	
	return buff_1
end

function t_6.decode(p11)
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var641 = t_6.new()
	local var642 = 0
	while var642 < buffer.len(p11) do
		local _ = nil
		local var643 = nil
		local var644, var645, var646 = protoModule.readTag(p11, var642)
		local var647 = var644
		var643 = var645
		var642 = var646
		
		if var643 == protoModule.wireTypes.varint then
			local _ = nil
			local var648, var649 = protoModule.readVarInt(p11, var642)
			local _ = var648
			var642 = var649
			continue
		end
		if var643 == protoModule.wireTypes.lengthDelimited then
			if var647 == 1 then
				local _ = nil
				local var650, var651 = protoModule.readBuffer(p11, var642)
				var642 = var651
				var641.section_title = buffer.tostring(var650)
			elseif var647 == 2 then
				local _ = nil
				local var652, var653 = protoModule.readBuffer(p11, var642)
				var642 = var653
				table.insert(var641.badges, t.BadgesGridInputData_BadgeInputData.decode(var652))
			elseif var647 == 3 then
				local _ = nil
				local var654, var655 = protoModule.readBuffer(p11, var642)
				var642 = var655
				var641.collection_id = buffer.tostring(var654)
			elseif var647 == 4 then
				local _ = nil
				local var656, var657 = protoModule.readBuffer(p11, var642)
				var642 = var657
				var641.collection_position = buffer.tostring(var656)
			elseif var647 == 5 then
				local _ = nil
				local var658, var659 = protoModule.readBuffer(p11, var642)
				var642 = var659
				var641.universe_id = buffer.tostring(var658)
			else
				local _ = nil
				local var660, var661 = protoModule.readVarInt(p11, var642)
				var642 = var661 + var660
			end
		elseif var643 == protoModule.wireTypes.i32 then
			local _ = nil
			local var662, var663 = protoModule.readFixed32(p11, var642)
			local _ = var662
			var642 = var663
		elseif var643 == protoModule.wireTypes.i64 then
			local _ = nil
			local var664, var665 = protoModule.readFixed64(p11, var642)
			local _ = var664
			var642 = var665
		else
			error("Unsupported wire type: " .. var643)
		end
	end
	return var641
end

function t_6:jsonEncode()
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

function t_6:jsonDecode()
	-- upvalues: t_6 (ref), t (ref)
	local var668 = t_6.new()
	
	if self.section_title ~= nil then
		var668.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var668.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var668.badges = t_1
	end
	if self.collection_id ~= nil then
		var668.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var668.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var668.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var668.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var668.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var668.universe_id = self.universeId
	end
	return var668
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12)
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p12 == nil or p12.badge_id == nil then "" else p12.badge_id
	}, t_7)
end

function t_7:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var671 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var672, var673 = protoModule.writeTag(buff, var671, 1, protoModule.wireTypes.lengthDelimited)
		var672, var673 = protoModule.writeString(var672, var673, self.badge_id)
		buff = var672
		var671 = var673
	end
	local buff_1 = buffer.create(var671)
	buffer.copy(buff_1, 0, buff, 0, var671)
	
	return buff_1
end

function t_7.decode(p13)
	-- upvalues: t_7 (ref), protoModule (ref)
	local var675 = t_7.new()
	local var676 = 0
	while var676 < buffer.len(p13) do
		local _ = nil
		local var677 = nil
		local var678, var679, var680 = protoModule.readTag(p13, var676)
		local var681 = var678
		var677 = var679
		var676 = var680
		
		if var677 == protoModule.wireTypes.varint then
			local _ = nil
			local var682, var683 = protoModule.readVarInt(p13, var676)
			local _ = var682
			var676 = var683
			continue
		end
		if var677 == protoModule.wireTypes.lengthDelimited then
			if var681 == 1 then
				local _ = nil
				local var684, var685 = protoModule.readBuffer(p13, var676)
				var676 = var685
				var675.badge_id = buffer.tostring(var684)
			else
				local _ = nil
				local var686, var687 = protoModule.readVarInt(p13, var676)
				var676 = var687 + var686
			end
		elseif var677 == protoModule.wireTypes.i32 then
			local _ = nil
			local var688, var689 = protoModule.readFixed32(p13, var676)
			local _ = var688
			var676 = var689
		elseif var677 == protoModule.wireTypes.i64 then
			local _ = nil
			local var690, var691 = protoModule.readFixed64(p13, var676)
			local _ = var690
			var676 = var691
		else
			error("Unsupported wire type: " .. var677)
		end
	end
	return var675
end

function t_7:jsonEncode()
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_7:jsonDecode()
	-- upvalues: t_7 (ref)
	local var693 = t_7.new()
	
	if self.badge_id ~= nil then
		var693.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var693.badge_id = self.badgeId
	end
	return var693
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14)
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p14 == nil or p14.badge_id == nil then "" else p14.badge_id,
		universe_id = if p14 == nil or p14.universe_id == nil then "" else p14.universe_id,
		localized_literals = if p14 == nil or p14.localized_literals == nil then nil else p14.localized_literals,
		creator_key = if p14 == nil or p14.creator_key == nil then "" else p14.creator_key
	}, t_8)
end

function t_8:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var695 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var696, var697 = protoModule.writeTag(buff, var695, 1, protoModule.wireTypes.lengthDelimited)
		var696, var697 = protoModule.writeString(var696, var697, self.badge_id)
		buff = var696
		var695 = var697
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var698, var699 = protoModule.writeTag(buff, var695, 2, protoModule.wireTypes.lengthDelimited)
		var698, var699 = protoModule.writeString(var698, var699, self.universe_id)
		buff = var698
		var695 = var699
	end
	if self.localized_literals ~= nil then
		local var700 = self.localized_literals:encode()
		local var701, var702 = protoModule.writeTag(buff, var695, 3, protoModule.wireTypes.lengthDelimited)
		var701, var702 = protoModule.writeBuffer(var701, var702, var700, buffer.len(var700))
		buff = var701
		var695 = var702
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var703, var704 = protoModule.writeTag(buff, var695, 4, protoModule.wireTypes.lengthDelimited)
		var703, var704 = protoModule.writeString(var703, var704, self.creator_key)
		buff = var703
		var695 = var704
	end
	local buff_1 = buffer.create(var695)
	buffer.copy(buff_1, 0, buff, 0, var695)
	
	return buff_1
end

function t_8.decode(p15)
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var706 = t_8.new()
	local var707 = 0
	while var707 < buffer.len(p15) do
		local _ = nil
		local var708 = nil
		local var709, var710, var711 = protoModule.readTag(p15, var707)
		local var712 = var709
		var708 = var710
		var707 = var711
		
		if var708 == protoModule.wireTypes.varint then
			local _ = nil
			local var713, var714 = protoModule.readVarInt(p15, var707)
			local _ = var713
			var707 = var714
			continue
		end
		if var708 == protoModule.wireTypes.lengthDelimited then
			if var712 == 1 then
				local _ = nil
				local var715, var716 = protoModule.readBuffer(p15, var707)
				var707 = var716
				var706.badge_id = buffer.tostring(var715)
			elseif var712 == 2 then
				local _ = nil
				local var717, var718 = protoModule.readBuffer(p15, var707)
				var707 = var718
				var706.universe_id = buffer.tostring(var717)
			elseif var712 == 3 then
				local _ = nil
				local var719, var720 = protoModule.readBuffer(p15, var707)
				var707 = var720
				var706.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var719)
			elseif var712 == 4 then
				local _ = nil
				local var721, var722 = protoModule.readBuffer(p15, var707)
				var707 = var722
				var706.creator_key = buffer.tostring(var721)
			else
				local _ = nil
				local var723, var724 = protoModule.readVarInt(p15, var707)
				var707 = var724 + var723
			end
		elseif var708 == protoModule.wireTypes.i32 then
			local _ = nil
			local var725, var726 = protoModule.readFixed32(p15, var707)
			local _ = var725
			var707 = var726
		elseif var708 == protoModule.wireTypes.i64 then
			local _ = nil
			local var727, var728 = protoModule.readFixed64(p15, var707)
			local _ = var727
			var707 = var728
		else
			error("Unsupported wire type: " .. var708)
		end
	end
	return var706
end

function t_8:jsonEncode()
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

function t_8:jsonDecode()
	-- upvalues: t_8 (ref), t (ref)
	local var730 = t_8.new()
	
	if self.badge_id ~= nil then
		var730.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var730.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var730.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var730.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var730.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var730.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var730.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var730.creator_key = self.creatorKey
	end
	return var730
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16)
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p16 == nil or p16.info_table == nil then nil else p16.info_table,
		action_module = if p16 == nil or p16.action_module == nil then nil else p16.action_module,
		overflow_menu = if p16 == nil or p16.overflow_menu == nil then nil else p16.overflow_menu
	}, t_9)
end

function t_9:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var732 = 0
	
	if self.info_table ~= nil then
		local var733 = self.info_table:encode()
		local var734, var735 = protoModule.writeTag(buff, var732, 1, protoModule.wireTypes.lengthDelimited)
		var734, var735 = protoModule.writeBuffer(var734, var735, var733, buffer.len(var733))
		buff = var734
		var732 = var735
	end
	if self.action_module ~= nil then
		local var736 = self.action_module:encode()
		local var737, var738 = protoModule.writeTag(buff, var732, 2, protoModule.wireTypes.lengthDelimited)
		var737, var738 = protoModule.writeBuffer(var737, var738, var736, buffer.len(var736))
		buff = var737
		var732 = var738
	end
	if self.overflow_menu ~= nil then
		local var739 = self.overflow_menu:encode()
		local var740, var741 = protoModule.writeTag(buff, var732, 3, protoModule.wireTypes.lengthDelimited)
		var740, var741 = protoModule.writeBuffer(var740, var741, var739, buffer.len(var739))
		buff = var740
		var732 = var741
	end
	local buff_1 = buffer.create(var732)
	buffer.copy(buff_1, 0, buff, 0, var732)
	
	return buff_1
end

function t_9.decode(p17)
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var743 = t_9.new()
	local var744 = 0
	while var744 < buffer.len(p17) do
		local _ = nil
		local var745 = nil
		local var746, var747, var748 = protoModule.readTag(p17, var744)
		local var749 = var746
		var745 = var747
		var744 = var748
		
		if var745 == protoModule.wireTypes.varint then
			local _ = nil
			local var750, var751 = protoModule.readVarInt(p17, var744)
			local _ = var750
			var744 = var751
			continue
		end
		if var745 == protoModule.wireTypes.lengthDelimited then
			if var749 == 1 then
				local _ = nil
				local var752, var753 = protoModule.readBuffer(p17, var744)
				var744 = var753
				var743.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var752)
			elseif var749 == 2 then
				local _ = nil
				local var754, var755 = protoModule.readBuffer(p17, var744)
				var744 = var755
				var743.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var754)
			elseif var749 == 3 then
				local _ = nil
				local var756, var757 = protoModule.readBuffer(p17, var744)
				var744 = var757
				var743.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var756)
			else
				local _ = nil
				local var758, var759 = protoModule.readVarInt(p17, var744)
				var744 = var759 + var758
			end
		elseif var745 == protoModule.wireTypes.i32 then
			local _ = nil
			local var760, var761 = protoModule.readFixed32(p17, var744)
			local _ = var760
			var744 = var761
		elseif var745 == protoModule.wireTypes.i64 then
			local _ = nil
			local var762, var763 = protoModule.readFixed64(p17, var744)
			local _ = var762
			var744 = var763
		else
			error("Unsupported wire type: " .. var745)
		end
	end
	return var743
end

function t_9:jsonEncode()
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

function t_9:jsonDecode()
	-- upvalues: t_9 (ref), t (ref)
	local var765 = t_9.new()
	
	if self.info_table ~= nil then
		var765.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var765.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var765.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var765.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var765.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var765.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var765
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18)
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

function t_10:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var767 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var768, var769 = protoModule.writeTag(buff, var767, 1, protoModule.wireTypes.lengthDelimited)
		var768, var769 = protoModule.writeString(var768, var769, self.type_label)
		buff = var768
		var767 = var769
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var770, var771 = protoModule.writeTag(buff, var767, 2, protoModule.wireTypes.lengthDelimited)
		var770, var771 = protoModule.writeString(var770, var771, self.earned_label)
		buff = var770
		var767 = var771
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var772, var773 = protoModule.writeTag(buff, var767, 3, protoModule.wireTypes.lengthDelimited)
		var772, var773 = protoModule.writeString(var772, var773, self.updated_label)
		buff = var772
		var767 = var773
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var774, var775 = protoModule.writeTag(buff, var767, 4, protoModule.wireTypes.lengthDelimited)
		var774, var775 = protoModule.writeString(var774, var775, self.experience_label)
		buff = var774
		var767 = var775
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var776, var777 = protoModule.writeTag(buff, var767, 5, protoModule.wireTypes.lengthDelimited)
		var776, var777 = protoModule.writeString(var776, var777, self.rarity_label)
		buff = var776
		var767 = var777
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var778, var779 = protoModule.writeTag(buff, var767, 6, protoModule.wireTypes.lengthDelimited)
		var778, var779 = protoModule.writeString(var778, var779, self.won_yesterday_label)
		buff = var778
		var767 = var779
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var780, var781 = protoModule.writeTag(buff, var767, 7, protoModule.wireTypes.lengthDelimited)
		var780, var781 = protoModule.writeString(var780, var781, self.won_ever_label)
		buff = var780
		var767 = var781
	end
	local buff_1 = buffer.create(var767)
	buffer.copy(buff_1, 0, buff, 0, var767)
	
	return buff_1
end

function t_10.decode(p19)
	-- upvalues: t_10 (ref), protoModule (ref)
	local var783 = t_10.new()
	local var784 = 0
	while var784 < buffer.len(p19) do
		local _ = nil
		local var785 = nil
		local var786, var787, var788 = protoModule.readTag(p19, var784)
		local var789 = var786
		var785 = var787
		var784 = var788
		
		if var785 == protoModule.wireTypes.varint then
			local _ = nil
			local var790, var791 = protoModule.readVarInt(p19, var784)
			local _ = var790
			var784 = var791
			continue
		end
		if var785 == protoModule.wireTypes.lengthDelimited then
			if var789 == 1 then
				local _ = nil
				local var792, var793 = protoModule.readBuffer(p19, var784)
				var784 = var793
				var783.type_label = buffer.tostring(var792)
			elseif var789 == 2 then
				local _ = nil
				local var794, var795 = protoModule.readBuffer(p19, var784)
				var784 = var795
				var783.earned_label = buffer.tostring(var794)
			elseif var789 == 3 then
				local _ = nil
				local var796, var797 = protoModule.readBuffer(p19, var784)
				var784 = var797
				var783.updated_label = buffer.tostring(var796)
			elseif var789 == 4 then
				local _ = nil
				local var798, var799 = protoModule.readBuffer(p19, var784)
				var784 = var799
				var783.experience_label = buffer.tostring(var798)
			elseif var789 == 5 then
				local _ = nil
				local var800, var801 = protoModule.readBuffer(p19, var784)
				var784 = var801
				var783.rarity_label = buffer.tostring(var800)
			elseif var789 == 6 then
				local _ = nil
				local var802, var803 = protoModule.readBuffer(p19, var784)
				var784 = var803
				var783.won_yesterday_label = buffer.tostring(var802)
			elseif var789 == 7 then
				local _ = nil
				local var804, var805 = protoModule.readBuffer(p19, var784)
				var784 = var805
				var783.won_ever_label = buffer.tostring(var804)
			else
				local _ = nil
				local var806, var807 = protoModule.readVarInt(p19, var784)
				var784 = var807 + var806
			end
		elseif var785 == protoModule.wireTypes.i32 then
			local _ = nil
			local var808, var809 = protoModule.readFixed32(p19, var784)
			local _ = var808
			var784 = var809
		elseif var785 == protoModule.wireTypes.i64 then
			local _ = nil
			local var810, var811 = protoModule.readFixed64(p19, var784)
			local _ = var810
			var784 = var811
		else
			error("Unsupported wire type: " .. var785)
		end
	end
	return var783
end

function t_10:jsonEncode()
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

function t_10:jsonDecode()
	-- upvalues: t_10 (ref)
	local var813 = t_10.new()
	
	if self.type_label ~= nil then
		var813.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var813.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var813.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var813.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var813.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var813.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var813.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var813.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var813.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var813.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var813.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var813.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var813.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var813.won_ever_label = self.wonEverLabel
	end
	return var813
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20)
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p20 == nil or p20.share == nil then "" else p20.share,
		report = if p20 == nil or p20.report == nil then "" else p20.report
	}, t_11)
end

function t_11:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var815 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var816, var817 = protoModule.writeTag(buff, var815, 1, protoModule.wireTypes.lengthDelimited)
		var816, var817 = protoModule.writeString(var816, var817, self.share)
		buff = var816
		var815 = var817
	end
	if self.report ~= nil and self.report ~= "" then
		local var818, var819 = protoModule.writeTag(buff, var815, 2, protoModule.wireTypes.lengthDelimited)
		var818, var819 = protoModule.writeString(var818, var819, self.report)
		buff = var818
		var815 = var819
	end
	local buff_1 = buffer.create(var815)
	buffer.copy(buff_1, 0, buff, 0, var815)
	
	return buff_1
end

function t_11.decode(p21)
	-- upvalues: t_11 (ref), protoModule (ref)
	local var821 = t_11.new()
	local var822 = 0
	while var822 < buffer.len(p21) do
		local _ = nil
		local var823 = nil
		local var824, var825, var826 = protoModule.readTag(p21, var822)
		local var827 = var824
		var823 = var825
		var822 = var826
		
		if var823 == protoModule.wireTypes.varint then
			local _ = nil
			local var828, var829 = protoModule.readVarInt(p21, var822)
			local _ = var828
			var822 = var829
			continue
		end
		if var823 == protoModule.wireTypes.lengthDelimited then
			if var827 == 1 then
				local _ = nil
				local var830, var831 = protoModule.readBuffer(p21, var822)
				var822 = var831
				var821.share = buffer.tostring(var830)
			elseif var827 == 2 then
				local _ = nil
				local var832, var833 = protoModule.readBuffer(p21, var822)
				var822 = var833
				var821.report = buffer.tostring(var832)
			else
				local _ = nil
				local var834, var835 = protoModule.readVarInt(p21, var822)
				var822 = var835 + var834
			end
		elseif var823 == protoModule.wireTypes.i32 then
			local _ = nil
			local var836, var837 = protoModule.readFixed32(p21, var822)
			local _ = var836
			var822 = var837
		elseif var823 == protoModule.wireTypes.i64 then
			local _ = nil
			local var838, var839 = protoModule.readFixed64(p21, var822)
			local _ = var838
			var822 = var839
		else
			error("Unsupported wire type: " .. var823)
		end
	end
	return var821
end

function t_11:jsonEncode()
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_11:jsonDecode()
	-- upvalues: t_11 (ref)
	local var841 = t_11.new()
	
	if self.share ~= nil then
		var841.share = self.share
	end
	if self.report ~= nil then
		var841.report = self.report
	end
	return var841
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22)
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p22 == nil or p22.report == nil then "" else p22.report,
		remove = if p22 == nil or p22.remove == nil then "" else p22.remove
	}, t_12)
end

function t_12:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var843 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var844, var845 = protoModule.writeTag(buff, var843, 1, protoModule.wireTypes.lengthDelimited)
		var844, var845 = protoModule.writeString(var844, var845, self.report)
		buff = var844
		var843 = var845
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var846, var847 = protoModule.writeTag(buff, var843, 2, protoModule.wireTypes.lengthDelimited)
		var846, var847 = protoModule.writeString(var846, var847, self.remove)
		buff = var846
		var843 = var847
	end
	local buff_1 = buffer.create(var843)
	buffer.copy(buff_1, 0, buff, 0, var843)
	
	return buff_1
end

function t_12.decode(p23)
	-- upvalues: t_12 (ref), protoModule (ref)
	local var849 = t_12.new()
	local var850 = 0
	while var850 < buffer.len(p23) do
		local _ = nil
		local var851 = nil
		local var852, var853, var854 = protoModule.readTag(p23, var850)
		local var855 = var852
		var851 = var853
		var850 = var854
		
		if var851 == protoModule.wireTypes.varint then
			local _ = nil
			local var856, var857 = protoModule.readVarInt(p23, var850)
			local _ = var856
			var850 = var857
			continue
		end
		if var851 == protoModule.wireTypes.lengthDelimited then
			if var855 == 1 then
				local _ = nil
				local var858, var859 = protoModule.readBuffer(p23, var850)
				var850 = var859
				var849.report = buffer.tostring(var858)
			elseif var855 == 2 then
				local _ = nil
				local var860, var861 = protoModule.readBuffer(p23, var850)
				var850 = var861
				var849.remove = buffer.tostring(var860)
			else
				local _ = nil
				local var862, var863 = protoModule.readVarInt(p23, var850)
				var850 = var863 + var862
			end
		elseif var851 == protoModule.wireTypes.i32 then
			local _ = nil
			local var864, var865 = protoModule.readFixed32(p23, var850)
			local _ = var864
			var850 = var865
		elseif var851 == protoModule.wireTypes.i64 then
			local _ = nil
			local var866, var867 = protoModule.readFixed64(p23, var850)
			local _ = var866
			var850 = var867
		else
			error("Unsupported wire type: " .. var851)
		end
	end
	return var849
end

function t_12:jsonEncode()
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_12:jsonDecode()
	-- upvalues: t_12 (ref)
	local var869 = t_12.new()
	
	if self.report ~= nil then
		var869.report = self.report
	end
	if self.remove ~= nil then
		var869.remove = self.remove
	end
	return var869
end

t_12.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t_12
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local t_13 = {}
t_13.__index = t_13

function t_13.new(_)
	-- upvalues: t_13 (ref)
	return setmetatable({}, t_13)
end

function t_13.encode(_)
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_13.decode(p24)
	-- upvalues: t_13 (ref), protoModule (ref)
	local var871 = t_13.new()
	local var872 = 0
	while var872 < buffer.len(p24) do
		local var873 = nil
		local _ = nil
		local var874, var875, var876 = protoModule.readTag(p24, var872)
		var873 = var874
		local var877 = var875
		var872 = var876
		
		if var877 == protoModule.wireTypes.varint then
			local _ = nil
			local var878, var879 = protoModule.readVarInt(p24, var872)
			local _ = var878
			var872 = var879
		elseif var877 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var880, var881 = protoModule.readVarInt(p24, var872)
			var872 = var881 + var880
		elseif var877 == protoModule.wireTypes.i32 then
			local _ = nil
			local var882, var883 = protoModule.readFixed32(p24, var872)
			local _ = var882
			var872 = var883
		elseif var877 == protoModule.wireTypes.i64 then
			local _ = nil
			local var884, var885 = protoModule.readFixed64(p24, var872)
			local _ = var884
			var872 = var885
		else
			error("Unsupported wire type: " .. var877)
		end
	end
	return var871
end

function t_13.jsonEncode(_)
	return {}
end

function t_13.jsonDecode(_)
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

function t_14.new(p25)
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p25 == nil or p25.universe_id == nil then "" else p25.universe_id,
		creator_key = if p25 == nil or p25.creator_key == nil then "" else p25.creator_key,
		entry_map = if p25 == nil or p25.entry_map == nil then {} else p25.entry_map,
		entry_order = if p25 == nil or p25.entry_order == nil then {} else p25.entry_order,
		entry_order_map = if p25 == nil or p25.entry_order_map == nil then {} else p25.entry_order_map
	}, t_14)
end

function t_14:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var887 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var888, var889 = protoModule.writeTag(buff, var887, 1, protoModule.wireTypes.lengthDelimited)
		var888, var889 = protoModule.writeString(var888, var889, self.universe_id)
		buff = var888
		var887 = var889
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var890, var891 = protoModule.writeTag(buff, var887, 2, protoModule.wireTypes.lengthDelimited)
		var890, var891 = protoModule.writeString(var890, var891, self.creator_key)
		buff = var890
		var887 = var891
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var892, var893 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var892, var893 = protoModule.writeString(var892, var893, i)
			local var894 = v:encode()
			var893, var895 = protoModule.writeTag(var892, var893, 2, protoModule.wireTypes.lengthDelimited)
			var893, var895 = protoModule.writeBuffer(var893, var895, var894, buffer.len(var894))
			local var896 = var893
			local var897 = var895
			local var898, var899 = protoModule.writeTag(buff, var887, 3, protoModule.wireTypes.lengthDelimited)
			var898, var899 = protoModule.writeBuffer(var898, var899, var896, var897)
			buff = var898
			var887 = var899
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var900, var901 = protoModule.writeTag(buff, var887, 4, protoModule.wireTypes.lengthDelimited)
			var900, var901 = protoModule.writeString(var900, var901, v)
			buff = var900
			var887 = var901
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var902, var903 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var902, var903 = protoModule.writeString(var902, var903, i)
			local var904 = v:encode()
			var903, var905 = protoModule.writeTag(var902, var903, 2, protoModule.wireTypes.lengthDelimited)
			var903, var905 = protoModule.writeBuffer(var903, var905, var904, buffer.len(var904))
			local var906 = var903
			local var907 = var905
			local var908, var909 = protoModule.writeTag(buff, var887, 5, protoModule.wireTypes.lengthDelimited)
			var908, var909 = protoModule.writeBuffer(var908, var909, var906, var907)
			buff = var908
			var887 = var909
		end
	end
	local buff_1 = buffer.create(var887)
	buffer.copy(buff_1, 0, buff, 0, var887)
	
	return buff_1
end

function t_14.decode(p26)
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var911 = t_14.new()
	local var912 = 0
	while var912 < buffer.len(p26) do
		local _ = nil
		local var913 = nil
		local var914, var915, var916 = protoModule.readTag(p26, var912)
		local var917 = var914
		var913 = var915
		var912 = var916
		
		if var913 == protoModule.wireTypes.varint then
			local _ = nil
			local var918, var919 = protoModule.readVarInt(p26, var912)
			local _ = var918
			var912 = var919
			continue
		end
		if var913 == protoModule.wireTypes.lengthDelimited then
			if var917 == 1 then
				local _ = nil
				local var920, var921 = protoModule.readBuffer(p26, var912)
				var912 = var921
				var911.universe_id = buffer.tostring(var920)
			elseif var917 == 2 then
				local _ = nil
				local var922, var923 = protoModule.readBuffer(p26, var912)
				var912 = var923
				var911.creator_key = buffer.tostring(var922)
			elseif var917 == 3 then
				local _ = nil
				local var924, var925 = protoModule.readBuffer(p26, var912)
				var912 = var925
				var924 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var924)
				var911.entry_map[var924.key or ""] = var924.value or t.FeedEntry.new()
			elseif var917 == 4 then
				local _ = nil
				local var926, var927 = protoModule.readBuffer(p26, var912)
				var912 = var927
				table.insert(var911.entry_order, buffer.tostring(var926))
			elseif var917 == 5 then
				local _ = nil
				local var928, var929 = protoModule.readBuffer(p26, var912)
				var912 = var929
				var928 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var928)
				var911.entry_order_map[var928.key or ""] = var928.value or t.EntryOrder.new()
			else
				local _ = nil
				local var930, var931 = protoModule.readVarInt(p26, var912)
				var912 = var931 + var930
			end
		elseif var913 == protoModule.wireTypes.i32 then
			local _ = nil
			local var932, var933 = protoModule.readFixed32(p26, var912)
			local _ = var932
			var912 = var933
		elseif var913 == protoModule.wireTypes.i64 then
			local _ = nil
			local var934, var935 = protoModule.readFixed64(p26, var912)
			local _ = var934
			var912 = var935
		else
			error("Unsupported wire type: " .. var913)
		end
	end
	return var911
end

function t_14:jsonEncode()
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

function t_14:jsonDecode()
	-- upvalues: t_14 (ref), t (ref)
	local var940 = t_14.new()
	
	if self.universe_id ~= nil then
		var940.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var940.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var940.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var940.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var940.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var940.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var940.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var940.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var940.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var940.entry_order_map = t_1
	end
	return var940
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p27)
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p27 == nil or p27.key == nil then "" else p27.key,
		value = if p27 == nil or p27.value == nil then nil else p27.value
	}, t_15)
end

function t_15:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var948 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var949, var950 = protoModule.writeTag(buff, var948, 1, protoModule.wireTypes.lengthDelimited)
		var949, var950 = protoModule.writeString(var949, var950, self.key)
		buff = var949
		var948 = var950
	end
	if self.value ~= nil then
		local var951 = self.value:encode()
		local var952, var953 = protoModule.writeTag(buff, var948, 2, protoModule.wireTypes.lengthDelimited)
		var952, var953 = protoModule.writeBuffer(var952, var953, var951, buffer.len(var951))
		buff = var952
		var948 = var953
	end
	local buff_1 = buffer.create(var948)
	buffer.copy(buff_1, 0, buff, 0, var948)
	
	return buff_1
end

function t_15.decode(p28)
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var955 = t_15.new()
	local var956 = 0
	while var956 < buffer.len(p28) do
		local _ = nil
		local var957 = nil
		local var958, var959, var960 = protoModule.readTag(p28, var956)
		local var961 = var958
		var957 = var959
		var956 = var960
		
		if var957 == protoModule.wireTypes.varint then
			local _ = nil
			local var962, var963 = protoModule.readVarInt(p28, var956)
			local _ = var962
			var956 = var963
			continue
		end
		if var957 == protoModule.wireTypes.lengthDelimited then
			if var961 == 1 then
				local _ = nil
				local var964, var965 = protoModule.readBuffer(p28, var956)
				var956 = var965
				var955.key = buffer.tostring(var964)
			elseif var961 == 2 then
				local _ = nil
				local var966, var967 = protoModule.readBuffer(p28, var956)
				var956 = var967
				var955.value = t.FeedEntry.decode(var966)
			else
				local _ = nil
				local var968, var969 = protoModule.readVarInt(p28, var956)
				var956 = var969 + var968
			end
		elseif var957 == protoModule.wireTypes.i32 then
			local _ = nil
			local var970, var971 = protoModule.readFixed32(p28, var956)
			local _ = var970
			var956 = var971
		elseif var957 == protoModule.wireTypes.i64 then
			local _ = nil
			local var972, var973 = protoModule.readFixed64(p28, var956)
			local _ = var972
			var956 = var973
		else
			error("Unsupported wire type: " .. var957)
		end
	end
	return var955
end

function t_15:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode()
	-- upvalues: t_15 (ref), t (ref)
	local var975 = t_15.new()
	
	if self.key ~= nil then
		var975.key = self.key
	end
	if self.value ~= nil then
		var975.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var975
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p29)
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p29 == nil or p29.key == nil then "" else p29.key,
		value = if p29 == nil or p29.value == nil then nil else p29.value
	}, t_16)
end

function t_16:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var977 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var978, var979 = protoModule.writeTag(buff, var977, 1, protoModule.wireTypes.lengthDelimited)
		var978, var979 = protoModule.writeString(var978, var979, self.key)
		buff = var978
		var977 = var979
	end
	if self.value ~= nil then
		local var980 = self.value:encode()
		local var981, var982 = protoModule.writeTag(buff, var977, 2, protoModule.wireTypes.lengthDelimited)
		var981, var982 = protoModule.writeBuffer(var981, var982, var980, buffer.len(var980))
		buff = var981
		var977 = var982
	end
	local buff_1 = buffer.create(var977)
	buffer.copy(buff_1, 0, buff, 0, var977)
	
	return buff_1
end

function t_16.decode(p30)
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var984 = t_16.new()
	local var985 = 0
	while var985 < buffer.len(p30) do
		local _ = nil
		local var986 = nil
		local var987, var988, var989 = protoModule.readTag(p30, var985)
		local var990 = var987
		var986 = var988
		var985 = var989
		
		if var986 == protoModule.wireTypes.varint then
			local _ = nil
			local var991, var992 = protoModule.readVarInt(p30, var985)
			local _ = var991
			var985 = var992
			continue
		end
		if var986 == protoModule.wireTypes.lengthDelimited then
			if var990 == 1 then
				local _ = nil
				local var993, var994 = protoModule.readBuffer(p30, var985)
				var985 = var994
				var984.key = buffer.tostring(var993)
			elseif var990 == 2 then
				local _ = nil
				local var995, var996 = protoModule.readBuffer(p30, var985)
				var985 = var996
				var984.value = t.EntryOrder.decode(var995)
			else
				local _ = nil
				local var997, var998 = protoModule.readVarInt(p30, var985)
				var985 = var998 + var997
			end
		elseif var986 == protoModule.wireTypes.i32 then
			local _ = nil
			local var999, var1000 = protoModule.readFixed32(p30, var985)
			local _ = var999
			var985 = var1000
		elseif var986 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1001, var1002 = protoModule.readFixed64(p30, var985)
			local _ = var1001
			var985 = var1002
		else
			error("Unsupported wire type: " .. var986)
		end
	end
	return var984
end

function t_16:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode()
	-- upvalues: t_16 (ref), t (ref)
	local var1004 = t_16.new()
	
	if self.key ~= nil then
		var1004.key = self.key
	end
	if self.value ~= nil then
		var1004.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var1004
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p31)
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p31 == nil or p31.items == nil then {} else p31.items
	}, t_17)
end

function t_17:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1006 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var1007, var1008 = protoModule.writeTag(buff, var1006, 1, protoModule.wireTypes.lengthDelimited)
			var1007, var1008 = protoModule.writeString(var1007, var1008, v)
			buff = var1007
			var1006 = var1008
		end
	end
	local buff_1 = buffer.create(var1006)
	buffer.copy(buff_1, 0, buff, 0, var1006)
	
	return buff_1
end

function t_17.decode(p32)
	-- upvalues: t_17 (ref), protoModule (ref)
	local var1010 = t_17.new()
	local var1011 = 0
	while var1011 < buffer.len(p32) do
		local _ = nil
		local var1012 = nil
		local var1013, var1014, var1015 = protoModule.readTag(p32, var1011)
		local var1016 = var1013
		var1012 = var1014
		var1011 = var1015
		
		if var1012 == protoModule.wireTypes.varint then
			local _ = nil
			local var1017, var1018 = protoModule.readVarInt(p32, var1011)
			local _ = var1017
			var1011 = var1018
			continue
		end
		if var1012 == protoModule.wireTypes.lengthDelimited then
			if var1016 == 1 then
				local _ = nil
				local var1019, var1020 = protoModule.readBuffer(p32, var1011)
				var1011 = var1020
				table.insert(var1010.items, buffer.tostring(var1019))
			else
				local _ = nil
				local var1021, var1022 = protoModule.readVarInt(p32, var1011)
				var1011 = var1022 + var1021
			end
		elseif var1012 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1023, var1024 = protoModule.readFixed32(p32, var1011)
			local _ = var1023
			var1011 = var1024
		elseif var1012 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1025, var1026 = protoModule.readFixed64(p32, var1011)
			local _ = var1025
			var1011 = var1026
		else
			error("Unsupported wire type: " .. var1012)
		end
	end
	return var1010
end

function t_17:jsonEncode()
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

function t_17:jsonDecode()
	-- upvalues: t_17 (ref)
	local var1029 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var1029.items = t
	end
	return var1029
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p33)
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p33 == nil or p33.universe_id == nil then "" else p33.universe_id,
		user_owns_experience = if p33 == nil or p33.user_owns_experience == nil then false else p33.user_owns_experience
	}, t_18)
end

function t_18:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1032 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1033, var1034 = protoModule.writeTag(buff, var1032, 1, protoModule.wireTypes.lengthDelimited)
		var1033, var1034 = protoModule.writeString(var1033, var1034, self.universe_id)
		buff = var1033
		var1032 = var1034
	end
	if self.user_owns_experience then
		local var1035, var1036 = protoModule.writeTag(buff, var1032, 2, protoModule.wireTypes.varint)
		var1035, var1036 = protoModule.writeVarInt(var1035, var1036, if self.user_owns_experience then 1 else 0)
		buff = var1035
		var1032 = var1036
	end
	local buff_1 = buffer.create(var1032)
	buffer.copy(buff_1, 0, buff, 0, var1032)
	
	return buff_1
end

function t_18.decode(p34)
	-- upvalues: t_18 (ref), protoModule (ref)
	local var1038 = t_18.new()
	local var1039 = 0
	while var1039 < buffer.len(p34) do
		local _ = nil
		local var1040 = nil
		local var1041, var1042, var1043 = protoModule.readTag(p34, var1039)
		local var1044 = var1041
		var1040 = var1042
		var1039 = var1043
		
		if var1040 == protoModule.wireTypes.varint then
			if var1044 == 2 then
				local _ = nil
				local var1045, var1046 = protoModule.readVarInt(p34, var1039)
				var1039 = var1046
				var1038.user_owns_experience = var1045 ~= 0
			else
				local _ = nil
				local var1047, var1048 = protoModule.readVarInt(p34, var1039)
				local _ = var1047
				var1039 = var1048
			end
		end
		if var1040 == protoModule.wireTypes.lengthDelimited then
			if var1044 == 1 then
				local _ = nil
				local var1049, var1050 = protoModule.readBuffer(p34, var1039)
				var1039 = var1050
				var1038.universe_id = buffer.tostring(var1049)
			else
				local _ = nil
				local var1051, var1052 = protoModule.readVarInt(p34, var1039)
				var1039 = var1052 + var1051
			end
		elseif var1040 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1053, var1054 = protoModule.readFixed32(p34, var1039)
			local _ = var1053
			var1039 = var1054
		elseif var1040 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1055, var1056 = protoModule.readFixed64(p34, var1039)
			local _ = var1055
			var1039 = var1056
		else
			error("Unsupported wire type: " .. var1040)
		end
	end
	return var1038
end

function t_18:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_18:jsonDecode()
	-- upvalues: t_18 (ref)
	local var1058 = t_18.new()
	
	if self.universe_id ~= nil then
		var1058.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1058.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1058.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1058.user_owns_experience = self.userOwnsExperience
	end
	return var1058
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p35)
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p35 == nil or p35.media_asset_id == nil then "" else p35.media_asset_id
	}, t_19)
end

function t_19:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1060 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1061, var1062 = protoModule.writeTag(buff, var1060, 1, protoModule.wireTypes.lengthDelimited)
		var1061, var1062 = protoModule.writeString(var1061, var1062, self.media_asset_id)
		buff = var1061
		var1060 = var1062
	end
	local buff_1 = buffer.create(var1060)
	buffer.copy(buff_1, 0, buff, 0, var1060)
	
	return buff_1
end

function t_19.decode(p36)
	-- upvalues: t_19 (ref), protoModule (ref)
	local var1064 = t_19.new()
	local var1065 = 0
	while var1065 < buffer.len(p36) do
		local _ = nil
		local var1066 = nil
		local var1067, var1068, var1069 = protoModule.readTag(p36, var1065)
		local var1070 = var1067
		var1066 = var1068
		var1065 = var1069
		
		if var1066 == protoModule.wireTypes.varint then
			local _ = nil
			local var1071, var1072 = protoModule.readVarInt(p36, var1065)
			local _ = var1071
			var1065 = var1072
			continue
		end
		if var1066 == protoModule.wireTypes.lengthDelimited then
			if var1070 == 1 then
				local _ = nil
				local var1073, var1074 = protoModule.readBuffer(p36, var1065)
				var1065 = var1074
				var1064.media_asset_id = buffer.tostring(var1073)
			else
				local _ = nil
				local var1075, var1076 = protoModule.readVarInt(p36, var1065)
				var1065 = var1076 + var1075
			end
		elseif var1066 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1077, var1078 = protoModule.readFixed32(p36, var1065)
			local _ = var1077
			var1065 = var1078
		elseif var1066 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1079, var1080 = protoModule.readFixed64(p36, var1065)
			local _ = var1079
			var1065 = var1080
		else
			error("Unsupported wire type: " .. var1066)
		end
	end
	return var1064
end

function t_19:jsonEncode()
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_19:jsonDecode()
	-- upvalues: t_19 (ref)
	local var1082 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var1082.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1082.media_asset_id = self.mediaAssetId
	end
	return var1082
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p37)
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p37 == nil or p37.universe_id == nil then "" else p37.universe_id
	}, t_20)
end

function t_20:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1084 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1085, var1086 = protoModule.writeTag(buff, var1084, 1, protoModule.wireTypes.lengthDelimited)
		var1085, var1086 = protoModule.writeString(var1085, var1086, self.universe_id)
		buff = var1085
		var1084 = var1086
	end
	local buff_1 = buffer.create(var1084)
	buffer.copy(buff_1, 0, buff, 0, var1084)
	
	return buff_1
end

function t_20.decode(p38)
	-- upvalues: t_20 (ref), protoModule (ref)
	local var1088 = t_20.new()
	local var1089 = 0
	while var1089 < buffer.len(p38) do
		local _ = nil
		local var1090 = nil
		local var1091, var1092, var1093 = protoModule.readTag(p38, var1089)
		local var1094 = var1091
		var1090 = var1092
		var1089 = var1093
		
		if var1090 == protoModule.wireTypes.varint then
			local _ = nil
			local var1095, var1096 = protoModule.readVarInt(p38, var1089)
			local _ = var1095
			var1089 = var1096
			continue
		end
		if var1090 == protoModule.wireTypes.lengthDelimited then
			if var1094 == 1 then
				local _ = nil
				local var1097, var1098 = protoModule.readBuffer(p38, var1089)
				var1089 = var1098
				var1088.universe_id = buffer.tostring(var1097)
			else
				local _ = nil
				local var1099, var1100 = protoModule.readVarInt(p38, var1089)
				var1089 = var1100 + var1099
			end
		elseif var1090 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1101, var1102 = protoModule.readFixed32(p38, var1089)
			local _ = var1101
			var1089 = var1102
		elseif var1090 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1103, var1104 = protoModule.readFixed64(p38, var1089)
			local _ = var1103
			var1089 = var1104
		else
			error("Unsupported wire type: " .. var1090)
		end
	end
	return var1088
end

function t_20:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_20:jsonDecode()
	-- upvalues: t_20 (ref)
	local var1106 = t_20.new()
	
	if self.universe_id ~= nil then
		var1106.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1106.universe_id = self.universeId
	end
	return var1106
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p39)
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p39 == nil or p39.universe_id == nil then "" else p39.universe_id,
		creator_key = if p39 == nil or p39.creator_key == nil then "" else p39.creator_key
	}, t_21)
end

function t_21:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1108 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1109, var1110 = protoModule.writeTag(buff, var1108, 1, protoModule.wireTypes.lengthDelimited)
		var1109, var1110 = protoModule.writeString(var1109, var1110, self.universe_id)
		buff = var1109
		var1108 = var1110
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1111, var1112 = protoModule.writeTag(buff, var1108, 2, protoModule.wireTypes.lengthDelimited)
		var1111, var1112 = protoModule.writeString(var1111, var1112, self.creator_key)
		buff = var1111
		var1108 = var1112
	end
	local buff_1 = buffer.create(var1108)
	buffer.copy(buff_1, 0, buff, 0, var1108)
	
	return buff_1
end

function t_21.decode(p40)
	-- upvalues: t_21 (ref), protoModule (ref)
	local var1114 = t_21.new()
	local var1115 = 0
	while var1115 < buffer.len(p40) do
		local _ = nil
		local var1116 = nil
		local var1117, var1118, var1119 = protoModule.readTag(p40, var1115)
		local var1120 = var1117
		var1116 = var1118
		var1115 = var1119
		
		if var1116 == protoModule.wireTypes.varint then
			local _ = nil
			local var1121, var1122 = protoModule.readVarInt(p40, var1115)
			local _ = var1121
			var1115 = var1122
			continue
		end
		if var1116 == protoModule.wireTypes.lengthDelimited then
			if var1120 == 1 then
				local _ = nil
				local var1123, var1124 = protoModule.readBuffer(p40, var1115)
				var1115 = var1124
				var1114.universe_id = buffer.tostring(var1123)
			elseif var1120 == 2 then
				local _ = nil
				local var1125, var1126 = protoModule.readBuffer(p40, var1115)
				var1115 = var1126
				var1114.creator_key = buffer.tostring(var1125)
			else
				local _ = nil
				local var1127, var1128 = protoModule.readVarInt(p40, var1115)
				var1115 = var1128 + var1127
			end
		elseif var1116 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1129, var1130 = protoModule.readFixed32(p40, var1115)
			local _ = var1129
			var1115 = var1130
		elseif var1116 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1131, var1132 = protoModule.readFixed64(p40, var1115)
			local _ = var1131
			var1115 = var1132
		else
			error("Unsupported wire type: " .. var1116)
		end
	end
	return var1114
end

function t_21:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_21:jsonDecode()
	-- upvalues: t_21 (ref)
	local var1134 = t_21.new()
	
	if self.universe_id ~= nil then
		var1134.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1134.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1134.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1134.creator_key = self.creatorKey
	end
	return var1134
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p41)
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

function t_22:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1136 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1137, var1138 = protoModule.writeTag(buff, var1136, 1, protoModule.wireTypes.lengthDelimited)
		var1137, var1138 = protoModule.writeString(var1137, var1138, self.universe_id)
		buff = var1137
		var1136 = var1138
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var1139, var1140 = protoModule.writeTag(buff, var1136, 2, protoModule.wireTypes.lengthDelimited)
		var1139, var1140 = protoModule.writeString(var1139, var1140, self.root_place_id)
		buff = var1139
		var1136 = var1140
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var1141, var1142 = protoModule.writeTag(buff, var1136, 3, protoModule.wireTypes.lengthDelimited)
		var1141, var1142 = protoModule.writeString(var1141, var1142, self.connection_played_display_name)
		buff = var1141
		var1136 = var1142
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1143, var1144 = protoModule.writeTag(buff, var1136, 4, protoModule.wireTypes.lengthDelimited)
		var1143, var1144 = protoModule.writeString(var1143, var1144, self.upsell_prompt)
		buff = var1143
		var1136 = var1144
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var1145 = v:encode()
			local var1146, var1147 = protoModule.writeTag(buff, var1136, 5, protoModule.wireTypes.lengthDelimited)
			var1146, var1147 = protoModule.writeBuffer(var1146, var1147, var1145, buffer.len(var1145))
			buff = var1146
			var1136 = var1147
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var1148, var1149 = protoModule.writeTag(buff, var1136, 6, protoModule.wireTypes.varint)
		var1148, var1149 = protoModule.writeVarInt(var1148, var1149, self.connection_played_num_others)
		buff = var1148
		var1136 = var1149
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var1150, var1151 = protoModule.writeTag(buff, var1136, 7, protoModule.wireTypes.varint)
		var1150, var1151 = protoModule.writeVarInt(var1150, var1151, self.connection_played_total_count)
		buff = var1150
		var1136 = var1151
	end
	local buff_1 = buffer.create(var1136)
	buffer.copy(buff_1, 0, buff, 0, var1136)
	
	return buff_1
end

function t_22.decode(p42)
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var1153 = t_22.new()
	local var1154 = 0
	while var1154 < buffer.len(p42) do
		local _ = nil
		local var1155 = nil
		local var1156, var1157, var1158 = protoModule.readTag(p42, var1154)
		local var1159 = var1156
		var1155 = var1157
		var1154 = var1158
		
		if var1155 == protoModule.wireTypes.varint then
			if var1159 == 6 then
				local _ = nil
				local var1160, var1161 = protoModule.readVarIntI32(p42, var1154)
				var1154 = var1161
				var1153.connection_played_num_others = var1160
			elseif var1159 == 7 then
				local _ = nil
				local var1162, var1163 = protoModule.readVarIntI32(p42, var1154)
				var1154 = var1163
				var1153.connection_played_total_count = var1162
			else
				local _ = nil
				local var1164, var1165 = protoModule.readVarInt(p42, var1154)
				local _ = var1164
				var1154 = var1165
			end
		end
		if var1155 == protoModule.wireTypes.lengthDelimited then
			if var1159 == 1 then
				local _ = nil
				local var1166, var1167 = protoModule.readBuffer(p42, var1154)
				var1154 = var1167
				var1153.universe_id = buffer.tostring(var1166)
			elseif var1159 == 2 then
				local _ = nil
				local var1168, var1169 = protoModule.readBuffer(p42, var1154)
				var1154 = var1169
				var1153.root_place_id = buffer.tostring(var1168)
			elseif var1159 == 3 then
				local _ = nil
				local var1170, var1171 = protoModule.readBuffer(p42, var1154)
				var1154 = var1171
				var1153.connection_played_display_name = buffer.tostring(var1170)
			elseif var1159 == 4 then
				local _ = nil
				local var1172, var1173 = protoModule.readBuffer(p42, var1154)
				var1154 = var1173
				var1153.upsell_prompt = buffer.tostring(var1172)
			elseif var1159 == 5 then
				local _ = nil
				local var1174, var1175 = protoModule.readBuffer(p42, var1154)
				var1154 = var1175
				table.insert(var1153.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var1174))
			else
				local _ = nil
				local var1176, var1177 = protoModule.readVarInt(p42, var1154)
				var1154 = var1177 + var1176
			end
		elseif var1155 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1178, var1179 = protoModule.readFixed32(p42, var1154)
			local _ = var1178
			var1154 = var1179
		elseif var1155 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1180, var1181 = protoModule.readFixed64(p42, var1154)
			local _ = var1180
			var1154 = var1181
		else
			error("Unsupported wire type: " .. var1155)
		end
	end
	return var1153
end

function t_22:jsonEncode()
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

function t_22:jsonDecode()
	-- upvalues: t_22 (ref), t (ref)
	local var1184 = t_22.new()
	
	if self.universe_id ~= nil then
		var1184.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1184.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var1184.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var1184.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var1184.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var1184.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var1184.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1184.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1184.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1184.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var1184.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var1184.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var1184.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var1184.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var1184
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p43)
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p43 == nil or p43.user_id == nil then "" else p43.user_id
	}, t_23)
end

function t_23:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1188 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1189, var1190 = protoModule.writeTag(buff, var1188, 1, protoModule.wireTypes.lengthDelimited)
		var1189, var1190 = protoModule.writeString(var1189, var1190, self.user_id)
		buff = var1189
		var1188 = var1190
	end
	local buff_1 = buffer.create(var1188)
	buffer.copy(buff_1, 0, buff, 0, var1188)
	
	return buff_1
end

function t_23.decode(p44)
	-- upvalues: t_23 (ref), protoModule (ref)
	local var1192 = t_23.new()
	local var1193 = 0
	while var1193 < buffer.len(p44) do
		local _ = nil
		local var1194 = nil
		local var1195, var1196, var1197 = protoModule.readTag(p44, var1193)
		local var1198 = var1195
		var1194 = var1196
		var1193 = var1197
		
		if var1194 == protoModule.wireTypes.varint then
			local _ = nil
			local var1199, var1200 = protoModule.readVarInt(p44, var1193)
			local _ = var1199
			var1193 = var1200
			continue
		end
		if var1194 == protoModule.wireTypes.lengthDelimited then
			if var1198 == 1 then
				local _ = nil
				local var1201, var1202 = protoModule.readBuffer(p44, var1193)
				var1193 = var1202
				var1192.user_id = buffer.tostring(var1201)
			else
				local _ = nil
				local var1203, var1204 = protoModule.readVarInt(p44, var1193)
				var1193 = var1204 + var1203
			end
		elseif var1194 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1205, var1206 = protoModule.readFixed32(p44, var1193)
			local _ = var1205
			var1193 = var1206
		elseif var1194 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1207, var1208 = protoModule.readFixed64(p44, var1193)
			local _ = var1207
			var1193 = var1208
		else
			error("Unsupported wire type: " .. var1194)
		end
	end
	return var1192
end

function t_23:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_23:jsonDecode()
	-- upvalues: t_23 (ref)
	local var1210 = t_23.new()
	
	if self.user_id ~= nil then
		var1210.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1210.user_id = self.userId
	end
	return var1210
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p45)
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p45 == nil or p45.media_items == nil then {} else p45.media_items,
		universe_id = if p45 == nil or p45.universe_id == nil then "" else p45.universe_id,
		place_id = if p45 == nil or p45.place_id == nil then "" else p45.place_id
	}, t_24)
end

function t_24:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1212 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var1213 = v:encode()
			local var1214, var1215 = protoModule.writeTag(buff, var1212, 1, protoModule.wireTypes.lengthDelimited)
			var1214, var1215 = protoModule.writeBuffer(var1214, var1215, var1213, buffer.len(var1213))
			buff = var1214
			var1212 = var1215
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1216, var1217 = protoModule.writeTag(buff, var1212, 2, protoModule.wireTypes.lengthDelimited)
		var1216, var1217 = protoModule.writeString(var1216, var1217, self.universe_id)
		buff = var1216
		var1212 = var1217
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1218, var1219 = protoModule.writeTag(buff, var1212, 3, protoModule.wireTypes.lengthDelimited)
		var1218, var1219 = protoModule.writeString(var1218, var1219, self.place_id)
		buff = var1218
		var1212 = var1219
	end
	local buff_1 = buffer.create(var1212)
	buffer.copy(buff_1, 0, buff, 0, var1212)
	
	return buff_1
end

function t_24.decode(p46)
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var1221 = t_24.new()
	local var1222 = 0
	while var1222 < buffer.len(p46) do
		local _ = nil
		local var1223 = nil
		local var1224, var1225, var1226 = protoModule.readTag(p46, var1222)
		local var1227 = var1224
		var1223 = var1225
		var1222 = var1226
		
		if var1223 == protoModule.wireTypes.varint then
			local _ = nil
			local var1228, var1229 = protoModule.readVarInt(p46, var1222)
			local _ = var1228
			var1222 = var1229
			continue
		end
		if var1223 == protoModule.wireTypes.lengthDelimited then
			if var1227 == 1 then
				local _ = nil
				local var1230, var1231 = protoModule.readBuffer(p46, var1222)
				var1222 = var1231
				table.insert(var1221.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var1230))
			elseif var1227 == 2 then
				local _ = nil
				local var1232, var1233 = protoModule.readBuffer(p46, var1222)
				var1222 = var1233
				var1221.universe_id = buffer.tostring(var1232)
			elseif var1227 == 3 then
				local _ = nil
				local var1234, var1235 = protoModule.readBuffer(p46, var1222)
				var1222 = var1235
				var1221.place_id = buffer.tostring(var1234)
			else
				local _ = nil
				local var1236, var1237 = protoModule.readVarInt(p46, var1222)
				var1222 = var1237 + var1236
			end
		elseif var1223 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1238, var1239 = protoModule.readFixed32(p46, var1222)
			local _ = var1238
			var1222 = var1239
		elseif var1223 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1240, var1241 = protoModule.readFixed64(p46, var1222)
			local _ = var1240
			var1222 = var1241
		else
			error("Unsupported wire type: " .. var1223)
		end
	end
	return var1221
end

function t_24:jsonEncode()
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

function t_24:jsonDecode()
	-- upvalues: t_24 (ref), t (ref)
	local var1244 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1244.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1244.media_items = t_1
	end
	if self.universe_id ~= nil then
		var1244.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1244.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1244.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1244.place_id = self.placeId
	end
	return var1244
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p47)
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p47 == nil or p47.media_asset_id == nil then "" else p47.media_asset_id
	}, t_25)
end

function t_25:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1248 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1249, var1250 = protoModule.writeTag(buff, var1248, 1, protoModule.wireTypes.lengthDelimited)
		var1249, var1250 = protoModule.writeString(var1249, var1250, self.media_asset_id)
		buff = var1249
		var1248 = var1250
	end
	local buff_1 = buffer.create(var1248)
	buffer.copy(buff_1, 0, buff, 0, var1248)
	
	return buff_1
end

function t_25.decode(p48)
	-- upvalues: t_25 (ref), protoModule (ref)
	local var1252 = t_25.new()
	local var1253 = 0
	while var1253 < buffer.len(p48) do
		local _ = nil
		local var1254 = nil
		local var1255, var1256, var1257 = protoModule.readTag(p48, var1253)
		local var1258 = var1255
		var1254 = var1256
		var1253 = var1257
		
		if var1254 == protoModule.wireTypes.varint then
			local _ = nil
			local var1259, var1260 = protoModule.readVarInt(p48, var1253)
			local _ = var1259
			var1253 = var1260
			continue
		end
		if var1254 == protoModule.wireTypes.lengthDelimited then
			if var1258 == 1 then
				local _ = nil
				local var1261, var1262 = protoModule.readBuffer(p48, var1253)
				var1253 = var1262
				var1252.media_asset_id = buffer.tostring(var1261)
			else
				local _ = nil
				local var1263, var1264 = protoModule.readVarInt(p48, var1253)
				var1253 = var1264 + var1263
			end
		elseif var1254 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1265, var1266 = protoModule.readFixed32(p48, var1253)
			local _ = var1265
			var1253 = var1266
		elseif var1254 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1267, var1268 = protoModule.readFixed64(p48, var1253)
			local _ = var1267
			var1253 = var1268
		else
			error("Unsupported wire type: " .. var1254)
		end
	end
	return var1252
end

function t_25:jsonEncode()
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_25:jsonDecode()
	-- upvalues: t_25 (ref)
	local var1270 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var1270.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1270.media_asset_id = self.mediaAssetId
	end
	return var1270
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p49)
	-- upvalues: t_26 (ref)
	return setmetatable({
		universe_id = if p49 == nil or p49.universe_id == nil then "" else p49.universe_id
	}, t_26)
end

function t_26:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1272 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1273, var1274 = protoModule.writeTag(buff, var1272, 1, protoModule.wireTypes.lengthDelimited)
		var1273, var1274 = protoModule.writeString(var1273, var1274, self.universe_id)
		buff = var1273
		var1272 = var1274
	end
	local buff_1 = buffer.create(var1272)
	buffer.copy(buff_1, 0, buff, 0, var1272)
	
	return buff_1
end

function t_26.decode(p50)
	-- upvalues: t_26 (ref), protoModule (ref)
	local var1276 = t_26.new()
	local var1277 = 0
	while var1277 < buffer.len(p50) do
		local _ = nil
		local var1278 = nil
		local var1279, var1280, var1281 = protoModule.readTag(p50, var1277)
		local var1282 = var1279
		var1278 = var1280
		var1277 = var1281
		
		if var1278 == protoModule.wireTypes.varint then
			local _ = nil
			local var1283, var1284 = protoModule.readVarInt(p50, var1277)
			local _ = var1283
			var1277 = var1284
			continue
		end
		if var1278 == protoModule.wireTypes.lengthDelimited then
			if var1282 == 1 then
				local _ = nil
				local var1285, var1286 = protoModule.readBuffer(p50, var1277)
				var1277 = var1286
				var1276.universe_id = buffer.tostring(var1285)
			else
				local _ = nil
				local var1287, var1288 = protoModule.readVarInt(p50, var1277)
				var1277 = var1288 + var1287
			end
		elseif var1278 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1289, var1290 = protoModule.readFixed32(p50, var1277)
			local _ = var1289
			var1277 = var1290
		elseif var1278 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1291, var1292 = protoModule.readFixed64(p50, var1277)
			local _ = var1291
			var1277 = var1292
		else
			error("Unsupported wire type: " .. var1278)
		end
	end
	return var1276
end

function t_26:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_26:jsonDecode()
	-- upvalues: t_26 (ref)
	local var1294 = t_26.new()
	
	if self.universe_id ~= nil then
		var1294.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1294.universe_id = self.universeId
	end
	return var1294
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p51)
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p51 == nil or p51.universe_id == nil then "" else p51.universe_id
	}, t_27)
end

function t_27:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1296 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1297, var1298 = protoModule.writeTag(buff, var1296, 1, protoModule.wireTypes.lengthDelimited)
		var1297, var1298 = protoModule.writeString(var1297, var1298, self.universe_id)
		buff = var1297
		var1296 = var1298
	end
	local buff_1 = buffer.create(var1296)
	buffer.copy(buff_1, 0, buff, 0, var1296)
	
	return buff_1
end

function t_27.decode(p52)
	-- upvalues: t_27 (ref), protoModule (ref)
	local var1300 = t_27.new()
	local var1301 = 0
	while var1301 < buffer.len(p52) do
		local _ = nil
		local var1302 = nil
		local var1303, var1304, var1305 = protoModule.readTag(p52, var1301)
		local var1306 = var1303
		var1302 = var1304
		var1301 = var1305
		
		if var1302 == protoModule.wireTypes.varint then
			local _ = nil
			local var1307, var1308 = protoModule.readVarInt(p52, var1301)
			local _ = var1307
			var1301 = var1308
			continue
		end
		if var1302 == protoModule.wireTypes.lengthDelimited then
			if var1306 == 1 then
				local _ = nil
				local var1309, var1310 = protoModule.readBuffer(p52, var1301)
				var1301 = var1310
				var1300.universe_id = buffer.tostring(var1309)
			else
				local _ = nil
				local var1311, var1312 = protoModule.readVarInt(p52, var1301)
				var1301 = var1312 + var1311
			end
		elseif var1302 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1313, var1314 = protoModule.readFixed32(p52, var1301)
			local _ = var1313
			var1301 = var1314
		elseif var1302 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1315, var1316 = protoModule.readFixed64(p52, var1301)
			local _ = var1315
			var1301 = var1316
		else
			error("Unsupported wire type: " .. var1302)
		end
	end
	return var1300
end

function t_27:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_27:jsonDecode()
	-- upvalues: t_27 (ref)
	local var1318 = t_27.new()
	
	if self.universe_id ~= nil then
		var1318.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1318.universe_id = self.universeId
	end
	return var1318
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p53)
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p53 == nil or p53.universe_id == nil then "" else p53.universe_id,
		has_store_items = if p53 == nil or p53.has_store_items == nil then false else p53.has_store_items,
		has_badges = if p53 == nil or p53.has_badges == nil then false else p53.has_badges,
		has_game_passes = if p53 == nil or p53.has_game_passes == nil then false else p53.has_game_passes
	}, t_28)
end

function t_28:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1320 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1321, var1322 = protoModule.writeTag(buff, var1320, 1, protoModule.wireTypes.lengthDelimited)
		var1321, var1322 = protoModule.writeString(var1321, var1322, self.universe_id)
		buff = var1321
		var1320 = var1322
	end
	if self.has_store_items then
		local var1323, var1324 = protoModule.writeTag(buff, var1320, 2, protoModule.wireTypes.varint)
		var1323, var1324 = protoModule.writeVarInt(var1323, var1324, if self.has_store_items then 1 else 0)
		buff = var1323
		var1320 = var1324
	end
	if self.has_badges then
		local var1325, var1326 = protoModule.writeTag(buff, var1320, 3, protoModule.wireTypes.varint)
		var1325, var1326 = protoModule.writeVarInt(var1325, var1326, if self.has_badges then 1 else 0)
		buff = var1325
		var1320 = var1326
	end
	if self.has_game_passes then
		local var1327, var1328 = protoModule.writeTag(buff, var1320, 4, protoModule.wireTypes.varint)
		var1327, var1328 = protoModule.writeVarInt(var1327, var1328, if self.has_game_passes then 1 else 0)
		buff = var1327
		var1320 = var1328
	end
	local buff_1 = buffer.create(var1320)
	buffer.copy(buff_1, 0, buff, 0, var1320)
	
	return buff_1
end

function t_28.decode(p54)
	-- upvalues: t_28 (ref), protoModule (ref)
	local var1330 = t_28.new()
	local var1331 = 0
	while var1331 < buffer.len(p54) do
		local _ = nil
		local var1332 = nil
		local var1333, var1334, var1335 = protoModule.readTag(p54, var1331)
		local var1336 = var1333
		var1332 = var1334
		var1331 = var1335
		
		if var1332 == protoModule.wireTypes.varint then
			if var1336 == 2 then
				local _ = nil
				local var1337, var1338 = protoModule.readVarInt(p54, var1331)
				var1331 = var1338
				var1330.has_store_items = var1337 ~= 0
			elseif var1336 == 3 then
				local _ = nil
				local var1339, var1340 = protoModule.readVarInt(p54, var1331)
				var1331 = var1340
				var1330.has_badges = var1339 ~= 0
			elseif var1336 == 4 then
				local _ = nil
				local var1341, var1342 = protoModule.readVarInt(p54, var1331)
				var1331 = var1342
				var1330.has_game_passes = var1341 ~= 0
			else
				local _ = nil
				local var1343, var1344 = protoModule.readVarInt(p54, var1331)
				local _ = var1343
				var1331 = var1344
			end
		end
		if var1332 == protoModule.wireTypes.lengthDelimited then
			if var1336 == 1 then
				local _ = nil
				local var1345, var1346 = protoModule.readBuffer(p54, var1331)
				var1331 = var1346
				var1330.universe_id = buffer.tostring(var1345)
			else
				local _ = nil
				local var1347, var1348 = protoModule.readVarInt(p54, var1331)
				var1331 = var1348 + var1347
			end
		elseif var1332 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1349, var1350 = protoModule.readFixed32(p54, var1331)
			local _ = var1349
			var1331 = var1350
		elseif var1332 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1351, var1352 = protoModule.readFixed64(p54, var1331)
			local _ = var1351
			var1331 = var1352
		else
			error("Unsupported wire type: " .. var1332)
		end
	end
	return var1330
end

function t_28:jsonEncode()
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

function t_28:jsonDecode()
	-- upvalues: t_28 (ref)
	local var1354 = t_28.new()
	
	if self.universe_id ~= nil then
		var1354.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1354.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var1354.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var1354.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var1354.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var1354.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var1354.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var1354.has_game_passes = self.hasGamePasses
	end
	return var1354
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p55)
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p55 == nil or p55.universe_id == nil then "" else p55.universe_id
	}, t_29)
end

function t_29:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1356 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1357, var1358 = protoModule.writeTag(buff, var1356, 1, protoModule.wireTypes.lengthDelimited)
		var1357, var1358 = protoModule.writeString(var1357, var1358, self.universe_id)
		buff = var1357
		var1356 = var1358
	end
	local buff_1 = buffer.create(var1356)
	buffer.copy(buff_1, 0, buff, 0, var1356)
	
	return buff_1
end

function t_29.decode(p56)
	-- upvalues: t_29 (ref), protoModule (ref)
	local var1360 = t_29.new()
	local var1361 = 0
	while var1361 < buffer.len(p56) do
		local _ = nil
		local var1362 = nil
		local var1363, var1364, var1365 = protoModule.readTag(p56, var1361)
		local var1366 = var1363
		var1362 = var1364
		var1361 = var1365
		
		if var1362 == protoModule.wireTypes.varint then
			local _ = nil
			local var1367, var1368 = protoModule.readVarInt(p56, var1361)
			local _ = var1367
			var1361 = var1368
			continue
		end
		if var1362 == protoModule.wireTypes.lengthDelimited then
			if var1366 == 1 then
				local _ = nil
				local var1369, var1370 = protoModule.readBuffer(p56, var1361)
				var1361 = var1370
				var1360.universe_id = buffer.tostring(var1369)
			else
				local _ = nil
				local var1371, var1372 = protoModule.readVarInt(p56, var1361)
				var1361 = var1372 + var1371
			end
		elseif var1362 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1373, var1374 = protoModule.readFixed32(p56, var1361)
			local _ = var1373
			var1361 = var1374
		elseif var1362 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1375, var1376 = protoModule.readFixed64(p56, var1361)
			local _ = var1375
			var1361 = var1376
		else
			error("Unsupported wire type: " .. var1362)
		end
	end
	return var1360
end

function t_29:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_29:jsonDecode()
	-- upvalues: t_29 (ref)
	local var1378 = t_29.new()
	
	if self.universe_id ~= nil then
		var1378.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1378.universe_id = self.universeId
	end
	return var1378
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p57)
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p57 == nil or p57.universe_id == nil then "" else p57.universe_id,
		user_owns_experience = if p57 == nil or p57.user_owns_experience == nil then false else p57.user_owns_experience
	}, t_30)
end

function t_30:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1380 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1381, var1382 = protoModule.writeTag(buff, var1380, 1, protoModule.wireTypes.lengthDelimited)
		var1381, var1382 = protoModule.writeString(var1381, var1382, self.universe_id)
		buff = var1381
		var1380 = var1382
	end
	if self.user_owns_experience then
		local var1383, var1384 = protoModule.writeTag(buff, var1380, 2, protoModule.wireTypes.varint)
		var1383, var1384 = protoModule.writeVarInt(var1383, var1384, if self.user_owns_experience then 1 else 0)
		buff = var1383
		var1380 = var1384
	end
	local buff_1 = buffer.create(var1380)
	buffer.copy(buff_1, 0, buff, 0, var1380)
	
	return buff_1
end

function t_30.decode(p58)
	-- upvalues: t_30 (ref), protoModule (ref)
	local var1386 = t_30.new()
	local var1387 = 0
	while var1387 < buffer.len(p58) do
		local _ = nil
		local var1388 = nil
		local var1389, var1390, var1391 = protoModule.readTag(p58, var1387)
		local var1392 = var1389
		var1388 = var1390
		var1387 = var1391
		
		if var1388 == protoModule.wireTypes.varint then
			if var1392 == 2 then
				local _ = nil
				local var1393, var1394 = protoModule.readVarInt(p58, var1387)
				var1387 = var1394
				var1386.user_owns_experience = var1393 ~= 0
			else
				local _ = nil
				local var1395, var1396 = protoModule.readVarInt(p58, var1387)
				local _ = var1395
				var1387 = var1396
			end
		end
		if var1388 == protoModule.wireTypes.lengthDelimited then
			if var1392 == 1 then
				local _ = nil
				local var1397, var1398 = protoModule.readBuffer(p58, var1387)
				var1387 = var1398
				var1386.universe_id = buffer.tostring(var1397)
			else
				local _ = nil
				local var1399, var1400 = protoModule.readVarInt(p58, var1387)
				var1387 = var1400 + var1399
			end
		elseif var1388 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1401, var1402 = protoModule.readFixed32(p58, var1387)
			local _ = var1401
			var1387 = var1402
		elseif var1388 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1403, var1404 = protoModule.readFixed64(p58, var1387)
			local _ = var1403
			var1387 = var1404
		else
			error("Unsupported wire type: " .. var1388)
		end
	end
	return var1386
end

function t_30:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_30:jsonDecode()
	-- upvalues: t_30 (ref)
	local var1406 = t_30.new()
	
	if self.universe_id ~= nil then
		var1406.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1406.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1406.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1406.user_owns_experience = self.userOwnsExperience
	end
	return var1406
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p59)
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p59 == nil or p59.universe_id == nil then "" else p59.universe_id,
		place_id = if p59 == nil or p59.place_id == nil then "" else p59.place_id
	}, t_31)
end

function t_31:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1408 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1409, var1410 = protoModule.writeTag(buff, var1408, 1, protoModule.wireTypes.lengthDelimited)
		var1409, var1410 = protoModule.writeString(var1409, var1410, self.universe_id)
		buff = var1409
		var1408 = var1410
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1411, var1412 = protoModule.writeTag(buff, var1408, 2, protoModule.wireTypes.lengthDelimited)
		var1411, var1412 = protoModule.writeString(var1411, var1412, self.place_id)
		buff = var1411
		var1408 = var1412
	end
	local buff_1 = buffer.create(var1408)
	buffer.copy(buff_1, 0, buff, 0, var1408)
	
	return buff_1
end

function t_31.decode(p60)
	-- upvalues: t_31 (ref), protoModule (ref)
	local var1414 = t_31.new()
	local var1415 = 0
	while var1415 < buffer.len(p60) do
		local _ = nil
		local var1416 = nil
		local var1417, var1418, var1419 = protoModule.readTag(p60, var1415)
		local var1420 = var1417
		var1416 = var1418
		var1415 = var1419
		
		if var1416 == protoModule.wireTypes.varint then
			local _ = nil
			local var1421, var1422 = protoModule.readVarInt(p60, var1415)
			local _ = var1421
			var1415 = var1422
			continue
		end
		if var1416 == protoModule.wireTypes.lengthDelimited then
			if var1420 == 1 then
				local _ = nil
				local var1423, var1424 = protoModule.readBuffer(p60, var1415)
				var1415 = var1424
				var1414.universe_id = buffer.tostring(var1423)
			elseif var1420 == 2 then
				local _ = nil
				local var1425, var1426 = protoModule.readBuffer(p60, var1415)
				var1415 = var1426
				var1414.place_id = buffer.tostring(var1425)
			else
				local _ = nil
				local var1427, var1428 = protoModule.readVarInt(p60, var1415)
				var1415 = var1428 + var1427
			end
		elseif var1416 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1429, var1430 = protoModule.readFixed32(p60, var1415)
			local _ = var1429
			var1415 = var1430
		elseif var1416 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1431, var1432 = protoModule.readFixed64(p60, var1415)
			local _ = var1431
			var1415 = var1432
		else
			error("Unsupported wire type: " .. var1416)
		end
	end
	return var1414
end

function t_31:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_31:jsonDecode()
	-- upvalues: t_31 (ref)
	local var1434 = t_31.new()
	
	if self.universe_id ~= nil then
		var1434.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1434.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1434.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1434.place_id = self.placeId
	end
	return var1434
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p61)
	-- upvalues: t_32 (ref)
	return setmetatable({
		community_id = if p61 == nil or p61.community_id == nil then "" else p61.community_id
	}, t_32)
end

function t_32:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1436 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var1437, var1438 = protoModule.writeTag(buff, var1436, 1, protoModule.wireTypes.lengthDelimited)
		var1437, var1438 = protoModule.writeString(var1437, var1438, self.community_id)
		buff = var1437
		var1436 = var1438
	end
	local buff_1 = buffer.create(var1436)
	buffer.copy(buff_1, 0, buff, 0, var1436)
	
	return buff_1
end

function t_32.decode(p62)
	-- upvalues: t_32 (ref), protoModule (ref)
	local var1440 = t_32.new()
	local var1441 = 0
	while var1441 < buffer.len(p62) do
		local _ = nil
		local var1442 = nil
		local var1443, var1444, var1445 = protoModule.readTag(p62, var1441)
		local var1446 = var1443
		var1442 = var1444
		var1441 = var1445
		
		if var1442 == protoModule.wireTypes.varint then
			local _ = nil
			local var1447, var1448 = protoModule.readVarInt(p62, var1441)
			local _ = var1447
			var1441 = var1448
			continue
		end
		if var1442 == protoModule.wireTypes.lengthDelimited then
			if var1446 == 1 then
				local _ = nil
				local var1449, var1450 = protoModule.readBuffer(p62, var1441)
				var1441 = var1450
				var1440.community_id = buffer.tostring(var1449)
			else
				local _ = nil
				local var1451, var1452 = protoModule.readVarInt(p62, var1441)
				var1441 = var1452 + var1451
			end
		elseif var1442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1453, var1454 = protoModule.readFixed32(p62, var1441)
			local _ = var1453
			var1441 = var1454
		elseif var1442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1455, var1456 = protoModule.readFixed64(p62, var1441)
			local _ = var1455
			var1441 = var1456
		else
			error("Unsupported wire type: " .. var1442)
		end
	end
	return var1440
end

function t_32:jsonEncode()
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_32:jsonDecode()
	-- upvalues: t_32 (ref)
	local var1458 = t_32.new()
	
	if self.community_id ~= nil then
		var1458.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var1458.community_id = self.communityId
	end
	return var1458
end

t_32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_32
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p63)
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_items = if p63 == nil or p63.social_link_items == nil then {} else p63.social_link_items
	}, t_33)
end

function t_33:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1460 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var1461 = v:encode()
			local var1462, var1463 = protoModule.writeTag(buff, var1460, 1, protoModule.wireTypes.lengthDelimited)
			var1462, var1463 = protoModule.writeBuffer(var1462, var1463, var1461, buffer.len(var1461))
			buff = var1462
			var1460 = var1463
		end
	end
	local buff_1 = buffer.create(var1460)
	buffer.copy(buff_1, 0, buff, 0, var1460)
	
	return buff_1
end

function t_33.decode(p64)
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1465 = t_33.new()
	local var1466 = 0
	while var1466 < buffer.len(p64) do
		local _ = nil
		local var1467 = nil
		local var1468, var1469, var1470 = protoModule.readTag(p64, var1466)
		local var1471 = var1468
		var1467 = var1469
		var1466 = var1470
		
		if var1467 == protoModule.wireTypes.varint then
			local _ = nil
			local var1472, var1473 = protoModule.readVarInt(p64, var1466)
			local _ = var1472
			var1466 = var1473
			continue
		end
		if var1467 == protoModule.wireTypes.lengthDelimited then
			if var1471 == 1 then
				local _ = nil
				local var1474, var1475 = protoModule.readBuffer(p64, var1466)
				var1466 = var1475
				table.insert(var1465.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var1474))
			else
				local _ = nil
				local var1476, var1477 = protoModule.readVarInt(p64, var1466)
				var1466 = var1477 + var1476
			end
		elseif var1467 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1478, var1479 = protoModule.readFixed32(p64, var1466)
			local _ = var1478
			var1466 = var1479
		elseif var1467 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1480, var1481 = protoModule.readFixed64(p64, var1466)
			local _ = var1480
			var1466 = var1481
		else
			error("Unsupported wire type: " .. var1467)
		end
	end
	return var1465
end

function t_33:jsonEncode()
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

function t_33:jsonDecode()
	-- upvalues: t_33 (ref), t (ref)
	local var1484 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1484.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1484.social_link_items = t_1
	end
	return var1484
end

t_33.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p65)
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_id = if p65 == nil or p65.social_link_id == nil then "" else p65.social_link_id
	}, t_34)
end

function t_34:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1488 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var1489, var1490 = protoModule.writeTag(buff, var1488, 1, protoModule.wireTypes.lengthDelimited)
		var1489, var1490 = protoModule.writeString(var1489, var1490, self.social_link_id)
		buff = var1489
		var1488 = var1490
	end
	local buff_1 = buffer.create(var1488)
	buffer.copy(buff_1, 0, buff, 0, var1488)
	
	return buff_1
end

function t_34.decode(p66)
	-- upvalues: t_34 (ref), protoModule (ref)
	local var1492 = t_34.new()
	local var1493 = 0
	while var1493 < buffer.len(p66) do
		local _ = nil
		local var1494 = nil
		local var1495, var1496, var1497 = protoModule.readTag(p66, var1493)
		local var1498 = var1495
		var1494 = var1496
		var1493 = var1497
		
		if var1494 == protoModule.wireTypes.varint then
			local _ = nil
			local var1499, var1500 = protoModule.readVarInt(p66, var1493)
			local _ = var1499
			var1493 = var1500
			continue
		end
		if var1494 == protoModule.wireTypes.lengthDelimited then
			if var1498 == 1 then
				local _ = nil
				local var1501, var1502 = protoModule.readBuffer(p66, var1493)
				var1493 = var1502
				var1492.social_link_id = buffer.tostring(var1501)
			else
				local _ = nil
				local var1503, var1504 = protoModule.readVarInt(p66, var1493)
				var1493 = var1504 + var1503
			end
		elseif var1494 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1505, var1506 = protoModule.readFixed32(p66, var1493)
			local _ = var1505
			var1493 = var1506
		elseif var1494 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1507, var1508 = protoModule.readFixed64(p66, var1493)
			local _ = var1507
			var1493 = var1508
		else
			error("Unsupported wire type: " .. var1494)
		end
	end
	return var1492
end

function t_34:jsonEncode()
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_34:jsonDecode()
	-- upvalues: t_34 (ref)
	local var1510 = t_34.new()
	
	if self.social_link_id ~= nil then
		var1510.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1510.social_link_id = self.socialLinkId
	end
	return var1510
end

t_34.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p67)
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
		tile_activation_mode = if p67 == nil or p67.tile_activation_mode == nil then "" else p67.tile_activation_mode,
		sponsored_user_cohort = if p67 == nil or p67.sponsored_user_cohort == nil then nil else p67.sponsored_user_cohort
	}, t_35)
end

function t_35:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1512 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1513, var1514 = protoModule.writeTag(buff, var1512, 1, protoModule.wireTypes.lengthDelimited)
		var1513, var1514 = protoModule.writeString(var1513, var1514, self.title)
		buff = var1513
		var1512 = var1514
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var1515 = v:encode()
			local var1516, var1517 = protoModule.writeTag(buff, var1512, 2, protoModule.wireTypes.lengthDelimited)
			var1516, var1517 = protoModule.writeBuffer(var1516, var1517, var1515, buffer.len(var1515))
			buff = var1516
			var1512 = var1517
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1518, var1519 = protoModule.writeTag(buff, var1512, 3, protoModule.wireTypes.lengthDelimited)
		var1518, var1519 = protoModule.writeString(var1518, var1519, self.next_page_token)
		buff = var1518
		var1512 = var1519
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1520, var1521 = protoModule.writeTag(buff, var1512, 4, protoModule.wireTypes.lengthDelimited)
		var1520, var1521 = protoModule.writeString(var1520, var1521, self.sort_id)
		buff = var1520
		var1512 = var1521
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1522, var1523 = protoModule.writeTag(buff, var1512, 5, protoModule.wireTypes.varint)
		var1522, var1523 = protoModule.writeVarInt(var1522, var1523, self.secondary_sort_id)
		buff = var1522
		var1512 = var1523
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var1524, var1525 = protoModule.writeTag(buff, var1512, 6, protoModule.wireTypes.varint)
		var1524, var1525 = protoModule.writeVarInt(var1524, var1525, self.max_visible_rows)
		buff = var1524
		var1512 = var1525
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1526, var1527 = protoModule.writeTag(buff, var1512, 7, protoModule.wireTypes.lengthDelimited)
		var1526, var1527 = protoModule.writeString(var1526, var1527, self.subtitle)
		buff = var1526
		var1512 = var1527
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1528, var1529 = protoModule.writeTag(buff, var1512, 8, protoModule.wireTypes.lengthDelimited)
		var1528, var1529 = protoModule.writeString(var1528, var1529, self.info_text)
		buff = var1528
		var1512 = var1529
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1530, var1531 = protoModule.writeTag(buff, var1512, 9, protoModule.wireTypes.lengthDelimited)
		var1530, var1531 = protoModule.writeString(var1530, var1531, self.subtitle_link_path)
		buff = var1530
		var1512 = var1531
	end
	if self.is_placeholder ~= nil then
		local var1532, var1533 = protoModule.writeTag(buff, var1512, 10, protoModule.wireTypes.varint)
		var1532, var1533 = protoModule.writeVarInt(var1532, var1533, if self.is_placeholder then 1 else 0)
		buff = var1532
		var1512 = var1533
	end
	if self.primary_sort_id ~= nil then
		local var1534, var1535 = protoModule.writeTag(buff, var1512, 11, protoModule.wireTypes.varint)
		var1534, var1535 = protoModule.writeVarInt(var1534, var1535, self.primary_sort_id)
		buff = var1534
		var1512 = var1535
	end
	if self.applied_filters ~= nil then
		local var1536, var1537 = protoModule.writeTag(buff, var1512, 12, protoModule.wireTypes.lengthDelimited)
		var1536, var1537 = protoModule.writeString(var1536, var1537, self.applied_filters)
		buff = var1536
		var1512 = var1537
	end
	if self.pool_id ~= nil then
		local var1538, var1539 = protoModule.writeTag(buff, var1512, 13, protoModule.wireTypes.lengthDelimited)
		var1538, var1539 = protoModule.writeString(var1538, var1539, self.pool_id)
		buff = var1538
		var1512 = var1539
	end
	if self.has_emphasized_tile then
		local var1540, var1541 = protoModule.writeTag(buff, var1512, 14, protoModule.wireTypes.varint)
		var1540, var1541 = protoModule.writeVarInt(var1540, var1541, if self.has_emphasized_tile then 1 else 0)
		buff = var1540
		var1512 = var1541
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var1542, var1543 = protoModule.writeTag(buff, var1512, 15, protoModule.wireTypes.lengthDelimited)
		var1542, var1543 = protoModule.writeString(var1542, var1543, self.tile_activation_mode)
		buff = var1542
		var1512 = var1543
	end
	if self.sponsored_user_cohort ~= nil then
		local var1544, var1545 = protoModule.writeTag(buff, var1512, 18, protoModule.wireTypes.lengthDelimited)
		var1544, var1545 = protoModule.writeString(var1544, var1545, self.sponsored_user_cohort)
		buff = var1544
		var1512 = var1545
	end
	local buff_1 = buffer.create(var1512)
	buffer.copy(buff_1, 0, buff, 0, var1512)
	
	return buff_1
end

function t_35.decode(p68)
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var1547 = t_35.new()
	local var1548 = 0
	while var1548 < buffer.len(p68) do
		local _ = nil
		local var1549 = nil
		local var1550, var1551, var1552 = protoModule.readTag(p68, var1548)
		local var1553 = var1550
		var1549 = var1551
		var1548 = var1552
		
		if var1549 == protoModule.wireTypes.varint then
			if var1553 == 5 then
				local _ = nil
				local var1554, var1555 = protoModule.readVarIntI32(p68, var1548)
				var1548 = var1555
				var1547.secondary_sort_id = var1554
			elseif var1553 == 6 then
				local _ = nil
				local var1556, var1557 = protoModule.readVarIntI32(p68, var1548)
				var1548 = var1557
				var1547.max_visible_rows = var1556
			elseif var1553 == 10 then
				local _ = nil
				local var1558, var1559 = protoModule.readVarInt(p68, var1548)
				var1548 = var1559
				var1547.is_placeholder = var1558 ~= 0
			elseif var1553 == 11 then
				local _ = nil
				local var1560, var1561 = protoModule.readVarIntI32(p68, var1548)
				var1548 = var1561
				var1547.primary_sort_id = var1560
			elseif var1553 == 14 then
				local _ = nil
				local var1562, var1563 = protoModule.readVarInt(p68, var1548)
				var1548 = var1563
				var1547.has_emphasized_tile = var1562 ~= 0
			else
				local _ = nil
				local var1564, var1565 = protoModule.readVarInt(p68, var1548)
				local _ = var1564
				var1548 = var1565
			end
		end
		if var1549 == protoModule.wireTypes.lengthDelimited then
			if var1553 == 1 then
				local _ = nil
				local var1566, var1567 = protoModule.readBuffer(p68, var1548)
				var1548 = var1567
				var1547.title = buffer.tostring(var1566)
			elseif var1553 == 2 then
				local _ = nil
				local var1568, var1569 = protoModule.readBuffer(p68, var1548)
				var1548 = var1569
				table.insert(var1547.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var1568))
			elseif var1553 == 3 then
				local _ = nil
				local var1570, var1571 = protoModule.readBuffer(p68, var1548)
				var1548 = var1571
				var1547.next_page_token = buffer.tostring(var1570)
			elseif var1553 == 4 then
				local _ = nil
				local var1572, var1573 = protoModule.readBuffer(p68, var1548)
				var1548 = var1573
				var1547.sort_id = buffer.tostring(var1572)
			elseif var1553 == 7 then
				local _ = nil
				local var1574, var1575 = protoModule.readBuffer(p68, var1548)
				var1548 = var1575
				var1547.subtitle = buffer.tostring(var1574)
			elseif var1553 == 8 then
				local _ = nil
				local var1576, var1577 = protoModule.readBuffer(p68, var1548)
				var1548 = var1577
				var1547.info_text = buffer.tostring(var1576)
			elseif var1553 == 9 then
				local _ = nil
				local var1578, var1579 = protoModule.readBuffer(p68, var1548)
				var1548 = var1579
				var1547.subtitle_link_path = buffer.tostring(var1578)
			elseif var1553 == 12 then
				local _ = nil
				local var1580, var1581 = protoModule.readBuffer(p68, var1548)
				var1548 = var1581
				var1547.applied_filters = buffer.tostring(var1580)
			elseif var1553 == 13 then
				local _ = nil
				local var1582, var1583 = protoModule.readBuffer(p68, var1548)
				var1548 = var1583
				var1547.pool_id = buffer.tostring(var1582)
			elseif var1553 == 15 then
				local _ = nil
				local var1584, var1585 = protoModule.readBuffer(p68, var1548)
				var1548 = var1585
				var1547.tile_activation_mode = buffer.tostring(var1584)
			elseif var1553 == 18 then
				local _ = nil
				local var1586, var1587 = protoModule.readBuffer(p68, var1548)
				var1548 = var1587
				var1547.sponsored_user_cohort = buffer.tostring(var1586)
			else
				local _ = nil
				local var1588, var1589 = protoModule.readVarInt(p68, var1548)
				var1548 = var1589 + var1588
			end
		elseif var1549 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1590, var1591 = protoModule.readFixed32(p68, var1548)
			local _ = var1590
			var1548 = var1591
		elseif var1549 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1592, var1593 = protoModule.readFixed64(p68, var1548)
			local _ = var1592
			var1548 = var1593
		else
			error("Unsupported wire type: " .. var1549)
		end
	end
	return var1547
end

function t_35:jsonEncode()
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
	if self.sponsored_user_cohort ~= nil then
		t.sponsoredUserCohort = self.sponsored_user_cohort
	end
	return t
end

function t_35:jsonDecode()
	-- upvalues: t_35 (ref), t (ref)
	local var1596 = t_35.new()
	
	if self.title ~= nil then
		var1596.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1596.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1596.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1596.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1596.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1596.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1596.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1596.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1596.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1596.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1596.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1596.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1596.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1596.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1596.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1596.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1596.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1596.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1596.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1596.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1596.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1596.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1596.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1596.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1596.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1596.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1596.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1596.tile_activation_mode = self.tileActivationMode
	end
	if self.sponsored_user_cohort ~= nil then
		var1596.sponsored_user_cohort = self.sponsored_user_cohort
	end
	if self.sponsoredUserCohort ~= nil then
		var1596.sponsored_user_cohort = self.sponsoredUserCohort
	end
	return var1596
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p69)
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
		rank = if p69 == nil or p69.rank == nil then nil else p69.rank,
		payer_name = if p69 == nil or p69.payer_name == nil then nil else p69.payer_name,
		logo_asset_id = if p69 == nil or p69.logo_asset_id == nil then nil else p69.logo_asset_id,
		logo_aspect_ratio = if p69 == nil or p69.logo_aspect_ratio == nil then nil else p69.logo_aspect_ratio,
		place_id = if p69 == nil or p69.place_id == nil then nil else p69.place_id,
		launch_data = if p69 == nil or p69.launch_data == nil then nil else p69.launch_data,
		cta_text = if p69 == nil or p69.cta_text == nil then nil else p69.cta_text,
		badge_analytics_id = if p69 == nil or p69.badge_analytics_id == nil then nil else p69.badge_analytics_id
	}, t_36)
end

function t_36:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1600 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1601, var1602 = protoModule.writeTag(buff, var1600, 1, protoModule.wireTypes.lengthDelimited)
		var1601, var1602 = protoModule.writeString(var1601, var1602, self.universe_id)
		buff = var1601
		var1600 = var1602
	end
	if self.is_sponsored then
		local var1603, var1604 = protoModule.writeTag(buff, var1600, 2, protoModule.wireTypes.varint)
		var1603, var1604 = protoModule.writeVarInt(var1603, var1604, if self.is_sponsored then 1 else 0)
		buff = var1603
		var1600 = var1604
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1605, var1606 = protoModule.writeTag(buff, var1600, 3, protoModule.wireTypes.lengthDelimited)
		var1605, var1606 = protoModule.writeString(var1605, var1606, self.roblox_component)
		buff = var1605
		var1600 = var1606
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1607, var1608 = protoModule.writeTag(buff, var1600, 4, protoModule.wireTypes.lengthDelimited)
		var1607, var1608 = protoModule.writeString(var1607, var1608, self.native_ad_data)
		buff = var1607
		var1600 = var1608
	end
	if self.is_content_locked then
		local var1609, var1610 = protoModule.writeTag(buff, var1600, 5, protoModule.wireTypes.varint)
		var1609, var1610 = protoModule.writeVarInt(var1609, var1610, if self.is_content_locked then 1 else 0)
		buff = var1609
		var1600 = var1610
	end
	if self.title ~= nil and self.title ~= "" then
		local var1611, var1612 = protoModule.writeTag(buff, var1600, 6, protoModule.wireTypes.lengthDelimited)
		var1611, var1612 = protoModule.writeString(var1611, var1612, self.title)
		buff = var1611
		var1600 = var1612
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1613, var1614 = protoModule.writeTag(buff, var1600, 7, protoModule.wireTypes.lengthDelimited)
		var1613, var1614 = protoModule.writeString(var1613, var1614, self.subtitle)
		buff = var1613
		var1600 = var1614
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1615, var1616 = protoModule.writeTag(buff, var1600, 8, protoModule.wireTypes.lengthDelimited)
		var1615, var1616 = protoModule.writeString(var1615, var1616, self.image_asset_id)
		buff = var1615
		var1600 = var1616
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1617, var1618 = protoModule.writeTag(buff, var1600, 9, protoModule.wireTypes.lengthDelimited)
		var1617, var1618 = protoModule.writeString(var1617, var1618, self.video_asset_id)
		buff = var1617
		var1600 = var1618
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1619, var1620 = protoModule.writeTag(buff, var1600, 10, protoModule.wireTypes.lengthDelimited)
		var1619, var1620 = protoModule.writeString(var1619, var1620, self.badge_text)
		buff = var1619
		var1600 = var1620
	end
	if self.player_count ~= nil then
		local var1621, var1622 = protoModule.writeTag(buff, var1600, 11, protoModule.wireTypes.varint)
		var1621, var1622 = protoModule.writeVarInt(var1621, var1622, self.player_count)
		buff = var1621
		var1600 = var1622
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1623, var1624 = protoModule.writeTag(buff, var1600, 12, protoModule.wireTypes.lengthDelimited)
		var1623, var1624 = protoModule.writeString(var1623, var1624, self.creator_key)
		buff = var1623
		var1600 = var1624
	end
	if self.rank ~= nil then
		local var1625, var1626 = protoModule.writeTag(buff, var1600, 13, protoModule.wireTypes.varint)
		var1625, var1626 = protoModule.writeVarInt(var1625, var1626, self.rank)
		buff = var1625
		var1600 = var1626
	end
	if self.payer_name ~= nil then
		local var1627, var1628 = protoModule.writeTag(buff, var1600, 14, protoModule.wireTypes.lengthDelimited)
		var1627, var1628 = protoModule.writeString(var1627, var1628, self.payer_name)
		buff = var1627
		var1600 = var1628
	end
	if self.logo_asset_id ~= nil then
		local var1629, var1630 = protoModule.writeTag(buff, var1600, 15, protoModule.wireTypes.lengthDelimited)
		var1629, var1630 = protoModule.writeString(var1629, var1630, self.logo_asset_id)
		buff = var1629
		var1600 = var1630
	end
	if self.logo_aspect_ratio ~= nil then
		local var1631, var1632 = protoModule.writeTag(buff, var1600, 16, protoModule.wireTypes.i64)
		var1631, var1632 = protoModule.writeDouble(var1631, var1632, self.logo_aspect_ratio)
		buff = var1631
		var1600 = var1632
	end
	if self.place_id ~= nil then
		local var1633, var1634 = protoModule.writeTag(buff, var1600, 17, protoModule.wireTypes.lengthDelimited)
		var1633, var1634 = protoModule.writeString(var1633, var1634, self.place_id)
		buff = var1633
		var1600 = var1634
	end
	if self.launch_data ~= nil then
		local var1635, var1636 = protoModule.writeTag(buff, var1600, 18, protoModule.wireTypes.lengthDelimited)
		var1635, var1636 = protoModule.writeString(var1635, var1636, self.launch_data)
		buff = var1635
		var1600 = var1636
	end
	if self.cta_text ~= nil then
		local var1637, var1638 = protoModule.writeTag(buff, var1600, 20, protoModule.wireTypes.lengthDelimited)
		var1637, var1638 = protoModule.writeString(var1637, var1638, self.cta_text)
		buff = var1637
		var1600 = var1638
	end
	if self.badge_analytics_id ~= nil then
		local var1639, var1640 = protoModule.writeTag(buff, var1600, 21, protoModule.wireTypes.lengthDelimited)
		var1639, var1640 = protoModule.writeString(var1639, var1640, self.badge_analytics_id)
		buff = var1639
		var1600 = var1640
	end
	local buff_1 = buffer.create(var1600)
	buffer.copy(buff_1, 0, buff, 0, var1600)
	
	return buff_1
end

function t_36.decode(p70)
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1642 = t_36.new()
	local var1643 = 0
	while var1643 < buffer.len(p70) do
		local _ = nil
		local var1644 = nil
		local var1645, var1646, var1647 = protoModule.readTag(p70, var1643)
		local var1648 = var1645
		var1644 = var1646
		var1643 = var1647
		
		if var1644 == protoModule.wireTypes.varint then
			if var1648 == 2 then
				local _ = nil
				local var1649, var1650 = protoModule.readVarInt(p70, var1643)
				var1643 = var1650
				var1642.is_sponsored = var1649 ~= 0
			elseif var1648 == 5 then
				local _ = nil
				local var1651, var1652 = protoModule.readVarInt(p70, var1643)
				var1643 = var1652
				var1642.is_content_locked = var1651 ~= 0
			elseif var1648 == 11 then
				local _ = nil
				local var1653, var1654 = protoModule.readVarIntI64(p70, var1643)
				var1643 = var1654
				var1642.player_count = var1653
			elseif var1648 == 13 then
				local _ = nil
				local var1655, var1656 = protoModule.readVarIntI32(p70, var1643)
				var1643 = var1656
				var1642.rank = var1655
			else
				local _ = nil
				local var1657, var1658 = protoModule.readVarInt(p70, var1643)
				local _ = var1657
				var1643 = var1658
			end
		end
		if var1644 == protoModule.wireTypes.lengthDelimited then
			if var1648 == 1 then
				local _ = nil
				local var1659, var1660 = protoModule.readBuffer(p70, var1643)
				var1643 = var1660
				var1642.universe_id = buffer.tostring(var1659)
			elseif var1648 == 3 then
				local _ = nil
				local var1661, var1662 = protoModule.readBuffer(p70, var1643)
				var1643 = var1662
				var1642.roblox_component = buffer.tostring(var1661)
			elseif var1648 == 4 then
				local _ = nil
				local var1663, var1664 = protoModule.readBuffer(p70, var1643)
				var1643 = var1664
				var1642.native_ad_data = buffer.tostring(var1663)
			elseif var1648 == 6 then
				local _ = nil
				local var1665, var1666 = protoModule.readBuffer(p70, var1643)
				var1643 = var1666
				var1642.title = buffer.tostring(var1665)
			elseif var1648 == 7 then
				local _ = nil
				local var1667, var1668 = protoModule.readBuffer(p70, var1643)
				var1643 = var1668
				var1642.subtitle = buffer.tostring(var1667)
			elseif var1648 == 8 then
				local _ = nil
				local var1669, var1670 = protoModule.readBuffer(p70, var1643)
				var1643 = var1670
				var1642.image_asset_id = buffer.tostring(var1669)
			elseif var1648 == 9 then
				local _ = nil
				local var1671, var1672 = protoModule.readBuffer(p70, var1643)
				var1643 = var1672
				var1642.video_asset_id = buffer.tostring(var1671)
			elseif var1648 == 10 then
				local _ = nil
				local var1673, var1674 = protoModule.readBuffer(p70, var1643)
				var1643 = var1674
				var1642.badge_text = buffer.tostring(var1673)
			elseif var1648 == 12 then
				local _ = nil
				local var1675, var1676 = protoModule.readBuffer(p70, var1643)
				var1643 = var1676
				var1642.creator_key = buffer.tostring(var1675)
			elseif var1648 == 14 then
				local _ = nil
				local var1677, var1678 = protoModule.readBuffer(p70, var1643)
				var1643 = var1678
				var1642.payer_name = buffer.tostring(var1677)
			elseif var1648 == 15 then
				local _ = nil
				local var1679, var1680 = protoModule.readBuffer(p70, var1643)
				var1643 = var1680
				var1642.logo_asset_id = buffer.tostring(var1679)
			elseif var1648 == 17 then
				local _ = nil
				local var1681, var1682 = protoModule.readBuffer(p70, var1643)
				var1643 = var1682
				var1642.place_id = buffer.tostring(var1681)
			elseif var1648 == 18 then
				local _ = nil
				local var1683, var1684 = protoModule.readBuffer(p70, var1643)
				var1643 = var1684
				var1642.launch_data = buffer.tostring(var1683)
			elseif var1648 == 20 then
				local _ = nil
				local var1685, var1686 = protoModule.readBuffer(p70, var1643)
				var1643 = var1686
				var1642.cta_text = buffer.tostring(var1685)
			elseif var1648 == 21 then
				local _ = nil
				local var1687, var1688 = protoModule.readBuffer(p70, var1643)
				var1643 = var1688
				var1642.badge_analytics_id = buffer.tostring(var1687)
			else
				local _ = nil
				local var1689, var1690 = protoModule.readVarInt(p70, var1643)
				var1643 = var1690 + var1689
			end
		elseif var1644 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1691, var1692 = protoModule.readFixed32(p70, var1643)
			local _ = var1691
			var1643 = var1692
		elseif var1644 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var1644)
		elseif var1648 == 16 then
			local _ = nil
			local var1693, var1694 = protoModule.readDouble(p70, var1643)
			var1643 = var1694
			var1642.logo_aspect_ratio = var1693
		else
			local _ = nil
			local var1695, var1696 = protoModule.readFixed64(p70, var1643)
			local _ = var1695
			var1643 = var1696
		end
	end
	return var1642
end

function t_36:jsonEncode()
	-- upvalues: protoModule (ref)
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
	if self.payer_name ~= nil then
		t.payerName = self.payer_name
	end
	if self.logo_asset_id ~= nil then
		t.logoAssetId = self.logo_asset_id
	end
	if self.logo_aspect_ratio ~= nil then
		t.logoAspectRatio = protoModule.json.serializeNumber(self.logo_aspect_ratio)
	end
	if self.place_id ~= nil then
		t.placeId = self.place_id
	end
	if self.launch_data ~= nil then
		t.launchData = self.launch_data
	end
	if self.cta_text ~= nil then
		t.ctaText = self.cta_text
	end
	if self.badge_analytics_id ~= nil then
		t.badgeAnalyticsId = self.badge_analytics_id
	end
	return t
end

function t_36:jsonDecode()
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1698 = t_36.new()
	
	if self.universe_id ~= nil then
		var1698.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1698.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1698.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1698.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1698.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1698.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1698.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1698.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1698.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1698.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1698.title = self.title
	end
	if self.subtitle ~= nil then
		var1698.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1698.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1698.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1698.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1698.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1698.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1698.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1698.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1698.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1698.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1698.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1698.rank = self.rank
	end
	if self.payer_name ~= nil then
		var1698.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var1698.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var1698.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var1698.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var1698.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var1698.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.place_id ~= nil then
		var1698.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1698.place_id = self.placeId
	end
	if self.launch_data ~= nil then
		var1698.launch_data = self.launch_data
	end
	if self.launchData ~= nil then
		var1698.launch_data = self.launchData
	end
	if self.cta_text ~= nil then
		var1698.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var1698.cta_text = self.ctaText
	end
	if self.badge_analytics_id ~= nil then
		var1698.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var1698.badge_analytics_id = self.badgeAnalyticsId
	end
	return var1698
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p71)
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

function t_37:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1700 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1701, var1702 = protoModule.writeTag(buff, var1700, 1, protoModule.wireTypes.lengthDelimited)
		var1701, var1702 = protoModule.writeString(var1701, var1702, self.title)
		buff = var1701
		var1700 = var1702
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1703 = v:encode()
			local var1704, var1705 = protoModule.writeTag(buff, var1700, 2, protoModule.wireTypes.lengthDelimited)
			var1704, var1705 = protoModule.writeBuffer(var1704, var1705, var1703, buffer.len(var1703))
			buff = var1704
			var1700 = var1705
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1706, var1707 = protoModule.writeTag(buff, var1700, 3, protoModule.wireTypes.lengthDelimited)
		var1706, var1707 = protoModule.writeString(var1706, var1707, self.next_page_token)
		buff = var1706
		var1700 = var1707
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1708, var1709 = protoModule.writeTag(buff, var1700, 4, protoModule.wireTypes.lengthDelimited)
		var1708, var1709 = protoModule.writeString(var1708, var1709, self.sort_id)
		buff = var1708
		var1700 = var1709
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1710, var1711 = protoModule.writeTag(buff, var1700, 5, protoModule.wireTypes.varint)
		var1710, var1711 = protoModule.writeVarInt(var1710, var1711, self.secondary_sort_id)
		buff = var1710
		var1700 = var1711
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1712, var1713 = protoModule.writeTag(buff, var1700, 6, protoModule.wireTypes.lengthDelimited)
		var1712, var1713 = protoModule.writeString(var1712, var1713, self.subtitle)
		buff = var1712
		var1700 = var1713
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1714, var1715 = protoModule.writeTag(buff, var1700, 7, protoModule.wireTypes.lengthDelimited)
		var1714, var1715 = protoModule.writeString(var1714, var1715, self.info_text)
		buff = var1714
		var1700 = var1715
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1716, var1717 = protoModule.writeTag(buff, var1700, 8, protoModule.wireTypes.lengthDelimited)
		var1716, var1717 = protoModule.writeString(var1716, var1717, self.subtitle_link_path)
		buff = var1716
		var1700 = var1717
	end
	if self.is_placeholder ~= nil then
		local var1718, var1719 = protoModule.writeTag(buff, var1700, 9, protoModule.wireTypes.varint)
		var1718, var1719 = protoModule.writeVarInt(var1718, var1719, if self.is_placeholder then 1 else 0)
		buff = var1718
		var1700 = var1719
	end
	if self.primary_sort_id ~= nil then
		local var1720, var1721 = protoModule.writeTag(buff, var1700, 10, protoModule.wireTypes.varint)
		var1720, var1721 = protoModule.writeVarInt(var1720, var1721, self.primary_sort_id)
		buff = var1720
		var1700 = var1721
	end
	if self.applied_filters ~= nil then
		local var1722, var1723 = protoModule.writeTag(buff, var1700, 11, protoModule.wireTypes.lengthDelimited)
		var1722, var1723 = protoModule.writeString(var1722, var1723, self.applied_filters)
		buff = var1722
		var1700 = var1723
	end
	local buff_1 = buffer.create(var1700)
	buffer.copy(buff_1, 0, buff, 0, var1700)
	
	return buff_1
end

function t_37.decode(p72)
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1725 = t_37.new()
	local var1726 = 0
	while var1726 < buffer.len(p72) do
		local _ = nil
		local var1727 = nil
		local var1728, var1729, var1730 = protoModule.readTag(p72, var1726)
		local var1731 = var1728
		var1727 = var1729
		var1726 = var1730
		
		if var1727 == protoModule.wireTypes.varint then
			if var1731 == 5 then
				local _ = nil
				local var1732, var1733 = protoModule.readVarIntI32(p72, var1726)
				var1726 = var1733
				var1725.secondary_sort_id = var1732
			elseif var1731 == 9 then
				local _ = nil
				local var1734, var1735 = protoModule.readVarInt(p72, var1726)
				var1726 = var1735
				var1725.is_placeholder = var1734 ~= 0
			elseif var1731 == 10 then
				local _ = nil
				local var1736, var1737 = protoModule.readVarIntI32(p72, var1726)
				var1726 = var1737
				var1725.primary_sort_id = var1736
			else
				local _ = nil
				local var1738, var1739 = protoModule.readVarInt(p72, var1726)
				local _ = var1738
				var1726 = var1739
			end
		end
		if var1727 == protoModule.wireTypes.lengthDelimited then
			if var1731 == 1 then
				local _ = nil
				local var1740, var1741 = protoModule.readBuffer(p72, var1726)
				var1726 = var1741
				var1725.title = buffer.tostring(var1740)
			elseif var1731 == 2 then
				local _ = nil
				local var1742, var1743 = protoModule.readBuffer(p72, var1726)
				var1726 = var1743
				table.insert(var1725.song_items, t.SongCarouselInputData_SongItem.decode(var1742))
			elseif var1731 == 3 then
				local _ = nil
				local var1744, var1745 = protoModule.readBuffer(p72, var1726)
				var1726 = var1745
				var1725.next_page_token = buffer.tostring(var1744)
			elseif var1731 == 4 then
				local _ = nil
				local var1746, var1747 = protoModule.readBuffer(p72, var1726)
				var1726 = var1747
				var1725.sort_id = buffer.tostring(var1746)
			elseif var1731 == 6 then
				local _ = nil
				local var1748, var1749 = protoModule.readBuffer(p72, var1726)
				var1726 = var1749
				var1725.subtitle = buffer.tostring(var1748)
			elseif var1731 == 7 then
				local _ = nil
				local var1750, var1751 = protoModule.readBuffer(p72, var1726)
				var1726 = var1751
				var1725.info_text = buffer.tostring(var1750)
			elseif var1731 == 8 then
				local _ = nil
				local var1752, var1753 = protoModule.readBuffer(p72, var1726)
				var1726 = var1753
				var1725.subtitle_link_path = buffer.tostring(var1752)
			elseif var1731 == 11 then
				local _ = nil
				local var1754, var1755 = protoModule.readBuffer(p72, var1726)
				var1726 = var1755
				var1725.applied_filters = buffer.tostring(var1754)
			else
				local _ = nil
				local var1756, var1757 = protoModule.readVarInt(p72, var1726)
				var1726 = var1757 + var1756
			end
		elseif var1727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1758, var1759 = protoModule.readFixed32(p72, var1726)
			local _ = var1758
			var1726 = var1759
		elseif var1727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1760, var1761 = protoModule.readFixed64(p72, var1726)
			local _ = var1760
			var1726 = var1761
		else
			error("Unsupported wire type: " .. var1727)
		end
	end
	return var1725
end

function t_37:jsonEncode()
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

function t_37:jsonDecode()
	-- upvalues: t_37 (ref), t (ref)
	local var1764 = t_37.new()
	
	if self.title ~= nil then
		var1764.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1764.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1764.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1764.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1764.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1764.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1764.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1764.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1764.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1764.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1764.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1764.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1764.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1764.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1764.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1764.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1764.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1764.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1764.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1764.applied_filters = self.appliedFilters
	end
	return var1764
end

t_37.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_37
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p73)
	-- upvalues: t_38 (ref)
	return setmetatable({
		song_id = if p73 == nil or p73.song_id == nil then "" else p73.song_id
	}, t_38)
end

function t_38:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1768 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1769, var1770 = protoModule.writeTag(buff, var1768, 1, protoModule.wireTypes.lengthDelimited)
		var1769, var1770 = protoModule.writeString(var1769, var1770, self.song_id)
		buff = var1769
		var1768 = var1770
	end
	local buff_1 = buffer.create(var1768)
	buffer.copy(buff_1, 0, buff, 0, var1768)
	
	return buff_1
end

function t_38.decode(p74)
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1772 = t_38.new()
	local var1773 = 0
	while var1773 < buffer.len(p74) do
		local _ = nil
		local var1774 = nil
		local var1775, var1776, var1777 = protoModule.readTag(p74, var1773)
		local var1778 = var1775
		var1774 = var1776
		var1773 = var1777
		
		if var1774 == protoModule.wireTypes.varint then
			local _ = nil
			local var1779, var1780 = protoModule.readVarInt(p74, var1773)
			local _ = var1779
			var1773 = var1780
			continue
		end
		if var1774 == protoModule.wireTypes.lengthDelimited then
			if var1778 == 1 then
				local _ = nil
				local var1781, var1782 = protoModule.readBuffer(p74, var1773)
				var1773 = var1782
				var1772.song_id = buffer.tostring(var1781)
			else
				local _ = nil
				local var1783, var1784 = protoModule.readVarInt(p74, var1773)
				var1773 = var1784 + var1783
			end
		elseif var1774 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1785, var1786 = protoModule.readFixed32(p74, var1773)
			local _ = var1785
			var1773 = var1786
		elseif var1774 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1787, var1788 = protoModule.readFixed64(p74, var1773)
			local _ = var1787
			var1773 = var1788
		else
			error("Unsupported wire type: " .. var1774)
		end
	end
	return var1772
end

function t_38:jsonEncode()
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_38:jsonDecode()
	-- upvalues: t_38 (ref)
	local var1790 = t_38.new()
	
	if self.song_id ~= nil then
		var1790.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1790.song_id = self.songId
	end
	return var1790
end

t_38.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_38
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p75)
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

function t_39:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1792 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1793, var1794 = protoModule.writeTag(buff, var1792, 1, protoModule.wireTypes.lengthDelimited)
		var1793, var1794 = protoModule.writeString(var1793, var1794, self.title)
		buff = var1793
		var1792 = var1794
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1795 = v:encode()
			local var1796, var1797 = protoModule.writeTag(buff, var1792, 2, protoModule.wireTypes.lengthDelimited)
			var1796, var1797 = protoModule.writeBuffer(var1796, var1797, var1795, buffer.len(var1795))
			buff = var1796
			var1792 = var1797
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1798, var1799 = protoModule.writeTag(buff, var1792, 3, protoModule.wireTypes.lengthDelimited)
		var1798, var1799 = protoModule.writeString(var1798, var1799, self.universe_id)
		buff = var1798
		var1792 = var1799
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1800, var1801 = protoModule.writeTag(buff, var1792, 4, protoModule.wireTypes.lengthDelimited)
		var1800, var1801 = protoModule.writeString(var1800, var1801, self.sort_id)
		buff = var1800
		var1792 = var1801
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1802, var1803 = protoModule.writeTag(buff, var1792, 5, protoModule.wireTypes.lengthDelimited)
		var1802, var1803 = protoModule.writeString(var1802, var1803, self.subtitle)
		buff = var1802
		var1792 = var1803
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1804, var1805 = protoModule.writeTag(buff, var1792, 6, protoModule.wireTypes.lengthDelimited)
		var1804, var1805 = protoModule.writeString(var1804, var1805, self.info_text)
		buff = var1804
		var1792 = var1805
	end
	local buff_1 = buffer.create(var1792)
	buffer.copy(buff_1, 0, buff, 0, var1792)
	
	return buff_1
end

function t_39.decode(p76)
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1807 = t_39.new()
	local var1808 = 0
	while var1808 < buffer.len(p76) do
		local _ = nil
		local var1809 = nil
		local var1810, var1811, var1812 = protoModule.readTag(p76, var1808)
		local var1813 = var1810
		var1809 = var1811
		var1808 = var1812
		
		if var1809 == protoModule.wireTypes.varint then
			local _ = nil
			local var1814, var1815 = protoModule.readVarInt(p76, var1808)
			local _ = var1814
			var1808 = var1815
			continue
		end
		if var1809 == protoModule.wireTypes.lengthDelimited then
			if var1813 == 1 then
				local _ = nil
				local var1816, var1817 = protoModule.readBuffer(p76, var1808)
				var1808 = var1817
				var1807.title = buffer.tostring(var1816)
			elseif var1813 == 2 then
				local _ = nil
				local var1818, var1819 = protoModule.readBuffer(p76, var1808)
				var1808 = var1819
				table.insert(var1807.event_items, t.EventsCarouselInputData_EventItem.decode(var1818))
			elseif var1813 == 3 then
				local _ = nil
				local var1820, var1821 = protoModule.readBuffer(p76, var1808)
				var1808 = var1821
				var1807.universe_id = buffer.tostring(var1820)
			elseif var1813 == 4 then
				local _ = nil
				local var1822, var1823 = protoModule.readBuffer(p76, var1808)
				var1808 = var1823
				var1807.sort_id = buffer.tostring(var1822)
			elseif var1813 == 5 then
				local _ = nil
				local var1824, var1825 = protoModule.readBuffer(p76, var1808)
				var1808 = var1825
				var1807.subtitle = buffer.tostring(var1824)
			elseif var1813 == 6 then
				local _ = nil
				local var1826, var1827 = protoModule.readBuffer(p76, var1808)
				var1808 = var1827
				var1807.info_text = buffer.tostring(var1826)
			else
				local _ = nil
				local var1828, var1829 = protoModule.readVarInt(p76, var1808)
				var1808 = var1829 + var1828
			end
		elseif var1809 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1830, var1831 = protoModule.readFixed32(p76, var1808)
			local _ = var1830
			var1808 = var1831
		elseif var1809 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1832, var1833 = protoModule.readFixed64(p76, var1808)
			local _ = var1832
			var1808 = var1833
		else
			error("Unsupported wire type: " .. var1809)
		end
	end
	return var1807
end

function t_39:jsonEncode()
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

function t_39:jsonDecode()
	-- upvalues: t_39 (ref), t (ref)
	local var1836 = t_39.new()
	
	if self.title ~= nil then
		var1836.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1836.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1836.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1836.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1836.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1836.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1836.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1836.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1836.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1836.info_text = self.infoText
	end
	return var1836
end

t_39.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p77)
	-- upvalues: t_40 (ref)
	return setmetatable({
		event_id = if p77 == nil or p77.event_id == nil then "" else p77.event_id
	}, t_40)
end

function t_40:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1840 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1841, var1842 = protoModule.writeTag(buff, var1840, 1, protoModule.wireTypes.lengthDelimited)
		var1841, var1842 = protoModule.writeString(var1841, var1842, self.event_id)
		buff = var1841
		var1840 = var1842
	end
	local buff_1 = buffer.create(var1840)
	buffer.copy(buff_1, 0, buff, 0, var1840)
	
	return buff_1
end

function t_40.decode(p78)
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1844 = t_40.new()
	local var1845 = 0
	while var1845 < buffer.len(p78) do
		local _ = nil
		local var1846 = nil
		local var1847, var1848, var1849 = protoModule.readTag(p78, var1845)
		local var1850 = var1847
		var1846 = var1848
		var1845 = var1849
		
		if var1846 == protoModule.wireTypes.varint then
			local _ = nil
			local var1851, var1852 = protoModule.readVarInt(p78, var1845)
			local _ = var1851
			var1845 = var1852
			continue
		end
		if var1846 == protoModule.wireTypes.lengthDelimited then
			if var1850 == 1 then
				local _ = nil
				local var1853, var1854 = protoModule.readBuffer(p78, var1845)
				var1845 = var1854
				var1844.event_id = buffer.tostring(var1853)
			else
				local _ = nil
				local var1855, var1856 = protoModule.readVarInt(p78, var1845)
				var1845 = var1856 + var1855
			end
		elseif var1846 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1857, var1858 = protoModule.readFixed32(p78, var1845)
			local _ = var1857
			var1845 = var1858
		elseif var1846 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1859, var1860 = protoModule.readFixed64(p78, var1845)
			local _ = var1859
			var1845 = var1860
		else
			error("Unsupported wire type: " .. var1846)
		end
	end
	return var1844
end

function t_40:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_40:jsonDecode()
	-- upvalues: t_40 (ref)
	local var1862 = t_40.new()
	
	if self.event_id ~= nil then
		var1862.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1862.event_id = self.eventId
	end
	return var1862
end

t_40.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p79)
	-- upvalues: t_41 (ref)
	return setmetatable({
		universe_id = if p79 == nil or p79.universe_id == nil then "" else p79.universe_id,
		entry_map = if p79 == nil or p79.entry_map == nil then {} else p79.entry_map,
		entry_order = if p79 == nil or p79.entry_order == nil then {} else p79.entry_order,
		creator_key = if p79 == nil or p79.creator_key == nil then "" else p79.creator_key
	}, t_41)
end

function t_41:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1864 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1865, var1866 = protoModule.writeTag(buff, var1864, 1, protoModule.wireTypes.lengthDelimited)
		var1865, var1866 = protoModule.writeString(var1865, var1866, self.universe_id)
		buff = var1865
		var1864 = var1866
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1867, var1868 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1867, var1868 = protoModule.writeString(var1867, var1868, i)
			local var1869 = v:encode()
			var1868, var1870 = protoModule.writeTag(var1867, var1868, 2, protoModule.wireTypes.lengthDelimited)
			var1868, var1870 = protoModule.writeBuffer(var1868, var1870, var1869, buffer.len(var1869))
			local var1871 = var1868
			local var1872 = var1870
			local var1873, var1874 = protoModule.writeTag(buff, var1864, 2, protoModule.wireTypes.lengthDelimited)
			var1873, var1874 = protoModule.writeBuffer(var1873, var1874, var1871, var1872)
			buff = var1873
			var1864 = var1874
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1875, var1876 = protoModule.writeTag(buff, var1864, 3, protoModule.wireTypes.lengthDelimited)
			var1875, var1876 = protoModule.writeString(var1875, var1876, v)
			buff = var1875
			var1864 = var1876
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1877, var1878 = protoModule.writeTag(buff, var1864, 4, protoModule.wireTypes.lengthDelimited)
		var1877, var1878 = protoModule.writeString(var1877, var1878, self.creator_key)
		buff = var1877
		var1864 = var1878
	end
	local buff_1 = buffer.create(var1864)
	buffer.copy(buff_1, 0, buff, 0, var1864)
	
	return buff_1
end

function t_41.decode(p80)
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1880 = t_41.new()
	local var1881 = 0
	while var1881 < buffer.len(p80) do
		local _ = nil
		local var1882 = nil
		local var1883, var1884, var1885 = protoModule.readTag(p80, var1881)
		local var1886 = var1883
		var1882 = var1884
		var1881 = var1885
		
		if var1882 == protoModule.wireTypes.varint then
			local _ = nil
			local var1887, var1888 = protoModule.readVarInt(p80, var1881)
			local _ = var1887
			var1881 = var1888
			continue
		end
		if var1882 == protoModule.wireTypes.lengthDelimited then
			if var1886 == 1 then
				local _ = nil
				local var1889, var1890 = protoModule.readBuffer(p80, var1881)
				var1881 = var1890
				var1880.universe_id = buffer.tostring(var1889)
			elseif var1886 == 2 then
				local _ = nil
				local var1891, var1892 = protoModule.readBuffer(p80, var1881)
				var1881 = var1892
				var1891 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1891)
				var1880.entry_map[var1891.key or ""] = var1891.value or t.FeedEntry.new()
			elseif var1886 == 3 then
				local _ = nil
				local var1893, var1894 = protoModule.readBuffer(p80, var1881)
				var1881 = var1894
				table.insert(var1880.entry_order, buffer.tostring(var1893))
			elseif var1886 == 4 then
				local _ = nil
				local var1895, var1896 = protoModule.readBuffer(p80, var1881)
				var1881 = var1896
				var1880.creator_key = buffer.tostring(var1895)
			else
				local _ = nil
				local var1897, var1898 = protoModule.readVarInt(p80, var1881)
				var1881 = var1898 + var1897
			end
		elseif var1882 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1899, var1900 = protoModule.readFixed32(p80, var1881)
			local _ = var1899
			var1881 = var1900
		elseif var1882 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1901, var1902 = protoModule.readFixed64(p80, var1881)
			local _ = var1901
			var1881 = var1902
		else
			error("Unsupported wire type: " .. var1882)
		end
	end
	return var1880
end

function t_41:jsonEncode()
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

function t_41:jsonDecode()
	-- upvalues: t_41 (ref), t (ref)
	local var1906 = t_41.new()
	
	if self.universe_id ~= nil then
		var1906.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1906.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1906.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1906.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1906.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1906.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1906.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1906.creator_key = self.creatorKey
	end
	return var1906
end

t_41.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p81)
	-- upvalues: t_42 (ref)
	return setmetatable({
		key = if p81 == nil or p81.key == nil then "" else p81.key,
		value = if p81 == nil or p81.value == nil then nil else p81.value
	}, t_42)
end

function t_42:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1912 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1913, var1914 = protoModule.writeTag(buff, var1912, 1, protoModule.wireTypes.lengthDelimited)
		var1913, var1914 = protoModule.writeString(var1913, var1914, self.key)
		buff = var1913
		var1912 = var1914
	end
	if self.value ~= nil then
		local var1915 = self.value:encode()
		local var1916, var1917 = protoModule.writeTag(buff, var1912, 2, protoModule.wireTypes.lengthDelimited)
		var1916, var1917 = protoModule.writeBuffer(var1916, var1917, var1915, buffer.len(var1915))
		buff = var1916
		var1912 = var1917
	end
	local buff_1 = buffer.create(var1912)
	buffer.copy(buff_1, 0, buff, 0, var1912)
	
	return buff_1
end

function t_42.decode(p82)
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1919 = t_42.new()
	local var1920 = 0
	while var1920 < buffer.len(p82) do
		local _ = nil
		local var1921 = nil
		local var1922, var1923, var1924 = protoModule.readTag(p82, var1920)
		local var1925 = var1922
		var1921 = var1923
		var1920 = var1924
		
		if var1921 == protoModule.wireTypes.varint then
			local _ = nil
			local var1926, var1927 = protoModule.readVarInt(p82, var1920)
			local _ = var1926
			var1920 = var1927
			continue
		end
		if var1921 == protoModule.wireTypes.lengthDelimited then
			if var1925 == 1 then
				local _ = nil
				local var1928, var1929 = protoModule.readBuffer(p82, var1920)
				var1920 = var1929
				var1919.key = buffer.tostring(var1928)
			elseif var1925 == 2 then
				local _ = nil
				local var1930, var1931 = protoModule.readBuffer(p82, var1920)
				var1920 = var1931
				var1919.value = t.FeedEntry.decode(var1930)
			else
				local _ = nil
				local var1932, var1933 = protoModule.readVarInt(p82, var1920)
				var1920 = var1933 + var1932
			end
		elseif var1921 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1934, var1935 = protoModule.readFixed32(p82, var1920)
			local _ = var1934
			var1920 = var1935
		elseif var1921 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1936, var1937 = protoModule.readFixed64(p82, var1920)
			local _ = var1936
			var1920 = var1937
		else
			error("Unsupported wire type: " .. var1921)
		end
	end
	return var1919
end

function t_42:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_42:jsonDecode()
	-- upvalues: t_42 (ref), t (ref)
	local var1939 = t_42.new()
	
	if self.key ~= nil then
		var1939.key = self.key
	end
	if self.value ~= nil then
		var1939.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1939
end

t_42.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p83)
	-- upvalues: t_43 (ref)
	return setmetatable({
		game_passes = if p83 == nil or p83.game_passes == nil then {} else p83.game_passes
	}, t_43)
end

function t_43:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1941 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1942 = v:encode()
			local var1943, var1944 = protoModule.writeTag(buff, var1941, 1, protoModule.wireTypes.lengthDelimited)
			var1943, var1944 = protoModule.writeBuffer(var1943, var1944, var1942, buffer.len(var1942))
			buff = var1943
			var1941 = var1944
		end
	end
	local buff_1 = buffer.create(var1941)
	buffer.copy(buff_1, 0, buff, 0, var1941)
	
	return buff_1
end

function t_43.decode(p84)
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1946 = t_43.new()
	local var1947 = 0
	while var1947 < buffer.len(p84) do
		local _ = nil
		local var1948 = nil
		local var1949, var1950, var1951 = protoModule.readTag(p84, var1947)
		local var1952 = var1949
		var1948 = var1950
		var1947 = var1951
		
		if var1948 == protoModule.wireTypes.varint then
			local _ = nil
			local var1953, var1954 = protoModule.readVarInt(p84, var1947)
			local _ = var1953
			var1947 = var1954
			continue
		end
		if var1948 == protoModule.wireTypes.lengthDelimited then
			if var1952 == 1 then
				local _ = nil
				local var1955, var1956 = protoModule.readBuffer(p84, var1947)
				var1947 = var1956
				table.insert(var1946.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1955))
			else
				local _ = nil
				local var1957, var1958 = protoModule.readVarInt(p84, var1947)
				var1947 = var1958 + var1957
			end
		elseif var1948 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1959, var1960 = protoModule.readFixed32(p84, var1947)
			local _ = var1959
			var1947 = var1960
		elseif var1948 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1961, var1962 = protoModule.readFixed64(p84, var1947)
			local _ = var1961
			var1947 = var1962
		else
			error("Unsupported wire type: " .. var1948)
		end
	end
	return var1946
end

function t_43:jsonEncode()
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

function t_43:jsonDecode()
	-- upvalues: t_43 (ref), t (ref)
	local var1965 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1965.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1965.game_passes = t_1
	end
	return var1965
end

t_43.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p85)
	-- upvalues: t_44 (ref)
	return setmetatable({
		game_pass_id = if p85 == nil or p85.game_pass_id == nil then "" else p85.game_pass_id
	}, t_44)
end

function t_44:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1969 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1970, var1971 = protoModule.writeTag(buff, var1969, 1, protoModule.wireTypes.lengthDelimited)
		var1970, var1971 = protoModule.writeString(var1970, var1971, self.game_pass_id)
		buff = var1970
		var1969 = var1971
	end
	local buff_1 = buffer.create(var1969)
	buffer.copy(buff_1, 0, buff, 0, var1969)
	
	return buff_1
end

function t_44.decode(p86)
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1973 = t_44.new()
	local var1974 = 0
	while var1974 < buffer.len(p86) do
		local _ = nil
		local var1975 = nil
		local var1976, var1977, var1978 = protoModule.readTag(p86, var1974)
		local var1979 = var1976
		var1975 = var1977
		var1974 = var1978
		
		if var1975 == protoModule.wireTypes.varint then
			local _ = nil
			local var1980, var1981 = protoModule.readVarInt(p86, var1974)
			local _ = var1980
			var1974 = var1981
			continue
		end
		if var1975 == protoModule.wireTypes.lengthDelimited then
			if var1979 == 1 then
				local _ = nil
				local var1982, var1983 = protoModule.readBuffer(p86, var1974)
				var1974 = var1983
				var1973.game_pass_id = buffer.tostring(var1982)
			else
				local _ = nil
				local var1984, var1985 = protoModule.readVarInt(p86, var1974)
				var1974 = var1985 + var1984
			end
		elseif var1975 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1986, var1987 = protoModule.readFixed32(p86, var1974)
			local _ = var1986
			var1974 = var1987
		elseif var1975 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1988, var1989 = protoModule.readFixed64(p86, var1974)
			local _ = var1988
			var1974 = var1989
		else
			error("Unsupported wire type: " .. var1975)
		end
	end
	return var1973
end

function t_44:jsonEncode()
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_44:jsonDecode()
	-- upvalues: t_44 (ref)
	local var1991 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1991.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1991.game_pass_id = self.gamePassId
	end
	return var1991
end

t_44.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_44
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p87)
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_products = if p87 == nil or p87.developer_products == nil then {} else p87.developer_products
	}, t_45)
end

function t_45:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1993 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1994 = v:encode()
			local var1995, var1996 = protoModule.writeTag(buff, var1993, 1, protoModule.wireTypes.lengthDelimited)
			var1995, var1996 = protoModule.writeBuffer(var1995, var1996, var1994, buffer.len(var1994))
			buff = var1995
			var1993 = var1996
		end
	end
	local buff_1 = buffer.create(var1993)
	buffer.copy(buff_1, 0, buff, 0, var1993)
	
	return buff_1
end

function t_45.decode(p88)
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1998 = t_45.new()
	local var1999 = 0
	while var1999 < buffer.len(p88) do
		local _ = nil
		local var2000 = nil
		local var2001, var2002, var2003 = protoModule.readTag(p88, var1999)
		local var2004 = var2001
		var2000 = var2002
		var1999 = var2003
		
		if var2000 == protoModule.wireTypes.varint then
			local _ = nil
			local var2005, var2006 = protoModule.readVarInt(p88, var1999)
			local _ = var2005
			var1999 = var2006
			continue
		end
		if var2000 == protoModule.wireTypes.lengthDelimited then
			if var2004 == 1 then
				local _ = nil
				local var2007, var2008 = protoModule.readBuffer(p88, var1999)
				var1999 = var2008
				table.insert(var1998.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var2007))
			else
				local _ = nil
				local var2009, var2010 = protoModule.readVarInt(p88, var1999)
				var1999 = var2010 + var2009
			end
		elseif var2000 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2011, var2012 = protoModule.readFixed32(p88, var1999)
			local _ = var2011
			var1999 = var2012
		elseif var2000 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2013, var2014 = protoModule.readFixed64(p88, var1999)
			local _ = var2013
			var1999 = var2014
		else
			error("Unsupported wire type: " .. var2000)
		end
	end
	return var1998
end

function t_45:jsonEncode()
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

function t_45:jsonDecode()
	-- upvalues: t_45 (ref), t (ref)
	local var2017 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var2017.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var2017.developer_products = t_1
	end
	return var2017
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p89)
	-- upvalues: t_46 (ref)
	return setmetatable({
		developer_product_id = if p89 == nil or p89.developer_product_id == nil then "" else p89.developer_product_id
	}, t_46)
end

function t_46:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2021 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var2022, var2023 = protoModule.writeTag(buff, var2021, 1, protoModule.wireTypes.lengthDelimited)
		var2022, var2023 = protoModule.writeString(var2022, var2023, self.developer_product_id)
		buff = var2022
		var2021 = var2023
	end
	local buff_1 = buffer.create(var2021)
	buffer.copy(buff_1, 0, buff, 0, var2021)
	
	return buff_1
end

function t_46.decode(p90)
	-- upvalues: t_46 (ref), protoModule (ref)
	local var2025 = t_46.new()
	local var2026 = 0
	while var2026 < buffer.len(p90) do
		local _ = nil
		local var2027 = nil
		local var2028, var2029, var2030 = protoModule.readTag(p90, var2026)
		local var2031 = var2028
		var2027 = var2029
		var2026 = var2030
		
		if var2027 == protoModule.wireTypes.varint then
			local _ = nil
			local var2032, var2033 = protoModule.readVarInt(p90, var2026)
			local _ = var2032
			var2026 = var2033
			continue
		end
		if var2027 == protoModule.wireTypes.lengthDelimited then
			if var2031 == 1 then
				local _ = nil
				local var2034, var2035 = protoModule.readBuffer(p90, var2026)
				var2026 = var2035
				var2025.developer_product_id = buffer.tostring(var2034)
			else
				local _ = nil
				local var2036, var2037 = protoModule.readVarInt(p90, var2026)
				var2026 = var2037 + var2036
			end
		elseif var2027 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2038, var2039 = protoModule.readFixed32(p90, var2026)
			local _ = var2038
			var2026 = var2039
		elseif var2027 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2040, var2041 = protoModule.readFixed64(p90, var2026)
			local _ = var2040
			var2026 = var2041
		else
			error("Unsupported wire type: " .. var2027)
		end
	end
	return var2025
end

function t_46:jsonEncode()
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_46:jsonDecode()
	-- upvalues: t_46 (ref)
	local var2043 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var2043.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var2043.developer_product_id = self.developerProductId
	end
	return var2043
end

t_46.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_46
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p91)
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscriptions = if p91 == nil or p91.subscriptions == nil then {} else p91.subscriptions
	}, t_47)
end

function t_47:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2045 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var2046 = v:encode()
			local var2047, var2048 = protoModule.writeTag(buff, var2045, 1, protoModule.wireTypes.lengthDelimited)
			var2047, var2048 = protoModule.writeBuffer(var2047, var2048, var2046, buffer.len(var2046))
			buff = var2047
			var2045 = var2048
		end
	end
	local buff_1 = buffer.create(var2045)
	buffer.copy(buff_1, 0, buff, 0, var2045)
	
	return buff_1
end

function t_47.decode(p92)
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var2050 = t_47.new()
	local var2051 = 0
	while var2051 < buffer.len(p92) do
		local _ = nil
		local var2052 = nil
		local var2053, var2054, var2055 = protoModule.readTag(p92, var2051)
		local var2056 = var2053
		var2052 = var2054
		var2051 = var2055
		
		if var2052 == protoModule.wireTypes.varint then
			local _ = nil
			local var2057, var2058 = protoModule.readVarInt(p92, var2051)
			local _ = var2057
			var2051 = var2058
			continue
		end
		if var2052 == protoModule.wireTypes.lengthDelimited then
			if var2056 == 1 then
				local _ = nil
				local var2059, var2060 = protoModule.readBuffer(p92, var2051)
				var2051 = var2060
				table.insert(var2050.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var2059))
			else
				local _ = nil
				local var2061, var2062 = protoModule.readVarInt(p92, var2051)
				var2051 = var2062 + var2061
			end
		elseif var2052 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2063, var2064 = protoModule.readFixed32(p92, var2051)
			local _ = var2063
			var2051 = var2064
		elseif var2052 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2065, var2066 = protoModule.readFixed64(p92, var2051)
			local _ = var2065
			var2051 = var2066
		else
			error("Unsupported wire type: " .. var2052)
		end
	end
	return var2050
end

function t_47:jsonEncode()
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

function t_47:jsonDecode()
	-- upvalues: t_47 (ref), t (ref)
	local var2069 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var2069.subscriptions = t_1
	end
	return var2069
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p93)
	-- upvalues: t_48 (ref)
	return setmetatable({
		subscription_id = if p93 == nil or p93.subscription_id == nil then "" else p93.subscription_id
	}, t_48)
end

function t_48:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2072 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var2073, var2074 = protoModule.writeTag(buff, var2072, 1, protoModule.wireTypes.lengthDelimited)
		var2073, var2074 = protoModule.writeString(var2073, var2074, self.subscription_id)
		buff = var2073
		var2072 = var2074
	end
	local buff_1 = buffer.create(var2072)
	buffer.copy(buff_1, 0, buff, 0, var2072)
	
	return buff_1
end

function t_48.decode(p94)
	-- upvalues: t_48 (ref), protoModule (ref)
	local var2076 = t_48.new()
	local var2077 = 0
	while var2077 < buffer.len(p94) do
		local _ = nil
		local var2078 = nil
		local var2079, var2080, var2081 = protoModule.readTag(p94, var2077)
		local var2082 = var2079
		var2078 = var2080
		var2077 = var2081
		
		if var2078 == protoModule.wireTypes.varint then
			local _ = nil
			local var2083, var2084 = protoModule.readVarInt(p94, var2077)
			local _ = var2083
			var2077 = var2084
			continue
		end
		if var2078 == protoModule.wireTypes.lengthDelimited then
			if var2082 == 1 then
				local _ = nil
				local var2085, var2086 = protoModule.readBuffer(p94, var2077)
				var2077 = var2086
				var2076.subscription_id = buffer.tostring(var2085)
			else
				local _ = nil
				local var2087, var2088 = protoModule.readVarInt(p94, var2077)
				var2077 = var2088 + var2087
			end
		elseif var2078 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2089, var2090 = protoModule.readFixed32(p94, var2077)
			local _ = var2089
			var2077 = var2090
		elseif var2078 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2091, var2092 = protoModule.readFixed64(p94, var2077)
			local _ = var2091
			var2077 = var2092
		else
			error("Unsupported wire type: " .. var2078)
		end
	end
	return var2076
end

function t_48:jsonEncode()
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_48:jsonDecode()
	-- upvalues: t_48 (ref)
	local var2094 = t_48.new()
	
	if self.subscription_id ~= nil then
		var2094.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var2094.subscription_id = self.subscriptionId
	end
	return var2094
end

t_48.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_48
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p95)
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

function t_49:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2096 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2097 = v:encode()
			local var2098, var2099 = protoModule.writeTag(buff, var2096, 1, protoModule.wireTypes.lengthDelimited)
			var2098, var2099 = protoModule.writeBuffer(var2098, var2099, var2097, buffer.len(var2097))
			buff = var2098
			var2096 = var2099
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2100, var2101 = protoModule.writeTag(buff, var2096, 2, protoModule.wireTypes.lengthDelimited)
		var2100, var2101 = protoModule.writeString(var2100, var2101, self.universe_id)
		buff = var2100
		var2096 = var2101
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var2102, var2103 = protoModule.writeTag(buff, var2096, 3, protoModule.wireTypes.lengthDelimited)
		var2102, var2103 = protoModule.writeString(var2102, var2103, self.section_title)
		buff = var2102
		var2096 = var2103
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var2104, var2105 = protoModule.writeTag(buff, var2096, 4, protoModule.wireTypes.lengthDelimited)
		var2104, var2105 = protoModule.writeString(var2104, var2105, self.creator_key)
		buff = var2104
		var2096 = var2105
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var2106, var2107 = protoModule.writeTag(buff, var2096, 5, protoModule.wireTypes.lengthDelimited)
		var2106, var2107 = protoModule.writeString(var2106, var2107, self.collection_item_size)
		buff = var2106
		var2096 = var2107
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var2108, var2109 = protoModule.writeTag(buff, var2096, 6, protoModule.wireTypes.lengthDelimited)
		var2108, var2109 = protoModule.writeString(var2108, var2109, self.item_height_mode)
		buff = var2108
		var2096 = var2109
	end
	if self.experience_store_product_type ~= nil and self.experience_store_product_type ~= "" then
		local var2110, var2111 = protoModule.writeTag(buff, var2096, 7, protoModule.wireTypes.lengthDelimited)
		var2110, var2111 = protoModule.writeString(var2110, var2111, self.experience_store_product_type)
		buff = var2110
		var2096 = var2111
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var2112, var2113 = protoModule.writeTag(buff, var2096, 8, protoModule.wireTypes.lengthDelimited)
		var2112, var2113 = protoModule.writeString(var2112, var2113, self.content_type)
		buff = var2112
		var2096 = var2113
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var2114, var2115 = protoModule.writeTag(buff, var2096, 9, protoModule.wireTypes.lengthDelimited)
		var2114, var2115 = protoModule.writeString(var2114, var2115, self.item_type)
		buff = var2114
		var2096 = var2115
	end
	local buff_1 = buffer.create(var2096)
	buffer.copy(buff_1, 0, buff, 0, var2096)
	
	return buff_1
end

function t_49.decode(p96)
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var2117 = t_49.new()
	local var2118 = 0
	while var2118 < buffer.len(p96) do
		local _ = nil
		local var2119 = nil
		local var2120, var2121, var2122 = protoModule.readTag(p96, var2118)
		local var2123 = var2120
		var2119 = var2121
		var2118 = var2122
		
		if var2119 == protoModule.wireTypes.varint then
			local _ = nil
			local var2124, var2125 = protoModule.readVarInt(p96, var2118)
			local _ = var2124
			var2118 = var2125
			continue
		end
		if var2119 == protoModule.wireTypes.lengthDelimited then
			if var2123 == 1 then
				local _ = nil
				local var2126, var2127 = protoModule.readBuffer(p96, var2118)
				var2118 = var2127
				table.insert(var2117.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var2126))
			elseif var2123 == 2 then
				local _ = nil
				local var2128, var2129 = protoModule.readBuffer(p96, var2118)
				var2118 = var2129
				var2117.universe_id = buffer.tostring(var2128)
			elseif var2123 == 3 then
				local _ = nil
				local var2130, var2131 = protoModule.readBuffer(p96, var2118)
				var2118 = var2131
				var2117.section_title = buffer.tostring(var2130)
			elseif var2123 == 4 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p96, var2118)
				var2118 = var2133
				var2117.creator_key = buffer.tostring(var2132)
			elseif var2123 == 5 then
				local _ = nil
				local var2134, var2135 = protoModule.readBuffer(p96, var2118)
				var2118 = var2135
				var2117.collection_item_size = buffer.tostring(var2134)
			elseif var2123 == 6 then
				local _ = nil
				local var2136, var2137 = protoModule.readBuffer(p96, var2118)
				var2118 = var2137
				var2117.item_height_mode = buffer.tostring(var2136)
			elseif var2123 == 7 then
				local _ = nil
				local var2138, var2139 = protoModule.readBuffer(p96, var2118)
				var2118 = var2139
				var2117.experience_store_product_type = buffer.tostring(var2138)
			elseif var2123 == 8 then
				local _ = nil
				local var2140, var2141 = protoModule.readBuffer(p96, var2118)
				var2118 = var2141
				var2117.content_type = buffer.tostring(var2140)
			elseif var2123 == 9 then
				local _ = nil
				local var2142, var2143 = protoModule.readBuffer(p96, var2118)
				var2118 = var2143
				var2117.item_type = buffer.tostring(var2142)
			else
				local _ = nil
				local var2144, var2145 = protoModule.readVarInt(p96, var2118)
				var2118 = var2145 + var2144
			end
		elseif var2119 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2146, var2147 = protoModule.readFixed32(p96, var2118)
			local _ = var2146
			var2118 = var2147
		elseif var2119 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2148, var2149 = protoModule.readFixed64(p96, var2118)
			local _ = var2148
			var2118 = var2149
		else
			error("Unsupported wire type: " .. var2119)
		end
	end
	return var2117
end

function t_49:jsonEncode()
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

function t_49:jsonDecode()
	-- upvalues: t_49 (ref), t (ref)
	local var2152 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var2152.items = t_1
	end
	if self.universe_id ~= nil then
		var2152.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2152.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var2152.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var2152.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var2152.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var2152.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var2152.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var2152.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var2152.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var2152.item_height_mode = self.itemHeightMode
	end
	if self.experience_store_product_type ~= nil then
		var2152.experience_store_product_type = self.experience_store_product_type
	end
	if self.experienceStoreProductType ~= nil then
		var2152.experience_store_product_type = self.experienceStoreProductType
	end
	if self.content_type ~= nil then
		var2152.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var2152.content_type = self.contentType
	end
	if self.item_type ~= nil then
		var2152.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var2152.item_type = self.itemType
	end
	return var2152
end

t_49.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_49
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p97)
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		item_id = if p97 == nil or p97.item_id == nil then "" else p97.item_id,
		identifier = if p97 == nil or p97.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p97.identifier
	}, t_50)
end

function t_50:encode()
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2155 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2156, var2157 = protoModule.writeTag(buff, var2155, 1, protoModule.wireTypes.lengthDelimited)
		var2156, var2157 = protoModule.writeString(var2156, var2157, self.item_id)
		buff = var2156
		var2155 = var2157
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var2158, var2159 = protoModule.writeTag(buff, var2155, 2, protoModule.wireTypes.varint)
		var2158, var2159 = protoModule.writeVarInt(var2158, var2159, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var2158
		var2155 = var2159
	end
	local buff_1 = buffer.create(var2155)
	buffer.copy(buff_1, 0, buff, 0, var2155)
	
	return buff_1
end

function t_50.decode(p98)
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var2161 = t_50.new()
	local var2162 = 0
	while var2162 < buffer.len(p98) do
		local _ = nil
		local var2163 = nil
		local var2164, var2165, var2166 = protoModule.readTag(p98, var2162)
		local var2167 = var2164
		var2163 = var2165
		var2162 = var2166
		
		if var2163 == protoModule.wireTypes.varint then
			if var2167 == 2 then
				local _ = nil
				local var2168, var2169 = protoModule.readVarIntI32(p98, var2162)
				local var2170 = var2168
				var2162 = var2169
				var2161.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var2170) or var2170
			else
				local _ = nil
				local var2171, var2172 = protoModule.readVarInt(p98, var2162)
				local _ = var2171
				var2162 = var2172
			end
		end
		if var2163 == protoModule.wireTypes.lengthDelimited then
			if var2167 == 1 then
				local _ = nil
				local var2173, var2174 = protoModule.readBuffer(p98, var2162)
				var2162 = var2174
				var2161.item_id = buffer.tostring(var2173)
			else
				local _ = nil
				local var2175, var2176 = protoModule.readVarInt(p98, var2162)
				var2162 = var2176 + var2175
			end
		elseif var2163 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2177, var2178 = protoModule.readFixed32(p98, var2162)
			local _ = var2177
			var2162 = var2178
		elseif var2163 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2179, var2180 = protoModule.readFixed64(p98, var2162)
			local _ = var2179
			var2162 = var2180
		else
			error("Unsupported wire type: " .. var2163)
		end
	end
	return var2161
end

function t_50:jsonEncode()
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

function t_50:jsonDecode()
	-- upvalues: t_50 (ref), t (ref)
	local var2182 = t_50.new()
	
	if self.item_id ~= nil then
		var2182.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2182.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var2182.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var2182
end

t_50.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_50
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p99)
		return if p99 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p99 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p99 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p99 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p100)
		return if p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p100
	end,
	fromName = function(p101)
		return if p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_51 = {}
t_51.__index = t_51

function t_51.new(p102)
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

function t_51:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2184 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2185, var2186 = protoModule.writeTag(buff, var2184, 1, protoModule.wireTypes.lengthDelimited)
		var2185, var2186 = protoModule.writeString(var2185, var2186, self.roblox_component)
		buff = var2185
		var2184 = var2186
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var2187, var2188 = protoModule.writeTag(buff, var2184, 2, protoModule.wireTypes.lengthDelimited)
		var2187, var2188 = protoModule.writeString(var2187, var2188, self.identifier)
		buff = var2187
		var2184 = var2188
	end
	if self.title ~= nil and self.title ~= "" then
		local var2189, var2190 = protoModule.writeTag(buff, var2184, 3, protoModule.wireTypes.lengthDelimited)
		var2189, var2190 = protoModule.writeString(var2189, var2190, self.title)
		buff = var2189
		var2184 = var2190
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2191, var2192 = protoModule.writeTag(buff, var2184, 4, protoModule.wireTypes.lengthDelimited)
		var2191, var2192 = protoModule.writeString(var2191, var2192, self.user_id)
		buff = var2191
		var2184 = var2192
	end
	if self.description ~= nil and self.description ~= "" then
		local var2193, var2194 = protoModule.writeTag(buff, var2184, 5, protoModule.wireTypes.lengthDelimited)
		var2193, var2194 = protoModule.writeString(var2193, var2194, self.description)
		buff = var2193
		var2184 = var2194
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2195, var2196 = protoModule.writeTag(buff, var2184, 6, protoModule.wireTypes.lengthDelimited)
		var2195, var2196 = protoModule.writeString(var2195, var2196, self.cta_text)
		buff = var2195
		var2184 = var2196
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2197, var2198 = protoModule.writeTag(buff, var2184, 7, protoModule.wireTypes.lengthDelimited)
		var2197, var2198 = protoModule.writeString(var2197, var2198, self.prompt_id)
		buff = var2197
		var2184 = var2198
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2199, var2200 = protoModule.writeTag(buff, var2184, 8, protoModule.wireTypes.lengthDelimited)
		var2199, var2200 = protoModule.writeString(var2199, var2200, self.prompt_type)
		buff = var2199
		var2184 = var2200
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2201, var2202 = protoModule.writeTag(buff, var2184, 9, protoModule.wireTypes.lengthDelimited)
		var2201, var2202 = protoModule.writeString(var2201, var2202, self.entity_id)
		buff = var2201
		var2184 = var2202
	end
	local buff_1 = buffer.create(var2184)
	buffer.copy(buff_1, 0, buff, 0, var2184)
	
	return buff_1
end

function t_51.decode(p103)
	-- upvalues: t_51 (ref), protoModule (ref)
	local var2204 = t_51.new()
	local var2205 = 0
	while var2205 < buffer.len(p103) do
		local _ = nil
		local var2206 = nil
		local var2207, var2208, var2209 = protoModule.readTag(p103, var2205)
		local var2210 = var2207
		var2206 = var2208
		var2205 = var2209
		
		if var2206 == protoModule.wireTypes.varint then
			local _ = nil
			local var2211, var2212 = protoModule.readVarInt(p103, var2205)
			local _ = var2211
			var2205 = var2212
			continue
		end
		if var2206 == protoModule.wireTypes.lengthDelimited then
			if var2210 == 1 then
				local _ = nil
				local var2213, var2214 = protoModule.readBuffer(p103, var2205)
				var2205 = var2214
				var2204.roblox_component = buffer.tostring(var2213)
			elseif var2210 == 2 then
				local _ = nil
				local var2215, var2216 = protoModule.readBuffer(p103, var2205)
				var2205 = var2216
				var2204.identifier = buffer.tostring(var2215)
			elseif var2210 == 3 then
				local _ = nil
				local var2217, var2218 = protoModule.readBuffer(p103, var2205)
				var2205 = var2218
				var2204.title = buffer.tostring(var2217)
			elseif var2210 == 4 then
				local _ = nil
				local var2219, var2220 = protoModule.readBuffer(p103, var2205)
				var2205 = var2220
				var2204.user_id = buffer.tostring(var2219)
			elseif var2210 == 5 then
				local _ = nil
				local var2221, var2222 = protoModule.readBuffer(p103, var2205)
				var2205 = var2222
				var2204.description = buffer.tostring(var2221)
			elseif var2210 == 6 then
				local _ = nil
				local var2223, var2224 = protoModule.readBuffer(p103, var2205)
				var2205 = var2224
				var2204.cta_text = buffer.tostring(var2223)
			elseif var2210 == 7 then
				local _ = nil
				local var2225, var2226 = protoModule.readBuffer(p103, var2205)
				var2205 = var2226
				var2204.prompt_id = buffer.tostring(var2225)
			elseif var2210 == 8 then
				local _ = nil
				local var2227, var2228 = protoModule.readBuffer(p103, var2205)
				var2205 = var2228
				var2204.prompt_type = buffer.tostring(var2227)
			elseif var2210 == 9 then
				local _ = nil
				local var2229, var2230 = protoModule.readBuffer(p103, var2205)
				var2205 = var2230
				var2204.entity_id = buffer.tostring(var2229)
			else
				local _ = nil
				local var2231, var2232 = protoModule.readVarInt(p103, var2205)
				var2205 = var2232 + var2231
			end
		elseif var2206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2233, var2234 = protoModule.readFixed32(p103, var2205)
			local _ = var2233
			var2205 = var2234
		elseif var2206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2235, var2236 = protoModule.readFixed64(p103, var2205)
			local _ = var2235
			var2205 = var2236
		else
			error("Unsupported wire type: " .. var2206)
		end
	end
	return var2204
end

function t_51:jsonEncode()
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

function t_51:jsonDecode()
	-- upvalues: t_51 (ref)
	local var2238 = t_51.new()
	
	if self.roblox_component ~= nil then
		var2238.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var2238.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var2238.identifier = self.identifier
	end
	if self.title ~= nil then
		var2238.title = self.title
	end
	if self.user_id ~= nil then
		var2238.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2238.user_id = self.userId
	end
	if self.description ~= nil then
		var2238.description = self.description
	end
	if self.cta_text ~= nil then
		var2238.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2238.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2238.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2238.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2238.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2238.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2238.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2238.entity_id = self.entityId
	end
	return var2238
end

t_51.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_51
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p104)
	-- upvalues: t_52 (ref)
	return setmetatable({
		group_id = if p104 == nil or p104.group_id == nil then "" else p104.group_id,
		experience_id = if p104 == nil or p104.experience_id == nil then "" else p104.experience_id
	}, t_52)
end

function t_52:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2240 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var2241, var2242 = protoModule.writeTag(buff, var2240, 1, protoModule.wireTypes.lengthDelimited)
		var2241, var2242 = protoModule.writeString(var2241, var2242, self.group_id)
		buff = var2241
		var2240 = var2242
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var2243, var2244 = protoModule.writeTag(buff, var2240, 2, protoModule.wireTypes.lengthDelimited)
		var2243, var2244 = protoModule.writeString(var2243, var2244, self.experience_id)
		buff = var2243
		var2240 = var2244
	end
	local buff_1 = buffer.create(var2240)
	buffer.copy(buff_1, 0, buff, 0, var2240)
	
	return buff_1
end

function t_52.decode(p105)
	-- upvalues: t_52 (ref), protoModule (ref)
	local var2246 = t_52.new()
	local var2247 = 0
	while var2247 < buffer.len(p105) do
		local _ = nil
		local var2248 = nil
		local var2249, var2250, var2251 = protoModule.readTag(p105, var2247)
		local var2252 = var2249
		var2248 = var2250
		var2247 = var2251
		
		if var2248 == protoModule.wireTypes.varint then
			local _ = nil
			local var2253, var2254 = protoModule.readVarInt(p105, var2247)
			local _ = var2253
			var2247 = var2254
			continue
		end
		if var2248 == protoModule.wireTypes.lengthDelimited then
			if var2252 == 1 then
				local _ = nil
				local var2255, var2256 = protoModule.readBuffer(p105, var2247)
				var2247 = var2256
				var2246.group_id = buffer.tostring(var2255)
			elseif var2252 == 2 then
				local _ = nil
				local var2257, var2258 = protoModule.readBuffer(p105, var2247)
				var2247 = var2258
				var2246.experience_id = buffer.tostring(var2257)
			else
				local _ = nil
				local var2259, var2260 = protoModule.readVarInt(p105, var2247)
				var2247 = var2260 + var2259
			end
		elseif var2248 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2261, var2262 = protoModule.readFixed32(p105, var2247)
			local _ = var2261
			var2247 = var2262
		elseif var2248 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2263, var2264 = protoModule.readFixed64(p105, var2247)
			local _ = var2263
			var2247 = var2264
		else
			error("Unsupported wire type: " .. var2248)
		end
	end
	return var2246
end

function t_52:jsonEncode()
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_52:jsonDecode()
	-- upvalues: t_52 (ref)
	local var2266 = t_52.new()
	
	if self.group_id ~= nil then
		var2266.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var2266.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var2266.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var2266.experience_id = self.experienceId
	end
	return var2266
end

t_52.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_52
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p106)
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

function t_53:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2268 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2269, var2270 = protoModule.writeTag(buff, var2268, 1, protoModule.wireTypes.lengthDelimited)
		var2269, var2270 = protoModule.writeString(var2269, var2270, self.title)
		buff = var2269
		var2268 = var2270
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var2271, var2272 = protoModule.writeTag(buff, var2268, 2, protoModule.wireTypes.lengthDelimited)
		var2271, var2272 = protoModule.writeString(var2271, var2272, self.dismiss_text)
		buff = var2271
		var2268 = var2272
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2273, var2274 = protoModule.writeTag(buff, var2268, 3, protoModule.wireTypes.lengthDelimited)
		var2273, var2274 = protoModule.writeString(var2273, var2274, self.user_id)
		buff = var2273
		var2268 = var2274
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var2275 = v:encode()
			local var2276, var2277 = protoModule.writeTag(buff, var2268, 4, protoModule.wireTypes.lengthDelimited)
			var2276, var2277 = protoModule.writeBuffer(var2276, var2277, var2275, buffer.len(var2275))
			buff = var2276
			var2268 = var2277
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2278, var2279 = protoModule.writeTag(buff, var2268, 5, protoModule.wireTypes.lengthDelimited)
		var2278, var2279 = protoModule.writeString(var2278, var2279, self.prompt_id)
		buff = var2278
		var2268 = var2279
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2280, var2281 = protoModule.writeTag(buff, var2268, 6, protoModule.wireTypes.lengthDelimited)
		var2280, var2281 = protoModule.writeString(var2280, var2281, self.prompt_type)
		buff = var2280
		var2268 = var2281
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2282, var2283 = protoModule.writeTag(buff, var2268, 7, protoModule.wireTypes.lengthDelimited)
		var2282, var2283 = protoModule.writeString(var2282, var2283, self.sort_id)
		buff = var2282
		var2268 = var2283
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var2284, var2285 = protoModule.writeTag(buff, var2268, 8, protoModule.wireTypes.lengthDelimited)
		var2284, var2285 = protoModule.writeString(var2284, var2285, self.feed_item_key)
		buff = var2284
		var2268 = var2285
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var2286 = self.client_attributes.value:encode()
		local var2287, var2288 = protoModule.writeTag(buff, var2268, 9, protoModule.wireTypes.lengthDelimited)
		var2287, var2288 = protoModule.writeBuffer(var2287, var2288, var2286, buffer.len(var2286))
		buff = var2287
		var2268 = var2288
	end
	local buff_1 = buffer.create(var2268)
	buffer.copy(buff_1, 0, buff, 0, var2268)
	
	return buff_1
end

function t_53.decode(p107)
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var2290 = t_53.new()
	local var2291 = 0
	while var2291 < buffer.len(p107) do
		local _ = nil
		local var2292 = nil
		local var2293, var2294, var2295 = protoModule.readTag(p107, var2291)
		local var2296 = var2293
		var2292 = var2294
		var2291 = var2295
		
		if var2292 == protoModule.wireTypes.varint then
			local _ = nil
			local var2297, var2298 = protoModule.readVarInt(p107, var2291)
			local _ = var2297
			var2291 = var2298
			continue
		end
		if var2292 == protoModule.wireTypes.lengthDelimited then
			if var2296 == 1 then
				local _ = nil
				local var2299, var2300 = protoModule.readBuffer(p107, var2291)
				var2291 = var2300
				var2290.title = buffer.tostring(var2299)
			elseif var2296 == 2 then
				local _ = nil
				local var2301, var2302 = protoModule.readBuffer(p107, var2291)
				var2291 = var2302
				var2290.dismiss_text = buffer.tostring(var2301)
			elseif var2296 == 3 then
				local _ = nil
				local var2303, var2304 = protoModule.readBuffer(p107, var2291)
				var2291 = var2304
				var2290.user_id = buffer.tostring(var2303)
			elseif var2296 == 4 then
				local _ = nil
				local var2305, var2306 = protoModule.readBuffer(p107, var2291)
				var2291 = var2306
				table.insert(var2290.cards, t.CardContainerCardInputData.decode(var2305))
			elseif var2296 == 5 then
				local _ = nil
				local var2307, var2308 = protoModule.readBuffer(p107, var2291)
				var2291 = var2308
				var2290.prompt_id = buffer.tostring(var2307)
			elseif var2296 == 6 then
				local _ = nil
				local var2309, var2310 = protoModule.readBuffer(p107, var2291)
				var2291 = var2310
				var2290.prompt_type = buffer.tostring(var2309)
			elseif var2296 == 7 then
				local _ = nil
				local var2311, var2312 = protoModule.readBuffer(p107, var2291)
				var2291 = var2312
				var2290.sort_id = buffer.tostring(var2311)
			elseif var2296 == 8 then
				local _ = nil
				local var2313, var2314 = protoModule.readBuffer(p107, var2291)
				var2291 = var2314
				var2290.feed_item_key = buffer.tostring(var2313)
			elseif var2296 == 9 then
				local _ = nil
				local var2315, var2316 = protoModule.readBuffer(p107, var2291)
				var2291 = var2316
				var2290.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var2315)
				}
			else
				local _ = nil
				local var2317, var2318 = protoModule.readVarInt(p107, var2291)
				var2291 = var2318 + var2317
			end
		elseif var2292 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2319, var2320 = protoModule.readFixed32(p107, var2291)
			local _ = var2319
			var2291 = var2320
		elseif var2292 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2321, var2322 = protoModule.readFixed64(p107, var2291)
			local _ = var2321
			var2291 = var2322
		else
			error("Unsupported wire type: " .. var2292)
		end
	end
	return var2290
end

function t_53:jsonEncode()
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

function t_53:jsonDecode()
	-- upvalues: t_53 (ref), t (ref)
	local var2325 = t_53.new()
	
	if self.title ~= nil then
		var2325.title = self.title
	end
	if self.dismiss_text ~= nil then
		var2325.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var2325.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var2325.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2325.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var2325.cards = t_1
	end
	if self.prompt_id ~= nil then
		var2325.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2325.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2325.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2325.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var2325.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2325.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var2325.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var2325.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var2325.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var2325.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var2325
end

t_53.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_53
typeRegistryModule.default:register(t.CardContainerInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p108)
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

function t_54:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2328 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2329, var2330 = protoModule.writeTag(buff, var2328, 1, protoModule.wireTypes.lengthDelimited)
		var2329, var2330 = protoModule.writeString(var2329, var2330, self.title)
		buff = var2329
		var2328 = var2330
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2331, var2332 = protoModule.writeTag(buff, var2328, 2, protoModule.wireTypes.lengthDelimited)
		var2331, var2332 = protoModule.writeString(var2331, var2332, self.user_id)
		buff = var2331
		var2328 = var2332
	end
	if self.description ~= nil and self.description ~= "" then
		local var2333, var2334 = protoModule.writeTag(buff, var2328, 3, protoModule.wireTypes.lengthDelimited)
		var2333, var2334 = protoModule.writeString(var2333, var2334, self.description)
		buff = var2333
		var2328 = var2334
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2335, var2336 = protoModule.writeTag(buff, var2328, 4, protoModule.wireTypes.lengthDelimited)
		var2335, var2336 = protoModule.writeString(var2335, var2336, self.cta_text)
		buff = var2335
		var2328 = var2336
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2337, var2338 = protoModule.writeTag(buff, var2328, 5, protoModule.wireTypes.lengthDelimited)
		var2337, var2338 = protoModule.writeString(var2337, var2338, self.prompt_id)
		buff = var2337
		var2328 = var2338
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2339, var2340 = protoModule.writeTag(buff, var2328, 6, protoModule.wireTypes.lengthDelimited)
		var2339, var2340 = protoModule.writeString(var2339, var2340, self.prompt_type)
		buff = var2339
		var2328 = var2340
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2341, var2342 = protoModule.writeTag(buff, var2328, 7, protoModule.wireTypes.lengthDelimited)
		var2341, var2342 = protoModule.writeString(var2341, var2342, self.entity_id)
		buff = var2341
		var2328 = var2342
	end
	local buff_1 = buffer.create(var2328)
	buffer.copy(buff_1, 0, buff, 0, var2328)
	
	return buff_1
end

function t_54.decode(p109)
	-- upvalues: t_54 (ref), protoModule (ref)
	local var2344 = t_54.new()
	local var2345 = 0
	while var2345 < buffer.len(p109) do
		local _ = nil
		local var2346 = nil
		local var2347, var2348, var2349 = protoModule.readTag(p109, var2345)
		local var2350 = var2347
		var2346 = var2348
		var2345 = var2349
		
		if var2346 == protoModule.wireTypes.varint then
			local _ = nil
			local var2351, var2352 = protoModule.readVarInt(p109, var2345)
			local _ = var2351
			var2345 = var2352
			continue
		end
		if var2346 == protoModule.wireTypes.lengthDelimited then
			if var2350 == 1 then
				local _ = nil
				local var2353, var2354 = protoModule.readBuffer(p109, var2345)
				var2345 = var2354
				var2344.title = buffer.tostring(var2353)
			elseif var2350 == 2 then
				local _ = nil
				local var2355, var2356 = protoModule.readBuffer(p109, var2345)
				var2345 = var2356
				var2344.user_id = buffer.tostring(var2355)
			elseif var2350 == 3 then
				local _ = nil
				local var2357, var2358 = protoModule.readBuffer(p109, var2345)
				var2345 = var2358
				var2344.description = buffer.tostring(var2357)
			elseif var2350 == 4 then
				local _ = nil
				local var2359, var2360 = protoModule.readBuffer(p109, var2345)
				var2345 = var2360
				var2344.cta_text = buffer.tostring(var2359)
			elseif var2350 == 5 then
				local _ = nil
				local var2361, var2362 = protoModule.readBuffer(p109, var2345)
				var2345 = var2362
				var2344.prompt_id = buffer.tostring(var2361)
			elseif var2350 == 6 then
				local _ = nil
				local var2363, var2364 = protoModule.readBuffer(p109, var2345)
				var2345 = var2364
				var2344.prompt_type = buffer.tostring(var2363)
			elseif var2350 == 7 then
				local _ = nil
				local var2365, var2366 = protoModule.readBuffer(p109, var2345)
				var2345 = var2366
				var2344.entity_id = buffer.tostring(var2365)
			else
				local _ = nil
				local var2367, var2368 = protoModule.readVarInt(p109, var2345)
				var2345 = var2368 + var2367
			end
		elseif var2346 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2369, var2370 = protoModule.readFixed32(p109, var2345)
			local _ = var2369
			var2345 = var2370
		elseif var2346 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2371, var2372 = protoModule.readFixed64(p109, var2345)
			local _ = var2371
			var2345 = var2372
		else
			error("Unsupported wire type: " .. var2346)
		end
	end
	return var2344
end

function t_54:jsonEncode()
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

function t_54:jsonDecode()
	-- upvalues: t_54 (ref)
	local var2374 = t_54.new()
	
	if self.title ~= nil then
		var2374.title = self.title
	end
	if self.user_id ~= nil then
		var2374.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2374.user_id = self.userId
	end
	if self.description ~= nil then
		var2374.description = self.description
	end
	if self.cta_text ~= nil then
		var2374.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2374.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2374.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2374.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2374.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2374.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2374.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2374.entity_id = self.entityId
	end
	return var2374
end

t_54.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_54
typeRegistryModule.default:register(t.CardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p110)
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p110 == nil or p110.prompt_id == nil then "" else p110.prompt_id,
		prompt_type = if p110 == nil or p110.prompt_type == nil then "" else p110.prompt_type,
		user_id = if p110 == nil or p110.user_id == nil then "" else p110.user_id,
		audit_data = if p110 == nil or p110.audit_data == nil then "" else p110.audit_data
	}, t_55)
end

function t_55:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2376 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2377, var2378 = protoModule.writeTag(buff, var2376, 1, protoModule.wireTypes.lengthDelimited)
		var2377, var2378 = protoModule.writeString(var2377, var2378, self.prompt_id)
		buff = var2377
		var2376 = var2378
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2379, var2380 = protoModule.writeTag(buff, var2376, 2, protoModule.wireTypes.lengthDelimited)
		var2379, var2380 = protoModule.writeString(var2379, var2380, self.prompt_type)
		buff = var2379
		var2376 = var2380
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2381, var2382 = protoModule.writeTag(buff, var2376, 3, protoModule.wireTypes.lengthDelimited)
		var2381, var2382 = protoModule.writeString(var2381, var2382, self.user_id)
		buff = var2381
		var2376 = var2382
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var2383, var2384 = protoModule.writeTag(buff, var2376, 4, protoModule.wireTypes.lengthDelimited)
		var2383, var2384 = protoModule.writeString(var2383, var2384, self.audit_data)
		buff = var2383
		var2376 = var2384
	end
	local buff_1 = buffer.create(var2376)
	buffer.copy(buff_1, 0, buff, 0, var2376)
	
	return buff_1
end

function t_55.decode(p111)
	-- upvalues: t_55 (ref), protoModule (ref)
	local var2386 = t_55.new()
	local var2387 = 0
	while var2387 < buffer.len(p111) do
		local _ = nil
		local var2388 = nil
		local var2389, var2390, var2391 = protoModule.readTag(p111, var2387)
		local var2392 = var2389
		var2388 = var2390
		var2387 = var2391
		
		if var2388 == protoModule.wireTypes.varint then
			local _ = nil
			local var2393, var2394 = protoModule.readVarInt(p111, var2387)
			local _ = var2393
			var2387 = var2394
			continue
		end
		if var2388 == protoModule.wireTypes.lengthDelimited then
			if var2392 == 1 then
				local _ = nil
				local var2395, var2396 = protoModule.readBuffer(p111, var2387)
				var2387 = var2396
				var2386.prompt_id = buffer.tostring(var2395)
			elseif var2392 == 2 then
				local _ = nil
				local var2397, var2398 = protoModule.readBuffer(p111, var2387)
				var2387 = var2398
				var2386.prompt_type = buffer.tostring(var2397)
			elseif var2392 == 3 then
				local _ = nil
				local var2399, var2400 = protoModule.readBuffer(p111, var2387)
				var2387 = var2400
				var2386.user_id = buffer.tostring(var2399)
			elseif var2392 == 4 then
				local _ = nil
				local var2401, var2402 = protoModule.readBuffer(p111, var2387)
				var2387 = var2402
				var2386.audit_data = buffer.tostring(var2401)
			else
				local _ = nil
				local var2403, var2404 = protoModule.readVarInt(p111, var2387)
				var2387 = var2404 + var2403
			end
		elseif var2388 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2405, var2406 = protoModule.readFixed32(p111, var2387)
			local _ = var2405
			var2387 = var2406
		elseif var2388 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2407, var2408 = protoModule.readFixed64(p111, var2387)
			local _ = var2407
			var2387 = var2408
		else
			error("Unsupported wire type: " .. var2388)
		end
	end
	return var2386
end

function t_55:jsonEncode()
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

function t_55:jsonDecode()
	-- upvalues: t_55 (ref)
	local var2410 = t_55.new()
	
	if self.prompt_id ~= nil then
		var2410.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2410.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2410.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2410.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var2410.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2410.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var2410.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var2410.audit_data = self.auditData
	end
	return var2410
end

t_55.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_55
typeRegistryModule.default:register(t.DialogInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p112)
	-- upvalues: t_56 (ref)
	return setmetatable({
		sender_count = if p112 == nil or p112.sender_count == nil then 0 else p112.sender_count,
		total_robux_amount = if p112 == nil or p112.total_robux_amount == nil then 0 else p112.total_robux_amount
	}, t_56)
end

function t_56:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2412 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var2413, var2414 = protoModule.writeTag(buff, var2412, 1, protoModule.wireTypes.varint)
		var2413, var2414 = protoModule.writeVarInt(var2413, var2414, self.sender_count)
		buff = var2413
		var2412 = var2414
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var2415, var2416 = protoModule.writeTag(buff, var2412, 2, protoModule.wireTypes.varint)
		var2415, var2416 = protoModule.writeVarInt(var2415, var2416, self.total_robux_amount)
		buff = var2415
		var2412 = var2416
	end
	local buff_1 = buffer.create(var2412)
	buffer.copy(buff_1, 0, buff, 0, var2412)
	
	return buff_1
end

function t_56.decode(p113)
	-- upvalues: t_56 (ref), protoModule (ref)
	local var2418 = t_56.new()
	local var2419 = 0
	while var2419 < buffer.len(p113) do
		local _ = nil
		local _ = nil
		local var2420, var2421, var2422 = protoModule.readTag(p113, var2419)
		local var2423 = var2420
		local var2424 = var2421
		var2419 = var2422
		
		if var2424 == protoModule.wireTypes.varint then
			if var2423 == 1 then
				local _ = nil
				local var2425, var2426 = protoModule.readVarIntI32(p113, var2419)
				var2419 = var2426
				var2418.sender_count = var2425
			elseif var2423 == 2 then
				local _ = nil
				local var2427, var2428 = protoModule.readVarIntI64(p113, var2419)
				var2419 = var2428
				var2418.total_robux_amount = var2427
			else
				local _ = nil
				local var2429, var2430 = protoModule.readVarInt(p113, var2419)
				local _ = var2429
				var2419 = var2430
			end
		elseif var2424 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2431, var2432 = protoModule.readVarInt(p113, var2419)
			var2419 = var2432 + var2431
		elseif var2424 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2433, var2434 = protoModule.readFixed32(p113, var2419)
			local _ = var2433
			var2419 = var2434
		elseif var2424 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2435, var2436 = protoModule.readFixed64(p113, var2419)
			local _ = var2435
			var2419 = var2436
		else
			error("Unsupported wire type: " .. var2424)
		end
	end
	return var2418
end

function t_56:jsonEncode()
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_56:jsonDecode()
	-- upvalues: t_56 (ref)
	local var2438 = t_56.new()
	
	if self.sender_count ~= nil then
		var2438.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var2438.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var2438.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var2438.total_robux_amount = self.totalRobuxAmount
	end
	return var2438
end

t_56.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_56
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p114)
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

function t_57:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2440 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2441, var2442 = protoModule.writeTag(buff, var2440, 1, protoModule.wireTypes.lengthDelimited)
		var2441, var2442 = protoModule.writeString(var2441, var2442, self.title)
		buff = var2441
		var2440 = var2442
	end
	if self.description ~= nil and self.description ~= "" then
		local var2443, var2444 = protoModule.writeTag(buff, var2440, 2, protoModule.wireTypes.lengthDelimited)
		var2443, var2444 = protoModule.writeString(var2443, var2444, self.description)
		buff = var2443
		var2440 = var2444
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var2445, var2446 = protoModule.writeTag(buff, var2440, 3, protoModule.wireTypes.lengthDelimited)
		var2445, var2446 = protoModule.writeString(var2445, var2446, self.primary_text)
		buff = var2445
		var2440 = var2446
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var2447, var2448 = protoModule.writeTag(buff, var2440, 4, protoModule.wireTypes.lengthDelimited)
		var2447, var2448 = protoModule.writeString(var2447, var2448, self.secondary_text)
		buff = var2447
		var2440 = var2448
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2449, var2450 = protoModule.writeTag(buff, var2440, 5, protoModule.wireTypes.lengthDelimited)
		var2449, var2450 = protoModule.writeString(var2449, var2450, self.prompt_id)
		buff = var2449
		var2440 = var2450
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2451, var2452 = protoModule.writeTag(buff, var2440, 6, protoModule.wireTypes.lengthDelimited)
		var2451, var2452 = protoModule.writeString(var2451, var2452, self.prompt_type)
		buff = var2451
		var2440 = var2452
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var2453, var2454 = protoModule.writeTag(buff, var2440, 7, protoModule.wireTypes.varint)
		var2453, var2454 = protoModule.writeVarInt(var2453, var2454, self.times_seen)
		buff = var2453
		var2440 = var2454
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var2455 = self.content.value:encode()
		local var2456, var2457 = protoModule.writeTag(buff, var2440, 8, protoModule.wireTypes.lengthDelimited)
		var2456, var2457 = protoModule.writeBuffer(var2456, var2457, var2455, buffer.len(var2455))
		buff = var2456
		var2440 = var2457
	end
	local buff_1 = buffer.create(var2440)
	buffer.copy(buff_1, 0, buff, 0, var2440)
	
	return buff_1
end

function t_57.decode(p115)
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var2459 = t_57.new()
	local var2460 = 0
	while var2460 < buffer.len(p115) do
		local _ = nil
		local var2461 = nil
		local var2462, var2463, var2464 = protoModule.readTag(p115, var2460)
		local var2465 = var2462
		var2461 = var2463
		var2460 = var2464
		
		if var2461 == protoModule.wireTypes.varint then
			if var2465 == 7 then
				local _ = nil
				local var2466, var2467 = protoModule.readVarIntI32(p115, var2460)
				var2460 = var2467
				var2459.times_seen = var2466
			else
				local _ = nil
				local var2468, var2469 = protoModule.readVarInt(p115, var2460)
				local _ = var2468
				var2460 = var2469
			end
		end
		if var2461 == protoModule.wireTypes.lengthDelimited then
			if var2465 == 1 then
				local _ = nil
				local var2470, var2471 = protoModule.readBuffer(p115, var2460)
				var2460 = var2471
				var2459.title = buffer.tostring(var2470)
			elseif var2465 == 2 then
				local _ = nil
				local var2472, var2473 = protoModule.readBuffer(p115, var2460)
				var2460 = var2473
				var2459.description = buffer.tostring(var2472)
			elseif var2465 == 3 then
				local _ = nil
				local var2474, var2475 = protoModule.readBuffer(p115, var2460)
				var2460 = var2475
				var2459.primary_text = buffer.tostring(var2474)
			elseif var2465 == 4 then
				local _ = nil
				local var2476, var2477 = protoModule.readBuffer(p115, var2460)
				var2460 = var2477
				var2459.secondary_text = buffer.tostring(var2476)
			elseif var2465 == 5 then
				local _ = nil
				local var2478, var2479 = protoModule.readBuffer(p115, var2460)
				var2460 = var2479
				var2459.prompt_id = buffer.tostring(var2478)
			elseif var2465 == 6 then
				local _ = nil
				local var2480, var2481 = protoModule.readBuffer(p115, var2460)
				var2460 = var2481
				var2459.prompt_type = buffer.tostring(var2480)
			elseif var2465 == 8 then
				local _ = nil
				local var2482, var2483 = protoModule.readBuffer(p115, var2460)
				var2460 = var2483
				var2459.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var2482)
				}
			else
				local _ = nil
				local var2484, var2485 = protoModule.readVarInt(p115, var2460)
				var2460 = var2485 + var2484
			end
		elseif var2461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2486, var2487 = protoModule.readFixed32(p115, var2460)
			local _ = var2486
			var2460 = var2487
		elseif var2461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2488, var2489 = protoModule.readFixed64(p115, var2460)
			local _ = var2488
			var2460 = var2489
		else
			error("Unsupported wire type: " .. var2461)
		end
	end
	return var2459
end

function t_57:jsonEncode()
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

function t_57:jsonDecode()
	-- upvalues: t_57 (ref), t (ref)
	local var2491 = t_57.new()
	
	if self.title ~= nil then
		var2491.title = self.title
	end
	if self.description ~= nil then
		var2491.description = self.description
	end
	if self.primary_text ~= nil then
		var2491.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var2491.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var2491.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var2491.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var2491.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2491.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2491.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2491.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var2491.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var2491.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var2491.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var2491.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var2491
end

t_57.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_57
typeRegistryModule.default:register(t.BannerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p116)
	-- upvalues: t_58 (ref)
	return setmetatable({
		tooltip_text = if p116 == nil or p116.tooltip_text == nil then "" else p116.tooltip_text,
		prompt_id = if p116 == nil or p116.prompt_id == nil then "" else p116.prompt_id,
		prompt_type = if p116 == nil or p116.prompt_type == nil then "" else p116.prompt_type
	}, t_58)
end

function t_58:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2493 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var2494, var2495 = protoModule.writeTag(buff, var2493, 1, protoModule.wireTypes.lengthDelimited)
		var2494, var2495 = protoModule.writeString(var2494, var2495, self.tooltip_text)
		buff = var2494
		var2493 = var2495
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2496, var2497 = protoModule.writeTag(buff, var2493, 2, protoModule.wireTypes.lengthDelimited)
		var2496, var2497 = protoModule.writeString(var2496, var2497, self.prompt_id)
		buff = var2496
		var2493 = var2497
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2498, var2499 = protoModule.writeTag(buff, var2493, 3, protoModule.wireTypes.lengthDelimited)
		var2498, var2499 = protoModule.writeString(var2498, var2499, self.prompt_type)
		buff = var2498
		var2493 = var2499
	end
	local buff_1 = buffer.create(var2493)
	buffer.copy(buff_1, 0, buff, 0, var2493)
	
	return buff_1
end

function t_58.decode(p117)
	-- upvalues: t_58 (ref), protoModule (ref)
	local var2501 = t_58.new()
	local var2502 = 0
	while var2502 < buffer.len(p117) do
		local _ = nil
		local var2503 = nil
		local var2504, var2505, var2506 = protoModule.readTag(p117, var2502)
		local var2507 = var2504
		var2503 = var2505
		var2502 = var2506
		
		if var2503 == protoModule.wireTypes.varint then
			local _ = nil
			local var2508, var2509 = protoModule.readVarInt(p117, var2502)
			local _ = var2508
			var2502 = var2509
			continue
		end
		if var2503 == protoModule.wireTypes.lengthDelimited then
			if var2507 == 1 then
				local _ = nil
				local var2510, var2511 = protoModule.readBuffer(p117, var2502)
				var2502 = var2511
				var2501.tooltip_text = buffer.tostring(var2510)
			elseif var2507 == 2 then
				local _ = nil
				local var2512, var2513 = protoModule.readBuffer(p117, var2502)
				var2502 = var2513
				var2501.prompt_id = buffer.tostring(var2512)
			elseif var2507 == 3 then
				local _ = nil
				local var2514, var2515 = protoModule.readBuffer(p117, var2502)
				var2502 = var2515
				var2501.prompt_type = buffer.tostring(var2514)
			else
				local _ = nil
				local var2516, var2517 = protoModule.readVarInt(p117, var2502)
				var2502 = var2517 + var2516
			end
		elseif var2503 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2518, var2519 = protoModule.readFixed32(p117, var2502)
			local _ = var2518
			var2502 = var2519
		elseif var2503 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2520, var2521 = protoModule.readFixed64(p117, var2502)
			local _ = var2520
			var2502 = var2521
		else
			error("Unsupported wire type: " .. var2503)
		end
	end
	return var2501
end

function t_58:jsonEncode()
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

function t_58:jsonDecode()
	-- upvalues: t_58 (ref)
	local var2523 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var2523.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var2523.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var2523.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2523.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2523.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2523.prompt_type = self.promptType
	end
	return var2523
end

t_58.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_58
typeRegistryModule.default:register(t.TooltipInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p118)
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

function t_59:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2525 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var2526, var2527 = protoModule.writeTag(buff, var2525, 1, protoModule.wireTypes.lengthDelimited)
		var2526, var2527 = protoModule.writeString(var2526, var2527, self.media_id)
		buff = var2526
		var2525 = var2527
	end
	if self.title ~= nil and self.title ~= "" then
		local var2528, var2529 = protoModule.writeTag(buff, var2525, 2, protoModule.wireTypes.lengthDelimited)
		var2528, var2529 = protoModule.writeString(var2528, var2529, self.title)
		buff = var2528
		var2525 = var2529
	end
	if self.description ~= nil and self.description ~= "" then
		local var2530, var2531 = protoModule.writeTag(buff, var2525, 3, protoModule.wireTypes.lengthDelimited)
		var2530, var2531 = protoModule.writeString(var2530, var2531, self.description)
		buff = var2530
		var2525 = var2531
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2532, var2533 = protoModule.writeTag(buff, var2525, 4, protoModule.wireTypes.lengthDelimited)
		var2532, var2533 = protoModule.writeString(var2532, var2533, self.prompt_id)
		buff = var2532
		var2525 = var2533
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2534, var2535 = protoModule.writeTag(buff, var2525, 5, protoModule.wireTypes.lengthDelimited)
		var2534, var2535 = protoModule.writeString(var2534, var2535, self.prompt_type)
		buff = var2534
		var2525 = var2535
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var2536, var2537 = protoModule.writeTag(buff, var2525, 6, protoModule.wireTypes.lengthDelimited)
		var2536, var2537 = protoModule.writeString(var2536, var2537, self.anchor_tag)
		buff = var2536
		var2525 = var2537
	end
	local buff_1 = buffer.create(var2525)
	buffer.copy(buff_1, 0, buff, 0, var2525)
	
	return buff_1
end

function t_59.decode(p119)
	-- upvalues: t_59 (ref), protoModule (ref)
	local var2539 = t_59.new()
	local var2540 = 0
	while var2540 < buffer.len(p119) do
		local _ = nil
		local var2541 = nil
		local var2542, var2543, var2544 = protoModule.readTag(p119, var2540)
		local var2545 = var2542
		var2541 = var2543
		var2540 = var2544
		
		if var2541 == protoModule.wireTypes.varint then
			local _ = nil
			local var2546, var2547 = protoModule.readVarInt(p119, var2540)
			local _ = var2546
			var2540 = var2547
			continue
		end
		if var2541 == protoModule.wireTypes.lengthDelimited then
			if var2545 == 1 then
				local _ = nil
				local var2548, var2549 = protoModule.readBuffer(p119, var2540)
				var2540 = var2549
				var2539.media_id = buffer.tostring(var2548)
			elseif var2545 == 2 then
				local _ = nil
				local var2550, var2551 = protoModule.readBuffer(p119, var2540)
				var2540 = var2551
				var2539.title = buffer.tostring(var2550)
			elseif var2545 == 3 then
				local _ = nil
				local var2552, var2553 = protoModule.readBuffer(p119, var2540)
				var2540 = var2553
				var2539.description = buffer.tostring(var2552)
			elseif var2545 == 4 then
				local _ = nil
				local var2554, var2555 = protoModule.readBuffer(p119, var2540)
				var2540 = var2555
				var2539.prompt_id = buffer.tostring(var2554)
			elseif var2545 == 5 then
				local _ = nil
				local var2556, var2557 = protoModule.readBuffer(p119, var2540)
				var2540 = var2557
				var2539.prompt_type = buffer.tostring(var2556)
			elseif var2545 == 6 then
				local _ = nil
				local var2558, var2559 = protoModule.readBuffer(p119, var2540)
				var2540 = var2559
				var2539.anchor_tag = buffer.tostring(var2558)
			else
				local _ = nil
				local var2560, var2561 = protoModule.readVarInt(p119, var2540)
				var2540 = var2561 + var2560
			end
		elseif var2541 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2562, var2563 = protoModule.readFixed32(p119, var2540)
			local _ = var2562
			var2540 = var2563
		elseif var2541 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2564, var2565 = protoModule.readFixed64(p119, var2540)
			local _ = var2564
			var2540 = var2565
		else
			error("Unsupported wire type: " .. var2541)
		end
	end
	return var2539
end

function t_59:jsonEncode()
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

function t_59:jsonDecode()
	-- upvalues: t_59 (ref)
	local var2567 = t_59.new()
	
	if self.media_id ~= nil then
		var2567.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var2567.media_id = self.mediaId
	end
	if self.title ~= nil then
		var2567.title = self.title
	end
	if self.description ~= nil then
		var2567.description = self.description
	end
	if self.prompt_id ~= nil then
		var2567.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2567.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2567.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2567.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var2567.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var2567.anchor_tag = self.anchorTag
	end
	return var2567
end

t_59.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_59
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p120)
	-- upvalues: t_60 (ref)
	return setmetatable({
		prompt_id = if p120 == nil or p120.prompt_id == nil then "" else p120.prompt_id,
		prompt_type = if p120 == nil or p120.prompt_type == nil then "" else p120.prompt_type
	}, t_60)
end

function t_60:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2569 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2570, var2571 = protoModule.writeTag(buff, var2569, 1, protoModule.wireTypes.lengthDelimited)
		var2570, var2571 = protoModule.writeString(var2570, var2571, self.prompt_id)
		buff = var2570
		var2569 = var2571
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2572, var2573 = protoModule.writeTag(buff, var2569, 2, protoModule.wireTypes.lengthDelimited)
		var2572, var2573 = protoModule.writeString(var2572, var2573, self.prompt_type)
		buff = var2572
		var2569 = var2573
	end
	local buff_1 = buffer.create(var2569)
	buffer.copy(buff_1, 0, buff, 0, var2569)
	
	return buff_1
end

function t_60.decode(p121)
	-- upvalues: t_60 (ref), protoModule (ref)
	local var2575 = t_60.new()
	local var2576 = 0
	while var2576 < buffer.len(p121) do
		local _ = nil
		local var2577 = nil
		local var2578, var2579, var2580 = protoModule.readTag(p121, var2576)
		local var2581 = var2578
		var2577 = var2579
		var2576 = var2580
		
		if var2577 == protoModule.wireTypes.varint then
			local _ = nil
			local var2582, var2583 = protoModule.readVarInt(p121, var2576)
			local _ = var2582
			var2576 = var2583
			continue
		end
		if var2577 == protoModule.wireTypes.lengthDelimited then
			if var2581 == 1 then
				local _ = nil
				local var2584, var2585 = protoModule.readBuffer(p121, var2576)
				var2576 = var2585
				var2575.prompt_id = buffer.tostring(var2584)
			elseif var2581 == 2 then
				local _ = nil
				local var2586, var2587 = protoModule.readBuffer(p121, var2576)
				var2576 = var2587
				var2575.prompt_type = buffer.tostring(var2586)
			else
				local _ = nil
				local var2588, var2589 = protoModule.readVarInt(p121, var2576)
				var2576 = var2589 + var2588
			end
		elseif var2577 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2590, var2591 = protoModule.readFixed32(p121, var2576)
			local _ = var2590
			var2576 = var2591
		elseif var2577 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2592, var2593 = protoModule.readFixed64(p121, var2576)
			local _ = var2592
			var2576 = var2593
		else
			error("Unsupported wire type: " .. var2577)
		end
	end
	return var2575
end

function t_60:jsonEncode()
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_60:jsonDecode()
	-- upvalues: t_60 (ref)
	local var2595 = t_60.new()
	
	if self.prompt_id ~= nil then
		var2595.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2595.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2595.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2595.prompt_type = self.promptType
	end
	return var2595
end

t_60.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_60
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p122)
	-- upvalues: t_61 (ref)
	return setmetatable({
		upsell_prompt = if p122 == nil or p122.upsell_prompt == nil then "" else p122.upsell_prompt
	}, t_61)
end

function t_61:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2597 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2598, var2599 = protoModule.writeTag(buff, var2597, 1, protoModule.wireTypes.lengthDelimited)
		var2598, var2599 = protoModule.writeString(var2598, var2599, self.upsell_prompt)
		buff = var2598
		var2597 = var2599
	end
	local buff_1 = buffer.create(var2597)
	buffer.copy(buff_1, 0, buff, 0, var2597)
	
	return buff_1
end

function t_61.decode(p123)
	-- upvalues: t_61 (ref), protoModule (ref)
	local var2601 = t_61.new()
	local var2602 = 0
	while var2602 < buffer.len(p123) do
		local _ = nil
		local var2603 = nil
		local var2604, var2605, var2606 = protoModule.readTag(p123, var2602)
		local var2607 = var2604
		var2603 = var2605
		var2602 = var2606
		
		if var2603 == protoModule.wireTypes.varint then
			local _ = nil
			local var2608, var2609 = protoModule.readVarInt(p123, var2602)
			local _ = var2608
			var2602 = var2609
			continue
		end
		if var2603 == protoModule.wireTypes.lengthDelimited then
			if var2607 == 1 then
				local _ = nil
				local var2610, var2611 = protoModule.readBuffer(p123, var2602)
				var2602 = var2611
				var2601.upsell_prompt = buffer.tostring(var2610)
			else
				local _ = nil
				local var2612, var2613 = protoModule.readVarInt(p123, var2602)
				var2602 = var2613 + var2612
			end
		elseif var2603 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2614, var2615 = protoModule.readFixed32(p123, var2602)
			local _ = var2614
			var2602 = var2615
		elseif var2603 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2616, var2617 = protoModule.readFixed64(p123, var2602)
			local _ = var2616
			var2602 = var2617
		else
			error("Unsupported wire type: " .. var2603)
		end
	end
	return var2601
end

function t_61:jsonEncode()
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_61:jsonDecode()
	-- upvalues: t_61 (ref)
	local var2619 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var2619.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var2619.upsell_prompt = self.upsellPrompt
	end
	return var2619
end

t_61.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_61
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p124)
	-- upvalues: t_62 (ref)
	return setmetatable({
		modal_variant = if p124 == nil or p124.modal_variant == nil then "" else p124.modal_variant,
		modal_sequence = if p124 == nil or p124.modal_sequence == nil then "" else p124.modal_sequence,
		conversation_id = if p124 == nil or p124.conversation_id == nil then "" else p124.conversation_id,
		friend_id = if p124 == nil or p124.friend_id == nil then "" else p124.friend_id
	}, t_62)
end

function t_62:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2621 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2622, var2623 = protoModule.writeTag(buff, var2621, 1, protoModule.wireTypes.lengthDelimited)
		var2622, var2623 = protoModule.writeString(var2622, var2623, self.modal_variant)
		buff = var2622
		var2621 = var2623
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var2624, var2625 = protoModule.writeTag(buff, var2621, 2, protoModule.wireTypes.lengthDelimited)
		var2624, var2625 = protoModule.writeString(var2624, var2625, self.modal_sequence)
		buff = var2624
		var2621 = var2625
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var2626, var2627 = protoModule.writeTag(buff, var2621, 3, protoModule.wireTypes.lengthDelimited)
		var2626, var2627 = protoModule.writeString(var2626, var2627, self.conversation_id)
		buff = var2626
		var2621 = var2627
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var2628, var2629 = protoModule.writeTag(buff, var2621, 4, protoModule.wireTypes.lengthDelimited)
		var2628, var2629 = protoModule.writeString(var2628, var2629, self.friend_id)
		buff = var2628
		var2621 = var2629
	end
	local buff_1 = buffer.create(var2621)
	buffer.copy(buff_1, 0, buff, 0, var2621)
	
	return buff_1
end

function t_62.decode(p125)
	-- upvalues: t_62 (ref), protoModule (ref)
	local var2631 = t_62.new()
	local var2632 = 0
	while var2632 < buffer.len(p125) do
		local _ = nil
		local var2633 = nil
		local var2634, var2635, var2636 = protoModule.readTag(p125, var2632)
		local var2637 = var2634
		var2633 = var2635
		var2632 = var2636
		
		if var2633 == protoModule.wireTypes.varint then
			local _ = nil
			local var2638, var2639 = protoModule.readVarInt(p125, var2632)
			local _ = var2638
			var2632 = var2639
			continue
		end
		if var2633 == protoModule.wireTypes.lengthDelimited then
			if var2637 == 1 then
				local _ = nil
				local var2640, var2641 = protoModule.readBuffer(p125, var2632)
				var2632 = var2641
				var2631.modal_variant = buffer.tostring(var2640)
			elseif var2637 == 2 then
				local _ = nil
				local var2642, var2643 = protoModule.readBuffer(p125, var2632)
				var2632 = var2643
				var2631.modal_sequence = buffer.tostring(var2642)
			elseif var2637 == 3 then
				local _ = nil
				local var2644, var2645 = protoModule.readBuffer(p125, var2632)
				var2632 = var2645
				var2631.conversation_id = buffer.tostring(var2644)
			elseif var2637 == 4 then
				local _ = nil
				local var2646, var2647 = protoModule.readBuffer(p125, var2632)
				var2632 = var2647
				var2631.friend_id = buffer.tostring(var2646)
			else
				local _ = nil
				local var2648, var2649 = protoModule.readVarInt(p125, var2632)
				var2632 = var2649 + var2648
			end
		elseif var2633 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2650, var2651 = protoModule.readFixed32(p125, var2632)
			local _ = var2650
			var2632 = var2651
		elseif var2633 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2652, var2653 = protoModule.readFixed64(p125, var2632)
			local _ = var2652
			var2632 = var2653
		else
			error("Unsupported wire type: " .. var2633)
		end
	end
	return var2631
end

function t_62:jsonEncode()
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

function t_62:jsonDecode()
	-- upvalues: t_62 (ref)
	local var2655 = t_62.new()
	
	if self.modal_variant ~= nil then
		var2655.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var2655.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var2655.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var2655.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var2655.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var2655.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var2655.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var2655.friend_id = self.friendId
	end
	return var2655
end

t_62.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_62
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p126)
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p126 == nil or p126.event_id == nil then "" else p126.event_id,
		universe_id = if p126 == nil or p126.universe_id == nil then "" else p126.universe_id,
		entry_map = if p126 == nil or p126.entry_map == nil then {} else p126.entry_map,
		entry_order = if p126 == nil or p126.entry_order == nil then {} else p126.entry_order
	}, t_63)
end

function t_63:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2657 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2658, var2659 = protoModule.writeTag(buff, var2657, 1, protoModule.wireTypes.lengthDelimited)
		var2658, var2659 = protoModule.writeString(var2658, var2659, self.event_id)
		buff = var2658
		var2657 = var2659
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2660, var2661 = protoModule.writeTag(buff, var2657, 2, protoModule.wireTypes.lengthDelimited)
		var2660, var2661 = protoModule.writeString(var2660, var2661, self.universe_id)
		buff = var2660
		var2657 = var2661
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2662, var2663 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2662, var2663 = protoModule.writeString(var2662, var2663, i)
			local var2664 = v:encode()
			var2663, var2665 = protoModule.writeTag(var2662, var2663, 2, protoModule.wireTypes.lengthDelimited)
			var2663, var2665 = protoModule.writeBuffer(var2663, var2665, var2664, buffer.len(var2664))
			local var2666 = var2663
			local var2667 = var2665
			local var2668, var2669 = protoModule.writeTag(buff, var2657, 3, protoModule.wireTypes.lengthDelimited)
			var2668, var2669 = protoModule.writeBuffer(var2668, var2669, var2666, var2667)
			buff = var2668
			var2657 = var2669
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2670, var2671 = protoModule.writeTag(buff, var2657, 4, protoModule.wireTypes.lengthDelimited)
			var2670, var2671 = protoModule.writeString(var2670, var2671, v)
			buff = var2670
			var2657 = var2671
		end
	end
	local buff_1 = buffer.create(var2657)
	buffer.copy(buff_1, 0, buff, 0, var2657)
	
	return buff_1
end

function t_63.decode(p127)
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2673 = t_63.new()
	local var2674 = 0
	while var2674 < buffer.len(p127) do
		local _ = nil
		local var2675 = nil
		local var2676, var2677, var2678 = protoModule.readTag(p127, var2674)
		local var2679 = var2676
		var2675 = var2677
		var2674 = var2678
		
		if var2675 == protoModule.wireTypes.varint then
			local _ = nil
			local var2680, var2681 = protoModule.readVarInt(p127, var2674)
			local _ = var2680
			var2674 = var2681
			continue
		end
		if var2675 == protoModule.wireTypes.lengthDelimited then
			if var2679 == 1 then
				local _ = nil
				local var2682, var2683 = protoModule.readBuffer(p127, var2674)
				var2674 = var2683
				var2673.event_id = buffer.tostring(var2682)
			elseif var2679 == 2 then
				local _ = nil
				local var2684, var2685 = protoModule.readBuffer(p127, var2674)
				var2674 = var2685
				var2673.universe_id = buffer.tostring(var2684)
			elseif var2679 == 3 then
				local _ = nil
				local var2686, var2687 = protoModule.readBuffer(p127, var2674)
				var2674 = var2687
				var2686 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var2686)
				var2673.entry_map[var2686.key or ""] = var2686.value or t.FeedEntry.new()
			elseif var2679 == 4 then
				local _ = nil
				local var2688, var2689 = protoModule.readBuffer(p127, var2674)
				var2674 = var2689
				table.insert(var2673.entry_order, buffer.tostring(var2688))
			else
				local _ = nil
				local var2690, var2691 = protoModule.readVarInt(p127, var2674)
				var2674 = var2691 + var2690
			end
		elseif var2675 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2692, var2693 = protoModule.readFixed32(p127, var2674)
			local _ = var2692
			var2674 = var2693
		elseif var2675 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2694, var2695 = protoModule.readFixed64(p127, var2674)
			local _ = var2694
			var2674 = var2695
		else
			error("Unsupported wire type: " .. var2675)
		end
	end
	return var2673
end

function t_63:jsonEncode()
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

function t_63:jsonDecode()
	-- upvalues: t_63 (ref), t (ref)
	local var2699 = t_63.new()
	
	if self.event_id ~= nil then
		var2699.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2699.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2699.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2699.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2699.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2699.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2699.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2699.entry_order = t_1
	end
	return var2699
end

t_63.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_63
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p128)
	-- upvalues: t_64 (ref)
	return setmetatable({
		key = if p128 == nil or p128.key == nil then "" else p128.key,
		value = if p128 == nil or p128.value == nil then nil else p128.value
	}, t_64)
end

function t_64:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2705 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2706, var2707 = protoModule.writeTag(buff, var2705, 1, protoModule.wireTypes.lengthDelimited)
		var2706, var2707 = protoModule.writeString(var2706, var2707, self.key)
		buff = var2706
		var2705 = var2707
	end
	if self.value ~= nil then
		local var2708 = self.value:encode()
		local var2709, var2710 = protoModule.writeTag(buff, var2705, 2, protoModule.wireTypes.lengthDelimited)
		var2709, var2710 = protoModule.writeBuffer(var2709, var2710, var2708, buffer.len(var2708))
		buff = var2709
		var2705 = var2710
	end
	local buff_1 = buffer.create(var2705)
	buffer.copy(buff_1, 0, buff, 0, var2705)
	
	return buff_1
end

function t_64.decode(p129)
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2712 = t_64.new()
	local var2713 = 0
	while var2713 < buffer.len(p129) do
		local _ = nil
		local var2714 = nil
		local var2715, var2716, var2717 = protoModule.readTag(p129, var2713)
		local var2718 = var2715
		var2714 = var2716
		var2713 = var2717
		
		if var2714 == protoModule.wireTypes.varint then
			local _ = nil
			local var2719, var2720 = protoModule.readVarInt(p129, var2713)
			local _ = var2719
			var2713 = var2720
			continue
		end
		if var2714 == protoModule.wireTypes.lengthDelimited then
			if var2718 == 1 then
				local _ = nil
				local var2721, var2722 = protoModule.readBuffer(p129, var2713)
				var2713 = var2722
				var2712.key = buffer.tostring(var2721)
			elseif var2718 == 2 then
				local _ = nil
				local var2723, var2724 = protoModule.readBuffer(p129, var2713)
				var2713 = var2724
				var2712.value = t.FeedEntry.decode(var2723)
			else
				local _ = nil
				local var2725, var2726 = protoModule.readVarInt(p129, var2713)
				var2713 = var2726 + var2725
			end
		elseif var2714 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2727, var2728 = protoModule.readFixed32(p129, var2713)
			local _ = var2727
			var2713 = var2728
		elseif var2714 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2729, var2730 = protoModule.readFixed64(p129, var2713)
			local _ = var2729
			var2713 = var2730
		else
			error("Unsupported wire type: " .. var2714)
		end
	end
	return var2712
end

function t_64:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_64:jsonDecode()
	-- upvalues: t_64 (ref), t (ref)
	local var2732 = t_64.new()
	
	if self.key ~= nil then
		var2732.key = self.key
	end
	if self.value ~= nil then
		var2732.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2732
end

t_64.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_64
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p130)
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p130 == nil or p130.event_id == nil then "" else p130.event_id,
		universe_id = if p130 == nil or p130.universe_id == nil then "" else p130.universe_id
	}, t_65)
end

function t_65:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2734 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2735, var2736 = protoModule.writeTag(buff, var2734, 1, protoModule.wireTypes.lengthDelimited)
		var2735, var2736 = protoModule.writeString(var2735, var2736, self.event_id)
		buff = var2735
		var2734 = var2736
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2737, var2738 = protoModule.writeTag(buff, var2734, 2, protoModule.wireTypes.lengthDelimited)
		var2737, var2738 = protoModule.writeString(var2737, var2738, self.universe_id)
		buff = var2737
		var2734 = var2738
	end
	local buff_1 = buffer.create(var2734)
	buffer.copy(buff_1, 0, buff, 0, var2734)
	
	return buff_1
end

function t_65.decode(p131)
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2740 = t_65.new()
	local var2741 = 0
	while var2741 < buffer.len(p131) do
		local _ = nil
		local var2742 = nil
		local var2743, var2744, var2745 = protoModule.readTag(p131, var2741)
		local var2746 = var2743
		var2742 = var2744
		var2741 = var2745
		
		if var2742 == protoModule.wireTypes.varint then
			local _ = nil
			local var2747, var2748 = protoModule.readVarInt(p131, var2741)
			local _ = var2747
			var2741 = var2748
			continue
		end
		if var2742 == protoModule.wireTypes.lengthDelimited then
			if var2746 == 1 then
				local _ = nil
				local var2749, var2750 = protoModule.readBuffer(p131, var2741)
				var2741 = var2750
				var2740.event_id = buffer.tostring(var2749)
			elseif var2746 == 2 then
				local _ = nil
				local var2751, var2752 = protoModule.readBuffer(p131, var2741)
				var2741 = var2752
				var2740.universe_id = buffer.tostring(var2751)
			else
				local _ = nil
				local var2753, var2754 = protoModule.readVarInt(p131, var2741)
				var2741 = var2754 + var2753
			end
		elseif var2742 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2755, var2756 = protoModule.readFixed32(p131, var2741)
			local _ = var2755
			var2741 = var2756
		elseif var2742 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2757, var2758 = protoModule.readFixed64(p131, var2741)
			local _ = var2757
			var2741 = var2758
		else
			error("Unsupported wire type: " .. var2742)
		end
	end
	return var2740
end

function t_65:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_65:jsonDecode()
	-- upvalues: t_65 (ref)
	local var2760 = t_65.new()
	
	if self.event_id ~= nil then
		var2760.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2760.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2760.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2760.universe_id = self.universeId
	end
	return var2760
end

t_65.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_65
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p132)
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p132 == nil or p132.event_id == nil then "" else p132.event_id
	}, t_66)
end

function t_66:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2762 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2763, var2764 = protoModule.writeTag(buff, var2762, 1, protoModule.wireTypes.lengthDelimited)
		var2763, var2764 = protoModule.writeString(var2763, var2764, self.event_id)
		buff = var2763
		var2762 = var2764
	end
	local buff_1 = buffer.create(var2762)
	buffer.copy(buff_1, 0, buff, 0, var2762)
	
	return buff_1
end

function t_66.decode(p133)
	-- upvalues: t_66 (ref), protoModule (ref)
	local var2766 = t_66.new()
	local var2767 = 0
	while var2767 < buffer.len(p133) do
		local _ = nil
		local var2768 = nil
		local var2769, var2770, var2771 = protoModule.readTag(p133, var2767)
		local var2772 = var2769
		var2768 = var2770
		var2767 = var2771
		
		if var2768 == protoModule.wireTypes.varint then
			local _ = nil
			local var2773, var2774 = protoModule.readVarInt(p133, var2767)
			local _ = var2773
			var2767 = var2774
			continue
		end
		if var2768 == protoModule.wireTypes.lengthDelimited then
			if var2772 == 1 then
				local _ = nil
				local var2775, var2776 = protoModule.readBuffer(p133, var2767)
				var2767 = var2776
				var2766.event_id = buffer.tostring(var2775)
			else
				local _ = nil
				local var2777, var2778 = protoModule.readVarInt(p133, var2767)
				var2767 = var2778 + var2777
			end
		elseif var2768 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2779, var2780 = protoModule.readFixed32(p133, var2767)
			local _ = var2779
			var2767 = var2780
		elseif var2768 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2781, var2782 = protoModule.readFixed64(p133, var2767)
			local _ = var2781
			var2767 = var2782
		else
			error("Unsupported wire type: " .. var2768)
		end
	end
	return var2766
end

function t_66:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_66:jsonDecode()
	-- upvalues: t_66 (ref)
	local var2784 = t_66.new()
	
	if self.event_id ~= nil then
		var2784.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2784.event_id = self.eventId
	end
	return var2784
end

t_66.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_66
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p134)
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p134 == nil or p134.event_id == nil then "" else p134.event_id,
		universe_id = if p134 == nil or p134.universe_id == nil then "" else p134.universe_id,
		rsvp_users = if p134 == nil or p134.rsvp_users == nil then {} else p134.rsvp_users
	}, t_67)
end

function t_67:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2786 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2787, var2788 = protoModule.writeTag(buff, var2786, 1, protoModule.wireTypes.lengthDelimited)
		var2787, var2788 = protoModule.writeString(var2787, var2788, self.event_id)
		buff = var2787
		var2786 = var2788
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2789, var2790 = protoModule.writeTag(buff, var2786, 2, protoModule.wireTypes.lengthDelimited)
		var2789, var2790 = protoModule.writeString(var2789, var2790, self.universe_id)
		buff = var2789
		var2786 = var2790
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2791 = v:encode()
			local var2792, var2793 = protoModule.writeTag(buff, var2786, 3, protoModule.wireTypes.lengthDelimited)
			var2792, var2793 = protoModule.writeBuffer(var2792, var2793, var2791, buffer.len(var2791))
			buff = var2792
			var2786 = var2793
		end
	end
	local buff_1 = buffer.create(var2786)
	buffer.copy(buff_1, 0, buff, 0, var2786)
	
	return buff_1
end

function t_67.decode(p135)
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var2795 = t_67.new()
	local var2796 = 0
	while var2796 < buffer.len(p135) do
		local _ = nil
		local var2797 = nil
		local var2798, var2799, var2800 = protoModule.readTag(p135, var2796)
		local var2801 = var2798
		var2797 = var2799
		var2796 = var2800
		
		if var2797 == protoModule.wireTypes.varint then
			local _ = nil
			local var2802, var2803 = protoModule.readVarInt(p135, var2796)
			local _ = var2802
			var2796 = var2803
			continue
		end
		if var2797 == protoModule.wireTypes.lengthDelimited then
			if var2801 == 1 then
				local _ = nil
				local var2804, var2805 = protoModule.readBuffer(p135, var2796)
				var2796 = var2805
				var2795.event_id = buffer.tostring(var2804)
			elseif var2801 == 2 then
				local _ = nil
				local var2806, var2807 = protoModule.readBuffer(p135, var2796)
				var2796 = var2807
				var2795.universe_id = buffer.tostring(var2806)
			elseif var2801 == 3 then
				local _ = nil
				local var2808, var2809 = protoModule.readBuffer(p135, var2796)
				var2796 = var2809
				table.insert(var2795.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2808))
			else
				local _ = nil
				local var2810, var2811 = protoModule.readVarInt(p135, var2796)
				var2796 = var2811 + var2810
			end
		elseif var2797 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2812, var2813 = protoModule.readFixed32(p135, var2796)
			local _ = var2812
			var2796 = var2813
		elseif var2797 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2814, var2815 = protoModule.readFixed64(p135, var2796)
			local _ = var2814
			var2796 = var2815
		else
			error("Unsupported wire type: " .. var2797)
		end
	end
	return var2795
end

function t_67:jsonEncode()
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

function t_67:jsonDecode()
	-- upvalues: t_67 (ref), t (ref)
	local var2818 = t_67.new()
	
	if self.event_id ~= nil then
		var2818.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2818.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2818.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2818.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2818.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2818.rsvp_users = t_1
	end
	return var2818
end

t_67.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_67
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p136)
	-- upvalues: t_68 (ref)
	return setmetatable({
		user_id = if p136 == nil or p136.user_id == nil then 0 else p136.user_id
	}, t_68)
end

function t_68:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2822 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2823, var2824 = protoModule.writeTag(buff, var2822, 1, protoModule.wireTypes.varint)
		var2823, var2824 = protoModule.writeVarInt(var2823, var2824, self.user_id)
		buff = var2823
		var2822 = var2824
	end
	local buff_1 = buffer.create(var2822)
	buffer.copy(buff_1, 0, buff, 0, var2822)
	
	return buff_1
end

function t_68.decode(p137)
	-- upvalues: t_68 (ref), protoModule (ref)
	local var2826 = t_68.new()
	local var2827 = 0
	while var2827 < buffer.len(p137) do
		local _ = nil
		local _ = nil
		local var2828, var2829, var2830 = protoModule.readTag(p137, var2827)
		local var2831 = var2828
		local var2832 = var2829
		var2827 = var2830
		
		if var2832 == protoModule.wireTypes.varint then
			if var2831 == 1 then
				local _ = nil
				local var2833, var2834 = protoModule.readVarIntI64(p137, var2827)
				var2827 = var2834
				var2826.user_id = var2833
			else
				local _ = nil
				local var2835, var2836 = protoModule.readVarInt(p137, var2827)
				local _ = var2835
				var2827 = var2836
			end
		elseif var2832 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2837, var2838 = protoModule.readVarInt(p137, var2827)
			var2827 = var2838 + var2837
		elseif var2832 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2839, var2840 = protoModule.readFixed32(p137, var2827)
			local _ = var2839
			var2827 = var2840
		elseif var2832 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2841, var2842 = protoModule.readFixed64(p137, var2827)
			local _ = var2841
			var2827 = var2842
		else
			error("Unsupported wire type: " .. var2832)
		end
	end
	return var2826
end

function t_68:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_68:jsonDecode()
	-- upvalues: t_68 (ref)
	local var2844 = t_68.new()
	
	if self.user_id ~= nil then
		var2844.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2844.user_id = self.userId
	end
	return var2844
end

t_68.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_68
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p138)
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p138 == nil or p138.event_id == nil then "" else p138.event_id
	}, t_69)
end

function t_69:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2846 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2847, var2848 = protoModule.writeTag(buff, var2846, 1, protoModule.wireTypes.lengthDelimited)
		var2847, var2848 = protoModule.writeString(var2847, var2848, self.event_id)
		buff = var2847
		var2846 = var2848
	end
	local buff_1 = buffer.create(var2846)
	buffer.copy(buff_1, 0, buff, 0, var2846)
	
	return buff_1
end

function t_69.decode(p139)
	-- upvalues: t_69 (ref), protoModule (ref)
	local var2850 = t_69.new()
	local var2851 = 0
	while var2851 < buffer.len(p139) do
		local _ = nil
		local var2852 = nil
		local var2853, var2854, var2855 = protoModule.readTag(p139, var2851)
		local var2856 = var2853
		var2852 = var2854
		var2851 = var2855
		
		if var2852 == protoModule.wireTypes.varint then
			local _ = nil
			local var2857, var2858 = protoModule.readVarInt(p139, var2851)
			local _ = var2857
			var2851 = var2858
			continue
		end
		if var2852 == protoModule.wireTypes.lengthDelimited then
			if var2856 == 1 then
				local _ = nil
				local var2859, var2860 = protoModule.readBuffer(p139, var2851)
				var2851 = var2860
				var2850.event_id = buffer.tostring(var2859)
			else
				local _ = nil
				local var2861, var2862 = protoModule.readVarInt(p139, var2851)
				var2851 = var2862 + var2861
			end
		elseif var2852 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2863, var2864 = protoModule.readFixed32(p139, var2851)
			local _ = var2863
			var2851 = var2864
		elseif var2852 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2865, var2866 = protoModule.readFixed64(p139, var2851)
			local _ = var2865
			var2851 = var2866
		else
			error("Unsupported wire type: " .. var2852)
		end
	end
	return var2850
end

function t_69:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_69:jsonDecode()
	-- upvalues: t_69 (ref)
	local var2868 = t_69.new()
	
	if self.event_id ~= nil then
		var2868.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2868.event_id = self.eventId
	end
	return var2868
end

t_69.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_69
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p140)
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p140 == nil or p140.event_id == nil then "" else p140.event_id
	}, t_70)
end

function t_70:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2870 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2871, var2872 = protoModule.writeTag(buff, var2870, 1, protoModule.wireTypes.lengthDelimited)
		var2871, var2872 = protoModule.writeString(var2871, var2872, self.event_id)
		buff = var2871
		var2870 = var2872
	end
	local buff_1 = buffer.create(var2870)
	buffer.copy(buff_1, 0, buff, 0, var2870)
	
	return buff_1
end

function t_70.decode(p141)
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2874 = t_70.new()
	local var2875 = 0
	while var2875 < buffer.len(p141) do
		local _ = nil
		local var2876 = nil
		local var2877, var2878, var2879 = protoModule.readTag(p141, var2875)
		local var2880 = var2877
		var2876 = var2878
		var2875 = var2879
		
		if var2876 == protoModule.wireTypes.varint then
			local _ = nil
			local var2881, var2882 = protoModule.readVarInt(p141, var2875)
			local _ = var2881
			var2875 = var2882
			continue
		end
		if var2876 == protoModule.wireTypes.lengthDelimited then
			if var2880 == 1 then
				local _ = nil
				local var2883, var2884 = protoModule.readBuffer(p141, var2875)
				var2875 = var2884
				var2874.event_id = buffer.tostring(var2883)
			else
				local _ = nil
				local var2885, var2886 = protoModule.readVarInt(p141, var2875)
				var2875 = var2886 + var2885
			end
		elseif var2876 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2887, var2888 = protoModule.readFixed32(p141, var2875)
			local _ = var2887
			var2875 = var2888
		elseif var2876 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2889, var2890 = protoModule.readFixed64(p141, var2875)
			local _ = var2889
			var2875 = var2890
		else
			error("Unsupported wire type: " .. var2876)
		end
	end
	return var2874
end

function t_70:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_70:jsonDecode()
	-- upvalues: t_70 (ref)
	local var2892 = t_70.new()
	
	if self.event_id ~= nil then
		var2892.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2892.event_id = self.eventId
	end
	return var2892
end

t_70.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_70
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p142)
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p142 == nil or p142.event_id == nil then "" else p142.event_id,
		universe_id = if p142 == nil or p142.universe_id == nil then "" else p142.universe_id
	}, t_71)
end

function t_71:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2894 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2895, var2896 = protoModule.writeTag(buff, var2894, 1, protoModule.wireTypes.lengthDelimited)
		var2895, var2896 = protoModule.writeString(var2895, var2896, self.event_id)
		buff = var2895
		var2894 = var2896
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2897, var2898 = protoModule.writeTag(buff, var2894, 2, protoModule.wireTypes.lengthDelimited)
		var2897, var2898 = protoModule.writeString(var2897, var2898, self.universe_id)
		buff = var2897
		var2894 = var2898
	end
	local buff_1 = buffer.create(var2894)
	buffer.copy(buff_1, 0, buff, 0, var2894)
	
	return buff_1
end

function t_71.decode(p143)
	-- upvalues: t_71 (ref), protoModule (ref)
	local var2900 = t_71.new()
	local var2901 = 0
	while var2901 < buffer.len(p143) do
		local _ = nil
		local var2902 = nil
		local var2903, var2904, var2905 = protoModule.readTag(p143, var2901)
		local var2906 = var2903
		var2902 = var2904
		var2901 = var2905
		
		if var2902 == protoModule.wireTypes.varint then
			local _ = nil
			local var2907, var2908 = protoModule.readVarInt(p143, var2901)
			local _ = var2907
			var2901 = var2908
			continue
		end
		if var2902 == protoModule.wireTypes.lengthDelimited then
			if var2906 == 1 then
				local _ = nil
				local var2909, var2910 = protoModule.readBuffer(p143, var2901)
				var2901 = var2910
				var2900.event_id = buffer.tostring(var2909)
			elseif var2906 == 2 then
				local _ = nil
				local var2911, var2912 = protoModule.readBuffer(p143, var2901)
				var2901 = var2912
				var2900.universe_id = buffer.tostring(var2911)
			else
				local _ = nil
				local var2913, var2914 = protoModule.readVarInt(p143, var2901)
				var2901 = var2914 + var2913
			end
		elseif var2902 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2915, var2916 = protoModule.readFixed32(p143, var2901)
			local _ = var2915
			var2901 = var2916
		elseif var2902 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2917, var2918 = protoModule.readFixed64(p143, var2901)
			local _ = var2917
			var2901 = var2918
		else
			error("Unsupported wire type: " .. var2902)
		end
	end
	return var2900
end

function t_71:jsonEncode()
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_71:jsonDecode()
	-- upvalues: t_71 (ref)
	local var2920 = t_71.new()
	
	if self.event_id ~= nil then
		var2920.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2920.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2920.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2920.universe_id = self.universeId
	end
	return var2920
end

t_71.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_71
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p144)
	-- upvalues: t_72 (ref)
	return setmetatable({
		entry_map = if p144 == nil or p144.entry_map == nil then {} else p144.entry_map,
		entry_order = if p144 == nil or p144.entry_order == nil then {} else p144.entry_order,
		next_page_token = if p144 == nil or p144.next_page_token == nil then "" else p144.next_page_token,
		sticky_filter_pills = if p144 == nil or p144.sticky_filter_pills == nil then nil else p144.sticky_filter_pills,
		applied_filters = if p144 == nil or p144.applied_filters == nil then "" else p144.applied_filters
	}, t_72)
end

function t_72:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2922 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2923, var2924 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2923, var2924 = protoModule.writeString(var2923, var2924, i)
			local var2925 = v:encode()
			var2924, var2926 = protoModule.writeTag(var2923, var2924, 2, protoModule.wireTypes.lengthDelimited)
			var2924, var2926 = protoModule.writeBuffer(var2924, var2926, var2925, buffer.len(var2925))
			local var2927 = var2924
			local var2928 = var2926
			local var2929, var2930 = protoModule.writeTag(buff, var2922, 1, protoModule.wireTypes.lengthDelimited)
			var2929, var2930 = protoModule.writeBuffer(var2929, var2930, var2927, var2928)
			buff = var2929
			var2922 = var2930
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2931, var2932 = protoModule.writeTag(buff, var2922, 2, protoModule.wireTypes.lengthDelimited)
			var2931, var2932 = protoModule.writeString(var2931, var2932, v)
			buff = var2931
			var2922 = var2932
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2933, var2934 = protoModule.writeTag(buff, var2922, 3, protoModule.wireTypes.lengthDelimited)
		var2933, var2934 = protoModule.writeString(var2933, var2934, self.next_page_token)
		buff = var2933
		var2922 = var2934
	end
	if self.sticky_filter_pills ~= nil then
		local var2935 = self.sticky_filter_pills:encode()
		local var2936, var2937 = protoModule.writeTag(buff, var2922, 4, protoModule.wireTypes.lengthDelimited)
		var2936, var2937 = protoModule.writeBuffer(var2936, var2937, var2935, buffer.len(var2935))
		buff = var2936
		var2922 = var2937
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2938, var2939 = protoModule.writeTag(buff, var2922, 5, protoModule.wireTypes.lengthDelimited)
		var2938, var2939 = protoModule.writeString(var2938, var2939, self.applied_filters)
		buff = var2938
		var2922 = var2939
	end
	local buff_1 = buffer.create(var2922)
	buffer.copy(buff_1, 0, buff, 0, var2922)
	
	return buff_1
end

function t_72.decode(p145)
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2941 = t_72.new()
	local var2942 = 0
	while var2942 < buffer.len(p145) do
		local _ = nil
		local var2943 = nil
		local var2944, var2945, var2946 = protoModule.readTag(p145, var2942)
		local var2947 = var2944
		var2943 = var2945
		var2942 = var2946
		
		if var2943 == protoModule.wireTypes.varint then
			local _ = nil
			local var2948, var2949 = protoModule.readVarInt(p145, var2942)
			local _ = var2948
			var2942 = var2949
			continue
		end
		if var2943 == protoModule.wireTypes.lengthDelimited then
			if var2947 == 1 then
				local _ = nil
				local var2950, var2951 = protoModule.readBuffer(p145, var2942)
				var2942 = var2951
				var2950 = t.ChartsFeedInputData_EntryMapEntry.decode(var2950)
				var2941.entry_map[var2950.key or ""] = var2950.value or t.FeedEntry.new()
			elseif var2947 == 2 then
				local _ = nil
				local var2952, var2953 = protoModule.readBuffer(p145, var2942)
				var2942 = var2953
				table.insert(var2941.entry_order, buffer.tostring(var2952))
			elseif var2947 == 3 then
				local _ = nil
				local var2954, var2955 = protoModule.readBuffer(p145, var2942)
				var2942 = var2955
				var2941.next_page_token = buffer.tostring(var2954)
			elseif var2947 == 4 then
				local _ = nil
				local var2956, var2957 = protoModule.readBuffer(p145, var2942)
				var2942 = var2957
				var2941.sticky_filter_pills = t.FilterPillsInputData.decode(var2956)
			elseif var2947 == 5 then
				local _ = nil
				local var2958, var2959 = protoModule.readBuffer(p145, var2942)
				var2942 = var2959
				var2941.applied_filters = buffer.tostring(var2958)
			else
				local _ = nil
				local var2960, var2961 = protoModule.readVarInt(p145, var2942)
				var2942 = var2961 + var2960
			end
		elseif var2943 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2962, var2963 = protoModule.readFixed32(p145, var2942)
			local _ = var2962
			var2942 = var2963
		elseif var2943 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2964, var2965 = protoModule.readFixed64(p145, var2942)
			local _ = var2964
			var2942 = var2965
		else
			error("Unsupported wire type: " .. var2943)
		end
	end
	return var2941
end

function t_72:jsonEncode()
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

function t_72:jsonDecode()
	-- upvalues: t_72 (ref), t (ref)
	local var2969 = t_72.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2969.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2969.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2969.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2969.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2969.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2969.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2969.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2969.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2969.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2969.applied_filters = self.appliedFilters
	end
	return var2969
end

t_72.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_72
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p146)
	-- upvalues: t_73 (ref)
	return setmetatable({
		key = if p146 == nil or p146.key == nil then "" else p146.key,
		value = if p146 == nil or p146.value == nil then nil else p146.value
	}, t_73)
end

function t_73:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2975 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2976, var2977 = protoModule.writeTag(buff, var2975, 1, protoModule.wireTypes.lengthDelimited)
		var2976, var2977 = protoModule.writeString(var2976, var2977, self.key)
		buff = var2976
		var2975 = var2977
	end
	if self.value ~= nil then
		local var2978 = self.value:encode()
		local var2979, var2980 = protoModule.writeTag(buff, var2975, 2, protoModule.wireTypes.lengthDelimited)
		var2979, var2980 = protoModule.writeBuffer(var2979, var2980, var2978, buffer.len(var2978))
		buff = var2979
		var2975 = var2980
	end
	local buff_1 = buffer.create(var2975)
	buffer.copy(buff_1, 0, buff, 0, var2975)
	
	return buff_1
end

function t_73.decode(p147)
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2982 = t_73.new()
	local var2983 = 0
	while var2983 < buffer.len(p147) do
		local _ = nil
		local var2984 = nil
		local var2985, var2986, var2987 = protoModule.readTag(p147, var2983)
		local var2988 = var2985
		var2984 = var2986
		var2983 = var2987
		
		if var2984 == protoModule.wireTypes.varint then
			local _ = nil
			local var2989, var2990 = protoModule.readVarInt(p147, var2983)
			local _ = var2989
			var2983 = var2990
			continue
		end
		if var2984 == protoModule.wireTypes.lengthDelimited then
			if var2988 == 1 then
				local _ = nil
				local var2991, var2992 = protoModule.readBuffer(p147, var2983)
				var2983 = var2992
				var2982.key = buffer.tostring(var2991)
			elseif var2988 == 2 then
				local _ = nil
				local var2993, var2994 = protoModule.readBuffer(p147, var2983)
				var2983 = var2994
				var2982.value = t.FeedEntry.decode(var2993)
			else
				local _ = nil
				local var2995, var2996 = protoModule.readVarInt(p147, var2983)
				var2983 = var2996 + var2995
			end
		elseif var2984 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2997, var2998 = protoModule.readFixed32(p147, var2983)
			local _ = var2997
			var2983 = var2998
		elseif var2984 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2999, var3000 = protoModule.readFixed64(p147, var2983)
			local _ = var2999
			var2983 = var3000
		else
			error("Unsupported wire type: " .. var2984)
		end
	end
	return var2982
end

function t_73:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_73:jsonDecode()
	-- upvalues: t_73 (ref), t (ref)
	local var3002 = t_73.new()
	
	if self.key ~= nil then
		var3002.key = self.key
	end
	if self.value ~= nil then
		var3002.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3002
end

t_73.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_73
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p148)
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

function t_74:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3004 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var3005 = v:encode()
			local var3006, var3007 = protoModule.writeTag(buff, var3004, 1, protoModule.wireTypes.lengthDelimited)
			var3006, var3007 = protoModule.writeBuffer(var3006, var3007, var3005, buffer.len(var3005))
			buff = var3006
			var3004 = var3007
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3008, var3009 = protoModule.writeTag(buff, var3004, 2, protoModule.wireTypes.lengthDelimited)
		var3008, var3009 = protoModule.writeString(var3008, var3009, self.sort_id)
		buff = var3008
		var3004 = var3009
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var3010, var3011 = protoModule.writeTag(buff, var3004, 3, protoModule.wireTypes.varint)
		var3010, var3011 = protoModule.writeVarInt(var3010, var3011, self.secondary_sort_id)
		buff = var3010
		var3004 = var3011
	end
	if self.title ~= nil and self.title ~= "" then
		local var3012, var3013 = protoModule.writeTag(buff, var3004, 4, protoModule.wireTypes.lengthDelimited)
		var3012, var3013 = protoModule.writeString(var3012, var3013, self.title)
		buff = var3012
		var3004 = var3013
	end
	if self.primary_sort_id ~= nil then
		local var3014, var3015 = protoModule.writeTag(buff, var3004, 5, protoModule.wireTypes.varint)
		var3014, var3015 = protoModule.writeVarInt(var3014, var3015, self.primary_sort_id)
		buff = var3014
		var3004 = var3015
	end
	if self.applied_filters ~= nil then
		local var3016, var3017 = protoModule.writeTag(buff, var3004, 6, protoModule.wireTypes.lengthDelimited)
		var3016, var3017 = protoModule.writeString(var3016, var3017, self.applied_filters)
		buff = var3016
		var3004 = var3017
	end
	local buff_1 = buffer.create(var3004)
	buffer.copy(buff_1, 0, buff, 0, var3004)
	
	return buff_1
end

function t_74.decode(p149)
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var3019 = t_74.new()
	local var3020 = 0
	while var3020 < buffer.len(p149) do
		local _ = nil
		local var3021 = nil
		local var3022, var3023, var3024 = protoModule.readTag(p149, var3020)
		local var3025 = var3022
		var3021 = var3023
		var3020 = var3024
		
		if var3021 == protoModule.wireTypes.varint then
			if var3025 == 3 then
				local _ = nil
				local var3026, var3027 = protoModule.readVarIntI32(p149, var3020)
				var3020 = var3027
				var3019.secondary_sort_id = var3026
			elseif var3025 == 5 then
				local _ = nil
				local var3028, var3029 = protoModule.readVarIntI32(p149, var3020)
				var3020 = var3029
				var3019.primary_sort_id = var3028
			else
				local _ = nil
				local var3030, var3031 = protoModule.readVarInt(p149, var3020)
				local _ = var3030
				var3020 = var3031
			end
		end
		if var3021 == protoModule.wireTypes.lengthDelimited then
			if var3025 == 1 then
				local _ = nil
				local var3032, var3033 = protoModule.readBuffer(p149, var3020)
				var3020 = var3033
				table.insert(var3019.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var3032))
			elseif var3025 == 2 then
				local _ = nil
				local var3034, var3035 = protoModule.readBuffer(p149, var3020)
				var3020 = var3035
				var3019.sort_id = buffer.tostring(var3034)
			elseif var3025 == 4 then
				local _ = nil
				local var3036, var3037 = protoModule.readBuffer(p149, var3020)
				var3020 = var3037
				var3019.title = buffer.tostring(var3036)
			elseif var3025 == 6 then
				local _ = nil
				local var3038, var3039 = protoModule.readBuffer(p149, var3020)
				var3020 = var3039
				var3019.applied_filters = buffer.tostring(var3038)
			else
				local _ = nil
				local var3040, var3041 = protoModule.readVarInt(p149, var3020)
				var3020 = var3041 + var3040
			end
		elseif var3021 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3042, var3043 = protoModule.readFixed32(p149, var3020)
			local _ = var3042
			var3020 = var3043
		elseif var3021 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3044, var3045 = protoModule.readFixed64(p149, var3020)
			local _ = var3044
			var3020 = var3045
		else
			error("Unsupported wire type: " .. var3021)
		end
	end
	return var3019
end

function t_74:jsonEncode()
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

function t_74:jsonDecode()
	-- upvalues: t_74 (ref), t (ref)
	local var3048 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var3048.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var3048.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var3048.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3048.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var3048.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var3048.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var3048.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var3048.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var3048.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var3048.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var3048.applied_filters = self.appliedFilters
	end
	return var3048
end

t_74.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_74
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p150)
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

function t_75:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3052 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var3053, var3054 = protoModule.writeTag(buff, var3052, 1, protoModule.wireTypes.lengthDelimited)
		var3053, var3054 = protoModule.writeString(var3053, var3054, self.filter_id)
		buff = var3053
		var3052 = var3054
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3055, var3056 = protoModule.writeTag(buff, var3052, 2, protoModule.wireTypes.lengthDelimited)
		var3055, var3056 = protoModule.writeString(var3055, var3056, self.display_name)
		buff = var3055
		var3052 = var3056
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3057 = v:encode()
			local var3058, var3059 = protoModule.writeTag(buff, var3052, 3, protoModule.wireTypes.lengthDelimited)
			var3058, var3059 = protoModule.writeBuffer(var3058, var3059, var3057, buffer.len(var3057))
			buff = var3058
			var3052 = var3059
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var3060, var3061 = protoModule.writeTag(buff, var3052, 4, protoModule.wireTypes.lengthDelimited)
		var3060, var3061 = protoModule.writeString(var3060, var3061, self.default_option_id)
		buff = var3060
		var3052 = var3061
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var3062, var3063 = protoModule.writeTag(buff, var3052, 5, protoModule.wireTypes.lengthDelimited)
		var3062, var3063 = protoModule.writeString(var3062, var3063, self.selected_option_id)
		buff = var3062
		var3052 = var3063
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var3064, var3065 = protoModule.writeTag(buff, var3052, 6, protoModule.wireTypes.lengthDelimited)
		var3064, var3065 = protoModule.writeString(var3064, var3065, self.filter_type)
		buff = var3064
		var3052 = var3065
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var3066, var3067 = protoModule.writeTag(buff, var3052, 7, protoModule.wireTypes.lengthDelimited)
			var3066, var3067 = protoModule.writeString(var3066, var3067, v)
			buff = var3066
			var3052 = var3067
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var3068, var3069 = protoModule.writeTag(buff, var3052, 8, protoModule.wireTypes.lengthDelimited)
		var3068, var3069 = protoModule.writeString(var3068, var3069, self.info_text)
		buff = var3068
		var3052 = var3069
	end
	local buff_1 = buffer.create(var3052)
	buffer.copy(buff_1, 0, buff, 0, var3052)
	
	return buff_1
end

function t_75.decode(p151)
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var3071 = t_75.new()
	local var3072 = 0
	while var3072 < buffer.len(p151) do
		local _ = nil
		local var3073 = nil
		local var3074, var3075, var3076 = protoModule.readTag(p151, var3072)
		local var3077 = var3074
		var3073 = var3075
		var3072 = var3076
		
		if var3073 == protoModule.wireTypes.varint then
			local _ = nil
			local var3078, var3079 = protoModule.readVarInt(p151, var3072)
			local _ = var3078
			var3072 = var3079
			continue
		end
		if var3073 == protoModule.wireTypes.lengthDelimited then
			if var3077 == 1 then
				local _ = nil
				local var3080, var3081 = protoModule.readBuffer(p151, var3072)
				var3072 = var3081
				var3071.filter_id = buffer.tostring(var3080)
			elseif var3077 == 2 then
				local _ = nil
				local var3082, var3083 = protoModule.readBuffer(p151, var3072)
				var3072 = var3083
				var3071.display_name = buffer.tostring(var3082)
			elseif var3077 == 3 then
				local _ = nil
				local var3084, var3085 = protoModule.readBuffer(p151, var3072)
				var3072 = var3085
				table.insert(var3071.options, t.FilterPillsInputData_FilterOption.decode(var3084))
			elseif var3077 == 4 then
				local _ = nil
				local var3086, var3087 = protoModule.readBuffer(p151, var3072)
				var3072 = var3087
				var3071.default_option_id = buffer.tostring(var3086)
			elseif var3077 == 5 then
				local _ = nil
				local var3088, var3089 = protoModule.readBuffer(p151, var3072)
				var3072 = var3089
				var3071.selected_option_id = buffer.tostring(var3088)
			elseif var3077 == 6 then
				local _ = nil
				local var3090, var3091 = protoModule.readBuffer(p151, var3072)
				var3072 = var3091
				var3071.filter_type = buffer.tostring(var3090)
			elseif var3077 == 7 then
				local _ = nil
				local var3092, var3093 = protoModule.readBuffer(p151, var3072)
				var3072 = var3093
				table.insert(var3071.inactive_option_ids, buffer.tostring(var3092))
			elseif var3077 == 8 then
				local _ = nil
				local var3094, var3095 = protoModule.readBuffer(p151, var3072)
				var3072 = var3095
				var3071.info_text = buffer.tostring(var3094)
			else
				local _ = nil
				local var3096, var3097 = protoModule.readVarInt(p151, var3072)
				var3072 = var3097 + var3096
			end
		elseif var3073 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3098, var3099 = protoModule.readFixed32(p151, var3072)
			local _ = var3098
			var3072 = var3099
		elseif var3073 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3100, var3101 = protoModule.readFixed64(p151, var3072)
			local _ = var3100
			var3072 = var3101
		else
			error("Unsupported wire type: " .. var3073)
		end
	end
	return var3071
end

function t_75:jsonEncode()
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

function t_75:jsonDecode()
	-- upvalues: t_75 (ref), t (ref)
	local var3105 = t_75.new()
	
	if self.filter_id ~= nil then
		var3105.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var3105.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var3105.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3105.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var3105.options = t_1
	end
	if self.default_option_id ~= nil then
		var3105.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var3105.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var3105.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var3105.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var3105.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var3105.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var3105.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var3105.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var3105.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var3105.info_text = self.infoText
	end
	return var3105
end

t_75.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_75
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p152)
	-- upvalues: t_76 (ref)
	return setmetatable({
		option_id = if p152 == nil or p152.option_id == nil then "" else p152.option_id,
		display_name = if p152 == nil or p152.display_name == nil then "" else p152.display_name,
		option_context_tag = if p152 == nil or p152.option_context_tag == nil then "" else p152.option_context_tag
	}, t_76)
end

function t_76:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3110 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var3111, var3112 = protoModule.writeTag(buff, var3110, 1, protoModule.wireTypes.lengthDelimited)
		var3111, var3112 = protoModule.writeString(var3111, var3112, self.option_id)
		buff = var3111
		var3110 = var3112
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3113, var3114 = protoModule.writeTag(buff, var3110, 2, protoModule.wireTypes.lengthDelimited)
		var3113, var3114 = protoModule.writeString(var3113, var3114, self.display_name)
		buff = var3113
		var3110 = var3114
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var3115, var3116 = protoModule.writeTag(buff, var3110, 3, protoModule.wireTypes.lengthDelimited)
		var3115, var3116 = protoModule.writeString(var3115, var3116, self.option_context_tag)
		buff = var3115
		var3110 = var3116
	end
	local buff_1 = buffer.create(var3110)
	buffer.copy(buff_1, 0, buff, 0, var3110)
	
	return buff_1
end

function t_76.decode(p153)
	-- upvalues: t_76 (ref), protoModule (ref)
	local var3118 = t_76.new()
	local var3119 = 0
	while var3119 < buffer.len(p153) do
		local _ = nil
		local var3120 = nil
		local var3121, var3122, var3123 = protoModule.readTag(p153, var3119)
		local var3124 = var3121
		var3120 = var3122
		var3119 = var3123
		
		if var3120 == protoModule.wireTypes.varint then
			local _ = nil
			local var3125, var3126 = protoModule.readVarInt(p153, var3119)
			local _ = var3125
			var3119 = var3126
			continue
		end
		if var3120 == protoModule.wireTypes.lengthDelimited then
			if var3124 == 1 then
				local _ = nil
				local var3127, var3128 = protoModule.readBuffer(p153, var3119)
				var3119 = var3128
				var3118.option_id = buffer.tostring(var3127)
			elseif var3124 == 2 then
				local _ = nil
				local var3129, var3130 = protoModule.readBuffer(p153, var3119)
				var3119 = var3130
				var3118.display_name = buffer.tostring(var3129)
			elseif var3124 == 3 then
				local _ = nil
				local var3131, var3132 = protoModule.readBuffer(p153, var3119)
				var3119 = var3132
				var3118.option_context_tag = buffer.tostring(var3131)
			else
				local _ = nil
				local var3133, var3134 = protoModule.readVarInt(p153, var3119)
				var3119 = var3134 + var3133
			end
		elseif var3120 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3135, var3136 = protoModule.readFixed32(p153, var3119)
			local _ = var3135
			var3119 = var3136
		elseif var3120 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3137, var3138 = protoModule.readFixed64(p153, var3119)
			local _ = var3137
			var3119 = var3138
		else
			error("Unsupported wire type: " .. var3120)
		end
	end
	return var3118
end

function t_76:jsonEncode()
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

function t_76:jsonDecode()
	-- upvalues: t_76 (ref)
	local var3140 = t_76.new()
	
	if self.option_id ~= nil then
		var3140.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var3140.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var3140.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3140.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var3140.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var3140.option_context_tag = self.optionContextTag
	end
	return var3140
end

t_76.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_76
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p154)
	-- upvalues: t_77 (ref)
	return setmetatable({
		sort_options = if p154 == nil or p154.sort_options == nil then {} else p154.sort_options,
		selected_sort_id = if p154 == nil or p154.selected_sort_id == nil then "" else p154.selected_sort_id
	}, t_77)
end

function t_77:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3142 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var3143 = v:encode()
			local var3144, var3145 = protoModule.writeTag(buff, var3142, 1, protoModule.wireTypes.lengthDelimited)
			var3144, var3145 = protoModule.writeBuffer(var3144, var3145, var3143, buffer.len(var3143))
			buff = var3144
			var3142 = var3145
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var3146, var3147 = protoModule.writeTag(buff, var3142, 2, protoModule.wireTypes.lengthDelimited)
		var3146, var3147 = protoModule.writeString(var3146, var3147, self.selected_sort_id)
		buff = var3146
		var3142 = var3147
	end
	local buff_1 = buffer.create(var3142)
	buffer.copy(buff_1, 0, buff, 0, var3142)
	
	return buff_1
end

function t_77.decode(p155)
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var3149 = t_77.new()
	local var3150 = 0
	while var3150 < buffer.len(p155) do
		local _ = nil
		local var3151 = nil
		local var3152, var3153, var3154 = protoModule.readTag(p155, var3150)
		local var3155 = var3152
		var3151 = var3153
		var3150 = var3154
		
		if var3151 == protoModule.wireTypes.varint then
			local _ = nil
			local var3156, var3157 = protoModule.readVarInt(p155, var3150)
			local _ = var3156
			var3150 = var3157
			continue
		end
		if var3151 == protoModule.wireTypes.lengthDelimited then
			if var3155 == 1 then
				local _ = nil
				local var3158, var3159 = protoModule.readBuffer(p155, var3150)
				var3150 = var3159
				table.insert(var3149.sort_options, t.SortSelectorInputData_SortOption.decode(var3158))
			elseif var3155 == 2 then
				local _ = nil
				local var3160, var3161 = protoModule.readBuffer(p155, var3150)
				var3150 = var3161
				var3149.selected_sort_id = buffer.tostring(var3160)
			else
				local _ = nil
				local var3162, var3163 = protoModule.readVarInt(p155, var3150)
				var3150 = var3163 + var3162
			end
		elseif var3151 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3164, var3165 = protoModule.readFixed32(p155, var3150)
			local _ = var3164
			var3150 = var3165
		elseif var3151 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3166, var3167 = protoModule.readFixed64(p155, var3150)
			local _ = var3166
			var3150 = var3167
		else
			error("Unsupported wire type: " .. var3151)
		end
	end
	return var3149
end

function t_77:jsonEncode()
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

function t_77:jsonDecode()
	-- upvalues: t_77 (ref), t (ref)
	local var3170 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3170.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3170.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var3170.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var3170.selected_sort_id = self.selectedSortId
	end
	return var3170
end

t_77.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_77
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p156)
	-- upvalues: t_78 (ref)
	return setmetatable({
		sort_id = if p156 == nil or p156.sort_id == nil then "" else p156.sort_id,
		display_name = if p156 == nil or p156.display_name == nil then "" else p156.display_name,
		content_type = if p156 == nil or p156.content_type == nil then "" else p156.content_type
	}, t_78)
end

function t_78:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3174 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3175, var3176 = protoModule.writeTag(buff, var3174, 1, protoModule.wireTypes.lengthDelimited)
		var3175, var3176 = protoModule.writeString(var3175, var3176, self.sort_id)
		buff = var3175
		var3174 = var3176
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3177, var3178 = protoModule.writeTag(buff, var3174, 2, protoModule.wireTypes.lengthDelimited)
		var3177, var3178 = protoModule.writeString(var3177, var3178, self.display_name)
		buff = var3177
		var3174 = var3178
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var3179, var3180 = protoModule.writeTag(buff, var3174, 3, protoModule.wireTypes.lengthDelimited)
		var3179, var3180 = protoModule.writeString(var3179, var3180, self.content_type)
		buff = var3179
		var3174 = var3180
	end
	local buff_1 = buffer.create(var3174)
	buffer.copy(buff_1, 0, buff, 0, var3174)
	
	return buff_1
end

function t_78.decode(p157)
	-- upvalues: t_78 (ref), protoModule (ref)
	local var3182 = t_78.new()
	local var3183 = 0
	while var3183 < buffer.len(p157) do
		local _ = nil
		local var3184 = nil
		local var3185, var3186, var3187 = protoModule.readTag(p157, var3183)
		local var3188 = var3185
		var3184 = var3186
		var3183 = var3187
		
		if var3184 == protoModule.wireTypes.varint then
			local _ = nil
			local var3189, var3190 = protoModule.readVarInt(p157, var3183)
			local _ = var3189
			var3183 = var3190
			continue
		end
		if var3184 == protoModule.wireTypes.lengthDelimited then
			if var3188 == 1 then
				local _ = nil
				local var3191, var3192 = protoModule.readBuffer(p157, var3183)
				var3183 = var3192
				var3182.sort_id = buffer.tostring(var3191)
			elseif var3188 == 2 then
				local _ = nil
				local var3193, var3194 = protoModule.readBuffer(p157, var3183)
				var3183 = var3194
				var3182.display_name = buffer.tostring(var3193)
			elseif var3188 == 3 then
				local _ = nil
				local var3195, var3196 = protoModule.readBuffer(p157, var3183)
				var3183 = var3196
				var3182.content_type = buffer.tostring(var3195)
			else
				local _ = nil
				local var3197, var3198 = protoModule.readVarInt(p157, var3183)
				var3183 = var3198 + var3197
			end
		elseif var3184 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3199, var3200 = protoModule.readFixed32(p157, var3183)
			local _ = var3199
			var3183 = var3200
		elseif var3184 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3201, var3202 = protoModule.readFixed64(p157, var3183)
			local _ = var3201
			var3183 = var3202
		else
			error("Unsupported wire type: " .. var3184)
		end
	end
	return var3182
end

function t_78:jsonEncode()
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

function t_78:jsonDecode()
	-- upvalues: t_78 (ref)
	local var3204 = t_78.new()
	
	if self.sort_id ~= nil then
		var3204.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3204.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var3204.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3204.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var3204.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var3204.content_type = self.contentType
	end
	return var3204
end

t_78.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_78
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p158)
	-- upvalues: t_79 (ref)
	return setmetatable({
		selected_option = if p158 == nil or p158.selected_option == nil then "" else p158.selected_option,
		options = if p158 == nil or p158.options == nil then {} else p158.options,
		experience_carousel = if p158 == nil or p158.experience_carousel == nil then nil else p158.experience_carousel
	}, t_79)
end

function t_79:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3206 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3207, var3208 = protoModule.writeTag(buff, var3206, 1, protoModule.wireTypes.lengthDelimited)
		var3207, var3208 = protoModule.writeString(var3207, var3208, self.selected_option)
		buff = var3207
		var3206 = var3208
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3209 = v:encode()
			local var3210, var3211 = protoModule.writeTag(buff, var3206, 2, protoModule.wireTypes.lengthDelimited)
			var3210, var3211 = protoModule.writeBuffer(var3210, var3211, var3209, buffer.len(var3209))
			buff = var3210
			var3206 = var3211
		end
	end
	if self.experience_carousel ~= nil then
		local var3212 = self.experience_carousel:encode()
		local var3213, var3214 = protoModule.writeTag(buff, var3206, 3, protoModule.wireTypes.lengthDelimited)
		var3213, var3214 = protoModule.writeBuffer(var3213, var3214, var3212, buffer.len(var3212))
		buff = var3213
		var3206 = var3214
	end
	local buff_1 = buffer.create(var3206)
	buffer.copy(buff_1, 0, buff, 0, var3206)
	
	return buff_1
end

function t_79.decode(p159)
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var3216 = t_79.new()
	local var3217 = 0
	while var3217 < buffer.len(p159) do
		local _ = nil
		local var3218 = nil
		local var3219, var3220, var3221 = protoModule.readTag(p159, var3217)
		local var3222 = var3219
		var3218 = var3220
		var3217 = var3221
		
		if var3218 == protoModule.wireTypes.varint then
			local _ = nil
			local var3223, var3224 = protoModule.readVarInt(p159, var3217)
			local _ = var3223
			var3217 = var3224
			continue
		end
		if var3218 == protoModule.wireTypes.lengthDelimited then
			if var3222 == 1 then
				local _ = nil
				local var3225, var3226 = protoModule.readBuffer(p159, var3217)
				var3217 = var3226
				var3216.selected_option = buffer.tostring(var3225)
			elseif var3222 == 2 then
				local _ = nil
				local var3227, var3228 = protoModule.readBuffer(p159, var3217)
				var3217 = var3228
				table.insert(var3216.options, t.SelectorOption.decode(var3227))
			elseif var3222 == 3 then
				local _ = nil
				local var3229, var3230 = protoModule.readBuffer(p159, var3217)
				var3217 = var3230
				var3216.experience_carousel = t.ExperienceCarouselInputData.decode(var3229)
			else
				local _ = nil
				local var3231, var3232 = protoModule.readVarInt(p159, var3217)
				var3217 = var3232 + var3231
			end
		elseif var3218 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3233, var3234 = protoModule.readFixed32(p159, var3217)
			local _ = var3233
			var3217 = var3234
		elseif var3218 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3235, var3236 = protoModule.readFixed64(p159, var3217)
			local _ = var3235
			var3217 = var3236
		else
			error("Unsupported wire type: " .. var3218)
		end
	end
	return var3216
end

function t_79:jsonEncode()
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

function t_79:jsonDecode()
	-- upvalues: t_79 (ref), t (ref)
	local var3239 = t_79.new()
	
	if self.selected_option ~= nil then
		var3239.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3239.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3239.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3239.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3239.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var3239
end

t_79.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_79
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p160)
	-- upvalues: t_80 (ref)
	return setmetatable({
		id = if p160 == nil or p160.id == nil then "" else p160.id,
		preview_rows = if p160 == nil or p160.preview_rows == nil then 0 else p160.preview_rows,
		widget_style = if p160 == nil or p160.widget_style == nil then nil else p160.widget_style,
		see_all_button = if p160 == nil or p160.see_all_button == nil then false else p160.see_all_button,
		information_popover_text = if p160 == nil or p160.information_popover_text == nil then "" else p160.information_popover_text
	}, t_80)
end

function t_80:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3242 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3243, var3244 = protoModule.writeTag(buff, var3242, 1, protoModule.wireTypes.lengthDelimited)
		var3243, var3244 = protoModule.writeString(var3243, var3244, self.id)
		buff = var3243
		var3242 = var3244
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var3245, var3246 = protoModule.writeTag(buff, var3242, 4, protoModule.wireTypes.varint)
		var3245, var3246 = protoModule.writeVarInt(var3245, var3246, self.preview_rows)
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
		local var3250, var3251 = protoModule.writeTag(buff, var3242, 5, protoModule.wireTypes.varint)
		var3250, var3251 = protoModule.writeVarInt(var3250, var3251, if self.see_all_button then 1 else 0)
		buff = var3250
		var3242 = var3251
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3252, var3253 = protoModule.writeTag(buff, var3242, 6, protoModule.wireTypes.lengthDelimited)
		var3252, var3253 = protoModule.writeString(var3252, var3253, self.information_popover_text)
		buff = var3252
		var3242 = var3253
	end
	local buff_1 = buffer.create(var3242)
	buffer.copy(buff_1, 0, buff, 0, var3242)
	
	return buff_1
end

function t_80.decode(p161)
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var3255 = t_80.new()
	local var3256 = 0
	while var3256 < buffer.len(p161) do
		local _ = nil
		local var3257 = nil
		local var3258, var3259, var3260 = protoModule.readTag(p161, var3256)
		local var3261 = var3258
		var3257 = var3259
		var3256 = var3260
		
		if var3257 == protoModule.wireTypes.varint then
			if var3261 == 4 then
				local _ = nil
				local var3262, var3263 = protoModule.readVarIntI64(p161, var3256)
				var3256 = var3263
				var3255.preview_rows = var3262
			elseif var3261 == 5 then
				local _ = nil
				local var3264, var3265 = protoModule.readVarInt(p161, var3256)
				var3256 = var3265
				var3255.see_all_button = var3264 ~= 0
			else
				local _ = nil
				local var3266, var3267 = protoModule.readVarInt(p161, var3256)
				local _ = var3266
				var3256 = var3267
			end
		end
		if var3257 == protoModule.wireTypes.lengthDelimited then
			if var3261 == 1 then
				local _ = nil
				local var3268, var3269 = protoModule.readBuffer(p161, var3256)
				var3256 = var3269
				var3255.id = buffer.tostring(var3268)
			elseif var3261 == 3 then
				local _ = nil
				local var3270, var3271 = protoModule.readBuffer(p161, var3256)
				var3256 = var3271
				var3255.widget_style = t.WidgetStyleData.decode(var3270)
			elseif var3261 == 6 then
				local _ = nil
				local var3272, var3273 = protoModule.readBuffer(p161, var3256)
				var3256 = var3273
				var3255.information_popover_text = buffer.tostring(var3272)
			else
				local _ = nil
				local var3274, var3275 = protoModule.readVarInt(p161, var3256)
				var3256 = var3275 + var3274
			end
		elseif var3257 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3276, var3277 = protoModule.readFixed32(p161, var3256)
			local _ = var3276
			var3256 = var3277
		elseif var3257 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3278, var3279 = protoModule.readFixed64(p161, var3256)
			local _ = var3278
			var3256 = var3279
		else
			error("Unsupported wire type: " .. var3257)
		end
	end
	return var3255
end

function t_80:jsonEncode()
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

function t_80:jsonDecode()
	-- upvalues: t_80 (ref), t (ref)
	local var3281 = t_80.new()
	
	if self.id ~= nil then
		var3281.id = self.id
	end
	if self.preview_rows ~= nil then
		var3281.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var3281.preview_rows = self.previewRows
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

t_80.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p162)
	-- upvalues: t_81 (ref)
	return setmetatable({
		id = if p162 == nil or p162.id == nil then "" else p162.id,
		num_items_to_show = if p162 == nil or p162.num_items_to_show == nil then 0 else p162.num_items_to_show,
		widget_style = if p162 == nil or p162.widget_style == nil then nil else p162.widget_style,
		see_all_button = if p162 == nil or p162.see_all_button == nil then false else p162.see_all_button,
		information_popover_text = if p162 == nil or p162.information_popover_text == nil then "" else p162.information_popover_text
	}, t_81)
end

function t_81:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3283 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3284, var3285 = protoModule.writeTag(buff, var3283, 1, protoModule.wireTypes.lengthDelimited)
		var3284, var3285 = protoModule.writeString(var3284, var3285, self.id)
		buff = var3284
		var3283 = var3285
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var3286, var3287 = protoModule.writeTag(buff, var3283, 5, protoModule.wireTypes.varint)
		var3286, var3287 = protoModule.writeVarInt(var3286, var3287, self.num_items_to_show)
		buff = var3286
		var3283 = var3287
	end
	if self.widget_style ~= nil then
		local var3288 = self.widget_style:encode()
		local var3289, var3290 = protoModule.writeTag(buff, var3283, 3, protoModule.wireTypes.lengthDelimited)
		var3289, var3290 = protoModule.writeBuffer(var3289, var3290, var3288, buffer.len(var3288))
		buff = var3289
		var3283 = var3290
	end
	if self.see_all_button then
		local var3291, var3292 = protoModule.writeTag(buff, var3283, 6, protoModule.wireTypes.varint)
		var3291, var3292 = protoModule.writeVarInt(var3291, var3292, if self.see_all_button then 1 else 0)
		buff = var3291
		var3283 = var3292
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3293, var3294 = protoModule.writeTag(buff, var3283, 7, protoModule.wireTypes.lengthDelimited)
		var3293, var3294 = protoModule.writeString(var3293, var3294, self.information_popover_text)
		buff = var3293
		var3283 = var3294
	end
	local buff_1 = buffer.create(var3283)
	buffer.copy(buff_1, 0, buff, 0, var3283)
	
	return buff_1
end

function t_81.decode(p163)
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var3296 = t_81.new()
	local var3297 = 0
	while var3297 < buffer.len(p163) do
		local _ = nil
		local var3298 = nil
		local var3299, var3300, var3301 = protoModule.readTag(p163, var3297)
		local var3302 = var3299
		var3298 = var3300
		var3297 = var3301
		
		if var3298 == protoModule.wireTypes.varint then
			if var3302 == 5 then
				local _ = nil
				local var3303, var3304 = protoModule.readVarIntI64(p163, var3297)
				var3297 = var3304
				var3296.num_items_to_show = var3303
			elseif var3302 == 6 then
				local _ = nil
				local var3305, var3306 = protoModule.readVarInt(p163, var3297)
				var3297 = var3306
				var3296.see_all_button = var3305 ~= 0
			else
				local _ = nil
				local var3307, var3308 = protoModule.readVarInt(p163, var3297)
				local _ = var3307
				var3297 = var3308
			end
		end
		if var3298 == protoModule.wireTypes.lengthDelimited then
			if var3302 == 1 then
				local _ = nil
				local var3309, var3310 = protoModule.readBuffer(p163, var3297)
				var3297 = var3310
				var3296.id = buffer.tostring(var3309)
			elseif var3302 == 3 then
				local _ = nil
				local var3311, var3312 = protoModule.readBuffer(p163, var3297)
				var3297 = var3312
				var3296.widget_style = t.WidgetStyleData.decode(var3311)
			elseif var3302 == 7 then
				local _ = nil
				local var3313, var3314 = protoModule.readBuffer(p163, var3297)
				var3297 = var3314
				var3296.information_popover_text = buffer.tostring(var3313)
			else
				local _ = nil
				local var3315, var3316 = protoModule.readVarInt(p163, var3297)
				var3297 = var3316 + var3315
			end
		elseif var3298 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3317, var3318 = protoModule.readFixed32(p163, var3297)
			local _ = var3317
			var3297 = var3318
		elseif var3298 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3319, var3320 = protoModule.readFixed64(p163, var3297)
			local _ = var3319
			var3297 = var3320
		else
			error("Unsupported wire type: " .. var3298)
		end
	end
	return var3296
end

function t_81:jsonEncode()
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

function t_81:jsonDecode()
	-- upvalues: t_81 (ref), t (ref)
	local var3322 = t_81.new()
	
	if self.id ~= nil then
		var3322.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var3322.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var3322.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var3322.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3322.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3322.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3322.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3322.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3322.information_popover_text = self.informationPopoverText
	end
	return var3322
end

t_81.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_81
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p164)
	-- upvalues: t_82 (ref)
	return setmetatable({
		background_layers = if p164 == nil or p164.background_layers == nil then {} else p164.background_layers
	}, t_82)
end

function t_82:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3324 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var3325 = v:encode()
			local var3326, var3327 = protoModule.writeTag(buff, var3324, 1, protoModule.wireTypes.lengthDelimited)
			var3326, var3327 = protoModule.writeBuffer(var3326, var3327, var3325, buffer.len(var3325))
			buff = var3326
			var3324 = var3327
		end
	end
	local buff_1 = buffer.create(var3324)
	buffer.copy(buff_1, 0, buff, 0, var3324)
	
	return buff_1
end

function t_82.decode(p165)
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var3329 = t_82.new()
	local var3330 = 0
	while var3330 < buffer.len(p165) do
		local _ = nil
		local var3331 = nil
		local var3332, var3333, var3334 = protoModule.readTag(p165, var3330)
		local var3335 = var3332
		var3331 = var3333
		var3330 = var3334
		
		if var3331 == protoModule.wireTypes.varint then
			local _ = nil
			local var3336, var3337 = protoModule.readVarInt(p165, var3330)
			local _ = var3336
			var3330 = var3337
			continue
		end
		if var3331 == protoModule.wireTypes.lengthDelimited then
			if var3335 == 1 then
				local _ = nil
				local var3338, var3339 = protoModule.readBuffer(p165, var3330)
				var3330 = var3339
				table.insert(var3329.background_layers, backgroundLayerModule.BackgroundLayer.decode(var3338))
			else
				local _ = nil
				local var3340, var3341 = protoModule.readVarInt(p165, var3330)
				var3330 = var3341 + var3340
			end
		elseif var3331 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3342, var3343 = protoModule.readFixed32(p165, var3330)
			local _ = var3342
			var3330 = var3343
		elseif var3331 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3344, var3345 = protoModule.readFixed64(p165, var3330)
			local _ = var3344
			var3330 = var3345
		else
			error("Unsupported wire type: " .. var3331)
		end
	end
	return var3329
end

function t_82:jsonEncode()
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

function t_82:jsonDecode()
	-- upvalues: t_82 (ref), backgroundLayerModule (ref)
	local var3348 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3348.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3348.background_layers = t
	end
	return var3348
end

t_82.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_82
typeRegistryModule.default:register(t.WidgetStyleData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p166)
	-- upvalues: t_83 (ref)
	return setmetatable({
		id = if p166 == nil or p166.id == nil then "" else p166.id,
		available_until = if p166 == nil or p166.available_until == nil then "" else p166.available_until,
		widget_style = if p166 == nil or p166.widget_style == nil then nil else p166.widget_style
	}, t_83)
end

function t_83:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3352 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3353, var3354 = protoModule.writeTag(buff, var3352, 1, protoModule.wireTypes.lengthDelimited)
		var3353, var3354 = protoModule.writeString(var3353, var3354, self.id)
		buff = var3353
		var3352 = var3354
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var3355, var3356 = protoModule.writeTag(buff, var3352, 2, protoModule.wireTypes.lengthDelimited)
		var3355, var3356 = protoModule.writeString(var3355, var3356, self.available_until)
		buff = var3355
		var3352 = var3356
	end
	if self.widget_style ~= nil then
		local var3357 = self.widget_style:encode()
		local var3358, var3359 = protoModule.writeTag(buff, var3352, 3, protoModule.wireTypes.lengthDelimited)
		var3358, var3359 = protoModule.writeBuffer(var3358, var3359, var3357, buffer.len(var3357))
		buff = var3358
		var3352 = var3359
	end
	local buff_1 = buffer.create(var3352)
	buffer.copy(buff_1, 0, buff, 0, var3352)
	
	return buff_1
end

function t_83.decode(p167)
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var3361 = t_83.new()
	local var3362 = 0
	while var3362 < buffer.len(p167) do
		local _ = nil
		local var3363 = nil
		local var3364, var3365, var3366 = protoModule.readTag(p167, var3362)
		local var3367 = var3364
		var3363 = var3365
		var3362 = var3366
		
		if var3363 == protoModule.wireTypes.varint then
			local _ = nil
			local var3368, var3369 = protoModule.readVarInt(p167, var3362)
			local _ = var3368
			var3362 = var3369
			continue
		end
		if var3363 == protoModule.wireTypes.lengthDelimited then
			if var3367 == 1 then
				local _ = nil
				local var3370, var3371 = protoModule.readBuffer(p167, var3362)
				var3362 = var3371
				var3361.id = buffer.tostring(var3370)
			elseif var3367 == 2 then
				local _ = nil
				local var3372, var3373 = protoModule.readBuffer(p167, var3362)
				var3362 = var3373
				var3361.available_until = buffer.tostring(var3372)
			elseif var3367 == 3 then
				local _ = nil
				local var3374, var3375 = protoModule.readBuffer(p167, var3362)
				var3362 = var3375
				var3361.widget_style = t.WidgetStyleData.decode(var3374)
			else
				local _ = nil
				local var3376, var3377 = protoModule.readVarInt(p167, var3362)
				var3362 = var3377 + var3376
			end
		elseif var3363 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3378, var3379 = protoModule.readFixed32(p167, var3362)
			local _ = var3378
			var3362 = var3379
		elseif var3363 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3380, var3381 = protoModule.readFixed64(p167, var3362)
			local _ = var3380
			var3362 = var3381
		else
			error("Unsupported wire type: " .. var3363)
		end
	end
	return var3361
end

function t_83:jsonEncode()
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

function t_83:jsonDecode()
	-- upvalues: t_83 (ref), t (ref)
	local var3383 = t_83.new()
	
	if self.id ~= nil then
		var3383.id = self.id
	end
	if self.available_until ~= nil then
		var3383.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var3383.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var3383.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3383.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var3383
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p168)
	-- upvalues: t_84 (ref)
	return setmetatable({
		entry_map = if p168 == nil or p168.entry_map == nil then {} else p168.entry_map,
		entry_order = if p168 == nil or p168.entry_order == nil then {} else p168.entry_order
	}, t_84)
end

function t_84:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3385 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3386, var3387 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3386, var3387 = protoModule.writeString(var3386, var3387, i)
			local var3388 = v:encode()
			var3387, var3389 = protoModule.writeTag(var3386, var3387, 2, protoModule.wireTypes.lengthDelimited)
			var3387, var3389 = protoModule.writeBuffer(var3387, var3389, var3388, buffer.len(var3388))
			local var3390 = var3387
			local var3391 = var3389
			local var3392, var3393 = protoModule.writeTag(buff, var3385, 1, protoModule.wireTypes.lengthDelimited)
			var3392, var3393 = protoModule.writeBuffer(var3392, var3393, var3390, var3391)
			buff = var3392
			var3385 = var3393
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3394, var3395 = protoModule.writeTag(buff, var3385, 2, protoModule.wireTypes.lengthDelimited)
			var3394, var3395 = protoModule.writeString(var3394, var3395, v)
			buff = var3394
			var3385 = var3395
		end
	end
	local buff_1 = buffer.create(var3385)
	buffer.copy(buff_1, 0, buff, 0, var3385)
	
	return buff_1
end

function t_84.decode(p169)
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var3397 = t_84.new()
	local var3398 = 0
	while var3398 < buffer.len(p169) do
		local _ = nil
		local var3399 = nil
		local var3400, var3401, var3402 = protoModule.readTag(p169, var3398)
		local var3403 = var3400
		var3399 = var3401
		var3398 = var3402
		
		if var3399 == protoModule.wireTypes.varint then
			local _ = nil
			local var3404, var3405 = protoModule.readVarInt(p169, var3398)
			local _ = var3404
			var3398 = var3405
			continue
		end
		if var3399 == protoModule.wireTypes.lengthDelimited then
			if var3403 == 1 then
				local _ = nil
				local var3406, var3407 = protoModule.readBuffer(p169, var3398)
				var3398 = var3407
				var3406 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var3406)
				var3397.entry_map[var3406.key or ""] = var3406.value or t.FeedEntry.new()
			elseif var3403 == 2 then
				local _ = nil
				local var3408, var3409 = protoModule.readBuffer(p169, var3398)
				var3398 = var3409
				table.insert(var3397.entry_order, buffer.tostring(var3408))
			else
				local _ = nil
				local var3410, var3411 = protoModule.readVarInt(p169, var3398)
				var3398 = var3411 + var3410
			end
		elseif var3399 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3412, var3413 = protoModule.readFixed32(p169, var3398)
			local _ = var3412
			var3398 = var3413
		elseif var3399 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3414, var3415 = protoModule.readFixed64(p169, var3398)
			local _ = var3414
			var3398 = var3415
		else
			error("Unsupported wire type: " .. var3399)
		end
	end
	return var3397
end

function t_84:jsonEncode()
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

function t_84:jsonDecode()
	-- upvalues: t_84 (ref), t (ref)
	local var3419 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3419.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3419.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3419.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3419.entry_order = t_1
	end
	return var3419
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p170)
	-- upvalues: t_85 (ref)
	return setmetatable({
		key = if p170 == nil or p170.key == nil then "" else p170.key,
		value = if p170 == nil or p170.value == nil then nil else p170.value
	}, t_85)
end

function t_85:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3425 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3426, var3427 = protoModule.writeTag(buff, var3425, 1, protoModule.wireTypes.lengthDelimited)
		var3426, var3427 = protoModule.writeString(var3426, var3427, self.key)
		buff = var3426
		var3425 = var3427
	end
	if self.value ~= nil then
		local var3428 = self.value:encode()
		local var3429, var3430 = protoModule.writeTag(buff, var3425, 2, protoModule.wireTypes.lengthDelimited)
		var3429, var3430 = protoModule.writeBuffer(var3429, var3430, var3428, buffer.len(var3428))
		buff = var3429
		var3425 = var3430
	end
	local buff_1 = buffer.create(var3425)
	buffer.copy(buff_1, 0, buff, 0, var3425)
	
	return buff_1
end

function t_85.decode(p171)
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var3432 = t_85.new()
	local var3433 = 0
	while var3433 < buffer.len(p171) do
		local _ = nil
		local var3434 = nil
		local var3435, var3436, var3437 = protoModule.readTag(p171, var3433)
		local var3438 = var3435
		var3434 = var3436
		var3433 = var3437
		
		if var3434 == protoModule.wireTypes.varint then
			local _ = nil
			local var3439, var3440 = protoModule.readVarInt(p171, var3433)
			local _ = var3439
			var3433 = var3440
			continue
		end
		if var3434 == protoModule.wireTypes.lengthDelimited then
			if var3438 == 1 then
				local _ = nil
				local var3441, var3442 = protoModule.readBuffer(p171, var3433)
				var3433 = var3442
				var3432.key = buffer.tostring(var3441)
			elseif var3438 == 2 then
				local _ = nil
				local var3443, var3444 = protoModule.readBuffer(p171, var3433)
				var3433 = var3444
				var3432.value = t.FeedEntry.decode(var3443)
			else
				local _ = nil
				local var3445, var3446 = protoModule.readVarInt(p171, var3433)
				var3433 = var3446 + var3445
			end
		elseif var3434 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3447, var3448 = protoModule.readFixed32(p171, var3433)
			local _ = var3447
			var3433 = var3448
		elseif var3434 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3449, var3450 = protoModule.readFixed64(p171, var3433)
			local _ = var3449
			var3433 = var3450
		else
			error("Unsupported wire type: " .. var3434)
		end
	end
	return var3432
end

function t_85:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_85:jsonDecode()
	-- upvalues: t_85 (ref), t (ref)
	local var3452 = t_85.new()
	
	if self.key ~= nil then
		var3452.key = self.key
	end
	if self.value ~= nil then
		var3452.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3452
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p172)
	-- upvalues: t_86 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p172 == nil or p172.marketplace_catalog_category_items == nil then {} else p172.marketplace_catalog_category_items,
		active_category_id = if p172 == nil or p172.active_category_id == nil then "" else p172.active_category_id,
		active_tooltip_idx = if p172 == nil or p172.active_tooltip_idx == nil then 0 else p172.active_tooltip_idx
	}, t_86)
end

function t_86:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3454 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var3455 = v:encode()
			local var3456, var3457 = protoModule.writeTag(buff, var3454, 1, protoModule.wireTypes.lengthDelimited)
			var3456, var3457 = protoModule.writeBuffer(var3456, var3457, var3455, buffer.len(var3455))
			buff = var3456
			var3454 = var3457
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var3458, var3459 = protoModule.writeTag(buff, var3454, 2, protoModule.wireTypes.lengthDelimited)
		var3458, var3459 = protoModule.writeString(var3458, var3459, self.active_category_id)
		buff = var3458
		var3454 = var3459
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var3460, var3461 = protoModule.writeTag(buff, var3454, 3, protoModule.wireTypes.varint)
		var3460, var3461 = protoModule.writeVarInt(var3460, var3461, self.active_tooltip_idx)
		buff = var3460
		var3454 = var3461
	end
	local buff_1 = buffer.create(var3454)
	buffer.copy(buff_1, 0, buff, 0, var3454)
	
	return buff_1
end

function t_86.decode(p173)
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var3463 = t_86.new()
	local var3464 = 0
	while var3464 < buffer.len(p173) do
		local _ = nil
		local var3465 = nil
		local var3466, var3467, var3468 = protoModule.readTag(p173, var3464)
		local var3469 = var3466
		var3465 = var3467
		var3464 = var3468
		
		if var3465 == protoModule.wireTypes.varint then
			if var3469 == 3 then
				local _ = nil
				local var3470, var3471 = protoModule.readVarIntI64(p173, var3464)
				var3464 = var3471
				var3463.active_tooltip_idx = var3470
			else
				local _ = nil
				local var3472, var3473 = protoModule.readVarInt(p173, var3464)
				local _ = var3472
				var3464 = var3473
			end
		end
		if var3465 == protoModule.wireTypes.lengthDelimited then
			if var3469 == 1 then
				local _ = nil
				local var3474, var3475 = protoModule.readBuffer(p173, var3464)
				var3464 = var3475
				table.insert(var3463.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var3474))
			elseif var3469 == 2 then
				local _ = nil
				local var3476, var3477 = protoModule.readBuffer(p173, var3464)
				var3464 = var3477
				var3463.active_category_id = buffer.tostring(var3476)
			else
				local _ = nil
				local var3478, var3479 = protoModule.readVarInt(p173, var3464)
				var3464 = var3479 + var3478
			end
		elseif var3465 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3480, var3481 = protoModule.readFixed32(p173, var3464)
			local _ = var3480
			var3464 = var3481
		elseif var3465 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3482, var3483 = protoModule.readFixed64(p173, var3464)
			local _ = var3482
			var3464 = var3483
		else
			error("Unsupported wire type: " .. var3465)
		end
	end
	return var3463
end

function t_86:jsonEncode()
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

function t_86:jsonDecode()
	-- upvalues: t_86 (ref), t (ref)
	local var3486 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3486.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3486.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var3486.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var3486.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var3486.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var3486.active_tooltip_idx = self.activeTooltipIdx
	end
	return var3486
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p174)
	-- upvalues: t_87 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p174 == nil or p174.marketplace_catalog_category_item_id == nil then "" else p174.marketplace_catalog_category_item_id
	}, t_87)
end

function t_87:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3490 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var3491, var3492 = protoModule.writeTag(buff, var3490, 1, protoModule.wireTypes.lengthDelimited)
		var3491, var3492 = protoModule.writeString(var3491, var3492, self.marketplace_catalog_category_item_id)
		buff = var3491
		var3490 = var3492
	end
	local buff_1 = buffer.create(var3490)
	buffer.copy(buff_1, 0, buff, 0, var3490)
	
	return buff_1
end

function t_87.decode(p175)
	-- upvalues: t_87 (ref), protoModule (ref)
	local var3494 = t_87.new()
	local var3495 = 0
	while var3495 < buffer.len(p175) do
		local _ = nil
		local var3496 = nil
		local var3497, var3498, var3499 = protoModule.readTag(p175, var3495)
		local var3500 = var3497
		var3496 = var3498
		var3495 = var3499
		
		if var3496 == protoModule.wireTypes.varint then
			local _ = nil
			local var3501, var3502 = protoModule.readVarInt(p175, var3495)
			local _ = var3501
			var3495 = var3502
			continue
		end
		if var3496 == protoModule.wireTypes.lengthDelimited then
			if var3500 == 1 then
				local _ = nil
				local var3503, var3504 = protoModule.readBuffer(p175, var3495)
				var3495 = var3504
				var3494.marketplace_catalog_category_item_id = buffer.tostring(var3503)
			else
				local _ = nil
				local var3505, var3506 = protoModule.readVarInt(p175, var3495)
				var3495 = var3506 + var3505
			end
		elseif var3496 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3507, var3508 = protoModule.readFixed32(p175, var3495)
			local _ = var3507
			var3495 = var3508
		elseif var3496 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3509, var3510 = protoModule.readFixed64(p175, var3495)
			local _ = var3509
			var3495 = var3510
		else
			error("Unsupported wire type: " .. var3496)
		end
	end
	return var3494
end

function t_87:jsonEncode()
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_87:jsonDecode()
	-- upvalues: t_87 (ref)
	local var3512 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var3512.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var3512.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var3512
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p176)
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

function t_88:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3514 = 0
	
	if self.hero_icon ~= nil then
		local var3515, var3516 = protoModule.writeTag(buff, var3514, 1, protoModule.wireTypes.lengthDelimited)
		var3515, var3516 = protoModule.writeString(var3515, var3516, self.hero_icon)
		buff = var3515
		var3514 = var3516
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var3517, var3518 = protoModule.writeTag(buff, var3514, 2, protoModule.wireTypes.lengthDelimited)
		var3517, var3518 = protoModule.writeString(var3517, var3518, self.body_dismiss_button_text)
		buff = var3517
		var3514 = var3518
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var3519, var3520 = protoModule.writeTag(buff, var3514, 3, protoModule.wireTypes.lengthDelimited)
		var3519, var3520 = protoModule.writeString(var3519, var3520, self.body_title)
		buff = var3519
		var3514 = var3520
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var3521, var3522 = protoModule.writeTag(buff, var3514, 4, protoModule.wireTypes.lengthDelimited)
		var3521, var3522 = protoModule.writeString(var3521, var3522, self.body_rich_text)
		buff = var3521
		var3514 = var3522
	end
	if self.terms_link_text ~= nil then
		local var3523, var3524 = protoModule.writeTag(buff, var3514, 5, protoModule.wireTypes.lengthDelimited)
		var3523, var3524 = protoModule.writeString(var3523, var3524, self.terms_link_text)
		buff = var3523
		var3514 = var3524
	end
	if self.terms_title ~= nil then
		local var3525, var3526 = protoModule.writeTag(buff, var3514, 6, protoModule.wireTypes.lengthDelimited)
		var3525, var3526 = protoModule.writeString(var3525, var3526, self.terms_title)
		buff = var3525
		var3514 = var3526
	end
	if self.terms_body_rich_text ~= nil then
		local var3527, var3528 = protoModule.writeTag(buff, var3514, 7, protoModule.wireTypes.lengthDelimited)
		var3527, var3528 = protoModule.writeString(var3527, var3528, self.terms_body_rich_text)
		buff = var3527
		var3514 = var3528
	end
	if self.terms_dismiss_button_text ~= nil then
		local var3529, var3530 = protoModule.writeTag(buff, var3514, 8, protoModule.wireTypes.lengthDelimited)
		var3529, var3530 = protoModule.writeString(var3529, var3530, self.terms_dismiss_button_text)
		buff = var3529
		var3514 = var3530
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var3531, var3532 = protoModule.writeTag(buff, var3514, 9, protoModule.wireTypes.lengthDelimited)
		var3531, var3532 = protoModule.writeString(var3531, var3532, self.offer_id)
		buff = var3531
		var3514 = var3532
	end
	local buff_1 = buffer.create(var3514)
	buffer.copy(buff_1, 0, buff, 0, var3514)
	
	return buff_1
end

function t_88.decode(p177)
	-- upvalues: t_88 (ref), protoModule (ref)
	local var3534 = t_88.new()
	local var3535 = 0
	while var3535 < buffer.len(p177) do
		local _ = nil
		local var3536 = nil
		local var3537, var3538, var3539 = protoModule.readTag(p177, var3535)
		local var3540 = var3537
		var3536 = var3538
		var3535 = var3539
		
		if var3536 == protoModule.wireTypes.varint then
			local _ = nil
			local var3541, var3542 = protoModule.readVarInt(p177, var3535)
			local _ = var3541
			var3535 = var3542
			continue
		end
		if var3536 == protoModule.wireTypes.lengthDelimited then
			if var3540 == 1 then
				local _ = nil
				local var3543, var3544 = protoModule.readBuffer(p177, var3535)
				var3535 = var3544
				var3534.hero_icon = buffer.tostring(var3543)
			elseif var3540 == 2 then
				local _ = nil
				local var3545, var3546 = protoModule.readBuffer(p177, var3535)
				var3535 = var3546
				var3534.body_dismiss_button_text = buffer.tostring(var3545)
			elseif var3540 == 3 then
				local _ = nil
				local var3547, var3548 = protoModule.readBuffer(p177, var3535)
				var3535 = var3548
				var3534.body_title = buffer.tostring(var3547)
			elseif var3540 == 4 then
				local _ = nil
				local var3549, var3550 = protoModule.readBuffer(p177, var3535)
				var3535 = var3550
				var3534.body_rich_text = buffer.tostring(var3549)
			elseif var3540 == 5 then
				local _ = nil
				local var3551, var3552 = protoModule.readBuffer(p177, var3535)
				var3535 = var3552
				var3534.terms_link_text = buffer.tostring(var3551)
			elseif var3540 == 6 then
				local _ = nil
				local var3553, var3554 = protoModule.readBuffer(p177, var3535)
				var3535 = var3554
				var3534.terms_title = buffer.tostring(var3553)
			elseif var3540 == 7 then
				local _ = nil
				local var3555, var3556 = protoModule.readBuffer(p177, var3535)
				var3535 = var3556
				var3534.terms_body_rich_text = buffer.tostring(var3555)
			elseif var3540 == 8 then
				local _ = nil
				local var3557, var3558 = protoModule.readBuffer(p177, var3535)
				var3535 = var3558
				var3534.terms_dismiss_button_text = buffer.tostring(var3557)
			elseif var3540 == 9 then
				local _ = nil
				local var3559, var3560 = protoModule.readBuffer(p177, var3535)
				var3535 = var3560
				var3534.offer_id = buffer.tostring(var3559)
			else
				local _ = nil
				local var3561, var3562 = protoModule.readVarInt(p177, var3535)
				var3535 = var3562 + var3561
			end
		elseif var3536 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3563, var3564 = protoModule.readFixed32(p177, var3535)
			local _ = var3563
			var3535 = var3564
		elseif var3536 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3565, var3566 = protoModule.readFixed64(p177, var3535)
			local _ = var3565
			var3535 = var3566
		else
			error("Unsupported wire type: " .. var3536)
		end
	end
	return var3534
end

function t_88:jsonEncode()
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

function t_88:jsonDecode()
	-- upvalues: t_88 (ref)
	local var3568 = t_88.new()
	
	if self.hero_icon ~= nil then
		var3568.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var3568.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var3568.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var3568.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var3568.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var3568.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var3568.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var3568.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var3568.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var3568.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var3568.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var3568.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var3568.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var3568.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var3568.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var3568.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var3568.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var3568.offer_id = self.offerId
	end
	return var3568
end

t_88.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_88
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p178)
	-- upvalues: t_89 (ref)
	return setmetatable({
		items = if p178 == nil or p178.items == nil then {} else p178.items,
		preview_columns = if p178 == nil or p178.preview_columns == nil then 0 else p178.preview_columns,
		impression_id = if p178 == nil or p178.impression_id == nil then "" else p178.impression_id
	}, t_89)
end

function t_89:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3570 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3571 = v:encode()
			local var3572, var3573 = protoModule.writeTag(buff, var3570, 1, protoModule.wireTypes.lengthDelimited)
			var3572, var3573 = protoModule.writeBuffer(var3572, var3573, var3571, buffer.len(var3571))
			buff = var3572
			var3570 = var3573
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var3574, var3575 = protoModule.writeTag(buff, var3570, 2, protoModule.wireTypes.varint)
		var3574, var3575 = protoModule.writeVarInt(var3574, var3575, self.preview_columns)
		buff = var3574
		var3570 = var3575
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var3576, var3577 = protoModule.writeTag(buff, var3570, 3, protoModule.wireTypes.lengthDelimited)
		var3576, var3577 = protoModule.writeString(var3576, var3577, self.impression_id)
		buff = var3576
		var3570 = var3577
	end
	local buff_1 = buffer.create(var3570)
	buffer.copy(buff_1, 0, buff, 0, var3570)
	
	return buff_1
end

function t_89.decode(p179)
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var3579 = t_89.new()
	local var3580 = 0
	while var3580 < buffer.len(p179) do
		local _ = nil
		local var3581 = nil
		local var3582, var3583, var3584 = protoModule.readTag(p179, var3580)
		local var3585 = var3582
		var3581 = var3583
		var3580 = var3584
		
		if var3581 == protoModule.wireTypes.varint then
			if var3585 == 2 then
				local _ = nil
				local var3586, var3587 = protoModule.readVarIntI32(p179, var3580)
				var3580 = var3587
				var3579.preview_columns = var3586
			else
				local _ = nil
				local var3588, var3589 = protoModule.readVarInt(p179, var3580)
				local _ = var3588
				var3580 = var3589
			end
		end
		if var3581 == protoModule.wireTypes.lengthDelimited then
			if var3585 == 1 then
				local _ = nil
				local var3590, var3591 = protoModule.readBuffer(p179, var3580)
				var3580 = var3591
				table.insert(var3579.items, t.CatalogItemGridInputData_CatalogItem.decode(var3590))
			elseif var3585 == 3 then
				local _ = nil
				local var3592, var3593 = protoModule.readBuffer(p179, var3580)
				var3580 = var3593
				var3579.impression_id = buffer.tostring(var3592)
			else
				local _ = nil
				local var3594, var3595 = protoModule.readVarInt(p179, var3580)
				var3580 = var3595 + var3594
			end
		elseif var3581 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3596, var3597 = protoModule.readFixed32(p179, var3580)
			local _ = var3596
			var3580 = var3597
		elseif var3581 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3598, var3599 = protoModule.readFixed64(p179, var3580)
			local _ = var3598
			var3580 = var3599
		else
			error("Unsupported wire type: " .. var3581)
		end
	end
	return var3579
end

function t_89:jsonEncode()
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

function t_89:jsonDecode()
	-- upvalues: t_89 (ref), t (ref)
	local var3602 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var3602.items = t_1
	end
	if self.preview_columns ~= nil then
		var3602.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var3602.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var3602.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var3602.impression_id = self.impressionId
	end
	return var3602
end

t_89.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_89
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p180)
	-- upvalues: t_90 (ref)
	return setmetatable({
		id = if p180 == nil or p180.id == nil then "" else p180.id,
		type = if p180 == nil or p180.type == nil then "" else p180.type
	}, t_90)
end

function t_90:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3605 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3606, var3607 = protoModule.writeTag(buff, var3605, 1, protoModule.wireTypes.lengthDelimited)
		var3606, var3607 = protoModule.writeString(var3606, var3607, self.id)
		buff = var3606
		var3605 = var3607
	end
	if self.type ~= nil and self.type ~= "" then
		local var3608, var3609 = protoModule.writeTag(buff, var3605, 2, protoModule.wireTypes.lengthDelimited)
		var3608, var3609 = protoModule.writeString(var3608, var3609, self.type)
		buff = var3608
		var3605 = var3609
	end
	local buff_1 = buffer.create(var3605)
	buffer.copy(buff_1, 0, buff, 0, var3605)
	
	return buff_1
end

function t_90.decode(p181)
	-- upvalues: t_90 (ref), protoModule (ref)
	local var3611 = t_90.new()
	local var3612 = 0
	while var3612 < buffer.len(p181) do
		local _ = nil
		local var3613 = nil
		local var3614, var3615, var3616 = protoModule.readTag(p181, var3612)
		local var3617 = var3614
		var3613 = var3615
		var3612 = var3616
		
		if var3613 == protoModule.wireTypes.varint then
			local _ = nil
			local var3618, var3619 = protoModule.readVarInt(p181, var3612)
			local _ = var3618
			var3612 = var3619
			continue
		end
		if var3613 == protoModule.wireTypes.lengthDelimited then
			if var3617 == 1 then
				local _ = nil
				local var3620, var3621 = protoModule.readBuffer(p181, var3612)
				var3612 = var3621
				var3611.id = buffer.tostring(var3620)
			elseif var3617 == 2 then
				local _ = nil
				local var3622, var3623 = protoModule.readBuffer(p181, var3612)
				var3612 = var3623
				var3611.type = buffer.tostring(var3622)
			else
				local _ = nil
				local var3624, var3625 = protoModule.readVarInt(p181, var3612)
				var3612 = var3625 + var3624
			end
		elseif var3613 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3626, var3627 = protoModule.readFixed32(p181, var3612)
			local _ = var3626
			var3612 = var3627
		elseif var3613 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3628, var3629 = protoModule.readFixed64(p181, var3612)
			local _ = var3628
			var3612 = var3629
		else
			error("Unsupported wire type: " .. var3613)
		end
	end
	return var3611
end

function t_90:jsonEncode()
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_90:jsonDecode()
	-- upvalues: t_90 (ref)
	local var3631 = t_90.new()
	
	if self.id ~= nil then
		var3631.id = self.id
	end
	if self.type ~= nil then
		var3631.type = self.type
	end
	return var3631
end

t_90.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_90
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p182)
	-- upvalues: t_91 (ref)
	return setmetatable({
		entry_map = if p182 == nil or p182.entry_map == nil then {} else p182.entry_map,
		entry_order = if p182 == nil or p182.entry_order == nil then {} else p182.entry_order,
		content_pools = if p182 == nil or p182.content_pools == nil then {} else p182.content_pools,
		search_session_id = if p182 == nil or p182.search_session_id == nil then "" else p182.search_session_id
	}, t_91)
end

function t_91:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3633 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3634, var3635 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3634, var3635 = protoModule.writeString(var3634, var3635, i)
			local var3636 = v:encode()
			var3635, var3637 = protoModule.writeTag(var3634, var3635, 2, protoModule.wireTypes.lengthDelimited)
			var3635, var3637 = protoModule.writeBuffer(var3635, var3637, var3636, buffer.len(var3636))
			local var3638 = var3635
			local var3639 = var3637
			local var3640, var3641 = protoModule.writeTag(buff, var3633, 1, protoModule.wireTypes.lengthDelimited)
			var3640, var3641 = protoModule.writeBuffer(var3640, var3641, var3638, var3639)
			buff = var3640
			var3633 = var3641
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3642, var3643 = protoModule.writeTag(buff, var3633, 2, protoModule.wireTypes.lengthDelimited)
			var3642, var3643 = protoModule.writeString(var3642, var3643, v)
			buff = var3642
			var3633 = var3643
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3644, var3645 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3644, var3645 = protoModule.writeString(var3644, var3645, i)
			local var3646 = v:encode()
			var3645, var3647 = protoModule.writeTag(var3644, var3645, 2, protoModule.wireTypes.lengthDelimited)
			var3645, var3647 = protoModule.writeBuffer(var3645, var3647, var3646, buffer.len(var3646))
			local var3648 = var3645
			local var3649 = var3647
			local var3650, var3651 = protoModule.writeTag(buff, var3633, 3, protoModule.wireTypes.lengthDelimited)
			var3650, var3651 = protoModule.writeBuffer(var3650, var3651, var3648, var3649)
			buff = var3650
			var3633 = var3651
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var3652, var3653 = protoModule.writeTag(buff, var3633, 4, protoModule.wireTypes.lengthDelimited)
		var3652, var3653 = protoModule.writeString(var3652, var3653, self.search_session_id)
		buff = var3652
		var3633 = var3653
	end
	local buff_1 = buffer.create(var3633)
	buffer.copy(buff_1, 0, buff, 0, var3633)
	
	return buff_1
end

function t_91.decode(p183)
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3655 = t_91.new()
	local var3656 = 0
	while var3656 < buffer.len(p183) do
		local _ = nil
		local var3657 = nil
		local var3658, var3659, var3660 = protoModule.readTag(p183, var3656)
		local var3661 = var3658
		var3657 = var3659
		var3656 = var3660
		
		if var3657 == protoModule.wireTypes.varint then
			local _ = nil
			local var3662, var3663 = protoModule.readVarInt(p183, var3656)
			local _ = var3662
			var3656 = var3663
			continue
		end
		if var3657 == protoModule.wireTypes.lengthDelimited then
			if var3661 == 1 then
				local _ = nil
				local var3664, var3665 = protoModule.readBuffer(p183, var3656)
				var3656 = var3665
				var3664 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var3664)
				var3655.entry_map[var3664.key or ""] = var3664.value or t.FeedEntry.new()
			elseif var3661 == 2 then
				local _ = nil
				local var3666, var3667 = protoModule.readBuffer(p183, var3656)
				var3656 = var3667
				table.insert(var3655.entry_order, buffer.tostring(var3666))
			elseif var3661 == 3 then
				local _ = nil
				local var3668, var3669 = protoModule.readBuffer(p183, var3656)
				var3656 = var3669
				var3668 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var3668)
				var3655.content_pools[var3668.key or ""] = var3668.value or t.ContentPool.new()
			elseif var3661 == 4 then
				local _ = nil
				local var3670, var3671 = protoModule.readBuffer(p183, var3656)
				var3656 = var3671
				var3655.search_session_id = buffer.tostring(var3670)
			else
				local _ = nil
				local var3672, var3673 = protoModule.readVarInt(p183, var3656)
				var3656 = var3673 + var3672
			end
		elseif var3657 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3674, var3675 = protoModule.readFixed32(p183, var3656)
			local _ = var3674
			var3656 = var3675
		elseif var3657 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3676, var3677 = protoModule.readFixed64(p183, var3656)
			local _ = var3676
			var3656 = var3677
		else
			error("Unsupported wire type: " .. var3657)
		end
	end
	return var3655
end

function t_91:jsonEncode()
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

function t_91:jsonDecode()
	-- upvalues: t_91 (ref), t (ref)
	local var3682 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3682.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3682.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3682.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3682.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3682.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3682.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var3682.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var3682.search_session_id = self.searchSessionId
	end
	return var3682
end

t_91.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_91
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p184)
	-- upvalues: t_92 (ref)
	return setmetatable({
		key = if p184 == nil or p184.key == nil then "" else p184.key,
		value = if p184 == nil or p184.value == nil then nil else p184.value
	}, t_92)
end

function t_92:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3690 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3691, var3692 = protoModule.writeTag(buff, var3690, 1, protoModule.wireTypes.lengthDelimited)
		var3691, var3692 = protoModule.writeString(var3691, var3692, self.key)
		buff = var3691
		var3690 = var3692
	end
	if self.value ~= nil then
		local var3693 = self.value:encode()
		local var3694, var3695 = protoModule.writeTag(buff, var3690, 2, protoModule.wireTypes.lengthDelimited)
		var3694, var3695 = protoModule.writeBuffer(var3694, var3695, var3693, buffer.len(var3693))
		buff = var3694
		var3690 = var3695
	end
	local buff_1 = buffer.create(var3690)
	buffer.copy(buff_1, 0, buff, 0, var3690)
	
	return buff_1
end

function t_92.decode(p185)
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3697 = t_92.new()
	local var3698 = 0
	while var3698 < buffer.len(p185) do
		local _ = nil
		local var3699 = nil
		local var3700, var3701, var3702 = protoModule.readTag(p185, var3698)
		local var3703 = var3700
		var3699 = var3701
		var3698 = var3702
		
		if var3699 == protoModule.wireTypes.varint then
			local _ = nil
			local var3704, var3705 = protoModule.readVarInt(p185, var3698)
			local _ = var3704
			var3698 = var3705
			continue
		end
		if var3699 == protoModule.wireTypes.lengthDelimited then
			if var3703 == 1 then
				local _ = nil
				local var3706, var3707 = protoModule.readBuffer(p185, var3698)
				var3698 = var3707
				var3697.key = buffer.tostring(var3706)
			elseif var3703 == 2 then
				local _ = nil
				local var3708, var3709 = protoModule.readBuffer(p185, var3698)
				var3698 = var3709
				var3697.value = t.FeedEntry.decode(var3708)
			else
				local _ = nil
				local var3710, var3711 = protoModule.readVarInt(p185, var3698)
				var3698 = var3711 + var3710
			end
		elseif var3699 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3712, var3713 = protoModule.readFixed32(p185, var3698)
			local _ = var3712
			var3698 = var3713
		elseif var3699 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3714, var3715 = protoModule.readFixed64(p185, var3698)
			local _ = var3714
			var3698 = var3715
		else
			error("Unsupported wire type: " .. var3699)
		end
	end
	return var3697
end

function t_92:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_92:jsonDecode()
	-- upvalues: t_92 (ref), t (ref)
	local var3717 = t_92.new()
	
	if self.key ~= nil then
		var3717.key = self.key
	end
	if self.value ~= nil then
		var3717.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3717
end

t_92.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_92
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p186)
	-- upvalues: t_93 (ref)
	return setmetatable({
		key = if p186 == nil or p186.key == nil then "" else p186.key,
		value = if p186 == nil or p186.value == nil then nil else p186.value
	}, t_93)
end

function t_93:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3719 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3720, var3721 = protoModule.writeTag(buff, var3719, 1, protoModule.wireTypes.lengthDelimited)
		var3720, var3721 = protoModule.writeString(var3720, var3721, self.key)
		buff = var3720
		var3719 = var3721
	end
	if self.value ~= nil then
		local var3722 = self.value:encode()
		local var3723, var3724 = protoModule.writeTag(buff, var3719, 2, protoModule.wireTypes.lengthDelimited)
		var3723, var3724 = protoModule.writeBuffer(var3723, var3724, var3722, buffer.len(var3722))
		buff = var3723
		var3719 = var3724
	end
	local buff_1 = buffer.create(var3719)
	buffer.copy(buff_1, 0, buff, 0, var3719)
	
	return buff_1
end

function t_93.decode(p187)
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var3726 = t_93.new()
	local var3727 = 0
	while var3727 < buffer.len(p187) do
		local _ = nil
		local var3728 = nil
		local var3729, var3730, var3731 = protoModule.readTag(p187, var3727)
		local var3732 = var3729
		var3728 = var3730
		var3727 = var3731
		
		if var3728 == protoModule.wireTypes.varint then
			local _ = nil
			local var3733, var3734 = protoModule.readVarInt(p187, var3727)
			local _ = var3733
			var3727 = var3734
			continue
		end
		if var3728 == protoModule.wireTypes.lengthDelimited then
			if var3732 == 1 then
				local _ = nil
				local var3735, var3736 = protoModule.readBuffer(p187, var3727)
				var3727 = var3736
				var3726.key = buffer.tostring(var3735)
			elseif var3732 == 2 then
				local _ = nil
				local var3737, var3738 = protoModule.readBuffer(p187, var3727)
				var3727 = var3738
				var3726.value = t.ContentPool.decode(var3737)
			else
				local _ = nil
				local var3739, var3740 = protoModule.readVarInt(p187, var3727)
				var3727 = var3740 + var3739
			end
		elseif var3728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3741, var3742 = protoModule.readFixed32(p187, var3727)
			local _ = var3741
			var3727 = var3742
		elseif var3728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3743, var3744 = protoModule.readFixed64(p187, var3727)
			local _ = var3743
			var3727 = var3744
		else
			error("Unsupported wire type: " .. var3728)
		end
	end
	return var3726
end

function t_93:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_93:jsonDecode()
	-- upvalues: t_93 (ref), t (ref)
	local var3746 = t_93.new()
	
	if self.key ~= nil then
		var3746.key = self.key
	end
	if self.value ~= nil then
		var3746.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3746
end

t_93.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_93
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p188)
	-- upvalues: t_94 (ref)
	return setmetatable({
		universe_id = if p188 == nil or p188.universe_id == nil then "" else p188.universe_id,
		is_content_locked = if p188 == nil or p188.is_content_locked == nil then false else p188.is_content_locked
	}, t_94)
end

function t_94:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3748 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3749, var3750 = protoModule.writeTag(buff, var3748, 1, protoModule.wireTypes.lengthDelimited)
		var3749, var3750 = protoModule.writeString(var3749, var3750, self.universe_id)
		buff = var3749
		var3748 = var3750
	end
	if self.is_content_locked then
		local var3751, var3752 = protoModule.writeTag(buff, var3748, 2, protoModule.wireTypes.varint)
		var3751, var3752 = protoModule.writeVarInt(var3751, var3752, if self.is_content_locked then 1 else 0)
		buff = var3751
		var3748 = var3752
	end
	local buff_1 = buffer.create(var3748)
	buffer.copy(buff_1, 0, buff, 0, var3748)
	
	return buff_1
end

function t_94.decode(p189)
	-- upvalues: t_94 (ref), protoModule (ref)
	local var3754 = t_94.new()
	local var3755 = 0
	while var3755 < buffer.len(p189) do
		local _ = nil
		local var3756 = nil
		local var3757, var3758, var3759 = protoModule.readTag(p189, var3755)
		local var3760 = var3757
		var3756 = var3758
		var3755 = var3759
		
		if var3756 == protoModule.wireTypes.varint then
			if var3760 == 2 then
				local _ = nil
				local var3761, var3762 = protoModule.readVarInt(p189, var3755)
				var3755 = var3762
				var3754.is_content_locked = var3761 ~= 0
			else
				local _ = nil
				local var3763, var3764 = protoModule.readVarInt(p189, var3755)
				local _ = var3763
				var3755 = var3764
			end
		end
		if var3756 == protoModule.wireTypes.lengthDelimited then
			if var3760 == 1 then
				local _ = nil
				local var3765, var3766 = protoModule.readBuffer(p189, var3755)
				var3755 = var3766
				var3754.universe_id = buffer.tostring(var3765)
			else
				local _ = nil
				local var3767, var3768 = protoModule.readVarInt(p189, var3755)
				var3755 = var3768 + var3767
			end
		elseif var3756 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3769, var3770 = protoModule.readFixed32(p189, var3755)
			local _ = var3769
			var3755 = var3770
		elseif var3756 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3771, var3772 = protoModule.readFixed64(p189, var3755)
			local _ = var3771
			var3755 = var3772
		else
			error("Unsupported wire type: " .. var3756)
		end
	end
	return var3754
end

function t_94:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_94:jsonDecode()
	-- upvalues: t_94 (ref)
	local var3774 = t_94.new()
	
	if self.universe_id ~= nil then
		var3774.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3774.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var3774.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var3774.is_content_locked = self.isContentLocked
	end
	return var3774
end

t_94.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_94
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p190)
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

function t_95:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3776 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var3777, var3778 = protoModule.writeTag(buff, var3776, 1, protoModule.wireTypes.lengthDelimited)
		var3777, var3778 = protoModule.writeString(var3777, var3778, self.overview_rich_text)
		buff = var3777
		var3776 = var3778
	end
	if self.result_entry ~= nil then
		local var3779 = self.result_entry:encode()
		local var3780, var3781 = protoModule.writeTag(buff, var3776, 2, protoModule.wireTypes.lengthDelimited)
		var3780, var3781 = protoModule.writeBuffer(var3780, var3781, var3779, buffer.len(var3779))
		buff = var3780
		var3776 = var3781
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var3782, var3783 = protoModule.writeTag(buff, var3776, 3, protoModule.wireTypes.lengthDelimited)
			var3782, var3783 = protoModule.writeString(var3782, var3783, v)
			buff = var3782
			var3776 = var3783
		end
	end
	if self.show_loading then
		local var3784, var3785 = protoModule.writeTag(buff, var3776, 4, protoModule.wireTypes.varint)
		var3784, var3785 = protoModule.writeVarInt(var3784, var3785, if self.show_loading then 1 else 0)
		buff = var3784
		var3776 = var3785
	end
	if self.title ~= nil and self.title ~= "" then
		local var3786, var3787 = protoModule.writeTag(buff, var3776, 5, protoModule.wireTypes.lengthDelimited)
		var3786, var3787 = protoModule.writeString(var3786, var3787, self.title)
		buff = var3786
		var3776 = var3787
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var3788, var3789 = protoModule.writeTag(buff, var3776, 6, protoModule.wireTypes.lengthDelimited)
		var3788, var3789 = protoModule.writeString(var3788, var3789, self.search_query)
		buff = var3788
		var3776 = var3789
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var3790, var3791 = protoModule.writeTag(buff, var3776, 8, protoModule.wireTypes.lengthDelimited)
		var3790, var3791 = protoModule.writeString(var3790, var3791, self.universe_ids)
		buff = var3790
		var3776 = var3791
	end
	local buff_1 = buffer.create(var3776)
	buffer.copy(buff_1, 0, buff, 0, var3776)
	
	return buff_1
end

function t_95.decode(p191)
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var3793 = t_95.new()
	local var3794 = 0
	while var3794 < buffer.len(p191) do
		local _ = nil
		local var3795 = nil
		local var3796, var3797, var3798 = protoModule.readTag(p191, var3794)
		local var3799 = var3796
		var3795 = var3797
		var3794 = var3798
		
		if var3795 == protoModule.wireTypes.varint then
			if var3799 == 4 then
				local _ = nil
				local var3800, var3801 = protoModule.readVarInt(p191, var3794)
				var3794 = var3801
				var3793.show_loading = var3800 ~= 0
			else
				local _ = nil
				local var3802, var3803 = protoModule.readVarInt(p191, var3794)
				local _ = var3802
				var3794 = var3803
			end
		end
		if var3795 == protoModule.wireTypes.lengthDelimited then
			if var3799 == 1 then
				local _ = nil
				local var3804, var3805 = protoModule.readBuffer(p191, var3794)
				var3794 = var3805
				var3793.overview_rich_text = buffer.tostring(var3804)
			elseif var3799 == 2 then
				local _ = nil
				local var3806, var3807 = protoModule.readBuffer(p191, var3794)
				var3794 = var3807
				var3793.result_entry = t.FeedEntry.decode(var3806)
			elseif var3799 == 3 then
				local _ = nil
				local var3808, var3809 = protoModule.readBuffer(p191, var3794)
				var3794 = var3809
				table.insert(var3793.follow_up_queries, buffer.tostring(var3808))
			elseif var3799 == 5 then
				local _ = nil
				local var3810, var3811 = protoModule.readBuffer(p191, var3794)
				var3794 = var3811
				var3793.title = buffer.tostring(var3810)
			elseif var3799 == 6 then
				local _ = nil
				local var3812, var3813 = protoModule.readBuffer(p191, var3794)
				var3794 = var3813
				var3793.search_query = buffer.tostring(var3812)
			elseif var3799 == 8 then
				local _ = nil
				local var3814, var3815 = protoModule.readBuffer(p191, var3794)
				var3794 = var3815
				var3793.universe_ids = buffer.tostring(var3814)
			else
				local _ = nil
				local var3816, var3817 = protoModule.readVarInt(p191, var3794)
				var3794 = var3817 + var3816
			end
		elseif var3795 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3818, var3819 = protoModule.readFixed32(p191, var3794)
			local _ = var3818
			var3794 = var3819
		elseif var3795 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3820, var3821 = protoModule.readFixed64(p191, var3794)
			local _ = var3820
			var3794 = var3821
		else
			error("Unsupported wire type: " .. var3795)
		end
	end
	return var3793
end

function t_95:jsonEncode()
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

function t_95:jsonDecode()
	-- upvalues: t_95 (ref), t (ref)
	local var3824 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var3824.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var3824.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var3824.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var3824.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var3824.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var3824.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var3824.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var3824.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var3824.title = self.title
	end
	if self.search_query ~= nil then
		var3824.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var3824.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var3824.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var3824.universe_ids = self.universeIds
	end
	return var3824
end

t_95.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_95
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p192)
	-- upvalues: t_96 (ref)
	return setmetatable({
		title = if p192 == nil or p192.title == nil then "" else p192.title,
		user_items = if p192 == nil or p192.user_items == nil then {} else p192.user_items,
		max_visible_rows = if p192 == nil or p192.max_visible_rows == nil then 0 else p192.max_visible_rows,
		sort_id = if p192 == nil or p192.sort_id == nil then nil else p192.sort_id
	}, t_96)
end

function t_96:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3828 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3829, var3830 = protoModule.writeTag(buff, var3828, 1, protoModule.wireTypes.lengthDelimited)
		var3829, var3830 = protoModule.writeString(var3829, var3830, self.title)
		buff = var3829
		var3828 = var3830
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var3831 = v:encode()
			local var3832, var3833 = protoModule.writeTag(buff, var3828, 2, protoModule.wireTypes.lengthDelimited)
			var3832, var3833 = protoModule.writeBuffer(var3832, var3833, var3831, buffer.len(var3831))
			buff = var3832
			var3828 = var3833
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3834, var3835 = protoModule.writeTag(buff, var3828, 3, protoModule.wireTypes.varint)
		var3834, var3835 = protoModule.writeVarInt(var3834, var3835, self.max_visible_rows)
		buff = var3834
		var3828 = var3835
	end
	if self.sort_id ~= nil then
		local var3836, var3837 = protoModule.writeTag(buff, var3828, 4, protoModule.wireTypes.lengthDelimited)
		var3836, var3837 = protoModule.writeString(var3836, var3837, self.sort_id)
		buff = var3836
		var3828 = var3837
	end
	local buff_1 = buffer.create(var3828)
	buffer.copy(buff_1, 0, buff, 0, var3828)
	
	return buff_1
end

function t_96.decode(p193)
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3839 = t_96.new()
	local var3840 = 0
	while var3840 < buffer.len(p193) do
		local _ = nil
		local var3841 = nil
		local var3842, var3843, var3844 = protoModule.readTag(p193, var3840)
		local var3845 = var3842
		var3841 = var3843
		var3840 = var3844
		
		if var3841 == protoModule.wireTypes.varint then
			if var3845 == 3 then
				local _ = nil
				local var3846, var3847 = protoModule.readVarIntI32(p193, var3840)
				var3840 = var3847
				var3839.max_visible_rows = var3846
			else
				local _ = nil
				local var3848, var3849 = protoModule.readVarInt(p193, var3840)
				local _ = var3848
				var3840 = var3849
			end
		end
		if var3841 == protoModule.wireTypes.lengthDelimited then
			if var3845 == 1 then
				local _ = nil
				local var3850, var3851 = protoModule.readBuffer(p193, var3840)
				var3840 = var3851
				var3839.title = buffer.tostring(var3850)
			elseif var3845 == 2 then
				local _ = nil
				local var3852, var3853 = protoModule.readBuffer(p193, var3840)
				var3840 = var3853
				table.insert(var3839.user_items, t.UserListInputData_UserItem.decode(var3852))
			elseif var3845 == 4 then
				local _ = nil
				local var3854, var3855 = protoModule.readBuffer(p193, var3840)
				var3840 = var3855
				var3839.sort_id = buffer.tostring(var3854)
			else
				local _ = nil
				local var3856, var3857 = protoModule.readVarInt(p193, var3840)
				var3840 = var3857 + var3856
			end
		elseif var3841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3858, var3859 = protoModule.readFixed32(p193, var3840)
			local _ = var3858
			var3840 = var3859
		elseif var3841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3860, var3861 = protoModule.readFixed64(p193, var3840)
			local _ = var3860
			var3840 = var3861
		else
			error("Unsupported wire type: " .. var3841)
		end
	end
	return var3839
end

function t_96:jsonEncode()
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

function t_96:jsonDecode()
	-- upvalues: t_96 (ref), t (ref)
	local var3864 = t_96.new()
	
	if self.title ~= nil then
		var3864.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3864.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3864.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3864.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3864.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3864.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3864.sort_id = self.sortId
	end
	return var3864
end

t_96.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_96
typeRegistryModule.default:register(t.UserListInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p194)
	-- upvalues: t_97 (ref)
	return setmetatable({
		user_id = if p194 == nil or p194.user_id == nil then "" else p194.user_id
	}, t_97)
end

function t_97:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3868 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3869, var3870 = protoModule.writeTag(buff, var3868, 1, protoModule.wireTypes.lengthDelimited)
		var3869, var3870 = protoModule.writeString(var3869, var3870, self.user_id)
		buff = var3869
		var3868 = var3870
	end
	local buff_1 = buffer.create(var3868)
	buffer.copy(buff_1, 0, buff, 0, var3868)
	
	return buff_1
end

function t_97.decode(p195)
	-- upvalues: t_97 (ref), protoModule (ref)
	local var3872 = t_97.new()
	local var3873 = 0
	while var3873 < buffer.len(p195) do
		local _ = nil
		local var3874 = nil
		local var3875, var3876, var3877 = protoModule.readTag(p195, var3873)
		local var3878 = var3875
		var3874 = var3876
		var3873 = var3877
		
		if var3874 == protoModule.wireTypes.varint then
			local _ = nil
			local var3879, var3880 = protoModule.readVarInt(p195, var3873)
			local _ = var3879
			var3873 = var3880
			continue
		end
		if var3874 == protoModule.wireTypes.lengthDelimited then
			if var3878 == 1 then
				local _ = nil
				local var3881, var3882 = protoModule.readBuffer(p195, var3873)
				var3873 = var3882
				var3872.user_id = buffer.tostring(var3881)
			else
				local _ = nil
				local var3883, var3884 = protoModule.readVarInt(p195, var3873)
				var3873 = var3884 + var3883
			end
		elseif var3874 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3885, var3886 = protoModule.readFixed32(p195, var3873)
			local _ = var3885
			var3873 = var3886
		elseif var3874 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3887, var3888 = protoModule.readFixed64(p195, var3873)
			local _ = var3887
			var3873 = var3888
		else
			error("Unsupported wire type: " .. var3874)
		end
	end
	return var3872
end

function t_97:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_97:jsonDecode()
	-- upvalues: t_97 (ref)
	local var3890 = t_97.new()
	
	if self.user_id ~= nil then
		var3890.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3890.user_id = self.userId
	end
	return var3890
end

t_97.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_97
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p196)
	-- upvalues: t_98 (ref)
	return setmetatable({
		title = if p196 == nil or p196.title == nil then "" else p196.title,
		items = if p196 == nil or p196.items == nil then {} else p196.items,
		max_visible_rows = if p196 == nil or p196.max_visible_rows == nil then 0 else p196.max_visible_rows,
		sort_id = if p196 == nil or p196.sort_id == nil then nil else p196.sort_id
	}, t_98)
end

function t_98:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3892 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3893, var3894 = protoModule.writeTag(buff, var3892, 1, protoModule.wireTypes.lengthDelimited)
		var3893, var3894 = protoModule.writeString(var3893, var3894, self.title)
		buff = var3893
		var3892 = var3894
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3895 = v:encode()
			local var3896, var3897 = protoModule.writeTag(buff, var3892, 2, protoModule.wireTypes.lengthDelimited)
			var3896, var3897 = protoModule.writeBuffer(var3896, var3897, var3895, buffer.len(var3895))
			buff = var3896
			var3892 = var3897
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3898, var3899 = protoModule.writeTag(buff, var3892, 3, protoModule.wireTypes.varint)
		var3898, var3899 = protoModule.writeVarInt(var3898, var3899, self.max_visible_rows)
		buff = var3898
		var3892 = var3899
	end
	if self.sort_id ~= nil then
		local var3900, var3901 = protoModule.writeTag(buff, var3892, 4, protoModule.wireTypes.lengthDelimited)
		var3900, var3901 = protoModule.writeString(var3900, var3901, self.sort_id)
		buff = var3900
		var3892 = var3901
	end
	local buff_1 = buffer.create(var3892)
	buffer.copy(buff_1, 0, buff, 0, var3892)
	
	return buff_1
end

function t_98.decode(p197)
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var3903 = t_98.new()
	local var3904 = 0
	while var3904 < buffer.len(p197) do
		local _ = nil
		local var3905 = nil
		local var3906, var3907, var3908 = protoModule.readTag(p197, var3904)
		local var3909 = var3906
		var3905 = var3907
		var3904 = var3908
		
		if var3905 == protoModule.wireTypes.varint then
			if var3909 == 3 then
				local _ = nil
				local var3910, var3911 = protoModule.readVarIntI32(p197, var3904)
				var3904 = var3911
				var3903.max_visible_rows = var3910
			else
				local _ = nil
				local var3912, var3913 = protoModule.readVarInt(p197, var3904)
				local _ = var3912
				var3904 = var3913
			end
		end
		if var3905 == protoModule.wireTypes.lengthDelimited then
			if var3909 == 1 then
				local _ = nil
				local var3914, var3915 = protoModule.readBuffer(p197, var3904)
				var3904 = var3915
				var3903.title = buffer.tostring(var3914)
			elseif var3909 == 2 then
				local _ = nil
				local var3916, var3917 = protoModule.readBuffer(p197, var3904)
				var3904 = var3917
				table.insert(var3903.items, t.CatalogItemListInputData_CatalogItem.decode(var3916))
			elseif var3909 == 4 then
				local _ = nil
				local var3918, var3919 = protoModule.readBuffer(p197, var3904)
				var3904 = var3919
				var3903.sort_id = buffer.tostring(var3918)
			else
				local _ = nil
				local var3920, var3921 = protoModule.readVarInt(p197, var3904)
				var3904 = var3921 + var3920
			end
		elseif var3905 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3922, var3923 = protoModule.readFixed32(p197, var3904)
			local _ = var3922
			var3904 = var3923
		elseif var3905 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3924, var3925 = protoModule.readFixed64(p197, var3904)
			local _ = var3924
			var3904 = var3925
		else
			error("Unsupported wire type: " .. var3905)
		end
	end
	return var3903
end

function t_98:jsonEncode()
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

function t_98:jsonDecode()
	-- upvalues: t_98 (ref), t (ref)
	local var3928 = t_98.new()
	
	if self.title ~= nil then
		var3928.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3928.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3928.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3928.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3928.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3928.sort_id = self.sortId
	end
	return var3928
end

t_98.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_98
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p198)
	-- upvalues: t_99 (ref)
	return setmetatable({
		item_id = if p198 == nil or p198.item_id == nil then "" else p198.item_id,
		item_type = if p198 == nil or p198.item_type == nil then "" else p198.item_type
	}, t_99)
end

function t_99:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3931 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3932, var3933 = protoModule.writeTag(buff, var3931, 1, protoModule.wireTypes.lengthDelimited)
		var3932, var3933 = protoModule.writeString(var3932, var3933, self.item_id)
		buff = var3932
		var3931 = var3933
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3934, var3935 = protoModule.writeTag(buff, var3931, 2, protoModule.wireTypes.lengthDelimited)
		var3934, var3935 = protoModule.writeString(var3934, var3935, self.item_type)
		buff = var3934
		var3931 = var3935
	end
	local buff_1 = buffer.create(var3931)
	buffer.copy(buff_1, 0, buff, 0, var3931)
	
	return buff_1
end

function t_99.decode(p199)
	-- upvalues: t_99 (ref), protoModule (ref)
	local var3937 = t_99.new()
	local var3938 = 0
	while var3938 < buffer.len(p199) do
		local _ = nil
		local var3939 = nil
		local var3940, var3941, var3942 = protoModule.readTag(p199, var3938)
		local var3943 = var3940
		var3939 = var3941
		var3938 = var3942
		
		if var3939 == protoModule.wireTypes.varint then
			local _ = nil
			local var3944, var3945 = protoModule.readVarInt(p199, var3938)
			local _ = var3944
			var3938 = var3945
			continue
		end
		if var3939 == protoModule.wireTypes.lengthDelimited then
			if var3943 == 1 then
				local _ = nil
				local var3946, var3947 = protoModule.readBuffer(p199, var3938)
				var3938 = var3947
				var3937.item_id = buffer.tostring(var3946)
			elseif var3943 == 2 then
				local _ = nil
				local var3948, var3949 = protoModule.readBuffer(p199, var3938)
				var3938 = var3949
				var3937.item_type = buffer.tostring(var3948)
			else
				local _ = nil
				local var3950, var3951 = protoModule.readVarInt(p199, var3938)
				var3938 = var3951 + var3950
			end
		elseif var3939 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3952, var3953 = protoModule.readFixed32(p199, var3938)
			local _ = var3952
			var3938 = var3953
		elseif var3939 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3954, var3955 = protoModule.readFixed64(p199, var3938)
			local _ = var3954
			var3938 = var3955
		else
			error("Unsupported wire type: " .. var3939)
		end
	end
	return var3937
end

function t_99:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_99:jsonDecode()
	-- upvalues: t_99 (ref)
	local var3957 = t_99.new()
	
	if self.item_id ~= nil then
		var3957.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3957.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3957.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3957.item_type = self.itemType
	end
	return var3957
end

t_99.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_99
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p200)
	-- upvalues: t_100 (ref)
	return setmetatable({
		universe_id = if p200 == nil or p200.universe_id == nil then "" else p200.universe_id
	}, t_100)
end

function t_100:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3959 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3960, var3961 = protoModule.writeTag(buff, var3959, 1, protoModule.wireTypes.lengthDelimited)
		var3960, var3961 = protoModule.writeString(var3960, var3961, self.universe_id)
		buff = var3960
		var3959 = var3961
	end
	local buff_1 = buffer.create(var3959)
	buffer.copy(buff_1, 0, buff, 0, var3959)
	
	return buff_1
end

function t_100.decode(p201)
	-- upvalues: t_100 (ref), protoModule (ref)
	local var3963 = t_100.new()
	local var3964 = 0
	while var3964 < buffer.len(p201) do
		local _ = nil
		local var3965 = nil
		local var3966, var3967, var3968 = protoModule.readTag(p201, var3964)
		local var3969 = var3966
		var3965 = var3967
		var3964 = var3968
		
		if var3965 == protoModule.wireTypes.varint then
			local _ = nil
			local var3970, var3971 = protoModule.readVarInt(p201, var3964)
			local _ = var3970
			var3964 = var3971
			continue
		end
		if var3965 == protoModule.wireTypes.lengthDelimited then
			if var3969 == 1 then
				local _ = nil
				local var3972, var3973 = protoModule.readBuffer(p201, var3964)
				var3964 = var3973
				var3963.universe_id = buffer.tostring(var3972)
			else
				local _ = nil
				local var3974, var3975 = protoModule.readVarInt(p201, var3964)
				var3964 = var3975 + var3974
			end
		elseif var3965 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3976, var3977 = protoModule.readFixed32(p201, var3964)
			local _ = var3976
			var3964 = var3977
		elseif var3965 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3978, var3979 = protoModule.readFixed64(p201, var3964)
			local _ = var3978
			var3964 = var3979
		else
			error("Unsupported wire type: " .. var3965)
		end
	end
	return var3963
end

function t_100:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_100:jsonDecode()
	-- upvalues: t_100 (ref)
	local var3981 = t_100.new()
	
	if self.universe_id ~= nil then
		var3981.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3981.universe_id = self.universeId
	end
	return var3981
end

t_100.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_100
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p202)
	-- upvalues: t_101 (ref)
	return setmetatable({
		title = if p202 == nil or p202.title == nil then "" else p202.title,
		subtitle = if p202 == nil or p202.subtitle == nil then "" else p202.subtitle,
		moment_items = if p202 == nil or p202.moment_items == nil then {} else p202.moment_items
	}, t_101)
end

function t_101:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3983 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3984, var3985 = protoModule.writeTag(buff, var3983, 1, protoModule.wireTypes.lengthDelimited)
		var3984, var3985 = protoModule.writeString(var3984, var3985, self.title)
		buff = var3984
		var3983 = var3985
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3986, var3987 = protoModule.writeTag(buff, var3983, 2, protoModule.wireTypes.lengthDelimited)
		var3986, var3987 = protoModule.writeString(var3986, var3987, self.subtitle)
		buff = var3986
		var3983 = var3987
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3988 = v:encode()
			local var3989, var3990 = protoModule.writeTag(buff, var3983, 3, protoModule.wireTypes.lengthDelimited)
			var3989, var3990 = protoModule.writeBuffer(var3989, var3990, var3988, buffer.len(var3988))
			buff = var3989
			var3983 = var3990
		end
	end
	local buff_1 = buffer.create(var3983)
	buffer.copy(buff_1, 0, buff, 0, var3983)
	
	return buff_1
end

function t_101.decode(p203)
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var3992 = t_101.new()
	local var3993 = 0
	while var3993 < buffer.len(p203) do
		local _ = nil
		local var3994 = nil
		local var3995, var3996, var3997 = protoModule.readTag(p203, var3993)
		local var3998 = var3995
		var3994 = var3996
		var3993 = var3997
		
		if var3994 == protoModule.wireTypes.varint then
			local _ = nil
			local var3999, var4000 = protoModule.readVarInt(p203, var3993)
			local _ = var3999
			var3993 = var4000
			continue
		end
		if var3994 == protoModule.wireTypes.lengthDelimited then
			if var3998 == 1 then
				local _ = nil
				local var4001, var4002 = protoModule.readBuffer(p203, var3993)
				var3993 = var4002
				var3992.title = buffer.tostring(var4001)
			elseif var3998 == 2 then
				local _ = nil
				local var4003, var4004 = protoModule.readBuffer(p203, var3993)
				var3993 = var4004
				var3992.subtitle = buffer.tostring(var4003)
			elseif var3998 == 3 then
				local _ = nil
				local var4005, var4006 = protoModule.readBuffer(p203, var3993)
				var3993 = var4006
				table.insert(var3992.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var4005))
			else
				local _ = nil
				local var4007, var4008 = protoModule.readVarInt(p203, var3993)
				var3993 = var4008 + var4007
			end
		elseif var3994 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4009, var4010 = protoModule.readFixed32(p203, var3993)
			local _ = var4009
			var3993 = var4010
		elseif var3994 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4011, var4012 = protoModule.readFixed64(p203, var3993)
			local _ = var4011
			var3993 = var4012
		else
			error("Unsupported wire type: " .. var3994)
		end
	end
	return var3992
end

function t_101:jsonEncode()
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

function t_101:jsonDecode()
	-- upvalues: t_101 (ref), t (ref)
	local var4015 = t_101.new()
	
	if self.title ~= nil then
		var4015.title = self.title
	end
	if self.subtitle ~= nil then
		var4015.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var4015.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var4015.moment_items = t_1
	end
	return var4015
end

t_101.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_101
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p204)
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

function t_102:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4019 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var4020, var4021 = protoModule.writeTag(buff, var4019, 1, protoModule.wireTypes.lengthDelimited)
		var4020, var4021 = protoModule.writeString(var4020, var4021, self.moment_id)
		buff = var4020
		var4019 = var4021
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var4022, var4023 = protoModule.writeTag(buff, var4019, 2, protoModule.wireTypes.lengthDelimited)
		var4022, var4023 = protoModule.writeString(var4022, var4023, self.video_asset_id)
		buff = var4022
		var4019 = var4023
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var4024, var4025 = protoModule.writeTag(buff, var4019, 3, protoModule.wireTypes.lengthDelimited)
		var4024, var4025 = protoModule.writeString(var4024, var4025, self.target_universe_id)
		buff = var4024
		var4019 = var4025
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var4026, var4027 = protoModule.writeTag(buff, var4019, 4, protoModule.wireTypes.lengthDelimited)
		var4026, var4027 = protoModule.writeString(var4026, var4027, self.target_place_id)
		buff = var4026
		var4019 = var4027
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var4028, var4029 = protoModule.writeTag(buff, var4019, 5, protoModule.wireTypes.lengthDelimited)
		var4028, var4029 = protoModule.writeString(var4028, var4029, self.feed_item_id)
		buff = var4028
		var4019 = var4029
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var4030, var4031 = protoModule.writeTag(buff, var4019, 6, protoModule.wireTypes.lengthDelimited)
		var4030, var4031 = protoModule.writeString(var4030, var4031, self.capture_universe_id)
		buff = var4030
		var4019 = var4031
	end
	local buff_1 = buffer.create(var4019)
	buffer.copy(buff_1, 0, buff, 0, var4019)
	
	return buff_1
end

function t_102.decode(p205)
	-- upvalues: t_102 (ref), protoModule (ref)
	local var4033 = t_102.new()
	local var4034 = 0
	while var4034 < buffer.len(p205) do
		local _ = nil
		local var4035 = nil
		local var4036, var4037, var4038 = protoModule.readTag(p205, var4034)
		local var4039 = var4036
		var4035 = var4037
		var4034 = var4038
		
		if var4035 == protoModule.wireTypes.varint then
			local _ = nil
			local var4040, var4041 = protoModule.readVarInt(p205, var4034)
			local _ = var4040
			var4034 = var4041
			continue
		end
		if var4035 == protoModule.wireTypes.lengthDelimited then
			if var4039 == 1 then
				local _ = nil
				local var4042, var4043 = protoModule.readBuffer(p205, var4034)
				var4034 = var4043
				var4033.moment_id = buffer.tostring(var4042)
			elseif var4039 == 2 then
				local _ = nil
				local var4044, var4045 = protoModule.readBuffer(p205, var4034)
				var4034 = var4045
				var4033.video_asset_id = buffer.tostring(var4044)
			elseif var4039 == 3 then
				local _ = nil
				local var4046, var4047 = protoModule.readBuffer(p205, var4034)
				var4034 = var4047
				var4033.target_universe_id = buffer.tostring(var4046)
			elseif var4039 == 4 then
				local _ = nil
				local var4048, var4049 = protoModule.readBuffer(p205, var4034)
				var4034 = var4049
				var4033.target_place_id = buffer.tostring(var4048)
			elseif var4039 == 5 then
				local _ = nil
				local var4050, var4051 = protoModule.readBuffer(p205, var4034)
				var4034 = var4051
				var4033.feed_item_id = buffer.tostring(var4050)
			elseif var4039 == 6 then
				local _ = nil
				local var4052, var4053 = protoModule.readBuffer(p205, var4034)
				var4034 = var4053
				var4033.capture_universe_id = buffer.tostring(var4052)
			else
				local _ = nil
				local var4054, var4055 = protoModule.readVarInt(p205, var4034)
				var4034 = var4055 + var4054
			end
		elseif var4035 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4056, var4057 = protoModule.readFixed32(p205, var4034)
			local _ = var4056
			var4034 = var4057
		elseif var4035 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4058, var4059 = protoModule.readFixed64(p205, var4034)
			local _ = var4058
			var4034 = var4059
		else
			error("Unsupported wire type: " .. var4035)
		end
	end
	return var4033
end

function t_102:jsonEncode()
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

function t_102:jsonDecode()
	-- upvalues: t_102 (ref)
	local var4061 = t_102.new()
	
	if self.moment_id ~= nil then
		var4061.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var4061.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var4061.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4061.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var4061.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var4061.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var4061.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var4061.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var4061.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var4061.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var4061.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var4061.capture_universe_id = self.captureUniverseId
	end
	return var4061
end

t_102.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_102
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p206)
	-- upvalues: t_103 (ref)
	return setmetatable({
		title = if p206 == nil or p206.title == nil then "" else p206.title,
		subtitle = if p206 == nil or p206.subtitle == nil then "" else p206.subtitle
	}, t_103)
end

function t_103:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4063 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var4064, var4065 = protoModule.writeTag(buff, var4063, 1, protoModule.wireTypes.lengthDelimited)
		var4064, var4065 = protoModule.writeString(var4064, var4065, self.title)
		buff = var4064
		var4063 = var4065
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var4066, var4067 = protoModule.writeTag(buff, var4063, 2, protoModule.wireTypes.lengthDelimited)
		var4066, var4067 = protoModule.writeString(var4066, var4067, self.subtitle)
		buff = var4066
		var4063 = var4067
	end
	local buff_1 = buffer.create(var4063)
	buffer.copy(buff_1, 0, buff, 0, var4063)
	
	return buff_1
end

function t_103.decode(p207)
	-- upvalues: t_103 (ref), protoModule (ref)
	local var4069 = t_103.new()
	local var4070 = 0
	while var4070 < buffer.len(p207) do
		local _ = nil
		local var4071 = nil
		local var4072, var4073, var4074 = protoModule.readTag(p207, var4070)
		local var4075 = var4072
		var4071 = var4073
		var4070 = var4074
		
		if var4071 == protoModule.wireTypes.varint then
			local _ = nil
			local var4076, var4077 = protoModule.readVarInt(p207, var4070)
			local _ = var4076
			var4070 = var4077
			continue
		end
		if var4071 == protoModule.wireTypes.lengthDelimited then
			if var4075 == 1 then
				local _ = nil
				local var4078, var4079 = protoModule.readBuffer(p207, var4070)
				var4070 = var4079
				var4069.title = buffer.tostring(var4078)
			elseif var4075 == 2 then
				local _ = nil
				local var4080, var4081 = protoModule.readBuffer(p207, var4070)
				var4070 = var4081
				var4069.subtitle = buffer.tostring(var4080)
			else
				local _ = nil
				local var4082, var4083 = protoModule.readVarInt(p207, var4070)
				var4070 = var4083 + var4082
			end
		elseif var4071 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4084, var4085 = protoModule.readFixed32(p207, var4070)
			local _ = var4084
			var4070 = var4085
		elseif var4071 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4086, var4087 = protoModule.readFixed64(p207, var4070)
			local _ = var4086
			var4070 = var4087
		else
			error("Unsupported wire type: " .. var4071)
		end
	end
	return var4069
end

function t_103:jsonEncode()
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_103:jsonDecode()
	-- upvalues: t_103 (ref)
	local var4089 = t_103.new()
	
	if self.title ~= nil then
		var4089.title = self.title
	end
	if self.subtitle ~= nil then
		var4089.subtitle = self.subtitle
	end
	return var4089
end

t_103.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_103
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p208)
	-- upvalues: t_104 (ref)
	return setmetatable({
		primary_cta_button_text = if p208 == nil or p208.primary_cta_button_text == nil then "" else p208.primary_cta_button_text,
		secondary_cta_button_text = if p208 == nil or p208.secondary_cta_button_text == nil then "" else p208.secondary_cta_button_text,
		primary_cta_type = if p208 == nil or p208.primary_cta_type == nil then "" else p208.primary_cta_type,
		secondary_cta_type = if p208 == nil or p208.secondary_cta_type == nil then "" else p208.secondary_cta_type
	}, t_104)
end

function t_104:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4091 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var4092, var4093 = protoModule.writeTag(buff, var4091, 1, protoModule.wireTypes.lengthDelimited)
		var4092, var4093 = protoModule.writeString(var4092, var4093, self.primary_cta_button_text)
		buff = var4092
		var4091 = var4093
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var4094, var4095 = protoModule.writeTag(buff, var4091, 2, protoModule.wireTypes.lengthDelimited)
		var4094, var4095 = protoModule.writeString(var4094, var4095, self.secondary_cta_button_text)
		buff = var4094
		var4091 = var4095
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var4096, var4097 = protoModule.writeTag(buff, var4091, 3, protoModule.wireTypes.lengthDelimited)
		var4096, var4097 = protoModule.writeString(var4096, var4097, self.primary_cta_type)
		buff = var4096
		var4091 = var4097
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var4098, var4099 = protoModule.writeTag(buff, var4091, 4, protoModule.wireTypes.lengthDelimited)
		var4098, var4099 = protoModule.writeString(var4098, var4099, self.secondary_cta_type)
		buff = var4098
		var4091 = var4099
	end
	local buff_1 = buffer.create(var4091)
	buffer.copy(buff_1, 0, buff, 0, var4091)
	
	return buff_1
end

function t_104.decode(p209)
	-- upvalues: t_104 (ref), protoModule (ref)
	local var4101 = t_104.new()
	local var4102 = 0
	while var4102 < buffer.len(p209) do
		local _ = nil
		local var4103 = nil
		local var4104, var4105, var4106 = protoModule.readTag(p209, var4102)
		local var4107 = var4104
		var4103 = var4105
		var4102 = var4106
		
		if var4103 == protoModule.wireTypes.varint then
			local _ = nil
			local var4108, var4109 = protoModule.readVarInt(p209, var4102)
			local _ = var4108
			var4102 = var4109
			continue
		end
		if var4103 == protoModule.wireTypes.lengthDelimited then
			if var4107 == 1 then
				local _ = nil
				local var4110, var4111 = protoModule.readBuffer(p209, var4102)
				var4102 = var4111
				var4101.primary_cta_button_text = buffer.tostring(var4110)
			elseif var4107 == 2 then
				local _ = nil
				local var4112, var4113 = protoModule.readBuffer(p209, var4102)
				var4102 = var4113
				var4101.secondary_cta_button_text = buffer.tostring(var4112)
			elseif var4107 == 3 then
				local _ = nil
				local var4114, var4115 = protoModule.readBuffer(p209, var4102)
				var4102 = var4115
				var4101.primary_cta_type = buffer.tostring(var4114)
			elseif var4107 == 4 then
				local _ = nil
				local var4116, var4117 = protoModule.readBuffer(p209, var4102)
				var4102 = var4117
				var4101.secondary_cta_type = buffer.tostring(var4116)
			else
				local _ = nil
				local var4118, var4119 = protoModule.readVarInt(p209, var4102)
				var4102 = var4119 + var4118
			end
		elseif var4103 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4120, var4121 = protoModule.readFixed32(p209, var4102)
			local _ = var4120
			var4102 = var4121
		elseif var4103 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4122, var4123 = protoModule.readFixed64(p209, var4102)
			local _ = var4122
			var4102 = var4123
		else
			error("Unsupported wire type: " .. var4103)
		end
	end
	return var4101
end

function t_104:jsonEncode()
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

function t_104:jsonDecode()
	-- upvalues: t_104 (ref)
	local var4125 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var4125.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var4125.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var4125.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var4125.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var4125.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var4125.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var4125.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var4125.secondary_cta_type = self.secondaryCtaType
	end
	return var4125
end

t_104.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_104
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p210)
	-- upvalues: t_105 (ref)
	return setmetatable({
		image_asset_id = if p210 == nil or p210.image_asset_id == nil then "" else p210.image_asset_id
	}, t_105)
end

function t_105:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4127 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var4128, var4129 = protoModule.writeTag(buff, var4127, 1, protoModule.wireTypes.lengthDelimited)
		var4128, var4129 = protoModule.writeString(var4128, var4129, self.image_asset_id)
		buff = var4128
		var4127 = var4129
	end
	local buff_1 = buffer.create(var4127)
	buffer.copy(buff_1, 0, buff, 0, var4127)
	
	return buff_1
end

function t_105.decode(p211)
	-- upvalues: t_105 (ref), protoModule (ref)
	local var4131 = t_105.new()
	local var4132 = 0
	while var4132 < buffer.len(p211) do
		local _ = nil
		local var4133 = nil
		local var4134, var4135, var4136 = protoModule.readTag(p211, var4132)
		local var4137 = var4134
		var4133 = var4135
		var4132 = var4136
		
		if var4133 == protoModule.wireTypes.varint then
			local _ = nil
			local var4138, var4139 = protoModule.readVarInt(p211, var4132)
			local _ = var4138
			var4132 = var4139
			continue
		end
		if var4133 == protoModule.wireTypes.lengthDelimited then
			if var4137 == 1 then
				local _ = nil
				local var4140, var4141 = protoModule.readBuffer(p211, var4132)
				var4132 = var4141
				var4131.image_asset_id = buffer.tostring(var4140)
			else
				local _ = nil
				local var4142, var4143 = protoModule.readVarInt(p211, var4132)
				var4132 = var4143 + var4142
			end
		elseif var4133 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4144, var4145 = protoModule.readFixed32(p211, var4132)
			local _ = var4144
			var4132 = var4145
		elseif var4133 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4146, var4147 = protoModule.readFixed64(p211, var4132)
			local _ = var4146
			var4132 = var4147
		else
			error("Unsupported wire type: " .. var4133)
		end
	end
	return var4131
end

function t_105:jsonEncode()
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_105:jsonDecode()
	-- upvalues: t_105 (ref)
	local var4149 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var4149.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4149.image_asset_id = self.imageAssetId
	end
	return var4149
end

t_105.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_105
typeRegistryModule.default:register(t.ImageInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p212)
	-- upvalues: t_106 (ref)
	return setmetatable({
		video_asset_id = if p212 == nil or p212.video_asset_id == nil then "" else p212.video_asset_id,
		loading_image_asset_id = if p212 == nil or p212.loading_image_asset_id == nil then "" else p212.loading_image_asset_id
	}, t_106)
end

function t_106:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4151 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var4152, var4153 = protoModule.writeTag(buff, var4151, 1, protoModule.wireTypes.lengthDelimited)
		var4152, var4153 = protoModule.writeString(var4152, var4153, self.video_asset_id)
		buff = var4152
		var4151 = var4153
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		local var4154, var4155 = protoModule.writeTag(buff, var4151, 2, protoModule.wireTypes.lengthDelimited)
		var4154, var4155 = protoModule.writeString(var4154, var4155, self.loading_image_asset_id)
		buff = var4154
		var4151 = var4155
	end
	local buff_1 = buffer.create(var4151)
	buffer.copy(buff_1, 0, buff, 0, var4151)
	
	return buff_1
end

function t_106.decode(p213)
	-- upvalues: t_106 (ref), protoModule (ref)
	local var4157 = t_106.new()
	local var4158 = 0
	while var4158 < buffer.len(p213) do
		local _ = nil
		local var4159 = nil
		local var4160, var4161, var4162 = protoModule.readTag(p213, var4158)
		local var4163 = var4160
		var4159 = var4161
		var4158 = var4162
		
		if var4159 == protoModule.wireTypes.varint then
			local _ = nil
			local var4164, var4165 = protoModule.readVarInt(p213, var4158)
			local _ = var4164
			var4158 = var4165
			continue
		end
		if var4159 == protoModule.wireTypes.lengthDelimited then
			if var4163 == 1 then
				local _ = nil
				local var4166, var4167 = protoModule.readBuffer(p213, var4158)
				var4158 = var4167
				var4157.video_asset_id = buffer.tostring(var4166)
			elseif var4163 == 2 then
				local _ = nil
				local var4168, var4169 = protoModule.readBuffer(p213, var4158)
				var4158 = var4169
				var4157.loading_image_asset_id = buffer.tostring(var4168)
			else
				local _ = nil
				local var4170, var4171 = protoModule.readVarInt(p213, var4158)
				var4158 = var4171 + var4170
			end
		elseif var4159 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4172, var4173 = protoModule.readFixed32(p213, var4158)
			local _ = var4172
			var4158 = var4173
		elseif var4159 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4174, var4175 = protoModule.readFixed64(p213, var4158)
			local _ = var4174
			var4158 = var4175
		else
			error("Unsupported wire type: " .. var4159)
		end
	end
	return var4157
end

function t_106:jsonEncode()
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	if self.loading_image_asset_id ~= nil and self.loading_image_asset_id ~= "" then
		t.loadingImageAssetId = self.loading_image_asset_id
	end
	return t
end

function t_106:jsonDecode()
	-- upvalues: t_106 (ref)
	local var4177 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var4177.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4177.video_asset_id = self.videoAssetId
	end
	if self.loading_image_asset_id ~= nil then
		var4177.loading_image_asset_id = self.loading_image_asset_id
	end
	if self.loadingImageAssetId ~= nil then
		var4177.loading_image_asset_id = self.loadingImageAssetId
	end
	return var4177
end

t_106.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_106
typeRegistryModule.default:register(t.VideoInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p214)
	-- upvalues: t_107 (ref)
	return setmetatable({
		text = if p214 == nil or p214.text == nil then "" else p214.text,
		is_rendered_text = if p214 == nil or p214.is_rendered_text == nil then false else p214.is_rendered_text
	}, t_107)
end

function t_107:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4179 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var4180, var4181 = protoModule.writeTag(buff, var4179, 1, protoModule.wireTypes.lengthDelimited)
		var4180, var4181 = protoModule.writeString(var4180, var4181, self.text)
		buff = var4180
		var4179 = var4181
	end
	if self.is_rendered_text then
		local var4182, var4183 = protoModule.writeTag(buff, var4179, 2, protoModule.wireTypes.varint)
		var4182, var4183 = protoModule.writeVarInt(var4182, var4183, if self.is_rendered_text then 1 else 0)
		buff = var4182
		var4179 = var4183
	end
	local buff_1 = buffer.create(var4179)
	buffer.copy(buff_1, 0, buff, 0, var4179)
	
	return buff_1
end

function t_107.decode(p215)
	-- upvalues: t_107 (ref), protoModule (ref)
	local var4185 = t_107.new()
	local var4186 = 0
	while var4186 < buffer.len(p215) do
		local _ = nil
		local var4187 = nil
		local var4188, var4189, var4190 = protoModule.readTag(p215, var4186)
		local var4191 = var4188
		var4187 = var4189
		var4186 = var4190
		
		if var4187 == protoModule.wireTypes.varint then
			if var4191 == 2 then
				local _ = nil
				local var4192, var4193 = protoModule.readVarInt(p215, var4186)
				var4186 = var4193
				var4185.is_rendered_text = var4192 ~= 0
			else
				local _ = nil
				local var4194, var4195 = protoModule.readVarInt(p215, var4186)
				local _ = var4194
				var4186 = var4195
			end
		end
		if var4187 == protoModule.wireTypes.lengthDelimited then
			if var4191 == 1 then
				local _ = nil
				local var4196, var4197 = protoModule.readBuffer(p215, var4186)
				var4186 = var4197
				var4185.text = buffer.tostring(var4196)
			else
				local _ = nil
				local var4198, var4199 = protoModule.readVarInt(p215, var4186)
				var4186 = var4199 + var4198
			end
		elseif var4187 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4200, var4201 = protoModule.readFixed32(p215, var4186)
			local _ = var4200
			var4186 = var4201
		elseif var4187 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4202, var4203 = protoModule.readFixed64(p215, var4186)
			local _ = var4202
			var4186 = var4203
		else
			error("Unsupported wire type: " .. var4187)
		end
	end
	return var4185
end

function t_107:jsonEncode()
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_107:jsonDecode()
	-- upvalues: t_107 (ref)
	local var4205 = t_107.new()
	
	if self.text ~= nil then
		var4205.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var4205.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var4205.is_rendered_text = self.isRenderedText
	end
	return var4205
end

t_107.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_107
typeRegistryModule.default:register(t.TextInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p216)
	-- upvalues: t_108 (ref)
	return setmetatable({
		entry_map = if p216 == nil or p216.entry_map == nil then {} else p216.entry_map,
		entry_order = if p216 == nil or p216.entry_order == nil then {} else p216.entry_order,
		entry_order_map = if p216 == nil or p216.entry_order_map == nil then {} else p216.entry_order_map,
		content_pools = if p216 == nil or p216.content_pools == nil then {} else p216.content_pools
	}, t_108)
end

function t_108:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4207 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var4208, var4209 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4208, var4209 = protoModule.writeString(var4208, var4209, i)
			local var4210 = v:encode()
			var4209, var4211 = protoModule.writeTag(var4208, var4209, 2, protoModule.wireTypes.lengthDelimited)
			var4209, var4211 = protoModule.writeBuffer(var4209, var4211, var4210, buffer.len(var4210))
			local var4212 = var4209
			local var4213 = var4211
			local var4214, var4215 = protoModule.writeTag(buff, var4207, 1, protoModule.wireTypes.lengthDelimited)
			var4214, var4215 = protoModule.writeBuffer(var4214, var4215, var4212, var4213)
			buff = var4214
			var4207 = var4215
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var4216, var4217 = protoModule.writeTag(buff, var4207, 2, protoModule.wireTypes.lengthDelimited)
			var4216, var4217 = protoModule.writeString(var4216, var4217, v)
			buff = var4216
			var4207 = var4217
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var4218, var4219 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4218, var4219 = protoModule.writeString(var4218, var4219, i)
			local var4220 = v:encode()
			var4219, var4221 = protoModule.writeTag(var4218, var4219, 2, protoModule.wireTypes.lengthDelimited)
			var4219, var4221 = protoModule.writeBuffer(var4219, var4221, var4220, buffer.len(var4220))
			local var4222 = var4219
			local var4223 = var4221
			local var4224, var4225 = protoModule.writeTag(buff, var4207, 3, protoModule.wireTypes.lengthDelimited)
			var4224, var4225 = protoModule.writeBuffer(var4224, var4225, var4222, var4223)
			buff = var4224
			var4207 = var4225
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var4226, var4227 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4226, var4227 = protoModule.writeString(var4226, var4227, i)
			local var4228 = v:encode()
			var4227, var4229 = protoModule.writeTag(var4226, var4227, 2, protoModule.wireTypes.lengthDelimited)
			var4227, var4229 = protoModule.writeBuffer(var4227, var4229, var4228, buffer.len(var4228))
			local var4230 = var4227
			local var4231 = var4229
			local var4232, var4233 = protoModule.writeTag(buff, var4207, 4, protoModule.wireTypes.lengthDelimited)
			var4232, var4233 = protoModule.writeBuffer(var4232, var4233, var4230, var4231)
			buff = var4232
			var4207 = var4233
		end
	end
	local buff_1 = buffer.create(var4207)
	buffer.copy(buff_1, 0, buff, 0, var4207)
	
	return buff_1
end

function t_108.decode(p217)
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var4235 = t_108.new()
	local var4236 = 0
	while var4236 < buffer.len(p217) do
		local _ = nil
		local var4237 = nil
		local var4238, var4239, var4240 = protoModule.readTag(p217, var4236)
		local var4241 = var4238
		var4237 = var4239
		var4236 = var4240
		
		if var4237 == protoModule.wireTypes.varint then
			local _ = nil
			local var4242, var4243 = protoModule.readVarInt(p217, var4236)
			local _ = var4242
			var4236 = var4243
			continue
		end
		if var4237 == protoModule.wireTypes.lengthDelimited then
			if var4241 == 1 then
				local _ = nil
				local var4244, var4245 = protoModule.readBuffer(p217, var4236)
				var4236 = var4245
				var4244 = t.VerticalFeedInputData_EntryMapEntry.decode(var4244)
				var4235.entry_map[var4244.key or ""] = var4244.value or t.FeedEntry.new()
			elseif var4241 == 2 then
				local _ = nil
				local var4246, var4247 = protoModule.readBuffer(p217, var4236)
				var4236 = var4247
				table.insert(var4235.entry_order, buffer.tostring(var4246))
			elseif var4241 == 3 then
				local _ = nil
				local var4248, var4249 = protoModule.readBuffer(p217, var4236)
				var4236 = var4249
				var4248 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var4248)
				var4235.entry_order_map[var4248.key or ""] = var4248.value or t.EntryOrder.new()
			elseif var4241 == 4 then
				local _ = nil
				local var4250, var4251 = protoModule.readBuffer(p217, var4236)
				var4236 = var4251
				var4250 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var4250)
				var4235.content_pools[var4250.key or ""] = var4250.value or t.ContentPool.new()
			else
				local _ = nil
				local var4252, var4253 = protoModule.readVarInt(p217, var4236)
				var4236 = var4253 + var4252
			end
		elseif var4237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4254, var4255 = protoModule.readFixed32(p217, var4236)
			local _ = var4254
			var4236 = var4255
		elseif var4237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4256, var4257 = protoModule.readFixed64(p217, var4236)
			local _ = var4256
			var4236 = var4257
		else
			error("Unsupported wire type: " .. var4237)
		end
	end
	return var4235
end

function t_108:jsonEncode()
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

function t_108:jsonDecode()
	-- upvalues: t_108 (ref), t (ref)
	local var4263 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4263.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4263.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var4263.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var4263.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4263.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4263.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4263.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4263.content_pools = t_1
	end
	return var4263
end

t_108.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_108
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p218)
	-- upvalues: t_109 (ref)
	return setmetatable({
		key = if p218 == nil or p218.key == nil then "" else p218.key,
		value = if p218 == nil or p218.value == nil then nil else p218.value
	}, t_109)
end

function t_109:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4273 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4274, var4275 = protoModule.writeTag(buff, var4273, 1, protoModule.wireTypes.lengthDelimited)
		var4274, var4275 = protoModule.writeString(var4274, var4275, self.key)
		buff = var4274
		var4273 = var4275
	end
	if self.value ~= nil then
		local var4276 = self.value:encode()
		local var4277, var4278 = protoModule.writeTag(buff, var4273, 2, protoModule.wireTypes.lengthDelimited)
		var4277, var4278 = protoModule.writeBuffer(var4277, var4278, var4276, buffer.len(var4276))
		buff = var4277
		var4273 = var4278
	end
	local buff_1 = buffer.create(var4273)
	buffer.copy(buff_1, 0, buff, 0, var4273)
	
	return buff_1
end

function t_109.decode(p219)
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var4280 = t_109.new()
	local var4281 = 0
	while var4281 < buffer.len(p219) do
		local _ = nil
		local var4282 = nil
		local var4283, var4284, var4285 = protoModule.readTag(p219, var4281)
		local var4286 = var4283
		var4282 = var4284
		var4281 = var4285
		
		if var4282 == protoModule.wireTypes.varint then
			local _ = nil
			local var4287, var4288 = protoModule.readVarInt(p219, var4281)
			local _ = var4287
			var4281 = var4288
			continue
		end
		if var4282 == protoModule.wireTypes.lengthDelimited then
			if var4286 == 1 then
				local _ = nil
				local var4289, var4290 = protoModule.readBuffer(p219, var4281)
				var4281 = var4290
				var4280.key = buffer.tostring(var4289)
			elseif var4286 == 2 then
				local _ = nil
				local var4291, var4292 = protoModule.readBuffer(p219, var4281)
				var4281 = var4292
				var4280.value = t.FeedEntry.decode(var4291)
			else
				local _ = nil
				local var4293, var4294 = protoModule.readVarInt(p219, var4281)
				var4281 = var4294 + var4293
			end
		elseif var4282 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4295, var4296 = protoModule.readFixed32(p219, var4281)
			local _ = var4295
			var4281 = var4296
		elseif var4282 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4297, var4298 = protoModule.readFixed64(p219, var4281)
			local _ = var4297
			var4281 = var4298
		else
			error("Unsupported wire type: " .. var4282)
		end
	end
	return var4280
end

function t_109:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_109:jsonDecode()
	-- upvalues: t_109 (ref), t (ref)
	local var4300 = t_109.new()
	
	if self.key ~= nil then
		var4300.key = self.key
	end
	if self.value ~= nil then
		var4300.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var4300
end

t_109.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_109
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p220)
	-- upvalues: t_110 (ref)
	return setmetatable({
		key = if p220 == nil or p220.key == nil then "" else p220.key,
		value = if p220 == nil or p220.value == nil then nil else p220.value
	}, t_110)
end

function t_110:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4302 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4303, var4304 = protoModule.writeTag(buff, var4302, 1, protoModule.wireTypes.lengthDelimited)
		var4303, var4304 = protoModule.writeString(var4303, var4304, self.key)
		buff = var4303
		var4302 = var4304
	end
	if self.value ~= nil then
		local var4305 = self.value:encode()
		local var4306, var4307 = protoModule.writeTag(buff, var4302, 2, protoModule.wireTypes.lengthDelimited)
		var4306, var4307 = protoModule.writeBuffer(var4306, var4307, var4305, buffer.len(var4305))
		buff = var4306
		var4302 = var4307
	end
	local buff_1 = buffer.create(var4302)
	buffer.copy(buff_1, 0, buff, 0, var4302)
	
	return buff_1
end

function t_110.decode(p221)
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var4309 = t_110.new()
	local var4310 = 0
	while var4310 < buffer.len(p221) do
		local _ = nil
		local var4311 = nil
		local var4312, var4313, var4314 = protoModule.readTag(p221, var4310)
		local var4315 = var4312
		var4311 = var4313
		var4310 = var4314
		
		if var4311 == protoModule.wireTypes.varint then
			local _ = nil
			local var4316, var4317 = protoModule.readVarInt(p221, var4310)
			local _ = var4316
			var4310 = var4317
			continue
		end
		if var4311 == protoModule.wireTypes.lengthDelimited then
			if var4315 == 1 then
				local _ = nil
				local var4318, var4319 = protoModule.readBuffer(p221, var4310)
				var4310 = var4319
				var4309.key = buffer.tostring(var4318)
			elseif var4315 == 2 then
				local _ = nil
				local var4320, var4321 = protoModule.readBuffer(p221, var4310)
				var4310 = var4321
				var4309.value = t.EntryOrder.decode(var4320)
			else
				local _ = nil
				local var4322, var4323 = protoModule.readVarInt(p221, var4310)
				var4310 = var4323 + var4322
			end
		elseif var4311 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4324, var4325 = protoModule.readFixed32(p221, var4310)
			local _ = var4324
			var4310 = var4325
		elseif var4311 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4326, var4327 = protoModule.readFixed64(p221, var4310)
			local _ = var4326
			var4310 = var4327
		else
			error("Unsupported wire type: " .. var4311)
		end
	end
	return var4309
end

function t_110:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_110:jsonDecode()
	-- upvalues: t_110 (ref), t (ref)
	local var4329 = t_110.new()
	
	if self.key ~= nil then
		var4329.key = self.key
	end
	if self.value ~= nil then
		var4329.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var4329
end

t_110.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p222)
	-- upvalues: t_111 (ref)
	return setmetatable({
		key = if p222 == nil or p222.key == nil then "" else p222.key,
		value = if p222 == nil or p222.value == nil then nil else p222.value
	}, t_111)
end

function t_111:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4331 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4332, var4333 = protoModule.writeTag(buff, var4331, 1, protoModule.wireTypes.lengthDelimited)
		var4332, var4333 = protoModule.writeString(var4332, var4333, self.key)
		buff = var4332
		var4331 = var4333
	end
	if self.value ~= nil then
		local var4334 = self.value:encode()
		local var4335, var4336 = protoModule.writeTag(buff, var4331, 2, protoModule.wireTypes.lengthDelimited)
		var4335, var4336 = protoModule.writeBuffer(var4335, var4336, var4334, buffer.len(var4334))
		buff = var4335
		var4331 = var4336
	end
	local buff_1 = buffer.create(var4331)
	buffer.copy(buff_1, 0, buff, 0, var4331)
	
	return buff_1
end

function t_111.decode(p223)
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var4338 = t_111.new()
	local var4339 = 0
	while var4339 < buffer.len(p223) do
		local _ = nil
		local var4340 = nil
		local var4341, var4342, var4343 = protoModule.readTag(p223, var4339)
		local var4344 = var4341
		var4340 = var4342
		var4339 = var4343
		
		if var4340 == protoModule.wireTypes.varint then
			local _ = nil
			local var4345, var4346 = protoModule.readVarInt(p223, var4339)
			local _ = var4345
			var4339 = var4346
			continue
		end
		if var4340 == protoModule.wireTypes.lengthDelimited then
			if var4344 == 1 then
				local _ = nil
				local var4347, var4348 = protoModule.readBuffer(p223, var4339)
				var4339 = var4348
				var4338.key = buffer.tostring(var4347)
			elseif var4344 == 2 then
				local _ = nil
				local var4349, var4350 = protoModule.readBuffer(p223, var4339)
				var4339 = var4350
				var4338.value = t.ContentPool.decode(var4349)
			else
				local _ = nil
				local var4351, var4352 = protoModule.readVarInt(p223, var4339)
				var4339 = var4352 + var4351
			end
		elseif var4340 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4353, var4354 = protoModule.readFixed32(p223, var4339)
			local _ = var4353
			var4339 = var4354
		elseif var4340 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4355, var4356 = protoModule.readFixed64(p223, var4339)
			local _ = var4355
			var4339 = var4356
		else
			error("Unsupported wire type: " .. var4340)
		end
	end
	return var4338
end

function t_111:jsonEncode()
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_111:jsonDecode()
	-- upvalues: t_111 (ref), t (ref)
	local var4358 = t_111.new()
	
	if self.key ~= nil then
		var4358.key = self.key
	end
	if self.value ~= nil then
		var4358.value = t.ContentPool.jsonDecode(self.value)
	end
	return var4358
end

t_111.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_111
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p224)
	-- upvalues: t_112 (ref)
	return setmetatable({
		foreground_header_entry = if p224 == nil or p224.foreground_header_entry == nil then nil else p224.foreground_header_entry,
		background_header_entry = if p224 == nil or p224.background_header_entry == nil then nil else p224.background_header_entry,
		layout_variant = if p224 == nil or p224.layout_variant == nil then "" else p224.layout_variant
	}, t_112)
end

function t_112:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4360 = 0
	
	if self.foreground_header_entry ~= nil then
		local var4361 = self.foreground_header_entry:encode()
		local var4362, var4363 = protoModule.writeTag(buff, var4360, 1, protoModule.wireTypes.lengthDelimited)
		var4362, var4363 = protoModule.writeBuffer(var4362, var4363, var4361, buffer.len(var4361))
		buff = var4362
		var4360 = var4363
	end
	if self.background_header_entry ~= nil then
		local var4364 = self.background_header_entry:encode()
		local var4365, var4366 = protoModule.writeTag(buff, var4360, 2, protoModule.wireTypes.lengthDelimited)
		var4365, var4366 = protoModule.writeBuffer(var4365, var4366, var4364, buffer.len(var4364))
		buff = var4365
		var4360 = var4366
	end
	if self.layout_variant ~= nil and self.layout_variant ~= "" then
		local var4367, var4368 = protoModule.writeTag(buff, var4360, 3, protoModule.wireTypes.lengthDelimited)
		var4367, var4368 = protoModule.writeString(var4367, var4368, self.layout_variant)
		buff = var4367
		var4360 = var4368
	end
	local buff_1 = buffer.create(var4360)
	buffer.copy(buff_1, 0, buff, 0, var4360)
	
	return buff_1
end

function t_112.decode(p225)
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var4370 = t_112.new()
	local var4371 = 0
	while var4371 < buffer.len(p225) do
		local _ = nil
		local var4372 = nil
		local var4373, var4374, var4375 = protoModule.readTag(p225, var4371)
		local var4376 = var4373
		var4372 = var4374
		var4371 = var4375
		
		if var4372 == protoModule.wireTypes.varint then
			local _ = nil
			local var4377, var4378 = protoModule.readVarInt(p225, var4371)
			local _ = var4377
			var4371 = var4378
			continue
		end
		if var4372 == protoModule.wireTypes.lengthDelimited then
			if var4376 == 1 then
				local _ = nil
				local var4379, var4380 = protoModule.readBuffer(p225, var4371)
				var4371 = var4380
				var4370.foreground_header_entry = t.ForegroundHeaderEntry.decode(var4379)
			elseif var4376 == 2 then
				local _ = nil
				local var4381, var4382 = protoModule.readBuffer(p225, var4371)
				var4371 = var4382
				var4370.background_header_entry = t.BackgroundHeaderEntry.decode(var4381)
			elseif var4376 == 3 then
				local _ = nil
				local var4383, var4384 = protoModule.readBuffer(p225, var4371)
				var4371 = var4384
				var4370.layout_variant = buffer.tostring(var4383)
			else
				local _ = nil
				local var4385, var4386 = protoModule.readVarInt(p225, var4371)
				var4371 = var4386 + var4385
			end
		elseif var4372 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4387, var4388 = protoModule.readFixed32(p225, var4371)
			local _ = var4387
			var4371 = var4388
		elseif var4372 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4389, var4390 = protoModule.readFixed64(p225, var4371)
			local _ = var4389
			var4371 = var4390
		else
			error("Unsupported wire type: " .. var4372)
		end
	end
	return var4370
end

function t_112:jsonEncode()
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

function t_112:jsonDecode()
	-- upvalues: t_112 (ref), t (ref)
	local var4392 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var4392.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var4392.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var4392.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var4392.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	if self.layout_variant ~= nil then
		var4392.layout_variant = self.layout_variant
	end
	if self.layoutVariant ~= nil then
		var4392.layout_variant = self.layoutVariant
	end
	return var4392
end

t_112.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_112
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p226)
	-- upvalues: t_113 (ref)
	return setmetatable({
		cta_button_text = if p226 == nil or p226.cta_button_text == nil then "" else p226.cta_button_text,
		cta_type = if p226 == nil or p226.cta_type == nil then "" else p226.cta_type
	}, t_113)
end

function t_113:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4394 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4395, var4396 = protoModule.writeTag(buff, var4394, 1, protoModule.wireTypes.lengthDelimited)
		var4395, var4396 = protoModule.writeString(var4395, var4396, self.cta_button_text)
		buff = var4395
		var4394 = var4396
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var4397, var4398 = protoModule.writeTag(buff, var4394, 2, protoModule.wireTypes.lengthDelimited)
		var4397, var4398 = protoModule.writeString(var4397, var4398, self.cta_type)
		buff = var4397
		var4394 = var4398
	end
	local buff_1 = buffer.create(var4394)
	buffer.copy(buff_1, 0, buff, 0, var4394)
	
	return buff_1
end

function t_113.decode(p227)
	-- upvalues: t_113 (ref), protoModule (ref)
	local var4400 = t_113.new()
	local var4401 = 0
	while var4401 < buffer.len(p227) do
		local _ = nil
		local var4402 = nil
		local var4403, var4404, var4405 = protoModule.readTag(p227, var4401)
		local var4406 = var4403
		var4402 = var4404
		var4401 = var4405
		
		if var4402 == protoModule.wireTypes.varint then
			local _ = nil
			local var4407, var4408 = protoModule.readVarInt(p227, var4401)
			local _ = var4407
			var4401 = var4408
			continue
		end
		if var4402 == protoModule.wireTypes.lengthDelimited then
			if var4406 == 1 then
				local _ = nil
				local var4409, var4410 = protoModule.readBuffer(p227, var4401)
				var4401 = var4410
				var4400.cta_button_text = buffer.tostring(var4409)
			elseif var4406 == 2 then
				local _ = nil
				local var4411, var4412 = protoModule.readBuffer(p227, var4401)
				var4401 = var4412
				var4400.cta_type = buffer.tostring(var4411)
			else
				local _ = nil
				local var4413, var4414 = protoModule.readVarInt(p227, var4401)
				var4401 = var4414 + var4413
			end
		elseif var4402 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4415, var4416 = protoModule.readFixed32(p227, var4401)
			local _ = var4415
			var4401 = var4416
		elseif var4402 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4417, var4418 = protoModule.readFixed64(p227, var4401)
			local _ = var4417
			var4401 = var4418
		else
			error("Unsupported wire type: " .. var4402)
		end
	end
	return var4400
end

function t_113:jsonEncode()
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_113:jsonDecode()
	-- upvalues: t_113 (ref)
	local var4420 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var4420.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4420.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var4420.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var4420.cta_type = self.ctaType
	end
	return var4420
end

t_113.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_113
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p228)
	-- upvalues: t_114 (ref)
	return setmetatable({
		title = if p228 == nil or p228.title == nil then "" else p228.title,
		cta_button_text = if p228 == nil or p228.cta_button_text == nil then "" else p228.cta_button_text,
		image_asset_id = if p228 == nil or p228.image_asset_id == nil then "" else p228.image_asset_id,
		cta_type = if p228 == nil or p228.cta_type == nil then "" else p228.cta_type
	}, t_114)
end

function t_114:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4422 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var4423, var4424 = protoModule.writeTag(buff, var4422, 1, protoModule.wireTypes.lengthDelimited)
		var4423, var4424 = protoModule.writeString(var4423, var4424, self.title)
		buff = var4423
		var4422 = var4424
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4425, var4426 = protoModule.writeTag(buff, var4422, 2, protoModule.wireTypes.lengthDelimited)
		var4425, var4426 = protoModule.writeString(var4425, var4426, self.cta_button_text)
		buff = var4425
		var4422 = var4426
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var4427, var4428 = protoModule.writeTag(buff, var4422, 3, protoModule.wireTypes.lengthDelimited)
		var4427, var4428 = protoModule.writeString(var4427, var4428, self.image_asset_id)
		buff = var4427
		var4422 = var4428
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var4429, var4430 = protoModule.writeTag(buff, var4422, 4, protoModule.wireTypes.lengthDelimited)
		var4429, var4430 = protoModule.writeString(var4429, var4430, self.cta_type)
		buff = var4429
		var4422 = var4430
	end
	local buff_1 = buffer.create(var4422)
	buffer.copy(buff_1, 0, buff, 0, var4422)
	
	return buff_1
end

function t_114.decode(p229)
	-- upvalues: t_114 (ref), protoModule (ref)
	local var4432 = t_114.new()
	local var4433 = 0
	while var4433 < buffer.len(p229) do
		local _ = nil
		local var4434 = nil
		local var4435, var4436, var4437 = protoModule.readTag(p229, var4433)
		local var4438 = var4435
		var4434 = var4436
		var4433 = var4437
		
		if var4434 == protoModule.wireTypes.varint then
			local _ = nil
			local var4439, var4440 = protoModule.readVarInt(p229, var4433)
			local _ = var4439
			var4433 = var4440
			continue
		end
		if var4434 == protoModule.wireTypes.lengthDelimited then
			if var4438 == 1 then
				local _ = nil
				local var4441, var4442 = protoModule.readBuffer(p229, var4433)
				var4433 = var4442
				var4432.title = buffer.tostring(var4441)
			elseif var4438 == 2 then
				local _ = nil
				local var4443, var4444 = protoModule.readBuffer(p229, var4433)
				var4433 = var4444
				var4432.cta_button_text = buffer.tostring(var4443)
			elseif var4438 == 3 then
				local _ = nil
				local var4445, var4446 = protoModule.readBuffer(p229, var4433)
				var4433 = var4446
				var4432.image_asset_id = buffer.tostring(var4445)
			elseif var4438 == 4 then
				local _ = nil
				local var4447, var4448 = protoModule.readBuffer(p229, var4433)
				var4433 = var4448
				var4432.cta_type = buffer.tostring(var4447)
			else
				local _ = nil
				local var4449, var4450 = protoModule.readVarInt(p229, var4433)
				var4433 = var4450 + var4449
			end
		elseif var4434 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4451, var4452 = protoModule.readFixed32(p229, var4433)
			local _ = var4451
			var4433 = var4452
		elseif var4434 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4453, var4454 = protoModule.readFixed64(p229, var4433)
			local _ = var4453
			var4433 = var4454
		else
			error("Unsupported wire type: " .. var4434)
		end
	end
	return var4432
end

function t_114:jsonEncode()
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

function t_114:jsonDecode()
	-- upvalues: t_114 (ref)
	local var4456 = t_114.new()
	
	if self.title ~= nil then
		var4456.title = self.title
	end
	if self.cta_button_text ~= nil then
		var4456.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4456.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var4456.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4456.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var4456.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var4456.cta_type = self.ctaType
	end
	return var4456
end

t_114.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_114
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p230)
	-- upvalues: t_115 (ref)
	return setmetatable({
		universe_id = if p230 == nil or p230.universe_id == nil then nil else p230.universe_id,
		title = if p230 == nil or p230.title == nil then nil else p230.title,
		subtitle = if p230 == nil or p230.subtitle == nil then nil else p230.subtitle,
		badge_text = if p230 == nil or p230.badge_text == nil then nil else p230.badge_text,
		foreground = if p230 == nil or p230.foreground == nil then nil else p230.foreground,
		background = if p230 == nil or p230.background == nil then nil else p230.background,
		title_image = if p230 == nil or p230.title_image == nil then nil else p230.title_image,
		asset_title = if p230 == nil or p230.asset_title == nil then nil else p230.asset_title,
		asset_subtitle = if p230 == nil or p230.asset_subtitle == nil then nil else p230.asset_subtitle,
		gradient = if p230 == nil or p230.gradient == nil then nil else p230.gradient,
		playable_text = if p230 == nil or p230.playable_text == nil then nil else p230.playable_text
	}, t_115)
end

function t_115:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4458 = 0
	
	if self.universe_id ~= nil then
		local var4459, var4460 = protoModule.writeTag(buff, var4458, 1, protoModule.wireTypes.lengthDelimited)
		var4459, var4460 = protoModule.writeString(var4459, var4460, self.universe_id)
		buff = var4459
		var4458 = var4460
	end
	if self.title ~= nil then
		local var4461, var4462 = protoModule.writeTag(buff, var4458, 2, protoModule.wireTypes.lengthDelimited)
		var4461, var4462 = protoModule.writeString(var4461, var4462, self.title)
		buff = var4461
		var4458 = var4462
	end
	if self.subtitle ~= nil then
		local var4463, var4464 = protoModule.writeTag(buff, var4458, 3, protoModule.wireTypes.lengthDelimited)
		var4463, var4464 = protoModule.writeString(var4463, var4464, self.subtitle)
		buff = var4463
		var4458 = var4464
	end
	if self.badge_text ~= nil then
		local var4465, var4466 = protoModule.writeTag(buff, var4458, 4, protoModule.wireTypes.lengthDelimited)
		var4465, var4466 = protoModule.writeString(var4465, var4466, self.badge_text)
		buff = var4465
		var4458 = var4466
	end
	if self.foreground ~= nil then
		local var4467 = self.foreground:encode()
		local var4468, var4469 = protoModule.writeTag(buff, var4458, 5, protoModule.wireTypes.lengthDelimited)
		var4468, var4469 = protoModule.writeBuffer(var4468, var4469, var4467, buffer.len(var4467))
		buff = var4468
		var4458 = var4469
	end
	if self.background ~= nil then
		local var4470 = self.background:encode()
		local var4471, var4472 = protoModule.writeTag(buff, var4458, 6, protoModule.wireTypes.lengthDelimited)
		var4471, var4472 = protoModule.writeBuffer(var4471, var4472, var4470, buffer.len(var4470))
		buff = var4471
		var4458 = var4472
	end
	if self.title_image ~= nil then
		local var4473 = self.title_image:encode()
		local var4474, var4475 = protoModule.writeTag(buff, var4458, 7, protoModule.wireTypes.lengthDelimited)
		var4474, var4475 = protoModule.writeBuffer(var4474, var4475, var4473, buffer.len(var4473))
		buff = var4474
		var4458 = var4475
	end
	if self.asset_title ~= nil then
		local var4476, var4477 = protoModule.writeTag(buff, var4458, 8, protoModule.wireTypes.lengthDelimited)
		var4476, var4477 = protoModule.writeString(var4476, var4477, self.asset_title)
		buff = var4476
		var4458 = var4477
	end
	if self.asset_subtitle ~= nil then
		local var4478, var4479 = protoModule.writeTag(buff, var4458, 9, protoModule.wireTypes.lengthDelimited)
		var4478, var4479 = protoModule.writeString(var4478, var4479, self.asset_subtitle)
		buff = var4478
		var4458 = var4479
	end
	if self.gradient ~= nil then
		local var4480 = self.gradient:encode()
		local var4481, var4482 = protoModule.writeTag(buff, var4458, 10, protoModule.wireTypes.lengthDelimited)
		var4481, var4482 = protoModule.writeBuffer(var4481, var4482, var4480, buffer.len(var4480))
		buff = var4481
		var4458 = var4482
	end
	if self.playable_text ~= nil then
		local var4483, var4484 = protoModule.writeTag(buff, var4458, 11, protoModule.wireTypes.lengthDelimited)
		var4483, var4484 = protoModule.writeString(var4483, var4484, self.playable_text)
		buff = var4483
		var4458 = var4484
	end
	local buff_1 = buffer.create(var4458)
	buffer.copy(buff_1, 0, buff, 0, var4458)
	
	return buff_1
end

function t_115.decode(p231)
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var4486 = t_115.new()
	local var4487 = 0
	while var4487 < buffer.len(p231) do
		local _ = nil
		local var4488 = nil
		local var4489, var4490, var4491 = protoModule.readTag(p231, var4487)
		local var4492 = var4489
		var4488 = var4490
		var4487 = var4491
		
		if var4488 == protoModule.wireTypes.varint then
			local _ = nil
			local var4493, var4494 = protoModule.readVarInt(p231, var4487)
			local _ = var4493
			var4487 = var4494
			continue
		end
		if var4488 == protoModule.wireTypes.lengthDelimited then
			if var4492 == 1 then
				local _ = nil
				local var4495, var4496 = protoModule.readBuffer(p231, var4487)
				var4487 = var4496
				var4486.universe_id = buffer.tostring(var4495)
			elseif var4492 == 2 then
				local _ = nil
				local var4497, var4498 = protoModule.readBuffer(p231, var4487)
				var4487 = var4498
				var4486.title = buffer.tostring(var4497)
			elseif var4492 == 3 then
				local _ = nil
				local var4499, var4500 = protoModule.readBuffer(p231, var4487)
				var4487 = var4500
				var4486.subtitle = buffer.tostring(var4499)
			elseif var4492 == 4 then
				local _ = nil
				local var4501, var4502 = protoModule.readBuffer(p231, var4487)
				var4487 = var4502
				var4486.badge_text = buffer.tostring(var4501)
			elseif var4492 == 5 then
				local _ = nil
				local var4503, var4504 = protoModule.readBuffer(p231, var4487)
				var4487 = var4504
				var4486.foreground = t.HeroUnitInputData_VisualAsset.decode(var4503)
			elseif var4492 == 6 then
				local _ = nil
				local var4505, var4506 = protoModule.readBuffer(p231, var4487)
				var4487 = var4506
				var4486.background = t.HeroUnitInputData_VisualAsset.decode(var4505)
			elseif var4492 == 7 then
				local _ = nil
				local var4507, var4508 = protoModule.readBuffer(p231, var4487)
				var4487 = var4508
				var4486.title_image = t.HeroUnitInputData_VisualAsset.decode(var4507)
			elseif var4492 == 8 then
				local _ = nil
				local var4509, var4510 = protoModule.readBuffer(p231, var4487)
				var4487 = var4510
				var4486.asset_title = buffer.tostring(var4509)
			elseif var4492 == 9 then
				local _ = nil
				local var4511, var4512 = protoModule.readBuffer(p231, var4487)
				var4487 = var4512
				var4486.asset_subtitle = buffer.tostring(var4511)
			elseif var4492 == 10 then
				local _ = nil
				local var4513, var4514 = protoModule.readBuffer(p231, var4487)
				var4487 = var4514
				var4486.gradient = t.HeroUnitInputData_Gradient.decode(var4513)
			elseif var4492 == 11 then
				local _ = nil
				local var4515, var4516 = protoModule.readBuffer(p231, var4487)
				var4487 = var4516
				var4486.playable_text = buffer.tostring(var4515)
			else
				local _ = nil
				local var4517, var4518 = protoModule.readVarInt(p231, var4487)
				var4487 = var4518 + var4517
			end
		elseif var4488 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4519, var4520 = protoModule.readFixed32(p231, var4487)
			local _ = var4519
			var4487 = var4520
		elseif var4488 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4521, var4522 = protoModule.readFixed64(p231, var4487)
			local _ = var4521
			var4487 = var4522
		else
			error("Unsupported wire type: " .. var4488)
		end
	end
	return var4486
end

function t_115:jsonEncode()
	local t = {}
	
	if self.universe_id ~= nil then
		t.universeId = self.universe_id
	end
	if self.title ~= nil then
		t.title = self.title
	end
	if self.subtitle ~= nil then
		t.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		t.badgeText = self.badge_text
	end
	if self.foreground ~= nil then
		t.foreground = self.foreground:jsonEncode()
	end
	if self.background ~= nil then
		t.background = self.background:jsonEncode()
	end
	if self.title_image ~= nil then
		t.titleImage = self.title_image:jsonEncode()
	end
	if self.asset_title ~= nil then
		t.assetTitle = self.asset_title
	end
	if self.asset_subtitle ~= nil then
		t.assetSubtitle = self.asset_subtitle
	end
	if self.gradient ~= nil then
		t.gradient = self.gradient:jsonEncode()
	end
	if self.playable_text ~= nil then
		t.playableText = self.playable_text
	end
	return t
end

function t_115:jsonDecode()
	-- upvalues: t_115 (ref), t (ref)
	local var4524 = t_115.new()
	
	if self.universe_id ~= nil then
		var4524.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var4524.universe_id = self.universeId
	end
	if self.title ~= nil then
		var4524.title = self.title
	end
	if self.subtitle ~= nil then
		var4524.subtitle = self.subtitle
	end
	if self.badge_text ~= nil then
		var4524.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var4524.badge_text = self.badgeText
	end
	if self.foreground ~= nil then
		var4524.foreground = t.HeroUnitInputData_VisualAsset.jsonDecode(self.foreground)
	end
	if self.background ~= nil then
		var4524.background = t.HeroUnitInputData_VisualAsset.jsonDecode(self.background)
	end
	if self.title_image ~= nil then
		var4524.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.title_image)
	end
	if self.titleImage ~= nil then
		var4524.title_image = t.HeroUnitInputData_VisualAsset.jsonDecode(self.titleImage)
	end
	if self.asset_title ~= nil then
		var4524.asset_title = self.asset_title
	end
	if self.assetTitle ~= nil then
		var4524.asset_title = self.assetTitle
	end
	if self.asset_subtitle ~= nil then
		var4524.asset_subtitle = self.asset_subtitle
	end
	if self.assetSubtitle ~= nil then
		var4524.asset_subtitle = self.assetSubtitle
	end
	if self.gradient ~= nil then
		var4524.gradient = t.HeroUnitInputData_Gradient.jsonDecode(self.gradient)
	end
	if self.playable_text ~= nil then
		var4524.playable_text = self.playable_text
	end
	if self.playableText ~= nil then
		var4524.playable_text = self.playableText
	end
	return var4524
end

t_115.descriptor = {
	name = "HeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.HeroUnitInputData"
}
t.HeroUnitInputData = t_115
typeRegistryModule.default:register(t.HeroUnitInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p232)
	-- upvalues: t_116 (ref)
	return setmetatable({
		asset_id = if p232 == nil or p232.asset_id == nil then "" else p232.asset_id,
		aspect_ratio = if p232 == nil or p232.aspect_ratio == nil then nil else p232.aspect_ratio,
		enable_animation = if p232 == nil or p232.enable_animation == nil then nil else p232.enable_animation
	}, t_116)
end

function t_116:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4526 = 0
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		local var4527, var4528 = protoModule.writeTag(buff, var4526, 1, protoModule.wireTypes.lengthDelimited)
		var4527, var4528 = protoModule.writeString(var4527, var4528, self.asset_id)
		buff = var4527
		var4526 = var4528
	end
	if self.aspect_ratio ~= nil then
		local var4529, var4530 = protoModule.writeTag(buff, var4526, 2, protoModule.wireTypes.i64)
		var4529, var4530 = protoModule.writeDouble(var4529, var4530, self.aspect_ratio)
		buff = var4529
		var4526 = var4530
	end
	if self.enable_animation ~= nil then
		local var4531, var4532 = protoModule.writeTag(buff, var4526, 3, protoModule.wireTypes.varint)
		var4531, var4532 = protoModule.writeVarInt(var4531, var4532, if self.enable_animation then 1 else 0)
		buff = var4531
		var4526 = var4532
	end
	local buff_1 = buffer.create(var4526)
	buffer.copy(buff_1, 0, buff, 0, var4526)
	
	return buff_1
end

function t_116.decode(p233)
	-- upvalues: t_116 (ref), protoModule (ref)
	local var4534 = t_116.new()
	local var4535 = 0
	while var4535 < buffer.len(p233) do
		local _ = nil
		local var4536 = nil
		local var4537, var4538, var4539 = protoModule.readTag(p233, var4535)
		local var4540 = var4537
		var4536 = var4538
		var4535 = var4539
		
		if var4536 == protoModule.wireTypes.varint then
			if var4540 == 3 then
				local _ = nil
				local var4541, var4542 = protoModule.readVarInt(p233, var4535)
				var4535 = var4542
				var4534.enable_animation = var4541 ~= 0
			else
				local _ = nil
				local var4543, var4544 = protoModule.readVarInt(p233, var4535)
				local _ = var4543
				var4535 = var4544
			end
		end
		if var4536 == protoModule.wireTypes.lengthDelimited then
			if var4540 == 1 then
				local _ = nil
				local var4545, var4546 = protoModule.readBuffer(p233, var4535)
				var4535 = var4546
				var4534.asset_id = buffer.tostring(var4545)
			else
				local _ = nil
				local var4547, var4548 = protoModule.readVarInt(p233, var4535)
				var4535 = var4548 + var4547
			end
		elseif var4536 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4549, var4550 = protoModule.readFixed32(p233, var4535)
			local _ = var4549
			var4535 = var4550
		elseif var4536 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4536)
		elseif var4540 == 2 then
			local _ = nil
			local var4551, var4552 = protoModule.readDouble(p233, var4535)
			var4535 = var4552
			var4534.aspect_ratio = var4551
		else
			local _ = nil
			local var4553, var4554 = protoModule.readFixed64(p233, var4535)
			local _ = var4553
			var4535 = var4554
		end
	end
	return var4534
end

function t_116:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.asset_id ~= nil and self.asset_id ~= "" then
		t.assetId = self.asset_id
	end
	if self.aspect_ratio ~= nil then
		t.aspectRatio = protoModule.json.serializeNumber(self.aspect_ratio)
	end
	if self.enable_animation ~= nil then
		t.enableAnimation = self.enable_animation
	end
	return t
end

function t_116:jsonDecode()
	-- upvalues: t_116 (ref), protoModule (ref)
	local var4556 = t_116.new()
	
	if self.asset_id ~= nil then
		var4556.asset_id = self.asset_id
	end
	if self.assetId ~= nil then
		var4556.asset_id = self.assetId
	end
	if self.aspect_ratio ~= nil then
		var4556.aspect_ratio = protoModule.json.deserializeNumber(self.aspect_ratio)
	end
	if self.aspectRatio ~= nil then
		var4556.aspect_ratio = protoModule.json.deserializeNumber(self.aspectRatio)
	end
	if self.enable_animation ~= nil then
		var4556.enable_animation = self.enable_animation
	end
	if self.enableAnimation ~= nil then
		var4556.enable_animation = self.enableAnimation
	end
	return var4556
end

t_116.descriptor = {
	name = "HeroUnitInputData_VisualAsset",
	fullName = "roblox.apppageplatform.shared.v1beta1.VisualAsset"
}
t.HeroUnitInputData_VisualAsset = t_116
typeRegistryModule.default:register(t.HeroUnitInputData_VisualAsset)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p234)
	-- upvalues: t_117 (ref)
	return setmetatable({
		start_color = if p234 == nil or p234.start_color == nil then nil else p234.start_color,
		end_color = if p234 == nil or p234.end_color == nil then nil else p234.end_color,
		start_opacity = if p234 == nil or p234.start_opacity == nil then nil else p234.start_opacity,
		end_opacity = if p234 == nil or p234.end_opacity == nil then nil else p234.end_opacity,
		degree = if p234 == nil or p234.degree == nil then nil else p234.degree
	}, t_117)
end

function t_117:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4558 = 0
	
	if self.start_color ~= nil then
		local var4559, var4560 = protoModule.writeTag(buff, var4558, 1, protoModule.wireTypes.lengthDelimited)
		var4559, var4560 = protoModule.writeString(var4559, var4560, self.start_color)
		buff = var4559
		var4558 = var4560
	end
	if self.end_color ~= nil then
		local var4561, var4562 = protoModule.writeTag(buff, var4558, 2, protoModule.wireTypes.lengthDelimited)
		var4561, var4562 = protoModule.writeString(var4561, var4562, self.end_color)
		buff = var4561
		var4558 = var4562
	end
	if self.start_opacity ~= nil then
		local var4563, var4564 = protoModule.writeTag(buff, var4558, 3, protoModule.wireTypes.i64)
		var4563, var4564 = protoModule.writeDouble(var4563, var4564, self.start_opacity)
		buff = var4563
		var4558 = var4564
	end
	if self.end_opacity ~= nil then
		local var4565, var4566 = protoModule.writeTag(buff, var4558, 4, protoModule.wireTypes.i64)
		var4565, var4566 = protoModule.writeDouble(var4565, var4566, self.end_opacity)
		buff = var4565
		var4558 = var4566
	end
	if self.degree ~= nil then
		local var4567, var4568 = protoModule.writeTag(buff, var4558, 5, protoModule.wireTypes.i64)
		var4567, var4568 = protoModule.writeDouble(var4567, var4568, self.degree)
		buff = var4567
		var4558 = var4568
	end
	local buff_1 = buffer.create(var4558)
	buffer.copy(buff_1, 0, buff, 0, var4558)
	
	return buff_1
end

function t_117.decode(p235)
	-- upvalues: t_117 (ref), protoModule (ref)
	local var4570 = t_117.new()
	local var4571 = 0
	while var4571 < buffer.len(p235) do
		local _ = nil
		local var4572 = nil
		local var4573, var4574, var4575 = protoModule.readTag(p235, var4571)
		local var4576 = var4573
		var4572 = var4574
		var4571 = var4575
		
		if var4572 == protoModule.wireTypes.varint then
			local _ = nil
			local var4577, var4578 = protoModule.readVarInt(p235, var4571)
			local _ = var4577
			var4571 = var4578
			continue
		end
		if var4572 == protoModule.wireTypes.lengthDelimited then
			if var4576 == 1 then
				local _ = nil
				local var4579, var4580 = protoModule.readBuffer(p235, var4571)
				var4571 = var4580
				var4570.start_color = buffer.tostring(var4579)
			elseif var4576 == 2 then
				local _ = nil
				local var4581, var4582 = protoModule.readBuffer(p235, var4571)
				var4571 = var4582
				var4570.end_color = buffer.tostring(var4581)
			else
				local _ = nil
				local var4583, var4584 = protoModule.readVarInt(p235, var4571)
				var4571 = var4584 + var4583
			end
		elseif var4572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4585, var4586 = protoModule.readFixed32(p235, var4571)
			local _ = var4585
			var4571 = var4586
		elseif var4572 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4572)
		elseif var4576 == 3 then
			local _ = nil
			local var4587, var4588 = protoModule.readDouble(p235, var4571)
			var4571 = var4588
			var4570.start_opacity = var4587
		elseif var4576 == 4 then
			local _ = nil
			local var4589, var4590 = protoModule.readDouble(p235, var4571)
			var4571 = var4590
			var4570.end_opacity = var4589
		elseif var4576 == 5 then
			local _ = nil
			local var4591, var4592 = protoModule.readDouble(p235, var4571)
			var4571 = var4592
			var4570.degree = var4591
		else
			local _ = nil
			local var4593, var4594 = protoModule.readFixed64(p235, var4571)
			local _ = var4593
			var4571 = var4594
		end
	end
	return var4570
end

function t_117:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.start_color ~= nil then
		t.startColor = self.start_color
	end
	if self.end_color ~= nil then
		t.endColor = self.end_color
	end
	if self.start_opacity ~= nil then
		t.startOpacity = protoModule.json.serializeNumber(self.start_opacity)
	end
	if self.end_opacity ~= nil then
		t.endOpacity = protoModule.json.serializeNumber(self.end_opacity)
	end
	if self.degree ~= nil then
		t.degree = protoModule.json.serializeNumber(self.degree)
	end
	return t
end

function t_117:jsonDecode()
	-- upvalues: t_117 (ref), protoModule (ref)
	local var4596 = t_117.new()
	
	if self.start_color ~= nil then
		var4596.start_color = self.start_color
	end
	if self.startColor ~= nil then
		var4596.start_color = self.startColor
	end
	if self.end_color ~= nil then
		var4596.end_color = self.end_color
	end
	if self.endColor ~= nil then
		var4596.end_color = self.endColor
	end
	if self.start_opacity ~= nil then
		var4596.start_opacity = protoModule.json.deserializeNumber(self.start_opacity)
	end
	if self.startOpacity ~= nil then
		var4596.start_opacity = protoModule.json.deserializeNumber(self.startOpacity)
	end
	if self.end_opacity ~= nil then
		var4596.end_opacity = protoModule.json.deserializeNumber(self.end_opacity)
	end
	if self.endOpacity ~= nil then
		var4596.end_opacity = protoModule.json.deserializeNumber(self.endOpacity)
	end
	if self.degree ~= nil then
		var4596.degree = protoModule.json.deserializeNumber(self.degree)
	end
	return var4596
end

t_117.descriptor = {
	name = "HeroUnitInputData_Gradient",
	fullName = "roblox.apppageplatform.shared.v1beta1.Gradient"
}
t.HeroUnitInputData_Gradient = t_117
typeRegistryModule.default:register(t.HeroUnitInputData_Gradient)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p236)
	-- upvalues: t_118 (ref)
	return setmetatable({
		items = if p236 == nil or p236.items == nil then {} else p236.items,
		sort_id = if p236 == nil or p236.sort_id == nil then "" else p236.sort_id,
		recommendation_request_id = if p236 == nil or p236.recommendation_request_id == nil then "" else p236.recommendation_request_id
	}, t_118)
end

function t_118:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4598 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4599 = v:encode()
			local var4600, var4601 = protoModule.writeTag(buff, var4598, 1, protoModule.wireTypes.lengthDelimited)
			var4600, var4601 = protoModule.writeBuffer(var4600, var4601, var4599, buffer.len(var4599))
			buff = var4600
			var4598 = var4601
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4602, var4603 = protoModule.writeTag(buff, var4598, 2, protoModule.wireTypes.lengthDelimited)
		var4602, var4603 = protoModule.writeString(var4602, var4603, self.sort_id)
		buff = var4602
		var4598 = var4603
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var4604, var4605 = protoModule.writeTag(buff, var4598, 3, protoModule.wireTypes.lengthDelimited)
		var4604, var4605 = protoModule.writeString(var4604, var4605, self.recommendation_request_id)
		buff = var4604
		var4598 = var4605
	end
	local buff_1 = buffer.create(var4598)
	buffer.copy(buff_1, 0, buff, 0, var4598)
	
	return buff_1
end

function t_118.decode(p237)
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var4607 = t_118.new()
	local var4608 = 0
	while var4608 < buffer.len(p237) do
		local _ = nil
		local var4609 = nil
		local var4610, var4611, var4612 = protoModule.readTag(p237, var4608)
		local var4613 = var4610
		var4609 = var4611
		var4608 = var4612
		
		if var4609 == protoModule.wireTypes.varint then
			local _ = nil
			local var4614, var4615 = protoModule.readVarInt(p237, var4608)
			local _ = var4614
			var4608 = var4615
			continue
		end
		if var4609 == protoModule.wireTypes.lengthDelimited then
			if var4613 == 1 then
				local _ = nil
				local var4616, var4617 = protoModule.readBuffer(p237, var4608)
				var4608 = var4617
				table.insert(var4607.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var4616))
			elseif var4613 == 2 then
				local _ = nil
				local var4618, var4619 = protoModule.readBuffer(p237, var4608)
				var4608 = var4619
				var4607.sort_id = buffer.tostring(var4618)
			elseif var4613 == 3 then
				local _ = nil
				local var4620, var4621 = protoModule.readBuffer(p237, var4608)
				var4608 = var4621
				var4607.recommendation_request_id = buffer.tostring(var4620)
			else
				local _ = nil
				local var4622, var4623 = protoModule.readVarInt(p237, var4608)
				var4608 = var4623 + var4622
			end
		elseif var4609 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4624, var4625 = protoModule.readFixed32(p237, var4608)
			local _ = var4624
			var4608 = var4625
		elseif var4609 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4626, var4627 = protoModule.readFixed64(p237, var4608)
			local _ = var4626
			var4608 = var4627
		else
			error("Unsupported wire type: " .. var4609)
		end
	end
	return var4607
end

function t_118:jsonEncode()
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

function t_118:jsonDecode()
	-- upvalues: t_118 (ref), t (ref)
	local var4630 = t_118.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var4630.items = t_1
	end
	if self.sort_id ~= nil then
		var4630.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4630.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var4630.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var4630.recommendation_request_id = self.recommendationRequestId
	end
	return var4630
end

t_118.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_118
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p238)
	-- upvalues: t_119 (ref)
	return setmetatable({
		user_id = if p238 == nil or p238.user_id == nil then "" else p238.user_id
	}, t_119)
end

function t_119:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4633 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var4634, var4635 = protoModule.writeTag(buff, var4633, 1, protoModule.wireTypes.lengthDelimited)
		var4634, var4635 = protoModule.writeString(var4634, var4635, self.user_id)
		buff = var4634
		var4633 = var4635
	end
	local buff_1 = buffer.create(var4633)
	buffer.copy(buff_1, 0, buff, 0, var4633)
	
	return buff_1
end

function t_119.decode(p239)
	-- upvalues: t_119 (ref), protoModule (ref)
	local var4637 = t_119.new()
	local var4638 = 0
	while var4638 < buffer.len(p239) do
		local _ = nil
		local var4639 = nil
		local var4640, var4641, var4642 = protoModule.readTag(p239, var4638)
		local var4643 = var4640
		var4639 = var4641
		var4638 = var4642
		
		if var4639 == protoModule.wireTypes.varint then
			local _ = nil
			local var4644, var4645 = protoModule.readVarInt(p239, var4638)
			local _ = var4644
			var4638 = var4645
			continue
		end
		if var4639 == protoModule.wireTypes.lengthDelimited then
			if var4643 == 1 then
				local _ = nil
				local var4646, var4647 = protoModule.readBuffer(p239, var4638)
				var4638 = var4647
				var4637.user_id = buffer.tostring(var4646)
			else
				local _ = nil
				local var4648, var4649 = protoModule.readVarInt(p239, var4638)
				var4638 = var4649 + var4648
			end
		elseif var4639 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4650, var4651 = protoModule.readFixed32(p239, var4638)
			local _ = var4650
			var4638 = var4651
		elseif var4639 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4652, var4653 = protoModule.readFixed64(p239, var4638)
			local _ = var4652
			var4638 = var4653
		else
			error("Unsupported wire type: " .. var4639)
		end
	end
	return var4637
end

function t_119:jsonEncode()
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_119:jsonDecode()
	-- upvalues: t_119 (ref)
	local var4655 = t_119.new()
	
	if self.user_id ~= nil then
		var4655.user_id = self.user_id
	end
	if self.userId ~= nil then
		var4655.user_id = self.userId
	end
	return var4655
end

t_119.descriptor = {
	name = "FriendRecommendationCarouselInputData_UserRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendation"
}
t.FriendRecommendationCarouselInputData_UserRecommendation = t_119
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_UserRecommendation)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p240)
	-- upvalues: t_120 (ref)
	return setmetatable({
		contact_id = if p240 == nil or p240.contact_id == nil then "" else p240.contact_id
	}, t_120)
end

function t_120:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4657 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var4658, var4659 = protoModule.writeTag(buff, var4657, 1, protoModule.wireTypes.lengthDelimited)
		var4658, var4659 = protoModule.writeString(var4658, var4659, self.contact_id)
		buff = var4658
		var4657 = var4659
	end
	local buff_1 = buffer.create(var4657)
	buffer.copy(buff_1, 0, buff, 0, var4657)
	
	return buff_1
end

function t_120.decode(p241)
	-- upvalues: t_120 (ref), protoModule (ref)
	local var4661 = t_120.new()
	local var4662 = 0
	while var4662 < buffer.len(p241) do
		local _ = nil
		local var4663 = nil
		local var4664, var4665, var4666 = protoModule.readTag(p241, var4662)
		local var4667 = var4664
		var4663 = var4665
		var4662 = var4666
		
		if var4663 == protoModule.wireTypes.varint then
			local _ = nil
			local var4668, var4669 = protoModule.readVarInt(p241, var4662)
			local _ = var4668
			var4662 = var4669
			continue
		end
		if var4663 == protoModule.wireTypes.lengthDelimited then
			if var4667 == 1 then
				local _ = nil
				local var4670, var4671 = protoModule.readBuffer(p241, var4662)
				var4662 = var4671
				var4661.contact_id = buffer.tostring(var4670)
			else
				local _ = nil
				local var4672, var4673 = protoModule.readVarInt(p241, var4662)
				var4662 = var4673 + var4672
			end
		elseif var4663 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4674, var4675 = protoModule.readFixed32(p241, var4662)
			local _ = var4674
			var4662 = var4675
		elseif var4663 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4676, var4677 = protoModule.readFixed64(p241, var4662)
			local _ = var4676
			var4662 = var4677
		else
			error("Unsupported wire type: " .. var4663)
		end
	end
	return var4661
end

function t_120:jsonEncode()
	local t = {}
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		t.contactId = self.contact_id
	end
	return t
end

function t_120:jsonDecode()
	-- upvalues: t_120 (ref)
	local var4679 = t_120.new()
	
	if self.contact_id ~= nil then
		var4679.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var4679.contact_id = self.contactId
	end
	return var4679
end

t_120.descriptor = {
	name = "FriendRecommendationCarouselInputData_ContactRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactRecommendation"
}
t.FriendRecommendationCarouselInputData_ContactRecommendation = t_120
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_ContactRecommendation)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p242)
	-- upvalues: t_121 (ref)
	return setmetatable({
		kind = if p242 == nil or p242.kind == nil then nil else p242.kind,
		has_pending_friend_request = if p242 == nil or p242.has_pending_friend_request == nil then false else p242.has_pending_friend_request
	}, t_121)
end

function t_121:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4681 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var4682 = self.kind.value:encode()
			local var4683, var4684 = protoModule.writeTag(buff, var4681, 1, protoModule.wireTypes.lengthDelimited)
			var4683, var4684 = protoModule.writeBuffer(var4683, var4684, var4682, buffer.len(var4682))
			buff = var4683
			var4681 = var4684
		elseif self.kind.type == "contact" then
			local var4685 = self.kind.value:encode()
			local var4686, var4687 = protoModule.writeTag(buff, var4681, 2, protoModule.wireTypes.lengthDelimited)
			var4686, var4687 = protoModule.writeBuffer(var4686, var4687, var4685, buffer.len(var4685))
			buff = var4686
			var4681 = var4687
		end
	end
	if self.has_pending_friend_request then
		local var4688, var4689 = protoModule.writeTag(buff, var4681, 3, protoModule.wireTypes.varint)
		var4688, var4689 = protoModule.writeVarInt(var4688, var4689, if self.has_pending_friend_request then 1 else 0)
		buff = var4688
		var4681 = var4689
	end
	local buff_1 = buffer.create(var4681)
	buffer.copy(buff_1, 0, buff, 0, var4681)
	
	return buff_1
end

function t_121.decode(p243)
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var4691 = t_121.new()
	local var4692 = 0
	while var4692 < buffer.len(p243) do
		local _ = nil
		local var4693 = nil
		local var4694, var4695, var4696 = protoModule.readTag(p243, var4692)
		local var4697 = var4694
		var4693 = var4695
		var4692 = var4696
		
		if var4693 == protoModule.wireTypes.varint then
			if var4697 == 3 then
				local _ = nil
				local var4698, var4699 = protoModule.readVarInt(p243, var4692)
				var4692 = var4699
				var4691.has_pending_friend_request = var4698 ~= 0
			else
				local _ = nil
				local var4700, var4701 = protoModule.readVarInt(p243, var4692)
				local _ = var4700
				var4692 = var4701
			end
		end
		if var4693 == protoModule.wireTypes.lengthDelimited then
			if var4697 == 1 then
				local _ = nil
				local var4702, var4703 = protoModule.readBuffer(p243, var4692)
				var4692 = var4703
				var4691.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var4702)
				}
			elseif var4697 == 2 then
				local _ = nil
				local var4704, var4705 = protoModule.readBuffer(p243, var4692)
				var4692 = var4705
				var4691.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var4704)
				}
			else
				local _ = nil
				local var4706, var4707 = protoModule.readVarInt(p243, var4692)
				var4692 = var4707 + var4706
			end
		elseif var4693 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4708, var4709 = protoModule.readFixed32(p243, var4692)
			local _ = var4708
			var4692 = var4709
		elseif var4693 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4710, var4711 = protoModule.readFixed64(p243, var4692)
			local _ = var4710
			var4692 = var4711
		else
			error("Unsupported wire type: " .. var4693)
		end
	end
	return var4691
end

function t_121:jsonEncode()
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

function t_121:jsonDecode()
	-- upvalues: t_121 (ref), t (ref)
	local var4713 = t_121.new()
	
	if self.user ~= nil then
		var4713.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var4713.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var4713.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var4713.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var4713
end

t_121.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_121
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p244)
	-- upvalues: t_122 (ref)
	return setmetatable({
		selected_option = if p244 == nil or p244.selected_option == nil then "" else p244.selected_option,
		sort_id = if p244 == nil or p244.sort_id == nil then "" else p244.sort_id,
		options = if p244 == nil or p244.options == nil then {} else p244.options,
		experience_carousel = if p244 == nil or p244.experience_carousel == nil then nil else p244.experience_carousel,
		feed_item_key = if p244 == nil or p244.feed_item_key == nil then "" else p244.feed_item_key
	}, t_122)
end

function t_122:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4715 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var4716, var4717 = protoModule.writeTag(buff, var4715, 1, protoModule.wireTypes.lengthDelimited)
		var4716, var4717 = protoModule.writeString(var4716, var4717, self.selected_option)
		buff = var4716
		var4715 = var4717
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4718, var4719 = protoModule.writeTag(buff, var4715, 2, protoModule.wireTypes.lengthDelimited)
		var4718, var4719 = protoModule.writeString(var4718, var4719, self.sort_id)
		buff = var4718
		var4715 = var4719
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var4720 = v:encode()
			local var4721, var4722 = protoModule.writeTag(buff, var4715, 3, protoModule.wireTypes.lengthDelimited)
			var4721, var4722 = protoModule.writeBuffer(var4721, var4722, var4720, buffer.len(var4720))
			buff = var4721
			var4715 = var4722
		end
	end
	if self.experience_carousel ~= nil then
		local var4723 = self.experience_carousel:encode()
		local var4724, var4725 = protoModule.writeTag(buff, var4715, 4, protoModule.wireTypes.lengthDelimited)
		var4724, var4725 = protoModule.writeBuffer(var4724, var4725, var4723, buffer.len(var4723))
		buff = var4724
		var4715 = var4725
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var4726, var4727 = protoModule.writeTag(buff, var4715, 5, protoModule.wireTypes.lengthDelimited)
		var4726, var4727 = protoModule.writeString(var4726, var4727, self.feed_item_key)
		buff = var4726
		var4715 = var4727
	end
	local buff_1 = buffer.create(var4715)
	buffer.copy(buff_1, 0, buff, 0, var4715)
	
	return buff_1
end

function t_122.decode(p245)
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var4729 = t_122.new()
	local var4730 = 0
	while var4730 < buffer.len(p245) do
		local _ = nil
		local var4731 = nil
		local var4732, var4733, var4734 = protoModule.readTag(p245, var4730)
		local var4735 = var4732
		var4731 = var4733
		var4730 = var4734
		
		if var4731 == protoModule.wireTypes.varint then
			local _ = nil
			local var4736, var4737 = protoModule.readVarInt(p245, var4730)
			local _ = var4736
			var4730 = var4737
			continue
		end
		if var4731 == protoModule.wireTypes.lengthDelimited then
			if var4735 == 1 then
				local _ = nil
				local var4738, var4739 = protoModule.readBuffer(p245, var4730)
				var4730 = var4739
				var4729.selected_option = buffer.tostring(var4738)
			elseif var4735 == 2 then
				local _ = nil
				local var4740, var4741 = protoModule.readBuffer(p245, var4730)
				var4730 = var4741
				var4729.sort_id = buffer.tostring(var4740)
			elseif var4735 == 3 then
				local _ = nil
				local var4742, var4743 = protoModule.readBuffer(p245, var4730)
				var4730 = var4743
				table.insert(var4729.options, t.SelectorOption.decode(var4742))
			elseif var4735 == 4 then
				local _ = nil
				local var4744, var4745 = protoModule.readBuffer(p245, var4730)
				var4730 = var4745
				var4729.experience_carousel = t.ExperienceCarouselInputData.decode(var4744)
			elseif var4735 == 5 then
				local _ = nil
				local var4746, var4747 = protoModule.readBuffer(p245, var4730)
				var4730 = var4747
				var4729.feed_item_key = buffer.tostring(var4746)
			else
				local _ = nil
				local var4748, var4749 = protoModule.readVarInt(p245, var4730)
				var4730 = var4749 + var4748
			end
		elseif var4731 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4750, var4751 = protoModule.readFixed32(p245, var4730)
			local _ = var4750
			var4730 = var4751
		elseif var4731 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4752, var4753 = protoModule.readFixed64(p245, var4730)
			local _ = var4752
			var4730 = var4753
		else
			error("Unsupported wire type: " .. var4731)
		end
	end
	return var4729
end

function t_122:jsonEncode()
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

function t_122:jsonDecode()
	-- upvalues: t_122 (ref), t (ref)
	local var4756 = t_122.new()
	
	if self.selected_option ~= nil then
		var4756.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var4756.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var4756.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4756.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var4756.options = t_1
	end
	if self.experience_carousel ~= nil then
		var4756.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var4756.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var4756.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var4756.feed_item_key = self.feedItemKey
	end
	return var4756
end

t_122.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_122
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p246)
	-- upvalues: t_123 (ref)
	return setmetatable({
		id = if p246 == nil or p246.id == nil then "" else p246.id,
		display_name = if p246 == nil or p246.display_name == nil then "" else p246.display_name,
		is_selected = if p246 == nil or p246.is_selected == nil then false else p246.is_selected
	}, t_123)
end

function t_123:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4759 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var4760, var4761 = protoModule.writeTag(buff, var4759, 1, protoModule.wireTypes.lengthDelimited)
		var4760, var4761 = protoModule.writeString(var4760, var4761, self.id)
		buff = var4760
		var4759 = var4761
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4762, var4763 = protoModule.writeTag(buff, var4759, 2, protoModule.wireTypes.lengthDelimited)
		var4762, var4763 = protoModule.writeString(var4762, var4763, self.display_name)
		buff = var4762
		var4759 = var4763
	end
	if self.is_selected then
		local var4764, var4765 = protoModule.writeTag(buff, var4759, 3, protoModule.wireTypes.varint)
		var4764, var4765 = protoModule.writeVarInt(var4764, var4765, if self.is_selected then 1 else 0)
		buff = var4764
		var4759 = var4765
	end
	local buff_1 = buffer.create(var4759)
	buffer.copy(buff_1, 0, buff, 0, var4759)
	
	return buff_1
end

function t_123.decode(p247)
	-- upvalues: t_123 (ref), protoModule (ref)
	local var4767 = t_123.new()
	local var4768 = 0
	while var4768 < buffer.len(p247) do
		local _ = nil
		local var4769 = nil
		local var4770, var4771, var4772 = protoModule.readTag(p247, var4768)
		local var4773 = var4770
		var4769 = var4771
		var4768 = var4772
		
		if var4769 == protoModule.wireTypes.varint then
			if var4773 == 3 then
				local _ = nil
				local var4774, var4775 = protoModule.readVarInt(p247, var4768)
				var4768 = var4775
				var4767.is_selected = var4774 ~= 0
			else
				local _ = nil
				local var4776, var4777 = protoModule.readVarInt(p247, var4768)
				local _ = var4776
				var4768 = var4777
			end
		end
		if var4769 == protoModule.wireTypes.lengthDelimited then
			if var4773 == 1 then
				local _ = nil
				local var4778, var4779 = protoModule.readBuffer(p247, var4768)
				var4768 = var4779
				var4767.id = buffer.tostring(var4778)
			elseif var4773 == 2 then
				local _ = nil
				local var4780, var4781 = protoModule.readBuffer(p247, var4768)
				var4768 = var4781
				var4767.display_name = buffer.tostring(var4780)
			else
				local _ = nil
				local var4782, var4783 = protoModule.readVarInt(p247, var4768)
				var4768 = var4783 + var4782
			end
		elseif var4769 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4784, var4785 = protoModule.readFixed32(p247, var4768)
			local _ = var4784
			var4768 = var4785
		elseif var4769 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4786, var4787 = protoModule.readFixed64(p247, var4768)
			local _ = var4786
			var4768 = var4787
		else
			error("Unsupported wire type: " .. var4769)
		end
	end
	return var4767
end

function t_123:jsonEncode()
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

function t_123:jsonDecode()
	-- upvalues: t_123 (ref)
	local var4789 = t_123.new()
	
	if self.id ~= nil then
		var4789.id = self.id
	end
	if self.display_name ~= nil then
		var4789.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var4789.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var4789.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var4789.is_selected = self.isSelected
	end
	return var4789
end

t_123.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_123
typeRegistryModule.default:register(t.SelectorOption)
local t_124 = {}
t_124.__index = t_124

function t_124.new(p248)
	-- upvalues: t_124 (ref)
	return setmetatable({
		cards = if p248 == nil or p248.cards == nil then {} else p248.cards,
		title = if p248 == nil or p248.title == nil then "" else p248.title
	}, t_124)
end

function t_124:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4791 = 0
	
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var4792 = v:encode()
			local var4793, var4794 = protoModule.writeTag(buff, var4791, 1, protoModule.wireTypes.lengthDelimited)
			var4793, var4794 = protoModule.writeBuffer(var4793, var4794, var4792, buffer.len(var4792))
			buff = var4793
			var4791 = var4794
		end
	end
	if self.title ~= nil and self.title ~= "" then
		local var4795, var4796 = protoModule.writeTag(buff, var4791, 2, protoModule.wireTypes.lengthDelimited)
		var4795, var4796 = protoModule.writeString(var4795, var4796, self.title)
		buff = var4795
		var4791 = var4796
	end
	local buff_1 = buffer.create(var4791)
	buffer.copy(buff_1, 0, buff, 0, var4791)
	
	return buff_1
end

function t_124.decode(p249)
	-- upvalues: t_124 (ref), protoModule (ref), t (ref)
	local var4798 = t_124.new()
	local var4799 = 0
	while var4799 < buffer.len(p249) do
		local _ = nil
		local var4800 = nil
		local var4801, var4802, var4803 = protoModule.readTag(p249, var4799)
		local var4804 = var4801
		var4800 = var4802
		var4799 = var4803
		
		if var4800 == protoModule.wireTypes.varint then
			local _ = nil
			local var4805, var4806 = protoModule.readVarInt(p249, var4799)
			local _ = var4805
			var4799 = var4806
			continue
		end
		if var4800 == protoModule.wireTypes.lengthDelimited then
			if var4804 == 1 then
				local _ = nil
				local var4807, var4808 = protoModule.readBuffer(p249, var4799)
				var4799 = var4808
				table.insert(var4798.cards, t.GameItemsCardInputData.decode(var4807))
			elseif var4804 == 2 then
				local _ = nil
				local var4809, var4810 = protoModule.readBuffer(p249, var4799)
				var4799 = var4810
				var4798.title = buffer.tostring(var4809)
			else
				local _ = nil
				local var4811, var4812 = protoModule.readVarInt(p249, var4799)
				var4799 = var4812 + var4811
			end
		elseif var4800 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4813, var4814 = protoModule.readFixed32(p249, var4799)
			local _ = var4813
			var4799 = var4814
		elseif var4800 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4815, var4816 = protoModule.readFixed64(p249, var4799)
			local _ = var4815
			var4799 = var4816
		else
			error("Unsupported wire type: " .. var4800)
		end
	end
	return var4798
end

function t_124:jsonEncode()
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

function t_124:jsonDecode()
	-- upvalues: t_124 (ref), t (ref)
	local var4819 = t_124.new()
	
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.GameItemsCardInputData.jsonDecode(v))
		end
		var4819.cards = t_1
	end
	if self.title ~= nil then
		var4819.title = self.title
	end
	return var4819
end

t_124.descriptor = {
	name = "GameItemsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCarouselInputData"
}
t.GameItemsCarouselInputData = t_124
typeRegistryModule.default:register(t.GameItemsCarouselInputData)
local t_125 = {}
t_125.__index = t_125

function t_125.new(p250)
	-- upvalues: t_125 (ref)
	return setmetatable({
		universe_id = if p250 == nil or p250.universe_id == nil then "" else p250.universe_id,
		items = if p250 == nil or p250.items == nil then {} else p250.items
	}, t_125)
end

function t_125:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4822 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var4823, var4824 = protoModule.writeTag(buff, var4822, 1, protoModule.wireTypes.lengthDelimited)
		var4823, var4824 = protoModule.writeString(var4823, var4824, self.universe_id)
		buff = var4823
		var4822 = var4824
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4825 = v:encode()
			local var4826, var4827 = protoModule.writeTag(buff, var4822, 2, protoModule.wireTypes.lengthDelimited)
			var4826, var4827 = protoModule.writeBuffer(var4826, var4827, var4825, buffer.len(var4825))
			buff = var4826
			var4822 = var4827
		end
	end
	local buff_1 = buffer.create(var4822)
	buffer.copy(buff_1, 0, buff, 0, var4822)
	
	return buff_1
end

function t_125.decode(p251)
	-- upvalues: t_125 (ref), protoModule (ref), t (ref)
	local var4829 = t_125.new()
	local var4830 = 0
	while var4830 < buffer.len(p251) do
		local _ = nil
		local var4831 = nil
		local var4832, var4833, var4834 = protoModule.readTag(p251, var4830)
		local var4835 = var4832
		var4831 = var4833
		var4830 = var4834
		
		if var4831 == protoModule.wireTypes.varint then
			local _ = nil
			local var4836, var4837 = protoModule.readVarInt(p251, var4830)
			local _ = var4836
			var4830 = var4837
			continue
		end
		if var4831 == protoModule.wireTypes.lengthDelimited then
			if var4835 == 1 then
				local _ = nil
				local var4838, var4839 = protoModule.readBuffer(p251, var4830)
				var4830 = var4839
				var4829.universe_id = buffer.tostring(var4838)
			elseif var4835 == 2 then
				local _ = nil
				local var4840, var4841 = protoModule.readBuffer(p251, var4830)
				var4830 = var4841
				table.insert(var4829.items, t.GameItemInputData.decode(var4840))
			else
				local _ = nil
				local var4842, var4843 = protoModule.readVarInt(p251, var4830)
				var4830 = var4843 + var4842
			end
		elseif var4831 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4844, var4845 = protoModule.readFixed32(p251, var4830)
			local _ = var4844
			var4830 = var4845
		elseif var4831 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4846, var4847 = protoModule.readFixed64(p251, var4830)
			local _ = var4846
			var4830 = var4847
		else
			error("Unsupported wire type: " .. var4831)
		end
	end
	return var4829
end

function t_125:jsonEncode()
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

function t_125:jsonDecode()
	-- upvalues: t_125 (ref), t (ref)
	local var4850 = t_125.new()
	
	if self.universe_id ~= nil then
		var4850.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var4850.universe_id = self.universeId
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.GameItemInputData.jsonDecode(v))
		end
		var4850.items = t_1
	end
	return var4850
end

t_125.descriptor = {
	name = "GameItemsCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemsCardInputData"
}
t.GameItemsCardInputData = t_125
typeRegistryModule.default:register(t.GameItemsCardInputData)
local t_126 = {}
t_126.__index = t_126

function t_126.new(p252)
	-- upvalues: t_126 (ref)
	return setmetatable({
		item_id = if p252 == nil or p252.item_id == nil then "" else p252.item_id,
		item_type = if p252 == nil or p252.item_type == nil then "" else p252.item_type
	}, t_126)
end

function t_126:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4853 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var4854, var4855 = protoModule.writeTag(buff, var4853, 1, protoModule.wireTypes.lengthDelimited)
		var4854, var4855 = protoModule.writeString(var4854, var4855, self.item_id)
		buff = var4854
		var4853 = var4855
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var4856, var4857 = protoModule.writeTag(buff, var4853, 2, protoModule.wireTypes.lengthDelimited)
		var4856, var4857 = protoModule.writeString(var4856, var4857, self.item_type)
		buff = var4856
		var4853 = var4857
	end
	local buff_1 = buffer.create(var4853)
	buffer.copy(buff_1, 0, buff, 0, var4853)
	
	return buff_1
end

function t_126.decode(p253)
	-- upvalues: t_126 (ref), protoModule (ref)
	local var4859 = t_126.new()
	local var4860 = 0
	while var4860 < buffer.len(p253) do
		local _ = nil
		local var4861 = nil
		local var4862, var4863, var4864 = protoModule.readTag(p253, var4860)
		local var4865 = var4862
		var4861 = var4863
		var4860 = var4864
		
		if var4861 == protoModule.wireTypes.varint then
			local _ = nil
			local var4866, var4867 = protoModule.readVarInt(p253, var4860)
			local _ = var4866
			var4860 = var4867
			continue
		end
		if var4861 == protoModule.wireTypes.lengthDelimited then
			if var4865 == 1 then
				local _ = nil
				local var4868, var4869 = protoModule.readBuffer(p253, var4860)
				var4860 = var4869
				var4859.item_id = buffer.tostring(var4868)
			elseif var4865 == 2 then
				local _ = nil
				local var4870, var4871 = protoModule.readBuffer(p253, var4860)
				var4860 = var4871
				var4859.item_type = buffer.tostring(var4870)
			else
				local _ = nil
				local var4872, var4873 = protoModule.readVarInt(p253, var4860)
				var4860 = var4873 + var4872
			end
		elseif var4861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4874, var4875 = protoModule.readFixed32(p253, var4860)
			local _ = var4874
			var4860 = var4875
		elseif var4861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4876, var4877 = protoModule.readFixed64(p253, var4860)
			local _ = var4876
			var4860 = var4877
		else
			error("Unsupported wire type: " .. var4861)
		end
	end
	return var4859
end

function t_126:jsonEncode()
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_126:jsonDecode()
	-- upvalues: t_126 (ref)
	local var4879 = t_126.new()
	
	if self.item_id ~= nil then
		var4879.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var4879.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var4879.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var4879.item_type = self.itemType
	end
	return var4879
end

t_126.descriptor = {
	name = "GameItemInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GameItemInputData"
}
t.GameItemInputData = t_126
typeRegistryModule.default:register(t.GameItemInputData)
local t_127 = {}
t_127.__index = t_127

function t_127.new(p254)
	-- upvalues: t_127 (ref)
	return setmetatable({
		clickout_url = if p254 == nil or p254.clickout_url == nil then "" else p254.clickout_url,
		native_ad_data = if p254 == nil or p254.native_ad_data == nil then "" else p254.native_ad_data,
		payer_name = if p254 == nil or p254.payer_name == nil then nil else p254.payer_name,
		logo_asset_id = if p254 == nil or p254.logo_asset_id == nil then nil else p254.logo_asset_id,
		logo_aspect_ratio = if p254 == nil or p254.logo_aspect_ratio == nil then nil else p254.logo_aspect_ratio,
		cta_text = if p254 == nil or p254.cta_text == nil then nil else p254.cta_text,
		title = if p254 == nil or p254.title == nil then nil else p254.title,
		subtitle = if p254 == nil or p254.subtitle == nil then nil else p254.subtitle,
		image_asset_id = if p254 == nil or p254.image_asset_id == nil then nil else p254.image_asset_id,
		video_asset_id = if p254 == nil or p254.video_asset_id == nil then nil else p254.video_asset_id,
		badge_text = if p254 == nil or p254.badge_text == nil then nil else p254.badge_text,
		badge_analytics_id = if p254 == nil or p254.badge_analytics_id == nil then nil else p254.badge_analytics_id,
		roblox_component = if p254 == nil or p254.roblox_component == nil then nil else p254.roblox_component
	}, t_127)
end

function t_127:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4881 = 0
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		local var4882, var4883 = protoModule.writeTag(buff, var4881, 1, protoModule.wireTypes.lengthDelimited)
		var4882, var4883 = protoModule.writeString(var4882, var4883, self.clickout_url)
		buff = var4882
		var4881 = var4883
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var4884, var4885 = protoModule.writeTag(buff, var4881, 2, protoModule.wireTypes.lengthDelimited)
		var4884, var4885 = protoModule.writeString(var4884, var4885, self.native_ad_data)
		buff = var4884
		var4881 = var4885
	end
	if self.payer_name ~= nil then
		local var4886, var4887 = protoModule.writeTag(buff, var4881, 3, protoModule.wireTypes.lengthDelimited)
		var4886, var4887 = protoModule.writeString(var4886, var4887, self.payer_name)
		buff = var4886
		var4881 = var4887
	end
	if self.logo_asset_id ~= nil then
		local var4888, var4889 = protoModule.writeTag(buff, var4881, 4, protoModule.wireTypes.lengthDelimited)
		var4888, var4889 = protoModule.writeString(var4888, var4889, self.logo_asset_id)
		buff = var4888
		var4881 = var4889
	end
	if self.logo_aspect_ratio ~= nil then
		local var4890, var4891 = protoModule.writeTag(buff, var4881, 5, protoModule.wireTypes.i64)
		var4890, var4891 = protoModule.writeDouble(var4890, var4891, self.logo_aspect_ratio)
		buff = var4890
		var4881 = var4891
	end
	if self.cta_text ~= nil then
		local var4892, var4893 = protoModule.writeTag(buff, var4881, 6, protoModule.wireTypes.lengthDelimited)
		var4892, var4893 = protoModule.writeString(var4892, var4893, self.cta_text)
		buff = var4892
		var4881 = var4893
	end
	if self.title ~= nil then
		local var4894, var4895 = protoModule.writeTag(buff, var4881, 7, protoModule.wireTypes.lengthDelimited)
		var4894, var4895 = protoModule.writeString(var4894, var4895, self.title)
		buff = var4894
		var4881 = var4895
	end
	if self.subtitle ~= nil then
		local var4896, var4897 = protoModule.writeTag(buff, var4881, 8, protoModule.wireTypes.lengthDelimited)
		var4896, var4897 = protoModule.writeString(var4896, var4897, self.subtitle)
		buff = var4896
		var4881 = var4897
	end
	if self.image_asset_id ~= nil then
		local var4898, var4899 = protoModule.writeTag(buff, var4881, 9, protoModule.wireTypes.lengthDelimited)
		var4898, var4899 = protoModule.writeString(var4898, var4899, self.image_asset_id)
		buff = var4898
		var4881 = var4899
	end
	if self.video_asset_id ~= nil then
		local var4900, var4901 = protoModule.writeTag(buff, var4881, 10, protoModule.wireTypes.lengthDelimited)
		var4900, var4901 = protoModule.writeString(var4900, var4901, self.video_asset_id)
		buff = var4900
		var4881 = var4901
	end
	if self.badge_text ~= nil then
		local var4902, var4903 = protoModule.writeTag(buff, var4881, 11, protoModule.wireTypes.lengthDelimited)
		var4902, var4903 = protoModule.writeString(var4902, var4903, self.badge_text)
		buff = var4902
		var4881 = var4903
	end
	if self.badge_analytics_id ~= nil then
		local var4904, var4905 = protoModule.writeTag(buff, var4881, 12, protoModule.wireTypes.lengthDelimited)
		var4904, var4905 = protoModule.writeString(var4904, var4905, self.badge_analytics_id)
		buff = var4904
		var4881 = var4905
	end
	if self.roblox_component ~= nil then
		local var4906, var4907 = protoModule.writeTag(buff, var4881, 13, protoModule.wireTypes.lengthDelimited)
		var4906, var4907 = protoModule.writeString(var4906, var4907, self.roblox_component)
		buff = var4906
		var4881 = var4907
	end
	local buff_1 = buffer.create(var4881)
	buffer.copy(buff_1, 0, buff, 0, var4881)
	
	return buff_1
end

function t_127.decode(p255)
	-- upvalues: t_127 (ref), protoModule (ref)
	local var4909 = t_127.new()
	local var4910 = 0
	while var4910 < buffer.len(p255) do
		local _ = nil
		local var4911 = nil
		local var4912, var4913, var4914 = protoModule.readTag(p255, var4910)
		local var4915 = var4912
		var4911 = var4913
		var4910 = var4914
		
		if var4911 == protoModule.wireTypes.varint then
			local _ = nil
			local var4916, var4917 = protoModule.readVarInt(p255, var4910)
			local _ = var4916
			var4910 = var4917
			continue
		end
		if var4911 == protoModule.wireTypes.lengthDelimited then
			if var4915 == 1 then
				local _ = nil
				local var4918, var4919 = protoModule.readBuffer(p255, var4910)
				var4910 = var4919
				var4909.clickout_url = buffer.tostring(var4918)
			elseif var4915 == 2 then
				local _ = nil
				local var4920, var4921 = protoModule.readBuffer(p255, var4910)
				var4910 = var4921
				var4909.native_ad_data = buffer.tostring(var4920)
			elseif var4915 == 3 then
				local _ = nil
				local var4922, var4923 = protoModule.readBuffer(p255, var4910)
				var4910 = var4923
				var4909.payer_name = buffer.tostring(var4922)
			elseif var4915 == 4 then
				local _ = nil
				local var4924, var4925 = protoModule.readBuffer(p255, var4910)
				var4910 = var4925
				var4909.logo_asset_id = buffer.tostring(var4924)
			elseif var4915 == 6 then
				local _ = nil
				local var4926, var4927 = protoModule.readBuffer(p255, var4910)
				var4910 = var4927
				var4909.cta_text = buffer.tostring(var4926)
			elseif var4915 == 7 then
				local _ = nil
				local var4928, var4929 = protoModule.readBuffer(p255, var4910)
				var4910 = var4929
				var4909.title = buffer.tostring(var4928)
			elseif var4915 == 8 then
				local _ = nil
				local var4930, var4931 = protoModule.readBuffer(p255, var4910)
				var4910 = var4931
				var4909.subtitle = buffer.tostring(var4930)
			elseif var4915 == 9 then
				local _ = nil
				local var4932, var4933 = protoModule.readBuffer(p255, var4910)
				var4910 = var4933
				var4909.image_asset_id = buffer.tostring(var4932)
			elseif var4915 == 10 then
				local _ = nil
				local var4934, var4935 = protoModule.readBuffer(p255, var4910)
				var4910 = var4935
				var4909.video_asset_id = buffer.tostring(var4934)
			elseif var4915 == 11 then
				local _ = nil
				local var4936, var4937 = protoModule.readBuffer(p255, var4910)
				var4910 = var4937
				var4909.badge_text = buffer.tostring(var4936)
			elseif var4915 == 12 then
				local _ = nil
				local var4938, var4939 = protoModule.readBuffer(p255, var4910)
				var4910 = var4939
				var4909.badge_analytics_id = buffer.tostring(var4938)
			elseif var4915 == 13 then
				local _ = nil
				local var4940, var4941 = protoModule.readBuffer(p255, var4910)
				var4910 = var4941
				var4909.roblox_component = buffer.tostring(var4940)
			else
				local _ = nil
				local var4942, var4943 = protoModule.readVarInt(p255, var4910)
				var4910 = var4943 + var4942
			end
		elseif var4911 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4944, var4945 = protoModule.readFixed32(p255, var4910)
			local _ = var4944
			var4910 = var4945
		elseif var4911 ~= protoModule.wireTypes.i64 then
			error("Unsupported wire type: " .. var4911)
		elseif var4915 == 5 then
			local _ = nil
			local var4946, var4947 = protoModule.readDouble(p255, var4910)
			var4910 = var4947
			var4909.logo_aspect_ratio = var4946
		else
			local _ = nil
			local var4948, var4949 = protoModule.readFixed64(p255, var4910)
			local _ = var4948
			var4910 = var4949
		end
	end
	return var4909
end

function t_127:jsonEncode()
	-- upvalues: protoModule (ref)
	local t = {}
	
	if self.clickout_url ~= nil and self.clickout_url ~= "" then
		t.clickoutUrl = self.clickout_url
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		t.nativeAdData = self.native_ad_data
	end
	if self.payer_name ~= nil then
		t.payerName = self.payer_name
	end
	if self.logo_asset_id ~= nil then
		t.logoAssetId = self.logo_asset_id
	end
	if self.logo_aspect_ratio ~= nil then
		t.logoAspectRatio = protoModule.json.serializeNumber(self.logo_aspect_ratio)
	end
	if self.cta_text ~= nil then
		t.ctaText = self.cta_text
	end
	if self.title ~= nil then
		t.title = self.title
	end
	if self.subtitle ~= nil then
		t.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		t.imageAssetId = self.image_asset_id
	end
	if self.video_asset_id ~= nil then
		t.videoAssetId = self.video_asset_id
	end
	if self.badge_text ~= nil then
		t.badgeText = self.badge_text
	end
	if self.badge_analytics_id ~= nil then
		t.badgeAnalyticsId = self.badge_analytics_id
	end
	if self.roblox_component ~= nil then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_127:jsonDecode()
	-- upvalues: t_127 (ref), protoModule (ref)
	local var4951 = t_127.new()
	
	if self.clickout_url ~= nil then
		var4951.clickout_url = self.clickout_url
	end
	if self.clickoutUrl ~= nil then
		var4951.clickout_url = self.clickoutUrl
	end
	if self.native_ad_data ~= nil then
		var4951.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var4951.native_ad_data = self.nativeAdData
	end
	if self.payer_name ~= nil then
		var4951.payer_name = self.payer_name
	end
	if self.payerName ~= nil then
		var4951.payer_name = self.payerName
	end
	if self.logo_asset_id ~= nil then
		var4951.logo_asset_id = self.logo_asset_id
	end
	if self.logoAssetId ~= nil then
		var4951.logo_asset_id = self.logoAssetId
	end
	if self.logo_aspect_ratio ~= nil then
		var4951.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logo_aspect_ratio)
	end
	if self.logoAspectRatio ~= nil then
		var4951.logo_aspect_ratio = protoModule.json.deserializeNumber(self.logoAspectRatio)
	end
	if self.cta_text ~= nil then
		var4951.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var4951.cta_text = self.ctaText
	end
	if self.title ~= nil then
		var4951.title = self.title
	end
	if self.subtitle ~= nil then
		var4951.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var4951.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4951.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var4951.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4951.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var4951.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var4951.badge_text = self.badgeText
	end
	if self.badge_analytics_id ~= nil then
		var4951.badge_analytics_id = self.badge_analytics_id
	end
	if self.badgeAnalyticsId ~= nil then
		var4951.badge_analytics_id = self.badgeAnalyticsId
	end
	if self.roblox_component ~= nil then
		var4951.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var4951.roblox_component = self.robloxComponent
	end
	return var4951
end

t_127.descriptor = {
	name = "AdLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.AdLinkItem"
}
t.AdLinkItem = t_127
typeRegistryModule.default:register(t.AdLinkItem)
local t_128 = {}
t_128.__index = t_128

function t_128.new(p256)
	-- upvalues: t_128 (ref)
	return setmetatable({
		layout = if p256 == nil or p256.layout == nil then nil else p256.layout,
		kind = if p256 == nil or p256.kind == nil then nil else p256.kind
	}, t_128)
end

function t_128:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4953 = 0
	
	if self.layout ~= nil then
		local var4954 = self.layout:encode()
		local var4955, var4956 = protoModule.writeTag(buff, var4953, 1, protoModule.wireTypes.lengthDelimited)
		var4955, var4956 = protoModule.writeBuffer(var4955, var4956, var4954, buffer.len(var4954))
		buff = var4955
		var4953 = var4956
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			local var4957 = self.kind.value:encode()
			local var4958, var4959 = protoModule.writeTag(buff, var4953, 2, protoModule.wireTypes.lengthDelimited)
			var4958, var4959 = protoModule.writeBuffer(var4958, var4959, var4957, buffer.len(var4957))
			buff = var4958
			var4953 = var4959
		elseif self.kind.type == "ad_link" then
			local var4960 = self.kind.value:encode()
			local var4961, var4962 = protoModule.writeTag(buff, var4953, 3, protoModule.wireTypes.lengthDelimited)
			var4961, var4962 = protoModule.writeBuffer(var4961, var4962, var4960, buffer.len(var4960))
			buff = var4961
			var4953 = var4962
		end
	end
	local buff_1 = buffer.create(var4953)
	buffer.copy(buff_1, 0, buff, 0, var4953)
	
	return buff_1
end

function t_128.decode(p257)
	-- upvalues: t_128 (ref), protoModule (ref), t (ref)
	local var4964 = t_128.new()
	local var4965 = 0
	while var4965 < buffer.len(p257) do
		local _ = nil
		local var4966 = nil
		local var4967, var4968, var4969 = protoModule.readTag(p257, var4965)
		local var4970 = var4967
		var4966 = var4968
		var4965 = var4969
		
		if var4966 == protoModule.wireTypes.varint then
			local _ = nil
			local var4971, var4972 = protoModule.readVarInt(p257, var4965)
			local _ = var4971
			var4965 = var4972
			continue
		end
		if var4966 == protoModule.wireTypes.lengthDelimited then
			if var4970 == 1 then
				local _ = nil
				local var4973, var4974 = protoModule.readBuffer(p257, var4965)
				var4965 = var4974
				var4964.layout = t.ItemLayout.decode(var4973)
			elseif var4970 == 2 then
				local _ = nil
				local var4975, var4976 = protoModule.readBuffer(p257, var4965)
				var4965 = var4976
				var4964.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var4975)
				}
			elseif var4970 == 3 then
				local _ = nil
				local var4977, var4978 = protoModule.readBuffer(p257, var4965)
				var4965 = var4978
				var4964.kind = { type = "ad_link", value = t.AdLinkItem.decode(var4977) }
			else
				local _ = nil
				local var4979, var4980 = protoModule.readVarInt(p257, var4965)
				var4965 = var4980 + var4979
			end
		elseif var4966 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4981, var4982 = protoModule.readFixed32(p257, var4965)
			local _ = var4981
			var4965 = var4982
		elseif var4966 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4983, var4984 = protoModule.readFixed64(p257, var4965)
			local _ = var4983
			var4965 = var4984
		else
			error("Unsupported wire type: " .. var4966)
		end
	end
	return var4964
end

function t_128:jsonEncode()
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil then
		if self.kind.type == "universe" then
			t.universe = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "ad_link" then
			t.adLink = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_128:jsonDecode()
	-- upvalues: t_128 (ref), t (ref)
	local var4986 = t_128.new()
	
	if self.layout ~= nil then
		var4986.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var4986.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	if self.ad_link ~= nil then
		var4986.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.ad_link)
		}
	end
	if self.adLink ~= nil then
		var4986.kind = {
			type = "ad_link",
			value = t.AdLinkItem.jsonDecode(self.adLink)
		}
	end
	return var4986
end

t_128.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_128
typeRegistryModule.default:register(t.ItemWithLayout)
local t_129 = {}
t_129.__index = t_129

function t_129.new(p258)
	-- upvalues: t_129 (ref)
	return setmetatable({
		items = if p258 == nil or p258.items == nil then {} else p258.items,
		collection_item_size = if p258 == nil or p258.collection_item_size == nil then nil else p258.collection_item_size
	}, t_129)
end

function t_129:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4988 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4989 = v:encode()
			local var4990, var4991 = protoModule.writeTag(buff, var4988, 1, protoModule.wireTypes.lengthDelimited)
			var4990, var4991 = protoModule.writeBuffer(var4990, var4991, var4989, buffer.len(var4989))
			buff = var4990
			var4988 = var4991
		end
	end
	if self.collection_item_size ~= nil then
		local var4992, var4993 = protoModule.writeTag(buff, var4988, 2, protoModule.wireTypes.lengthDelimited)
		var4992, var4993 = protoModule.writeString(var4992, var4993, self.collection_item_size)
		buff = var4992
		var4988 = var4993
	end
	local buff_1 = buffer.create(var4988)
	buffer.copy(buff_1, 0, buff, 0, var4988)
	
	return buff_1
end

function t_129.decode(p259)
	-- upvalues: t_129 (ref), protoModule (ref), t (ref)
	local var4995 = t_129.new()
	local var4996 = 0
	while var4996 < buffer.len(p259) do
		local _ = nil
		local var4997 = nil
		local var4998, var4999, var5000 = protoModule.readTag(p259, var4996)
		local var5001 = var4998
		var4997 = var4999
		var4996 = var5000
		
		if var4997 == protoModule.wireTypes.varint then
			local _ = nil
			local var5002, var5003 = protoModule.readVarInt(p259, var4996)
			local _ = var5002
			var4996 = var5003
			continue
		end
		if var4997 == protoModule.wireTypes.lengthDelimited then
			if var5001 == 1 then
				local _ = nil
				local var5004, var5005 = protoModule.readBuffer(p259, var4996)
				var4996 = var5005
				table.insert(var4995.items, t.ItemWithLayout.decode(var5004))
			elseif var5001 == 2 then
				local _ = nil
				local var5006, var5007 = protoModule.readBuffer(p259, var4996)
				var4996 = var5007
				var4995.collection_item_size = buffer.tostring(var5006)
			else
				local _ = nil
				local var5008, var5009 = protoModule.readVarInt(p259, var4996)
				var4996 = var5009 + var5008
			end
		elseif var4997 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5010, var5011 = protoModule.readFixed32(p259, var4996)
			local _ = var5010
			var4996 = var5011
		elseif var4997 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5012, var5013 = protoModule.readFixed64(p259, var4996)
			local _ = var5012
			var4996 = var5013
		else
			error("Unsupported wire type: " .. var4997)
		end
	end
	return var4995
end

function t_129:jsonEncode()
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

function t_129:jsonDecode()
	-- upvalues: t_129 (ref), t (ref)
	local var5016 = t_129.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var5016.items = t_1
	end
	if self.collection_item_size ~= nil then
		var5016.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var5016.collection_item_size = self.collectionItemSize
	end
	return var5016
end

t_129.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_129
typeRegistryModule.default:register(t.ContentPool)
local t_130 = {}
t_130.__index = t_130

function t_130.new(p260)
	-- upvalues: t_130 (ref)
	return setmetatable({
		col_span = if p260 == nil or p260.col_span == nil then 0 else p260.col_span,
		row_span = if p260 == nil or p260.row_span == nil then 0 else p260.row_span,
		alignment_type = if p260 == nil or p260.alignment_type == nil then "" else p260.alignment_type,
		min_row_padding = if p260 == nil or p260.min_row_padding == nil then 0 else p260.min_row_padding
	}, t_130)
end

function t_130:encode()
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var5019 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var5020, var5021 = protoModule.writeTag(buff, var5019, 1, protoModule.wireTypes.varint)
		var5020, var5021 = protoModule.writeVarInt(var5020, var5021, self.col_span)
		buff = var5020
		var5019 = var5021
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var5022, var5023 = protoModule.writeTag(buff, var5019, 2, protoModule.wireTypes.varint)
		var5022, var5023 = protoModule.writeVarInt(var5022, var5023, self.row_span)
		buff = var5022
		var5019 = var5023
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var5024, var5025 = protoModule.writeTag(buff, var5019, 3, protoModule.wireTypes.lengthDelimited)
		var5024, var5025 = protoModule.writeString(var5024, var5025, self.alignment_type)
		buff = var5024
		var5019 = var5025
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var5026, var5027 = protoModule.writeTag(buff, var5019, 4, protoModule.wireTypes.varint)
		var5026, var5027 = protoModule.writeVarInt(var5026, var5027, self.min_row_padding)
		buff = var5026
		var5019 = var5027
	end
	local buff_1 = buffer.create(var5019)
	buffer.copy(buff_1, 0, buff, 0, var5019)
	
	return buff_1
end

function t_130.decode(p261)
	-- upvalues: t_130 (ref), protoModule (ref)
	local var5029 = t_130.new()
	local var5030 = 0
	while var5030 < buffer.len(p261) do
		local _ = nil
		local var5031 = nil
		local var5032, var5033, var5034 = protoModule.readTag(p261, var5030)
		local var5035 = var5032
		var5031 = var5033
		var5030 = var5034
		
		if var5031 == protoModule.wireTypes.varint then
			if var5035 == 1 then
				local _ = nil
				local var5036, var5037 = protoModule.readVarIntI32(p261, var5030)
				var5030 = var5037
				var5029.col_span = var5036
			elseif var5035 == 2 then
				local _ = nil
				local var5038, var5039 = protoModule.readVarIntI32(p261, var5030)
				var5030 = var5039
				var5029.row_span = var5038
			elseif var5035 == 4 then
				local _ = nil
				local var5040, var5041 = protoModule.readVarIntI32(p261, var5030)
				var5030 = var5041
				var5029.min_row_padding = var5040
			else
				local _ = nil
				local var5042, var5043 = protoModule.readVarInt(p261, var5030)
				local _ = var5042
				var5030 = var5043
			end
		end
		if var5031 == protoModule.wireTypes.lengthDelimited then
			if var5035 == 3 then
				local _ = nil
				local var5044, var5045 = protoModule.readBuffer(p261, var5030)
				var5030 = var5045
				var5029.alignment_type = buffer.tostring(var5044)
			else
				local _ = nil
				local var5046, var5047 = protoModule.readVarInt(p261, var5030)
				var5030 = var5047 + var5046
			end
		elseif var5031 == protoModule.wireTypes.i32 then
			local _ = nil
			local var5048, var5049 = protoModule.readFixed32(p261, var5030)
			local _ = var5048
			var5030 = var5049
		elseif var5031 == protoModule.wireTypes.i64 then
			local _ = nil
			local var5050, var5051 = protoModule.readFixed64(p261, var5030)
			local _ = var5050
			var5030 = var5051
		else
			error("Unsupported wire type: " .. var5031)
		end
	end
	return var5029
end

function t_130:jsonEncode()
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

function t_130:jsonDecode()
	-- upvalues: t_130 (ref)
	local var5053 = t_130.new()
	
	if self.col_span ~= nil then
		var5053.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var5053.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var5053.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var5053.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var5053.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var5053.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var5053.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var5053.min_row_padding = self.minRowPadding
	end
	return var5053
end

t_130.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_130
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p262)
		return if p262 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p262 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p263)
		return if p263 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p263 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p263
	end,
	fromName = function(p264)
		return if p264 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p264 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	HeroUnitInputData = t.HeroUnitInputData,
	HeroUnitInputData_VisualAsset = t.HeroUnitInputData_VisualAsset,
	HeroUnitInputData_Gradient = t.HeroUnitInputData_Gradient,
	FriendRecommendationCarouselInputData = t.FriendRecommendationCarouselInputData,
	FriendRecommendationCarouselInputData_UserRecommendation = t.FriendRecommendationCarouselInputData_UserRecommendation,
	FriendRecommendationCarouselInputData_ContactRecommendation = t.FriendRecommendationCarouselInputData_ContactRecommendation,
	FriendRecommendationCarouselInputData_RecommendationItem = t.FriendRecommendationCarouselInputData_RecommendationItem,
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	GameItemsCarouselInputData = t.GameItemsCarouselInputData,
	GameItemsCardInputData = t.GameItemsCardInputData,
	GameItemInputData = t.GameItemInputData,
	AdLinkItem = t.AdLinkItem,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	PageEntryFormat = t.PageEntryFormat
}