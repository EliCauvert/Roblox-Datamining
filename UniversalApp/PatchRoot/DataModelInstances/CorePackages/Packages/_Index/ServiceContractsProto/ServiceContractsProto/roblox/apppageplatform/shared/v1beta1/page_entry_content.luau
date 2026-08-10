local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local pageEntryModule = require(script.Parent.page_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 3970 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entry = if p0 == nil or p0.page_entry == nil then nil else p0.page_entry,
		input_data = if p0 == nil or p0.input_data == nil then nil else p0.input_data
	}, t_1)
end

function t_1:encode() --[[ line: 3977 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var129 = 0
	
	if self.page_entry ~= nil then
		local var130 = self.page_entry:encode()
		local var131, var132 = protoModule.writeTag(buff, var129, 1, protoModule.wireTypes.lengthDelimited)
		var131, var132 = protoModule.writeBuffer(var131, var132, var130, buffer.len(var130))
		buff = var131
		var129 = var132
	end
	if self.input_data ~= nil then
		local var133 = self.input_data:encode()
		local var134, var135 = protoModule.writeTag(buff, var129, 2, protoModule.wireTypes.lengthDelimited)
		var134, var135 = protoModule.writeBuffer(var134, var135, var133, buffer.len(var133))
		buff = var134
		var129 = var135
	end
	local buff_1 = buffer.create(var129)
	buffer.copy(buff_1, 0, buff, 0, var129)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 3998 ]]
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var137 = t_1.new()
	local var138 = 0
	while var138 < buffer.len(p1) do
		local _ = nil
		local var139 = nil
		local var140, var141, var142 = protoModule.readTag(p1, var138)
		local var143 = var140
		var139 = var141
		var138 = var142
		
		if var139 == protoModule.wireTypes.varint then
			local _ = nil
			local var144, var145 = protoModule.readVarInt(p1, var138)
			local _ = var144
			var138 = var145
			continue
		end
		if var139 == protoModule.wireTypes.lengthDelimited then
			if var143 == 1 then
				local _ = nil
				local var146, var147 = protoModule.readBuffer(p1, var138)
				var138 = var147
				var137.page_entry = pageEntryModule.PageEntry.decode(var146)
			elseif var143 == 2 then
				local _ = nil
				local var148, var149 = protoModule.readBuffer(p1, var138)
				var138 = var149
				var137.input_data = t.PageEntryInputData.decode(var148)
			else
				local _ = nil
				local var150, var151 = protoModule.readVarInt(p1, var138)
				var138 = var151 + var150
			end
		elseif var139 == protoModule.wireTypes.i32 then
			local _ = nil
			local var152, var153 = protoModule.readFixed32(p1, var138)
			local _ = var152
			var138 = var153
		elseif var139 == protoModule.wireTypes.i64 then
			local _ = nil
			local var154, var155 = protoModule.readFixed64(p1, var138)
			local _ = var154
			var138 = var155
		else
			error("Unsupported wire type: " .. var139)
		end
	end
	return var137
end

function t_1:jsonEncode() --[[ line: 4046 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 4060 ]]
	-- upvalues: t_1 (ref), pageEntryModule (ref), t (ref)
	local var157 = t_1.new()
	
	if self.page_entry ~= nil then
		var157.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var157.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var157.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var157.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var157
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 4096 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p2 == nil or p2.input_data == nil then nil else p2.input_data,
		roblox_component = if p2 == nil or p2.roblox_component == nil then "" else p2.roblox_component
	}, t_2)
end

function t_2:encode() --[[ line: 4103 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var159 = 0
	
	if self.input_data ~= nil then
		local var160 = self.input_data:encode()
		local var161, var162 = protoModule.writeTag(buff, var159, 1, protoModule.wireTypes.lengthDelimited)
		var161, var162 = protoModule.writeBuffer(var161, var162, var160, buffer.len(var160))
		buff = var161
		var159 = var162
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var163, var164 = protoModule.writeTag(buff, var159, 2, protoModule.wireTypes.lengthDelimited)
		var163, var164 = protoModule.writeString(var163, var164, self.roblox_component)
		buff = var163
		var159 = var164
	end
	local buff_1 = buffer.create(var159)
	buffer.copy(buff_1, 0, buff, 0, var159)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 4123 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var166 = t_2.new()
	local var167 = 0
	while var167 < buffer.len(p3) do
		local _ = nil
		local var168 = nil
		local var169, var170, var171 = protoModule.readTag(p3, var167)
		local var172 = var169
		var168 = var170
		var167 = var171
		
		if var168 == protoModule.wireTypes.varint then
			local _ = nil
			local var173, var174 = protoModule.readVarInt(p3, var167)
			local _ = var173
			var167 = var174
			continue
		end
		if var168 == protoModule.wireTypes.lengthDelimited then
			if var172 == 1 then
				local _ = nil
				local var175, var176 = protoModule.readBuffer(p3, var167)
				var167 = var176
				var166.input_data = t.PageEntryInputData.decode(var175)
			elseif var172 == 2 then
				local _ = nil
				local var177, var178 = protoModule.readBuffer(p3, var167)
				var167 = var178
				var166.roblox_component = buffer.tostring(var177)
			else
				local _ = nil
				local var179, var180 = protoModule.readVarInt(p3, var167)
				var167 = var180 + var179
			end
		elseif var168 == protoModule.wireTypes.i32 then
			local _ = nil
			local var181, var182 = protoModule.readFixed32(p3, var167)
			local _ = var181
			var167 = var182
		elseif var168 == protoModule.wireTypes.i64 then
			local _ = nil
			local var183, var184 = protoModule.readFixed64(p3, var167)
			local _ = var183
			var167 = var184
		else
			error("Unsupported wire type: " .. var168)
		end
	end
	return var166
end

function t_2:jsonEncode() --[[ line: 4171 ]]
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_2:jsonDecode() --[[ line: 4185 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var186 = t_2.new()
	
	if self.input_data ~= nil then
		var186.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var186.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var186.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var186.roblox_component = self.robloxComponent
	end
	return var186
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 4221 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p4 == nil or p4.roblox_component == nil then "" else p4.roblox_component,
		input_data = if p4 == nil or p4.input_data == nil then nil else p4.input_data,
		cta_buttons = if p4 == nil or p4.cta_buttons == nil then nil else p4.cta_buttons
	}, t_3)
end

function t_3:encode() --[[ line: 4229 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var188 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var189, var190 = protoModule.writeTag(buff, var188, 1, protoModule.wireTypes.lengthDelimited)
		var189, var190 = protoModule.writeString(var189, var190, self.roblox_component)
		buff = var189
		var188 = var190
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var191 = self.input_data.value:encode()
		local var192, var193 = protoModule.writeTag(buff, var188, 2, protoModule.wireTypes.lengthDelimited)
		var192, var193 = protoModule.writeBuffer(var192, var193, var191, buffer.len(var191))
		buff = var192
		var188 = var193
	end
	if self.cta_buttons ~= nil then
		local var194 = self.cta_buttons:encode()
		local var195, var196 = protoModule.writeTag(buff, var188, 3, protoModule.wireTypes.lengthDelimited)
		var195, var196 = protoModule.writeBuffer(var195, var196, var194, buffer.len(var194))
		buff = var195
		var188 = var196
	end
	local buff_1 = buffer.create(var188)
	buffer.copy(buff_1, 0, buff, 0, var188)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 4257 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var198 = t_3.new()
	local var199 = 0
	while var199 < buffer.len(p5) do
		local _ = nil
		local var200 = nil
		local var201, var202, var203 = protoModule.readTag(p5, var199)
		local var204 = var201
		var200 = var202
		var199 = var203
		
		if var200 == protoModule.wireTypes.varint then
			local _ = nil
			local var205, var206 = protoModule.readVarInt(p5, var199)
			local _ = var205
			var199 = var206
			continue
		end
		if var200 == protoModule.wireTypes.lengthDelimited then
			if var204 == 1 then
				local _ = nil
				local var207, var208 = protoModule.readBuffer(p5, var199)
				var199 = var208
				var198.roblox_component = buffer.tostring(var207)
			elseif var204 == 2 then
				local _ = nil
				local var209, var210 = protoModule.readBuffer(p5, var199)
				var199 = var210
				var198.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var209)
				}
			elseif var204 == 3 then
				local _ = nil
				local var211, var212 = protoModule.readBuffer(p5, var199)
				var199 = var212
				var198.cta_buttons = t.CtaButtonsInputData.decode(var211)
			else
				local _ = nil
				local var213, var214 = protoModule.readVarInt(p5, var199)
				var199 = var214 + var213
			end
		elseif var200 == protoModule.wireTypes.i32 then
			local _ = nil
			local var215, var216 = protoModule.readFixed32(p5, var199)
			local _ = var215
			var199 = var216
		elseif var200 == protoModule.wireTypes.i64 then
			local _ = nil
			local var217, var218 = protoModule.readFixed64(p5, var199)
			local _ = var217
			var199 = var218
		else
			error("Unsupported wire type: " .. var200)
		end
	end
	return var198
end

function t_3:jsonEncode() --[[ line: 4311 ]]
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

function t_3:jsonDecode() --[[ line: 4331 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var220 = t_3.new()
	
	if self.roblox_component ~= nil then
		var220.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var220.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var220.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var220.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	if self.cta_buttons ~= nil then
		var220.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		var220.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
	end
	return var220
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 4377 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p6 == nil or p6.roblox_component == nil then "" else p6.roblox_component,
		input_data = if p6 == nil or p6.input_data == nil then nil else p6.input_data
	}, t_4)
end

function t_4:encode() --[[ line: 4384 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var222 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var223, var224 = protoModule.writeTag(buff, var222, 1, protoModule.wireTypes.lengthDelimited)
		var223, var224 = protoModule.writeString(var223, var224, self.roblox_component)
		buff = var223
		var222 = var224
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var225 = self.input_data.value:encode()
			local var226, var227 = protoModule.writeTag(buff, var222, 2, protoModule.wireTypes.lengthDelimited)
			var226, var227 = protoModule.writeBuffer(var226, var227, var225, buffer.len(var225))
			buff = var226
			var222 = var227
		elseif self.input_data.type == "video" then
			local var228 = self.input_data.value:encode()
			local var229, var230 = protoModule.writeTag(buff, var222, 3, protoModule.wireTypes.lengthDelimited)
			var229, var230 = protoModule.writeBuffer(var229, var230, var228, buffer.len(var228))
			buff = var229
			var222 = var230
		end
	end
	local buff_1 = buffer.create(var222)
	buffer.copy(buff_1, 0, buff, 0, var222)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 4410 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var232 = t_4.new()
	local var233 = 0
	while var233 < buffer.len(p7) do
		local _ = nil
		local var234 = nil
		local var235, var236, var237 = protoModule.readTag(p7, var233)
		local var238 = var235
		var234 = var236
		var233 = var237
		
		if var234 == protoModule.wireTypes.varint then
			local _ = nil
			local var239, var240 = protoModule.readVarInt(p7, var233)
			local _ = var239
			var233 = var240
			continue
		end
		if var234 == protoModule.wireTypes.lengthDelimited then
			if var238 == 1 then
				local _ = nil
				local var241, var242 = protoModule.readBuffer(p7, var233)
				var233 = var242
				var232.roblox_component = buffer.tostring(var241)
			elseif var238 == 2 then
				local _ = nil
				local var243, var244 = protoModule.readBuffer(p7, var233)
				var233 = var244
				var232.input_data = { type = "image", value = t.ImageInputData.decode(var243) }
			elseif var238 == 3 then
				local _ = nil
				local var245, var246 = protoModule.readBuffer(p7, var233)
				var233 = var246
				var232.input_data = { type = "video", value = t.VideoInputData.decode(var245) }
			else
				local _ = nil
				local var247, var248 = protoModule.readVarInt(p7, var233)
				var233 = var248 + var247
			end
		elseif var234 == protoModule.wireTypes.i32 then
			local _ = nil
			local var249, var250 = protoModule.readFixed32(p7, var233)
			local _ = var249
			var233 = var250
		elseif var234 == protoModule.wireTypes.i64 then
			local _ = nil
			local var251, var252 = protoModule.readFixed64(p7, var233)
			local _ = var251
			var233 = var252
		else
			error("Unsupported wire type: " .. var234)
		end
	end
	return var232
end

function t_4:jsonEncode() --[[ line: 4463 ]]
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

function t_4:jsonDecode() --[[ line: 4481 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var254 = t_4.new()
	
	if self.roblox_component ~= nil then
		var254.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var254.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var254.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	if self.video ~= nil then
		var254.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
		}
	end
	return var254
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 4517 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode() --[[ line: 4523 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var256 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var257 = self.kind.value:encode()
			local var258, var259 = protoModule.writeTag(buff, var256, 1, protoModule.wireTypes.lengthDelimited)
			var258, var259 = protoModule.writeBuffer(var258, var259, var257, buffer.len(var257))
			buff = var258
			var256 = var259
		elseif self.kind.type == "badge_details" then
			local var260 = self.kind.value:encode()
			local var261, var262 = protoModule.writeTag(buff, var256, 2, protoModule.wireTypes.lengthDelimited)
			var261, var262 = protoModule.writeBuffer(var261, var262, var260, buffer.len(var260))
			buff = var261
			var256 = var262
		elseif self.kind.type == "static_content" then
			local var263 = self.kind.value:encode()
			local var264, var265 = protoModule.writeTag(buff, var256, 3, protoModule.wireTypes.lengthDelimited)
			var264, var265 = protoModule.writeBuffer(var264, var265, var263, buffer.len(var263))
			buff = var264
			var256 = var265
		elseif self.kind.type == "experience_attribution_row" then
			local var266 = self.kind.value:encode()
			local var267, var268 = protoModule.writeTag(buff, var256, 4, protoModule.wireTypes.lengthDelimited)
			var267, var268 = protoModule.writeBuffer(var267, var268, var266, buffer.len(var266))
			buff = var267
			var256 = var268
		elseif self.kind.type == "experience_action_module" then
			local var269 = self.kind.value:encode()
			local var270, var271 = protoModule.writeTag(buff, var256, 5, protoModule.wireTypes.lengthDelimited)
			var270, var271 = protoModule.writeBuffer(var270, var271, var269, buffer.len(var269))
			buff = var270
			var256 = var271
		elseif self.kind.type == "experience_media_gallery" then
			local var272 = self.kind.value:encode()
			local var273, var274 = protoModule.writeTag(buff, var256, 6, protoModule.wireTypes.lengthDelimited)
			var273, var274 = protoModule.writeBuffer(var273, var274, var272, buffer.len(var272))
			buff = var273
			var256 = var274
		elseif self.kind.type == "experience_description" then
			local var275 = self.kind.value:encode()
			local var276, var277 = protoModule.writeTag(buff, var256, 7, protoModule.wireTypes.lengthDelimited)
			var276, var277 = protoModule.writeBuffer(var276, var277, var275, buffer.len(var275))
			buff = var276
			var256 = var277
		elseif self.kind.type == "experience_stat_row" then
			local var278 = self.kind.value:encode()
			local var279, var280 = protoModule.writeTag(buff, var256, 8, protoModule.wireTypes.lengthDelimited)
			var279, var280 = protoModule.writeBuffer(var279, var280, var278, buffer.len(var278))
			buff = var279
			var256 = var280
		elseif self.kind.type == "experience_info_table" then
			local var281 = self.kind.value:encode()
			local var282, var283 = protoModule.writeTag(buff, var256, 9, protoModule.wireTypes.lengthDelimited)
			var282, var283 = protoModule.writeBuffer(var282, var283, var281, buffer.len(var281))
			buff = var282
			var256 = var283
		elseif self.kind.type == "social_link_row" then
			local var284 = self.kind.value:encode()
			local var285, var286 = protoModule.writeTag(buff, var256, 10, protoModule.wireTypes.lengthDelimited)
			var285, var286 = protoModule.writeBuffer(var285, var286, var284, buffer.len(var284))
			buff = var285
			var256 = var286
		elseif self.kind.type == "experience_carousel" then
			local var287 = self.kind.value:encode()
			local var288, var289 = protoModule.writeTag(buff, var256, 11, protoModule.wireTypes.lengthDelimited)
			var288, var289 = protoModule.writeBuffer(var288, var289, var287, buffer.len(var287))
			buff = var288
			var256 = var289
		elseif self.kind.type == "song_carousel" then
			local var290 = self.kind.value:encode()
			local var291, var292 = protoModule.writeTag(buff, var256, 12, protoModule.wireTypes.lengthDelimited)
			var291, var292 = protoModule.writeBuffer(var291, var292, var290, buffer.len(var290))
			buff = var291
			var256 = var292
		elseif self.kind.type == "events_carousel" then
			local var293 = self.kind.value:encode()
			local var294, var295 = protoModule.writeTag(buff, var256, 13, protoModule.wireTypes.lengthDelimited)
			var294, var295 = protoModule.writeBuffer(var294, var295, var293, buffer.len(var293))
			buff = var294
			var256 = var295
		elseif self.kind.type == "game_pass_collection" then
			local var296 = self.kind.value:encode()
			local var297, var298 = protoModule.writeTag(buff, var256, 14, protoModule.wireTypes.lengthDelimited)
			var297, var298 = protoModule.writeBuffer(var297, var298, var296, buffer.len(var296))
			buff = var297
			var256 = var298
		elseif self.kind.type == "developer_product_collection" then
			local var299 = self.kind.value:encode()
			local var300, var301 = protoModule.writeTag(buff, var256, 15, protoModule.wireTypes.lengthDelimited)
			var300, var301 = protoModule.writeBuffer(var300, var301, var299, buffer.len(var299))
			buff = var300
			var256 = var301
		elseif self.kind.type == "subscription_collection" then
			local var302 = self.kind.value:encode()
			local var303, var304 = protoModule.writeTag(buff, var256, 16, protoModule.wireTypes.lengthDelimited)
			var303, var304 = protoModule.writeBuffer(var303, var304, var302, buffer.len(var302))
			buff = var303
			var256 = var304
		elseif self.kind.type == "dynamic_store_category" then
			local var305 = self.kind.value:encode()
			local var306, var307 = protoModule.writeTag(buff, var256, 17, protoModule.wireTypes.lengthDelimited)
			var306, var307 = protoModule.writeBuffer(var306, var307, var305, buffer.len(var305))
			buff = var306
			var256 = var307
		elseif self.kind.type == "card_container" then
			local var308 = self.kind.value:encode()
			local var309, var310 = protoModule.writeTag(buff, var256, 20, protoModule.wireTypes.lengthDelimited)
			var309, var310 = protoModule.writeBuffer(var309, var310, var308, buffer.len(var308))
			buff = var309
			var256 = var310
		elseif self.kind.type == "card" then
			local var311 = self.kind.value:encode()
			local var312, var313 = protoModule.writeTag(buff, var256, 21, protoModule.wireTypes.lengthDelimited)
			var312, var313 = protoModule.writeBuffer(var312, var313, var311, buffer.len(var311))
			buff = var312
			var256 = var313
		elseif self.kind.type == "dialog" then
			local var314 = self.kind.value:encode()
			local var315, var316 = protoModule.writeTag(buff, var256, 22, protoModule.wireTypes.lengthDelimited)
			var315, var316 = protoModule.writeBuffer(var315, var316, var314, buffer.len(var314))
			buff = var315
			var256 = var316
		elseif self.kind.type == "banner" then
			local var317 = self.kind.value:encode()
			local var318, var319 = protoModule.writeTag(buff, var256, 23, protoModule.wireTypes.lengthDelimited)
			var318, var319 = protoModule.writeBuffer(var318, var319, var317, buffer.len(var317))
			buff = var318
			var256 = var319
		elseif self.kind.type == "tooltip" then
			local var320 = self.kind.value:encode()
			local var321, var322 = protoModule.writeTag(buff, var256, 24, protoModule.wireTypes.lengthDelimited)
			var321, var322 = protoModule.writeBuffer(var321, var322, var320, buffer.len(var320))
			buff = var321
			var256 = var322
		elseif self.kind.type == "coachmark" then
			local var323 = self.kind.value:encode()
			local var324, var325 = protoModule.writeTag(buff, var256, 25, protoModule.wireTypes.lengthDelimited)
			var324, var325 = protoModule.writeBuffer(var324, var325, var323, buffer.len(var323))
			buff = var324
			var256 = var325
		elseif self.kind.type == "system_banner_prompt" then
			local var326 = self.kind.value:encode()
			local var327, var328 = protoModule.writeTag(buff, var256, 28, protoModule.wireTypes.lengthDelimited)
			var327, var328 = protoModule.writeBuffer(var327, var328, var326, buffer.len(var326))
			buff = var327
			var256 = var328
		elseif self.kind.type == "age_check_upsell" then
			local var329 = self.kind.value:encode()
			local var330, var331 = protoModule.writeTag(buff, var256, 29, protoModule.wireTypes.lengthDelimited)
			var330, var331 = protoModule.writeBuffer(var330, var331, var329, buffer.len(var329))
			buff = var330
			var256 = var331
		elseif self.kind.type == "catalog_item_list" then
			local var332 = self.kind.value:encode()
			local var333, var334 = protoModule.writeTag(buff, var256, 26, protoModule.wireTypes.lengthDelimited)
			var333, var334 = protoModule.writeBuffer(var333, var334, var332, buffer.len(var332))
			buff = var333
			var256 = var334
		elseif self.kind.type == "user_list" then
			local var335 = self.kind.value:encode()
			local var336, var337 = protoModule.writeTag(buff, var256, 27, protoModule.wireTypes.lengthDelimited)
			var336, var337 = protoModule.writeBuffer(var336, var337, var335, buffer.len(var335))
			buff = var336
			var256 = var337
		elseif self.kind.type == "experience_content_rating_label" then
			local var338 = self.kind.value:encode()
			local var339, var340 = protoModule.writeTag(buff, var256, 30, protoModule.wireTypes.lengthDelimited)
			var339, var340 = protoModule.writeBuffer(var339, var340, var338, buffer.len(var338))
			buff = var339
			var256 = var340
		elseif self.kind.type == "experience_refund_policy" then
			local var341 = self.kind.value:encode()
			local var342, var343 = protoModule.writeTag(buff, var256, 31, protoModule.wireTypes.lengthDelimited)
			var342, var343 = protoModule.writeBuffer(var342, var343, var341, buffer.len(var341))
			buff = var342
			var256 = var343
		elseif self.kind.type == "experience_play_with_reward" then
			local var344 = self.kind.value:encode()
			local var345, var346 = protoModule.writeTag(buff, var256, 32, protoModule.wireTypes.lengthDelimited)
			var345, var346 = protoModule.writeBuffer(var345, var346, var344, buffer.len(var344))
			buff = var345
			var256 = var346
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var347 = self.kind.value:encode()
			local var348, var349 = protoModule.writeTag(buff, var256, 33, protoModule.wireTypes.lengthDelimited)
			var348, var349 = protoModule.writeBuffer(var348, var349, var347, buffer.len(var347))
			buff = var348
			var256 = var349
		elseif self.kind.type == "community_section" then
			local var350 = self.kind.value:encode()
			local var351, var352 = protoModule.writeTag(buff, var256, 35, protoModule.wireTypes.lengthDelimited)
			var351, var352 = protoModule.writeBuffer(var351, var352, var350, buffer.len(var350))
			buff = var351
			var256 = var352
		elseif self.kind.type == "moments_carousel" then
			local var353 = self.kind.value:encode()
			local var354, var355 = protoModule.writeTag(buff, var256, 34, protoModule.wireTypes.lengthDelimited)
			var354, var355 = protoModule.writeBuffer(var354, var355, var353, buffer.len(var353))
			buff = var354
			var256 = var355
		elseif self.kind.type == "text" then
			local var356 = self.kind.value:encode()
			local var357, var358 = protoModule.writeTag(buff, var256, 40, protoModule.wireTypes.lengthDelimited)
			var357, var358 = protoModule.writeBuffer(var357, var358, var356, buffer.len(var356))
			buff = var357
			var256 = var358
		elseif self.kind.type == "vertical_feed" then
			local var359 = self.kind.value:encode()
			local var360, var361 = protoModule.writeTag(buff, var256, 41, protoModule.wireTypes.lengthDelimited)
			var360, var361 = protoModule.writeBuffer(var360, var361, var359, buffer.len(var359))
			buff = var360
			var256 = var361
		elseif self.kind.type == "page_header" then
			local var362 = self.kind.value:encode()
			local var363, var364 = protoModule.writeTag(buff, var256, 42, protoModule.wireTypes.lengthDelimited)
			var363, var364 = protoModule.writeBuffer(var363, var364, var362, buffer.len(var362))
			buff = var363
			var256 = var364
		elseif self.kind.type == "image_cta_section" then
			local var365 = self.kind.value:encode()
			local var366, var367 = protoModule.writeTag(buff, var256, 43, protoModule.wireTypes.lengthDelimited)
			var366, var367 = protoModule.writeBuffer(var366, var367, var365, buffer.len(var365))
			buff = var366
			var256 = var367
		elseif self.kind.type == "experience_details_feed" then
			local var368 = self.kind.value:encode()
			local var369, var370 = protoModule.writeTag(buff, var256, 500, protoModule.wireTypes.lengthDelimited)
			var369, var370 = protoModule.writeBuffer(var369, var370, var368, buffer.len(var368))
			buff = var369
			var256 = var370
		elseif self.kind.type == "experience_details_action_bar" then
			local var371 = self.kind.value:encode()
			local var372, var373 = protoModule.writeTag(buff, var256, 501, protoModule.wireTypes.lengthDelimited)
			var372, var373 = protoModule.writeBuffer(var372, var373, var371, buffer.len(var371))
			buff = var372
			var256 = var373
		elseif self.kind.type == "experience_details_banner_image" then
			local var374 = self.kind.value:encode()
			local var375, var376 = protoModule.writeTag(buff, var256, 502, protoModule.wireTypes.lengthDelimited)
			var375, var376 = protoModule.writeBuffer(var375, var376, var374, buffer.len(var374))
			buff = var375
			var256 = var376
		elseif self.kind.type == "experience_details_sticky_header" then
			local var377 = self.kind.value:encode()
			local var378, var379 = protoModule.writeTag(buff, var256, 503, protoModule.wireTypes.lengthDelimited)
			var378, var379 = protoModule.writeBuffer(var378, var379, var377, buffer.len(var377))
			buff = var378
			var256 = var379
		elseif self.kind.type == "event_details_feed" then
			local var380 = self.kind.value:encode()
			local var381, var382 = protoModule.writeTag(buff, var256, 600, protoModule.wireTypes.lengthDelimited)
			var381, var382 = protoModule.writeBuffer(var381, var382, var380, buffer.len(var380))
			buff = var381
			var256 = var382
		elseif self.kind.type == "event_details_action_bar" then
			local var383 = self.kind.value:encode()
			local var384, var385 = protoModule.writeTag(buff, var256, 601, protoModule.wireTypes.lengthDelimited)
			var384, var385 = protoModule.writeBuffer(var384, var385, var383, buffer.len(var383))
			buff = var384
			var256 = var385
		elseif self.kind.type == "event_attribution_row" then
			local var386 = self.kind.value:encode()
			local var387, var388 = protoModule.writeTag(buff, var256, 602, protoModule.wireTypes.lengthDelimited)
			var387, var388 = protoModule.writeBuffer(var387, var388, var386, buffer.len(var386))
			buff = var387
			var256 = var388
		elseif self.kind.type == "event_description" then
			local var389 = self.kind.value:encode()
			local var390, var391 = protoModule.writeTag(buff, var256, 603, protoModule.wireTypes.lengthDelimited)
			var390, var391 = protoModule.writeBuffer(var390, var391, var389, buffer.len(var389))
			buff = var390
			var256 = var391
		elseif self.kind.type == "event_info_table" then
			local var392 = self.kind.value:encode()
			local var393, var394 = protoModule.writeTag(buff, var256, 604, protoModule.wireTypes.lengthDelimited)
			var393, var394 = protoModule.writeBuffer(var393, var394, var392, buffer.len(var392))
			buff = var393
			var256 = var394
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var395 = self.kind.value:encode()
			local var396, var397 = protoModule.writeTag(buff, var256, 605, protoModule.wireTypes.lengthDelimited)
			var396, var397 = protoModule.writeBuffer(var396, var397, var395, buffer.len(var395))
			buff = var396
			var256 = var397
		elseif self.kind.type == "event_notifications_modal" then
			local var398 = self.kind.value:encode()
			local var399, var400 = protoModule.writeTag(buff, var256, 606, protoModule.wireTypes.lengthDelimited)
			var399, var400 = protoModule.writeBuffer(var399, var400, var398, buffer.len(var398))
			buff = var399
			var256 = var400
		elseif self.kind.type == "dev_store_feed" then
			local var401 = self.kind.value:encode()
			local var402, var403 = protoModule.writeTag(buff, var256, 700, protoModule.wireTypes.lengthDelimited)
			var402, var403 = protoModule.writeBuffer(var402, var403, var401, buffer.len(var401))
			buff = var402
			var256 = var403
		elseif self.kind.type == "charts_feed" then
			local var404 = self.kind.value:encode()
			local var405, var406 = protoModule.writeTag(buff, var256, 800, protoModule.wireTypes.lengthDelimited)
			var405, var406 = protoModule.writeBuffer(var405, var406, var404, buffer.len(var404))
			buff = var405
			var256 = var406
		elseif self.kind.type == "filter_pills" then
			local var407 = self.kind.value:encode()
			local var408, var409 = protoModule.writeTag(buff, var256, 801, protoModule.wireTypes.lengthDelimited)
			var408, var409 = protoModule.writeBuffer(var408, var409, var407, buffer.len(var407))
			buff = var408
			var256 = var409
		elseif self.kind.type == "sort_selector" then
			local var410 = self.kind.value:encode()
			local var411, var412 = protoModule.writeTag(buff, var256, 802, protoModule.wireTypes.lengthDelimited)
			var411, var412 = protoModule.writeBuffer(var411, var412, var410, buffer.len(var410))
			buff = var411
			var256 = var412
		elseif self.kind.type == "genre_selector" then
			local var413 = self.kind.value:encode()
			local var414, var415 = protoModule.writeTag(buff, var256, 803, protoModule.wireTypes.lengthDelimited)
			var414, var415 = protoModule.writeBuffer(var414, var415, var413, buffer.len(var413))
			buff = var414
			var256 = var415
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var416 = self.kind.value:encode()
			local var417, var418 = protoModule.writeTag(buff, var256, 900, protoModule.wireTypes.lengthDelimited)
			var417, var418 = protoModule.writeBuffer(var417, var418, var416, buffer.len(var416))
			buff = var417
			var256 = var418
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var419 = self.kind.value:encode()
			local var420, var421 = protoModule.writeTag(buff, var256, 901, protoModule.wireTypes.lengthDelimited)
			var420, var421 = protoModule.writeBuffer(var420, var421, var419, buffer.len(var419))
			buff = var420
			var256 = var421
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var422 = self.kind.value:encode()
			local var423, var424 = protoModule.writeTag(buff, var256, 902, protoModule.wireTypes.lengthDelimited)
			var423, var424 = protoModule.writeBuffer(var423, var424, var422, buffer.len(var422))
			buff = var423
			var256 = var424
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var425 = self.kind.value:encode()
			local var426, var427 = protoModule.writeTag(buff, var256, 903, protoModule.wireTypes.lengthDelimited)
			var426, var427 = protoModule.writeBuffer(var426, var427, var425, buffer.len(var425))
			buff = var426
			var256 = var427
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var428 = self.kind.value:encode()
			local var429, var430 = protoModule.writeTag(buff, var256, 904, protoModule.wireTypes.lengthDelimited)
			var429, var430 = protoModule.writeBuffer(var429, var430, var428, buffer.len(var428))
			buff = var429
			var256 = var430
		elseif self.kind.type == "catalog_item_grid" then
			local var431 = self.kind.value:encode()
			local var432, var433 = protoModule.writeTag(buff, var256, 905, protoModule.wireTypes.lengthDelimited)
			var432, var433 = protoModule.writeBuffer(var432, var433, var431, buffer.len(var431))
			buff = var432
			var256 = var433
		elseif self.kind.type == "marketplace_offer_modal" then
			local var434 = self.kind.value:encode()
			local var435, var436 = protoModule.writeTag(buff, var256, 906, protoModule.wireTypes.lengthDelimited)
			var435, var436 = protoModule.writeBuffer(var435, var436, var434, buffer.len(var434))
			buff = var435
			var256 = var436
		elseif self.kind.type == "search_results_feed" then
			local var437 = self.kind.value:encode()
			local var438, var439 = protoModule.writeTag(buff, var256, 1000, protoModule.wireTypes.lengthDelimited)
			var438, var439 = protoModule.writeBuffer(var438, var439, var437, buffer.len(var437))
			buff = var438
			var256 = var439
		elseif self.kind.type == "power_search_ai_overview" then
			local var440 = self.kind.value:encode()
			local var441, var442 = protoModule.writeTag(buff, var256, 1001, protoModule.wireTypes.lengthDelimited)
			var441, var442 = protoModule.writeBuffer(var441, var442, var440, buffer.len(var440))
			buff = var441
			var256 = var442
		elseif self.kind.type == "experience_emphasis_tile" then
			local var443 = self.kind.value:encode()
			local var444, var445 = protoModule.writeTag(buff, var256, 1002, protoModule.wireTypes.lengthDelimited)
			var444, var445 = protoModule.writeBuffer(var444, var445, var443, buffer.len(var443))
			buff = var444
			var256 = var445
		elseif self.kind.type == "option_selector_carousel" then
			local var446 = self.kind.value:encode()
			local var447, var448 = protoModule.writeTag(buff, var256, 1100, protoModule.wireTypes.lengthDelimited)
			var447, var448 = protoModule.writeBuffer(var447, var448, var446, buffer.len(var446))
			buff = var447
			var256 = var448
		elseif self.kind.type == "friend_recommendation_carousel" then
			local var449 = self.kind.value:encode()
			local var450, var451 = protoModule.writeTag(buff, var256, 1103, protoModule.wireTypes.lengthDelimited)
			var450, var451 = protoModule.writeBuffer(var450, var451, var449, buffer.len(var449))
			buff = var450
			var256 = var451
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var452 = self.kind.value:encode()
			local var453, var454 = protoModule.writeTag(buff, var256, 1200, protoModule.wireTypes.lengthDelimited)
			var453, var454 = protoModule.writeBuffer(var453, var454, var452, buffer.len(var452))
			buff = var453
			var256 = var454
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var455 = self.kind.value:encode()
			local var456, var457 = protoModule.writeTag(buff, var256, 1300, protoModule.wireTypes.lengthDelimited)
			var456, var457 = protoModule.writeBuffer(var456, var457, var455, buffer.len(var455))
			buff = var456
			var256 = var457
		end
	end
	local buff_1 = buffer.create(var256)
	buffer.copy(buff_1, 0, buff, 0, var256)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 4804 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var459 = t_5.new()
	local var460 = 0
	while var460 < buffer.len(p9) do
		local _ = nil
		local var461 = nil
		local var462, var463, var464 = protoModule.readTag(p9, var460)
		local var465 = var462
		var461 = var463
		var460 = var464
		
		if var461 == protoModule.wireTypes.varint then
			local _ = nil
			local var466, var467 = protoModule.readVarInt(p9, var460)
			local _ = var466
			var460 = var467
			continue
		end
		if var461 == protoModule.wireTypes.lengthDelimited then
			if var465 == 1 then
				local _ = nil
				local var468, var469 = protoModule.readBuffer(p9, var460)
				var460 = var469
				var459.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var468)
				}
			elseif var465 == 2 then
				local _ = nil
				local var470, var471 = protoModule.readBuffer(p9, var460)
				var460 = var471
				var459.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var470)
				}
			elseif var465 == 3 then
				local _ = nil
				local var472, var473 = protoModule.readBuffer(p9, var460)
				var460 = var473
				var459.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var472)
				}
			elseif var465 == 4 then
				local _ = nil
				local var474, var475 = protoModule.readBuffer(p9, var460)
				var460 = var475
				var459.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var474)
				}
			elseif var465 == 5 then
				local _ = nil
				local var476, var477 = protoModule.readBuffer(p9, var460)
				var460 = var477
				var459.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var476)
				}
			elseif var465 == 6 then
				local _ = nil
				local var478, var479 = protoModule.readBuffer(p9, var460)
				var460 = var479
				var459.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var478)
				}
			elseif var465 == 7 then
				local _ = nil
				local var480, var481 = protoModule.readBuffer(p9, var460)
				var460 = var481
				var459.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var480)
				}
			elseif var465 == 8 then
				local _ = nil
				local var482, var483 = protoModule.readBuffer(p9, var460)
				var460 = var483
				var459.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var482)
				}
			elseif var465 == 9 then
				local _ = nil
				local var484, var485 = protoModule.readBuffer(p9, var460)
				var460 = var485
				var459.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var484)
				}
			elseif var465 == 10 then
				local _ = nil
				local var486, var487 = protoModule.readBuffer(p9, var460)
				var460 = var487
				var459.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var486)
				}
			elseif var465 == 11 then
				local _ = nil
				local var488, var489 = protoModule.readBuffer(p9, var460)
				var460 = var489
				var459.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var488)
				}
			elseif var465 == 12 then
				local _ = nil
				local var490, var491 = protoModule.readBuffer(p9, var460)
				var460 = var491
				var459.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var490)
				}
			elseif var465 == 13 then
				local _ = nil
				local var492, var493 = protoModule.readBuffer(p9, var460)
				var460 = var493
				var459.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var492)
				}
			elseif var465 == 14 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p9, var460)
				var460 = var495
				var459.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var494)
				}
			elseif var465 == 15 then
				local _ = nil
				local var496, var497 = protoModule.readBuffer(p9, var460)
				var460 = var497
				var459.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var496)
				}
			elseif var465 == 16 then
				local _ = nil
				local var498, var499 = protoModule.readBuffer(p9, var460)
				var460 = var499
				var459.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var498)
				}
			elseif var465 == 17 then
				local _ = nil
				local var500, var501 = protoModule.readBuffer(p9, var460)
				var460 = var501
				var459.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(var500)
				}
			elseif var465 == 20 then
				local _ = nil
				local var502, var503 = protoModule.readBuffer(p9, var460)
				var460 = var503
				var459.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var502)
				}
			elseif var465 == 21 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p9, var460)
				var460 = var505
				var459.kind = { type = "card", value = t.CardInputData.decode(var504) }
			elseif var465 == 22 then
				local _ = nil
				local var506, var507 = protoModule.readBuffer(p9, var460)
				var460 = var507
				var459.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var506)
				}
			elseif var465 == 23 then
				local _ = nil
				local var508, var509 = protoModule.readBuffer(p9, var460)
				var460 = var509
				var459.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var508)
				}
			elseif var465 == 24 then
				local _ = nil
				local var510, var511 = protoModule.readBuffer(p9, var460)
				var460 = var511
				var459.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var510)
				}
			elseif var465 == 25 then
				local _ = nil
				local var512, var513 = protoModule.readBuffer(p9, var460)
				var460 = var513
				var459.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var512)
				}
			elseif var465 == 26 then
				local _ = nil
				local var514, var515 = protoModule.readBuffer(p9, var460)
				var460 = var515
				var459.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var514)
				}
			elseif var465 == 27 then
				local _ = nil
				local var516, var517 = protoModule.readBuffer(p9, var460)
				var460 = var517
				var459.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var516)
				}
			elseif var465 == 28 then
				local _ = nil
				local var518, var519 = protoModule.readBuffer(p9, var460)
				var460 = var519
				var459.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var518)
				}
			elseif var465 == 29 then
				local _ = nil
				local var520, var521 = protoModule.readBuffer(p9, var460)
				var460 = var521
				var459.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var520)
				}
			elseif var465 == 30 then
				local _ = nil
				local var522, var523 = protoModule.readBuffer(p9, var460)
				var460 = var523
				var459.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var522)
				}
			elseif var465 == 31 then
				local _ = nil
				local var524, var525 = protoModule.readBuffer(p9, var460)
				var460 = var525
				var459.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var524)
				}
			elseif var465 == 32 then
				local _ = nil
				local var526, var527 = protoModule.readBuffer(p9, var460)
				var460 = var527
				var459.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var526)
				}
			elseif var465 == 33 then
				local _ = nil
				local var528, var529 = protoModule.readBuffer(p9, var460)
				var460 = var529
				var459.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var528)
				}
			elseif var465 == 34 then
				local _ = nil
				local var530, var531 = protoModule.readBuffer(p9, var460)
				var460 = var531
				var459.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var530)
				}
			elseif var465 == 35 then
				local _ = nil
				local var532, var533 = protoModule.readBuffer(p9, var460)
				var460 = var533
				var459.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(var532)
				}
			elseif var465 == 40 then
				local _ = nil
				local var534, var535 = protoModule.readBuffer(p9, var460)
				var460 = var535
				var459.kind = { type = "text", value = t.TextInputData.decode(var534) }
			elseif var465 == 41 then
				local _ = nil
				local var536, var537 = protoModule.readBuffer(p9, var460)
				var460 = var537
				var459.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var536)
				}
			elseif var465 == 42 then
				local _ = nil
				local var538, var539 = protoModule.readBuffer(p9, var460)
				var460 = var539
				var459.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var538)
				}
			elseif var465 == 43 then
				local _ = nil
				local var540, var541 = protoModule.readBuffer(p9, var460)
				var460 = var541
				var459.kind = {
					type = "image_cta_section",
					value = t.ImageCtaSectionInputData.decode(var540)
				}
			elseif var465 == 500 then
				local _ = nil
				local var542, var543 = protoModule.readBuffer(p9, var460)
				var460 = var543
				var459.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var542)
				}
			elseif var465 == 501 then
				local _ = nil
				local var544, var545 = protoModule.readBuffer(p9, var460)
				var460 = var545
				var459.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var544)
				}
			elseif var465 == 502 then
				local _ = nil
				local var546, var547 = protoModule.readBuffer(p9, var460)
				var460 = var547
				var459.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var546)
				}
			elseif var465 == 503 then
				local _ = nil
				local var548, var549 = protoModule.readBuffer(p9, var460)
				var460 = var549
				var459.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var548)
				}
			elseif var465 == 600 then
				local _ = nil
				local var550, var551 = protoModule.readBuffer(p9, var460)
				var460 = var551
				var459.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var550)
				}
			elseif var465 == 601 then
				local _ = nil
				local var552, var553 = protoModule.readBuffer(p9, var460)
				var460 = var553
				var459.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var552)
				}
			elseif var465 == 602 then
				local _ = nil
				local var554, var555 = protoModule.readBuffer(p9, var460)
				var460 = var555
				var459.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var554)
				}
			elseif var465 == 603 then
				local _ = nil
				local var556, var557 = protoModule.readBuffer(p9, var460)
				var460 = var557
				var459.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var556)
				}
			elseif var465 == 604 then
				local _ = nil
				local var558, var559 = protoModule.readBuffer(p9, var460)
				var460 = var559
				var459.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var558)
				}
			elseif var465 == 605 then
				local _ = nil
				local var560, var561 = protoModule.readBuffer(p9, var460)
				var460 = var561
				var459.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var560)
				}
			elseif var465 == 606 then
				local _ = nil
				local var562, var563 = protoModule.readBuffer(p9, var460)
				var460 = var563
				var459.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var562)
				}
			elseif var465 == 700 then
				local _ = nil
				local var564, var565 = protoModule.readBuffer(p9, var460)
				var460 = var565
				var459.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var564)
				}
			elseif var465 == 800 then
				local _ = nil
				local var566, var567 = protoModule.readBuffer(p9, var460)
				var460 = var567
				var459.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var566)
				}
			elseif var465 == 801 then
				local _ = nil
				local var568, var569 = protoModule.readBuffer(p9, var460)
				var460 = var569
				var459.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var568)
				}
			elseif var465 == 802 then
				local _ = nil
				local var570, var571 = protoModule.readBuffer(p9, var460)
				var460 = var571
				var459.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var570)
				}
			elseif var465 == 803 then
				local _ = nil
				local var572, var573 = protoModule.readBuffer(p9, var460)
				var460 = var573
				var459.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var572)
				}
			elseif var465 == 900 then
				local _ = nil
				local var574, var575 = protoModule.readBuffer(p9, var460)
				var460 = var575
				var459.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var574)
				}
			elseif var465 == 901 then
				local _ = nil
				local var576, var577 = protoModule.readBuffer(p9, var460)
				var460 = var577
				var459.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var576)
				}
			elseif var465 == 902 then
				local _ = nil
				local var578, var579 = protoModule.readBuffer(p9, var460)
				var460 = var579
				var459.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var578)
				}
			elseif var465 == 903 then
				local _ = nil
				local var580, var581 = protoModule.readBuffer(p9, var460)
				var460 = var581
				var459.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var580)
				}
			elseif var465 == 904 then
				local _ = nil
				local var582, var583 = protoModule.readBuffer(p9, var460)
				var460 = var583
				var459.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var582)
				}
			elseif var465 == 905 then
				local _ = nil
				local var584, var585 = protoModule.readBuffer(p9, var460)
				var460 = var585
				var459.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var584)
				}
			elseif var465 == 906 then
				local _ = nil
				local var586, var587 = protoModule.readBuffer(p9, var460)
				var460 = var587
				var459.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var586)
				}
			elseif var465 == 1000 then
				local _ = nil
				local var588, var589 = protoModule.readBuffer(p9, var460)
				var460 = var589
				var459.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var588)
				}
			elseif var465 == 1001 then
				local _ = nil
				local var590, var591 = protoModule.readBuffer(p9, var460)
				var460 = var591
				var459.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var590)
				}
			elseif var465 == 1002 then
				local _ = nil
				local var592, var593 = protoModule.readBuffer(p9, var460)
				var460 = var593
				var459.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var592)
				}
			elseif var465 == 1100 then
				local _ = nil
				local var594, var595 = protoModule.readBuffer(p9, var460)
				var460 = var595
				var459.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var594)
				}
			elseif var465 == 1103 then
				local _ = nil
				local var596, var597 = protoModule.readBuffer(p9, var460)
				var460 = var597
				var459.kind = {
					type = "friend_recommendation_carousel",
					value = t.FriendRecommendationCarouselInputData.decode(var596)
				}
			elseif var465 == 1200 then
				local _ = nil
				local var598, var599 = protoModule.readBuffer(p9, var460)
				var460 = var599
				var459.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var598)
				}
			elseif var465 == 1300 then
				local _ = nil
				local var600, var601 = protoModule.readBuffer(p9, var460)
				var460 = var601
				var459.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var600)
				}
			else
				local _ = nil
				local var602, var603 = protoModule.readVarInt(p9, var460)
				var460 = var603 + var602
			end
		elseif var461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var604, var605 = protoModule.readFixed32(p9, var460)
			local _ = var604
			var460 = var605
		elseif var461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var606, var607 = protoModule.readFixed64(p9, var460)
			local _ = var606
			var460 = var607
		else
			error("Unsupported wire type: " .. var461)
		end
	end
	return var459
end

function t_5:jsonEncode() --[[ line: 5274 ]]
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

function t_5:jsonDecode() --[[ line: 5418 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var609 = t_5.new()
	
	if self.badges_grid ~= nil then
		var609.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var609.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var609.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var609.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var609.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var609.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var609.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var609.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var609.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var609.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var609.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var609.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var609.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var609.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var609.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var609.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var609.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var609.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var609.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var609.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var609.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var609.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var609.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var609.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var609.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var609.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var609.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var609.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var609.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var609.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var609.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var609.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var609.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var609.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var609.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var609.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var609.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var609.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var609.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var609.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var609.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var609.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var609.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var609.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var609.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var609.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var609.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var609.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var609.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var609.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var609.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var609.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var609.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var609.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var609.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var609.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var609.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var609.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var609.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var609.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var609.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var609.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var609.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var609.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var609.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var609.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.image_cta_section ~= nil then
		var609.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.image_cta_section)
		}
	end
	if self.imageCtaSection ~= nil then
		var609.kind = {
			type = "image_cta_section",
			value = t.ImageCtaSectionInputData.jsonDecode(self.imageCtaSection)
		}
	end
	if self.experience_details_feed ~= nil then
		var609.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var609.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var609.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var609.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var609.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var609.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var609.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var609.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var609.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var609.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var609.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var609.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var609.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var609.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var609.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var609.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var609.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var609.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var609.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var609.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var609.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var609.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var609.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var609.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var609.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var609.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var609.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var609.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var609.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var609.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var609.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var609.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var609.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var609.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var609.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var609.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var609.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var609.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var609.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var609.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var609.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var609.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var609.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var609.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var609.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var609.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var609.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var609.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var609.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var609.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var609.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var609.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var609.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var609.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.friend_recommendation_carousel ~= nil then
		var609.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friend_recommendation_carousel)
		}
	end
	if self.friendRecommendationCarousel ~= nil then
		var609.kind = {
			type = "friend_recommendation_carousel",
			value = t.FriendRecommendationCarouselInputData.jsonDecode(self.friendRecommendationCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var609.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var609.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var609.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var609.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	return var609
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 6260 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p10 == nil or p10.section_title == nil then "" else p10.section_title,
		badges = if p10 == nil or p10.badges == nil then {} else p10.badges,
		collection_id = if p10 == nil or p10.collection_id == nil then "" else p10.collection_id,
		collection_position = if p10 == nil or p10.collection_position == nil then "" else p10.collection_position,
		universe_id = if p10 == nil or p10.universe_id == nil then "" else p10.universe_id
	}, t_6)
end

function t_6:encode() --[[ line: 6272 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var611 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var612, var613 = protoModule.writeTag(buff, var611, 1, protoModule.wireTypes.lengthDelimited)
		var612, var613 = protoModule.writeString(var612, var613, self.section_title)
		buff = var612
		var611 = var613
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var614 = v:encode()
			local var615, var616 = protoModule.writeTag(buff, var611, 2, protoModule.wireTypes.lengthDelimited)
			var615, var616 = protoModule.writeBuffer(var615, var616, var614, buffer.len(var614))
			buff = var615
			var611 = var616
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var617, var618 = protoModule.writeTag(buff, var611, 3, protoModule.wireTypes.lengthDelimited)
		var617, var618 = protoModule.writeString(var617, var618, self.collection_id)
		buff = var617
		var611 = var618
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var619, var620 = protoModule.writeTag(buff, var611, 4, protoModule.wireTypes.lengthDelimited)
		var619, var620 = protoModule.writeString(var619, var620, self.collection_position)
		buff = var619
		var611 = var620
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var621, var622 = protoModule.writeTag(buff, var611, 5, protoModule.wireTypes.lengthDelimited)
		var621, var622 = protoModule.writeString(var621, var622, self.universe_id)
		buff = var621
		var611 = var622
	end
	local buff_1 = buffer.create(var611)
	buffer.copy(buff_1, 0, buff, 0, var611)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 6309 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var624 = t_6.new()
	local var625 = 0
	while var625 < buffer.len(p11) do
		local _ = nil
		local var626 = nil
		local var627, var628, var629 = protoModule.readTag(p11, var625)
		local var630 = var627
		var626 = var628
		var625 = var629
		
		if var626 == protoModule.wireTypes.varint then
			local _ = nil
			local var631, var632 = protoModule.readVarInt(p11, var625)
			local _ = var631
			var625 = var632
			continue
		end
		if var626 == protoModule.wireTypes.lengthDelimited then
			if var630 == 1 then
				local _ = nil
				local var633, var634 = protoModule.readBuffer(p11, var625)
				var625 = var634
				var624.section_title = buffer.tostring(var633)
			elseif var630 == 2 then
				local _ = nil
				local var635, var636 = protoModule.readBuffer(p11, var625)
				var625 = var636
				table.insert(var624.badges, t.BadgesGridInputData_BadgeInputData.decode(var635))
			elseif var630 == 3 then
				local _ = nil
				local var637, var638 = protoModule.readBuffer(p11, var625)
				var625 = var638
				var624.collection_id = buffer.tostring(var637)
			elseif var630 == 4 then
				local _ = nil
				local var639, var640 = protoModule.readBuffer(p11, var625)
				var625 = var640
				var624.collection_position = buffer.tostring(var639)
			elseif var630 == 5 then
				local _ = nil
				local var641, var642 = protoModule.readBuffer(p11, var625)
				var625 = var642
				var624.universe_id = buffer.tostring(var641)
			else
				local _ = nil
				local var643, var644 = protoModule.readVarInt(p11, var625)
				var625 = var644 + var643
			end
		elseif var626 == protoModule.wireTypes.i32 then
			local _ = nil
			local var645, var646 = protoModule.readFixed32(p11, var625)
			local _ = var645
			var625 = var646
		elseif var626 == protoModule.wireTypes.i64 then
			local _ = nil
			local var647, var648 = protoModule.readFixed64(p11, var625)
			local _ = var647
			var625 = var648
		else
			error("Unsupported wire type: " .. var626)
		end
	end
	return var624
end

function t_6:jsonEncode() --[[ line: 6372 ]]
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

function t_6:jsonDecode() --[[ line: 6402 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var651 = t_6.new()
	
	if self.section_title ~= nil then
		var651.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var651.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var651.badges = t_1
	end
	if self.collection_id ~= nil then
		var651.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var651.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var651.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var651.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var651.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var651.universe_id = self.universeId
	end
	return var651
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 6463 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p12 == nil or p12.badge_id == nil then "" else p12.badge_id
	}, t_7)
end

function t_7:encode() --[[ line: 6471 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var654 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var655, var656 = protoModule.writeTag(buff, var654, 1, protoModule.wireTypes.lengthDelimited)
		var655, var656 = protoModule.writeString(var655, var656, self.badge_id)
		buff = var655
		var654 = var656
	end
	local buff_1 = buffer.create(var654)
	buffer.copy(buff_1, 0, buff, 0, var654)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 6485 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var658 = t_7.new()
	local var659 = 0
	while var659 < buffer.len(p13) do
		local _ = nil
		local var660 = nil
		local var661, var662, var663 = protoModule.readTag(p13, var659)
		local var664 = var661
		var660 = var662
		var659 = var663
		
		if var660 == protoModule.wireTypes.varint then
			local _ = nil
			local var665, var666 = protoModule.readVarInt(p13, var659)
			local _ = var665
			var659 = var666
			continue
		end
		if var660 == protoModule.wireTypes.lengthDelimited then
			if var664 == 1 then
				local _ = nil
				local var667, var668 = protoModule.readBuffer(p13, var659)
				var659 = var668
				var658.badge_id = buffer.tostring(var667)
			else
				local _ = nil
				local var669, var670 = protoModule.readVarInt(p13, var659)
				var659 = var670 + var669
			end
		elseif var660 == protoModule.wireTypes.i32 then
			local _ = nil
			local var671, var672 = protoModule.readFixed32(p13, var659)
			local _ = var671
			var659 = var672
		elseif var660 == protoModule.wireTypes.i64 then
			local _ = nil
			local var673, var674 = protoModule.readFixed64(p13, var659)
			local _ = var673
			var659 = var674
		else
			error("Unsupported wire type: " .. var660)
		end
	end
	return var658
end

function t_7:jsonEncode() --[[ line: 6528 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_7:jsonDecode() --[[ line: 6538 ]]
	-- upvalues: t_7 (ref)
	local var676 = t_7.new()
	
	if self.badge_id ~= nil then
		var676.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var676.badge_id = self.badgeId
	end
	return var676
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 6568 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p14 == nil or p14.badge_id == nil then "" else p14.badge_id,
		universe_id = if p14 == nil or p14.universe_id == nil then "" else p14.universe_id,
		localized_literals = if p14 == nil or p14.localized_literals == nil then nil else p14.localized_literals,
		creator_key = if p14 == nil or p14.creator_key == nil then "" else p14.creator_key
	}, t_8)
end

function t_8:encode() --[[ line: 6577 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var678 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var679, var680 = protoModule.writeTag(buff, var678, 1, protoModule.wireTypes.lengthDelimited)
		var679, var680 = protoModule.writeString(var679, var680, self.badge_id)
		buff = var679
		var678 = var680
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var681, var682 = protoModule.writeTag(buff, var678, 2, protoModule.wireTypes.lengthDelimited)
		var681, var682 = protoModule.writeString(var681, var682, self.universe_id)
		buff = var681
		var678 = var682
	end
	if self.localized_literals ~= nil then
		local var683 = self.localized_literals:encode()
		local var684, var685 = protoModule.writeTag(buff, var678, 3, protoModule.wireTypes.lengthDelimited)
		var684, var685 = protoModule.writeBuffer(var684, var685, var683, buffer.len(var683))
		buff = var684
		var678 = var685
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var686, var687 = protoModule.writeTag(buff, var678, 4, protoModule.wireTypes.lengthDelimited)
		var686, var687 = protoModule.writeString(var686, var687, self.creator_key)
		buff = var686
		var678 = var687
	end
	local buff_1 = buffer.create(var678)
	buffer.copy(buff_1, 0, buff, 0, var678)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 6607 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var689 = t_8.new()
	local var690 = 0
	while var690 < buffer.len(p15) do
		local _ = nil
		local var691 = nil
		local var692, var693, var694 = protoModule.readTag(p15, var690)
		local var695 = var692
		var691 = var693
		var690 = var694
		
		if var691 == protoModule.wireTypes.varint then
			local _ = nil
			local var696, var697 = protoModule.readVarInt(p15, var690)
			local _ = var696
			var690 = var697
			continue
		end
		if var691 == protoModule.wireTypes.lengthDelimited then
			if var695 == 1 then
				local _ = nil
				local var698, var699 = protoModule.readBuffer(p15, var690)
				var690 = var699
				var689.badge_id = buffer.tostring(var698)
			elseif var695 == 2 then
				local _ = nil
				local var700, var701 = protoModule.readBuffer(p15, var690)
				var690 = var701
				var689.universe_id = buffer.tostring(var700)
			elseif var695 == 3 then
				local _ = nil
				local var702, var703 = protoModule.readBuffer(p15, var690)
				var690 = var703
				var689.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var702)
			elseif var695 == 4 then
				local _ = nil
				local var704, var705 = protoModule.readBuffer(p15, var690)
				var690 = var705
				var689.creator_key = buffer.tostring(var704)
			else
				local _ = nil
				local var706, var707 = protoModule.readVarInt(p15, var690)
				var690 = var707 + var706
			end
		elseif var691 == protoModule.wireTypes.i32 then
			local _ = nil
			local var708, var709 = protoModule.readFixed32(p15, var690)
			local _ = var708
			var690 = var709
		elseif var691 == protoModule.wireTypes.i64 then
			local _ = nil
			local var710, var711 = protoModule.readFixed64(p15, var690)
			local _ = var710
			var690 = var711
		else
			error("Unsupported wire type: " .. var691)
		end
	end
	return var689
end

function t_8:jsonEncode() --[[ line: 6665 ]]
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

function t_8:jsonDecode() --[[ line: 6687 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var713 = t_8.new()
	
	if self.badge_id ~= nil then
		var713.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var713.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var713.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var713.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var713.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var713.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var713.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var713.creator_key = self.creatorKey
	end
	return var713
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 6741 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p16 == nil or p16.info_table == nil then nil else p16.info_table,
		action_module = if p16 == nil or p16.action_module == nil then nil else p16.action_module,
		overflow_menu = if p16 == nil or p16.overflow_menu == nil then nil else p16.overflow_menu
	}, t_9)
end

function t_9:encode() --[[ line: 6751 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var715 = 0
	
	if self.info_table ~= nil then
		local var716 = self.info_table:encode()
		local var717, var718 = protoModule.writeTag(buff, var715, 1, protoModule.wireTypes.lengthDelimited)
		var717, var718 = protoModule.writeBuffer(var717, var718, var716, buffer.len(var716))
		buff = var717
		var715 = var718
	end
	if self.action_module ~= nil then
		local var719 = self.action_module:encode()
		local var720, var721 = protoModule.writeTag(buff, var715, 2, protoModule.wireTypes.lengthDelimited)
		var720, var721 = protoModule.writeBuffer(var720, var721, var719, buffer.len(var719))
		buff = var720
		var715 = var721
	end
	if self.overflow_menu ~= nil then
		local var722 = self.overflow_menu:encode()
		local var723, var724 = protoModule.writeTag(buff, var715, 3, protoModule.wireTypes.lengthDelimited)
		var723, var724 = protoModule.writeBuffer(var723, var724, var722, buffer.len(var722))
		buff = var723
		var715 = var724
	end
	local buff_1 = buffer.create(var715)
	buffer.copy(buff_1, 0, buff, 0, var715)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 6778 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var726 = t_9.new()
	local var727 = 0
	while var727 < buffer.len(p17) do
		local _ = nil
		local var728 = nil
		local var729, var730, var731 = protoModule.readTag(p17, var727)
		local var732 = var729
		var728 = var730
		var727 = var731
		
		if var728 == protoModule.wireTypes.varint then
			local _ = nil
			local var733, var734 = protoModule.readVarInt(p17, var727)
			local _ = var733
			var727 = var734
			continue
		end
		if var728 == protoModule.wireTypes.lengthDelimited then
			if var732 == 1 then
				local _ = nil
				local var735, var736 = protoModule.readBuffer(p17, var727)
				var727 = var736
				var726.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var735)
			elseif var732 == 2 then
				local _ = nil
				local var737, var738 = protoModule.readBuffer(p17, var727)
				var727 = var738
				var726.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var737)
			elseif var732 == 3 then
				local _ = nil
				local var739, var740 = protoModule.readBuffer(p17, var727)
				var727 = var740
				var726.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var739)
			else
				local _ = nil
				local var741, var742 = protoModule.readVarInt(p17, var727)
				var727 = var742 + var741
			end
		elseif var728 == protoModule.wireTypes.i32 then
			local _ = nil
			local var743, var744 = protoModule.readFixed32(p17, var727)
			local _ = var743
			var727 = var744
		elseif var728 == protoModule.wireTypes.i64 then
			local _ = nil
			local var745, var746 = protoModule.readFixed64(p17, var727)
			local _ = var745
			var727 = var746
		else
			error("Unsupported wire type: " .. var728)
		end
	end
	return var726
end

function t_9:jsonEncode() --[[ line: 6831 ]]
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

function t_9:jsonDecode() --[[ line: 6849 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var748 = t_9.new()
	
	if self.info_table ~= nil then
		var748.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var748.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var748.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var748.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var748.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var748.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var748
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 6900 ]]
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

function t_10:encode() --[[ line: 6919 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var750 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var751, var752 = protoModule.writeTag(buff, var750, 1, protoModule.wireTypes.lengthDelimited)
		var751, var752 = protoModule.writeString(var751, var752, self.type_label)
		buff = var751
		var750 = var752
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var753, var754 = protoModule.writeTag(buff, var750, 2, protoModule.wireTypes.lengthDelimited)
		var753, var754 = protoModule.writeString(var753, var754, self.earned_label)
		buff = var753
		var750 = var754
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var755, var756 = protoModule.writeTag(buff, var750, 3, protoModule.wireTypes.lengthDelimited)
		var755, var756 = protoModule.writeString(var755, var756, self.updated_label)
		buff = var755
		var750 = var756
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var757, var758 = protoModule.writeTag(buff, var750, 4, protoModule.wireTypes.lengthDelimited)
		var757, var758 = protoModule.writeString(var757, var758, self.experience_label)
		buff = var757
		var750 = var758
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var759, var760 = protoModule.writeTag(buff, var750, 5, protoModule.wireTypes.lengthDelimited)
		var759, var760 = protoModule.writeString(var759, var760, self.rarity_label)
		buff = var759
		var750 = var760
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var761, var762 = protoModule.writeTag(buff, var750, 6, protoModule.wireTypes.lengthDelimited)
		var761, var762 = protoModule.writeString(var761, var762, self.won_yesterday_label)
		buff = var761
		var750 = var762
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var763, var764 = protoModule.writeTag(buff, var750, 7, protoModule.wireTypes.lengthDelimited)
		var763, var764 = protoModule.writeString(var763, var764, self.won_ever_label)
		buff = var763
		var750 = var764
	end
	local buff_1 = buffer.create(var750)
	buffer.copy(buff_1, 0, buff, 0, var750)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 6965 ]]
	-- upvalues: t_10 (ref), protoModule (ref)
	local var766 = t_10.new()
	local var767 = 0
	while var767 < buffer.len(p19) do
		local _ = nil
		local var768 = nil
		local var769, var770, var771 = protoModule.readTag(p19, var767)
		local var772 = var769
		var768 = var770
		var767 = var771
		
		if var768 == protoModule.wireTypes.varint then
			local _ = nil
			local var773, var774 = protoModule.readVarInt(p19, var767)
			local _ = var773
			var767 = var774
			continue
		end
		if var768 == protoModule.wireTypes.lengthDelimited then
			if var772 == 1 then
				local _ = nil
				local var775, var776 = protoModule.readBuffer(p19, var767)
				var767 = var776
				var766.type_label = buffer.tostring(var775)
			elseif var772 == 2 then
				local _ = nil
				local var777, var778 = protoModule.readBuffer(p19, var767)
				var767 = var778
				var766.earned_label = buffer.tostring(var777)
			elseif var772 == 3 then
				local _ = nil
				local var779, var780 = protoModule.readBuffer(p19, var767)
				var767 = var780
				var766.updated_label = buffer.tostring(var779)
			elseif var772 == 4 then
				local _ = nil
				local var781, var782 = protoModule.readBuffer(p19, var767)
				var767 = var782
				var766.experience_label = buffer.tostring(var781)
			elseif var772 == 5 then
				local _ = nil
				local var783, var784 = protoModule.readBuffer(p19, var767)
				var767 = var784
				var766.rarity_label = buffer.tostring(var783)
			elseif var772 == 6 then
				local _ = nil
				local var785, var786 = protoModule.readBuffer(p19, var767)
				var767 = var786
				var766.won_yesterday_label = buffer.tostring(var785)
			elseif var772 == 7 then
				local _ = nil
				local var787, var788 = protoModule.readBuffer(p19, var767)
				var767 = var788
				var766.won_ever_label = buffer.tostring(var787)
			else
				local _ = nil
				local var789, var790 = protoModule.readVarInt(p19, var767)
				var767 = var790 + var789
			end
		elseif var768 == protoModule.wireTypes.i32 then
			local _ = nil
			local var791, var792 = protoModule.readFixed32(p19, var767)
			local _ = var791
			var767 = var792
		elseif var768 == protoModule.wireTypes.i64 then
			local _ = nil
			local var793, var794 = protoModule.readFixed64(p19, var767)
			local _ = var793
			var767 = var794
		else
			error("Unsupported wire type: " .. var768)
		end
	end
	return var766
end

function t_10:jsonEncode() --[[ line: 7040 ]]
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

function t_10:jsonDecode() --[[ line: 7076 ]]
	-- upvalues: t_10 (ref)
	local var796 = t_10.new()
	
	if self.type_label ~= nil then
		var796.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var796.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var796.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var796.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var796.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var796.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var796.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var796.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var796.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var796.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var796.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var796.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var796.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var796.won_ever_label = self.wonEverLabel
	end
	return var796
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 7156 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p20 == nil or p20.share == nil then "" else p20.share,
		report = if p20 == nil or p20.report == nil then "" else p20.report
	}, t_11)
end

function t_11:encode() --[[ line: 7168 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var798 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var799, var800 = protoModule.writeTag(buff, var798, 1, protoModule.wireTypes.lengthDelimited)
		var799, var800 = protoModule.writeString(var799, var800, self.share)
		buff = var799
		var798 = var800
	end
	if self.report ~= nil and self.report ~= "" then
		local var801, var802 = protoModule.writeTag(buff, var798, 2, protoModule.wireTypes.lengthDelimited)
		var801, var802 = protoModule.writeString(var801, var802, self.report)
		buff = var801
		var798 = var802
	end
	local buff_1 = buffer.create(var798)
	buffer.copy(buff_1, 0, buff, 0, var798)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 7189 ]]
	-- upvalues: t_11 (ref), protoModule (ref)
	local var804 = t_11.new()
	local var805 = 0
	while var805 < buffer.len(p21) do
		local _ = nil
		local var806 = nil
		local var807, var808, var809 = protoModule.readTag(p21, var805)
		local var810 = var807
		var806 = var808
		var805 = var809
		
		if var806 == protoModule.wireTypes.varint then
			local _ = nil
			local var811, var812 = protoModule.readVarInt(p21, var805)
			local _ = var811
			var805 = var812
			continue
		end
		if var806 == protoModule.wireTypes.lengthDelimited then
			if var810 == 1 then
				local _ = nil
				local var813, var814 = protoModule.readBuffer(p21, var805)
				var805 = var814
				var804.share = buffer.tostring(var813)
			elseif var810 == 2 then
				local _ = nil
				local var815, var816 = protoModule.readBuffer(p21, var805)
				var805 = var816
				var804.report = buffer.tostring(var815)
			else
				local _ = nil
				local var817, var818 = protoModule.readVarInt(p21, var805)
				var805 = var818 + var817
			end
		elseif var806 == protoModule.wireTypes.i32 then
			local _ = nil
			local var819, var820 = protoModule.readFixed32(p21, var805)
			local _ = var819
			var805 = var820
		elseif var806 == protoModule.wireTypes.i64 then
			local _ = nil
			local var821, var822 = protoModule.readFixed64(p21, var805)
			local _ = var821
			var805 = var822
		else
			error("Unsupported wire type: " .. var806)
		end
	end
	return var804
end

function t_11:jsonEncode() --[[ line: 7239 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_11:jsonDecode() --[[ line: 7255 ]]
	-- upvalues: t_11 (ref)
	local var824 = t_11.new()
	
	if self.share ~= nil then
		var824.share = self.share
	end
	if self.report ~= nil then
		var824.report = self.report
	end
	return var824
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 7287 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p22 == nil or p22.report == nil then "" else p22.report,
		remove = if p22 == nil or p22.remove == nil then "" else p22.remove
	}, t_12)
end

function t_12:encode() --[[ line: 7299 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var826 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var827, var828 = protoModule.writeTag(buff, var826, 1, protoModule.wireTypes.lengthDelimited)
		var827, var828 = protoModule.writeString(var827, var828, self.report)
		buff = var827
		var826 = var828
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var829, var830 = protoModule.writeTag(buff, var826, 2, protoModule.wireTypes.lengthDelimited)
		var829, var830 = protoModule.writeString(var829, var830, self.remove)
		buff = var829
		var826 = var830
	end
	local buff_1 = buffer.create(var826)
	buffer.copy(buff_1, 0, buff, 0, var826)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 7320 ]]
	-- upvalues: t_12 (ref), protoModule (ref)
	local var832 = t_12.new()
	local var833 = 0
	while var833 < buffer.len(p23) do
		local _ = nil
		local var834 = nil
		local var835, var836, var837 = protoModule.readTag(p23, var833)
		local var838 = var835
		var834 = var836
		var833 = var837
		
		if var834 == protoModule.wireTypes.varint then
			local _ = nil
			local var839, var840 = protoModule.readVarInt(p23, var833)
			local _ = var839
			var833 = var840
			continue
		end
		if var834 == protoModule.wireTypes.lengthDelimited then
			if var838 == 1 then
				local _ = nil
				local var841, var842 = protoModule.readBuffer(p23, var833)
				var833 = var842
				var832.report = buffer.tostring(var841)
			elseif var838 == 2 then
				local _ = nil
				local var843, var844 = protoModule.readBuffer(p23, var833)
				var833 = var844
				var832.remove = buffer.tostring(var843)
			else
				local _ = nil
				local var845, var846 = protoModule.readVarInt(p23, var833)
				var833 = var846 + var845
			end
		elseif var834 == protoModule.wireTypes.i32 then
			local _ = nil
			local var847, var848 = protoModule.readFixed32(p23, var833)
			local _ = var847
			var833 = var848
		elseif var834 == protoModule.wireTypes.i64 then
			local _ = nil
			local var849, var850 = protoModule.readFixed64(p23, var833)
			local _ = var849
			var833 = var850
		else
			error("Unsupported wire type: " .. var834)
		end
	end
	return var832
end

function t_12:jsonEncode() --[[ line: 7370 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_12:jsonDecode() --[[ line: 7386 ]]
	-- upvalues: t_12 (ref)
	local var852 = t_12.new()
	
	if self.report ~= nil then
		var852.report = self.report
	end
	if self.remove ~= nil then
		var852.remove = self.remove
	end
	return var852
end

t_12.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t_12
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local t_13 = {}
t_13.__index = t_13

function t_13.new(_) --[[ line: 7417 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({}, t_13)
end

function t_13.encode(_) --[[ line: 7421 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_13.decode(p24) --[[ line: 7430 ]]
	-- upvalues: t_13 (ref), protoModule (ref)
	local var854 = t_13.new()
	local var855 = 0
	while var855 < buffer.len(p24) do
		local var856 = nil
		local _ = nil
		local var857, var858, var859 = protoModule.readTag(p24, var855)
		var856 = var857
		local var860 = var858
		var855 = var859
		
		if var860 == protoModule.wireTypes.varint then
			local _ = nil
			local var861, var862 = protoModule.readVarInt(p24, var855)
			local _ = var861
			var855 = var862
		elseif var860 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var863, var864 = protoModule.readVarInt(p24, var855)
			var855 = var864 + var863
		elseif var860 == protoModule.wireTypes.i32 then
			local _ = nil
			local var865, var866 = protoModule.readFixed32(p24, var855)
			local _ = var865
			var855 = var866
		elseif var860 == protoModule.wireTypes.i64 then
			local _ = nil
			local var867, var868 = protoModule.readFixed64(p24, var855)
			local _ = var867
			var855 = var868
		else
			error("Unsupported wire type: " .. var860)
		end
	end
	return var854
end

function t_13.jsonEncode(_) --[[ line: 7468 ]]
	return {}
end

function t_13.jsonDecode(_) --[[ line: 7474 ]]
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

function t_14.new(p25) --[[ line: 7494 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p25 == nil or p25.universe_id == nil then "" else p25.universe_id,
		creator_key = if p25 == nil or p25.creator_key == nil then "" else p25.creator_key,
		entry_map = if p25 == nil or p25.entry_map == nil then {} else p25.entry_map,
		entry_order = if p25 == nil or p25.entry_order == nil then {} else p25.entry_order,
		entry_order_map = if p25 == nil or p25.entry_order_map == nil then {} else p25.entry_order_map
	}, t_14)
end

function t_14:encode() --[[ line: 7506 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var870 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var871, var872 = protoModule.writeTag(buff, var870, 1, protoModule.wireTypes.lengthDelimited)
		var871, var872 = protoModule.writeString(var871, var872, self.universe_id)
		buff = var871
		var870 = var872
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var873, var874 = protoModule.writeTag(buff, var870, 2, protoModule.wireTypes.lengthDelimited)
		var873, var874 = protoModule.writeString(var873, var874, self.creator_key)
		buff = var873
		var870 = var874
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var875, var876 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var875, var876 = protoModule.writeString(var875, var876, i)
			local var877 = v:encode()
			var876, var878 = protoModule.writeTag(var875, var876, 2, protoModule.wireTypes.lengthDelimited)
			var876, var878 = protoModule.writeBuffer(var876, var878, var877, buffer.len(var877))
			local var879 = var876
			local var880 = var878
			local var881, var882 = protoModule.writeTag(buff, var870, 3, protoModule.wireTypes.lengthDelimited)
			var881, var882 = protoModule.writeBuffer(var881, var882, var879, var880)
			buff = var881
			var870 = var882
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var883, var884 = protoModule.writeTag(buff, var870, 4, protoModule.wireTypes.lengthDelimited)
			var883, var884 = protoModule.writeString(var883, var884, v)
			buff = var883
			var870 = var884
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var885, var886 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var885, var886 = protoModule.writeString(var885, var886, i)
			local var887 = v:encode()
			var886, var888 = protoModule.writeTag(var885, var886, 2, protoModule.wireTypes.lengthDelimited)
			var886, var888 = protoModule.writeBuffer(var886, var888, var887, buffer.len(var887))
			local var889 = var886
			local var890 = var888
			local var891, var892 = protoModule.writeTag(buff, var870, 5, protoModule.wireTypes.lengthDelimited)
			var891, var892 = protoModule.writeBuffer(var891, var892, var889, var890)
			buff = var891
			var870 = var892
		end
	end
	local buff_1 = buffer.create(var870)
	buffer.copy(buff_1, 0, buff, 0, var870)
	
	return buff_1
end

function t_14.decode(p26) --[[ line: 7560 ]]
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var894 = t_14.new()
	local var895 = 0
	while var895 < buffer.len(p26) do
		local _ = nil
		local var896 = nil
		local var897, var898, var899 = protoModule.readTag(p26, var895)
		local var900 = var897
		var896 = var898
		var895 = var899
		
		if var896 == protoModule.wireTypes.varint then
			local _ = nil
			local var901, var902 = protoModule.readVarInt(p26, var895)
			local _ = var901
			var895 = var902
			continue
		end
		if var896 == protoModule.wireTypes.lengthDelimited then
			if var900 == 1 then
				local _ = nil
				local var903, var904 = protoModule.readBuffer(p26, var895)
				var895 = var904
				var894.universe_id = buffer.tostring(var903)
			elseif var900 == 2 then
				local _ = nil
				local var905, var906 = protoModule.readBuffer(p26, var895)
				var895 = var906
				var894.creator_key = buffer.tostring(var905)
			elseif var900 == 3 then
				local _ = nil
				local var907, var908 = protoModule.readBuffer(p26, var895)
				var895 = var908
				var907 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var907)
				var894.entry_map[var907.key or ""] = var907.value or t.FeedEntry.new()
			elseif var900 == 4 then
				local _ = nil
				local var909, var910 = protoModule.readBuffer(p26, var895)
				var895 = var910
				table.insert(var894.entry_order, buffer.tostring(var909))
			elseif var900 == 5 then
				local _ = nil
				local var911, var912 = protoModule.readBuffer(p26, var895)
				var895 = var912
				var911 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var911)
				var894.entry_order_map[var911.key or ""] = var911.value or t.EntryOrder.new()
			else
				local _ = nil
				local var913, var914 = protoModule.readVarInt(p26, var895)
				var895 = var914 + var913
			end
		elseif var896 == protoModule.wireTypes.i32 then
			local _ = nil
			local var915, var916 = protoModule.readFixed32(p26, var895)
			local _ = var915
			var895 = var916
		elseif var896 == protoModule.wireTypes.i64 then
			local _ = nil
			local var917, var918 = protoModule.readFixed64(p26, var895)
			local _ = var917
			var895 = var918
		else
			error("Unsupported wire type: " .. var896)
		end
	end
	return var894
end

function t_14:jsonEncode() --[[ line: 7637 ]]
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

function t_14:jsonDecode() --[[ line: 7675 ]]
	-- upvalues: t_14 (ref), t (ref)
	local var923 = t_14.new()
	
	if self.universe_id ~= nil then
		var923.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var923.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var923.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var923.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var923.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var923.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var923.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var923.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var923.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var923.entry_order_map = t_1
	end
	return var923
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p27) --[[ line: 7765 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p27 == nil or p27.key == nil then "" else p27.key,
		value = if p27 == nil or p27.value == nil then nil else p27.value
	}, t_15)
end

function t_15:encode() --[[ line: 7774 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var931 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var932, var933 = protoModule.writeTag(buff, var931, 1, protoModule.wireTypes.lengthDelimited)
		var932, var933 = protoModule.writeString(var932, var933, self.key)
		buff = var932
		var931 = var933
	end
	if self.value ~= nil then
		local var934 = self.value:encode()
		local var935, var936 = protoModule.writeTag(buff, var931, 2, protoModule.wireTypes.lengthDelimited)
		var935, var936 = protoModule.writeBuffer(var935, var936, var934, buffer.len(var934))
		buff = var935
		var931 = var936
	end
	local buff_1 = buffer.create(var931)
	buffer.copy(buff_1, 0, buff, 0, var931)
	
	return buff_1
end

function t_15.decode(p28) --[[ line: 7796 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var938 = t_15.new()
	local var939 = 0
	while var939 < buffer.len(p28) do
		local _ = nil
		local var940 = nil
		local var941, var942, var943 = protoModule.readTag(p28, var939)
		local var944 = var941
		var940 = var942
		var939 = var943
		
		if var940 == protoModule.wireTypes.varint then
			local _ = nil
			local var945, var946 = protoModule.readVarInt(p28, var939)
			local _ = var945
			var939 = var946
			continue
		end
		if var940 == protoModule.wireTypes.lengthDelimited then
			if var944 == 1 then
				local _ = nil
				local var947, var948 = protoModule.readBuffer(p28, var939)
				var939 = var948
				var938.key = buffer.tostring(var947)
			elseif var944 == 2 then
				local _ = nil
				local var949, var950 = protoModule.readBuffer(p28, var939)
				var939 = var950
				var938.value = t.FeedEntry.decode(var949)
			else
				local _ = nil
				local var951, var952 = protoModule.readVarInt(p28, var939)
				var939 = var952 + var951
			end
		elseif var940 == protoModule.wireTypes.i32 then
			local _ = nil
			local var953, var954 = protoModule.readFixed32(p28, var939)
			local _ = var953
			var939 = var954
		elseif var940 == protoModule.wireTypes.i64 then
			local _ = nil
			local var955, var956 = protoModule.readFixed64(p28, var939)
			local _ = var955
			var939 = var956
		else
			error("Unsupported wire type: " .. var940)
		end
	end
	return var938
end

function t_15:jsonEncode() --[[ line: 7846 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode() --[[ line: 7862 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var958 = t_15.new()
	
	if self.key ~= nil then
		var958.key = self.key
	end
	if self.value ~= nil then
		var958.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var958
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p29) --[[ line: 7893 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p29 == nil or p29.key == nil then "" else p29.key,
		value = if p29 == nil or p29.value == nil then nil else p29.value
	}, t_16)
end

function t_16:encode() --[[ line: 7905 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var960 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var961, var962 = protoModule.writeTag(buff, var960, 1, protoModule.wireTypes.lengthDelimited)
		var961, var962 = protoModule.writeString(var961, var962, self.key)
		buff = var961
		var960 = var962
	end
	if self.value ~= nil then
		local var963 = self.value:encode()
		local var964, var965 = protoModule.writeTag(buff, var960, 2, protoModule.wireTypes.lengthDelimited)
		var964, var965 = protoModule.writeBuffer(var964, var965, var963, buffer.len(var963))
		buff = var964
		var960 = var965
	end
	local buff_1 = buffer.create(var960)
	buffer.copy(buff_1, 0, buff, 0, var960)
	
	return buff_1
end

function t_16.decode(p30) --[[ line: 7927 ]]
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var967 = t_16.new()
	local var968 = 0
	while var968 < buffer.len(p30) do
		local _ = nil
		local var969 = nil
		local var970, var971, var972 = protoModule.readTag(p30, var968)
		local var973 = var970
		var969 = var971
		var968 = var972
		
		if var969 == protoModule.wireTypes.varint then
			local _ = nil
			local var974, var975 = protoModule.readVarInt(p30, var968)
			local _ = var974
			var968 = var975
			continue
		end
		if var969 == protoModule.wireTypes.lengthDelimited then
			if var973 == 1 then
				local _ = nil
				local var976, var977 = protoModule.readBuffer(p30, var968)
				var968 = var977
				var967.key = buffer.tostring(var976)
			elseif var973 == 2 then
				local _ = nil
				local var978, var979 = protoModule.readBuffer(p30, var968)
				var968 = var979
				var967.value = t.EntryOrder.decode(var978)
			else
				local _ = nil
				local var980, var981 = protoModule.readVarInt(p30, var968)
				var968 = var981 + var980
			end
		elseif var969 == protoModule.wireTypes.i32 then
			local _ = nil
			local var982, var983 = protoModule.readFixed32(p30, var968)
			local _ = var982
			var968 = var983
		elseif var969 == protoModule.wireTypes.i64 then
			local _ = nil
			local var984, var985 = protoModule.readFixed64(p30, var968)
			local _ = var984
			var968 = var985
		else
			error("Unsupported wire type: " .. var969)
		end
	end
	return var967
end

function t_16:jsonEncode() --[[ line: 7977 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode() --[[ line: 7993 ]]
	-- upvalues: t_16 (ref), t (ref)
	local var987 = t_16.new()
	
	if self.key ~= nil then
		var987.key = self.key
	end
	if self.value ~= nil then
		var987.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var987
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p31) --[[ line: 8024 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p31 == nil or p31.items == nil then {} else p31.items
	}, t_17)
end

function t_17:encode() --[[ line: 8030 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var989 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var990, var991 = protoModule.writeTag(buff, var989, 1, protoModule.wireTypes.lengthDelimited)
			var990, var991 = protoModule.writeString(var990, var991, v)
			buff = var990
			var989 = var991
		end
	end
	local buff_1 = buffer.create(var989)
	buffer.copy(buff_1, 0, buff, 0, var989)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 8046 ]]
	-- upvalues: t_17 (ref), protoModule (ref)
	local var993 = t_17.new()
	local var994 = 0
	while var994 < buffer.len(p32) do
		local _ = nil
		local var995 = nil
		local var996, var997, var998 = protoModule.readTag(p32, var994)
		local var999 = var996
		var995 = var997
		var994 = var998
		
		if var995 == protoModule.wireTypes.varint then
			local _ = nil
			local var1000, var1001 = protoModule.readVarInt(p32, var994)
			local _ = var1000
			var994 = var1001
			continue
		end
		if var995 == protoModule.wireTypes.lengthDelimited then
			if var999 == 1 then
				local _ = nil
				local var1002, var1003 = protoModule.readBuffer(p32, var994)
				var994 = var1003
				table.insert(var993.items, buffer.tostring(var1002))
			else
				local _ = nil
				local var1004, var1005 = protoModule.readVarInt(p32, var994)
				var994 = var1005 + var1004
			end
		elseif var995 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1006, var1007 = protoModule.readFixed32(p32, var994)
			local _ = var1006
			var994 = var1007
		elseif var995 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1008, var1009 = protoModule.readFixed64(p32, var994)
			local _ = var1008
			var994 = var1009
		else
			error("Unsupported wire type: " .. var995)
		end
	end
	return var993
end

function t_17:jsonEncode() --[[ line: 8089 ]]
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

function t_17:jsonDecode() --[[ line: 8103 ]]
	-- upvalues: t_17 (ref)
	local var1012 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var1012.items = t
	end
	return var1012
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p33) --[[ line: 8132 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p33 == nil or p33.universe_id == nil then "" else p33.universe_id,
		user_owns_experience = if p33 == nil or p33.user_owns_experience == nil then false else p33.user_owns_experience
	}, t_18)
end

function t_18:encode() --[[ line: 8143 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1015 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1016, var1017 = protoModule.writeTag(buff, var1015, 1, protoModule.wireTypes.lengthDelimited)
		var1016, var1017 = protoModule.writeString(var1016, var1017, self.universe_id)
		buff = var1016
		var1015 = var1017
	end
	if self.user_owns_experience then
		local var1018, var1019 = protoModule.writeTag(buff, var1015, 2, protoModule.wireTypes.varint)
		var1018, var1019 = protoModule.writeVarInt(var1018, var1019, if self.user_owns_experience then 1 else 0)
		buff = var1018
		var1015 = var1019
	end
	local buff_1 = buffer.create(var1015)
	buffer.copy(buff_1, 0, buff, 0, var1015)
	
	return buff_1
end

function t_18.decode(p34) --[[ line: 8162 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var1021 = t_18.new()
	local var1022 = 0
	while var1022 < buffer.len(p34) do
		local _ = nil
		local var1023 = nil
		local var1024, var1025, var1026 = protoModule.readTag(p34, var1022)
		local var1027 = var1024
		var1023 = var1025
		var1022 = var1026
		
		if var1023 == protoModule.wireTypes.varint then
			if var1027 == 2 then
				local _ = nil
				local var1028, var1029 = protoModule.readVarInt(p34, var1022)
				var1022 = var1029
				var1021.user_owns_experience = var1028 ~= 0
			else
				local _ = nil
				local var1030, var1031 = protoModule.readVarInt(p34, var1022)
				local _ = var1030
				var1022 = var1031
			end
		end
		if var1023 == protoModule.wireTypes.lengthDelimited then
			if var1027 == 1 then
				local _ = nil
				local var1032, var1033 = protoModule.readBuffer(p34, var1022)
				var1022 = var1033
				var1021.universe_id = buffer.tostring(var1032)
			else
				local _ = nil
				local var1034, var1035 = protoModule.readVarInt(p34, var1022)
				var1022 = var1035 + var1034
			end
		elseif var1023 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1036, var1037 = protoModule.readFixed32(p34, var1022)
			local _ = var1036
			var1022 = var1037
		elseif var1023 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1038, var1039 = protoModule.readFixed64(p34, var1022)
			local _ = var1038
			var1022 = var1039
		else
			error("Unsupported wire type: " .. var1023)
		end
	end
	return var1021
end

function t_18:jsonEncode() --[[ line: 8210 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_18:jsonDecode() --[[ line: 8224 ]]
	-- upvalues: t_18 (ref)
	local var1041 = t_18.new()
	
	if self.universe_id ~= nil then
		var1041.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1041.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1041.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1041.user_owns_experience = self.userOwnsExperience
	end
	return var1041
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p35) --[[ line: 8262 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p35 == nil or p35.media_asset_id == nil then "" else p35.media_asset_id
	}, t_19)
end

function t_19:encode() --[[ line: 8270 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1043 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1044, var1045 = protoModule.writeTag(buff, var1043, 1, protoModule.wireTypes.lengthDelimited)
		var1044, var1045 = protoModule.writeString(var1044, var1045, self.media_asset_id)
		buff = var1044
		var1043 = var1045
	end
	local buff_1 = buffer.create(var1043)
	buffer.copy(buff_1, 0, buff, 0, var1043)
	
	return buff_1
end

function t_19.decode(p36) --[[ line: 8284 ]]
	-- upvalues: t_19 (ref), protoModule (ref)
	local var1047 = t_19.new()
	local var1048 = 0
	while var1048 < buffer.len(p36) do
		local _ = nil
		local var1049 = nil
		local var1050, var1051, var1052 = protoModule.readTag(p36, var1048)
		local var1053 = var1050
		var1049 = var1051
		var1048 = var1052
		
		if var1049 == protoModule.wireTypes.varint then
			local _ = nil
			local var1054, var1055 = protoModule.readVarInt(p36, var1048)
			local _ = var1054
			var1048 = var1055
			continue
		end
		if var1049 == protoModule.wireTypes.lengthDelimited then
			if var1053 == 1 then
				local _ = nil
				local var1056, var1057 = protoModule.readBuffer(p36, var1048)
				var1048 = var1057
				var1047.media_asset_id = buffer.tostring(var1056)
			else
				local _ = nil
				local var1058, var1059 = protoModule.readVarInt(p36, var1048)
				var1048 = var1059 + var1058
			end
		elseif var1049 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1060, var1061 = protoModule.readFixed32(p36, var1048)
			local _ = var1060
			var1048 = var1061
		elseif var1049 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1062, var1063 = protoModule.readFixed64(p36, var1048)
			local _ = var1062
			var1048 = var1063
		else
			error("Unsupported wire type: " .. var1049)
		end
	end
	return var1047
end

function t_19:jsonEncode() --[[ line: 8327 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_19:jsonDecode() --[[ line: 8337 ]]
	-- upvalues: t_19 (ref)
	local var1065 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var1065.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1065.media_asset_id = self.mediaAssetId
	end
	return var1065
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p37) --[[ line: 8367 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p37 == nil or p37.universe_id == nil then "" else p37.universe_id
	}, t_20)
end

function t_20:encode() --[[ line: 8375 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1067 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1068, var1069 = protoModule.writeTag(buff, var1067, 1, protoModule.wireTypes.lengthDelimited)
		var1068, var1069 = protoModule.writeString(var1068, var1069, self.universe_id)
		buff = var1068
		var1067 = var1069
	end
	local buff_1 = buffer.create(var1067)
	buffer.copy(buff_1, 0, buff, 0, var1067)
	
	return buff_1
end

function t_20.decode(p38) --[[ line: 8389 ]]
	-- upvalues: t_20 (ref), protoModule (ref)
	local var1071 = t_20.new()
	local var1072 = 0
	while var1072 < buffer.len(p38) do
		local _ = nil
		local var1073 = nil
		local var1074, var1075, var1076 = protoModule.readTag(p38, var1072)
		local var1077 = var1074
		var1073 = var1075
		var1072 = var1076
		
		if var1073 == protoModule.wireTypes.varint then
			local _ = nil
			local var1078, var1079 = protoModule.readVarInt(p38, var1072)
			local _ = var1078
			var1072 = var1079
			continue
		end
		if var1073 == protoModule.wireTypes.lengthDelimited then
			if var1077 == 1 then
				local _ = nil
				local var1080, var1081 = protoModule.readBuffer(p38, var1072)
				var1072 = var1081
				var1071.universe_id = buffer.tostring(var1080)
			else
				local _ = nil
				local var1082, var1083 = protoModule.readVarInt(p38, var1072)
				var1072 = var1083 + var1082
			end
		elseif var1073 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1084, var1085 = protoModule.readFixed32(p38, var1072)
			local _ = var1084
			var1072 = var1085
		elseif var1073 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1086, var1087 = protoModule.readFixed64(p38, var1072)
			local _ = var1086
			var1072 = var1087
		else
			error("Unsupported wire type: " .. var1073)
		end
	end
	return var1071
end

function t_20:jsonEncode() --[[ line: 8432 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_20:jsonDecode() --[[ line: 8442 ]]
	-- upvalues: t_20 (ref)
	local var1089 = t_20.new()
	
	if self.universe_id ~= nil then
		var1089.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1089.universe_id = self.universeId
	end
	return var1089
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p39) --[[ line: 8472 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p39 == nil or p39.universe_id == nil then "" else p39.universe_id,
		creator_key = if p39 == nil or p39.creator_key == nil then "" else p39.creator_key
	}, t_21)
end

function t_21:encode() --[[ line: 8481 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1091 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1092, var1093 = protoModule.writeTag(buff, var1091, 1, protoModule.wireTypes.lengthDelimited)
		var1092, var1093 = protoModule.writeString(var1092, var1093, self.universe_id)
		buff = var1092
		var1091 = var1093
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1094, var1095 = protoModule.writeTag(buff, var1091, 2, protoModule.wireTypes.lengthDelimited)
		var1094, var1095 = protoModule.writeString(var1094, var1095, self.creator_key)
		buff = var1094
		var1091 = var1095
	end
	local buff_1 = buffer.create(var1091)
	buffer.copy(buff_1, 0, buff, 0, var1091)
	
	return buff_1
end

function t_21.decode(p40) --[[ line: 8500 ]]
	-- upvalues: t_21 (ref), protoModule (ref)
	local var1097 = t_21.new()
	local var1098 = 0
	while var1098 < buffer.len(p40) do
		local _ = nil
		local var1099 = nil
		local var1100, var1101, var1102 = protoModule.readTag(p40, var1098)
		local var1103 = var1100
		var1099 = var1101
		var1098 = var1102
		
		if var1099 == protoModule.wireTypes.varint then
			local _ = nil
			local var1104, var1105 = protoModule.readVarInt(p40, var1098)
			local _ = var1104
			var1098 = var1105
			continue
		end
		if var1099 == protoModule.wireTypes.lengthDelimited then
			if var1103 == 1 then
				local _ = nil
				local var1106, var1107 = protoModule.readBuffer(p40, var1098)
				var1098 = var1107
				var1097.universe_id = buffer.tostring(var1106)
			elseif var1103 == 2 then
				local _ = nil
				local var1108, var1109 = protoModule.readBuffer(p40, var1098)
				var1098 = var1109
				var1097.creator_key = buffer.tostring(var1108)
			else
				local _ = nil
				local var1110, var1111 = protoModule.readVarInt(p40, var1098)
				var1098 = var1111 + var1110
			end
		elseif var1099 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1112, var1113 = protoModule.readFixed32(p40, var1098)
			local _ = var1112
			var1098 = var1113
		elseif var1099 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1114, var1115 = protoModule.readFixed64(p40, var1098)
			local _ = var1114
			var1098 = var1115
		else
			error("Unsupported wire type: " .. var1099)
		end
	end
	return var1097
end

function t_21:jsonEncode() --[[ line: 8548 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_21:jsonDecode() --[[ line: 8562 ]]
	-- upvalues: t_21 (ref)
	local var1117 = t_21.new()
	
	if self.universe_id ~= nil then
		var1117.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1117.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1117.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1117.creator_key = self.creatorKey
	end
	return var1117
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p41) --[[ line: 8600 ]]
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

function t_22:encode() --[[ line: 8622 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1119 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1120, var1121 = protoModule.writeTag(buff, var1119, 1, protoModule.wireTypes.lengthDelimited)
		var1120, var1121 = protoModule.writeString(var1120, var1121, self.universe_id)
		buff = var1120
		var1119 = var1121
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var1122, var1123 = protoModule.writeTag(buff, var1119, 2, protoModule.wireTypes.lengthDelimited)
		var1122, var1123 = protoModule.writeString(var1122, var1123, self.root_place_id)
		buff = var1122
		var1119 = var1123
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var1124, var1125 = protoModule.writeTag(buff, var1119, 3, protoModule.wireTypes.lengthDelimited)
		var1124, var1125 = protoModule.writeString(var1124, var1125, self.connection_played_display_name)
		buff = var1124
		var1119 = var1125
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1126, var1127 = protoModule.writeTag(buff, var1119, 4, protoModule.wireTypes.lengthDelimited)
		var1126, var1127 = protoModule.writeString(var1126, var1127, self.upsell_prompt)
		buff = var1126
		var1119 = var1127
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var1128 = v:encode()
			local var1129, var1130 = protoModule.writeTag(buff, var1119, 5, protoModule.wireTypes.lengthDelimited)
			var1129, var1130 = protoModule.writeBuffer(var1129, var1130, var1128, buffer.len(var1128))
			buff = var1129
			var1119 = var1130
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var1131, var1132 = protoModule.writeTag(buff, var1119, 6, protoModule.wireTypes.varint)
		var1131, var1132 = protoModule.writeVarInt(var1131, var1132, self.connection_played_num_others)
		buff = var1131
		var1119 = var1132
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var1133, var1134 = protoModule.writeTag(buff, var1119, 7, protoModule.wireTypes.varint)
		var1133, var1134 = protoModule.writeVarInt(var1133, var1134, self.connection_played_total_count)
		buff = var1133
		var1119 = var1134
	end
	local buff_1 = buffer.create(var1119)
	buffer.copy(buff_1, 0, buff, 0, var1119)
	
	return buff_1
end

function t_22.decode(p42) --[[ line: 8669 ]]
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var1136 = t_22.new()
	local var1137 = 0
	while var1137 < buffer.len(p42) do
		local _ = nil
		local var1138 = nil
		local var1139, var1140, var1141 = protoModule.readTag(p42, var1137)
		local var1142 = var1139
		var1138 = var1140
		var1137 = var1141
		
		if var1138 == protoModule.wireTypes.varint then
			if var1142 == 6 then
				local _ = nil
				local var1143, var1144 = protoModule.readVarIntI32(p42, var1137)
				var1137 = var1144
				var1136.connection_played_num_others = var1143
			elseif var1142 == 7 then
				local _ = nil
				local var1145, var1146 = protoModule.readVarIntI32(p42, var1137)
				var1137 = var1146
				var1136.connection_played_total_count = var1145
			else
				local _ = nil
				local var1147, var1148 = protoModule.readVarInt(p42, var1137)
				local _ = var1147
				var1137 = var1148
			end
		end
		if var1138 == protoModule.wireTypes.lengthDelimited then
			if var1142 == 1 then
				local _ = nil
				local var1149, var1150 = protoModule.readBuffer(p42, var1137)
				var1137 = var1150
				var1136.universe_id = buffer.tostring(var1149)
			elseif var1142 == 2 then
				local _ = nil
				local var1151, var1152 = protoModule.readBuffer(p42, var1137)
				var1137 = var1152
				var1136.root_place_id = buffer.tostring(var1151)
			elseif var1142 == 3 then
				local _ = nil
				local var1153, var1154 = protoModule.readBuffer(p42, var1137)
				var1137 = var1154
				var1136.connection_played_display_name = buffer.tostring(var1153)
			elseif var1142 == 4 then
				local _ = nil
				local var1155, var1156 = protoModule.readBuffer(p42, var1137)
				var1137 = var1156
				var1136.upsell_prompt = buffer.tostring(var1155)
			elseif var1142 == 5 then
				local _ = nil
				local var1157, var1158 = protoModule.readBuffer(p42, var1137)
				var1137 = var1158
				table.insert(var1136.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var1157))
			else
				local _ = nil
				local var1159, var1160 = protoModule.readVarInt(p42, var1137)
				var1137 = var1160 + var1159
			end
		elseif var1138 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1161, var1162 = protoModule.readFixed32(p42, var1137)
			local _ = var1161
			var1137 = var1162
		elseif var1138 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1163, var1164 = protoModule.readFixed64(p42, var1137)
			local _ = var1163
			var1137 = var1164
		else
			error("Unsupported wire type: " .. var1138)
		end
	end
	return var1136
end

function t_22:jsonEncode() --[[ line: 8745 ]]
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

function t_22:jsonDecode() --[[ line: 8783 ]]
	-- upvalues: t_22 (ref), t (ref)
	local var1167 = t_22.new()
	
	if self.universe_id ~= nil then
		var1167.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1167.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var1167.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var1167.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var1167.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var1167.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var1167.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1167.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1167.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1167.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var1167.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var1167.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var1167.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var1167.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var1167
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p43) --[[ line: 8870 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p43 == nil or p43.user_id == nil then "" else p43.user_id
	}, t_23)
end

function t_23:encode() --[[ line: 8881 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1171 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1172, var1173 = protoModule.writeTag(buff, var1171, 1, protoModule.wireTypes.lengthDelimited)
		var1172, var1173 = protoModule.writeString(var1172, var1173, self.user_id)
		buff = var1172
		var1171 = var1173
	end
	local buff_1 = buffer.create(var1171)
	buffer.copy(buff_1, 0, buff, 0, var1171)
	
	return buff_1
end

function t_23.decode(p44) --[[ line: 8897 ]]
	-- upvalues: t_23 (ref), protoModule (ref)
	local var1175 = t_23.new()
	local var1176 = 0
	while var1176 < buffer.len(p44) do
		local _ = nil
		local var1177 = nil
		local var1178, var1179, var1180 = protoModule.readTag(p44, var1176)
		local var1181 = var1178
		var1177 = var1179
		var1176 = var1180
		
		if var1177 == protoModule.wireTypes.varint then
			local _ = nil
			local var1182, var1183 = protoModule.readVarInt(p44, var1176)
			local _ = var1182
			var1176 = var1183
			continue
		end
		if var1177 == protoModule.wireTypes.lengthDelimited then
			if var1181 == 1 then
				local _ = nil
				local var1184, var1185 = protoModule.readBuffer(p44, var1176)
				var1176 = var1185
				var1175.user_id = buffer.tostring(var1184)
			else
				local _ = nil
				local var1186, var1187 = protoModule.readVarInt(p44, var1176)
				var1176 = var1187 + var1186
			end
		elseif var1177 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1188, var1189 = protoModule.readFixed32(p44, var1176)
			local _ = var1188
			var1176 = var1189
		elseif var1177 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1190, var1191 = protoModule.readFixed64(p44, var1176)
			local _ = var1190
			var1176 = var1191
		else
			error("Unsupported wire type: " .. var1177)
		end
	end
	return var1175
end

function t_23:jsonEncode() --[[ line: 8942 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_23:jsonDecode() --[[ line: 8954 ]]
	-- upvalues: t_23 (ref)
	local var1193 = t_23.new()
	
	if self.user_id ~= nil then
		var1193.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1193.user_id = self.userId
	end
	return var1193
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p45) --[[ line: 8985 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p45 == nil or p45.media_items == nil then {} else p45.media_items,
		universe_id = if p45 == nil or p45.universe_id == nil then "" else p45.universe_id,
		place_id = if p45 == nil or p45.place_id == nil then "" else p45.place_id
	}, t_24)
end

function t_24:encode() --[[ line: 8995 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1195 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var1196 = v:encode()
			local var1197, var1198 = protoModule.writeTag(buff, var1195, 1, protoModule.wireTypes.lengthDelimited)
			var1197, var1198 = protoModule.writeBuffer(var1197, var1198, var1196, buffer.len(var1196))
			buff = var1197
			var1195 = var1198
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1199, var1200 = protoModule.writeTag(buff, var1195, 2, protoModule.wireTypes.lengthDelimited)
		var1199, var1200 = protoModule.writeString(var1199, var1200, self.universe_id)
		buff = var1199
		var1195 = var1200
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1201, var1202 = protoModule.writeTag(buff, var1195, 3, protoModule.wireTypes.lengthDelimited)
		var1201, var1202 = protoModule.writeString(var1201, var1202, self.place_id)
		buff = var1201
		var1195 = var1202
	end
	local buff_1 = buffer.create(var1195)
	buffer.copy(buff_1, 0, buff, 0, var1195)
	
	return buff_1
end

function t_24.decode(p46) --[[ line: 9022 ]]
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var1204 = t_24.new()
	local var1205 = 0
	while var1205 < buffer.len(p46) do
		local _ = nil
		local var1206 = nil
		local var1207, var1208, var1209 = protoModule.readTag(p46, var1205)
		local var1210 = var1207
		var1206 = var1208
		var1205 = var1209
		
		if var1206 == protoModule.wireTypes.varint then
			local _ = nil
			local var1211, var1212 = protoModule.readVarInt(p46, var1205)
			local _ = var1211
			var1205 = var1212
			continue
		end
		if var1206 == protoModule.wireTypes.lengthDelimited then
			if var1210 == 1 then
				local _ = nil
				local var1213, var1214 = protoModule.readBuffer(p46, var1205)
				var1205 = var1214
				table.insert(var1204.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var1213))
			elseif var1210 == 2 then
				local _ = nil
				local var1215, var1216 = protoModule.readBuffer(p46, var1205)
				var1205 = var1216
				var1204.universe_id = buffer.tostring(var1215)
			elseif var1210 == 3 then
				local _ = nil
				local var1217, var1218 = protoModule.readBuffer(p46, var1205)
				var1205 = var1218
				var1204.place_id = buffer.tostring(var1217)
			else
				local _ = nil
				local var1219, var1220 = protoModule.readVarInt(p46, var1205)
				var1205 = var1220 + var1219
			end
		elseif var1206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1221, var1222 = protoModule.readFixed32(p46, var1205)
			local _ = var1221
			var1205 = var1222
		elseif var1206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1223, var1224 = protoModule.readFixed64(p46, var1205)
			local _ = var1223
			var1205 = var1224
		else
			error("Unsupported wire type: " .. var1206)
		end
	end
	return var1204
end

function t_24:jsonEncode() --[[ line: 9075 ]]
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

function t_24:jsonDecode() --[[ line: 9097 ]]
	-- upvalues: t_24 (ref), t (ref)
	local var1227 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1227.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1227.media_items = t_1
	end
	if self.universe_id ~= nil then
		var1227.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1227.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1227.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1227.place_id = self.placeId
	end
	return var1227
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p47) --[[ line: 9151 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p47 == nil or p47.media_asset_id == nil then "" else p47.media_asset_id
	}, t_25)
end

function t_25:encode() --[[ line: 9159 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1231 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1232, var1233 = protoModule.writeTag(buff, var1231, 1, protoModule.wireTypes.lengthDelimited)
		var1232, var1233 = protoModule.writeString(var1232, var1233, self.media_asset_id)
		buff = var1232
		var1231 = var1233
	end
	local buff_1 = buffer.create(var1231)
	buffer.copy(buff_1, 0, buff, 0, var1231)
	
	return buff_1
end

function t_25.decode(p48) --[[ line: 9175 ]]
	-- upvalues: t_25 (ref), protoModule (ref)
	local var1235 = t_25.new()
	local var1236 = 0
	while var1236 < buffer.len(p48) do
		local _ = nil
		local var1237 = nil
		local var1238, var1239, var1240 = protoModule.readTag(p48, var1236)
		local var1241 = var1238
		var1237 = var1239
		var1236 = var1240
		
		if var1237 == protoModule.wireTypes.varint then
			local _ = nil
			local var1242, var1243 = protoModule.readVarInt(p48, var1236)
			local _ = var1242
			var1236 = var1243
			continue
		end
		if var1237 == protoModule.wireTypes.lengthDelimited then
			if var1241 == 1 then
				local _ = nil
				local var1244, var1245 = protoModule.readBuffer(p48, var1236)
				var1236 = var1245
				var1235.media_asset_id = buffer.tostring(var1244)
			else
				local _ = nil
				local var1246, var1247 = protoModule.readVarInt(p48, var1236)
				var1236 = var1247 + var1246
			end
		elseif var1237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1248, var1249 = protoModule.readFixed32(p48, var1236)
			local _ = var1248
			var1236 = var1249
		elseif var1237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1250, var1251 = protoModule.readFixed64(p48, var1236)
			local _ = var1250
			var1236 = var1251
		else
			error("Unsupported wire type: " .. var1237)
		end
	end
	return var1235
end

function t_25:jsonEncode() --[[ line: 9220 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_25:jsonDecode() --[[ line: 9232 ]]
	-- upvalues: t_25 (ref)
	local var1253 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var1253.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1253.media_asset_id = self.mediaAssetId
	end
	return var1253
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p49) --[[ line: 9262 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		universe_id = if p49 == nil or p49.universe_id == nil then "" else p49.universe_id
	}, t_26)
end

function t_26:encode() --[[ line: 9270 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1255 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1256, var1257 = protoModule.writeTag(buff, var1255, 1, protoModule.wireTypes.lengthDelimited)
		var1256, var1257 = protoModule.writeString(var1256, var1257, self.universe_id)
		buff = var1256
		var1255 = var1257
	end
	local buff_1 = buffer.create(var1255)
	buffer.copy(buff_1, 0, buff, 0, var1255)
	
	return buff_1
end

function t_26.decode(p50) --[[ line: 9284 ]]
	-- upvalues: t_26 (ref), protoModule (ref)
	local var1259 = t_26.new()
	local var1260 = 0
	while var1260 < buffer.len(p50) do
		local _ = nil
		local var1261 = nil
		local var1262, var1263, var1264 = protoModule.readTag(p50, var1260)
		local var1265 = var1262
		var1261 = var1263
		var1260 = var1264
		
		if var1261 == protoModule.wireTypes.varint then
			local _ = nil
			local var1266, var1267 = protoModule.readVarInt(p50, var1260)
			local _ = var1266
			var1260 = var1267
			continue
		end
		if var1261 == protoModule.wireTypes.lengthDelimited then
			if var1265 == 1 then
				local _ = nil
				local var1268, var1269 = protoModule.readBuffer(p50, var1260)
				var1260 = var1269
				var1259.universe_id = buffer.tostring(var1268)
			else
				local _ = nil
				local var1270, var1271 = protoModule.readVarInt(p50, var1260)
				var1260 = var1271 + var1270
			end
		elseif var1261 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1272, var1273 = protoModule.readFixed32(p50, var1260)
			local _ = var1272
			var1260 = var1273
		elseif var1261 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1274, var1275 = protoModule.readFixed64(p50, var1260)
			local _ = var1274
			var1260 = var1275
		else
			error("Unsupported wire type: " .. var1261)
		end
	end
	return var1259
end

function t_26:jsonEncode() --[[ line: 9327 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_26:jsonDecode() --[[ line: 9337 ]]
	-- upvalues: t_26 (ref)
	local var1277 = t_26.new()
	
	if self.universe_id ~= nil then
		var1277.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1277.universe_id = self.universeId
	end
	return var1277
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p51) --[[ line: 9365 ]]
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p51 == nil or p51.universe_id == nil then "" else p51.universe_id
	}, t_27)
end

function t_27:encode() --[[ line: 9373 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1279 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1280, var1281 = protoModule.writeTag(buff, var1279, 1, protoModule.wireTypes.lengthDelimited)
		var1280, var1281 = protoModule.writeString(var1280, var1281, self.universe_id)
		buff = var1280
		var1279 = var1281
	end
	local buff_1 = buffer.create(var1279)
	buffer.copy(buff_1, 0, buff, 0, var1279)
	
	return buff_1
end

function t_27.decode(p52) --[[ line: 9387 ]]
	-- upvalues: t_27 (ref), protoModule (ref)
	local var1283 = t_27.new()
	local var1284 = 0
	while var1284 < buffer.len(p52) do
		local _ = nil
		local var1285 = nil
		local var1286, var1287, var1288 = protoModule.readTag(p52, var1284)
		local var1289 = var1286
		var1285 = var1287
		var1284 = var1288
		
		if var1285 == protoModule.wireTypes.varint then
			local _ = nil
			local var1290, var1291 = protoModule.readVarInt(p52, var1284)
			local _ = var1290
			var1284 = var1291
			continue
		end
		if var1285 == protoModule.wireTypes.lengthDelimited then
			if var1289 == 1 then
				local _ = nil
				local var1292, var1293 = protoModule.readBuffer(p52, var1284)
				var1284 = var1293
				var1283.universe_id = buffer.tostring(var1292)
			else
				local _ = nil
				local var1294, var1295 = protoModule.readVarInt(p52, var1284)
				var1284 = var1295 + var1294
			end
		elseif var1285 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1296, var1297 = protoModule.readFixed32(p52, var1284)
			local _ = var1296
			var1284 = var1297
		elseif var1285 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1298, var1299 = protoModule.readFixed64(p52, var1284)
			local _ = var1298
			var1284 = var1299
		else
			error("Unsupported wire type: " .. var1285)
		end
	end
	return var1283
end

function t_27:jsonEncode() --[[ line: 9430 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_27:jsonDecode() --[[ line: 9440 ]]
	-- upvalues: t_27 (ref)
	local var1301 = t_27.new()
	
	if self.universe_id ~= nil then
		var1301.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1301.universe_id = self.universeId
	end
	return var1301
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p53) --[[ line: 9468 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p53 == nil or p53.universe_id == nil then "" else p53.universe_id,
		has_store_items = if p53 == nil or p53.has_store_items == nil then false else p53.has_store_items,
		has_badges = if p53 == nil or p53.has_badges == nil then false else p53.has_badges,
		has_game_passes = if p53 == nil or p53.has_game_passes == nil then false else p53.has_game_passes
	}, t_28)
end

function t_28:encode() --[[ line: 9479 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1303 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1304, var1305 = protoModule.writeTag(buff, var1303, 1, protoModule.wireTypes.lengthDelimited)
		var1304, var1305 = protoModule.writeString(var1304, var1305, self.universe_id)
		buff = var1304
		var1303 = var1305
	end
	if self.has_store_items then
		local var1306, var1307 = protoModule.writeTag(buff, var1303, 2, protoModule.wireTypes.varint)
		var1306, var1307 = protoModule.writeVarInt(var1306, var1307, if self.has_store_items then 1 else 0)
		buff = var1306
		var1303 = var1307
	end
	if self.has_badges then
		local var1308, var1309 = protoModule.writeTag(buff, var1303, 3, protoModule.wireTypes.varint)
		var1308, var1309 = protoModule.writeVarInt(var1308, var1309, if self.has_badges then 1 else 0)
		buff = var1308
		var1303 = var1309
	end
	if self.has_game_passes then
		local var1310, var1311 = protoModule.writeTag(buff, var1303, 4, protoModule.wireTypes.varint)
		var1310, var1311 = protoModule.writeVarInt(var1310, var1311, if self.has_game_passes then 1 else 0)
		buff = var1310
		var1303 = var1311
	end
	local buff_1 = buffer.create(var1303)
	buffer.copy(buff_1, 0, buff, 0, var1303)
	
	return buff_1
end

function t_28.decode(p54) --[[ line: 9508 ]]
	-- upvalues: t_28 (ref), protoModule (ref)
	local var1313 = t_28.new()
	local var1314 = 0
	while var1314 < buffer.len(p54) do
		local _ = nil
		local var1315 = nil
		local var1316, var1317, var1318 = protoModule.readTag(p54, var1314)
		local var1319 = var1316
		var1315 = var1317
		var1314 = var1318
		
		if var1315 == protoModule.wireTypes.varint then
			if var1319 == 2 then
				local _ = nil
				local var1320, var1321 = protoModule.readVarInt(p54, var1314)
				var1314 = var1321
				var1313.has_store_items = var1320 ~= 0
			elseif var1319 == 3 then
				local _ = nil
				local var1322, var1323 = protoModule.readVarInt(p54, var1314)
				var1314 = var1323
				var1313.has_badges = var1322 ~= 0
			elseif var1319 == 4 then
				local _ = nil
				local var1324, var1325 = protoModule.readVarInt(p54, var1314)
				var1314 = var1325
				var1313.has_game_passes = var1324 ~= 0
			else
				local _ = nil
				local var1326, var1327 = protoModule.readVarInt(p54, var1314)
				local _ = var1326
				var1314 = var1327
			end
		end
		if var1315 == protoModule.wireTypes.lengthDelimited then
			if var1319 == 1 then
				local _ = nil
				local var1328, var1329 = protoModule.readBuffer(p54, var1314)
				var1314 = var1329
				var1313.universe_id = buffer.tostring(var1328)
			else
				local _ = nil
				local var1330, var1331 = protoModule.readVarInt(p54, var1314)
				var1314 = var1331 + var1330
			end
		elseif var1315 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1332, var1333 = protoModule.readFixed32(p54, var1314)
			local _ = var1332
			var1314 = var1333
		elseif var1315 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1334, var1335 = protoModule.readFixed64(p54, var1314)
			local _ = var1334
			var1314 = var1335
		else
			error("Unsupported wire type: " .. var1315)
		end
	end
	return var1313
end

function t_28:jsonEncode() --[[ line: 9566 ]]
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

function t_28:jsonDecode() --[[ line: 9588 ]]
	-- upvalues: t_28 (ref)
	local var1337 = t_28.new()
	
	if self.universe_id ~= nil then
		var1337.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1337.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var1337.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var1337.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var1337.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var1337.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var1337.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var1337.has_game_passes = self.hasGamePasses
	end
	return var1337
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p55) --[[ line: 9640 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p55 == nil or p55.universe_id == nil then "" else p55.universe_id
	}, t_29)
end

function t_29:encode() --[[ line: 9648 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1339 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1340, var1341 = protoModule.writeTag(buff, var1339, 1, protoModule.wireTypes.lengthDelimited)
		var1340, var1341 = protoModule.writeString(var1340, var1341, self.universe_id)
		buff = var1340
		var1339 = var1341
	end
	local buff_1 = buffer.create(var1339)
	buffer.copy(buff_1, 0, buff, 0, var1339)
	
	return buff_1
end

function t_29.decode(p56) --[[ line: 9662 ]]
	-- upvalues: t_29 (ref), protoModule (ref)
	local var1343 = t_29.new()
	local var1344 = 0
	while var1344 < buffer.len(p56) do
		local _ = nil
		local var1345 = nil
		local var1346, var1347, var1348 = protoModule.readTag(p56, var1344)
		local var1349 = var1346
		var1345 = var1347
		var1344 = var1348
		
		if var1345 == protoModule.wireTypes.varint then
			local _ = nil
			local var1350, var1351 = protoModule.readVarInt(p56, var1344)
			local _ = var1350
			var1344 = var1351
			continue
		end
		if var1345 == protoModule.wireTypes.lengthDelimited then
			if var1349 == 1 then
				local _ = nil
				local var1352, var1353 = protoModule.readBuffer(p56, var1344)
				var1344 = var1353
				var1343.universe_id = buffer.tostring(var1352)
			else
				local _ = nil
				local var1354, var1355 = protoModule.readVarInt(p56, var1344)
				var1344 = var1355 + var1354
			end
		elseif var1345 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1356, var1357 = protoModule.readFixed32(p56, var1344)
			local _ = var1356
			var1344 = var1357
		elseif var1345 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1358, var1359 = protoModule.readFixed64(p56, var1344)
			local _ = var1358
			var1344 = var1359
		else
			error("Unsupported wire type: " .. var1345)
		end
	end
	return var1343
end

function t_29:jsonEncode() --[[ line: 9705 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_29:jsonDecode() --[[ line: 9715 ]]
	-- upvalues: t_29 (ref)
	local var1361 = t_29.new()
	
	if self.universe_id ~= nil then
		var1361.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1361.universe_id = self.universeId
	end
	return var1361
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p57) --[[ line: 9745 ]]
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p57 == nil or p57.universe_id == nil then "" else p57.universe_id,
		user_owns_experience = if p57 == nil or p57.user_owns_experience == nil then false else p57.user_owns_experience
	}, t_30)
end

function t_30:encode() --[[ line: 9756 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1363 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1364, var1365 = protoModule.writeTag(buff, var1363, 1, protoModule.wireTypes.lengthDelimited)
		var1364, var1365 = protoModule.writeString(var1364, var1365, self.universe_id)
		buff = var1364
		var1363 = var1365
	end
	if self.user_owns_experience then
		local var1366, var1367 = protoModule.writeTag(buff, var1363, 2, protoModule.wireTypes.varint)
		var1366, var1367 = protoModule.writeVarInt(var1366, var1367, if self.user_owns_experience then 1 else 0)
		buff = var1366
		var1363 = var1367
	end
	local buff_1 = buffer.create(var1363)
	buffer.copy(buff_1, 0, buff, 0, var1363)
	
	return buff_1
end

function t_30.decode(p58) --[[ line: 9775 ]]
	-- upvalues: t_30 (ref), protoModule (ref)
	local var1369 = t_30.new()
	local var1370 = 0
	while var1370 < buffer.len(p58) do
		local _ = nil
		local var1371 = nil
		local var1372, var1373, var1374 = protoModule.readTag(p58, var1370)
		local var1375 = var1372
		var1371 = var1373
		var1370 = var1374
		
		if var1371 == protoModule.wireTypes.varint then
			if var1375 == 2 then
				local _ = nil
				local var1376, var1377 = protoModule.readVarInt(p58, var1370)
				var1370 = var1377
				var1369.user_owns_experience = var1376 ~= 0
			else
				local _ = nil
				local var1378, var1379 = protoModule.readVarInt(p58, var1370)
				local _ = var1378
				var1370 = var1379
			end
		end
		if var1371 == protoModule.wireTypes.lengthDelimited then
			if var1375 == 1 then
				local _ = nil
				local var1380, var1381 = protoModule.readBuffer(p58, var1370)
				var1370 = var1381
				var1369.universe_id = buffer.tostring(var1380)
			else
				local _ = nil
				local var1382, var1383 = protoModule.readVarInt(p58, var1370)
				var1370 = var1383 + var1382
			end
		elseif var1371 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1384, var1385 = protoModule.readFixed32(p58, var1370)
			local _ = var1384
			var1370 = var1385
		elseif var1371 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1386, var1387 = protoModule.readFixed64(p58, var1370)
			local _ = var1386
			var1370 = var1387
		else
			error("Unsupported wire type: " .. var1371)
		end
	end
	return var1369
end

function t_30:jsonEncode() --[[ line: 9823 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_30:jsonDecode() --[[ line: 9837 ]]
	-- upvalues: t_30 (ref)
	local var1389 = t_30.new()
	
	if self.universe_id ~= nil then
		var1389.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1389.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1389.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1389.user_owns_experience = self.userOwnsExperience
	end
	return var1389
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p59) --[[ line: 9873 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p59 == nil or p59.universe_id == nil then "" else p59.universe_id,
		place_id = if p59 == nil or p59.place_id == nil then "" else p59.place_id
	}, t_31)
end

function t_31:encode() --[[ line: 9882 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1391 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1392, var1393 = protoModule.writeTag(buff, var1391, 1, protoModule.wireTypes.lengthDelimited)
		var1392, var1393 = protoModule.writeString(var1392, var1393, self.universe_id)
		buff = var1392
		var1391 = var1393
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1394, var1395 = protoModule.writeTag(buff, var1391, 2, protoModule.wireTypes.lengthDelimited)
		var1394, var1395 = protoModule.writeString(var1394, var1395, self.place_id)
		buff = var1394
		var1391 = var1395
	end
	local buff_1 = buffer.create(var1391)
	buffer.copy(buff_1, 0, buff, 0, var1391)
	
	return buff_1
end

function t_31.decode(p60) --[[ line: 9901 ]]
	-- upvalues: t_31 (ref), protoModule (ref)
	local var1397 = t_31.new()
	local var1398 = 0
	while var1398 < buffer.len(p60) do
		local _ = nil
		local var1399 = nil
		local var1400, var1401, var1402 = protoModule.readTag(p60, var1398)
		local var1403 = var1400
		var1399 = var1401
		var1398 = var1402
		
		if var1399 == protoModule.wireTypes.varint then
			local _ = nil
			local var1404, var1405 = protoModule.readVarInt(p60, var1398)
			local _ = var1404
			var1398 = var1405
			continue
		end
		if var1399 == protoModule.wireTypes.lengthDelimited then
			if var1403 == 1 then
				local _ = nil
				local var1406, var1407 = protoModule.readBuffer(p60, var1398)
				var1398 = var1407
				var1397.universe_id = buffer.tostring(var1406)
			elseif var1403 == 2 then
				local _ = nil
				local var1408, var1409 = protoModule.readBuffer(p60, var1398)
				var1398 = var1409
				var1397.place_id = buffer.tostring(var1408)
			else
				local _ = nil
				local var1410, var1411 = protoModule.readVarInt(p60, var1398)
				var1398 = var1411 + var1410
			end
		elseif var1399 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1412, var1413 = protoModule.readFixed32(p60, var1398)
			local _ = var1412
			var1398 = var1413
		elseif var1399 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1414, var1415 = protoModule.readFixed64(p60, var1398)
			local _ = var1414
			var1398 = var1415
		else
			error("Unsupported wire type: " .. var1399)
		end
	end
	return var1397
end

function t_31:jsonEncode() --[[ line: 9949 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_31:jsonDecode() --[[ line: 9963 ]]
	-- upvalues: t_31 (ref)
	local var1417 = t_31.new()
	
	if self.universe_id ~= nil then
		var1417.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1417.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1417.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1417.place_id = self.placeId
	end
	return var1417
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p61) --[[ line: 10001 ]]
	-- upvalues: t_32 (ref)
	return setmetatable({
		community_id = if p61 == nil or p61.community_id == nil then "" else p61.community_id
	}, t_32)
end

function t_32:encode() --[[ line: 10009 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1419 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var1420, var1421 = protoModule.writeTag(buff, var1419, 1, protoModule.wireTypes.lengthDelimited)
		var1420, var1421 = protoModule.writeString(var1420, var1421, self.community_id)
		buff = var1420
		var1419 = var1421
	end
	local buff_1 = buffer.create(var1419)
	buffer.copy(buff_1, 0, buff, 0, var1419)
	
	return buff_1
end

function t_32.decode(p62) --[[ line: 10023 ]]
	-- upvalues: t_32 (ref), protoModule (ref)
	local var1423 = t_32.new()
	local var1424 = 0
	while var1424 < buffer.len(p62) do
		local _ = nil
		local var1425 = nil
		local var1426, var1427, var1428 = protoModule.readTag(p62, var1424)
		local var1429 = var1426
		var1425 = var1427
		var1424 = var1428
		
		if var1425 == protoModule.wireTypes.varint then
			local _ = nil
			local var1430, var1431 = protoModule.readVarInt(p62, var1424)
			local _ = var1430
			var1424 = var1431
			continue
		end
		if var1425 == protoModule.wireTypes.lengthDelimited then
			if var1429 == 1 then
				local _ = nil
				local var1432, var1433 = protoModule.readBuffer(p62, var1424)
				var1424 = var1433
				var1423.community_id = buffer.tostring(var1432)
			else
				local _ = nil
				local var1434, var1435 = protoModule.readVarInt(p62, var1424)
				var1424 = var1435 + var1434
			end
		elseif var1425 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1436, var1437 = protoModule.readFixed32(p62, var1424)
			local _ = var1436
			var1424 = var1437
		elseif var1425 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1438, var1439 = protoModule.readFixed64(p62, var1424)
			local _ = var1438
			var1424 = var1439
		else
			error("Unsupported wire type: " .. var1425)
		end
	end
	return var1423
end

function t_32:jsonEncode() --[[ line: 10066 ]]
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_32:jsonDecode() --[[ line: 10076 ]]
	-- upvalues: t_32 (ref)
	local var1441 = t_32.new()
	
	if self.community_id ~= nil then
		var1441.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var1441.community_id = self.communityId
	end
	return var1441
end

t_32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_32
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p63) --[[ line: 10104 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_items = if p63 == nil or p63.social_link_items == nil then {} else p63.social_link_items
	}, t_33)
end

function t_33:encode() --[[ line: 10110 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1443 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var1444 = v:encode()
			local var1445, var1446 = protoModule.writeTag(buff, var1443, 1, protoModule.wireTypes.lengthDelimited)
			var1445, var1446 = protoModule.writeBuffer(var1445, var1446, var1444, buffer.len(var1444))
			buff = var1445
			var1443 = var1446
		end
	end
	local buff_1 = buffer.create(var1443)
	buffer.copy(buff_1, 0, buff, 0, var1443)
	
	return buff_1
end

function t_33.decode(p64) --[[ line: 10127 ]]
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1448 = t_33.new()
	local var1449 = 0
	while var1449 < buffer.len(p64) do
		local _ = nil
		local var1450 = nil
		local var1451, var1452, var1453 = protoModule.readTag(p64, var1449)
		local var1454 = var1451
		var1450 = var1452
		var1449 = var1453
		
		if var1450 == protoModule.wireTypes.varint then
			local _ = nil
			local var1455, var1456 = protoModule.readVarInt(p64, var1449)
			local _ = var1455
			var1449 = var1456
			continue
		end
		if var1450 == protoModule.wireTypes.lengthDelimited then
			if var1454 == 1 then
				local _ = nil
				local var1457, var1458 = protoModule.readBuffer(p64, var1449)
				var1449 = var1458
				table.insert(var1448.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var1457))
			else
				local _ = nil
				local var1459, var1460 = protoModule.readVarInt(p64, var1449)
				var1449 = var1460 + var1459
			end
		elseif var1450 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1461, var1462 = protoModule.readFixed32(p64, var1449)
			local _ = var1461
			var1449 = var1462
		elseif var1450 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1463, var1464 = protoModule.readFixed64(p64, var1449)
			local _ = var1463
			var1449 = var1464
		else
			error("Unsupported wire type: " .. var1450)
		end
	end
	return var1448
end

function t_33:jsonEncode() --[[ line: 10170 ]]
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

function t_33:jsonDecode() --[[ line: 10184 ]]
	-- upvalues: t_33 (ref), t (ref)
	local var1467 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1467.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1467.social_link_items = t_1
	end
	return var1467
end

t_33.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p65) --[[ line: 10222 ]]
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_id = if p65 == nil or p65.social_link_id == nil then "" else p65.social_link_id
	}, t_34)
end

function t_34:encode() --[[ line: 10230 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1471 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var1472, var1473 = protoModule.writeTag(buff, var1471, 1, protoModule.wireTypes.lengthDelimited)
		var1472, var1473 = protoModule.writeString(var1472, var1473, self.social_link_id)
		buff = var1472
		var1471 = var1473
	end
	local buff_1 = buffer.create(var1471)
	buffer.copy(buff_1, 0, buff, 0, var1471)
	
	return buff_1
end

function t_34.decode(p66) --[[ line: 10244 ]]
	-- upvalues: t_34 (ref), protoModule (ref)
	local var1475 = t_34.new()
	local var1476 = 0
	while var1476 < buffer.len(p66) do
		local _ = nil
		local var1477 = nil
		local var1478, var1479, var1480 = protoModule.readTag(p66, var1476)
		local var1481 = var1478
		var1477 = var1479
		var1476 = var1480
		
		if var1477 == protoModule.wireTypes.varint then
			local _ = nil
			local var1482, var1483 = protoModule.readVarInt(p66, var1476)
			local _ = var1482
			var1476 = var1483
			continue
		end
		if var1477 == protoModule.wireTypes.lengthDelimited then
			if var1481 == 1 then
				local _ = nil
				local var1484, var1485 = protoModule.readBuffer(p66, var1476)
				var1476 = var1485
				var1475.social_link_id = buffer.tostring(var1484)
			else
				local _ = nil
				local var1486, var1487 = protoModule.readVarInt(p66, var1476)
				var1476 = var1487 + var1486
			end
		elseif var1477 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1488, var1489 = protoModule.readFixed32(p66, var1476)
			local _ = var1488
			var1476 = var1489
		elseif var1477 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1490, var1491 = protoModule.readFixed64(p66, var1476)
			local _ = var1490
			var1476 = var1491
		else
			error("Unsupported wire type: " .. var1477)
		end
	end
	return var1475
end

function t_34:jsonEncode() --[[ line: 10287 ]]
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_34:jsonDecode() --[[ line: 10297 ]]
	-- upvalues: t_34 (ref)
	local var1493 = t_34.new()
	
	if self.social_link_id ~= nil then
		var1493.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1493.social_link_id = self.socialLinkId
	end
	return var1493
end

t_34.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p67) --[[ line: 10327 ]]
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

function t_35:encode() --[[ line: 10353 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1495 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1496, var1497 = protoModule.writeTag(buff, var1495, 1, protoModule.wireTypes.lengthDelimited)
		var1496, var1497 = protoModule.writeString(var1496, var1497, self.title)
		buff = var1496
		var1495 = var1497
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var1498 = v:encode()
			local var1499, var1500 = protoModule.writeTag(buff, var1495, 2, protoModule.wireTypes.lengthDelimited)
			var1499, var1500 = protoModule.writeBuffer(var1499, var1500, var1498, buffer.len(var1498))
			buff = var1499
			var1495 = var1500
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1501, var1502 = protoModule.writeTag(buff, var1495, 3, protoModule.wireTypes.lengthDelimited)
		var1501, var1502 = protoModule.writeString(var1501, var1502, self.next_page_token)
		buff = var1501
		var1495 = var1502
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1503, var1504 = protoModule.writeTag(buff, var1495, 4, protoModule.wireTypes.lengthDelimited)
		var1503, var1504 = protoModule.writeString(var1503, var1504, self.sort_id)
		buff = var1503
		var1495 = var1504
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1505, var1506 = protoModule.writeTag(buff, var1495, 5, protoModule.wireTypes.varint)
		var1505, var1506 = protoModule.writeVarInt(var1505, var1506, self.secondary_sort_id)
		buff = var1505
		var1495 = var1506
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var1507, var1508 = protoModule.writeTag(buff, var1495, 6, protoModule.wireTypes.varint)
		var1507, var1508 = protoModule.writeVarInt(var1507, var1508, self.max_visible_rows)
		buff = var1507
		var1495 = var1508
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1509, var1510 = protoModule.writeTag(buff, var1495, 7, protoModule.wireTypes.lengthDelimited)
		var1509, var1510 = protoModule.writeString(var1509, var1510, self.subtitle)
		buff = var1509
		var1495 = var1510
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1511, var1512 = protoModule.writeTag(buff, var1495, 8, protoModule.wireTypes.lengthDelimited)
		var1511, var1512 = protoModule.writeString(var1511, var1512, self.info_text)
		buff = var1511
		var1495 = var1512
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1513, var1514 = protoModule.writeTag(buff, var1495, 9, protoModule.wireTypes.lengthDelimited)
		var1513, var1514 = protoModule.writeString(var1513, var1514, self.subtitle_link_path)
		buff = var1513
		var1495 = var1514
	end
	if self.is_placeholder ~= nil then
		local var1515, var1516 = protoModule.writeTag(buff, var1495, 10, protoModule.wireTypes.varint)
		var1515, var1516 = protoModule.writeVarInt(var1515, var1516, if self.is_placeholder then 1 else 0)
		buff = var1515
		var1495 = var1516
	end
	if self.primary_sort_id ~= nil then
		local var1517, var1518 = protoModule.writeTag(buff, var1495, 11, protoModule.wireTypes.varint)
		var1517, var1518 = protoModule.writeVarInt(var1517, var1518, self.primary_sort_id)
		buff = var1517
		var1495 = var1518
	end
	if self.applied_filters ~= nil then
		local var1519, var1520 = protoModule.writeTag(buff, var1495, 12, protoModule.wireTypes.lengthDelimited)
		var1519, var1520 = protoModule.writeString(var1519, var1520, self.applied_filters)
		buff = var1519
		var1495 = var1520
	end
	if self.pool_id ~= nil then
		local var1521, var1522 = protoModule.writeTag(buff, var1495, 13, protoModule.wireTypes.lengthDelimited)
		var1521, var1522 = protoModule.writeString(var1521, var1522, self.pool_id)
		buff = var1521
		var1495 = var1522
	end
	if self.has_emphasized_tile then
		local var1523, var1524 = protoModule.writeTag(buff, var1495, 14, protoModule.wireTypes.varint)
		var1523, var1524 = protoModule.writeVarInt(var1523, var1524, if self.has_emphasized_tile then 1 else 0)
		buff = var1523
		var1495 = var1524
	end
	if self.tile_activation_mode ~= nil and self.tile_activation_mode ~= "" then
		local var1525, var1526 = protoModule.writeTag(buff, var1495, 15, protoModule.wireTypes.lengthDelimited)
		var1525, var1526 = protoModule.writeString(var1525, var1526, self.tile_activation_mode)
		buff = var1525
		var1495 = var1526
	end
	local buff_1 = buffer.create(var1495)
	buffer.copy(buff_1, 0, buff, 0, var1495)
	
	return buff_1
end

function t_35.decode(p68) --[[ line: 10440 ]]
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var1528 = t_35.new()
	local var1529 = 0
	while var1529 < buffer.len(p68) do
		local _ = nil
		local var1530 = nil
		local var1531, var1532, var1533 = protoModule.readTag(p68, var1529)
		local var1534 = var1531
		var1530 = var1532
		var1529 = var1533
		
		if var1530 == protoModule.wireTypes.varint then
			if var1534 == 5 then
				local _ = nil
				local var1535, var1536 = protoModule.readVarIntI32(p68, var1529)
				var1529 = var1536
				var1528.secondary_sort_id = var1535
			elseif var1534 == 6 then
				local _ = nil
				local var1537, var1538 = protoModule.readVarIntI32(p68, var1529)
				var1529 = var1538
				var1528.max_visible_rows = var1537
			elseif var1534 == 10 then
				local _ = nil
				local var1539, var1540 = protoModule.readVarInt(p68, var1529)
				var1529 = var1540
				var1528.is_placeholder = var1539 ~= 0
			elseif var1534 == 11 then
				local _ = nil
				local var1541, var1542 = protoModule.readVarIntI32(p68, var1529)
				var1529 = var1542
				var1528.primary_sort_id = var1541
			elseif var1534 == 14 then
				local _ = nil
				local var1543, var1544 = protoModule.readVarInt(p68, var1529)
				var1529 = var1544
				var1528.has_emphasized_tile = var1543 ~= 0
			else
				local _ = nil
				local var1545, var1546 = protoModule.readVarInt(p68, var1529)
				local _ = var1545
				var1529 = var1546
			end
		end
		if var1530 == protoModule.wireTypes.lengthDelimited then
			if var1534 == 1 then
				local _ = nil
				local var1547, var1548 = protoModule.readBuffer(p68, var1529)
				var1529 = var1548
				var1528.title = buffer.tostring(var1547)
			elseif var1534 == 2 then
				local _ = nil
				local var1549, var1550 = protoModule.readBuffer(p68, var1529)
				var1529 = var1550
				table.insert(var1528.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var1549))
			elseif var1534 == 3 then
				local _ = nil
				local var1551, var1552 = protoModule.readBuffer(p68, var1529)
				var1529 = var1552
				var1528.next_page_token = buffer.tostring(var1551)
			elseif var1534 == 4 then
				local _ = nil
				local var1553, var1554 = protoModule.readBuffer(p68, var1529)
				var1529 = var1554
				var1528.sort_id = buffer.tostring(var1553)
			elseif var1534 == 7 then
				local _ = nil
				local var1555, var1556 = protoModule.readBuffer(p68, var1529)
				var1529 = var1556
				var1528.subtitle = buffer.tostring(var1555)
			elseif var1534 == 8 then
				local _ = nil
				local var1557, var1558 = protoModule.readBuffer(p68, var1529)
				var1529 = var1558
				var1528.info_text = buffer.tostring(var1557)
			elseif var1534 == 9 then
				local _ = nil
				local var1559, var1560 = protoModule.readBuffer(p68, var1529)
				var1529 = var1560
				var1528.subtitle_link_path = buffer.tostring(var1559)
			elseif var1534 == 12 then
				local _ = nil
				local var1561, var1562 = protoModule.readBuffer(p68, var1529)
				var1529 = var1562
				var1528.applied_filters = buffer.tostring(var1561)
			elseif var1534 == 13 then
				local _ = nil
				local var1563, var1564 = protoModule.readBuffer(p68, var1529)
				var1529 = var1564
				var1528.pool_id = buffer.tostring(var1563)
			elseif var1534 == 15 then
				local _ = nil
				local var1565, var1566 = protoModule.readBuffer(p68, var1529)
				var1529 = var1566
				var1528.tile_activation_mode = buffer.tostring(var1565)
			else
				local _ = nil
				local var1567, var1568 = protoModule.readVarInt(p68, var1529)
				var1529 = var1568 + var1567
			end
		elseif var1530 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1569, var1570 = protoModule.readFixed32(p68, var1529)
			local _ = var1569
			var1529 = var1570
		elseif var1530 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1571, var1572 = protoModule.readFixed64(p68, var1529)
			local _ = var1571
			var1529 = var1572
		else
			error("Unsupported wire type: " .. var1530)
		end
	end
	return var1528
end

function t_35:jsonEncode() --[[ line: 10553 ]]
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

function t_35:jsonDecode() --[[ line: 10623 ]]
	-- upvalues: t_35 (ref), t (ref)
	local var1575 = t_35.new()
	
	if self.title ~= nil then
		var1575.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1575.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1575.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1575.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1575.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1575.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1575.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1575.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1575.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1575.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1575.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1575.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1575.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1575.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1575.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1575.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1575.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1575.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1575.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1575.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1575.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1575.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1575.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1575.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1575.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1575.has_emphasized_tile = self.hasEmphasizedTile
	end
	if self.tile_activation_mode ~= nil then
		var1575.tile_activation_mode = self.tile_activation_mode
	end
	if self.tileActivationMode ~= nil then
		var1575.tile_activation_mode = self.tileActivationMode
	end
	return var1575
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p69) --[[ line: 10765 ]]
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

function t_36:encode() --[[ line: 10785 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1579 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1580, var1581 = protoModule.writeTag(buff, var1579, 1, protoModule.wireTypes.lengthDelimited)
		var1580, var1581 = protoModule.writeString(var1580, var1581, self.universe_id)
		buff = var1580
		var1579 = var1581
	end
	if self.is_sponsored then
		local var1582, var1583 = protoModule.writeTag(buff, var1579, 2, protoModule.wireTypes.varint)
		var1582, var1583 = protoModule.writeVarInt(var1582, var1583, if self.is_sponsored then 1 else 0)
		buff = var1582
		var1579 = var1583
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1584, var1585 = protoModule.writeTag(buff, var1579, 3, protoModule.wireTypes.lengthDelimited)
		var1584, var1585 = protoModule.writeString(var1584, var1585, self.roblox_component)
		buff = var1584
		var1579 = var1585
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1586, var1587 = protoModule.writeTag(buff, var1579, 4, protoModule.wireTypes.lengthDelimited)
		var1586, var1587 = protoModule.writeString(var1586, var1587, self.native_ad_data)
		buff = var1586
		var1579 = var1587
	end
	if self.is_content_locked then
		local var1588, var1589 = protoModule.writeTag(buff, var1579, 5, protoModule.wireTypes.varint)
		var1588, var1589 = protoModule.writeVarInt(var1588, var1589, if self.is_content_locked then 1 else 0)
		buff = var1588
		var1579 = var1589
	end
	if self.title ~= nil and self.title ~= "" then
		local var1590, var1591 = protoModule.writeTag(buff, var1579, 6, protoModule.wireTypes.lengthDelimited)
		var1590, var1591 = protoModule.writeString(var1590, var1591, self.title)
		buff = var1590
		var1579 = var1591
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1592, var1593 = protoModule.writeTag(buff, var1579, 7, protoModule.wireTypes.lengthDelimited)
		var1592, var1593 = protoModule.writeString(var1592, var1593, self.subtitle)
		buff = var1592
		var1579 = var1593
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1594, var1595 = protoModule.writeTag(buff, var1579, 8, protoModule.wireTypes.lengthDelimited)
		var1594, var1595 = protoModule.writeString(var1594, var1595, self.image_asset_id)
		buff = var1594
		var1579 = var1595
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1596, var1597 = protoModule.writeTag(buff, var1579, 9, protoModule.wireTypes.lengthDelimited)
		var1596, var1597 = protoModule.writeString(var1596, var1597, self.video_asset_id)
		buff = var1596
		var1579 = var1597
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1598, var1599 = protoModule.writeTag(buff, var1579, 10, protoModule.wireTypes.lengthDelimited)
		var1598, var1599 = protoModule.writeString(var1598, var1599, self.badge_text)
		buff = var1598
		var1579 = var1599
	end
	if self.player_count ~= nil then
		local var1600, var1601 = protoModule.writeTag(buff, var1579, 11, protoModule.wireTypes.varint)
		var1600, var1601 = protoModule.writeVarInt(var1600, var1601, self.player_count)
		buff = var1600
		var1579 = var1601
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1602, var1603 = protoModule.writeTag(buff, var1579, 12, protoModule.wireTypes.lengthDelimited)
		var1602, var1603 = protoModule.writeString(var1602, var1603, self.creator_key)
		buff = var1602
		var1579 = var1603
	end
	if self.rank ~= nil then
		local var1604, var1605 = protoModule.writeTag(buff, var1579, 13, protoModule.wireTypes.varint)
		var1604, var1605 = protoModule.writeVarInt(var1604, var1605, self.rank)
		buff = var1604
		var1579 = var1605
	end
	local buff_1 = buffer.create(var1579)
	buffer.copy(buff_1, 0, buff, 0, var1579)
	
	return buff_1
end

function t_36.decode(p70) --[[ line: 10861 ]]
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1607 = t_36.new()
	local var1608 = 0
	while var1608 < buffer.len(p70) do
		local _ = nil
		local var1609 = nil
		local var1610, var1611, var1612 = protoModule.readTag(p70, var1608)
		local var1613 = var1610
		var1609 = var1611
		var1608 = var1612
		
		if var1609 == protoModule.wireTypes.varint then
			if var1613 == 2 then
				local _ = nil
				local var1614, var1615 = protoModule.readVarInt(p70, var1608)
				var1608 = var1615
				var1607.is_sponsored = var1614 ~= 0
			elseif var1613 == 5 then
				local _ = nil
				local var1616, var1617 = protoModule.readVarInt(p70, var1608)
				var1608 = var1617
				var1607.is_content_locked = var1616 ~= 0
			elseif var1613 == 11 then
				local _ = nil
				local var1618, var1619 = protoModule.readVarIntI64(p70, var1608)
				var1608 = var1619
				var1607.player_count = var1618
			elseif var1613 == 13 then
				local _ = nil
				local var1620, var1621 = protoModule.readVarIntI32(p70, var1608)
				var1608 = var1621
				var1607.rank = var1620
			else
				local _ = nil
				local var1622, var1623 = protoModule.readVarInt(p70, var1608)
				local _ = var1622
				var1608 = var1623
			end
		end
		if var1609 == protoModule.wireTypes.lengthDelimited then
			if var1613 == 1 then
				local _ = nil
				local var1624, var1625 = protoModule.readBuffer(p70, var1608)
				var1608 = var1625
				var1607.universe_id = buffer.tostring(var1624)
			elseif var1613 == 3 then
				local _ = nil
				local var1626, var1627 = protoModule.readBuffer(p70, var1608)
				var1608 = var1627
				var1607.roblox_component = buffer.tostring(var1626)
			elseif var1613 == 4 then
				local _ = nil
				local var1628, var1629 = protoModule.readBuffer(p70, var1608)
				var1608 = var1629
				var1607.native_ad_data = buffer.tostring(var1628)
			elseif var1613 == 6 then
				local _ = nil
				local var1630, var1631 = protoModule.readBuffer(p70, var1608)
				var1608 = var1631
				var1607.title = buffer.tostring(var1630)
			elseif var1613 == 7 then
				local _ = nil
				local var1632, var1633 = protoModule.readBuffer(p70, var1608)
				var1608 = var1633
				var1607.subtitle = buffer.tostring(var1632)
			elseif var1613 == 8 then
				local _ = nil
				local var1634, var1635 = protoModule.readBuffer(p70, var1608)
				var1608 = var1635
				var1607.image_asset_id = buffer.tostring(var1634)
			elseif var1613 == 9 then
				local _ = nil
				local var1636, var1637 = protoModule.readBuffer(p70, var1608)
				var1608 = var1637
				var1607.video_asset_id = buffer.tostring(var1636)
			elseif var1613 == 10 then
				local _ = nil
				local var1638, var1639 = protoModule.readBuffer(p70, var1608)
				var1608 = var1639
				var1607.badge_text = buffer.tostring(var1638)
			elseif var1613 == 12 then
				local _ = nil
				local var1640, var1641 = protoModule.readBuffer(p70, var1608)
				var1608 = var1641
				var1607.creator_key = buffer.tostring(var1640)
			else
				local _ = nil
				local var1642, var1643 = protoModule.readVarInt(p70, var1608)
				var1608 = var1643 + var1642
			end
		elseif var1609 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1644, var1645 = protoModule.readFixed32(p70, var1608)
			local _ = var1644
			var1608 = var1645
		elseif var1609 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1646, var1647 = protoModule.readFixed64(p70, var1608)
			local _ = var1646
			var1608 = var1647
		else
			error("Unsupported wire type: " .. var1609)
		end
	end
	return var1607
end

function t_36:jsonEncode() --[[ line: 10966 ]]
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

function t_36:jsonDecode() --[[ line: 11026 ]]
	-- upvalues: t_36 (ref)
	local var1649 = t_36.new()
	
	if self.universe_id ~= nil then
		var1649.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1649.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1649.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1649.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1649.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1649.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1649.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1649.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1649.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1649.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1649.title = self.title
	end
	if self.subtitle ~= nil then
		var1649.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1649.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1649.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1649.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1649.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1649.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1649.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1649.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1649.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1649.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1649.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1649.rank = self.rank
	end
	return var1649
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p71) --[[ line: 11140 ]]
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

function t_37:encode() --[[ line: 11156 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1651 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1652, var1653 = protoModule.writeTag(buff, var1651, 1, protoModule.wireTypes.lengthDelimited)
		var1652, var1653 = protoModule.writeString(var1652, var1653, self.title)
		buff = var1652
		var1651 = var1653
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1654 = v:encode()
			local var1655, var1656 = protoModule.writeTag(buff, var1651, 2, protoModule.wireTypes.lengthDelimited)
			var1655, var1656 = protoModule.writeBuffer(var1655, var1656, var1654, buffer.len(var1654))
			buff = var1655
			var1651 = var1656
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1657, var1658 = protoModule.writeTag(buff, var1651, 3, protoModule.wireTypes.lengthDelimited)
		var1657, var1658 = protoModule.writeString(var1657, var1658, self.next_page_token)
		buff = var1657
		var1651 = var1658
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1659, var1660 = protoModule.writeTag(buff, var1651, 4, protoModule.wireTypes.lengthDelimited)
		var1659, var1660 = protoModule.writeString(var1659, var1660, self.sort_id)
		buff = var1659
		var1651 = var1660
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1661, var1662 = protoModule.writeTag(buff, var1651, 5, protoModule.wireTypes.varint)
		var1661, var1662 = protoModule.writeVarInt(var1661, var1662, self.secondary_sort_id)
		buff = var1661
		var1651 = var1662
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1663, var1664 = protoModule.writeTag(buff, var1651, 6, protoModule.wireTypes.lengthDelimited)
		var1663, var1664 = protoModule.writeString(var1663, var1664, self.subtitle)
		buff = var1663
		var1651 = var1664
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1665, var1666 = protoModule.writeTag(buff, var1651, 7, protoModule.wireTypes.lengthDelimited)
		var1665, var1666 = protoModule.writeString(var1665, var1666, self.info_text)
		buff = var1665
		var1651 = var1666
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1667, var1668 = protoModule.writeTag(buff, var1651, 8, protoModule.wireTypes.lengthDelimited)
		var1667, var1668 = protoModule.writeString(var1667, var1668, self.subtitle_link_path)
		buff = var1667
		var1651 = var1668
	end
	if self.is_placeholder ~= nil then
		local var1669, var1670 = protoModule.writeTag(buff, var1651, 9, protoModule.wireTypes.varint)
		var1669, var1670 = protoModule.writeVarInt(var1669, var1670, if self.is_placeholder then 1 else 0)
		buff = var1669
		var1651 = var1670
	end
	if self.primary_sort_id ~= nil then
		local var1671, var1672 = protoModule.writeTag(buff, var1651, 10, protoModule.wireTypes.varint)
		var1671, var1672 = protoModule.writeVarInt(var1671, var1672, self.primary_sort_id)
		buff = var1671
		var1651 = var1672
	end
	if self.applied_filters ~= nil then
		local var1673, var1674 = protoModule.writeTag(buff, var1651, 11, protoModule.wireTypes.lengthDelimited)
		var1673, var1674 = protoModule.writeString(var1673, var1674, self.applied_filters)
		buff = var1673
		var1651 = var1674
	end
	local buff_1 = buffer.create(var1651)
	buffer.copy(buff_1, 0, buff, 0, var1651)
	
	return buff_1
end

function t_37.decode(p72) --[[ line: 11223 ]]
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1676 = t_37.new()
	local var1677 = 0
	while var1677 < buffer.len(p72) do
		local _ = nil
		local var1678 = nil
		local var1679, var1680, var1681 = protoModule.readTag(p72, var1677)
		local var1682 = var1679
		var1678 = var1680
		var1677 = var1681
		
		if var1678 == protoModule.wireTypes.varint then
			if var1682 == 5 then
				local _ = nil
				local var1683, var1684 = protoModule.readVarIntI32(p72, var1677)
				var1677 = var1684
				var1676.secondary_sort_id = var1683
			elseif var1682 == 9 then
				local _ = nil
				local var1685, var1686 = protoModule.readVarInt(p72, var1677)
				var1677 = var1686
				var1676.is_placeholder = var1685 ~= 0
			elseif var1682 == 10 then
				local _ = nil
				local var1687, var1688 = protoModule.readVarIntI32(p72, var1677)
				var1677 = var1688
				var1676.primary_sort_id = var1687
			else
				local _ = nil
				local var1689, var1690 = protoModule.readVarInt(p72, var1677)
				local _ = var1689
				var1677 = var1690
			end
		end
		if var1678 == protoModule.wireTypes.lengthDelimited then
			if var1682 == 1 then
				local _ = nil
				local var1691, var1692 = protoModule.readBuffer(p72, var1677)
				var1677 = var1692
				var1676.title = buffer.tostring(var1691)
			elseif var1682 == 2 then
				local _ = nil
				local var1693, var1694 = protoModule.readBuffer(p72, var1677)
				var1677 = var1694
				table.insert(var1676.song_items, t.SongCarouselInputData_SongItem.decode(var1693))
			elseif var1682 == 3 then
				local _ = nil
				local var1695, var1696 = protoModule.readBuffer(p72, var1677)
				var1677 = var1696
				var1676.next_page_token = buffer.tostring(var1695)
			elseif var1682 == 4 then
				local _ = nil
				local var1697, var1698 = protoModule.readBuffer(p72, var1677)
				var1677 = var1698
				var1676.sort_id = buffer.tostring(var1697)
			elseif var1682 == 6 then
				local _ = nil
				local var1699, var1700 = protoModule.readBuffer(p72, var1677)
				var1677 = var1700
				var1676.subtitle = buffer.tostring(var1699)
			elseif var1682 == 7 then
				local _ = nil
				local var1701, var1702 = protoModule.readBuffer(p72, var1677)
				var1677 = var1702
				var1676.info_text = buffer.tostring(var1701)
			elseif var1682 == 8 then
				local _ = nil
				local var1703, var1704 = protoModule.readBuffer(p72, var1677)
				var1677 = var1704
				var1676.subtitle_link_path = buffer.tostring(var1703)
			elseif var1682 == 11 then
				local _ = nil
				local var1705, var1706 = protoModule.readBuffer(p72, var1677)
				var1677 = var1706
				var1676.applied_filters = buffer.tostring(var1705)
			else
				local _ = nil
				local var1707, var1708 = protoModule.readVarInt(p72, var1677)
				var1677 = var1708 + var1707
			end
		elseif var1678 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1709, var1710 = protoModule.readFixed32(p72, var1677)
			local _ = var1709
			var1677 = var1710
		elseif var1678 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1711, var1712 = protoModule.readFixed64(p72, var1677)
			local _ = var1711
			var1677 = var1712
		else
			error("Unsupported wire type: " .. var1678)
		end
	end
	return var1676
end

function t_37:jsonEncode() --[[ line: 11316 ]]
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

function t_37:jsonDecode() --[[ line: 11370 ]]
	-- upvalues: t_37 (ref), t (ref)
	local var1715 = t_37.new()
	
	if self.title ~= nil then
		var1715.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1715.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1715.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1715.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1715.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1715.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1715.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1715.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1715.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1715.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1715.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1715.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1715.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1715.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1715.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1715.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1715.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1715.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1715.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1715.applied_filters = self.appliedFilters
	end
	return var1715
end

t_37.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_37
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p73) --[[ line: 11480 ]]
	-- upvalues: t_38 (ref)
	return setmetatable({
		song_id = if p73 == nil or p73.song_id == nil then "" else p73.song_id
	}, t_38)
end

function t_38:encode() --[[ line: 11488 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1719 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1720, var1721 = protoModule.writeTag(buff, var1719, 1, protoModule.wireTypes.lengthDelimited)
		var1720, var1721 = protoModule.writeString(var1720, var1721, self.song_id)
		buff = var1720
		var1719 = var1721
	end
	local buff_1 = buffer.create(var1719)
	buffer.copy(buff_1, 0, buff, 0, var1719)
	
	return buff_1
end

function t_38.decode(p74) --[[ line: 11502 ]]
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1723 = t_38.new()
	local var1724 = 0
	while var1724 < buffer.len(p74) do
		local _ = nil
		local var1725 = nil
		local var1726, var1727, var1728 = protoModule.readTag(p74, var1724)
		local var1729 = var1726
		var1725 = var1727
		var1724 = var1728
		
		if var1725 == protoModule.wireTypes.varint then
			local _ = nil
			local var1730, var1731 = protoModule.readVarInt(p74, var1724)
			local _ = var1730
			var1724 = var1731
			continue
		end
		if var1725 == protoModule.wireTypes.lengthDelimited then
			if var1729 == 1 then
				local _ = nil
				local var1732, var1733 = protoModule.readBuffer(p74, var1724)
				var1724 = var1733
				var1723.song_id = buffer.tostring(var1732)
			else
				local _ = nil
				local var1734, var1735 = protoModule.readVarInt(p74, var1724)
				var1724 = var1735 + var1734
			end
		elseif var1725 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1736, var1737 = protoModule.readFixed32(p74, var1724)
			local _ = var1736
			var1724 = var1737
		elseif var1725 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1738, var1739 = protoModule.readFixed64(p74, var1724)
			local _ = var1738
			var1724 = var1739
		else
			error("Unsupported wire type: " .. var1725)
		end
	end
	return var1723
end

function t_38:jsonEncode() --[[ line: 11545 ]]
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_38:jsonDecode() --[[ line: 11555 ]]
	-- upvalues: t_38 (ref)
	local var1741 = t_38.new()
	
	if self.song_id ~= nil then
		var1741.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1741.song_id = self.songId
	end
	return var1741
end

t_38.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_38
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p75) --[[ line: 11583 ]]
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

function t_39:encode() --[[ line: 11594 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1743 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1744, var1745 = protoModule.writeTag(buff, var1743, 1, protoModule.wireTypes.lengthDelimited)
		var1744, var1745 = protoModule.writeString(var1744, var1745, self.title)
		buff = var1744
		var1743 = var1745
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1746 = v:encode()
			local var1747, var1748 = protoModule.writeTag(buff, var1743, 2, protoModule.wireTypes.lengthDelimited)
			var1747, var1748 = protoModule.writeBuffer(var1747, var1748, var1746, buffer.len(var1746))
			buff = var1747
			var1743 = var1748
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1749, var1750 = protoModule.writeTag(buff, var1743, 3, protoModule.wireTypes.lengthDelimited)
		var1749, var1750 = protoModule.writeString(var1749, var1750, self.universe_id)
		buff = var1749
		var1743 = var1750
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1751, var1752 = protoModule.writeTag(buff, var1743, 4, protoModule.wireTypes.lengthDelimited)
		var1751, var1752 = protoModule.writeString(var1751, var1752, self.sort_id)
		buff = var1751
		var1743 = var1752
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1753, var1754 = protoModule.writeTag(buff, var1743, 5, protoModule.wireTypes.lengthDelimited)
		var1753, var1754 = protoModule.writeString(var1753, var1754, self.subtitle)
		buff = var1753
		var1743 = var1754
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1755, var1756 = protoModule.writeTag(buff, var1743, 6, protoModule.wireTypes.lengthDelimited)
		var1755, var1756 = protoModule.writeString(var1755, var1756, self.info_text)
		buff = var1755
		var1743 = var1756
	end
	local buff_1 = buffer.create(var1743)
	buffer.copy(buff_1, 0, buff, 0, var1743)
	
	return buff_1
end

function t_39.decode(p76) --[[ line: 11636 ]]
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1758 = t_39.new()
	local var1759 = 0
	while var1759 < buffer.len(p76) do
		local _ = nil
		local var1760 = nil
		local var1761, var1762, var1763 = protoModule.readTag(p76, var1759)
		local var1764 = var1761
		var1760 = var1762
		var1759 = var1763
		
		if var1760 == protoModule.wireTypes.varint then
			local _ = nil
			local var1765, var1766 = protoModule.readVarInt(p76, var1759)
			local _ = var1765
			var1759 = var1766
			continue
		end
		if var1760 == protoModule.wireTypes.lengthDelimited then
			if var1764 == 1 then
				local _ = nil
				local var1767, var1768 = protoModule.readBuffer(p76, var1759)
				var1759 = var1768
				var1758.title = buffer.tostring(var1767)
			elseif var1764 == 2 then
				local _ = nil
				local var1769, var1770 = protoModule.readBuffer(p76, var1759)
				var1759 = var1770
				table.insert(var1758.event_items, t.EventsCarouselInputData_EventItem.decode(var1769))
			elseif var1764 == 3 then
				local _ = nil
				local var1771, var1772 = protoModule.readBuffer(p76, var1759)
				var1759 = var1772
				var1758.universe_id = buffer.tostring(var1771)
			elseif var1764 == 4 then
				local _ = nil
				local var1773, var1774 = protoModule.readBuffer(p76, var1759)
				var1759 = var1774
				var1758.sort_id = buffer.tostring(var1773)
			elseif var1764 == 5 then
				local _ = nil
				local var1775, var1776 = protoModule.readBuffer(p76, var1759)
				var1759 = var1776
				var1758.subtitle = buffer.tostring(var1775)
			elseif var1764 == 6 then
				local _ = nil
				local var1777, var1778 = protoModule.readBuffer(p76, var1759)
				var1759 = var1778
				var1758.info_text = buffer.tostring(var1777)
			else
				local _ = nil
				local var1779, var1780 = protoModule.readVarInt(p76, var1759)
				var1759 = var1780 + var1779
			end
		elseif var1760 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1781, var1782 = protoModule.readFixed32(p76, var1759)
			local _ = var1781
			var1759 = var1782
		elseif var1760 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1783, var1784 = protoModule.readFixed64(p76, var1759)
			local _ = var1783
			var1759 = var1784
		else
			error("Unsupported wire type: " .. var1760)
		end
	end
	return var1758
end

function t_39:jsonEncode() --[[ line: 11704 ]]
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

function t_39:jsonDecode() --[[ line: 11738 ]]
	-- upvalues: t_39 (ref), t (ref)
	local var1787 = t_39.new()
	
	if self.title ~= nil then
		var1787.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1787.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1787.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1787.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1787.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1787.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1787.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1787.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1787.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1787.info_text = self.infoText
	end
	return var1787
end

t_39.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p77) --[[ line: 11808 ]]
	-- upvalues: t_40 (ref)
	return setmetatable({
		event_id = if p77 == nil or p77.event_id == nil then "" else p77.event_id
	}, t_40)
end

function t_40:encode() --[[ line: 11816 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1791 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1792, var1793 = protoModule.writeTag(buff, var1791, 1, protoModule.wireTypes.lengthDelimited)
		var1792, var1793 = protoModule.writeString(var1792, var1793, self.event_id)
		buff = var1792
		var1791 = var1793
	end
	local buff_1 = buffer.create(var1791)
	buffer.copy(buff_1, 0, buff, 0, var1791)
	
	return buff_1
end

function t_40.decode(p78) --[[ line: 11830 ]]
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1795 = t_40.new()
	local var1796 = 0
	while var1796 < buffer.len(p78) do
		local _ = nil
		local var1797 = nil
		local var1798, var1799, var1800 = protoModule.readTag(p78, var1796)
		local var1801 = var1798
		var1797 = var1799
		var1796 = var1800
		
		if var1797 == protoModule.wireTypes.varint then
			local _ = nil
			local var1802, var1803 = protoModule.readVarInt(p78, var1796)
			local _ = var1802
			var1796 = var1803
			continue
		end
		if var1797 == protoModule.wireTypes.lengthDelimited then
			if var1801 == 1 then
				local _ = nil
				local var1804, var1805 = protoModule.readBuffer(p78, var1796)
				var1796 = var1805
				var1795.event_id = buffer.tostring(var1804)
			else
				local _ = nil
				local var1806, var1807 = protoModule.readVarInt(p78, var1796)
				var1796 = var1807 + var1806
			end
		elseif var1797 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1808, var1809 = protoModule.readFixed32(p78, var1796)
			local _ = var1808
			var1796 = var1809
		elseif var1797 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1810, var1811 = protoModule.readFixed64(p78, var1796)
			local _ = var1810
			var1796 = var1811
		else
			error("Unsupported wire type: " .. var1797)
		end
	end
	return var1795
end

function t_40:jsonEncode() --[[ line: 11873 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_40:jsonDecode() --[[ line: 11883 ]]
	-- upvalues: t_40 (ref)
	local var1813 = t_40.new()
	
	if self.event_id ~= nil then
		var1813.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1813.event_id = self.eventId
	end
	return var1813
end

t_40.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p79) --[[ line: 11913 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		universe_id = if p79 == nil or p79.universe_id == nil then "" else p79.universe_id,
		entry_map = if p79 == nil or p79.entry_map == nil then {} else p79.entry_map,
		entry_order = if p79 == nil or p79.entry_order == nil then {} else p79.entry_order,
		creator_key = if p79 == nil or p79.creator_key == nil then "" else p79.creator_key
	}, t_41)
end

function t_41:encode() --[[ line: 11922 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1815 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1816, var1817 = protoModule.writeTag(buff, var1815, 1, protoModule.wireTypes.lengthDelimited)
		var1816, var1817 = protoModule.writeString(var1816, var1817, self.universe_id)
		buff = var1816
		var1815 = var1817
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1818, var1819 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1818, var1819 = protoModule.writeString(var1818, var1819, i)
			local var1820 = v:encode()
			var1819, var1821 = protoModule.writeTag(var1818, var1819, 2, protoModule.wireTypes.lengthDelimited)
			var1819, var1821 = protoModule.writeBuffer(var1819, var1821, var1820, buffer.len(var1820))
			local var1822 = var1819
			local var1823 = var1821
			local var1824, var1825 = protoModule.writeTag(buff, var1815, 2, protoModule.wireTypes.lengthDelimited)
			var1824, var1825 = protoModule.writeBuffer(var1824, var1825, var1822, var1823)
			buff = var1824
			var1815 = var1825
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1826, var1827 = protoModule.writeTag(buff, var1815, 3, protoModule.wireTypes.lengthDelimited)
			var1826, var1827 = protoModule.writeString(var1826, var1827, v)
			buff = var1826
			var1815 = var1827
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1828, var1829 = protoModule.writeTag(buff, var1815, 4, protoModule.wireTypes.lengthDelimited)
		var1828, var1829 = protoModule.writeString(var1828, var1829, self.creator_key)
		buff = var1828
		var1815 = var1829
	end
	local buff_1 = buffer.create(var1815)
	buffer.copy(buff_1, 0, buff, 0, var1815)
	
	return buff_1
end

function t_41.decode(p80) --[[ line: 11962 ]]
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1831 = t_41.new()
	local var1832 = 0
	while var1832 < buffer.len(p80) do
		local _ = nil
		local var1833 = nil
		local var1834, var1835, var1836 = protoModule.readTag(p80, var1832)
		local var1837 = var1834
		var1833 = var1835
		var1832 = var1836
		
		if var1833 == protoModule.wireTypes.varint then
			local _ = nil
			local var1838, var1839 = protoModule.readVarInt(p80, var1832)
			local _ = var1838
			var1832 = var1839
			continue
		end
		if var1833 == protoModule.wireTypes.lengthDelimited then
			if var1837 == 1 then
				local _ = nil
				local var1840, var1841 = protoModule.readBuffer(p80, var1832)
				var1832 = var1841
				var1831.universe_id = buffer.tostring(var1840)
			elseif var1837 == 2 then
				local _ = nil
				local var1842, var1843 = protoModule.readBuffer(p80, var1832)
				var1832 = var1843
				var1842 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1842)
				var1831.entry_map[var1842.key or ""] = var1842.value or t.FeedEntry.new()
			elseif var1837 == 3 then
				local _ = nil
				local var1844, var1845 = protoModule.readBuffer(p80, var1832)
				var1832 = var1845
				table.insert(var1831.entry_order, buffer.tostring(var1844))
			elseif var1837 == 4 then
				local _ = nil
				local var1846, var1847 = protoModule.readBuffer(p80, var1832)
				var1832 = var1847
				var1831.creator_key = buffer.tostring(var1846)
			else
				local _ = nil
				local var1848, var1849 = protoModule.readVarInt(p80, var1832)
				var1832 = var1849 + var1848
			end
		elseif var1833 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1850, var1851 = protoModule.readFixed32(p80, var1832)
			local _ = var1850
			var1832 = var1851
		elseif var1833 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1852, var1853 = protoModule.readFixed64(p80, var1832)
			local _ = var1852
			var1832 = var1853
		else
			error("Unsupported wire type: " .. var1833)
		end
	end
	return var1831
end

function t_41:jsonEncode() --[[ line: 12027 ]]
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

function t_41:jsonDecode() --[[ line: 12057 ]]
	-- upvalues: t_41 (ref), t (ref)
	local var1857 = t_41.new()
	
	if self.universe_id ~= nil then
		var1857.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1857.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1857.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1857.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1857.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1857.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1857.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1857.creator_key = self.creatorKey
	end
	return var1857
end

t_41.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p81) --[[ line: 12129 ]]
	-- upvalues: t_42 (ref)
	return setmetatable({
		key = if p81 == nil or p81.key == nil then "" else p81.key,
		value = if p81 == nil or p81.value == nil then nil else p81.value
	}, t_42)
end

function t_42:encode() --[[ line: 12138 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1863 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1864, var1865 = protoModule.writeTag(buff, var1863, 1, protoModule.wireTypes.lengthDelimited)
		var1864, var1865 = protoModule.writeString(var1864, var1865, self.key)
		buff = var1864
		var1863 = var1865
	end
	if self.value ~= nil then
		local var1866 = self.value:encode()
		local var1867, var1868 = protoModule.writeTag(buff, var1863, 2, protoModule.wireTypes.lengthDelimited)
		var1867, var1868 = protoModule.writeBuffer(var1867, var1868, var1866, buffer.len(var1866))
		buff = var1867
		var1863 = var1868
	end
	local buff_1 = buffer.create(var1863)
	buffer.copy(buff_1, 0, buff, 0, var1863)
	
	return buff_1
end

function t_42.decode(p82) --[[ line: 12158 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1870 = t_42.new()
	local var1871 = 0
	while var1871 < buffer.len(p82) do
		local _ = nil
		local var1872 = nil
		local var1873, var1874, var1875 = protoModule.readTag(p82, var1871)
		local var1876 = var1873
		var1872 = var1874
		var1871 = var1875
		
		if var1872 == protoModule.wireTypes.varint then
			local _ = nil
			local var1877, var1878 = protoModule.readVarInt(p82, var1871)
			local _ = var1877
			var1871 = var1878
			continue
		end
		if var1872 == protoModule.wireTypes.lengthDelimited then
			if var1876 == 1 then
				local _ = nil
				local var1879, var1880 = protoModule.readBuffer(p82, var1871)
				var1871 = var1880
				var1870.key = buffer.tostring(var1879)
			elseif var1876 == 2 then
				local _ = nil
				local var1881, var1882 = protoModule.readBuffer(p82, var1871)
				var1871 = var1882
				var1870.value = t.FeedEntry.decode(var1881)
			else
				local _ = nil
				local var1883, var1884 = protoModule.readVarInt(p82, var1871)
				var1871 = var1884 + var1883
			end
		elseif var1872 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1885, var1886 = protoModule.readFixed32(p82, var1871)
			local _ = var1885
			var1871 = var1886
		elseif var1872 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1887, var1888 = protoModule.readFixed64(p82, var1871)
			local _ = var1887
			var1871 = var1888
		else
			error("Unsupported wire type: " .. var1872)
		end
	end
	return var1870
end

function t_42:jsonEncode() --[[ line: 12206 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_42:jsonDecode() --[[ line: 12220 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1890 = t_42.new()
	
	if self.key ~= nil then
		var1890.key = self.key
	end
	if self.value ~= nil then
		var1890.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1890
end

t_42.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p83) --[[ line: 12250 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		game_passes = if p83 == nil or p83.game_passes == nil then {} else p83.game_passes
	}, t_43)
end

function t_43:encode() --[[ line: 12258 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1892 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1893 = v:encode()
			local var1894, var1895 = protoModule.writeTag(buff, var1892, 1, protoModule.wireTypes.lengthDelimited)
			var1894, var1895 = protoModule.writeBuffer(var1894, var1895, var1893, buffer.len(var1893))
			buff = var1894
			var1892 = var1895
		end
	end
	local buff_1 = buffer.create(var1892)
	buffer.copy(buff_1, 0, buff, 0, var1892)
	
	return buff_1
end

function t_43.decode(p84) --[[ line: 12275 ]]
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1897 = t_43.new()
	local var1898 = 0
	while var1898 < buffer.len(p84) do
		local _ = nil
		local var1899 = nil
		local var1900, var1901, var1902 = protoModule.readTag(p84, var1898)
		local var1903 = var1900
		var1899 = var1901
		var1898 = var1902
		
		if var1899 == protoModule.wireTypes.varint then
			local _ = nil
			local var1904, var1905 = protoModule.readVarInt(p84, var1898)
			local _ = var1904
			var1898 = var1905
			continue
		end
		if var1899 == protoModule.wireTypes.lengthDelimited then
			if var1903 == 1 then
				local _ = nil
				local var1906, var1907 = protoModule.readBuffer(p84, var1898)
				var1898 = var1907
				table.insert(var1897.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1906))
			else
				local _ = nil
				local var1908, var1909 = protoModule.readVarInt(p84, var1898)
				var1898 = var1909 + var1908
			end
		elseif var1899 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1910, var1911 = protoModule.readFixed32(p84, var1898)
			local _ = var1910
			var1898 = var1911
		elseif var1899 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1912, var1913 = protoModule.readFixed64(p84, var1898)
			local _ = var1912
			var1898 = var1913
		else
			error("Unsupported wire type: " .. var1899)
		end
	end
	return var1897
end

function t_43:jsonEncode() --[[ line: 12318 ]]
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

function t_43:jsonDecode() --[[ line: 12332 ]]
	-- upvalues: t_43 (ref), t (ref)
	local var1916 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1916.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1916.game_passes = t_1
	end
	return var1916
end

t_43.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p85) --[[ line: 12370 ]]
	-- upvalues: t_44 (ref)
	return setmetatable({
		game_pass_id = if p85 == nil or p85.game_pass_id == nil then "" else p85.game_pass_id
	}, t_44)
end

function t_44:encode() --[[ line: 12378 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1920 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1921, var1922 = protoModule.writeTag(buff, var1920, 1, protoModule.wireTypes.lengthDelimited)
		var1921, var1922 = protoModule.writeString(var1921, var1922, self.game_pass_id)
		buff = var1921
		var1920 = var1922
	end
	local buff_1 = buffer.create(var1920)
	buffer.copy(buff_1, 0, buff, 0, var1920)
	
	return buff_1
end

function t_44.decode(p86) --[[ line: 12394 ]]
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1924 = t_44.new()
	local var1925 = 0
	while var1925 < buffer.len(p86) do
		local _ = nil
		local var1926 = nil
		local var1927, var1928, var1929 = protoModule.readTag(p86, var1925)
		local var1930 = var1927
		var1926 = var1928
		var1925 = var1929
		
		if var1926 == protoModule.wireTypes.varint then
			local _ = nil
			local var1931, var1932 = protoModule.readVarInt(p86, var1925)
			local _ = var1931
			var1925 = var1932
			continue
		end
		if var1926 == protoModule.wireTypes.lengthDelimited then
			if var1930 == 1 then
				local _ = nil
				local var1933, var1934 = protoModule.readBuffer(p86, var1925)
				var1925 = var1934
				var1924.game_pass_id = buffer.tostring(var1933)
			else
				local _ = nil
				local var1935, var1936 = protoModule.readVarInt(p86, var1925)
				var1925 = var1936 + var1935
			end
		elseif var1926 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1937, var1938 = protoModule.readFixed32(p86, var1925)
			local _ = var1937
			var1925 = var1938
		elseif var1926 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1939, var1940 = protoModule.readFixed64(p86, var1925)
			local _ = var1939
			var1925 = var1940
		else
			error("Unsupported wire type: " .. var1926)
		end
	end
	return var1924
end

function t_44:jsonEncode() --[[ line: 12439 ]]
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_44:jsonDecode() --[[ line: 12451 ]]
	-- upvalues: t_44 (ref)
	local var1942 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1942.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1942.game_pass_id = self.gamePassId
	end
	return var1942
end

t_44.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_44
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p87) --[[ line: 12481 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_products = if p87 == nil or p87.developer_products == nil then {} else p87.developer_products
	}, t_45)
end

function t_45:encode() --[[ line: 12489 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1944 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1945 = v:encode()
			local var1946, var1947 = protoModule.writeTag(buff, var1944, 1, protoModule.wireTypes.lengthDelimited)
			var1946, var1947 = protoModule.writeBuffer(var1946, var1947, var1945, buffer.len(var1945))
			buff = var1946
			var1944 = var1947
		end
	end
	local buff_1 = buffer.create(var1944)
	buffer.copy(buff_1, 0, buff, 0, var1944)
	
	return buff_1
end

function t_45.decode(p88) --[[ line: 12506 ]]
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1949 = t_45.new()
	local var1950 = 0
	while var1950 < buffer.len(p88) do
		local _ = nil
		local var1951 = nil
		local var1952, var1953, var1954 = protoModule.readTag(p88, var1950)
		local var1955 = var1952
		var1951 = var1953
		var1950 = var1954
		
		if var1951 == protoModule.wireTypes.varint then
			local _ = nil
			local var1956, var1957 = protoModule.readVarInt(p88, var1950)
			local _ = var1956
			var1950 = var1957
			continue
		end
		if var1951 == protoModule.wireTypes.lengthDelimited then
			if var1955 == 1 then
				local _ = nil
				local var1958, var1959 = protoModule.readBuffer(p88, var1950)
				var1950 = var1959
				table.insert(var1949.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1958))
			else
				local _ = nil
				local var1960, var1961 = protoModule.readVarInt(p88, var1950)
				var1950 = var1961 + var1960
			end
		elseif var1951 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1962, var1963 = protoModule.readFixed32(p88, var1950)
			local _ = var1962
			var1950 = var1963
		elseif var1951 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1964, var1965 = protoModule.readFixed64(p88, var1950)
			local _ = var1964
			var1950 = var1965
		else
			error("Unsupported wire type: " .. var1951)
		end
	end
	return var1949
end

function t_45:jsonEncode() --[[ line: 12552 ]]
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

function t_45:jsonDecode() --[[ line: 12566 ]]
	-- upvalues: t_45 (ref), t (ref)
	local var1968 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1968.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1968.developer_products = t_1
	end
	return var1968
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p89) --[[ line: 12613 ]]
	-- upvalues: t_46 (ref)
	return setmetatable({
		developer_product_id = if p89 == nil or p89.developer_product_id == nil then "" else p89.developer_product_id
	}, t_46)
end

function t_46:encode() --[[ line: 12626 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1972 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1973, var1974 = protoModule.writeTag(buff, var1972, 1, protoModule.wireTypes.lengthDelimited)
		var1973, var1974 = protoModule.writeString(var1973, var1974, self.developer_product_id)
		buff = var1973
		var1972 = var1974
	end
	local buff_1 = buffer.create(var1972)
	buffer.copy(buff_1, 0, buff, 0, var1972)
	
	return buff_1
end

function t_46.decode(p90) --[[ line: 12642 ]]
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1976 = t_46.new()
	local var1977 = 0
	while var1977 < buffer.len(p90) do
		local _ = nil
		local var1978 = nil
		local var1979, var1980, var1981 = protoModule.readTag(p90, var1977)
		local var1982 = var1979
		var1978 = var1980
		var1977 = var1981
		
		if var1978 == protoModule.wireTypes.varint then
			local _ = nil
			local var1983, var1984 = protoModule.readVarInt(p90, var1977)
			local _ = var1983
			var1977 = var1984
			continue
		end
		if var1978 == protoModule.wireTypes.lengthDelimited then
			if var1982 == 1 then
				local _ = nil
				local var1985, var1986 = protoModule.readBuffer(p90, var1977)
				var1977 = var1986
				var1976.developer_product_id = buffer.tostring(var1985)
			else
				local _ = nil
				local var1987, var1988 = protoModule.readVarInt(p90, var1977)
				var1977 = var1988 + var1987
			end
		elseif var1978 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1989, var1990 = protoModule.readFixed32(p90, var1977)
			local _ = var1989
			var1977 = var1990
		elseif var1978 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1991, var1992 = protoModule.readFixed64(p90, var1977)
			local _ = var1991
			var1977 = var1992
		else
			error("Unsupported wire type: " .. var1978)
		end
	end
	return var1976
end

function t_46:jsonEncode() --[[ line: 12687 ]]
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_46:jsonDecode() --[[ line: 12699 ]]
	-- upvalues: t_46 (ref)
	local var1994 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1994.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1994.developer_product_id = self.developerProductId
	end
	return var1994
end

t_46.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_46
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p91) --[[ line: 12730 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscriptions = if p91 == nil or p91.subscriptions == nil then {} else p91.subscriptions
	}, t_47)
end

function t_47:encode() --[[ line: 12738 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1996 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1997 = v:encode()
			local var1998, var1999 = protoModule.writeTag(buff, var1996, 1, protoModule.wireTypes.lengthDelimited)
			var1998, var1999 = protoModule.writeBuffer(var1998, var1999, var1997, buffer.len(var1997))
			buff = var1998
			var1996 = var1999
		end
	end
	local buff_1 = buffer.create(var1996)
	buffer.copy(buff_1, 0, buff, 0, var1996)
	
	return buff_1
end

function t_47.decode(p92) --[[ line: 12755 ]]
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var2001 = t_47.new()
	local var2002 = 0
	while var2002 < buffer.len(p92) do
		local _ = nil
		local var2003 = nil
		local var2004, var2005, var2006 = protoModule.readTag(p92, var2002)
		local var2007 = var2004
		var2003 = var2005
		var2002 = var2006
		
		if var2003 == protoModule.wireTypes.varint then
			local _ = nil
			local var2008, var2009 = protoModule.readVarInt(p92, var2002)
			local _ = var2008
			var2002 = var2009
			continue
		end
		if var2003 == protoModule.wireTypes.lengthDelimited then
			if var2007 == 1 then
				local _ = nil
				local var2010, var2011 = protoModule.readBuffer(p92, var2002)
				var2002 = var2011
				table.insert(var2001.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var2010))
			else
				local _ = nil
				local var2012, var2013 = protoModule.readVarInt(p92, var2002)
				var2002 = var2013 + var2012
			end
		elseif var2003 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2014, var2015 = protoModule.readFixed32(p92, var2002)
			local _ = var2014
			var2002 = var2015
		elseif var2003 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2016, var2017 = protoModule.readFixed64(p92, var2002)
			local _ = var2016
			var2002 = var2017
		else
			error("Unsupported wire type: " .. var2003)
		end
	end
	return var2001
end

function t_47:jsonEncode() --[[ line: 12801 ]]
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

function t_47:jsonDecode() --[[ line: 12815 ]]
	-- upvalues: t_47 (ref), t (ref)
	local var2020 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var2020.subscriptions = t_1
	end
	return var2020
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p93) --[[ line: 12845 ]]
	-- upvalues: t_48 (ref)
	return setmetatable({
		subscription_id = if p93 == nil or p93.subscription_id == nil then "" else p93.subscription_id
	}, t_48)
end

function t_48:encode() --[[ line: 12856 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2023 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var2024, var2025 = protoModule.writeTag(buff, var2023, 1, protoModule.wireTypes.lengthDelimited)
		var2024, var2025 = protoModule.writeString(var2024, var2025, self.subscription_id)
		buff = var2024
		var2023 = var2025
	end
	local buff_1 = buffer.create(var2023)
	buffer.copy(buff_1, 0, buff, 0, var2023)
	
	return buff_1
end

function t_48.decode(p94) --[[ line: 12872 ]]
	-- upvalues: t_48 (ref), protoModule (ref)
	local var2027 = t_48.new()
	local var2028 = 0
	while var2028 < buffer.len(p94) do
		local _ = nil
		local var2029 = nil
		local var2030, var2031, var2032 = protoModule.readTag(p94, var2028)
		local var2033 = var2030
		var2029 = var2031
		var2028 = var2032
		
		if var2029 == protoModule.wireTypes.varint then
			local _ = nil
			local var2034, var2035 = protoModule.readVarInt(p94, var2028)
			local _ = var2034
			var2028 = var2035
			continue
		end
		if var2029 == protoModule.wireTypes.lengthDelimited then
			if var2033 == 1 then
				local _ = nil
				local var2036, var2037 = protoModule.readBuffer(p94, var2028)
				var2028 = var2037
				var2027.subscription_id = buffer.tostring(var2036)
			else
				local _ = nil
				local var2038, var2039 = protoModule.readVarInt(p94, var2028)
				var2028 = var2039 + var2038
			end
		elseif var2029 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2040, var2041 = protoModule.readFixed32(p94, var2028)
			local _ = var2040
			var2028 = var2041
		elseif var2029 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2042, var2043 = protoModule.readFixed64(p94, var2028)
			local _ = var2042
			var2028 = var2043
		else
			error("Unsupported wire type: " .. var2029)
		end
	end
	return var2027
end

function t_48:jsonEncode() --[[ line: 12917 ]]
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_48:jsonDecode() --[[ line: 12929 ]]
	-- upvalues: t_48 (ref)
	local var2045 = t_48.new()
	
	if self.subscription_id ~= nil then
		var2045.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var2045.subscription_id = self.subscriptionId
	end
	return var2045
end

t_48.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_48
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p95) --[[ line: 12960 ]]
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

function t_49:encode() --[[ line: 12975 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2047 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2048 = v:encode()
			local var2049, var2050 = protoModule.writeTag(buff, var2047, 1, protoModule.wireTypes.lengthDelimited)
			var2049, var2050 = protoModule.writeBuffer(var2049, var2050, var2048, buffer.len(var2048))
			buff = var2049
			var2047 = var2050
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2051, var2052 = protoModule.writeTag(buff, var2047, 2, protoModule.wireTypes.lengthDelimited)
		var2051, var2052 = protoModule.writeString(var2051, var2052, self.universe_id)
		buff = var2051
		var2047 = var2052
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var2053, var2054 = protoModule.writeTag(buff, var2047, 3, protoModule.wireTypes.lengthDelimited)
		var2053, var2054 = protoModule.writeString(var2053, var2054, self.section_title)
		buff = var2053
		var2047 = var2054
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var2055, var2056 = protoModule.writeTag(buff, var2047, 4, protoModule.wireTypes.lengthDelimited)
		var2055, var2056 = protoModule.writeString(var2055, var2056, self.creator_key)
		buff = var2055
		var2047 = var2056
	end
	if self.collection_item_size ~= nil and self.collection_item_size ~= "" then
		local var2057, var2058 = protoModule.writeTag(buff, var2047, 5, protoModule.wireTypes.lengthDelimited)
		var2057, var2058 = protoModule.writeString(var2057, var2058, self.collection_item_size)
		buff = var2057
		var2047 = var2058
	end
	if self.item_height_mode ~= nil and self.item_height_mode ~= "" then
		local var2059, var2060 = protoModule.writeTag(buff, var2047, 6, protoModule.wireTypes.lengthDelimited)
		var2059, var2060 = protoModule.writeString(var2059, var2060, self.item_height_mode)
		buff = var2059
		var2047 = var2060
	end
	local buff_1 = buffer.create(var2047)
	buffer.copy(buff_1, 0, buff, 0, var2047)
	
	return buff_1
end

function t_49.decode(p96) --[[ line: 13017 ]]
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var2062 = t_49.new()
	local var2063 = 0
	while var2063 < buffer.len(p96) do
		local _ = nil
		local var2064 = nil
		local var2065, var2066, var2067 = protoModule.readTag(p96, var2063)
		local var2068 = var2065
		var2064 = var2066
		var2063 = var2067
		
		if var2064 == protoModule.wireTypes.varint then
			local _ = nil
			local var2069, var2070 = protoModule.readVarInt(p96, var2063)
			local _ = var2069
			var2063 = var2070
			continue
		end
		if var2064 == protoModule.wireTypes.lengthDelimited then
			if var2068 == 1 then
				local _ = nil
				local var2071, var2072 = protoModule.readBuffer(p96, var2063)
				var2063 = var2072
				table.insert(var2062.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var2071))
			elseif var2068 == 2 then
				local _ = nil
				local var2073, var2074 = protoModule.readBuffer(p96, var2063)
				var2063 = var2074
				var2062.universe_id = buffer.tostring(var2073)
			elseif var2068 == 3 then
				local _ = nil
				local var2075, var2076 = protoModule.readBuffer(p96, var2063)
				var2063 = var2076
				var2062.section_title = buffer.tostring(var2075)
			elseif var2068 == 4 then
				local _ = nil
				local var2077, var2078 = protoModule.readBuffer(p96, var2063)
				var2063 = var2078
				var2062.creator_key = buffer.tostring(var2077)
			elseif var2068 == 5 then
				local _ = nil
				local var2079, var2080 = protoModule.readBuffer(p96, var2063)
				var2063 = var2080
				var2062.collection_item_size = buffer.tostring(var2079)
			elseif var2068 == 6 then
				local _ = nil
				local var2081, var2082 = protoModule.readBuffer(p96, var2063)
				var2063 = var2082
				var2062.item_height_mode = buffer.tostring(var2081)
			else
				local _ = nil
				local var2083, var2084 = protoModule.readVarInt(p96, var2063)
				var2063 = var2084 + var2083
			end
		elseif var2064 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2085, var2086 = protoModule.readFixed32(p96, var2063)
			local _ = var2085
			var2063 = var2086
		elseif var2064 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2087, var2088 = protoModule.readFixed64(p96, var2063)
			local _ = var2087
			var2063 = var2088
		else
			error("Unsupported wire type: " .. var2064)
		end
	end
	return var2062
end

function t_49:jsonEncode() --[[ line: 13088 ]]
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

function t_49:jsonDecode() --[[ line: 13122 ]]
	-- upvalues: t_49 (ref), t (ref)
	local var2091 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var2091.items = t_1
	end
	if self.universe_id ~= nil then
		var2091.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2091.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var2091.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var2091.section_title = self.sectionTitle
	end
	if self.creator_key ~= nil then
		var2091.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var2091.creator_key = self.creatorKey
	end
	if self.collection_item_size ~= nil then
		var2091.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var2091.collection_item_size = self.collectionItemSize
	end
	if self.item_height_mode ~= nil then
		var2091.item_height_mode = self.item_height_mode
	end
	if self.itemHeightMode ~= nil then
		var2091.item_height_mode = self.itemHeightMode
	end
	return var2091
end

t_49.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_49
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p97) --[[ line: 13195 ]]
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		item_id = if p97 == nil or p97.item_id == nil then "" else p97.item_id,
		identifier = if p97 == nil or p97.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p97.identifier
	}, t_50)
end

function t_50:encode() --[[ line: 13212 ]]
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2094 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2095, var2096 = protoModule.writeTag(buff, var2094, 1, protoModule.wireTypes.lengthDelimited)
		var2095, var2096 = protoModule.writeString(var2095, var2096, self.item_id)
		buff = var2095
		var2094 = var2096
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var2097, var2098 = protoModule.writeTag(buff, var2094, 2, protoModule.wireTypes.varint)
		var2097, var2098 = protoModule.writeVarInt(var2097, var2098, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var2097
		var2094 = var2098
	end
	local buff_1 = buffer.create(var2094)
	buffer.copy(buff_1, 0, buff, 0, var2094)
	
	return buff_1
end

function t_50.decode(p98) --[[ line: 13244 ]]
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var2100 = t_50.new()
	local var2101 = 0
	while var2101 < buffer.len(p98) do
		local _ = nil
		local var2102 = nil
		local var2103, var2104, var2105 = protoModule.readTag(p98, var2101)
		local var2106 = var2103
		var2102 = var2104
		var2101 = var2105
		
		if var2102 == protoModule.wireTypes.varint then
			if var2106 == 2 then
				local _ = nil
				local var2107, var2108 = protoModule.readVarIntI32(p98, var2101)
				local var2109 = var2107
				var2101 = var2108
				var2100.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var2109) or var2109
			else
				local _ = nil
				local var2110, var2111 = protoModule.readVarInt(p98, var2101)
				local _ = var2110
				var2101 = var2111
			end
		end
		if var2102 == protoModule.wireTypes.lengthDelimited then
			if var2106 == 1 then
				local _ = nil
				local var2112, var2113 = protoModule.readBuffer(p98, var2101)
				var2101 = var2113
				var2100.item_id = buffer.tostring(var2112)
			else
				local _ = nil
				local var2114, var2115 = protoModule.readVarInt(p98, var2101)
				var2101 = var2115 + var2114
			end
		elseif var2102 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2116, var2117 = protoModule.readFixed32(p98, var2101)
			local _ = var2116
			var2101 = var2117
		elseif var2102 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2118, var2119 = protoModule.readFixed64(p98, var2101)
			local _ = var2118
			var2101 = var2119
		else
			error("Unsupported wire type: " .. var2102)
		end
	end
	return var2100
end

function t_50:jsonEncode() --[[ line: 13296 ]]
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

function t_50:jsonDecode() --[[ line: 13323 ]]
	-- upvalues: t_50 (ref), t (ref)
	local var2121 = t_50.new()
	
	if self.item_id ~= nil then
		var2121.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2121.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var2121.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var2121
end

t_50.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_50
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p99) --[[ line: 13362 ]]
		return if p99 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p99 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p99 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p99 == 3 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end,
	toNumber = function(p100) --[[ line: 13376 ]]
		return if p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then 3 else p100
	end,
	fromName = function(p101) --[[ line: 13390 ]]
		return if p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_SUBSCRIPTION" else nil
	end
}
local t_51 = {}
t_51.__index = t_51

function t_51.new(p102) --[[ line: 13409 ]]
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

function t_51:encode() --[[ line: 13425 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2123 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2124, var2125 = protoModule.writeTag(buff, var2123, 1, protoModule.wireTypes.lengthDelimited)
		var2124, var2125 = protoModule.writeString(var2124, var2125, self.roblox_component)
		buff = var2124
		var2123 = var2125
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var2126, var2127 = protoModule.writeTag(buff, var2123, 2, protoModule.wireTypes.lengthDelimited)
		var2126, var2127 = protoModule.writeString(var2126, var2127, self.identifier)
		buff = var2126
		var2123 = var2127
	end
	if self.title ~= nil and self.title ~= "" then
		local var2128, var2129 = protoModule.writeTag(buff, var2123, 3, protoModule.wireTypes.lengthDelimited)
		var2128, var2129 = protoModule.writeString(var2128, var2129, self.title)
		buff = var2128
		var2123 = var2129
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2130, var2131 = protoModule.writeTag(buff, var2123, 4, protoModule.wireTypes.lengthDelimited)
		var2130, var2131 = protoModule.writeString(var2130, var2131, self.user_id)
		buff = var2130
		var2123 = var2131
	end
	if self.description ~= nil and self.description ~= "" then
		local var2132, var2133 = protoModule.writeTag(buff, var2123, 5, protoModule.wireTypes.lengthDelimited)
		var2132, var2133 = protoModule.writeString(var2132, var2133, self.description)
		buff = var2132
		var2123 = var2133
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2134, var2135 = protoModule.writeTag(buff, var2123, 6, protoModule.wireTypes.lengthDelimited)
		var2134, var2135 = protoModule.writeString(var2134, var2135, self.cta_text)
		buff = var2134
		var2123 = var2135
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2136, var2137 = protoModule.writeTag(buff, var2123, 7, protoModule.wireTypes.lengthDelimited)
		var2136, var2137 = protoModule.writeString(var2136, var2137, self.prompt_id)
		buff = var2136
		var2123 = var2137
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2138, var2139 = protoModule.writeTag(buff, var2123, 8, protoModule.wireTypes.lengthDelimited)
		var2138, var2139 = protoModule.writeString(var2138, var2139, self.prompt_type)
		buff = var2138
		var2123 = var2139
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2140, var2141 = protoModule.writeTag(buff, var2123, 9, protoModule.wireTypes.lengthDelimited)
		var2140, var2141 = protoModule.writeString(var2140, var2141, self.entity_id)
		buff = var2140
		var2123 = var2141
	end
	local buff_1 = buffer.create(var2123)
	buffer.copy(buff_1, 0, buff, 0, var2123)
	
	return buff_1
end

function t_51.decode(p103) --[[ line: 13479 ]]
	-- upvalues: t_51 (ref), protoModule (ref)
	local var2143 = t_51.new()
	local var2144 = 0
	while var2144 < buffer.len(p103) do
		local _ = nil
		local var2145 = nil
		local var2146, var2147, var2148 = protoModule.readTag(p103, var2144)
		local var2149 = var2146
		var2145 = var2147
		var2144 = var2148
		
		if var2145 == protoModule.wireTypes.varint then
			local _ = nil
			local var2150, var2151 = protoModule.readVarInt(p103, var2144)
			local _ = var2150
			var2144 = var2151
			continue
		end
		if var2145 == protoModule.wireTypes.lengthDelimited then
			if var2149 == 1 then
				local _ = nil
				local var2152, var2153 = protoModule.readBuffer(p103, var2144)
				var2144 = var2153
				var2143.roblox_component = buffer.tostring(var2152)
			elseif var2149 == 2 then
				local _ = nil
				local var2154, var2155 = protoModule.readBuffer(p103, var2144)
				var2144 = var2155
				var2143.identifier = buffer.tostring(var2154)
			elseif var2149 == 3 then
				local _ = nil
				local var2156, var2157 = protoModule.readBuffer(p103, var2144)
				var2144 = var2157
				var2143.title = buffer.tostring(var2156)
			elseif var2149 == 4 then
				local _ = nil
				local var2158, var2159 = protoModule.readBuffer(p103, var2144)
				var2144 = var2159
				var2143.user_id = buffer.tostring(var2158)
			elseif var2149 == 5 then
				local _ = nil
				local var2160, var2161 = protoModule.readBuffer(p103, var2144)
				var2144 = var2161
				var2143.description = buffer.tostring(var2160)
			elseif var2149 == 6 then
				local _ = nil
				local var2162, var2163 = protoModule.readBuffer(p103, var2144)
				var2144 = var2163
				var2143.cta_text = buffer.tostring(var2162)
			elseif var2149 == 7 then
				local _ = nil
				local var2164, var2165 = protoModule.readBuffer(p103, var2144)
				var2144 = var2165
				var2143.prompt_id = buffer.tostring(var2164)
			elseif var2149 == 8 then
				local _ = nil
				local var2166, var2167 = protoModule.readBuffer(p103, var2144)
				var2144 = var2167
				var2143.prompt_type = buffer.tostring(var2166)
			elseif var2149 == 9 then
				local _ = nil
				local var2168, var2169 = protoModule.readBuffer(p103, var2144)
				var2144 = var2169
				var2143.entity_id = buffer.tostring(var2168)
			else
				local _ = nil
				local var2170, var2171 = protoModule.readVarInt(p103, var2144)
				var2144 = var2171 + var2170
			end
		elseif var2145 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2172, var2173 = protoModule.readFixed32(p103, var2144)
			local _ = var2172
			var2144 = var2173
		elseif var2145 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2174, var2175 = protoModule.readFixed64(p103, var2144)
			local _ = var2174
			var2144 = var2175
		else
			error("Unsupported wire type: " .. var2145)
		end
	end
	return var2143
end

function t_51:jsonEncode() --[[ line: 13562 ]]
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

function t_51:jsonDecode() --[[ line: 13604 ]]
	-- upvalues: t_51 (ref)
	local var2177 = t_51.new()
	
	if self.roblox_component ~= nil then
		var2177.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var2177.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var2177.identifier = self.identifier
	end
	if self.title ~= nil then
		var2177.title = self.title
	end
	if self.user_id ~= nil then
		var2177.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2177.user_id = self.userId
	end
	if self.description ~= nil then
		var2177.description = self.description
	end
	if self.cta_text ~= nil then
		var2177.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2177.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2177.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2177.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2177.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2177.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2177.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2177.entity_id = self.entityId
	end
	return var2177
end

t_51.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_51
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p104) --[[ line: 13684 ]]
	-- upvalues: t_52 (ref)
	return setmetatable({
		group_id = if p104 == nil or p104.group_id == nil then "" else p104.group_id,
		experience_id = if p104 == nil or p104.experience_id == nil then "" else p104.experience_id
	}, t_52)
end

function t_52:encode() --[[ line: 13693 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2179 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var2180, var2181 = protoModule.writeTag(buff, var2179, 1, protoModule.wireTypes.lengthDelimited)
		var2180, var2181 = protoModule.writeString(var2180, var2181, self.group_id)
		buff = var2180
		var2179 = var2181
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var2182, var2183 = protoModule.writeTag(buff, var2179, 2, protoModule.wireTypes.lengthDelimited)
		var2182, var2183 = protoModule.writeString(var2182, var2183, self.experience_id)
		buff = var2182
		var2179 = var2183
	end
	local buff_1 = buffer.create(var2179)
	buffer.copy(buff_1, 0, buff, 0, var2179)
	
	return buff_1
end

function t_52.decode(p105) --[[ line: 13712 ]]
	-- upvalues: t_52 (ref), protoModule (ref)
	local var2185 = t_52.new()
	local var2186 = 0
	while var2186 < buffer.len(p105) do
		local _ = nil
		local var2187 = nil
		local var2188, var2189, var2190 = protoModule.readTag(p105, var2186)
		local var2191 = var2188
		var2187 = var2189
		var2186 = var2190
		
		if var2187 == protoModule.wireTypes.varint then
			local _ = nil
			local var2192, var2193 = protoModule.readVarInt(p105, var2186)
			local _ = var2192
			var2186 = var2193
			continue
		end
		if var2187 == protoModule.wireTypes.lengthDelimited then
			if var2191 == 1 then
				local _ = nil
				local var2194, var2195 = protoModule.readBuffer(p105, var2186)
				var2186 = var2195
				var2185.group_id = buffer.tostring(var2194)
			elseif var2191 == 2 then
				local _ = nil
				local var2196, var2197 = protoModule.readBuffer(p105, var2186)
				var2186 = var2197
				var2185.experience_id = buffer.tostring(var2196)
			else
				local _ = nil
				local var2198, var2199 = protoModule.readVarInt(p105, var2186)
				var2186 = var2199 + var2198
			end
		elseif var2187 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2200, var2201 = protoModule.readFixed32(p105, var2186)
			local _ = var2200
			var2186 = var2201
		elseif var2187 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2202, var2203 = protoModule.readFixed64(p105, var2186)
			local _ = var2202
			var2186 = var2203
		else
			error("Unsupported wire type: " .. var2187)
		end
	end
	return var2185
end

function t_52:jsonEncode() --[[ line: 13760 ]]
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_52:jsonDecode() --[[ line: 13774 ]]
	-- upvalues: t_52 (ref)
	local var2205 = t_52.new()
	
	if self.group_id ~= nil then
		var2205.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var2205.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var2205.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var2205.experience_id = self.experienceId
	end
	return var2205
end

t_52.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_52
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p106) --[[ line: 13810 ]]
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

function t_53:encode() --[[ line: 13824 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2207 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2208, var2209 = protoModule.writeTag(buff, var2207, 1, protoModule.wireTypes.lengthDelimited)
		var2208, var2209 = protoModule.writeString(var2208, var2209, self.title)
		buff = var2208
		var2207 = var2209
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var2210, var2211 = protoModule.writeTag(buff, var2207, 2, protoModule.wireTypes.lengthDelimited)
		var2210, var2211 = protoModule.writeString(var2210, var2211, self.dismiss_text)
		buff = var2210
		var2207 = var2211
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2212, var2213 = protoModule.writeTag(buff, var2207, 3, protoModule.wireTypes.lengthDelimited)
		var2212, var2213 = protoModule.writeString(var2212, var2213, self.user_id)
		buff = var2212
		var2207 = var2213
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var2214 = v:encode()
			local var2215, var2216 = protoModule.writeTag(buff, var2207, 4, protoModule.wireTypes.lengthDelimited)
			var2215, var2216 = protoModule.writeBuffer(var2215, var2216, var2214, buffer.len(var2214))
			buff = var2215
			var2207 = var2216
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2217, var2218 = protoModule.writeTag(buff, var2207, 5, protoModule.wireTypes.lengthDelimited)
		var2217, var2218 = protoModule.writeString(var2217, var2218, self.prompt_id)
		buff = var2217
		var2207 = var2218
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2219, var2220 = protoModule.writeTag(buff, var2207, 6, protoModule.wireTypes.lengthDelimited)
		var2219, var2220 = protoModule.writeString(var2219, var2220, self.prompt_type)
		buff = var2219
		var2207 = var2220
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2221, var2222 = protoModule.writeTag(buff, var2207, 7, protoModule.wireTypes.lengthDelimited)
		var2221, var2222 = protoModule.writeString(var2221, var2222, self.sort_id)
		buff = var2221
		var2207 = var2222
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var2223, var2224 = protoModule.writeTag(buff, var2207, 8, protoModule.wireTypes.lengthDelimited)
		var2223, var2224 = protoModule.writeString(var2223, var2224, self.feed_item_key)
		buff = var2223
		var2207 = var2224
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var2225 = self.client_attributes.value:encode()
		local var2226, var2227 = protoModule.writeTag(buff, var2207, 9, protoModule.wireTypes.lengthDelimited)
		var2226, var2227 = protoModule.writeBuffer(var2226, var2227, var2225, buffer.len(var2225))
		buff = var2226
		var2207 = var2227
	end
	local buff_1 = buffer.create(var2207)
	buffer.copy(buff_1, 0, buff, 0, var2207)
	
	return buff_1
end

function t_53.decode(p107) --[[ line: 13884 ]]
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var2229 = t_53.new()
	local var2230 = 0
	while var2230 < buffer.len(p107) do
		local _ = nil
		local var2231 = nil
		local var2232, var2233, var2234 = protoModule.readTag(p107, var2230)
		local var2235 = var2232
		var2231 = var2233
		var2230 = var2234
		
		if var2231 == protoModule.wireTypes.varint then
			local _ = nil
			local var2236, var2237 = protoModule.readVarInt(p107, var2230)
			local _ = var2236
			var2230 = var2237
			continue
		end
		if var2231 == protoModule.wireTypes.lengthDelimited then
			if var2235 == 1 then
				local _ = nil
				local var2238, var2239 = protoModule.readBuffer(p107, var2230)
				var2230 = var2239
				var2229.title = buffer.tostring(var2238)
			elseif var2235 == 2 then
				local _ = nil
				local var2240, var2241 = protoModule.readBuffer(p107, var2230)
				var2230 = var2241
				var2229.dismiss_text = buffer.tostring(var2240)
			elseif var2235 == 3 then
				local _ = nil
				local var2242, var2243 = protoModule.readBuffer(p107, var2230)
				var2230 = var2243
				var2229.user_id = buffer.tostring(var2242)
			elseif var2235 == 4 then
				local _ = nil
				local var2244, var2245 = protoModule.readBuffer(p107, var2230)
				var2230 = var2245
				table.insert(var2229.cards, t.CardContainerCardInputData.decode(var2244))
			elseif var2235 == 5 then
				local _ = nil
				local var2246, var2247 = protoModule.readBuffer(p107, var2230)
				var2230 = var2247
				var2229.prompt_id = buffer.tostring(var2246)
			elseif var2235 == 6 then
				local _ = nil
				local var2248, var2249 = protoModule.readBuffer(p107, var2230)
				var2230 = var2249
				var2229.prompt_type = buffer.tostring(var2248)
			elseif var2235 == 7 then
				local _ = nil
				local var2250, var2251 = protoModule.readBuffer(p107, var2230)
				var2230 = var2251
				var2229.sort_id = buffer.tostring(var2250)
			elseif var2235 == 8 then
				local _ = nil
				local var2252, var2253 = protoModule.readBuffer(p107, var2230)
				var2230 = var2253
				var2229.feed_item_key = buffer.tostring(var2252)
			elseif var2235 == 9 then
				local _ = nil
				local var2254, var2255 = protoModule.readBuffer(p107, var2230)
				var2230 = var2255
				var2229.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var2254)
				}
			else
				local _ = nil
				local var2256, var2257 = protoModule.readVarInt(p107, var2230)
				var2230 = var2257 + var2256
			end
		elseif var2231 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2258, var2259 = protoModule.readFixed32(p107, var2230)
			local _ = var2258
			var2230 = var2259
		elseif var2231 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2260, var2261 = protoModule.readFixed64(p107, var2230)
			local _ = var2260
			var2230 = var2261
		else
			error("Unsupported wire type: " .. var2231)
		end
	end
	return var2229
end

function t_53:jsonEncode() --[[ line: 13970 ]]
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

function t_53:jsonDecode() --[[ line: 14018 ]]
	-- upvalues: t_53 (ref), t (ref)
	local var2264 = t_53.new()
	
	if self.title ~= nil then
		var2264.title = self.title
	end
	if self.dismiss_text ~= nil then
		var2264.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var2264.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var2264.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2264.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var2264.cards = t_1
	end
	if self.prompt_id ~= nil then
		var2264.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2264.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2264.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2264.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var2264.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2264.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var2264.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var2264.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var2264.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var2264.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var2264
end

t_53.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_53
typeRegistryModule.default:register(t.CardContainerInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p108) --[[ line: 14113 ]]
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

function t_54:encode() --[[ line: 14125 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2267 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2268, var2269 = protoModule.writeTag(buff, var2267, 1, protoModule.wireTypes.lengthDelimited)
		var2268, var2269 = protoModule.writeString(var2268, var2269, self.title)
		buff = var2268
		var2267 = var2269
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2270, var2271 = protoModule.writeTag(buff, var2267, 2, protoModule.wireTypes.lengthDelimited)
		var2270, var2271 = protoModule.writeString(var2270, var2271, self.user_id)
		buff = var2270
		var2267 = var2271
	end
	if self.description ~= nil and self.description ~= "" then
		local var2272, var2273 = protoModule.writeTag(buff, var2267, 3, protoModule.wireTypes.lengthDelimited)
		var2272, var2273 = protoModule.writeString(var2272, var2273, self.description)
		buff = var2272
		var2267 = var2273
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2274, var2275 = protoModule.writeTag(buff, var2267, 4, protoModule.wireTypes.lengthDelimited)
		var2274, var2275 = protoModule.writeString(var2274, var2275, self.cta_text)
		buff = var2274
		var2267 = var2275
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2276, var2277 = protoModule.writeTag(buff, var2267, 5, protoModule.wireTypes.lengthDelimited)
		var2276, var2277 = protoModule.writeString(var2276, var2277, self.prompt_id)
		buff = var2276
		var2267 = var2277
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2278, var2279 = protoModule.writeTag(buff, var2267, 6, protoModule.wireTypes.lengthDelimited)
		var2278, var2279 = protoModule.writeString(var2278, var2279, self.prompt_type)
		buff = var2278
		var2267 = var2279
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2280, var2281 = protoModule.writeTag(buff, var2267, 7, protoModule.wireTypes.lengthDelimited)
		var2280, var2281 = protoModule.writeString(var2280, var2281, self.entity_id)
		buff = var2280
		var2267 = var2281
	end
	local buff_1 = buffer.create(var2267)
	buffer.copy(buff_1, 0, buff, 0, var2267)
	
	return buff_1
end

function t_54.decode(p109) --[[ line: 14169 ]]
	-- upvalues: t_54 (ref), protoModule (ref)
	local var2283 = t_54.new()
	local var2284 = 0
	while var2284 < buffer.len(p109) do
		local _ = nil
		local var2285 = nil
		local var2286, var2287, var2288 = protoModule.readTag(p109, var2284)
		local var2289 = var2286
		var2285 = var2287
		var2284 = var2288
		
		if var2285 == protoModule.wireTypes.varint then
			local _ = nil
			local var2290, var2291 = protoModule.readVarInt(p109, var2284)
			local _ = var2290
			var2284 = var2291
			continue
		end
		if var2285 == protoModule.wireTypes.lengthDelimited then
			if var2289 == 1 then
				local _ = nil
				local var2292, var2293 = protoModule.readBuffer(p109, var2284)
				var2284 = var2293
				var2283.title = buffer.tostring(var2292)
			elseif var2289 == 2 then
				local _ = nil
				local var2294, var2295 = protoModule.readBuffer(p109, var2284)
				var2284 = var2295
				var2283.user_id = buffer.tostring(var2294)
			elseif var2289 == 3 then
				local _ = nil
				local var2296, var2297 = protoModule.readBuffer(p109, var2284)
				var2284 = var2297
				var2283.description = buffer.tostring(var2296)
			elseif var2289 == 4 then
				local _ = nil
				local var2298, var2299 = protoModule.readBuffer(p109, var2284)
				var2284 = var2299
				var2283.cta_text = buffer.tostring(var2298)
			elseif var2289 == 5 then
				local _ = nil
				local var2300, var2301 = protoModule.readBuffer(p109, var2284)
				var2284 = var2301
				var2283.prompt_id = buffer.tostring(var2300)
			elseif var2289 == 6 then
				local _ = nil
				local var2302, var2303 = protoModule.readBuffer(p109, var2284)
				var2284 = var2303
				var2283.prompt_type = buffer.tostring(var2302)
			elseif var2289 == 7 then
				local _ = nil
				local var2304, var2305 = protoModule.readBuffer(p109, var2284)
				var2284 = var2305
				var2283.entity_id = buffer.tostring(var2304)
			else
				local _ = nil
				local var2306, var2307 = protoModule.readVarInt(p109, var2284)
				var2284 = var2307 + var2306
			end
		elseif var2285 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2308, var2309 = protoModule.readFixed32(p109, var2284)
			local _ = var2308
			var2284 = var2309
		elseif var2285 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2310, var2311 = protoModule.readFixed64(p109, var2284)
			local _ = var2310
			var2284 = var2311
		else
			error("Unsupported wire type: " .. var2285)
		end
	end
	return var2283
end

function t_54:jsonEncode() --[[ line: 14242 ]]
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

function t_54:jsonDecode() --[[ line: 14276 ]]
	-- upvalues: t_54 (ref)
	local var2313 = t_54.new()
	
	if self.title ~= nil then
		var2313.title = self.title
	end
	if self.user_id ~= nil then
		var2313.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2313.user_id = self.userId
	end
	if self.description ~= nil then
		var2313.description = self.description
	end
	if self.cta_text ~= nil then
		var2313.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2313.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2313.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2313.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2313.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2313.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2313.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2313.entity_id = self.entityId
	end
	return var2313
end

t_54.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_54
typeRegistryModule.default:register(t.CardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p110) --[[ line: 14344 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p110 == nil or p110.prompt_id == nil then "" else p110.prompt_id,
		prompt_type = if p110 == nil or p110.prompt_type == nil then "" else p110.prompt_type,
		user_id = if p110 == nil or p110.user_id == nil then "" else p110.user_id,
		audit_data = if p110 == nil or p110.audit_data == nil then "" else p110.audit_data
	}, t_55)
end

function t_55:encode() --[[ line: 14353 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2315 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2316, var2317 = protoModule.writeTag(buff, var2315, 1, protoModule.wireTypes.lengthDelimited)
		var2316, var2317 = protoModule.writeString(var2316, var2317, self.prompt_id)
		buff = var2316
		var2315 = var2317
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2318, var2319 = protoModule.writeTag(buff, var2315, 2, protoModule.wireTypes.lengthDelimited)
		var2318, var2319 = protoModule.writeString(var2318, var2319, self.prompt_type)
		buff = var2318
		var2315 = var2319
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2320, var2321 = protoModule.writeTag(buff, var2315, 3, protoModule.wireTypes.lengthDelimited)
		var2320, var2321 = protoModule.writeString(var2320, var2321, self.user_id)
		buff = var2320
		var2315 = var2321
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var2322, var2323 = protoModule.writeTag(buff, var2315, 4, protoModule.wireTypes.lengthDelimited)
		var2322, var2323 = protoModule.writeString(var2322, var2323, self.audit_data)
		buff = var2322
		var2315 = var2323
	end
	local buff_1 = buffer.create(var2315)
	buffer.copy(buff_1, 0, buff, 0, var2315)
	
	return buff_1
end

function t_55.decode(p111) --[[ line: 14382 ]]
	-- upvalues: t_55 (ref), protoModule (ref)
	local var2325 = t_55.new()
	local var2326 = 0
	while var2326 < buffer.len(p111) do
		local _ = nil
		local var2327 = nil
		local var2328, var2329, var2330 = protoModule.readTag(p111, var2326)
		local var2331 = var2328
		var2327 = var2329
		var2326 = var2330
		
		if var2327 == protoModule.wireTypes.varint then
			local _ = nil
			local var2332, var2333 = protoModule.readVarInt(p111, var2326)
			local _ = var2332
			var2326 = var2333
			continue
		end
		if var2327 == protoModule.wireTypes.lengthDelimited then
			if var2331 == 1 then
				local _ = nil
				local var2334, var2335 = protoModule.readBuffer(p111, var2326)
				var2326 = var2335
				var2325.prompt_id = buffer.tostring(var2334)
			elseif var2331 == 2 then
				local _ = nil
				local var2336, var2337 = protoModule.readBuffer(p111, var2326)
				var2326 = var2337
				var2325.prompt_type = buffer.tostring(var2336)
			elseif var2331 == 3 then
				local _ = nil
				local var2338, var2339 = protoModule.readBuffer(p111, var2326)
				var2326 = var2339
				var2325.user_id = buffer.tostring(var2338)
			elseif var2331 == 4 then
				local _ = nil
				local var2340, var2341 = protoModule.readBuffer(p111, var2326)
				var2326 = var2341
				var2325.audit_data = buffer.tostring(var2340)
			else
				local _ = nil
				local var2342, var2343 = protoModule.readVarInt(p111, var2326)
				var2326 = var2343 + var2342
			end
		elseif var2327 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2344, var2345 = protoModule.readFixed32(p111, var2326)
			local _ = var2344
			var2326 = var2345
		elseif var2327 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2346, var2347 = protoModule.readFixed64(p111, var2326)
			local _ = var2346
			var2326 = var2347
		else
			error("Unsupported wire type: " .. var2327)
		end
	end
	return var2325
end

function t_55:jsonEncode() --[[ line: 14440 ]]
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

function t_55:jsonDecode() --[[ line: 14462 ]]
	-- upvalues: t_55 (ref)
	local var2349 = t_55.new()
	
	if self.prompt_id ~= nil then
		var2349.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2349.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2349.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2349.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var2349.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2349.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var2349.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var2349.audit_data = self.auditData
	end
	return var2349
end

t_55.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_55
typeRegistryModule.default:register(t.DialogInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p112) --[[ line: 14514 ]]
	-- upvalues: t_56 (ref)
	return setmetatable({
		sender_count = if p112 == nil or p112.sender_count == nil then 0 else p112.sender_count,
		total_robux_amount = if p112 == nil or p112.total_robux_amount == nil then 0 else p112.total_robux_amount
	}, t_56)
end

function t_56:encode() --[[ line: 14521 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2351 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var2352, var2353 = protoModule.writeTag(buff, var2351, 1, protoModule.wireTypes.varint)
		var2352, var2353 = protoModule.writeVarInt(var2352, var2353, self.sender_count)
		buff = var2352
		var2351 = var2353
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var2354, var2355 = protoModule.writeTag(buff, var2351, 2, protoModule.wireTypes.varint)
		var2354, var2355 = protoModule.writeVarInt(var2354, var2355, self.total_robux_amount)
		buff = var2354
		var2351 = var2355
	end
	local buff_1 = buffer.create(var2351)
	buffer.copy(buff_1, 0, buff, 0, var2351)
	
	return buff_1
end

function t_56.decode(p113) --[[ line: 14540 ]]
	-- upvalues: t_56 (ref), protoModule (ref)
	local var2357 = t_56.new()
	local var2358 = 0
	while var2358 < buffer.len(p113) do
		local _ = nil
		local _ = nil
		local var2359, var2360, var2361 = protoModule.readTag(p113, var2358)
		local var2362 = var2359
		local var2363 = var2360
		var2358 = var2361
		
		if var2363 == protoModule.wireTypes.varint then
			if var2362 == 1 then
				local _ = nil
				local var2364, var2365 = protoModule.readVarIntI32(p113, var2358)
				var2358 = var2365
				var2357.sender_count = var2364
			elseif var2362 == 2 then
				local _ = nil
				local var2366, var2367 = protoModule.readVarIntI64(p113, var2358)
				var2358 = var2367
				var2357.total_robux_amount = var2366
			else
				local _ = nil
				local var2368, var2369 = protoModule.readVarInt(p113, var2358)
				local _ = var2368
				var2358 = var2369
			end
		elseif var2363 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2370, var2371 = protoModule.readVarInt(p113, var2358)
			var2358 = var2371 + var2370
		elseif var2363 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2372, var2373 = protoModule.readFixed32(p113, var2358)
			local _ = var2372
			var2358 = var2373
		elseif var2363 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2374, var2375 = protoModule.readFixed64(p113, var2358)
			local _ = var2374
			var2358 = var2375
		else
			error("Unsupported wire type: " .. var2363)
		end
	end
	return var2357
end

function t_56:jsonEncode() --[[ line: 14588 ]]
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_56:jsonDecode() --[[ line: 14602 ]]
	-- upvalues: t_56 (ref)
	local var2377 = t_56.new()
	
	if self.sender_count ~= nil then
		var2377.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var2377.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var2377.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var2377.total_robux_amount = self.totalRobuxAmount
	end
	return var2377
end

t_56.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_56
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p114) --[[ line: 14638 ]]
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

function t_57:encode() --[[ line: 14651 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2379 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2380, var2381 = protoModule.writeTag(buff, var2379, 1, protoModule.wireTypes.lengthDelimited)
		var2380, var2381 = protoModule.writeString(var2380, var2381, self.title)
		buff = var2380
		var2379 = var2381
	end
	if self.description ~= nil and self.description ~= "" then
		local var2382, var2383 = protoModule.writeTag(buff, var2379, 2, protoModule.wireTypes.lengthDelimited)
		var2382, var2383 = protoModule.writeString(var2382, var2383, self.description)
		buff = var2382
		var2379 = var2383
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var2384, var2385 = protoModule.writeTag(buff, var2379, 3, protoModule.wireTypes.lengthDelimited)
		var2384, var2385 = protoModule.writeString(var2384, var2385, self.primary_text)
		buff = var2384
		var2379 = var2385
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var2386, var2387 = protoModule.writeTag(buff, var2379, 4, protoModule.wireTypes.lengthDelimited)
		var2386, var2387 = protoModule.writeString(var2386, var2387, self.secondary_text)
		buff = var2386
		var2379 = var2387
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2388, var2389 = protoModule.writeTag(buff, var2379, 5, protoModule.wireTypes.lengthDelimited)
		var2388, var2389 = protoModule.writeString(var2388, var2389, self.prompt_id)
		buff = var2388
		var2379 = var2389
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2390, var2391 = protoModule.writeTag(buff, var2379, 6, protoModule.wireTypes.lengthDelimited)
		var2390, var2391 = protoModule.writeString(var2390, var2391, self.prompt_type)
		buff = var2390
		var2379 = var2391
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var2392, var2393 = protoModule.writeTag(buff, var2379, 7, protoModule.wireTypes.varint)
		var2392, var2393 = protoModule.writeVarInt(var2392, var2393, self.times_seen)
		buff = var2392
		var2379 = var2393
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var2394 = self.content.value:encode()
		local var2395, var2396 = protoModule.writeTag(buff, var2379, 8, protoModule.wireTypes.lengthDelimited)
		var2395, var2396 = protoModule.writeBuffer(var2395, var2396, var2394, buffer.len(var2394))
		buff = var2395
		var2379 = var2396
	end
	local buff_1 = buffer.create(var2379)
	buffer.copy(buff_1, 0, buff, 0, var2379)
	
	return buff_1
end

function t_57.decode(p115) --[[ line: 14703 ]]
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var2398 = t_57.new()
	local var2399 = 0
	while var2399 < buffer.len(p115) do
		local _ = nil
		local var2400 = nil
		local var2401, var2402, var2403 = protoModule.readTag(p115, var2399)
		local var2404 = var2401
		var2400 = var2402
		var2399 = var2403
		
		if var2400 == protoModule.wireTypes.varint then
			if var2404 == 7 then
				local _ = nil
				local var2405, var2406 = protoModule.readVarIntI32(p115, var2399)
				var2399 = var2406
				var2398.times_seen = var2405
			else
				local _ = nil
				local var2407, var2408 = protoModule.readVarInt(p115, var2399)
				local _ = var2407
				var2399 = var2408
			end
		end
		if var2400 == protoModule.wireTypes.lengthDelimited then
			if var2404 == 1 then
				local _ = nil
				local var2409, var2410 = protoModule.readBuffer(p115, var2399)
				var2399 = var2410
				var2398.title = buffer.tostring(var2409)
			elseif var2404 == 2 then
				local _ = nil
				local var2411, var2412 = protoModule.readBuffer(p115, var2399)
				var2399 = var2412
				var2398.description = buffer.tostring(var2411)
			elseif var2404 == 3 then
				local _ = nil
				local var2413, var2414 = protoModule.readBuffer(p115, var2399)
				var2399 = var2414
				var2398.primary_text = buffer.tostring(var2413)
			elseif var2404 == 4 then
				local _ = nil
				local var2415, var2416 = protoModule.readBuffer(p115, var2399)
				var2399 = var2416
				var2398.secondary_text = buffer.tostring(var2415)
			elseif var2404 == 5 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p115, var2399)
				var2399 = var2418
				var2398.prompt_id = buffer.tostring(var2417)
			elseif var2404 == 6 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p115, var2399)
				var2399 = var2420
				var2398.prompt_type = buffer.tostring(var2419)
			elseif var2404 == 8 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p115, var2399)
				var2399 = var2422
				var2398.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var2421)
				}
			else
				local _ = nil
				local var2423, var2424 = protoModule.readVarInt(p115, var2399)
				var2399 = var2424 + var2423
			end
		elseif var2400 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2425, var2426 = protoModule.readFixed32(p115, var2399)
			local _ = var2425
			var2399 = var2426
		elseif var2400 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2427, var2428 = protoModule.readFixed64(p115, var2399)
			local _ = var2427
			var2399 = var2428
		else
			error("Unsupported wire type: " .. var2400)
		end
	end
	return var2398
end

function t_57:jsonEncode() --[[ line: 14782 ]]
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

function t_57:jsonDecode() --[[ line: 14822 ]]
	-- upvalues: t_57 (ref), t (ref)
	local var2430 = t_57.new()
	
	if self.title ~= nil then
		var2430.title = self.title
	end
	if self.description ~= nil then
		var2430.description = self.description
	end
	if self.primary_text ~= nil then
		var2430.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var2430.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var2430.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var2430.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var2430.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2430.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2430.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2430.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var2430.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var2430.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var2430.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var2430.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var2430
end

t_57.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_57
typeRegistryModule.default:register(t.BannerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p116) --[[ line: 14904 ]]
	-- upvalues: t_58 (ref)
	return setmetatable({
		tooltip_text = if p116 == nil or p116.tooltip_text == nil then "" else p116.tooltip_text,
		prompt_id = if p116 == nil or p116.prompt_id == nil then "" else p116.prompt_id,
		prompt_type = if p116 == nil or p116.prompt_type == nil then "" else p116.prompt_type
	}, t_58)
end

function t_58:encode() --[[ line: 14912 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2432 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var2433, var2434 = protoModule.writeTag(buff, var2432, 1, protoModule.wireTypes.lengthDelimited)
		var2433, var2434 = protoModule.writeString(var2433, var2434, self.tooltip_text)
		buff = var2433
		var2432 = var2434
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2435, var2436 = protoModule.writeTag(buff, var2432, 2, protoModule.wireTypes.lengthDelimited)
		var2435, var2436 = protoModule.writeString(var2435, var2436, self.prompt_id)
		buff = var2435
		var2432 = var2436
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2437, var2438 = protoModule.writeTag(buff, var2432, 3, protoModule.wireTypes.lengthDelimited)
		var2437, var2438 = protoModule.writeString(var2437, var2438, self.prompt_type)
		buff = var2437
		var2432 = var2438
	end
	local buff_1 = buffer.create(var2432)
	buffer.copy(buff_1, 0, buff, 0, var2432)
	
	return buff_1
end

function t_58.decode(p117) --[[ line: 14936 ]]
	-- upvalues: t_58 (ref), protoModule (ref)
	local var2440 = t_58.new()
	local var2441 = 0
	while var2441 < buffer.len(p117) do
		local _ = nil
		local var2442 = nil
		local var2443, var2444, var2445 = protoModule.readTag(p117, var2441)
		local var2446 = var2443
		var2442 = var2444
		var2441 = var2445
		
		if var2442 == protoModule.wireTypes.varint then
			local _ = nil
			local var2447, var2448 = protoModule.readVarInt(p117, var2441)
			local _ = var2447
			var2441 = var2448
			continue
		end
		if var2442 == protoModule.wireTypes.lengthDelimited then
			if var2446 == 1 then
				local _ = nil
				local var2449, var2450 = protoModule.readBuffer(p117, var2441)
				var2441 = var2450
				var2440.tooltip_text = buffer.tostring(var2449)
			elseif var2446 == 2 then
				local _ = nil
				local var2451, var2452 = protoModule.readBuffer(p117, var2441)
				var2441 = var2452
				var2440.prompt_id = buffer.tostring(var2451)
			elseif var2446 == 3 then
				local _ = nil
				local var2453, var2454 = protoModule.readBuffer(p117, var2441)
				var2441 = var2454
				var2440.prompt_type = buffer.tostring(var2453)
			else
				local _ = nil
				local var2455, var2456 = protoModule.readVarInt(p117, var2441)
				var2441 = var2456 + var2455
			end
		elseif var2442 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2457, var2458 = protoModule.readFixed32(p117, var2441)
			local _ = var2457
			var2441 = var2458
		elseif var2442 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2459, var2460 = protoModule.readFixed64(p117, var2441)
			local _ = var2459
			var2441 = var2460
		else
			error("Unsupported wire type: " .. var2442)
		end
	end
	return var2440
end

function t_58:jsonEncode() --[[ line: 14989 ]]
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

function t_58:jsonDecode() --[[ line: 15007 ]]
	-- upvalues: t_58 (ref)
	local var2462 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var2462.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var2462.tooltip_text = self.tooltipText
	end
	if self.prompt_id ~= nil then
		var2462.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2462.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2462.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2462.prompt_type = self.promptType
	end
	return var2462
end

t_58.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_58
typeRegistryModule.default:register(t.TooltipInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p118) --[[ line: 15051 ]]
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

function t_59:encode() --[[ line: 15062 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2464 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var2465, var2466 = protoModule.writeTag(buff, var2464, 1, protoModule.wireTypes.lengthDelimited)
		var2465, var2466 = protoModule.writeString(var2465, var2466, self.media_id)
		buff = var2465
		var2464 = var2466
	end
	if self.title ~= nil and self.title ~= "" then
		local var2467, var2468 = protoModule.writeTag(buff, var2464, 2, protoModule.wireTypes.lengthDelimited)
		var2467, var2468 = protoModule.writeString(var2467, var2468, self.title)
		buff = var2467
		var2464 = var2468
	end
	if self.description ~= nil and self.description ~= "" then
		local var2469, var2470 = protoModule.writeTag(buff, var2464, 3, protoModule.wireTypes.lengthDelimited)
		var2469, var2470 = protoModule.writeString(var2469, var2470, self.description)
		buff = var2469
		var2464 = var2470
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2471, var2472 = protoModule.writeTag(buff, var2464, 4, protoModule.wireTypes.lengthDelimited)
		var2471, var2472 = protoModule.writeString(var2471, var2472, self.prompt_id)
		buff = var2471
		var2464 = var2472
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2473, var2474 = protoModule.writeTag(buff, var2464, 5, protoModule.wireTypes.lengthDelimited)
		var2473, var2474 = protoModule.writeString(var2473, var2474, self.prompt_type)
		buff = var2473
		var2464 = var2474
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var2475, var2476 = protoModule.writeTag(buff, var2464, 6, protoModule.wireTypes.lengthDelimited)
		var2475, var2476 = protoModule.writeString(var2475, var2476, self.anchor_tag)
		buff = var2475
		var2464 = var2476
	end
	local buff_1 = buffer.create(var2464)
	buffer.copy(buff_1, 0, buff, 0, var2464)
	
	return buff_1
end

function t_59.decode(p119) --[[ line: 15101 ]]
	-- upvalues: t_59 (ref), protoModule (ref)
	local var2478 = t_59.new()
	local var2479 = 0
	while var2479 < buffer.len(p119) do
		local _ = nil
		local var2480 = nil
		local var2481, var2482, var2483 = protoModule.readTag(p119, var2479)
		local var2484 = var2481
		var2480 = var2482
		var2479 = var2483
		
		if var2480 == protoModule.wireTypes.varint then
			local _ = nil
			local var2485, var2486 = protoModule.readVarInt(p119, var2479)
			local _ = var2485
			var2479 = var2486
			continue
		end
		if var2480 == protoModule.wireTypes.lengthDelimited then
			if var2484 == 1 then
				local _ = nil
				local var2487, var2488 = protoModule.readBuffer(p119, var2479)
				var2479 = var2488
				var2478.media_id = buffer.tostring(var2487)
			elseif var2484 == 2 then
				local _ = nil
				local var2489, var2490 = protoModule.readBuffer(p119, var2479)
				var2479 = var2490
				var2478.title = buffer.tostring(var2489)
			elseif var2484 == 3 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p119, var2479)
				var2479 = var2492
				var2478.description = buffer.tostring(var2491)
			elseif var2484 == 4 then
				local _ = nil
				local var2493, var2494 = protoModule.readBuffer(p119, var2479)
				var2479 = var2494
				var2478.prompt_id = buffer.tostring(var2493)
			elseif var2484 == 5 then
				local _ = nil
				local var2495, var2496 = protoModule.readBuffer(p119, var2479)
				var2479 = var2496
				var2478.prompt_type = buffer.tostring(var2495)
			elseif var2484 == 6 then
				local _ = nil
				local var2497, var2498 = protoModule.readBuffer(p119, var2479)
				var2479 = var2498
				var2478.anchor_tag = buffer.tostring(var2497)
			else
				local _ = nil
				local var2499, var2500 = protoModule.readVarInt(p119, var2479)
				var2479 = var2500 + var2499
			end
		elseif var2480 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2501, var2502 = protoModule.readFixed32(p119, var2479)
			local _ = var2501
			var2479 = var2502
		elseif var2480 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2503, var2504 = protoModule.readFixed64(p119, var2479)
			local _ = var2503
			var2479 = var2504
		else
			error("Unsupported wire type: " .. var2480)
		end
	end
	return var2478
end

function t_59:jsonEncode() --[[ line: 15169 ]]
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

function t_59:jsonDecode() --[[ line: 15199 ]]
	-- upvalues: t_59 (ref)
	local var2506 = t_59.new()
	
	if self.media_id ~= nil then
		var2506.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var2506.media_id = self.mediaId
	end
	if self.title ~= nil then
		var2506.title = self.title
	end
	if self.description ~= nil then
		var2506.description = self.description
	end
	if self.prompt_id ~= nil then
		var2506.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2506.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2506.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2506.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var2506.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var2506.anchor_tag = self.anchorTag
	end
	return var2506
end

t_59.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_59
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p120) --[[ line: 15259 ]]
	-- upvalues: t_60 (ref)
	return setmetatable({
		prompt_id = if p120 == nil or p120.prompt_id == nil then "" else p120.prompt_id,
		prompt_type = if p120 == nil or p120.prompt_type == nil then "" else p120.prompt_type
	}, t_60)
end

function t_60:encode() --[[ line: 15266 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2508 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2509, var2510 = protoModule.writeTag(buff, var2508, 1, protoModule.wireTypes.lengthDelimited)
		var2509, var2510 = protoModule.writeString(var2509, var2510, self.prompt_id)
		buff = var2509
		var2508 = var2510
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2511, var2512 = protoModule.writeTag(buff, var2508, 2, protoModule.wireTypes.lengthDelimited)
		var2511, var2512 = protoModule.writeString(var2511, var2512, self.prompt_type)
		buff = var2511
		var2508 = var2512
	end
	local buff_1 = buffer.create(var2508)
	buffer.copy(buff_1, 0, buff, 0, var2508)
	
	return buff_1
end

function t_60.decode(p121) --[[ line: 15285 ]]
	-- upvalues: t_60 (ref), protoModule (ref)
	local var2514 = t_60.new()
	local var2515 = 0
	while var2515 < buffer.len(p121) do
		local _ = nil
		local var2516 = nil
		local var2517, var2518, var2519 = protoModule.readTag(p121, var2515)
		local var2520 = var2517
		var2516 = var2518
		var2515 = var2519
		
		if var2516 == protoModule.wireTypes.varint then
			local _ = nil
			local var2521, var2522 = protoModule.readVarInt(p121, var2515)
			local _ = var2521
			var2515 = var2522
			continue
		end
		if var2516 == protoModule.wireTypes.lengthDelimited then
			if var2520 == 1 then
				local _ = nil
				local var2523, var2524 = protoModule.readBuffer(p121, var2515)
				var2515 = var2524
				var2514.prompt_id = buffer.tostring(var2523)
			elseif var2520 == 2 then
				local _ = nil
				local var2525, var2526 = protoModule.readBuffer(p121, var2515)
				var2515 = var2526
				var2514.prompt_type = buffer.tostring(var2525)
			else
				local _ = nil
				local var2527, var2528 = protoModule.readVarInt(p121, var2515)
				var2515 = var2528 + var2527
			end
		elseif var2516 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2529, var2530 = protoModule.readFixed32(p121, var2515)
			local _ = var2529
			var2515 = var2530
		elseif var2516 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2531, var2532 = protoModule.readFixed64(p121, var2515)
			local _ = var2531
			var2515 = var2532
		else
			error("Unsupported wire type: " .. var2516)
		end
	end
	return var2514
end

function t_60:jsonEncode() --[[ line: 15333 ]]
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_60:jsonDecode() --[[ line: 15347 ]]
	-- upvalues: t_60 (ref)
	local var2534 = t_60.new()
	
	if self.prompt_id ~= nil then
		var2534.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2534.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2534.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2534.prompt_type = self.promptType
	end
	return var2534
end

t_60.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_60
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p122) --[[ line: 15383 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		upsell_prompt = if p122 == nil or p122.upsell_prompt == nil then "" else p122.upsell_prompt
	}, t_61)
end

function t_61:encode() --[[ line: 15389 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2536 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2537, var2538 = protoModule.writeTag(buff, var2536, 1, protoModule.wireTypes.lengthDelimited)
		var2537, var2538 = protoModule.writeString(var2537, var2538, self.upsell_prompt)
		buff = var2537
		var2536 = var2538
	end
	local buff_1 = buffer.create(var2536)
	buffer.copy(buff_1, 0, buff, 0, var2536)
	
	return buff_1
end

function t_61.decode(p123) --[[ line: 15403 ]]
	-- upvalues: t_61 (ref), protoModule (ref)
	local var2540 = t_61.new()
	local var2541 = 0
	while var2541 < buffer.len(p123) do
		local _ = nil
		local var2542 = nil
		local var2543, var2544, var2545 = protoModule.readTag(p123, var2541)
		local var2546 = var2543
		var2542 = var2544
		var2541 = var2545
		
		if var2542 == protoModule.wireTypes.varint then
			local _ = nil
			local var2547, var2548 = protoModule.readVarInt(p123, var2541)
			local _ = var2547
			var2541 = var2548
			continue
		end
		if var2542 == protoModule.wireTypes.lengthDelimited then
			if var2546 == 1 then
				local _ = nil
				local var2549, var2550 = protoModule.readBuffer(p123, var2541)
				var2541 = var2550
				var2540.upsell_prompt = buffer.tostring(var2549)
			else
				local _ = nil
				local var2551, var2552 = protoModule.readVarInt(p123, var2541)
				var2541 = var2552 + var2551
			end
		elseif var2542 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2553, var2554 = protoModule.readFixed32(p123, var2541)
			local _ = var2553
			var2541 = var2554
		elseif var2542 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2555, var2556 = protoModule.readFixed64(p123, var2541)
			local _ = var2555
			var2541 = var2556
		else
			error("Unsupported wire type: " .. var2542)
		end
	end
	return var2540
end

function t_61:jsonEncode() --[[ line: 15446 ]]
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_61:jsonDecode() --[[ line: 15456 ]]
	-- upvalues: t_61 (ref)
	local var2558 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var2558.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var2558.upsell_prompt = self.upsellPrompt
	end
	return var2558
end

t_61.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_61
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p124) --[[ line: 15484 ]]
	-- upvalues: t_62 (ref)
	return setmetatable({
		modal_variant = if p124 == nil or p124.modal_variant == nil then "" else p124.modal_variant,
		modal_sequence = if p124 == nil or p124.modal_sequence == nil then "" else p124.modal_sequence,
		conversation_id = if p124 == nil or p124.conversation_id == nil then "" else p124.conversation_id,
		friend_id = if p124 == nil or p124.friend_id == nil then "" else p124.friend_id
	}, t_62)
end

function t_62:encode() --[[ line: 15495 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2560 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2561, var2562 = protoModule.writeTag(buff, var2560, 1, protoModule.wireTypes.lengthDelimited)
		var2561, var2562 = protoModule.writeString(var2561, var2562, self.modal_variant)
		buff = var2561
		var2560 = var2562
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var2563, var2564 = protoModule.writeTag(buff, var2560, 2, protoModule.wireTypes.lengthDelimited)
		var2563, var2564 = protoModule.writeString(var2563, var2564, self.modal_sequence)
		buff = var2563
		var2560 = var2564
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var2565, var2566 = protoModule.writeTag(buff, var2560, 3, protoModule.wireTypes.lengthDelimited)
		var2565, var2566 = protoModule.writeString(var2565, var2566, self.conversation_id)
		buff = var2565
		var2560 = var2566
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var2567, var2568 = protoModule.writeTag(buff, var2560, 4, protoModule.wireTypes.lengthDelimited)
		var2567, var2568 = protoModule.writeString(var2567, var2568, self.friend_id)
		buff = var2567
		var2560 = var2568
	end
	local buff_1 = buffer.create(var2560)
	buffer.copy(buff_1, 0, buff, 0, var2560)
	
	return buff_1
end

function t_62.decode(p125) --[[ line: 15524 ]]
	-- upvalues: t_62 (ref), protoModule (ref)
	local var2570 = t_62.new()
	local var2571 = 0
	while var2571 < buffer.len(p125) do
		local _ = nil
		local var2572 = nil
		local var2573, var2574, var2575 = protoModule.readTag(p125, var2571)
		local var2576 = var2573
		var2572 = var2574
		var2571 = var2575
		
		if var2572 == protoModule.wireTypes.varint then
			local _ = nil
			local var2577, var2578 = protoModule.readVarInt(p125, var2571)
			local _ = var2577
			var2571 = var2578
			continue
		end
		if var2572 == protoModule.wireTypes.lengthDelimited then
			if var2576 == 1 then
				local _ = nil
				local var2579, var2580 = protoModule.readBuffer(p125, var2571)
				var2571 = var2580
				var2570.modal_variant = buffer.tostring(var2579)
			elseif var2576 == 2 then
				local _ = nil
				local var2581, var2582 = protoModule.readBuffer(p125, var2571)
				var2571 = var2582
				var2570.modal_sequence = buffer.tostring(var2581)
			elseif var2576 == 3 then
				local _ = nil
				local var2583, var2584 = protoModule.readBuffer(p125, var2571)
				var2571 = var2584
				var2570.conversation_id = buffer.tostring(var2583)
			elseif var2576 == 4 then
				local _ = nil
				local var2585, var2586 = protoModule.readBuffer(p125, var2571)
				var2571 = var2586
				var2570.friend_id = buffer.tostring(var2585)
			else
				local _ = nil
				local var2587, var2588 = protoModule.readVarInt(p125, var2571)
				var2571 = var2588 + var2587
			end
		elseif var2572 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2589, var2590 = protoModule.readFixed32(p125, var2571)
			local _ = var2589
			var2571 = var2590
		elseif var2572 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2591, var2592 = protoModule.readFixed64(p125, var2571)
			local _ = var2591
			var2571 = var2592
		else
			error("Unsupported wire type: " .. var2572)
		end
	end
	return var2570
end

function t_62:jsonEncode() --[[ line: 15582 ]]
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

function t_62:jsonDecode() --[[ line: 15604 ]]
	-- upvalues: t_62 (ref)
	local var2594 = t_62.new()
	
	if self.modal_variant ~= nil then
		var2594.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var2594.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var2594.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var2594.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var2594.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var2594.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var2594.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var2594.friend_id = self.friendId
	end
	return var2594
end

t_62.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_62
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p126) --[[ line: 15658 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p126 == nil or p126.event_id == nil then "" else p126.event_id,
		universe_id = if p126 == nil or p126.universe_id == nil then "" else p126.universe_id,
		entry_map = if p126 == nil or p126.entry_map == nil then {} else p126.entry_map,
		entry_order = if p126 == nil or p126.entry_order == nil then {} else p126.entry_order
	}, t_63)
end

function t_63:encode() --[[ line: 15669 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2596 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2597, var2598 = protoModule.writeTag(buff, var2596, 1, protoModule.wireTypes.lengthDelimited)
		var2597, var2598 = protoModule.writeString(var2597, var2598, self.event_id)
		buff = var2597
		var2596 = var2598
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2599, var2600 = protoModule.writeTag(buff, var2596, 2, protoModule.wireTypes.lengthDelimited)
		var2599, var2600 = protoModule.writeString(var2599, var2600, self.universe_id)
		buff = var2599
		var2596 = var2600
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2601, var2602 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2601, var2602 = protoModule.writeString(var2601, var2602, i)
			local var2603 = v:encode()
			var2602, var2604 = protoModule.writeTag(var2601, var2602, 2, protoModule.wireTypes.lengthDelimited)
			var2602, var2604 = protoModule.writeBuffer(var2602, var2604, var2603, buffer.len(var2603))
			local var2605 = var2602
			local var2606 = var2604
			local var2607, var2608 = protoModule.writeTag(buff, var2596, 3, protoModule.wireTypes.lengthDelimited)
			var2607, var2608 = protoModule.writeBuffer(var2607, var2608, var2605, var2606)
			buff = var2607
			var2596 = var2608
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2609, var2610 = protoModule.writeTag(buff, var2596, 4, protoModule.wireTypes.lengthDelimited)
			var2609, var2610 = protoModule.writeString(var2609, var2610, v)
			buff = var2609
			var2596 = var2610
		end
	end
	local buff_1 = buffer.create(var2596)
	buffer.copy(buff_1, 0, buff, 0, var2596)
	
	return buff_1
end

function t_63.decode(p127) --[[ line: 15709 ]]
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2612 = t_63.new()
	local var2613 = 0
	while var2613 < buffer.len(p127) do
		local _ = nil
		local var2614 = nil
		local var2615, var2616, var2617 = protoModule.readTag(p127, var2613)
		local var2618 = var2615
		var2614 = var2616
		var2613 = var2617
		
		if var2614 == protoModule.wireTypes.varint then
			local _ = nil
			local var2619, var2620 = protoModule.readVarInt(p127, var2613)
			local _ = var2619
			var2613 = var2620
			continue
		end
		if var2614 == protoModule.wireTypes.lengthDelimited then
			if var2618 == 1 then
				local _ = nil
				local var2621, var2622 = protoModule.readBuffer(p127, var2613)
				var2613 = var2622
				var2612.event_id = buffer.tostring(var2621)
			elseif var2618 == 2 then
				local _ = nil
				local var2623, var2624 = protoModule.readBuffer(p127, var2613)
				var2613 = var2624
				var2612.universe_id = buffer.tostring(var2623)
			elseif var2618 == 3 then
				local _ = nil
				local var2625, var2626 = protoModule.readBuffer(p127, var2613)
				var2613 = var2626
				var2625 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var2625)
				var2612.entry_map[var2625.key or ""] = var2625.value or t.FeedEntry.new()
			elseif var2618 == 4 then
				local _ = nil
				local var2627, var2628 = protoModule.readBuffer(p127, var2613)
				var2613 = var2628
				table.insert(var2612.entry_order, buffer.tostring(var2627))
			else
				local _ = nil
				local var2629, var2630 = protoModule.readVarInt(p127, var2613)
				var2613 = var2630 + var2629
			end
		elseif var2614 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2631, var2632 = protoModule.readFixed32(p127, var2613)
			local _ = var2631
			var2613 = var2632
		elseif var2614 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2633, var2634 = protoModule.readFixed64(p127, var2613)
			local _ = var2633
			var2613 = var2634
		else
			error("Unsupported wire type: " .. var2614)
		end
	end
	return var2612
end

function t_63:jsonEncode() --[[ line: 15774 ]]
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

function t_63:jsonDecode() --[[ line: 15804 ]]
	-- upvalues: t_63 (ref), t (ref)
	local var2638 = t_63.new()
	
	if self.event_id ~= nil then
		var2638.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2638.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2638.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2638.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2638.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2638.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2638.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2638.entry_order = t_1
	end
	return var2638
end

t_63.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_63
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p128) --[[ line: 15876 ]]
	-- upvalues: t_64 (ref)
	return setmetatable({
		key = if p128 == nil or p128.key == nil then "" else p128.key,
		value = if p128 == nil or p128.value == nil then nil else p128.value
	}, t_64)
end

function t_64:encode() --[[ line: 15885 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2644 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2645, var2646 = protoModule.writeTag(buff, var2644, 1, protoModule.wireTypes.lengthDelimited)
		var2645, var2646 = protoModule.writeString(var2645, var2646, self.key)
		buff = var2645
		var2644 = var2646
	end
	if self.value ~= nil then
		local var2647 = self.value:encode()
		local var2648, var2649 = protoModule.writeTag(buff, var2644, 2, protoModule.wireTypes.lengthDelimited)
		var2648, var2649 = protoModule.writeBuffer(var2648, var2649, var2647, buffer.len(var2647))
		buff = var2648
		var2644 = var2649
	end
	local buff_1 = buffer.create(var2644)
	buffer.copy(buff_1, 0, buff, 0, var2644)
	
	return buff_1
end

function t_64.decode(p129) --[[ line: 15905 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2651 = t_64.new()
	local var2652 = 0
	while var2652 < buffer.len(p129) do
		local _ = nil
		local var2653 = nil
		local var2654, var2655, var2656 = protoModule.readTag(p129, var2652)
		local var2657 = var2654
		var2653 = var2655
		var2652 = var2656
		
		if var2653 == protoModule.wireTypes.varint then
			local _ = nil
			local var2658, var2659 = protoModule.readVarInt(p129, var2652)
			local _ = var2658
			var2652 = var2659
			continue
		end
		if var2653 == protoModule.wireTypes.lengthDelimited then
			if var2657 == 1 then
				local _ = nil
				local var2660, var2661 = protoModule.readBuffer(p129, var2652)
				var2652 = var2661
				var2651.key = buffer.tostring(var2660)
			elseif var2657 == 2 then
				local _ = nil
				local var2662, var2663 = protoModule.readBuffer(p129, var2652)
				var2652 = var2663
				var2651.value = t.FeedEntry.decode(var2662)
			else
				local _ = nil
				local var2664, var2665 = protoModule.readVarInt(p129, var2652)
				var2652 = var2665 + var2664
			end
		elseif var2653 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2666, var2667 = protoModule.readFixed32(p129, var2652)
			local _ = var2666
			var2652 = var2667
		elseif var2653 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2668, var2669 = protoModule.readFixed64(p129, var2652)
			local _ = var2668
			var2652 = var2669
		else
			error("Unsupported wire type: " .. var2653)
		end
	end
	return var2651
end

function t_64:jsonEncode() --[[ line: 15953 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_64:jsonDecode() --[[ line: 15967 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2671 = t_64.new()
	
	if self.key ~= nil then
		var2671.key = self.key
	end
	if self.value ~= nil then
		var2671.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2671
end

t_64.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_64
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p130) --[[ line: 15997 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p130 == nil or p130.event_id == nil then "" else p130.event_id,
		universe_id = if p130 == nil or p130.universe_id == nil then "" else p130.universe_id
	}, t_65)
end

function t_65:encode() --[[ line: 16006 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2673 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2674, var2675 = protoModule.writeTag(buff, var2673, 1, protoModule.wireTypes.lengthDelimited)
		var2674, var2675 = protoModule.writeString(var2674, var2675, self.event_id)
		buff = var2674
		var2673 = var2675
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2676, var2677 = protoModule.writeTag(buff, var2673, 2, protoModule.wireTypes.lengthDelimited)
		var2676, var2677 = protoModule.writeString(var2676, var2677, self.universe_id)
		buff = var2676
		var2673 = var2677
	end
	local buff_1 = buffer.create(var2673)
	buffer.copy(buff_1, 0, buff, 0, var2673)
	
	return buff_1
end

function t_65.decode(p131) --[[ line: 16025 ]]
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2679 = t_65.new()
	local var2680 = 0
	while var2680 < buffer.len(p131) do
		local _ = nil
		local var2681 = nil
		local var2682, var2683, var2684 = protoModule.readTag(p131, var2680)
		local var2685 = var2682
		var2681 = var2683
		var2680 = var2684
		
		if var2681 == protoModule.wireTypes.varint then
			local _ = nil
			local var2686, var2687 = protoModule.readVarInt(p131, var2680)
			local _ = var2686
			var2680 = var2687
			continue
		end
		if var2681 == protoModule.wireTypes.lengthDelimited then
			if var2685 == 1 then
				local _ = nil
				local var2688, var2689 = protoModule.readBuffer(p131, var2680)
				var2680 = var2689
				var2679.event_id = buffer.tostring(var2688)
			elseif var2685 == 2 then
				local _ = nil
				local var2690, var2691 = protoModule.readBuffer(p131, var2680)
				var2680 = var2691
				var2679.universe_id = buffer.tostring(var2690)
			else
				local _ = nil
				local var2692, var2693 = protoModule.readVarInt(p131, var2680)
				var2680 = var2693 + var2692
			end
		elseif var2681 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2694, var2695 = protoModule.readFixed32(p131, var2680)
			local _ = var2694
			var2680 = var2695
		elseif var2681 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2696, var2697 = protoModule.readFixed64(p131, var2680)
			local _ = var2696
			var2680 = var2697
		else
			error("Unsupported wire type: " .. var2681)
		end
	end
	return var2679
end

function t_65:jsonEncode() --[[ line: 16073 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_65:jsonDecode() --[[ line: 16087 ]]
	-- upvalues: t_65 (ref)
	local var2699 = t_65.new()
	
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
	return var2699
end

t_65.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_65
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p132) --[[ line: 16123 ]]
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p132 == nil or p132.event_id == nil then "" else p132.event_id
	}, t_66)
end

function t_66:encode() --[[ line: 16131 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2701 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2702, var2703 = protoModule.writeTag(buff, var2701, 1, protoModule.wireTypes.lengthDelimited)
		var2702, var2703 = protoModule.writeString(var2702, var2703, self.event_id)
		buff = var2702
		var2701 = var2703
	end
	local buff_1 = buffer.create(var2701)
	buffer.copy(buff_1, 0, buff, 0, var2701)
	
	return buff_1
end

function t_66.decode(p133) --[[ line: 16145 ]]
	-- upvalues: t_66 (ref), protoModule (ref)
	local var2705 = t_66.new()
	local var2706 = 0
	while var2706 < buffer.len(p133) do
		local _ = nil
		local var2707 = nil
		local var2708, var2709, var2710 = protoModule.readTag(p133, var2706)
		local var2711 = var2708
		var2707 = var2709
		var2706 = var2710
		
		if var2707 == protoModule.wireTypes.varint then
			local _ = nil
			local var2712, var2713 = protoModule.readVarInt(p133, var2706)
			local _ = var2712
			var2706 = var2713
			continue
		end
		if var2707 == protoModule.wireTypes.lengthDelimited then
			if var2711 == 1 then
				local _ = nil
				local var2714, var2715 = protoModule.readBuffer(p133, var2706)
				var2706 = var2715
				var2705.event_id = buffer.tostring(var2714)
			else
				local _ = nil
				local var2716, var2717 = protoModule.readVarInt(p133, var2706)
				var2706 = var2717 + var2716
			end
		elseif var2707 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2718, var2719 = protoModule.readFixed32(p133, var2706)
			local _ = var2718
			var2706 = var2719
		elseif var2707 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2720, var2721 = protoModule.readFixed64(p133, var2706)
			local _ = var2720
			var2706 = var2721
		else
			error("Unsupported wire type: " .. var2707)
		end
	end
	return var2705
end

function t_66:jsonEncode() --[[ line: 16188 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_66:jsonDecode() --[[ line: 16198 ]]
	-- upvalues: t_66 (ref)
	local var2723 = t_66.new()
	
	if self.event_id ~= nil then
		var2723.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2723.event_id = self.eventId
	end
	return var2723
end

t_66.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_66
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p134) --[[ line: 16226 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p134 == nil or p134.event_id == nil then "" else p134.event_id,
		universe_id = if p134 == nil or p134.universe_id == nil then "" else p134.universe_id,
		rsvp_users = if p134 == nil or p134.rsvp_users == nil then {} else p134.rsvp_users
	}, t_67)
end

function t_67:encode() --[[ line: 16236 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2725 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2726, var2727 = protoModule.writeTag(buff, var2725, 1, protoModule.wireTypes.lengthDelimited)
		var2726, var2727 = protoModule.writeString(var2726, var2727, self.event_id)
		buff = var2726
		var2725 = var2727
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2728, var2729 = protoModule.writeTag(buff, var2725, 2, protoModule.wireTypes.lengthDelimited)
		var2728, var2729 = protoModule.writeString(var2728, var2729, self.universe_id)
		buff = var2728
		var2725 = var2729
	end
	if self.rsvp_users ~= nil and #self.rsvp_users > 0 then
		for i, v in self.rsvp_users do
			local var2730 = v:encode()
			local var2731, var2732 = protoModule.writeTag(buff, var2725, 3, protoModule.wireTypes.lengthDelimited)
			var2731, var2732 = protoModule.writeBuffer(var2731, var2732, var2730, buffer.len(var2730))
			buff = var2731
			var2725 = var2732
		end
	end
	local buff_1 = buffer.create(var2725)
	buffer.copy(buff_1, 0, buff, 0, var2725)
	
	return buff_1
end

function t_67.decode(p135) --[[ line: 16263 ]]
	-- upvalues: t_67 (ref), protoModule (ref), t (ref)
	local var2734 = t_67.new()
	local var2735 = 0
	while var2735 < buffer.len(p135) do
		local _ = nil
		local var2736 = nil
		local var2737, var2738, var2739 = protoModule.readTag(p135, var2735)
		local var2740 = var2737
		var2736 = var2738
		var2735 = var2739
		
		if var2736 == protoModule.wireTypes.varint then
			local _ = nil
			local var2741, var2742 = protoModule.readVarInt(p135, var2735)
			local _ = var2741
			var2735 = var2742
			continue
		end
		if var2736 == protoModule.wireTypes.lengthDelimited then
			if var2740 == 1 then
				local _ = nil
				local var2743, var2744 = protoModule.readBuffer(p135, var2735)
				var2735 = var2744
				var2734.event_id = buffer.tostring(var2743)
			elseif var2740 == 2 then
				local _ = nil
				local var2745, var2746 = protoModule.readBuffer(p135, var2735)
				var2735 = var2746
				var2734.universe_id = buffer.tostring(var2745)
			elseif var2740 == 3 then
				local _ = nil
				local var2747, var2748 = protoModule.readBuffer(p135, var2735)
				var2735 = var2748
				table.insert(var2734.rsvp_users, t.EventAttributionRowInputData_RsvpUser.decode(var2747))
			else
				local _ = nil
				local var2749, var2750 = protoModule.readVarInt(p135, var2735)
				var2735 = var2750 + var2749
			end
		elseif var2736 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2751, var2752 = protoModule.readFixed32(p135, var2735)
			local _ = var2751
			var2735 = var2752
		elseif var2736 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2753, var2754 = protoModule.readFixed64(p135, var2735)
			local _ = var2753
			var2735 = var2754
		else
			error("Unsupported wire type: " .. var2736)
		end
	end
	return var2734
end

function t_67:jsonEncode() --[[ line: 16316 ]]
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

function t_67:jsonDecode() --[[ line: 16338 ]]
	-- upvalues: t_67 (ref), t (ref)
	local var2757 = t_67.new()
	
	if self.event_id ~= nil then
		var2757.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2757.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2757.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2757.universe_id = self.universeId
	end
	if self.rsvp_users ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvp_users do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2757.rsvp_users = t_1
	end
	if self.rsvpUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.rsvpUsers do
			table.insert(t_1, t.EventAttributionRowInputData_RsvpUser.jsonDecode(v))
		end
		var2757.rsvp_users = t_1
	end
	return var2757
end

t_67.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_67
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p136) --[[ line: 16392 ]]
	-- upvalues: t_68 (ref)
	return setmetatable({
		user_id = if p136 == nil or p136.user_id == nil then 0 else p136.user_id
	}, t_68)
end

function t_68:encode() --[[ line: 16400 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2761 = 0
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		local var2762, var2763 = protoModule.writeTag(buff, var2761, 1, protoModule.wireTypes.varint)
		var2762, var2763 = protoModule.writeVarInt(var2762, var2763, self.user_id)
		buff = var2762
		var2761 = var2763
	end
	local buff_1 = buffer.create(var2761)
	buffer.copy(buff_1, 0, buff, 0, var2761)
	
	return buff_1
end

function t_68.decode(p137) --[[ line: 16414 ]]
	-- upvalues: t_68 (ref), protoModule (ref)
	local var2765 = t_68.new()
	local var2766 = 0
	while var2766 < buffer.len(p137) do
		local _ = nil
		local _ = nil
		local var2767, var2768, var2769 = protoModule.readTag(p137, var2766)
		local var2770 = var2767
		local var2771 = var2768
		var2766 = var2769
		
		if var2771 == protoModule.wireTypes.varint then
			if var2770 == 1 then
				local _ = nil
				local var2772, var2773 = protoModule.readVarIntI64(p137, var2766)
				var2766 = var2773
				var2765.user_id = var2772
			else
				local _ = nil
				local var2774, var2775 = protoModule.readVarInt(p137, var2766)
				local _ = var2774
				var2766 = var2775
			end
		elseif var2771 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2776, var2777 = protoModule.readVarInt(p137, var2766)
			var2766 = var2777 + var2776
		elseif var2771 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2778, var2779 = protoModule.readFixed32(p137, var2766)
			local _ = var2778
			var2766 = var2779
		elseif var2771 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2780, var2781 = protoModule.readFixed64(p137, var2766)
			local _ = var2780
			var2766 = var2781
		else
			error("Unsupported wire type: " .. var2771)
		end
	end
	return var2765
end

function t_68:jsonEncode() --[[ line: 16457 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= 0 then
		t.userId = self.user_id
	end
	return t
end

function t_68:jsonDecode() --[[ line: 16467 ]]
	-- upvalues: t_68 (ref)
	local var2783 = t_68.new()
	
	if self.user_id ~= nil then
		var2783.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2783.user_id = self.userId
	end
	return var2783
end

t_68.descriptor = {
	name = "EventAttributionRowInputData_RsvpUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.RsvpUser"
}
t.EventAttributionRowInputData_RsvpUser = t_68
typeRegistryModule.default:register(t.EventAttributionRowInputData_RsvpUser)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p138) --[[ line: 16497 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p138 == nil or p138.event_id == nil then "" else p138.event_id
	}, t_69)
end

function t_69:encode() --[[ line: 16503 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2785 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2786, var2787 = protoModule.writeTag(buff, var2785, 1, protoModule.wireTypes.lengthDelimited)
		var2786, var2787 = protoModule.writeString(var2786, var2787, self.event_id)
		buff = var2786
		var2785 = var2787
	end
	local buff_1 = buffer.create(var2785)
	buffer.copy(buff_1, 0, buff, 0, var2785)
	
	return buff_1
end

function t_69.decode(p139) --[[ line: 16517 ]]
	-- upvalues: t_69 (ref), protoModule (ref)
	local var2789 = t_69.new()
	local var2790 = 0
	while var2790 < buffer.len(p139) do
		local _ = nil
		local var2791 = nil
		local var2792, var2793, var2794 = protoModule.readTag(p139, var2790)
		local var2795 = var2792
		var2791 = var2793
		var2790 = var2794
		
		if var2791 == protoModule.wireTypes.varint then
			local _ = nil
			local var2796, var2797 = protoModule.readVarInt(p139, var2790)
			local _ = var2796
			var2790 = var2797
			continue
		end
		if var2791 == protoModule.wireTypes.lengthDelimited then
			if var2795 == 1 then
				local _ = nil
				local var2798, var2799 = protoModule.readBuffer(p139, var2790)
				var2790 = var2799
				var2789.event_id = buffer.tostring(var2798)
			else
				local _ = nil
				local var2800, var2801 = protoModule.readVarInt(p139, var2790)
				var2790 = var2801 + var2800
			end
		elseif var2791 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2802, var2803 = protoModule.readFixed32(p139, var2790)
			local _ = var2802
			var2790 = var2803
		elseif var2791 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2804, var2805 = protoModule.readFixed64(p139, var2790)
			local _ = var2804
			var2790 = var2805
		else
			error("Unsupported wire type: " .. var2791)
		end
	end
	return var2789
end

function t_69:jsonEncode() --[[ line: 16560 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_69:jsonDecode() --[[ line: 16570 ]]
	-- upvalues: t_69 (ref)
	local var2807 = t_69.new()
	
	if self.event_id ~= nil then
		var2807.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2807.event_id = self.eventId
	end
	return var2807
end

t_69.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_69
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p140) --[[ line: 16598 ]]
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p140 == nil or p140.event_id == nil then "" else p140.event_id
	}, t_70)
end

function t_70:encode() --[[ line: 16606 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2809 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2810, var2811 = protoModule.writeTag(buff, var2809, 1, protoModule.wireTypes.lengthDelimited)
		var2810, var2811 = protoModule.writeString(var2810, var2811, self.event_id)
		buff = var2810
		var2809 = var2811
	end
	local buff_1 = buffer.create(var2809)
	buffer.copy(buff_1, 0, buff, 0, var2809)
	
	return buff_1
end

function t_70.decode(p141) --[[ line: 16620 ]]
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2813 = t_70.new()
	local var2814 = 0
	while var2814 < buffer.len(p141) do
		local _ = nil
		local var2815 = nil
		local var2816, var2817, var2818 = protoModule.readTag(p141, var2814)
		local var2819 = var2816
		var2815 = var2817
		var2814 = var2818
		
		if var2815 == protoModule.wireTypes.varint then
			local _ = nil
			local var2820, var2821 = protoModule.readVarInt(p141, var2814)
			local _ = var2820
			var2814 = var2821
			continue
		end
		if var2815 == protoModule.wireTypes.lengthDelimited then
			if var2819 == 1 then
				local _ = nil
				local var2822, var2823 = protoModule.readBuffer(p141, var2814)
				var2814 = var2823
				var2813.event_id = buffer.tostring(var2822)
			else
				local _ = nil
				local var2824, var2825 = protoModule.readVarInt(p141, var2814)
				var2814 = var2825 + var2824
			end
		elseif var2815 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2826, var2827 = protoModule.readFixed32(p141, var2814)
			local _ = var2826
			var2814 = var2827
		elseif var2815 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2828, var2829 = protoModule.readFixed64(p141, var2814)
			local _ = var2828
			var2814 = var2829
		else
			error("Unsupported wire type: " .. var2815)
		end
	end
	return var2813
end

function t_70:jsonEncode() --[[ line: 16663 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_70:jsonDecode() --[[ line: 16673 ]]
	-- upvalues: t_70 (ref)
	local var2831 = t_70.new()
	
	if self.event_id ~= nil then
		var2831.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2831.event_id = self.eventId
	end
	return var2831
end

t_70.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_70
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p142) --[[ line: 16703 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		event_id = if p142 == nil or p142.event_id == nil then "" else p142.event_id,
		universe_id = if p142 == nil or p142.universe_id == nil then "" else p142.universe_id
	}, t_71)
end

function t_71:encode() --[[ line: 16712 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2833 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2834, var2835 = protoModule.writeTag(buff, var2833, 1, protoModule.wireTypes.lengthDelimited)
		var2834, var2835 = protoModule.writeString(var2834, var2835, self.event_id)
		buff = var2834
		var2833 = var2835
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2836, var2837 = protoModule.writeTag(buff, var2833, 2, protoModule.wireTypes.lengthDelimited)
		var2836, var2837 = protoModule.writeString(var2836, var2837, self.universe_id)
		buff = var2836
		var2833 = var2837
	end
	local buff_1 = buffer.create(var2833)
	buffer.copy(buff_1, 0, buff, 0, var2833)
	
	return buff_1
end

function t_71.decode(p143) --[[ line: 16731 ]]
	-- upvalues: t_71 (ref), protoModule (ref)
	local var2839 = t_71.new()
	local var2840 = 0
	while var2840 < buffer.len(p143) do
		local _ = nil
		local var2841 = nil
		local var2842, var2843, var2844 = protoModule.readTag(p143, var2840)
		local var2845 = var2842
		var2841 = var2843
		var2840 = var2844
		
		if var2841 == protoModule.wireTypes.varint then
			local _ = nil
			local var2846, var2847 = protoModule.readVarInt(p143, var2840)
			local _ = var2846
			var2840 = var2847
			continue
		end
		if var2841 == protoModule.wireTypes.lengthDelimited then
			if var2845 == 1 then
				local _ = nil
				local var2848, var2849 = protoModule.readBuffer(p143, var2840)
				var2840 = var2849
				var2839.event_id = buffer.tostring(var2848)
			elseif var2845 == 2 then
				local _ = nil
				local var2850, var2851 = protoModule.readBuffer(p143, var2840)
				var2840 = var2851
				var2839.universe_id = buffer.tostring(var2850)
			else
				local _ = nil
				local var2852, var2853 = protoModule.readVarInt(p143, var2840)
				var2840 = var2853 + var2852
			end
		elseif var2841 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2854, var2855 = protoModule.readFixed32(p143, var2840)
			local _ = var2854
			var2840 = var2855
		elseif var2841 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2856, var2857 = protoModule.readFixed64(p143, var2840)
			local _ = var2856
			var2840 = var2857
		else
			error("Unsupported wire type: " .. var2841)
		end
	end
	return var2839
end

function t_71:jsonEncode() --[[ line: 16779 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_71:jsonDecode() --[[ line: 16793 ]]
	-- upvalues: t_71 (ref)
	local var2859 = t_71.new()
	
	if self.event_id ~= nil then
		var2859.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2859.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2859.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2859.universe_id = self.universeId
	end
	return var2859
end

t_71.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_71
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p144) --[[ line: 16831 ]]
	-- upvalues: t_72 (ref)
	return setmetatable({
		entry_map = if p144 == nil or p144.entry_map == nil then {} else p144.entry_map,
		entry_order = if p144 == nil or p144.entry_order == nil then {} else p144.entry_order,
		next_page_token = if p144 == nil or p144.next_page_token == nil then "" else p144.next_page_token,
		sticky_filter_pills = if p144 == nil or p144.sticky_filter_pills == nil then nil else p144.sticky_filter_pills,
		applied_filters = if p144 == nil or p144.applied_filters == nil then "" else p144.applied_filters
	}, t_72)
end

function t_72:encode() --[[ line: 16843 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2861 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2862, var2863 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2862, var2863 = protoModule.writeString(var2862, var2863, i)
			local var2864 = v:encode()
			var2863, var2865 = protoModule.writeTag(var2862, var2863, 2, protoModule.wireTypes.lengthDelimited)
			var2863, var2865 = protoModule.writeBuffer(var2863, var2865, var2864, buffer.len(var2864))
			local var2866 = var2863
			local var2867 = var2865
			local var2868, var2869 = protoModule.writeTag(buff, var2861, 1, protoModule.wireTypes.lengthDelimited)
			var2868, var2869 = protoModule.writeBuffer(var2868, var2869, var2866, var2867)
			buff = var2868
			var2861 = var2869
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2870, var2871 = protoModule.writeTag(buff, var2861, 2, protoModule.wireTypes.lengthDelimited)
			var2870, var2871 = protoModule.writeString(var2870, var2871, v)
			buff = var2870
			var2861 = var2871
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2872, var2873 = protoModule.writeTag(buff, var2861, 3, protoModule.wireTypes.lengthDelimited)
		var2872, var2873 = protoModule.writeString(var2872, var2873, self.next_page_token)
		buff = var2872
		var2861 = var2873
	end
	if self.sticky_filter_pills ~= nil then
		local var2874 = self.sticky_filter_pills:encode()
		local var2875, var2876 = protoModule.writeTag(buff, var2861, 4, protoModule.wireTypes.lengthDelimited)
		var2875, var2876 = protoModule.writeBuffer(var2875, var2876, var2874, buffer.len(var2874))
		buff = var2875
		var2861 = var2876
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2877, var2878 = protoModule.writeTag(buff, var2861, 5, protoModule.wireTypes.lengthDelimited)
		var2877, var2878 = protoModule.writeString(var2877, var2878, self.applied_filters)
		buff = var2877
		var2861 = var2878
	end
	local buff_1 = buffer.create(var2861)
	buffer.copy(buff_1, 0, buff, 0, var2861)
	
	return buff_1
end

function t_72.decode(p145) --[[ line: 16889 ]]
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2880 = t_72.new()
	local var2881 = 0
	while var2881 < buffer.len(p145) do
		local _ = nil
		local var2882 = nil
		local var2883, var2884, var2885 = protoModule.readTag(p145, var2881)
		local var2886 = var2883
		var2882 = var2884
		var2881 = var2885
		
		if var2882 == protoModule.wireTypes.varint then
			local _ = nil
			local var2887, var2888 = protoModule.readVarInt(p145, var2881)
			local _ = var2887
			var2881 = var2888
			continue
		end
		if var2882 == protoModule.wireTypes.lengthDelimited then
			if var2886 == 1 then
				local _ = nil
				local var2889, var2890 = protoModule.readBuffer(p145, var2881)
				var2881 = var2890
				var2889 = t.ChartsFeedInputData_EntryMapEntry.decode(var2889)
				var2880.entry_map[var2889.key or ""] = var2889.value or t.FeedEntry.new()
			elseif var2886 == 2 then
				local _ = nil
				local var2891, var2892 = protoModule.readBuffer(p145, var2881)
				var2881 = var2892
				table.insert(var2880.entry_order, buffer.tostring(var2891))
			elseif var2886 == 3 then
				local _ = nil
				local var2893, var2894 = protoModule.readBuffer(p145, var2881)
				var2881 = var2894
				var2880.next_page_token = buffer.tostring(var2893)
			elseif var2886 == 4 then
				local _ = nil
				local var2895, var2896 = protoModule.readBuffer(p145, var2881)
				var2881 = var2896
				var2880.sticky_filter_pills = t.FilterPillsInputData.decode(var2895)
			elseif var2886 == 5 then
				local _ = nil
				local var2897, var2898 = protoModule.readBuffer(p145, var2881)
				var2881 = var2898
				var2880.applied_filters = buffer.tostring(var2897)
			else
				local _ = nil
				local var2899, var2900 = protoModule.readVarInt(p145, var2881)
				var2881 = var2900 + var2899
			end
		elseif var2882 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2901, var2902 = protoModule.readFixed32(p145, var2881)
			local _ = var2901
			var2881 = var2902
		elseif var2882 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2903, var2904 = protoModule.readFixed64(p145, var2881)
			local _ = var2903
			var2881 = var2904
		else
			error("Unsupported wire type: " .. var2882)
		end
	end
	return var2880
end

function t_72:jsonEncode() --[[ line: 16959 ]]
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

function t_72:jsonDecode() --[[ line: 16993 ]]
	-- upvalues: t_72 (ref), t (ref)
	local var2908 = t_72.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2908.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2908.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2908.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2908.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2908.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2908.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2908.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2908.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2908.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2908.applied_filters = self.appliedFilters
	end
	return var2908
end

t_72.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_72
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p146) --[[ line: 17073 ]]
	-- upvalues: t_73 (ref)
	return setmetatable({
		key = if p146 == nil or p146.key == nil then "" else p146.key,
		value = if p146 == nil or p146.value == nil then nil else p146.value
	}, t_73)
end

function t_73:encode() --[[ line: 17082 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2914 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2915, var2916 = protoModule.writeTag(buff, var2914, 1, protoModule.wireTypes.lengthDelimited)
		var2915, var2916 = protoModule.writeString(var2915, var2916, self.key)
		buff = var2915
		var2914 = var2916
	end
	if self.value ~= nil then
		local var2917 = self.value:encode()
		local var2918, var2919 = protoModule.writeTag(buff, var2914, 2, protoModule.wireTypes.lengthDelimited)
		var2918, var2919 = protoModule.writeBuffer(var2918, var2919, var2917, buffer.len(var2917))
		buff = var2918
		var2914 = var2919
	end
	local buff_1 = buffer.create(var2914)
	buffer.copy(buff_1, 0, buff, 0, var2914)
	
	return buff_1
end

function t_73.decode(p147) --[[ line: 17102 ]]
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2921 = t_73.new()
	local var2922 = 0
	while var2922 < buffer.len(p147) do
		local _ = nil
		local var2923 = nil
		local var2924, var2925, var2926 = protoModule.readTag(p147, var2922)
		local var2927 = var2924
		var2923 = var2925
		var2922 = var2926
		
		if var2923 == protoModule.wireTypes.varint then
			local _ = nil
			local var2928, var2929 = protoModule.readVarInt(p147, var2922)
			local _ = var2928
			var2922 = var2929
			continue
		end
		if var2923 == protoModule.wireTypes.lengthDelimited then
			if var2927 == 1 then
				local _ = nil
				local var2930, var2931 = protoModule.readBuffer(p147, var2922)
				var2922 = var2931
				var2921.key = buffer.tostring(var2930)
			elseif var2927 == 2 then
				local _ = nil
				local var2932, var2933 = protoModule.readBuffer(p147, var2922)
				var2922 = var2933
				var2921.value = t.FeedEntry.decode(var2932)
			else
				local _ = nil
				local var2934, var2935 = protoModule.readVarInt(p147, var2922)
				var2922 = var2935 + var2934
			end
		elseif var2923 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2936, var2937 = protoModule.readFixed32(p147, var2922)
			local _ = var2936
			var2922 = var2937
		elseif var2923 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2938, var2939 = protoModule.readFixed64(p147, var2922)
			local _ = var2938
			var2922 = var2939
		else
			error("Unsupported wire type: " .. var2923)
		end
	end
	return var2921
end

function t_73:jsonEncode() --[[ line: 17150 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_73:jsonDecode() --[[ line: 17164 ]]
	-- upvalues: t_73 (ref), t (ref)
	local var2941 = t_73.new()
	
	if self.key ~= nil then
		var2941.key = self.key
	end
	if self.value ~= nil then
		var2941.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2941
end

t_73.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_73
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p148) --[[ line: 17194 ]]
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

function t_74:encode() --[[ line: 17205 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2943 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2944 = v:encode()
			local var2945, var2946 = protoModule.writeTag(buff, var2943, 1, protoModule.wireTypes.lengthDelimited)
			var2945, var2946 = protoModule.writeBuffer(var2945, var2946, var2944, buffer.len(var2944))
			buff = var2945
			var2943 = var2946
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2947, var2948 = protoModule.writeTag(buff, var2943, 2, protoModule.wireTypes.lengthDelimited)
		var2947, var2948 = protoModule.writeString(var2947, var2948, self.sort_id)
		buff = var2947
		var2943 = var2948
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2949, var2950 = protoModule.writeTag(buff, var2943, 3, protoModule.wireTypes.varint)
		var2949, var2950 = protoModule.writeVarInt(var2949, var2950, self.secondary_sort_id)
		buff = var2949
		var2943 = var2950
	end
	if self.title ~= nil and self.title ~= "" then
		local var2951, var2952 = protoModule.writeTag(buff, var2943, 4, protoModule.wireTypes.lengthDelimited)
		var2951, var2952 = protoModule.writeString(var2951, var2952, self.title)
		buff = var2951
		var2943 = var2952
	end
	if self.primary_sort_id ~= nil then
		local var2953, var2954 = protoModule.writeTag(buff, var2943, 5, protoModule.wireTypes.varint)
		var2953, var2954 = protoModule.writeVarInt(var2953, var2954, self.primary_sort_id)
		buff = var2953
		var2943 = var2954
	end
	if self.applied_filters ~= nil then
		local var2955, var2956 = protoModule.writeTag(buff, var2943, 6, protoModule.wireTypes.lengthDelimited)
		var2955, var2956 = protoModule.writeString(var2955, var2956, self.applied_filters)
		buff = var2955
		var2943 = var2956
	end
	local buff_1 = buffer.create(var2943)
	buffer.copy(buff_1, 0, buff, 0, var2943)
	
	return buff_1
end

function t_74.decode(p149) --[[ line: 17247 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2958 = t_74.new()
	local var2959 = 0
	while var2959 < buffer.len(p149) do
		local _ = nil
		local var2960 = nil
		local var2961, var2962, var2963 = protoModule.readTag(p149, var2959)
		local var2964 = var2961
		var2960 = var2962
		var2959 = var2963
		
		if var2960 == protoModule.wireTypes.varint then
			if var2964 == 3 then
				local _ = nil
				local var2965, var2966 = protoModule.readVarIntI32(p149, var2959)
				var2959 = var2966
				var2958.secondary_sort_id = var2965
			elseif var2964 == 5 then
				local _ = nil
				local var2967, var2968 = protoModule.readVarIntI32(p149, var2959)
				var2959 = var2968
				var2958.primary_sort_id = var2967
			else
				local _ = nil
				local var2969, var2970 = protoModule.readVarInt(p149, var2959)
				local _ = var2969
				var2959 = var2970
			end
		end
		if var2960 == protoModule.wireTypes.lengthDelimited then
			if var2964 == 1 then
				local _ = nil
				local var2971, var2972 = protoModule.readBuffer(p149, var2959)
				var2959 = var2972
				table.insert(var2958.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2971))
			elseif var2964 == 2 then
				local _ = nil
				local var2973, var2974 = protoModule.readBuffer(p149, var2959)
				var2959 = var2974
				var2958.sort_id = buffer.tostring(var2973)
			elseif var2964 == 4 then
				local _ = nil
				local var2975, var2976 = protoModule.readBuffer(p149, var2959)
				var2959 = var2976
				var2958.title = buffer.tostring(var2975)
			elseif var2964 == 6 then
				local _ = nil
				local var2977, var2978 = protoModule.readBuffer(p149, var2959)
				var2959 = var2978
				var2958.applied_filters = buffer.tostring(var2977)
			else
				local _ = nil
				local var2979, var2980 = protoModule.readVarInt(p149, var2959)
				var2959 = var2980 + var2979
			end
		elseif var2960 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2981, var2982 = protoModule.readFixed32(p149, var2959)
			local _ = var2981
			var2959 = var2982
		elseif var2960 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2983, var2984 = protoModule.readFixed64(p149, var2959)
			local _ = var2983
			var2959 = var2984
		else
			error("Unsupported wire type: " .. var2960)
		end
	end
	return var2958
end

function t_74:jsonEncode() --[[ line: 17315 ]]
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

function t_74:jsonDecode() --[[ line: 17349 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var2987 = t_74.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2987.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2987.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2987.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2987.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2987.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2987.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2987.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2987.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2987.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2987.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2987.applied_filters = self.appliedFilters
	end
	return var2987
end

t_74.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_74
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p150) --[[ line: 17423 ]]
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

function t_75:encode() --[[ line: 17440 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2991 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2992, var2993 = protoModule.writeTag(buff, var2991, 1, protoModule.wireTypes.lengthDelimited)
		var2992, var2993 = protoModule.writeString(var2992, var2993, self.filter_id)
		buff = var2992
		var2991 = var2993
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2994, var2995 = protoModule.writeTag(buff, var2991, 2, protoModule.wireTypes.lengthDelimited)
		var2994, var2995 = protoModule.writeString(var2994, var2995, self.display_name)
		buff = var2994
		var2991 = var2995
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2996 = v:encode()
			local var2997, var2998 = protoModule.writeTag(buff, var2991, 3, protoModule.wireTypes.lengthDelimited)
			var2997, var2998 = protoModule.writeBuffer(var2997, var2998, var2996, buffer.len(var2996))
			buff = var2997
			var2991 = var2998
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2999, var3000 = protoModule.writeTag(buff, var2991, 4, protoModule.wireTypes.lengthDelimited)
		var2999, var3000 = protoModule.writeString(var2999, var3000, self.default_option_id)
		buff = var2999
		var2991 = var3000
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var3001, var3002 = protoModule.writeTag(buff, var2991, 5, protoModule.wireTypes.lengthDelimited)
		var3001, var3002 = protoModule.writeString(var3001, var3002, self.selected_option_id)
		buff = var3001
		var2991 = var3002
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var3003, var3004 = protoModule.writeTag(buff, var2991, 6, protoModule.wireTypes.lengthDelimited)
		var3003, var3004 = protoModule.writeString(var3003, var3004, self.filter_type)
		buff = var3003
		var2991 = var3004
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var3005, var3006 = protoModule.writeTag(buff, var2991, 7, protoModule.wireTypes.lengthDelimited)
			var3005, var3006 = protoModule.writeString(var3005, var3006, v)
			buff = var3005
			var2991 = var3006
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var3007, var3008 = protoModule.writeTag(buff, var2991, 8, protoModule.wireTypes.lengthDelimited)
		var3007, var3008 = protoModule.writeString(var3007, var3008, self.info_text)
		buff = var3007
		var2991 = var3008
	end
	local buff_1 = buffer.create(var2991)
	buffer.copy(buff_1, 0, buff, 0, var2991)
	
	return buff_1
end

function t_75.decode(p151) --[[ line: 17494 ]]
	-- upvalues: t_75 (ref), protoModule (ref), t (ref)
	local var3010 = t_75.new()
	local var3011 = 0
	while var3011 < buffer.len(p151) do
		local _ = nil
		local var3012 = nil
		local var3013, var3014, var3015 = protoModule.readTag(p151, var3011)
		local var3016 = var3013
		var3012 = var3014
		var3011 = var3015
		
		if var3012 == protoModule.wireTypes.varint then
			local _ = nil
			local var3017, var3018 = protoModule.readVarInt(p151, var3011)
			local _ = var3017
			var3011 = var3018
			continue
		end
		if var3012 == protoModule.wireTypes.lengthDelimited then
			if var3016 == 1 then
				local _ = nil
				local var3019, var3020 = protoModule.readBuffer(p151, var3011)
				var3011 = var3020
				var3010.filter_id = buffer.tostring(var3019)
			elseif var3016 == 2 then
				local _ = nil
				local var3021, var3022 = protoModule.readBuffer(p151, var3011)
				var3011 = var3022
				var3010.display_name = buffer.tostring(var3021)
			elseif var3016 == 3 then
				local _ = nil
				local var3023, var3024 = protoModule.readBuffer(p151, var3011)
				var3011 = var3024
				table.insert(var3010.options, t.FilterPillsInputData_FilterOption.decode(var3023))
			elseif var3016 == 4 then
				local _ = nil
				local var3025, var3026 = protoModule.readBuffer(p151, var3011)
				var3011 = var3026
				var3010.default_option_id = buffer.tostring(var3025)
			elseif var3016 == 5 then
				local _ = nil
				local var3027, var3028 = protoModule.readBuffer(p151, var3011)
				var3011 = var3028
				var3010.selected_option_id = buffer.tostring(var3027)
			elseif var3016 == 6 then
				local _ = nil
				local var3029, var3030 = protoModule.readBuffer(p151, var3011)
				var3011 = var3030
				var3010.filter_type = buffer.tostring(var3029)
			elseif var3016 == 7 then
				local _ = nil
				local var3031, var3032 = protoModule.readBuffer(p151, var3011)
				var3011 = var3032
				table.insert(var3010.inactive_option_ids, buffer.tostring(var3031))
			elseif var3016 == 8 then
				local _ = nil
				local var3033, var3034 = protoModule.readBuffer(p151, var3011)
				var3011 = var3034
				var3010.info_text = buffer.tostring(var3033)
			else
				local _ = nil
				local var3035, var3036 = protoModule.readVarInt(p151, var3011)
				var3011 = var3036 + var3035
			end
		elseif var3012 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3037, var3038 = protoModule.readFixed32(p151, var3011)
			local _ = var3037
			var3011 = var3038
		elseif var3012 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3039, var3040 = protoModule.readFixed64(p151, var3011)
			local _ = var3039
			var3011 = var3040
		else
			error("Unsupported wire type: " .. var3012)
		end
	end
	return var3010
end

function t_75:jsonEncode() --[[ line: 17572 ]]
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

function t_75:jsonDecode() --[[ line: 17618 ]]
	-- upvalues: t_75 (ref), t (ref)
	local var3044 = t_75.new()
	
	if self.filter_id ~= nil then
		var3044.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var3044.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var3044.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3044.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var3044.options = t_1
	end
	if self.default_option_id ~= nil then
		var3044.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var3044.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var3044.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var3044.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var3044.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var3044.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var3044.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var3044.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var3044.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var3044.info_text = self.infoText
	end
	return var3044
end

t_75.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_75
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p152) --[[ line: 17715 ]]
	-- upvalues: t_76 (ref)
	return setmetatable({
		option_id = if p152 == nil or p152.option_id == nil then "" else p152.option_id,
		display_name = if p152 == nil or p152.display_name == nil then "" else p152.display_name,
		option_context_tag = if p152 == nil or p152.option_context_tag == nil then "" else p152.option_context_tag
	}, t_76)
end

function t_76:encode() --[[ line: 17725 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3049 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var3050, var3051 = protoModule.writeTag(buff, var3049, 1, protoModule.wireTypes.lengthDelimited)
		var3050, var3051 = protoModule.writeString(var3050, var3051, self.option_id)
		buff = var3050
		var3049 = var3051
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3052, var3053 = protoModule.writeTag(buff, var3049, 2, protoModule.wireTypes.lengthDelimited)
		var3052, var3053 = protoModule.writeString(var3052, var3053, self.display_name)
		buff = var3052
		var3049 = var3053
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var3054, var3055 = protoModule.writeTag(buff, var3049, 3, protoModule.wireTypes.lengthDelimited)
		var3054, var3055 = protoModule.writeString(var3054, var3055, self.option_context_tag)
		buff = var3054
		var3049 = var3055
	end
	local buff_1 = buffer.create(var3049)
	buffer.copy(buff_1, 0, buff, 0, var3049)
	
	return buff_1
end

function t_76.decode(p153) --[[ line: 17749 ]]
	-- upvalues: t_76 (ref), protoModule (ref)
	local var3057 = t_76.new()
	local var3058 = 0
	while var3058 < buffer.len(p153) do
		local _ = nil
		local var3059 = nil
		local var3060, var3061, var3062 = protoModule.readTag(p153, var3058)
		local var3063 = var3060
		var3059 = var3061
		var3058 = var3062
		
		if var3059 == protoModule.wireTypes.varint then
			local _ = nil
			local var3064, var3065 = protoModule.readVarInt(p153, var3058)
			local _ = var3064
			var3058 = var3065
			continue
		end
		if var3059 == protoModule.wireTypes.lengthDelimited then
			if var3063 == 1 then
				local _ = nil
				local var3066, var3067 = protoModule.readBuffer(p153, var3058)
				var3058 = var3067
				var3057.option_id = buffer.tostring(var3066)
			elseif var3063 == 2 then
				local _ = nil
				local var3068, var3069 = protoModule.readBuffer(p153, var3058)
				var3058 = var3069
				var3057.display_name = buffer.tostring(var3068)
			elseif var3063 == 3 then
				local _ = nil
				local var3070, var3071 = protoModule.readBuffer(p153, var3058)
				var3058 = var3071
				var3057.option_context_tag = buffer.tostring(var3070)
			else
				local _ = nil
				local var3072, var3073 = protoModule.readVarInt(p153, var3058)
				var3058 = var3073 + var3072
			end
		elseif var3059 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3074, var3075 = protoModule.readFixed32(p153, var3058)
			local _ = var3074
			var3058 = var3075
		elseif var3059 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3076, var3077 = protoModule.readFixed64(p153, var3058)
			local _ = var3076
			var3058 = var3077
		else
			error("Unsupported wire type: " .. var3059)
		end
	end
	return var3057
end

function t_76:jsonEncode() --[[ line: 17802 ]]
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

function t_76:jsonDecode() --[[ line: 17820 ]]
	-- upvalues: t_76 (ref)
	local var3079 = t_76.new()
	
	if self.option_id ~= nil then
		var3079.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var3079.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var3079.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3079.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var3079.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var3079.option_context_tag = self.optionContextTag
	end
	return var3079
end

t_76.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_76
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p154) --[[ line: 17866 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		sort_options = if p154 == nil or p154.sort_options == nil then {} else p154.sort_options,
		selected_sort_id = if p154 == nil or p154.selected_sort_id == nil then "" else p154.selected_sort_id
	}, t_77)
end

function t_77:encode() --[[ line: 17873 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3081 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var3082 = v:encode()
			local var3083, var3084 = protoModule.writeTag(buff, var3081, 1, protoModule.wireTypes.lengthDelimited)
			var3083, var3084 = protoModule.writeBuffer(var3083, var3084, var3082, buffer.len(var3082))
			buff = var3083
			var3081 = var3084
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var3085, var3086 = protoModule.writeTag(buff, var3081, 2, protoModule.wireTypes.lengthDelimited)
		var3085, var3086 = protoModule.writeString(var3085, var3086, self.selected_sort_id)
		buff = var3085
		var3081 = var3086
	end
	local buff_1 = buffer.create(var3081)
	buffer.copy(buff_1, 0, buff, 0, var3081)
	
	return buff_1
end

function t_77.decode(p155) --[[ line: 17895 ]]
	-- upvalues: t_77 (ref), protoModule (ref), t (ref)
	local var3088 = t_77.new()
	local var3089 = 0
	while var3089 < buffer.len(p155) do
		local _ = nil
		local var3090 = nil
		local var3091, var3092, var3093 = protoModule.readTag(p155, var3089)
		local var3094 = var3091
		var3090 = var3092
		var3089 = var3093
		
		if var3090 == protoModule.wireTypes.varint then
			local _ = nil
			local var3095, var3096 = protoModule.readVarInt(p155, var3089)
			local _ = var3095
			var3089 = var3096
			continue
		end
		if var3090 == protoModule.wireTypes.lengthDelimited then
			if var3094 == 1 then
				local _ = nil
				local var3097, var3098 = protoModule.readBuffer(p155, var3089)
				var3089 = var3098
				table.insert(var3088.sort_options, t.SortSelectorInputData_SortOption.decode(var3097))
			elseif var3094 == 2 then
				local _ = nil
				local var3099, var3100 = protoModule.readBuffer(p155, var3089)
				var3089 = var3100
				var3088.selected_sort_id = buffer.tostring(var3099)
			else
				local _ = nil
				local var3101, var3102 = protoModule.readVarInt(p155, var3089)
				var3089 = var3102 + var3101
			end
		elseif var3090 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3103, var3104 = protoModule.readFixed32(p155, var3089)
			local _ = var3103
			var3089 = var3104
		elseif var3090 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3105, var3106 = protoModule.readFixed64(p155, var3089)
			local _ = var3105
			var3089 = var3106
		else
			error("Unsupported wire type: " .. var3090)
		end
	end
	return var3088
end

function t_77:jsonEncode() --[[ line: 17943 ]]
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

function t_77:jsonDecode() --[[ line: 17961 ]]
	-- upvalues: t_77 (ref), t (ref)
	local var3109 = t_77.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3109.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3109.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var3109.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var3109.selected_sort_id = self.selectedSortId
	end
	return var3109
end

t_77.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_77
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p156) --[[ line: 18007 ]]
	-- upvalues: t_78 (ref)
	return setmetatable({
		sort_id = if p156 == nil or p156.sort_id == nil then "" else p156.sort_id,
		display_name = if p156 == nil or p156.display_name == nil then "" else p156.display_name,
		content_type = if p156 == nil or p156.content_type == nil then "" else p156.content_type
	}, t_78)
end

function t_78:encode() --[[ line: 18017 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3113 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3114, var3115 = protoModule.writeTag(buff, var3113, 1, protoModule.wireTypes.lengthDelimited)
		var3114, var3115 = protoModule.writeString(var3114, var3115, self.sort_id)
		buff = var3114
		var3113 = var3115
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3116, var3117 = protoModule.writeTag(buff, var3113, 2, protoModule.wireTypes.lengthDelimited)
		var3116, var3117 = protoModule.writeString(var3116, var3117, self.display_name)
		buff = var3116
		var3113 = var3117
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var3118, var3119 = protoModule.writeTag(buff, var3113, 3, protoModule.wireTypes.lengthDelimited)
		var3118, var3119 = protoModule.writeString(var3118, var3119, self.content_type)
		buff = var3118
		var3113 = var3119
	end
	local buff_1 = buffer.create(var3113)
	buffer.copy(buff_1, 0, buff, 0, var3113)
	
	return buff_1
end

function t_78.decode(p157) --[[ line: 18041 ]]
	-- upvalues: t_78 (ref), protoModule (ref)
	local var3121 = t_78.new()
	local var3122 = 0
	while var3122 < buffer.len(p157) do
		local _ = nil
		local var3123 = nil
		local var3124, var3125, var3126 = protoModule.readTag(p157, var3122)
		local var3127 = var3124
		var3123 = var3125
		var3122 = var3126
		
		if var3123 == protoModule.wireTypes.varint then
			local _ = nil
			local var3128, var3129 = protoModule.readVarInt(p157, var3122)
			local _ = var3128
			var3122 = var3129
			continue
		end
		if var3123 == protoModule.wireTypes.lengthDelimited then
			if var3127 == 1 then
				local _ = nil
				local var3130, var3131 = protoModule.readBuffer(p157, var3122)
				var3122 = var3131
				var3121.sort_id = buffer.tostring(var3130)
			elseif var3127 == 2 then
				local _ = nil
				local var3132, var3133 = protoModule.readBuffer(p157, var3122)
				var3122 = var3133
				var3121.display_name = buffer.tostring(var3132)
			elseif var3127 == 3 then
				local _ = nil
				local var3134, var3135 = protoModule.readBuffer(p157, var3122)
				var3122 = var3135
				var3121.content_type = buffer.tostring(var3134)
			else
				local _ = nil
				local var3136, var3137 = protoModule.readVarInt(p157, var3122)
				var3122 = var3137 + var3136
			end
		elseif var3123 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3138, var3139 = protoModule.readFixed32(p157, var3122)
			local _ = var3138
			var3122 = var3139
		elseif var3123 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3140, var3141 = protoModule.readFixed64(p157, var3122)
			local _ = var3140
			var3122 = var3141
		else
			error("Unsupported wire type: " .. var3123)
		end
	end
	return var3121
end

function t_78:jsonEncode() --[[ line: 18094 ]]
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

function t_78:jsonDecode() --[[ line: 18112 ]]
	-- upvalues: t_78 (ref)
	local var3143 = t_78.new()
	
	if self.sort_id ~= nil then
		var3143.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3143.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var3143.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3143.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var3143.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var3143.content_type = self.contentType
	end
	return var3143
end

t_78.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_78
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p158) --[[ line: 18158 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		selected_option = if p158 == nil or p158.selected_option == nil then "" else p158.selected_option,
		options = if p158 == nil or p158.options == nil then {} else p158.options,
		experience_carousel = if p158 == nil or p158.experience_carousel == nil then nil else p158.experience_carousel
	}, t_79)
end

function t_79:encode() --[[ line: 18170 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3145 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3146, var3147 = protoModule.writeTag(buff, var3145, 1, protoModule.wireTypes.lengthDelimited)
		var3146, var3147 = protoModule.writeString(var3146, var3147, self.selected_option)
		buff = var3146
		var3145 = var3147
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3148 = v:encode()
			local var3149, var3150 = protoModule.writeTag(buff, var3145, 2, protoModule.wireTypes.lengthDelimited)
			var3149, var3150 = protoModule.writeBuffer(var3149, var3150, var3148, buffer.len(var3148))
			buff = var3149
			var3145 = var3150
		end
	end
	if self.experience_carousel ~= nil then
		local var3151 = self.experience_carousel:encode()
		local var3152, var3153 = protoModule.writeTag(buff, var3145, 3, protoModule.wireTypes.lengthDelimited)
		var3152, var3153 = protoModule.writeBuffer(var3152, var3153, var3151, buffer.len(var3151))
		buff = var3152
		var3145 = var3153
	end
	local buff_1 = buffer.create(var3145)
	buffer.copy(buff_1, 0, buff, 0, var3145)
	
	return buff_1
end

function t_79.decode(p159) --[[ line: 18198 ]]
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var3155 = t_79.new()
	local var3156 = 0
	while var3156 < buffer.len(p159) do
		local _ = nil
		local var3157 = nil
		local var3158, var3159, var3160 = protoModule.readTag(p159, var3156)
		local var3161 = var3158
		var3157 = var3159
		var3156 = var3160
		
		if var3157 == protoModule.wireTypes.varint then
			local _ = nil
			local var3162, var3163 = protoModule.readVarInt(p159, var3156)
			local _ = var3162
			var3156 = var3163
			continue
		end
		if var3157 == protoModule.wireTypes.lengthDelimited then
			if var3161 == 1 then
				local _ = nil
				local var3164, var3165 = protoModule.readBuffer(p159, var3156)
				var3156 = var3165
				var3155.selected_option = buffer.tostring(var3164)
			elseif var3161 == 2 then
				local _ = nil
				local var3166, var3167 = protoModule.readBuffer(p159, var3156)
				var3156 = var3167
				table.insert(var3155.options, t.SelectorOption.decode(var3166))
			elseif var3161 == 3 then
				local _ = nil
				local var3168, var3169 = protoModule.readBuffer(p159, var3156)
				var3156 = var3169
				var3155.experience_carousel = t.ExperienceCarouselInputData.decode(var3168)
			else
				local _ = nil
				local var3170, var3171 = protoModule.readVarInt(p159, var3156)
				var3156 = var3171 + var3170
			end
		elseif var3157 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3172, var3173 = protoModule.readFixed32(p159, var3156)
			local _ = var3172
			var3156 = var3173
		elseif var3157 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3174, var3175 = protoModule.readFixed64(p159, var3156)
			local _ = var3174
			var3156 = var3175
		else
			error("Unsupported wire type: " .. var3157)
		end
	end
	return var3155
end

function t_79:jsonEncode() --[[ line: 18251 ]]
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

function t_79:jsonDecode() --[[ line: 18273 ]]
	-- upvalues: t_79 (ref), t (ref)
	local var3178 = t_79.new()
	
	if self.selected_option ~= nil then
		var3178.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3178.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3178.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3178.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3178.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var3178
end

t_79.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_79
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p160) --[[ line: 18318 ]]
	-- upvalues: t_80 (ref)
	return setmetatable({
		id = if p160 == nil or p160.id == nil then "" else p160.id,
		preview_rows = if p160 == nil or p160.preview_rows == nil then 0 else p160.preview_rows,
		widget_style = if p160 == nil or p160.widget_style == nil then nil else p160.widget_style,
		see_all_button = if p160 == nil or p160.see_all_button == nil then false else p160.see_all_button,
		information_popover_text = if p160 == nil or p160.information_popover_text == nil then "" else p160.information_popover_text
	}, t_80)
end

function t_80:encode() --[[ line: 18332 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3181 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3182, var3183 = protoModule.writeTag(buff, var3181, 1, protoModule.wireTypes.lengthDelimited)
		var3182, var3183 = protoModule.writeString(var3182, var3183, self.id)
		buff = var3182
		var3181 = var3183
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var3184, var3185 = protoModule.writeTag(buff, var3181, 4, protoModule.wireTypes.varint)
		var3184, var3185 = protoModule.writeVarInt(var3184, var3185, self.preview_rows)
		buff = var3184
		var3181 = var3185
	end
	if self.widget_style ~= nil then
		local var3186 = self.widget_style:encode()
		local var3187, var3188 = protoModule.writeTag(buff, var3181, 3, protoModule.wireTypes.lengthDelimited)
		var3187, var3188 = protoModule.writeBuffer(var3187, var3188, var3186, buffer.len(var3186))
		buff = var3187
		var3181 = var3188
	end
	if self.see_all_button then
		local var3189, var3190 = protoModule.writeTag(buff, var3181, 5, protoModule.wireTypes.varint)
		var3189, var3190 = protoModule.writeVarInt(var3189, var3190, if self.see_all_button then 1 else 0)
		buff = var3189
		var3181 = var3190
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3191, var3192 = protoModule.writeTag(buff, var3181, 6, protoModule.wireTypes.lengthDelimited)
		var3191, var3192 = protoModule.writeString(var3191, var3192, self.information_popover_text)
		buff = var3191
		var3181 = var3192
	end
	local buff_1 = buffer.create(var3181)
	buffer.copy(buff_1, 0, buff, 0, var3181)
	
	return buff_1
end

function t_80.decode(p161) --[[ line: 18367 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var3194 = t_80.new()
	local var3195 = 0
	while var3195 < buffer.len(p161) do
		local _ = nil
		local var3196 = nil
		local var3197, var3198, var3199 = protoModule.readTag(p161, var3195)
		local var3200 = var3197
		var3196 = var3198
		var3195 = var3199
		
		if var3196 == protoModule.wireTypes.varint then
			if var3200 == 4 then
				local _ = nil
				local var3201, var3202 = protoModule.readVarIntI64(p161, var3195)
				var3195 = var3202
				var3194.preview_rows = var3201
			elseif var3200 == 5 then
				local _ = nil
				local var3203, var3204 = protoModule.readVarInt(p161, var3195)
				var3195 = var3204
				var3194.see_all_button = var3203 ~= 0
			else
				local _ = nil
				local var3205, var3206 = protoModule.readVarInt(p161, var3195)
				local _ = var3205
				var3195 = var3206
			end
		end
		if var3196 == protoModule.wireTypes.lengthDelimited then
			if var3200 == 1 then
				local _ = nil
				local var3207, var3208 = protoModule.readBuffer(p161, var3195)
				var3195 = var3208
				var3194.id = buffer.tostring(var3207)
			elseif var3200 == 3 then
				local _ = nil
				local var3209, var3210 = protoModule.readBuffer(p161, var3195)
				var3195 = var3210
				var3194.widget_style = t.WidgetStyleData.decode(var3209)
			elseif var3200 == 6 then
				local _ = nil
				local var3211, var3212 = protoModule.readBuffer(p161, var3195)
				var3195 = var3212
				var3194.information_popover_text = buffer.tostring(var3211)
			else
				local _ = nil
				local var3213, var3214 = protoModule.readVarInt(p161, var3195)
				var3195 = var3214 + var3213
			end
		elseif var3196 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3215, var3216 = protoModule.readFixed32(p161, var3195)
			local _ = var3215
			var3195 = var3216
		elseif var3196 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3217, var3218 = protoModule.readFixed64(p161, var3195)
			local _ = var3217
			var3195 = var3218
		else
			error("Unsupported wire type: " .. var3196)
		end
	end
	return var3194
end

function t_80:jsonEncode() --[[ line: 18430 ]]
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

function t_80:jsonDecode() --[[ line: 18456 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var3220 = t_80.new()
	
	if self.id ~= nil then
		var3220.id = self.id
	end
	if self.preview_rows ~= nil then
		var3220.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var3220.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var3220.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3220.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3220.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3220.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3220.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3220.information_popover_text = self.informationPopoverText
	end
	return var3220
end

t_80.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p162) --[[ line: 18514 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		id = if p162 == nil or p162.id == nil then "" else p162.id,
		num_items_to_show = if p162 == nil or p162.num_items_to_show == nil then 0 else p162.num_items_to_show,
		widget_style = if p162 == nil or p162.widget_style == nil then nil else p162.widget_style,
		see_all_button = if p162 == nil or p162.see_all_button == nil then false else p162.see_all_button,
		information_popover_text = if p162 == nil or p162.information_popover_text == nil then "" else p162.information_popover_text
	}, t_81)
end

function t_81:encode() --[[ line: 18528 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3222 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3223, var3224 = protoModule.writeTag(buff, var3222, 1, protoModule.wireTypes.lengthDelimited)
		var3223, var3224 = protoModule.writeString(var3223, var3224, self.id)
		buff = var3223
		var3222 = var3224
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var3225, var3226 = protoModule.writeTag(buff, var3222, 5, protoModule.wireTypes.varint)
		var3225, var3226 = protoModule.writeVarInt(var3225, var3226, self.num_items_to_show)
		buff = var3225
		var3222 = var3226
	end
	if self.widget_style ~= nil then
		local var3227 = self.widget_style:encode()
		local var3228, var3229 = protoModule.writeTag(buff, var3222, 3, protoModule.wireTypes.lengthDelimited)
		var3228, var3229 = protoModule.writeBuffer(var3228, var3229, var3227, buffer.len(var3227))
		buff = var3228
		var3222 = var3229
	end
	if self.see_all_button then
		local var3230, var3231 = protoModule.writeTag(buff, var3222, 6, protoModule.wireTypes.varint)
		var3230, var3231 = protoModule.writeVarInt(var3230, var3231, if self.see_all_button then 1 else 0)
		buff = var3230
		var3222 = var3231
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3232, var3233 = protoModule.writeTag(buff, var3222, 7, protoModule.wireTypes.lengthDelimited)
		var3232, var3233 = protoModule.writeString(var3232, var3233, self.information_popover_text)
		buff = var3232
		var3222 = var3233
	end
	local buff_1 = buffer.create(var3222)
	buffer.copy(buff_1, 0, buff, 0, var3222)
	
	return buff_1
end

function t_81.decode(p163) --[[ line: 18565 ]]
	-- upvalues: t_81 (ref), protoModule (ref), t (ref)
	local var3235 = t_81.new()
	local var3236 = 0
	while var3236 < buffer.len(p163) do
		local _ = nil
		local var3237 = nil
		local var3238, var3239, var3240 = protoModule.readTag(p163, var3236)
		local var3241 = var3238
		var3237 = var3239
		var3236 = var3240
		
		if var3237 == protoModule.wireTypes.varint then
			if var3241 == 5 then
				local _ = nil
				local var3242, var3243 = protoModule.readVarIntI64(p163, var3236)
				var3236 = var3243
				var3235.num_items_to_show = var3242
			elseif var3241 == 6 then
				local _ = nil
				local var3244, var3245 = protoModule.readVarInt(p163, var3236)
				var3236 = var3245
				var3235.see_all_button = var3244 ~= 0
			else
				local _ = nil
				local var3246, var3247 = protoModule.readVarInt(p163, var3236)
				local _ = var3246
				var3236 = var3247
			end
		end
		if var3237 == protoModule.wireTypes.lengthDelimited then
			if var3241 == 1 then
				local _ = nil
				local var3248, var3249 = protoModule.readBuffer(p163, var3236)
				var3236 = var3249
				var3235.id = buffer.tostring(var3248)
			elseif var3241 == 3 then
				local _ = nil
				local var3250, var3251 = protoModule.readBuffer(p163, var3236)
				var3236 = var3251
				var3235.widget_style = t.WidgetStyleData.decode(var3250)
			elseif var3241 == 7 then
				local _ = nil
				local var3252, var3253 = protoModule.readBuffer(p163, var3236)
				var3236 = var3253
				var3235.information_popover_text = buffer.tostring(var3252)
			else
				local _ = nil
				local var3254, var3255 = protoModule.readVarInt(p163, var3236)
				var3236 = var3255 + var3254
			end
		elseif var3237 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3256, var3257 = protoModule.readFixed32(p163, var3236)
			local _ = var3256
			var3236 = var3257
		elseif var3237 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3258, var3259 = protoModule.readFixed64(p163, var3236)
			local _ = var3258
			var3236 = var3259
		else
			error("Unsupported wire type: " .. var3237)
		end
	end
	return var3235
end

function t_81:jsonEncode() --[[ line: 18630 ]]
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

function t_81:jsonDecode() --[[ line: 18658 ]]
	-- upvalues: t_81 (ref), t (ref)
	local var3261 = t_81.new()
	
	if self.id ~= nil then
		var3261.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var3261.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var3261.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var3261.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3261.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3261.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3261.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3261.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3261.information_popover_text = self.informationPopoverText
	end
	return var3261
end

t_81.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_81
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p164) --[[ line: 18716 ]]
	-- upvalues: t_82 (ref)
	return setmetatable({
		background_layers = if p164 == nil or p164.background_layers == nil then {} else p164.background_layers
	}, t_82)
end

function t_82:encode() --[[ line: 18722 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3263 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var3264 = v:encode()
			local var3265, var3266 = protoModule.writeTag(buff, var3263, 1, protoModule.wireTypes.lengthDelimited)
			var3265, var3266 = protoModule.writeBuffer(var3265, var3266, var3264, buffer.len(var3264))
			buff = var3265
			var3263 = var3266
		end
	end
	local buff_1 = buffer.create(var3263)
	buffer.copy(buff_1, 0, buff, 0, var3263)
	
	return buff_1
end

function t_82.decode(p165) --[[ line: 18739 ]]
	-- upvalues: t_82 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var3268 = t_82.new()
	local var3269 = 0
	while var3269 < buffer.len(p165) do
		local _ = nil
		local var3270 = nil
		local var3271, var3272, var3273 = protoModule.readTag(p165, var3269)
		local var3274 = var3271
		var3270 = var3272
		var3269 = var3273
		
		if var3270 == protoModule.wireTypes.varint then
			local _ = nil
			local var3275, var3276 = protoModule.readVarInt(p165, var3269)
			local _ = var3275
			var3269 = var3276
			continue
		end
		if var3270 == protoModule.wireTypes.lengthDelimited then
			if var3274 == 1 then
				local _ = nil
				local var3277, var3278 = protoModule.readBuffer(p165, var3269)
				var3269 = var3278
				table.insert(var3268.background_layers, backgroundLayerModule.BackgroundLayer.decode(var3277))
			else
				local _ = nil
				local var3279, var3280 = protoModule.readVarInt(p165, var3269)
				var3269 = var3280 + var3279
			end
		elseif var3270 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3281, var3282 = protoModule.readFixed32(p165, var3269)
			local _ = var3281
			var3269 = var3282
		elseif var3270 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3283, var3284 = protoModule.readFixed64(p165, var3269)
			local _ = var3283
			var3269 = var3284
		else
			error("Unsupported wire type: " .. var3270)
		end
	end
	return var3268
end

function t_82:jsonEncode() --[[ line: 18785 ]]
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

function t_82:jsonDecode() --[[ line: 18799 ]]
	-- upvalues: t_82 (ref), backgroundLayerModule (ref)
	local var3287 = t_82.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3287.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3287.background_layers = t
	end
	return var3287
end

t_82.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_82
typeRegistryModule.default:register(t.WidgetStyleData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p166) --[[ line: 18843 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		id = if p166 == nil or p166.id == nil then "" else p166.id,
		available_until = if p166 == nil or p166.available_until == nil then "" else p166.available_until,
		widget_style = if p166 == nil or p166.widget_style == nil then nil else p166.widget_style
	}, t_83)
end

function t_83:encode() --[[ line: 18853 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3291 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3292, var3293 = protoModule.writeTag(buff, var3291, 1, protoModule.wireTypes.lengthDelimited)
		var3292, var3293 = protoModule.writeString(var3292, var3293, self.id)
		buff = var3292
		var3291 = var3293
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var3294, var3295 = protoModule.writeTag(buff, var3291, 2, protoModule.wireTypes.lengthDelimited)
		var3294, var3295 = protoModule.writeString(var3294, var3295, self.available_until)
		buff = var3294
		var3291 = var3295
	end
	if self.widget_style ~= nil then
		local var3296 = self.widget_style:encode()
		local var3297, var3298 = protoModule.writeTag(buff, var3291, 3, protoModule.wireTypes.lengthDelimited)
		var3297, var3298 = protoModule.writeBuffer(var3297, var3298, var3296, buffer.len(var3296))
		buff = var3297
		var3291 = var3298
	end
	local buff_1 = buffer.create(var3291)
	buffer.copy(buff_1, 0, buff, 0, var3291)
	
	return buff_1
end

function t_83.decode(p167) --[[ line: 18878 ]]
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var3300 = t_83.new()
	local var3301 = 0
	while var3301 < buffer.len(p167) do
		local _ = nil
		local var3302 = nil
		local var3303, var3304, var3305 = protoModule.readTag(p167, var3301)
		local var3306 = var3303
		var3302 = var3304
		var3301 = var3305
		
		if var3302 == protoModule.wireTypes.varint then
			local _ = nil
			local var3307, var3308 = protoModule.readVarInt(p167, var3301)
			local _ = var3307
			var3301 = var3308
			continue
		end
		if var3302 == protoModule.wireTypes.lengthDelimited then
			if var3306 == 1 then
				local _ = nil
				local var3309, var3310 = protoModule.readBuffer(p167, var3301)
				var3301 = var3310
				var3300.id = buffer.tostring(var3309)
			elseif var3306 == 2 then
				local _ = nil
				local var3311, var3312 = protoModule.readBuffer(p167, var3301)
				var3301 = var3312
				var3300.available_until = buffer.tostring(var3311)
			elseif var3306 == 3 then
				local _ = nil
				local var3313, var3314 = protoModule.readBuffer(p167, var3301)
				var3301 = var3314
				var3300.widget_style = t.WidgetStyleData.decode(var3313)
			else
				local _ = nil
				local var3315, var3316 = protoModule.readVarInt(p167, var3301)
				var3301 = var3316 + var3315
			end
		elseif var3302 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3317, var3318 = protoModule.readFixed32(p167, var3301)
			local _ = var3317
			var3301 = var3318
		elseif var3302 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3319, var3320 = protoModule.readFixed64(p167, var3301)
			local _ = var3319
			var3301 = var3320
		else
			error("Unsupported wire type: " .. var3302)
		end
	end
	return var3300
end

function t_83:jsonEncode() --[[ line: 18931 ]]
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

function t_83:jsonDecode() --[[ line: 18949 ]]
	-- upvalues: t_83 (ref), t (ref)
	local var3322 = t_83.new()
	
	if self.id ~= nil then
		var3322.id = self.id
	end
	if self.available_until ~= nil then
		var3322.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var3322.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var3322.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3322.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var3322
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p168) --[[ line: 18991 ]]
	-- upvalues: t_84 (ref)
	return setmetatable({
		entry_map = if p168 == nil or p168.entry_map == nil then {} else p168.entry_map,
		entry_order = if p168 == nil or p168.entry_order == nil then {} else p168.entry_order
	}, t_84)
end

function t_84:encode() --[[ line: 19000 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3324 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3325, var3326 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3325, var3326 = protoModule.writeString(var3325, var3326, i)
			local var3327 = v:encode()
			var3326, var3328 = protoModule.writeTag(var3325, var3326, 2, protoModule.wireTypes.lengthDelimited)
			var3326, var3328 = protoModule.writeBuffer(var3326, var3328, var3327, buffer.len(var3327))
			local var3329 = var3326
			local var3330 = var3328
			local var3331, var3332 = protoModule.writeTag(buff, var3324, 1, protoModule.wireTypes.lengthDelimited)
			var3331, var3332 = protoModule.writeBuffer(var3331, var3332, var3329, var3330)
			buff = var3331
			var3324 = var3332
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3333, var3334 = protoModule.writeTag(buff, var3324, 2, protoModule.wireTypes.lengthDelimited)
			var3333, var3334 = protoModule.writeString(var3333, var3334, v)
			buff = var3333
			var3324 = var3334
		end
	end
	local buff_1 = buffer.create(var3324)
	buffer.copy(buff_1, 0, buff, 0, var3324)
	
	return buff_1
end

function t_84.decode(p169) --[[ line: 19030 ]]
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var3336 = t_84.new()
	local var3337 = 0
	while var3337 < buffer.len(p169) do
		local _ = nil
		local var3338 = nil
		local var3339, var3340, var3341 = protoModule.readTag(p169, var3337)
		local var3342 = var3339
		var3338 = var3340
		var3337 = var3341
		
		if var3338 == protoModule.wireTypes.varint then
			local _ = nil
			local var3343, var3344 = protoModule.readVarInt(p169, var3337)
			local _ = var3343
			var3337 = var3344
			continue
		end
		if var3338 == protoModule.wireTypes.lengthDelimited then
			if var3342 == 1 then
				local _ = nil
				local var3345, var3346 = protoModule.readBuffer(p169, var3337)
				var3337 = var3346
				var3345 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var3345)
				var3336.entry_map[var3345.key or ""] = var3345.value or t.FeedEntry.new()
			elseif var3342 == 2 then
				local _ = nil
				local var3347, var3348 = protoModule.readBuffer(p169, var3337)
				var3337 = var3348
				table.insert(var3336.entry_order, buffer.tostring(var3347))
			else
				local _ = nil
				local var3349, var3350 = protoModule.readVarInt(p169, var3337)
				var3337 = var3350 + var3349
			end
		elseif var3338 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3351, var3352 = protoModule.readFixed32(p169, var3337)
			local _ = var3351
			var3337 = var3352
		elseif var3338 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3353, var3354 = protoModule.readFixed64(p169, var3337)
			local _ = var3353
			var3337 = var3354
		else
			error("Unsupported wire type: " .. var3338)
		end
	end
	return var3336
end

function t_84:jsonEncode() --[[ line: 19085 ]]
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

function t_84:jsonDecode() --[[ line: 19107 ]]
	-- upvalues: t_84 (ref), t (ref)
	local var3358 = t_84.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3358.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3358.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3358.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3358.entry_order = t_1
	end
	return var3358
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p170) --[[ line: 19165 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		key = if p170 == nil or p170.key == nil then "" else p170.key,
		value = if p170 == nil or p170.value == nil then nil else p170.value
	}, t_85)
end

function t_85:encode() --[[ line: 19174 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3364 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3365, var3366 = protoModule.writeTag(buff, var3364, 1, protoModule.wireTypes.lengthDelimited)
		var3365, var3366 = protoModule.writeString(var3365, var3366, self.key)
		buff = var3365
		var3364 = var3366
	end
	if self.value ~= nil then
		local var3367 = self.value:encode()
		local var3368, var3369 = protoModule.writeTag(buff, var3364, 2, protoModule.wireTypes.lengthDelimited)
		var3368, var3369 = protoModule.writeBuffer(var3368, var3369, var3367, buffer.len(var3367))
		buff = var3368
		var3364 = var3369
	end
	local buff_1 = buffer.create(var3364)
	buffer.copy(buff_1, 0, buff, 0, var3364)
	
	return buff_1
end

function t_85.decode(p171) --[[ line: 19196 ]]
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var3371 = t_85.new()
	local var3372 = 0
	while var3372 < buffer.len(p171) do
		local _ = nil
		local var3373 = nil
		local var3374, var3375, var3376 = protoModule.readTag(p171, var3372)
		local var3377 = var3374
		var3373 = var3375
		var3372 = var3376
		
		if var3373 == protoModule.wireTypes.varint then
			local _ = nil
			local var3378, var3379 = protoModule.readVarInt(p171, var3372)
			local _ = var3378
			var3372 = var3379
			continue
		end
		if var3373 == protoModule.wireTypes.lengthDelimited then
			if var3377 == 1 then
				local _ = nil
				local var3380, var3381 = protoModule.readBuffer(p171, var3372)
				var3372 = var3381
				var3371.key = buffer.tostring(var3380)
			elseif var3377 == 2 then
				local _ = nil
				local var3382, var3383 = protoModule.readBuffer(p171, var3372)
				var3372 = var3383
				var3371.value = t.FeedEntry.decode(var3382)
			else
				local _ = nil
				local var3384, var3385 = protoModule.readVarInt(p171, var3372)
				var3372 = var3385 + var3384
			end
		elseif var3373 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3386, var3387 = protoModule.readFixed32(p171, var3372)
			local _ = var3386
			var3372 = var3387
		elseif var3373 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3388, var3389 = protoModule.readFixed64(p171, var3372)
			local _ = var3388
			var3372 = var3389
		else
			error("Unsupported wire type: " .. var3373)
		end
	end
	return var3371
end

function t_85:jsonEncode() --[[ line: 19246 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_85:jsonDecode() --[[ line: 19262 ]]
	-- upvalues: t_85 (ref), t (ref)
	local var3391 = t_85.new()
	
	if self.key ~= nil then
		var3391.key = self.key
	end
	if self.value ~= nil then
		var3391.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3391
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p172) --[[ line: 19293 ]]
	-- upvalues: t_86 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p172 == nil or p172.marketplace_catalog_category_items == nil then {} else p172.marketplace_catalog_category_items,
		active_category_id = if p172 == nil or p172.active_category_id == nil then "" else p172.active_category_id,
		active_tooltip_idx = if p172 == nil or p172.active_tooltip_idx == nil then 0 else p172.active_tooltip_idx
	}, t_86)
end

function t_86:encode() --[[ line: 19306 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3393 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var3394 = v:encode()
			local var3395, var3396 = protoModule.writeTag(buff, var3393, 1, protoModule.wireTypes.lengthDelimited)
			var3395, var3396 = protoModule.writeBuffer(var3395, var3396, var3394, buffer.len(var3394))
			buff = var3395
			var3393 = var3396
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var3397, var3398 = protoModule.writeTag(buff, var3393, 2, protoModule.wireTypes.lengthDelimited)
		var3397, var3398 = protoModule.writeString(var3397, var3398, self.active_category_id)
		buff = var3397
		var3393 = var3398
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var3399, var3400 = protoModule.writeTag(buff, var3393, 3, protoModule.wireTypes.varint)
		var3399, var3400 = protoModule.writeVarInt(var3399, var3400, self.active_tooltip_idx)
		buff = var3399
		var3393 = var3400
	end
	local buff_1 = buffer.create(var3393)
	buffer.copy(buff_1, 0, buff, 0, var3393)
	
	return buff_1
end

function t_86.decode(p173) --[[ line: 19335 ]]
	-- upvalues: t_86 (ref), protoModule (ref), t (ref)
	local var3402 = t_86.new()
	local var3403 = 0
	while var3403 < buffer.len(p173) do
		local _ = nil
		local var3404 = nil
		local var3405, var3406, var3407 = protoModule.readTag(p173, var3403)
		local var3408 = var3405
		var3404 = var3406
		var3403 = var3407
		
		if var3404 == protoModule.wireTypes.varint then
			if var3408 == 3 then
				local _ = nil
				local var3409, var3410 = protoModule.readVarIntI64(p173, var3403)
				var3403 = var3410
				var3402.active_tooltip_idx = var3409
			else
				local _ = nil
				local var3411, var3412 = protoModule.readVarInt(p173, var3403)
				local _ = var3411
				var3403 = var3412
			end
		end
		if var3404 == protoModule.wireTypes.lengthDelimited then
			if var3408 == 1 then
				local _ = nil
				local var3413, var3414 = protoModule.readBuffer(p173, var3403)
				var3403 = var3414
				table.insert(var3402.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var3413))
			elseif var3408 == 2 then
				local _ = nil
				local var3415, var3416 = protoModule.readBuffer(p173, var3403)
				var3403 = var3416
				var3402.active_category_id = buffer.tostring(var3415)
			else
				local _ = nil
				local var3417, var3418 = protoModule.readVarInt(p173, var3403)
				var3403 = var3418 + var3417
			end
		elseif var3404 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3419, var3420 = protoModule.readFixed32(p173, var3403)
			local _ = var3419
			var3403 = var3420
		elseif var3404 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3421, var3422 = protoModule.readFixed64(p173, var3403)
			local _ = var3421
			var3403 = var3422
		else
			error("Unsupported wire type: " .. var3404)
		end
	end
	return var3402
end

function t_86:jsonEncode() --[[ line: 19393 ]]
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

function t_86:jsonDecode() --[[ line: 19417 ]]
	-- upvalues: t_86 (ref), t (ref)
	local var3425 = t_86.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3425.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3425.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var3425.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var3425.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var3425.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var3425.active_tooltip_idx = self.activeTooltipIdx
	end
	return var3425
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p174) --[[ line: 19480 ]]
	-- upvalues: t_87 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p174 == nil or p174.marketplace_catalog_category_item_id == nil then "" else p174.marketplace_catalog_category_item_id
	}, t_87)
end

function t_87:encode() --[[ line: 19494 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3429 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var3430, var3431 = protoModule.writeTag(buff, var3429, 1, protoModule.wireTypes.lengthDelimited)
		var3430, var3431 = protoModule.writeString(var3430, var3431, self.marketplace_catalog_category_item_id)
		buff = var3430
		var3429 = var3431
	end
	local buff_1 = buffer.create(var3429)
	buffer.copy(buff_1, 0, buff, 0, var3429)
	
	return buff_1
end

function t_87.decode(p175) --[[ line: 19510 ]]
	-- upvalues: t_87 (ref), protoModule (ref)
	local var3433 = t_87.new()
	local var3434 = 0
	while var3434 < buffer.len(p175) do
		local _ = nil
		local var3435 = nil
		local var3436, var3437, var3438 = protoModule.readTag(p175, var3434)
		local var3439 = var3436
		var3435 = var3437
		var3434 = var3438
		
		if var3435 == protoModule.wireTypes.varint then
			local _ = nil
			local var3440, var3441 = protoModule.readVarInt(p175, var3434)
			local _ = var3440
			var3434 = var3441
			continue
		end
		if var3435 == protoModule.wireTypes.lengthDelimited then
			if var3439 == 1 then
				local _ = nil
				local var3442, var3443 = protoModule.readBuffer(p175, var3434)
				var3434 = var3443
				var3433.marketplace_catalog_category_item_id = buffer.tostring(var3442)
			else
				local _ = nil
				local var3444, var3445 = protoModule.readVarInt(p175, var3434)
				var3434 = var3445 + var3444
			end
		elseif var3435 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3446, var3447 = protoModule.readFixed32(p175, var3434)
			local _ = var3446
			var3434 = var3447
		elseif var3435 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3448, var3449 = protoModule.readFixed64(p175, var3434)
			local _ = var3448
			var3434 = var3449
		else
			error("Unsupported wire type: " .. var3435)
		end
	end
	return var3433
end

function t_87:jsonEncode() --[[ line: 19555 ]]
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_87:jsonDecode() --[[ line: 19567 ]]
	-- upvalues: t_87 (ref)
	local var3451 = t_87.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var3451.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var3451.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var3451
end

t_87.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_87
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p176) --[[ line: 19600 ]]
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

function t_88:encode() --[[ line: 19622 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3453 = 0
	
	if self.hero_icon ~= nil then
		local var3454, var3455 = protoModule.writeTag(buff, var3453, 1, protoModule.wireTypes.lengthDelimited)
		var3454, var3455 = protoModule.writeString(var3454, var3455, self.hero_icon)
		buff = var3454
		var3453 = var3455
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var3456, var3457 = protoModule.writeTag(buff, var3453, 2, protoModule.wireTypes.lengthDelimited)
		var3456, var3457 = protoModule.writeString(var3456, var3457, self.body_dismiss_button_text)
		buff = var3456
		var3453 = var3457
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var3458, var3459 = protoModule.writeTag(buff, var3453, 3, protoModule.wireTypes.lengthDelimited)
		var3458, var3459 = protoModule.writeString(var3458, var3459, self.body_title)
		buff = var3458
		var3453 = var3459
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var3460, var3461 = protoModule.writeTag(buff, var3453, 4, protoModule.wireTypes.lengthDelimited)
		var3460, var3461 = protoModule.writeString(var3460, var3461, self.body_rich_text)
		buff = var3460
		var3453 = var3461
	end
	if self.terms_link_text ~= nil then
		local var3462, var3463 = protoModule.writeTag(buff, var3453, 5, protoModule.wireTypes.lengthDelimited)
		var3462, var3463 = protoModule.writeString(var3462, var3463, self.terms_link_text)
		buff = var3462
		var3453 = var3463
	end
	if self.terms_title ~= nil then
		local var3464, var3465 = protoModule.writeTag(buff, var3453, 6, protoModule.wireTypes.lengthDelimited)
		var3464, var3465 = protoModule.writeString(var3464, var3465, self.terms_title)
		buff = var3464
		var3453 = var3465
	end
	if self.terms_body_rich_text ~= nil then
		local var3466, var3467 = protoModule.writeTag(buff, var3453, 7, protoModule.wireTypes.lengthDelimited)
		var3466, var3467 = protoModule.writeString(var3466, var3467, self.terms_body_rich_text)
		buff = var3466
		var3453 = var3467
	end
	if self.terms_dismiss_button_text ~= nil then
		local var3468, var3469 = protoModule.writeTag(buff, var3453, 8, protoModule.wireTypes.lengthDelimited)
		var3468, var3469 = protoModule.writeString(var3468, var3469, self.terms_dismiss_button_text)
		buff = var3468
		var3453 = var3469
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var3470, var3471 = protoModule.writeTag(buff, var3453, 9, protoModule.wireTypes.lengthDelimited)
		var3470, var3471 = protoModule.writeString(var3470, var3471, self.offer_id)
		buff = var3470
		var3453 = var3471
	end
	local buff_1 = buffer.create(var3453)
	buffer.copy(buff_1, 0, buff, 0, var3453)
	
	return buff_1
end

function t_88.decode(p177) --[[ line: 19676 ]]
	-- upvalues: t_88 (ref), protoModule (ref)
	local var3473 = t_88.new()
	local var3474 = 0
	while var3474 < buffer.len(p177) do
		local _ = nil
		local var3475 = nil
		local var3476, var3477, var3478 = protoModule.readTag(p177, var3474)
		local var3479 = var3476
		var3475 = var3477
		var3474 = var3478
		
		if var3475 == protoModule.wireTypes.varint then
			local _ = nil
			local var3480, var3481 = protoModule.readVarInt(p177, var3474)
			local _ = var3480
			var3474 = var3481
			continue
		end
		if var3475 == protoModule.wireTypes.lengthDelimited then
			if var3479 == 1 then
				local _ = nil
				local var3482, var3483 = protoModule.readBuffer(p177, var3474)
				var3474 = var3483
				var3473.hero_icon = buffer.tostring(var3482)
			elseif var3479 == 2 then
				local _ = nil
				local var3484, var3485 = protoModule.readBuffer(p177, var3474)
				var3474 = var3485
				var3473.body_dismiss_button_text = buffer.tostring(var3484)
			elseif var3479 == 3 then
				local _ = nil
				local var3486, var3487 = protoModule.readBuffer(p177, var3474)
				var3474 = var3487
				var3473.body_title = buffer.tostring(var3486)
			elseif var3479 == 4 then
				local _ = nil
				local var3488, var3489 = protoModule.readBuffer(p177, var3474)
				var3474 = var3489
				var3473.body_rich_text = buffer.tostring(var3488)
			elseif var3479 == 5 then
				local _ = nil
				local var3490, var3491 = protoModule.readBuffer(p177, var3474)
				var3474 = var3491
				var3473.terms_link_text = buffer.tostring(var3490)
			elseif var3479 == 6 then
				local _ = nil
				local var3492, var3493 = protoModule.readBuffer(p177, var3474)
				var3474 = var3493
				var3473.terms_title = buffer.tostring(var3492)
			elseif var3479 == 7 then
				local _ = nil
				local var3494, var3495 = protoModule.readBuffer(p177, var3474)
				var3474 = var3495
				var3473.terms_body_rich_text = buffer.tostring(var3494)
			elseif var3479 == 8 then
				local _ = nil
				local var3496, var3497 = protoModule.readBuffer(p177, var3474)
				var3474 = var3497
				var3473.terms_dismiss_button_text = buffer.tostring(var3496)
			elseif var3479 == 9 then
				local _ = nil
				local var3498, var3499 = protoModule.readBuffer(p177, var3474)
				var3474 = var3499
				var3473.offer_id = buffer.tostring(var3498)
			else
				local _ = nil
				local var3500, var3501 = protoModule.readVarInt(p177, var3474)
				var3474 = var3501 + var3500
			end
		elseif var3475 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3502, var3503 = protoModule.readFixed32(p177, var3474)
			local _ = var3502
			var3474 = var3503
		elseif var3475 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3504, var3505 = protoModule.readFixed64(p177, var3474)
			local _ = var3504
			var3474 = var3505
		else
			error("Unsupported wire type: " .. var3475)
		end
	end
	return var3473
end

function t_88:jsonEncode() --[[ line: 19759 ]]
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

function t_88:jsonDecode() --[[ line: 19801 ]]
	-- upvalues: t_88 (ref)
	local var3507 = t_88.new()
	
	if self.hero_icon ~= nil then
		var3507.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var3507.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var3507.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var3507.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var3507.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var3507.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var3507.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var3507.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var3507.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var3507.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var3507.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var3507.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var3507.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var3507.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var3507.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var3507.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var3507.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var3507.offer_id = self.offerId
	end
	return var3507
end

t_88.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_88
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p178) --[[ line: 19893 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		items = if p178 == nil or p178.items == nil then {} else p178.items,
		preview_columns = if p178 == nil or p178.preview_columns == nil then 0 else p178.preview_columns,
		impression_id = if p178 == nil or p178.impression_id == nil then "" else p178.impression_id
	}, t_89)
end

function t_89:encode() --[[ line: 19901 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3509 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3510 = v:encode()
			local var3511, var3512 = protoModule.writeTag(buff, var3509, 1, protoModule.wireTypes.lengthDelimited)
			var3511, var3512 = protoModule.writeBuffer(var3511, var3512, var3510, buffer.len(var3510))
			buff = var3511
			var3509 = var3512
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var3513, var3514 = protoModule.writeTag(buff, var3509, 2, protoModule.wireTypes.varint)
		var3513, var3514 = protoModule.writeVarInt(var3513, var3514, self.preview_columns)
		buff = var3513
		var3509 = var3514
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var3515, var3516 = protoModule.writeTag(buff, var3509, 3, protoModule.wireTypes.lengthDelimited)
		var3515, var3516 = protoModule.writeString(var3515, var3516, self.impression_id)
		buff = var3515
		var3509 = var3516
	end
	local buff_1 = buffer.create(var3509)
	buffer.copy(buff_1, 0, buff, 0, var3509)
	
	return buff_1
end

function t_89.decode(p179) --[[ line: 19928 ]]
	-- upvalues: t_89 (ref), protoModule (ref), t (ref)
	local var3518 = t_89.new()
	local var3519 = 0
	while var3519 < buffer.len(p179) do
		local _ = nil
		local var3520 = nil
		local var3521, var3522, var3523 = protoModule.readTag(p179, var3519)
		local var3524 = var3521
		var3520 = var3522
		var3519 = var3523
		
		if var3520 == protoModule.wireTypes.varint then
			if var3524 == 2 then
				local _ = nil
				local var3525, var3526 = protoModule.readVarIntI32(p179, var3519)
				var3519 = var3526
				var3518.preview_columns = var3525
			else
				local _ = nil
				local var3527, var3528 = protoModule.readVarInt(p179, var3519)
				local _ = var3527
				var3519 = var3528
			end
		end
		if var3520 == protoModule.wireTypes.lengthDelimited then
			if var3524 == 1 then
				local _ = nil
				local var3529, var3530 = protoModule.readBuffer(p179, var3519)
				var3519 = var3530
				table.insert(var3518.items, t.CatalogItemGridInputData_CatalogItem.decode(var3529))
			elseif var3524 == 3 then
				local _ = nil
				local var3531, var3532 = protoModule.readBuffer(p179, var3519)
				var3519 = var3532
				var3518.impression_id = buffer.tostring(var3531)
			else
				local _ = nil
				local var3533, var3534 = protoModule.readVarInt(p179, var3519)
				var3519 = var3534 + var3533
			end
		elseif var3520 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3535, var3536 = protoModule.readFixed32(p179, var3519)
			local _ = var3535
			var3519 = var3536
		elseif var3520 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3537, var3538 = protoModule.readFixed64(p179, var3519)
			local _ = var3537
			var3519 = var3538
		else
			error("Unsupported wire type: " .. var3520)
		end
	end
	return var3518
end

function t_89:jsonEncode() --[[ line: 19981 ]]
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

function t_89:jsonDecode() --[[ line: 20003 ]]
	-- upvalues: t_89 (ref), t (ref)
	local var3541 = t_89.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var3541.items = t_1
	end
	if self.preview_columns ~= nil then
		var3541.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var3541.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var3541.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var3541.impression_id = self.impressionId
	end
	return var3541
end

t_89.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_89
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p180) --[[ line: 20048 ]]
	-- upvalues: t_90 (ref)
	return setmetatable({
		id = if p180 == nil or p180.id == nil then "" else p180.id,
		type = if p180 == nil or p180.type == nil then "" else p180.type
	}, t_90)
end

function t_90:encode() --[[ line: 20057 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3544 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3545, var3546 = protoModule.writeTag(buff, var3544, 1, protoModule.wireTypes.lengthDelimited)
		var3545, var3546 = protoModule.writeString(var3545, var3546, self.id)
		buff = var3545
		var3544 = var3546
	end
	if self.type ~= nil and self.type ~= "" then
		local var3547, var3548 = protoModule.writeTag(buff, var3544, 2, protoModule.wireTypes.lengthDelimited)
		var3547, var3548 = protoModule.writeString(var3547, var3548, self.type)
		buff = var3547
		var3544 = var3548
	end
	local buff_1 = buffer.create(var3544)
	buffer.copy(buff_1, 0, buff, 0, var3544)
	
	return buff_1
end

function t_90.decode(p181) --[[ line: 20076 ]]
	-- upvalues: t_90 (ref), protoModule (ref)
	local var3550 = t_90.new()
	local var3551 = 0
	while var3551 < buffer.len(p181) do
		local _ = nil
		local var3552 = nil
		local var3553, var3554, var3555 = protoModule.readTag(p181, var3551)
		local var3556 = var3553
		var3552 = var3554
		var3551 = var3555
		
		if var3552 == protoModule.wireTypes.varint then
			local _ = nil
			local var3557, var3558 = protoModule.readVarInt(p181, var3551)
			local _ = var3557
			var3551 = var3558
			continue
		end
		if var3552 == protoModule.wireTypes.lengthDelimited then
			if var3556 == 1 then
				local _ = nil
				local var3559, var3560 = protoModule.readBuffer(p181, var3551)
				var3551 = var3560
				var3550.id = buffer.tostring(var3559)
			elseif var3556 == 2 then
				local _ = nil
				local var3561, var3562 = protoModule.readBuffer(p181, var3551)
				var3551 = var3562
				var3550.type = buffer.tostring(var3561)
			else
				local _ = nil
				local var3563, var3564 = protoModule.readVarInt(p181, var3551)
				var3551 = var3564 + var3563
			end
		elseif var3552 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3565, var3566 = protoModule.readFixed32(p181, var3551)
			local _ = var3565
			var3551 = var3566
		elseif var3552 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3567, var3568 = protoModule.readFixed64(p181, var3551)
			local _ = var3567
			var3551 = var3568
		else
			error("Unsupported wire type: " .. var3552)
		end
	end
	return var3550
end

function t_90:jsonEncode() --[[ line: 20124 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_90:jsonDecode() --[[ line: 20138 ]]
	-- upvalues: t_90 (ref)
	local var3570 = t_90.new()
	
	if self.id ~= nil then
		var3570.id = self.id
	end
	if self.type ~= nil then
		var3570.type = self.type
	end
	return var3570
end

t_90.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_90
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p182) --[[ line: 20168 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		entry_map = if p182 == nil or p182.entry_map == nil then {} else p182.entry_map,
		entry_order = if p182 == nil or p182.entry_order == nil then {} else p182.entry_order,
		content_pools = if p182 == nil or p182.content_pools == nil then {} else p182.content_pools,
		search_session_id = if p182 == nil or p182.search_session_id == nil then "" else p182.search_session_id
	}, t_91)
end

function t_91:encode() --[[ line: 20179 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3572 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3573, var3574 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3573, var3574 = protoModule.writeString(var3573, var3574, i)
			local var3575 = v:encode()
			var3574, var3576 = protoModule.writeTag(var3573, var3574, 2, protoModule.wireTypes.lengthDelimited)
			var3574, var3576 = protoModule.writeBuffer(var3574, var3576, var3575, buffer.len(var3575))
			local var3577 = var3574
			local var3578 = var3576
			local var3579, var3580 = protoModule.writeTag(buff, var3572, 1, protoModule.wireTypes.lengthDelimited)
			var3579, var3580 = protoModule.writeBuffer(var3579, var3580, var3577, var3578)
			buff = var3579
			var3572 = var3580
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3581, var3582 = protoModule.writeTag(buff, var3572, 2, protoModule.wireTypes.lengthDelimited)
			var3581, var3582 = protoModule.writeString(var3581, var3582, v)
			buff = var3581
			var3572 = var3582
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3583, var3584 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3583, var3584 = protoModule.writeString(var3583, var3584, i)
			local var3585 = v:encode()
			var3584, var3586 = protoModule.writeTag(var3583, var3584, 2, protoModule.wireTypes.lengthDelimited)
			var3584, var3586 = protoModule.writeBuffer(var3584, var3586, var3585, buffer.len(var3585))
			local var3587 = var3584
			local var3588 = var3586
			local var3589, var3590 = protoModule.writeTag(buff, var3572, 3, protoModule.wireTypes.lengthDelimited)
			var3589, var3590 = protoModule.writeBuffer(var3589, var3590, var3587, var3588)
			buff = var3589
			var3572 = var3590
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var3591, var3592 = protoModule.writeTag(buff, var3572, 4, protoModule.wireTypes.lengthDelimited)
		var3591, var3592 = protoModule.writeString(var3591, var3592, self.search_session_id)
		buff = var3591
		var3572 = var3592
	end
	local buff_1 = buffer.create(var3572)
	buffer.copy(buff_1, 0, buff, 0, var3572)
	
	return buff_1
end

function t_91.decode(p183) --[[ line: 20228 ]]
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3594 = t_91.new()
	local var3595 = 0
	while var3595 < buffer.len(p183) do
		local _ = nil
		local var3596 = nil
		local var3597, var3598, var3599 = protoModule.readTag(p183, var3595)
		local var3600 = var3597
		var3596 = var3598
		var3595 = var3599
		
		if var3596 == protoModule.wireTypes.varint then
			local _ = nil
			local var3601, var3602 = protoModule.readVarInt(p183, var3595)
			local _ = var3601
			var3595 = var3602
			continue
		end
		if var3596 == protoModule.wireTypes.lengthDelimited then
			if var3600 == 1 then
				local _ = nil
				local var3603, var3604 = protoModule.readBuffer(p183, var3595)
				var3595 = var3604
				var3603 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var3603)
				var3594.entry_map[var3603.key or ""] = var3603.value or t.FeedEntry.new()
			elseif var3600 == 2 then
				local _ = nil
				local var3605, var3606 = protoModule.readBuffer(p183, var3595)
				var3595 = var3606
				table.insert(var3594.entry_order, buffer.tostring(var3605))
			elseif var3600 == 3 then
				local _ = nil
				local var3607, var3608 = protoModule.readBuffer(p183, var3595)
				var3595 = var3608
				var3607 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var3607)
				var3594.content_pools[var3607.key or ""] = var3607.value or t.ContentPool.new()
			elseif var3600 == 4 then
				local _ = nil
				local var3609, var3610 = protoModule.readBuffer(p183, var3595)
				var3595 = var3610
				var3594.search_session_id = buffer.tostring(var3609)
			else
				local _ = nil
				local var3611, var3612 = protoModule.readVarInt(p183, var3595)
				var3595 = var3612 + var3611
			end
		elseif var3596 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3613, var3614 = protoModule.readFixed32(p183, var3595)
			local _ = var3613
			var3595 = var3614
		elseif var3596 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3615, var3616 = protoModule.readFixed64(p183, var3595)
			local _ = var3615
			var3595 = var3616
		else
			error("Unsupported wire type: " .. var3596)
		end
	end
	return var3594
end

function t_91:jsonEncode() --[[ line: 20300 ]]
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

function t_91:jsonDecode() --[[ line: 20334 ]]
	-- upvalues: t_91 (ref), t (ref)
	local var3621 = t_91.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3621.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3621.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3621.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3621.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3621.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3621.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var3621.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var3621.search_session_id = self.searchSessionId
	end
	return var3621
end

t_91.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_91
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p184) --[[ line: 20416 ]]
	-- upvalues: t_92 (ref)
	return setmetatable({
		key = if p184 == nil or p184.key == nil then "" else p184.key,
		value = if p184 == nil or p184.value == nil then nil else p184.value
	}, t_92)
end

function t_92:encode() --[[ line: 20425 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3629 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3630, var3631 = protoModule.writeTag(buff, var3629, 1, protoModule.wireTypes.lengthDelimited)
		var3630, var3631 = protoModule.writeString(var3630, var3631, self.key)
		buff = var3630
		var3629 = var3631
	end
	if self.value ~= nil then
		local var3632 = self.value:encode()
		local var3633, var3634 = protoModule.writeTag(buff, var3629, 2, protoModule.wireTypes.lengthDelimited)
		var3633, var3634 = protoModule.writeBuffer(var3633, var3634, var3632, buffer.len(var3632))
		buff = var3633
		var3629 = var3634
	end
	local buff_1 = buffer.create(var3629)
	buffer.copy(buff_1, 0, buff, 0, var3629)
	
	return buff_1
end

function t_92.decode(p185) --[[ line: 20447 ]]
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3636 = t_92.new()
	local var3637 = 0
	while var3637 < buffer.len(p185) do
		local _ = nil
		local var3638 = nil
		local var3639, var3640, var3641 = protoModule.readTag(p185, var3637)
		local var3642 = var3639
		var3638 = var3640
		var3637 = var3641
		
		if var3638 == protoModule.wireTypes.varint then
			local _ = nil
			local var3643, var3644 = protoModule.readVarInt(p185, var3637)
			local _ = var3643
			var3637 = var3644
			continue
		end
		if var3638 == protoModule.wireTypes.lengthDelimited then
			if var3642 == 1 then
				local _ = nil
				local var3645, var3646 = protoModule.readBuffer(p185, var3637)
				var3637 = var3646
				var3636.key = buffer.tostring(var3645)
			elseif var3642 == 2 then
				local _ = nil
				local var3647, var3648 = protoModule.readBuffer(p185, var3637)
				var3637 = var3648
				var3636.value = t.FeedEntry.decode(var3647)
			else
				local _ = nil
				local var3649, var3650 = protoModule.readVarInt(p185, var3637)
				var3637 = var3650 + var3649
			end
		elseif var3638 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3651, var3652 = protoModule.readFixed32(p185, var3637)
			local _ = var3651
			var3637 = var3652
		elseif var3638 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3653, var3654 = protoModule.readFixed64(p185, var3637)
			local _ = var3653
			var3637 = var3654
		else
			error("Unsupported wire type: " .. var3638)
		end
	end
	return var3636
end

function t_92:jsonEncode() --[[ line: 20497 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_92:jsonDecode() --[[ line: 20513 ]]
	-- upvalues: t_92 (ref), t (ref)
	local var3656 = t_92.new()
	
	if self.key ~= nil then
		var3656.key = self.key
	end
	if self.value ~= nil then
		var3656.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3656
end

t_92.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_92
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p186) --[[ line: 20543 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		key = if p186 == nil or p186.key == nil then "" else p186.key,
		value = if p186 == nil or p186.value == nil then nil else p186.value
	}, t_93)
end

function t_93:encode() --[[ line: 20552 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3658 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3659, var3660 = protoModule.writeTag(buff, var3658, 1, protoModule.wireTypes.lengthDelimited)
		var3659, var3660 = protoModule.writeString(var3659, var3660, self.key)
		buff = var3659
		var3658 = var3660
	end
	if self.value ~= nil then
		local var3661 = self.value:encode()
		local var3662, var3663 = protoModule.writeTag(buff, var3658, 2, protoModule.wireTypes.lengthDelimited)
		var3662, var3663 = protoModule.writeBuffer(var3662, var3663, var3661, buffer.len(var3661))
		buff = var3662
		var3658 = var3663
	end
	local buff_1 = buffer.create(var3658)
	buffer.copy(buff_1, 0, buff, 0, var3658)
	
	return buff_1
end

function t_93.decode(p187) --[[ line: 20574 ]]
	-- upvalues: t_93 (ref), protoModule (ref), t (ref)
	local var3665 = t_93.new()
	local var3666 = 0
	while var3666 < buffer.len(p187) do
		local _ = nil
		local var3667 = nil
		local var3668, var3669, var3670 = protoModule.readTag(p187, var3666)
		local var3671 = var3668
		var3667 = var3669
		var3666 = var3670
		
		if var3667 == protoModule.wireTypes.varint then
			local _ = nil
			local var3672, var3673 = protoModule.readVarInt(p187, var3666)
			local _ = var3672
			var3666 = var3673
			continue
		end
		if var3667 == protoModule.wireTypes.lengthDelimited then
			if var3671 == 1 then
				local _ = nil
				local var3674, var3675 = protoModule.readBuffer(p187, var3666)
				var3666 = var3675
				var3665.key = buffer.tostring(var3674)
			elseif var3671 == 2 then
				local _ = nil
				local var3676, var3677 = protoModule.readBuffer(p187, var3666)
				var3666 = var3677
				var3665.value = t.ContentPool.decode(var3676)
			else
				local _ = nil
				local var3678, var3679 = protoModule.readVarInt(p187, var3666)
				var3666 = var3679 + var3678
			end
		elseif var3667 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3680, var3681 = protoModule.readFixed32(p187, var3666)
			local _ = var3680
			var3666 = var3681
		elseif var3667 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3682, var3683 = protoModule.readFixed64(p187, var3666)
			local _ = var3682
			var3666 = var3683
		else
			error("Unsupported wire type: " .. var3667)
		end
	end
	return var3665
end

function t_93:jsonEncode() --[[ line: 20624 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_93:jsonDecode() --[[ line: 20640 ]]
	-- upvalues: t_93 (ref), t (ref)
	local var3685 = t_93.new()
	
	if self.key ~= nil then
		var3685.key = self.key
	end
	if self.value ~= nil then
		var3685.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3685
end

t_93.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_93
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p188) --[[ line: 20670 ]]
	-- upvalues: t_94 (ref)
	return setmetatable({
		universe_id = if p188 == nil or p188.universe_id == nil then "" else p188.universe_id,
		is_content_locked = if p188 == nil or p188.is_content_locked == nil then false else p188.is_content_locked
	}, t_94)
end

function t_94:encode() --[[ line: 20679 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3687 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3688, var3689 = protoModule.writeTag(buff, var3687, 1, protoModule.wireTypes.lengthDelimited)
		var3688, var3689 = protoModule.writeString(var3688, var3689, self.universe_id)
		buff = var3688
		var3687 = var3689
	end
	if self.is_content_locked then
		local var3690, var3691 = protoModule.writeTag(buff, var3687, 2, protoModule.wireTypes.varint)
		var3690, var3691 = protoModule.writeVarInt(var3690, var3691, if self.is_content_locked then 1 else 0)
		buff = var3690
		var3687 = var3691
	end
	local buff_1 = buffer.create(var3687)
	buffer.copy(buff_1, 0, buff, 0, var3687)
	
	return buff_1
end

function t_94.decode(p189) --[[ line: 20698 ]]
	-- upvalues: t_94 (ref), protoModule (ref)
	local var3693 = t_94.new()
	local var3694 = 0
	while var3694 < buffer.len(p189) do
		local _ = nil
		local var3695 = nil
		local var3696, var3697, var3698 = protoModule.readTag(p189, var3694)
		local var3699 = var3696
		var3695 = var3697
		var3694 = var3698
		
		if var3695 == protoModule.wireTypes.varint then
			if var3699 == 2 then
				local _ = nil
				local var3700, var3701 = protoModule.readVarInt(p189, var3694)
				var3694 = var3701
				var3693.is_content_locked = var3700 ~= 0
			else
				local _ = nil
				local var3702, var3703 = protoModule.readVarInt(p189, var3694)
				local _ = var3702
				var3694 = var3703
			end
		end
		if var3695 == protoModule.wireTypes.lengthDelimited then
			if var3699 == 1 then
				local _ = nil
				local var3704, var3705 = protoModule.readBuffer(p189, var3694)
				var3694 = var3705
				var3693.universe_id = buffer.tostring(var3704)
			else
				local _ = nil
				local var3706, var3707 = protoModule.readVarInt(p189, var3694)
				var3694 = var3707 + var3706
			end
		elseif var3695 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3708, var3709 = protoModule.readFixed32(p189, var3694)
			local _ = var3708
			var3694 = var3709
		elseif var3695 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3710, var3711 = protoModule.readFixed64(p189, var3694)
			local _ = var3710
			var3694 = var3711
		else
			error("Unsupported wire type: " .. var3695)
		end
	end
	return var3693
end

function t_94:jsonEncode() --[[ line: 20746 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_94:jsonDecode() --[[ line: 20760 ]]
	-- upvalues: t_94 (ref)
	local var3713 = t_94.new()
	
	if self.universe_id ~= nil then
		var3713.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3713.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var3713.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var3713.is_content_locked = self.isContentLocked
	end
	return var3713
end

t_94.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_94
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p190) --[[ line: 20796 ]]
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

function t_95:encode() --[[ line: 20810 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3715 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var3716, var3717 = protoModule.writeTag(buff, var3715, 1, protoModule.wireTypes.lengthDelimited)
		var3716, var3717 = protoModule.writeString(var3716, var3717, self.overview_rich_text)
		buff = var3716
		var3715 = var3717
	end
	if self.result_entry ~= nil then
		local var3718 = self.result_entry:encode()
		local var3719, var3720 = protoModule.writeTag(buff, var3715, 2, protoModule.wireTypes.lengthDelimited)
		var3719, var3720 = protoModule.writeBuffer(var3719, var3720, var3718, buffer.len(var3718))
		buff = var3719
		var3715 = var3720
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var3721, var3722 = protoModule.writeTag(buff, var3715, 3, protoModule.wireTypes.lengthDelimited)
			var3721, var3722 = protoModule.writeString(var3721, var3722, v)
			buff = var3721
			var3715 = var3722
		end
	end
	if self.show_loading then
		local var3723, var3724 = protoModule.writeTag(buff, var3715, 4, protoModule.wireTypes.varint)
		var3723, var3724 = protoModule.writeVarInt(var3723, var3724, if self.show_loading then 1 else 0)
		buff = var3723
		var3715 = var3724
	end
	if self.title ~= nil and self.title ~= "" then
		local var3725, var3726 = protoModule.writeTag(buff, var3715, 5, protoModule.wireTypes.lengthDelimited)
		var3725, var3726 = protoModule.writeString(var3725, var3726, self.title)
		buff = var3725
		var3715 = var3726
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var3727, var3728 = protoModule.writeTag(buff, var3715, 6, protoModule.wireTypes.lengthDelimited)
		var3727, var3728 = protoModule.writeString(var3727, var3728, self.search_query)
		buff = var3727
		var3715 = var3728
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var3729, var3730 = protoModule.writeTag(buff, var3715, 8, protoModule.wireTypes.lengthDelimited)
		var3729, var3730 = protoModule.writeString(var3729, var3730, self.universe_ids)
		buff = var3729
		var3715 = var3730
	end
	local buff_1 = buffer.create(var3715)
	buffer.copy(buff_1, 0, buff, 0, var3715)
	
	return buff_1
end

function t_95.decode(p191) --[[ line: 20857 ]]
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var3732 = t_95.new()
	local var3733 = 0
	while var3733 < buffer.len(p191) do
		local _ = nil
		local var3734 = nil
		local var3735, var3736, var3737 = protoModule.readTag(p191, var3733)
		local var3738 = var3735
		var3734 = var3736
		var3733 = var3737
		
		if var3734 == protoModule.wireTypes.varint then
			if var3738 == 4 then
				local _ = nil
				local var3739, var3740 = protoModule.readVarInt(p191, var3733)
				var3733 = var3740
				var3732.show_loading = var3739 ~= 0
			else
				local _ = nil
				local var3741, var3742 = protoModule.readVarInt(p191, var3733)
				local _ = var3741
				var3733 = var3742
			end
		end
		if var3734 == protoModule.wireTypes.lengthDelimited then
			if var3738 == 1 then
				local _ = nil
				local var3743, var3744 = protoModule.readBuffer(p191, var3733)
				var3733 = var3744
				var3732.overview_rich_text = buffer.tostring(var3743)
			elseif var3738 == 2 then
				local _ = nil
				local var3745, var3746 = protoModule.readBuffer(p191, var3733)
				var3733 = var3746
				var3732.result_entry = t.FeedEntry.decode(var3745)
			elseif var3738 == 3 then
				local _ = nil
				local var3747, var3748 = protoModule.readBuffer(p191, var3733)
				var3733 = var3748
				table.insert(var3732.follow_up_queries, buffer.tostring(var3747))
			elseif var3738 == 5 then
				local _ = nil
				local var3749, var3750 = protoModule.readBuffer(p191, var3733)
				var3733 = var3750
				var3732.title = buffer.tostring(var3749)
			elseif var3738 == 6 then
				local _ = nil
				local var3751, var3752 = protoModule.readBuffer(p191, var3733)
				var3733 = var3752
				var3732.search_query = buffer.tostring(var3751)
			elseif var3738 == 8 then
				local _ = nil
				local var3753, var3754 = protoModule.readBuffer(p191, var3733)
				var3733 = var3754
				var3732.universe_ids = buffer.tostring(var3753)
			else
				local _ = nil
				local var3755, var3756 = protoModule.readVarInt(p191, var3733)
				var3733 = var3756 + var3755
			end
		elseif var3734 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3757, var3758 = protoModule.readFixed32(p191, var3733)
			local _ = var3757
			var3733 = var3758
		elseif var3734 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3759, var3760 = protoModule.readFixed64(p191, var3733)
			local _ = var3759
			var3733 = var3760
		else
			error("Unsupported wire type: " .. var3734)
		end
	end
	return var3732
end

function t_95:jsonEncode() --[[ line: 20930 ]]
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

function t_95:jsonDecode() --[[ line: 20968 ]]
	-- upvalues: t_95 (ref), t (ref)
	local var3763 = t_95.new()
	
	if self.overview_rich_text ~= nil then
		var3763.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var3763.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var3763.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var3763.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var3763.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var3763.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var3763.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var3763.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var3763.title = self.title
	end
	if self.search_query ~= nil then
		var3763.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var3763.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var3763.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var3763.universe_ids = self.universeIds
	end
	return var3763
end

t_95.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_95
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p192) --[[ line: 21050 ]]
	-- upvalues: t_96 (ref)
	return setmetatable({
		title = if p192 == nil or p192.title == nil then "" else p192.title,
		user_items = if p192 == nil or p192.user_items == nil then {} else p192.user_items,
		max_visible_rows = if p192 == nil or p192.max_visible_rows == nil then 0 else p192.max_visible_rows,
		sort_id = if p192 == nil or p192.sort_id == nil then nil else p192.sort_id
	}, t_96)
end

function t_96:encode() --[[ line: 21059 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3767 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3768, var3769 = protoModule.writeTag(buff, var3767, 1, protoModule.wireTypes.lengthDelimited)
		var3768, var3769 = protoModule.writeString(var3768, var3769, self.title)
		buff = var3768
		var3767 = var3769
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var3770 = v:encode()
			local var3771, var3772 = protoModule.writeTag(buff, var3767, 2, protoModule.wireTypes.lengthDelimited)
			var3771, var3772 = protoModule.writeBuffer(var3771, var3772, var3770, buffer.len(var3770))
			buff = var3771
			var3767 = var3772
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3773, var3774 = protoModule.writeTag(buff, var3767, 3, protoModule.wireTypes.varint)
		var3773, var3774 = protoModule.writeVarInt(var3773, var3774, self.max_visible_rows)
		buff = var3773
		var3767 = var3774
	end
	if self.sort_id ~= nil then
		local var3775, var3776 = protoModule.writeTag(buff, var3767, 4, protoModule.wireTypes.lengthDelimited)
		var3775, var3776 = protoModule.writeString(var3775, var3776, self.sort_id)
		buff = var3775
		var3767 = var3776
	end
	local buff_1 = buffer.create(var3767)
	buffer.copy(buff_1, 0, buff, 0, var3767)
	
	return buff_1
end

function t_96.decode(p193) --[[ line: 21091 ]]
	-- upvalues: t_96 (ref), protoModule (ref), t (ref)
	local var3778 = t_96.new()
	local var3779 = 0
	while var3779 < buffer.len(p193) do
		local _ = nil
		local var3780 = nil
		local var3781, var3782, var3783 = protoModule.readTag(p193, var3779)
		local var3784 = var3781
		var3780 = var3782
		var3779 = var3783
		
		if var3780 == protoModule.wireTypes.varint then
			if var3784 == 3 then
				local _ = nil
				local var3785, var3786 = protoModule.readVarIntI32(p193, var3779)
				var3779 = var3786
				var3778.max_visible_rows = var3785
			else
				local _ = nil
				local var3787, var3788 = protoModule.readVarInt(p193, var3779)
				local _ = var3787
				var3779 = var3788
			end
		end
		if var3780 == protoModule.wireTypes.lengthDelimited then
			if var3784 == 1 then
				local _ = nil
				local var3789, var3790 = protoModule.readBuffer(p193, var3779)
				var3779 = var3790
				var3778.title = buffer.tostring(var3789)
			elseif var3784 == 2 then
				local _ = nil
				local var3791, var3792 = protoModule.readBuffer(p193, var3779)
				var3779 = var3792
				table.insert(var3778.user_items, t.UserListInputData_UserItem.decode(var3791))
			elseif var3784 == 4 then
				local _ = nil
				local var3793, var3794 = protoModule.readBuffer(p193, var3779)
				var3779 = var3794
				var3778.sort_id = buffer.tostring(var3793)
			else
				local _ = nil
				local var3795, var3796 = protoModule.readVarInt(p193, var3779)
				var3779 = var3796 + var3795
			end
		elseif var3780 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3797, var3798 = protoModule.readFixed32(p193, var3779)
			local _ = var3797
			var3779 = var3798
		elseif var3780 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3799, var3800 = protoModule.readFixed64(p193, var3779)
			local _ = var3799
			var3779 = var3800
		else
			error("Unsupported wire type: " .. var3780)
		end
	end
	return var3778
end

function t_96:jsonEncode() --[[ line: 21149 ]]
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

function t_96:jsonDecode() --[[ line: 21175 ]]
	-- upvalues: t_96 (ref), t (ref)
	local var3803 = t_96.new()
	
	if self.title ~= nil then
		var3803.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3803.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3803.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3803.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3803.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3803.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3803.sort_id = self.sortId
	end
	return var3803
end

t_96.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_96
typeRegistryModule.default:register(t.UserListInputData)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p194) --[[ line: 21233 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		user_id = if p194 == nil or p194.user_id == nil then "" else p194.user_id
	}, t_97)
end

function t_97:encode() --[[ line: 21241 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3807 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3808, var3809 = protoModule.writeTag(buff, var3807, 1, protoModule.wireTypes.lengthDelimited)
		var3808, var3809 = protoModule.writeString(var3808, var3809, self.user_id)
		buff = var3808
		var3807 = var3809
	end
	local buff_1 = buffer.create(var3807)
	buffer.copy(buff_1, 0, buff, 0, var3807)
	
	return buff_1
end

function t_97.decode(p195) --[[ line: 21255 ]]
	-- upvalues: t_97 (ref), protoModule (ref)
	local var3811 = t_97.new()
	local var3812 = 0
	while var3812 < buffer.len(p195) do
		local _ = nil
		local var3813 = nil
		local var3814, var3815, var3816 = protoModule.readTag(p195, var3812)
		local var3817 = var3814
		var3813 = var3815
		var3812 = var3816
		
		if var3813 == protoModule.wireTypes.varint then
			local _ = nil
			local var3818, var3819 = protoModule.readVarInt(p195, var3812)
			local _ = var3818
			var3812 = var3819
			continue
		end
		if var3813 == protoModule.wireTypes.lengthDelimited then
			if var3817 == 1 then
				local _ = nil
				local var3820, var3821 = protoModule.readBuffer(p195, var3812)
				var3812 = var3821
				var3811.user_id = buffer.tostring(var3820)
			else
				local _ = nil
				local var3822, var3823 = protoModule.readVarInt(p195, var3812)
				var3812 = var3823 + var3822
			end
		elseif var3813 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3824, var3825 = protoModule.readFixed32(p195, var3812)
			local _ = var3824
			var3812 = var3825
		elseif var3813 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3826, var3827 = protoModule.readFixed64(p195, var3812)
			local _ = var3826
			var3812 = var3827
		else
			error("Unsupported wire type: " .. var3813)
		end
	end
	return var3811
end

function t_97:jsonEncode() --[[ line: 21298 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_97:jsonDecode() --[[ line: 21308 ]]
	-- upvalues: t_97 (ref)
	local var3829 = t_97.new()
	
	if self.user_id ~= nil then
		var3829.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3829.user_id = self.userId
	end
	return var3829
end

t_97.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_97
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p196) --[[ line: 21336 ]]
	-- upvalues: t_98 (ref)
	return setmetatable({
		title = if p196 == nil or p196.title == nil then "" else p196.title,
		items = if p196 == nil or p196.items == nil then {} else p196.items,
		max_visible_rows = if p196 == nil or p196.max_visible_rows == nil then 0 else p196.max_visible_rows,
		sort_id = if p196 == nil or p196.sort_id == nil then nil else p196.sort_id
	}, t_98)
end

function t_98:encode() --[[ line: 21345 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3831 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3832, var3833 = protoModule.writeTag(buff, var3831, 1, protoModule.wireTypes.lengthDelimited)
		var3832, var3833 = protoModule.writeString(var3832, var3833, self.title)
		buff = var3832
		var3831 = var3833
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3834 = v:encode()
			local var3835, var3836 = protoModule.writeTag(buff, var3831, 2, protoModule.wireTypes.lengthDelimited)
			var3835, var3836 = protoModule.writeBuffer(var3835, var3836, var3834, buffer.len(var3834))
			buff = var3835
			var3831 = var3836
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3837, var3838 = protoModule.writeTag(buff, var3831, 3, protoModule.wireTypes.varint)
		var3837, var3838 = protoModule.writeVarInt(var3837, var3838, self.max_visible_rows)
		buff = var3837
		var3831 = var3838
	end
	if self.sort_id ~= nil then
		local var3839, var3840 = protoModule.writeTag(buff, var3831, 4, protoModule.wireTypes.lengthDelimited)
		var3839, var3840 = protoModule.writeString(var3839, var3840, self.sort_id)
		buff = var3839
		var3831 = var3840
	end
	local buff_1 = buffer.create(var3831)
	buffer.copy(buff_1, 0, buff, 0, var3831)
	
	return buff_1
end

function t_98.decode(p197) --[[ line: 21377 ]]
	-- upvalues: t_98 (ref), protoModule (ref), t (ref)
	local var3842 = t_98.new()
	local var3843 = 0
	while var3843 < buffer.len(p197) do
		local _ = nil
		local var3844 = nil
		local var3845, var3846, var3847 = protoModule.readTag(p197, var3843)
		local var3848 = var3845
		var3844 = var3846
		var3843 = var3847
		
		if var3844 == protoModule.wireTypes.varint then
			if var3848 == 3 then
				local _ = nil
				local var3849, var3850 = protoModule.readVarIntI32(p197, var3843)
				var3843 = var3850
				var3842.max_visible_rows = var3849
			else
				local _ = nil
				local var3851, var3852 = protoModule.readVarInt(p197, var3843)
				local _ = var3851
				var3843 = var3852
			end
		end
		if var3844 == protoModule.wireTypes.lengthDelimited then
			if var3848 == 1 then
				local _ = nil
				local var3853, var3854 = protoModule.readBuffer(p197, var3843)
				var3843 = var3854
				var3842.title = buffer.tostring(var3853)
			elseif var3848 == 2 then
				local _ = nil
				local var3855, var3856 = protoModule.readBuffer(p197, var3843)
				var3843 = var3856
				table.insert(var3842.items, t.CatalogItemListInputData_CatalogItem.decode(var3855))
			elseif var3848 == 4 then
				local _ = nil
				local var3857, var3858 = protoModule.readBuffer(p197, var3843)
				var3843 = var3858
				var3842.sort_id = buffer.tostring(var3857)
			else
				local _ = nil
				local var3859, var3860 = protoModule.readVarInt(p197, var3843)
				var3843 = var3860 + var3859
			end
		elseif var3844 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3861, var3862 = protoModule.readFixed32(p197, var3843)
			local _ = var3861
			var3843 = var3862
		elseif var3844 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3863, var3864 = protoModule.readFixed64(p197, var3843)
			local _ = var3863
			var3843 = var3864
		else
			error("Unsupported wire type: " .. var3844)
		end
	end
	return var3842
end

function t_98:jsonEncode() --[[ line: 21435 ]]
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

function t_98:jsonDecode() --[[ line: 21461 ]]
	-- upvalues: t_98 (ref), t (ref)
	local var3867 = t_98.new()
	
	if self.title ~= nil then
		var3867.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3867.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3867.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3867.max_visible_rows = self.maxVisibleRows
	end
	if self.sort_id ~= nil then
		var3867.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3867.sort_id = self.sortId
	end
	return var3867
end

t_98.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_98
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p198) --[[ line: 21510 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		item_id = if p198 == nil or p198.item_id == nil then "" else p198.item_id,
		item_type = if p198 == nil or p198.item_type == nil then "" else p198.item_type
	}, t_99)
end

function t_99:encode() --[[ line: 21519 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3870 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3871, var3872 = protoModule.writeTag(buff, var3870, 1, protoModule.wireTypes.lengthDelimited)
		var3871, var3872 = protoModule.writeString(var3871, var3872, self.item_id)
		buff = var3871
		var3870 = var3872
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3873, var3874 = protoModule.writeTag(buff, var3870, 2, protoModule.wireTypes.lengthDelimited)
		var3873, var3874 = protoModule.writeString(var3873, var3874, self.item_type)
		buff = var3873
		var3870 = var3874
	end
	local buff_1 = buffer.create(var3870)
	buffer.copy(buff_1, 0, buff, 0, var3870)
	
	return buff_1
end

function t_99.decode(p199) --[[ line: 21538 ]]
	-- upvalues: t_99 (ref), protoModule (ref)
	local var3876 = t_99.new()
	local var3877 = 0
	while var3877 < buffer.len(p199) do
		local _ = nil
		local var3878 = nil
		local var3879, var3880, var3881 = protoModule.readTag(p199, var3877)
		local var3882 = var3879
		var3878 = var3880
		var3877 = var3881
		
		if var3878 == protoModule.wireTypes.varint then
			local _ = nil
			local var3883, var3884 = protoModule.readVarInt(p199, var3877)
			local _ = var3883
			var3877 = var3884
			continue
		end
		if var3878 == protoModule.wireTypes.lengthDelimited then
			if var3882 == 1 then
				local _ = nil
				local var3885, var3886 = protoModule.readBuffer(p199, var3877)
				var3877 = var3886
				var3876.item_id = buffer.tostring(var3885)
			elseif var3882 == 2 then
				local _ = nil
				local var3887, var3888 = protoModule.readBuffer(p199, var3877)
				var3877 = var3888
				var3876.item_type = buffer.tostring(var3887)
			else
				local _ = nil
				local var3889, var3890 = protoModule.readVarInt(p199, var3877)
				var3877 = var3890 + var3889
			end
		elseif var3878 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3891, var3892 = protoModule.readFixed32(p199, var3877)
			local _ = var3891
			var3877 = var3892
		elseif var3878 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3893, var3894 = protoModule.readFixed64(p199, var3877)
			local _ = var3893
			var3877 = var3894
		else
			error("Unsupported wire type: " .. var3878)
		end
	end
	return var3876
end

function t_99:jsonEncode() --[[ line: 21586 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_99:jsonDecode() --[[ line: 21600 ]]
	-- upvalues: t_99 (ref)
	local var3896 = t_99.new()
	
	if self.item_id ~= nil then
		var3896.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3896.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3896.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3896.item_type = self.itemType
	end
	return var3896
end

t_99.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_99
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p200) --[[ line: 21638 ]]
	-- upvalues: t_100 (ref)
	return setmetatable({
		universe_id = if p200 == nil or p200.universe_id == nil then "" else p200.universe_id
	}, t_100)
end

function t_100:encode() --[[ line: 21646 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3898 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3899, var3900 = protoModule.writeTag(buff, var3898, 1, protoModule.wireTypes.lengthDelimited)
		var3899, var3900 = protoModule.writeString(var3899, var3900, self.universe_id)
		buff = var3899
		var3898 = var3900
	end
	local buff_1 = buffer.create(var3898)
	buffer.copy(buff_1, 0, buff, 0, var3898)
	
	return buff_1
end

function t_100.decode(p201) --[[ line: 21660 ]]
	-- upvalues: t_100 (ref), protoModule (ref)
	local var3902 = t_100.new()
	local var3903 = 0
	while var3903 < buffer.len(p201) do
		local _ = nil
		local var3904 = nil
		local var3905, var3906, var3907 = protoModule.readTag(p201, var3903)
		local var3908 = var3905
		var3904 = var3906
		var3903 = var3907
		
		if var3904 == protoModule.wireTypes.varint then
			local _ = nil
			local var3909, var3910 = protoModule.readVarInt(p201, var3903)
			local _ = var3909
			var3903 = var3910
			continue
		end
		if var3904 == protoModule.wireTypes.lengthDelimited then
			if var3908 == 1 then
				local _ = nil
				local var3911, var3912 = protoModule.readBuffer(p201, var3903)
				var3903 = var3912
				var3902.universe_id = buffer.tostring(var3911)
			else
				local _ = nil
				local var3913, var3914 = protoModule.readVarInt(p201, var3903)
				var3903 = var3914 + var3913
			end
		elseif var3904 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3915, var3916 = protoModule.readFixed32(p201, var3903)
			local _ = var3915
			var3903 = var3916
		elseif var3904 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3917, var3918 = protoModule.readFixed64(p201, var3903)
			local _ = var3917
			var3903 = var3918
		else
			error("Unsupported wire type: " .. var3904)
		end
	end
	return var3902
end

function t_100:jsonEncode() --[[ line: 21703 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_100:jsonDecode() --[[ line: 21713 ]]
	-- upvalues: t_100 (ref)
	local var3920 = t_100.new()
	
	if self.universe_id ~= nil then
		var3920.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3920.universe_id = self.universeId
	end
	return var3920
end

t_100.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_100
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p202) --[[ line: 21743 ]]
	-- upvalues: t_101 (ref)
	return setmetatable({
		title = if p202 == nil or p202.title == nil then "" else p202.title,
		subtitle = if p202 == nil or p202.subtitle == nil then "" else p202.subtitle,
		moment_items = if p202 == nil or p202.moment_items == nil then {} else p202.moment_items
	}, t_101)
end

function t_101:encode() --[[ line: 21751 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3922 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3923, var3924 = protoModule.writeTag(buff, var3922, 1, protoModule.wireTypes.lengthDelimited)
		var3923, var3924 = protoModule.writeString(var3923, var3924, self.title)
		buff = var3923
		var3922 = var3924
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3925, var3926 = protoModule.writeTag(buff, var3922, 2, protoModule.wireTypes.lengthDelimited)
		var3925, var3926 = protoModule.writeString(var3925, var3926, self.subtitle)
		buff = var3925
		var3922 = var3926
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3927 = v:encode()
			local var3928, var3929 = protoModule.writeTag(buff, var3922, 3, protoModule.wireTypes.lengthDelimited)
			var3928, var3929 = protoModule.writeBuffer(var3928, var3929, var3927, buffer.len(var3927))
			buff = var3928
			var3922 = var3929
		end
	end
	local buff_1 = buffer.create(var3922)
	buffer.copy(buff_1, 0, buff, 0, var3922)
	
	return buff_1
end

function t_101.decode(p203) --[[ line: 21778 ]]
	-- upvalues: t_101 (ref), protoModule (ref), t (ref)
	local var3931 = t_101.new()
	local var3932 = 0
	while var3932 < buffer.len(p203) do
		local _ = nil
		local var3933 = nil
		local var3934, var3935, var3936 = protoModule.readTag(p203, var3932)
		local var3937 = var3934
		var3933 = var3935
		var3932 = var3936
		
		if var3933 == protoModule.wireTypes.varint then
			local _ = nil
			local var3938, var3939 = protoModule.readVarInt(p203, var3932)
			local _ = var3938
			var3932 = var3939
			continue
		end
		if var3933 == protoModule.wireTypes.lengthDelimited then
			if var3937 == 1 then
				local _ = nil
				local var3940, var3941 = protoModule.readBuffer(p203, var3932)
				var3932 = var3941
				var3931.title = buffer.tostring(var3940)
			elseif var3937 == 2 then
				local _ = nil
				local var3942, var3943 = protoModule.readBuffer(p203, var3932)
				var3932 = var3943
				var3931.subtitle = buffer.tostring(var3942)
			elseif var3937 == 3 then
				local _ = nil
				local var3944, var3945 = protoModule.readBuffer(p203, var3932)
				var3932 = var3945
				table.insert(var3931.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3944))
			else
				local _ = nil
				local var3946, var3947 = protoModule.readVarInt(p203, var3932)
				var3932 = var3947 + var3946
			end
		elseif var3933 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3948, var3949 = protoModule.readFixed32(p203, var3932)
			local _ = var3948
			var3932 = var3949
		elseif var3933 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3950, var3951 = protoModule.readFixed64(p203, var3932)
			local _ = var3950
			var3932 = var3951
		else
			error("Unsupported wire type: " .. var3933)
		end
	end
	return var3931
end

function t_101:jsonEncode() --[[ line: 21831 ]]
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

function t_101:jsonDecode() --[[ line: 21853 ]]
	-- upvalues: t_101 (ref), t (ref)
	local var3954 = t_101.new()
	
	if self.title ~= nil then
		var3954.title = self.title
	end
	if self.subtitle ~= nil then
		var3954.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3954.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3954.moment_items = t_1
	end
	return var3954
end

t_101.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_101
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p204) --[[ line: 21899 ]]
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

function t_102:encode() --[[ line: 21914 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3958 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3959, var3960 = protoModule.writeTag(buff, var3958, 1, protoModule.wireTypes.lengthDelimited)
		var3959, var3960 = protoModule.writeString(var3959, var3960, self.moment_id)
		buff = var3959
		var3958 = var3960
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3961, var3962 = protoModule.writeTag(buff, var3958, 2, protoModule.wireTypes.lengthDelimited)
		var3961, var3962 = protoModule.writeString(var3961, var3962, self.video_asset_id)
		buff = var3961
		var3958 = var3962
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3963, var3964 = protoModule.writeTag(buff, var3958, 3, protoModule.wireTypes.lengthDelimited)
		var3963, var3964 = protoModule.writeString(var3963, var3964, self.target_universe_id)
		buff = var3963
		var3958 = var3964
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3965, var3966 = protoModule.writeTag(buff, var3958, 4, protoModule.wireTypes.lengthDelimited)
		var3965, var3966 = protoModule.writeString(var3965, var3966, self.target_place_id)
		buff = var3965
		var3958 = var3966
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3967, var3968 = protoModule.writeTag(buff, var3958, 5, protoModule.wireTypes.lengthDelimited)
		var3967, var3968 = protoModule.writeString(var3967, var3968, self.feed_item_id)
		buff = var3967
		var3958 = var3968
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3969, var3970 = protoModule.writeTag(buff, var3958, 6, protoModule.wireTypes.lengthDelimited)
		var3969, var3970 = protoModule.writeString(var3969, var3970, self.capture_universe_id)
		buff = var3969
		var3958 = var3970
	end
	local buff_1 = buffer.create(var3958)
	buffer.copy(buff_1, 0, buff, 0, var3958)
	
	return buff_1
end

function t_102.decode(p205) --[[ line: 21953 ]]
	-- upvalues: t_102 (ref), protoModule (ref)
	local var3972 = t_102.new()
	local var3973 = 0
	while var3973 < buffer.len(p205) do
		local _ = nil
		local var3974 = nil
		local var3975, var3976, var3977 = protoModule.readTag(p205, var3973)
		local var3978 = var3975
		var3974 = var3976
		var3973 = var3977
		
		if var3974 == protoModule.wireTypes.varint then
			local _ = nil
			local var3979, var3980 = protoModule.readVarInt(p205, var3973)
			local _ = var3979
			var3973 = var3980
			continue
		end
		if var3974 == protoModule.wireTypes.lengthDelimited then
			if var3978 == 1 then
				local _ = nil
				local var3981, var3982 = protoModule.readBuffer(p205, var3973)
				var3973 = var3982
				var3972.moment_id = buffer.tostring(var3981)
			elseif var3978 == 2 then
				local _ = nil
				local var3983, var3984 = protoModule.readBuffer(p205, var3973)
				var3973 = var3984
				var3972.video_asset_id = buffer.tostring(var3983)
			elseif var3978 == 3 then
				local _ = nil
				local var3985, var3986 = protoModule.readBuffer(p205, var3973)
				var3973 = var3986
				var3972.target_universe_id = buffer.tostring(var3985)
			elseif var3978 == 4 then
				local _ = nil
				local var3987, var3988 = protoModule.readBuffer(p205, var3973)
				var3973 = var3988
				var3972.target_place_id = buffer.tostring(var3987)
			elseif var3978 == 5 then
				local _ = nil
				local var3989, var3990 = protoModule.readBuffer(p205, var3973)
				var3973 = var3990
				var3972.feed_item_id = buffer.tostring(var3989)
			elseif var3978 == 6 then
				local _ = nil
				local var3991, var3992 = protoModule.readBuffer(p205, var3973)
				var3973 = var3992
				var3972.capture_universe_id = buffer.tostring(var3991)
			else
				local _ = nil
				local var3993, var3994 = protoModule.readVarInt(p205, var3973)
				var3973 = var3994 + var3993
			end
		elseif var3974 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3995, var3996 = protoModule.readFixed32(p205, var3973)
			local _ = var3995
			var3973 = var3996
		elseif var3974 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3997, var3998 = protoModule.readFixed64(p205, var3973)
			local _ = var3997
			var3973 = var3998
		else
			error("Unsupported wire type: " .. var3974)
		end
	end
	return var3972
end

function t_102:jsonEncode() --[[ line: 22021 ]]
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

function t_102:jsonDecode() --[[ line: 22051 ]]
	-- upvalues: t_102 (ref)
	local var4000 = t_102.new()
	
	if self.moment_id ~= nil then
		var4000.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var4000.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var4000.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4000.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var4000.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var4000.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var4000.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var4000.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var4000.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var4000.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var4000.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var4000.capture_universe_id = self.captureUniverseId
	end
	return var4000
end

t_102.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_102
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p206) --[[ line: 22121 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		title = if p206 == nil or p206.title == nil then "" else p206.title,
		subtitle = if p206 == nil or p206.subtitle == nil then "" else p206.subtitle
	}, t_103)
end

function t_103:encode() --[[ line: 22128 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4002 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var4003, var4004 = protoModule.writeTag(buff, var4002, 1, protoModule.wireTypes.lengthDelimited)
		var4003, var4004 = protoModule.writeString(var4003, var4004, self.title)
		buff = var4003
		var4002 = var4004
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var4005, var4006 = protoModule.writeTag(buff, var4002, 2, protoModule.wireTypes.lengthDelimited)
		var4005, var4006 = protoModule.writeString(var4005, var4006, self.subtitle)
		buff = var4005
		var4002 = var4006
	end
	local buff_1 = buffer.create(var4002)
	buffer.copy(buff_1, 0, buff, 0, var4002)
	
	return buff_1
end

function t_103.decode(p207) --[[ line: 22147 ]]
	-- upvalues: t_103 (ref), protoModule (ref)
	local var4008 = t_103.new()
	local var4009 = 0
	while var4009 < buffer.len(p207) do
		local _ = nil
		local var4010 = nil
		local var4011, var4012, var4013 = protoModule.readTag(p207, var4009)
		local var4014 = var4011
		var4010 = var4012
		var4009 = var4013
		
		if var4010 == protoModule.wireTypes.varint then
			local _ = nil
			local var4015, var4016 = protoModule.readVarInt(p207, var4009)
			local _ = var4015
			var4009 = var4016
			continue
		end
		if var4010 == protoModule.wireTypes.lengthDelimited then
			if var4014 == 1 then
				local _ = nil
				local var4017, var4018 = protoModule.readBuffer(p207, var4009)
				var4009 = var4018
				var4008.title = buffer.tostring(var4017)
			elseif var4014 == 2 then
				local _ = nil
				local var4019, var4020 = protoModule.readBuffer(p207, var4009)
				var4009 = var4020
				var4008.subtitle = buffer.tostring(var4019)
			else
				local _ = nil
				local var4021, var4022 = protoModule.readVarInt(p207, var4009)
				var4009 = var4022 + var4021
			end
		elseif var4010 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4023, var4024 = protoModule.readFixed32(p207, var4009)
			local _ = var4023
			var4009 = var4024
		elseif var4010 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4025, var4026 = protoModule.readFixed64(p207, var4009)
			local _ = var4025
			var4009 = var4026
		else
			error("Unsupported wire type: " .. var4010)
		end
	end
	return var4008
end

function t_103:jsonEncode() --[[ line: 22195 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_103:jsonDecode() --[[ line: 22209 ]]
	-- upvalues: t_103 (ref)
	local var4028 = t_103.new()
	
	if self.title ~= nil then
		var4028.title = self.title
	end
	if self.subtitle ~= nil then
		var4028.subtitle = self.subtitle
	end
	return var4028
end

t_103.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_103
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p208) --[[ line: 22237 ]]
	-- upvalues: t_104 (ref)
	return setmetatable({
		primary_cta_button_text = if p208 == nil or p208.primary_cta_button_text == nil then "" else p208.primary_cta_button_text,
		secondary_cta_button_text = if p208 == nil or p208.secondary_cta_button_text == nil then "" else p208.secondary_cta_button_text,
		primary_cta_type = if p208 == nil or p208.primary_cta_type == nil then "" else p208.primary_cta_type,
		secondary_cta_type = if p208 == nil or p208.secondary_cta_type == nil then "" else p208.secondary_cta_type
	}, t_104)
end

function t_104:encode() --[[ line: 22250 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4030 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var4031, var4032 = protoModule.writeTag(buff, var4030, 1, protoModule.wireTypes.lengthDelimited)
		var4031, var4032 = protoModule.writeString(var4031, var4032, self.primary_cta_button_text)
		buff = var4031
		var4030 = var4032
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var4033, var4034 = protoModule.writeTag(buff, var4030, 2, protoModule.wireTypes.lengthDelimited)
		var4033, var4034 = protoModule.writeString(var4033, var4034, self.secondary_cta_button_text)
		buff = var4033
		var4030 = var4034
	end
	if self.primary_cta_type ~= nil and self.primary_cta_type ~= "" then
		local var4035, var4036 = protoModule.writeTag(buff, var4030, 3, protoModule.wireTypes.lengthDelimited)
		var4035, var4036 = protoModule.writeString(var4035, var4036, self.primary_cta_type)
		buff = var4035
		var4030 = var4036
	end
	if self.secondary_cta_type ~= nil and self.secondary_cta_type ~= "" then
		local var4037, var4038 = protoModule.writeTag(buff, var4030, 4, protoModule.wireTypes.lengthDelimited)
		var4037, var4038 = protoModule.writeString(var4037, var4038, self.secondary_cta_type)
		buff = var4037
		var4030 = var4038
	end
	local buff_1 = buffer.create(var4030)
	buffer.copy(buff_1, 0, buff, 0, var4030)
	
	return buff_1
end

function t_104.decode(p209) --[[ line: 22279 ]]
	-- upvalues: t_104 (ref), protoModule (ref)
	local var4040 = t_104.new()
	local var4041 = 0
	while var4041 < buffer.len(p209) do
		local _ = nil
		local var4042 = nil
		local var4043, var4044, var4045 = protoModule.readTag(p209, var4041)
		local var4046 = var4043
		var4042 = var4044
		var4041 = var4045
		
		if var4042 == protoModule.wireTypes.varint then
			local _ = nil
			local var4047, var4048 = protoModule.readVarInt(p209, var4041)
			local _ = var4047
			var4041 = var4048
			continue
		end
		if var4042 == protoModule.wireTypes.lengthDelimited then
			if var4046 == 1 then
				local _ = nil
				local var4049, var4050 = protoModule.readBuffer(p209, var4041)
				var4041 = var4050
				var4040.primary_cta_button_text = buffer.tostring(var4049)
			elseif var4046 == 2 then
				local _ = nil
				local var4051, var4052 = protoModule.readBuffer(p209, var4041)
				var4041 = var4052
				var4040.secondary_cta_button_text = buffer.tostring(var4051)
			elseif var4046 == 3 then
				local _ = nil
				local var4053, var4054 = protoModule.readBuffer(p209, var4041)
				var4041 = var4054
				var4040.primary_cta_type = buffer.tostring(var4053)
			elseif var4046 == 4 then
				local _ = nil
				local var4055, var4056 = protoModule.readBuffer(p209, var4041)
				var4041 = var4056
				var4040.secondary_cta_type = buffer.tostring(var4055)
			else
				local _ = nil
				local var4057, var4058 = protoModule.readVarInt(p209, var4041)
				var4041 = var4058 + var4057
			end
		elseif var4042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4059, var4060 = protoModule.readFixed32(p209, var4041)
			local _ = var4059
			var4041 = var4060
		elseif var4042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4061, var4062 = protoModule.readFixed64(p209, var4041)
			local _ = var4061
			var4041 = var4062
		else
			error("Unsupported wire type: " .. var4042)
		end
	end
	return var4040
end

function t_104:jsonEncode() --[[ line: 22337 ]]
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

function t_104:jsonDecode() --[[ line: 22359 ]]
	-- upvalues: t_104 (ref)
	local var4064 = t_104.new()
	
	if self.primary_cta_button_text ~= nil then
		var4064.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var4064.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var4064.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var4064.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	if self.primary_cta_type ~= nil then
		var4064.primary_cta_type = self.primary_cta_type
	end
	if self.primaryCtaType ~= nil then
		var4064.primary_cta_type = self.primaryCtaType
	end
	if self.secondary_cta_type ~= nil then
		var4064.secondary_cta_type = self.secondary_cta_type
	end
	if self.secondaryCtaType ~= nil then
		var4064.secondary_cta_type = self.secondaryCtaType
	end
	return var4064
end

t_104.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_104
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p210) --[[ line: 22411 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		image_asset_id = if p210 == nil or p210.image_asset_id == nil then "" else p210.image_asset_id
	}, t_105)
end

function t_105:encode() --[[ line: 22417 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4066 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var4067, var4068 = protoModule.writeTag(buff, var4066, 1, protoModule.wireTypes.lengthDelimited)
		var4067, var4068 = protoModule.writeString(var4067, var4068, self.image_asset_id)
		buff = var4067
		var4066 = var4068
	end
	local buff_1 = buffer.create(var4066)
	buffer.copy(buff_1, 0, buff, 0, var4066)
	
	return buff_1
end

function t_105.decode(p211) --[[ line: 22431 ]]
	-- upvalues: t_105 (ref), protoModule (ref)
	local var4070 = t_105.new()
	local var4071 = 0
	while var4071 < buffer.len(p211) do
		local _ = nil
		local var4072 = nil
		local var4073, var4074, var4075 = protoModule.readTag(p211, var4071)
		local var4076 = var4073
		var4072 = var4074
		var4071 = var4075
		
		if var4072 == protoModule.wireTypes.varint then
			local _ = nil
			local var4077, var4078 = protoModule.readVarInt(p211, var4071)
			local _ = var4077
			var4071 = var4078
			continue
		end
		if var4072 == protoModule.wireTypes.lengthDelimited then
			if var4076 == 1 then
				local _ = nil
				local var4079, var4080 = protoModule.readBuffer(p211, var4071)
				var4071 = var4080
				var4070.image_asset_id = buffer.tostring(var4079)
			else
				local _ = nil
				local var4081, var4082 = protoModule.readVarInt(p211, var4071)
				var4071 = var4082 + var4081
			end
		elseif var4072 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4083, var4084 = protoModule.readFixed32(p211, var4071)
			local _ = var4083
			var4071 = var4084
		elseif var4072 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4085, var4086 = protoModule.readFixed64(p211, var4071)
			local _ = var4085
			var4071 = var4086
		else
			error("Unsupported wire type: " .. var4072)
		end
	end
	return var4070
end

function t_105:jsonEncode() --[[ line: 22474 ]]
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_105:jsonDecode() --[[ line: 22484 ]]
	-- upvalues: t_105 (ref)
	local var4088 = t_105.new()
	
	if self.image_asset_id ~= nil then
		var4088.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4088.image_asset_id = self.imageAssetId
	end
	return var4088
end

t_105.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_105
typeRegistryModule.default:register(t.ImageInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p212) --[[ line: 22512 ]]
	-- upvalues: t_106 (ref)
	return setmetatable({
		video_asset_id = if p212 == nil or p212.video_asset_id == nil then "" else p212.video_asset_id
	}, t_106)
end

function t_106:encode() --[[ line: 22518 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4090 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var4091, var4092 = protoModule.writeTag(buff, var4090, 1, protoModule.wireTypes.lengthDelimited)
		var4091, var4092 = protoModule.writeString(var4091, var4092, self.video_asset_id)
		buff = var4091
		var4090 = var4092
	end
	local buff_1 = buffer.create(var4090)
	buffer.copy(buff_1, 0, buff, 0, var4090)
	
	return buff_1
end

function t_106.decode(p213) --[[ line: 22532 ]]
	-- upvalues: t_106 (ref), protoModule (ref)
	local var4094 = t_106.new()
	local var4095 = 0
	while var4095 < buffer.len(p213) do
		local _ = nil
		local var4096 = nil
		local var4097, var4098, var4099 = protoModule.readTag(p213, var4095)
		local var4100 = var4097
		var4096 = var4098
		var4095 = var4099
		
		if var4096 == protoModule.wireTypes.varint then
			local _ = nil
			local var4101, var4102 = protoModule.readVarInt(p213, var4095)
			local _ = var4101
			var4095 = var4102
			continue
		end
		if var4096 == protoModule.wireTypes.lengthDelimited then
			if var4100 == 1 then
				local _ = nil
				local var4103, var4104 = protoModule.readBuffer(p213, var4095)
				var4095 = var4104
				var4094.video_asset_id = buffer.tostring(var4103)
			else
				local _ = nil
				local var4105, var4106 = protoModule.readVarInt(p213, var4095)
				var4095 = var4106 + var4105
			end
		elseif var4096 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4107, var4108 = protoModule.readFixed32(p213, var4095)
			local _ = var4107
			var4095 = var4108
		elseif var4096 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4109, var4110 = protoModule.readFixed64(p213, var4095)
			local _ = var4109
			var4095 = var4110
		else
			error("Unsupported wire type: " .. var4096)
		end
	end
	return var4094
end

function t_106:jsonEncode() --[[ line: 22575 ]]
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	return t
end

function t_106:jsonDecode() --[[ line: 22585 ]]
	-- upvalues: t_106 (ref)
	local var4112 = t_106.new()
	
	if self.video_asset_id ~= nil then
		var4112.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4112.video_asset_id = self.videoAssetId
	end
	return var4112
end

t_106.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_106
typeRegistryModule.default:register(t.VideoInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p214) --[[ line: 22613 ]]
	-- upvalues: t_107 (ref)
	return setmetatable({
		text = if p214 == nil or p214.text == nil then "" else p214.text,
		is_rendered_text = if p214 == nil or p214.is_rendered_text == nil then false else p214.is_rendered_text
	}, t_107)
end

function t_107:encode() --[[ line: 22620 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4114 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var4115, var4116 = protoModule.writeTag(buff, var4114, 1, protoModule.wireTypes.lengthDelimited)
		var4115, var4116 = protoModule.writeString(var4115, var4116, self.text)
		buff = var4115
		var4114 = var4116
	end
	if self.is_rendered_text then
		local var4117, var4118 = protoModule.writeTag(buff, var4114, 2, protoModule.wireTypes.varint)
		var4117, var4118 = protoModule.writeVarInt(var4117, var4118, if self.is_rendered_text then 1 else 0)
		buff = var4117
		var4114 = var4118
	end
	local buff_1 = buffer.create(var4114)
	buffer.copy(buff_1, 0, buff, 0, var4114)
	
	return buff_1
end

function t_107.decode(p215) --[[ line: 22639 ]]
	-- upvalues: t_107 (ref), protoModule (ref)
	local var4120 = t_107.new()
	local var4121 = 0
	while var4121 < buffer.len(p215) do
		local _ = nil
		local var4122 = nil
		local var4123, var4124, var4125 = protoModule.readTag(p215, var4121)
		local var4126 = var4123
		var4122 = var4124
		var4121 = var4125
		
		if var4122 == protoModule.wireTypes.varint then
			if var4126 == 2 then
				local _ = nil
				local var4127, var4128 = protoModule.readVarInt(p215, var4121)
				var4121 = var4128
				var4120.is_rendered_text = var4127 ~= 0
			else
				local _ = nil
				local var4129, var4130 = protoModule.readVarInt(p215, var4121)
				local _ = var4129
				var4121 = var4130
			end
		end
		if var4122 == protoModule.wireTypes.lengthDelimited then
			if var4126 == 1 then
				local _ = nil
				local var4131, var4132 = protoModule.readBuffer(p215, var4121)
				var4121 = var4132
				var4120.text = buffer.tostring(var4131)
			else
				local _ = nil
				local var4133, var4134 = protoModule.readVarInt(p215, var4121)
				var4121 = var4134 + var4133
			end
		elseif var4122 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4135, var4136 = protoModule.readFixed32(p215, var4121)
			local _ = var4135
			var4121 = var4136
		elseif var4122 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4137, var4138 = protoModule.readFixed64(p215, var4121)
			local _ = var4137
			var4121 = var4138
		else
			error("Unsupported wire type: " .. var4122)
		end
	end
	return var4120
end

function t_107:jsonEncode() --[[ line: 22687 ]]
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_107:jsonDecode() --[[ line: 22701 ]]
	-- upvalues: t_107 (ref)
	local var4140 = t_107.new()
	
	if self.text ~= nil then
		var4140.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var4140.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var4140.is_rendered_text = self.isRenderedText
	end
	return var4140
end

t_107.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_107
typeRegistryModule.default:register(t.TextInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p216) --[[ line: 22733 ]]
	-- upvalues: t_108 (ref)
	return setmetatable({
		entry_map = if p216 == nil or p216.entry_map == nil then {} else p216.entry_map,
		entry_order = if p216 == nil or p216.entry_order == nil then {} else p216.entry_order,
		entry_order_map = if p216 == nil or p216.entry_order_map == nil then {} else p216.entry_order_map,
		content_pools = if p216 == nil or p216.content_pools == nil then {} else p216.content_pools
	}, t_108)
end

function t_108:encode() --[[ line: 22742 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4142 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var4143, var4144 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4143, var4144 = protoModule.writeString(var4143, var4144, i)
			local var4145 = v:encode()
			var4144, var4146 = protoModule.writeTag(var4143, var4144, 2, protoModule.wireTypes.lengthDelimited)
			var4144, var4146 = protoModule.writeBuffer(var4144, var4146, var4145, buffer.len(var4145))
			local var4147 = var4144
			local var4148 = var4146
			local var4149, var4150 = protoModule.writeTag(buff, var4142, 1, protoModule.wireTypes.lengthDelimited)
			var4149, var4150 = protoModule.writeBuffer(var4149, var4150, var4147, var4148)
			buff = var4149
			var4142 = var4150
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var4151, var4152 = protoModule.writeTag(buff, var4142, 2, protoModule.wireTypes.lengthDelimited)
			var4151, var4152 = protoModule.writeString(var4151, var4152, v)
			buff = var4151
			var4142 = var4152
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var4153, var4154 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4153, var4154 = protoModule.writeString(var4153, var4154, i)
			local var4155 = v:encode()
			var4154, var4156 = protoModule.writeTag(var4153, var4154, 2, protoModule.wireTypes.lengthDelimited)
			var4154, var4156 = protoModule.writeBuffer(var4154, var4156, var4155, buffer.len(var4155))
			local var4157 = var4154
			local var4158 = var4156
			local var4159, var4160 = protoModule.writeTag(buff, var4142, 3, protoModule.wireTypes.lengthDelimited)
			var4159, var4160 = protoModule.writeBuffer(var4159, var4160, var4157, var4158)
			buff = var4159
			var4142 = var4160
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var4161, var4162 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4161, var4162 = protoModule.writeString(var4161, var4162, i)
			local var4163 = v:encode()
			var4162, var4164 = protoModule.writeTag(var4161, var4162, 2, protoModule.wireTypes.lengthDelimited)
			var4162, var4164 = protoModule.writeBuffer(var4162, var4164, var4163, buffer.len(var4163))
			local var4165 = var4162
			local var4166 = var4164
			local var4167, var4168 = protoModule.writeTag(buff, var4142, 4, protoModule.wireTypes.lengthDelimited)
			var4167, var4168 = protoModule.writeBuffer(var4167, var4168, var4165, var4166)
			buff = var4167
			var4142 = var4168
		end
	end
	local buff_1 = buffer.create(var4142)
	buffer.copy(buff_1, 0, buff, 0, var4142)
	
	return buff_1
end

function t_108.decode(p217) --[[ line: 22800 ]]
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var4170 = t_108.new()
	local var4171 = 0
	while var4171 < buffer.len(p217) do
		local _ = nil
		local var4172 = nil
		local var4173, var4174, var4175 = protoModule.readTag(p217, var4171)
		local var4176 = var4173
		var4172 = var4174
		var4171 = var4175
		
		if var4172 == protoModule.wireTypes.varint then
			local _ = nil
			local var4177, var4178 = protoModule.readVarInt(p217, var4171)
			local _ = var4177
			var4171 = var4178
			continue
		end
		if var4172 == protoModule.wireTypes.lengthDelimited then
			if var4176 == 1 then
				local _ = nil
				local var4179, var4180 = protoModule.readBuffer(p217, var4171)
				var4171 = var4180
				var4179 = t.VerticalFeedInputData_EntryMapEntry.decode(var4179)
				var4170.entry_map[var4179.key or ""] = var4179.value or t.FeedEntry.new()
			elseif var4176 == 2 then
				local _ = nil
				local var4181, var4182 = protoModule.readBuffer(p217, var4171)
				var4171 = var4182
				table.insert(var4170.entry_order, buffer.tostring(var4181))
			elseif var4176 == 3 then
				local _ = nil
				local var4183, var4184 = protoModule.readBuffer(p217, var4171)
				var4171 = var4184
				var4183 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var4183)
				var4170.entry_order_map[var4183.key or ""] = var4183.value or t.EntryOrder.new()
			elseif var4176 == 4 then
				local _ = nil
				local var4185, var4186 = protoModule.readBuffer(p217, var4171)
				var4171 = var4186
				var4185 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var4185)
				var4170.content_pools[var4185.key or ""] = var4185.value or t.ContentPool.new()
			else
				local _ = nil
				local var4187, var4188 = protoModule.readVarInt(p217, var4171)
				var4171 = var4188 + var4187
			end
		elseif var4172 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4189, var4190 = protoModule.readFixed32(p217, var4171)
			local _ = var4189
			var4171 = var4190
		elseif var4172 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4191, var4192 = protoModule.readFixed64(p217, var4171)
			local _ = var4191
			var4171 = var4192
		else
			error("Unsupported wire type: " .. var4172)
		end
	end
	return var4170
end

function t_108:jsonEncode() --[[ line: 22879 ]]
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

function t_108:jsonDecode() --[[ line: 22917 ]]
	-- upvalues: t_108 (ref), t (ref)
	local var4198 = t_108.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4198.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4198.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var4198.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var4198.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4198.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4198.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4198.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4198.content_pools = t_1
	end
	return var4198
end

t_108.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_108
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p218) --[[ line: 23009 ]]
	-- upvalues: t_109 (ref)
	return setmetatable({
		key = if p218 == nil or p218.key == nil then "" else p218.key,
		value = if p218 == nil or p218.value == nil then nil else p218.value
	}, t_109)
end

function t_109:encode() --[[ line: 23018 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4208 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4209, var4210 = protoModule.writeTag(buff, var4208, 1, protoModule.wireTypes.lengthDelimited)
		var4209, var4210 = protoModule.writeString(var4209, var4210, self.key)
		buff = var4209
		var4208 = var4210
	end
	if self.value ~= nil then
		local var4211 = self.value:encode()
		local var4212, var4213 = protoModule.writeTag(buff, var4208, 2, protoModule.wireTypes.lengthDelimited)
		var4212, var4213 = protoModule.writeBuffer(var4212, var4213, var4211, buffer.len(var4211))
		buff = var4212
		var4208 = var4213
	end
	local buff_1 = buffer.create(var4208)
	buffer.copy(buff_1, 0, buff, 0, var4208)
	
	return buff_1
end

function t_109.decode(p219) --[[ line: 23038 ]]
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var4215 = t_109.new()
	local var4216 = 0
	while var4216 < buffer.len(p219) do
		local _ = nil
		local var4217 = nil
		local var4218, var4219, var4220 = protoModule.readTag(p219, var4216)
		local var4221 = var4218
		var4217 = var4219
		var4216 = var4220
		
		if var4217 == protoModule.wireTypes.varint then
			local _ = nil
			local var4222, var4223 = protoModule.readVarInt(p219, var4216)
			local _ = var4222
			var4216 = var4223
			continue
		end
		if var4217 == protoModule.wireTypes.lengthDelimited then
			if var4221 == 1 then
				local _ = nil
				local var4224, var4225 = protoModule.readBuffer(p219, var4216)
				var4216 = var4225
				var4215.key = buffer.tostring(var4224)
			elseif var4221 == 2 then
				local _ = nil
				local var4226, var4227 = protoModule.readBuffer(p219, var4216)
				var4216 = var4227
				var4215.value = t.FeedEntry.decode(var4226)
			else
				local _ = nil
				local var4228, var4229 = protoModule.readVarInt(p219, var4216)
				var4216 = var4229 + var4228
			end
		elseif var4217 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4230, var4231 = protoModule.readFixed32(p219, var4216)
			local _ = var4230
			var4216 = var4231
		elseif var4217 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4232, var4233 = protoModule.readFixed64(p219, var4216)
			local _ = var4232
			var4216 = var4233
		else
			error("Unsupported wire type: " .. var4217)
		end
	end
	return var4215
end

function t_109:jsonEncode() --[[ line: 23086 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_109:jsonDecode() --[[ line: 23100 ]]
	-- upvalues: t_109 (ref), t (ref)
	local var4235 = t_109.new()
	
	if self.key ~= nil then
		var4235.key = self.key
	end
	if self.value ~= nil then
		var4235.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var4235
end

t_109.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_109
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p220) --[[ line: 23130 ]]
	-- upvalues: t_110 (ref)
	return setmetatable({
		key = if p220 == nil or p220.key == nil then "" else p220.key,
		value = if p220 == nil or p220.value == nil then nil else p220.value
	}, t_110)
end

function t_110:encode() --[[ line: 23139 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4237 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4238, var4239 = protoModule.writeTag(buff, var4237, 1, protoModule.wireTypes.lengthDelimited)
		var4238, var4239 = protoModule.writeString(var4238, var4239, self.key)
		buff = var4238
		var4237 = var4239
	end
	if self.value ~= nil then
		local var4240 = self.value:encode()
		local var4241, var4242 = protoModule.writeTag(buff, var4237, 2, protoModule.wireTypes.lengthDelimited)
		var4241, var4242 = protoModule.writeBuffer(var4241, var4242, var4240, buffer.len(var4240))
		buff = var4241
		var4237 = var4242
	end
	local buff_1 = buffer.create(var4237)
	buffer.copy(buff_1, 0, buff, 0, var4237)
	
	return buff_1
end

function t_110.decode(p221) --[[ line: 23161 ]]
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var4244 = t_110.new()
	local var4245 = 0
	while var4245 < buffer.len(p221) do
		local _ = nil
		local var4246 = nil
		local var4247, var4248, var4249 = protoModule.readTag(p221, var4245)
		local var4250 = var4247
		var4246 = var4248
		var4245 = var4249
		
		if var4246 == protoModule.wireTypes.varint then
			local _ = nil
			local var4251, var4252 = protoModule.readVarInt(p221, var4245)
			local _ = var4251
			var4245 = var4252
			continue
		end
		if var4246 == protoModule.wireTypes.lengthDelimited then
			if var4250 == 1 then
				local _ = nil
				local var4253, var4254 = protoModule.readBuffer(p221, var4245)
				var4245 = var4254
				var4244.key = buffer.tostring(var4253)
			elseif var4250 == 2 then
				local _ = nil
				local var4255, var4256 = protoModule.readBuffer(p221, var4245)
				var4245 = var4256
				var4244.value = t.EntryOrder.decode(var4255)
			else
				local _ = nil
				local var4257, var4258 = protoModule.readVarInt(p221, var4245)
				var4245 = var4258 + var4257
			end
		elseif var4246 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4259, var4260 = protoModule.readFixed32(p221, var4245)
			local _ = var4259
			var4245 = var4260
		elseif var4246 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4261, var4262 = protoModule.readFixed64(p221, var4245)
			local _ = var4261
			var4245 = var4262
		else
			error("Unsupported wire type: " .. var4246)
		end
	end
	return var4244
end

function t_110:jsonEncode() --[[ line: 23211 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_110:jsonDecode() --[[ line: 23227 ]]
	-- upvalues: t_110 (ref), t (ref)
	local var4264 = t_110.new()
	
	if self.key ~= nil then
		var4264.key = self.key
	end
	if self.value ~= nil then
		var4264.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var4264
end

t_110.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p222) --[[ line: 23257 ]]
	-- upvalues: t_111 (ref)
	return setmetatable({
		key = if p222 == nil or p222.key == nil then "" else p222.key,
		value = if p222 == nil or p222.value == nil then nil else p222.value
	}, t_111)
end

function t_111:encode() --[[ line: 23266 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4266 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4267, var4268 = protoModule.writeTag(buff, var4266, 1, protoModule.wireTypes.lengthDelimited)
		var4267, var4268 = protoModule.writeString(var4267, var4268, self.key)
		buff = var4267
		var4266 = var4268
	end
	if self.value ~= nil then
		local var4269 = self.value:encode()
		local var4270, var4271 = protoModule.writeTag(buff, var4266, 2, protoModule.wireTypes.lengthDelimited)
		var4270, var4271 = protoModule.writeBuffer(var4270, var4271, var4269, buffer.len(var4269))
		buff = var4270
		var4266 = var4271
	end
	local buff_1 = buffer.create(var4266)
	buffer.copy(buff_1, 0, buff, 0, var4266)
	
	return buff_1
end

function t_111.decode(p223) --[[ line: 23286 ]]
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var4273 = t_111.new()
	local var4274 = 0
	while var4274 < buffer.len(p223) do
		local _ = nil
		local var4275 = nil
		local var4276, var4277, var4278 = protoModule.readTag(p223, var4274)
		local var4279 = var4276
		var4275 = var4277
		var4274 = var4278
		
		if var4275 == protoModule.wireTypes.varint then
			local _ = nil
			local var4280, var4281 = protoModule.readVarInt(p223, var4274)
			local _ = var4280
			var4274 = var4281
			continue
		end
		if var4275 == protoModule.wireTypes.lengthDelimited then
			if var4279 == 1 then
				local _ = nil
				local var4282, var4283 = protoModule.readBuffer(p223, var4274)
				var4274 = var4283
				var4273.key = buffer.tostring(var4282)
			elseif var4279 == 2 then
				local _ = nil
				local var4284, var4285 = protoModule.readBuffer(p223, var4274)
				var4274 = var4285
				var4273.value = t.ContentPool.decode(var4284)
			else
				local _ = nil
				local var4286, var4287 = protoModule.readVarInt(p223, var4274)
				var4274 = var4287 + var4286
			end
		elseif var4275 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4288, var4289 = protoModule.readFixed32(p223, var4274)
			local _ = var4288
			var4274 = var4289
		elseif var4275 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4290, var4291 = protoModule.readFixed64(p223, var4274)
			local _ = var4290
			var4274 = var4291
		else
			error("Unsupported wire type: " .. var4275)
		end
	end
	return var4273
end

function t_111:jsonEncode() --[[ line: 23334 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_111:jsonDecode() --[[ line: 23348 ]]
	-- upvalues: t_111 (ref), t (ref)
	local var4293 = t_111.new()
	
	if self.key ~= nil then
		var4293.key = self.key
	end
	if self.value ~= nil then
		var4293.value = t.ContentPool.jsonDecode(self.value)
	end
	return var4293
end

t_111.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_111
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p224) --[[ line: 23378 ]]
	-- upvalues: t_112 (ref)
	return setmetatable({
		foreground_header_entry = if p224 == nil or p224.foreground_header_entry == nil then nil else p224.foreground_header_entry,
		background_header_entry = if p224 == nil or p224.background_header_entry == nil then nil else p224.background_header_entry
	}, t_112)
end

function t_112:encode() --[[ line: 23389 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4295 = 0
	
	if self.foreground_header_entry ~= nil then
		local var4296 = self.foreground_header_entry:encode()
		local var4297, var4298 = protoModule.writeTag(buff, var4295, 1, protoModule.wireTypes.lengthDelimited)
		var4297, var4298 = protoModule.writeBuffer(var4297, var4298, var4296, buffer.len(var4296))
		buff = var4297
		var4295 = var4298
	end
	if self.background_header_entry ~= nil then
		local var4299 = self.background_header_entry:encode()
		local var4300, var4301 = protoModule.writeTag(buff, var4295, 2, protoModule.wireTypes.lengthDelimited)
		var4300, var4301 = protoModule.writeBuffer(var4300, var4301, var4299, buffer.len(var4299))
		buff = var4300
		var4295 = var4301
	end
	local buff_1 = buffer.create(var4295)
	buffer.copy(buff_1, 0, buff, 0, var4295)
	
	return buff_1
end

function t_112.decode(p225) --[[ line: 23410 ]]
	-- upvalues: t_112 (ref), protoModule (ref), t (ref)
	local var4303 = t_112.new()
	local var4304 = 0
	while var4304 < buffer.len(p225) do
		local _ = nil
		local var4305 = nil
		local var4306, var4307, var4308 = protoModule.readTag(p225, var4304)
		local var4309 = var4306
		var4305 = var4307
		var4304 = var4308
		
		if var4305 == protoModule.wireTypes.varint then
			local _ = nil
			local var4310, var4311 = protoModule.readVarInt(p225, var4304)
			local _ = var4310
			var4304 = var4311
			continue
		end
		if var4305 == protoModule.wireTypes.lengthDelimited then
			if var4309 == 1 then
				local _ = nil
				local var4312, var4313 = protoModule.readBuffer(p225, var4304)
				var4304 = var4313
				var4303.foreground_header_entry = t.ForegroundHeaderEntry.decode(var4312)
			elseif var4309 == 2 then
				local _ = nil
				local var4314, var4315 = protoModule.readBuffer(p225, var4304)
				var4304 = var4315
				var4303.background_header_entry = t.BackgroundHeaderEntry.decode(var4314)
			else
				local _ = nil
				local var4316, var4317 = protoModule.readVarInt(p225, var4304)
				var4304 = var4317 + var4316
			end
		elseif var4305 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4318, var4319 = protoModule.readFixed32(p225, var4304)
			local _ = var4318
			var4304 = var4319
		elseif var4305 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4320, var4321 = protoModule.readFixed64(p225, var4304)
			local _ = var4320
			var4304 = var4321
		else
			error("Unsupported wire type: " .. var4305)
		end
	end
	return var4303
end

function t_112:jsonEncode() --[[ line: 23458 ]]
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	return t
end

function t_112:jsonDecode() --[[ line: 23472 ]]
	-- upvalues: t_112 (ref), t (ref)
	local var4323 = t_112.new()
	
	if self.foreground_header_entry ~= nil then
		var4323.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var4323.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var4323.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var4323.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	return var4323
end

t_112.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_112
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p226) --[[ line: 23508 ]]
	-- upvalues: t_113 (ref)
	return setmetatable({
		cta_button_text = if p226 == nil or p226.cta_button_text == nil then "" else p226.cta_button_text,
		cta_type = if p226 == nil or p226.cta_type == nil then "" else p226.cta_type
	}, t_113)
end

function t_113:encode() --[[ line: 23517 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4325 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4326, var4327 = protoModule.writeTag(buff, var4325, 1, protoModule.wireTypes.lengthDelimited)
		var4326, var4327 = protoModule.writeString(var4326, var4327, self.cta_button_text)
		buff = var4326
		var4325 = var4327
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var4328, var4329 = protoModule.writeTag(buff, var4325, 2, protoModule.wireTypes.lengthDelimited)
		var4328, var4329 = protoModule.writeString(var4328, var4329, self.cta_type)
		buff = var4328
		var4325 = var4329
	end
	local buff_1 = buffer.create(var4325)
	buffer.copy(buff_1, 0, buff, 0, var4325)
	
	return buff_1
end

function t_113.decode(p227) --[[ line: 23536 ]]
	-- upvalues: t_113 (ref), protoModule (ref)
	local var4331 = t_113.new()
	local var4332 = 0
	while var4332 < buffer.len(p227) do
		local _ = nil
		local var4333 = nil
		local var4334, var4335, var4336 = protoModule.readTag(p227, var4332)
		local var4337 = var4334
		var4333 = var4335
		var4332 = var4336
		
		if var4333 == protoModule.wireTypes.varint then
			local _ = nil
			local var4338, var4339 = protoModule.readVarInt(p227, var4332)
			local _ = var4338
			var4332 = var4339
			continue
		end
		if var4333 == protoModule.wireTypes.lengthDelimited then
			if var4337 == 1 then
				local _ = nil
				local var4340, var4341 = protoModule.readBuffer(p227, var4332)
				var4332 = var4341
				var4331.cta_button_text = buffer.tostring(var4340)
			elseif var4337 == 2 then
				local _ = nil
				local var4342, var4343 = protoModule.readBuffer(p227, var4332)
				var4332 = var4343
				var4331.cta_type = buffer.tostring(var4342)
			else
				local _ = nil
				local var4344, var4345 = protoModule.readVarInt(p227, var4332)
				var4332 = var4345 + var4344
			end
		elseif var4333 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4346, var4347 = protoModule.readFixed32(p227, var4332)
			local _ = var4346
			var4332 = var4347
		elseif var4333 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4348, var4349 = protoModule.readFixed64(p227, var4332)
			local _ = var4348
			var4332 = var4349
		else
			error("Unsupported wire type: " .. var4333)
		end
	end
	return var4331
end

function t_113:jsonEncode() --[[ line: 23584 ]]
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		t.ctaType = self.cta_type
	end
	return t
end

function t_113:jsonDecode() --[[ line: 23598 ]]
	-- upvalues: t_113 (ref)
	local var4351 = t_113.new()
	
	if self.cta_button_text ~= nil then
		var4351.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4351.cta_button_text = self.ctaButtonText
	end
	if self.cta_type ~= nil then
		var4351.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var4351.cta_type = self.ctaType
	end
	return var4351
end

t_113.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_113
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p228) --[[ line: 23636 ]]
	-- upvalues: t_114 (ref)
	return setmetatable({
		title = if p228 == nil or p228.title == nil then "" else p228.title,
		cta_button_text = if p228 == nil or p228.cta_button_text == nil then "" else p228.cta_button_text,
		image_asset_id = if p228 == nil or p228.image_asset_id == nil then "" else p228.image_asset_id,
		cta_type = if p228 == nil or p228.cta_type == nil then "" else p228.cta_type
	}, t_114)
end

function t_114:encode() --[[ line: 23645 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4353 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var4354, var4355 = protoModule.writeTag(buff, var4353, 1, protoModule.wireTypes.lengthDelimited)
		var4354, var4355 = protoModule.writeString(var4354, var4355, self.title)
		buff = var4354
		var4353 = var4355
	end
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4356, var4357 = protoModule.writeTag(buff, var4353, 2, protoModule.wireTypes.lengthDelimited)
		var4356, var4357 = protoModule.writeString(var4356, var4357, self.cta_button_text)
		buff = var4356
		var4353 = var4357
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var4358, var4359 = protoModule.writeTag(buff, var4353, 3, protoModule.wireTypes.lengthDelimited)
		var4358, var4359 = protoModule.writeString(var4358, var4359, self.image_asset_id)
		buff = var4358
		var4353 = var4359
	end
	if self.cta_type ~= nil and self.cta_type ~= "" then
		local var4360, var4361 = protoModule.writeTag(buff, var4353, 4, protoModule.wireTypes.lengthDelimited)
		var4360, var4361 = protoModule.writeString(var4360, var4361, self.cta_type)
		buff = var4360
		var4353 = var4361
	end
	local buff_1 = buffer.create(var4353)
	buffer.copy(buff_1, 0, buff, 0, var4353)
	
	return buff_1
end

function t_114.decode(p229) --[[ line: 23674 ]]
	-- upvalues: t_114 (ref), protoModule (ref)
	local var4363 = t_114.new()
	local var4364 = 0
	while var4364 < buffer.len(p229) do
		local _ = nil
		local var4365 = nil
		local var4366, var4367, var4368 = protoModule.readTag(p229, var4364)
		local var4369 = var4366
		var4365 = var4367
		var4364 = var4368
		
		if var4365 == protoModule.wireTypes.varint then
			local _ = nil
			local var4370, var4371 = protoModule.readVarInt(p229, var4364)
			local _ = var4370
			var4364 = var4371
			continue
		end
		if var4365 == protoModule.wireTypes.lengthDelimited then
			if var4369 == 1 then
				local _ = nil
				local var4372, var4373 = protoModule.readBuffer(p229, var4364)
				var4364 = var4373
				var4363.title = buffer.tostring(var4372)
			elseif var4369 == 2 then
				local _ = nil
				local var4374, var4375 = protoModule.readBuffer(p229, var4364)
				var4364 = var4375
				var4363.cta_button_text = buffer.tostring(var4374)
			elseif var4369 == 3 then
				local _ = nil
				local var4376, var4377 = protoModule.readBuffer(p229, var4364)
				var4364 = var4377
				var4363.image_asset_id = buffer.tostring(var4376)
			elseif var4369 == 4 then
				local _ = nil
				local var4378, var4379 = protoModule.readBuffer(p229, var4364)
				var4364 = var4379
				var4363.cta_type = buffer.tostring(var4378)
			else
				local _ = nil
				local var4380, var4381 = protoModule.readVarInt(p229, var4364)
				var4364 = var4381 + var4380
			end
		elseif var4365 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4382, var4383 = protoModule.readFixed32(p229, var4364)
			local _ = var4382
			var4364 = var4383
		elseif var4365 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4384, var4385 = protoModule.readFixed64(p229, var4364)
			local _ = var4384
			var4364 = var4385
		else
			error("Unsupported wire type: " .. var4365)
		end
	end
	return var4363
end

function t_114:jsonEncode() --[[ line: 23732 ]]
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

function t_114:jsonDecode() --[[ line: 23754 ]]
	-- upvalues: t_114 (ref)
	local var4387 = t_114.new()
	
	if self.title ~= nil then
		var4387.title = self.title
	end
	if self.cta_button_text ~= nil then
		var4387.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4387.cta_button_text = self.ctaButtonText
	end
	if self.image_asset_id ~= nil then
		var4387.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4387.image_asset_id = self.imageAssetId
	end
	if self.cta_type ~= nil then
		var4387.cta_type = self.cta_type
	end
	if self.ctaType ~= nil then
		var4387.cta_type = self.ctaType
	end
	return var4387
end

t_114.descriptor = {
	name = "ImageCtaSectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageCtaSectionInputData"
}
t.ImageCtaSectionInputData = t_114
typeRegistryModule.default:register(t.ImageCtaSectionInputData)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p230) --[[ line: 23802 ]]
	-- upvalues: t_115 (ref)
	return setmetatable({
		items = if p230 == nil or p230.items == nil then {} else p230.items,
		sort_id = if p230 == nil or p230.sort_id == nil then "" else p230.sort_id,
		recommendation_request_id = if p230 == nil or p230.recommendation_request_id == nil then "" else p230.recommendation_request_id
	}, t_115)
end

function t_115:encode() --[[ line: 23814 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4389 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4390 = v:encode()
			local var4391, var4392 = protoModule.writeTag(buff, var4389, 1, protoModule.wireTypes.lengthDelimited)
			var4391, var4392 = protoModule.writeBuffer(var4391, var4392, var4390, buffer.len(var4390))
			buff = var4391
			var4389 = var4392
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4393, var4394 = protoModule.writeTag(buff, var4389, 2, protoModule.wireTypes.lengthDelimited)
		var4393, var4394 = protoModule.writeString(var4393, var4394, self.sort_id)
		buff = var4393
		var4389 = var4394
	end
	if self.recommendation_request_id ~= nil and self.recommendation_request_id ~= "" then
		local var4395, var4396 = protoModule.writeTag(buff, var4389, 3, protoModule.wireTypes.lengthDelimited)
		var4395, var4396 = protoModule.writeString(var4395, var4396, self.recommendation_request_id)
		buff = var4395
		var4389 = var4396
	end
	local buff_1 = buffer.create(var4389)
	buffer.copy(buff_1, 0, buff, 0, var4389)
	
	return buff_1
end

function t_115.decode(p231) --[[ line: 23841 ]]
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var4398 = t_115.new()
	local var4399 = 0
	while var4399 < buffer.len(p231) do
		local _ = nil
		local var4400 = nil
		local var4401, var4402, var4403 = protoModule.readTag(p231, var4399)
		local var4404 = var4401
		var4400 = var4402
		var4399 = var4403
		
		if var4400 == protoModule.wireTypes.varint then
			local _ = nil
			local var4405, var4406 = protoModule.readVarInt(p231, var4399)
			local _ = var4405
			var4399 = var4406
			continue
		end
		if var4400 == protoModule.wireTypes.lengthDelimited then
			if var4404 == 1 then
				local _ = nil
				local var4407, var4408 = protoModule.readBuffer(p231, var4399)
				var4399 = var4408
				table.insert(var4398.items, t.FriendRecommendationCarouselInputData_RecommendationItem.decode(var4407))
			elseif var4404 == 2 then
				local _ = nil
				local var4409, var4410 = protoModule.readBuffer(p231, var4399)
				var4399 = var4410
				var4398.sort_id = buffer.tostring(var4409)
			elseif var4404 == 3 then
				local _ = nil
				local var4411, var4412 = protoModule.readBuffer(p231, var4399)
				var4399 = var4412
				var4398.recommendation_request_id = buffer.tostring(var4411)
			else
				local _ = nil
				local var4413, var4414 = protoModule.readVarInt(p231, var4399)
				var4399 = var4414 + var4413
			end
		elseif var4400 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4415, var4416 = protoModule.readFixed32(p231, var4399)
			local _ = var4415
			var4399 = var4416
		elseif var4400 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4417, var4418 = protoModule.readFixed64(p231, var4399)
			local _ = var4417
			var4399 = var4418
		else
			error("Unsupported wire type: " .. var4400)
		end
	end
	return var4398
end

function t_115:jsonEncode() --[[ line: 23897 ]]
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

function t_115:jsonDecode() --[[ line: 23919 ]]
	-- upvalues: t_115 (ref), t (ref)
	local var4421 = t_115.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.FriendRecommendationCarouselInputData_RecommendationItem.jsonDecode(v))
		end
		var4421.items = t_1
	end
	if self.sort_id ~= nil then
		var4421.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4421.sort_id = self.sortId
	end
	if self.recommendation_request_id ~= nil then
		var4421.recommendation_request_id = self.recommendation_request_id
	end
	if self.recommendationRequestId ~= nil then
		var4421.recommendation_request_id = self.recommendationRequestId
	end
	return var4421
end

t_115.descriptor = {
	name = "FriendRecommendationCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FriendRecommendationCarouselInputData"
}
t.FriendRecommendationCarouselInputData = t_115
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p232) --[[ line: 23970 ]]
	-- upvalues: t_116 (ref)
	return setmetatable({
		user_id = if p232 == nil or p232.user_id == nil then "" else p232.user_id
	}, t_116)
end

function t_116:encode() --[[ line: 23981 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4424 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var4425, var4426 = protoModule.writeTag(buff, var4424, 1, protoModule.wireTypes.lengthDelimited)
		var4425, var4426 = protoModule.writeString(var4425, var4426, self.user_id)
		buff = var4425
		var4424 = var4426
	end
	local buff_1 = buffer.create(var4424)
	buffer.copy(buff_1, 0, buff, 0, var4424)
	
	return buff_1
end

function t_116.decode(p233) --[[ line: 23997 ]]
	-- upvalues: t_116 (ref), protoModule (ref)
	local var4428 = t_116.new()
	local var4429 = 0
	while var4429 < buffer.len(p233) do
		local _ = nil
		local var4430 = nil
		local var4431, var4432, var4433 = protoModule.readTag(p233, var4429)
		local var4434 = var4431
		var4430 = var4432
		var4429 = var4433
		
		if var4430 == protoModule.wireTypes.varint then
			local _ = nil
			local var4435, var4436 = protoModule.readVarInt(p233, var4429)
			local _ = var4435
			var4429 = var4436
			continue
		end
		if var4430 == protoModule.wireTypes.lengthDelimited then
			if var4434 == 1 then
				local _ = nil
				local var4437, var4438 = protoModule.readBuffer(p233, var4429)
				var4429 = var4438
				var4428.user_id = buffer.tostring(var4437)
			else
				local _ = nil
				local var4439, var4440 = protoModule.readVarInt(p233, var4429)
				var4429 = var4440 + var4439
			end
		elseif var4430 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4441, var4442 = protoModule.readFixed32(p233, var4429)
			local _ = var4441
			var4429 = var4442
		elseif var4430 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4443, var4444 = protoModule.readFixed64(p233, var4429)
			local _ = var4443
			var4429 = var4444
		else
			error("Unsupported wire type: " .. var4430)
		end
	end
	return var4428
end

function t_116:jsonEncode() --[[ line: 24042 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_116:jsonDecode() --[[ line: 24054 ]]
	-- upvalues: t_116 (ref)
	local var4446 = t_116.new()
	
	if self.user_id ~= nil then
		var4446.user_id = self.user_id
	end
	if self.userId ~= nil then
		var4446.user_id = self.userId
	end
	return var4446
end

t_116.descriptor = {
	name = "FriendRecommendationCarouselInputData_UserRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserRecommendation"
}
t.FriendRecommendationCarouselInputData_UserRecommendation = t_116
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_UserRecommendation)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p234) --[[ line: 24086 ]]
	-- upvalues: t_117 (ref)
	return setmetatable({
		contact_id = if p234 == nil or p234.contact_id == nil then "" else p234.contact_id,
		contact_name = if p234 == nil or p234.contact_name == nil then "" else p234.contact_name,
		avatar_thumbnail_url = if p234 == nil or p234.avatar_thumbnail_url == nil then "" else p234.avatar_thumbnail_url,
		headshot_thumbnail_url = if p234 == nil or p234.headshot_thumbnail_url == nil then "" else p234.headshot_thumbnail_url
	}, t_117)
end

function t_117:encode() --[[ line: 24104 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4448 = 0
	
	if self.contact_id ~= nil and self.contact_id ~= "" then
		local var4449, var4450 = protoModule.writeTag(buff, var4448, 1, protoModule.wireTypes.lengthDelimited)
		var4449, var4450 = protoModule.writeString(var4449, var4450, self.contact_id)
		buff = var4449
		var4448 = var4450
	end
	if self.contact_name ~= nil and self.contact_name ~= "" then
		local var4451, var4452 = protoModule.writeTag(buff, var4448, 2, protoModule.wireTypes.lengthDelimited)
		var4451, var4452 = protoModule.writeString(var4451, var4452, self.contact_name)
		buff = var4451
		var4448 = var4452
	end
	if self.avatar_thumbnail_url ~= nil and self.avatar_thumbnail_url ~= "" then
		local var4453, var4454 = protoModule.writeTag(buff, var4448, 3, protoModule.wireTypes.lengthDelimited)
		var4453, var4454 = protoModule.writeString(var4453, var4454, self.avatar_thumbnail_url)
		buff = var4453
		var4448 = var4454
	end
	if self.headshot_thumbnail_url ~= nil and self.headshot_thumbnail_url ~= "" then
		local var4455, var4456 = protoModule.writeTag(buff, var4448, 4, protoModule.wireTypes.lengthDelimited)
		var4455, var4456 = protoModule.writeString(var4455, var4456, self.headshot_thumbnail_url)
		buff = var4455
		var4448 = var4456
	end
	local buff_1 = buffer.create(var4448)
	buffer.copy(buff_1, 0, buff, 0, var4448)
	
	return buff_1
end

function t_117.decode(p235) --[[ line: 24135 ]]
	-- upvalues: t_117 (ref), protoModule (ref)
	local var4458 = t_117.new()
	local var4459 = 0
	while var4459 < buffer.len(p235) do
		local _ = nil
		local var4460 = nil
		local var4461, var4462, var4463 = protoModule.readTag(p235, var4459)
		local var4464 = var4461
		var4460 = var4462
		var4459 = var4463
		
		if var4460 == protoModule.wireTypes.varint then
			local _ = nil
			local var4465, var4466 = protoModule.readVarInt(p235, var4459)
			local _ = var4465
			var4459 = var4466
			continue
		end
		if var4460 == protoModule.wireTypes.lengthDelimited then
			if var4464 == 1 then
				local _ = nil
				local var4467, var4468 = protoModule.readBuffer(p235, var4459)
				var4459 = var4468
				var4458.contact_id = buffer.tostring(var4467)
			elseif var4464 == 2 then
				local _ = nil
				local var4469, var4470 = protoModule.readBuffer(p235, var4459)
				var4459 = var4470
				var4458.contact_name = buffer.tostring(var4469)
			elseif var4464 == 3 then
				local _ = nil
				local var4471, var4472 = protoModule.readBuffer(p235, var4459)
				var4459 = var4472
				var4458.avatar_thumbnail_url = buffer.tostring(var4471)
			elseif var4464 == 4 then
				local _ = nil
				local var4473, var4474 = protoModule.readBuffer(p235, var4459)
				var4459 = var4474
				var4458.headshot_thumbnail_url = buffer.tostring(var4473)
			else
				local _ = nil
				local var4475, var4476 = protoModule.readVarInt(p235, var4459)
				var4459 = var4476 + var4475
			end
		elseif var4460 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4477, var4478 = protoModule.readFixed32(p235, var4459)
			local _ = var4477
			var4459 = var4478
		elseif var4460 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4479, var4480 = protoModule.readFixed64(p235, var4459)
			local _ = var4479
			var4459 = var4480
		else
			error("Unsupported wire type: " .. var4460)
		end
	end
	return var4458
end

function t_117:jsonEncode() --[[ line: 24195 ]]
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

function t_117:jsonDecode() --[[ line: 24219 ]]
	-- upvalues: t_117 (ref)
	local var4482 = t_117.new()
	
	if self.contact_id ~= nil then
		var4482.contact_id = self.contact_id
	end
	if self.contactId ~= nil then
		var4482.contact_id = self.contactId
	end
	if self.contact_name ~= nil then
		var4482.contact_name = self.contact_name
	end
	if self.contactName ~= nil then
		var4482.contact_name = self.contactName
	end
	if self.avatar_thumbnail_url ~= nil then
		var4482.avatar_thumbnail_url = self.avatar_thumbnail_url
	end
	if self.avatarThumbnailUrl ~= nil then
		var4482.avatar_thumbnail_url = self.avatarThumbnailUrl
	end
	if self.headshot_thumbnail_url ~= nil then
		var4482.headshot_thumbnail_url = self.headshot_thumbnail_url
	end
	if self.headshotThumbnailUrl ~= nil then
		var4482.headshot_thumbnail_url = self.headshotThumbnailUrl
	end
	return var4482
end

t_117.descriptor = {
	name = "FriendRecommendationCarouselInputData_ContactRecommendation",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContactRecommendation"
}
t.FriendRecommendationCarouselInputData_ContactRecommendation = t_117
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_ContactRecommendation)
local t_118 = {}
t_118.__index = t_118

function t_118.new(p236) --[[ line: 24275 ]]
	-- upvalues: t_118 (ref)
	return setmetatable({
		context_type = if p236 == nil or p236.context_type == nil then "" else p236.context_type,
		mutual_friends_count = if p236 == nil or p236.mutual_friends_count == nil then 0 else p236.mutual_friends_count,
		kind = if p236 == nil or p236.kind == nil then nil else p236.kind,
		has_pending_friend_request = if p236 == nil or p236.has_pending_friend_request == nil then false else p236.has_pending_friend_request
	}, t_118)
end

function t_118:encode() --[[ line: 24293 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4484 = 0
	
	if self.context_type ~= nil and self.context_type ~= "" then
		local var4485, var4486 = protoModule.writeTag(buff, var4484, 1, protoModule.wireTypes.lengthDelimited)
		var4485, var4486 = protoModule.writeString(var4485, var4486, self.context_type)
		buff = var4485
		var4484 = var4486
	end
	if self.mutual_friends_count ~= nil and self.mutual_friends_count ~= 0 then
		local var4487, var4488 = protoModule.writeTag(buff, var4484, 2, protoModule.wireTypes.varint)
		var4487, var4488 = protoModule.writeVarInt(var4487, var4488, self.mutual_friends_count)
		buff = var4487
		var4484 = var4488
	end
	if self.kind ~= nil then
		if self.kind.type == "user" then
			local var4489 = self.kind.value:encode()
			local var4490, var4491 = protoModule.writeTag(buff, var4484, 3, protoModule.wireTypes.lengthDelimited)
			var4490, var4491 = protoModule.writeBuffer(var4490, var4491, var4489, buffer.len(var4489))
			buff = var4490
			var4484 = var4491
		elseif self.kind.type == "contact" then
			local var4492 = self.kind.value:encode()
			local var4493, var4494 = protoModule.writeTag(buff, var4484, 4, protoModule.wireTypes.lengthDelimited)
			var4493, var4494 = protoModule.writeBuffer(var4493, var4494, var4492, buffer.len(var4492))
			buff = var4493
			var4484 = var4494
		end
	end
	if self.has_pending_friend_request then
		local var4495, var4496 = protoModule.writeTag(buff, var4484, 5, protoModule.wireTypes.varint)
		var4495, var4496 = protoModule.writeVarInt(var4495, var4496, if self.has_pending_friend_request then 1 else 0)
		buff = var4495
		var4484 = var4496
	end
	local buff_1 = buffer.create(var4484)
	buffer.copy(buff_1, 0, buff, 0, var4484)
	
	return buff_1
end

function t_118.decode(p237) --[[ line: 24331 ]]
	-- upvalues: t_118 (ref), protoModule (ref), t (ref)
	local var4498 = t_118.new()
	local var4499 = 0
	while var4499 < buffer.len(p237) do
		local _ = nil
		local var4500 = nil
		local var4501, var4502, var4503 = protoModule.readTag(p237, var4499)
		local var4504 = var4501
		var4500 = var4502
		var4499 = var4503
		
		if var4500 == protoModule.wireTypes.varint then
			if var4504 == 2 then
				local _ = nil
				local var4505, var4506 = protoModule.readVarIntI32(p237, var4499)
				var4499 = var4506
				var4498.mutual_friends_count = var4505
			elseif var4504 == 5 then
				local _ = nil
				local var4507, var4508 = protoModule.readVarInt(p237, var4499)
				var4499 = var4508
				var4498.has_pending_friend_request = var4507 ~= 0
			else
				local _ = nil
				local var4509, var4510 = protoModule.readVarInt(p237, var4499)
				local _ = var4509
				var4499 = var4510
			end
		end
		if var4500 == protoModule.wireTypes.lengthDelimited then
			if var4504 == 1 then
				local _ = nil
				local var4511, var4512 = protoModule.readBuffer(p237, var4499)
				var4499 = var4512
				var4498.context_type = buffer.tostring(var4511)
			elseif var4504 == 3 then
				local _ = nil
				local var4513, var4514 = protoModule.readBuffer(p237, var4499)
				var4499 = var4514
				var4498.kind = {
					type = "user",
					value = t.FriendRecommendationCarouselInputData_UserRecommendation.decode(var4513)
				}
			elseif var4504 == 4 then
				local _ = nil
				local var4515, var4516 = protoModule.readBuffer(p237, var4499)
				var4499 = var4516
				var4498.kind = {
					type = "contact",
					value = t.FriendRecommendationCarouselInputData_ContactRecommendation.decode(var4515)
				}
			else
				local _ = nil
				local var4517, var4518 = protoModule.readVarInt(p237, var4499)
				var4499 = var4518 + var4517
			end
		elseif var4500 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4519, var4520 = protoModule.readFixed32(p237, var4499)
			local _ = var4519
			var4499 = var4520
		elseif var4500 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4521, var4522 = protoModule.readFixed64(p237, var4499)
			local _ = var4521
			var4499 = var4522
		else
			error("Unsupported wire type: " .. var4500)
		end
	end
	return var4498
end

function t_118:jsonEncode() --[[ line: 24402 ]]
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

function t_118:jsonDecode() --[[ line: 24430 ]]
	-- upvalues: t_118 (ref), t (ref)
	local var4524 = t_118.new()
	
	if self.context_type ~= nil then
		var4524.context_type = self.context_type
	end
	if self.contextType ~= nil then
		var4524.context_type = self.contextType
	end
	if self.mutual_friends_count ~= nil then
		var4524.mutual_friends_count = self.mutual_friends_count
	end
	if self.mutualFriendsCount ~= nil then
		var4524.mutual_friends_count = self.mutualFriendsCount
	end
	if self.user ~= nil then
		var4524.kind = {
			type = "user",
			value = t.FriendRecommendationCarouselInputData_UserRecommendation.jsonDecode(self.user)
		}
	end
	if self.contact ~= nil then
		var4524.kind = {
			type = "contact",
			value = t.FriendRecommendationCarouselInputData_ContactRecommendation.jsonDecode(self.contact)
		}
	end
	if self.has_pending_friend_request ~= nil then
		var4524.has_pending_friend_request = self.has_pending_friend_request
	end
	if self.hasPendingFriendRequest ~= nil then
		var4524.has_pending_friend_request = self.hasPendingFriendRequest
	end
	return var4524
end

t_118.descriptor = {
	name = "FriendRecommendationCarouselInputData_RecommendationItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.RecommendationItem"
}
t.FriendRecommendationCarouselInputData_RecommendationItem = t_118
typeRegistryModule.default:register(t.FriendRecommendationCarouselInputData_RecommendationItem)
local t_119 = {}
t_119.__index = t_119

function t_119.new(p238) --[[ line: 24491 ]]
	-- upvalues: t_119 (ref)
	return setmetatable({
		selected_option = if p238 == nil or p238.selected_option == nil then "" else p238.selected_option,
		sort_id = if p238 == nil or p238.sort_id == nil then "" else p238.sort_id,
		options = if p238 == nil or p238.options == nil then {} else p238.options,
		experience_carousel = if p238 == nil or p238.experience_carousel == nil then nil else p238.experience_carousel,
		feed_item_key = if p238 == nil or p238.feed_item_key == nil then "" else p238.feed_item_key
	}, t_119)
end

function t_119:encode() --[[ line: 24505 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4526 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var4527, var4528 = protoModule.writeTag(buff, var4526, 1, protoModule.wireTypes.lengthDelimited)
		var4527, var4528 = protoModule.writeString(var4527, var4528, self.selected_option)
		buff = var4527
		var4526 = var4528
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4529, var4530 = protoModule.writeTag(buff, var4526, 2, protoModule.wireTypes.lengthDelimited)
		var4529, var4530 = protoModule.writeString(var4529, var4530, self.sort_id)
		buff = var4529
		var4526 = var4530
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var4531 = v:encode()
			local var4532, var4533 = protoModule.writeTag(buff, var4526, 3, protoModule.wireTypes.lengthDelimited)
			var4532, var4533 = protoModule.writeBuffer(var4532, var4533, var4531, buffer.len(var4531))
			buff = var4532
			var4526 = var4533
		end
	end
	if self.experience_carousel ~= nil then
		local var4534 = self.experience_carousel:encode()
		local var4535, var4536 = protoModule.writeTag(buff, var4526, 4, protoModule.wireTypes.lengthDelimited)
		var4535, var4536 = protoModule.writeBuffer(var4535, var4536, var4534, buffer.len(var4534))
		buff = var4535
		var4526 = var4536
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var4537, var4538 = protoModule.writeTag(buff, var4526, 5, protoModule.wireTypes.lengthDelimited)
		var4537, var4538 = protoModule.writeString(var4537, var4538, self.feed_item_key)
		buff = var4537
		var4526 = var4538
	end
	local buff_1 = buffer.create(var4526)
	buffer.copy(buff_1, 0, buff, 0, var4526)
	
	return buff_1
end

function t_119.decode(p239) --[[ line: 24543 ]]
	-- upvalues: t_119 (ref), protoModule (ref), t (ref)
	local var4540 = t_119.new()
	local var4541 = 0
	while var4541 < buffer.len(p239) do
		local _ = nil
		local var4542 = nil
		local var4543, var4544, var4545 = protoModule.readTag(p239, var4541)
		local var4546 = var4543
		var4542 = var4544
		var4541 = var4545
		
		if var4542 == protoModule.wireTypes.varint then
			local _ = nil
			local var4547, var4548 = protoModule.readVarInt(p239, var4541)
			local _ = var4547
			var4541 = var4548
			continue
		end
		if var4542 == protoModule.wireTypes.lengthDelimited then
			if var4546 == 1 then
				local _ = nil
				local var4549, var4550 = protoModule.readBuffer(p239, var4541)
				var4541 = var4550
				var4540.selected_option = buffer.tostring(var4549)
			elseif var4546 == 2 then
				local _ = nil
				local var4551, var4552 = protoModule.readBuffer(p239, var4541)
				var4541 = var4552
				var4540.sort_id = buffer.tostring(var4551)
			elseif var4546 == 3 then
				local _ = nil
				local var4553, var4554 = protoModule.readBuffer(p239, var4541)
				var4541 = var4554
				table.insert(var4540.options, t.SelectorOption.decode(var4553))
			elseif var4546 == 4 then
				local _ = nil
				local var4555, var4556 = protoModule.readBuffer(p239, var4541)
				var4541 = var4556
				var4540.experience_carousel = t.ExperienceCarouselInputData.decode(var4555)
			elseif var4546 == 5 then
				local _ = nil
				local var4557, var4558 = protoModule.readBuffer(p239, var4541)
				var4541 = var4558
				var4540.feed_item_key = buffer.tostring(var4557)
			else
				local _ = nil
				local var4559, var4560 = protoModule.readVarInt(p239, var4541)
				var4541 = var4560 + var4559
			end
		elseif var4542 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4561, var4562 = protoModule.readFixed32(p239, var4541)
			local _ = var4561
			var4541 = var4562
		elseif var4542 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4563, var4564 = protoModule.readFixed64(p239, var4541)
			local _ = var4563
			var4541 = var4564
		else
			error("Unsupported wire type: " .. var4542)
		end
	end
	return var4540
end

function t_119:jsonEncode() --[[ line: 24606 ]]
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

function t_119:jsonDecode() --[[ line: 24636 ]]
	-- upvalues: t_119 (ref), t (ref)
	local var4567 = t_119.new()
	
	if self.selected_option ~= nil then
		var4567.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var4567.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var4567.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4567.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var4567.options = t_1
	end
	if self.experience_carousel ~= nil then
		var4567.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var4567.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var4567.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var4567.feed_item_key = self.feedItemKey
	end
	return var4567
end

t_119.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_119
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_120 = {}
t_120.__index = t_120

function t_120.new(p240) --[[ line: 24697 ]]
	-- upvalues: t_120 (ref)
	return setmetatable({
		id = if p240 == nil or p240.id == nil then "" else p240.id,
		display_name = if p240 == nil or p240.display_name == nil then "" else p240.display_name,
		is_selected = if p240 == nil or p240.is_selected == nil then false else p240.is_selected
	}, t_120)
end

function t_120:encode() --[[ line: 24705 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4570 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var4571, var4572 = protoModule.writeTag(buff, var4570, 1, protoModule.wireTypes.lengthDelimited)
		var4571, var4572 = protoModule.writeString(var4571, var4572, self.id)
		buff = var4571
		var4570 = var4572
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4573, var4574 = protoModule.writeTag(buff, var4570, 2, protoModule.wireTypes.lengthDelimited)
		var4573, var4574 = protoModule.writeString(var4573, var4574, self.display_name)
		buff = var4573
		var4570 = var4574
	end
	if self.is_selected then
		local var4575, var4576 = protoModule.writeTag(buff, var4570, 3, protoModule.wireTypes.varint)
		var4575, var4576 = protoModule.writeVarInt(var4575, var4576, if self.is_selected then 1 else 0)
		buff = var4575
		var4570 = var4576
	end
	local buff_1 = buffer.create(var4570)
	buffer.copy(buff_1, 0, buff, 0, var4570)
	
	return buff_1
end

function t_120.decode(p241) --[[ line: 24729 ]]
	-- upvalues: t_120 (ref), protoModule (ref)
	local var4578 = t_120.new()
	local var4579 = 0
	while var4579 < buffer.len(p241) do
		local _ = nil
		local var4580 = nil
		local var4581, var4582, var4583 = protoModule.readTag(p241, var4579)
		local var4584 = var4581
		var4580 = var4582
		var4579 = var4583
		
		if var4580 == protoModule.wireTypes.varint then
			if var4584 == 3 then
				local _ = nil
				local var4585, var4586 = protoModule.readVarInt(p241, var4579)
				var4579 = var4586
				var4578.is_selected = var4585 ~= 0
			else
				local _ = nil
				local var4587, var4588 = protoModule.readVarInt(p241, var4579)
				local _ = var4587
				var4579 = var4588
			end
		end
		if var4580 == protoModule.wireTypes.lengthDelimited then
			if var4584 == 1 then
				local _ = nil
				local var4589, var4590 = protoModule.readBuffer(p241, var4579)
				var4579 = var4590
				var4578.id = buffer.tostring(var4589)
			elseif var4584 == 2 then
				local _ = nil
				local var4591, var4592 = protoModule.readBuffer(p241, var4579)
				var4579 = var4592
				var4578.display_name = buffer.tostring(var4591)
			else
				local _ = nil
				local var4593, var4594 = protoModule.readVarInt(p241, var4579)
				var4579 = var4594 + var4593
			end
		elseif var4580 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4595, var4596 = protoModule.readFixed32(p241, var4579)
			local _ = var4595
			var4579 = var4596
		elseif var4580 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4597, var4598 = protoModule.readFixed64(p241, var4579)
			local _ = var4597
			var4579 = var4598
		else
			error("Unsupported wire type: " .. var4580)
		end
	end
	return var4578
end

function t_120:jsonEncode() --[[ line: 24782 ]]
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

function t_120:jsonDecode() --[[ line: 24800 ]]
	-- upvalues: t_120 (ref)
	local var4600 = t_120.new()
	
	if self.id ~= nil then
		var4600.id = self.id
	end
	if self.display_name ~= nil then
		var4600.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var4600.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var4600.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var4600.is_selected = self.isSelected
	end
	return var4600
end

t_120.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_120
typeRegistryModule.default:register(t.SelectorOption)
local t_121 = {}
t_121.__index = t_121

function t_121.new(p242) --[[ line: 24840 ]]
	-- upvalues: t_121 (ref)
	return setmetatable({
		layout = if p242 == nil or p242.layout == nil then nil else p242.layout,
		kind = if p242 == nil or p242.kind == nil then nil else p242.kind
	}, t_121)
end

function t_121:encode() --[[ line: 24847 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4602 = 0
	
	if self.layout ~= nil then
		local var4603 = self.layout:encode()
		local var4604, var4605 = protoModule.writeTag(buff, var4602, 1, protoModule.wireTypes.lengthDelimited)
		var4604, var4605 = protoModule.writeBuffer(var4604, var4605, var4603, buffer.len(var4603))
		buff = var4604
		var4602 = var4605
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		local var4606 = self.kind.value:encode()
		local var4607, var4608 = protoModule.writeTag(buff, var4602, 2, protoModule.wireTypes.lengthDelimited)
		var4607, var4608 = protoModule.writeBuffer(var4607, var4608, var4606, buffer.len(var4606))
		buff = var4607
		var4602 = var4608
	end
	local buff_1 = buffer.create(var4602)
	buffer.copy(buff_1, 0, buff, 0, var4602)
	
	return buff_1
end

function t_121.decode(p243) --[[ line: 24870 ]]
	-- upvalues: t_121 (ref), protoModule (ref), t (ref)
	local var4610 = t_121.new()
	local var4611 = 0
	while var4611 < buffer.len(p243) do
		local _ = nil
		local var4612 = nil
		local var4613, var4614, var4615 = protoModule.readTag(p243, var4611)
		local var4616 = var4613
		var4612 = var4614
		var4611 = var4615
		
		if var4612 == protoModule.wireTypes.varint then
			local _ = nil
			local var4617, var4618 = protoModule.readVarInt(p243, var4611)
			local _ = var4617
			var4611 = var4618
			continue
		end
		if var4612 == protoModule.wireTypes.lengthDelimited then
			if var4616 == 1 then
				local _ = nil
				local var4619, var4620 = protoModule.readBuffer(p243, var4611)
				var4611 = var4620
				var4610.layout = t.ItemLayout.decode(var4619)
			elseif var4616 == 2 then
				local _ = nil
				local var4621, var4622 = protoModule.readBuffer(p243, var4611)
				var4611 = var4622
				var4610.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var4621)
				}
			else
				local _ = nil
				local var4623, var4624 = protoModule.readVarInt(p243, var4611)
				var4611 = var4624 + var4623
			end
		elseif var4612 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4625, var4626 = protoModule.readFixed32(p243, var4611)
			local _ = var4625
			var4611 = var4626
		elseif var4612 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4627, var4628 = protoModule.readFixed64(p243, var4611)
			local _ = var4627
			var4611 = var4628
		else
			error("Unsupported wire type: " .. var4612)
		end
	end
	return var4610
end

function t_121:jsonEncode() --[[ line: 24919 ]]
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		t.universe = self.kind.value:jsonEncode()
	end
	return t
end

function t_121:jsonDecode() --[[ line: 24935 ]]
	-- upvalues: t_121 (ref), t (ref)
	local var4630 = t_121.new()
	
	if self.layout ~= nil then
		var4630.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var4630.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	return var4630
end

t_121.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_121
typeRegistryModule.default:register(t.ItemWithLayout)
local t_122 = {}
t_122.__index = t_122

function t_122.new(p244) --[[ line: 24966 ]]
	-- upvalues: t_122 (ref)
	return setmetatable({
		items = if p244 == nil or p244.items == nil then {} else p244.items,
		collection_item_size = if p244 == nil or p244.collection_item_size == nil then nil else p244.collection_item_size
	}, t_122)
end

function t_122:encode() --[[ line: 24975 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4632 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4633 = v:encode()
			local var4634, var4635 = protoModule.writeTag(buff, var4632, 1, protoModule.wireTypes.lengthDelimited)
			var4634, var4635 = protoModule.writeBuffer(var4634, var4635, var4633, buffer.len(var4633))
			buff = var4634
			var4632 = var4635
		end
	end
	if self.collection_item_size ~= nil then
		local var4636, var4637 = protoModule.writeTag(buff, var4632, 2, protoModule.wireTypes.lengthDelimited)
		var4636, var4637 = protoModule.writeString(var4636, var4637, self.collection_item_size)
		buff = var4636
		var4632 = var4637
	end
	local buff_1 = buffer.create(var4632)
	buffer.copy(buff_1, 0, buff, 0, var4632)
	
	return buff_1
end

function t_122.decode(p245) --[[ line: 24997 ]]
	-- upvalues: t_122 (ref), protoModule (ref), t (ref)
	local var4639 = t_122.new()
	local var4640 = 0
	while var4640 < buffer.len(p245) do
		local _ = nil
		local var4641 = nil
		local var4642, var4643, var4644 = protoModule.readTag(p245, var4640)
		local var4645 = var4642
		var4641 = var4643
		var4640 = var4644
		
		if var4641 == protoModule.wireTypes.varint then
			local _ = nil
			local var4646, var4647 = protoModule.readVarInt(p245, var4640)
			local _ = var4646
			var4640 = var4647
			continue
		end
		if var4641 == protoModule.wireTypes.lengthDelimited then
			if var4645 == 1 then
				local _ = nil
				local var4648, var4649 = protoModule.readBuffer(p245, var4640)
				var4640 = var4649
				table.insert(var4639.items, t.ItemWithLayout.decode(var4648))
			elseif var4645 == 2 then
				local _ = nil
				local var4650, var4651 = protoModule.readBuffer(p245, var4640)
				var4640 = var4651
				var4639.collection_item_size = buffer.tostring(var4650)
			else
				local _ = nil
				local var4652, var4653 = protoModule.readVarInt(p245, var4640)
				var4640 = var4653 + var4652
			end
		elseif var4641 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4654, var4655 = protoModule.readFixed32(p245, var4640)
			local _ = var4654
			var4640 = var4655
		elseif var4641 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4656, var4657 = protoModule.readFixed64(p245, var4640)
			local _ = var4656
			var4640 = var4657
		else
			error("Unsupported wire type: " .. var4641)
		end
	end
	return var4639
end

function t_122:jsonEncode() --[[ line: 25045 ]]
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

function t_122:jsonDecode() --[[ line: 25063 ]]
	-- upvalues: t_122 (ref), t (ref)
	local var4660 = t_122.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var4660.items = t_1
	end
	if self.collection_item_size ~= nil then
		var4660.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var4660.collection_item_size = self.collectionItemSize
	end
	return var4660
end

t_122.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_122
typeRegistryModule.default:register(t.ContentPool)
local t_123 = {}
t_123.__index = t_123

function t_123.new(p246) --[[ line: 25100 ]]
	-- upvalues: t_123 (ref)
	return setmetatable({
		col_span = if p246 == nil or p246.col_span == nil then 0 else p246.col_span,
		row_span = if p246 == nil or p246.row_span == nil then 0 else p246.row_span,
		alignment_type = if p246 == nil or p246.alignment_type == nil then "" else p246.alignment_type,
		min_row_padding = if p246 == nil or p246.min_row_padding == nil then 0 else p246.min_row_padding
	}, t_123)
end

function t_123:encode() --[[ line: 25109 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4663 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var4664, var4665 = protoModule.writeTag(buff, var4663, 1, protoModule.wireTypes.varint)
		var4664, var4665 = protoModule.writeVarInt(var4664, var4665, self.col_span)
		buff = var4664
		var4663 = var4665
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var4666, var4667 = protoModule.writeTag(buff, var4663, 2, protoModule.wireTypes.varint)
		var4666, var4667 = protoModule.writeVarInt(var4666, var4667, self.row_span)
		buff = var4666
		var4663 = var4667
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var4668, var4669 = protoModule.writeTag(buff, var4663, 3, protoModule.wireTypes.lengthDelimited)
		var4668, var4669 = protoModule.writeString(var4668, var4669, self.alignment_type)
		buff = var4668
		var4663 = var4669
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var4670, var4671 = protoModule.writeTag(buff, var4663, 4, protoModule.wireTypes.varint)
		var4670, var4671 = protoModule.writeVarInt(var4670, var4671, self.min_row_padding)
		buff = var4670
		var4663 = var4671
	end
	local buff_1 = buffer.create(var4663)
	buffer.copy(buff_1, 0, buff, 0, var4663)
	
	return buff_1
end

function t_123.decode(p247) --[[ line: 25138 ]]
	-- upvalues: t_123 (ref), protoModule (ref)
	local var4673 = t_123.new()
	local var4674 = 0
	while var4674 < buffer.len(p247) do
		local _ = nil
		local var4675 = nil
		local var4676, var4677, var4678 = protoModule.readTag(p247, var4674)
		local var4679 = var4676
		var4675 = var4677
		var4674 = var4678
		
		if var4675 == protoModule.wireTypes.varint then
			if var4679 == 1 then
				local _ = nil
				local var4680, var4681 = protoModule.readVarIntI32(p247, var4674)
				var4674 = var4681
				var4673.col_span = var4680
			elseif var4679 == 2 then
				local _ = nil
				local var4682, var4683 = protoModule.readVarIntI32(p247, var4674)
				var4674 = var4683
				var4673.row_span = var4682
			elseif var4679 == 4 then
				local _ = nil
				local var4684, var4685 = protoModule.readVarIntI32(p247, var4674)
				var4674 = var4685
				var4673.min_row_padding = var4684
			else
				local _ = nil
				local var4686, var4687 = protoModule.readVarInt(p247, var4674)
				local _ = var4686
				var4674 = var4687
			end
		end
		if var4675 == protoModule.wireTypes.lengthDelimited then
			if var4679 == 3 then
				local _ = nil
				local var4688, var4689 = protoModule.readBuffer(p247, var4674)
				var4674 = var4689
				var4673.alignment_type = buffer.tostring(var4688)
			else
				local _ = nil
				local var4690, var4691 = protoModule.readVarInt(p247, var4674)
				var4674 = var4691 + var4690
			end
		elseif var4675 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4692, var4693 = protoModule.readFixed32(p247, var4674)
			local _ = var4692
			var4674 = var4693
		elseif var4675 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4694, var4695 = protoModule.readFixed64(p247, var4674)
			local _ = var4694
			var4674 = var4695
		else
			error("Unsupported wire type: " .. var4675)
		end
	end
	return var4673
end

function t_123:jsonEncode() --[[ line: 25196 ]]
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

function t_123:jsonDecode() --[[ line: 25218 ]]
	-- upvalues: t_123 (ref)
	local var4697 = t_123.new()
	
	if self.col_span ~= nil then
		var4697.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var4697.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var4697.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var4697.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var4697.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var4697.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var4697.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var4697.min_row_padding = self.minRowPadding
	end
	return var4697
end

t_123.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_123
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p248) --[[ line: 25267 ]]
		return if p248 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p248 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p249) --[[ line: 25277 ]]
		return if p249 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p249 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p249
	end,
	fromName = function(p250) --[[ line: 25287 ]]
		return if p250 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p250 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	PageEntryFormat = t.PageEntryFormat
}