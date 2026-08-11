local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local pageEntryModule = require(script.Parent.page_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 3899 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entry = if p0 == nil or p0.page_entry == nil then nil else p0.page_entry,
		input_data = if p0 == nil or p0.input_data == nil then nil else p0.input_data
	}, t_1)
end

function t_1:encode() --[[ line: 3906 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var127 = 0
	
	if self.page_entry ~= nil then
		local var128 = self.page_entry:encode()
		local var129, var130 = protoModule.writeTag(buff, var127, 1, protoModule.wireTypes.lengthDelimited)
		var129, var130 = protoModule.writeBuffer(var129, var130, var128, buffer.len(var128))
		buff = var129
		var127 = var130
	end
	if self.input_data ~= nil then
		local var131 = self.input_data:encode()
		local var132, var133 = protoModule.writeTag(buff, var127, 2, protoModule.wireTypes.lengthDelimited)
		var132, var133 = protoModule.writeBuffer(var132, var133, var131, buffer.len(var131))
		buff = var132
		var127 = var133
	end
	local buff_1 = buffer.create(var127)
	buffer.copy(buff_1, 0, buff, 0, var127)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 3927 ]]
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var135 = t_1.new()
	local var136 = 0
	while var136 < buffer.len(p1) do
		local _ = nil
		local var137 = nil
		local var138, var139, var140 = protoModule.readTag(p1, var136)
		local var141 = var138
		var137 = var139
		var136 = var140
		
		if var137 == protoModule.wireTypes.varint then
			local _ = nil
			local var142, var143 = protoModule.readVarInt(p1, var136)
			local _ = var142
			var136 = var143
			continue
		end
		if var137 == protoModule.wireTypes.lengthDelimited then
			if var141 == 1 then
				local _ = nil
				local var144, var145 = protoModule.readBuffer(p1, var136)
				var136 = var145
				var135.page_entry = pageEntryModule.PageEntry.decode(var144)
			elseif var141 == 2 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p1, var136)
				var136 = var147
				var135.input_data = t.PageEntryInputData.decode(var146)
			else
				local _ = nil
				local var148, var149 = protoModule.readVarInt(p1, var136)
				var136 = var149 + var148
			end
		elseif var137 == protoModule.wireTypes.i32 then
			local _ = nil
			local var150, var151 = protoModule.readFixed32(p1, var136)
			local _ = var150
			var136 = var151
		elseif var137 == protoModule.wireTypes.i64 then
			local _ = nil
			local var152, var153 = protoModule.readFixed64(p1, var136)
			local _ = var152
			var136 = var153
		else
			error("Unsupported wire type: " .. var137)
		end
	end
	return var135
end

function t_1:jsonEncode() --[[ line: 3975 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 3989 ]]
	-- upvalues: t_1 (ref), pageEntryModule (ref), t (ref)
	local var155 = t_1.new()
	
	if self.page_entry ~= nil then
		var155.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var155.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var155.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var155.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var155
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 4025 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p2 == nil or p2.input_data == nil then nil else p2.input_data,
		roblox_component = if p2 == nil or p2.roblox_component == nil then "" else p2.roblox_component
	}, t_2)
end

function t_2:encode() --[[ line: 4032 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var157 = 0
	
	if self.input_data ~= nil then
		local var158 = self.input_data:encode()
		local var159, var160 = protoModule.writeTag(buff, var157, 1, protoModule.wireTypes.lengthDelimited)
		var159, var160 = protoModule.writeBuffer(var159, var160, var158, buffer.len(var158))
		buff = var159
		var157 = var160
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var161, var162 = protoModule.writeTag(buff, var157, 2, protoModule.wireTypes.lengthDelimited)
		var161, var162 = protoModule.writeString(var161, var162, self.roblox_component)
		buff = var161
		var157 = var162
	end
	local buff_1 = buffer.create(var157)
	buffer.copy(buff_1, 0, buff, 0, var157)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 4052 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var164 = t_2.new()
	local var165 = 0
	while var165 < buffer.len(p3) do
		local _ = nil
		local var166 = nil
		local var167, var168, var169 = protoModule.readTag(p3, var165)
		local var170 = var167
		var166 = var168
		var165 = var169
		
		if var166 == protoModule.wireTypes.varint then
			local _ = nil
			local var171, var172 = protoModule.readVarInt(p3, var165)
			local _ = var171
			var165 = var172
			continue
		end
		if var166 == protoModule.wireTypes.lengthDelimited then
			if var170 == 1 then
				local _ = nil
				local var173, var174 = protoModule.readBuffer(p3, var165)
				var165 = var174
				var164.input_data = t.PageEntryInputData.decode(var173)
			elseif var170 == 2 then
				local _ = nil
				local var175, var176 = protoModule.readBuffer(p3, var165)
				var165 = var176
				var164.roblox_component = buffer.tostring(var175)
			else
				local _ = nil
				local var177, var178 = protoModule.readVarInt(p3, var165)
				var165 = var178 + var177
			end
		elseif var166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var179, var180 = protoModule.readFixed32(p3, var165)
			local _ = var179
			var165 = var180
		elseif var166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var181, var182 = protoModule.readFixed64(p3, var165)
			local _ = var181
			var165 = var182
		else
			error("Unsupported wire type: " .. var166)
		end
	end
	return var164
end

function t_2:jsonEncode() --[[ line: 4100 ]]
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_2:jsonDecode() --[[ line: 4114 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var184 = t_2.new()
	
	if self.input_data ~= nil then
		var184.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var184.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var184.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var184.roblox_component = self.robloxComponent
	end
	return var184
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 4150 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p4 == nil or p4.roblox_component == nil then "" else p4.roblox_component,
		input_data = if p4 == nil or p4.input_data == nil then nil else p4.input_data,
		cta_buttons = if p4 == nil or p4.cta_buttons == nil then nil else p4.cta_buttons
	}, t_3)
end

function t_3:encode() --[[ line: 4158 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var186 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var187, var188 = protoModule.writeTag(buff, var186, 1, protoModule.wireTypes.lengthDelimited)
		var187, var188 = protoModule.writeString(var187, var188, self.roblox_component)
		buff = var187
		var186 = var188
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var189 = self.input_data.value:encode()
		local var190, var191 = protoModule.writeTag(buff, var186, 2, protoModule.wireTypes.lengthDelimited)
		var190, var191 = protoModule.writeBuffer(var190, var191, var189, buffer.len(var189))
		buff = var190
		var186 = var191
	end
	if self.cta_buttons ~= nil then
		local var192 = self.cta_buttons:encode()
		local var193, var194 = protoModule.writeTag(buff, var186, 3, protoModule.wireTypes.lengthDelimited)
		var193, var194 = protoModule.writeBuffer(var193, var194, var192, buffer.len(var192))
		buff = var193
		var186 = var194
	end
	local buff_1 = buffer.create(var186)
	buffer.copy(buff_1, 0, buff, 0, var186)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 4186 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var196 = t_3.new()
	local var197 = 0
	while var197 < buffer.len(p5) do
		local _ = nil
		local var198 = nil
		local var199, var200, var201 = protoModule.readTag(p5, var197)
		local var202 = var199
		var198 = var200
		var197 = var201
		
		if var198 == protoModule.wireTypes.varint then
			local _ = nil
			local var203, var204 = protoModule.readVarInt(p5, var197)
			local _ = var203
			var197 = var204
			continue
		end
		if var198 == protoModule.wireTypes.lengthDelimited then
			if var202 == 1 then
				local _ = nil
				local var205, var206 = protoModule.readBuffer(p5, var197)
				var197 = var206
				var196.roblox_component = buffer.tostring(var205)
			elseif var202 == 2 then
				local _ = nil
				local var207, var208 = protoModule.readBuffer(p5, var197)
				var197 = var208
				var196.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var207)
				}
			elseif var202 == 3 then
				local _ = nil
				local var209, var210 = protoModule.readBuffer(p5, var197)
				var197 = var210
				var196.cta_buttons = t.CtaButtonsInputData.decode(var209)
			else
				local _ = nil
				local var211, var212 = protoModule.readVarInt(p5, var197)
				var197 = var212 + var211
			end
		elseif var198 == protoModule.wireTypes.i32 then
			local _ = nil
			local var213, var214 = protoModule.readFixed32(p5, var197)
			local _ = var213
			var197 = var214
		elseif var198 == protoModule.wireTypes.i64 then
			local _ = nil
			local var215, var216 = protoModule.readFixed64(p5, var197)
			local _ = var215
			var197 = var216
		else
			error("Unsupported wire type: " .. var198)
		end
	end
	return var196
end

function t_3:jsonEncode() --[[ line: 4240 ]]
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

function t_3:jsonDecode() --[[ line: 4260 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var218 = t_3.new()
	
	if self.roblox_component ~= nil then
		var218.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var218.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var218.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var218.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	if self.cta_buttons ~= nil then
		var218.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		var218.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
	end
	return var218
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 4306 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p6 == nil or p6.roblox_component == nil then "" else p6.roblox_component,
		input_data = if p6 == nil or p6.input_data == nil then nil else p6.input_data
	}, t_4)
end

function t_4:encode() --[[ line: 4313 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var220 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var221, var222 = protoModule.writeTag(buff, var220, 1, protoModule.wireTypes.lengthDelimited)
		var221, var222 = protoModule.writeString(var221, var222, self.roblox_component)
		buff = var221
		var220 = var222
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var223 = self.input_data.value:encode()
			local var224, var225 = protoModule.writeTag(buff, var220, 2, protoModule.wireTypes.lengthDelimited)
			var224, var225 = protoModule.writeBuffer(var224, var225, var223, buffer.len(var223))
			buff = var224
			var220 = var225
		elseif self.input_data.type == "video" then
			local var226 = self.input_data.value:encode()
			local var227, var228 = protoModule.writeTag(buff, var220, 3, protoModule.wireTypes.lengthDelimited)
			var227, var228 = protoModule.writeBuffer(var227, var228, var226, buffer.len(var226))
			buff = var227
			var220 = var228
		end
	end
	local buff_1 = buffer.create(var220)
	buffer.copy(buff_1, 0, buff, 0, var220)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 4339 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var230 = t_4.new()
	local var231 = 0
	while var231 < buffer.len(p7) do
		local _ = nil
		local var232 = nil
		local var233, var234, var235 = protoModule.readTag(p7, var231)
		local var236 = var233
		var232 = var234
		var231 = var235
		
		if var232 == protoModule.wireTypes.varint then
			local _ = nil
			local var237, var238 = protoModule.readVarInt(p7, var231)
			local _ = var237
			var231 = var238
			continue
		end
		if var232 == protoModule.wireTypes.lengthDelimited then
			if var236 == 1 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p7, var231)
				var231 = var240
				var230.roblox_component = buffer.tostring(var239)
			elseif var236 == 2 then
				local _ = nil
				local var241, var242 = protoModule.readBuffer(p7, var231)
				var231 = var242
				var230.input_data = { type = "image", value = t.ImageInputData.decode(var241) }
			elseif var236 == 3 then
				local _ = nil
				local var243, var244 = protoModule.readBuffer(p7, var231)
				var231 = var244
				var230.input_data = { type = "video", value = t.VideoInputData.decode(var243) }
			else
				local _ = nil
				local var245, var246 = protoModule.readVarInt(p7, var231)
				var231 = var246 + var245
			end
		elseif var232 == protoModule.wireTypes.i32 then
			local _ = nil
			local var247, var248 = protoModule.readFixed32(p7, var231)
			local _ = var247
			var231 = var248
		elseif var232 == protoModule.wireTypes.i64 then
			local _ = nil
			local var249, var250 = protoModule.readFixed64(p7, var231)
			local _ = var249
			var231 = var250
		else
			error("Unsupported wire type: " .. var232)
		end
	end
	return var230
end

function t_4:jsonEncode() --[[ line: 4392 ]]
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

function t_4:jsonDecode() --[[ line: 4410 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var252 = t_4.new()
	
	if self.roblox_component ~= nil then
		var252.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var252.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var252.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	if self.video ~= nil then
		var252.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
		}
	end
	return var252
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 4446 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode() --[[ line: 4452 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var254 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var255 = self.kind.value:encode()
			local var256, var257 = protoModule.writeTag(buff, var254, 1, protoModule.wireTypes.lengthDelimited)
			var256, var257 = protoModule.writeBuffer(var256, var257, var255, buffer.len(var255))
			buff = var256
			var254 = var257
		elseif self.kind.type == "badge_details" then
			local var258 = self.kind.value:encode()
			local var259, var260 = protoModule.writeTag(buff, var254, 2, protoModule.wireTypes.lengthDelimited)
			var259, var260 = protoModule.writeBuffer(var259, var260, var258, buffer.len(var258))
			buff = var259
			var254 = var260
		elseif self.kind.type == "static_content" then
			local var261 = self.kind.value:encode()
			local var262, var263 = protoModule.writeTag(buff, var254, 3, protoModule.wireTypes.lengthDelimited)
			var262, var263 = protoModule.writeBuffer(var262, var263, var261, buffer.len(var261))
			buff = var262
			var254 = var263
		elseif self.kind.type == "experience_attribution_row" then
			local var264 = self.kind.value:encode()
			local var265, var266 = protoModule.writeTag(buff, var254, 4, protoModule.wireTypes.lengthDelimited)
			var265, var266 = protoModule.writeBuffer(var265, var266, var264, buffer.len(var264))
			buff = var265
			var254 = var266
		elseif self.kind.type == "experience_action_module" then
			local var267 = self.kind.value:encode()
			local var268, var269 = protoModule.writeTag(buff, var254, 5, protoModule.wireTypes.lengthDelimited)
			var268, var269 = protoModule.writeBuffer(var268, var269, var267, buffer.len(var267))
			buff = var268
			var254 = var269
		elseif self.kind.type == "experience_media_gallery" then
			local var270 = self.kind.value:encode()
			local var271, var272 = protoModule.writeTag(buff, var254, 6, protoModule.wireTypes.lengthDelimited)
			var271, var272 = protoModule.writeBuffer(var271, var272, var270, buffer.len(var270))
			buff = var271
			var254 = var272
		elseif self.kind.type == "experience_description" then
			local var273 = self.kind.value:encode()
			local var274, var275 = protoModule.writeTag(buff, var254, 7, protoModule.wireTypes.lengthDelimited)
			var274, var275 = protoModule.writeBuffer(var274, var275, var273, buffer.len(var273))
			buff = var274
			var254 = var275
		elseif self.kind.type == "experience_stat_row" then
			local var276 = self.kind.value:encode()
			local var277, var278 = protoModule.writeTag(buff, var254, 8, protoModule.wireTypes.lengthDelimited)
			var277, var278 = protoModule.writeBuffer(var277, var278, var276, buffer.len(var276))
			buff = var277
			var254 = var278
		elseif self.kind.type == "experience_info_table" then
			local var279 = self.kind.value:encode()
			local var280, var281 = protoModule.writeTag(buff, var254, 9, protoModule.wireTypes.lengthDelimited)
			var280, var281 = protoModule.writeBuffer(var280, var281, var279, buffer.len(var279))
			buff = var280
			var254 = var281
		elseif self.kind.type == "social_link_row" then
			local var282 = self.kind.value:encode()
			local var283, var284 = protoModule.writeTag(buff, var254, 10, protoModule.wireTypes.lengthDelimited)
			var283, var284 = protoModule.writeBuffer(var283, var284, var282, buffer.len(var282))
			buff = var283
			var254 = var284
		elseif self.kind.type == "experience_carousel" then
			local var285 = self.kind.value:encode()
			local var286, var287 = protoModule.writeTag(buff, var254, 11, protoModule.wireTypes.lengthDelimited)
			var286, var287 = protoModule.writeBuffer(var286, var287, var285, buffer.len(var285))
			buff = var286
			var254 = var287
		elseif self.kind.type == "song_carousel" then
			local var288 = self.kind.value:encode()
			local var289, var290 = protoModule.writeTag(buff, var254, 12, protoModule.wireTypes.lengthDelimited)
			var289, var290 = protoModule.writeBuffer(var289, var290, var288, buffer.len(var288))
			buff = var289
			var254 = var290
		elseif self.kind.type == "events_carousel" then
			local var291 = self.kind.value:encode()
			local var292, var293 = protoModule.writeTag(buff, var254, 13, protoModule.wireTypes.lengthDelimited)
			var292, var293 = protoModule.writeBuffer(var292, var293, var291, buffer.len(var291))
			buff = var292
			var254 = var293
		elseif self.kind.type == "game_pass_collection" then
			local var294 = self.kind.value:encode()
			local var295, var296 = protoModule.writeTag(buff, var254, 14, protoModule.wireTypes.lengthDelimited)
			var295, var296 = protoModule.writeBuffer(var295, var296, var294, buffer.len(var294))
			buff = var295
			var254 = var296
		elseif self.kind.type == "developer_product_collection" then
			local var297 = self.kind.value:encode()
			local var298, var299 = protoModule.writeTag(buff, var254, 15, protoModule.wireTypes.lengthDelimited)
			var298, var299 = protoModule.writeBuffer(var298, var299, var297, buffer.len(var297))
			buff = var298
			var254 = var299
		elseif self.kind.type == "subscription_collection" then
			local var300 = self.kind.value:encode()
			local var301, var302 = protoModule.writeTag(buff, var254, 16, protoModule.wireTypes.lengthDelimited)
			var301, var302 = protoModule.writeBuffer(var301, var302, var300, buffer.len(var300))
			buff = var301
			var254 = var302
		elseif self.kind.type == "dynamic_store_category" then
			local var303 = self.kind.value:encode()
			local var304, var305 = protoModule.writeTag(buff, var254, 17, protoModule.wireTypes.lengthDelimited)
			var304, var305 = protoModule.writeBuffer(var304, var305, var303, buffer.len(var303))
			buff = var304
			var254 = var305
		elseif self.kind.type == "card_container" then
			local var306 = self.kind.value:encode()
			local var307, var308 = protoModule.writeTag(buff, var254, 20, protoModule.wireTypes.lengthDelimited)
			var307, var308 = protoModule.writeBuffer(var307, var308, var306, buffer.len(var306))
			buff = var307
			var254 = var308
		elseif self.kind.type == "card" then
			local var309 = self.kind.value:encode()
			local var310, var311 = protoModule.writeTag(buff, var254, 21, protoModule.wireTypes.lengthDelimited)
			var310, var311 = protoModule.writeBuffer(var310, var311, var309, buffer.len(var309))
			buff = var310
			var254 = var311
		elseif self.kind.type == "dialog" then
			local var312 = self.kind.value:encode()
			local var313, var314 = protoModule.writeTag(buff, var254, 22, protoModule.wireTypes.lengthDelimited)
			var313, var314 = protoModule.writeBuffer(var313, var314, var312, buffer.len(var312))
			buff = var313
			var254 = var314
		elseif self.kind.type == "banner" then
			local var315 = self.kind.value:encode()
			local var316, var317 = protoModule.writeTag(buff, var254, 23, protoModule.wireTypes.lengthDelimited)
			var316, var317 = protoModule.writeBuffer(var316, var317, var315, buffer.len(var315))
			buff = var316
			var254 = var317
		elseif self.kind.type == "tooltip" then
			local var318 = self.kind.value:encode()
			local var319, var320 = protoModule.writeTag(buff, var254, 24, protoModule.wireTypes.lengthDelimited)
			var319, var320 = protoModule.writeBuffer(var319, var320, var318, buffer.len(var318))
			buff = var319
			var254 = var320
		elseif self.kind.type == "coachmark" then
			local var321 = self.kind.value:encode()
			local var322, var323 = protoModule.writeTag(buff, var254, 25, protoModule.wireTypes.lengthDelimited)
			var322, var323 = protoModule.writeBuffer(var322, var323, var321, buffer.len(var321))
			buff = var322
			var254 = var323
		elseif self.kind.type == "system_banner_prompt" then
			local var324 = self.kind.value:encode()
			local var325, var326 = protoModule.writeTag(buff, var254, 28, protoModule.wireTypes.lengthDelimited)
			var325, var326 = protoModule.writeBuffer(var325, var326, var324, buffer.len(var324))
			buff = var325
			var254 = var326
		elseif self.kind.type == "age_check_upsell" then
			local var327 = self.kind.value:encode()
			local var328, var329 = protoModule.writeTag(buff, var254, 29, protoModule.wireTypes.lengthDelimited)
			var328, var329 = protoModule.writeBuffer(var328, var329, var327, buffer.len(var327))
			buff = var328
			var254 = var329
		elseif self.kind.type == "catalog_item_list" then
			local var330 = self.kind.value:encode()
			local var331, var332 = protoModule.writeTag(buff, var254, 26, protoModule.wireTypes.lengthDelimited)
			var331, var332 = protoModule.writeBuffer(var331, var332, var330, buffer.len(var330))
			buff = var331
			var254 = var332
		elseif self.kind.type == "user_list" then
			local var333 = self.kind.value:encode()
			local var334, var335 = protoModule.writeTag(buff, var254, 27, protoModule.wireTypes.lengthDelimited)
			var334, var335 = protoModule.writeBuffer(var334, var335, var333, buffer.len(var333))
			buff = var334
			var254 = var335
		elseif self.kind.type == "experience_content_rating_label" then
			local var336 = self.kind.value:encode()
			local var337, var338 = protoModule.writeTag(buff, var254, 30, protoModule.wireTypes.lengthDelimited)
			var337, var338 = protoModule.writeBuffer(var337, var338, var336, buffer.len(var336))
			buff = var337
			var254 = var338
		elseif self.kind.type == "experience_refund_policy" then
			local var339 = self.kind.value:encode()
			local var340, var341 = protoModule.writeTag(buff, var254, 31, protoModule.wireTypes.lengthDelimited)
			var340, var341 = protoModule.writeBuffer(var340, var341, var339, buffer.len(var339))
			buff = var340
			var254 = var341
		elseif self.kind.type == "experience_play_with_reward" then
			local var342 = self.kind.value:encode()
			local var343, var344 = protoModule.writeTag(buff, var254, 32, protoModule.wireTypes.lengthDelimited)
			var343, var344 = protoModule.writeBuffer(var343, var344, var342, buffer.len(var342))
			buff = var343
			var254 = var344
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var345 = self.kind.value:encode()
			local var346, var347 = protoModule.writeTag(buff, var254, 33, protoModule.wireTypes.lengthDelimited)
			var346, var347 = protoModule.writeBuffer(var346, var347, var345, buffer.len(var345))
			buff = var346
			var254 = var347
		elseif self.kind.type == "community_section" then
			local var348 = self.kind.value:encode()
			local var349, var350 = protoModule.writeTag(buff, var254, 35, protoModule.wireTypes.lengthDelimited)
			var349, var350 = protoModule.writeBuffer(var349, var350, var348, buffer.len(var348))
			buff = var349
			var254 = var350
		elseif self.kind.type == "moments_carousel" then
			local var351 = self.kind.value:encode()
			local var352, var353 = protoModule.writeTag(buff, var254, 34, protoModule.wireTypes.lengthDelimited)
			var352, var353 = protoModule.writeBuffer(var352, var353, var351, buffer.len(var351))
			buff = var352
			var254 = var353
		elseif self.kind.type == "text" then
			local var354 = self.kind.value:encode()
			local var355, var356 = protoModule.writeTag(buff, var254, 40, protoModule.wireTypes.lengthDelimited)
			var355, var356 = protoModule.writeBuffer(var355, var356, var354, buffer.len(var354))
			buff = var355
			var254 = var356
		elseif self.kind.type == "vertical_feed" then
			local var357 = self.kind.value:encode()
			local var358, var359 = protoModule.writeTag(buff, var254, 41, protoModule.wireTypes.lengthDelimited)
			var358, var359 = protoModule.writeBuffer(var358, var359, var357, buffer.len(var357))
			buff = var358
			var254 = var359
		elseif self.kind.type == "page_header" then
			local var360 = self.kind.value:encode()
			local var361, var362 = protoModule.writeTag(buff, var254, 42, protoModule.wireTypes.lengthDelimited)
			var361, var362 = protoModule.writeBuffer(var361, var362, var360, buffer.len(var360))
			buff = var361
			var254 = var362
		elseif self.kind.type == "experience_details_feed" then
			local var363 = self.kind.value:encode()
			local var364, var365 = protoModule.writeTag(buff, var254, 500, protoModule.wireTypes.lengthDelimited)
			var364, var365 = protoModule.writeBuffer(var364, var365, var363, buffer.len(var363))
			buff = var364
			var254 = var365
		elseif self.kind.type == "experience_details_action_bar" then
			local var366 = self.kind.value:encode()
			local var367, var368 = protoModule.writeTag(buff, var254, 501, protoModule.wireTypes.lengthDelimited)
			var367, var368 = protoModule.writeBuffer(var367, var368, var366, buffer.len(var366))
			buff = var367
			var254 = var368
		elseif self.kind.type == "experience_details_banner_image" then
			local var369 = self.kind.value:encode()
			local var370, var371 = protoModule.writeTag(buff, var254, 502, protoModule.wireTypes.lengthDelimited)
			var370, var371 = protoModule.writeBuffer(var370, var371, var369, buffer.len(var369))
			buff = var370
			var254 = var371
		elseif self.kind.type == "experience_details_sticky_header" then
			local var372 = self.kind.value:encode()
			local var373, var374 = protoModule.writeTag(buff, var254, 503, protoModule.wireTypes.lengthDelimited)
			var373, var374 = protoModule.writeBuffer(var373, var374, var372, buffer.len(var372))
			buff = var373
			var254 = var374
		elseif self.kind.type == "event_details_feed" then
			local var375 = self.kind.value:encode()
			local var376, var377 = protoModule.writeTag(buff, var254, 600, protoModule.wireTypes.lengthDelimited)
			var376, var377 = protoModule.writeBuffer(var376, var377, var375, buffer.len(var375))
			buff = var376
			var254 = var377
		elseif self.kind.type == "event_details_action_bar" then
			local var378 = self.kind.value:encode()
			local var379, var380 = protoModule.writeTag(buff, var254, 601, protoModule.wireTypes.lengthDelimited)
			var379, var380 = protoModule.writeBuffer(var379, var380, var378, buffer.len(var378))
			buff = var379
			var254 = var380
		elseif self.kind.type == "event_attribution_row" then
			local var381 = self.kind.value:encode()
			local var382, var383 = protoModule.writeTag(buff, var254, 602, protoModule.wireTypes.lengthDelimited)
			var382, var383 = protoModule.writeBuffer(var382, var383, var381, buffer.len(var381))
			buff = var382
			var254 = var383
		elseif self.kind.type == "event_description" then
			local var384 = self.kind.value:encode()
			local var385, var386 = protoModule.writeTag(buff, var254, 603, protoModule.wireTypes.lengthDelimited)
			var385, var386 = protoModule.writeBuffer(var385, var386, var384, buffer.len(var384))
			buff = var385
			var254 = var386
		elseif self.kind.type == "event_info_table" then
			local var387 = self.kind.value:encode()
			local var388, var389 = protoModule.writeTag(buff, var254, 604, protoModule.wireTypes.lengthDelimited)
			var388, var389 = protoModule.writeBuffer(var388, var389, var387, buffer.len(var387))
			buff = var388
			var254 = var389
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var390 = self.kind.value:encode()
			local var391, var392 = protoModule.writeTag(buff, var254, 605, protoModule.wireTypes.lengthDelimited)
			var391, var392 = protoModule.writeBuffer(var391, var392, var390, buffer.len(var390))
			buff = var391
			var254 = var392
		elseif self.kind.type == "event_notifications_modal" then
			local var393 = self.kind.value:encode()
			local var394, var395 = protoModule.writeTag(buff, var254, 606, protoModule.wireTypes.lengthDelimited)
			var394, var395 = protoModule.writeBuffer(var394, var395, var393, buffer.len(var393))
			buff = var394
			var254 = var395
		elseif self.kind.type == "dev_store_feed" then
			local var396 = self.kind.value:encode()
			local var397, var398 = protoModule.writeTag(buff, var254, 700, protoModule.wireTypes.lengthDelimited)
			var397, var398 = protoModule.writeBuffer(var397, var398, var396, buffer.len(var396))
			buff = var397
			var254 = var398
		elseif self.kind.type == "charts_feed" then
			local var399 = self.kind.value:encode()
			local var400, var401 = protoModule.writeTag(buff, var254, 800, protoModule.wireTypes.lengthDelimited)
			var400, var401 = protoModule.writeBuffer(var400, var401, var399, buffer.len(var399))
			buff = var400
			var254 = var401
		elseif self.kind.type == "filter_pills" then
			local var402 = self.kind.value:encode()
			local var403, var404 = protoModule.writeTag(buff, var254, 801, protoModule.wireTypes.lengthDelimited)
			var403, var404 = protoModule.writeBuffer(var403, var404, var402, buffer.len(var402))
			buff = var403
			var254 = var404
		elseif self.kind.type == "sort_selector" then
			local var405 = self.kind.value:encode()
			local var406, var407 = protoModule.writeTag(buff, var254, 802, protoModule.wireTypes.lengthDelimited)
			var406, var407 = protoModule.writeBuffer(var406, var407, var405, buffer.len(var405))
			buff = var406
			var254 = var407
		elseif self.kind.type == "genre_selector" then
			local var408 = self.kind.value:encode()
			local var409, var410 = protoModule.writeTag(buff, var254, 803, protoModule.wireTypes.lengthDelimited)
			var409, var410 = protoModule.writeBuffer(var409, var410, var408, buffer.len(var408))
			buff = var409
			var254 = var410
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var411 = self.kind.value:encode()
			local var412, var413 = protoModule.writeTag(buff, var254, 900, protoModule.wireTypes.lengthDelimited)
			var412, var413 = protoModule.writeBuffer(var412, var413, var411, buffer.len(var411))
			buff = var412
			var254 = var413
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var414 = self.kind.value:encode()
			local var415, var416 = protoModule.writeTag(buff, var254, 901, protoModule.wireTypes.lengthDelimited)
			var415, var416 = protoModule.writeBuffer(var415, var416, var414, buffer.len(var414))
			buff = var415
			var254 = var416
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var417 = self.kind.value:encode()
			local var418, var419 = protoModule.writeTag(buff, var254, 902, protoModule.wireTypes.lengthDelimited)
			var418, var419 = protoModule.writeBuffer(var418, var419, var417, buffer.len(var417))
			buff = var418
			var254 = var419
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var420 = self.kind.value:encode()
			local var421, var422 = protoModule.writeTag(buff, var254, 903, protoModule.wireTypes.lengthDelimited)
			var421, var422 = protoModule.writeBuffer(var421, var422, var420, buffer.len(var420))
			buff = var421
			var254 = var422
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var423 = self.kind.value:encode()
			local var424, var425 = protoModule.writeTag(buff, var254, 904, protoModule.wireTypes.lengthDelimited)
			var424, var425 = protoModule.writeBuffer(var424, var425, var423, buffer.len(var423))
			buff = var424
			var254 = var425
		elseif self.kind.type == "catalog_item_grid" then
			local var426 = self.kind.value:encode()
			local var427, var428 = protoModule.writeTag(buff, var254, 905, protoModule.wireTypes.lengthDelimited)
			var427, var428 = protoModule.writeBuffer(var427, var428, var426, buffer.len(var426))
			buff = var427
			var254 = var428
		elseif self.kind.type == "marketplace_offer_modal" then
			local var429 = self.kind.value:encode()
			local var430, var431 = protoModule.writeTag(buff, var254, 906, protoModule.wireTypes.lengthDelimited)
			var430, var431 = protoModule.writeBuffer(var430, var431, var429, buffer.len(var429))
			buff = var430
			var254 = var431
		elseif self.kind.type == "search_results_feed" then
			local var432 = self.kind.value:encode()
			local var433, var434 = protoModule.writeTag(buff, var254, 1000, protoModule.wireTypes.lengthDelimited)
			var433, var434 = protoModule.writeBuffer(var433, var434, var432, buffer.len(var432))
			buff = var433
			var254 = var434
		elseif self.kind.type == "power_search_ai_overview" then
			local var435 = self.kind.value:encode()
			local var436, var437 = protoModule.writeTag(buff, var254, 1001, protoModule.wireTypes.lengthDelimited)
			var436, var437 = protoModule.writeBuffer(var436, var437, var435, buffer.len(var435))
			buff = var436
			var254 = var437
		elseif self.kind.type == "experience_emphasis_tile" then
			local var438 = self.kind.value:encode()
			local var439, var440 = protoModule.writeTag(buff, var254, 1002, protoModule.wireTypes.lengthDelimited)
			var439, var440 = protoModule.writeBuffer(var439, var440, var438, buffer.len(var438))
			buff = var439
			var254 = var440
		elseif self.kind.type == "option_selector_carousel" then
			local var441 = self.kind.value:encode()
			local var442, var443 = protoModule.writeTag(buff, var254, 1100, protoModule.wireTypes.lengthDelimited)
			var442, var443 = protoModule.writeBuffer(var442, var443, var441, buffer.len(var441))
			buff = var442
			var254 = var443
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var444 = self.kind.value:encode()
			local var445, var446 = protoModule.writeTag(buff, var254, 1103, protoModule.wireTypes.lengthDelimited)
			var445, var446 = protoModule.writeBuffer(var445, var446, var444, buffer.len(var444))
			buff = var445
			var254 = var446
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var447 = self.kind.value:encode()
			local var448, var449 = protoModule.writeTag(buff, var254, 1200, protoModule.wireTypes.lengthDelimited)
			var448, var449 = protoModule.writeBuffer(var448, var449, var447, buffer.len(var447))
			buff = var448
			var254 = var449
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var450 = self.kind.value:encode()
			local var451, var452 = protoModule.writeTag(buff, var254, 1300, protoModule.wireTypes.lengthDelimited)
			var451, var452 = protoModule.writeBuffer(var451, var452, var450, buffer.len(var450))
			buff = var451
			var254 = var452
		end
	end
	local buff_1 = buffer.create(var254)
	buffer.copy(buff_1, 0, buff, 0, var254)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 4729 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var454 = t_5.new()
	local var455 = 0
	while var455 < buffer.len(p9) do
		local _ = nil
		local var456 = nil
		local var457, var458, var459 = protoModule.readTag(p9, var455)
		local var460 = var457
		var456 = var458
		var455 = var459
		
		if var456 == protoModule.wireTypes.varint then
			local _ = nil
			local var461, var462 = protoModule.readVarInt(p9, var455)
			local _ = var461
			var455 = var462
			continue
		end
		if var456 == protoModule.wireTypes.lengthDelimited then
			if var460 == 1 then
				local _ = nil
				local var463, var464 = protoModule.readBuffer(p9, var455)
				var455 = var464
				var454.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var463)
				}
			elseif var460 == 2 then
				local _ = nil
				local var465, var466 = protoModule.readBuffer(p9, var455)
				var455 = var466
				var454.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var465)
				}
			elseif var460 == 3 then
				local _ = nil
				local var467, var468 = protoModule.readBuffer(p9, var455)
				var455 = var468
				var454.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var467)
				}
			elseif var460 == 4 then
				local _ = nil
				local var469, var470 = protoModule.readBuffer(p9, var455)
				var455 = var470
				var454.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var469)
				}
			elseif var460 == 5 then
				local _ = nil
				local var471, var472 = protoModule.readBuffer(p9, var455)
				var455 = var472
				var454.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var471)
				}
			elseif var460 == 6 then
				local _ = nil
				local var473, var474 = protoModule.readBuffer(p9, var455)
				var455 = var474
				var454.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var473)
				}
			elseif var460 == 7 then
				local _ = nil
				local var475, var476 = protoModule.readBuffer(p9, var455)
				var455 = var476
				var454.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var475)
				}
			elseif var460 == 8 then
				local _ = nil
				local var477, var478 = protoModule.readBuffer(p9, var455)
				var455 = var478
				var454.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var477)
				}
			elseif var460 == 9 then
				local _ = nil
				local var479, var480 = protoModule.readBuffer(p9, var455)
				var455 = var480
				var454.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var479)
				}
			elseif var460 == 10 then
				local _ = nil
				local var481, var482 = protoModule.readBuffer(p9, var455)
				var455 = var482
				var454.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var481)
				}
			elseif var460 == 11 then
				local _ = nil
				local var483, var484 = protoModule.readBuffer(p9, var455)
				var455 = var484
				var454.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var483)
				}
			elseif var460 == 12 then
				local _ = nil
				local var485, var486 = protoModule.readBuffer(p9, var455)
				var455 = var486
				var454.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var485)
				}
			elseif var460 == 13 then
				local _ = nil
				local var487, var488 = protoModule.readBuffer(p9, var455)
				var455 = var488
				var454.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var487)
				}
			elseif var460 == 14 then
				local _ = nil
				local var489, var490 = protoModule.readBuffer(p9, var455)
				var455 = var490
				var454.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var489)
				}
			elseif var460 == 15 then
				local _ = nil
				local var491, var492 = protoModule.readBuffer(p9, var455)
				var455 = var492
				var454.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var491)
				}
			elseif var460 == 16 then
				local _ = nil
				local var493, var494 = protoModule.readBuffer(p9, var455)
				var455 = var494
				var454.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var493)
				}
			elseif var460 == 17 then
				local _ = nil
				local var495, var496 = protoModule.readBuffer(p9, var455)
				var455 = var496
				var454.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(var495)
				}
			elseif var460 == 20 then
				local _ = nil
				local var497, var498 = protoModule.readBuffer(p9, var455)
				var455 = var498
				var454.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var497)
				}
			elseif var460 == 21 then
				local _ = nil
				local var499, var500 = protoModule.readBuffer(p9, var455)
				var455 = var500
				var454.kind = { type = "card", value = t.CardInputData.decode(var499) }
			elseif var460 == 22 then
				local _ = nil
				local var501, var502 = protoModule.readBuffer(p9, var455)
				var455 = var502
				var454.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var501)
				}
			elseif var460 == 23 then
				local _ = nil
				local var503, var504 = protoModule.readBuffer(p9, var455)
				var455 = var504
				var454.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var503)
				}
			elseif var460 == 24 then
				local _ = nil
				local var505, var506 = protoModule.readBuffer(p9, var455)
				var455 = var506
				var454.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var505)
				}
			elseif var460 == 25 then
				local _ = nil
				local var507, var508 = protoModule.readBuffer(p9, var455)
				var455 = var508
				var454.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var507)
				}
			elseif var460 == 26 then
				local _ = nil
				local var509, var510 = protoModule.readBuffer(p9, var455)
				var455 = var510
				var454.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var509)
				}
			elseif var460 == 27 then
				local _ = nil
				local var511, var512 = protoModule.readBuffer(p9, var455)
				var455 = var512
				var454.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var511)
				}
			elseif var460 == 28 then
				local _ = nil
				local var513, var514 = protoModule.readBuffer(p9, var455)
				var455 = var514
				var454.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var513)
				}
			elseif var460 == 29 then
				local _ = nil
				local var515, var516 = protoModule.readBuffer(p9, var455)
				var455 = var516
				var454.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var515)
				}
			elseif var460 == 30 then
				local _ = nil
				local var517, var518 = protoModule.readBuffer(p9, var455)
				var455 = var518
				var454.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var517)
				}
			elseif var460 == 31 then
				local _ = nil
				local var519, var520 = protoModule.readBuffer(p9, var455)
				var455 = var520
				var454.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var519)
				}
			elseif var460 == 32 then
				local _ = nil
				local var521, var522 = protoModule.readBuffer(p9, var455)
				var455 = var522
				var454.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var521)
				}
			elseif var460 == 33 then
				local _ = nil
				local var523, var524 = protoModule.readBuffer(p9, var455)
				var455 = var524
				var454.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var523)
				}
			elseif var460 == 34 then
				local _ = nil
				local var525, var526 = protoModule.readBuffer(p9, var455)
				var455 = var526
				var454.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var525)
				}
			elseif var460 == 35 then
				local _ = nil
				local var527, var528 = protoModule.readBuffer(p9, var455)
				var455 = var528
				var454.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(var527)
				}
			elseif var460 == 40 then
				local _ = nil
				local var529, var530 = protoModule.readBuffer(p9, var455)
				var455 = var530
				var454.kind = { type = "text", value = t.TextInputData.decode(var529) }
			elseif var460 == 41 then
				local _ = nil
				local var531, var532 = protoModule.readBuffer(p9, var455)
				var455 = var532
				var454.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var531)
				}
			elseif var460 == 42 then
				local _ = nil
				local var533, var534 = protoModule.readBuffer(p9, var455)
				var455 = var534
				var454.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var533)
				}
			elseif var460 == 500 then
				local _ = nil
				local var535, var536 = protoModule.readBuffer(p9, var455)
				var455 = var536
				var454.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var535)
				}
			elseif var460 == 501 then
				local _ = nil
				local var537, var538 = protoModule.readBuffer(p9, var455)
				var455 = var538
				var454.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var537)
				}
			elseif var460 == 502 then
				local _ = nil
				local var539, var540 = protoModule.readBuffer(p9, var455)
				var455 = var540
				var454.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var539)
				}
			elseif var460 == 503 then
				local _ = nil
				local var541, var542 = protoModule.readBuffer(p9, var455)
				var455 = var542
				var454.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var541)
				}
			elseif var460 == 600 then
				local _ = nil
				local var543, var544 = protoModule.readBuffer(p9, var455)
				var455 = var544
				var454.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var543)
				}
			elseif var460 == 601 then
				local _ = nil
				local var545, var546 = protoModule.readBuffer(p9, var455)
				var455 = var546
				var454.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var545)
				}
			elseif var460 == 602 then
				local _ = nil
				local var547, var548 = protoModule.readBuffer(p9, var455)
				var455 = var548
				var454.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var547)
				}
			elseif var460 == 603 then
				local _ = nil
				local var549, var550 = protoModule.readBuffer(p9, var455)
				var455 = var550
				var454.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var549)
				}
			elseif var460 == 604 then
				local _ = nil
				local var551, var552 = protoModule.readBuffer(p9, var455)
				var455 = var552
				var454.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var551)
				}
			elseif var460 == 605 then
				local _ = nil
				local var553, var554 = protoModule.readBuffer(p9, var455)
				var455 = var554
				var454.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var553)
				}
			elseif var460 == 606 then
				local _ = nil
				local var555, var556 = protoModule.readBuffer(p9, var455)
				var455 = var556
				var454.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var555)
				}
			elseif var460 == 700 then
				local _ = nil
				local var557, var558 = protoModule.readBuffer(p9, var455)
				var455 = var558
				var454.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var557)
				}
			elseif var460 == 800 then
				local _ = nil
				local var559, var560 = protoModule.readBuffer(p9, var455)
				var455 = var560
				var454.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var559)
				}
			elseif var460 == 801 then
				local _ = nil
				local var561, var562 = protoModule.readBuffer(p9, var455)
				var455 = var562
				var454.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var561)
				}
			elseif var460 == 802 then
				local _ = nil
				local var563, var564 = protoModule.readBuffer(p9, var455)
				var455 = var564
				var454.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var563)
				}
			elseif var460 == 803 then
				local _ = nil
				local var565, var566 = protoModule.readBuffer(p9, var455)
				var455 = var566
				var454.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var565)
				}
			elseif var460 == 900 then
				local _ = nil
				local var567, var568 = protoModule.readBuffer(p9, var455)
				var455 = var568
				var454.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var567)
				}
			elseif var460 == 901 then
				local _ = nil
				local var569, var570 = protoModule.readBuffer(p9, var455)
				var455 = var570
				var454.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var569)
				}
			elseif var460 == 902 then
				local _ = nil
				local var571, var572 = protoModule.readBuffer(p9, var455)
				var455 = var572
				var454.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var571)
				}
			elseif var460 == 903 then
				local _ = nil
				local var573, var574 = protoModule.readBuffer(p9, var455)
				var455 = var574
				var454.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var573)
				}
			elseif var460 == 904 then
				local _ = nil
				local var575, var576 = protoModule.readBuffer(p9, var455)
				var455 = var576
				var454.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var575)
				}
			elseif var460 == 905 then
				local _ = nil
				local var577, var578 = protoModule.readBuffer(p9, var455)
				var455 = var578
				var454.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var577)
				}
			elseif var460 == 906 then
				local _ = nil
				local var579, var580 = protoModule.readBuffer(p9, var455)
				var455 = var580
				var454.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var579)
				}
			elseif var460 == 1000 then
				local _ = nil
				local var581, var582 = protoModule.readBuffer(p9, var455)
				var455 = var582
				var454.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var581)
				}
			elseif var460 == 1001 then
				local _ = nil
				local var583, var584 = protoModule.readBuffer(p9, var455)
				var455 = var584
				var454.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var583)
				}
			elseif var460 == 1002 then
				local _ = nil
				local var585, var586 = protoModule.readBuffer(p9, var455)
				var455 = var586
				var454.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var585)
				}
			elseif var460 == 1100 then
				local _ = nil
				local var587, var588 = protoModule.readBuffer(p9, var455)
				var455 = var588
				var454.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var587)
				}
			elseif var460 == 1103 then
				local _ = nil
				local var589, var590 = protoModule.readBuffer(p9, var455)
				var455 = var590
				var454.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var589)
				}
			elseif var460 == 1200 then
				local _ = nil
				local var591, var592 = protoModule.readBuffer(p9, var455)
				var455 = var592
				var454.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var591)
				}
			elseif var460 == 1300 then
				local _ = nil
				local var593, var594 = protoModule.readBuffer(p9, var455)
				var455 = var594
				var454.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var593)
				}
			else
				local _ = nil
				local var595, var596 = protoModule.readVarInt(p9, var455)
				var455 = var596 + var595
			end
		elseif var456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var597, var598 = protoModule.readFixed32(p9, var455)
			local _ = var597
			var455 = var598
		elseif var456 == protoModule.wireTypes.i64 then
			local _ = nil
			local var599, var600 = protoModule.readFixed64(p9, var455)
			local _ = var599
			var455 = var600
		else
			error("Unsupported wire type: " .. var456)
		end
	end
	return var454
end

function t_5:jsonEncode() --[[ line: 5194 ]]
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

function t_5:jsonDecode() --[[ line: 5336 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var602 = t_5.new()
	
	if self.badges_grid ~= nil then
		var602.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var602.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var602.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var602.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var602.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var602.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var602.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var602.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var602.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var602.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var602.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var602.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var602.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var602.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var602.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var602.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var602.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var602.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var602.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var602.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var602.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var602.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var602.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var602.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var602.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var602.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var602.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var602.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var602.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var602.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var602.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var602.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var602.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var602.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var602.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var602.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var602.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var602.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var602.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var602.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var602.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var602.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var602.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var602.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var602.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var602.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var602.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var602.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var602.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var602.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var602.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var602.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var602.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var602.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var602.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var602.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var602.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var602.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var602.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var602.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var602.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var602.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var602.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var602.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var602.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var602.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.experience_details_feed ~= nil then
		var602.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var602.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var602.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var602.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var602.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var602.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var602.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var602.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var602.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var602.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var602.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var602.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var602.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var602.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var602.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var602.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var602.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var602.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var602.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var602.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var602.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var602.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var602.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var602.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var602.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var602.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var602.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var602.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var602.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var602.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var602.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var602.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var602.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var602.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var602.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var602.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var602.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var602.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var602.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var602.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var602.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var602.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var602.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var602.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var602.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var602.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var602.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var602.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var602.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var602.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var602.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var602.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var602.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var602.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var602.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var602.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var602.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var602.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var602.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var602.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	return var602
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 6164 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p10 == nil or p10.section_title == nil then "" else p10.section_title,
		badges = if p10 == nil or p10.badges == nil then {} else p10.badges,
		collection_id = if p10 == nil or p10.collection_id == nil then "" else p10.collection_id,
		collection_position = if p10 == nil or p10.collection_position == nil then "" else p10.collection_position,
		universe_id = if p10 == nil or p10.universe_id == nil then "" else p10.universe_id
	}, t_6)
end

function t_6:encode() --[[ line: 6176 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var604 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var605, var606 = protoModule.writeTag(buff, var604, 1, protoModule.wireTypes.lengthDelimited)
		var605, var606 = protoModule.writeString(var605, var606, self.section_title)
		buff = var605
		var604 = var606
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var607 = v:encode()
			local var608, var609 = protoModule.writeTag(buff, var604, 2, protoModule.wireTypes.lengthDelimited)
			var608, var609 = protoModule.writeBuffer(var608, var609, var607, buffer.len(var607))
			buff = var608
			var604 = var609
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var610, var611 = protoModule.writeTag(buff, var604, 3, protoModule.wireTypes.lengthDelimited)
		var610, var611 = protoModule.writeString(var610, var611, self.collection_id)
		buff = var610
		var604 = var611
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var612, var613 = protoModule.writeTag(buff, var604, 4, protoModule.wireTypes.lengthDelimited)
		var612, var613 = protoModule.writeString(var612, var613, self.collection_position)
		buff = var612
		var604 = var613
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var614, var615 = protoModule.writeTag(buff, var604, 5, protoModule.wireTypes.lengthDelimited)
		var614, var615 = protoModule.writeString(var614, var615, self.universe_id)
		buff = var614
		var604 = var615
	end
	local buff_1 = buffer.create(var604)
	buffer.copy(buff_1, 0, buff, 0, var604)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 6213 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var617 = t_6.new()
	local var618 = 0
	while var618 < buffer.len(p11) do
		local _ = nil
		local var619 = nil
		local var620, var621, var622 = protoModule.readTag(p11, var618)
		local var623 = var620
		var619 = var621
		var618 = var622
		
		if var619 == protoModule.wireTypes.varint then
			local _ = nil
			local var624, var625 = protoModule.readVarInt(p11, var618)
			local _ = var624
			var618 = var625
			continue
		end
		if var619 == protoModule.wireTypes.lengthDelimited then
			if var623 == 1 then
				local _ = nil
				local var626, var627 = protoModule.readBuffer(p11, var618)
				var618 = var627
				var617.section_title = buffer.tostring(var626)
			elseif var623 == 2 then
				local _ = nil
				local var628, var629 = protoModule.readBuffer(p11, var618)
				var618 = var629
				table.insert(var617.badges, t.BadgesGridInputData_BadgeInputData.decode(var628))
			elseif var623 == 3 then
				local _ = nil
				local var630, var631 = protoModule.readBuffer(p11, var618)
				var618 = var631
				var617.collection_id = buffer.tostring(var630)
			elseif var623 == 4 then
				local _ = nil
				local var632, var633 = protoModule.readBuffer(p11, var618)
				var618 = var633
				var617.collection_position = buffer.tostring(var632)
			elseif var623 == 5 then
				local _ = nil
				local var634, var635 = protoModule.readBuffer(p11, var618)
				var618 = var635
				var617.universe_id = buffer.tostring(var634)
			else
				local _ = nil
				local var636, var637 = protoModule.readVarInt(p11, var618)
				var618 = var637 + var636
			end
		elseif var619 == protoModule.wireTypes.i32 then
			local _ = nil
			local var638, var639 = protoModule.readFixed32(p11, var618)
			local _ = var638
			var618 = var639
		elseif var619 == protoModule.wireTypes.i64 then
			local _ = nil
			local var640, var641 = protoModule.readFixed64(p11, var618)
			local _ = var640
			var618 = var641
		else
			error("Unsupported wire type: " .. var619)
		end
	end
	return var617
end

function t_6:jsonEncode() --[[ line: 6276 ]]
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

function t_6:jsonDecode() --[[ line: 6306 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var644 = t_6.new()
	
	if self.section_title ~= nil then
		var644.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var644.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var644.badges = t_1
	end
	if self.collection_id ~= nil then
		var644.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var644.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var644.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var644.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var644.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var644.universe_id = self.universeId
	end
	return var644
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 6367 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p12 == nil or p12.badge_id == nil then "" else p12.badge_id
	}, t_7)
end

function t_7:encode() --[[ line: 6375 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var647 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var648, var649 = protoModule.writeTag(buff, var647, 1, protoModule.wireTypes.lengthDelimited)
		var648, var649 = protoModule.writeString(var648, var649, self.badge_id)
		buff = var648
		var647 = var649
	end
	local buff_1 = buffer.create(var647)
	buffer.copy(buff_1, 0, buff, 0, var647)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 6389 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var651 = t_7.new()
	local var652 = 0
	while var652 < buffer.len(p13) do
		local _ = nil
		local var653 = nil
		local var654, var655, var656 = protoModule.readTag(p13, var652)
		local var657 = var654
		var653 = var655
		var652 = var656
		
		if var653 == protoModule.wireTypes.varint then
			local _ = nil
			local var658, var659 = protoModule.readVarInt(p13, var652)
			local _ = var658
			var652 = var659
			continue
		end
		if var653 == protoModule.wireTypes.lengthDelimited then
			if var657 == 1 then
				local _ = nil
				local var660, var661 = protoModule.readBuffer(p13, var652)
				var652 = var661
				var651.badge_id = buffer.tostring(var660)
			else
				local _ = nil
				local var662, var663 = protoModule.readVarInt(p13, var652)
				var652 = var663 + var662
			end
		elseif var653 == protoModule.wireTypes.i32 then
			local _ = nil
			local var664, var665 = protoModule.readFixed32(p13, var652)
			local _ = var664
			var652 = var665
		elseif var653 == protoModule.wireTypes.i64 then
			local _ = nil
			local var666, var667 = protoModule.readFixed64(p13, var652)
			local _ = var666
			var652 = var667
		else
			error("Unsupported wire type: " .. var653)
		end
	end
	return var651
end

function t_7:jsonEncode() --[[ line: 6432 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_7:jsonDecode() --[[ line: 6442 ]]
	-- upvalues: t_7 (ref)
	local var669 = t_7.new()
	
	if self.badge_id ~= nil then
		var669.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var669.badge_id = self.badgeId
	end
	return var669
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 6472 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p14 == nil or p14.badge_id == nil then "" else p14.badge_id,
		universe_id = if p14 == nil or p14.universe_id == nil then "" else p14.universe_id,
		localized_literals = if p14 == nil or p14.localized_literals == nil then nil else p14.localized_literals,
		creator_key = if p14 == nil or p14.creator_key == nil then "" else p14.creator_key
	}, t_8)
end

function t_8:encode() --[[ line: 6481 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var671 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var672, var673 = protoModule.writeTag(buff, var671, 1, protoModule.wireTypes.lengthDelimited)
		var672, var673 = protoModule.writeString(var672, var673, self.badge_id)
		buff = var672
		var671 = var673
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var674, var675 = protoModule.writeTag(buff, var671, 2, protoModule.wireTypes.lengthDelimited)
		var674, var675 = protoModule.writeString(var674, var675, self.universe_id)
		buff = var674
		var671 = var675
	end
	if self.localized_literals ~= nil then
		local var676 = self.localized_literals:encode()
		local var677, var678 = protoModule.writeTag(buff, var671, 3, protoModule.wireTypes.lengthDelimited)
		var677, var678 = protoModule.writeBuffer(var677, var678, var676, buffer.len(var676))
		buff = var677
		var671 = var678
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var679, var680 = protoModule.writeTag(buff, var671, 4, protoModule.wireTypes.lengthDelimited)
		var679, var680 = protoModule.writeString(var679, var680, self.creator_key)
		buff = var679
		var671 = var680
	end
	local buff_1 = buffer.create(var671)
	buffer.copy(buff_1, 0, buff, 0, var671)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 6511 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var682 = t_8.new()
	local var683 = 0
	while var683 < buffer.len(p15) do
		local _ = nil
		local var684 = nil
		local var685, var686, var687 = protoModule.readTag(p15, var683)
		local var688 = var685
		var684 = var686
		var683 = var687
		
		if var684 == protoModule.wireTypes.varint then
			local _ = nil
			local var689, var690 = protoModule.readVarInt(p15, var683)
			local _ = var689
			var683 = var690
			continue
		end
		if var684 == protoModule.wireTypes.lengthDelimited then
			if var688 == 1 then
				local _ = nil
				local var691, var692 = protoModule.readBuffer(p15, var683)
				var683 = var692
				var682.badge_id = buffer.tostring(var691)
			elseif var688 == 2 then
				local _ = nil
				local var693, var694 = protoModule.readBuffer(p15, var683)
				var683 = var694
				var682.universe_id = buffer.tostring(var693)
			elseif var688 == 3 then
				local _ = nil
				local var695, var696 = protoModule.readBuffer(p15, var683)
				var683 = var696
				var682.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var695)
			elseif var688 == 4 then
				local _ = nil
				local var697, var698 = protoModule.readBuffer(p15, var683)
				var683 = var698
				var682.creator_key = buffer.tostring(var697)
			else
				local _ = nil
				local var699, var700 = protoModule.readVarInt(p15, var683)
				var683 = var700 + var699
			end
		elseif var684 == protoModule.wireTypes.i32 then
			local _ = nil
			local var701, var702 = protoModule.readFixed32(p15, var683)
			local _ = var701
			var683 = var702
		elseif var684 == protoModule.wireTypes.i64 then
			local _ = nil
			local var703, var704 = protoModule.readFixed64(p15, var683)
			local _ = var703
			var683 = var704
		else
			error("Unsupported wire type: " .. var684)
		end
	end
	return var682
end

function t_8:jsonEncode() --[[ line: 6569 ]]
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

function t_8:jsonDecode() --[[ line: 6591 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var706 = t_8.new()
	
	if self.badge_id ~= nil then
		var706.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var706.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var706.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var706.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var706.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var706.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var706.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var706.creator_key = self.creatorKey
	end
	return var706
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 6645 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p16 == nil or p16.info_table == nil then nil else p16.info_table,
		action_module = if p16 == nil or p16.action_module == nil then nil else p16.action_module,
		overflow_menu = if p16 == nil or p16.overflow_menu == nil then nil else p16.overflow_menu
	}, t_9)
end

function t_9:encode() --[[ line: 6655 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var708 = 0
	
	if self.info_table ~= nil then
		local var709 = self.info_table:encode()
		local var710, var711 = protoModule.writeTag(buff, var708, 1, protoModule.wireTypes.lengthDelimited)
		var710, var711 = protoModule.writeBuffer(var710, var711, var709, buffer.len(var709))
		buff = var710
		var708 = var711
	end
	if self.action_module ~= nil then
		local var712 = self.action_module:encode()
		local var713, var714 = protoModule.writeTag(buff, var708, 2, protoModule.wireTypes.lengthDelimited)
		var713, var714 = protoModule.writeBuffer(var713, var714, var712, buffer.len(var712))
		buff = var713
		var708 = var714
	end
	if self.overflow_menu ~= nil then
		local var715 = self.overflow_menu:encode()
		local var716, var717 = protoModule.writeTag(buff, var708, 3, protoModule.wireTypes.lengthDelimited)
		var716, var717 = protoModule.writeBuffer(var716, var717, var715, buffer.len(var715))
		buff = var716
		var708 = var717
	end
	local buff_1 = buffer.create(var708)
	buffer.copy(buff_1, 0, buff, 0, var708)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 6682 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var719 = t_9.new()
	local var720 = 0
	while var720 < buffer.len(p17) do
		local _ = nil
		local var721 = nil
		local var722, var723, var724 = protoModule.readTag(p17, var720)
		local var725 = var722
		var721 = var723
		var720 = var724
		
		if var721 == protoModule.wireTypes.varint then
			local _ = nil
			local var726, var727 = protoModule.readVarInt(p17, var720)
			local _ = var726
			var720 = var727
			continue
		end
		if var721 == protoModule.wireTypes.lengthDelimited then
			if var725 == 1 then
				local _ = nil
				local var728, var729 = protoModule.readBuffer(p17, var720)
				var720 = var729
				var719.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var728)
			elseif var725 == 2 then
				local _ = nil
				local var730, var731 = protoModule.readBuffer(p17, var720)
				var720 = var731
				var719.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var730)
			elseif var725 == 3 then
				local _ = nil
				local var732, var733 = protoModule.readBuffer(p17, var720)
				var720 = var733
				var719.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var732)
			else
				local _ = nil
				local var734, var735 = protoModule.readVarInt(p17, var720)
				var720 = var735 + var734
			end
		elseif var721 == protoModule.wireTypes.i32 then
			local _ = nil
			local var736, var737 = protoModule.readFixed32(p17, var720)
			local _ = var736
			var720 = var737
		elseif var721 == protoModule.wireTypes.i64 then
			local _ = nil
			local var738, var739 = protoModule.readFixed64(p17, var720)
			local _ = var738
			var720 = var739
		else
			error("Unsupported wire type: " .. var721)
		end
	end
	return var719
end

function t_9:jsonEncode() --[[ line: 6735 ]]
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

function t_9:jsonDecode() --[[ line: 6753 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var741 = t_9.new()
	
	if self.info_table ~= nil then
		var741.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var741.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var741.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var741.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var741.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var741.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var741
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 6804 ]]
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

function t_10:encode() --[[ line: 6823 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var743 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var744, var745 = protoModule.writeTag(buff, var743, 1, protoModule.wireTypes.lengthDelimited)
		var744, var745 = protoModule.writeString(var744, var745, self.type_label)
		buff = var744
		var743 = var745
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var746, var747 = protoModule.writeTag(buff, var743, 2, protoModule.wireTypes.lengthDelimited)
		var746, var747 = protoModule.writeString(var746, var747, self.earned_label)
		buff = var746
		var743 = var747
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var748, var749 = protoModule.writeTag(buff, var743, 3, protoModule.wireTypes.lengthDelimited)
		var748, var749 = protoModule.writeString(var748, var749, self.updated_label)
		buff = var748
		var743 = var749
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var750, var751 = protoModule.writeTag(buff, var743, 4, protoModule.wireTypes.lengthDelimited)
		var750, var751 = protoModule.writeString(var750, var751, self.experience_label)
		buff = var750
		var743 = var751
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var752, var753 = protoModule.writeTag(buff, var743, 5, protoModule.wireTypes.lengthDelimited)
		var752, var753 = protoModule.writeString(var752, var753, self.rarity_label)
		buff = var752
		var743 = var753
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var754, var755 = protoModule.writeTag(buff, var743, 6, protoModule.wireTypes.lengthDelimited)
		var754, var755 = protoModule.writeString(var754, var755, self.won_yesterday_label)
		buff = var754
		var743 = var755
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var756, var757 = protoModule.writeTag(buff, var743, 7, protoModule.wireTypes.lengthDelimited)
		var756, var757 = protoModule.writeString(var756, var757, self.won_ever_label)
		buff = var756
		var743 = var757
	end
	local buff_1 = buffer.create(var743)
	buffer.copy(buff_1, 0, buff, 0, var743)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 6869 ]]
	-- upvalues: t_10 (ref), protoModule (ref)
	local var759 = t_10.new()
	local var760 = 0
	while var760 < buffer.len(p19) do
		local _ = nil
		local var761 = nil
		local var762, var763, var764 = protoModule.readTag(p19, var760)
		local var765 = var762
		var761 = var763
		var760 = var764
		
		if var761 == protoModule.wireTypes.varint then
			local _ = nil
			local var766, var767 = protoModule.readVarInt(p19, var760)
			local _ = var766
			var760 = var767
			continue
		end
		if var761 == protoModule.wireTypes.lengthDelimited then
			if var765 == 1 then
				local _ = nil
				local var768, var769 = protoModule.readBuffer(p19, var760)
				var760 = var769
				var759.type_label = buffer.tostring(var768)
			elseif var765 == 2 then
				local _ = nil
				local var770, var771 = protoModule.readBuffer(p19, var760)
				var760 = var771
				var759.earned_label = buffer.tostring(var770)
			elseif var765 == 3 then
				local _ = nil
				local var772, var773 = protoModule.readBuffer(p19, var760)
				var760 = var773
				var759.updated_label = buffer.tostring(var772)
			elseif var765 == 4 then
				local _ = nil
				local var774, var775 = protoModule.readBuffer(p19, var760)
				var760 = var775
				var759.experience_label = buffer.tostring(var774)
			elseif var765 == 5 then
				local _ = nil
				local var776, var777 = protoModule.readBuffer(p19, var760)
				var760 = var777
				var759.rarity_label = buffer.tostring(var776)
			elseif var765 == 6 then
				local _ = nil
				local var778, var779 = protoModule.readBuffer(p19, var760)
				var760 = var779
				var759.won_yesterday_label = buffer.tostring(var778)
			elseif var765 == 7 then
				local _ = nil
				local var780, var781 = protoModule.readBuffer(p19, var760)
				var760 = var781
				var759.won_ever_label = buffer.tostring(var780)
			else
				local _ = nil
				local var782, var783 = protoModule.readVarInt(p19, var760)
				var760 = var783 + var782
			end
		elseif var761 == protoModule.wireTypes.i32 then
			local _ = nil
			local var784, var785 = protoModule.readFixed32(p19, var760)
			local _ = var784
			var760 = var785
		elseif var761 == protoModule.wireTypes.i64 then
			local _ = nil
			local var786, var787 = protoModule.readFixed64(p19, var760)
			local _ = var786
			var760 = var787
		else
			error("Unsupported wire type: " .. var761)
		end
	end
	return var759
end

function t_10:jsonEncode() --[[ line: 6944 ]]
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

function t_10:jsonDecode() --[[ line: 6980 ]]
	-- upvalues: t_10 (ref)
	local var789 = t_10.new()
	
	if self.type_label ~= nil then
		var789.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var789.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var789.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var789.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var789.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var789.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var789.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var789.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var789.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var789.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var789.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var789.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var789.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var789.won_ever_label = self.wonEverLabel
	end
	return var789
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 7060 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p20 == nil or p20.share == nil then "" else p20.share,
		report = if p20 == nil or p20.report == nil then "" else p20.report
	}, t_11)
end

function t_11:encode() --[[ line: 7072 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var791 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var792, var793 = protoModule.writeTag(buff, var791, 1, protoModule.wireTypes.lengthDelimited)
		var792, var793 = protoModule.writeString(var792, var793, self.share)
		buff = var792
		var791 = var793
	end
	if self.report ~= nil and self.report ~= "" then
		local var794, var795 = protoModule.writeTag(buff, var791, 2, protoModule.wireTypes.lengthDelimited)
		var794, var795 = protoModule.writeString(var794, var795, self.report)
		buff = var794
		var791 = var795
	end
	local buff_1 = buffer.create(var791)
	buffer.copy(buff_1, 0, buff, 0, var791)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 7093 ]]
	-- upvalues: t_11 (ref), protoModule (ref)
	local var797 = t_11.new()
	local var798 = 0
	while var798 < buffer.len(p21) do
		local _ = nil
		local var799 = nil
		local var800, var801, var802 = protoModule.readTag(p21, var798)
		local var803 = var800
		var799 = var801
		var798 = var802
		
		if var799 == protoModule.wireTypes.varint then
			local _ = nil
			local var804, var805 = protoModule.readVarInt(p21, var798)
			local _ = var804
			var798 = var805
			continue
		end
		if var799 == protoModule.wireTypes.lengthDelimited then
			if var803 == 1 then
				local _ = nil
				local var806, var807 = protoModule.readBuffer(p21, var798)
				var798 = var807
				var797.share = buffer.tostring(var806)
			elseif var803 == 2 then
				local _ = nil
				local var808, var809 = protoModule.readBuffer(p21, var798)
				var798 = var809
				var797.report = buffer.tostring(var808)
			else
				local _ = nil
				local var810, var811 = protoModule.readVarInt(p21, var798)
				var798 = var811 + var810
			end
		elseif var799 == protoModule.wireTypes.i32 then
			local _ = nil
			local var812, var813 = protoModule.readFixed32(p21, var798)
			local _ = var812
			var798 = var813
		elseif var799 == protoModule.wireTypes.i64 then
			local _ = nil
			local var814, var815 = protoModule.readFixed64(p21, var798)
			local _ = var814
			var798 = var815
		else
			error("Unsupported wire type: " .. var799)
		end
	end
	return var797
end

function t_11:jsonEncode() --[[ line: 7143 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_11:jsonDecode() --[[ line: 7159 ]]
	-- upvalues: t_11 (ref)
	local var817 = t_11.new()
	
	if self.share ~= nil then
		var817.share = self.share
	end
	if self.report ~= nil then
		var817.report = self.report
	end
	return var817
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 7191 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p22 == nil or p22.report == nil then "" else p22.report,
		remove = if p22 == nil or p22.remove == nil then "" else p22.remove
	}, t_12)
end

function t_12:encode() --[[ line: 7203 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var819 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var820, var821 = protoModule.writeTag(buff, var819, 1, protoModule.wireTypes.lengthDelimited)
		var820, var821 = protoModule.writeString(var820, var821, self.report)
		buff = var820
		var819 = var821
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var822, var823 = protoModule.writeTag(buff, var819, 2, protoModule.wireTypes.lengthDelimited)
		var822, var823 = protoModule.writeString(var822, var823, self.remove)
		buff = var822
		var819 = var823
	end
	local buff_1 = buffer.create(var819)
	buffer.copy(buff_1, 0, buff, 0, var819)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 7224 ]]
	-- upvalues: t_12 (ref), protoModule (ref)
	local var825 = t_12.new()
	local var826 = 0
	while var826 < buffer.len(p23) do
		local _ = nil
		local var827 = nil
		local var828, var829, var830 = protoModule.readTag(p23, var826)
		local var831 = var828
		var827 = var829
		var826 = var830
		
		if var827 == protoModule.wireTypes.varint then
			local _ = nil
			local var832, var833 = protoModule.readVarInt(p23, var826)
			local _ = var832
			var826 = var833
			continue
		end
		if var827 == protoModule.wireTypes.lengthDelimited then
			if var831 == 1 then
				local _ = nil
				local var834, var835 = protoModule.readBuffer(p23, var826)
				var826 = var835
				var825.report = buffer.tostring(var834)
			elseif var831 == 2 then
				local _ = nil
				local var836, var837 = protoModule.readBuffer(p23, var826)
				var826 = var837
				var825.remove = buffer.tostring(var836)
			else
				local _ = nil
				local var838, var839 = protoModule.readVarInt(p23, var826)
				var826 = var839 + var838
			end
		elseif var827 == protoModule.wireTypes.i32 then
			local _ = nil
			local var840, var841 = protoModule.readFixed32(p23, var826)
			local _ = var840
			var826 = var841
		elseif var827 == protoModule.wireTypes.i64 then
			local _ = nil
			local var842, var843 = protoModule.readFixed64(p23, var826)
			local _ = var842
			var826 = var843
		else
			error("Unsupported wire type: " .. var827)
		end
	end
	return var825
end

function t_12:jsonEncode() --[[ line: 7274 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_12:jsonDecode() --[[ line: 7290 ]]
	-- upvalues: t_12 (ref)
	local var845 = t_12.new()
	
	if self.report ~= nil then
		var845.report = self.report
	end
	if self.remove ~= nil then
		var845.remove = self.remove
	end
	return var845
end

t_12.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t_12
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local t_13 = {}
t_13.__index = t_13

function t_13.new(_) --[[ line: 7321 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({}, t_13)
end

function t_13.encode(_) --[[ line: 7325 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_13.decode(p24) --[[ line: 7334 ]]
	-- upvalues: t_13 (ref), protoModule (ref)
	local var847 = t_13.new()
	local var848 = 0
	while var848 < buffer.len(p24) do
		local var849 = nil
		local _ = nil
		local var850, var851, var852 = protoModule.readTag(p24, var848)
		var849 = var850
		local var853 = var851
		var848 = var852
		
		if var853 == protoModule.wireTypes.varint then
			local _ = nil
			local var854, var855 = protoModule.readVarInt(p24, var848)
			local _ = var854
			var848 = var855
		elseif var853 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var856, var857 = protoModule.readVarInt(p24, var848)
			var848 = var857 + var856
		elseif var853 == protoModule.wireTypes.i32 then
			local _ = nil
			local var858, var859 = protoModule.readFixed32(p24, var848)
			local _ = var858
			var848 = var859
		elseif var853 == protoModule.wireTypes.i64 then
			local _ = nil
			local var860, var861 = protoModule.readFixed64(p24, var848)
			local _ = var860
			var848 = var861
		else
			error("Unsupported wire type: " .. var853)
		end
	end
	return var847
end

function t_13.jsonEncode(_) --[[ line: 7372 ]]
	return {}
end

function t_13.jsonDecode(_) --[[ line: 7378 ]]
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

function t_14.new(p25) --[[ line: 7398 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p25 == nil or p25.universe_id == nil then "" else p25.universe_id,
		creator_key = if p25 == nil or p25.creator_key == nil then "" else p25.creator_key,
		entry_map = if p25 == nil or p25.entry_map == nil then {} else p25.entry_map,
		entry_order = if p25 == nil or p25.entry_order == nil then {} else p25.entry_order,
		entry_order_map = if p25 == nil or p25.entry_order_map == nil then {} else p25.entry_order_map
	}, t_14)
end

function t_14:encode() --[[ line: 7410 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var863 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var864, var865 = protoModule.writeTag(buff, var863, 1, protoModule.wireTypes.lengthDelimited)
		var864, var865 = protoModule.writeString(var864, var865, self.universe_id)
		buff = var864
		var863 = var865
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var866, var867 = protoModule.writeTag(buff, var863, 2, protoModule.wireTypes.lengthDelimited)
		var866, var867 = protoModule.writeString(var866, var867, self.creator_key)
		buff = var866
		var863 = var867
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var868, var869 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var868, var869 = protoModule.writeString(var868, var869, i)
			local var870 = v:encode()
			var869, var871 = protoModule.writeTag(var868, var869, 2, protoModule.wireTypes.lengthDelimited)
			var869, var871 = protoModule.writeBuffer(var869, var871, var870, buffer.len(var870))
			local var872 = var869
			local var873 = var871
			local var874, var875 = protoModule.writeTag(buff, var863, 3, protoModule.wireTypes.lengthDelimited)
			var874, var875 = protoModule.writeBuffer(var874, var875, var872, var873)
			buff = var874
			var863 = var875
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var876, var877 = protoModule.writeTag(buff, var863, 4, protoModule.wireTypes.lengthDelimited)
			var876, var877 = protoModule.writeString(var876, var877, v)
			buff = var876
			var863 = var877
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var878, var879 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var878, var879 = protoModule.writeString(var878, var879, i)
			local var880 = v:encode()
			var879, var881 = protoModule.writeTag(var878, var879, 2, protoModule.wireTypes.lengthDelimited)
			var879, var881 = protoModule.writeBuffer(var879, var881, var880, buffer.len(var880))
			local var882 = var879
			local var883 = var881
			local var884, var885 = protoModule.writeTag(buff, var863, 5, protoModule.wireTypes.lengthDelimited)
			var884, var885 = protoModule.writeBuffer(var884, var885, var882, var883)
			buff = var884
			var863 = var885
		end
	end
	local buff_1 = buffer.create(var863)
	buffer.copy(buff_1, 0, buff, 0, var863)
	
	return buff_1
end

function t_14.decode(p26) --[[ line: 7464 ]]
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var887 = t_14.new()
	local var888 = 0
	while var888 < buffer.len(p26) do
		local _ = nil
		local var889 = nil
		local var890, var891, var892 = protoModule.readTag(p26, var888)
		local var893 = var890
		var889 = var891
		var888 = var892
		
		if var889 == protoModule.wireTypes.varint then
			local _ = nil
			local var894, var895 = protoModule.readVarInt(p26, var888)
			local _ = var894
			var888 = var895
			continue
		end
		if var889 == protoModule.wireTypes.lengthDelimited then
			if var893 == 1 then
				local _ = nil
				local var896, var897 = protoModule.readBuffer(p26, var888)
				var888 = var897
				var887.universe_id = buffer.tostring(var896)
			elseif var893 == 2 then
				local _ = nil
				local var898, var899 = protoModule.readBuffer(p26, var888)
				var888 = var899
				var887.creator_key = buffer.tostring(var898)
			elseif var893 == 3 then
				local _ = nil
				local var900, var901 = protoModule.readBuffer(p26, var888)
				var888 = var901
				var900 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var900)
				var887.entry_map[var900.key or ""] = var900.value or t.FeedEntry.new()
			elseif var893 == 4 then
				local _ = nil
				local var902, var903 = protoModule.readBuffer(p26, var888)
				var888 = var903
				table.insert(var887.entry_order, buffer.tostring(var902))
			elseif var893 == 5 then
				local _ = nil
				local var904, var905 = protoModule.readBuffer(p26, var888)
				var888 = var905
				var904 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var904)
				var887.entry_order_map[var904.key or ""] = var904.value or t.EntryOrder.new()
			else
				local _ = nil
				local var906, var907 = protoModule.readVarInt(p26, var888)
				var888 = var907 + var906
			end
		elseif var889 == protoModule.wireTypes.i32 then
			local _ = nil
			local var908, var909 = protoModule.readFixed32(p26, var888)
			local _ = var908
			var888 = var909
		elseif var889 == protoModule.wireTypes.i64 then
			local _ = nil
			local var910, var911 = protoModule.readFixed64(p26, var888)
			local _ = var910
			var888 = var911
		else
			error("Unsupported wire type: " .. var889)
		end
	end
	return var887
end

function t_14:jsonEncode() --[[ line: 7541 ]]
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

function t_14:jsonDecode() --[[ line: 7579 ]]
	-- upvalues: t_14 (ref), t (ref)
	local var916 = t_14.new()
	
	if self.universe_id ~= nil then
		var916.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var916.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var916.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var916.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var916.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var916.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var916.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var916.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var916.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var916.entry_order_map = t_1
	end
	return var916
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p27) --[[ line: 7669 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p27 == nil or p27.key == nil then "" else p27.key,
		value = if p27 == nil or p27.value == nil then nil else p27.value
	}, t_15)
end

function t_15:encode() --[[ line: 7678 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var924 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var925, var926 = protoModule.writeTag(buff, var924, 1, protoModule.wireTypes.lengthDelimited)
		var925, var926 = protoModule.writeString(var925, var926, self.key)
		buff = var925
		var924 = var926
	end
	if self.value ~= nil then
		local var927 = self.value:encode()
		local var928, var929 = protoModule.writeTag(buff, var924, 2, protoModule.wireTypes.lengthDelimited)
		var928, var929 = protoModule.writeBuffer(var928, var929, var927, buffer.len(var927))
		buff = var928
		var924 = var929
	end
	local buff_1 = buffer.create(var924)
	buffer.copy(buff_1, 0, buff, 0, var924)
	
	return buff_1
end

function t_15.decode(p28) --[[ line: 7700 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var931 = t_15.new()
	local var932 = 0
	while var932 < buffer.len(p28) do
		local _ = nil
		local var933 = nil
		local var934, var935, var936 = protoModule.readTag(p28, var932)
		local var937 = var934
		var933 = var935
		var932 = var936
		
		if var933 == protoModule.wireTypes.varint then
			local _ = nil
			local var938, var939 = protoModule.readVarInt(p28, var932)
			local _ = var938
			var932 = var939
			continue
		end
		if var933 == protoModule.wireTypes.lengthDelimited then
			if var937 == 1 then
				local _ = nil
				local var940, var941 = protoModule.readBuffer(p28, var932)
				var932 = var941
				var931.key = buffer.tostring(var940)
			elseif var937 == 2 then
				local _ = nil
				local var942, var943 = protoModule.readBuffer(p28, var932)
				var932 = var943
				var931.value = t.FeedEntry.decode(var942)
			else
				local _ = nil
				local var944, var945 = protoModule.readVarInt(p28, var932)
				var932 = var945 + var944
			end
		elseif var933 == protoModule.wireTypes.i32 then
			local _ = nil
			local var946, var947 = protoModule.readFixed32(p28, var932)
			local _ = var946
			var932 = var947
		elseif var933 == protoModule.wireTypes.i64 then
			local _ = nil
			local var948, var949 = protoModule.readFixed64(p28, var932)
			local _ = var948
			var932 = var949
		else
			error("Unsupported wire type: " .. var933)
		end
	end
	return var931
end

function t_15:jsonEncode() --[[ line: 7750 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode() --[[ line: 7766 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var951 = t_15.new()
	
	if self.key ~= nil then
		var951.key = self.key
	end
	if self.value ~= nil then
		var951.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var951
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p29) --[[ line: 7797 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p29 == nil or p29.key == nil then "" else p29.key,
		value = if p29 == nil or p29.value == nil then nil else p29.value
	}, t_16)
end

function t_16:encode() --[[ line: 7809 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var953 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var954, var955 = protoModule.writeTag(buff, var953, 1, protoModule.wireTypes.lengthDelimited)
		var954, var955 = protoModule.writeString(var954, var955, self.key)
		buff = var954
		var953 = var955
	end
	if self.value ~= nil then
		local var956 = self.value:encode()
		local var957, var958 = protoModule.writeTag(buff, var953, 2, protoModule.wireTypes.lengthDelimited)
		var957, var958 = protoModule.writeBuffer(var957, var958, var956, buffer.len(var956))
		buff = var957
		var953 = var958
	end
	local buff_1 = buffer.create(var953)
	buffer.copy(buff_1, 0, buff, 0, var953)
	
	return buff_1
end

function t_16.decode(p30) --[[ line: 7831 ]]
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var960 = t_16.new()
	local var961 = 0
	while var961 < buffer.len(p30) do
		local _ = nil
		local var962 = nil
		local var963, var964, var965 = protoModule.readTag(p30, var961)
		local var966 = var963
		var962 = var964
		var961 = var965
		
		if var962 == protoModule.wireTypes.varint then
			local _ = nil
			local var967, var968 = protoModule.readVarInt(p30, var961)
			local _ = var967
			var961 = var968
			continue
		end
		if var962 == protoModule.wireTypes.lengthDelimited then
			if var966 == 1 then
				local _ = nil
				local var969, var970 = protoModule.readBuffer(p30, var961)
				var961 = var970
				var960.key = buffer.tostring(var969)
			elseif var966 == 2 then
				local _ = nil
				local var971, var972 = protoModule.readBuffer(p30, var961)
				var961 = var972
				var960.value = t.EntryOrder.decode(var971)
			else
				local _ = nil
				local var973, var974 = protoModule.readVarInt(p30, var961)
				var961 = var974 + var973
			end
		elseif var962 == protoModule.wireTypes.i32 then
			local _ = nil
			local var975, var976 = protoModule.readFixed32(p30, var961)
			local _ = var975
			var961 = var976
		elseif var962 == protoModule.wireTypes.i64 then
			local _ = nil
			local var977, var978 = protoModule.readFixed64(p30, var961)
			local _ = var977
			var961 = var978
		else
			error("Unsupported wire type: " .. var962)
		end
	end
	return var960
end

function t_16:jsonEncode() --[[ line: 7881 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode() --[[ line: 7897 ]]
	-- upvalues: t_16 (ref), t (ref)
	local var980 = t_16.new()
	
	if self.key ~= nil then
		var980.key = self.key
	end
	if self.value ~= nil then
		var980.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var980
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p31) --[[ line: 7928 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p31 == nil or p31.items == nil then {} else p31.items
	}, t_17)
end

function t_17:encode() --[[ line: 7934 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var982 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var983, var984 = protoModule.writeTag(buff, var982, 1, protoModule.wireTypes.lengthDelimited)
			var983, var984 = protoModule.writeString(var983, var984, v)
			buff = var983
			var982 = var984
		end
	end
	local buff_1 = buffer.create(var982)
	buffer.copy(buff_1, 0, buff, 0, var982)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 7950 ]]
	-- upvalues: t_17 (ref), protoModule (ref)
	local var986 = t_17.new()
	local var987 = 0
	while var987 < buffer.len(p32) do
		local _ = nil
		local var988 = nil
		local var989, var990, var991 = protoModule.readTag(p32, var987)
		local var992 = var989
		var988 = var990
		var987 = var991
		
		if var988 == protoModule.wireTypes.varint then
			local _ = nil
			local var993, var994 = protoModule.readVarInt(p32, var987)
			local _ = var993
			var987 = var994
			continue
		end
		if var988 == protoModule.wireTypes.lengthDelimited then
			if var992 == 1 then
				local _ = nil
				local var995, var996 = protoModule.readBuffer(p32, var987)
				var987 = var996
				table.insert(var986.items, buffer.tostring(var995))
			else
				local _ = nil
				local var997, var998 = protoModule.readVarInt(p32, var987)
				var987 = var998 + var997
			end
		elseif var988 == protoModule.wireTypes.i32 then
			local _ = nil
			local var999, var1000 = protoModule.readFixed32(p32, var987)
			local _ = var999
			var987 = var1000
		elseif var988 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1001, var1002 = protoModule.readFixed64(p32, var987)
			local _ = var1001
			var987 = var1002
		else
			error("Unsupported wire type: " .. var988)
		end
	end
	return var986
end

function t_17:jsonEncode() --[[ line: 7993 ]]
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

function t_17:jsonDecode() --[[ line: 8007 ]]
	-- upvalues: t_17 (ref)
	local var1005 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var1005.items = t
	end
	return var1005
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p33) --[[ line: 8036 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p33 == nil or p33.universe_id == nil then "" else p33.universe_id,
		user_owns_experience = if p33 == nil or p33.user_owns_experience == nil then false else p33.user_owns_experience
	}, t_18)
end

function t_18:encode() --[[ line: 8047 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1008 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1009, var1010 = protoModule.writeTag(buff, var1008, 1, protoModule.wireTypes.lengthDelimited)
		var1009, var1010 = protoModule.writeString(var1009, var1010, self.universe_id)
		buff = var1009
		var1008 = var1010
	end
	if self.user_owns_experience then
		local var1011, var1012 = protoModule.writeTag(buff, var1008, 2, protoModule.wireTypes.varint)
		var1011, var1012 = protoModule.writeVarInt(var1011, var1012, if self.user_owns_experience then 1 else 0)
		buff = var1011
		var1008 = var1012
	end
	local buff_1 = buffer.create(var1008)
	buffer.copy(buff_1, 0, buff, 0, var1008)
	
	return buff_1
end

function t_18.decode(p34) --[[ line: 8066 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var1014 = t_18.new()
	local var1015 = 0
	while var1015 < buffer.len(p34) do
		local _ = nil
		local var1016 = nil
		local var1017, var1018, var1019 = protoModule.readTag(p34, var1015)
		local var1020 = var1017
		var1016 = var1018
		var1015 = var1019
		
		if var1016 == protoModule.wireTypes.varint then
			if var1020 == 2 then
				local _ = nil
				local var1021, var1022 = protoModule.readVarInt(p34, var1015)
				var1015 = var1022
				var1014.user_owns_experience = var1021 ~= 0
			else
				local _ = nil
				local var1023, var1024 = protoModule.readVarInt(p34, var1015)
				local _ = var1023
				var1015 = var1024
			end
		end
		if var1016 == protoModule.wireTypes.lengthDelimited then
			if var1020 == 1 then
				local _ = nil
				local var1025, var1026 = protoModule.readBuffer(p34, var1015)
				var1015 = var1026
				var1014.universe_id = buffer.tostring(var1025)
			else
				local _ = nil
				local var1027, var1028 = protoModule.readVarInt(p34, var1015)
				var1015 = var1028 + var1027
			end
		elseif var1016 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1029, var1030 = protoModule.readFixed32(p34, var1015)
			local _ = var1029
			var1015 = var1030
		elseif var1016 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1031, var1032 = protoModule.readFixed64(p34, var1015)
			local _ = var1031
			var1015 = var1032
		else
			error("Unsupported wire type: " .. var1016)
		end
	end
	return var1014
end

function t_18:jsonEncode() --[[ line: 8114 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_18:jsonDecode() --[[ line: 8128 ]]
	-- upvalues: t_18 (ref)
	local var1034 = t_18.new()
	
	if self.universe_id ~= nil then
		var1034.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1034.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1034.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1034.user_owns_experience = self.userOwnsExperience
	end
	return var1034
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p35) --[[ line: 8166 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p35 == nil or p35.media_asset_id == nil then "" else p35.media_asset_id
	}, t_19)
end

function t_19:encode() --[[ line: 8174 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1036 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1037, var1038 = protoModule.writeTag(buff, var1036, 1, protoModule.wireTypes.lengthDelimited)
		var1037, var1038 = protoModule.writeString(var1037, var1038, self.media_asset_id)
		buff = var1037
		var1036 = var1038
	end
	local buff_1 = buffer.create(var1036)
	buffer.copy(buff_1, 0, buff, 0, var1036)
	
	return buff_1
end

function t_19.decode(p36) --[[ line: 8188 ]]
	-- upvalues: t_19 (ref), protoModule (ref)
	local var1040 = t_19.new()
	local var1041 = 0
	while var1041 < buffer.len(p36) do
		local _ = nil
		local var1042 = nil
		local var1043, var1044, var1045 = protoModule.readTag(p36, var1041)
		local var1046 = var1043
		var1042 = var1044
		var1041 = var1045
		
		if var1042 == protoModule.wireTypes.varint then
			local _ = nil
			local var1047, var1048 = protoModule.readVarInt(p36, var1041)
			local _ = var1047
			var1041 = var1048
			continue
		end
		if var1042 == protoModule.wireTypes.lengthDelimited then
			if var1046 == 1 then
				local _ = nil
				local var1049, var1050 = protoModule.readBuffer(p36, var1041)
				var1041 = var1050
				var1040.media_asset_id = buffer.tostring(var1049)
			else
				local _ = nil
				local var1051, var1052 = protoModule.readVarInt(p36, var1041)
				var1041 = var1052 + var1051
			end
		elseif var1042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1053, var1054 = protoModule.readFixed32(p36, var1041)
			local _ = var1053
			var1041 = var1054
		elseif var1042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1055, var1056 = protoModule.readFixed64(p36, var1041)
			local _ = var1055
			var1041 = var1056
		else
			error("Unsupported wire type: " .. var1042)
		end
	end
	return var1040
end

function t_19:jsonEncode() --[[ line: 8231 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_19:jsonDecode() --[[ line: 8241 ]]
	-- upvalues: t_19 (ref)
	local var1058 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var1058.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1058.media_asset_id = self.mediaAssetId
	end
	return var1058
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p37) --[[ line: 8271 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p37 == nil or p37.universe_id == nil then "" else p37.universe_id
	}, t_20)
end

function t_20:encode() --[[ line: 8279 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1060 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1061, var1062 = protoModule.writeTag(buff, var1060, 1, protoModule.wireTypes.lengthDelimited)
		var1061, var1062 = protoModule.writeString(var1061, var1062, self.universe_id)
		buff = var1061
		var1060 = var1062
	end
	local buff_1 = buffer.create(var1060)
	buffer.copy(buff_1, 0, buff, 0, var1060)
	
	return buff_1
end

function t_20.decode(p38) --[[ line: 8293 ]]
	-- upvalues: t_20 (ref), protoModule (ref)
	local var1064 = t_20.new()
	local var1065 = 0
	while var1065 < buffer.len(p38) do
		local _ = nil
		local var1066 = nil
		local var1067, var1068, var1069 = protoModule.readTag(p38, var1065)
		local var1070 = var1067
		var1066 = var1068
		var1065 = var1069
		
		if var1066 == protoModule.wireTypes.varint then
			local _ = nil
			local var1071, var1072 = protoModule.readVarInt(p38, var1065)
			local _ = var1071
			var1065 = var1072
			continue
		end
		if var1066 == protoModule.wireTypes.lengthDelimited then
			if var1070 == 1 then
				local _ = nil
				local var1073, var1074 = protoModule.readBuffer(p38, var1065)
				var1065 = var1074
				var1064.universe_id = buffer.tostring(var1073)
			else
				local _ = nil
				local var1075, var1076 = protoModule.readVarInt(p38, var1065)
				var1065 = var1076 + var1075
			end
		elseif var1066 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1077, var1078 = protoModule.readFixed32(p38, var1065)
			local _ = var1077
			var1065 = var1078
		elseif var1066 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1079, var1080 = protoModule.readFixed64(p38, var1065)
			local _ = var1079
			var1065 = var1080
		else
			error("Unsupported wire type: " .. var1066)
		end
	end
	return var1064
end

function t_20:jsonEncode() --[[ line: 8336 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_20:jsonDecode() --[[ line: 8346 ]]
	-- upvalues: t_20 (ref)
	local var1082 = t_20.new()
	
	if self.universe_id ~= nil then
		var1082.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1082.universe_id = self.universeId
	end
	return var1082
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p39) --[[ line: 8376 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p39 == nil or p39.universe_id == nil then "" else p39.universe_id,
		creator_key = if p39 == nil or p39.creator_key == nil then "" else p39.creator_key
	}, t_21)
end

function t_21:encode() --[[ line: 8385 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1084 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1085, var1086 = protoModule.writeTag(buff, var1084, 1, protoModule.wireTypes.lengthDelimited)
		var1085, var1086 = protoModule.writeString(var1085, var1086, self.universe_id)
		buff = var1085
		var1084 = var1086
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1087, var1088 = protoModule.writeTag(buff, var1084, 2, protoModule.wireTypes.lengthDelimited)
		var1087, var1088 = protoModule.writeString(var1087, var1088, self.creator_key)
		buff = var1087
		var1084 = var1088
	end
	local buff_1 = buffer.create(var1084)
	buffer.copy(buff_1, 0, buff, 0, var1084)
	
	return buff_1
end

function t_21.decode(p40) --[[ line: 8404 ]]
	-- upvalues: t_21 (ref), protoModule (ref)
	local var1090 = t_21.new()
	local var1091 = 0
	while var1091 < buffer.len(p40) do
		local _ = nil
		local var1092 = nil
		local var1093, var1094, var1095 = protoModule.readTag(p40, var1091)
		local var1096 = var1093
		var1092 = var1094
		var1091 = var1095
		
		if var1092 == protoModule.wireTypes.varint then
			local _ = nil
			local var1097, var1098 = protoModule.readVarInt(p40, var1091)
			local _ = var1097
			var1091 = var1098
			continue
		end
		if var1092 == protoModule.wireTypes.lengthDelimited then
			if var1096 == 1 then
				local _ = nil
				local var1099, var1100 = protoModule.readBuffer(p40, var1091)
				var1091 = var1100
				var1090.universe_id = buffer.tostring(var1099)
			elseif var1096 == 2 then
				local _ = nil
				local var1101, var1102 = protoModule.readBuffer(p40, var1091)
				var1091 = var1102
				var1090.creator_key = buffer.tostring(var1101)
			else
				local _ = nil
				local var1103, var1104 = protoModule.readVarInt(p40, var1091)
				var1091 = var1104 + var1103
			end
		elseif var1092 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1105, var1106 = protoModule.readFixed32(p40, var1091)
			local _ = var1105
			var1091 = var1106
		elseif var1092 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1107, var1108 = protoModule.readFixed64(p40, var1091)
			local _ = var1107
			var1091 = var1108
		else
			error("Unsupported wire type: " .. var1092)
		end
	end
	return var1090
end

function t_21:jsonEncode() --[[ line: 8452 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_21:jsonDecode() --[[ line: 8466 ]]
	-- upvalues: t_21 (ref)
	local var1110 = t_21.new()
	
	if self.universe_id ~= nil then
		var1110.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1110.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1110.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1110.creator_key = self.creatorKey
	end
	return var1110
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p41) --[[ line: 8504 ]]
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

function t_22:encode() --[[ line: 8526 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1112 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1113, var1114 = protoModule.writeTag(buff, var1112, 1, protoModule.wireTypes.lengthDelimited)
		var1113, var1114 = protoModule.writeString(var1113, var1114, self.universe_id)
		buff = var1113
		var1112 = var1114
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var1115, var1116 = protoModule.writeTag(buff, var1112, 2, protoModule.wireTypes.lengthDelimited)
		var1115, var1116 = protoModule.writeString(var1115, var1116, self.root_place_id)
		buff = var1115
		var1112 = var1116
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var1117, var1118 = protoModule.writeTag(buff, var1112, 3, protoModule.wireTypes.lengthDelimited)
		var1117, var1118 = protoModule.writeString(var1117, var1118, self.connection_played_display_name)
		buff = var1117
		var1112 = var1118
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1119, var1120 = protoModule.writeTag(buff, var1112, 4, protoModule.wireTypes.lengthDelimited)
		var1119, var1120 = protoModule.writeString(var1119, var1120, self.upsell_prompt)
		buff = var1119
		var1112 = var1120
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var1121 = v:encode()
			local var1122, var1123 = protoModule.writeTag(buff, var1112, 5, protoModule.wireTypes.lengthDelimited)
			var1122, var1123 = protoModule.writeBuffer(var1122, var1123, var1121, buffer.len(var1121))
			buff = var1122
			var1112 = var1123
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var1124, var1125 = protoModule.writeTag(buff, var1112, 6, protoModule.wireTypes.varint)
		var1124, var1125 = protoModule.writeVarInt(var1124, var1125, self.connection_played_num_others)
		buff = var1124
		var1112 = var1125
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var1126, var1127 = protoModule.writeTag(buff, var1112, 7, protoModule.wireTypes.varint)
		var1126, var1127 = protoModule.writeVarInt(var1126, var1127, self.connection_played_total_count)
		buff = var1126
		var1112 = var1127
	end
	local buff_1 = buffer.create(var1112)
	buffer.copy(buff_1, 0, buff, 0, var1112)
	
	return buff_1
end

function t_22.decode(p42) --[[ line: 8573 ]]
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var1129 = t_22.new()
	local var1130 = 0
	while var1130 < buffer.len(p42) do
		local _ = nil
		local var1131 = nil
		local var1132, var1133, var1134 = protoModule.readTag(p42, var1130)
		local var1135 = var1132
		var1131 = var1133
		var1130 = var1134
		
		if var1131 == protoModule.wireTypes.varint then
			if var1135 == 6 then
				local _ = nil
				local var1136, var1137 = protoModule.readVarIntI32(p42, var1130)
				var1130 = var1137
				var1129.connection_played_num_others = var1136
			elseif var1135 == 7 then
				local _ = nil
				local var1138, var1139 = protoModule.readVarIntI32(p42, var1130)
				var1130 = var1139
				var1129.connection_played_total_count = var1138
			else
				local _ = nil
				local var1140, var1141 = protoModule.readVarInt(p42, var1130)
				local _ = var1140
				var1130 = var1141
			end
		end
		if var1131 == protoModule.wireTypes.lengthDelimited then
			if var1135 == 1 then
				local _ = nil
				local var1142, var1143 = protoModule.readBuffer(p42, var1130)
				var1130 = var1143
				var1129.universe_id = buffer.tostring(var1142)
			elseif var1135 == 2 then
				local _ = nil
				local var1144, var1145 = protoModule.readBuffer(p42, var1130)
				var1130 = var1145
				var1129.root_place_id = buffer.tostring(var1144)
			elseif var1135 == 3 then
				local _ = nil
				local var1146, var1147 = protoModule.readBuffer(p42, var1130)
				var1130 = var1147
				var1129.connection_played_display_name = buffer.tostring(var1146)
			elseif var1135 == 4 then
				local _ = nil
				local var1148, var1149 = protoModule.readBuffer(p42, var1130)
				var1130 = var1149
				var1129.upsell_prompt = buffer.tostring(var1148)
			elseif var1135 == 5 then
				local _ = nil
				local var1150, var1151 = protoModule.readBuffer(p42, var1130)
				var1130 = var1151
				table.insert(var1129.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var1150))
			else
				local _ = nil
				local var1152, var1153 = protoModule.readVarInt(p42, var1130)
				var1130 = var1153 + var1152
			end
		elseif var1131 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1154, var1155 = protoModule.readFixed32(p42, var1130)
			local _ = var1154
			var1130 = var1155
		elseif var1131 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1156, var1157 = protoModule.readFixed64(p42, var1130)
			local _ = var1156
			var1130 = var1157
		else
			error("Unsupported wire type: " .. var1131)
		end
	end
	return var1129
end

function t_22:jsonEncode() --[[ line: 8649 ]]
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

function t_22:jsonDecode() --[[ line: 8687 ]]
	-- upvalues: t_22 (ref), t (ref)
	local var1160 = t_22.new()
	
	if self.universe_id ~= nil then
		var1160.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1160.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var1160.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var1160.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var1160.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var1160.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var1160.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1160.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1160.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1160.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var1160.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var1160.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var1160.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var1160.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var1160
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p43) --[[ line: 8774 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p43 == nil or p43.user_id == nil then "" else p43.user_id
	}, t_23)
end

function t_23:encode() --[[ line: 8785 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1164 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1165, var1166 = protoModule.writeTag(buff, var1164, 1, protoModule.wireTypes.lengthDelimited)
		var1165, var1166 = protoModule.writeString(var1165, var1166, self.user_id)
		buff = var1165
		var1164 = var1166
	end
	local buff_1 = buffer.create(var1164)
	buffer.copy(buff_1, 0, buff, 0, var1164)
	
	return buff_1
end

function t_23.decode(p44) --[[ line: 8801 ]]
	-- upvalues: t_23 (ref), protoModule (ref)
	local var1168 = t_23.new()
	local var1169 = 0
	while var1169 < buffer.len(p44) do
		local _ = nil
		local var1170 = nil
		local var1171, var1172, var1173 = protoModule.readTag(p44, var1169)
		local var1174 = var1171
		var1170 = var1172
		var1169 = var1173
		
		if var1170 == protoModule.wireTypes.varint then
			local _ = nil
			local var1175, var1176 = protoModule.readVarInt(p44, var1169)
			local _ = var1175
			var1169 = var1176
			continue
		end
		if var1170 == protoModule.wireTypes.lengthDelimited then
			if var1174 == 1 then
				local _ = nil
				local var1177, var1178 = protoModule.readBuffer(p44, var1169)
				var1169 = var1178
				var1168.user_id = buffer.tostring(var1177)
			else
				local _ = nil
				local var1179, var1180 = protoModule.readVarInt(p44, var1169)
				var1169 = var1180 + var1179
			end
		elseif var1170 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1181, var1182 = protoModule.readFixed32(p44, var1169)
			local _ = var1181
			var1169 = var1182
		elseif var1170 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1183, var1184 = protoModule.readFixed64(p44, var1169)
			local _ = var1183
			var1169 = var1184
		else
			error("Unsupported wire type: " .. var1170)
		end
	end
	return var1168
end

function t_23:jsonEncode() --[[ line: 8846 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_23:jsonDecode() --[[ line: 8858 ]]
	-- upvalues: t_23 (ref)
	local var1186 = t_23.new()
	
	if self.user_id ~= nil then
		var1186.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1186.user_id = self.userId
	end
	return var1186
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p45) --[[ line: 8889 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p45 == nil or p45.media_items == nil then {} else p45.media_items,
		universe_id = if p45 == nil or p45.universe_id == nil then "" else p45.universe_id,
		place_id = if p45 == nil or p45.place_id == nil then "" else p45.place_id
	}, t_24)
end

function t_24:encode() --[[ line: 8899 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1188 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var1189 = v:encode()
			local var1190, var1191 = protoModule.writeTag(buff, var1188, 1, protoModule.wireTypes.lengthDelimited)
			var1190, var1191 = protoModule.writeBuffer(var1190, var1191, var1189, buffer.len(var1189))
			buff = var1190
			var1188 = var1191
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1192, var1193 = protoModule.writeTag(buff, var1188, 2, protoModule.wireTypes.lengthDelimited)
		var1192, var1193 = protoModule.writeString(var1192, var1193, self.universe_id)
		buff = var1192
		var1188 = var1193
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1194, var1195 = protoModule.writeTag(buff, var1188, 3, protoModule.wireTypes.lengthDelimited)
		var1194, var1195 = protoModule.writeString(var1194, var1195, self.place_id)
		buff = var1194
		var1188 = var1195
	end
	local buff_1 = buffer.create(var1188)
	buffer.copy(buff_1, 0, buff, 0, var1188)
	
	return buff_1
end

function t_24.decode(p46) --[[ line: 8926 ]]
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var1197 = t_24.new()
	local var1198 = 0
	while var1198 < buffer.len(p46) do
		local _ = nil
		local var1199 = nil
		local var1200, var1201, var1202 = protoModule.readTag(p46, var1198)
		local var1203 = var1200
		var1199 = var1201
		var1198 = var1202
		
		if var1199 == protoModule.wireTypes.varint then
			local _ = nil
			local var1204, var1205 = protoModule.readVarInt(p46, var1198)
			local _ = var1204
			var1198 = var1205
			continue
		end
		if var1199 == protoModule.wireTypes.lengthDelimited then
			if var1203 == 1 then
				local _ = nil
				local var1206, var1207 = protoModule.readBuffer(p46, var1198)
				var1198 = var1207
				table.insert(var1197.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var1206))
			elseif var1203 == 2 then
				local _ = nil
				local var1208, var1209 = protoModule.readBuffer(p46, var1198)
				var1198 = var1209
				var1197.universe_id = buffer.tostring(var1208)
			elseif var1203 == 3 then
				local _ = nil
				local var1210, var1211 = protoModule.readBuffer(p46, var1198)
				var1198 = var1211
				var1197.place_id = buffer.tostring(var1210)
			else
				local _ = nil
				local var1212, var1213 = protoModule.readVarInt(p46, var1198)
				var1198 = var1213 + var1212
			end
		elseif var1199 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1214, var1215 = protoModule.readFixed32(p46, var1198)
			local _ = var1214
			var1198 = var1215
		elseif var1199 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1216, var1217 = protoModule.readFixed64(p46, var1198)
			local _ = var1216
			var1198 = var1217
		else
			error("Unsupported wire type: " .. var1199)
		end
	end
	return var1197
end

function t_24:jsonEncode() --[[ line: 8979 ]]
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

function t_24:jsonDecode() --[[ line: 9001 ]]
	-- upvalues: t_24 (ref), t (ref)
	local var1220 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1220.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1220.media_items = t_1
	end
	if self.universe_id ~= nil then
		var1220.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1220.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1220.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1220.place_id = self.placeId
	end
	return var1220
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p47) --[[ line: 9055 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p47 == nil or p47.media_asset_id == nil then "" else p47.media_asset_id
	}, t_25)
end

function t_25:encode() --[[ line: 9063 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1224 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1225, var1226 = protoModule.writeTag(buff, var1224, 1, protoModule.wireTypes.lengthDelimited)
		var1225, var1226 = protoModule.writeString(var1225, var1226, self.media_asset_id)
		buff = var1225
		var1224 = var1226
	end
	local buff_1 = buffer.create(var1224)
	buffer.copy(buff_1, 0, buff, 0, var1224)
	
	return buff_1
end

function t_25.decode(p48) --[[ line: 9079 ]]
	-- upvalues: t_25 (ref), protoModule (ref)
	local var1228 = t_25.new()
	local var1229 = 0
	while var1229 < buffer.len(p48) do
		local _ = nil
		local var1230 = nil
		local var1231, var1232, var1233 = protoModule.readTag(p48, var1229)
		local var1234 = var1231
		var1230 = var1232
		var1229 = var1233
		
		if var1230 == protoModule.wireTypes.varint then
			local _ = nil
			local var1235, var1236 = protoModule.readVarInt(p48, var1229)
			local _ = var1235
			var1229 = var1236
			continue
		end
		if var1230 == protoModule.wireTypes.lengthDelimited then
			if var1234 == 1 then
				local _ = nil
				local var1237, var1238 = protoModule.readBuffer(p48, var1229)
				var1229 = var1238
				var1228.media_asset_id = buffer.tostring(var1237)
			else
				local _ = nil
				local var1239, var1240 = protoModule.readVarInt(p48, var1229)
				var1229 = var1240 + var1239
			end
		elseif var1230 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1241, var1242 = protoModule.readFixed32(p48, var1229)
			local _ = var1241
			var1229 = var1242
		elseif var1230 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1243, var1244 = protoModule.readFixed64(p48, var1229)
			local _ = var1243
			var1229 = var1244
		else
			error("Unsupported wire type: " .. var1230)
		end
	end
	return var1228
end

function t_25:jsonEncode() --[[ line: 9124 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_25:jsonDecode() --[[ line: 9136 ]]
	-- upvalues: t_25 (ref)
	local var1246 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var1246.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1246.media_asset_id = self.mediaAssetId
	end
	return var1246
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p49) --[[ line: 9166 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		universe_id = if p49 == nil or p49.universe_id == nil then "" else p49.universe_id
	}, t_26)
end

function t_26:encode() --[[ line: 9174 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1248 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1249, var1250 = protoModule.writeTag(buff, var1248, 1, protoModule.wireTypes.lengthDelimited)
		var1249, var1250 = protoModule.writeString(var1249, var1250, self.universe_id)
		buff = var1249
		var1248 = var1250
	end
	local buff_1 = buffer.create(var1248)
	buffer.copy(buff_1, 0, buff, 0, var1248)
	
	return buff_1
end

function t_26.decode(p50) --[[ line: 9188 ]]
	-- upvalues: t_26 (ref), protoModule (ref)
	local var1252 = t_26.new()
	local var1253 = 0
	while var1253 < buffer.len(p50) do
		local _ = nil
		local var1254 = nil
		local var1255, var1256, var1257 = protoModule.readTag(p50, var1253)
		local var1258 = var1255
		var1254 = var1256
		var1253 = var1257
		
		if var1254 == protoModule.wireTypes.varint then
			local _ = nil
			local var1259, var1260 = protoModule.readVarInt(p50, var1253)
			local _ = var1259
			var1253 = var1260
			continue
		end
		if var1254 == protoModule.wireTypes.lengthDelimited then
			if var1258 == 1 then
				local _ = nil
				local var1261, var1262 = protoModule.readBuffer(p50, var1253)
				var1253 = var1262
				var1252.universe_id = buffer.tostring(var1261)
			else
				local _ = nil
				local var1263, var1264 = protoModule.readVarInt(p50, var1253)
				var1253 = var1264 + var1263
			end
		elseif var1254 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1265, var1266 = protoModule.readFixed32(p50, var1253)
			local _ = var1265
			var1253 = var1266
		elseif var1254 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1267, var1268 = protoModule.readFixed64(p50, var1253)
			local _ = var1267
			var1253 = var1268
		else
			error("Unsupported wire type: " .. var1254)
		end
	end
	return var1252
end

function t_26:jsonEncode() --[[ line: 9231 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_26:jsonDecode() --[[ line: 9241 ]]
	-- upvalues: t_26 (ref)
	local var1270 = t_26.new()
	
	if self.universe_id ~= nil then
		var1270.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1270.universe_id = self.universeId
	end
	return var1270
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p51) --[[ line: 9269 ]]
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p51 == nil or p51.universe_id == nil then "" else p51.universe_id
	}, t_27)
end

function t_27:encode() --[[ line: 9277 ]]
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

function t_27.decode(p52) --[[ line: 9291 ]]
	-- upvalues: t_27 (ref), protoModule (ref)
	local var1276 = t_27.new()
	local var1277 = 0
	while var1277 < buffer.len(p52) do
		local _ = nil
		local var1278 = nil
		local var1279, var1280, var1281 = protoModule.readTag(p52, var1277)
		local var1282 = var1279
		var1278 = var1280
		var1277 = var1281
		
		if var1278 == protoModule.wireTypes.varint then
			local _ = nil
			local var1283, var1284 = protoModule.readVarInt(p52, var1277)
			local _ = var1283
			var1277 = var1284
			continue
		end
		if var1278 == protoModule.wireTypes.lengthDelimited then
			if var1282 == 1 then
				local _ = nil
				local var1285, var1286 = protoModule.readBuffer(p52, var1277)
				var1277 = var1286
				var1276.universe_id = buffer.tostring(var1285)
			else
				local _ = nil
				local var1287, var1288 = protoModule.readVarInt(p52, var1277)
				var1277 = var1288 + var1287
			end
		elseif var1278 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1289, var1290 = protoModule.readFixed32(p52, var1277)
			local _ = var1289
			var1277 = var1290
		elseif var1278 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1291, var1292 = protoModule.readFixed64(p52, var1277)
			local _ = var1291
			var1277 = var1292
		else
			error("Unsupported wire type: " .. var1278)
		end
	end
	return var1276
end

function t_27:jsonEncode() --[[ line: 9334 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_27:jsonDecode() --[[ line: 9344 ]]
	-- upvalues: t_27 (ref)
	local var1294 = t_27.new()
	
	if self.universe_id ~= nil then
		var1294.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1294.universe_id = self.universeId
	end
	return var1294
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p53) --[[ line: 9372 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p53 == nil or p53.universe_id == nil then "" else p53.universe_id,
		has_store_items = if p53 == nil or p53.has_store_items == nil then false else p53.has_store_items,
		has_badges = if p53 == nil or p53.has_badges == nil then false else p53.has_badges,
		has_game_passes = if p53 == nil or p53.has_game_passes == nil then false else p53.has_game_passes
	}, t_28)
end

function t_28:encode() --[[ line: 9383 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1296 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1297, var1298 = protoModule.writeTag(buff, var1296, 1, protoModule.wireTypes.lengthDelimited)
		var1297, var1298 = protoModule.writeString(var1297, var1298, self.universe_id)
		buff = var1297
		var1296 = var1298
	end
	if self.has_store_items then
		local var1299, var1300 = protoModule.writeTag(buff, var1296, 2, protoModule.wireTypes.varint)
		var1299, var1300 = protoModule.writeVarInt(var1299, var1300, if self.has_store_items then 1 else 0)
		buff = var1299
		var1296 = var1300
	end
	if self.has_badges then
		local var1301, var1302 = protoModule.writeTag(buff, var1296, 3, protoModule.wireTypes.varint)
		var1301, var1302 = protoModule.writeVarInt(var1301, var1302, if self.has_badges then 1 else 0)
		buff = var1301
		var1296 = var1302
	end
	if self.has_game_passes then
		local var1303, var1304 = protoModule.writeTag(buff, var1296, 4, protoModule.wireTypes.varint)
		var1303, var1304 = protoModule.writeVarInt(var1303, var1304, if self.has_game_passes then 1 else 0)
		buff = var1303
		var1296 = var1304
	end
	local buff_1 = buffer.create(var1296)
	buffer.copy(buff_1, 0, buff, 0, var1296)
	
	return buff_1
end

function t_28.decode(p54) --[[ line: 9412 ]]
	-- upvalues: t_28 (ref), protoModule (ref)
	local var1306 = t_28.new()
	local var1307 = 0
	while var1307 < buffer.len(p54) do
		local _ = nil
		local var1308 = nil
		local var1309, var1310, var1311 = protoModule.readTag(p54, var1307)
		local var1312 = var1309
		var1308 = var1310
		var1307 = var1311
		
		if var1308 == protoModule.wireTypes.varint then
			if var1312 == 2 then
				local _ = nil
				local var1313, var1314 = protoModule.readVarInt(p54, var1307)
				var1307 = var1314
				var1306.has_store_items = var1313 ~= 0
			elseif var1312 == 3 then
				local _ = nil
				local var1315, var1316 = protoModule.readVarInt(p54, var1307)
				var1307 = var1316
				var1306.has_badges = var1315 ~= 0
			elseif var1312 == 4 then
				local _ = nil
				local var1317, var1318 = protoModule.readVarInt(p54, var1307)
				var1307 = var1318
				var1306.has_game_passes = var1317 ~= 0
			else
				local _ = nil
				local var1319, var1320 = protoModule.readVarInt(p54, var1307)
				local _ = var1319
				var1307 = var1320
			end
		end
		if var1308 == protoModule.wireTypes.lengthDelimited then
			if var1312 == 1 then
				local _ = nil
				local var1321, var1322 = protoModule.readBuffer(p54, var1307)
				var1307 = var1322
				var1306.universe_id = buffer.tostring(var1321)
			else
				local _ = nil
				local var1323, var1324 = protoModule.readVarInt(p54, var1307)
				var1307 = var1324 + var1323
			end
		elseif var1308 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1325, var1326 = protoModule.readFixed32(p54, var1307)
			local _ = var1325
			var1307 = var1326
		elseif var1308 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1327, var1328 = protoModule.readFixed64(p54, var1307)
			local _ = var1327
			var1307 = var1328
		else
			error("Unsupported wire type: " .. var1308)
		end
	end
	return var1306
end

function t_28:jsonEncode() --[[ line: 9470 ]]
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

function t_28:jsonDecode() --[[ line: 9492 ]]
	-- upvalues: t_28 (ref)
	local var1330 = t_28.new()
	
	if self.universe_id ~= nil then
		var1330.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1330.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var1330.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var1330.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var1330.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var1330.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var1330.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var1330.has_game_passes = self.hasGamePasses
	end
	return var1330
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p55) --[[ line: 9544 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p55 == nil or p55.universe_id == nil then "" else p55.universe_id
	}, t_29)
end

function t_29:encode() --[[ line: 9552 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1332 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1333, var1334 = protoModule.writeTag(buff, var1332, 1, protoModule.wireTypes.lengthDelimited)
		var1333, var1334 = protoModule.writeString(var1333, var1334, self.universe_id)
		buff = var1333
		var1332 = var1334
	end
	local buff_1 = buffer.create(var1332)
	buffer.copy(buff_1, 0, buff, 0, var1332)
	
	return buff_1
end

function t_29.decode(p56) --[[ line: 9566 ]]
	-- upvalues: t_29 (ref), protoModule (ref)
	local var1336 = t_29.new()
	local var1337 = 0
	while var1337 < buffer.len(p56) do
		local _ = nil
		local var1338 = nil
		local var1339, var1340, var1341 = protoModule.readTag(p56, var1337)
		local var1342 = var1339
		var1338 = var1340
		var1337 = var1341
		
		if var1338 == protoModule.wireTypes.varint then
			local _ = nil
			local var1343, var1344 = protoModule.readVarInt(p56, var1337)
			local _ = var1343
			var1337 = var1344
			continue
		end
		if var1338 == protoModule.wireTypes.lengthDelimited then
			if var1342 == 1 then
				local _ = nil
				local var1345, var1346 = protoModule.readBuffer(p56, var1337)
				var1337 = var1346
				var1336.universe_id = buffer.tostring(var1345)
			else
				local _ = nil
				local var1347, var1348 = protoModule.readVarInt(p56, var1337)
				var1337 = var1348 + var1347
			end
		elseif var1338 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1349, var1350 = protoModule.readFixed32(p56, var1337)
			local _ = var1349
			var1337 = var1350
		elseif var1338 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1351, var1352 = protoModule.readFixed64(p56, var1337)
			local _ = var1351
			var1337 = var1352
		else
			error("Unsupported wire type: " .. var1338)
		end
	end
	return var1336
end

function t_29:jsonEncode() --[[ line: 9609 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_29:jsonDecode() --[[ line: 9619 ]]
	-- upvalues: t_29 (ref)
	local var1354 = t_29.new()
	
	if self.universe_id ~= nil then
		var1354.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1354.universe_id = self.universeId
	end
	return var1354
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p57) --[[ line: 9649 ]]
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p57 == nil or p57.universe_id == nil then "" else p57.universe_id,
		user_owns_experience = if p57 == nil or p57.user_owns_experience == nil then false else p57.user_owns_experience
	}, t_30)
end

function t_30:encode() --[[ line: 9660 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1356 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1357, var1358 = protoModule.writeTag(buff, var1356, 1, protoModule.wireTypes.lengthDelimited)
		var1357, var1358 = protoModule.writeString(var1357, var1358, self.universe_id)
		buff = var1357
		var1356 = var1358
	end
	if self.user_owns_experience then
		local var1359, var1360 = protoModule.writeTag(buff, var1356, 2, protoModule.wireTypes.varint)
		var1359, var1360 = protoModule.writeVarInt(var1359, var1360, if self.user_owns_experience then 1 else 0)
		buff = var1359
		var1356 = var1360
	end
	local buff_1 = buffer.create(var1356)
	buffer.copy(buff_1, 0, buff, 0, var1356)
	
	return buff_1
end

function t_30.decode(p58) --[[ line: 9679 ]]
	-- upvalues: t_30 (ref), protoModule (ref)
	local var1362 = t_30.new()
	local var1363 = 0
	while var1363 < buffer.len(p58) do
		local _ = nil
		local var1364 = nil
		local var1365, var1366, var1367 = protoModule.readTag(p58, var1363)
		local var1368 = var1365
		var1364 = var1366
		var1363 = var1367
		
		if var1364 == protoModule.wireTypes.varint then
			if var1368 == 2 then
				local _ = nil
				local var1369, var1370 = protoModule.readVarInt(p58, var1363)
				var1363 = var1370
				var1362.user_owns_experience = var1369 ~= 0
			else
				local _ = nil
				local var1371, var1372 = protoModule.readVarInt(p58, var1363)
				local _ = var1371
				var1363 = var1372
			end
		end
		if var1364 == protoModule.wireTypes.lengthDelimited then
			if var1368 == 1 then
				local _ = nil
				local var1373, var1374 = protoModule.readBuffer(p58, var1363)
				var1363 = var1374
				var1362.universe_id = buffer.tostring(var1373)
			else
				local _ = nil
				local var1375, var1376 = protoModule.readVarInt(p58, var1363)
				var1363 = var1376 + var1375
			end
		elseif var1364 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1377, var1378 = protoModule.readFixed32(p58, var1363)
			local _ = var1377
			var1363 = var1378
		elseif var1364 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1379, var1380 = protoModule.readFixed64(p58, var1363)
			local _ = var1379
			var1363 = var1380
		else
			error("Unsupported wire type: " .. var1364)
		end
	end
	return var1362
end

function t_30:jsonEncode() --[[ line: 9727 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_30:jsonDecode() --[[ line: 9741 ]]
	-- upvalues: t_30 (ref)
	local var1382 = t_30.new()
	
	if self.universe_id ~= nil then
		var1382.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1382.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1382.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1382.user_owns_experience = self.userOwnsExperience
	end
	return var1382
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p59) --[[ line: 9777 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p59 == nil or p59.universe_id == nil then "" else p59.universe_id,
		place_id = if p59 == nil or p59.place_id == nil then "" else p59.place_id
	}, t_31)
end

function t_31:encode() --[[ line: 9786 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1384 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1385, var1386 = protoModule.writeTag(buff, var1384, 1, protoModule.wireTypes.lengthDelimited)
		var1385, var1386 = protoModule.writeString(var1385, var1386, self.universe_id)
		buff = var1385
		var1384 = var1386
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1387, var1388 = protoModule.writeTag(buff, var1384, 2, protoModule.wireTypes.lengthDelimited)
		var1387, var1388 = protoModule.writeString(var1387, var1388, self.place_id)
		buff = var1387
		var1384 = var1388
	end
	local buff_1 = buffer.create(var1384)
	buffer.copy(buff_1, 0, buff, 0, var1384)
	
	return buff_1
end

function t_31.decode(p60) --[[ line: 9805 ]]
	-- upvalues: t_31 (ref), protoModule (ref)
	local var1390 = t_31.new()
	local var1391 = 0
	while var1391 < buffer.len(p60) do
		local _ = nil
		local var1392 = nil
		local var1393, var1394, var1395 = protoModule.readTag(p60, var1391)
		local var1396 = var1393
		var1392 = var1394
		var1391 = var1395
		
		if var1392 == protoModule.wireTypes.varint then
			local _ = nil
			local var1397, var1398 = protoModule.readVarInt(p60, var1391)
			local _ = var1397
			var1391 = var1398
			continue
		end
		if var1392 == protoModule.wireTypes.lengthDelimited then
			if var1396 == 1 then
				local _ = nil
				local var1399, var1400 = protoModule.readBuffer(p60, var1391)
				var1391 = var1400
				var1390.universe_id = buffer.tostring(var1399)
			elseif var1396 == 2 then
				local _ = nil
				local var1401, var1402 = protoModule.readBuffer(p60, var1391)
				var1391 = var1402
				var1390.place_id = buffer.tostring(var1401)
			else
				local _ = nil
				local var1403, var1404 = protoModule.readVarInt(p60, var1391)
				var1391 = var1404 + var1403
			end
		elseif var1392 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1405, var1406 = protoModule.readFixed32(p60, var1391)
			local _ = var1405
			var1391 = var1406
		elseif var1392 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1407, var1408 = protoModule.readFixed64(p60, var1391)
			local _ = var1407
			var1391 = var1408
		else
			error("Unsupported wire type: " .. var1392)
		end
	end
	return var1390
end

function t_31:jsonEncode() --[[ line: 9853 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_31:jsonDecode() --[[ line: 9867 ]]
	-- upvalues: t_31 (ref)
	local var1410 = t_31.new()
	
	if self.universe_id ~= nil then
		var1410.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1410.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1410.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1410.place_id = self.placeId
	end
	return var1410
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p61) --[[ line: 9905 ]]
	-- upvalues: t_32 (ref)
	return setmetatable({
		community_id = if p61 == nil or p61.community_id == nil then "" else p61.community_id
	}, t_32)
end

function t_32:encode() --[[ line: 9913 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1412 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var1413, var1414 = protoModule.writeTag(buff, var1412, 1, protoModule.wireTypes.lengthDelimited)
		var1413, var1414 = protoModule.writeString(var1413, var1414, self.community_id)
		buff = var1413
		var1412 = var1414
	end
	local buff_1 = buffer.create(var1412)
	buffer.copy(buff_1, 0, buff, 0, var1412)
	
	return buff_1
end

function t_32.decode(p62) --[[ line: 9927 ]]
	-- upvalues: t_32 (ref), protoModule (ref)
	local var1416 = t_32.new()
	local var1417 = 0
	while var1417 < buffer.len(p62) do
		local _ = nil
		local var1418 = nil
		local var1419, var1420, var1421 = protoModule.readTag(p62, var1417)
		local var1422 = var1419
		var1418 = var1420
		var1417 = var1421
		
		if var1418 == protoModule.wireTypes.varint then
			local _ = nil
			local var1423, var1424 = protoModule.readVarInt(p62, var1417)
			local _ = var1423
			var1417 = var1424
			continue
		end
		if var1418 == protoModule.wireTypes.lengthDelimited then
			if var1422 == 1 then
				local _ = nil
				local var1425, var1426 = protoModule.readBuffer(p62, var1417)
				var1417 = var1426
				var1416.community_id = buffer.tostring(var1425)
			else
				local _ = nil
				local var1427, var1428 = protoModule.readVarInt(p62, var1417)
				var1417 = var1428 + var1427
			end
		elseif var1418 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1429, var1430 = protoModule.readFixed32(p62, var1417)
			local _ = var1429
			var1417 = var1430
		elseif var1418 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1431, var1432 = protoModule.readFixed64(p62, var1417)
			local _ = var1431
			var1417 = var1432
		else
			error("Unsupported wire type: " .. var1418)
		end
	end
	return var1416
end

function t_32:jsonEncode() --[[ line: 9970 ]]
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_32:jsonDecode() --[[ line: 9980 ]]
	-- upvalues: t_32 (ref)
	local var1434 = t_32.new()
	
	if self.community_id ~= nil then
		var1434.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var1434.community_id = self.communityId
	end
	return var1434
end

t_32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_32
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p63) --[[ line: 10008 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_items = if p63 == nil or p63.social_link_items == nil then {} else p63.social_link_items
	}, t_33)
end

function t_33:encode() --[[ line: 10014 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1436 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var1437 = v:encode()
			local var1438, var1439 = protoModule.writeTag(buff, var1436, 1, protoModule.wireTypes.lengthDelimited)
			var1438, var1439 = protoModule.writeBuffer(var1438, var1439, var1437, buffer.len(var1437))
			buff = var1438
			var1436 = var1439
		end
	end
	local buff_1 = buffer.create(var1436)
	buffer.copy(buff_1, 0, buff, 0, var1436)
	
	return buff_1
end

function t_33.decode(p64) --[[ line: 10031 ]]
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1441 = t_33.new()
	local var1442 = 0
	while var1442 < buffer.len(p64) do
		local _ = nil
		local var1443 = nil
		local var1444, var1445, var1446 = protoModule.readTag(p64, var1442)
		local var1447 = var1444
		var1443 = var1445
		var1442 = var1446
		
		if var1443 == protoModule.wireTypes.varint then
			local _ = nil
			local var1448, var1449 = protoModule.readVarInt(p64, var1442)
			local _ = var1448
			var1442 = var1449
			continue
		end
		if var1443 == protoModule.wireTypes.lengthDelimited then
			if var1447 == 1 then
				local _ = nil
				local var1450, var1451 = protoModule.readBuffer(p64, var1442)
				var1442 = var1451
				table.insert(var1441.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var1450))
			else
				local _ = nil
				local var1452, var1453 = protoModule.readVarInt(p64, var1442)
				var1442 = var1453 + var1452
			end
		elseif var1443 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1454, var1455 = protoModule.readFixed32(p64, var1442)
			local _ = var1454
			var1442 = var1455
		elseif var1443 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1456, var1457 = protoModule.readFixed64(p64, var1442)
			local _ = var1456
			var1442 = var1457
		else
			error("Unsupported wire type: " .. var1443)
		end
	end
	return var1441
end

function t_33:jsonEncode() --[[ line: 10074 ]]
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

function t_33:jsonDecode() --[[ line: 10088 ]]
	-- upvalues: t_33 (ref), t (ref)
	local var1460 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1460.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1460.social_link_items = t_1
	end
	return var1460
end

t_33.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p65) --[[ line: 10126 ]]
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_id = if p65 == nil or p65.social_link_id == nil then "" else p65.social_link_id
	}, t_34)
end

function t_34:encode() --[[ line: 10134 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1464 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var1465, var1466 = protoModule.writeTag(buff, var1464, 1, protoModule.wireTypes.lengthDelimited)
		var1465, var1466 = protoModule.writeString(var1465, var1466, self.social_link_id)
		buff = var1465
		var1464 = var1466
	end
	local buff_1 = buffer.create(var1464)
	buffer.copy(buff_1, 0, buff, 0, var1464)
	
	return buff_1
end

function t_34.decode(p66) --[[ line: 10148 ]]
	-- upvalues: t_34 (ref), protoModule (ref)
	local var1468 = t_34.new()
	local var1469 = 0
	while var1469 < buffer.len(p66) do
		local _ = nil
		local var1470 = nil
		local var1471, var1472, var1473 = protoModule.readTag(p66, var1469)
		local var1474 = var1471
		var1470 = var1472
		var1469 = var1473
		
		if var1470 == protoModule.wireTypes.varint then
			local _ = nil
			local var1475, var1476 = protoModule.readVarInt(p66, var1469)
			local _ = var1475
			var1469 = var1476
			continue
		end
		if var1470 == protoModule.wireTypes.lengthDelimited then
			if var1474 == 1 then
				local _ = nil
				local var1477, var1478 = protoModule.readBuffer(p66, var1469)
				var1469 = var1478
				var1468.social_link_id = buffer.tostring(var1477)
			else
				local _ = nil
				local var1479, var1480 = protoModule.readVarInt(p66, var1469)
				var1469 = var1480 + var1479
			end
		elseif var1470 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1481, var1482 = protoModule.readFixed32(p66, var1469)
			local _ = var1481
			var1469 = var1482
		elseif var1470 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1483, var1484 = protoModule.readFixed64(p66, var1469)
			local _ = var1483
			var1469 = var1484
		else
			error("Unsupported wire type: " .. var1470)
		end
	end
	return var1468
end

function t_34:jsonEncode() --[[ line: 10191 ]]
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_34:jsonDecode() --[[ line: 10201 ]]
	-- upvalues: t_34 (ref)
	local var1486 = t_34.new()
	
	if self.social_link_id ~= nil then
		var1486.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1486.social_link_id = self.socialLinkId
	end
	return var1486
end

t_34.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p67) --[[ line: 10231 ]]
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
		has_emphasized_tile = if p67 == nil or p67.has_emphasized_tile == nil then false else p67.has_emphasized_tile
	}, t_35)
end

function t_35:encode() --[[ line: 10254 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1488 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1489, var1490 = protoModule.writeTag(buff, var1488, 1, protoModule.wireTypes.lengthDelimited)
		var1489, var1490 = protoModule.writeString(var1489, var1490, self.title)
		buff = var1489
		var1488 = var1490
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var1491 = v:encode()
			local var1492, var1493 = protoModule.writeTag(buff, var1488, 2, protoModule.wireTypes.lengthDelimited)
			var1492, var1493 = protoModule.writeBuffer(var1492, var1493, var1491, buffer.len(var1491))
			buff = var1492
			var1488 = var1493
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1494, var1495 = protoModule.writeTag(buff, var1488, 3, protoModule.wireTypes.lengthDelimited)
		var1494, var1495 = protoModule.writeString(var1494, var1495, self.next_page_token)
		buff = var1494
		var1488 = var1495
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1496, var1497 = protoModule.writeTag(buff, var1488, 4, protoModule.wireTypes.lengthDelimited)
		var1496, var1497 = protoModule.writeString(var1496, var1497, self.sort_id)
		buff = var1496
		var1488 = var1497
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1498, var1499 = protoModule.writeTag(buff, var1488, 5, protoModule.wireTypes.varint)
		var1498, var1499 = protoModule.writeVarInt(var1498, var1499, self.secondary_sort_id)
		buff = var1498
		var1488 = var1499
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var1500, var1501 = protoModule.writeTag(buff, var1488, 6, protoModule.wireTypes.varint)
		var1500, var1501 = protoModule.writeVarInt(var1500, var1501, self.max_visible_rows)
		buff = var1500
		var1488 = var1501
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1502, var1503 = protoModule.writeTag(buff, var1488, 7, protoModule.wireTypes.lengthDelimited)
		var1502, var1503 = protoModule.writeString(var1502, var1503, self.subtitle)
		buff = var1502
		var1488 = var1503
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1504, var1505 = protoModule.writeTag(buff, var1488, 8, protoModule.wireTypes.lengthDelimited)
		var1504, var1505 = protoModule.writeString(var1504, var1505, self.info_text)
		buff = var1504
		var1488 = var1505
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1506, var1507 = protoModule.writeTag(buff, var1488, 9, protoModule.wireTypes.lengthDelimited)
		var1506, var1507 = protoModule.writeString(var1506, var1507, self.subtitle_link_path)
		buff = var1506
		var1488 = var1507
	end
	if self.is_placeholder ~= nil then
		local var1508, var1509 = protoModule.writeTag(buff, var1488, 10, protoModule.wireTypes.varint)
		var1508, var1509 = protoModule.writeVarInt(var1508, var1509, if self.is_placeholder then 1 else 0)
		buff = var1508
		var1488 = var1509
	end
	if self.primary_sort_id ~= nil then
		local var1510, var1511 = protoModule.writeTag(buff, var1488, 11, protoModule.wireTypes.varint)
		var1510, var1511 = protoModule.writeVarInt(var1510, var1511, self.primary_sort_id)
		buff = var1510
		var1488 = var1511
	end
	if self.applied_filters ~= nil then
		local var1512, var1513 = protoModule.writeTag(buff, var1488, 12, protoModule.wireTypes.lengthDelimited)
		var1512, var1513 = protoModule.writeString(var1512, var1513, self.applied_filters)
		buff = var1512
		var1488 = var1513
	end
	if self.pool_id ~= nil then
		local var1514, var1515 = protoModule.writeTag(buff, var1488, 13, protoModule.wireTypes.lengthDelimited)
		var1514, var1515 = protoModule.writeString(var1514, var1515, self.pool_id)
		buff = var1514
		var1488 = var1515
	end
	if self.has_emphasized_tile then
		local var1516, var1517 = protoModule.writeTag(buff, var1488, 14, protoModule.wireTypes.varint)
		var1516, var1517 = protoModule.writeVarInt(var1516, var1517, if self.has_emphasized_tile then 1 else 0)
		buff = var1516
		var1488 = var1517
	end
	local buff_1 = buffer.create(var1488)
	buffer.copy(buff_1, 0, buff, 0, var1488)
	
	return buff_1
end

function t_35.decode(p68) --[[ line: 10336 ]]
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var1519 = t_35.new()
	local var1520 = 0
	while var1520 < buffer.len(p68) do
		local _ = nil
		local var1521 = nil
		local var1522, var1523, var1524 = protoModule.readTag(p68, var1520)
		local var1525 = var1522
		var1521 = var1523
		var1520 = var1524
		
		if var1521 == protoModule.wireTypes.varint then
			if var1525 == 5 then
				local _ = nil
				local var1526, var1527 = protoModule.readVarIntI32(p68, var1520)
				var1520 = var1527
				var1519.secondary_sort_id = var1526
			elseif var1525 == 6 then
				local _ = nil
				local var1528, var1529 = protoModule.readVarIntI32(p68, var1520)
				var1520 = var1529
				var1519.max_visible_rows = var1528
			elseif var1525 == 10 then
				local _ = nil
				local var1530, var1531 = protoModule.readVarInt(p68, var1520)
				var1520 = var1531
				var1519.is_placeholder = var1530 ~= 0
			elseif var1525 == 11 then
				local _ = nil
				local var1532, var1533 = protoModule.readVarIntI32(p68, var1520)
				var1520 = var1533
				var1519.primary_sort_id = var1532
			elseif var1525 == 14 then
				local _ = nil
				local var1534, var1535 = protoModule.readVarInt(p68, var1520)
				var1520 = var1535
				var1519.has_emphasized_tile = var1534 ~= 0
			else
				local _ = nil
				local var1536, var1537 = protoModule.readVarInt(p68, var1520)
				local _ = var1536
				var1520 = var1537
			end
		end
		if var1521 == protoModule.wireTypes.lengthDelimited then
			if var1525 == 1 then
				local _ = nil
				local var1538, var1539 = protoModule.readBuffer(p68, var1520)
				var1520 = var1539
				var1519.title = buffer.tostring(var1538)
			elseif var1525 == 2 then
				local _ = nil
				local var1540, var1541 = protoModule.readBuffer(p68, var1520)
				var1520 = var1541
				table.insert(var1519.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var1540))
			elseif var1525 == 3 then
				local _ = nil
				local var1542, var1543 = protoModule.readBuffer(p68, var1520)
				var1520 = var1543
				var1519.next_page_token = buffer.tostring(var1542)
			elseif var1525 == 4 then
				local _ = nil
				local var1544, var1545 = protoModule.readBuffer(p68, var1520)
				var1520 = var1545
				var1519.sort_id = buffer.tostring(var1544)
			elseif var1525 == 7 then
				local _ = nil
				local var1546, var1547 = protoModule.readBuffer(p68, var1520)
				var1520 = var1547
				var1519.subtitle = buffer.tostring(var1546)
			elseif var1525 == 8 then
				local _ = nil
				local var1548, var1549 = protoModule.readBuffer(p68, var1520)
				var1520 = var1549
				var1519.info_text = buffer.tostring(var1548)
			elseif var1525 == 9 then
				local _ = nil
				local var1550, var1551 = protoModule.readBuffer(p68, var1520)
				var1520 = var1551
				var1519.subtitle_link_path = buffer.tostring(var1550)
			elseif var1525 == 12 then
				local _ = nil
				local var1552, var1553 = protoModule.readBuffer(p68, var1520)
				var1520 = var1553
				var1519.applied_filters = buffer.tostring(var1552)
			elseif var1525 == 13 then
				local _ = nil
				local var1554, var1555 = protoModule.readBuffer(p68, var1520)
				var1520 = var1555
				var1519.pool_id = buffer.tostring(var1554)
			else
				local _ = nil
				local var1556, var1557 = protoModule.readVarInt(p68, var1520)
				var1520 = var1557 + var1556
			end
		elseif var1521 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1558, var1559 = protoModule.readFixed32(p68, var1520)
			local _ = var1558
			var1520 = var1559
		elseif var1521 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1560, var1561 = protoModule.readFixed64(p68, var1520)
			local _ = var1560
			var1520 = var1561
		else
			error("Unsupported wire type: " .. var1521)
		end
	end
	return var1519
end

function t_35:jsonEncode() --[[ line: 10444 ]]
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
	return t
end

function t_35:jsonDecode() --[[ line: 10510 ]]
	-- upvalues: t_35 (ref), t (ref)
	local var1564 = t_35.new()
	
	if self.title ~= nil then
		var1564.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1564.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1564.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1564.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1564.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1564.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1564.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1564.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1564.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1564.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1564.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1564.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1564.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1564.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1564.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1564.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1564.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1564.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1564.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1564.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1564.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1564.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1564.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1564.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1564.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1564.has_emphasized_tile = self.hasEmphasizedTile
	end
	return var1564
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p69) --[[ line: 10644 ]]
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

function t_36:encode() --[[ line: 10664 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1568 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1569, var1570 = protoModule.writeTag(buff, var1568, 1, protoModule.wireTypes.lengthDelimited)
		var1569, var1570 = protoModule.writeString(var1569, var1570, self.universe_id)
		buff = var1569
		var1568 = var1570
	end
	if self.is_sponsored then
		local var1571, var1572 = protoModule.writeTag(buff, var1568, 2, protoModule.wireTypes.varint)
		var1571, var1572 = protoModule.writeVarInt(var1571, var1572, if self.is_sponsored then 1 else 0)
		buff = var1571
		var1568 = var1572
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1573, var1574 = protoModule.writeTag(buff, var1568, 3, protoModule.wireTypes.lengthDelimited)
		var1573, var1574 = protoModule.writeString(var1573, var1574, self.roblox_component)
		buff = var1573
		var1568 = var1574
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1575, var1576 = protoModule.writeTag(buff, var1568, 4, protoModule.wireTypes.lengthDelimited)
		var1575, var1576 = protoModule.writeString(var1575, var1576, self.native_ad_data)
		buff = var1575
		var1568 = var1576
	end
	if self.is_content_locked then
		local var1577, var1578 = protoModule.writeTag(buff, var1568, 5, protoModule.wireTypes.varint)
		var1577, var1578 = protoModule.writeVarInt(var1577, var1578, if self.is_content_locked then 1 else 0)
		buff = var1577
		var1568 = var1578
	end
	if self.title ~= nil and self.title ~= "" then
		local var1579, var1580 = protoModule.writeTag(buff, var1568, 6, protoModule.wireTypes.lengthDelimited)
		var1579, var1580 = protoModule.writeString(var1579, var1580, self.title)
		buff = var1579
		var1568 = var1580
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1581, var1582 = protoModule.writeTag(buff, var1568, 7, protoModule.wireTypes.lengthDelimited)
		var1581, var1582 = protoModule.writeString(var1581, var1582, self.subtitle)
		buff = var1581
		var1568 = var1582
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1583, var1584 = protoModule.writeTag(buff, var1568, 8, protoModule.wireTypes.lengthDelimited)
		var1583, var1584 = protoModule.writeString(var1583, var1584, self.image_asset_id)
		buff = var1583
		var1568 = var1584
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1585, var1586 = protoModule.writeTag(buff, var1568, 9, protoModule.wireTypes.lengthDelimited)
		var1585, var1586 = protoModule.writeString(var1585, var1586, self.video_asset_id)
		buff = var1585
		var1568 = var1586
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1587, var1588 = protoModule.writeTag(buff, var1568, 10, protoModule.wireTypes.lengthDelimited)
		var1587, var1588 = protoModule.writeString(var1587, var1588, self.badge_text)
		buff = var1587
		var1568 = var1588
	end
	if self.player_count ~= nil then
		local var1589, var1590 = protoModule.writeTag(buff, var1568, 11, protoModule.wireTypes.varint)
		var1589, var1590 = protoModule.writeVarInt(var1589, var1590, self.player_count)
		buff = var1589
		var1568 = var1590
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1591, var1592 = protoModule.writeTag(buff, var1568, 12, protoModule.wireTypes.lengthDelimited)
		var1591, var1592 = protoModule.writeString(var1591, var1592, self.creator_key)
		buff = var1591
		var1568 = var1592
	end
	if self.rank ~= nil then
		local var1593, var1594 = protoModule.writeTag(buff, var1568, 13, protoModule.wireTypes.varint)
		var1593, var1594 = protoModule.writeVarInt(var1593, var1594, self.rank)
		buff = var1593
		var1568 = var1594
	end
	local buff_1 = buffer.create(var1568)
	buffer.copy(buff_1, 0, buff, 0, var1568)
	
	return buff_1
end

function t_36.decode(p70) --[[ line: 10740 ]]
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1596 = t_36.new()
	local var1597 = 0
	while var1597 < buffer.len(p70) do
		local _ = nil
		local var1598 = nil
		local var1599, var1600, var1601 = protoModule.readTag(p70, var1597)
		local var1602 = var1599
		var1598 = var1600
		var1597 = var1601
		
		if var1598 == protoModule.wireTypes.varint then
			if var1602 == 2 then
				local _ = nil
				local var1603, var1604 = protoModule.readVarInt(p70, var1597)
				var1597 = var1604
				var1596.is_sponsored = var1603 ~= 0
			elseif var1602 == 5 then
				local _ = nil
				local var1605, var1606 = protoModule.readVarInt(p70, var1597)
				var1597 = var1606
				var1596.is_content_locked = var1605 ~= 0
			elseif var1602 == 11 then
				local _ = nil
				local var1607, var1608 = protoModule.readVarIntI64(p70, var1597)
				var1597 = var1608
				var1596.player_count = var1607
			elseif var1602 == 13 then
				local _ = nil
				local var1609, var1610 = protoModule.readVarIntI32(p70, var1597)
				var1597 = var1610
				var1596.rank = var1609
			else
				local _ = nil
				local var1611, var1612 = protoModule.readVarInt(p70, var1597)
				local _ = var1611
				var1597 = var1612
			end
		end
		if var1598 == protoModule.wireTypes.lengthDelimited then
			if var1602 == 1 then
				local _ = nil
				local var1613, var1614 = protoModule.readBuffer(p70, var1597)
				var1597 = var1614
				var1596.universe_id = buffer.tostring(var1613)
			elseif var1602 == 3 then
				local _ = nil
				local var1615, var1616 = protoModule.readBuffer(p70, var1597)
				var1597 = var1616
				var1596.roblox_component = buffer.tostring(var1615)
			elseif var1602 == 4 then
				local _ = nil
				local var1617, var1618 = protoModule.readBuffer(p70, var1597)
				var1597 = var1618
				var1596.native_ad_data = buffer.tostring(var1617)
			elseif var1602 == 6 then
				local _ = nil
				local var1619, var1620 = protoModule.readBuffer(p70, var1597)
				var1597 = var1620
				var1596.title = buffer.tostring(var1619)
			elseif var1602 == 7 then
				local _ = nil
				local var1621, var1622 = protoModule.readBuffer(p70, var1597)
				var1597 = var1622
				var1596.subtitle = buffer.tostring(var1621)
			elseif var1602 == 8 then
				local _ = nil
				local var1623, var1624 = protoModule.readBuffer(p70, var1597)
				var1597 = var1624
				var1596.image_asset_id = buffer.tostring(var1623)
			elseif var1602 == 9 then
				local _ = nil
				local var1625, var1626 = protoModule.readBuffer(p70, var1597)
				var1597 = var1626
				var1596.video_asset_id = buffer.tostring(var1625)
			elseif var1602 == 10 then
				local _ = nil
				local var1627, var1628 = protoModule.readBuffer(p70, var1597)
				var1597 = var1628
				var1596.badge_text = buffer.tostring(var1627)
			elseif var1602 == 12 then
				local _ = nil
				local var1629, var1630 = protoModule.readBuffer(p70, var1597)
				var1597 = var1630
				var1596.creator_key = buffer.tostring(var1629)
			else
				local _ = nil
				local var1631, var1632 = protoModule.readVarInt(p70, var1597)
				var1597 = var1632 + var1631
			end
		elseif var1598 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1633, var1634 = protoModule.readFixed32(p70, var1597)
			local _ = var1633
			var1597 = var1634
		elseif var1598 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1635, var1636 = protoModule.readFixed64(p70, var1597)
			local _ = var1635
			var1597 = var1636
		else
			error("Unsupported wire type: " .. var1598)
		end
	end
	return var1596
end

function t_36:jsonEncode() --[[ line: 10845 ]]
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

function t_36:jsonDecode() --[[ line: 10905 ]]
	-- upvalues: t_36 (ref)
	local var1638 = t_36.new()
	
	if self.universe_id ~= nil then
		var1638.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1638.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1638.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1638.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1638.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1638.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1638.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1638.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1638.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1638.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1638.title = self.title
	end
	if self.subtitle ~= nil then
		var1638.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1638.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1638.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1638.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1638.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1638.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1638.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1638.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1638.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1638.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1638.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1638.rank = self.rank
	end
	return var1638
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p71) --[[ line: 11019 ]]
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

function t_37:encode() --[[ line: 11035 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1640 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1641, var1642 = protoModule.writeTag(buff, var1640, 1, protoModule.wireTypes.lengthDelimited)
		var1641, var1642 = protoModule.writeString(var1641, var1642, self.title)
		buff = var1641
		var1640 = var1642
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1643 = v:encode()
			local var1644, var1645 = protoModule.writeTag(buff, var1640, 2, protoModule.wireTypes.lengthDelimited)
			var1644, var1645 = protoModule.writeBuffer(var1644, var1645, var1643, buffer.len(var1643))
			buff = var1644
			var1640 = var1645
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1646, var1647 = protoModule.writeTag(buff, var1640, 3, protoModule.wireTypes.lengthDelimited)
		var1646, var1647 = protoModule.writeString(var1646, var1647, self.next_page_token)
		buff = var1646
		var1640 = var1647
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1648, var1649 = protoModule.writeTag(buff, var1640, 4, protoModule.wireTypes.lengthDelimited)
		var1648, var1649 = protoModule.writeString(var1648, var1649, self.sort_id)
		buff = var1648
		var1640 = var1649
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1650, var1651 = protoModule.writeTag(buff, var1640, 5, protoModule.wireTypes.varint)
		var1650, var1651 = protoModule.writeVarInt(var1650, var1651, self.secondary_sort_id)
		buff = var1650
		var1640 = var1651
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1652, var1653 = protoModule.writeTag(buff, var1640, 6, protoModule.wireTypes.lengthDelimited)
		var1652, var1653 = protoModule.writeString(var1652, var1653, self.subtitle)
		buff = var1652
		var1640 = var1653
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1654, var1655 = protoModule.writeTag(buff, var1640, 7, protoModule.wireTypes.lengthDelimited)
		var1654, var1655 = protoModule.writeString(var1654, var1655, self.info_text)
		buff = var1654
		var1640 = var1655
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1656, var1657 = protoModule.writeTag(buff, var1640, 8, protoModule.wireTypes.lengthDelimited)
		var1656, var1657 = protoModule.writeString(var1656, var1657, self.subtitle_link_path)
		buff = var1656
		var1640 = var1657
	end
	if self.is_placeholder ~= nil then
		local var1658, var1659 = protoModule.writeTag(buff, var1640, 9, protoModule.wireTypes.varint)
		var1658, var1659 = protoModule.writeVarInt(var1658, var1659, if self.is_placeholder then 1 else 0)
		buff = var1658
		var1640 = var1659
	end
	if self.primary_sort_id ~= nil then
		local var1660, var1661 = protoModule.writeTag(buff, var1640, 10, protoModule.wireTypes.varint)
		var1660, var1661 = protoModule.writeVarInt(var1660, var1661, self.primary_sort_id)
		buff = var1660
		var1640 = var1661
	end
	if self.applied_filters ~= nil then
		local var1662, var1663 = protoModule.writeTag(buff, var1640, 11, protoModule.wireTypes.lengthDelimited)
		var1662, var1663 = protoModule.writeString(var1662, var1663, self.applied_filters)
		buff = var1662
		var1640 = var1663
	end
	local buff_1 = buffer.create(var1640)
	buffer.copy(buff_1, 0, buff, 0, var1640)
	
	return buff_1
end

function t_37.decode(p72) --[[ line: 11102 ]]
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1665 = t_37.new()
	local var1666 = 0
	while var1666 < buffer.len(p72) do
		local _ = nil
		local var1667 = nil
		local var1668, var1669, var1670 = protoModule.readTag(p72, var1666)
		local var1671 = var1668
		var1667 = var1669
		var1666 = var1670
		
		if var1667 == protoModule.wireTypes.varint then
			if var1671 == 5 then
				local _ = nil
				local var1672, var1673 = protoModule.readVarIntI32(p72, var1666)
				var1666 = var1673
				var1665.secondary_sort_id = var1672
			elseif var1671 == 9 then
				local _ = nil
				local var1674, var1675 = protoModule.readVarInt(p72, var1666)
				var1666 = var1675
				var1665.is_placeholder = var1674 ~= 0
			elseif var1671 == 10 then
				local _ = nil
				local var1676, var1677 = protoModule.readVarIntI32(p72, var1666)
				var1666 = var1677
				var1665.primary_sort_id = var1676
			else
				local _ = nil
				local var1678, var1679 = protoModule.readVarInt(p72, var1666)
				local _ = var1678
				var1666 = var1679
			end
		end
		if var1667 == protoModule.wireTypes.lengthDelimited then
			if var1671 == 1 then
				local _ = nil
				local var1680, var1681 = protoModule.readBuffer(p72, var1666)
				var1666 = var1681
				var1665.title = buffer.tostring(var1680)
			elseif var1671 == 2 then
				local _ = nil
				local var1682, var1683 = protoModule.readBuffer(p72, var1666)
				var1666 = var1683
				table.insert(var1665.song_items, t.SongCarouselInputData_SongItem.decode(var1682))
			elseif var1671 == 3 then
				local _ = nil
				local var1684, var1685 = protoModule.readBuffer(p72, var1666)
				var1666 = var1685
				var1665.next_page_token = buffer.tostring(var1684)
			elseif var1671 == 4 then
				local _ = nil
				local var1686, var1687 = protoModule.readBuffer(p72, var1666)
				var1666 = var1687
				var1665.sort_id = buffer.tostring(var1686)
			elseif var1671 == 6 then
				local _ = nil
				local var1688, var1689 = protoModule.readBuffer(p72, var1666)
				var1666 = var1689
				var1665.subtitle = buffer.tostring(var1688)
			elseif var1671 == 7 then
				local _ = nil
				local var1690, var1691 = protoModule.readBuffer(p72, var1666)
				var1666 = var1691
				var1665.info_text = buffer.tostring(var1690)
			elseif var1671 == 8 then
				local _ = nil
				local var1692, var1693 = protoModule.readBuffer(p72, var1666)
				var1666 = var1693
				var1665.subtitle_link_path = buffer.tostring(var1692)
			elseif var1671 == 11 then
				local _ = nil
				local var1694, var1695 = protoModule.readBuffer(p72, var1666)
				var1666 = var1695
				var1665.applied_filters = buffer.tostring(var1694)
			else
				local _ = nil
				local var1696, var1697 = protoModule.readVarInt(p72, var1666)
				var1666 = var1697 + var1696
			end
		elseif var1667 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1698, var1699 = protoModule.readFixed32(p72, var1666)
			local _ = var1698
			var1666 = var1699
		elseif var1667 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1700, var1701 = protoModule.readFixed64(p72, var1666)
			local _ = var1700
			var1666 = var1701
		else
			error("Unsupported wire type: " .. var1667)
		end
	end
	return var1665
end

function t_37:jsonEncode() --[[ line: 11195 ]]
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

function t_37:jsonDecode() --[[ line: 11249 ]]
	-- upvalues: t_37 (ref), t (ref)
	local var1704 = t_37.new()
	
	if self.title ~= nil then
		var1704.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1704.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1704.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1704.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1704.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1704.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1704.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1704.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1704.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1704.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1704.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1704.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1704.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1704.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1704.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1704.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1704.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1704.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1704.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1704.applied_filters = self.appliedFilters
	end
	return var1704
end

t_37.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_37
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p73) --[[ line: 11359 ]]
	-- upvalues: t_38 (ref)
	return setmetatable({
		song_id = if p73 == nil or p73.song_id == nil then "" else p73.song_id
	}, t_38)
end

function t_38:encode() --[[ line: 11367 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1708 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1709, var1710 = protoModule.writeTag(buff, var1708, 1, protoModule.wireTypes.lengthDelimited)
		var1709, var1710 = protoModule.writeString(var1709, var1710, self.song_id)
		buff = var1709
		var1708 = var1710
	end
	local buff_1 = buffer.create(var1708)
	buffer.copy(buff_1, 0, buff, 0, var1708)
	
	return buff_1
end

function t_38.decode(p74) --[[ line: 11381 ]]
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1712 = t_38.new()
	local var1713 = 0
	while var1713 < buffer.len(p74) do
		local _ = nil
		local var1714 = nil
		local var1715, var1716, var1717 = protoModule.readTag(p74, var1713)
		local var1718 = var1715
		var1714 = var1716
		var1713 = var1717
		
		if var1714 == protoModule.wireTypes.varint then
			local _ = nil
			local var1719, var1720 = protoModule.readVarInt(p74, var1713)
			local _ = var1719
			var1713 = var1720
			continue
		end
		if var1714 == protoModule.wireTypes.lengthDelimited then
			if var1718 == 1 then
				local _ = nil
				local var1721, var1722 = protoModule.readBuffer(p74, var1713)
				var1713 = var1722
				var1712.song_id = buffer.tostring(var1721)
			else
				local _ = nil
				local var1723, var1724 = protoModule.readVarInt(p74, var1713)
				var1713 = var1724 + var1723
			end
		elseif var1714 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1725, var1726 = protoModule.readFixed32(p74, var1713)
			local _ = var1725
			var1713 = var1726
		elseif var1714 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1727, var1728 = protoModule.readFixed64(p74, var1713)
			local _ = var1727
			var1713 = var1728
		else
			error("Unsupported wire type: " .. var1714)
		end
	end
	return var1712
end

function t_38:jsonEncode() --[[ line: 11424 ]]
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_38:jsonDecode() --[[ line: 11434 ]]
	-- upvalues: t_38 (ref)
	local var1730 = t_38.new()
	
	if self.song_id ~= nil then
		var1730.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1730.song_id = self.songId
	end
	return var1730
end

t_38.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_38
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p75) --[[ line: 11462 ]]
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

function t_39:encode() --[[ line: 11473 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1732 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1733, var1734 = protoModule.writeTag(buff, var1732, 1, protoModule.wireTypes.lengthDelimited)
		var1733, var1734 = protoModule.writeString(var1733, var1734, self.title)
		buff = var1733
		var1732 = var1734
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1735 = v:encode()
			local var1736, var1737 = protoModule.writeTag(buff, var1732, 2, protoModule.wireTypes.lengthDelimited)
			var1736, var1737 = protoModule.writeBuffer(var1736, var1737, var1735, buffer.len(var1735))
			buff = var1736
			var1732 = var1737
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1738, var1739 = protoModule.writeTag(buff, var1732, 3, protoModule.wireTypes.lengthDelimited)
		var1738, var1739 = protoModule.writeString(var1738, var1739, self.universe_id)
		buff = var1738
		var1732 = var1739
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1740, var1741 = protoModule.writeTag(buff, var1732, 4, protoModule.wireTypes.lengthDelimited)
		var1740, var1741 = protoModule.writeString(var1740, var1741, self.sort_id)
		buff = var1740
		var1732 = var1741
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1742, var1743 = protoModule.writeTag(buff, var1732, 5, protoModule.wireTypes.lengthDelimited)
		var1742, var1743 = protoModule.writeString(var1742, var1743, self.subtitle)
		buff = var1742
		var1732 = var1743
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1744, var1745 = protoModule.writeTag(buff, var1732, 6, protoModule.wireTypes.lengthDelimited)
		var1744, var1745 = protoModule.writeString(var1744, var1745, self.info_text)
		buff = var1744
		var1732 = var1745
	end
	local buff_1 = buffer.create(var1732)
	buffer.copy(buff_1, 0, buff, 0, var1732)
	
	return buff_1
end

function t_39.decode(p76) --[[ line: 11515 ]]
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1747 = t_39.new()
	local var1748 = 0
	while var1748 < buffer.len(p76) do
		local _ = nil
		local var1749 = nil
		local var1750, var1751, var1752 = protoModule.readTag(p76, var1748)
		local var1753 = var1750
		var1749 = var1751
		var1748 = var1752
		
		if var1749 == protoModule.wireTypes.varint then
			local _ = nil
			local var1754, var1755 = protoModule.readVarInt(p76, var1748)
			local _ = var1754
			var1748 = var1755
			continue
		end
		if var1749 == protoModule.wireTypes.lengthDelimited then
			if var1753 == 1 then
				local _ = nil
				local var1756, var1757 = protoModule.readBuffer(p76, var1748)
				var1748 = var1757
				var1747.title = buffer.tostring(var1756)
			elseif var1753 == 2 then
				local _ = nil
				local var1758, var1759 = protoModule.readBuffer(p76, var1748)
				var1748 = var1759
				table.insert(var1747.event_items, t.EventsCarouselInputData_EventItem.decode(var1758))
			elseif var1753 == 3 then
				local _ = nil
				local var1760, var1761 = protoModule.readBuffer(p76, var1748)
				var1748 = var1761
				var1747.universe_id = buffer.tostring(var1760)
			elseif var1753 == 4 then
				local _ = nil
				local var1762, var1763 = protoModule.readBuffer(p76, var1748)
				var1748 = var1763
				var1747.sort_id = buffer.tostring(var1762)
			elseif var1753 == 5 then
				local _ = nil
				local var1764, var1765 = protoModule.readBuffer(p76, var1748)
				var1748 = var1765
				var1747.subtitle = buffer.tostring(var1764)
			elseif var1753 == 6 then
				local _ = nil
				local var1766, var1767 = protoModule.readBuffer(p76, var1748)
				var1748 = var1767
				var1747.info_text = buffer.tostring(var1766)
			else
				local _ = nil
				local var1768, var1769 = protoModule.readVarInt(p76, var1748)
				var1748 = var1769 + var1768
			end
		elseif var1749 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1770, var1771 = protoModule.readFixed32(p76, var1748)
			local _ = var1770
			var1748 = var1771
		elseif var1749 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1772, var1773 = protoModule.readFixed64(p76, var1748)
			local _ = var1772
			var1748 = var1773
		else
			error("Unsupported wire type: " .. var1749)
		end
	end
	return var1747
end

function t_39:jsonEncode() --[[ line: 11583 ]]
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

function t_39:jsonDecode() --[[ line: 11617 ]]
	-- upvalues: t_39 (ref), t (ref)
	local var1776 = t_39.new()
	
	if self.title ~= nil then
		var1776.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1776.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1776.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1776.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1776.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1776.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1776.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1776.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1776.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1776.info_text = self.infoText
	end
	return var1776
end

t_39.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p77) --[[ line: 11687 ]]
	-- upvalues: t_40 (ref)
	return setmetatable({
		event_id = if p77 == nil or p77.event_id == nil then "" else p77.event_id
	}, t_40)
end

function t_40:encode() --[[ line: 11695 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1780 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1781, var1782 = protoModule.writeTag(buff, var1780, 1, protoModule.wireTypes.lengthDelimited)
		var1781, var1782 = protoModule.writeString(var1781, var1782, self.event_id)
		buff = var1781
		var1780 = var1782
	end
	local buff_1 = buffer.create(var1780)
	buffer.copy(buff_1, 0, buff, 0, var1780)
	
	return buff_1
end

function t_40.decode(p78) --[[ line: 11709 ]]
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1784 = t_40.new()
	local var1785 = 0
	while var1785 < buffer.len(p78) do
		local _ = nil
		local var1786 = nil
		local var1787, var1788, var1789 = protoModule.readTag(p78, var1785)
		local var1790 = var1787
		var1786 = var1788
		var1785 = var1789
		
		if var1786 == protoModule.wireTypes.varint then
			local _ = nil
			local var1791, var1792 = protoModule.readVarInt(p78, var1785)
			local _ = var1791
			var1785 = var1792
			continue
		end
		if var1786 == protoModule.wireTypes.lengthDelimited then
			if var1790 == 1 then
				local _ = nil
				local var1793, var1794 = protoModule.readBuffer(p78, var1785)
				var1785 = var1794
				var1784.event_id = buffer.tostring(var1793)
			else
				local _ = nil
				local var1795, var1796 = protoModule.readVarInt(p78, var1785)
				var1785 = var1796 + var1795
			end
		elseif var1786 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1797, var1798 = protoModule.readFixed32(p78, var1785)
			local _ = var1797
			var1785 = var1798
		elseif var1786 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1799, var1800 = protoModule.readFixed64(p78, var1785)
			local _ = var1799
			var1785 = var1800
		else
			error("Unsupported wire type: " .. var1786)
		end
	end
	return var1784
end

function t_40:jsonEncode() --[[ line: 11752 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_40:jsonDecode() --[[ line: 11762 ]]
	-- upvalues: t_40 (ref)
	local var1802 = t_40.new()
	
	if self.event_id ~= nil then
		var1802.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1802.event_id = self.eventId
	end
	return var1802
end

t_40.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p79) --[[ line: 11792 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		universe_id = if p79 == nil or p79.universe_id == nil then "" else p79.universe_id,
		entry_map = if p79 == nil or p79.entry_map == nil then {} else p79.entry_map,
		entry_order = if p79 == nil or p79.entry_order == nil then {} else p79.entry_order,
		creator_key = if p79 == nil or p79.creator_key == nil then "" else p79.creator_key
	}, t_41)
end

function t_41:encode() --[[ line: 11801 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1804 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1805, var1806 = protoModule.writeTag(buff, var1804, 1, protoModule.wireTypes.lengthDelimited)
		var1805, var1806 = protoModule.writeString(var1805, var1806, self.universe_id)
		buff = var1805
		var1804 = var1806
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1807, var1808 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1807, var1808 = protoModule.writeString(var1807, var1808, i)
			local var1809 = v:encode()
			var1808, var1810 = protoModule.writeTag(var1807, var1808, 2, protoModule.wireTypes.lengthDelimited)
			var1808, var1810 = protoModule.writeBuffer(var1808, var1810, var1809, buffer.len(var1809))
			local var1811 = var1808
			local var1812 = var1810
			local var1813, var1814 = protoModule.writeTag(buff, var1804, 2, protoModule.wireTypes.lengthDelimited)
			var1813, var1814 = protoModule.writeBuffer(var1813, var1814, var1811, var1812)
			buff = var1813
			var1804 = var1814
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1815, var1816 = protoModule.writeTag(buff, var1804, 3, protoModule.wireTypes.lengthDelimited)
			var1815, var1816 = protoModule.writeString(var1815, var1816, v)
			buff = var1815
			var1804 = var1816
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1817, var1818 = protoModule.writeTag(buff, var1804, 4, protoModule.wireTypes.lengthDelimited)
		var1817, var1818 = protoModule.writeString(var1817, var1818, self.creator_key)
		buff = var1817
		var1804 = var1818
	end
	local buff_1 = buffer.create(var1804)
	buffer.copy(buff_1, 0, buff, 0, var1804)
	
	return buff_1
end

function t_41.decode(p80) --[[ line: 11841 ]]
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1820 = t_41.new()
	local var1821 = 0
	while var1821 < buffer.len(p80) do
		local _ = nil
		local var1822 = nil
		local var1823, var1824, var1825 = protoModule.readTag(p80, var1821)
		local var1826 = var1823
		var1822 = var1824
		var1821 = var1825
		
		if var1822 == protoModule.wireTypes.varint then
			local _ = nil
			local var1827, var1828 = protoModule.readVarInt(p80, var1821)
			local _ = var1827
			var1821 = var1828
			continue
		end
		if var1822 == protoModule.wireTypes.lengthDelimited then
			if var1826 == 1 then
				local _ = nil
				local var1829, var1830 = protoModule.readBuffer(p80, var1821)
				var1821 = var1830
				var1820.universe_id = buffer.tostring(var1829)
			elseif var1826 == 2 then
				local _ = nil
				local var1831, var1832 = protoModule.readBuffer(p80, var1821)
				var1821 = var1832
				var1831 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1831)
				var1820.entry_map[var1831.key or ""] = var1831.value or t.FeedEntry.new()
			elseif var1826 == 3 then
				local _ = nil
				local var1833, var1834 = protoModule.readBuffer(p80, var1821)
				var1821 = var1834
				table.insert(var1820.entry_order, buffer.tostring(var1833))
			elseif var1826 == 4 then
				local _ = nil
				local var1835, var1836 = protoModule.readBuffer(p80, var1821)
				var1821 = var1836
				var1820.creator_key = buffer.tostring(var1835)
			else
				local _ = nil
				local var1837, var1838 = protoModule.readVarInt(p80, var1821)
				var1821 = var1838 + var1837
			end
		elseif var1822 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1839, var1840 = protoModule.readFixed32(p80, var1821)
			local _ = var1839
			var1821 = var1840
		elseif var1822 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1841, var1842 = protoModule.readFixed64(p80, var1821)
			local _ = var1841
			var1821 = var1842
		else
			error("Unsupported wire type: " .. var1822)
		end
	end
	return var1820
end

function t_41:jsonEncode() --[[ line: 11906 ]]
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

function t_41:jsonDecode() --[[ line: 11936 ]]
	-- upvalues: t_41 (ref), t (ref)
	local var1846 = t_41.new()
	
	if self.universe_id ~= nil then
		var1846.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1846.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1846.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1846.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1846.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1846.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1846.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1846.creator_key = self.creatorKey
	end
	return var1846
end

t_41.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p81) --[[ line: 12008 ]]
	-- upvalues: t_42 (ref)
	return setmetatable({
		key = if p81 == nil or p81.key == nil then "" else p81.key,
		value = if p81 == nil or p81.value == nil then nil else p81.value
	}, t_42)
end

function t_42:encode() --[[ line: 12017 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1852 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1853, var1854 = protoModule.writeTag(buff, var1852, 1, protoModule.wireTypes.lengthDelimited)
		var1853, var1854 = protoModule.writeString(var1853, var1854, self.key)
		buff = var1853
		var1852 = var1854
	end
	if self.value ~= nil then
		local var1855 = self.value:encode()
		local var1856, var1857 = protoModule.writeTag(buff, var1852, 2, protoModule.wireTypes.lengthDelimited)
		var1856, var1857 = protoModule.writeBuffer(var1856, var1857, var1855, buffer.len(var1855))
		buff = var1856
		var1852 = var1857
	end
	local buff_1 = buffer.create(var1852)
	buffer.copy(buff_1, 0, buff, 0, var1852)
	
	return buff_1
end

function t_42.decode(p82) --[[ line: 12037 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1859 = t_42.new()
	local var1860 = 0
	while var1860 < buffer.len(p82) do
		local _ = nil
		local var1861 = nil
		local var1862, var1863, var1864 = protoModule.readTag(p82, var1860)
		local var1865 = var1862
		var1861 = var1863
		var1860 = var1864
		
		if var1861 == protoModule.wireTypes.varint then
			local _ = nil
			local var1866, var1867 = protoModule.readVarInt(p82, var1860)
			local _ = var1866
			var1860 = var1867
			continue
		end
		if var1861 == protoModule.wireTypes.lengthDelimited then
			if var1865 == 1 then
				local _ = nil
				local var1868, var1869 = protoModule.readBuffer(p82, var1860)
				var1860 = var1869
				var1859.key = buffer.tostring(var1868)
			elseif var1865 == 2 then
				local _ = nil
				local var1870, var1871 = protoModule.readBuffer(p82, var1860)
				var1860 = var1871
				var1859.value = t.FeedEntry.decode(var1870)
			else
				local _ = nil
				local var1872, var1873 = protoModule.readVarInt(p82, var1860)
				var1860 = var1873 + var1872
			end
		elseif var1861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1874, var1875 = protoModule.readFixed32(p82, var1860)
			local _ = var1874
			var1860 = var1875
		elseif var1861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1876, var1877 = protoModule.readFixed64(p82, var1860)
			local _ = var1876
			var1860 = var1877
		else
			error("Unsupported wire type: " .. var1861)
		end
	end
	return var1859
end

function t_42:jsonEncode() --[[ line: 12085 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_42:jsonDecode() --[[ line: 12099 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1879 = t_42.new()
	
	if self.key ~= nil then
		var1879.key = self.key
	end
	if self.value ~= nil then
		var1879.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1879
end

t_42.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p83) --[[ line: 12129 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		game_passes = if p83 == nil or p83.game_passes == nil then {} else p83.game_passes
	}, t_43)
end

function t_43:encode() --[[ line: 12137 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1881 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1882 = v:encode()
			local var1883, var1884 = protoModule.writeTag(buff, var1881, 1, protoModule.wireTypes.lengthDelimited)
			var1883, var1884 = protoModule.writeBuffer(var1883, var1884, var1882, buffer.len(var1882))
			buff = var1883
			var1881 = var1884
		end
	end
	local buff_1 = buffer.create(var1881)
	buffer.copy(buff_1, 0, buff, 0, var1881)
	
	return buff_1
end

function t_43.decode(p84) --[[ line: 12154 ]]
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1886 = t_43.new()
	local var1887 = 0
	while var1887 < buffer.len(p84) do
		local _ = nil
		local var1888 = nil
		local var1889, var1890, var1891 = protoModule.readTag(p84, var1887)
		local var1892 = var1889
		var1888 = var1890
		var1887 = var1891
		
		if var1888 == protoModule.wireTypes.varint then
			local _ = nil
			local var1893, var1894 = protoModule.readVarInt(p84, var1887)
			local _ = var1893
			var1887 = var1894
			continue
		end
		if var1888 == protoModule.wireTypes.lengthDelimited then
			if var1892 == 1 then
				local _ = nil
				local var1895, var1896 = protoModule.readBuffer(p84, var1887)
				var1887 = var1896
				table.insert(var1886.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1895))
			else
				local _ = nil
				local var1897, var1898 = protoModule.readVarInt(p84, var1887)
				var1887 = var1898 + var1897
			end
		elseif var1888 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1899, var1900 = protoModule.readFixed32(p84, var1887)
			local _ = var1899
			var1887 = var1900
		elseif var1888 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1901, var1902 = protoModule.readFixed64(p84, var1887)
			local _ = var1901
			var1887 = var1902
		else
			error("Unsupported wire type: " .. var1888)
		end
	end
	return var1886
end

function t_43:jsonEncode() --[[ line: 12197 ]]
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

function t_43:jsonDecode() --[[ line: 12211 ]]
	-- upvalues: t_43 (ref), t (ref)
	local var1905 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1905.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1905.game_passes = t_1
	end
	return var1905
end

t_43.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p85) --[[ line: 12249 ]]
	-- upvalues: t_44 (ref)
	return setmetatable({
		game_pass_id = if p85 == nil or p85.game_pass_id == nil then "" else p85.game_pass_id
	}, t_44)
end

function t_44:encode() --[[ line: 12257 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1909 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1910, var1911 = protoModule.writeTag(buff, var1909, 1, protoModule.wireTypes.lengthDelimited)
		var1910, var1911 = protoModule.writeString(var1910, var1911, self.game_pass_id)
		buff = var1910
		var1909 = var1911
	end
	local buff_1 = buffer.create(var1909)
	buffer.copy(buff_1, 0, buff, 0, var1909)
	
	return buff_1
end

function t_44.decode(p86) --[[ line: 12273 ]]
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1913 = t_44.new()
	local var1914 = 0
	while var1914 < buffer.len(p86) do
		local _ = nil
		local var1915 = nil
		local var1916, var1917, var1918 = protoModule.readTag(p86, var1914)
		local var1919 = var1916
		var1915 = var1917
		var1914 = var1918
		
		if var1915 == protoModule.wireTypes.varint then
			local _ = nil
			local var1920, var1921 = protoModule.readVarInt(p86, var1914)
			local _ = var1920
			var1914 = var1921
			continue
		end
		if var1915 == protoModule.wireTypes.lengthDelimited then
			if var1919 == 1 then
				local _ = nil
				local var1922, var1923 = protoModule.readBuffer(p86, var1914)
				var1914 = var1923
				var1913.game_pass_id = buffer.tostring(var1922)
			else
				local _ = nil
				local var1924, var1925 = protoModule.readVarInt(p86, var1914)
				var1914 = var1925 + var1924
			end
		elseif var1915 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1926, var1927 = protoModule.readFixed32(p86, var1914)
			local _ = var1926
			var1914 = var1927
		elseif var1915 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1928, var1929 = protoModule.readFixed64(p86, var1914)
			local _ = var1928
			var1914 = var1929
		else
			error("Unsupported wire type: " .. var1915)
		end
	end
	return var1913
end

function t_44:jsonEncode() --[[ line: 12318 ]]
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_44:jsonDecode() --[[ line: 12330 ]]
	-- upvalues: t_44 (ref)
	local var1931 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1931.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1931.game_pass_id = self.gamePassId
	end
	return var1931
end

t_44.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_44
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p87) --[[ line: 12360 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_products = if p87 == nil or p87.developer_products == nil then {} else p87.developer_products
	}, t_45)
end

function t_45:encode() --[[ line: 12368 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1933 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1934 = v:encode()
			local var1935, var1936 = protoModule.writeTag(buff, var1933, 1, protoModule.wireTypes.lengthDelimited)
			var1935, var1936 = protoModule.writeBuffer(var1935, var1936, var1934, buffer.len(var1934))
			buff = var1935
			var1933 = var1936
		end
	end
	local buff_1 = buffer.create(var1933)
	buffer.copy(buff_1, 0, buff, 0, var1933)
	
	return buff_1
end

function t_45.decode(p88) --[[ line: 12385 ]]
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1938 = t_45.new()
	local var1939 = 0
	while var1939 < buffer.len(p88) do
		local _ = nil
		local var1940 = nil
		local var1941, var1942, var1943 = protoModule.readTag(p88, var1939)
		local var1944 = var1941
		var1940 = var1942
		var1939 = var1943
		
		if var1940 == protoModule.wireTypes.varint then
			local _ = nil
			local var1945, var1946 = protoModule.readVarInt(p88, var1939)
			local _ = var1945
			var1939 = var1946
			continue
		end
		if var1940 == protoModule.wireTypes.lengthDelimited then
			if var1944 == 1 then
				local _ = nil
				local var1947, var1948 = protoModule.readBuffer(p88, var1939)
				var1939 = var1948
				table.insert(var1938.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1947))
			else
				local _ = nil
				local var1949, var1950 = protoModule.readVarInt(p88, var1939)
				var1939 = var1950 + var1949
			end
		elseif var1940 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1951, var1952 = protoModule.readFixed32(p88, var1939)
			local _ = var1951
			var1939 = var1952
		elseif var1940 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1953, var1954 = protoModule.readFixed64(p88, var1939)
			local _ = var1953
			var1939 = var1954
		else
			error("Unsupported wire type: " .. var1940)
		end
	end
	return var1938
end

function t_45:jsonEncode() --[[ line: 12431 ]]
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

function t_45:jsonDecode() --[[ line: 12445 ]]
	-- upvalues: t_45 (ref), t (ref)
	local var1957 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1957.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1957.developer_products = t_1
	end
	return var1957
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p89) --[[ line: 12492 ]]
	-- upvalues: t_46 (ref)
	return setmetatable({
		developer_product_id = if p89 == nil or p89.developer_product_id == nil then "" else p89.developer_product_id
	}, t_46)
end

function t_46:encode() --[[ line: 12505 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1961 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1962, var1963 = protoModule.writeTag(buff, var1961, 1, protoModule.wireTypes.lengthDelimited)
		var1962, var1963 = protoModule.writeString(var1962, var1963, self.developer_product_id)
		buff = var1962
		var1961 = var1963
	end
	local buff_1 = buffer.create(var1961)
	buffer.copy(buff_1, 0, buff, 0, var1961)
	
	return buff_1
end

function t_46.decode(p90) --[[ line: 12521 ]]
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1965 = t_46.new()
	local var1966 = 0
	while var1966 < buffer.len(p90) do
		local _ = nil
		local var1967 = nil
		local var1968, var1969, var1970 = protoModule.readTag(p90, var1966)
		local var1971 = var1968
		var1967 = var1969
		var1966 = var1970
		
		if var1967 == protoModule.wireTypes.varint then
			local _ = nil
			local var1972, var1973 = protoModule.readVarInt(p90, var1966)
			local _ = var1972
			var1966 = var1973
			continue
		end
		if var1967 == protoModule.wireTypes.lengthDelimited then
			if var1971 == 1 then
				local _ = nil
				local var1974, var1975 = protoModule.readBuffer(p90, var1966)
				var1966 = var1975
				var1965.developer_product_id = buffer.tostring(var1974)
			else
				local _ = nil
				local var1976, var1977 = protoModule.readVarInt(p90, var1966)
				var1966 = var1977 + var1976
			end
		elseif var1967 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1978, var1979 = protoModule.readFixed32(p90, var1966)
			local _ = var1978
			var1966 = var1979
		elseif var1967 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1980, var1981 = protoModule.readFixed64(p90, var1966)
			local _ = var1980
			var1966 = var1981
		else
			error("Unsupported wire type: " .. var1967)
		end
	end
	return var1965
end

function t_46:jsonEncode() --[[ line: 12566 ]]
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_46:jsonDecode() --[[ line: 12578 ]]
	-- upvalues: t_46 (ref)
	local var1983 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1983.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1983.developer_product_id = self.developerProductId
	end
	return var1983
end

t_46.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_46
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p91) --[[ line: 12609 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscriptions = if p91 == nil or p91.subscriptions == nil then {} else p91.subscriptions
	}, t_47)
end

function t_47:encode() --[[ line: 12617 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1985 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1986 = v:encode()
			local var1987, var1988 = protoModule.writeTag(buff, var1985, 1, protoModule.wireTypes.lengthDelimited)
			var1987, var1988 = protoModule.writeBuffer(var1987, var1988, var1986, buffer.len(var1986))
			buff = var1987
			var1985 = var1988
		end
	end
	local buff_1 = buffer.create(var1985)
	buffer.copy(buff_1, 0, buff, 0, var1985)
	
	return buff_1
end

function t_47.decode(p92) --[[ line: 12634 ]]
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1990 = t_47.new()
	local var1991 = 0
	while var1991 < buffer.len(p92) do
		local _ = nil
		local var1992 = nil
		local var1993, var1994, var1995 = protoModule.readTag(p92, var1991)
		local var1996 = var1993
		var1992 = var1994
		var1991 = var1995
		
		if var1992 == protoModule.wireTypes.varint then
			local _ = nil
			local var1997, var1998 = protoModule.readVarInt(p92, var1991)
			local _ = var1997
			var1991 = var1998
			continue
		end
		if var1992 == protoModule.wireTypes.lengthDelimited then
			if var1996 == 1 then
				local _ = nil
				local var1999, var2000 = protoModule.readBuffer(p92, var1991)
				var1991 = var2000
				table.insert(var1990.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1999))
			else
				local _ = nil
				local var2001, var2002 = protoModule.readVarInt(p92, var1991)
				var1991 = var2002 + var2001
			end
		elseif var1992 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2003, var2004 = protoModule.readFixed32(p92, var1991)
			local _ = var2003
			var1991 = var2004
		elseif var1992 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2005, var2006 = protoModule.readFixed64(p92, var1991)
			local _ = var2005
			var1991 = var2006
		else
			error("Unsupported wire type: " .. var1992)
		end
	end
	return var1990
end

function t_47:jsonEncode() --[[ line: 12680 ]]
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

function t_47:jsonDecode() --[[ line: 12694 ]]
	-- upvalues: t_47 (ref), t (ref)
	local var2009 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var2009.subscriptions = t_1
	end
	return var2009
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p93) --[[ line: 12724 ]]
	-- upvalues: t_48 (ref)
	return setmetatable({
		subscription_id = if p93 == nil or p93.subscription_id == nil then "" else p93.subscription_id
	}, t_48)
end

function t_48:encode() --[[ line: 12735 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2012 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var2013, var2014 = protoModule.writeTag(buff, var2012, 1, protoModule.wireTypes.lengthDelimited)
		var2013, var2014 = protoModule.writeString(var2013, var2014, self.subscription_id)
		buff = var2013
		var2012 = var2014
	end
	local buff_1 = buffer.create(var2012)
	buffer.copy(buff_1, 0, buff, 0, var2012)
	
	return buff_1
end

function t_48.decode(p94) --[[ line: 12751 ]]
	-- upvalues: t_48 (ref), protoModule (ref)
	local var2016 = t_48.new()
	local var2017 = 0
	while var2017 < buffer.len(p94) do
		local _ = nil
		local var2018 = nil
		local var2019, var2020, var2021 = protoModule.readTag(p94, var2017)
		local var2022 = var2019
		var2018 = var2020
		var2017 = var2021
		
		if var2018 == protoModule.wireTypes.varint then
			local _ = nil
			local var2023, var2024 = protoModule.readVarInt(p94, var2017)
			local _ = var2023
			var2017 = var2024
			continue
		end
		if var2018 == protoModule.wireTypes.lengthDelimited then
			if var2022 == 1 then
				local _ = nil
				local var2025, var2026 = protoModule.readBuffer(p94, var2017)
				var2017 = var2026
				var2016.subscription_id = buffer.tostring(var2025)
			else
				local _ = nil
				local var2027, var2028 = protoModule.readVarInt(p94, var2017)
				var2017 = var2028 + var2027
			end
		elseif var2018 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2029, var2030 = protoModule.readFixed32(p94, var2017)
			local _ = var2029
			var2017 = var2030
		elseif var2018 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2031, var2032 = protoModule.readFixed64(p94, var2017)
			local _ = var2031
			var2017 = var2032
		else
			error("Unsupported wire type: " .. var2018)
		end
	end
	return var2016
end

function t_48:jsonEncode() --[[ line: 12796 ]]
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_48:jsonDecode() --[[ line: 12808 ]]
	-- upvalues: t_48 (ref)
	local var2034 = t_48.new()
	
	if self.subscription_id ~= nil then
		var2034.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var2034.subscription_id = self.subscriptionId
	end
	return var2034
end

t_48.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_48
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p95) --[[ line: 12839 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		items = if p95 == nil or p95.items == nil then {} else p95.items,
		universe_id = if p95 == nil or p95.universe_id == nil then "" else p95.universe_id,
		section_title = if p95 == nil or p95.section_title == nil then "" else p95.section_title,
		creator_key = if p95 == nil or p95.creator_key == nil then "" else p95.creator_key,
		collection_item_size = if p95 == nil or p95.collection_item_size == nil then "" else p95.collection_item_size,
		item_height_mode = if p95 == nil or p95.item_height_mode == nil then "" else p95.item_height_mode
	}, t_49)
end

function t_49:encode() --[[ line: 12854 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2036 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2037 = v:encode()
			local var2038, var2039 = protoModule.writeTag(buff, var2036, 1, protoModule.wireTypes.lengthDelimited)
			var2038, var2039 = protoModule.writeBuffer(var2038, var2039, var2037, buffer.len(var2037))
			buff = var2038
			var2036 = var2039
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2040, var2041 = protoModule.writeTag(buff, var2036, 2, protoModule.wireTypes.lengthDelimited)
		var2040, var2041 = protoModule.writeString(var2040, var2041, self.universe_id)
		buff = var2040
		var2036 = var2041
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var2042, var2043 = protoModule.writeTag(buff, var2036, 3, protoModule.wireTypes.lengthDelimited)
		var2042, var2043 = protoModule.writeString(var2042, var2043, self.section_title)
		buff = var2042
		var2036 = var2043
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var2044, var2045 = protoModule.writeTag(buff, var2036, 4, protoModule.wireTypes.lengthDelimited)
		var2044, var2045 = protoModule.writeString(var2044, var2045, self.creator_key)
		buff = var2044
		var2036 = var2045
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var2046, var2047 = protoModule.writeTag(buff, var2036, 5, protoModule.wireTypes.lengthDelimited)
		var2046, var2047 = protoModule.writeString(var2046, var2047, self.collection_item_size)
		buff = var2046
		var2036 = var2047
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var2048, var2049 = protoModule.writeTag(buff, var2036, 6, protoModule.wireTypes.lengthDelimited)
		var2048, var2049 = protoModule.writeString(var2048, var2049, self.item_height_mode)
		buff = var2048
		var2036 = var2049
	end
	local buff_1 = buffer.create(var2036)
	buffer.copy(buff_1, 0, buff, 0, var2036)
	
	return buff_1
end

function t_49.decode(p96) --[[ line: 12896 ]]
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var2051 = t_49.new()
	local var2052 = 0
	while var2052 < buffer.len(p96) do
		local _ = nil
		local var2053 = nil
		local var2054, var2055, var2056 = protoModule.readTag(p96, var2052)
		local var2057 = var2054
		var2053 = var2055
		var2052 = var2056
		
		if var2053 == protoModule.wireTypes.varint then
			local _ = nil
			local var2058, var2059 = protoModule.readVarInt(p96, var2052)
			local _ = var2058
			var2052 = var2059
			continue
		end
		if var2053 == protoModule.wireTypes.lengthDelimited then
			if var2057 == 1 then
				local _ = nil
				local var2060, var2061 = protoModule.readBuffer(p96, var2052)
				var2052 = var2061
				table.insert(var2051.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var2060))
			elseif var2057 == 2 then
				local _ = nil
				local var2062, var2063 = protoModule.readBuffer(p96, var2052)
				var2052 = var2063
				var2051.universe_id = buffer.tostring(var2062)
			elseif var2057 == 3 then
				local _ = nil
				local var2064, var2065 = protoModule.readBuffer(p96, var2052)
				var2052 = var2065
				var2051.section_title = buffer.tostring(var2064)
			elseif var2057 == 4 then
				local _ = nil
				local var2066, var2067 = protoModule.readBuffer(p96, var2052)
				var2052 = var2067
				var2051.creator_key = buffer.tostring(var2066)
			elseif var2057 == 5 then
				local _ = nil
				local var2068, var2069 = protoModule.readBuffer(p96, var2052)
				var2052 = var2069
				var2051.collection_item_size = buffer.tostring(var2068)
			elseif var2057 == 6 then
				local _ = nil
				local var2070, var2071 = protoModule.readBuffer(p96, var2052)
				var2052 = var2071
				var2051.item_height_mode = buffer.tostring(var2070)
			else
				local _ = nil
				local var2072, var2073 = protoModule.readVarInt(p96, var2052)
				var2052 = var2073 + var2072
			end
		elseif var2053 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2074, var2075 = protoModule.readFixed32(p96, var2052)
			local _ = var2074
			var2052 = var2075
		elseif var2053 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2076, var2077 = protoModule.readFixed64(p96, var2052)
			local _ = var2076
			var2052 = var2077
		else
			error("Unsupported wire type: " .. var2053)
		end
	end
	return var2051
end

function t_49:jsonEncode() --[[ line: 12967 ]]
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
	return t
end

function t_49:jsonDecode() --[[ line: 13001 ]]
	-- upvalues: t_49 (ref), t (ref)
	local var2080 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var2080.items = t_1
	end
	if self.universe_id ~= nil then
		var2080.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2080.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var2080.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var2080.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var2080.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var2080.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var2080.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var2080.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var2080.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var2080.item_height_mode = self.itemHeightMode
	end
	return var2080
end

t_49.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_49
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p97) --[[ line: 13074 ]]
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		item_id = if p97 == nil or p97.item_id == nil then "" else p97.item_id,
		identifier = if p97 == nil or p97.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p97.identifier
	}, t_50)
end

function t_50:encode() --[[ line: 13091 ]]
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2083 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2084, var2085 = protoModule.writeTag(buff, var2083, 1, protoModule.wireTypes.lengthDelimited)
		var2084, var2085 = protoModule.writeString(var2084, var2085, self.item_id)
		buff = var2084
		var2083 = var2085
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var2086, var2087 = protoModule.writeTag(buff, var2083, 2, protoModule.wireTypes.varint)
		var2086, var2087 = protoModule.writeVarInt(var2086, var2087, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var2086
		var2083 = var2087
	end
	local buff_1 = buffer.create(var2083)
	buffer.copy(buff_1, 0, buff, 0, var2083)
	
	return buff_1
end

function t_50.decode(p98) --[[ line: 13123 ]]
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var2089 = t_50.new()
	local var2090 = 0
	while var2090 < buffer.len(p98) do
		local _ = nil
		local var2091 = nil
		local var2092, var2093, var2094 = protoModule.readTag(p98, var2090)
		local var2095 = var2092
		var2091 = var2093
		var2090 = var2094
		
		if var2091 == protoModule.wireTypes.varint then
			if var2095 == 2 then
				local _ = nil
				local var2096, var2097 = protoModule.readVarIntI32(p98, var2090)
				local var2098 = var2096
				var2090 = var2097
				var2089.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var2098) or var2098
			else
				local _ = nil
				local var2099, var2100 = protoModule.readVarInt(p98, var2090)
				local _ = var2099
				var2090 = var2100
			end
		end
		if var2091 == protoModule.wireTypes.lengthDelimited then
			if var2095 == 1 then
				local _ = nil
				local var2101, var2102 = protoModule.readBuffer(p98, var2090)
				var2090 = var2102
				var2089.item_id = buffer.tostring(var2101)
			else
				local _ = nil
				local var2103, var2104 = protoModule.readVarInt(p98, var2090)
				var2090 = var2104 + var2103
			end
		elseif var2091 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2105, var2106 = protoModule.readFixed32(p98, var2090)
			local _ = var2105
			var2090 = var2106
		elseif var2091 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2107, var2108 = protoModule.readFixed64(p98, var2090)
			local _ = var2107
			var2090 = var2108
		else
			error("Unsupported wire type: " .. var2091)
		end
	end
	return var2089
end

function t_50:jsonEncode() --[[ line: 13175 ]]
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

function t_50:jsonDecode() --[[ line: 13202 ]]
	-- upvalues: t_50 (ref), t (ref)
	local var2110 = t_50.new()
	
	if self.item_id ~= nil then
		var2110.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2110.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var2110.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var2110
end

t_50.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_50
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p99) --[[ line: 13241 ]]
		return if p99 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p99 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p99 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p99 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p100) --[[ line: 13255 ]]
		return if p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p100
	end,
	fromName = function(p101) --[[ line: 13269 ]]
		return if p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_51 = {}
t_51.__index = t_51

function t_51.new(p102) --[[ line: 13288 ]]
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

function t_51:encode() --[[ line: 13304 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2112 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2113, var2114 = protoModule.writeTag(buff, var2112, 1, protoModule.wireTypes.lengthDelimited)
		var2113, var2114 = protoModule.writeString(var2113, var2114, self.roblox_component)
		buff = var2113
		var2112 = var2114
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var2115, var2116 = protoModule.writeTag(buff, var2112, 2, protoModule.wireTypes.lengthDelimited)
		var2115, var2116 = protoModule.writeString(var2115, var2116, self.identifier)
		buff = var2115
		var2112 = var2116
	end
	if self.title ~= nil and self.title ~= "" then
		local var2117, var2118 = protoModule.writeTag(buff, var2112, 3, protoModule.wireTypes.lengthDelimited)
		var2117, var2118 = protoModule.writeString(var2117, var2118, self.title)
		buff = var2117
		var2112 = var2118
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2119, var2120 = protoModule.writeTag(buff, var2112, 4, protoModule.wireTypes.lengthDelimited)
		var2119, var2120 = protoModule.writeString(var2119, var2120, self.user_id)
		buff = var2119
		var2112 = var2120
	end
	if self.description ~= nil and self.description ~= "" then
		local var2121, var2122 = protoModule.writeTag(buff, var2112, 5, protoModule.wireTypes.lengthDelimited)
		var2121, var2122 = protoModule.writeString(var2121, var2122, self.description)
		buff = var2121
		var2112 = var2122
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2123, var2124 = protoModule.writeTag(buff, var2112, 6, protoModule.wireTypes.lengthDelimited)
		var2123, var2124 = protoModule.writeString(var2123, var2124, self.cta_text)
		buff = var2123
		var2112 = var2124
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2125, var2126 = protoModule.writeTag(buff, var2112, 7, protoModule.wireTypes.lengthDelimited)
		var2125, var2126 = protoModule.writeString(var2125, var2126, self.prompt_id)
		buff = var2125
		var2112 = var2126
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2127, var2128 = protoModule.writeTag(buff, var2112, 8, protoModule.wireTypes.lengthDelimited)
		var2127, var2128 = protoModule.writeString(var2127, var2128, self.prompt_type)
		buff = var2127
		var2112 = var2128
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2129, var2130 = protoModule.writeTag(buff, var2112, 9, protoModule.wireTypes.lengthDelimited)
		var2129, var2130 = protoModule.writeString(var2129, var2130, self.entity_id)
		buff = var2129
		var2112 = var2130
	end
	local buff_1 = buffer.create(var2112)
	buffer.copy(buff_1, 0, buff, 0, var2112)
	
	return buff_1
end

function t_51.decode(p103) --[[ line: 13358 ]]
	-- upvalues: t_51 (ref), protoModule (ref)
	local var2132 = t_51.new()
	local var2133 = 0
	while var2133 < buffer.len(p103) do
		local _ = nil
		local var2134 = nil
		local var2135, var2136, var2137 = protoModule.readTag(p103, var2133)
		local var2138 = var2135
		var2134 = var2136
		var2133 = var2137
		
		if var2134 == protoModule.wireTypes.varint then
			local _ = nil
			local var2139, var2140 = protoModule.readVarInt(p103, var2133)
			local _ = var2139
			var2133 = var2140
			continue
		end
		if var2134 == protoModule.wireTypes.lengthDelimited then
			if var2138 == 1 then
				local _ = nil
				local var2141, var2142 = protoModule.readBuffer(p103, var2133)
				var2133 = var2142
				var2132.roblox_component = buffer.tostring(var2141)
			elseif var2138 == 2 then
				local _ = nil
				local var2143, var2144 = protoModule.readBuffer(p103, var2133)
				var2133 = var2144
				var2132.identifier = buffer.tostring(var2143)
			elseif var2138 == 3 then
				local _ = nil
				local var2145, var2146 = protoModule.readBuffer(p103, var2133)
				var2133 = var2146
				var2132.title = buffer.tostring(var2145)
			elseif var2138 == 4 then
				local _ = nil
				local var2147, var2148 = protoModule.readBuffer(p103, var2133)
				var2133 = var2148
				var2132.user_id = buffer.tostring(var2147)
			elseif var2138 == 5 then
				local _ = nil
				local var2149, var2150 = protoModule.readBuffer(p103, var2133)
				var2133 = var2150
				var2132.description = buffer.tostring(var2149)
			elseif var2138 == 6 then
				local _ = nil
				local var2151, var2152 = protoModule.readBuffer(p103, var2133)
				var2133 = var2152
				var2132.cta_text = buffer.tostring(var2151)
			elseif var2138 == 7 then
				local _ = nil
				local var2153, var2154 = protoModule.readBuffer(p103, var2133)
				var2133 = var2154
				var2132.prompt_id = buffer.tostring(var2153)
			elseif var2138 == 8 then
				local _ = nil
				local var2155, var2156 = protoModule.readBuffer(p103, var2133)
				var2133 = var2156
				var2132.prompt_type = buffer.tostring(var2155)
			elseif var2138 == 9 then
				local _ = nil
				local var2157, var2158 = protoModule.readBuffer(p103, var2133)
				var2133 = var2158
				var2132.entity_id = buffer.tostring(var2157)
			else
				local _ = nil
				local var2159, var2160 = protoModule.readVarInt(p103, var2133)
				var2133 = var2160 + var2159
			end
		elseif var2134 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2161, var2162 = protoModule.readFixed32(p103, var2133)
			local _ = var2161
			var2133 = var2162
		elseif var2134 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2163, var2164 = protoModule.readFixed64(p103, var2133)
			local _ = var2163
			var2133 = var2164
		else
			error("Unsupported wire type: " .. var2134)
		end
	end
	return var2132
end

function t_51:jsonEncode() --[[ line: 13441 ]]
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

function t_51:jsonDecode() --[[ line: 13483 ]]
	-- upvalues: t_51 (ref)
	local var2166 = t_51.new()
	
	if self.roblox_component ~= nil then
		var2166.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var2166.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var2166.identifier = self.identifier
	end
	if self.title ~= nil then
		var2166.title = self.title
	end
	if self.user_id ~= nil then
		var2166.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2166.user_id = self.userId
	end
	if self.description ~= nil then
		var2166.description = self.description
	end
	if self.cta_text ~= nil then
		var2166.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2166.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2166.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2166.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2166.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2166.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2166.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2166.entity_id = self.entityId
	end
	return var2166
end

t_51.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_51
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p104) --[[ line: 13563 ]]
	-- upvalues: t_52 (ref)
	return setmetatable({
		group_id = if p104 == nil or p104.group_id == nil then "" else p104.group_id,
		experience_id = if p104 == nil or p104.experience_id == nil then "" else p104.experience_id
	}, t_52)
end

function t_52:encode() --[[ line: 13572 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2168 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var2169, var2170 = protoModule.writeTag(buff, var2168, 1, protoModule.wireTypes.lengthDelimited)
		var2169, var2170 = protoModule.writeString(var2169, var2170, self.group_id)
		buff = var2169
		var2168 = var2170
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var2171, var2172 = protoModule.writeTag(buff, var2168, 2, protoModule.wireTypes.lengthDelimited)
		var2171, var2172 = protoModule.writeString(var2171, var2172, self.experience_id)
		buff = var2171
		var2168 = var2172
	end
	local buff_1 = buffer.create(var2168)
	buffer.copy(buff_1, 0, buff, 0, var2168)
	
	return buff_1
end

function t_52.decode(p105) --[[ line: 13591 ]]
	-- upvalues: t_52 (ref), protoModule (ref)
	local var2174 = t_52.new()
	local var2175 = 0
	while var2175 < buffer.len(p105) do
		local _ = nil
		local var2176 = nil
		local var2177, var2178, var2179 = protoModule.readTag(p105, var2175)
		local var2180 = var2177
		var2176 = var2178
		var2175 = var2179
		
		if var2176 == protoModule.wireTypes.varint then
			local _ = nil
			local var2181, var2182 = protoModule.readVarInt(p105, var2175)
			local _ = var2181
			var2175 = var2182
			continue
		end
		if var2176 == protoModule.wireTypes.lengthDelimited then
			if var2180 == 1 then
				local _ = nil
				local var2183, var2184 = protoModule.readBuffer(p105, var2175)
				var2175 = var2184
				var2174.group_id = buffer.tostring(var2183)
			elseif var2180 == 2 then
				local _ = nil
				local var2185, var2186 = protoModule.readBuffer(p105, var2175)
				var2175 = var2186
				var2174.experience_id = buffer.tostring(var2185)
			else
				local _ = nil
				local var2187, var2188 = protoModule.readVarInt(p105, var2175)
				var2175 = var2188 + var2187
			end
		elseif var2176 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2189, var2190 = protoModule.readFixed32(p105, var2175)
			local _ = var2189
			var2175 = var2190
		elseif var2176 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2191, var2192 = protoModule.readFixed64(p105, var2175)
			local _ = var2191
			var2175 = var2192
		else
			error("Unsupported wire type: " .. var2176)
		end
	end
	return var2174
end

function t_52:jsonEncode() --[[ line: 13639 ]]
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_52:jsonDecode() --[[ line: 13653 ]]
	-- upvalues: t_52 (ref)
	local var2194 = t_52.new()
	
	if self.group_id ~= nil then
		var2194.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var2194.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var2194.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var2194.experience_id = self.experienceId
	end
	return var2194
end

t_52.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_52
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p106) --[[ line: 13689 ]]
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

function t_53:encode() --[[ line: 13703 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2196 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2197, var2198 = protoModule.writeTag(buff, var2196, 1, protoModule.wireTypes.lengthDelimited)
		var2197, var2198 = protoModule.writeString(var2197, var2198, self.title)
		buff = var2197
		var2196 = var2198
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var2199, var2200 = protoModule.writeTag(buff, var2196, 2, protoModule.wireTypes.lengthDelimited)
		var2199, var2200 = protoModule.writeString(var2199, var2200, self.dismiss_text)
		buff = var2199
		var2196 = var2200
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2201, var2202 = protoModule.writeTag(buff, var2196, 3, protoModule.wireTypes.lengthDelimited)
		var2201, var2202 = protoModule.writeString(var2201, var2202, self.user_id)
		buff = var2201
		var2196 = var2202
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var2203 = v:encode()
			local var2204, var2205 = protoModule.writeTag(buff, var2196, 4, protoModule.wireTypes.lengthDelimited)
			var2204, var2205 = protoModule.writeBuffer(var2204, var2205, var2203, buffer.len(var2203))
			buff = var2204
			var2196 = var2205
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2206, var2207 = protoModule.writeTag(buff, var2196, 5, protoModule.wireTypes.lengthDelimited)
		var2206, var2207 = protoModule.writeString(var2206, var2207, self.prompt_id)
		buff = var2206
		var2196 = var2207
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2208, var2209 = protoModule.writeTag(buff, var2196, 6, protoModule.wireTypes.lengthDelimited)
		var2208, var2209 = protoModule.writeString(var2208, var2209, self.prompt_type)
		buff = var2208
		var2196 = var2209
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2210, var2211 = protoModule.writeTag(buff, var2196, 7, protoModule.wireTypes.lengthDelimited)
		var2210, var2211 = protoModule.writeString(var2210, var2211, self.sort_id)
		buff = var2210
		var2196 = var2211
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var2212, var2213 = protoModule.writeTag(buff, var2196, 8, protoModule.wireTypes.lengthDelimited)
		var2212, var2213 = protoModule.writeString(var2212, var2213, self.feed_item_key)
		buff = var2212
		var2196 = var2213
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var2214 = self.client_attributes.value:encode()
		local var2215, var2216 = protoModule.writeTag(buff, var2196, 9, protoModule.wireTypes.lengthDelimited)
		var2215, var2216 = protoModule.writeBuffer(var2215, var2216, var2214, buffer.len(var2214))
		buff = var2215
		var2196 = var2216
	end
	local buff_1 = buffer.create(var2196)
	buffer.copy(buff_1, 0, buff, 0, var2196)
	
	return buff_1
end

function t_53.decode(p107) --[[ line: 13763 ]]
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var2218 = t_53.new()
	local var2219 = 0
	while var2219 < buffer.len(p107) do
		local _ = nil
		local var2220 = nil
		local var2221, var2222, var2223 = protoModule.readTag(p107, var2219)
		local var2224 = var2221
		var2220 = var2222
		var2219 = var2223
		
		if var2220 == protoModule.wireTypes.varint then
			local _ = nil
			local var2225, var2226 = protoModule.readVarInt(p107, var2219)
			local _ = var2225
			var2219 = var2226
			continue
		end
		if var2220 == protoModule.wireTypes.lengthDelimited then
			if var2224 == 1 then
				local _ = nil
				local var2227, var2228 = protoModule.readBuffer(p107, var2219)
				var2219 = var2228
				var2218.title = buffer.tostring(var2227)
			elseif var2224 == 2 then
				local _ = nil
				local var2229, var2230 = protoModule.readBuffer(p107, var2219)
				var2219 = var2230
				var2218.dismiss_text = buffer.tostring(var2229)
			elseif var2224 == 3 then
				local _ = nil
				local var2231, var2232 = protoModule.readBuffer(p107, var2219)
				var2219 = var2232
				var2218.user_id = buffer.tostring(var2231)
			elseif var2224 == 4 then
				local _ = nil
				local var2233, var2234 = protoModule.readBuffer(p107, var2219)
				var2219 = var2234
				table.insert(var2218.cards, t.CardContainerCardInputData.decode(var2233))
			elseif var2224 == 5 then
				local _ = nil
				local var2235, var2236 = protoModule.readBuffer(p107, var2219)
				var2219 = var2236
				var2218.prompt_id = buffer.tostring(var2235)
			elseif var2224 == 6 then
				local _ = nil
				local var2237, var2238 = protoModule.readBuffer(p107, var2219)
				var2219 = var2238
				var2218.prompt_type = buffer.tostring(var2237)
			elseif var2224 == 7 then
				local _ = nil
				local var2239, var2240 = protoModule.readBuffer(p107, var2219)
				var2219 = var2240
				var2218.sort_id = buffer.tostring(var2239)
			elseif var2224 == 8 then
				local _ = nil
				local var2241, var2242 = protoModule.readBuffer(p107, var2219)
				var2219 = var2242
				var2218.feed_item_key = buffer.tostring(var2241)
			elseif var2224 == 9 then
				local _ = nil
				local var2243, var2244 = protoModule.readBuffer(p107, var2219)
				var2219 = var2244
				var2218.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var2243)
				}
			else
				local _ = nil
				local var2245, var2246 = protoModule.readVarInt(p107, var2219)
				var2219 = var2246 + var2245
			end
		elseif var2220 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2247, var2248 = protoModule.readFixed32(p107, var2219)
			local _ = var2247
			var2219 = var2248
		elseif var2220 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2249, var2250 = protoModule.readFixed64(p107, var2219)
			local _ = var2249
			var2219 = var2250
		else
			error("Unsupported wire type: " .. var2220)
		end
	end
	return var2218
end

function t_53:jsonEncode() --[[ line: 13849 ]]
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

function t_53:jsonDecode() --[[ line: 13897 ]]
	-- upvalues: t_53 (ref), t (ref)
	local var2253 = t_53.new()
	
	if self.title ~= nil then
		var2253.title = self.title
	end
	if self.dismiss_text ~= nil then
		var2253.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var2253.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var2253.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2253.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var2253.cards = t_1
	end
	if self.prompt_id ~= nil then
		var2253.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2253.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2253.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2253.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var2253.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2253.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var2253.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var2253.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var2253.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var2253.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var2253
end

t_53.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_53
typeRegistryModule.default:register(t.CardContainerInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p108) --[[ line: 13992 ]]
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

function t_54:encode() --[[ line: 14004 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2256 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2257, var2258 = protoModule.writeTag(buff, var2256, 1, protoModule.wireTypes.lengthDelimited)
		var2257, var2258 = protoModule.writeString(var2257, var2258, self.title)
		buff = var2257
		var2256 = var2258
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2259, var2260 = protoModule.writeTag(buff, var2256, 2, protoModule.wireTypes.lengthDelimited)
		var2259, var2260 = protoModule.writeString(var2259, var2260, self.user_id)
		buff = var2259
		var2256 = var2260
	end
	if self.description ~= nil and self.description ~= "" then
		local var2261, var2262 = protoModule.writeTag(buff, var2256, 3, protoModule.wireTypes.lengthDelimited)
		var2261, var2262 = protoModule.writeString(var2261, var2262, self.description)
		buff = var2261
		var2256 = var2262
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2263, var2264 = protoModule.writeTag(buff, var2256, 4, protoModule.wireTypes.lengthDelimited)
		var2263, var2264 = protoModule.writeString(var2263, var2264, self.cta_text)
		buff = var2263
		var2256 = var2264
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2265, var2266 = protoModule.writeTag(buff, var2256, 5, protoModule.wireTypes.lengthDelimited)
		var2265, var2266 = protoModule.writeString(var2265, var2266, self.prompt_id)
		buff = var2265
		var2256 = var2266
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2267, var2268 = protoModule.writeTag(buff, var2256, 6, protoModule.wireTypes.lengthDelimited)
		var2267, var2268 = protoModule.writeString(var2267, var2268, self.prompt_type)
		buff = var2267
		var2256 = var2268
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2269, var2270 = protoModule.writeTag(buff, var2256, 7, protoModule.wireTypes.lengthDelimited)
		var2269, var2270 = protoModule.writeString(var2269, var2270, self.entity_id)
		buff = var2269
		var2256 = var2270
	end
	local buff_1 = buffer.create(var2256)
	buffer.copy(buff_1, 0, buff, 0, var2256)
	
	return buff_1
end

function t_54.decode(p109) --[[ line: 14048 ]]
	-- upvalues: t_54 (ref), protoModule (ref)
	local var2272 = t_54.new()
	local var2273 = 0
	while var2273 < buffer.len(p109) do
		local _ = nil
		local var2274 = nil
		local var2275, var2276, var2277 = protoModule.readTag(p109, var2273)
		local var2278 = var2275
		var2274 = var2276
		var2273 = var2277
		
		if var2274 == protoModule.wireTypes.varint then
			local _ = nil
			local var2279, var2280 = protoModule.readVarInt(p109, var2273)
			local _ = var2279
			var2273 = var2280
			continue
		end
		if var2274 == protoModule.wireTypes.lengthDelimited then
			if var2278 == 1 then
				local _ = nil
				local var2281, var2282 = protoModule.readBuffer(p109, var2273)
				var2273 = var2282
				var2272.title = buffer.tostring(var2281)
			elseif var2278 == 2 then
				local _ = nil
				local var2283, var2284 = protoModule.readBuffer(p109, var2273)
				var2273 = var2284
				var2272.user_id = buffer.tostring(var2283)
			elseif var2278 == 3 then
				local _ = nil
				local var2285, var2286 = protoModule.readBuffer(p109, var2273)
				var2273 = var2286
				var2272.description = buffer.tostring(var2285)
			elseif var2278 == 4 then
				local _ = nil
				local var2287, var2288 = protoModule.readBuffer(p109, var2273)
				var2273 = var2288
				var2272.cta_text = buffer.tostring(var2287)
			elseif var2278 == 5 then
				local _ = nil
				local var2289, var2290 = protoModule.readBuffer(p109, var2273)
				var2273 = var2290
				var2272.prompt_id = buffer.tostring(var2289)
			elseif var2278 == 6 then
				local _ = nil
				local var2291, var2292 = protoModule.readBuffer(p109, var2273)
				var2273 = var2292
				var2272.prompt_type = buffer.tostring(var2291)
			elseif var2278 == 7 then
				local _ = nil
				local var2293, var2294 = protoModule.readBuffer(p109, var2273)
				var2273 = var2294
				var2272.entity_id = buffer.tostring(var2293)
			else
				local _ = nil
				local var2295, var2296 = protoModule.readVarInt(p109, var2273)
				var2273 = var2296 + var2295
			end
		elseif var2274 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2297, var2298 = protoModule.readFixed32(p109, var2273)
			local _ = var2297
			var2273 = var2298
		elseif var2274 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2299, var2300 = protoModule.readFixed64(p109, var2273)
			local _ = var2299
			var2273 = var2300
		else
			error("Unsupported wire type: " .. var2274)
		end
	end
	return var2272
end

function t_54:jsonEncode() --[[ line: 14121 ]]
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

function t_54:jsonDecode() --[[ line: 14155 ]]
	-- upvalues: t_54 (ref)
	local var2302 = t_54.new()
	
	if self.title ~= nil then
		var2302.title = self.title
	end
	if self.user_id ~= nil then
		var2302.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2302.user_id = self.userId
	end
	if self.description ~= nil then
		var2302.description = self.description
	end
	if self.cta_text ~= nil then
		var2302.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2302.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2302.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2302.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2302.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2302.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2302.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2302.entity_id = self.entityId
	end
	return var2302
end

t_54.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_54
typeRegistryModule.default:register(t.CardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p110) --[[ line: 14223 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p110 == nil or p110.prompt_id == nil then "" else p110.prompt_id,
		prompt_type = if p110 == nil or p110.prompt_type == nil then "" else p110.prompt_type,
		user_id = if p110 == nil or p110.user_id == nil then "" else p110.user_id,
		audit_data = if p110 == nil or p110.audit_data == nil then "" else p110.audit_data
	}, t_55)
end

function t_55:encode() --[[ line: 14232 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2304 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2305, var2306 = protoModule.writeTag(buff, var2304, 1, protoModule.wireTypes.lengthDelimited)
		var2305, var2306 = protoModule.writeString(var2305, var2306, self.prompt_id)
		buff = var2305
		var2304 = var2306
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2307, var2308 = protoModule.writeTag(buff, var2304, 2, protoModule.wireTypes.lengthDelimited)
		var2307, var2308 = protoModule.writeString(var2307, var2308, self.prompt_type)
		buff = var2307
		var2304 = var2308
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2309, var2310 = protoModule.writeTag(buff, var2304, 3, protoModule.wireTypes.lengthDelimited)
		var2309, var2310 = protoModule.writeString(var2309, var2310, self.user_id)
		buff = var2309
		var2304 = var2310
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var2311, var2312 = protoModule.writeTag(buff, var2304, 4, protoModule.wireTypes.lengthDelimited)
		var2311, var2312 = protoModule.writeString(var2311, var2312, self.audit_data)
		buff = var2311
		var2304 = var2312
	end
	local buff_1 = buffer.create(var2304)
	buffer.copy(buff_1, 0, buff, 0, var2304)
	
	return buff_1
end

function t_55.decode(p111) --[[ line: 14261 ]]
	-- upvalues: t_55 (ref), protoModule (ref)
	local var2314 = t_55.new()
	local var2315 = 0
	while var2315 < buffer.len(p111) do
		local _ = nil
		local var2316 = nil
		local var2317, var2318, var2319 = protoModule.readTag(p111, var2315)
		local var2320 = var2317
		var2316 = var2318
		var2315 = var2319
		
		if var2316 == protoModule.wireTypes.varint then
			local _ = nil
			local var2321, var2322 = protoModule.readVarInt(p111, var2315)
			local _ = var2321
			var2315 = var2322
			continue
		end
		if var2316 == protoModule.wireTypes.lengthDelimited then
			if var2320 == 1 then
				local _ = nil
				local var2323, var2324 = protoModule.readBuffer(p111, var2315)
				var2315 = var2324
				var2314.prompt_id = buffer.tostring(var2323)
			elseif var2320 == 2 then
				local _ = nil
				local var2325, var2326 = protoModule.readBuffer(p111, var2315)
				var2315 = var2326
				var2314.prompt_type = buffer.tostring(var2325)
			elseif var2320 == 3 then
				local _ = nil
				local var2327, var2328 = protoModule.readBuffer(p111, var2315)
				var2315 = var2328
				var2314.user_id = buffer.tostring(var2327)
			elseif var2320 == 4 then
				local _ = nil
				local var2329, var2330 = protoModule.readBuffer(p111, var2315)
				var2315 = var2330
				var2314.audit_data = buffer.tostring(var2329)
			else
				local _ = nil
				local var2331, var2332 = protoModule.readVarInt(p111, var2315)
				var2315 = var2332 + var2331
			end
		elseif var2316 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2333, var2334 = protoModule.readFixed32(p111, var2315)
			local _ = var2333
			var2315 = var2334
		elseif var2316 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2335, var2336 = protoModule.readFixed64(p111, var2315)
			local _ = var2335
			var2315 = var2336
		else
			error("Unsupported wire type: " .. var2316)
		end
	end
	return var2314
end

function t_55:jsonEncode() --[[ line: 14319 ]]
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

function t_55:jsonDecode() --[[ line: 14341 ]]
	-- upvalues: t_55 (ref)
	local var2338 = t_55.new()
	
	if self.prompt_id ~= nil then
		var2338.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2338.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2338.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2338.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var2338.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2338.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var2338.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var2338.audit_data = self.auditData
	end
	return var2338
end

t_55.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_55
typeRegistryModule.default:register(t.DialogInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p112) --[[ line: 14393 ]]
	-- upvalues: t_56 (ref)
	return setmetatable({
		sender_count = if p112 == nil or p112.sender_count == nil then 0 else p112.sender_count,
		total_robux_amount = if p112 == nil or p112.total_robux_amount == nil then 0 else p112.total_robux_amount
	}, t_56)
end

function t_56:encode() --[[ line: 14400 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2340 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var2341, var2342 = protoModule.writeTag(buff, var2340, 1, protoModule.wireTypes.varint)
		var2341, var2342 = protoModule.writeVarInt(var2341, var2342, self.sender_count)
		buff = var2341
		var2340 = var2342
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var2343, var2344 = protoModule.writeTag(buff, var2340, 2, protoModule.wireTypes.varint)
		var2343, var2344 = protoModule.writeVarInt(var2343, var2344, self.total_robux_amount)
		buff = var2343
		var2340 = var2344
	end
	local buff_1 = buffer.create(var2340)
	buffer.copy(buff_1, 0, buff, 0, var2340)
	
	return buff_1
end

function t_56.decode(p113) --[[ line: 14419 ]]
	-- upvalues: t_56 (ref), protoModule (ref)
	local var2346 = t_56.new()
	local var2347 = 0
	while var2347 < buffer.len(p113) do
		local _ = nil
		local _ = nil
		local var2348, var2349, var2350 = protoModule.readTag(p113, var2347)
		local var2351 = var2348
		local var2352 = var2349
		var2347 = var2350
		
		if var2352 == protoModule.wireTypes.varint then
			if var2351 == 1 then
				local _ = nil
				local var2353, var2354 = protoModule.readVarIntI32(p113, var2347)
				var2347 = var2354
				var2346.sender_count = var2353
			elseif var2351 == 2 then
				local _ = nil
				local var2355, var2356 = protoModule.readVarIntI64(p113, var2347)
				var2347 = var2356
				var2346.total_robux_amount = var2355
			else
				local _ = nil
				local var2357, var2358 = protoModule.readVarInt(p113, var2347)
				local _ = var2357
				var2347 = var2358
			end
		elseif var2352 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2359, var2360 = protoModule.readVarInt(p113, var2347)
			var2347 = var2360 + var2359
		elseif var2352 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2361, var2362 = protoModule.readFixed32(p113, var2347)
			local _ = var2361
			var2347 = var2362
		elseif var2352 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2363, var2364 = protoModule.readFixed64(p113, var2347)
			local _ = var2363
			var2347 = var2364
		else
			error("Unsupported wire type: " .. var2352)
		end
	end
	return var2346
end

function t_56:jsonEncode() --[[ line: 14467 ]]
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_56:jsonDecode() --[[ line: 14481 ]]
	-- upvalues: t_56 (ref)
	local var2366 = t_56.new()
	
	if self.sender_count ~= nil then
		var2366.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var2366.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var2366.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var2366.total_robux_amount = self.totalRobuxAmount
	end
	return var2366
end

t_56.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_56
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p114) --[[ line: 14517 ]]
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

function t_57:encode() --[[ line: 14530 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2368 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2369, var2370 = protoModule.writeTag(buff, var2368, 1, protoModule.wireTypes.lengthDelimited)
		var2369, var2370 = protoModule.writeString(var2369, var2370, self.title)
		buff = var2369
		var2368 = var2370
	end
	if self.description ~= nil and self.description ~= "" then
		local var2371, var2372 = protoModule.writeTag(buff, var2368, 2, protoModule.wireTypes.lengthDelimited)
		var2371, var2372 = protoModule.writeString(var2371, var2372, self.description)
		buff = var2371
		var2368 = var2372
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var2373, var2374 = protoModule.writeTag(buff, var2368, 3, protoModule.wireTypes.lengthDelimited)
		var2373, var2374 = protoModule.writeString(var2373, var2374, self.primary_text)
		buff = var2373
		var2368 = var2374
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var2375, var2376 = protoModule.writeTag(buff, var2368, 4, protoModule.wireTypes.lengthDelimited)
		var2375, var2376 = protoModule.writeString(var2375, var2376, self.secondary_text)
		buff = var2375
		var2368 = var2376
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2377, var2378 = protoModule.writeTag(buff, var2368, 5, protoModule.wireTypes.lengthDelimited)
		var2377, var2378 = protoModule.writeString(var2377, var2378, self.prompt_id)
		buff = var2377
		var2368 = var2378
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2379, var2380 = protoModule.writeTag(buff, var2368, 6, protoModule.wireTypes.lengthDelimited)
		var2379, var2380 = protoModule.writeString(var2379, var2380, self.prompt_type)
		buff = var2379
		var2368 = var2380
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var2381, var2382 = protoModule.writeTag(buff, var2368, 7, protoModule.wireTypes.varint)
		var2381, var2382 = protoModule.writeVarInt(var2381, var2382, self.times_seen)
		buff = var2381
		var2368 = var2382
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var2383 = self.content.value:encode()
		local var2384, var2385 = protoModule.writeTag(buff, var2368, 8, protoModule.wireTypes.lengthDelimited)
		var2384, var2385 = protoModule.writeBuffer(var2384, var2385, var2383, buffer.len(var2383))
		buff = var2384
		var2368 = var2385
	end
	local buff_1 = buffer.create(var2368)
	buffer.copy(buff_1, 0, buff, 0, var2368)
	
	return buff_1
end

function t_57.decode(p115) --[[ line: 14582 ]]
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var2387 = t_57.new()
	local var2388 = 0
	while var2388 < buffer.len(p115) do
		local _ = nil
		local var2389 = nil
		local var2390, var2391, var2392 = protoModule.readTag(p115, var2388)
		local var2393 = var2390
		var2389 = var2391
		var2388 = var2392
		
		if var2389 == protoModule.wireTypes.varint then
			if var2393 == 7 then
				local _ = nil
				local var2394, var2395 = protoModule.readVarIntI32(p115, var2388)
				var2388 = var2395
				var2387.times_seen = var2394
			else
				local _ = nil
				local var2396, var2397 = protoModule.readVarInt(p115, var2388)
				local _ = var2396
				var2388 = var2397
			end
		end
		if var2389 == protoModule.wireTypes.lengthDelimited then
			if var2393 == 1 then
				local _ = nil
				local var2398, var2399 = protoModule.readBuffer(p115, var2388)
				var2388 = var2399
				var2387.title = buffer.tostring(var2398)
			elseif var2393 == 2 then
				local _ = nil
				local var2400, var2401 = protoModule.readBuffer(p115, var2388)
				var2388 = var2401
				var2387.description = buffer.tostring(var2400)
			elseif var2393 == 3 then
				local _ = nil
				local var2402, var2403 = protoModule.readBuffer(p115, var2388)
				var2388 = var2403
				var2387.primary_text = buffer.tostring(var2402)
			elseif var2393 == 4 then
				local _ = nil
				local var2404, var2405 = protoModule.readBuffer(p115, var2388)
				var2388 = var2405
				var2387.secondary_text = buffer.tostring(var2404)
			elseif var2393 == 5 then
				local _ = nil
				local var2406, var2407 = protoModule.readBuffer(p115, var2388)
				var2388 = var2407
				var2387.prompt_id = buffer.tostring(var2406)
			elseif var2393 == 6 then
				local _ = nil
				local var2408, var2409 = protoModule.readBuffer(p115, var2388)
				var2388 = var2409
				var2387.prompt_type = buffer.tostring(var2408)
			elseif var2393 == 8 then
				local _ = nil
				local var2410, var2411 = protoModule.readBuffer(p115, var2388)
				var2388 = var2411
				var2387.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var2410)
				}
			else
				local _ = nil
				local var2412, var2413 = protoModule.readVarInt(p115, var2388)
				var2388 = var2413 + var2412
			end
		elseif var2389 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2414, var2415 = protoModule.readFixed32(p115, var2388)
			local _ = var2414
			var2388 = var2415
		elseif var2389 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2416, var2417 = protoModule.readFixed64(p115, var2388)
			local _ = var2416
			var2388 = var2417
		else
			error("Unsupported wire type: " .. var2389)
		end
	end
	return var2387
end

function t_57:jsonEncode() --[[ line: 14661 ]]
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

function t_57:jsonDecode() --[[ line: 14701 ]]
	-- upvalues: t_57 (ref), t (ref)
	local var2419 = t_57.new()
	
	if self.title ~= nil then
		var2419.title = self.title
	end
	if self.description ~= nil then
		var2419.description = self.description
	end
	if self.primary_text ~= nil then
		var2419.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var2419.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var2419.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var2419.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var2419.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2419.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2419.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2419.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var2419.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var2419.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var2419.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var2419.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var2419
end

t_57.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_57
typeRegistryModule.default:register(t.BannerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p116) --[[ line: 14783 ]]
	-- upvalues: t_58 (ref)
	return setmetatable({
		tooltip_text = if p116 == nil or p116.tooltip_text == nil then "" else p116.tooltip_text,
		prompt_id = if p116 == nil or p116.prompt_id == nil then "" else p116.prompt_id,
		prompt_type = if p116 == nil or p116.prompt_type == nil then "" else p116.prompt_type
	}, t_58)
end

function t_58:encode() --[[ line: 14791 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2421 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var2422, var2423 = protoModule.writeTag(buff, var2421, 1, protoModule.wireTypes.lengthDelimited)
		var2422, var2423 = protoModule.writeString(var2422, var2423, self.tooltip_text)
		buff = var2422
		var2421 = var2423
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2424, var2425 = protoModule.writeTag(buff, var2421, 2, protoModule.wireTypes.lengthDelimited)
		var2424, var2425 = protoModule.writeString(var2424, var2425, self.prompt_id)
		buff = var2424
		var2421 = var2425
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2426, var2427 = protoModule.writeTag(buff, var2421, 3, protoModule.wireTypes.lengthDelimited)
		var2426, var2427 = protoModule.writeString(var2426, var2427, self.prompt_type)
		buff = var2426
		var2421 = var2427
	end
	local buff_1 = buffer.create(var2421)
	buffer.copy(buff_1, 0, buff, 0, var2421)
	
	return buff_1
end

function t_58.decode(p117) --[[ line: 14815 ]]
	-- upvalues: t_58 (ref), protoModule (ref)
	local var2429 = t_58.new()
	local var2430 = 0
	while var2430 < buffer.len(p117) do
		local _ = nil
		local var2431 = nil
		local var2432, var2433, var2434 = protoModule.readTag(p117, var2430)
		local var2435 = var2432
		var2431 = var2433
		var2430 = var2434
		
		if var2431 == protoModule.wireTypes.varint then
			local _ = nil
			local var2436, var2437 = protoModule.readVarInt(p117, var2430)
			local _ = var2436
			var2430 = var2437
			continue
		end
		if var2431 == protoModule.wireTypes.lengthDelimited then
			if var2435 == 1 then
				local _ = nil
				local var2438, var2439 = protoModule.readBuffer(p117, var2430)
				var2430 = var2439
				var2429.tooltip_text = buffer.tostring(var2438)
			elseif var2435 == 2 then
				local _ = nil
				local var2440, var2441 = protoModule.readBuffer(p117, var2430)
				var2430 = var2441
				var2429.prompt_id = buffer.tostring(var2440)
			elseif var2435 == 3 then
				local _ = nil
				local var2442, var2443 = protoModule.readBuffer(p117, var2430)
				var2430 = var2443
				var2429.prompt_type = buffer.tostring(var2442)
			else
				local _ = nil
				local var2444, var2445 = protoModule.readVarInt(p117, var2430)
				var2430 = var2445 + var2444
			end
		elseif var2431 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2446, var2447 = protoModule.readFixed32(p117, var2430)
			local _ = var2446
			var2430 = var2447
		elseif var2431 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2448, var2449 = protoModule.readFixed64(p117, var2430)
			local _ = var2448
			var2430 = var2449
		else
			error("Unsupported wire type: " .. var2431)
		end
	end
	return var2429
end

function t_58:jsonEncode() --[[ line: 14868 ]]
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

function t_58:jsonDecode() --[[ line: 14886 ]]
	-- upvalues: t_58 (ref)
	local var2451 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var2451.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var2451.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var2451.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2451.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2451.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2451.prompt_type = self.promptType
	end
	return var2451
end

t_58.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_58
typeRegistryModule.default:register(t.TooltipInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p118) --[[ line: 14930 ]]
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

function t_59:encode() --[[ line: 14941 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2453 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var2454, var2455 = protoModule.writeTag(buff, var2453, 1, protoModule.wireTypes.lengthDelimited)
		var2454, var2455 = protoModule.writeString(var2454, var2455, self.media_id)
		buff = var2454
		var2453 = var2455
	end
	if self.title ~= nil and self.title ~= "" then
		local var2456, var2457 = protoModule.writeTag(buff, var2453, 2, protoModule.wireTypes.lengthDelimited)
		var2456, var2457 = protoModule.writeString(var2456, var2457, self.title)
		buff = var2456
		var2453 = var2457
	end
	if self.description ~= nil and self.description ~= "" then
		local var2458, var2459 = protoModule.writeTag(buff, var2453, 3, protoModule.wireTypes.lengthDelimited)
		var2458, var2459 = protoModule.writeString(var2458, var2459, self.description)
		buff = var2458
		var2453 = var2459
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2460, var2461 = protoModule.writeTag(buff, var2453, 4, protoModule.wireTypes.lengthDelimited)
		var2460, var2461 = protoModule.writeString(var2460, var2461, self.prompt_id)
		buff = var2460
		var2453 = var2461
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2462, var2463 = protoModule.writeTag(buff, var2453, 5, protoModule.wireTypes.lengthDelimited)
		var2462, var2463 = protoModule.writeString(var2462, var2463, self.prompt_type)
		buff = var2462
		var2453 = var2463
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var2464, var2465 = protoModule.writeTag(buff, var2453, 6, protoModule.wireTypes.lengthDelimited)
		var2464, var2465 = protoModule.writeString(var2464, var2465, self.anchor_tag)
		buff = var2464
		var2453 = var2465
	end
	local buff_1 = buffer.create(var2453)
	buffer.copy(buff_1, 0, buff, 0, var2453)
	
	return buff_1
end

function t_59.decode(p119) --[[ line: 14980 ]]
	-- upvalues: t_59 (ref), protoModule (ref)
	local var2467 = t_59.new()
	local var2468 = 0
	while var2468 < buffer.len(p119) do
		local _ = nil
		local var2469 = nil
		local var2470, var2471, var2472 = protoModule.readTag(p119, var2468)
		local var2473 = var2470
		var2469 = var2471
		var2468 = var2472
		
		if var2469 == protoModule.wireTypes.varint then
			local _ = nil
			local var2474, var2475 = protoModule.readVarInt(p119, var2468)
			local _ = var2474
			var2468 = var2475
			continue
		end
		if var2469 == protoModule.wireTypes.lengthDelimited then
			if var2473 == 1 then
				local _ = nil
				local var2476, var2477 = protoModule.readBuffer(p119, var2468)
				var2468 = var2477
				var2467.media_id = buffer.tostring(var2476)
			elseif var2473 == 2 then
				local _ = nil
				local var2478, var2479 = protoModule.readBuffer(p119, var2468)
				var2468 = var2479
				var2467.title = buffer.tostring(var2478)
			elseif var2473 == 3 then
				local _ = nil
				local var2480, var2481 = protoModule.readBuffer(p119, var2468)
				var2468 = var2481
				var2467.description = buffer.tostring(var2480)
			elseif var2473 == 4 then
				local _ = nil
				local var2482, var2483 = protoModule.readBuffer(p119, var2468)
				var2468 = var2483
				var2467.prompt_id = buffer.tostring(var2482)
			elseif var2473 == 5 then
				local _ = nil
				local var2484, var2485 = protoModule.readBuffer(p119, var2468)
				var2468 = var2485
				var2467.prompt_type = buffer.tostring(var2484)
			elseif var2473 == 6 then
				local _ = nil
				local var2486, var2487 = protoModule.readBuffer(p119, var2468)
				var2468 = var2487
				var2467.anchor_tag = buffer.tostring(var2486)
			else
				local _ = nil
				local var2488, var2489 = protoModule.readVarInt(p119, var2468)
				var2468 = var2489 + var2488
			end
		elseif var2469 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2490, var2491 = protoModule.readFixed32(p119, var2468)
			local _ = var2490
			var2468 = var2491
		elseif var2469 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2492, var2493 = protoModule.readFixed64(p119, var2468)
			local _ = var2492
			var2468 = var2493
		else
			error("Unsupported wire type: " .. var2469)
		end
	end
	return var2467
end

function t_59:jsonEncode() --[[ line: 15048 ]]
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

function t_59:jsonDecode() --[[ line: 15078 ]]
	-- upvalues: t_59 (ref)
	local var2495 = t_59.new()
	
	if self.media_id ~= nil then
		var2495.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var2495.media_id = self.mediaId
	end
	if self.title ~= nil then
		var2495.title = self.title
	end
	if self.description ~= nil then
		var2495.description = self.description
	end
	if self.prompt_id ~= nil then
		var2495.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2495.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2495.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2495.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var2495.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var2495.anchor_tag = self.anchorTag
	end
	return var2495
end

t_59.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_59
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p120) --[[ line: 15138 ]]
	-- upvalues: t_60 (ref)
	return setmetatable({
		prompt_id = if p120 == nil or p120.prompt_id == nil then "" else p120.prompt_id,
		prompt_type = if p120 == nil or p120.prompt_type == nil then "" else p120.prompt_type
	}, t_60)
end

function t_60:encode() --[[ line: 15145 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2497 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2498, var2499 = protoModule.writeTag(buff, var2497, 1, protoModule.wireTypes.lengthDelimited)
		var2498, var2499 = protoModule.writeString(var2498, var2499, self.prompt_id)
		buff = var2498
		var2497 = var2499
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2500, var2501 = protoModule.writeTag(buff, var2497, 2, protoModule.wireTypes.lengthDelimited)
		var2500, var2501 = protoModule.writeString(var2500, var2501, self.prompt_type)
		buff = var2500
		var2497 = var2501
	end
	local buff_1 = buffer.create(var2497)
	buffer.copy(buff_1, 0, buff, 0, var2497)
	
	return buff_1
end

function t_60.decode(p121) --[[ line: 15164 ]]
	-- upvalues: t_60 (ref), protoModule (ref)
	local var2503 = t_60.new()
	local var2504 = 0
	while var2504 < buffer.len(p121) do
		local _ = nil
		local var2505 = nil
		local var2506, var2507, var2508 = protoModule.readTag(p121, var2504)
		local var2509 = var2506
		var2505 = var2507
		var2504 = var2508
		
		if var2505 == protoModule.wireTypes.varint then
			local _ = nil
			local var2510, var2511 = protoModule.readVarInt(p121, var2504)
			local _ = var2510
			var2504 = var2511
			continue
		end
		if var2505 == protoModule.wireTypes.lengthDelimited then
			if var2509 == 1 then
				local _ = nil
				local var2512, var2513 = protoModule.readBuffer(p121, var2504)
				var2504 = var2513
				var2503.prompt_id = buffer.tostring(var2512)
			elseif var2509 == 2 then
				local _ = nil
				local var2514, var2515 = protoModule.readBuffer(p121, var2504)
				var2504 = var2515
				var2503.prompt_type = buffer.tostring(var2514)
			else
				local _ = nil
				local var2516, var2517 = protoModule.readVarInt(p121, var2504)
				var2504 = var2517 + var2516
			end
		elseif var2505 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2518, var2519 = protoModule.readFixed32(p121, var2504)
			local _ = var2518
			var2504 = var2519
		elseif var2505 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2520, var2521 = protoModule.readFixed64(p121, var2504)
			local _ = var2520
			var2504 = var2521
		else
			error("Unsupported wire type: " .. var2505)
		end
	end
	return var2503
end

function t_60:jsonEncode() --[[ line: 15212 ]]
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_60:jsonDecode() --[[ line: 15226 ]]
	-- upvalues: t_60 (ref)
	local var2523 = t_60.new()
	
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

t_60.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_60
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p122) --[[ line: 15262 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		upsell_prompt = if p122 == nil or p122.upsell_prompt == nil then "" else p122.upsell_prompt
	}, t_61)
end

function t_61:encode() --[[ line: 15268 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2525 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2526, var2527 = protoModule.writeTag(buff, var2525, 1, protoModule.wireTypes.lengthDelimited)
		var2526, var2527 = protoModule.writeString(var2526, var2527, self.upsell_prompt)
		buff = var2526
		var2525 = var2527
	end
	local buff_1 = buffer.create(var2525)
	buffer.copy(buff_1, 0, buff, 0, var2525)
	
	return buff_1
end

function t_61.decode(p123) --[[ line: 15282 ]]
	-- upvalues: t_61 (ref), protoModule (ref)
	local var2529 = t_61.new()
	local var2530 = 0
	while var2530 < buffer.len(p123) do
		local _ = nil
		local var2531 = nil
		local var2532, var2533, var2534 = protoModule.readTag(p123, var2530)
		local var2535 = var2532
		var2531 = var2533
		var2530 = var2534
		
		if var2531 == protoModule.wireTypes.varint then
			local _ = nil
			local var2536, var2537 = protoModule.readVarInt(p123, var2530)
			local _ = var2536
			var2530 = var2537
			continue
		end
		if var2531 == protoModule.wireTypes.lengthDelimited then
			if var2535 == 1 then
				local _ = nil
				local var2538, var2539 = protoModule.readBuffer(p123, var2530)
				var2530 = var2539
				var2529.upsell_prompt = buffer.tostring(var2538)
			else
				local _ = nil
				local var2540, var2541 = protoModule.readVarInt(p123, var2530)
				var2530 = var2541 + var2540
			end
		elseif var2531 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2542, var2543 = protoModule.readFixed32(p123, var2530)
			local _ = var2542
			var2530 = var2543
		elseif var2531 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2544, var2545 = protoModule.readFixed64(p123, var2530)
			local _ = var2544
			var2530 = var2545
		else
			error("Unsupported wire type: " .. var2531)
		end
	end
	return var2529
end

function t_61:jsonEncode() --[[ line: 15325 ]]
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_61:jsonDecode() --[[ line: 15335 ]]
	-- upvalues: t_61 (ref)
	local var2547 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var2547.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var2547.upsell_prompt = self.upsellPrompt
	end
	return var2547
end

t_61.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_61
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p124) --[[ line: 15363 ]]
	-- upvalues: t_62 (ref)
	return setmetatable({
		modal_variant = if p124 == nil or p124.modal_variant == nil then "" else p124.modal_variant,
		modal_sequence = if p124 == nil or p124.modal_sequence == nil then "" else p124.modal_sequence,
		conversation_id = if p124 == nil or p124.conversation_id == nil then "" else p124.conversation_id,
		friend_id = if p124 == nil or p124.friend_id == nil then "" else p124.friend_id
	}, t_62)
end

function t_62:encode() --[[ line: 15374 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2549 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2550, var2551 = protoModule.writeTag(buff, var2549, 1, protoModule.wireTypes.lengthDelimited)
		var2550, var2551 = protoModule.writeString(var2550, var2551, self.modal_variant)
		buff = var2550
		var2549 = var2551
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var2552, var2553 = protoModule.writeTag(buff, var2549, 2, protoModule.wireTypes.lengthDelimited)
		var2552, var2553 = protoModule.writeString(var2552, var2553, self.modal_sequence)
		buff = var2552
		var2549 = var2553
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var2554, var2555 = protoModule.writeTag(buff, var2549, 3, protoModule.wireTypes.lengthDelimited)
		var2554, var2555 = protoModule.writeString(var2554, var2555, self.conversation_id)
		buff = var2554
		var2549 = var2555
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var2556, var2557 = protoModule.writeTag(buff, var2549, 4, protoModule.wireTypes.lengthDelimited)
		var2556, var2557 = protoModule.writeString(var2556, var2557, self.friend_id)
		buff = var2556
		var2549 = var2557
	end
	local buff_1 = buffer.create(var2549)
	buffer.copy(buff_1, 0, buff, 0, var2549)
	
	return buff_1
end

function t_62.decode(p125) --[[ line: 15403 ]]
	-- upvalues: t_62 (ref), protoModule (ref)
	local var2559 = t_62.new()
	local var2560 = 0
	while var2560 < buffer.len(p125) do
		local _ = nil
		local var2561 = nil
		local var2562, var2563, var2564 = protoModule.readTag(p125, var2560)
		local var2565 = var2562
		var2561 = var2563
		var2560 = var2564
		
		if var2561 == protoModule.wireTypes.varint then
			local _ = nil
			local var2566, var2567 = protoModule.readVarInt(p125, var2560)
			local _ = var2566
			var2560 = var2567
			continue
		end
		if var2561 == protoModule.wireTypes.lengthDelimited then
			if var2565 == 1 then
				local _ = nil
				local var2568, var2569 = protoModule.readBuffer(p125, var2560)
				var2560 = var2569
				var2559.modal_variant = buffer.tostring(var2568)
			elseif var2565 == 2 then
				local _ = nil
				local var2570, var2571 = protoModule.readBuffer(p125, var2560)
				var2560 = var2571
				var2559.modal_sequence = buffer.tostring(var2570)
			elseif var2565 == 3 then
				local _ = nil
				local var2572, var2573 = protoModule.readBuffer(p125, var2560)
				var2560 = var2573
				var2559.conversation_id = buffer.tostring(var2572)
			elseif var2565 == 4 then
				local _ = nil
				local var2574, var2575 = protoModule.readBuffer(p125, var2560)
				var2560 = var2575
				var2559.friend_id = buffer.tostring(var2574)
			else
				local _ = nil
				local var2576, var2577 = protoModule.readVarInt(p125, var2560)
				var2560 = var2577 + var2576
			end
		elseif var2561 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2578, var2579 = protoModule.readFixed32(p125, var2560)
			local _ = var2578
			var2560 = var2579
		elseif var2561 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2580, var2581 = protoModule.readFixed64(p125, var2560)
			local _ = var2580
			var2560 = var2581
		else
			error("Unsupported wire type: " .. var2561)
		end
	end
	return var2559
end

function t_62:jsonEncode() --[[ line: 15461 ]]
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

function t_62:jsonDecode() --[[ line: 15483 ]]
	-- upvalues: t_62 (ref)
	local var2583 = t_62.new()
	
	if self.modal_variant ~= nil then
		var2583.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var2583.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var2583.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var2583.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var2583.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var2583.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var2583.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var2583.friend_id = self.friendId
	end
	return var2583
end

t_62.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_62
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p126) --[[ line: 15537 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p126 == nil or p126.event_id == nil then "" else p126.event_id,
		universe_id = if p126 == nil or p126.universe_id == nil then "" else p126.universe_id,
		entry_map = if p126 == nil or p126.entry_map == nil then {} else p126.entry_map,
		entry_order = if p126 == nil or p126.entry_order == nil then {} else p126.entry_order
	}, t_63)
end

function t_63:encode() --[[ line: 15548 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2585 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2586, var2587 = protoModule.writeTag(buff, var2585, 1, protoModule.wireTypes.lengthDelimited)
		var2586, var2587 = protoModule.writeString(var2586, var2587, self.event_id)
		buff = var2586
		var2585 = var2587
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2588, var2589 = protoModule.writeTag(buff, var2585, 2, protoModule.wireTypes.lengthDelimited)
		var2588, var2589 = protoModule.writeString(var2588, var2589, self.universe_id)
		buff = var2588
		var2585 = var2589
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2590, var2591 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2590, var2591 = protoModule.writeString(var2590, var2591, i)
			local var2592 = v:encode()
			var2591, var2593 = protoModule.writeTag(var2590, var2591, 2, protoModule.wireTypes.lengthDelimited)
			var2591, var2593 = protoModule.writeBuffer(var2591, var2593, var2592, buffer.len(var2592))
			local var2594 = var2591
			local var2595 = var2593
			local var2596, var2597 = protoModule.writeTag(buff, var2585, 3, protoModule.wireTypes.lengthDelimited)
			var2596, var2597 = protoModule.writeBuffer(var2596, var2597, var2594, var2595)
			buff = var2596
			var2585 = var2597
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2598, var2599 = protoModule.writeTag(buff, var2585, 4, protoModule.wireTypes.lengthDelimited)
			var2598, var2599 = protoModule.writeString(var2598, var2599, v)
			buff = var2598
			var2585 = var2599
		end
	end
	local buff_1 = buffer.create(var2585)
	buffer.copy(buff_1, 0, buff, 0, var2585)
	
	return buff_1
end

function t_63.decode(p127) --[[ line: 15588 ]]
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2601 = t_63.new()
	local var2602 = 0
	while var2602 < buffer.len(p127) do
		local _ = nil
		local var2603 = nil
		local var2604, var2605, var2606 = protoModule.readTag(p127, var2602)
		local var2607 = var2604
		var2603 = var2605
		var2602 = var2606
		
		if var2603 == protoModule.wireTypes.varint then
			local _ = nil
			local var2608, var2609 = protoModule.readVarInt(p127, var2602)
			local _ = var2608
			var2602 = var2609
			continue
		end
		if var2603 == protoModule.wireTypes.lengthDelimited then
			if var2607 == 1 then
				local _ = nil
				local var2610, var2611 = protoModule.readBuffer(p127, var2602)
				var2602 = var2611
				var2601.event_id = buffer.tostring(var2610)
			elseif var2607 == 2 then
				local _ = nil
				local var2612, var2613 = protoModule.readBuffer(p127, var2602)
				var2602 = var2613
				var2601.universe_id = buffer.tostring(var2612)
			elseif var2607 == 3 then
				local _ = nil
				local var2614, var2615 = protoModule.readBuffer(p127, var2602)
				var2602 = var2615
				var2614 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var2614)
				var2601.entry_map[var2614.key or ""] = var2614.value or t.FeedEntry.new()
			elseif var2607 == 4 then
				local _ = nil
				local var2616, var2617 = protoModule.readBuffer(p127, var2602)
				var2602 = var2617
				table.insert(var2601.entry_order, buffer.tostring(var2616))
			else
				local _ = nil
				local var2618, var2619 = protoModule.readVarInt(p127, var2602)
				var2602 = var2619 + var2618
			end
		elseif var2603 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2620, var2621 = protoModule.readFixed32(p127, var2602)
			local _ = var2620
			var2602 = var2621
		elseif var2603 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2622, var2623 = protoModule.readFixed64(p127, var2602)
			local _ = var2622
			var2602 = var2623
		else
			error("Unsupported wire type: " .. var2603)
		end
	end
	return var2601
end

function t_63:jsonEncode() --[[ line: 15653 ]]
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

function t_63:jsonDecode() --[[ line: 15683 ]]
	-- upvalues: t_63 (ref), t (ref)
	local var2627 = t_63.new()
	
	if self.event_id ~= nil then
		var2627.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2627.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2627.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2627.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2627.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2627.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2627.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2627.entry_order = t_1
	end
	return var2627
end

t_63.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_63
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p128) --[[ line: 15755 ]]
	-- upvalues: t_64 (ref)
	return setmetatable({
		key = if p128 == nil or p128.key == nil then "" else p128.key,
		value = if p128 == nil or p128.value == nil then nil else p128.value
	}, t_64)
end

function t_64:encode() --[[ line: 15764 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2633 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2634, var2635 = protoModule.writeTag(buff, var2633, 1, protoModule.wireTypes.lengthDelimited)
		var2634, var2635 = protoModule.writeString(var2634, var2635, self.key)
		buff = var2634
		var2633 = var2635
	end
	if self.value ~= nil then
		local var2636 = self.value:encode()
		local var2637, var2638 = protoModule.writeTag(buff, var2633, 2, protoModule.wireTypes.lengthDelimited)
		var2637, var2638 = protoModule.writeBuffer(var2637, var2638, var2636, buffer.len(var2636))
		buff = var2637
		var2633 = var2638
	end
	local buff_1 = buffer.create(var2633)
	buffer.copy(buff_1, 0, buff, 0, var2633)
	
	return buff_1
end

function t_64.decode(p129) --[[ line: 15784 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2640 = t_64.new()
	local var2641 = 0
	while var2641 < buffer.len(p129) do
		local _ = nil
		local var2642 = nil
		local var2643, var2644, var2645 = protoModule.readTag(p129, var2641)
		local var2646 = var2643
		var2642 = var2644
		var2641 = var2645
		
		if var2642 == protoModule.wireTypes.varint then
			local _ = nil
			local var2647, var2648 = protoModule.readVarInt(p129, var2641)
			local _ = var2647
			var2641 = var2648
			continue
		end
		if var2642 == protoModule.wireTypes.lengthDelimited then
			if var2646 == 1 then
				local _ = nil
				local var2649, var2650 = protoModule.readBuffer(p129, var2641)
				var2641 = var2650
				var2640.key = buffer.tostring(var2649)
			elseif var2646 == 2 then
				local _ = nil
				local var2651, var2652 = protoModule.readBuffer(p129, var2641)
				var2641 = var2652
				var2640.value = t.FeedEntry.decode(var2651)
			else
				local _ = nil
				local var2653, var2654 = protoModule.readVarInt(p129, var2641)
				var2641 = var2654 + var2653
			end
		elseif var2642 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2655, var2656 = protoModule.readFixed32(p129, var2641)
			local _ = var2655
			var2641 = var2656
		elseif var2642 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2657, var2658 = protoModule.readFixed64(p129, var2641)
			local _ = var2657
			var2641 = var2658
		else
			error("Unsupported wire type: " .. var2642)
		end
	end
	return var2640
end

function t_64:jsonEncode() --[[ line: 15832 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_64:jsonDecode() --[[ line: 15846 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2660 = t_64.new()
	
	if self.key ~= nil then
		var2660.key = self.key
	end
	if self.value ~= nil then
		var2660.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2660
end

t_64.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_64
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p130) --[[ line: 15876 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p130 == nil or p130.event_id == nil then "" else p130.event_id,
		universe_id = if p130 == nil or p130.universe_id == nil then "" else p130.universe_id
	}, t_65)
end

function t_65:encode() --[[ line: 15885 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2662 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2663, var2664 = protoModule.writeTag(buff, var2662, 1, protoModule.wireTypes.lengthDelimited)
		var2663, var2664 = protoModule.writeString(var2663, var2664, self.event_id)
		buff = var2663
		var2662 = var2664
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2665, var2666 = protoModule.writeTag(buff, var2662, 2, protoModule.wireTypes.lengthDelimited)
		var2665, var2666 = protoModule.writeString(var2665, var2666, self.universe_id)
		buff = var2665
		var2662 = var2666
	end
	local buff_1 = buffer.create(var2662)
	buffer.copy(buff_1, 0, buff, 0, var2662)
	
	return buff_1
end

function t_65.decode(p131) --[[ line: 15904 ]]
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2668 = t_65.new()
	local var2669 = 0
	while var2669 < buffer.len(p131) do
		local _ = nil
		local var2670 = nil
		local var2671, var2672, var2673 = protoModule.readTag(p131, var2669)
		local var2674 = var2671
		var2670 = var2672
		var2669 = var2673
		
		if var2670 == protoModule.wireTypes.varint then
			local _ = nil
			local var2675, var2676 = protoModule.readVarInt(p131, var2669)
			local _ = var2675
			var2669 = var2676
			continue
		end
		if var2670 == protoModule.wireTypes.lengthDelimited then
			if var2674 == 1 then
				local _ = nil
				local var2677, var2678 = protoModule.readBuffer(p131, var2669)
				var2669 = var2678
				var2668.event_id = buffer.tostring(var2677)
			elseif var2674 == 2 then
				local _ = nil
				local var2679, var2680 = protoModule.readBuffer(p131, var2669)
				var2669 = var2680
				var2668.universe_id = buffer.tostring(var2679)
			else
				local _ = nil
				local var2681, var2682 = protoModule.readVarInt(p131, var2669)
				var2669 = var2682 + var2681
			end
		elseif var2670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2683, var2684 = protoModule.readFixed32(p131, var2669)
			local _ = var2683
			var2669 = var2684
		elseif var2670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2685, var2686 = protoModule.readFixed64(p131, var2669)
			local _ = var2685
			var2669 = var2686
		else
			error("Unsupported wire type: " .. var2670)
		end
	end
	return var2668
end

function t_65:jsonEncode() --[[ line: 15952 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_65:jsonDecode() --[[ line: 15966 ]]
	-- upvalues: t_65 (ref)
	local var2688 = t_65.new()
	
	if self.event_id ~= nil then
		var2688.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2688.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2688.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2688.universe_id = self.universeId
	end
	return var2688
end

t_65.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_65
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p132) --[[ line: 16002 ]]
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p132 == nil or p132.event_id == nil then "" else p132.event_id
	}, t_66)
end

function t_66:encode() --[[ line: 16010 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2690 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2691, var2692 = protoModule.writeTag(buff, var2690, 1, protoModule.wireTypes.lengthDelimited)
		var2691, var2692 = protoModule.writeString(var2691, var2692, self.event_id)
		buff = var2691
		var2690 = var2692
	end
	local buff_1 = buffer.create(var2690)
	buffer.copy(buff_1, 0, buff, 0, var2690)
	
	return buff_1
end

function t_66.decode(p133) --[[ line: 16024 ]]
	-- upvalues: t_66 (ref), protoModule (ref)
	local var2694 = t_66.new()
	local var2695 = 0
	while var2695 < buffer.len(p133) do
		local _ = nil
		local var2696 = nil
		local var2697, var2698, var2699 = protoModule.readTag(p133, var2695)
		local var2700 = var2697
		var2696 = var2698
		var2695 = var2699
		
		if var2696 == protoModule.wireTypes.varint then
			local _ = nil
			local var2701, var2702 = protoModule.readVarInt(p133, var2695)
			local _ = var2701
			var2695 = var2702
			continue
		end
		if var2696 == protoModule.wireTypes.lengthDelimited then
			if var2700 == 1 then
				local _ = nil
				local var2703, var2704 = protoModule.readBuffer(p133, var2695)
				var2695 = var2704
				var2694.event_id = buffer.tostring(var2703)
			else
				local _ = nil
				local var2705, var2706 = protoModule.readVarInt(p133, var2695)
				var2695 = var2706 + var2705
			end
		elseif var2696 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2707, var2708 = protoModule.readFixed32(p133, var2695)
			local _ = var2707
			var2695 = var2708
		elseif var2696 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2709, var2710 = protoModule.readFixed64(p133, var2695)
			local _ = var2709
			var2695 = var2710
		else
			error("Unsupported wire type: " .. var2696)
		end
	end
	return var2694
end

function t_66:jsonEncode() --[[ line: 16067 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_66:jsonDecode() --[[ line: 16077 ]]
	-- upvalues: t_66 (ref)
	local var2712 = t_66.new()
	
	if self.event_id ~= nil then
		var2712.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2712.event_id = self.eventId
	end
	return var2712
end

t_66.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_66
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p134) --[[ line: 16105 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p134 == nil or p134.event_id == nil then "" else p134.event_id,
		universe_id = if p134 == nil or p134.universe_id == nil then "" else p134.universe_id
	}, t_67)
end

function t_67:encode() --[[ line: 16114 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2714 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2715, var2716 = protoModule.writeTag(buff, var2714, 1, protoModule.wireTypes.lengthDelimited)
		var2715, var2716 = protoModule.writeString(var2715, var2716, self.event_id)
		buff = var2715
		var2714 = var2716
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2717, var2718 = protoModule.writeTag(buff, var2714, 2, protoModule.wireTypes.lengthDelimited)
		var2717, var2718 = protoModule.writeString(var2717, var2718, self.universe_id)
		buff = var2717
		var2714 = var2718
	end
	local buff_1 = buffer.create(var2714)
	buffer.copy(buff_1, 0, buff, 0, var2714)
	
	return buff_1
end

function t_67.decode(p135) --[[ line: 16133 ]]
	-- upvalues: t_67 (ref), protoModule (ref)
	local var2720 = t_67.new()
	local var2721 = 0
	while var2721 < buffer.len(p135) do
		local _ = nil
		local var2722 = nil
		local var2723, var2724, var2725 = protoModule.readTag(p135, var2721)
		local var2726 = var2723
		var2722 = var2724
		var2721 = var2725
		
		if var2722 == protoModule.wireTypes.varint then
			local _ = nil
			local var2727, var2728 = protoModule.readVarInt(p135, var2721)
			local _ = var2727
			var2721 = var2728
			continue
		end
		if var2722 == protoModule.wireTypes.lengthDelimited then
			if var2726 == 1 then
				local _ = nil
				local var2729, var2730 = protoModule.readBuffer(p135, var2721)
				var2721 = var2730
				var2720.event_id = buffer.tostring(var2729)
			elseif var2726 == 2 then
				local _ = nil
				local var2731, var2732 = protoModule.readBuffer(p135, var2721)
				var2721 = var2732
				var2720.universe_id = buffer.tostring(var2731)
			else
				local _ = nil
				local var2733, var2734 = protoModule.readVarInt(p135, var2721)
				var2721 = var2734 + var2733
			end
		elseif var2722 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2735, var2736 = protoModule.readFixed32(p135, var2721)
			local _ = var2735
			var2721 = var2736
		elseif var2722 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2737, var2738 = protoModule.readFixed64(p135, var2721)
			local _ = var2737
			var2721 = var2738
		else
			error("Unsupported wire type: " .. var2722)
		end
	end
	return var2720
end

function t_67:jsonEncode() --[[ line: 16181 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_67:jsonDecode() --[[ line: 16195 ]]
	-- upvalues: t_67 (ref)
	local var2740 = t_67.new()
	
	if self.event_id ~= nil then
		var2740.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2740.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2740.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2740.universe_id = self.universeId
	end
	return var2740
end

t_67.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_67
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p136) --[[ line: 16231 ]]
	-- upvalues: t_68 (ref)
	return setmetatable({
		event_id = if p136 == nil or p136.event_id == nil then "" else p136.event_id
	}, t_68)
end

function t_68:encode() --[[ line: 16237 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2742 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2743, var2744 = protoModule.writeTag(buff, var2742, 1, protoModule.wireTypes.lengthDelimited)
		var2743, var2744 = protoModule.writeString(var2743, var2744, self.event_id)
		buff = var2743
		var2742 = var2744
	end
	local buff_1 = buffer.create(var2742)
	buffer.copy(buff_1, 0, buff, 0, var2742)
	
	return buff_1
end

function t_68.decode(p137) --[[ line: 16251 ]]
	-- upvalues: t_68 (ref), protoModule (ref)
	local var2746 = t_68.new()
	local var2747 = 0
	while var2747 < buffer.len(p137) do
		local _ = nil
		local var2748 = nil
		local var2749, var2750, var2751 = protoModule.readTag(p137, var2747)
		local var2752 = var2749
		var2748 = var2750
		var2747 = var2751
		
		if var2748 == protoModule.wireTypes.varint then
			local _ = nil
			local var2753, var2754 = protoModule.readVarInt(p137, var2747)
			local _ = var2753
			var2747 = var2754
			continue
		end
		if var2748 == protoModule.wireTypes.lengthDelimited then
			if var2752 == 1 then
				local _ = nil
				local var2755, var2756 = protoModule.readBuffer(p137, var2747)
				var2747 = var2756
				var2746.event_id = buffer.tostring(var2755)
			else
				local _ = nil
				local var2757, var2758 = protoModule.readVarInt(p137, var2747)
				var2747 = var2758 + var2757
			end
		elseif var2748 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2759, var2760 = protoModule.readFixed32(p137, var2747)
			local _ = var2759
			var2747 = var2760
		elseif var2748 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2761, var2762 = protoModule.readFixed64(p137, var2747)
			local _ = var2761
			var2747 = var2762
		else
			error("Unsupported wire type: " .. var2748)
		end
	end
	return var2746
end

function t_68:jsonEncode() --[[ line: 16294 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_68:jsonDecode() --[[ line: 16304 ]]
	-- upvalues: t_68 (ref)
	local var2764 = t_68.new()
	
	if self.event_id ~= nil then
		var2764.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2764.event_id = self.eventId
	end
	return var2764
end

t_68.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_68
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p138) --[[ line: 16332 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p138 == nil or p138.event_id == nil then "" else p138.event_id
	}, t_69)
end

function t_69:encode() --[[ line: 16340 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2766 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2767, var2768 = protoModule.writeTag(buff, var2766, 1, protoModule.wireTypes.lengthDelimited)
		var2767, var2768 = protoModule.writeString(var2767, var2768, self.event_id)
		buff = var2767
		var2766 = var2768
	end
	local buff_1 = buffer.create(var2766)
	buffer.copy(buff_1, 0, buff, 0, var2766)
	
	return buff_1
end

function t_69.decode(p139) --[[ line: 16354 ]]
	-- upvalues: t_69 (ref), protoModule (ref)
	local var2770 = t_69.new()
	local var2771 = 0
	while var2771 < buffer.len(p139) do
		local _ = nil
		local var2772 = nil
		local var2773, var2774, var2775 = protoModule.readTag(p139, var2771)
		local var2776 = var2773
		var2772 = var2774
		var2771 = var2775
		
		if var2772 == protoModule.wireTypes.varint then
			local _ = nil
			local var2777, var2778 = protoModule.readVarInt(p139, var2771)
			local _ = var2777
			var2771 = var2778
			continue
		end
		if var2772 == protoModule.wireTypes.lengthDelimited then
			if var2776 == 1 then
				local _ = nil
				local var2779, var2780 = protoModule.readBuffer(p139, var2771)
				var2771 = var2780
				var2770.event_id = buffer.tostring(var2779)
			else
				local _ = nil
				local var2781, var2782 = protoModule.readVarInt(p139, var2771)
				var2771 = var2782 + var2781
			end
		elseif var2772 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2783, var2784 = protoModule.readFixed32(p139, var2771)
			local _ = var2783
			var2771 = var2784
		elseif var2772 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2785, var2786 = protoModule.readFixed64(p139, var2771)
			local _ = var2785
			var2771 = var2786
		else
			error("Unsupported wire type: " .. var2772)
		end
	end
	return var2770
end

function t_69:jsonEncode() --[[ line: 16397 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_69:jsonDecode() --[[ line: 16407 ]]
	-- upvalues: t_69 (ref)
	local var2788 = t_69.new()
	
	if self.event_id ~= nil then
		var2788.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2788.event_id = self.eventId
	end
	return var2788
end

t_69.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_69
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p140) --[[ line: 16437 ]]
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p140 == nil or p140.event_id == nil then "" else p140.event_id,
		universe_id = if p140 == nil or p140.universe_id == nil then "" else p140.universe_id
	}, t_70)
end

function t_70:encode() --[[ line: 16446 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2790 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2791, var2792 = protoModule.writeTag(buff, var2790, 1, protoModule.wireTypes.lengthDelimited)
		var2791, var2792 = protoModule.writeString(var2791, var2792, self.event_id)
		buff = var2791
		var2790 = var2792
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2793, var2794 = protoModule.writeTag(buff, var2790, 2, protoModule.wireTypes.lengthDelimited)
		var2793, var2794 = protoModule.writeString(var2793, var2794, self.universe_id)
		buff = var2793
		var2790 = var2794
	end
	local buff_1 = buffer.create(var2790)
	buffer.copy(buff_1, 0, buff, 0, var2790)
	
	return buff_1
end

function t_70.decode(p141) --[[ line: 16465 ]]
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2796 = t_70.new()
	local var2797 = 0
	while var2797 < buffer.len(p141) do
		local _ = nil
		local var2798 = nil
		local var2799, var2800, var2801 = protoModule.readTag(p141, var2797)
		local var2802 = var2799
		var2798 = var2800
		var2797 = var2801
		
		if var2798 == protoModule.wireTypes.varint then
			local _ = nil
			local var2803, var2804 = protoModule.readVarInt(p141, var2797)
			local _ = var2803
			var2797 = var2804
			continue
		end
		if var2798 == protoModule.wireTypes.lengthDelimited then
			if var2802 == 1 then
				local _ = nil
				local var2805, var2806 = protoModule.readBuffer(p141, var2797)
				var2797 = var2806
				var2796.event_id = buffer.tostring(var2805)
			elseif var2802 == 2 then
				local _ = nil
				local var2807, var2808 = protoModule.readBuffer(p141, var2797)
				var2797 = var2808
				var2796.universe_id = buffer.tostring(var2807)
			else
				local _ = nil
				local var2809, var2810 = protoModule.readVarInt(p141, var2797)
				var2797 = var2810 + var2809
			end
		elseif var2798 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2811, var2812 = protoModule.readFixed32(p141, var2797)
			local _ = var2811
			var2797 = var2812
		elseif var2798 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2813, var2814 = protoModule.readFixed64(p141, var2797)
			local _ = var2813
			var2797 = var2814
		else
			error("Unsupported wire type: " .. var2798)
		end
	end
	return var2796
end

function t_70:jsonEncode() --[[ line: 16513 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_70:jsonDecode() --[[ line: 16527 ]]
	-- upvalues: t_70 (ref)
	local var2816 = t_70.new()
	
	if self.event_id ~= nil then
		var2816.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2816.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2816.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2816.universe_id = self.universeId
	end
	return var2816
end

t_70.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_70
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p142) --[[ line: 16565 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		entry_map = if p142 == nil or p142.entry_map == nil then {} else p142.entry_map,
		entry_order = if p142 == nil or p142.entry_order == nil then {} else p142.entry_order,
		next_page_token = if p142 == nil or p142.next_page_token == nil then "" else p142.next_page_token,
		sticky_filter_pills = if p142 == nil or p142.sticky_filter_pills == nil then nil else p142.sticky_filter_pills,
		applied_filters = if p142 == nil or p142.applied_filters == nil then "" else p142.applied_filters
	}, t_71)
end

function t_71:encode() --[[ line: 16577 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2818 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2819, var2820 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2819, var2820 = protoModule.writeString(var2819, var2820, i)
			local var2821 = v:encode()
			var2820, var2822 = protoModule.writeTag(var2819, var2820, 2, protoModule.wireTypes.lengthDelimited)
			var2820, var2822 = protoModule.writeBuffer(var2820, var2822, var2821, buffer.len(var2821))
			local var2823 = var2820
			local var2824 = var2822
			local var2825, var2826 = protoModule.writeTag(buff, var2818, 1, protoModule.wireTypes.lengthDelimited)
			var2825, var2826 = protoModule.writeBuffer(var2825, var2826, var2823, var2824)
			buff = var2825
			var2818 = var2826
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2827, var2828 = protoModule.writeTag(buff, var2818, 2, protoModule.wireTypes.lengthDelimited)
			var2827, var2828 = protoModule.writeString(var2827, var2828, v)
			buff = var2827
			var2818 = var2828
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2829, var2830 = protoModule.writeTag(buff, var2818, 3, protoModule.wireTypes.lengthDelimited)
		var2829, var2830 = protoModule.writeString(var2829, var2830, self.next_page_token)
		buff = var2829
		var2818 = var2830
	end
	if self.sticky_filter_pills ~= nil then
		local var2831 = self.sticky_filter_pills:encode()
		local var2832, var2833 = protoModule.writeTag(buff, var2818, 4, protoModule.wireTypes.lengthDelimited)
		var2832, var2833 = protoModule.writeBuffer(var2832, var2833, var2831, buffer.len(var2831))
		buff = var2832
		var2818 = var2833
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2834, var2835 = protoModule.writeTag(buff, var2818, 5, protoModule.wireTypes.lengthDelimited)
		var2834, var2835 = protoModule.writeString(var2834, var2835, self.applied_filters)
		buff = var2834
		var2818 = var2835
	end
	local buff_1 = buffer.create(var2818)
	buffer.copy(buff_1, 0, buff, 0, var2818)
	
	return buff_1
end

function t_71.decode(p143) --[[ line: 16623 ]]
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2837 = t_71.new()
	local var2838 = 0
	while var2838 < buffer.len(p143) do
		local _ = nil
		local var2839 = nil
		local var2840, var2841, var2842 = protoModule.readTag(p143, var2838)
		local var2843 = var2840
		var2839 = var2841
		var2838 = var2842
		
		if var2839 == protoModule.wireTypes.varint then
			local _ = nil
			local var2844, var2845 = protoModule.readVarInt(p143, var2838)
			local _ = var2844
			var2838 = var2845
			continue
		end
		if var2839 == protoModule.wireTypes.lengthDelimited then
			if var2843 == 1 then
				local _ = nil
				local var2846, var2847 = protoModule.readBuffer(p143, var2838)
				var2838 = var2847
				var2846 = t.ChartsFeedInputData_EntryMapEntry.decode(var2846)
				var2837.entry_map[var2846.key or ""] = var2846.value or t.FeedEntry.new()
			elseif var2843 == 2 then
				local _ = nil
				local var2848, var2849 = protoModule.readBuffer(p143, var2838)
				var2838 = var2849
				table.insert(var2837.entry_order, buffer.tostring(var2848))
			elseif var2843 == 3 then
				local _ = nil
				local var2850, var2851 = protoModule.readBuffer(p143, var2838)
				var2838 = var2851
				var2837.next_page_token = buffer.tostring(var2850)
			elseif var2843 == 4 then
				local _ = nil
				local var2852, var2853 = protoModule.readBuffer(p143, var2838)
				var2838 = var2853
				var2837.sticky_filter_pills = t.FilterPillsInputData.decode(var2852)
			elseif var2843 == 5 then
				local _ = nil
				local var2854, var2855 = protoModule.readBuffer(p143, var2838)
				var2838 = var2855
				var2837.applied_filters = buffer.tostring(var2854)
			else
				local _ = nil
				local var2856, var2857 = protoModule.readVarInt(p143, var2838)
				var2838 = var2857 + var2856
			end
		elseif var2839 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2858, var2859 = protoModule.readFixed32(p143, var2838)
			local _ = var2858
			var2838 = var2859
		elseif var2839 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2860, var2861 = protoModule.readFixed64(p143, var2838)
			local _ = var2860
			var2838 = var2861
		else
			error("Unsupported wire type: " .. var2839)
		end
	end
	return var2837
end

function t_71:jsonEncode() --[[ line: 16693 ]]
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

function t_71:jsonDecode() --[[ line: 16727 ]]
	-- upvalues: t_71 (ref), t (ref)
	local var2865 = t_71.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2865.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2865.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2865.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2865.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2865.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2865.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2865.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2865.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2865.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2865.applied_filters = self.appliedFilters
	end
	return var2865
end

t_71.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_71
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p144) --[[ line: 16807 ]]
	-- upvalues: t_72 (ref)
	return setmetatable({
		key = if p144 == nil or p144.key == nil then "" else p144.key,
		value = if p144 == nil or p144.value == nil then nil else p144.value
	}, t_72)
end

function t_72:encode() --[[ line: 16816 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2871 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2872, var2873 = protoModule.writeTag(buff, var2871, 1, protoModule.wireTypes.lengthDelimited)
		var2872, var2873 = protoModule.writeString(var2872, var2873, self.key)
		buff = var2872
		var2871 = var2873
	end
	if self.value ~= nil then
		local var2874 = self.value:encode()
		local var2875, var2876 = protoModule.writeTag(buff, var2871, 2, protoModule.wireTypes.lengthDelimited)
		var2875, var2876 = protoModule.writeBuffer(var2875, var2876, var2874, buffer.len(var2874))
		buff = var2875
		var2871 = var2876
	end
	local buff_1 = buffer.create(var2871)
	buffer.copy(buff_1, 0, buff, 0, var2871)
	
	return buff_1
end

function t_72.decode(p145) --[[ line: 16836 ]]
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2878 = t_72.new()
	local var2879 = 0
	while var2879 < buffer.len(p145) do
		local _ = nil
		local var2880 = nil
		local var2881, var2882, var2883 = protoModule.readTag(p145, var2879)
		local var2884 = var2881
		var2880 = var2882
		var2879 = var2883
		
		if var2880 == protoModule.wireTypes.varint then
			local _ = nil
			local var2885, var2886 = protoModule.readVarInt(p145, var2879)
			local _ = var2885
			var2879 = var2886
			continue
		end
		if var2880 == protoModule.wireTypes.lengthDelimited then
			if var2884 == 1 then
				local _ = nil
				local var2887, var2888 = protoModule.readBuffer(p145, var2879)
				var2879 = var2888
				var2878.key = buffer.tostring(var2887)
			elseif var2884 == 2 then
				local _ = nil
				local var2889, var2890 = protoModule.readBuffer(p145, var2879)
				var2879 = var2890
				var2878.value = t.FeedEntry.decode(var2889)
			else
				local _ = nil
				local var2891, var2892 = protoModule.readVarInt(p145, var2879)
				var2879 = var2892 + var2891
			end
		elseif var2880 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2893, var2894 = protoModule.readFixed32(p145, var2879)
			local _ = var2893
			var2879 = var2894
		elseif var2880 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2895, var2896 = protoModule.readFixed64(p145, var2879)
			local _ = var2895
			var2879 = var2896
		else
			error("Unsupported wire type: " .. var2880)
		end
	end
	return var2878
end

function t_72:jsonEncode() --[[ line: 16884 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_72:jsonDecode() --[[ line: 16898 ]]
	-- upvalues: t_72 (ref), t (ref)
	local var2898 = t_72.new()
	
	if self.key ~= nil then
		var2898.key = self.key
	end
	if self.value ~= nil then
		var2898.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2898
end

t_72.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_72
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p146) --[[ line: 16928 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		filter_groups = if p146 == nil or p146.filter_groups == nil then {} else p146.filter_groups,
		sort_id = if p146 == nil or p146.sort_id == nil then "" else p146.sort_id,
		secondary_sort_id = if p146 == nil or p146.secondary_sort_id == nil then 0 else p146.secondary_sort_id,
		title = if p146 == nil or p146.title == nil then "" else p146.title,
		primary_sort_id = if p146 == nil or p146.primary_sort_id == nil then nil else p146.primary_sort_id,
		applied_filters = if p146 == nil or p146.applied_filters == nil then nil else p146.applied_filters
	}, t_73)
end

function t_73:encode() --[[ line: 16939 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2900 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2901 = v:encode()
			local var2902, var2903 = protoModule.writeTag(buff, var2900, 1, protoModule.wireTypes.lengthDelimited)
			var2902, var2903 = protoModule.writeBuffer(var2902, var2903, var2901, buffer.len(var2901))
			buff = var2902
			var2900 = var2903
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2904, var2905 = protoModule.writeTag(buff, var2900, 2, protoModule.wireTypes.lengthDelimited)
		var2904, var2905 = protoModule.writeString(var2904, var2905, self.sort_id)
		buff = var2904
		var2900 = var2905
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2906, var2907 = protoModule.writeTag(buff, var2900, 3, protoModule.wireTypes.varint)
		var2906, var2907 = protoModule.writeVarInt(var2906, var2907, self.secondary_sort_id)
		buff = var2906
		var2900 = var2907
	end
	if self.title ~= nil and self.title ~= "" then
		local var2908, var2909 = protoModule.writeTag(buff, var2900, 4, protoModule.wireTypes.lengthDelimited)
		var2908, var2909 = protoModule.writeString(var2908, var2909, self.title)
		buff = var2908
		var2900 = var2909
	end
	if self.primary_sort_id ~= nil then
		local var2910, var2911 = protoModule.writeTag(buff, var2900, 5, protoModule.wireTypes.varint)
		var2910, var2911 = protoModule.writeVarInt(var2910, var2911, self.primary_sort_id)
		buff = var2910
		var2900 = var2911
	end
	if self.applied_filters ~= nil then
		local var2912, var2913 = protoModule.writeTag(buff, var2900, 6, protoModule.wireTypes.lengthDelimited)
		var2912, var2913 = protoModule.writeString(var2912, var2913, self.applied_filters)
		buff = var2912
		var2900 = var2913
	end
	local buff_1 = buffer.create(var2900)
	buffer.copy(buff_1, 0, buff, 0, var2900)
	
	return buff_1
end

function t_73.decode(p147) --[[ line: 16981 ]]
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2915 = t_73.new()
	local var2916 = 0
	while var2916 < buffer.len(p147) do
		local _ = nil
		local var2917 = nil
		local var2918, var2919, var2920 = protoModule.readTag(p147, var2916)
		local var2921 = var2918
		var2917 = var2919
		var2916 = var2920
		
		if var2917 == protoModule.wireTypes.varint then
			if var2921 == 3 then
				local _ = nil
				local var2922, var2923 = protoModule.readVarIntI32(p147, var2916)
				var2916 = var2923
				var2915.secondary_sort_id = var2922
			elseif var2921 == 5 then
				local _ = nil
				local var2924, var2925 = protoModule.readVarIntI32(p147, var2916)
				var2916 = var2925
				var2915.primary_sort_id = var2924
			else
				local _ = nil
				local var2926, var2927 = protoModule.readVarInt(p147, var2916)
				local _ = var2926
				var2916 = var2927
			end
		end
		if var2917 == protoModule.wireTypes.lengthDelimited then
			if var2921 == 1 then
				local _ = nil
				local var2928, var2929 = protoModule.readBuffer(p147, var2916)
				var2916 = var2929
				table.insert(var2915.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2928))
			elseif var2921 == 2 then
				local _ = nil
				local var2930, var2931 = protoModule.readBuffer(p147, var2916)
				var2916 = var2931
				var2915.sort_id = buffer.tostring(var2930)
			elseif var2921 == 4 then
				local _ = nil
				local var2932, var2933 = protoModule.readBuffer(p147, var2916)
				var2916 = var2933
				var2915.title = buffer.tostring(var2932)
			elseif var2921 == 6 then
				local _ = nil
				local var2934, var2935 = protoModule.readBuffer(p147, var2916)
				var2916 = var2935
				var2915.applied_filters = buffer.tostring(var2934)
			else
				local _ = nil
				local var2936, var2937 = protoModule.readVarInt(p147, var2916)
				var2916 = var2937 + var2936
			end
		elseif var2917 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2938, var2939 = protoModule.readFixed32(p147, var2916)
			local _ = var2938
			var2916 = var2939
		elseif var2917 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2940, var2941 = protoModule.readFixed64(p147, var2916)
			local _ = var2940
			var2916 = var2941
		else
			error("Unsupported wire type: " .. var2917)
		end
	end
	return var2915
end

function t_73:jsonEncode() --[[ line: 17049 ]]
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

function t_73:jsonDecode() --[[ line: 17083 ]]
	-- upvalues: t_73 (ref), t (ref)
	local var2944 = t_73.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2944.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2944.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2944.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2944.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2944.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2944.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2944.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2944.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2944.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2944.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2944.applied_filters = self.appliedFilters
	end
	return var2944
end

t_73.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_73
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p148) --[[ line: 17157 ]]
	-- upvalues: t_74 (ref)
	return setmetatable({
		filter_id = if p148 == nil or p148.filter_id == nil then "" else p148.filter_id,
		display_name = if p148 == nil or p148.display_name == nil then "" else p148.display_name,
		options = if p148 == nil or p148.options == nil then {} else p148.options,
		default_option_id = if p148 == nil or p148.default_option_id == nil then "" else p148.default_option_id,
		selected_option_id = if p148 == nil or p148.selected_option_id == nil then "" else p148.selected_option_id,
		filter_type = if p148 == nil or p148.filter_type == nil then "" else p148.filter_type,
		inactive_option_ids = if p148 == nil or p148.inactive_option_ids == nil then {} else p148.inactive_option_ids,
		info_text = if p148 == nil or p148.info_text == nil then "" else p148.info_text
	}, t_74)
end

function t_74:encode() --[[ line: 17174 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2948 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2949, var2950 = protoModule.writeTag(buff, var2948, 1, protoModule.wireTypes.lengthDelimited)
		var2949, var2950 = protoModule.writeString(var2949, var2950, self.filter_id)
		buff = var2949
		var2948 = var2950
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2951, var2952 = protoModule.writeTag(buff, var2948, 2, protoModule.wireTypes.lengthDelimited)
		var2951, var2952 = protoModule.writeString(var2951, var2952, self.display_name)
		buff = var2951
		var2948 = var2952
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2953 = v:encode()
			local var2954, var2955 = protoModule.writeTag(buff, var2948, 3, protoModule.wireTypes.lengthDelimited)
			var2954, var2955 = protoModule.writeBuffer(var2954, var2955, var2953, buffer.len(var2953))
			buff = var2954
			var2948 = var2955
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2956, var2957 = protoModule.writeTag(buff, var2948, 4, protoModule.wireTypes.lengthDelimited)
		var2956, var2957 = protoModule.writeString(var2956, var2957, self.default_option_id)
		buff = var2956
		var2948 = var2957
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2958, var2959 = protoModule.writeTag(buff, var2948, 5, protoModule.wireTypes.lengthDelimited)
		var2958, var2959 = protoModule.writeString(var2958, var2959, self.selected_option_id)
		buff = var2958
		var2948 = var2959
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2960, var2961 = protoModule.writeTag(buff, var2948, 6, protoModule.wireTypes.lengthDelimited)
		var2960, var2961 = protoModule.writeString(var2960, var2961, self.filter_type)
		buff = var2960
		var2948 = var2961
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2962, var2963 = protoModule.writeTag(buff, var2948, 7, protoModule.wireTypes.lengthDelimited)
			var2962, var2963 = protoModule.writeString(var2962, var2963, v)
			buff = var2962
			var2948 = var2963
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2964, var2965 = protoModule.writeTag(buff, var2948, 8, protoModule.wireTypes.lengthDelimited)
		var2964, var2965 = protoModule.writeString(var2964, var2965, self.info_text)
		buff = var2964
		var2948 = var2965
	end
	local buff_1 = buffer.create(var2948)
	buffer.copy(buff_1, 0, buff, 0, var2948)
	
	return buff_1
end

function t_74.decode(p149) --[[ line: 17228 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2967 = t_74.new()
	local var2968 = 0
	while var2968 < buffer.len(p149) do
		local _ = nil
		local var2969 = nil
		local var2970, var2971, var2972 = protoModule.readTag(p149, var2968)
		local var2973 = var2970
		var2969 = var2971
		var2968 = var2972
		
		if var2969 == protoModule.wireTypes.varint then
			local _ = nil
			local var2974, var2975 = protoModule.readVarInt(p149, var2968)
			local _ = var2974
			var2968 = var2975
			continue
		end
		if var2969 == protoModule.wireTypes.lengthDelimited then
			if var2973 == 1 then
				local _ = nil
				local var2976, var2977 = protoModule.readBuffer(p149, var2968)
				var2968 = var2977
				var2967.filter_id = buffer.tostring(var2976)
			elseif var2973 == 2 then
				local _ = nil
				local var2978, var2979 = protoModule.readBuffer(p149, var2968)
				var2968 = var2979
				var2967.display_name = buffer.tostring(var2978)
			elseif var2973 == 3 then
				local _ = nil
				local var2980, var2981 = protoModule.readBuffer(p149, var2968)
				var2968 = var2981
				table.insert(var2967.options, t.FilterPillsInputData_FilterOption.decode(var2980))
			elseif var2973 == 4 then
				local _ = nil
				local var2982, var2983 = protoModule.readBuffer(p149, var2968)
				var2968 = var2983
				var2967.default_option_id = buffer.tostring(var2982)
			elseif var2973 == 5 then
				local _ = nil
				local var2984, var2985 = protoModule.readBuffer(p149, var2968)
				var2968 = var2985
				var2967.selected_option_id = buffer.tostring(var2984)
			elseif var2973 == 6 then
				local _ = nil
				local var2986, var2987 = protoModule.readBuffer(p149, var2968)
				var2968 = var2987
				var2967.filter_type = buffer.tostring(var2986)
			elseif var2973 == 7 then
				local _ = nil
				local var2988, var2989 = protoModule.readBuffer(p149, var2968)
				var2968 = var2989
				table.insert(var2967.inactive_option_ids, buffer.tostring(var2988))
			elseif var2973 == 8 then
				local _ = nil
				local var2990, var2991 = protoModule.readBuffer(p149, var2968)
				var2968 = var2991
				var2967.info_text = buffer.tostring(var2990)
			else
				local _ = nil
				local var2992, var2993 = protoModule.readVarInt(p149, var2968)
				var2968 = var2993 + var2992
			end
		elseif var2969 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2994, var2995 = protoModule.readFixed32(p149, var2968)
			local _ = var2994
			var2968 = var2995
		elseif var2969 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2996, var2997 = protoModule.readFixed64(p149, var2968)
			local _ = var2996
			var2968 = var2997
		else
			error("Unsupported wire type: " .. var2969)
		end
	end
	return var2967
end

function t_74:jsonEncode() --[[ line: 17306 ]]
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

function t_74:jsonDecode() --[[ line: 17352 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var3001 = t_74.new()
	
	if self.filter_id ~= nil then
		var3001.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var3001.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var3001.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3001.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var3001.options = t_1
	end
	if self.default_option_id ~= nil then
		var3001.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var3001.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var3001.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var3001.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var3001.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var3001.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var3001.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var3001.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var3001.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var3001.info_text = self.infoText
	end
	return var3001
end

t_74.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_74
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p150) --[[ line: 17449 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		option_id = if p150 == nil or p150.option_id == nil then "" else p150.option_id,
		display_name = if p150 == nil or p150.display_name == nil then "" else p150.display_name,
		option_context_tag = if p150 == nil or p150.option_context_tag == nil then "" else p150.option_context_tag
	}, t_75)
end

function t_75:encode() --[[ line: 17459 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3006 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var3007, var3008 = protoModule.writeTag(buff, var3006, 1, protoModule.wireTypes.lengthDelimited)
		var3007, var3008 = protoModule.writeString(var3007, var3008, self.option_id)
		buff = var3007
		var3006 = var3008
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3009, var3010 = protoModule.writeTag(buff, var3006, 2, protoModule.wireTypes.lengthDelimited)
		var3009, var3010 = protoModule.writeString(var3009, var3010, self.display_name)
		buff = var3009
		var3006 = var3010
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var3011, var3012 = protoModule.writeTag(buff, var3006, 3, protoModule.wireTypes.lengthDelimited)
		var3011, var3012 = protoModule.writeString(var3011, var3012, self.option_context_tag)
		buff = var3011
		var3006 = var3012
	end
	local buff_1 = buffer.create(var3006)
	buffer.copy(buff_1, 0, buff, 0, var3006)
	
	return buff_1
end

function t_75.decode(p151) --[[ line: 17483 ]]
	-- upvalues: t_75 (ref), protoModule (ref)
	local var3014 = t_75.new()
	local var3015 = 0
	while var3015 < buffer.len(p151) do
		local _ = nil
		local var3016 = nil
		local var3017, var3018, var3019 = protoModule.readTag(p151, var3015)
		local var3020 = var3017
		var3016 = var3018
		var3015 = var3019
		
		if var3016 == protoModule.wireTypes.varint then
			local _ = nil
			local var3021, var3022 = protoModule.readVarInt(p151, var3015)
			local _ = var3021
			var3015 = var3022
			continue
		end
		if var3016 == protoModule.wireTypes.lengthDelimited then
			if var3020 == 1 then
				local _ = nil
				local var3023, var3024 = protoModule.readBuffer(p151, var3015)
				var3015 = var3024
				var3014.option_id = buffer.tostring(var3023)
			elseif var3020 == 2 then
				local _ = nil
				local var3025, var3026 = protoModule.readBuffer(p151, var3015)
				var3015 = var3026
				var3014.display_name = buffer.tostring(var3025)
			elseif var3020 == 3 then
				local _ = nil
				local var3027, var3028 = protoModule.readBuffer(p151, var3015)
				var3015 = var3028
				var3014.option_context_tag = buffer.tostring(var3027)
			else
				local _ = nil
				local var3029, var3030 = protoModule.readVarInt(p151, var3015)
				var3015 = var3030 + var3029
			end
		elseif var3016 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3031, var3032 = protoModule.readFixed32(p151, var3015)
			local _ = var3031
			var3015 = var3032
		elseif var3016 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3033, var3034 = protoModule.readFixed64(p151, var3015)
			local _ = var3033
			var3015 = var3034
		else
			error("Unsupported wire type: " .. var3016)
		end
	end
	return var3014
end

function t_75:jsonEncode() --[[ line: 17536 ]]
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

function t_75:jsonDecode() --[[ line: 17554 ]]
	-- upvalues: t_75 (ref)
	local var3036 = t_75.new()
	
	if self.option_id ~= nil then
		var3036.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var3036.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var3036.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3036.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var3036.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var3036.option_context_tag = self.optionContextTag
	end
	return var3036
end

t_75.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_75
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p152) --[[ line: 17600 ]]
	-- upvalues: t_76 (ref)
	return setmetatable({
		sort_options = if p152 == nil or p152.sort_options == nil then {} else p152.sort_options,
		selected_sort_id = if p152 == nil or p152.selected_sort_id == nil then "" else p152.selected_sort_id
	}, t_76)
end

function t_76:encode() --[[ line: 17607 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3038 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var3039 = v:encode()
			local var3040, var3041 = protoModule.writeTag(buff, var3038, 1, protoModule.wireTypes.lengthDelimited)
			var3040, var3041 = protoModule.writeBuffer(var3040, var3041, var3039, buffer.len(var3039))
			buff = var3040
			var3038 = var3041
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var3042, var3043 = protoModule.writeTag(buff, var3038, 2, protoModule.wireTypes.lengthDelimited)
		var3042, var3043 = protoModule.writeString(var3042, var3043, self.selected_sort_id)
		buff = var3042
		var3038 = var3043
	end
	local buff_1 = buffer.create(var3038)
	buffer.copy(buff_1, 0, buff, 0, var3038)
	
	return buff_1
end

function t_76.decode(p153) --[[ line: 17629 ]]
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var3045 = t_76.new()
	local var3046 = 0
	while var3046 < buffer.len(p153) do
		local _ = nil
		local var3047 = nil
		local var3048, var3049, var3050 = protoModule.readTag(p153, var3046)
		local var3051 = var3048
		var3047 = var3049
		var3046 = var3050
		
		if var3047 == protoModule.wireTypes.varint then
			local _ = nil
			local var3052, var3053 = protoModule.readVarInt(p153, var3046)
			local _ = var3052
			var3046 = var3053
			continue
		end
		if var3047 == protoModule.wireTypes.lengthDelimited then
			if var3051 == 1 then
				local _ = nil
				local var3054, var3055 = protoModule.readBuffer(p153, var3046)
				var3046 = var3055
				table.insert(var3045.sort_options, t.SortSelectorInputData_SortOption.decode(var3054))
			elseif var3051 == 2 then
				local _ = nil
				local var3056, var3057 = protoModule.readBuffer(p153, var3046)
				var3046 = var3057
				var3045.selected_sort_id = buffer.tostring(var3056)
			else
				local _ = nil
				local var3058, var3059 = protoModule.readVarInt(p153, var3046)
				var3046 = var3059 + var3058
			end
		elseif var3047 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3060, var3061 = protoModule.readFixed32(p153, var3046)
			local _ = var3060
			var3046 = var3061
		elseif var3047 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3062, var3063 = protoModule.readFixed64(p153, var3046)
			local _ = var3062
			var3046 = var3063
		else
			error("Unsupported wire type: " .. var3047)
		end
	end
	return var3045
end

function t_76:jsonEncode() --[[ line: 17677 ]]
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

function t_76:jsonDecode() --[[ line: 17695 ]]
	-- upvalues: t_76 (ref), t (ref)
	local var3066 = t_76.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3066.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3066.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var3066.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var3066.selected_sort_id = self.selectedSortId
	end
	return var3066
end

t_76.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_76
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p154) --[[ line: 17741 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		sort_id = if p154 == nil or p154.sort_id == nil then "" else p154.sort_id,
		display_name = if p154 == nil or p154.display_name == nil then "" else p154.display_name,
		content_type = if p154 == nil or p154.content_type == nil then "" else p154.content_type
	}, t_77)
end

function t_77:encode() --[[ line: 17751 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3070 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3071, var3072 = protoModule.writeTag(buff, var3070, 1, protoModule.wireTypes.lengthDelimited)
		var3071, var3072 = protoModule.writeString(var3071, var3072, self.sort_id)
		buff = var3071
		var3070 = var3072
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3073, var3074 = protoModule.writeTag(buff, var3070, 2, protoModule.wireTypes.lengthDelimited)
		var3073, var3074 = protoModule.writeString(var3073, var3074, self.display_name)
		buff = var3073
		var3070 = var3074
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var3075, var3076 = protoModule.writeTag(buff, var3070, 3, protoModule.wireTypes.lengthDelimited)
		var3075, var3076 = protoModule.writeString(var3075, var3076, self.content_type)
		buff = var3075
		var3070 = var3076
	end
	local buff_1 = buffer.create(var3070)
	buffer.copy(buff_1, 0, buff, 0, var3070)
	
	return buff_1
end

function t_77.decode(p155) --[[ line: 17775 ]]
	-- upvalues: t_77 (ref), protoModule (ref)
	local var3078 = t_77.new()
	local var3079 = 0
	while var3079 < buffer.len(p155) do
		local _ = nil
		local var3080 = nil
		local var3081, var3082, var3083 = protoModule.readTag(p155, var3079)
		local var3084 = var3081
		var3080 = var3082
		var3079 = var3083
		
		if var3080 == protoModule.wireTypes.varint then
			local _ = nil
			local var3085, var3086 = protoModule.readVarInt(p155, var3079)
			local _ = var3085
			var3079 = var3086
			continue
		end
		if var3080 == protoModule.wireTypes.lengthDelimited then
			if var3084 == 1 then
				local _ = nil
				local var3087, var3088 = protoModule.readBuffer(p155, var3079)
				var3079 = var3088
				var3078.sort_id = buffer.tostring(var3087)
			elseif var3084 == 2 then
				local _ = nil
				local var3089, var3090 = protoModule.readBuffer(p155, var3079)
				var3079 = var3090
				var3078.display_name = buffer.tostring(var3089)
			elseif var3084 == 3 then
				local _ = nil
				local var3091, var3092 = protoModule.readBuffer(p155, var3079)
				var3079 = var3092
				var3078.content_type = buffer.tostring(var3091)
			else
				local _ = nil
				local var3093, var3094 = protoModule.readVarInt(p155, var3079)
				var3079 = var3094 + var3093
			end
		elseif var3080 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3095, var3096 = protoModule.readFixed32(p155, var3079)
			local _ = var3095
			var3079 = var3096
		elseif var3080 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3097, var3098 = protoModule.readFixed64(p155, var3079)
			local _ = var3097
			var3079 = var3098
		else
			error("Unsupported wire type: " .. var3080)
		end
	end
	return var3078
end

function t_77:jsonEncode() --[[ line: 17828 ]]
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

function t_77:jsonDecode() --[[ line: 17846 ]]
	-- upvalues: t_77 (ref)
	local var3100 = t_77.new()
	
	if self.sort_id ~= nil then
		var3100.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3100.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var3100.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3100.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var3100.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var3100.content_type = self.contentType
	end
	return var3100
end

t_77.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_77
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p156) --[[ line: 17892 ]]
	-- upvalues: t_78 (ref)
	return setmetatable({
		selected_option = if p156 == nil or p156.selected_option == nil then "" else p156.selected_option,
		options = if p156 == nil or p156.options == nil then {} else p156.options,
		experience_carousel = if p156 == nil or p156.experience_carousel == nil then nil else p156.experience_carousel
	}, t_78)
end

function t_78:encode() --[[ line: 17904 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3102 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3103, var3104 = protoModule.writeTag(buff, var3102, 1, protoModule.wireTypes.lengthDelimited)
		var3103, var3104 = protoModule.writeString(var3103, var3104, self.selected_option)
		buff = var3103
		var3102 = var3104
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3105 = v:encode()
			local var3106, var3107 = protoModule.writeTag(buff, var3102, 2, protoModule.wireTypes.lengthDelimited)
			var3106, var3107 = protoModule.writeBuffer(var3106, var3107, var3105, buffer.len(var3105))
			buff = var3106
			var3102 = var3107
		end
	end
	if self.experience_carousel ~= nil then
		local var3108 = self.experience_carousel:encode()
		local var3109, var3110 = protoModule.writeTag(buff, var3102, 3, protoModule.wireTypes.lengthDelimited)
		var3109, var3110 = protoModule.writeBuffer(var3109, var3110, var3108, buffer.len(var3108))
		buff = var3109
		var3102 = var3110
	end
	local buff_1 = buffer.create(var3102)
	buffer.copy(buff_1, 0, buff, 0, var3102)
	
	return buff_1
end

function t_78.decode(p157) --[[ line: 17932 ]]
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var3112 = t_78.new()
	local var3113 = 0
	while var3113 < buffer.len(p157) do
		local _ = nil
		local var3114 = nil
		local var3115, var3116, var3117 = protoModule.readTag(p157, var3113)
		local var3118 = var3115
		var3114 = var3116
		var3113 = var3117
		
		if var3114 == protoModule.wireTypes.varint then
			local _ = nil
			local var3119, var3120 = protoModule.readVarInt(p157, var3113)
			local _ = var3119
			var3113 = var3120
			continue
		end
		if var3114 == protoModule.wireTypes.lengthDelimited then
			if var3118 == 1 then
				local _ = nil
				local var3121, var3122 = protoModule.readBuffer(p157, var3113)
				var3113 = var3122
				var3112.selected_option = buffer.tostring(var3121)
			elseif var3118 == 2 then
				local _ = nil
				local var3123, var3124 = protoModule.readBuffer(p157, var3113)
				var3113 = var3124
				table.insert(var3112.options, t.SelectorOption.decode(var3123))
			elseif var3118 == 3 then
				local _ = nil
				local var3125, var3126 = protoModule.readBuffer(p157, var3113)
				var3113 = var3126
				var3112.experience_carousel = t.ExperienceCarouselInputData.decode(var3125)
			else
				local _ = nil
				local var3127, var3128 = protoModule.readVarInt(p157, var3113)
				var3113 = var3128 + var3127
			end
		elseif var3114 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3129, var3130 = protoModule.readFixed32(p157, var3113)
			local _ = var3129
			var3113 = var3130
		elseif var3114 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3131, var3132 = protoModule.readFixed64(p157, var3113)
			local _ = var3131
			var3113 = var3132
		else
			error("Unsupported wire type: " .. var3114)
		end
	end
	return var3112
end

function t_78:jsonEncode() --[[ line: 17985 ]]
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

function t_78:jsonDecode() --[[ line: 18007 ]]
	-- upvalues: t_78 (ref), t (ref)
	local var3135 = t_78.new()
	
	if self.selected_option ~= nil then
		var3135.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3135.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3135.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3135.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3135.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var3135
end

t_78.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_78
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p158) --[[ line: 18052 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		id = if p158 == nil or p158.id == nil then "" else p158.id,
		preview_rows = if p158 == nil or p158.preview_rows == nil then 0 else p158.preview_rows,
		widget_style = if p158 == nil or p158.widget_style == nil then nil else p158.widget_style,
		see_all_button = if p158 == nil or p158.see_all_button == nil then false else p158.see_all_button,
		information_popover_text = if p158 == nil or p158.information_popover_text == nil then "" else p158.information_popover_text
	}, t_79)
end

function t_79:encode() --[[ line: 18066 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3138 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3139, var3140 = protoModule.writeTag(buff, var3138, 1, protoModule.wireTypes.lengthDelimited)
		var3139, var3140 = protoModule.writeString(var3139, var3140, self.id)
		buff = var3139
		var3138 = var3140
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var3141, var3142 = protoModule.writeTag(buff, var3138, 4, protoModule.wireTypes.varint)
		var3141, var3142 = protoModule.writeVarInt(var3141, var3142, self.preview_rows)
		buff = var3141
		var3138 = var3142
	end
	if self.widget_style ~= nil then
		local var3143 = self.widget_style:encode()
		local var3144, var3145 = protoModule.writeTag(buff, var3138, 3, protoModule.wireTypes.lengthDelimited)
		var3144, var3145 = protoModule.writeBuffer(var3144, var3145, var3143, buffer.len(var3143))
		buff = var3144
		var3138 = var3145
	end
	if self.see_all_button then
		local var3146, var3147 = protoModule.writeTag(buff, var3138, 5, protoModule.wireTypes.varint)
		var3146, var3147 = protoModule.writeVarInt(var3146, var3147, if self.see_all_button then 1 else 0)
		buff = var3146
		var3138 = var3147
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3148, var3149 = protoModule.writeTag(buff, var3138, 6, protoModule.wireTypes.lengthDelimited)
		var3148, var3149 = protoModule.writeString(var3148, var3149, self.information_popover_text)
		buff = var3148
		var3138 = var3149
	end
	local buff_1 = buffer.create(var3138)
	buffer.copy(buff_1, 0, buff, 0, var3138)
	
	return buff_1
end

function t_79.decode(p159) --[[ line: 18101 ]]
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var3151 = t_79.new()
	local var3152 = 0
	while var3152 < buffer.len(p159) do
		local _ = nil
		local var3153 = nil
		local var3154, var3155, var3156 = protoModule.readTag(p159, var3152)
		local var3157 = var3154
		var3153 = var3155
		var3152 = var3156
		
		if var3153 == protoModule.wireTypes.varint then
			if var3157 == 4 then
				local _ = nil
				local var3158, var3159 = protoModule.readVarIntI64(p159, var3152)
				var3152 = var3159
				var3151.preview_rows = var3158
			elseif var3157 == 5 then
				local _ = nil
				local var3160, var3161 = protoModule.readVarInt(p159, var3152)
				var3152 = var3161
				var3151.see_all_button = var3160 ~= 0
			else
				local _ = nil
				local var3162, var3163 = protoModule.readVarInt(p159, var3152)
				local _ = var3162
				var3152 = var3163
			end
		end
		if var3153 == protoModule.wireTypes.lengthDelimited then
			if var3157 == 1 then
				local _ = nil
				local var3164, var3165 = protoModule.readBuffer(p159, var3152)
				var3152 = var3165
				var3151.id = buffer.tostring(var3164)
			elseif var3157 == 3 then
				local _ = nil
				local var3166, var3167 = protoModule.readBuffer(p159, var3152)
				var3152 = var3167
				var3151.widget_style = t.WidgetStyleData.decode(var3166)
			elseif var3157 == 6 then
				local _ = nil
				local var3168, var3169 = protoModule.readBuffer(p159, var3152)
				var3152 = var3169
				var3151.information_popover_text = buffer.tostring(var3168)
			else
				local _ = nil
				local var3170, var3171 = protoModule.readVarInt(p159, var3152)
				var3152 = var3171 + var3170
			end
		elseif var3153 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3172, var3173 = protoModule.readFixed32(p159, var3152)
			local _ = var3172
			var3152 = var3173
		elseif var3153 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3174, var3175 = protoModule.readFixed64(p159, var3152)
			local _ = var3174
			var3152 = var3175
		else
			error("Unsupported wire type: " .. var3153)
		end
	end
	return var3151
end

function t_79:jsonEncode() --[[ line: 18164 ]]
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

function t_79:jsonDecode() --[[ line: 18190 ]]
	-- upvalues: t_79 (ref), t (ref)
	local var3177 = t_79.new()
	
	if self.id ~= nil then
		var3177.id = self.id
	end
	if self.preview_rows ~= nil then
		var3177.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var3177.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var3177.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3177.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3177.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3177.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3177.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3177.information_popover_text = self.informationPopoverText
	end
	return var3177
end

t_79.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_79
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p160) --[[ line: 18248 ]]
	-- upvalues: t_80 (ref)
	return setmetatable({
		id = if p160 == nil or p160.id == nil then "" else p160.id,
		num_items_to_show = if p160 == nil or p160.num_items_to_show == nil then 0 else p160.num_items_to_show,
		widget_style = if p160 == nil or p160.widget_style == nil then nil else p160.widget_style,
		see_all_button = if p160 == nil or p160.see_all_button == nil then false else p160.see_all_button,
		information_popover_text = if p160 == nil or p160.information_popover_text == nil then "" else p160.information_popover_text
	}, t_80)
end

function t_80:encode() --[[ line: 18262 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3179 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3180, var3181 = protoModule.writeTag(buff, var3179, 1, protoModule.wireTypes.lengthDelimited)
		var3180, var3181 = protoModule.writeString(var3180, var3181, self.id)
		buff = var3180
		var3179 = var3181
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var3182, var3183 = protoModule.writeTag(buff, var3179, 5, protoModule.wireTypes.varint)
		var3182, var3183 = protoModule.writeVarInt(var3182, var3183, self.num_items_to_show)
		buff = var3182
		var3179 = var3183
	end
	if self.widget_style ~= nil then
		local var3184 = self.widget_style:encode()
		local var3185, var3186 = protoModule.writeTag(buff, var3179, 3, protoModule.wireTypes.lengthDelimited)
		var3185, var3186 = protoModule.writeBuffer(var3185, var3186, var3184, buffer.len(var3184))
		buff = var3185
		var3179 = var3186
	end
	if self.see_all_button then
		local var3187, var3188 = protoModule.writeTag(buff, var3179, 6, protoModule.wireTypes.varint)
		var3187, var3188 = protoModule.writeVarInt(var3187, var3188, if self.see_all_button then 1 else 0)
		buff = var3187
		var3179 = var3188
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3189, var3190 = protoModule.writeTag(buff, var3179, 7, protoModule.wireTypes.lengthDelimited)
		var3189, var3190 = protoModule.writeString(var3189, var3190, self.information_popover_text)
		buff = var3189
		var3179 = var3190
	end
	local buff_1 = buffer.create(var3179)
	buffer.copy(buff_1, 0, buff, 0, var3179)
	
	return buff_1
end

function t_80.decode(p161) --[[ line: 18299 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var3192 = t_80.new()
	local var3193 = 0
	while var3193 < buffer.len(p161) do
		local _ = nil
		local var3194 = nil
		local var3195, var3196, var3197 = protoModule.readTag(p161, var3193)
		local var3198 = var3195
		var3194 = var3196
		var3193 = var3197
		
		if var3194 == protoModule.wireTypes.varint then
			if var3198 == 5 then
				local _ = nil
				local var3199, var3200 = protoModule.readVarIntI64(p161, var3193)
				var3193 = var3200
				var3192.num_items_to_show = var3199
			elseif var3198 == 6 then
				local _ = nil
				local var3201, var3202 = protoModule.readVarInt(p161, var3193)
				var3193 = var3202
				var3192.see_all_button = var3201 ~= 0
			else
				local _ = nil
				local var3203, var3204 = protoModule.readVarInt(p161, var3193)
				local _ = var3203
				var3193 = var3204
			end
		end
		if var3194 == protoModule.wireTypes.lengthDelimited then
			if var3198 == 1 then
				local _ = nil
				local var3205, var3206 = protoModule.readBuffer(p161, var3193)
				var3193 = var3206
				var3192.id = buffer.tostring(var3205)
			elseif var3198 == 3 then
				local _ = nil
				local var3207, var3208 = protoModule.readBuffer(p161, var3193)
				var3193 = var3208
				var3192.widget_style = t.WidgetStyleData.decode(var3207)
			elseif var3198 == 7 then
				local _ = nil
				local var3209, var3210 = protoModule.readBuffer(p161, var3193)
				var3193 = var3210
				var3192.information_popover_text = buffer.tostring(var3209)
			else
				local _ = nil
				local var3211, var3212 = protoModule.readVarInt(p161, var3193)
				var3193 = var3212 + var3211
			end
		elseif var3194 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3213, var3214 = protoModule.readFixed32(p161, var3193)
			local _ = var3213
			var3193 = var3214
		elseif var3194 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3215, var3216 = protoModule.readFixed64(p161, var3193)
			local _ = var3215
			var3193 = var3216
		else
			error("Unsupported wire type: " .. var3194)
		end
	end
	return var3192
end

function t_80:jsonEncode() --[[ line: 18364 ]]
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

function t_80:jsonDecode() --[[ line: 18392 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var3218 = t_80.new()
	
	if self.id ~= nil then
		var3218.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var3218.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var3218.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var3218.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3218.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3218.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3218.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3218.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3218.information_popover_text = self.informationPopoverText
	end
	return var3218
end

t_80.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p162) --[[ line: 18450 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		background_layers = if p162 == nil or p162.background_layers == nil then {} else p162.background_layers
	}, t_81)
end

function t_81:encode() --[[ line: 18456 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3220 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var3221 = v:encode()
			local var3222, var3223 = protoModule.writeTag(buff, var3220, 1, protoModule.wireTypes.lengthDelimited)
			var3222, var3223 = protoModule.writeBuffer(var3222, var3223, var3221, buffer.len(var3221))
			buff = var3222
			var3220 = var3223
		end
	end
	local buff_1 = buffer.create(var3220)
	buffer.copy(buff_1, 0, buff, 0, var3220)
	
	return buff_1
end

function t_81.decode(p163) --[[ line: 18473 ]]
	-- upvalues: t_81 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var3225 = t_81.new()
	local var3226 = 0
	while var3226 < buffer.len(p163) do
		local _ = nil
		local var3227 = nil
		local var3228, var3229, var3230 = protoModule.readTag(p163, var3226)
		local var3231 = var3228
		var3227 = var3229
		var3226 = var3230
		
		if var3227 == protoModule.wireTypes.varint then
			local _ = nil
			local var3232, var3233 = protoModule.readVarInt(p163, var3226)
			local _ = var3232
			var3226 = var3233
			continue
		end
		if var3227 == protoModule.wireTypes.lengthDelimited then
			if var3231 == 1 then
				local _ = nil
				local var3234, var3235 = protoModule.readBuffer(p163, var3226)
				var3226 = var3235
				table.insert(var3225.background_layers, backgroundLayerModule.BackgroundLayer.decode(var3234))
			else
				local _ = nil
				local var3236, var3237 = protoModule.readVarInt(p163, var3226)
				var3226 = var3237 + var3236
			end
		elseif var3227 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3238, var3239 = protoModule.readFixed32(p163, var3226)
			local _ = var3238
			var3226 = var3239
		elseif var3227 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3240, var3241 = protoModule.readFixed64(p163, var3226)
			local _ = var3240
			var3226 = var3241
		else
			error("Unsupported wire type: " .. var3227)
		end
	end
	return var3225
end

function t_81:jsonEncode() --[[ line: 18519 ]]
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

function t_81:jsonDecode() --[[ line: 18533 ]]
	-- upvalues: t_81 (ref), backgroundLayerModule (ref)
	local var3244 = t_81.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3244.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3244.background_layers = t
	end
	return var3244
end

t_81.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_81
typeRegistryModule.default:register(t.WidgetStyleData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p164) --[[ line: 18577 ]]
	-- upvalues: t_82 (ref)
	return setmetatable({
		id = if p164 == nil or p164.id == nil then "" else p164.id,
		available_until = if p164 == nil or p164.available_until == nil then "" else p164.available_until,
		widget_style = if p164 == nil or p164.widget_style == nil then nil else p164.widget_style
	}, t_82)
end

function t_82:encode() --[[ line: 18587 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3248 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3249, var3250 = protoModule.writeTag(buff, var3248, 1, protoModule.wireTypes.lengthDelimited)
		var3249, var3250 = protoModule.writeString(var3249, var3250, self.id)
		buff = var3249
		var3248 = var3250
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var3251, var3252 = protoModule.writeTag(buff, var3248, 2, protoModule.wireTypes.lengthDelimited)
		var3251, var3252 = protoModule.writeString(var3251, var3252, self.available_until)
		buff = var3251
		var3248 = var3252
	end
	if self.widget_style ~= nil then
		local var3253 = self.widget_style:encode()
		local var3254, var3255 = protoModule.writeTag(buff, var3248, 3, protoModule.wireTypes.lengthDelimited)
		var3254, var3255 = protoModule.writeBuffer(var3254, var3255, var3253, buffer.len(var3253))
		buff = var3254
		var3248 = var3255
	end
	local buff_1 = buffer.create(var3248)
	buffer.copy(buff_1, 0, buff, 0, var3248)
	
	return buff_1
end

function t_82.decode(p165) --[[ line: 18612 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var3257 = t_82.new()
	local var3258 = 0
	while var3258 < buffer.len(p165) do
		local _ = nil
		local var3259 = nil
		local var3260, var3261, var3262 = protoModule.readTag(p165, var3258)
		local var3263 = var3260
		var3259 = var3261
		var3258 = var3262
		
		if var3259 == protoModule.wireTypes.varint then
			local _ = nil
			local var3264, var3265 = protoModule.readVarInt(p165, var3258)
			local _ = var3264
			var3258 = var3265
			continue
		end
		if var3259 == protoModule.wireTypes.lengthDelimited then
			if var3263 == 1 then
				local _ = nil
				local var3266, var3267 = protoModule.readBuffer(p165, var3258)
				var3258 = var3267
				var3257.id = buffer.tostring(var3266)
			elseif var3263 == 2 then
				local _ = nil
				local var3268, var3269 = protoModule.readBuffer(p165, var3258)
				var3258 = var3269
				var3257.available_until = buffer.tostring(var3268)
			elseif var3263 == 3 then
				local _ = nil
				local var3270, var3271 = protoModule.readBuffer(p165, var3258)
				var3258 = var3271
				var3257.widget_style = t.WidgetStyleData.decode(var3270)
			else
				local _ = nil
				local var3272, var3273 = protoModule.readVarInt(p165, var3258)
				var3258 = var3273 + var3272
			end
		elseif var3259 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3274, var3275 = protoModule.readFixed32(p165, var3258)
			local _ = var3274
			var3258 = var3275
		elseif var3259 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3276, var3277 = protoModule.readFixed64(p165, var3258)
			local _ = var3276
			var3258 = var3277
		else
			error("Unsupported wire type: " .. var3259)
		end
	end
	return var3257
end

function t_82:jsonEncode() --[[ line: 18665 ]]
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

function t_82:jsonDecode() --[[ line: 18683 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var3279 = t_82.new()
	
	if self.id ~= nil then
		var3279.id = self.id
	end
	if self.available_until ~= nil then
		var3279.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var3279.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var3279.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3279.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var3279
end

t_82.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_82
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p166) --[[ line: 18725 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		entry_map = if p166 == nil or p166.entry_map == nil then {} else p166.entry_map,
		entry_order = if p166 == nil or p166.entry_order == nil then {} else p166.entry_order
	}, t_83)
end

function t_83:encode() --[[ line: 18734 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3281 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3282, var3283 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3282, var3283 = protoModule.writeString(var3282, var3283, i)
			local var3284 = v:encode()
			var3283, var3285 = protoModule.writeTag(var3282, var3283, 2, protoModule.wireTypes.lengthDelimited)
			var3283, var3285 = protoModule.writeBuffer(var3283, var3285, var3284, buffer.len(var3284))
			local var3286 = var3283
			local var3287 = var3285
			local var3288, var3289 = protoModule.writeTag(buff, var3281, 1, protoModule.wireTypes.lengthDelimited)
			var3288, var3289 = protoModule.writeBuffer(var3288, var3289, var3286, var3287)
			buff = var3288
			var3281 = var3289
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3290, var3291 = protoModule.writeTag(buff, var3281, 2, protoModule.wireTypes.lengthDelimited)
			var3290, var3291 = protoModule.writeString(var3290, var3291, v)
			buff = var3290
			var3281 = var3291
		end
	end
	local buff_1 = buffer.create(var3281)
	buffer.copy(buff_1, 0, buff, 0, var3281)
	
	return buff_1
end

function t_83.decode(p167) --[[ line: 18764 ]]
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var3293 = t_83.new()
	local var3294 = 0
	while var3294 < buffer.len(p167) do
		local _ = nil
		local var3295 = nil
		local var3296, var3297, var3298 = protoModule.readTag(p167, var3294)
		local var3299 = var3296
		var3295 = var3297
		var3294 = var3298
		
		if var3295 == protoModule.wireTypes.varint then
			local _ = nil
			local var3300, var3301 = protoModule.readVarInt(p167, var3294)
			local _ = var3300
			var3294 = var3301
			continue
		end
		if var3295 == protoModule.wireTypes.lengthDelimited then
			if var3299 == 1 then
				local _ = nil
				local var3302, var3303 = protoModule.readBuffer(p167, var3294)
				var3294 = var3303
				var3302 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var3302)
				var3293.entry_map[var3302.key or ""] = var3302.value or t.FeedEntry.new()
			elseif var3299 == 2 then
				local _ = nil
				local var3304, var3305 = protoModule.readBuffer(p167, var3294)
				var3294 = var3305
				table.insert(var3293.entry_order, buffer.tostring(var3304))
			else
				local _ = nil
				local var3306, var3307 = protoModule.readVarInt(p167, var3294)
				var3294 = var3307 + var3306
			end
		elseif var3295 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3308, var3309 = protoModule.readFixed32(p167, var3294)
			local _ = var3308
			var3294 = var3309
		elseif var3295 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3310, var3311 = protoModule.readFixed64(p167, var3294)
			local _ = var3310
			var3294 = var3311
		else
			error("Unsupported wire type: " .. var3295)
		end
	end
	return var3293
end

function t_83:jsonEncode() --[[ line: 18819 ]]
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

function t_83:jsonDecode() --[[ line: 18841 ]]
	-- upvalues: t_83 (ref), t (ref)
	local var3315 = t_83.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3315.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3315.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3315.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3315.entry_order = t_1
	end
	return var3315
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p168) --[[ line: 18899 ]]
	-- upvalues: t_84 (ref)
	return setmetatable({
		key = if p168 == nil or p168.key == nil then "" else p168.key,
		value = if p168 == nil or p168.value == nil then nil else p168.value
	}, t_84)
end

function t_84:encode() --[[ line: 18908 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3321 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3322, var3323 = protoModule.writeTag(buff, var3321, 1, protoModule.wireTypes.lengthDelimited)
		var3322, var3323 = protoModule.writeString(var3322, var3323, self.key)
		buff = var3322
		var3321 = var3323
	end
	if self.value ~= nil then
		local var3324 = self.value:encode()
		local var3325, var3326 = protoModule.writeTag(buff, var3321, 2, protoModule.wireTypes.lengthDelimited)
		var3325, var3326 = protoModule.writeBuffer(var3325, var3326, var3324, buffer.len(var3324))
		buff = var3325
		var3321 = var3326
	end
	local buff_1 = buffer.create(var3321)
	buffer.copy(buff_1, 0, buff, 0, var3321)
	
	return buff_1
end

function t_84.decode(p169) --[[ line: 18930 ]]
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var3328 = t_84.new()
	local var3329 = 0
	while var3329 < buffer.len(p169) do
		local _ = nil
		local var3330 = nil
		local var3331, var3332, var3333 = protoModule.readTag(p169, var3329)
		local var3334 = var3331
		var3330 = var3332
		var3329 = var3333
		
		if var3330 == protoModule.wireTypes.varint then
			local _ = nil
			local var3335, var3336 = protoModule.readVarInt(p169, var3329)
			local _ = var3335
			var3329 = var3336
			continue
		end
		if var3330 == protoModule.wireTypes.lengthDelimited then
			if var3334 == 1 then
				local _ = nil
				local var3337, var3338 = protoModule.readBuffer(p169, var3329)
				var3329 = var3338
				var3328.key = buffer.tostring(var3337)
			elseif var3334 == 2 then
				local _ = nil
				local var3339, var3340 = protoModule.readBuffer(p169, var3329)
				var3329 = var3340
				var3328.value = t.FeedEntry.decode(var3339)
			else
				local _ = nil
				local var3341, var3342 = protoModule.readVarInt(p169, var3329)
				var3329 = var3342 + var3341
			end
		elseif var3330 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3343, var3344 = protoModule.readFixed32(p169, var3329)
			local _ = var3343
			var3329 = var3344
		elseif var3330 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3345, var3346 = protoModule.readFixed64(p169, var3329)
			local _ = var3345
			var3329 = var3346
		else
			error("Unsupported wire type: " .. var3330)
		end
	end
	return var3328
end

function t_84:jsonEncode() --[[ line: 18980 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_84:jsonDecode() --[[ line: 18996 ]]
	-- upvalues: t_84 (ref), t (ref)
	local var3348 = t_84.new()
	
	if self.key ~= nil then
		var3348.key = self.key
	end
	if self.value ~= nil then
		var3348.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3348
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p170) --[[ line: 19027 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p170 == nil or p170.marketplace_catalog_category_items == nil then {} else p170.marketplace_catalog_category_items,
		active_category_id = if p170 == nil or p170.active_category_id == nil then "" else p170.active_category_id,
		active_tooltip_idx = if p170 == nil or p170.active_tooltip_idx == nil then 0 else p170.active_tooltip_idx
	}, t_85)
end

function t_85:encode() --[[ line: 19040 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3350 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var3351 = v:encode()
			local var3352, var3353 = protoModule.writeTag(buff, var3350, 1, protoModule.wireTypes.lengthDelimited)
			var3352, var3353 = protoModule.writeBuffer(var3352, var3353, var3351, buffer.len(var3351))
			buff = var3352
			var3350 = var3353
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var3354, var3355 = protoModule.writeTag(buff, var3350, 2, protoModule.wireTypes.lengthDelimited)
		var3354, var3355 = protoModule.writeString(var3354, var3355, self.active_category_id)
		buff = var3354
		var3350 = var3355
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var3356, var3357 = protoModule.writeTag(buff, var3350, 3, protoModule.wireTypes.varint)
		var3356, var3357 = protoModule.writeVarInt(var3356, var3357, self.active_tooltip_idx)
		buff = var3356
		var3350 = var3357
	end
	local buff_1 = buffer.create(var3350)
	buffer.copy(buff_1, 0, buff, 0, var3350)
	
	return buff_1
end

function t_85.decode(p171) --[[ line: 19069 ]]
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var3359 = t_85.new()
	local var3360 = 0
	while var3360 < buffer.len(p171) do
		local _ = nil
		local var3361 = nil
		local var3362, var3363, var3364 = protoModule.readTag(p171, var3360)
		local var3365 = var3362
		var3361 = var3363
		var3360 = var3364
		
		if var3361 == protoModule.wireTypes.varint then
			if var3365 == 3 then
				local _ = nil
				local var3366, var3367 = protoModule.readVarIntI64(p171, var3360)
				var3360 = var3367
				var3359.active_tooltip_idx = var3366
			else
				local _ = nil
				local var3368, var3369 = protoModule.readVarInt(p171, var3360)
				local _ = var3368
				var3360 = var3369
			end
		end
		if var3361 == protoModule.wireTypes.lengthDelimited then
			if var3365 == 1 then
				local _ = nil
				local var3370, var3371 = protoModule.readBuffer(p171, var3360)
				var3360 = var3371
				table.insert(var3359.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var3370))
			elseif var3365 == 2 then
				local _ = nil
				local var3372, var3373 = protoModule.readBuffer(p171, var3360)
				var3360 = var3373
				var3359.active_category_id = buffer.tostring(var3372)
			else
				local _ = nil
				local var3374, var3375 = protoModule.readVarInt(p171, var3360)
				var3360 = var3375 + var3374
			end
		elseif var3361 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3376, var3377 = protoModule.readFixed32(p171, var3360)
			local _ = var3376
			var3360 = var3377
		elseif var3361 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3378, var3379 = protoModule.readFixed64(p171, var3360)
			local _ = var3378
			var3360 = var3379
		else
			error("Unsupported wire type: " .. var3361)
		end
	end
	return var3359
end

function t_85:jsonEncode() --[[ line: 19127 ]]
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

function t_85:jsonDecode() --[[ line: 19151 ]]
	-- upvalues: t_85 (ref), t (ref)
	local var3382 = t_85.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3382.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3382.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var3382.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var3382.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var3382.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var3382.active_tooltip_idx = self.activeTooltipIdx
	end
	return var3382
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p172) --[[ line: 19214 ]]
	-- upvalues: t_86 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p172 == nil or p172.marketplace_catalog_category_item_id == nil then "" else p172.marketplace_catalog_category_item_id
	}, t_86)
end

function t_86:encode() --[[ line: 19228 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3386 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var3387, var3388 = protoModule.writeTag(buff, var3386, 1, protoModule.wireTypes.lengthDelimited)
		var3387, var3388 = protoModule.writeString(var3387, var3388, self.marketplace_catalog_category_item_id)
		buff = var3387
		var3386 = var3388
	end
	local buff_1 = buffer.create(var3386)
	buffer.copy(buff_1, 0, buff, 0, var3386)
	
	return buff_1
end

function t_86.decode(p173) --[[ line: 19244 ]]
	-- upvalues: t_86 (ref), protoModule (ref)
	local var3390 = t_86.new()
	local var3391 = 0
	while var3391 < buffer.len(p173) do
		local _ = nil
		local var3392 = nil
		local var3393, var3394, var3395 = protoModule.readTag(p173, var3391)
		local var3396 = var3393
		var3392 = var3394
		var3391 = var3395
		
		if var3392 == protoModule.wireTypes.varint then
			local _ = nil
			local var3397, var3398 = protoModule.readVarInt(p173, var3391)
			local _ = var3397
			var3391 = var3398
			continue
		end
		if var3392 == protoModule.wireTypes.lengthDelimited then
			if var3396 == 1 then
				local _ = nil
				local var3399, var3400 = protoModule.readBuffer(p173, var3391)
				var3391 = var3400
				var3390.marketplace_catalog_category_item_id = buffer.tostring(var3399)
			else
				local _ = nil
				local var3401, var3402 = protoModule.readVarInt(p173, var3391)
				var3391 = var3402 + var3401
			end
		elseif var3392 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3403, var3404 = protoModule.readFixed32(p173, var3391)
			local _ = var3403
			var3391 = var3404
		elseif var3392 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3405, var3406 = protoModule.readFixed64(p173, var3391)
			local _ = var3405
			var3391 = var3406
		else
			error("Unsupported wire type: " .. var3392)
		end
	end
	return var3390
end

function t_86:jsonEncode() --[[ line: 19289 ]]
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_86:jsonDecode() --[[ line: 19301 ]]
	-- upvalues: t_86 (ref)
	local var3408 = t_86.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var3408.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var3408.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var3408
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p174) --[[ line: 19334 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		hero_icon = if p174 == nil or p174.hero_icon == nil then nil else p174.hero_icon,
		body_dismiss_button_text = if p174 == nil or p174.body_dismiss_button_text == nil then "" else p174.body_dismiss_button_text,
		body_title = if p174 == nil or p174.body_title == nil then "" else p174.body_title,
		body_rich_text = if p174 == nil or p174.body_rich_text == nil then "" else p174.body_rich_text,
		terms_link_text = if p174 == nil or p174.terms_link_text == nil then nil else p174.terms_link_text,
		terms_title = if p174 == nil or p174.terms_title == nil then nil else p174.terms_title,
		terms_body_rich_text = if p174 == nil or p174.terms_body_rich_text == nil then nil else p174.terms_body_rich_text,
		terms_dismiss_button_text = if p174 == nil or p174.terms_dismiss_button_text == nil then nil else p174.terms_dismiss_button_text,
		offer_id = if p174 == nil or p174.offer_id == nil then "" else p174.offer_id
	}, t_87)
end

function t_87:encode() --[[ line: 19356 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3410 = 0
	
	if self.hero_icon ~= nil then
		local var3411, var3412 = protoModule.writeTag(buff, var3410, 1, protoModule.wireTypes.lengthDelimited)
		var3411, var3412 = protoModule.writeString(var3411, var3412, self.hero_icon)
		buff = var3411
		var3410 = var3412
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var3413, var3414 = protoModule.writeTag(buff, var3410, 2, protoModule.wireTypes.lengthDelimited)
		var3413, var3414 = protoModule.writeString(var3413, var3414, self.body_dismiss_button_text)
		buff = var3413
		var3410 = var3414
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var3415, var3416 = protoModule.writeTag(buff, var3410, 3, protoModule.wireTypes.lengthDelimited)
		var3415, var3416 = protoModule.writeString(var3415, var3416, self.body_title)
		buff = var3415
		var3410 = var3416
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var3417, var3418 = protoModule.writeTag(buff, var3410, 4, protoModule.wireTypes.lengthDelimited)
		var3417, var3418 = protoModule.writeString(var3417, var3418, self.body_rich_text)
		buff = var3417
		var3410 = var3418
	end
	if self.terms_link_text ~= nil then
		local var3419, var3420 = protoModule.writeTag(buff, var3410, 5, protoModule.wireTypes.lengthDelimited)
		var3419, var3420 = protoModule.writeString(var3419, var3420, self.terms_link_text)
		buff = var3419
		var3410 = var3420
	end
	if self.terms_title ~= nil then
		local var3421, var3422 = protoModule.writeTag(buff, var3410, 6, protoModule.wireTypes.lengthDelimited)
		var3421, var3422 = protoModule.writeString(var3421, var3422, self.terms_title)
		buff = var3421
		var3410 = var3422
	end
	if self.terms_body_rich_text ~= nil then
		local var3423, var3424 = protoModule.writeTag(buff, var3410, 7, protoModule.wireTypes.lengthDelimited)
		var3423, var3424 = protoModule.writeString(var3423, var3424, self.terms_body_rich_text)
		buff = var3423
		var3410 = var3424
	end
	if self.terms_dismiss_button_text ~= nil then
		local var3425, var3426 = protoModule.writeTag(buff, var3410, 8, protoModule.wireTypes.lengthDelimited)
		var3425, var3426 = protoModule.writeString(var3425, var3426, self.terms_dismiss_button_text)
		buff = var3425
		var3410 = var3426
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var3427, var3428 = protoModule.writeTag(buff, var3410, 9, protoModule.wireTypes.lengthDelimited)
		var3427, var3428 = protoModule.writeString(var3427, var3428, self.offer_id)
		buff = var3427
		var3410 = var3428
	end
	local buff_1 = buffer.create(var3410)
	buffer.copy(buff_1, 0, buff, 0, var3410)
	
	return buff_1
end

function t_87.decode(p175) --[[ line: 19410 ]]
	-- upvalues: t_87 (ref), protoModule (ref)
	local var3430 = t_87.new()
	local var3431 = 0
	while var3431 < buffer.len(p175) do
		local _ = nil
		local var3432 = nil
		local var3433, var3434, var3435 = protoModule.readTag(p175, var3431)
		local var3436 = var3433
		var3432 = var3434
		var3431 = var3435
		
		if var3432 == protoModule.wireTypes.varint then
			local _ = nil
			local var3437, var3438 = protoModule.readVarInt(p175, var3431)
			local _ = var3437
			var3431 = var3438
			continue
		end
		if var3432 == protoModule.wireTypes.lengthDelimited then
			if var3436 == 1 then
				local _ = nil
				local var3439, var3440 = protoModule.readBuffer(p175, var3431)
				var3431 = var3440
				var3430.hero_icon = buffer.tostring(var3439)
			elseif var3436 == 2 then
				local _ = nil
				local var3441, var3442 = protoModule.readBuffer(p175, var3431)
				var3431 = var3442
				var3430.body_dismiss_button_text = buffer.tostring(var3441)
			elseif var3436 == 3 then
				local _ = nil
				local var3443, var3444 = protoModule.readBuffer(p175, var3431)
				var3431 = var3444
				var3430.body_title = buffer.tostring(var3443)
			elseif var3436 == 4 then
				local _ = nil
				local var3445, var3446 = protoModule.readBuffer(p175, var3431)
				var3431 = var3446
				var3430.body_rich_text = buffer.tostring(var3445)
			elseif var3436 == 5 then
				local _ = nil
				local var3447, var3448 = protoModule.readBuffer(p175, var3431)
				var3431 = var3448
				var3430.terms_link_text = buffer.tostring(var3447)
			elseif var3436 == 6 then
				local _ = nil
				local var3449, var3450 = protoModule.readBuffer(p175, var3431)
				var3431 = var3450
				var3430.terms_title = buffer.tostring(var3449)
			elseif var3436 == 7 then
				local _ = nil
				local var3451, var3452 = protoModule.readBuffer(p175, var3431)
				var3431 = var3452
				var3430.terms_body_rich_text = buffer.tostring(var3451)
			elseif var3436 == 8 then
				local _ = nil
				local var3453, var3454 = protoModule.readBuffer(p175, var3431)
				var3431 = var3454
				var3430.terms_dismiss_button_text = buffer.tostring(var3453)
			elseif var3436 == 9 then
				local _ = nil
				local var3455, var3456 = protoModule.readBuffer(p175, var3431)
				var3431 = var3456
				var3430.offer_id = buffer.tostring(var3455)
			else
				local _ = nil
				local var3457, var3458 = protoModule.readVarInt(p175, var3431)
				var3431 = var3458 + var3457
			end
		elseif var3432 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3459, var3460 = protoModule.readFixed32(p175, var3431)
			local _ = var3459
			var3431 = var3460
		elseif var3432 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3461, var3462 = protoModule.readFixed64(p175, var3431)
			local _ = var3461
			var3431 = var3462
		else
			error("Unsupported wire type: " .. var3432)
		end
	end
	return var3430
end

function t_87:jsonEncode() --[[ line: 19493 ]]
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

function t_87:jsonDecode() --[[ line: 19535 ]]
	-- upvalues: t_87 (ref)
	local var3464 = t_87.new()
	
	if self.hero_icon ~= nil then
		var3464.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var3464.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var3464.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var3464.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var3464.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var3464.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var3464.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var3464.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var3464.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var3464.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var3464.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var3464.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var3464.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var3464.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var3464.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var3464.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var3464.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var3464.offer_id = self.offerId
	end
	return var3464
end

t_87.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_87
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p176) --[[ line: 19627 ]]
	-- upvalues: t_88 (ref)
	return setmetatable({
		items = if p176 == nil or p176.items == nil then {} else p176.items,
		preview_columns = if p176 == nil or p176.preview_columns == nil then 0 else p176.preview_columns,
		impression_id = if p176 == nil or p176.impression_id == nil then "" else p176.impression_id
	}, t_88)
end

function t_88:encode() --[[ line: 19635 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3466 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3467 = v:encode()
			local var3468, var3469 = protoModule.writeTag(buff, var3466, 1, protoModule.wireTypes.lengthDelimited)
			var3468, var3469 = protoModule.writeBuffer(var3468, var3469, var3467, buffer.len(var3467))
			buff = var3468
			var3466 = var3469
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var3470, var3471 = protoModule.writeTag(buff, var3466, 2, protoModule.wireTypes.varint)
		var3470, var3471 = protoModule.writeVarInt(var3470, var3471, self.preview_columns)
		buff = var3470
		var3466 = var3471
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var3472, var3473 = protoModule.writeTag(buff, var3466, 3, protoModule.wireTypes.lengthDelimited)
		var3472, var3473 = protoModule.writeString(var3472, var3473, self.impression_id)
		buff = var3472
		var3466 = var3473
	end
	local buff_1 = buffer.create(var3466)
	buffer.copy(buff_1, 0, buff, 0, var3466)
	
	return buff_1
end

function t_88.decode(p177) --[[ line: 19662 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var3475 = t_88.new()
	local var3476 = 0
	while var3476 < buffer.len(p177) do
		local _ = nil
		local var3477 = nil
		local var3478, var3479, var3480 = protoModule.readTag(p177, var3476)
		local var3481 = var3478
		var3477 = var3479
		var3476 = var3480
		
		if var3477 == protoModule.wireTypes.varint then
			if var3481 == 2 then
				local _ = nil
				local var3482, var3483 = protoModule.readVarIntI32(p177, var3476)
				var3476 = var3483
				var3475.preview_columns = var3482
			else
				local _ = nil
				local var3484, var3485 = protoModule.readVarInt(p177, var3476)
				local _ = var3484
				var3476 = var3485
			end
		end
		if var3477 == protoModule.wireTypes.lengthDelimited then
			if var3481 == 1 then
				local _ = nil
				local var3486, var3487 = protoModule.readBuffer(p177, var3476)
				var3476 = var3487
				table.insert(var3475.items, t.CatalogItemGridInputData_CatalogItem.decode(var3486))
			elseif var3481 == 3 then
				local _ = nil
				local var3488, var3489 = protoModule.readBuffer(p177, var3476)
				var3476 = var3489
				var3475.impression_id = buffer.tostring(var3488)
			else
				local _ = nil
				local var3490, var3491 = protoModule.readVarInt(p177, var3476)
				var3476 = var3491 + var3490
			end
		elseif var3477 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3492, var3493 = protoModule.readFixed32(p177, var3476)
			local _ = var3492
			var3476 = var3493
		elseif var3477 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3494, var3495 = protoModule.readFixed64(p177, var3476)
			local _ = var3494
			var3476 = var3495
		else
			error("Unsupported wire type: " .. var3477)
		end
	end
	return var3475
end

function t_88:jsonEncode() --[[ line: 19715 ]]
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

function t_88:jsonDecode() --[[ line: 19737 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var3498 = t_88.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var3498.items = t_1
	end
	if self.preview_columns ~= nil then
		var3498.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var3498.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var3498.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var3498.impression_id = self.impressionId
	end
	return var3498
end

t_88.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_88
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p178) --[[ line: 19782 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		id = if p178 == nil or p178.id == nil then "" else p178.id,
		type = if p178 == nil or p178.type == nil then "" else p178.type
	}, t_89)
end

function t_89:encode() --[[ line: 19791 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3501 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3502, var3503 = protoModule.writeTag(buff, var3501, 1, protoModule.wireTypes.lengthDelimited)
		var3502, var3503 = protoModule.writeString(var3502, var3503, self.id)
		buff = var3502
		var3501 = var3503
	end
	if self.type ~= nil and self.type ~= "" then
		local var3504, var3505 = protoModule.writeTag(buff, var3501, 2, protoModule.wireTypes.lengthDelimited)
		var3504, var3505 = protoModule.writeString(var3504, var3505, self.type)
		buff = var3504
		var3501 = var3505
	end
	local buff_1 = buffer.create(var3501)
	buffer.copy(buff_1, 0, buff, 0, var3501)
	
	return buff_1
end

function t_89.decode(p179) --[[ line: 19810 ]]
	-- upvalues: t_89 (ref), protoModule (ref)
	local var3507 = t_89.new()
	local var3508 = 0
	while var3508 < buffer.len(p179) do
		local _ = nil
		local var3509 = nil
		local var3510, var3511, var3512 = protoModule.readTag(p179, var3508)
		local var3513 = var3510
		var3509 = var3511
		var3508 = var3512
		
		if var3509 == protoModule.wireTypes.varint then
			local _ = nil
			local var3514, var3515 = protoModule.readVarInt(p179, var3508)
			local _ = var3514
			var3508 = var3515
			continue
		end
		if var3509 == protoModule.wireTypes.lengthDelimited then
			if var3513 == 1 then
				local _ = nil
				local var3516, var3517 = protoModule.readBuffer(p179, var3508)
				var3508 = var3517
				var3507.id = buffer.tostring(var3516)
			elseif var3513 == 2 then
				local _ = nil
				local var3518, var3519 = protoModule.readBuffer(p179, var3508)
				var3508 = var3519
				var3507.type = buffer.tostring(var3518)
			else
				local _ = nil
				local var3520, var3521 = protoModule.readVarInt(p179, var3508)
				var3508 = var3521 + var3520
			end
		elseif var3509 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3522, var3523 = protoModule.readFixed32(p179, var3508)
			local _ = var3522
			var3508 = var3523
		elseif var3509 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3524, var3525 = protoModule.readFixed64(p179, var3508)
			local _ = var3524
			var3508 = var3525
		else
			error("Unsupported wire type: " .. var3509)
		end
	end
	return var3507
end

function t_89:jsonEncode() --[[ line: 19858 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_89:jsonDecode() --[[ line: 19872 ]]
	-- upvalues: t_89 (ref)
	local var3527 = t_89.new()
	
	if self.id ~= nil then
		var3527.id = self.id
	end
	if self.type ~= nil then
		var3527.type = self.type
	end
	return var3527
end

t_89.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_89
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p180) --[[ line: 19902 ]]
	-- upvalues: t_90 (ref)
	return setmetatable({
		entry_map = if p180 == nil or p180.entry_map == nil then {} else p180.entry_map,
		entry_order = if p180 == nil or p180.entry_order == nil then {} else p180.entry_order,
		content_pools = if p180 == nil or p180.content_pools == nil then {} else p180.content_pools,
		search_session_id = if p180 == nil or p180.search_session_id == nil then "" else p180.search_session_id
	}, t_90)
end

function t_90:encode() --[[ line: 19913 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3529 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3530, var3531 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3530, var3531 = protoModule.writeString(var3530, var3531, i)
			local var3532 = v:encode()
			var3531, var3533 = protoModule.writeTag(var3530, var3531, 2, protoModule.wireTypes.lengthDelimited)
			var3531, var3533 = protoModule.writeBuffer(var3531, var3533, var3532, buffer.len(var3532))
			local var3534 = var3531
			local var3535 = var3533
			local var3536, var3537 = protoModule.writeTag(buff, var3529, 1, protoModule.wireTypes.lengthDelimited)
			var3536, var3537 = protoModule.writeBuffer(var3536, var3537, var3534, var3535)
			buff = var3536
			var3529 = var3537
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3538, var3539 = protoModule.writeTag(buff, var3529, 2, protoModule.wireTypes.lengthDelimited)
			var3538, var3539 = protoModule.writeString(var3538, var3539, v)
			buff = var3538
			var3529 = var3539
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3540, var3541 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3540, var3541 = protoModule.writeString(var3540, var3541, i)
			local var3542 = v:encode()
			var3541, var3543 = protoModule.writeTag(var3540, var3541, 2, protoModule.wireTypes.lengthDelimited)
			var3541, var3543 = protoModule.writeBuffer(var3541, var3543, var3542, buffer.len(var3542))
			local var3544 = var3541
			local var3545 = var3543
			local var3546, var3547 = protoModule.writeTag(buff, var3529, 3, protoModule.wireTypes.lengthDelimited)
			var3546, var3547 = protoModule.writeBuffer(var3546, var3547, var3544, var3545)
			buff = var3546
			var3529 = var3547
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var3548, var3549 = protoModule.writeTag(buff, var3529, 4, protoModule.wireTypes.lengthDelimited)
		var3548, var3549 = protoModule.writeString(var3548, var3549, self.search_session_id)
		buff = var3548
		var3529 = var3549
	end
	local buff_1 = buffer.create(var3529)
	buffer.copy(buff_1, 0, buff, 0, var3529)
	
	return buff_1
end

function t_90.decode(p181) --[[ line: 19962 ]]
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var3551 = t_90.new()
	local var3552 = 0
	while var3552 < buffer.len(p181) do
		local _ = nil
		local var3553 = nil
		local var3554, var3555, var3556 = protoModule.readTag(p181, var3552)
		local var3557 = var3554
		var3553 = var3555
		var3552 = var3556
		
		if var3553 == protoModule.wireTypes.varint then
			local _ = nil
			local var3558, var3559 = protoModule.readVarInt(p181, var3552)
			local _ = var3558
			var3552 = var3559
			continue
		end
		if var3553 == protoModule.wireTypes.lengthDelimited then
			if var3557 == 1 then
				local _ = nil
				local var3560, var3561 = protoModule.readBuffer(p181, var3552)
				var3552 = var3561
				var3560 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var3560)
				var3551.entry_map[var3560.key or ""] = var3560.value or t.FeedEntry.new()
			elseif var3557 == 2 then
				local _ = nil
				local var3562, var3563 = protoModule.readBuffer(p181, var3552)
				var3552 = var3563
				table.insert(var3551.entry_order, buffer.tostring(var3562))
			elseif var3557 == 3 then
				local _ = nil
				local var3564, var3565 = protoModule.readBuffer(p181, var3552)
				var3552 = var3565
				var3564 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var3564)
				var3551.content_pools[var3564.key or ""] = var3564.value or t.ContentPool.new()
			elseif var3557 == 4 then
				local _ = nil
				local var3566, var3567 = protoModule.readBuffer(p181, var3552)
				var3552 = var3567
				var3551.search_session_id = buffer.tostring(var3566)
			else
				local _ = nil
				local var3568, var3569 = protoModule.readVarInt(p181, var3552)
				var3552 = var3569 + var3568
			end
		elseif var3553 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3570, var3571 = protoModule.readFixed32(p181, var3552)
			local _ = var3570
			var3552 = var3571
		elseif var3553 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3572, var3573 = protoModule.readFixed64(p181, var3552)
			local _ = var3572
			var3552 = var3573
		else
			error("Unsupported wire type: " .. var3553)
		end
	end
	return var3551
end

function t_90:jsonEncode() --[[ line: 20034 ]]
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

function t_90:jsonDecode() --[[ line: 20068 ]]
	-- upvalues: t_90 (ref), t (ref)
	local var3578 = t_90.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3578.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3578.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3578.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3578.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3578.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3578.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var3578.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var3578.search_session_id = self.searchSessionId
	end
	return var3578
end

t_90.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_90
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p182) --[[ line: 20150 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		key = if p182 == nil or p182.key == nil then "" else p182.key,
		value = if p182 == nil or p182.value == nil then nil else p182.value
	}, t_91)
end

function t_91:encode() --[[ line: 20159 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3586 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3587, var3588 = protoModule.writeTag(buff, var3586, 1, protoModule.wireTypes.lengthDelimited)
		var3587, var3588 = protoModule.writeString(var3587, var3588, self.key)
		buff = var3587
		var3586 = var3588
	end
	if self.value ~= nil then
		local var3589 = self.value:encode()
		local var3590, var3591 = protoModule.writeTag(buff, var3586, 2, protoModule.wireTypes.lengthDelimited)
		var3590, var3591 = protoModule.writeBuffer(var3590, var3591, var3589, buffer.len(var3589))
		buff = var3590
		var3586 = var3591
	end
	local buff_1 = buffer.create(var3586)
	buffer.copy(buff_1, 0, buff, 0, var3586)
	
	return buff_1
end

function t_91.decode(p183) --[[ line: 20181 ]]
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3593 = t_91.new()
	local var3594 = 0
	while var3594 < buffer.len(p183) do
		local _ = nil
		local var3595 = nil
		local var3596, var3597, var3598 = protoModule.readTag(p183, var3594)
		local var3599 = var3596
		var3595 = var3597
		var3594 = var3598
		
		if var3595 == protoModule.wireTypes.varint then
			local _ = nil
			local var3600, var3601 = protoModule.readVarInt(p183, var3594)
			local _ = var3600
			var3594 = var3601
			continue
		end
		if var3595 == protoModule.wireTypes.lengthDelimited then
			if var3599 == 1 then
				local _ = nil
				local var3602, var3603 = protoModule.readBuffer(p183, var3594)
				var3594 = var3603
				var3593.key = buffer.tostring(var3602)
			elseif var3599 == 2 then
				local _ = nil
				local var3604, var3605 = protoModule.readBuffer(p183, var3594)
				var3594 = var3605
				var3593.value = t.FeedEntry.decode(var3604)
			else
				local _ = nil
				local var3606, var3607 = protoModule.readVarInt(p183, var3594)
				var3594 = var3607 + var3606
			end
		elseif var3595 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3608, var3609 = protoModule.readFixed32(p183, var3594)
			local _ = var3608
			var3594 = var3609
		elseif var3595 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3610, var3611 = protoModule.readFixed64(p183, var3594)
			local _ = var3610
			var3594 = var3611
		else
			error("Unsupported wire type: " .. var3595)
		end
	end
	return var3593
end

function t_91:jsonEncode() --[[ line: 20231 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_91:jsonDecode() --[[ line: 20247 ]]
	-- upvalues: t_91 (ref), t (ref)
	local var3613 = t_91.new()
	
	if self.key ~= nil then
		var3613.key = self.key
	end
	if self.value ~= nil then
		var3613.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3613
end

t_91.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_91
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p184) --[[ line: 20277 ]]
	-- upvalues: t_92 (ref)
	return setmetatable({
		key = if p184 == nil or p184.key == nil then "" else p184.key,
		value = if p184 == nil or p184.value == nil then nil else p184.value
	}, t_92)
end

function t_92:encode() --[[ line: 20286 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3615 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3616, var3617 = protoModule.writeTag(buff, var3615, 1, protoModule.wireTypes.lengthDelimited)
		var3616, var3617 = protoModule.writeString(var3616, var3617, self.key)
		buff = var3616
		var3615 = var3617
	end
	if self.value ~= nil then
		local var3618 = self.value:encode()
		local var3619, var3620 = protoModule.writeTag(buff, var3615, 2, protoModule.wireTypes.lengthDelimited)
		var3619, var3620 = protoModule.writeBuffer(var3619, var3620, var3618, buffer.len(var3618))
		buff = var3619
		var3615 = var3620
	end
	local buff_1 = buffer.create(var3615)
	buffer.copy(buff_1, 0, buff, 0, var3615)
	
	return buff_1
end

function t_92.decode(p185) --[[ line: 20308 ]]
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3622 = t_92.new()
	local var3623 = 0
	while var3623 < buffer.len(p185) do
		local _ = nil
		local var3624 = nil
		local var3625, var3626, var3627 = protoModule.readTag(p185, var3623)
		local var3628 = var3625
		var3624 = var3626
		var3623 = var3627
		
		if var3624 == protoModule.wireTypes.varint then
			local _ = nil
			local var3629, var3630 = protoModule.readVarInt(p185, var3623)
			local _ = var3629
			var3623 = var3630
			continue
		end
		if var3624 == protoModule.wireTypes.lengthDelimited then
			if var3628 == 1 then
				local _ = nil
				local var3631, var3632 = protoModule.readBuffer(p185, var3623)
				var3623 = var3632
				var3622.key = buffer.tostring(var3631)
			elseif var3628 == 2 then
				local _ = nil
				local var3633, var3634 = protoModule.readBuffer(p185, var3623)
				var3623 = var3634
				var3622.value = t.ContentPool.decode(var3633)
			else
				local _ = nil
				local var3635, var3636 = protoModule.readVarInt(p185, var3623)
				var3623 = var3636 + var3635
			end
		elseif var3624 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3637, var3638 = protoModule.readFixed32(p185, var3623)
			local _ = var3637
			var3623 = var3638
		elseif var3624 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3639, var3640 = protoModule.readFixed64(p185, var3623)
			local _ = var3639
			var3623 = var3640
		else
			error("Unsupported wire type: " .. var3624)
		end
	end
	return var3622
end

function t_92:jsonEncode() --[[ line: 20358 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_92:jsonDecode() --[[ line: 20374 ]]
	-- upvalues: t_92 (ref), t (ref)
	local var3642 = t_92.new()
	
	if self.key ~= nil then
		var3642.key = self.key
	end
	if self.value ~= nil then
		var3642.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3642
end

t_92.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_92
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p186) --[[ line: 20404 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		universe_id = if p186 == nil or p186.universe_id == nil then "" else p186.universe_id,
		is_content_locked = if p186 == nil or p186.is_content_locked == nil then false else p186.is_content_locked
	}, t_93)
end

function t_93:encode() --[[ line: 20413 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3644 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3645, var3646 = protoModule.writeTag(buff, var3644, 1, protoModule.wireTypes.lengthDelimited)
		var3645, var3646 = protoModule.writeString(var3645, var3646, self.universe_id)
		buff = var3645
		var3644 = var3646
	end
	if self.is_content_locked then
		local var3647, var3648 = protoModule.writeTag(buff, var3644, 2, protoModule.wireTypes.varint)
		var3647, var3648 = protoModule.writeVarInt(var3647, var3648, if self.is_content_locked then 1 else 0)
		buff = var3647
		var3644 = var3648
	end
	local buff_1 = buffer.create(var3644)
	buffer.copy(buff_1, 0, buff, 0, var3644)
	
	return buff_1
end

function t_93.decode(p187) --[[ line: 20432 ]]
	-- upvalues: t_93 (ref), protoModule (ref)
	local var3650 = t_93.new()
	local var3651 = 0
	while var3651 < buffer.len(p187) do
		local _ = nil
		local var3652 = nil
		local var3653, var3654, var3655 = protoModule.readTag(p187, var3651)
		local var3656 = var3653
		var3652 = var3654
		var3651 = var3655
		
		if var3652 == protoModule.wireTypes.varint then
			if var3656 == 2 then
				local _ = nil
				local var3657, var3658 = protoModule.readVarInt(p187, var3651)
				var3651 = var3658
				var3650.is_content_locked = var3657 ~= 0
			else
				local _ = nil
				local var3659, var3660 = protoModule.readVarInt(p187, var3651)
				local _ = var3659
				var3651 = var3660
			end
		end
		if var3652 == protoModule.wireTypes.lengthDelimited then
			if var3656 == 1 then
				local _ = nil
				local var3661, var3662 = protoModule.readBuffer(p187, var3651)
				var3651 = var3662
				var3650.universe_id = buffer.tostring(var3661)
			else
				local _ = nil
				local var3663, var3664 = protoModule.readVarInt(p187, var3651)
				var3651 = var3664 + var3663
			end
		elseif var3652 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3665, var3666 = protoModule.readFixed32(p187, var3651)
			local _ = var3665
			var3651 = var3666
		elseif var3652 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3667, var3668 = protoModule.readFixed64(p187, var3651)
			local _ = var3667
			var3651 = var3668
		else
			error("Unsupported wire type: " .. var3652)
		end
	end
	return var3650
end

function t_93:jsonEncode() --[[ line: 20480 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_93:jsonDecode() --[[ line: 20494 ]]
	-- upvalues: t_93 (ref)
	local var3670 = t_93.new()
	
	if self.universe_id ~= nil then
		var3670.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3670.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var3670.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var3670.is_content_locked = self.isContentLocked
	end
	return var3670
end

t_93.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_93
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p188) --[[ line: 20530 ]]
	-- upvalues: t_94 (ref)
	return setmetatable({
		overview_rich_text = if p188 == nil or p188.overview_rich_text == nil then "" else p188.overview_rich_text,
		result_entry = if p188 == nil or p188.result_entry == nil then nil else p188.result_entry,
		follow_up_queries = if p188 == nil or p188.follow_up_queries == nil then {} else p188.follow_up_queries,
		show_loading = if p188 == nil or p188.show_loading == nil then false else p188.show_loading,
		title = if p188 == nil or p188.title == nil then "" else p188.title,
		search_query = if p188 == nil or p188.search_query == nil then "" else p188.search_query,
		universe_ids = if p188 == nil or p188.universe_ids == nil then "" else p188.universe_ids
	}, t_94)
end

function t_94:encode() --[[ line: 20544 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3672 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var3673, var3674 = protoModule.writeTag(buff, var3672, 1, protoModule.wireTypes.lengthDelimited)
		var3673, var3674 = protoModule.writeString(var3673, var3674, self.overview_rich_text)
		buff = var3673
		var3672 = var3674
	end
	if self.result_entry ~= nil then
		local var3675 = self.result_entry:encode()
		local var3676, var3677 = protoModule.writeTag(buff, var3672, 2, protoModule.wireTypes.lengthDelimited)
		var3676, var3677 = protoModule.writeBuffer(var3676, var3677, var3675, buffer.len(var3675))
		buff = var3676
		var3672 = var3677
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var3678, var3679 = protoModule.writeTag(buff, var3672, 3, protoModule.wireTypes.lengthDelimited)
			var3678, var3679 = protoModule.writeString(var3678, var3679, v)
			buff = var3678
			var3672 = var3679
		end
	end
	if self.show_loading then
		local var3680, var3681 = protoModule.writeTag(buff, var3672, 4, protoModule.wireTypes.varint)
		var3680, var3681 = protoModule.writeVarInt(var3680, var3681, if self.show_loading then 1 else 0)
		buff = var3680
		var3672 = var3681
	end
	if self.title ~= nil and self.title ~= "" then
		local var3682, var3683 = protoModule.writeTag(buff, var3672, 5, protoModule.wireTypes.lengthDelimited)
		var3682, var3683 = protoModule.writeString(var3682, var3683, self.title)
		buff = var3682
		var3672 = var3683
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var3684, var3685 = protoModule.writeTag(buff, var3672, 6, protoModule.wireTypes.lengthDelimited)
		var3684, var3685 = protoModule.writeString(var3684, var3685, self.search_query)
		buff = var3684
		var3672 = var3685
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var3686, var3687 = protoModule.writeTag(buff, var3672, 8, protoModule.wireTypes.lengthDelimited)
		var3686, var3687 = protoModule.writeString(var3686, var3687, self.universe_ids)
		buff = var3686
		var3672 = var3687
	end
	local buff_1 = buffer.create(var3672)
	buffer.copy(buff_1, 0, buff, 0, var3672)
	
	return buff_1
end

function t_94.decode(p189) --[[ line: 20591 ]]
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var3689 = t_94.new()
	local var3690 = 0
	while var3690 < buffer.len(p189) do
		local _ = nil
		local var3691 = nil
		local var3692, var3693, var3694 = protoModule.readTag(p189, var3690)
		local var3695 = var3692
		var3691 = var3693
		var3690 = var3694
		
		if var3691 == protoModule.wireTypes.varint then
			if var3695 == 4 then
				local _ = nil
				local var3696, var3697 = protoModule.readVarInt(p189, var3690)
				var3690 = var3697
				var3689.show_loading = var3696 ~= 0
			else
				local _ = nil
				local var3698, var3699 = protoModule.readVarInt(p189, var3690)
				local _ = var3698
				var3690 = var3699
			end
		end
		if var3691 == protoModule.wireTypes.lengthDelimited then
			if var3695 == 1 then
				local _ = nil
				local var3700, var3701 = protoModule.readBuffer(p189, var3690)
				var3690 = var3701
				var3689.overview_rich_text = buffer.tostring(var3700)
			elseif var3695 == 2 then
				local _ = nil
				local var3702, var3703 = protoModule.readBuffer(p189, var3690)
				var3690 = var3703
				var3689.result_entry = t.FeedEntry.decode(var3702)
			elseif var3695 == 3 then
				local _ = nil
				local var3704, var3705 = protoModule.readBuffer(p189, var3690)
				var3690 = var3705
				table.insert(var3689.follow_up_queries, buffer.tostring(var3704))
			elseif var3695 == 5 then
				local _ = nil
				local var3706, var3707 = protoModule.readBuffer(p189, var3690)
				var3690 = var3707
				var3689.title = buffer.tostring(var3706)
			elseif var3695 == 6 then
				local _ = nil
				local var3708, var3709 = protoModule.readBuffer(p189, var3690)
				var3690 = var3709
				var3689.search_query = buffer.tostring(var3708)
			elseif var3695 == 8 then
				local _ = nil
				local var3710, var3711 = protoModule.readBuffer(p189, var3690)
				var3690 = var3711
				var3689.universe_ids = buffer.tostring(var3710)
			else
				local _ = nil
				local var3712, var3713 = protoModule.readVarInt(p189, var3690)
				var3690 = var3713 + var3712
			end
		elseif var3691 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3714, var3715 = protoModule.readFixed32(p189, var3690)
			local _ = var3714
			var3690 = var3715
		elseif var3691 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3716, var3717 = protoModule.readFixed64(p189, var3690)
			local _ = var3716
			var3690 = var3717
		else
			error("Unsupported wire type: " .. var3691)
		end
	end
	return var3689
end

function t_94:jsonEncode() --[[ line: 20664 ]]
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

function t_94:jsonDecode() --[[ line: 20702 ]]
	-- upvalues: t_94 (ref), t (ref)
	local var3720 = t_94.new()
	
	if self.overview_rich_text ~= nil then
		var3720.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var3720.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var3720.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var3720.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var3720.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var3720.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var3720.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var3720.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var3720.title = self.title
	end
	if self.search_query ~= nil then
		var3720.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var3720.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var3720.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var3720.universe_ids = self.universeIds
	end
	return var3720
end

t_94.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_94
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p190) --[[ line: 20784 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		title = if p190 == nil or p190.title == nil then "" else p190.title,
		user_items = if p190 == nil or p190.user_items == nil then {} else p190.user_items,
		max_visible_rows = if p190 == nil or p190.max_visible_rows == nil then 0 else p190.max_visible_rows,
		sort_id = if p190 == nil or p190.sort_id == nil then nil else p190.sort_id
	}, t_95)
end

function t_95:encode() --[[ line: 20793 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3724 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3725, var3726 = protoModule.writeTag(buff, var3724, 1, protoModule.wireTypes.lengthDelimited)
		var3725, var3726 = protoModule.writeString(var3725, var3726, self.title)
		buff = var3725
		var3724 = var3726
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var3727 = v:encode()
			local var3728, var3729 = protoModule.writeTag(buff, var3724, 2, protoModule.wireTypes.lengthDelimited)
			var3728, var3729 = protoModule.writeBuffer(var3728, var3729, var3727, buffer.len(var3727))
			buff = var3728
			var3724 = var3729
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3730, var3731 = protoModule.writeTag(buff, var3724, 3, protoModule.wireTypes.varint)
		var3730, var3731 = protoModule.writeVarInt(var3730, var3731, self.max_visible_rows)
		buff = var3730
		var3724 = var3731
	end
	if self.sort_id ~= nil then
		local var3732, var3733 = protoModule.writeTag(buff, var3724, 4, protoModule.wireTypes.lengthDelimited)
		var3732, var3733 = protoModule.writeString(var3732, var3733, self.sort_id)
		buff = var3732
		var3724 = var3733
	end
	local buff_1 = buffer.create(var3724)
	buffer.copy(buff_1, 0, buff, 0, var3724)
	
	return buff_1
end

function t_95.decode(p191) --[[ line: 20825 ]]
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var3735 = t_95.new()
	local var3736 = 0
	while var3736 < buffer.len(p191) do
		local _ = nil
		local var3737 = nil
		local var3738, var3739, var3740 = protoModule.readTag(p191, var3736)
		local var3741 = var3738
		var3737 = var3739
		var3736 = var3740
		
		if var3737 == protoModule.wireTypes.varint then
			if var3741 == 3 then
				local _ = nil
				local var3742, var3743 = protoModule.readVarIntI32(p191, var3736)
				var3736 = var3743
				var3735.max_visible_rows = var3742
			else
				local _ = nil
				local var3744, var3745 = protoModule.readVarInt(p191, var3736)
				local _ = var3744
				var3736 = var3745
			end
		end
		if var3737 == protoModule.wireTypes.lengthDelimited then
			if var3741 == 1 then
				local _ = nil
				local var3746, var3747 = protoModule.readBuffer(p191, var3736)
				var3736 = var3747
				var3735.title = buffer.tostring(var3746)
			elseif var3741 == 2 then
				local _ = nil
				local var3748, var3749 = protoModule.readBuffer(p191, var3736)
				var3736 = var3749
				table.insert(var3735.user_items, t.UserListInputData_UserItem.decode(var3748))
			elseif var3741 == 4 then
				local _ = nil
				local var3750, var3751 = protoModule.readBuffer(p191, var3736)
				var3736 = var3751
				var3735.sort_id = buffer.tostring(var3750)
			else
				local _ = nil
				local var3752, var3753 = protoModule.readVarInt(p191, var3736)
				var3736 = var3753 + var3752
			end
		elseif var3737 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3754, var3755 = protoModule.readFixed32(p191, var3736)
			local _ = var3754
			var3736 = var3755
		elseif var3737 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3756, var3757 = protoModule.readFixed64(p191, var3736)
			local _ = var3756
			var3736 = var3757
		else
			error("Unsupported wire type: " .. var3737)
		end
	end
	return var3735
end

function t_95:jsonEncode() --[[ line: 20883 ]]
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

function t_95:jsonDecode() --[[ line: 20909 ]]
	-- upvalues: t_95 (ref), t (ref)
	local var3760 = t_95.new()
	
	if self.title ~= nil then
		var3760.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3760.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3760.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3760.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3760.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3760.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3760.sort_id = self.sortId
	end
	return var3760
end

t_95.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_95
typeRegistryModule.default:register(t.UserListInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p192) --[[ line: 20967 ]]
	-- upvalues: t_96 (ref)
	return setmetatable({
		user_id = if p192 == nil or p192.user_id == nil then "" else p192.user_id
	}, t_96)
end

function t_96:encode() --[[ line: 20975 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3764 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3765, var3766 = protoModule.writeTag(buff, var3764, 1, protoModule.wireTypes.lengthDelimited)
		var3765, var3766 = protoModule.writeString(var3765, var3766, self.user_id)
		buff = var3765
		var3764 = var3766
	end
	local buff_1 = buffer.create(var3764)
	buffer.copy(buff_1, 0, buff, 0, var3764)
	
	return buff_1
end

function t_96.decode(p193) --[[ line: 20989 ]]
	-- upvalues: t_96 (ref), protoModule (ref)
	local var3768 = t_96.new()
	local var3769 = 0
	while var3769 < buffer.len(p193) do
		local _ = nil
		local var3770 = nil
		local var3771, var3772, var3773 = protoModule.readTag(p193, var3769)
		local var3774 = var3771
		var3770 = var3772
		var3769 = var3773
		
		if var3770 == protoModule.wireTypes.varint then
			local _ = nil
			local var3775, var3776 = protoModule.readVarInt(p193, var3769)
			local _ = var3775
			var3769 = var3776
			continue
		end
		if var3770 == protoModule.wireTypes.lengthDelimited then
			if var3774 == 1 then
				local _ = nil
				local var3777, var3778 = protoModule.readBuffer(p193, var3769)
				var3769 = var3778
				var3768.user_id = buffer.tostring(var3777)
			else
				local _ = nil
				local var3779, var3780 = protoModule.readVarInt(p193, var3769)
				var3769 = var3780 + var3779
			end
		elseif var3770 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3781, var3782 = protoModule.readFixed32(p193, var3769)
			local _ = var3781
			var3769 = var3782
		elseif var3770 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3783, var3784 = protoModule.readFixed64(p193, var3769)
			local _ = var3783
			var3769 = var3784
		else
			error("Unsupported wire type: " .. var3770)
		end
	end
	return var3768
end

function t_96:jsonEncode() --[[ line: 21032 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_96:jsonDecode() --[[ line: 21042 ]]
	-- upvalues: t_96 (ref)
	local var3786 = t_96.new()
	
	if self.user_id ~= nil then
		var3786.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3786.user_id = self.userId
	end
	return var3786
end

t_96.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_96
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p194) --[[ line: 21070 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		title = if p194 == nil or p194.title == nil then "" else p194.title,
		items = if p194 == nil or p194.items == nil then {} else p194.items,
		max_visible_rows = if p194 == nil or p194.max_visible_rows == nil then 0 else p194.max_visible_rows,
		sort_id = if p194 == nil or p194.sort_id == nil then nil else p194.sort_id
	}, t_97)
end

function t_97:encode() --[[ line: 21079 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3788 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3789, var3790 = protoModule.writeTag(buff, var3788, 1, protoModule.wireTypes.lengthDelimited)
		var3789, var3790 = protoModule.writeString(var3789, var3790, self.title)
		buff = var3789
		var3788 = var3790
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3791 = v:encode()
			local var3792, var3793 = protoModule.writeTag(buff, var3788, 2, protoModule.wireTypes.lengthDelimited)
			var3792, var3793 = protoModule.writeBuffer(var3792, var3793, var3791, buffer.len(var3791))
			buff = var3792
			var3788 = var3793
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3794, var3795 = protoModule.writeTag(buff, var3788, 3, protoModule.wireTypes.varint)
		var3794, var3795 = protoModule.writeVarInt(var3794, var3795, self.max_visible_rows)
		buff = var3794
		var3788 = var3795
	end
	if self.sort_id ~= nil then
		local var3796, var3797 = protoModule.writeTag(buff, var3788, 4, protoModule.wireTypes.lengthDelimited)
		var3796, var3797 = protoModule.writeString(var3796, var3797, self.sort_id)
		buff = var3796
		var3788 = var3797
	end
	local buff_1 = buffer.create(var3788)
	buffer.copy(buff_1, 0, buff, 0, var3788)
	
	return buff_1
end

function t_97.decode(p195) --[[ line: 21111 ]]
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var3799 = t_97.new()
	local var3800 = 0
	while var3800 < buffer.len(p195) do
		local _ = nil
		local var3801 = nil
		local var3802, var3803, var3804 = protoModule.readTag(p195, var3800)
		local var3805 = var3802
		var3801 = var3803
		var3800 = var3804
		
		if var3801 == protoModule.wireTypes.varint then
			if var3805 == 3 then
				local _ = nil
				local var3806, var3807 = protoModule.readVarIntI32(p195, var3800)
				var3800 = var3807
				var3799.max_visible_rows = var3806
			else
				local _ = nil
				local var3808, var3809 = protoModule.readVarInt(p195, var3800)
				local _ = var3808
				var3800 = var3809
			end
		end
		if var3801 == protoModule.wireTypes.lengthDelimited then
			if var3805 == 1 then
				local _ = nil
				local var3810, var3811 = protoModule.readBuffer(p195, var3800)
				var3800 = var3811
				var3799.title = buffer.tostring(var3810)
			elseif var3805 == 2 then
				local _ = nil
				local var3812, var3813 = protoModule.readBuffer(p195, var3800)
				var3800 = var3813
				table.insert(var3799.items, t.CatalogItemListInputData_CatalogItem.decode(var3812))
			elseif var3805 == 4 then
				local _ = nil
				local var3814, var3815 = protoModule.readBuffer(p195, var3800)
				var3800 = var3815
				var3799.sort_id = buffer.tostring(var3814)
			else
				local _ = nil
				local var3816, var3817 = protoModule.readVarInt(p195, var3800)
				var3800 = var3817 + var3816
			end
		elseif var3801 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3818, var3819 = protoModule.readFixed32(p195, var3800)
			local _ = var3818
			var3800 = var3819
		elseif var3801 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3820, var3821 = protoModule.readFixed64(p195, var3800)
			local _ = var3820
			var3800 = var3821
		else
			error("Unsupported wire type: " .. var3801)
		end
	end
	return var3799
end

function t_97:jsonEncode() --[[ line: 21169 ]]
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

function t_97:jsonDecode() --[[ line: 21195 ]]
	-- upvalues: t_97 (ref), t (ref)
	local var3824 = t_97.new()
	
	if self.title ~= nil then
		var3824.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3824.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3824.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3824.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3824.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3824.sort_id = self.sortId
	end
	return var3824
end

t_97.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_97
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p196) --[[ line: 21244 ]]
	-- upvalues: t_98 (ref)
	return setmetatable({
		item_id = if p196 == nil or p196.item_id == nil then "" else p196.item_id,
		item_type = if p196 == nil or p196.item_type == nil then "" else p196.item_type
	}, t_98)
end

function t_98:encode() --[[ line: 21253 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3827 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3828, var3829 = protoModule.writeTag(buff, var3827, 1, protoModule.wireTypes.lengthDelimited)
		var3828, var3829 = protoModule.writeString(var3828, var3829, self.item_id)
		buff = var3828
		var3827 = var3829
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3830, var3831 = protoModule.writeTag(buff, var3827, 2, protoModule.wireTypes.lengthDelimited)
		var3830, var3831 = protoModule.writeString(var3830, var3831, self.item_type)
		buff = var3830
		var3827 = var3831
	end
	local buff_1 = buffer.create(var3827)
	buffer.copy(buff_1, 0, buff, 0, var3827)
	
	return buff_1
end

function t_98.decode(p197) --[[ line: 21272 ]]
	-- upvalues: t_98 (ref), protoModule (ref)
	local var3833 = t_98.new()
	local var3834 = 0
	while var3834 < buffer.len(p197) do
		local _ = nil
		local var3835 = nil
		local var3836, var3837, var3838 = protoModule.readTag(p197, var3834)
		local var3839 = var3836
		var3835 = var3837
		var3834 = var3838
		
		if var3835 == protoModule.wireTypes.varint then
			local _ = nil
			local var3840, var3841 = protoModule.readVarInt(p197, var3834)
			local _ = var3840
			var3834 = var3841
			continue
		end
		if var3835 == protoModule.wireTypes.lengthDelimited then
			if var3839 == 1 then
				local _ = nil
				local var3842, var3843 = protoModule.readBuffer(p197, var3834)
				var3834 = var3843
				var3833.item_id = buffer.tostring(var3842)
			elseif var3839 == 2 then
				local _ = nil
				local var3844, var3845 = protoModule.readBuffer(p197, var3834)
				var3834 = var3845
				var3833.item_type = buffer.tostring(var3844)
			else
				local _ = nil
				local var3846, var3847 = protoModule.readVarInt(p197, var3834)
				var3834 = var3847 + var3846
			end
		elseif var3835 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3848, var3849 = protoModule.readFixed32(p197, var3834)
			local _ = var3848
			var3834 = var3849
		elseif var3835 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3850, var3851 = protoModule.readFixed64(p197, var3834)
			local _ = var3850
			var3834 = var3851
		else
			error("Unsupported wire type: " .. var3835)
		end
	end
	return var3833
end

function t_98:jsonEncode() --[[ line: 21320 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_98:jsonDecode() --[[ line: 21334 ]]
	-- upvalues: t_98 (ref)
	local var3853 = t_98.new()
	
	if self.item_id ~= nil then
		var3853.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3853.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3853.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3853.item_type = self.itemType
	end
	return var3853
end

t_98.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_98
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p198) --[[ line: 21372 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		universe_id = if p198 == nil or p198.universe_id == nil then "" else p198.universe_id
	}, t_99)
end

function t_99:encode() --[[ line: 21380 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3855 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3856, var3857 = protoModule.writeTag(buff, var3855, 1, protoModule.wireTypes.lengthDelimited)
		var3856, var3857 = protoModule.writeString(var3856, var3857, self.universe_id)
		buff = var3856
		var3855 = var3857
	end
	local buff_1 = buffer.create(var3855)
	buffer.copy(buff_1, 0, buff, 0, var3855)
	
	return buff_1
end

function t_99.decode(p199) --[[ line: 21394 ]]
	-- upvalues: t_99 (ref), protoModule (ref)
	local var3859 = t_99.new()
	local var3860 = 0
	while var3860 < buffer.len(p199) do
		local _ = nil
		local var3861 = nil
		local var3862, var3863, var3864 = protoModule.readTag(p199, var3860)
		local var3865 = var3862
		var3861 = var3863
		var3860 = var3864
		
		if var3861 == protoModule.wireTypes.varint then
			local _ = nil
			local var3866, var3867 = protoModule.readVarInt(p199, var3860)
			local _ = var3866
			var3860 = var3867
			continue
		end
		if var3861 == protoModule.wireTypes.lengthDelimited then
			if var3865 == 1 then
				local _ = nil
				local var3868, var3869 = protoModule.readBuffer(p199, var3860)
				var3860 = var3869
				var3859.universe_id = buffer.tostring(var3868)
			else
				local _ = nil
				local var3870, var3871 = protoModule.readVarInt(p199, var3860)
				var3860 = var3871 + var3870
			end
		elseif var3861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3872, var3873 = protoModule.readFixed32(p199, var3860)
			local _ = var3872
			var3860 = var3873
		elseif var3861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3874, var3875 = protoModule.readFixed64(p199, var3860)
			local _ = var3874
			var3860 = var3875
		else
			error("Unsupported wire type: " .. var3861)
		end
	end
	return var3859
end

function t_99:jsonEncode() --[[ line: 21437 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_99:jsonDecode() --[[ line: 21447 ]]
	-- upvalues: t_99 (ref)
	local var3877 = t_99.new()
	
	if self.universe_id ~= nil then
		var3877.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3877.universe_id = self.universeId
	end
	return var3877
end

t_99.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_99
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p200) --[[ line: 21477 ]]
	-- upvalues: t_100 (ref)
	return setmetatable({
		title = if p200 == nil or p200.title == nil then "" else p200.title,
		subtitle = if p200 == nil or p200.subtitle == nil then "" else p200.subtitle,
		moment_items = if p200 == nil or p200.moment_items == nil then {} else p200.moment_items
	}, t_100)
end

function t_100:encode() --[[ line: 21485 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3879 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3880, var3881 = protoModule.writeTag(buff, var3879, 1, protoModule.wireTypes.lengthDelimited)
		var3880, var3881 = protoModule.writeString(var3880, var3881, self.title)
		buff = var3880
		var3879 = var3881
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3882, var3883 = protoModule.writeTag(buff, var3879, 2, protoModule.wireTypes.lengthDelimited)
		var3882, var3883 = protoModule.writeString(var3882, var3883, self.subtitle)
		buff = var3882
		var3879 = var3883
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3884 = v:encode()
			local var3885, var3886 = protoModule.writeTag(buff, var3879, 3, protoModule.wireTypes.lengthDelimited)
			var3885, var3886 = protoModule.writeBuffer(var3885, var3886, var3884, buffer.len(var3884))
			buff = var3885
			var3879 = var3886
		end
	end
	local buff_1 = buffer.create(var3879)
	buffer.copy(buff_1, 0, buff, 0, var3879)
	
	return buff_1
end

function t_100.decode(p201) --[[ line: 21512 ]]
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var3888 = t_100.new()
	local var3889 = 0
	while var3889 < buffer.len(p201) do
		local _ = nil
		local var3890 = nil
		local var3891, var3892, var3893 = protoModule.readTag(p201, var3889)
		local var3894 = var3891
		var3890 = var3892
		var3889 = var3893
		
		if var3890 == protoModule.wireTypes.varint then
			local _ = nil
			local var3895, var3896 = protoModule.readVarInt(p201, var3889)
			local _ = var3895
			var3889 = var3896
			continue
		end
		if var3890 == protoModule.wireTypes.lengthDelimited then
			if var3894 == 1 then
				local _ = nil
				local var3897, var3898 = protoModule.readBuffer(p201, var3889)
				var3889 = var3898
				var3888.title = buffer.tostring(var3897)
			elseif var3894 == 2 then
				local _ = nil
				local var3899, var3900 = protoModule.readBuffer(p201, var3889)
				var3889 = var3900
				var3888.subtitle = buffer.tostring(var3899)
			elseif var3894 == 3 then
				local _ = nil
				local var3901, var3902 = protoModule.readBuffer(p201, var3889)
				var3889 = var3902
				table.insert(var3888.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3901))
			else
				local _ = nil
				local var3903, var3904 = protoModule.readVarInt(p201, var3889)
				var3889 = var3904 + var3903
			end
		elseif var3890 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3905, var3906 = protoModule.readFixed32(p201, var3889)
			local _ = var3905
			var3889 = var3906
		elseif var3890 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3907, var3908 = protoModule.readFixed64(p201, var3889)
			local _ = var3907
			var3889 = var3908
		else
			error("Unsupported wire type: " .. var3890)
		end
	end
	return var3888
end

function t_100:jsonEncode() --[[ line: 21565 ]]
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

function t_100:jsonDecode() --[[ line: 21587 ]]
	-- upvalues: t_100 (ref), t (ref)
	local var3911 = t_100.new()
	
	if self.title ~= nil then
		var3911.title = self.title
	end
	if self.subtitle ~= nil then
		var3911.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3911.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3911.moment_items = t_1
	end
	return var3911
end

t_100.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_100
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p202) --[[ line: 21633 ]]
	-- upvalues: t_101 (ref)
	return setmetatable({
		moment_id = if p202 == nil or p202.moment_id == nil then "" else p202.moment_id,
		video_asset_id = if p202 == nil or p202.video_asset_id == nil then "" else p202.video_asset_id,
		target_universe_id = if p202 == nil or p202.target_universe_id == nil then "" else p202.target_universe_id,
		target_place_id = if p202 == nil or p202.target_place_id == nil then "" else p202.target_place_id,
		feed_item_id = if p202 == nil or p202.feed_item_id == nil then "" else p202.feed_item_id,
		capture_universe_id = if p202 == nil or p202.capture_universe_id == nil then "" else p202.capture_universe_id
	}, t_101)
end

function t_101:encode() --[[ line: 21648 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3915 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3916, var3917 = protoModule.writeTag(buff, var3915, 1, protoModule.wireTypes.lengthDelimited)
		var3916, var3917 = protoModule.writeString(var3916, var3917, self.moment_id)
		buff = var3916
		var3915 = var3917
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3918, var3919 = protoModule.writeTag(buff, var3915, 2, protoModule.wireTypes.lengthDelimited)
		var3918, var3919 = protoModule.writeString(var3918, var3919, self.video_asset_id)
		buff = var3918
		var3915 = var3919
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3920, var3921 = protoModule.writeTag(buff, var3915, 3, protoModule.wireTypes.lengthDelimited)
		var3920, var3921 = protoModule.writeString(var3920, var3921, self.target_universe_id)
		buff = var3920
		var3915 = var3921
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3922, var3923 = protoModule.writeTag(buff, var3915, 4, protoModule.wireTypes.lengthDelimited)
		var3922, var3923 = protoModule.writeString(var3922, var3923, self.target_place_id)
		buff = var3922
		var3915 = var3923
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3924, var3925 = protoModule.writeTag(buff, var3915, 5, protoModule.wireTypes.lengthDelimited)
		var3924, var3925 = protoModule.writeString(var3924, var3925, self.feed_item_id)
		buff = var3924
		var3915 = var3925
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3926, var3927 = protoModule.writeTag(buff, var3915, 6, protoModule.wireTypes.lengthDelimited)
		var3926, var3927 = protoModule.writeString(var3926, var3927, self.capture_universe_id)
		buff = var3926
		var3915 = var3927
	end
	local buff_1 = buffer.create(var3915)
	buffer.copy(buff_1, 0, buff, 0, var3915)
	
	return buff_1
end

function t_101.decode(p203) --[[ line: 21687 ]]
	-- upvalues: t_101 (ref), protoModule (ref)
	local var3929 = t_101.new()
	local var3930 = 0
	while var3930 < buffer.len(p203) do
		local _ = nil
		local var3931 = nil
		local var3932, var3933, var3934 = protoModule.readTag(p203, var3930)
		local var3935 = var3932
		var3931 = var3933
		var3930 = var3934
		
		if var3931 == protoModule.wireTypes.varint then
			local _ = nil
			local var3936, var3937 = protoModule.readVarInt(p203, var3930)
			local _ = var3936
			var3930 = var3937
			continue
		end
		if var3931 == protoModule.wireTypes.lengthDelimited then
			if var3935 == 1 then
				local _ = nil
				local var3938, var3939 = protoModule.readBuffer(p203, var3930)
				var3930 = var3939
				var3929.moment_id = buffer.tostring(var3938)
			elseif var3935 == 2 then
				local _ = nil
				local var3940, var3941 = protoModule.readBuffer(p203, var3930)
				var3930 = var3941
				var3929.video_asset_id = buffer.tostring(var3940)
			elseif var3935 == 3 then
				local _ = nil
				local var3942, var3943 = protoModule.readBuffer(p203, var3930)
				var3930 = var3943
				var3929.target_universe_id = buffer.tostring(var3942)
			elseif var3935 == 4 then
				local _ = nil
				local var3944, var3945 = protoModule.readBuffer(p203, var3930)
				var3930 = var3945
				var3929.target_place_id = buffer.tostring(var3944)
			elseif var3935 == 5 then
				local _ = nil
				local var3946, var3947 = protoModule.readBuffer(p203, var3930)
				var3930 = var3947
				var3929.feed_item_id = buffer.tostring(var3946)
			elseif var3935 == 6 then
				local _ = nil
				local var3948, var3949 = protoModule.readBuffer(p203, var3930)
				var3930 = var3949
				var3929.capture_universe_id = buffer.tostring(var3948)
			else
				local _ = nil
				local var3950, var3951 = protoModule.readVarInt(p203, var3930)
				var3930 = var3951 + var3950
			end
		elseif var3931 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3952, var3953 = protoModule.readFixed32(p203, var3930)
			local _ = var3952
			var3930 = var3953
		elseif var3931 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3954, var3955 = protoModule.readFixed64(p203, var3930)
			local _ = var3954
			var3930 = var3955
		else
			error("Unsupported wire type: " .. var3931)
		end
	end
	return var3929
end

function t_101:jsonEncode() --[[ line: 21755 ]]
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

function t_101:jsonDecode() --[[ line: 21785 ]]
	-- upvalues: t_101 (ref)
	local var3957 = t_101.new()
	
	if self.moment_id ~= nil then
		var3957.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3957.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3957.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3957.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3957.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3957.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3957.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3957.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3957.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3957.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3957.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3957.capture_universe_id = self.captureUniverseId
	end
	return var3957
end

t_101.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_101
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p204) --[[ line: 21855 ]]
	-- upvalues: t_102 (ref)
	return setmetatable({
		title = if p204 == nil or p204.title == nil then "" else p204.title,
		subtitle = if p204 == nil or p204.subtitle == nil then "" else p204.subtitle
	}, t_102)
end

function t_102:encode() --[[ line: 21862 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3959 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3960, var3961 = protoModule.writeTag(buff, var3959, 1, protoModule.wireTypes.lengthDelimited)
		var3960, var3961 = protoModule.writeString(var3960, var3961, self.title)
		buff = var3960
		var3959 = var3961
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3962, var3963 = protoModule.writeTag(buff, var3959, 2, protoModule.wireTypes.lengthDelimited)
		var3962, var3963 = protoModule.writeString(var3962, var3963, self.subtitle)
		buff = var3962
		var3959 = var3963
	end
	local buff_1 = buffer.create(var3959)
	buffer.copy(buff_1, 0, buff, 0, var3959)
	
	return buff_1
end

function t_102.decode(p205) --[[ line: 21881 ]]
	-- upvalues: t_102 (ref), protoModule (ref)
	local var3965 = t_102.new()
	local var3966 = 0
	while var3966 < buffer.len(p205) do
		local _ = nil
		local var3967 = nil
		local var3968, var3969, var3970 = protoModule.readTag(p205, var3966)
		local var3971 = var3968
		var3967 = var3969
		var3966 = var3970
		
		if var3967 == protoModule.wireTypes.varint then
			local _ = nil
			local var3972, var3973 = protoModule.readVarInt(p205, var3966)
			local _ = var3972
			var3966 = var3973
			continue
		end
		if var3967 == protoModule.wireTypes.lengthDelimited then
			if var3971 == 1 then
				local _ = nil
				local var3974, var3975 = protoModule.readBuffer(p205, var3966)
				var3966 = var3975
				var3965.title = buffer.tostring(var3974)
			elseif var3971 == 2 then
				local _ = nil
				local var3976, var3977 = protoModule.readBuffer(p205, var3966)
				var3966 = var3977
				var3965.subtitle = buffer.tostring(var3976)
			else
				local _ = nil
				local var3978, var3979 = protoModule.readVarInt(p205, var3966)
				var3966 = var3979 + var3978
			end
		elseif var3967 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3980, var3981 = protoModule.readFixed32(p205, var3966)
			local _ = var3980
			var3966 = var3981
		elseif var3967 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3982, var3983 = protoModule.readFixed64(p205, var3966)
			local _ = var3982
			var3966 = var3983
		else
			error("Unsupported wire type: " .. var3967)
		end
	end
	return var3965
end

function t_102:jsonEncode() --[[ line: 21929 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_102:jsonDecode() --[[ line: 21943 ]]
	-- upvalues: t_102 (ref)
	local var3985 = t_102.new()
	
	if self.title ~= nil then
		var3985.title = self.title
	end
	if self.subtitle ~= nil then
		var3985.subtitle = self.subtitle
	end
	return var3985
end

t_102.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_102
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p206) --[[ line: 21971 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		primary_cta_button_text = if p206 == nil or p206.primary_cta_button_text == nil then "" else p206.primary_cta_button_text,
		secondary_cta_button_text = if p206 == nil or p206.secondary_cta_button_text == nil then "" else p206.secondary_cta_button_text
	}, t_103)
end

function t_103:encode() --[[ line: 21982 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3987 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3988, var3989 = protoModule.writeTag(buff, var3987, 1, protoModule.wireTypes.lengthDelimited)
		var3988, var3989 = protoModule.writeString(var3988, var3989, self.primary_cta_button_text)
		buff = var3988
		var3987 = var3989
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3990, var3991 = protoModule.writeTag(buff, var3987, 2, protoModule.wireTypes.lengthDelimited)
		var3990, var3991 = protoModule.writeString(var3990, var3991, self.secondary_cta_button_text)
		buff = var3990
		var3987 = var3991
	end
	local buff_1 = buffer.create(var3987)
	buffer.copy(buff_1, 0, buff, 0, var3987)
	
	return buff_1
end

function t_103.decode(p207) --[[ line: 22001 ]]
	-- upvalues: t_103 (ref), protoModule (ref)
	local var3993 = t_103.new()
	local var3994 = 0
	while var3994 < buffer.len(p207) do
		local _ = nil
		local var3995 = nil
		local var3996, var3997, var3998 = protoModule.readTag(p207, var3994)
		local var3999 = var3996
		var3995 = var3997
		var3994 = var3998
		
		if var3995 == protoModule.wireTypes.varint then
			local _ = nil
			local var4000, var4001 = protoModule.readVarInt(p207, var3994)
			local _ = var4000
			var3994 = var4001
			continue
		end
		if var3995 == protoModule.wireTypes.lengthDelimited then
			if var3999 == 1 then
				local _ = nil
				local var4002, var4003 = protoModule.readBuffer(p207, var3994)
				var3994 = var4003
				var3993.primary_cta_button_text = buffer.tostring(var4002)
			elseif var3999 == 2 then
				local _ = nil
				local var4004, var4005 = protoModule.readBuffer(p207, var3994)
				var3994 = var4005
				var3993.secondary_cta_button_text = buffer.tostring(var4004)
			else
				local _ = nil
				local var4006, var4007 = protoModule.readVarInt(p207, var3994)
				var3994 = var4007 + var4006
			end
		elseif var3995 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4008, var4009 = protoModule.readFixed32(p207, var3994)
			local _ = var4008
			var3994 = var4009
		elseif var3995 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4010, var4011 = protoModule.readFixed64(p207, var3994)
			local _ = var4010
			var3994 = var4011
		else
			error("Unsupported wire type: " .. var3995)
		end
	end
	return var3993
end

function t_103:jsonEncode() --[[ line: 22049 ]]
	local t = {}
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		t.primaryCtaButtonText = self.primary_cta_button_text
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		t.secondaryCtaButtonText = self.secondary_cta_button_text
	end
	return t
end

function t_103:jsonDecode() --[[ line: 22063 ]]
	-- upvalues: t_103 (ref)
	local var4013 = t_103.new()
	
	if self.primary_cta_button_text ~= nil then
		var4013.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var4013.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var4013.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var4013.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	return var4013
end

t_103.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_103
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p208) --[[ line: 22099 ]]
	-- upvalues: t_104 (ref)
	return setmetatable({
		image_asset_id = if p208 == nil or p208.image_asset_id == nil then "" else p208.image_asset_id
	}, t_104)
end

function t_104:encode() --[[ line: 22105 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4015 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var4016, var4017 = protoModule.writeTag(buff, var4015, 1, protoModule.wireTypes.lengthDelimited)
		var4016, var4017 = protoModule.writeString(var4016, var4017, self.image_asset_id)
		buff = var4016
		var4015 = var4017
	end
	local buff_1 = buffer.create(var4015)
	buffer.copy(buff_1, 0, buff, 0, var4015)
	
	return buff_1
end

function t_104.decode(p209) --[[ line: 22119 ]]
	-- upvalues: t_104 (ref), protoModule (ref)
	local var4019 = t_104.new()
	local var4020 = 0
	while var4020 < buffer.len(p209) do
		local _ = nil
		local var4021 = nil
		local var4022, var4023, var4024 = protoModule.readTag(p209, var4020)
		local var4025 = var4022
		var4021 = var4023
		var4020 = var4024
		
		if var4021 == protoModule.wireTypes.varint then
			local _ = nil
			local var4026, var4027 = protoModule.readVarInt(p209, var4020)
			local _ = var4026
			var4020 = var4027
			continue
		end
		if var4021 == protoModule.wireTypes.lengthDelimited then
			if var4025 == 1 then
				local _ = nil
				local var4028, var4029 = protoModule.readBuffer(p209, var4020)
				var4020 = var4029
				var4019.image_asset_id = buffer.tostring(var4028)
			else
				local _ = nil
				local var4030, var4031 = protoModule.readVarInt(p209, var4020)
				var4020 = var4031 + var4030
			end
		elseif var4021 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4032, var4033 = protoModule.readFixed32(p209, var4020)
			local _ = var4032
			var4020 = var4033
		elseif var4021 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4034, var4035 = protoModule.readFixed64(p209, var4020)
			local _ = var4034
			var4020 = var4035
		else
			error("Unsupported wire type: " .. var4021)
		end
	end
	return var4019
end

function t_104:jsonEncode() --[[ line: 22162 ]]
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_104:jsonDecode() --[[ line: 22172 ]]
	-- upvalues: t_104 (ref)
	local var4037 = t_104.new()
	
	if self.image_asset_id ~= nil then
		var4037.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4037.image_asset_id = self.imageAssetId
	end
	return var4037
end

t_104.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_104
typeRegistryModule.default:register(t.ImageInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p210) --[[ line: 22200 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		video_asset_id = if p210 == nil or p210.video_asset_id == nil then "" else p210.video_asset_id
	}, t_105)
end

function t_105:encode() --[[ line: 22206 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4039 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var4040, var4041 = protoModule.writeTag(buff, var4039, 1, protoModule.wireTypes.lengthDelimited)
		var4040, var4041 = protoModule.writeString(var4040, var4041, self.video_asset_id)
		buff = var4040
		var4039 = var4041
	end
	local buff_1 = buffer.create(var4039)
	buffer.copy(buff_1, 0, buff, 0, var4039)
	
	return buff_1
end

function t_105.decode(p211) --[[ line: 22220 ]]
	-- upvalues: t_105 (ref), protoModule (ref)
	local var4043 = t_105.new()
	local var4044 = 0
	while var4044 < buffer.len(p211) do
		local _ = nil
		local var4045 = nil
		local var4046, var4047, var4048 = protoModule.readTag(p211, var4044)
		local var4049 = var4046
		var4045 = var4047
		var4044 = var4048
		
		if var4045 == protoModule.wireTypes.varint then
			local _ = nil
			local var4050, var4051 = protoModule.readVarInt(p211, var4044)
			local _ = var4050
			var4044 = var4051
			continue
		end
		if var4045 == protoModule.wireTypes.lengthDelimited then
			if var4049 == 1 then
				local _ = nil
				local var4052, var4053 = protoModule.readBuffer(p211, var4044)
				var4044 = var4053
				var4043.video_asset_id = buffer.tostring(var4052)
			else
				local _ = nil
				local var4054, var4055 = protoModule.readVarInt(p211, var4044)
				var4044 = var4055 + var4054
			end
		elseif var4045 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4056, var4057 = protoModule.readFixed32(p211, var4044)
			local _ = var4056
			var4044 = var4057
		elseif var4045 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4058, var4059 = protoModule.readFixed64(p211, var4044)
			local _ = var4058
			var4044 = var4059
		else
			error("Unsupported wire type: " .. var4045)
		end
	end
	return var4043
end

function t_105:jsonEncode() --[[ line: 22263 ]]
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	return t
end

function t_105:jsonDecode() --[[ line: 22273 ]]
	-- upvalues: t_105 (ref)
	local var4061 = t_105.new()
	
	if self.video_asset_id ~= nil then
		var4061.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4061.video_asset_id = self.videoAssetId
	end
	return var4061
end

t_105.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_105
typeRegistryModule.default:register(t.VideoInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p212) --[[ line: 22301 ]]
	-- upvalues: t_106 (ref)
	return setmetatable({
		text = if p212 == nil or p212.text == nil then "" else p212.text,
		is_rendered_text = if p212 == nil or p212.is_rendered_text == nil then false else p212.is_rendered_text
	}, t_106)
end

function t_106:encode() --[[ line: 22308 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4063 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var4064, var4065 = protoModule.writeTag(buff, var4063, 1, protoModule.wireTypes.lengthDelimited)
		var4064, var4065 = protoModule.writeString(var4064, var4065, self.text)
		buff = var4064
		var4063 = var4065
	end
	if self.is_rendered_text then
		local var4066, var4067 = protoModule.writeTag(buff, var4063, 2, protoModule.wireTypes.varint)
		var4066, var4067 = protoModule.writeVarInt(var4066, var4067, if self.is_rendered_text then 1 else 0)
		buff = var4066
		var4063 = var4067
	end
	local buff_1 = buffer.create(var4063)
	buffer.copy(buff_1, 0, buff, 0, var4063)
	
	return buff_1
end

function t_106.decode(p213) --[[ line: 22327 ]]
	-- upvalues: t_106 (ref), protoModule (ref)
	local var4069 = t_106.new()
	local var4070 = 0
	while var4070 < buffer.len(p213) do
		local _ = nil
		local var4071 = nil
		local var4072, var4073, var4074 = protoModule.readTag(p213, var4070)
		local var4075 = var4072
		var4071 = var4073
		var4070 = var4074
		
		if var4071 == protoModule.wireTypes.varint then
			if var4075 == 2 then
				local _ = nil
				local var4076, var4077 = protoModule.readVarInt(p213, var4070)
				var4070 = var4077
				var4069.is_rendered_text = var4076 ~= 0
			else
				local _ = nil
				local var4078, var4079 = protoModule.readVarInt(p213, var4070)
				local _ = var4078
				var4070 = var4079
			end
		end
		if var4071 == protoModule.wireTypes.lengthDelimited then
			if var4075 == 1 then
				local _ = nil
				local var4080, var4081 = protoModule.readBuffer(p213, var4070)
				var4070 = var4081
				var4069.text = buffer.tostring(var4080)
			else
				local _ = nil
				local var4082, var4083 = protoModule.readVarInt(p213, var4070)
				var4070 = var4083 + var4082
			end
		elseif var4071 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4084, var4085 = protoModule.readFixed32(p213, var4070)
			local _ = var4084
			var4070 = var4085
		elseif var4071 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4086, var4087 = protoModule.readFixed64(p213, var4070)
			local _ = var4086
			var4070 = var4087
		else
			error("Unsupported wire type: " .. var4071)
		end
	end
	return var4069
end

function t_106:jsonEncode() --[[ line: 22375 ]]
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_106:jsonDecode() --[[ line: 22389 ]]
	-- upvalues: t_106 (ref)
	local var4089 = t_106.new()
	
	if self.text ~= nil then
		var4089.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var4089.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var4089.is_rendered_text = self.isRenderedText
	end
	return var4089
end

t_106.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_106
typeRegistryModule.default:register(t.TextInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p214) --[[ line: 22421 ]]
	-- upvalues: t_107 (ref)
	return setmetatable({
		entry_map = if p214 == nil or p214.entry_map == nil then {} else p214.entry_map,
		entry_order = if p214 == nil or p214.entry_order == nil then {} else p214.entry_order,
		entry_order_map = if p214 == nil or p214.entry_order_map == nil then {} else p214.entry_order_map,
		content_pools = if p214 == nil or p214.content_pools == nil then {} else p214.content_pools
	}, t_107)
end

function t_107:encode() --[[ line: 22430 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4091 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var4092, var4093 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4092, var4093 = protoModule.writeString(var4092, var4093, i)
			local var4094 = v:encode()
			var4093, var4095 = protoModule.writeTag(var4092, var4093, 2, protoModule.wireTypes.lengthDelimited)
			var4093, var4095 = protoModule.writeBuffer(var4093, var4095, var4094, buffer.len(var4094))
			local var4096 = var4093
			local var4097 = var4095
			local var4098, var4099 = protoModule.writeTag(buff, var4091, 1, protoModule.wireTypes.lengthDelimited)
			var4098, var4099 = protoModule.writeBuffer(var4098, var4099, var4096, var4097)
			buff = var4098
			var4091 = var4099
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var4100, var4101 = protoModule.writeTag(buff, var4091, 2, protoModule.wireTypes.lengthDelimited)
			var4100, var4101 = protoModule.writeString(var4100, var4101, v)
			buff = var4100
			var4091 = var4101
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var4102, var4103 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4102, var4103 = protoModule.writeString(var4102, var4103, i)
			local var4104 = v:encode()
			var4103, var4105 = protoModule.writeTag(var4102, var4103, 2, protoModule.wireTypes.lengthDelimited)
			var4103, var4105 = protoModule.writeBuffer(var4103, var4105, var4104, buffer.len(var4104))
			local var4106 = var4103
			local var4107 = var4105
			local var4108, var4109 = protoModule.writeTag(buff, var4091, 3, protoModule.wireTypes.lengthDelimited)
			var4108, var4109 = protoModule.writeBuffer(var4108, var4109, var4106, var4107)
			buff = var4108
			var4091 = var4109
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var4110, var4111 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4110, var4111 = protoModule.writeString(var4110, var4111, i)
			local var4112 = v:encode()
			var4111, var4113 = protoModule.writeTag(var4110, var4111, 2, protoModule.wireTypes.lengthDelimited)
			var4111, var4113 = protoModule.writeBuffer(var4111, var4113, var4112, buffer.len(var4112))
			local var4114 = var4111
			local var4115 = var4113
			local var4116, var4117 = protoModule.writeTag(buff, var4091, 4, protoModule.wireTypes.lengthDelimited)
			var4116, var4117 = protoModule.writeBuffer(var4116, var4117, var4114, var4115)
			buff = var4116
			var4091 = var4117
		end
	end
	local buff_1 = buffer.create(var4091)
	buffer.copy(buff_1, 0, buff, 0, var4091)
	
	return buff_1
end

function t_107.decode(p215) --[[ line: 22488 ]]
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var4119 = t_107.new()
	local var4120 = 0
	while var4120 < buffer.len(p215) do
		local _ = nil
		local var4121 = nil
		local var4122, var4123, var4124 = protoModule.readTag(p215, var4120)
		local var4125 = var4122
		var4121 = var4123
		var4120 = var4124
		
		if var4121 == protoModule.wireTypes.varint then
			local _ = nil
			local var4126, var4127 = protoModule.readVarInt(p215, var4120)
			local _ = var4126
			var4120 = var4127
			continue
		end
		if var4121 == protoModule.wireTypes.lengthDelimited then
			if var4125 == 1 then
				local _ = nil
				local var4128, var4129 = protoModule.readBuffer(p215, var4120)
				var4120 = var4129
				var4128 = t.VerticalFeedInputData_EntryMapEntry.decode(var4128)
				var4119.entry_map[var4128.key or ""] = var4128.value or t.FeedEntry.new()
			elseif var4125 == 2 then
				local _ = nil
				local var4130, var4131 = protoModule.readBuffer(p215, var4120)
				var4120 = var4131
				table.insert(var4119.entry_order, buffer.tostring(var4130))
			elseif var4125 == 3 then
				local _ = nil
				local var4132, var4133 = protoModule.readBuffer(p215, var4120)
				var4120 = var4133
				var4132 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var4132)
				var4119.entry_order_map[var4132.key or ""] = var4132.value or t.EntryOrder.new()
			elseif var4125 == 4 then
				local _ = nil
				local var4134, var4135 = protoModule.readBuffer(p215, var4120)
				var4120 = var4135
				var4134 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var4134)
				var4119.content_pools[var4134.key or ""] = var4134.value or t.ContentPool.new()
			else
				local _ = nil
				local var4136, var4137 = protoModule.readVarInt(p215, var4120)
				var4120 = var4137 + var4136
			end
		elseif var4121 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4138, var4139 = protoModule.readFixed32(p215, var4120)
			local _ = var4138
			var4120 = var4139
		elseif var4121 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4140, var4141 = protoModule.readFixed64(p215, var4120)
			local _ = var4140
			var4120 = var4141
		else
			error("Unsupported wire type: " .. var4121)
		end
	end
	return var4119
end

function t_107:jsonEncode() --[[ line: 22567 ]]
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

function t_107:jsonDecode() --[[ line: 22605 ]]
	-- upvalues: t_107 (ref), t (ref)
	local var4147 = t_107.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4147.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4147.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var4147.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var4147.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4147.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4147.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4147.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4147.content_pools = t_1
	end
	return var4147
end

t_107.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_107
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p216) --[[ line: 22697 ]]
	-- upvalues: t_108 (ref)
	return setmetatable({
		key = if p216 == nil or p216.key == nil then "" else p216.key,
		value = if p216 == nil or p216.value == nil then nil else p216.value
	}, t_108)
end

function t_108:encode() --[[ line: 22706 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4157 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4158, var4159 = protoModule.writeTag(buff, var4157, 1, protoModule.wireTypes.lengthDelimited)
		var4158, var4159 = protoModule.writeString(var4158, var4159, self.key)
		buff = var4158
		var4157 = var4159
	end
	if self.value ~= nil then
		local var4160 = self.value:encode()
		local var4161, var4162 = protoModule.writeTag(buff, var4157, 2, protoModule.wireTypes.lengthDelimited)
		var4161, var4162 = protoModule.writeBuffer(var4161, var4162, var4160, buffer.len(var4160))
		buff = var4161
		var4157 = var4162
	end
	local buff_1 = buffer.create(var4157)
	buffer.copy(buff_1, 0, buff, 0, var4157)
	
	return buff_1
end

function t_108.decode(p217) --[[ line: 22726 ]]
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var4164 = t_108.new()
	local var4165 = 0
	while var4165 < buffer.len(p217) do
		local _ = nil
		local var4166 = nil
		local var4167, var4168, var4169 = protoModule.readTag(p217, var4165)
		local var4170 = var4167
		var4166 = var4168
		var4165 = var4169
		
		if var4166 == protoModule.wireTypes.varint then
			local _ = nil
			local var4171, var4172 = protoModule.readVarInt(p217, var4165)
			local _ = var4171
			var4165 = var4172
			continue
		end
		if var4166 == protoModule.wireTypes.lengthDelimited then
			if var4170 == 1 then
				local _ = nil
				local var4173, var4174 = protoModule.readBuffer(p217, var4165)
				var4165 = var4174
				var4164.key = buffer.tostring(var4173)
			elseif var4170 == 2 then
				local _ = nil
				local var4175, var4176 = protoModule.readBuffer(p217, var4165)
				var4165 = var4176
				var4164.value = t.FeedEntry.decode(var4175)
			else
				local _ = nil
				local var4177, var4178 = protoModule.readVarInt(p217, var4165)
				var4165 = var4178 + var4177
			end
		elseif var4166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4179, var4180 = protoModule.readFixed32(p217, var4165)
			local _ = var4179
			var4165 = var4180
		elseif var4166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4181, var4182 = protoModule.readFixed64(p217, var4165)
			local _ = var4181
			var4165 = var4182
		else
			error("Unsupported wire type: " .. var4166)
		end
	end
	return var4164
end

function t_108:jsonEncode() --[[ line: 22774 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_108:jsonDecode() --[[ line: 22788 ]]
	-- upvalues: t_108 (ref), t (ref)
	local var4184 = t_108.new()
	
	if self.key ~= nil then
		var4184.key = self.key
	end
	if self.value ~= nil then
		var4184.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var4184
end

t_108.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_108
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p218) --[[ line: 22818 ]]
	-- upvalues: t_109 (ref)
	return setmetatable({
		key = if p218 == nil or p218.key == nil then "" else p218.key,
		value = if p218 == nil or p218.value == nil then nil else p218.value
	}, t_109)
end

function t_109:encode() --[[ line: 22827 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4186 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4187, var4188 = protoModule.writeTag(buff, var4186, 1, protoModule.wireTypes.lengthDelimited)
		var4187, var4188 = protoModule.writeString(var4187, var4188, self.key)
		buff = var4187
		var4186 = var4188
	end
	if self.value ~= nil then
		local var4189 = self.value:encode()
		local var4190, var4191 = protoModule.writeTag(buff, var4186, 2, protoModule.wireTypes.lengthDelimited)
		var4190, var4191 = protoModule.writeBuffer(var4190, var4191, var4189, buffer.len(var4189))
		buff = var4190
		var4186 = var4191
	end
	local buff_1 = buffer.create(var4186)
	buffer.copy(buff_1, 0, buff, 0, var4186)
	
	return buff_1
end

function t_109.decode(p219) --[[ line: 22849 ]]
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var4193 = t_109.new()
	local var4194 = 0
	while var4194 < buffer.len(p219) do
		local _ = nil
		local var4195 = nil
		local var4196, var4197, var4198 = protoModule.readTag(p219, var4194)
		local var4199 = var4196
		var4195 = var4197
		var4194 = var4198
		
		if var4195 == protoModule.wireTypes.varint then
			local _ = nil
			local var4200, var4201 = protoModule.readVarInt(p219, var4194)
			local _ = var4200
			var4194 = var4201
			continue
		end
		if var4195 == protoModule.wireTypes.lengthDelimited then
			if var4199 == 1 then
				local _ = nil
				local var4202, var4203 = protoModule.readBuffer(p219, var4194)
				var4194 = var4203
				var4193.key = buffer.tostring(var4202)
			elseif var4199 == 2 then
				local _ = nil
				local var4204, var4205 = protoModule.readBuffer(p219, var4194)
				var4194 = var4205
				var4193.value = t.EntryOrder.decode(var4204)
			else
				local _ = nil
				local var4206, var4207 = protoModule.readVarInt(p219, var4194)
				var4194 = var4207 + var4206
			end
		elseif var4195 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4208, var4209 = protoModule.readFixed32(p219, var4194)
			local _ = var4208
			var4194 = var4209
		elseif var4195 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4210, var4211 = protoModule.readFixed64(p219, var4194)
			local _ = var4210
			var4194 = var4211
		else
			error("Unsupported wire type: " .. var4195)
		end
	end
	return var4193
end

function t_109:jsonEncode() --[[ line: 22899 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_109:jsonDecode() --[[ line: 22915 ]]
	-- upvalues: t_109 (ref), t (ref)
	local var4213 = t_109.new()
	
	if self.key ~= nil then
		var4213.key = self.key
	end
	if self.value ~= nil then
		var4213.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var4213
end

t_109.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_109
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p220) --[[ line: 22945 ]]
	-- upvalues: t_110 (ref)
	return setmetatable({
		key = if p220 == nil or p220.key == nil then "" else p220.key,
		value = if p220 == nil or p220.value == nil then nil else p220.value
	}, t_110)
end

function t_110:encode() --[[ line: 22954 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4215 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4216, var4217 = protoModule.writeTag(buff, var4215, 1, protoModule.wireTypes.lengthDelimited)
		var4216, var4217 = protoModule.writeString(var4216, var4217, self.key)
		buff = var4216
		var4215 = var4217
	end
	if self.value ~= nil then
		local var4218 = self.value:encode()
		local var4219, var4220 = protoModule.writeTag(buff, var4215, 2, protoModule.wireTypes.lengthDelimited)
		var4219, var4220 = protoModule.writeBuffer(var4219, var4220, var4218, buffer.len(var4218))
		buff = var4219
		var4215 = var4220
	end
	local buff_1 = buffer.create(var4215)
	buffer.copy(buff_1, 0, buff, 0, var4215)
	
	return buff_1
end

function t_110.decode(p221) --[[ line: 22974 ]]
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var4222 = t_110.new()
	local var4223 = 0
	while var4223 < buffer.len(p221) do
		local _ = nil
		local var4224 = nil
		local var4225, var4226, var4227 = protoModule.readTag(p221, var4223)
		local var4228 = var4225
		var4224 = var4226
		var4223 = var4227
		
		if var4224 == protoModule.wireTypes.varint then
			local _ = nil
			local var4229, var4230 = protoModule.readVarInt(p221, var4223)
			local _ = var4229
			var4223 = var4230
			continue
		end
		if var4224 == protoModule.wireTypes.lengthDelimited then
			if var4228 == 1 then
				local _ = nil
				local var4231, var4232 = protoModule.readBuffer(p221, var4223)
				var4223 = var4232
				var4222.key = buffer.tostring(var4231)
			elseif var4228 == 2 then
				local _ = nil
				local var4233, var4234 = protoModule.readBuffer(p221, var4223)
				var4223 = var4234
				var4222.value = t.ContentPool.decode(var4233)
			else
				local _ = nil
				local var4235, var4236 = protoModule.readVarInt(p221, var4223)
				var4223 = var4236 + var4235
			end
		elseif var4224 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4237, var4238 = protoModule.readFixed32(p221, var4223)
			local _ = var4237
			var4223 = var4238
		elseif var4224 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4239, var4240 = protoModule.readFixed64(p221, var4223)
			local _ = var4239
			var4223 = var4240
		else
			error("Unsupported wire type: " .. var4224)
		end
	end
	return var4222
end

function t_110:jsonEncode() --[[ line: 23022 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_110:jsonDecode() --[[ line: 23036 ]]
	-- upvalues: t_110 (ref), t (ref)
	local var4242 = t_110.new()
	
	if self.key ~= nil then
		var4242.key = self.key
	end
	if self.value ~= nil then
		var4242.value = t.ContentPool.jsonDecode(self.value)
	end
	return var4242
end

t_110.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p222) --[[ line: 23066 ]]
	-- upvalues: t_111 (ref)
	return setmetatable({
		foreground_header_entry = if p222 == nil or p222.foreground_header_entry == nil then nil else p222.foreground_header_entry,
		background_header_entry = if p222 == nil or p222.background_header_entry == nil then nil else p222.background_header_entry
	}, t_111)
end

function t_111:encode() --[[ line: 23077 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4244 = 0
	
	if self.foreground_header_entry ~= nil then
		local var4245 = self.foreground_header_entry:encode()
		local var4246, var4247 = protoModule.writeTag(buff, var4244, 1, protoModule.wireTypes.lengthDelimited)
		var4246, var4247 = protoModule.writeBuffer(var4246, var4247, var4245, buffer.len(var4245))
		buff = var4246
		var4244 = var4247
	end
	if self.background_header_entry ~= nil then
		local var4248 = self.background_header_entry:encode()
		local var4249, var4250 = protoModule.writeTag(buff, var4244, 2, protoModule.wireTypes.lengthDelimited)
		var4249, var4250 = protoModule.writeBuffer(var4249, var4250, var4248, buffer.len(var4248))
		buff = var4249
		var4244 = var4250
	end
	local buff_1 = buffer.create(var4244)
	buffer.copy(buff_1, 0, buff, 0, var4244)
	
	return buff_1
end

function t_111.decode(p223) --[[ line: 23098 ]]
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var4252 = t_111.new()
	local var4253 = 0
	while var4253 < buffer.len(p223) do
		local _ = nil
		local var4254 = nil
		local var4255, var4256, var4257 = protoModule.readTag(p223, var4253)
		local var4258 = var4255
		var4254 = var4256
		var4253 = var4257
		
		if var4254 == protoModule.wireTypes.varint then
			local _ = nil
			local var4259, var4260 = protoModule.readVarInt(p223, var4253)
			local _ = var4259
			var4253 = var4260
			continue
		end
		if var4254 == protoModule.wireTypes.lengthDelimited then
			if var4258 == 1 then
				local _ = nil
				local var4261, var4262 = protoModule.readBuffer(p223, var4253)
				var4253 = var4262
				var4252.foreground_header_entry = t.ForegroundHeaderEntry.decode(var4261)
			elseif var4258 == 2 then
				local _ = nil
				local var4263, var4264 = protoModule.readBuffer(p223, var4253)
				var4253 = var4264
				var4252.background_header_entry = t.BackgroundHeaderEntry.decode(var4263)
			else
				local _ = nil
				local var4265, var4266 = protoModule.readVarInt(p223, var4253)
				var4253 = var4266 + var4265
			end
		elseif var4254 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4267, var4268 = protoModule.readFixed32(p223, var4253)
			local _ = var4267
			var4253 = var4268
		elseif var4254 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4269, var4270 = protoModule.readFixed64(p223, var4253)
			local _ = var4269
			var4253 = var4270
		else
			error("Unsupported wire type: " .. var4254)
		end
	end
	return var4252
end

function t_111:jsonEncode() --[[ line: 23146 ]]
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	return t
end

function t_111:jsonDecode() --[[ line: 23160 ]]
	-- upvalues: t_111 (ref), t (ref)
	local var4272 = t_111.new()
	
	if self.foreground_header_entry ~= nil then
		var4272.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var4272.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var4272.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var4272.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	return var4272
end

t_111.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_111
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p224) --[[ line: 23196 ]]
	-- upvalues: t_112 (ref)
	return setmetatable({
		cta_button_text = if p224 == nil or p224.cta_button_text == nil then "" else p224.cta_button_text
	}, t_112)
end

function t_112:encode() --[[ line: 23204 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4274 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4275, var4276 = protoModule.writeTag(buff, var4274, 1, protoModule.wireTypes.lengthDelimited)
		var4275, var4276 = protoModule.writeString(var4275, var4276, self.cta_button_text)
		buff = var4275
		var4274 = var4276
	end
	local buff_1 = buffer.create(var4274)
	buffer.copy(buff_1, 0, buff, 0, var4274)
	
	return buff_1
end

function t_112.decode(p225) --[[ line: 23218 ]]
	-- upvalues: t_112 (ref), protoModule (ref)
	local var4278 = t_112.new()
	local var4279 = 0
	while var4279 < buffer.len(p225) do
		local _ = nil
		local var4280 = nil
		local var4281, var4282, var4283 = protoModule.readTag(p225, var4279)
		local var4284 = var4281
		var4280 = var4282
		var4279 = var4283
		
		if var4280 == protoModule.wireTypes.varint then
			local _ = nil
			local var4285, var4286 = protoModule.readVarInt(p225, var4279)
			local _ = var4285
			var4279 = var4286
			continue
		end
		if var4280 == protoModule.wireTypes.lengthDelimited then
			if var4284 == 1 then
				local _ = nil
				local var4287, var4288 = protoModule.readBuffer(p225, var4279)
				var4279 = var4288
				var4278.cta_button_text = buffer.tostring(var4287)
			else
				local _ = nil
				local var4289, var4290 = protoModule.readVarInt(p225, var4279)
				var4279 = var4290 + var4289
			end
		elseif var4280 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4291, var4292 = protoModule.readFixed32(p225, var4279)
			local _ = var4291
			var4279 = var4292
		elseif var4280 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4293, var4294 = protoModule.readFixed64(p225, var4279)
			local _ = var4293
			var4279 = var4294
		else
			error("Unsupported wire type: " .. var4280)
		end
	end
	return var4278
end

function t_112:jsonEncode() --[[ line: 23261 ]]
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	return t
end

function t_112:jsonDecode() --[[ line: 23271 ]]
	-- upvalues: t_112 (ref)
	local var4296 = t_112.new()
	
	if self.cta_button_text ~= nil then
		var4296.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4296.cta_button_text = self.ctaButtonText
	end
	return var4296
end

t_112.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_112
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p226) --[[ line: 23301 ]]
	-- upvalues: t_113 (ref)
	return setmetatable({
		items = if p226 == nil or p226.items == nil then {} else p226.items,
		sort_id = if p226 == nil or p226.sort_id == nil then "" else p226.sort_id,
		recommendation_request_id = if p226 == nil or p226.recommendation_request_id == nil then "" else p226.recommendation_request_id
	}, t_113)
end

function t_113:encode() --[[ line: 23313 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4298 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4299 = v:encode()
			local var4300, var4301 = protoModule.writeTag(buff, var4298, 1, protoModule.wireTypes.lengthDelimited)
			var4300, var4301 = protoModule.writeBuffer(var4300, var4301, var4299, buffer.len(var4299))
			buff = var4300
			var4298 = var4301
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4302, var4303 = protoModule.writeTag(buff, var4298, 2, protoModule.wireTypes.lengthDelimited)
		var4302, var4303 = protoModule.writeString(var4302, var4303, self.sort_id)
		buff = var4302
		var4298 = var4303
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var4304, var4305 = protoModule.writeTag(buff, var4298, 3, protoModule.wireTypes.lengthDelimited)
		var4304, var4305 = protoModule.writeString(var4304, var4305, self.recommendation_request_id)
		buff = var4304
		var4298 = var4305
	end
	local buff_1 = buffer.create(var4298)
	buffer.copy(buff_1, 0, buff, 0, var4298)
	
	return buff_1
end

function t_113.decode(p227) --[[ line: 23340 ]]
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var4307 = t_113.new()
	local var4308 = 0
	while var4308 < buffer.len(p227) do
		local _ = nil
		local var4309 = nil
		local var4310, var4311, var4312 = protoModule.readTag(p227, var4308)
		local var4313 = var4310
		var4309 = var4311
		var4308 = var4312
		
		if var4309 == protoModule.wireTypes.varint then
			local _ = nil
			local var4314, var4315 = protoModule.readVarInt(p227, var4308)
			local _ = var4314
			var4308 = var4315
			continue
		end
		if var4309 == protoModule.wireTypes.lengthDelimited then
			if var4313 == 1 then
				local _ = nil
				local var4316, var4317 = protoModule.readBuffer(p227, var4308)
				var4308 = var4317
				table.insert(var4307.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var4316))
			elseif var4313 == 2 then
				local _ = nil
				local var4318, var4319 = protoModule.readBuffer(p227, var4308)
				var4308 = var4319
				var4307.sort_id = buffer.tostring(var4318)
			elseif var4313 == 3 then
				local _ = nil
				local var4320, var4321 = protoModule.readBuffer(p227, var4308)
				var4308 = var4321
				var4307.recommendation_request_id = buffer.tostring(var4320)
			else
				local _ = nil
				local var4322, var4323 = protoModule.readVarInt(p227, var4308)
				var4308 = var4323 + var4322
			end
		elseif var4309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4324, var4325 = protoModule.readFixed32(p227, var4308)
			local _ = var4324
			var4308 = var4325
		elseif var4309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4326, var4327 = protoModule.readFixed64(p227, var4308)
			local _ = var4326
			var4308 = var4327
		else
			error("Unsupported wire type: " .. var4309)
		end
	end
	return var4307
end

function t_113:jsonEncode() --[[ line: 23396 ]]
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

function t_113:jsonDecode() --[[ line: 23418 ]]
	-- upvalues: t_113 (ref), t (ref)
	local var4330 = t_113.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var4330.items = t_1
	end
	if self.sort_id ~= nil then
		var4330.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4330.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var4330.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var4330.recommendation_request_id = self.recommendationRequestId
	end
	return var4330
end

t_113.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_113
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p228) --[[ line: 23469 ]]
	-- upvalues: t_114 (ref)
	return setmetatable({
		user_id = if p228 == nil or p228.user_id == nil then "" else p228.user_id
	}, t_114)
end

function t_114:encode() --[[ line: 23480 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4333 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var4334, var4335 = protoModule.writeTag(buff, var4333, 1, protoModule.wireTypes.lengthDelimited)
		var4334, var4335 = protoModule.writeString(var4334, var4335, self.user_id)
		buff = var4334
		var4333 = var4335
	end
	local buff_1 = buffer.create(var4333)
	buffer.copy(buff_1, 0, buff, 0, var4333)
	
	return buff_1
end

function t_114.decode(p229) --[[ line: 23496 ]]
	-- upvalues: t_114 (ref), protoModule (ref)
	local var4337 = t_114.new()
	local var4338 = 0
	while var4338 < buffer.len(p229) do
		local _ = nil
		local var4339 = nil
		local var4340, var4341, var4342 = protoModule.readTag(p229, var4338)
		local var4343 = var4340
		var4339 = var4341
		var4338 = var4342
		
		if var4339 == protoModule.wireTypes.varint then
			local _ = nil
			local var4344, var4345 = protoModule.readVarInt(p229, var4338)
			local _ = var4344
			var4338 = var4345
			continue
		end
		if var4339 == protoModule.wireTypes.lengthDelimited then
			if var4343 == 1 then
				local _ = nil
				local var4346, var4347 = protoModule.readBuffer(p229, var4338)
				var4338 = var4347
				var4337.user_id = buffer.tostring(var4346)
			else
				local _ = nil
				local var4348, var4349 = protoModule.readVarInt(p229, var4338)
				var4338 = var4349 + var4348
			end
		elseif var4339 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4350, var4351 = protoModule.readFixed32(p229, var4338)
			local _ = var4350
			var4338 = var4351
		elseif var4339 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4352, var4353 = protoModule.readFixed64(p229, var4338)
			local _ = var4352
			var4338 = var4353
		else
			error("Unsupported wire type: " .. var4339)
		end
	end
	return var4337
end

function t_114:jsonEncode() --[[ line: 23541 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_114:jsonDecode() --[[ line: 23553 ]]
	-- upvalues: t_114 (ref)
	local var4355 = t_114.new()
	
	if self.user_id ~= nil then
		var4355.user_id = self.user_id
	end
	if self.userId ~= nil then
		var4355.user_id = self.userId
	end
	return var4355
end

t_114.descriptor = {
	name = "FriendRecommendationCarouselInputData_UserRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendation"
}
t.FriendRecommendationCarouselInputData_UserRecommendation = t_114
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_UserRecommendation)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p230) --[[ line: 23585 ]]
	-- upvalues: t_115 (ref)
	return setmetatable({
		contact_id = if p230 == nil or p230.contact_id == nil then "" else p230.contact_id,
		contact_name = if p230 == nil or p230.contact_name == nil then "" else p230.contact_name,
		avatar_thumbnail_url = if p230 == nil or p230.avatar_thumbnail_url == nil then "" else p230.avatar_thumbnail_url,
		headshot_thumbnail_url = if p230 == nil or p230.headshot_thumbnail_url == nil then "" else p230.headshot_thumbnail_url
	}, t_115)
end

function t_115:encode() --[[ line: 23603 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4357 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var4358, var4359 = protoModule.writeTag(buff, var4357, 1, protoModule.wireTypes.lengthDelimited)
		var4358, var4359 = protoModule.writeString(var4358, var4359, self.contact_id)
		buff = var4358
		var4357 = var4359
	end
	if self.contact_name ~= nil and self.contact_name ~= "" then
		local var4360, var4361 = protoModule.writeTag(buff, var4357, 2, protoModule.wireTypes.lengthDelimited)
		var4360, var4361 = protoModule.writeString(var4360, var4361, self.contact_name)
		buff = var4360
		var4357 = var4361
	end
	if self.avatar_thumbnail_url ~= nil and self.avatar_thumbnail_url ~= "" then
		local var4362, var4363 = protoModule.writeTag(buff, var4357, 3, protoModule.wireTypes.lengthDelimited)
		var4362, var4363 = protoModule.writeString(var4362, var4363, self.avatar_thumbnail_url)
		buff = var4362
		var4357 = var4363
	end
	if self.headshot_thumbnail_url ~= nil and self.headshot_thumbnail_url ~= "" then
		local var4364, var4365 = protoModule.writeTag(buff, var4357, 4, protoModule.wireTypes.lengthDelimited)
		var4364, var4365 = protoModule.writeString(var4364, var4365, self.headshot_thumbnail_url)
		buff = var4364
		var4357 = var4365
	end
	local buff_1 = buffer.create(var4357)
	buffer.copy(buff_1, 0, buff, 0, var4357)
	
	return buff_1
end

function t_115.decode(p231) --[[ line: 23634 ]]
	-- upvalues: t_115 (ref), protoModule (ref)
	local var4367 = t_115.new()
	local var4368 = 0
	while var4368 < buffer.len(p231) do
		local _ = nil
		local var4369 = nil
		local var4370, var4371, var4372 = protoModule.readTag(p231, var4368)
		local var4373 = var4370
		var4369 = var4371
		var4368 = var4372
		
		if var4369 == protoModule.wireTypes.varint then
			local _ = nil
			local var4374, var4375 = protoModule.readVarInt(p231, var4368)
			local _ = var4374
			var4368 = var4375
			continue
		end
		if var4369 == protoModule.wireTypes.lengthDelimited then
			if var4373 == 1 then
				local _ = nil
				local var4376, var4377 = protoModule.readBuffer(p231, var4368)
				var4368 = var4377
				var4367.contact_id = buffer.tostring(var4376)
			elseif var4373 == 2 then
				local _ = nil
				local var4378, var4379 = protoModule.readBuffer(p231, var4368)
				var4368 = var4379
				var4367.contact_name = buffer.tostring(var4378)
			elseif var4373 == 3 then
				local _ = nil
				local var4380, var4381 = protoModule.readBuffer(p231, var4368)
				var4368 = var4381
				var4367.avatar_thumbnail_url = buffer.tostring(var4380)
			elseif var4373 == 4 then
				local _ = nil
				local var4382, var4383 = protoModule.readBuffer(p231, var4368)
				var4368 = var4383
				var4367.headshot_thumbnail_url = buffer.tostring(var4382)
			else
				local _ = nil
				local var4384, var4385 = protoModule.readVarInt(p231, var4368)
				var4368 = var4385 + var4384
			end
		elseif var4369 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4386, var4387 = protoModule.readFixed32(p231, var4368)
			local _ = var4386
			var4368 = var4387
		elseif var4369 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4388, var4389 = protoModule.readFixed64(p231, var4368)
			local _ = var4388
			var4368 = var4389
		else
			error("Unsupported wire type: " .. var4369)
		end
	end
	return var4367
end

function t_115:jsonEncode() --[[ line: 23694 ]]
	local t = {}
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		t.contactId = self.contact_id
	end
	if self.contact_name ~= nil and self.contact_name ~= "" then
		t.contactName = self.contact_name
	end
	if self.avatar_thumbnail_url ~= nil and self.avatar_thumbnail_url ~= "" then
		t.avatarThumbnailUrl = self.avatar_thumbnail_url
	end
	if self.headshot_thumbnail_url ~= nil and self.headshot_thumbnail_url ~= "" then
		t.headshotThumbnailUrl = self.headshot_thumbnail_url
	end
	return t
end

function t_115:jsonDecode() --[[ line: 23718 ]]
	-- upvalues: t_115 (ref)
	local var4391 = t_115.new()
	
	if self.contact_id ~= nil then
		var4391.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var4391.contact_id = self.contactId
	end
	if self.contact_name ~= nil then
		var4391.contact_name = self.contact_name
	end
	if self.contactName ~= nil then
		var4391.contact_name = self.contactName
	end
	if self.avatar_thumbnail_url ~= nil then
		var4391.avatar_thumbnail_url = self.avatar_thumbnail_url
	end
	if self.avatarThumbnailUrl ~= nil then
		var4391.avatar_thumbnail_url = self.avatarThumbnailUrl
	end
	if self.headshot_thumbnail_url ~= nil then
		var4391.headshot_thumbnail_url = self.headshot_thumbnail_url
	end
	if self.headshotThumbnailUrl ~= nil then
		var4391.headshot_thumbnail_url = self.headshotThumbnailUrl
	end
	return var4391
end

t_115.descriptor = {
	name = "FriendRecommendationCarouselInputData_ContactRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactRecommendation"
}
t.FriendRecommendationCarouselInputData_ContactRecommendation = t_115
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_ContactRecommendation)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p232) --[[ line: 23774 ]]
	-- upvalues: t_116 (ref)
	return setmetatable({
		context_type = if p232 == nil or p232.context_type == nil then "" else p232.context_type,
		mutual_friends_count = if p232 == nil or p232.mutual_friends_count == nil then 0 else p232.mutual_friends_count,
		kind = if p232 == nil or p232.kind == nil then nil else p232.kind,
		has_pending_friend_request = if p232 == nil or p232.has_pending_friend_request == nil then false else p232.has_pending_friend_request
	}, t_116)
end

function t_116:encode() --[[ line: 23792 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4393 = 0
	
	if self.context_type ~= nil and self.context_type ~= "" then
		local var4394, var4395 = protoModule.writeTag(buff, var4393, 1, protoModule.wireTypes.lengthDelimited)
		var4394, var4395 = protoModule.writeString(var4394, var4395, self.context_type)
		buff = var4394
		var4393 = var4395
	end
	if self.mutual_friends_count ~= nil and self.mutual_friends_count ~= 0 then
		local var4396, var4397 = protoModule.writeTag(buff, var4393, 2, protoModule.wireTypes.varint)
		var4396, var4397 = protoModule.writeVarInt(var4396, var4397, self.mutual_friends_count)
		buff = var4396
		var4393 = var4397
	end
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var4398 = self.kind.value:encode()
			local var4399, var4400 = protoModule.writeTag(buff, var4393, 3, protoModule.wireTypes.lengthDelimited)
			var4399, var4400 = protoModule.writeBuffer(var4399, var4400, var4398, buffer.len(var4398))
			buff = var4399
			var4393 = var4400
		elseif self.kind.type == "contact" then
			local var4401 = self.kind.value:encode()
			local var4402, var4403 = protoModule.writeTag(buff, var4393, 4, protoModule.wireTypes.lengthDelimited)
			var4402, var4403 = protoModule.writeBuffer(var4402, var4403, var4401, buffer.len(var4401))
			buff = var4402
			var4393 = var4403
		end
	end
	if self.has_pending_friend_request then
		local var4404, var4405 = protoModule.writeTag(buff, var4393, 5, protoModule.wireTypes.varint)
		var4404, var4405 = protoModule.writeVarInt(var4404, var4405, if self.has_pending_friend_request then 1 else 0)
		buff = var4404
		var4393 = var4405
	end
	local buff_1 = buffer.create(var4393)
	buffer.copy(buff_1, 0, buff, 0, var4393)
	
	return buff_1
end

function t_116.decode(p233) --[[ line: 23830 ]]
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var4407 = t_116.new()
	local var4408 = 0
	while var4408 < buffer.len(p233) do
		local _ = nil
		local var4409 = nil
		local var4410, var4411, var4412 = protoModule.readTag(p233, var4408)
		local var4413 = var4410
		var4409 = var4411
		var4408 = var4412
		
		if var4409 == protoModule.wireTypes.varint then
			if var4413 == 2 then
				local _ = nil
				local var4414, var4415 = protoModule.readVarIntI32(p233, var4408)
				var4408 = var4415
				var4407.mutual_friends_count = var4414
			elseif var4413 == 5 then
				local _ = nil
				local var4416, var4417 = protoModule.readVarInt(p233, var4408)
				var4408 = var4417
				var4407.has_pending_friend_request = var4416 ~= 0
			else
				local _ = nil
				local var4418, var4419 = protoModule.readVarInt(p233, var4408)
				local _ = var4418
				var4408 = var4419
			end
		end
		if var4409 == protoModule.wireTypes.lengthDelimited then
			if var4413 == 1 then
				local _ = nil
				local var4420, var4421 = protoModule.readBuffer(p233, var4408)
				var4408 = var4421
				var4407.context_type = buffer.tostring(var4420)
			elseif var4413 == 3 then
				local _ = nil
				local var4422, var4423 = protoModule.readBuffer(p233, var4408)
				var4408 = var4423
				var4407.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var4422)
				}
			elseif var4413 == 4 then
				local _ = nil
				local var4424, var4425 = protoModule.readBuffer(p233, var4408)
				var4408 = var4425
				var4407.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var4424)
				}
			else
				local _ = nil
				local var4426, var4427 = protoModule.readVarInt(p233, var4408)
				var4408 = var4427 + var4426
			end
		elseif var4409 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4428, var4429 = protoModule.readFixed32(p233, var4408)
			local _ = var4428
			var4408 = var4429
		elseif var4409 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4430, var4431 = protoModule.readFixed64(p233, var4408)
			local _ = var4430
			var4408 = var4431
		else
			error("Unsupported wire type: " .. var4409)
		end
	end
	return var4407
end

function t_116:jsonEncode() --[[ line: 23901 ]]
	local t = {}
	
	if self.context_type ~= nil and self.context_type ~= "" then
		t.contextType = self.context_type
	end
	if self.mutual_friends_count ~= nil and self.mutual_friends_count ~= 0 then
		t.mutualFriendsCount = self.mutual_friends_count
	end
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

function t_116:jsonDecode() --[[ line: 23929 ]]
	-- upvalues: t_116 (ref), t (ref)
	local var4433 = t_116.new()
	
	if self.context_type ~= nil then
		var4433.context_type = self.context_type
	end
	if self.contextType ~= nil then
		var4433.context_type = self.contextType
	end
	if self.mutual_friends_count ~= nil then
		var4433.mutual_friends_count = self.mutual_friends_count
	end
	if self.mutualFriendsCount ~= nil then
		var4433.mutual_friends_count = self.mutualFriendsCount
	end
	if self.user ~= nil then
		var4433.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var4433.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var4433.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var4433.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var4433
end

t_116.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_116
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p234) --[[ line: 23990 ]]
	-- upvalues: t_117 (ref)
	return setmetatable({
		selected_option = if p234 == nil or p234.selected_option == nil then "" else p234.selected_option,
		sort_id = if p234 == nil or p234.sort_id == nil then "" else p234.sort_id,
		options = if p234 == nil or p234.options == nil then {} else p234.options,
		experience_carousel = if p234 == nil or p234.experience_carousel == nil then nil else p234.experience_carousel,
		feed_item_key = if p234 == nil or p234.feed_item_key == nil then "" else p234.feed_item_key
	}, t_117)
end

function t_117:encode() --[[ line: 24004 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4435 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var4436, var4437 = protoModule.writeTag(buff, var4435, 1, protoModule.wireTypes.lengthDelimited)
		var4436, var4437 = protoModule.writeString(var4436, var4437, self.selected_option)
		buff = var4436
		var4435 = var4437
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4438, var4439 = protoModule.writeTag(buff, var4435, 2, protoModule.wireTypes.lengthDelimited)
		var4438, var4439 = protoModule.writeString(var4438, var4439, self.sort_id)
		buff = var4438
		var4435 = var4439
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var4440 = v:encode()
			local var4441, var4442 = protoModule.writeTag(buff, var4435, 3, protoModule.wireTypes.lengthDelimited)
			var4441, var4442 = protoModule.writeBuffer(var4441, var4442, var4440, buffer.len(var4440))
			buff = var4441
			var4435 = var4442
		end
	end
	if self.experience_carousel ~= nil then
		local var4443 = self.experience_carousel:encode()
		local var4444, var4445 = protoModule.writeTag(buff, var4435, 4, protoModule.wireTypes.lengthDelimited)
		var4444, var4445 = protoModule.writeBuffer(var4444, var4445, var4443, buffer.len(var4443))
		buff = var4444
		var4435 = var4445
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var4446, var4447 = protoModule.writeTag(buff, var4435, 5, protoModule.wireTypes.lengthDelimited)
		var4446, var4447 = protoModule.writeString(var4446, var4447, self.feed_item_key)
		buff = var4446
		var4435 = var4447
	end
	local buff_1 = buffer.create(var4435)
	buffer.copy(buff_1, 0, buff, 0, var4435)
	
	return buff_1
end

function t_117.decode(p235) --[[ line: 24042 ]]
	-- upvalues: t_117 (ref), protoModule (ref), t (ref)
	local var4449 = t_117.new()
	local var4450 = 0
	while var4450 < buffer.len(p235) do
		local _ = nil
		local var4451 = nil
		local var4452, var4453, var4454 = protoModule.readTag(p235, var4450)
		local var4455 = var4452
		var4451 = var4453
		var4450 = var4454
		
		if var4451 == protoModule.wireTypes.varint then
			local _ = nil
			local var4456, var4457 = protoModule.readVarInt(p235, var4450)
			local _ = var4456
			var4450 = var4457
			continue
		end
		if var4451 == protoModule.wireTypes.lengthDelimited then
			if var4455 == 1 then
				local _ = nil
				local var4458, var4459 = protoModule.readBuffer(p235, var4450)
				var4450 = var4459
				var4449.selected_option = buffer.tostring(var4458)
			elseif var4455 == 2 then
				local _ = nil
				local var4460, var4461 = protoModule.readBuffer(p235, var4450)
				var4450 = var4461
				var4449.sort_id = buffer.tostring(var4460)
			elseif var4455 == 3 then
				local _ = nil
				local var4462, var4463 = protoModule.readBuffer(p235, var4450)
				var4450 = var4463
				table.insert(var4449.options, t.SelectorOption.decode(var4462))
			elseif var4455 == 4 then
				local _ = nil
				local var4464, var4465 = protoModule.readBuffer(p235, var4450)
				var4450 = var4465
				var4449.experience_carousel = t.ExperienceCarouselInputData.decode(var4464)
			elseif var4455 == 5 then
				local _ = nil
				local var4466, var4467 = protoModule.readBuffer(p235, var4450)
				var4450 = var4467
				var4449.feed_item_key = buffer.tostring(var4466)
			else
				local _ = nil
				local var4468, var4469 = protoModule.readVarInt(p235, var4450)
				var4450 = var4469 + var4468
			end
		elseif var4451 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4470, var4471 = protoModule.readFixed32(p235, var4450)
			local _ = var4470
			var4450 = var4471
		elseif var4451 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4472, var4473 = protoModule.readFixed64(p235, var4450)
			local _ = var4472
			var4450 = var4473
		else
			error("Unsupported wire type: " .. var4451)
		end
	end
	return var4449
end

function t_117:jsonEncode() --[[ line: 24105 ]]
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

function t_117:jsonDecode() --[[ line: 24135 ]]
	-- upvalues: t_117 (ref), t (ref)
	local var4476 = t_117.new()
	
	if self.selected_option ~= nil then
		var4476.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var4476.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var4476.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4476.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var4476.options = t_1
	end
	if self.experience_carousel ~= nil then
		var4476.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var4476.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var4476.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var4476.feed_item_key = self.feedItemKey
	end
	return var4476
end

t_117.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_117
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p236) --[[ line: 24196 ]]
	-- upvalues: t_118 (ref)
	return setmetatable({
		id = if p236 == nil or p236.id == nil then "" else p236.id,
		display_name = if p236 == nil or p236.display_name == nil then "" else p236.display_name,
		is_selected = if p236 == nil or p236.is_selected == nil then false else p236.is_selected
	}, t_118)
end

function t_118:encode() --[[ line: 24204 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4479 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var4480, var4481 = protoModule.writeTag(buff, var4479, 1, protoModule.wireTypes.lengthDelimited)
		var4480, var4481 = protoModule.writeString(var4480, var4481, self.id)
		buff = var4480
		var4479 = var4481
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4482, var4483 = protoModule.writeTag(buff, var4479, 2, protoModule.wireTypes.lengthDelimited)
		var4482, var4483 = protoModule.writeString(var4482, var4483, self.display_name)
		buff = var4482
		var4479 = var4483
	end
	if self.is_selected then
		local var4484, var4485 = protoModule.writeTag(buff, var4479, 3, protoModule.wireTypes.varint)
		var4484, var4485 = protoModule.writeVarInt(var4484, var4485, if self.is_selected then 1 else 0)
		buff = var4484
		var4479 = var4485
	end
	local buff_1 = buffer.create(var4479)
	buffer.copy(buff_1, 0, buff, 0, var4479)
	
	return buff_1
end

function t_118.decode(p237) --[[ line: 24228 ]]
	-- upvalues: t_118 (ref), protoModule (ref)
	local var4487 = t_118.new()
	local var4488 = 0
	while var4488 < buffer.len(p237) do
		local _ = nil
		local var4489 = nil
		local var4490, var4491, var4492 = protoModule.readTag(p237, var4488)
		local var4493 = var4490
		var4489 = var4491
		var4488 = var4492
		
		if var4489 == protoModule.wireTypes.varint then
			if var4493 == 3 then
				local _ = nil
				local var4494, var4495 = protoModule.readVarInt(p237, var4488)
				var4488 = var4495
				var4487.is_selected = var4494 ~= 0
			else
				local _ = nil
				local var4496, var4497 = protoModule.readVarInt(p237, var4488)
				local _ = var4496
				var4488 = var4497
			end
		end
		if var4489 == protoModule.wireTypes.lengthDelimited then
			if var4493 == 1 then
				local _ = nil
				local var4498, var4499 = protoModule.readBuffer(p237, var4488)
				var4488 = var4499
				var4487.id = buffer.tostring(var4498)
			elseif var4493 == 2 then
				local _ = nil
				local var4500, var4501 = protoModule.readBuffer(p237, var4488)
				var4488 = var4501
				var4487.display_name = buffer.tostring(var4500)
			else
				local _ = nil
				local var4502, var4503 = protoModule.readVarInt(p237, var4488)
				var4488 = var4503 + var4502
			end
		elseif var4489 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4504, var4505 = protoModule.readFixed32(p237, var4488)
			local _ = var4504
			var4488 = var4505
		elseif var4489 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4506, var4507 = protoModule.readFixed64(p237, var4488)
			local _ = var4506
			var4488 = var4507
		else
			error("Unsupported wire type: " .. var4489)
		end
	end
	return var4487
end

function t_118:jsonEncode() --[[ line: 24281 ]]
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

function t_118:jsonDecode() --[[ line: 24299 ]]
	-- upvalues: t_118 (ref)
	local var4509 = t_118.new()
	
	if self.id ~= nil then
		var4509.id = self.id
	end
	if self.display_name ~= nil then
		var4509.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var4509.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var4509.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var4509.is_selected = self.isSelected
	end
	return var4509
end

t_118.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_118
typeRegistryModule.default:register(t.SelectorOption)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p238) --[[ line: 24339 ]]
	-- upvalues: t_119 (ref)
	return setmetatable({
		layout = if p238 == nil or p238.layout == nil then nil else p238.layout,
		kind = if p238 == nil or p238.kind == nil then nil else p238.kind
	}, t_119)
end

function t_119:encode() --[[ line: 24346 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4511 = 0
	
	if self.layout ~= nil then
		local var4512 = self.layout:encode()
		local var4513, var4514 = protoModule.writeTag(buff, var4511, 1, protoModule.wireTypes.lengthDelimited)
		var4513, var4514 = protoModule.writeBuffer(var4513, var4514, var4512, buffer.len(var4512))
		buff = var4513
		var4511 = var4514
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		local var4515 = self.kind.value:encode()
		local var4516, var4517 = protoModule.writeTag(buff, var4511, 2, protoModule.wireTypes.lengthDelimited)
		var4516, var4517 = protoModule.writeBuffer(var4516, var4517, var4515, buffer.len(var4515))
		buff = var4516
		var4511 = var4517
	end
	local buff_1 = buffer.create(var4511)
	buffer.copy(buff_1, 0, buff, 0, var4511)
	
	return buff_1
end

function t_119.decode(p239) --[[ line: 24369 ]]
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var4519 = t_119.new()
	local var4520 = 0
	while var4520 < buffer.len(p239) do
		local _ = nil
		local var4521 = nil
		local var4522, var4523, var4524 = protoModule.readTag(p239, var4520)
		local var4525 = var4522
		var4521 = var4523
		var4520 = var4524
		
		if var4521 == protoModule.wireTypes.varint then
			local _ = nil
			local var4526, var4527 = protoModule.readVarInt(p239, var4520)
			local _ = var4526
			var4520 = var4527
			continue
		end
		if var4521 == protoModule.wireTypes.lengthDelimited then
			if var4525 == 1 then
				local _ = nil
				local var4528, var4529 = protoModule.readBuffer(p239, var4520)
				var4520 = var4529
				var4519.layout = t.ItemLayout.decode(var4528)
			elseif var4525 == 2 then
				local _ = nil
				local var4530, var4531 = protoModule.readBuffer(p239, var4520)
				var4520 = var4531
				var4519.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var4530)
				}
			else
				local _ = nil
				local var4532, var4533 = protoModule.readVarInt(p239, var4520)
				var4520 = var4533 + var4532
			end
		elseif var4521 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4534, var4535 = protoModule.readFixed32(p239, var4520)
			local _ = var4534
			var4520 = var4535
		elseif var4521 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4536, var4537 = protoModule.readFixed64(p239, var4520)
			local _ = var4536
			var4520 = var4537
		else
			error("Unsupported wire type: " .. var4521)
		end
	end
	return var4519
end

function t_119:jsonEncode() --[[ line: 24418 ]]
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		t.universe = self.kind.value:jsonEncode()
	end
	return t
end

function t_119:jsonDecode() --[[ line: 24434 ]]
	-- upvalues: t_119 (ref), t (ref)
	local var4539 = t_119.new()
	
	if self.layout ~= nil then
		var4539.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var4539.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	return var4539
end

t_119.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_119
typeRegistryModule.default:register(t.ItemWithLayout)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p240) --[[ line: 24465 ]]
	-- upvalues: t_120 (ref)
	return setmetatable({
		items = if p240 == nil or p240.items == nil then {} else p240.items,
		collection_item_size = if p240 == nil or p240.collection_item_size == nil then nil else p240.collection_item_size
	}, t_120)
end

function t_120:encode() --[[ line: 24474 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4541 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4542 = v:encode()
			local var4543, var4544 = protoModule.writeTag(buff, var4541, 1, protoModule.wireTypes.lengthDelimited)
			var4543, var4544 = protoModule.writeBuffer(var4543, var4544, var4542, buffer.len(var4542))
			buff = var4543
			var4541 = var4544
		end
	end
	if self.collection_item_size ~= nil then
		local var4545, var4546 = protoModule.writeTag(buff, var4541, 2, protoModule.wireTypes.lengthDelimited)
		var4545, var4546 = protoModule.writeString(var4545, var4546, self.collection_item_size)
		buff = var4545
		var4541 = var4546
	end
	local buff_1 = buffer.create(var4541)
	buffer.copy(buff_1, 0, buff, 0, var4541)
	
	return buff_1
end

function t_120.decode(p241) --[[ line: 24496 ]]
	-- upvalues: t_120 (ref), protoModule (ref), t (ref)
	local var4548 = t_120.new()
	local var4549 = 0
	while var4549 < buffer.len(p241) do
		local _ = nil
		local var4550 = nil
		local var4551, var4552, var4553 = protoModule.readTag(p241, var4549)
		local var4554 = var4551
		var4550 = var4552
		var4549 = var4553
		
		if var4550 == protoModule.wireTypes.varint then
			local _ = nil
			local var4555, var4556 = protoModule.readVarInt(p241, var4549)
			local _ = var4555
			var4549 = var4556
			continue
		end
		if var4550 == protoModule.wireTypes.lengthDelimited then
			if var4554 == 1 then
				local _ = nil
				local var4557, var4558 = protoModule.readBuffer(p241, var4549)
				var4549 = var4558
				table.insert(var4548.items, t.ItemWithLayout.decode(var4557))
			elseif var4554 == 2 then
				local _ = nil
				local var4559, var4560 = protoModule.readBuffer(p241, var4549)
				var4549 = var4560
				var4548.collection_item_size = buffer.tostring(var4559)
			else
				local _ = nil
				local var4561, var4562 = protoModule.readVarInt(p241, var4549)
				var4549 = var4562 + var4561
			end
		elseif var4550 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4563, var4564 = protoModule.readFixed32(p241, var4549)
			local _ = var4563
			var4549 = var4564
		elseif var4550 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4565, var4566 = protoModule.readFixed64(p241, var4549)
			local _ = var4565
			var4549 = var4566
		else
			error("Unsupported wire type: " .. var4550)
		end
	end
	return var4548
end

function t_120:jsonEncode() --[[ line: 24544 ]]
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

function t_120:jsonDecode() --[[ line: 24562 ]]
	-- upvalues: t_120 (ref), t (ref)
	local var4569 = t_120.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var4569.items = t_1
	end
	if self.collection_item_size ~= nil then
		var4569.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var4569.collection_item_size = self.collectionItemSize
	end
	return var4569
end

t_120.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_120
typeRegistryModule.default:register(t.ContentPool)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p242) --[[ line: 24599 ]]
	-- upvalues: t_121 (ref)
	return setmetatable({
		col_span = if p242 == nil or p242.col_span == nil then 0 else p242.col_span,
		row_span = if p242 == nil or p242.row_span == nil then 0 else p242.row_span,
		alignment_type = if p242 == nil or p242.alignment_type == nil then "" else p242.alignment_type,
		min_row_padding = if p242 == nil or p242.min_row_padding == nil then 0 else p242.min_row_padding
	}, t_121)
end

function t_121:encode() --[[ line: 24608 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4572 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var4573, var4574 = protoModule.writeTag(buff, var4572, 1, protoModule.wireTypes.varint)
		var4573, var4574 = protoModule.writeVarInt(var4573, var4574, self.col_span)
		buff = var4573
		var4572 = var4574
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var4575, var4576 = protoModule.writeTag(buff, var4572, 2, protoModule.wireTypes.varint)
		var4575, var4576 = protoModule.writeVarInt(var4575, var4576, self.row_span)
		buff = var4575
		var4572 = var4576
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var4577, var4578 = protoModule.writeTag(buff, var4572, 3, protoModule.wireTypes.lengthDelimited)
		var4577, var4578 = protoModule.writeString(var4577, var4578, self.alignment_type)
		buff = var4577
		var4572 = var4578
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var4579, var4580 = protoModule.writeTag(buff, var4572, 4, protoModule.wireTypes.varint)
		var4579, var4580 = protoModule.writeVarInt(var4579, var4580, self.min_row_padding)
		buff = var4579
		var4572 = var4580
	end
	local buff_1 = buffer.create(var4572)
	buffer.copy(buff_1, 0, buff, 0, var4572)
	
	return buff_1
end

function t_121.decode(p243) --[[ line: 24637 ]]
	-- upvalues: t_121 (ref), protoModule (ref)
	local var4582 = t_121.new()
	local var4583 = 0
	while var4583 < buffer.len(p243) do
		local _ = nil
		local var4584 = nil
		local var4585, var4586, var4587 = protoModule.readTag(p243, var4583)
		local var4588 = var4585
		var4584 = var4586
		var4583 = var4587
		
		if var4584 == protoModule.wireTypes.varint then
			if var4588 == 1 then
				local _ = nil
				local var4589, var4590 = protoModule.readVarIntI32(p243, var4583)
				var4583 = var4590
				var4582.col_span = var4589
			elseif var4588 == 2 then
				local _ = nil
				local var4591, var4592 = protoModule.readVarIntI32(p243, var4583)
				var4583 = var4592
				var4582.row_span = var4591
			elseif var4588 == 4 then
				local _ = nil
				local var4593, var4594 = protoModule.readVarIntI32(p243, var4583)
				var4583 = var4594
				var4582.min_row_padding = var4593
			else
				local _ = nil
				local var4595, var4596 = protoModule.readVarInt(p243, var4583)
				local _ = var4595
				var4583 = var4596
			end
		end
		if var4584 == protoModule.wireTypes.lengthDelimited then
			if var4588 == 3 then
				local _ = nil
				local var4597, var4598 = protoModule.readBuffer(p243, var4583)
				var4583 = var4598
				var4582.alignment_type = buffer.tostring(var4597)
			else
				local _ = nil
				local var4599, var4600 = protoModule.readVarInt(p243, var4583)
				var4583 = var4600 + var4599
			end
		elseif var4584 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4601, var4602 = protoModule.readFixed32(p243, var4583)
			local _ = var4601
			var4583 = var4602
		elseif var4584 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4603, var4604 = protoModule.readFixed64(p243, var4583)
			local _ = var4603
			var4583 = var4604
		else
			error("Unsupported wire type: " .. var4584)
		end
	end
	return var4582
end

function t_121:jsonEncode() --[[ line: 24695 ]]
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

function t_121:jsonDecode() --[[ line: 24717 ]]
	-- upvalues: t_121 (ref)
	local var4606 = t_121.new()
	
	if self.col_span ~= nil then
		var4606.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var4606.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var4606.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var4606.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var4606.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var4606.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var4606.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var4606.min_row_padding = self.minRowPadding
	end
	return var4606
end

t_121.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_121
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p244) --[[ line: 24766 ]]
		return if p244 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p244 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p245) --[[ line: 24776 ]]
		return if p245 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p245 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p245
	end,
	fromName = function(p246) --[[ line: 24786 ]]
		return if p246 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p246 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	FriendRecommendationCarouselInputData = t.FriendRecommendationCarouselInputData,
	FriendRecommendationCarouselInputData_UserRecommendation = t.FriendRecommendationCarouselInputData_UserRecommendation,
	FriendRecommendationCarouselInputData_ContactRecommendation = t.FriendRecommendationCarouselInputData_ContactRecommendation,
	FriendRecommendationCarouselInputData_RecommendationItem = t.FriendRecommendationCarouselInputData_RecommendationItem,
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	PageEntryFormat = t.PageEntryFormat
}