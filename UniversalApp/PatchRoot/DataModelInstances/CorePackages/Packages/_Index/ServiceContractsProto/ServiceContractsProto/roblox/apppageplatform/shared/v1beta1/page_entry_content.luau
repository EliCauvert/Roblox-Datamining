local protoModule = require(script.Parent.Parent.Parent.Parent.Parent.proto)
local typeRegistryModule = require(script.Parent.Parent.Parent.Parent.Parent.proto.typeRegistry)
local t = {}
local backgroundLayerModule = require(script.Parent.background_layer)
local pageEntryModule = require(script.Parent.page_entry)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p0) --[[ line: 3746 ]]
	-- upvalues: t_1 (ref)
	return setmetatable({
		page_entry = if p0 == nil or p0.page_entry == nil then nil else p0.page_entry,
		input_data = if p0 == nil or p0.input_data == nil then nil else p0.input_data
	}, t_1)
end

function t_1:encode() --[[ line: 3753 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var123 = 0
	
	if self.page_entry ~= nil then
		local var124 = self.page_entry:encode()
		local var125, var126 = protoModule.writeTag(buff, var123, 1, protoModule.wireTypes.lengthDelimited)
		var125, var126 = protoModule.writeBuffer(var125, var126, var124, buffer.len(var124))
		buff = var125
		var123 = var126
	end
	if self.input_data ~= nil then
		local var127 = self.input_data:encode()
		local var128, var129 = protoModule.writeTag(buff, var123, 2, protoModule.wireTypes.lengthDelimited)
		var128, var129 = protoModule.writeBuffer(var128, var129, var127, buffer.len(var127))
		buff = var128
		var123 = var129
	end
	local buff_1 = buffer.create(var123)
	buffer.copy(buff_1, 0, buff, 0, var123)
	
	return buff_1
end

function t_1.decode(p1) --[[ line: 3774 ]]
	-- upvalues: t_1 (ref), protoModule (ref), pageEntryModule (ref), t (ref)
	local var131 = t_1.new()
	local var132 = 0
	while var132 < buffer.len(p1) do
		local _ = nil
		local var133 = nil
		local var134, var135, var136 = protoModule.readTag(p1, var132)
		local var137 = var134
		var133 = var135
		var132 = var136
		
		if var133 == protoModule.wireTypes.varint then
			local _ = nil
			local var138, var139 = protoModule.readVarInt(p1, var132)
			local _ = var138
			var132 = var139
			continue
		end
		if var133 == protoModule.wireTypes.lengthDelimited then
			if var137 == 1 then
				local _ = nil
				local var140, var141 = protoModule.readBuffer(p1, var132)
				var132 = var141
				var131.page_entry = pageEntryModule.PageEntry.decode(var140)
			elseif var137 == 2 then
				local _ = nil
				local var142, var143 = protoModule.readBuffer(p1, var132)
				var132 = var143
				var131.input_data = t.PageEntryInputData.decode(var142)
			else
				local _ = nil
				local var144, var145 = protoModule.readVarInt(p1, var132)
				var132 = var145 + var144
			end
		elseif var133 == protoModule.wireTypes.i32 then
			local _ = nil
			local var146, var147 = protoModule.readFixed32(p1, var132)
			local _ = var146
			var132 = var147
		elseif var133 == protoModule.wireTypes.i64 then
			local _ = nil
			local var148, var149 = protoModule.readFixed64(p1, var132)
			local _ = var148
			var132 = var149
		else
			error("Unsupported wire type: " .. var133)
		end
	end
	return var131
end

function t_1:jsonEncode() --[[ line: 3822 ]]
	local t = {}
	
	if self.page_entry ~= nil then
		t.pageEntry = self.page_entry:jsonEncode()
	end
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	return t
end

function t_1:jsonDecode() --[[ line: 3836 ]]
	-- upvalues: t_1 (ref), pageEntryModule (ref), t (ref)
	local var151 = t_1.new()
	
	if self.page_entry ~= nil then
		var151.page_entry = pageEntryModule.PageEntry.jsonDecode(self.page_entry)
	end
	if self.pageEntry ~= nil then
		var151.page_entry = pageEntryModule.PageEntry.jsonDecode(self.pageEntry)
	end
	if self.input_data ~= nil then
		var151.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var151.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	return var151
end

t_1.descriptor = {
	name = "UniversalPageEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniversalPageEntry"
}
t.UniversalPageEntry = t_1
typeRegistryModule.default:register(t.UniversalPageEntry)
local t_2 = {}
t_2.__index = t_2

function t_2.new(p2) --[[ line: 3872 ]]
	-- upvalues: t_2 (ref)
	return setmetatable({
		input_data = if p2 == nil or p2.input_data == nil then nil else p2.input_data,
		roblox_component = if p2 == nil or p2.roblox_component == nil then "" else p2.roblox_component
	}, t_2)
end

function t_2:encode() --[[ line: 3879 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var153 = 0
	
	if self.input_data ~= nil then
		local var154 = self.input_data:encode()
		local var155, var156 = protoModule.writeTag(buff, var153, 1, protoModule.wireTypes.lengthDelimited)
		var155, var156 = protoModule.writeBuffer(var155, var156, var154, buffer.len(var154))
		buff = var155
		var153 = var156
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var157, var158 = protoModule.writeTag(buff, var153, 2, protoModule.wireTypes.lengthDelimited)
		var157, var158 = protoModule.writeString(var157, var158, self.roblox_component)
		buff = var157
		var153 = var158
	end
	local buff_1 = buffer.create(var153)
	buffer.copy(buff_1, 0, buff, 0, var153)
	
	return buff_1
end

function t_2.decode(p3) --[[ line: 3899 ]]
	-- upvalues: t_2 (ref), protoModule (ref), t (ref)
	local var160 = t_2.new()
	local var161 = 0
	while var161 < buffer.len(p3) do
		local _ = nil
		local var162 = nil
		local var163, var164, var165 = protoModule.readTag(p3, var161)
		local var166 = var163
		var162 = var164
		var161 = var165
		
		if var162 == protoModule.wireTypes.varint then
			local _ = nil
			local var167, var168 = protoModule.readVarInt(p3, var161)
			local _ = var167
			var161 = var168
			continue
		end
		if var162 == protoModule.wireTypes.lengthDelimited then
			if var166 == 1 then
				local _ = nil
				local var169, var170 = protoModule.readBuffer(p3, var161)
				var161 = var170
				var160.input_data = t.PageEntryInputData.decode(var169)
			elseif var166 == 2 then
				local _ = nil
				local var171, var172 = protoModule.readBuffer(p3, var161)
				var161 = var172
				var160.roblox_component = buffer.tostring(var171)
			else
				local _ = nil
				local var173, var174 = protoModule.readVarInt(p3, var161)
				var161 = var174 + var173
			end
		elseif var162 == protoModule.wireTypes.i32 then
			local _ = nil
			local var175, var176 = protoModule.readFixed32(p3, var161)
			local _ = var175
			var161 = var176
		elseif var162 == protoModule.wireTypes.i64 then
			local _ = nil
			local var177, var178 = protoModule.readFixed64(p3, var161)
			local _ = var177
			var161 = var178
		else
			error("Unsupported wire type: " .. var162)
		end
	end
	return var160
end

function t_2:jsonEncode() --[[ line: 3947 ]]
	local t = {}
	
	if self.input_data ~= nil then
		t.inputData = self.input_data:jsonEncode()
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		t.robloxComponent = self.roblox_component
	end
	return t
end

function t_2:jsonDecode() --[[ line: 3961 ]]
	-- upvalues: t_2 (ref), t (ref)
	local var180 = t_2.new()
	
	if self.input_data ~= nil then
		var180.input_data = t.PageEntryInputData.jsonDecode(self.input_data)
	end
	if self.inputData ~= nil then
		var180.input_data = t.PageEntryInputData.jsonDecode(self.inputData)
	end
	if self.roblox_component ~= nil then
		var180.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var180.roblox_component = self.robloxComponent
	end
	return var180
end

t_2.descriptor = {
	name = "FeedEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.FeedEntry"
}
t.FeedEntry = t_2
typeRegistryModule.default:register(t.FeedEntry)
local t_3 = {}
t_3.__index = t_3

function t_3.new(p4) --[[ line: 3997 ]]
	-- upvalues: t_3 (ref)
	return setmetatable({
		roblox_component = if p4 == nil or p4.roblox_component == nil then "" else p4.roblox_component,
		input_data = if p4 == nil or p4.input_data == nil then nil else p4.input_data,
		cta_buttons = if p4 == nil or p4.cta_buttons == nil then nil else p4.cta_buttons
	}, t_3)
end

function t_3:encode() --[[ line: 4005 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var182 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var183, var184 = protoModule.writeTag(buff, var182, 1, protoModule.wireTypes.lengthDelimited)
		var183, var184 = protoModule.writeString(var183, var184, self.roblox_component)
		buff = var183
		var182 = var184
	end
	if self.input_data ~= nil and self.input_data.type == "attribution_row" then
		local var185 = self.input_data.value:encode()
		local var186, var187 = protoModule.writeTag(buff, var182, 2, protoModule.wireTypes.lengthDelimited)
		var186, var187 = protoModule.writeBuffer(var186, var187, var185, buffer.len(var185))
		buff = var186
		var182 = var187
	end
	if self.cta_buttons ~= nil then
		local var188 = self.cta_buttons:encode()
		local var189, var190 = protoModule.writeTag(buff, var182, 3, protoModule.wireTypes.lengthDelimited)
		var189, var190 = protoModule.writeBuffer(var189, var190, var188, buffer.len(var188))
		buff = var189
		var182 = var190
	end
	local buff_1 = buffer.create(var182)
	buffer.copy(buff_1, 0, buff, 0, var182)
	
	return buff_1
end

function t_3.decode(p5) --[[ line: 4033 ]]
	-- upvalues: t_3 (ref), protoModule (ref), t (ref)
	local var192 = t_3.new()
	local var193 = 0
	while var193 < buffer.len(p5) do
		local _ = nil
		local var194 = nil
		local var195, var196, var197 = protoModule.readTag(p5, var193)
		local var198 = var195
		var194 = var196
		var193 = var197
		
		if var194 == protoModule.wireTypes.varint then
			local _ = nil
			local var199, var200 = protoModule.readVarInt(p5, var193)
			local _ = var199
			var193 = var200
			continue
		end
		if var194 == protoModule.wireTypes.lengthDelimited then
			if var198 == 1 then
				local _ = nil
				local var201, var202 = protoModule.readBuffer(p5, var193)
				var193 = var202
				var192.roblox_component = buffer.tostring(var201)
			elseif var198 == 2 then
				local _ = nil
				local var203, var204 = protoModule.readBuffer(p5, var193)
				var193 = var204
				var192.input_data = {
					type = "attribution_row",
					value = t.AttributionRowInputData.decode(var203)
				}
			elseif var198 == 3 then
				local _ = nil
				local var205, var206 = protoModule.readBuffer(p5, var193)
				var193 = var206
				var192.cta_buttons = t.CtaButtonsInputData.decode(var205)
			else
				local _ = nil
				local var207, var208 = protoModule.readVarInt(p5, var193)
				var193 = var208 + var207
			end
		elseif var194 == protoModule.wireTypes.i32 then
			local _ = nil
			local var209, var210 = protoModule.readFixed32(p5, var193)
			local _ = var209
			var193 = var210
		elseif var194 == protoModule.wireTypes.i64 then
			local _ = nil
			local var211, var212 = protoModule.readFixed64(p5, var193)
			local _ = var211
			var193 = var212
		else
			error("Unsupported wire type: " .. var194)
		end
	end
	return var192
end

function t_3:jsonEncode() --[[ line: 4087 ]]
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

function t_3:jsonDecode() --[[ line: 4107 ]]
	-- upvalues: t_3 (ref), t (ref)
	local var214 = t_3.new()
	
	if self.roblox_component ~= nil then
		var214.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var214.roblox_component = self.robloxComponent
	end
	if self.attribution_row ~= nil then
		var214.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attribution_row)
		}
	end
	if self.attributionRow ~= nil then
		var214.input_data = {
			type = "attribution_row",
			value = t.AttributionRowInputData.jsonDecode(self.attributionRow)
		}
	end
	if self.cta_buttons ~= nil then
		var214.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.cta_buttons)
	end
	if self.ctaButtons ~= nil then
		var214.cta_buttons = t.CtaButtonsInputData.jsonDecode(self.ctaButtons)
	end
	return var214
end

t_3.descriptor = {
	name = "ForegroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ForegroundHeaderEntry"
}
t.ForegroundHeaderEntry = t_3
typeRegistryModule.default:register(t.ForegroundHeaderEntry)
local t_4 = {}
t_4.__index = t_4

function t_4.new(p6) --[[ line: 4153 ]]
	-- upvalues: t_4 (ref)
	return setmetatable({
		roblox_component = if p6 == nil or p6.roblox_component == nil then "" else p6.roblox_component,
		input_data = if p6 == nil or p6.input_data == nil then nil else p6.input_data
	}, t_4)
end

function t_4:encode() --[[ line: 4160 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var216 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var217, var218 = protoModule.writeTag(buff, var216, 1, protoModule.wireTypes.lengthDelimited)
		var217, var218 = protoModule.writeString(var217, var218, self.roblox_component)
		buff = var217
		var216 = var218
	end
	if self.input_data ~= nil then
		if self.input_data.type == "image" then
			local var219 = self.input_data.value:encode()
			local var220, var221 = protoModule.writeTag(buff, var216, 2, protoModule.wireTypes.lengthDelimited)
			var220, var221 = protoModule.writeBuffer(var220, var221, var219, buffer.len(var219))
			buff = var220
			var216 = var221
		elseif self.input_data.type == "video" then
			local var222 = self.input_data.value:encode()
			local var223, var224 = protoModule.writeTag(buff, var216, 3, protoModule.wireTypes.lengthDelimited)
			var223, var224 = protoModule.writeBuffer(var223, var224, var222, buffer.len(var222))
			buff = var223
			var216 = var224
		end
	end
	local buff_1 = buffer.create(var216)
	buffer.copy(buff_1, 0, buff, 0, var216)
	
	return buff_1
end

function t_4.decode(p7) --[[ line: 4186 ]]
	-- upvalues: t_4 (ref), protoModule (ref), t (ref)
	local var226 = t_4.new()
	local var227 = 0
	while var227 < buffer.len(p7) do
		local _ = nil
		local var228 = nil
		local var229, var230, var231 = protoModule.readTag(p7, var227)
		local var232 = var229
		var228 = var230
		var227 = var231
		
		if var228 == protoModule.wireTypes.varint then
			local _ = nil
			local var233, var234 = protoModule.readVarInt(p7, var227)
			local _ = var233
			var227 = var234
			continue
		end
		if var228 == protoModule.wireTypes.lengthDelimited then
			if var232 == 1 then
				local _ = nil
				local var235, var236 = protoModule.readBuffer(p7, var227)
				var227 = var236
				var226.roblox_component = buffer.tostring(var235)
			elseif var232 == 2 then
				local _ = nil
				local var237, var238 = protoModule.readBuffer(p7, var227)
				var227 = var238
				var226.input_data = { type = "image", value = t.ImageInputData.decode(var237) }
			elseif var232 == 3 then
				local _ = nil
				local var239, var240 = protoModule.readBuffer(p7, var227)
				var227 = var240
				var226.input_data = { type = "video", value = t.VideoInputData.decode(var239) }
			else
				local _ = nil
				local var241, var242 = protoModule.readVarInt(p7, var227)
				var227 = var242 + var241
			end
		elseif var228 == protoModule.wireTypes.i32 then
			local _ = nil
			local var243, var244 = protoModule.readFixed32(p7, var227)
			local _ = var243
			var227 = var244
		elseif var228 == protoModule.wireTypes.i64 then
			local _ = nil
			local var245, var246 = protoModule.readFixed64(p7, var227)
			local _ = var245
			var227 = var246
		else
			error("Unsupported wire type: " .. var228)
		end
	end
	return var226
end

function t_4:jsonEncode() --[[ line: 4239 ]]
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

function t_4:jsonDecode() --[[ line: 4257 ]]
	-- upvalues: t_4 (ref), t (ref)
	local var248 = t_4.new()
	
	if self.roblox_component ~= nil then
		var248.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var248.roblox_component = self.robloxComponent
	end
	if self.image ~= nil then
		var248.input_data = {
			type = "image",
			value = t.ImageInputData.jsonDecode(self.image)
		}
	end
	if self.video ~= nil then
		var248.input_data = {
			type = "video",
			value = t.VideoInputData.jsonDecode(self.video)
		}
	end
	return var248
end

t_4.descriptor = {
	name = "BackgroundHeaderEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.BackgroundHeaderEntry"
}
t.BackgroundHeaderEntry = t_4
typeRegistryModule.default:register(t.BackgroundHeaderEntry)
local t_5 = {}
t_5.__index = t_5

function t_5.new(p8) --[[ line: 4293 ]]
	-- upvalues: t_5 (ref)
	return setmetatable({
		kind = if p8 == nil or p8.kind == nil then nil else p8.kind
	}, t_5)
end

function t_5:encode() --[[ line: 4299 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var250 = 0
	
	if self.kind ~= nil then
		if self.kind.type == "badges_grid" then
			local var251 = self.kind.value:encode()
			local var252, var253 = protoModule.writeTag(buff, var250, 1, protoModule.wireTypes.lengthDelimited)
			var252, var253 = protoModule.writeBuffer(var252, var253, var251, buffer.len(var251))
			buff = var252
			var250 = var253
		elseif self.kind.type == "badge_details" then
			local var254 = self.kind.value:encode()
			local var255, var256 = protoModule.writeTag(buff, var250, 2, protoModule.wireTypes.lengthDelimited)
			var255, var256 = protoModule.writeBuffer(var255, var256, var254, buffer.len(var254))
			buff = var255
			var250 = var256
		elseif self.kind.type == "static_content" then
			local var257 = self.kind.value:encode()
			local var258, var259 = protoModule.writeTag(buff, var250, 3, protoModule.wireTypes.lengthDelimited)
			var258, var259 = protoModule.writeBuffer(var258, var259, var257, buffer.len(var257))
			buff = var258
			var250 = var259
		elseif self.kind.type == "experience_attribution_row" then
			local var260 = self.kind.value:encode()
			local var261, var262 = protoModule.writeTag(buff, var250, 4, protoModule.wireTypes.lengthDelimited)
			var261, var262 = protoModule.writeBuffer(var261, var262, var260, buffer.len(var260))
			buff = var261
			var250 = var262
		elseif self.kind.type == "experience_action_module" then
			local var263 = self.kind.value:encode()
			local var264, var265 = protoModule.writeTag(buff, var250, 5, protoModule.wireTypes.lengthDelimited)
			var264, var265 = protoModule.writeBuffer(var264, var265, var263, buffer.len(var263))
			buff = var264
			var250 = var265
		elseif self.kind.type == "experience_media_gallery" then
			local var266 = self.kind.value:encode()
			local var267, var268 = protoModule.writeTag(buff, var250, 6, protoModule.wireTypes.lengthDelimited)
			var267, var268 = protoModule.writeBuffer(var267, var268, var266, buffer.len(var266))
			buff = var267
			var250 = var268
		elseif self.kind.type == "experience_description" then
			local var269 = self.kind.value:encode()
			local var270, var271 = protoModule.writeTag(buff, var250, 7, protoModule.wireTypes.lengthDelimited)
			var270, var271 = protoModule.writeBuffer(var270, var271, var269, buffer.len(var269))
			buff = var270
			var250 = var271
		elseif self.kind.type == "experience_stat_row" then
			local var272 = self.kind.value:encode()
			local var273, var274 = protoModule.writeTag(buff, var250, 8, protoModule.wireTypes.lengthDelimited)
			var273, var274 = protoModule.writeBuffer(var273, var274, var272, buffer.len(var272))
			buff = var273
			var250 = var274
		elseif self.kind.type == "experience_info_table" then
			local var275 = self.kind.value:encode()
			local var276, var277 = protoModule.writeTag(buff, var250, 9, protoModule.wireTypes.lengthDelimited)
			var276, var277 = protoModule.writeBuffer(var276, var277, var275, buffer.len(var275))
			buff = var276
			var250 = var277
		elseif self.kind.type == "social_link_row" then
			local var278 = self.kind.value:encode()
			local var279, var280 = protoModule.writeTag(buff, var250, 10, protoModule.wireTypes.lengthDelimited)
			var279, var280 = protoModule.writeBuffer(var279, var280, var278, buffer.len(var278))
			buff = var279
			var250 = var280
		elseif self.kind.type == "experience_carousel" then
			local var281 = self.kind.value:encode()
			local var282, var283 = protoModule.writeTag(buff, var250, 11, protoModule.wireTypes.lengthDelimited)
			var282, var283 = protoModule.writeBuffer(var282, var283, var281, buffer.len(var281))
			buff = var282
			var250 = var283
		elseif self.kind.type == "song_carousel" then
			local var284 = self.kind.value:encode()
			local var285, var286 = protoModule.writeTag(buff, var250, 12, protoModule.wireTypes.lengthDelimited)
			var285, var286 = protoModule.writeBuffer(var285, var286, var284, buffer.len(var284))
			buff = var285
			var250 = var286
		elseif self.kind.type == "events_carousel" then
			local var287 = self.kind.value:encode()
			local var288, var289 = protoModule.writeTag(buff, var250, 13, protoModule.wireTypes.lengthDelimited)
			var288, var289 = protoModule.writeBuffer(var288, var289, var287, buffer.len(var287))
			buff = var288
			var250 = var289
		elseif self.kind.type == "game_pass_collection" then
			local var290 = self.kind.value:encode()
			local var291, var292 = protoModule.writeTag(buff, var250, 14, protoModule.wireTypes.lengthDelimited)
			var291, var292 = protoModule.writeBuffer(var291, var292, var290, buffer.len(var290))
			buff = var291
			var250 = var292
		elseif self.kind.type == "developer_product_collection" then
			local var293 = self.kind.value:encode()
			local var294, var295 = protoModule.writeTag(buff, var250, 15, protoModule.wireTypes.lengthDelimited)
			var294, var295 = protoModule.writeBuffer(var294, var295, var293, buffer.len(var293))
			buff = var294
			var250 = var295
		elseif self.kind.type == "subscription_collection" then
			local var296 = self.kind.value:encode()
			local var297, var298 = protoModule.writeTag(buff, var250, 16, protoModule.wireTypes.lengthDelimited)
			var297, var298 = protoModule.writeBuffer(var297, var298, var296, buffer.len(var296))
			buff = var297
			var250 = var298
		elseif self.kind.type == "dynamic_store_category" then
			local var299 = self.kind.value:encode()
			local var300, var301 = protoModule.writeTag(buff, var250, 17, protoModule.wireTypes.lengthDelimited)
			var300, var301 = protoModule.writeBuffer(var300, var301, var299, buffer.len(var299))
			buff = var300
			var250 = var301
		elseif self.kind.type == "card_container" then
			local var302 = self.kind.value:encode()
			local var303, var304 = protoModule.writeTag(buff, var250, 20, protoModule.wireTypes.lengthDelimited)
			var303, var304 = protoModule.writeBuffer(var303, var304, var302, buffer.len(var302))
			buff = var303
			var250 = var304
		elseif self.kind.type == "card" then
			local var305 = self.kind.value:encode()
			local var306, var307 = protoModule.writeTag(buff, var250, 21, protoModule.wireTypes.lengthDelimited)
			var306, var307 = protoModule.writeBuffer(var306, var307, var305, buffer.len(var305))
			buff = var306
			var250 = var307
		elseif self.kind.type == "dialog" then
			local var308 = self.kind.value:encode()
			local var309, var310 = protoModule.writeTag(buff, var250, 22, protoModule.wireTypes.lengthDelimited)
			var309, var310 = protoModule.writeBuffer(var309, var310, var308, buffer.len(var308))
			buff = var309
			var250 = var310
		elseif self.kind.type == "banner" then
			local var311 = self.kind.value:encode()
			local var312, var313 = protoModule.writeTag(buff, var250, 23, protoModule.wireTypes.lengthDelimited)
			var312, var313 = protoModule.writeBuffer(var312, var313, var311, buffer.len(var311))
			buff = var312
			var250 = var313
		elseif self.kind.type == "tooltip" then
			local var314 = self.kind.value:encode()
			local var315, var316 = protoModule.writeTag(buff, var250, 24, protoModule.wireTypes.lengthDelimited)
			var315, var316 = protoModule.writeBuffer(var315, var316, var314, buffer.len(var314))
			buff = var315
			var250 = var316
		elseif self.kind.type == "coachmark" then
			local var317 = self.kind.value:encode()
			local var318, var319 = protoModule.writeTag(buff, var250, 25, protoModule.wireTypes.lengthDelimited)
			var318, var319 = protoModule.writeBuffer(var318, var319, var317, buffer.len(var317))
			buff = var318
			var250 = var319
		elseif self.kind.type == "system_banner_prompt" then
			local var320 = self.kind.value:encode()
			local var321, var322 = protoModule.writeTag(buff, var250, 28, protoModule.wireTypes.lengthDelimited)
			var321, var322 = protoModule.writeBuffer(var321, var322, var320, buffer.len(var320))
			buff = var321
			var250 = var322
		elseif self.kind.type == "age_check_upsell" then
			local var323 = self.kind.value:encode()
			local var324, var325 = protoModule.writeTag(buff, var250, 29, protoModule.wireTypes.lengthDelimited)
			var324, var325 = protoModule.writeBuffer(var324, var325, var323, buffer.len(var323))
			buff = var324
			var250 = var325
		elseif self.kind.type == "catalog_item_list" then
			local var326 = self.kind.value:encode()
			local var327, var328 = protoModule.writeTag(buff, var250, 26, protoModule.wireTypes.lengthDelimited)
			var327, var328 = protoModule.writeBuffer(var327, var328, var326, buffer.len(var326))
			buff = var327
			var250 = var328
		elseif self.kind.type == "user_list" then
			local var329 = self.kind.value:encode()
			local var330, var331 = protoModule.writeTag(buff, var250, 27, protoModule.wireTypes.lengthDelimited)
			var330, var331 = protoModule.writeBuffer(var330, var331, var329, buffer.len(var329))
			buff = var330
			var250 = var331
		elseif self.kind.type == "experience_content_rating_label" then
			local var332 = self.kind.value:encode()
			local var333, var334 = protoModule.writeTag(buff, var250, 30, protoModule.wireTypes.lengthDelimited)
			var333, var334 = protoModule.writeBuffer(var333, var334, var332, buffer.len(var332))
			buff = var333
			var250 = var334
		elseif self.kind.type == "experience_refund_policy" then
			local var335 = self.kind.value:encode()
			local var336, var337 = protoModule.writeTag(buff, var250, 31, protoModule.wireTypes.lengthDelimited)
			var336, var337 = protoModule.writeBuffer(var336, var337, var335, buffer.len(var335))
			buff = var336
			var250 = var337
		elseif self.kind.type == "experience_play_with_reward" then
			local var338 = self.kind.value:encode()
			local var339, var340 = protoModule.writeTag(buff, var250, 32, protoModule.wireTypes.lengthDelimited)
			var339, var340 = protoModule.writeBuffer(var339, var340, var338, buffer.len(var338))
			buff = var339
			var250 = var340
		elseif self.kind.type == "experience_guidelines_dialog" then
			local var341 = self.kind.value:encode()
			local var342, var343 = protoModule.writeTag(buff, var250, 33, protoModule.wireTypes.lengthDelimited)
			var342, var343 = protoModule.writeBuffer(var342, var343, var341, buffer.len(var341))
			buff = var342
			var250 = var343
		elseif self.kind.type == "community_section" then
			local var344 = self.kind.value:encode()
			local var345, var346 = protoModule.writeTag(buff, var250, 35, protoModule.wireTypes.lengthDelimited)
			var345, var346 = protoModule.writeBuffer(var345, var346, var344, buffer.len(var344))
			buff = var345
			var250 = var346
		elseif self.kind.type == "moments_carousel" then
			local var347 = self.kind.value:encode()
			local var348, var349 = protoModule.writeTag(buff, var250, 34, protoModule.wireTypes.lengthDelimited)
			var348, var349 = protoModule.writeBuffer(var348, var349, var347, buffer.len(var347))
			buff = var348
			var250 = var349
		elseif self.kind.type == "text" then
			local var350 = self.kind.value:encode()
			local var351, var352 = protoModule.writeTag(buff, var250, 40, protoModule.wireTypes.lengthDelimited)
			var351, var352 = protoModule.writeBuffer(var351, var352, var350, buffer.len(var350))
			buff = var351
			var250 = var352
		elseif self.kind.type == "vertical_feed" then
			local var353 = self.kind.value:encode()
			local var354, var355 = protoModule.writeTag(buff, var250, 41, protoModule.wireTypes.lengthDelimited)
			var354, var355 = protoModule.writeBuffer(var354, var355, var353, buffer.len(var353))
			buff = var354
			var250 = var355
		elseif self.kind.type == "page_header" then
			local var356 = self.kind.value:encode()
			local var357, var358 = protoModule.writeTag(buff, var250, 42, protoModule.wireTypes.lengthDelimited)
			var357, var358 = protoModule.writeBuffer(var357, var358, var356, buffer.len(var356))
			buff = var357
			var250 = var358
		elseif self.kind.type == "experience_details_feed" then
			local var359 = self.kind.value:encode()
			local var360, var361 = protoModule.writeTag(buff, var250, 500, protoModule.wireTypes.lengthDelimited)
			var360, var361 = protoModule.writeBuffer(var360, var361, var359, buffer.len(var359))
			buff = var360
			var250 = var361
		elseif self.kind.type == "experience_details_action_bar" then
			local var362 = self.kind.value:encode()
			local var363, var364 = protoModule.writeTag(buff, var250, 501, protoModule.wireTypes.lengthDelimited)
			var363, var364 = protoModule.writeBuffer(var363, var364, var362, buffer.len(var362))
			buff = var363
			var250 = var364
		elseif self.kind.type == "experience_details_banner_image" then
			local var365 = self.kind.value:encode()
			local var366, var367 = protoModule.writeTag(buff, var250, 502, protoModule.wireTypes.lengthDelimited)
			var366, var367 = protoModule.writeBuffer(var366, var367, var365, buffer.len(var365))
			buff = var366
			var250 = var367
		elseif self.kind.type == "experience_details_sticky_header" then
			local var368 = self.kind.value:encode()
			local var369, var370 = protoModule.writeTag(buff, var250, 503, protoModule.wireTypes.lengthDelimited)
			var369, var370 = protoModule.writeBuffer(var369, var370, var368, buffer.len(var368))
			buff = var369
			var250 = var370
		elseif self.kind.type == "event_details_feed" then
			local var371 = self.kind.value:encode()
			local var372, var373 = protoModule.writeTag(buff, var250, 600, protoModule.wireTypes.lengthDelimited)
			var372, var373 = protoModule.writeBuffer(var372, var373, var371, buffer.len(var371))
			buff = var372
			var250 = var373
		elseif self.kind.type == "event_details_action_bar" then
			local var374 = self.kind.value:encode()
			local var375, var376 = protoModule.writeTag(buff, var250, 601, protoModule.wireTypes.lengthDelimited)
			var375, var376 = protoModule.writeBuffer(var375, var376, var374, buffer.len(var374))
			buff = var375
			var250 = var376
		elseif self.kind.type == "event_attribution_row" then
			local var377 = self.kind.value:encode()
			local var378, var379 = protoModule.writeTag(buff, var250, 602, protoModule.wireTypes.lengthDelimited)
			var378, var379 = protoModule.writeBuffer(var378, var379, var377, buffer.len(var377))
			buff = var378
			var250 = var379
		elseif self.kind.type == "event_description" then
			local var380 = self.kind.value:encode()
			local var381, var382 = protoModule.writeTag(buff, var250, 603, protoModule.wireTypes.lengthDelimited)
			var381, var382 = protoModule.writeBuffer(var381, var382, var380, buffer.len(var380))
			buff = var381
			var250 = var382
		elseif self.kind.type == "event_info_table" then
			local var383 = self.kind.value:encode()
			local var384, var385 = protoModule.writeTag(buff, var250, 604, protoModule.wireTypes.lengthDelimited)
			var384, var385 = protoModule.writeBuffer(var384, var385, var383, buffer.len(var383))
			buff = var384
			var250 = var385
		elseif self.kind.type == "event_details_sheet_full_bleed" then
			local var386 = self.kind.value:encode()
			local var387, var388 = protoModule.writeTag(buff, var250, 605, protoModule.wireTypes.lengthDelimited)
			var387, var388 = protoModule.writeBuffer(var387, var388, var386, buffer.len(var386))
			buff = var387
			var250 = var388
		elseif self.kind.type == "event_notifications_modal" then
			local var389 = self.kind.value:encode()
			local var390, var391 = protoModule.writeTag(buff, var250, 606, protoModule.wireTypes.lengthDelimited)
			var390, var391 = protoModule.writeBuffer(var390, var391, var389, buffer.len(var389))
			buff = var390
			var250 = var391
		elseif self.kind.type == "dev_store_feed" then
			local var392 = self.kind.value:encode()
			local var393, var394 = protoModule.writeTag(buff, var250, 700, protoModule.wireTypes.lengthDelimited)
			var393, var394 = protoModule.writeBuffer(var393, var394, var392, buffer.len(var392))
			buff = var393
			var250 = var394
		elseif self.kind.type == "charts_feed" then
			local var395 = self.kind.value:encode()
			local var396, var397 = protoModule.writeTag(buff, var250, 800, protoModule.wireTypes.lengthDelimited)
			var396, var397 = protoModule.writeBuffer(var396, var397, var395, buffer.len(var395))
			buff = var396
			var250 = var397
		elseif self.kind.type == "filter_pills" then
			local var398 = self.kind.value:encode()
			local var399, var400 = protoModule.writeTag(buff, var250, 801, protoModule.wireTypes.lengthDelimited)
			var399, var400 = protoModule.writeBuffer(var399, var400, var398, buffer.len(var398))
			buff = var399
			var250 = var400
		elseif self.kind.type == "sort_selector" then
			local var401 = self.kind.value:encode()
			local var402, var403 = protoModule.writeTag(buff, var250, 802, protoModule.wireTypes.lengthDelimited)
			var402, var403 = protoModule.writeBuffer(var402, var403, var401, buffer.len(var401))
			buff = var402
			var250 = var403
		elseif self.kind.type == "genre_selector" then
			local var404 = self.kind.value:encode()
			local var405, var406 = protoModule.writeTag(buff, var250, 803, protoModule.wireTypes.lengthDelimited)
			var405, var406 = protoModule.writeBuffer(var405, var406, var404, buffer.len(var404))
			buff = var405
			var250 = var406
		elseif self.kind.type == "marketplace_catalog_feed" then
			local var407 = self.kind.value:encode()
			local var408, var409 = protoModule.writeTag(buff, var250, 900, protoModule.wireTypes.lengthDelimited)
			var408, var409 = protoModule.writeBuffer(var408, var409, var407, buffer.len(var407))
			buff = var408
			var250 = var409
		elseif self.kind.type == "marketplace_catalog_category_menu" then
			local var410 = self.kind.value:encode()
			local var411, var412 = protoModule.writeTag(buff, var250, 901, protoModule.wireTypes.lengthDelimited)
			var411, var412 = protoModule.writeBuffer(var411, var412, var410, buffer.len(var410))
			buff = var411
			var250 = var412
		elseif self.kind.type == "marketplace_catalog_item_group" then
			local var413 = self.kind.value:encode()
			local var414, var415 = protoModule.writeTag(buff, var250, 902, protoModule.wireTypes.lengthDelimited)
			var414, var415 = protoModule.writeBuffer(var414, var415, var413, buffer.len(var413))
			buff = var414
			var250 = var415
		elseif self.kind.type == "marketplace_catalog_item_carousel" then
			local var416 = self.kind.value:encode()
			local var417, var418 = protoModule.writeTag(buff, var250, 903, protoModule.wireTypes.lengthDelimited)
			var417, var418 = protoModule.writeBuffer(var417, var418, var416, buffer.len(var416))
			buff = var417
			var250 = var418
		elseif self.kind.type == "marketplace_catalog_hero_unit" then
			local var419 = self.kind.value:encode()
			local var420, var421 = protoModule.writeTag(buff, var250, 904, protoModule.wireTypes.lengthDelimited)
			var420, var421 = protoModule.writeBuffer(var420, var421, var419, buffer.len(var419))
			buff = var420
			var250 = var421
		elseif self.kind.type == "catalog_item_grid" then
			local var422 = self.kind.value:encode()
			local var423, var424 = protoModule.writeTag(buff, var250, 905, protoModule.wireTypes.lengthDelimited)
			var423, var424 = protoModule.writeBuffer(var423, var424, var422, buffer.len(var422))
			buff = var423
			var250 = var424
		elseif self.kind.type == "marketplace_offer_modal" then
			local var425 = self.kind.value:encode()
			local var426, var427 = protoModule.writeTag(buff, var250, 906, protoModule.wireTypes.lengthDelimited)
			var426, var427 = protoModule.writeBuffer(var426, var427, var425, buffer.len(var425))
			buff = var426
			var250 = var427
		elseif self.kind.type == "search_results_feed" then
			local var428 = self.kind.value:encode()
			local var429, var430 = protoModule.writeTag(buff, var250, 1000, protoModule.wireTypes.lengthDelimited)
			var429, var430 = protoModule.writeBuffer(var429, var430, var428, buffer.len(var428))
			buff = var429
			var250 = var430
		elseif self.kind.type == "power_search_ai_overview" then
			local var431 = self.kind.value:encode()
			local var432, var433 = protoModule.writeTag(buff, var250, 1001, protoModule.wireTypes.lengthDelimited)
			var432, var433 = protoModule.writeBuffer(var432, var433, var431, buffer.len(var431))
			buff = var432
			var250 = var433
		elseif self.kind.type == "experience_emphasis_tile" then
			local var434 = self.kind.value:encode()
			local var435, var436 = protoModule.writeTag(buff, var250, 1002, protoModule.wireTypes.lengthDelimited)
			var435, var436 = protoModule.writeBuffer(var435, var436, var434, buffer.len(var434))
			buff = var435
			var250 = var436
		elseif self.kind.type == "option_selector_carousel" then
			local var437 = self.kind.value:encode()
			local var438, var439 = protoModule.writeTag(buff, var250, 1100, protoModule.wireTypes.lengthDelimited)
			var438, var439 = protoModule.writeBuffer(var438, var439, var437, buffer.len(var437))
			buff = var438
			var250 = var439
		elseif self.kind.type == "party_chat_conversation_upsell" then
			local var440 = self.kind.value:encode()
			local var441, var442 = protoModule.writeTag(buff, var250, 1200, protoModule.wireTypes.lengthDelimited)
			var441, var442 = protoModule.writeBuffer(var441, var442, var440, buffer.len(var440))
			buff = var441
			var250 = var442
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			local var443 = self.kind.value:encode()
			local var444, var445 = protoModule.writeTag(buff, var250, 1300, protoModule.wireTypes.lengthDelimited)
			var444, var445 = protoModule.writeBuffer(var444, var445, var443, buffer.len(var443))
			buff = var444
			var250 = var445
		end
	end
	local buff_1 = buffer.create(var250)
	buffer.copy(buff_1, 0, buff, 0, var250)
	
	return buff_1
end

function t_5.decode(p9) --[[ line: 4572 ]]
	-- upvalues: t_5 (ref), protoModule (ref), t (ref)
	local var447 = t_5.new()
	local var448 = 0
	while var448 < buffer.len(p9) do
		local _ = nil
		local var449 = nil
		local var450, var451, var452 = protoModule.readTag(p9, var448)
		local var453 = var450
		var449 = var451
		var448 = var452
		
		if var449 == protoModule.wireTypes.varint then
			local _ = nil
			local var454, var455 = protoModule.readVarInt(p9, var448)
			local _ = var454
			var448 = var455
			continue
		end
		if var449 == protoModule.wireTypes.lengthDelimited then
			if var453 == 1 then
				local _ = nil
				local var456, var457 = protoModule.readBuffer(p9, var448)
				var448 = var457
				var447.kind = {
					type = "badges_grid",
					value = t.BadgesGridInputData.decode(var456)
				}
			elseif var453 == 2 then
				local _ = nil
				local var458, var459 = protoModule.readBuffer(p9, var448)
				var448 = var459
				var447.kind = {
					type = "badge_details",
					value = t.BadgeDetailsInputData.decode(var458)
				}
			elseif var453 == 3 then
				local _ = nil
				local var460, var461 = protoModule.readBuffer(p9, var448)
				var448 = var461
				var447.kind = {
					type = "static_content",
					value = t.StaticInputData.decode(var460)
				}
			elseif var453 == 4 then
				local _ = nil
				local var462, var463 = protoModule.readBuffer(p9, var448)
				var448 = var463
				var447.kind = {
					type = "experience_attribution_row",
					value = t.ExperienceAttributionRowInputData.decode(var462)
				}
			elseif var453 == 5 then
				local _ = nil
				local var464, var465 = protoModule.readBuffer(p9, var448)
				var448 = var465
				var447.kind = {
					type = "experience_action_module",
					value = t.ExperienceActionModuleInputData.decode(var464)
				}
			elseif var453 == 6 then
				local _ = nil
				local var466, var467 = protoModule.readBuffer(p9, var448)
				var448 = var467
				var447.kind = {
					type = "experience_media_gallery",
					value = t.ExperienceMediaGalleryInputData.decode(var466)
				}
			elseif var453 == 7 then
				local _ = nil
				local var468, var469 = protoModule.readBuffer(p9, var448)
				var448 = var469
				var447.kind = {
					type = "experience_description",
					value = t.ExperienceDescriptionInputData.decode(var468)
				}
			elseif var453 == 8 then
				local _ = nil
				local var470, var471 = protoModule.readBuffer(p9, var448)
				var448 = var471
				var447.kind = {
					type = "experience_stat_row",
					value = t.ExperienceStatRowInputData.decode(var470)
				}
			elseif var453 == 9 then
				local _ = nil
				local var472, var473 = protoModule.readBuffer(p9, var448)
				var448 = var473
				var447.kind = {
					type = "experience_info_table",
					value = t.ExperienceInfoTableInputData.decode(var472)
				}
			elseif var453 == 10 then
				local _ = nil
				local var474, var475 = protoModule.readBuffer(p9, var448)
				var448 = var475
				var447.kind = {
					type = "social_link_row",
					value = t.SocialLinkRowInputData.decode(var474)
				}
			elseif var453 == 11 then
				local _ = nil
				local var476, var477 = protoModule.readBuffer(p9, var448)
				var448 = var477
				var447.kind = {
					type = "experience_carousel",
					value = t.ExperienceCarouselInputData.decode(var476)
				}
			elseif var453 == 12 then
				local _ = nil
				local var478, var479 = protoModule.readBuffer(p9, var448)
				var448 = var479
				var447.kind = {
					type = "song_carousel",
					value = t.SongCarouselInputData.decode(var478)
				}
			elseif var453 == 13 then
				local _ = nil
				local var480, var481 = protoModule.readBuffer(p9, var448)
				var448 = var481
				var447.kind = {
					type = "events_carousel",
					value = t.EventsCarouselInputData.decode(var480)
				}
			elseif var453 == 14 then
				local _ = nil
				local var482, var483 = protoModule.readBuffer(p9, var448)
				var448 = var483
				var447.kind = {
					type = "game_pass_collection",
					value = t.GamePassCollectionInputData.decode(var482)
				}
			elseif var453 == 15 then
				local _ = nil
				local var484, var485 = protoModule.readBuffer(p9, var448)
				var448 = var485
				var447.kind = {
					type = "developer_product_collection",
					value = t.DeveloperProductCollectionInputData.decode(var484)
				}
			elseif var453 == 16 then
				local _ = nil
				local var486, var487 = protoModule.readBuffer(p9, var448)
				var448 = var487
				var447.kind = {
					type = "subscription_collection",
					value = t.SubscriptionCollectionInputData.decode(var486)
				}
			elseif var453 == 17 then
				local _ = nil
				local var488, var489 = protoModule.readBuffer(p9, var448)
				var448 = var489
				var447.kind = {
					type = "dynamic_store_category",
					value = t.DynamicStoreCategoryInputData.decode(var488)
				}
			elseif var453 == 20 then
				local _ = nil
				local var490, var491 = protoModule.readBuffer(p9, var448)
				var448 = var491
				var447.kind = {
					type = "card_container",
					value = t.CardContainerInputData.decode(var490)
				}
			elseif var453 == 21 then
				local _ = nil
				local var492, var493 = protoModule.readBuffer(p9, var448)
				var448 = var493
				var447.kind = { type = "card", value = t.CardInputData.decode(var492) }
			elseif var453 == 22 then
				local _ = nil
				local var494, var495 = protoModule.readBuffer(p9, var448)
				var448 = var495
				var447.kind = {
					type = "dialog",
					value = t.DialogInputData.decode(var494)
				}
			elseif var453 == 23 then
				local _ = nil
				local var496, var497 = protoModule.readBuffer(p9, var448)
				var448 = var497
				var447.kind = {
					type = "banner",
					value = t.BannerInputData.decode(var496)
				}
			elseif var453 == 24 then
				local _ = nil
				local var498, var499 = protoModule.readBuffer(p9, var448)
				var448 = var499
				var447.kind = {
					type = "tooltip",
					value = t.TooltipInputData.decode(var498)
				}
			elseif var453 == 25 then
				local _ = nil
				local var500, var501 = protoModule.readBuffer(p9, var448)
				var448 = var501
				var447.kind = {
					type = "coachmark",
					value = t.CoachmarkInputData.decode(var500)
				}
			elseif var453 == 26 then
				local _ = nil
				local var502, var503 = protoModule.readBuffer(p9, var448)
				var448 = var503
				var447.kind = {
					type = "catalog_item_list",
					value = t.CatalogItemListInputData.decode(var502)
				}
			elseif var453 == 27 then
				local _ = nil
				local var504, var505 = protoModule.readBuffer(p9, var448)
				var448 = var505
				var447.kind = {
					type = "user_list",
					value = t.UserListInputData.decode(var504)
				}
			elseif var453 == 28 then
				local _ = nil
				local var506, var507 = protoModule.readBuffer(p9, var448)
				var448 = var507
				var447.kind = {
					type = "system_banner_prompt",
					value = t.SystemBannerInputData.decode(var506)
				}
			elseif var453 == 29 then
				local _ = nil
				local var508, var509 = protoModule.readBuffer(p9, var448)
				var448 = var509
				var447.kind = {
					type = "age_check_upsell",
					value = t.AgeCheckUpsellInputData.decode(var508)
				}
			elseif var453 == 30 then
				local _ = nil
				local var510, var511 = protoModule.readBuffer(p9, var448)
				var448 = var511
				var447.kind = {
					type = "experience_content_rating_label",
					value = t.ExperienceContentRatingLabelInputData.decode(var510)
				}
			elseif var453 == 31 then
				local _ = nil
				local var512, var513 = protoModule.readBuffer(p9, var448)
				var448 = var513
				var447.kind = {
					type = "experience_refund_policy",
					value = t.ExperienceRefundPolicyInputData.decode(var512)
				}
			elseif var453 == 32 then
				local _ = nil
				local var514, var515 = protoModule.readBuffer(p9, var448)
				var448 = var515
				var447.kind = {
					type = "experience_play_with_reward",
					value = t.ExperiencePlayWithRewardInputData.decode(var514)
				}
			elseif var453 == 33 then
				local _ = nil
				local var516, var517 = protoModule.readBuffer(p9, var448)
				var448 = var517
				var447.kind = {
					type = "experience_guidelines_dialog",
					value = t.ExperienceGuidelinesDialogInputData.decode(var516)
				}
			elseif var453 == 34 then
				local _ = nil
				local var518, var519 = protoModule.readBuffer(p9, var448)
				var448 = var519
				var447.kind = {
					type = "moments_carousel",
					value = t.MomentsCarouselInputData.decode(var518)
				}
			elseif var453 == 35 then
				local _ = nil
				local var520, var521 = protoModule.readBuffer(p9, var448)
				var448 = var521
				var447.kind = {
					type = "community_section",
					value = t.CommunitySectionInputData.decode(var520)
				}
			elseif var453 == 40 then
				local _ = nil
				local var522, var523 = protoModule.readBuffer(p9, var448)
				var448 = var523
				var447.kind = { type = "text", value = t.TextInputData.decode(var522) }
			elseif var453 == 41 then
				local _ = nil
				local var524, var525 = protoModule.readBuffer(p9, var448)
				var448 = var525
				var447.kind = {
					type = "vertical_feed",
					value = t.VerticalFeedInputData.decode(var524)
				}
			elseif var453 == 42 then
				local _ = nil
				local var526, var527 = protoModule.readBuffer(p9, var448)
				var448 = var527
				var447.kind = {
					type = "page_header",
					value = t.PageHeaderInputData.decode(var526)
				}
			elseif var453 == 500 then
				local _ = nil
				local var528, var529 = protoModule.readBuffer(p9, var448)
				var448 = var529
				var447.kind = {
					type = "experience_details_feed",
					value = t.ExperienceDetailsFeedInputData.decode(var528)
				}
			elseif var453 == 501 then
				local _ = nil
				local var530, var531 = protoModule.readBuffer(p9, var448)
				var448 = var531
				var447.kind = {
					type = "experience_details_action_bar",
					value = t.ExperienceDetailsActionBarInputData.decode(var530)
				}
			elseif var453 == 502 then
				local _ = nil
				local var532, var533 = protoModule.readBuffer(p9, var448)
				var448 = var533
				var447.kind = {
					type = "experience_details_banner_image",
					value = t.ExperienceDetailsBannerImageInputData.decode(var532)
				}
			elseif var453 == 503 then
				local _ = nil
				local var534, var535 = protoModule.readBuffer(p9, var448)
				var448 = var535
				var447.kind = {
					type = "experience_details_sticky_header",
					value = t.ExperienceDetailsStickyHeaderInputData.decode(var534)
				}
			elseif var453 == 600 then
				local _ = nil
				local var536, var537 = protoModule.readBuffer(p9, var448)
				var448 = var537
				var447.kind = {
					type = "event_details_feed",
					value = t.EventDetailsFeedInputData.decode(var536)
				}
			elseif var453 == 601 then
				local _ = nil
				local var538, var539 = protoModule.readBuffer(p9, var448)
				var448 = var539
				var447.kind = {
					type = "event_details_action_bar",
					value = t.EventDetailsActionBarInputData.decode(var538)
				}
			elseif var453 == 602 then
				local _ = nil
				local var540, var541 = protoModule.readBuffer(p9, var448)
				var448 = var541
				var447.kind = {
					type = "event_attribution_row",
					value = t.EventAttributionRowInputData.decode(var540)
				}
			elseif var453 == 603 then
				local _ = nil
				local var542, var543 = protoModule.readBuffer(p9, var448)
				var448 = var543
				var447.kind = {
					type = "event_description",
					value = t.EventDescriptionInputData.decode(var542)
				}
			elseif var453 == 604 then
				local _ = nil
				local var544, var545 = protoModule.readBuffer(p9, var448)
				var448 = var545
				var447.kind = {
					type = "event_info_table",
					value = t.EventInfoTableInputData.decode(var544)
				}
			elseif var453 == 605 then
				local _ = nil
				local var546, var547 = protoModule.readBuffer(p9, var448)
				var448 = var547
				var447.kind = {
					type = "event_details_sheet_full_bleed",
					value = t.EventDetailsSheetFullBleedInputData.decode(var546)
				}
			elseif var453 == 606 then
				local _ = nil
				local var548, var549 = protoModule.readBuffer(p9, var448)
				var448 = var549
				var447.kind = {
					type = "event_notifications_modal",
					value = t.EventNotificationsModalInputData.decode(var548)
				}
			elseif var453 == 700 then
				local _ = nil
				local var550, var551 = protoModule.readBuffer(p9, var448)
				var448 = var551
				var447.kind = {
					type = "dev_store_feed",
					value = t.DevStoreFeedInputData.decode(var550)
				}
			elseif var453 == 800 then
				local _ = nil
				local var552, var553 = protoModule.readBuffer(p9, var448)
				var448 = var553
				var447.kind = {
					type = "charts_feed",
					value = t.ChartsFeedInputData.decode(var552)
				}
			elseif var453 == 801 then
				local _ = nil
				local var554, var555 = protoModule.readBuffer(p9, var448)
				var448 = var555
				var447.kind = {
					type = "filter_pills",
					value = t.FilterPillsInputData.decode(var554)
				}
			elseif var453 == 802 then
				local _ = nil
				local var556, var557 = protoModule.readBuffer(p9, var448)
				var448 = var557
				var447.kind = {
					type = "sort_selector",
					value = t.SortSelectorInputData.decode(var556)
				}
			elseif var453 == 803 then
				local _ = nil
				local var558, var559 = protoModule.readBuffer(p9, var448)
				var448 = var559
				var447.kind = {
					type = "genre_selector",
					value = t.ChartsGenreSelectorInputData.decode(var558)
				}
			elseif var453 == 900 then
				local _ = nil
				local var560, var561 = protoModule.readBuffer(p9, var448)
				var448 = var561
				var447.kind = {
					type = "marketplace_catalog_feed",
					value = t.UAMarketplaceCatalogFeedInputData.decode(var560)
				}
			elseif var453 == 901 then
				local _ = nil
				local var562, var563 = protoModule.readBuffer(p9, var448)
				var448 = var563
				var447.kind = {
					type = "marketplace_catalog_category_menu",
					value = t.UAMarketplaceCatalogCategoryMenuInputData.decode(var562)
				}
			elseif var453 == 902 then
				local _ = nil
				local var564, var565 = protoModule.readBuffer(p9, var448)
				var448 = var565
				var447.kind = {
					type = "marketplace_catalog_item_group",
					value = t.UAMarketplaceCatalogItemGroupInputData.decode(var564)
				}
			elseif var453 == 903 then
				local _ = nil
				local var566, var567 = protoModule.readBuffer(p9, var448)
				var448 = var567
				var447.kind = {
					type = "marketplace_catalog_item_carousel",
					value = t.UAMarketplaceCatalogItemCarouselInputData.decode(var566)
				}
			elseif var453 == 904 then
				local _ = nil
				local var568, var569 = protoModule.readBuffer(p9, var448)
				var448 = var569
				var447.kind = {
					type = "marketplace_catalog_hero_unit",
					value = t.UAMarketplaceCatalogHeroUnitInputData.decode(var568)
				}
			elseif var453 == 905 then
				local _ = nil
				local var570, var571 = protoModule.readBuffer(p9, var448)
				var448 = var571
				var447.kind = {
					type = "catalog_item_grid",
					value = t.CatalogItemGridInputData.decode(var570)
				}
			elseif var453 == 906 then
				local _ = nil
				local var572, var573 = protoModule.readBuffer(p9, var448)
				var448 = var573
				var447.kind = {
					type = "marketplace_offer_modal",
					value = t.MarketplaceOfferModalInputData.decode(var572)
				}
			elseif var453 == 1000 then
				local _ = nil
				local var574, var575 = protoModule.readBuffer(p9, var448)
				var448 = var575
				var447.kind = {
					type = "search_results_feed",
					value = t.SearchResultsFeedInputData.decode(var574)
				}
			elseif var453 == 1001 then
				local _ = nil
				local var576, var577 = protoModule.readBuffer(p9, var448)
				var448 = var577
				var447.kind = {
					type = "power_search_ai_overview",
					value = t.PowerSearchAIOverviewInputData.decode(var576)
				}
			elseif var453 == 1002 then
				local _ = nil
				local var578, var579 = protoModule.readBuffer(p9, var448)
				var448 = var579
				var447.kind = {
					type = "experience_emphasis_tile",
					value = t.ExperienceEmphasisTileInputData.decode(var578)
				}
			elseif var453 == 1100 then
				local _ = nil
				local var580, var581 = protoModule.readBuffer(p9, var448)
				var448 = var581
				var447.kind = {
					type = "option_selector_carousel",
					value = t.OptionSelectorCarouselInputData.decode(var580)
				}
			elseif var453 == 1200 then
				local _ = nil
				local var582, var583 = protoModule.readBuffer(p9, var448)
				var448 = var583
				var447.kind = {
					type = "party_chat_conversation_upsell",
					value = t.PartyChatConversationUpsellInputData.decode(var582)
				}
			elseif var453 == 1300 then
				local _ = nil
				local var584, var585 = protoModule.readBuffer(p9, var448)
				var448 = var585
				var447.kind = {
					type = "pre_auth_landing_sticky_header",
					value = t.PreAuthLandingStickyHeaderInputData.decode(var584)
				}
			else
				local _ = nil
				local var586, var587 = protoModule.readVarInt(p9, var448)
				var448 = var587 + var586
			end
		elseif var449 == protoModule.wireTypes.i32 then
			local _ = nil
			local var588, var589 = protoModule.readFixed32(p9, var448)
			local _ = var588
			var448 = var589
		elseif var449 == protoModule.wireTypes.i64 then
			local _ = nil
			local var590, var591 = protoModule.readFixed64(p9, var448)
			local _ = var590
			var448 = var591
		else
			error("Unsupported wire type: " .. var449)
		end
	end
	return var447
end

function t_5:jsonEncode() --[[ line: 5029 ]]
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
		elseif self.kind.type == "party_chat_conversation_upsell" then
			t.partyChatConversationUpsell = self.kind.value:jsonEncode()
			
			return t
		elseif self.kind.type == "pre_auth_landing_sticky_header" then
			t.preAuthLandingStickyHeader = self.kind.value:jsonEncode()
		end
	end
	return t
end

function t_5:jsonDecode() --[[ line: 5169 ]]
	-- upvalues: t_5 (ref), t (ref)
	local var593 = t_5.new()
	
	if self.badges_grid ~= nil then
		var593.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badges_grid)
		}
	end
	if self.badgesGrid ~= nil then
		var593.kind = {
			type = "badges_grid",
			value = t.BadgesGridInputData.jsonDecode(self.badgesGrid)
		}
	end
	if self.badge_details ~= nil then
		var593.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badge_details)
		}
	end
	if self.badgeDetails ~= nil then
		var593.kind = {
			type = "badge_details",
			value = t.BadgeDetailsInputData.jsonDecode(self.badgeDetails)
		}
	end
	if self.static_content ~= nil then
		var593.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.static_content)
		}
	end
	if self.staticContent ~= nil then
		var593.kind = {
			type = "static_content",
			value = t.StaticInputData.jsonDecode(self.staticContent)
		}
	end
	if self.experience_attribution_row ~= nil then
		var593.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experience_attribution_row)
		}
	end
	if self.experienceAttributionRow ~= nil then
		var593.kind = {
			type = "experience_attribution_row",
			value = t.ExperienceAttributionRowInputData.jsonDecode(self.experienceAttributionRow)
		}
	end
	if self.experience_action_module ~= nil then
		var593.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experience_action_module)
		}
	end
	if self.experienceActionModule ~= nil then
		var593.kind = {
			type = "experience_action_module",
			value = t.ExperienceActionModuleInputData.jsonDecode(self.experienceActionModule)
		}
	end
	if self.experience_media_gallery ~= nil then
		var593.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experience_media_gallery)
		}
	end
	if self.experienceMediaGallery ~= nil then
		var593.kind = {
			type = "experience_media_gallery",
			value = t.ExperienceMediaGalleryInputData.jsonDecode(self.experienceMediaGallery)
		}
	end
	if self.experience_description ~= nil then
		var593.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experience_description)
		}
	end
	if self.experienceDescription ~= nil then
		var593.kind = {
			type = "experience_description",
			value = t.ExperienceDescriptionInputData.jsonDecode(self.experienceDescription)
		}
	end
	if self.experience_stat_row ~= nil then
		var593.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experience_stat_row)
		}
	end
	if self.experienceStatRow ~= nil then
		var593.kind = {
			type = "experience_stat_row",
			value = t.ExperienceStatRowInputData.jsonDecode(self.experienceStatRow)
		}
	end
	if self.experience_info_table ~= nil then
		var593.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experience_info_table)
		}
	end
	if self.experienceInfoTable ~= nil then
		var593.kind = {
			type = "experience_info_table",
			value = t.ExperienceInfoTableInputData.jsonDecode(self.experienceInfoTable)
		}
	end
	if self.social_link_row ~= nil then
		var593.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.social_link_row)
		}
	end
	if self.socialLinkRow ~= nil then
		var593.kind = {
			type = "social_link_row",
			value = t.SocialLinkRowInputData.jsonDecode(self.socialLinkRow)
		}
	end
	if self.experience_carousel ~= nil then
		var593.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
		}
	end
	if self.experienceCarousel ~= nil then
		var593.kind = {
			type = "experience_carousel",
			value = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
		}
	end
	if self.song_carousel ~= nil then
		var593.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.song_carousel)
		}
	end
	if self.songCarousel ~= nil then
		var593.kind = {
			type = "song_carousel",
			value = t.SongCarouselInputData.jsonDecode(self.songCarousel)
		}
	end
	if self.events_carousel ~= nil then
		var593.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.events_carousel)
		}
	end
	if self.eventsCarousel ~= nil then
		var593.kind = {
			type = "events_carousel",
			value = t.EventsCarouselInputData.jsonDecode(self.eventsCarousel)
		}
	end
	if self.game_pass_collection ~= nil then
		var593.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.game_pass_collection)
		}
	end
	if self.gamePassCollection ~= nil then
		var593.kind = {
			type = "game_pass_collection",
			value = t.GamePassCollectionInputData.jsonDecode(self.gamePassCollection)
		}
	end
	if self.developer_product_collection ~= nil then
		var593.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developer_product_collection)
		}
	end
	if self.developerProductCollection ~= nil then
		var593.kind = {
			type = "developer_product_collection",
			value = t.DeveloperProductCollectionInputData.jsonDecode(self.developerProductCollection)
		}
	end
	if self.subscription_collection ~= nil then
		var593.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscription_collection)
		}
	end
	if self.subscriptionCollection ~= nil then
		var593.kind = {
			type = "subscription_collection",
			value = t.SubscriptionCollectionInputData.jsonDecode(self.subscriptionCollection)
		}
	end
	if self.dynamic_store_category ~= nil then
		var593.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamic_store_category)
		}
	end
	if self.dynamicStoreCategory ~= nil then
		var593.kind = {
			type = "dynamic_store_category",
			value = t.DynamicStoreCategoryInputData.jsonDecode(self.dynamicStoreCategory)
		}
	end
	if self.card_container ~= nil then
		var593.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.card_container)
		}
	end
	if self.cardContainer ~= nil then
		var593.kind = {
			type = "card_container",
			value = t.CardContainerInputData.jsonDecode(self.cardContainer)
		}
	end
	if self.card ~= nil then
		var593.kind = {
			type = "card",
			value = t.CardInputData.jsonDecode(self.card)
		}
	end
	if self.dialog ~= nil then
		var593.kind = {
			type = "dialog",
			value = t.DialogInputData.jsonDecode(self.dialog)
		}
	end
	if self.banner ~= nil then
		var593.kind = {
			type = "banner",
			value = t.BannerInputData.jsonDecode(self.banner)
		}
	end
	if self.tooltip ~= nil then
		var593.kind = {
			type = "tooltip",
			value = t.TooltipInputData.jsonDecode(self.tooltip)
		}
	end
	if self.coachmark ~= nil then
		var593.kind = {
			type = "coachmark",
			value = t.CoachmarkInputData.jsonDecode(self.coachmark)
		}
	end
	if self.system_banner_prompt ~= nil then
		var593.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.system_banner_prompt)
		}
	end
	if self.systemBannerPrompt ~= nil then
		var593.kind = {
			type = "system_banner_prompt",
			value = t.SystemBannerInputData.jsonDecode(self.systemBannerPrompt)
		}
	end
	if self.age_check_upsell ~= nil then
		var593.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.age_check_upsell)
		}
	end
	if self.ageCheckUpsell ~= nil then
		var593.kind = {
			type = "age_check_upsell",
			value = t.AgeCheckUpsellInputData.jsonDecode(self.ageCheckUpsell)
		}
	end
	if self.catalog_item_list ~= nil then
		var593.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalog_item_list)
		}
	end
	if self.catalogItemList ~= nil then
		var593.kind = {
			type = "catalog_item_list",
			value = t.CatalogItemListInputData.jsonDecode(self.catalogItemList)
		}
	end
	if self.user_list ~= nil then
		var593.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.user_list)
		}
	end
	if self.userList ~= nil then
		var593.kind = {
			type = "user_list",
			value = t.UserListInputData.jsonDecode(self.userList)
		}
	end
	if self.experience_content_rating_label ~= nil then
		var593.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experience_content_rating_label)
		}
	end
	if self.experienceContentRatingLabel ~= nil then
		var593.kind = {
			type = "experience_content_rating_label",
			value = t.ExperienceContentRatingLabelInputData.jsonDecode(self.experienceContentRatingLabel)
		}
	end
	if self.experience_refund_policy ~= nil then
		var593.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experience_refund_policy)
		}
	end
	if self.experienceRefundPolicy ~= nil then
		var593.kind = {
			type = "experience_refund_policy",
			value = t.ExperienceRefundPolicyInputData.jsonDecode(self.experienceRefundPolicy)
		}
	end
	if self.experience_play_with_reward ~= nil then
		var593.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experience_play_with_reward)
		}
	end
	if self.experiencePlayWithReward ~= nil then
		var593.kind = {
			type = "experience_play_with_reward",
			value = t.ExperiencePlayWithRewardInputData.jsonDecode(self.experiencePlayWithReward)
		}
	end
	if self.experience_guidelines_dialog ~= nil then
		var593.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experience_guidelines_dialog)
		}
	end
	if self.experienceGuidelinesDialog ~= nil then
		var593.kind = {
			type = "experience_guidelines_dialog",
			value = t.ExperienceGuidelinesDialogInputData.jsonDecode(self.experienceGuidelinesDialog)
		}
	end
	if self.community_section ~= nil then
		var593.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.community_section)
		}
	end
	if self.communitySection ~= nil then
		var593.kind = {
			type = "community_section",
			value = t.CommunitySectionInputData.jsonDecode(self.communitySection)
		}
	end
	if self.moments_carousel ~= nil then
		var593.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.moments_carousel)
		}
	end
	if self.momentsCarousel ~= nil then
		var593.kind = {
			type = "moments_carousel",
			value = t.MomentsCarouselInputData.jsonDecode(self.momentsCarousel)
		}
	end
	if self.text ~= nil then
		var593.kind = {
			type = "text",
			value = t.TextInputData.jsonDecode(self.text)
		}
	end
	if self.vertical_feed ~= nil then
		var593.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.vertical_feed)
		}
	end
	if self.verticalFeed ~= nil then
		var593.kind = {
			type = "vertical_feed",
			value = t.VerticalFeedInputData.jsonDecode(self.verticalFeed)
		}
	end
	if self.page_header ~= nil then
		var593.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.page_header)
		}
	end
	if self.pageHeader ~= nil then
		var593.kind = {
			type = "page_header",
			value = t.PageHeaderInputData.jsonDecode(self.pageHeader)
		}
	end
	if self.experience_details_feed ~= nil then
		var593.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experience_details_feed)
		}
	end
	if self.experienceDetailsFeed ~= nil then
		var593.kind = {
			type = "experience_details_feed",
			value = t.ExperienceDetailsFeedInputData.jsonDecode(self.experienceDetailsFeed)
		}
	end
	if self.experience_details_action_bar ~= nil then
		var593.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experience_details_action_bar)
		}
	end
	if self.experienceDetailsActionBar ~= nil then
		var593.kind = {
			type = "experience_details_action_bar",
			value = t.ExperienceDetailsActionBarInputData.jsonDecode(self.experienceDetailsActionBar)
		}
	end
	if self.experience_details_banner_image ~= nil then
		var593.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experience_details_banner_image)
		}
	end
	if self.experienceDetailsBannerImage ~= nil then
		var593.kind = {
			type = "experience_details_banner_image",
			value = t.ExperienceDetailsBannerImageInputData.jsonDecode(self.experienceDetailsBannerImage)
		}
	end
	if self.experience_details_sticky_header ~= nil then
		var593.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experience_details_sticky_header)
		}
	end
	if self.experienceDetailsStickyHeader ~= nil then
		var593.kind = {
			type = "experience_details_sticky_header",
			value = t.ExperienceDetailsStickyHeaderInputData.jsonDecode(self.experienceDetailsStickyHeader)
		}
	end
	if self.event_details_feed ~= nil then
		var593.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.event_details_feed)
		}
	end
	if self.eventDetailsFeed ~= nil then
		var593.kind = {
			type = "event_details_feed",
			value = t.EventDetailsFeedInputData.jsonDecode(self.eventDetailsFeed)
		}
	end
	if self.event_details_action_bar ~= nil then
		var593.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.event_details_action_bar)
		}
	end
	if self.eventDetailsActionBar ~= nil then
		var593.kind = {
			type = "event_details_action_bar",
			value = t.EventDetailsActionBarInputData.jsonDecode(self.eventDetailsActionBar)
		}
	end
	if self.event_attribution_row ~= nil then
		var593.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.event_attribution_row)
		}
	end
	if self.eventAttributionRow ~= nil then
		var593.kind = {
			type = "event_attribution_row",
			value = t.EventAttributionRowInputData.jsonDecode(self.eventAttributionRow)
		}
	end
	if self.event_description ~= nil then
		var593.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.event_description)
		}
	end
	if self.eventDescription ~= nil then
		var593.kind = {
			type = "event_description",
			value = t.EventDescriptionInputData.jsonDecode(self.eventDescription)
		}
	end
	if self.event_info_table ~= nil then
		var593.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.event_info_table)
		}
	end
	if self.eventInfoTable ~= nil then
		var593.kind = {
			type = "event_info_table",
			value = t.EventInfoTableInputData.jsonDecode(self.eventInfoTable)
		}
	end
	if self.event_details_sheet_full_bleed ~= nil then
		var593.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.event_details_sheet_full_bleed)
		}
	end
	if self.eventDetailsSheetFullBleed ~= nil then
		var593.kind = {
			type = "event_details_sheet_full_bleed",
			value = t.EventDetailsSheetFullBleedInputData.jsonDecode(self.eventDetailsSheetFullBleed)
		}
	end
	if self.event_notifications_modal ~= nil then
		var593.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.event_notifications_modal)
		}
	end
	if self.eventNotificationsModal ~= nil then
		var593.kind = {
			type = "event_notifications_modal",
			value = t.EventNotificationsModalInputData.jsonDecode(self.eventNotificationsModal)
		}
	end
	if self.dev_store_feed ~= nil then
		var593.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.dev_store_feed)
		}
	end
	if self.devStoreFeed ~= nil then
		var593.kind = {
			type = "dev_store_feed",
			value = t.DevStoreFeedInputData.jsonDecode(self.devStoreFeed)
		}
	end
	if self.charts_feed ~= nil then
		var593.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.charts_feed)
		}
	end
	if self.chartsFeed ~= nil then
		var593.kind = {
			type = "charts_feed",
			value = t.ChartsFeedInputData.jsonDecode(self.chartsFeed)
		}
	end
	if self.filter_pills ~= nil then
		var593.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filter_pills)
		}
	end
	if self.filterPills ~= nil then
		var593.kind = {
			type = "filter_pills",
			value = t.FilterPillsInputData.jsonDecode(self.filterPills)
		}
	end
	if self.sort_selector ~= nil then
		var593.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sort_selector)
		}
	end
	if self.sortSelector ~= nil then
		var593.kind = {
			type = "sort_selector",
			value = t.SortSelectorInputData.jsonDecode(self.sortSelector)
		}
	end
	if self.genre_selector ~= nil then
		var593.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genre_selector)
		}
	end
	if self.genreSelector ~= nil then
		var593.kind = {
			type = "genre_selector",
			value = t.ChartsGenreSelectorInputData.jsonDecode(self.genreSelector)
		}
	end
	if self.marketplace_catalog_feed ~= nil then
		var593.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplace_catalog_feed)
		}
	end
	if self.marketplaceCatalogFeed ~= nil then
		var593.kind = {
			type = "marketplace_catalog_feed",
			value = t.UAMarketplaceCatalogFeedInputData.jsonDecode(self.marketplaceCatalogFeed)
		}
	end
	if self.marketplace_catalog_category_menu ~= nil then
		var593.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplace_catalog_category_menu)
		}
	end
	if self.marketplaceCatalogCategoryMenu ~= nil then
		var593.kind = {
			type = "marketplace_catalog_category_menu",
			value = t.UAMarketplaceCatalogCategoryMenuInputData.jsonDecode(self.marketplaceCatalogCategoryMenu)
		}
	end
	if self.marketplace_catalog_item_group ~= nil then
		var593.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplace_catalog_item_group)
		}
	end
	if self.marketplaceCatalogItemGroup ~= nil then
		var593.kind = {
			type = "marketplace_catalog_item_group",
			value = t.UAMarketplaceCatalogItemGroupInputData.jsonDecode(self.marketplaceCatalogItemGroup)
		}
	end
	if self.marketplace_catalog_item_carousel ~= nil then
		var593.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplace_catalog_item_carousel)
		}
	end
	if self.marketplaceCatalogItemCarousel ~= nil then
		var593.kind = {
			type = "marketplace_catalog_item_carousel",
			value = t.UAMarketplaceCatalogItemCarouselInputData.jsonDecode(self.marketplaceCatalogItemCarousel)
		}
	end
	if self.marketplace_catalog_hero_unit ~= nil then
		var593.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplace_catalog_hero_unit)
		}
	end
	if self.marketplaceCatalogHeroUnit ~= nil then
		var593.kind = {
			type = "marketplace_catalog_hero_unit",
			value = t.UAMarketplaceCatalogHeroUnitInputData.jsonDecode(self.marketplaceCatalogHeroUnit)
		}
	end
	if self.catalog_item_grid ~= nil then
		var593.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalog_item_grid)
		}
	end
	if self.catalogItemGrid ~= nil then
		var593.kind = {
			type = "catalog_item_grid",
			value = t.CatalogItemGridInputData.jsonDecode(self.catalogItemGrid)
		}
	end
	if self.marketplace_offer_modal ~= nil then
		var593.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplace_offer_modal)
		}
	end
	if self.marketplaceOfferModal ~= nil then
		var593.kind = {
			type = "marketplace_offer_modal",
			value = t.MarketplaceOfferModalInputData.jsonDecode(self.marketplaceOfferModal)
		}
	end
	if self.search_results_feed ~= nil then
		var593.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.search_results_feed)
		}
	end
	if self.searchResultsFeed ~= nil then
		var593.kind = {
			type = "search_results_feed",
			value = t.SearchResultsFeedInputData.jsonDecode(self.searchResultsFeed)
		}
	end
	if self.power_search_ai_overview ~= nil then
		var593.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.power_search_ai_overview)
		}
	end
	if self.powerSearchAiOverview ~= nil then
		var593.kind = {
			type = "power_search_ai_overview",
			value = t.PowerSearchAIOverviewInputData.jsonDecode(self.powerSearchAiOverview)
		}
	end
	if self.experience_emphasis_tile ~= nil then
		var593.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experience_emphasis_tile)
		}
	end
	if self.experienceEmphasisTile ~= nil then
		var593.kind = {
			type = "experience_emphasis_tile",
			value = t.ExperienceEmphasisTileInputData.jsonDecode(self.experienceEmphasisTile)
		}
	end
	if self.option_selector_carousel ~= nil then
		var593.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.option_selector_carousel)
		}
	end
	if self.optionSelectorCarousel ~= nil then
		var593.kind = {
			type = "option_selector_carousel",
			value = t.OptionSelectorCarouselInputData.jsonDecode(self.optionSelectorCarousel)
		}
	end
	if self.party_chat_conversation_upsell ~= nil then
		var593.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.party_chat_conversation_upsell)
		}
	end
	if self.partyChatConversationUpsell ~= nil then
		var593.kind = {
			type = "party_chat_conversation_upsell",
			value = t.PartyChatConversationUpsellInputData.jsonDecode(self.partyChatConversationUpsell)
		}
	end
	if self.pre_auth_landing_sticky_header ~= nil then
		var593.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.pre_auth_landing_sticky_header)
		}
	end
	if self.preAuthLandingStickyHeader ~= nil then
		var593.kind = {
			type = "pre_auth_landing_sticky_header",
			value = t.PreAuthLandingStickyHeaderInputData.jsonDecode(self.preAuthLandingStickyHeader)
		}
	end
	return var593
end

t_5.descriptor = {
	name = "PageEntryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageEntryInputData"
}
t.PageEntryInputData = t_5
typeRegistryModule.default:register(t.PageEntryInputData)
local t_6 = {}
t_6.__index = t_6

function t_6.new(p10) --[[ line: 5983 ]]
	-- upvalues: t_6 (ref)
	return setmetatable({
		section_title = if p10 == nil or p10.section_title == nil then "" else p10.section_title,
		badges = if p10 == nil or p10.badges == nil then {} else p10.badges,
		collection_id = if p10 == nil or p10.collection_id == nil then "" else p10.collection_id,
		collection_position = if p10 == nil or p10.collection_position == nil then "" else p10.collection_position,
		universe_id = if p10 == nil or p10.universe_id == nil then "" else p10.universe_id
	}, t_6)
end

function t_6:encode() --[[ line: 5995 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var595 = 0
	
	if self.section_title ~= nil and self.section_title ~= "" then
		local var596, var597 = protoModule.writeTag(buff, var595, 1, protoModule.wireTypes.lengthDelimited)
		var596, var597 = protoModule.writeString(var596, var597, self.section_title)
		buff = var596
		var595 = var597
	end
	if self.badges ~= nil and #self.badges > 0 then
		for i, v in self.badges do
			local var598 = v:encode()
			local var599, var600 = protoModule.writeTag(buff, var595, 2, protoModule.wireTypes.lengthDelimited)
			var599, var600 = protoModule.writeBuffer(var599, var600, var598, buffer.len(var598))
			buff = var599
			var595 = var600
		end
	end
	if self.collection_id ~= nil and self.collection_id ~= "" then
		local var601, var602 = protoModule.writeTag(buff, var595, 3, protoModule.wireTypes.lengthDelimited)
		var601, var602 = protoModule.writeString(var601, var602, self.collection_id)
		buff = var601
		var595 = var602
	end
	if self.collection_position ~= nil and self.collection_position ~= "" then
		local var603, var604 = protoModule.writeTag(buff, var595, 4, protoModule.wireTypes.lengthDelimited)
		var603, var604 = protoModule.writeString(var603, var604, self.collection_position)
		buff = var603
		var595 = var604
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var605, var606 = protoModule.writeTag(buff, var595, 5, protoModule.wireTypes.lengthDelimited)
		var605, var606 = protoModule.writeString(var605, var606, self.universe_id)
		buff = var605
		var595 = var606
	end
	local buff_1 = buffer.create(var595)
	buffer.copy(buff_1, 0, buff, 0, var595)
	
	return buff_1
end

function t_6.decode(p11) --[[ line: 6032 ]]
	-- upvalues: t_6 (ref), protoModule (ref), t (ref)
	local var608 = t_6.new()
	local var609 = 0
	while var609 < buffer.len(p11) do
		local _ = nil
		local var610 = nil
		local var611, var612, var613 = protoModule.readTag(p11, var609)
		local var614 = var611
		var610 = var612
		var609 = var613
		
		if var610 == protoModule.wireTypes.varint then
			local _ = nil
			local var615, var616 = protoModule.readVarInt(p11, var609)
			local _ = var615
			var609 = var616
			continue
		end
		if var610 == protoModule.wireTypes.lengthDelimited then
			if var614 == 1 then
				local _ = nil
				local var617, var618 = protoModule.readBuffer(p11, var609)
				var609 = var618
				var608.section_title = buffer.tostring(var617)
			elseif var614 == 2 then
				local _ = nil
				local var619, var620 = protoModule.readBuffer(p11, var609)
				var609 = var620
				table.insert(var608.badges, t.BadgesGridInputData_BadgeInputData.decode(var619))
			elseif var614 == 3 then
				local _ = nil
				local var621, var622 = protoModule.readBuffer(p11, var609)
				var609 = var622
				var608.collection_id = buffer.tostring(var621)
			elseif var614 == 4 then
				local _ = nil
				local var623, var624 = protoModule.readBuffer(p11, var609)
				var609 = var624
				var608.collection_position = buffer.tostring(var623)
			elseif var614 == 5 then
				local _ = nil
				local var625, var626 = protoModule.readBuffer(p11, var609)
				var609 = var626
				var608.universe_id = buffer.tostring(var625)
			else
				local _ = nil
				local var627, var628 = protoModule.readVarInt(p11, var609)
				var609 = var628 + var627
			end
		elseif var610 == protoModule.wireTypes.i32 then
			local _ = nil
			local var629, var630 = protoModule.readFixed32(p11, var609)
			local _ = var629
			var609 = var630
		elseif var610 == protoModule.wireTypes.i64 then
			local _ = nil
			local var631, var632 = protoModule.readFixed64(p11, var609)
			local _ = var631
			var609 = var632
		else
			error("Unsupported wire type: " .. var610)
		end
	end
	return var608
end

function t_6:jsonEncode() --[[ line: 6095 ]]
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

function t_6:jsonDecode() --[[ line: 6125 ]]
	-- upvalues: t_6 (ref), t (ref)
	local var635 = t_6.new()
	
	if self.section_title ~= nil then
		var635.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var635.section_title = self.sectionTitle
	end
	if self.badges ~= nil then
		local t_1 = {}
		
		for i, v in self.badges do
			table.insert(t_1, t.BadgesGridInputData_BadgeInputData.jsonDecode(v))
		end
		var635.badges = t_1
	end
	if self.collection_id ~= nil then
		var635.collection_id = self.collection_id
	end
	if self.collectionId ~= nil then
		var635.collection_id = self.collectionId
	end
	if self.collection_position ~= nil then
		var635.collection_position = self.collection_position
	end
	if self.collectionPosition ~= nil then
		var635.collection_position = self.collectionPosition
	end
	if self.universe_id ~= nil then
		var635.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var635.universe_id = self.universeId
	end
	return var635
end

t_6.descriptor = {
	name = "BadgesGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgesGridInputData"
}
t.BadgesGridInputData = t_6
typeRegistryModule.default:register(t.BadgesGridInputData)
local t_7 = {}
t_7.__index = t_7

function t_7.new(p12) --[[ line: 6186 ]]
	-- upvalues: t_7 (ref)
	return setmetatable({
		badge_id = if p12 == nil or p12.badge_id == nil then "" else p12.badge_id
	}, t_7)
end

function t_7:encode() --[[ line: 6194 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var638 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var639, var640 = protoModule.writeTag(buff, var638, 1, protoModule.wireTypes.lengthDelimited)
		var639, var640 = protoModule.writeString(var639, var640, self.badge_id)
		buff = var639
		var638 = var640
	end
	local buff_1 = buffer.create(var638)
	buffer.copy(buff_1, 0, buff, 0, var638)
	
	return buff_1
end

function t_7.decode(p13) --[[ line: 6208 ]]
	-- upvalues: t_7 (ref), protoModule (ref)
	local var642 = t_7.new()
	local var643 = 0
	while var643 < buffer.len(p13) do
		local _ = nil
		local var644 = nil
		local var645, var646, var647 = protoModule.readTag(p13, var643)
		local var648 = var645
		var644 = var646
		var643 = var647
		
		if var644 == protoModule.wireTypes.varint then
			local _ = nil
			local var649, var650 = protoModule.readVarInt(p13, var643)
			local _ = var649
			var643 = var650
			continue
		end
		if var644 == protoModule.wireTypes.lengthDelimited then
			if var648 == 1 then
				local _ = nil
				local var651, var652 = protoModule.readBuffer(p13, var643)
				var643 = var652
				var642.badge_id = buffer.tostring(var651)
			else
				local _ = nil
				local var653, var654 = protoModule.readVarInt(p13, var643)
				var643 = var654 + var653
			end
		elseif var644 == protoModule.wireTypes.i32 then
			local _ = nil
			local var655, var656 = protoModule.readFixed32(p13, var643)
			local _ = var655
			var643 = var656
		elseif var644 == protoModule.wireTypes.i64 then
			local _ = nil
			local var657, var658 = protoModule.readFixed64(p13, var643)
			local _ = var657
			var643 = var658
		else
			error("Unsupported wire type: " .. var644)
		end
	end
	return var642
end

function t_7:jsonEncode() --[[ line: 6251 ]]
	local t = {}
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		t.badgeId = self.badge_id
	end
	return t
end

function t_7:jsonDecode() --[[ line: 6261 ]]
	-- upvalues: t_7 (ref)
	local var660 = t_7.new()
	
	if self.badge_id ~= nil then
		var660.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var660.badge_id = self.badgeId
	end
	return var660
end

t_7.descriptor = {
	name = "BadgesGridInputData_BadgeInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeInputData"
}
t.BadgesGridInputData_BadgeInputData = t_7
typeRegistryModule.default:register(t.BadgesGridInputData_BadgeInputData)
local t_8 = {}
t_8.__index = t_8

function t_8.new(p14) --[[ line: 6291 ]]
	-- upvalues: t_8 (ref)
	return setmetatable({
		badge_id = if p14 == nil or p14.badge_id == nil then "" else p14.badge_id,
		universe_id = if p14 == nil or p14.universe_id == nil then "" else p14.universe_id,
		localized_literals = if p14 == nil or p14.localized_literals == nil then nil else p14.localized_literals,
		creator_key = if p14 == nil or p14.creator_key == nil then "" else p14.creator_key
	}, t_8)
end

function t_8:encode() --[[ line: 6300 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var662 = 0
	
	if self.badge_id ~= nil and self.badge_id ~= "" then
		local var663, var664 = protoModule.writeTag(buff, var662, 1, protoModule.wireTypes.lengthDelimited)
		var663, var664 = protoModule.writeString(var663, var664, self.badge_id)
		buff = var663
		var662 = var664
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var665, var666 = protoModule.writeTag(buff, var662, 2, protoModule.wireTypes.lengthDelimited)
		var665, var666 = protoModule.writeString(var665, var666, self.universe_id)
		buff = var665
		var662 = var666
	end
	if self.localized_literals ~= nil then
		local var667 = self.localized_literals:encode()
		local var668, var669 = protoModule.writeTag(buff, var662, 3, protoModule.wireTypes.lengthDelimited)
		var668, var669 = protoModule.writeBuffer(var668, var669, var667, buffer.len(var667))
		buff = var668
		var662 = var669
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var670, var671 = protoModule.writeTag(buff, var662, 4, protoModule.wireTypes.lengthDelimited)
		var670, var671 = protoModule.writeString(var670, var671, self.creator_key)
		buff = var670
		var662 = var671
	end
	local buff_1 = buffer.create(var662)
	buffer.copy(buff_1, 0, buff, 0, var662)
	
	return buff_1
end

function t_8.decode(p15) --[[ line: 6330 ]]
	-- upvalues: t_8 (ref), protoModule (ref), t (ref)
	local var673 = t_8.new()
	local var674 = 0
	while var674 < buffer.len(p15) do
		local _ = nil
		local var675 = nil
		local var676, var677, var678 = protoModule.readTag(p15, var674)
		local var679 = var676
		var675 = var677
		var674 = var678
		
		if var675 == protoModule.wireTypes.varint then
			local _ = nil
			local var680, var681 = protoModule.readVarInt(p15, var674)
			local _ = var680
			var674 = var681
			continue
		end
		if var675 == protoModule.wireTypes.lengthDelimited then
			if var679 == 1 then
				local _ = nil
				local var682, var683 = protoModule.readBuffer(p15, var674)
				var674 = var683
				var673.badge_id = buffer.tostring(var682)
			elseif var679 == 2 then
				local _ = nil
				local var684, var685 = protoModule.readBuffer(p15, var674)
				var674 = var685
				var673.universe_id = buffer.tostring(var684)
			elseif var679 == 3 then
				local _ = nil
				local var686, var687 = protoModule.readBuffer(p15, var674)
				var674 = var687
				var673.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.decode(var686)
			elseif var679 == 4 then
				local _ = nil
				local var688, var689 = protoModule.readBuffer(p15, var674)
				var674 = var689
				var673.creator_key = buffer.tostring(var688)
			else
				local _ = nil
				local var690, var691 = protoModule.readVarInt(p15, var674)
				var674 = var691 + var690
			end
		elseif var675 == protoModule.wireTypes.i32 then
			local _ = nil
			local var692, var693 = protoModule.readFixed32(p15, var674)
			local _ = var692
			var674 = var693
		elseif var675 == protoModule.wireTypes.i64 then
			local _ = nil
			local var694, var695 = protoModule.readFixed64(p15, var674)
			local _ = var694
			var674 = var695
		else
			error("Unsupported wire type: " .. var675)
		end
	end
	return var673
end

function t_8:jsonEncode() --[[ line: 6388 ]]
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

function t_8:jsonDecode() --[[ line: 6410 ]]
	-- upvalues: t_8 (ref), t (ref)
	local var697 = t_8.new()
	
	if self.badge_id ~= nil then
		var697.badge_id = self.badge_id
	end
	if self.badgeId ~= nil then
		var697.badge_id = self.badgeId
	end
	if self.universe_id ~= nil then
		var697.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var697.universe_id = self.universeId
	end
	if self.localized_literals ~= nil then
		var697.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localized_literals)
	end
	if self.localizedLiterals ~= nil then
		var697.localized_literals = t.BadgeDetailsInputData_LocalizedLiterals.jsonDecode(self.localizedLiterals)
	end
	if self.creator_key ~= nil then
		var697.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var697.creator_key = self.creatorKey
	end
	return var697
end

t_8.descriptor = {
	name = "BadgeDetailsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BadgeDetailsInputData"
}
t.BadgeDetailsInputData = t_8
typeRegistryModule.default:register(t.BadgeDetailsInputData)
local t_9 = {}
t_9.__index = t_9

function t_9.new(p16) --[[ line: 6464 ]]
	-- upvalues: t_9 (ref)
	return setmetatable({
		info_table = if p16 == nil or p16.info_table == nil then nil else p16.info_table,
		action_module = if p16 == nil or p16.action_module == nil then nil else p16.action_module,
		overflow_menu = if p16 == nil or p16.overflow_menu == nil then nil else p16.overflow_menu
	}, t_9)
end

function t_9:encode() --[[ line: 6474 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var699 = 0
	
	if self.info_table ~= nil then
		local var700 = self.info_table:encode()
		local var701, var702 = protoModule.writeTag(buff, var699, 1, protoModule.wireTypes.lengthDelimited)
		var701, var702 = protoModule.writeBuffer(var701, var702, var700, buffer.len(var700))
		buff = var701
		var699 = var702
	end
	if self.action_module ~= nil then
		local var703 = self.action_module:encode()
		local var704, var705 = protoModule.writeTag(buff, var699, 2, protoModule.wireTypes.lengthDelimited)
		var704, var705 = protoModule.writeBuffer(var704, var705, var703, buffer.len(var703))
		buff = var704
		var699 = var705
	end
	if self.overflow_menu ~= nil then
		local var706 = self.overflow_menu:encode()
		local var707, var708 = protoModule.writeTag(buff, var699, 3, protoModule.wireTypes.lengthDelimited)
		var707, var708 = protoModule.writeBuffer(var707, var708, var706, buffer.len(var706))
		buff = var707
		var699 = var708
	end
	local buff_1 = buffer.create(var699)
	buffer.copy(buff_1, 0, buff, 0, var699)
	
	return buff_1
end

function t_9.decode(p17) --[[ line: 6501 ]]
	-- upvalues: t_9 (ref), protoModule (ref), t (ref)
	local var710 = t_9.new()
	local var711 = 0
	while var711 < buffer.len(p17) do
		local _ = nil
		local var712 = nil
		local var713, var714, var715 = protoModule.readTag(p17, var711)
		local var716 = var713
		var712 = var714
		var711 = var715
		
		if var712 == protoModule.wireTypes.varint then
			local _ = nil
			local var717, var718 = protoModule.readVarInt(p17, var711)
			local _ = var717
			var711 = var718
			continue
		end
		if var712 == protoModule.wireTypes.lengthDelimited then
			if var716 == 1 then
				local _ = nil
				local var719, var720 = protoModule.readBuffer(p17, var711)
				var711 = var720
				var710.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.decode(var719)
			elseif var716 == 2 then
				local _ = nil
				local var721, var722 = protoModule.readBuffer(p17, var711)
				var711 = var722
				var710.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.decode(var721)
			elseif var716 == 3 then
				local _ = nil
				local var723, var724 = protoModule.readBuffer(p17, var711)
				var711 = var724
				var710.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.decode(var723)
			else
				local _ = nil
				local var725, var726 = protoModule.readVarInt(p17, var711)
				var711 = var726 + var725
			end
		elseif var712 == protoModule.wireTypes.i32 then
			local _ = nil
			local var727, var728 = protoModule.readFixed32(p17, var711)
			local _ = var727
			var711 = var728
		elseif var712 == protoModule.wireTypes.i64 then
			local _ = nil
			local var729, var730 = protoModule.readFixed64(p17, var711)
			local _ = var729
			var711 = var730
		else
			error("Unsupported wire type: " .. var712)
		end
	end
	return var710
end

function t_9:jsonEncode() --[[ line: 6554 ]]
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

function t_9:jsonDecode() --[[ line: 6572 ]]
	-- upvalues: t_9 (ref), t (ref)
	local var732 = t_9.new()
	
	if self.info_table ~= nil then
		var732.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.info_table)
	end
	if self.infoTable ~= nil then
		var732.info_table = t.BadgeDetailsInputData_LocalizedLiterals_InfoTable.jsonDecode(self.infoTable)
	end
	if self.action_module ~= nil then
		var732.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.action_module)
	end
	if self.actionModule ~= nil then
		var732.action_module = t.BadgeDetailsInputData_LocalizedLiterals_ActionModule.jsonDecode(self.actionModule)
	end
	if self.overflow_menu ~= nil then
		var732.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflow_menu)
	end
	if self.overflowMenu ~= nil then
		var732.overflow_menu = t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu.jsonDecode(self.overflowMenu)
	end
	return var732
end

t_9.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals",
	fullName = "roblox.apppageplatform.shared.v1beta1.LocalizedLiterals"
}
t.BadgeDetailsInputData_LocalizedLiterals = t_9
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals)
local t_10 = {}
t_10.__index = t_10

function t_10.new(p18) --[[ line: 6623 ]]
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

function t_10:encode() --[[ line: 6642 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var734 = 0
	
	if self.type_label ~= nil and self.type_label ~= "" then
		local var735, var736 = protoModule.writeTag(buff, var734, 1, protoModule.wireTypes.lengthDelimited)
		var735, var736 = protoModule.writeString(var735, var736, self.type_label)
		buff = var735
		var734 = var736
	end
	if self.earned_label ~= nil and self.earned_label ~= "" then
		local var737, var738 = protoModule.writeTag(buff, var734, 2, protoModule.wireTypes.lengthDelimited)
		var737, var738 = protoModule.writeString(var737, var738, self.earned_label)
		buff = var737
		var734 = var738
	end
	if self.updated_label ~= nil and self.updated_label ~= "" then
		local var739, var740 = protoModule.writeTag(buff, var734, 3, protoModule.wireTypes.lengthDelimited)
		var739, var740 = protoModule.writeString(var739, var740, self.updated_label)
		buff = var739
		var734 = var740
	end
	if self.experience_label ~= nil and self.experience_label ~= "" then
		local var741, var742 = protoModule.writeTag(buff, var734, 4, protoModule.wireTypes.lengthDelimited)
		var741, var742 = protoModule.writeString(var741, var742, self.experience_label)
		buff = var741
		var734 = var742
	end
	if self.rarity_label ~= nil and self.rarity_label ~= "" then
		local var743, var744 = protoModule.writeTag(buff, var734, 5, protoModule.wireTypes.lengthDelimited)
		var743, var744 = protoModule.writeString(var743, var744, self.rarity_label)
		buff = var743
		var734 = var744
	end
	if self.won_yesterday_label ~= nil and self.won_yesterday_label ~= "" then
		local var745, var746 = protoModule.writeTag(buff, var734, 6, protoModule.wireTypes.lengthDelimited)
		var745, var746 = protoModule.writeString(var745, var746, self.won_yesterday_label)
		buff = var745
		var734 = var746
	end
	if self.won_ever_label ~= nil and self.won_ever_label ~= "" then
		local var747, var748 = protoModule.writeTag(buff, var734, 7, protoModule.wireTypes.lengthDelimited)
		var747, var748 = protoModule.writeString(var747, var748, self.won_ever_label)
		buff = var747
		var734 = var748
	end
	local buff_1 = buffer.create(var734)
	buffer.copy(buff_1, 0, buff, 0, var734)
	
	return buff_1
end

function t_10.decode(p19) --[[ line: 6688 ]]
	-- upvalues: t_10 (ref), protoModule (ref)
	local var750 = t_10.new()
	local var751 = 0
	while var751 < buffer.len(p19) do
		local _ = nil
		local var752 = nil
		local var753, var754, var755 = protoModule.readTag(p19, var751)
		local var756 = var753
		var752 = var754
		var751 = var755
		
		if var752 == protoModule.wireTypes.varint then
			local _ = nil
			local var757, var758 = protoModule.readVarInt(p19, var751)
			local _ = var757
			var751 = var758
			continue
		end
		if var752 == protoModule.wireTypes.lengthDelimited then
			if var756 == 1 then
				local _ = nil
				local var759, var760 = protoModule.readBuffer(p19, var751)
				var751 = var760
				var750.type_label = buffer.tostring(var759)
			elseif var756 == 2 then
				local _ = nil
				local var761, var762 = protoModule.readBuffer(p19, var751)
				var751 = var762
				var750.earned_label = buffer.tostring(var761)
			elseif var756 == 3 then
				local _ = nil
				local var763, var764 = protoModule.readBuffer(p19, var751)
				var751 = var764
				var750.updated_label = buffer.tostring(var763)
			elseif var756 == 4 then
				local _ = nil
				local var765, var766 = protoModule.readBuffer(p19, var751)
				var751 = var766
				var750.experience_label = buffer.tostring(var765)
			elseif var756 == 5 then
				local _ = nil
				local var767, var768 = protoModule.readBuffer(p19, var751)
				var751 = var768
				var750.rarity_label = buffer.tostring(var767)
			elseif var756 == 6 then
				local _ = nil
				local var769, var770 = protoModule.readBuffer(p19, var751)
				var751 = var770
				var750.won_yesterday_label = buffer.tostring(var769)
			elseif var756 == 7 then
				local _ = nil
				local var771, var772 = protoModule.readBuffer(p19, var751)
				var751 = var772
				var750.won_ever_label = buffer.tostring(var771)
			else
				local _ = nil
				local var773, var774 = protoModule.readVarInt(p19, var751)
				var751 = var774 + var773
			end
		elseif var752 == protoModule.wireTypes.i32 then
			local _ = nil
			local var775, var776 = protoModule.readFixed32(p19, var751)
			local _ = var775
			var751 = var776
		elseif var752 == protoModule.wireTypes.i64 then
			local _ = nil
			local var777, var778 = protoModule.readFixed64(p19, var751)
			local _ = var777
			var751 = var778
		else
			error("Unsupported wire type: " .. var752)
		end
	end
	return var750
end

function t_10:jsonEncode() --[[ line: 6763 ]]
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

function t_10:jsonDecode() --[[ line: 6799 ]]
	-- upvalues: t_10 (ref)
	local var780 = t_10.new()
	
	if self.type_label ~= nil then
		var780.type_label = self.type_label
	end
	if self.typeLabel ~= nil then
		var780.type_label = self.typeLabel
	end
	if self.earned_label ~= nil then
		var780.earned_label = self.earned_label
	end
	if self.earnedLabel ~= nil then
		var780.earned_label = self.earnedLabel
	end
	if self.updated_label ~= nil then
		var780.updated_label = self.updated_label
	end
	if self.updatedLabel ~= nil then
		var780.updated_label = self.updatedLabel
	end
	if self.experience_label ~= nil then
		var780.experience_label = self.experience_label
	end
	if self.experienceLabel ~= nil then
		var780.experience_label = self.experienceLabel
	end
	if self.rarity_label ~= nil then
		var780.rarity_label = self.rarity_label
	end
	if self.rarityLabel ~= nil then
		var780.rarity_label = self.rarityLabel
	end
	if self.won_yesterday_label ~= nil then
		var780.won_yesterday_label = self.won_yesterday_label
	end
	if self.wonYesterdayLabel ~= nil then
		var780.won_yesterday_label = self.wonYesterdayLabel
	end
	if self.won_ever_label ~= nil then
		var780.won_ever_label = self.won_ever_label
	end
	if self.wonEverLabel ~= nil then
		var780.won_ever_label = self.wonEverLabel
	end
	return var780
end

t_10.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_InfoTable",
	fullName = "roblox.apppageplatform.shared.v1beta1.InfoTable"
}
t.BadgeDetailsInputData_LocalizedLiterals_InfoTable = t_10
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_InfoTable)
local t_11 = {}
t_11.__index = t_11

function t_11.new(p20) --[[ line: 6879 ]]
	-- upvalues: t_11 (ref)
	return setmetatable({
		share = if p20 == nil or p20.share == nil then "" else p20.share,
		report = if p20 == nil or p20.report == nil then "" else p20.report
	}, t_11)
end

function t_11:encode() --[[ line: 6891 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var782 = 0
	
	if self.share ~= nil and self.share ~= "" then
		local var783, var784 = protoModule.writeTag(buff, var782, 1, protoModule.wireTypes.lengthDelimited)
		var783, var784 = protoModule.writeString(var783, var784, self.share)
		buff = var783
		var782 = var784
	end
	if self.report ~= nil and self.report ~= "" then
		local var785, var786 = protoModule.writeTag(buff, var782, 2, protoModule.wireTypes.lengthDelimited)
		var785, var786 = protoModule.writeString(var785, var786, self.report)
		buff = var785
		var782 = var786
	end
	local buff_1 = buffer.create(var782)
	buffer.copy(buff_1, 0, buff, 0, var782)
	
	return buff_1
end

function t_11.decode(p21) --[[ line: 6912 ]]
	-- upvalues: t_11 (ref), protoModule (ref)
	local var788 = t_11.new()
	local var789 = 0
	while var789 < buffer.len(p21) do
		local _ = nil
		local var790 = nil
		local var791, var792, var793 = protoModule.readTag(p21, var789)
		local var794 = var791
		var790 = var792
		var789 = var793
		
		if var790 == protoModule.wireTypes.varint then
			local _ = nil
			local var795, var796 = protoModule.readVarInt(p21, var789)
			local _ = var795
			var789 = var796
			continue
		end
		if var790 == protoModule.wireTypes.lengthDelimited then
			if var794 == 1 then
				local _ = nil
				local var797, var798 = protoModule.readBuffer(p21, var789)
				var789 = var798
				var788.share = buffer.tostring(var797)
			elseif var794 == 2 then
				local _ = nil
				local var799, var800 = protoModule.readBuffer(p21, var789)
				var789 = var800
				var788.report = buffer.tostring(var799)
			else
				local _ = nil
				local var801, var802 = protoModule.readVarInt(p21, var789)
				var789 = var802 + var801
			end
		elseif var790 == protoModule.wireTypes.i32 then
			local _ = nil
			local var803, var804 = protoModule.readFixed32(p21, var789)
			local _ = var803
			var789 = var804
		elseif var790 == protoModule.wireTypes.i64 then
			local _ = nil
			local var805, var806 = protoModule.readFixed64(p21, var789)
			local _ = var805
			var789 = var806
		else
			error("Unsupported wire type: " .. var790)
		end
	end
	return var788
end

function t_11:jsonEncode() --[[ line: 6962 ]]
	local t = {}
	
	if self.share ~= nil and self.share ~= "" then
		t.share = self.share
	end
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	return t
end

function t_11:jsonDecode() --[[ line: 6978 ]]
	-- upvalues: t_11 (ref)
	local var808 = t_11.new()
	
	if self.share ~= nil then
		var808.share = self.share
	end
	if self.report ~= nil then
		var808.report = self.report
	end
	return var808
end

t_11.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_ActionModule",
	fullName = "roblox.apppageplatform.shared.v1beta1.ActionModule"
}
t.BadgeDetailsInputData_LocalizedLiterals_ActionModule = t_11
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_ActionModule)
local t_12 = {}
t_12.__index = t_12

function t_12.new(p22) --[[ line: 7010 ]]
	-- upvalues: t_12 (ref)
	return setmetatable({
		report = if p22 == nil or p22.report == nil then "" else p22.report,
		remove = if p22 == nil or p22.remove == nil then "" else p22.remove
	}, t_12)
end

function t_12:encode() --[[ line: 7022 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var810 = 0
	
	if self.report ~= nil and self.report ~= "" then
		local var811, var812 = protoModule.writeTag(buff, var810, 1, protoModule.wireTypes.lengthDelimited)
		var811, var812 = protoModule.writeString(var811, var812, self.report)
		buff = var811
		var810 = var812
	end
	if self.remove ~= nil and self.remove ~= "" then
		local var813, var814 = protoModule.writeTag(buff, var810, 2, protoModule.wireTypes.lengthDelimited)
		var813, var814 = protoModule.writeString(var813, var814, self.remove)
		buff = var813
		var810 = var814
	end
	local buff_1 = buffer.create(var810)
	buffer.copy(buff_1, 0, buff, 0, var810)
	
	return buff_1
end

function t_12.decode(p23) --[[ line: 7043 ]]
	-- upvalues: t_12 (ref), protoModule (ref)
	local var816 = t_12.new()
	local var817 = 0
	while var817 < buffer.len(p23) do
		local _ = nil
		local var818 = nil
		local var819, var820, var821 = protoModule.readTag(p23, var817)
		local var822 = var819
		var818 = var820
		var817 = var821
		
		if var818 == protoModule.wireTypes.varint then
			local _ = nil
			local var823, var824 = protoModule.readVarInt(p23, var817)
			local _ = var823
			var817 = var824
			continue
		end
		if var818 == protoModule.wireTypes.lengthDelimited then
			if var822 == 1 then
				local _ = nil
				local var825, var826 = protoModule.readBuffer(p23, var817)
				var817 = var826
				var816.report = buffer.tostring(var825)
			elseif var822 == 2 then
				local _ = nil
				local var827, var828 = protoModule.readBuffer(p23, var817)
				var817 = var828
				var816.remove = buffer.tostring(var827)
			else
				local _ = nil
				local var829, var830 = protoModule.readVarInt(p23, var817)
				var817 = var830 + var829
			end
		elseif var818 == protoModule.wireTypes.i32 then
			local _ = nil
			local var831, var832 = protoModule.readFixed32(p23, var817)
			local _ = var831
			var817 = var832
		elseif var818 == protoModule.wireTypes.i64 then
			local _ = nil
			local var833, var834 = protoModule.readFixed64(p23, var817)
			local _ = var833
			var817 = var834
		else
			error("Unsupported wire type: " .. var818)
		end
	end
	return var816
end

function t_12:jsonEncode() --[[ line: 7093 ]]
	local t = {}
	
	if self.report ~= nil and self.report ~= "" then
		t.report = self.report
	end
	if self.remove ~= nil and self.remove ~= "" then
		t.remove = self.remove
	end
	return t
end

function t_12:jsonDecode() --[[ line: 7109 ]]
	-- upvalues: t_12 (ref)
	local var836 = t_12.new()
	
	if self.report ~= nil then
		var836.report = self.report
	end
	if self.remove ~= nil then
		var836.remove = self.remove
	end
	return var836
end

t_12.descriptor = {
	name = "BadgeDetailsInputData_LocalizedLiterals_OverflowMenu",
	fullName = "roblox.apppageplatform.shared.v1beta1.OverflowMenu"
}
t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu = t_12
typeRegistryModule.default:register(t.BadgeDetailsInputData_LocalizedLiterals_OverflowMenu)
local t_13 = {}
t_13.__index = t_13

function t_13.new(_) --[[ line: 7140 ]]
	-- upvalues: t_13 (ref)
	return setmetatable({}, t_13)
end

function t_13.encode(_) --[[ line: 7144 ]]
	local buff = buffer.create(0)
	buffer.copy(buff, 0, buffer.create(0), 0, 0)
	
	return buff
end

function t_13.decode(p24) --[[ line: 7153 ]]
	-- upvalues: t_13 (ref), protoModule (ref)
	local var838 = t_13.new()
	local var839 = 0
	while var839 < buffer.len(p24) do
		local var840 = nil
		local _ = nil
		local var841, var842, var843 = protoModule.readTag(p24, var839)
		var840 = var841
		local var844 = var842
		var839 = var843
		
		if var844 == protoModule.wireTypes.varint then
			local _ = nil
			local var845, var846 = protoModule.readVarInt(p24, var839)
			local _ = var845
			var839 = var846
		elseif var844 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var847, var848 = protoModule.readVarInt(p24, var839)
			var839 = var848 + var847
		elseif var844 == protoModule.wireTypes.i32 then
			local _ = nil
			local var849, var850 = protoModule.readFixed32(p24, var839)
			local _ = var849
			var839 = var850
		elseif var844 == protoModule.wireTypes.i64 then
			local _ = nil
			local var851, var852 = protoModule.readFixed64(p24, var839)
			local _ = var851
			var839 = var852
		else
			error("Unsupported wire type: " .. var844)
		end
	end
	return var838
end

function t_13.jsonEncode(_) --[[ line: 7191 ]]
	return {}
end

function t_13.jsonDecode(_) --[[ line: 7197 ]]
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

function t_14.new(p25) --[[ line: 7217 ]]
	-- upvalues: t_14 (ref)
	return setmetatable({
		universe_id = if p25 == nil or p25.universe_id == nil then "" else p25.universe_id,
		creator_key = if p25 == nil or p25.creator_key == nil then "" else p25.creator_key,
		entry_map = if p25 == nil or p25.entry_map == nil then {} else p25.entry_map,
		entry_order = if p25 == nil or p25.entry_order == nil then {} else p25.entry_order,
		entry_order_map = if p25 == nil or p25.entry_order_map == nil then {} else p25.entry_order_map
	}, t_14)
end

function t_14:encode() --[[ line: 7229 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var854 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var855, var856 = protoModule.writeTag(buff, var854, 1, protoModule.wireTypes.lengthDelimited)
		var855, var856 = protoModule.writeString(var855, var856, self.universe_id)
		buff = var855
		var854 = var856
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var857, var858 = protoModule.writeTag(buff, var854, 2, protoModule.wireTypes.lengthDelimited)
		var857, var858 = protoModule.writeString(var857, var858, self.creator_key)
		buff = var857
		var854 = var858
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var859, var860 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var859, var860 = protoModule.writeString(var859, var860, i)
			local var861 = v:encode()
			var860, var862 = protoModule.writeTag(var859, var860, 2, protoModule.wireTypes.lengthDelimited)
			var860, var862 = protoModule.writeBuffer(var860, var862, var861, buffer.len(var861))
			local var863 = var860
			local var864 = var862
			local var865, var866 = protoModule.writeTag(buff, var854, 3, protoModule.wireTypes.lengthDelimited)
			var865, var866 = protoModule.writeBuffer(var865, var866, var863, var864)
			buff = var865
			var854 = var866
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var867, var868 = protoModule.writeTag(buff, var854, 4, protoModule.wireTypes.lengthDelimited)
			var867, var868 = protoModule.writeString(var867, var868, v)
			buff = var867
			var854 = var868
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var869, var870 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var869, var870 = protoModule.writeString(var869, var870, i)
			local var871 = v:encode()
			var870, var872 = protoModule.writeTag(var869, var870, 2, protoModule.wireTypes.lengthDelimited)
			var870, var872 = protoModule.writeBuffer(var870, var872, var871, buffer.len(var871))
			local var873 = var870
			local var874 = var872
			local var875, var876 = protoModule.writeTag(buff, var854, 5, protoModule.wireTypes.lengthDelimited)
			var875, var876 = protoModule.writeBuffer(var875, var876, var873, var874)
			buff = var875
			var854 = var876
		end
	end
	local buff_1 = buffer.create(var854)
	buffer.copy(buff_1, 0, buff, 0, var854)
	
	return buff_1
end

function t_14.decode(p26) --[[ line: 7283 ]]
	-- upvalues: t_14 (ref), protoModule (ref), t (ref)
	local var878 = t_14.new()
	local var879 = 0
	while var879 < buffer.len(p26) do
		local _ = nil
		local var880 = nil
		local var881, var882, var883 = protoModule.readTag(p26, var879)
		local var884 = var881
		var880 = var882
		var879 = var883
		
		if var880 == protoModule.wireTypes.varint then
			local _ = nil
			local var885, var886 = protoModule.readVarInt(p26, var879)
			local _ = var885
			var879 = var886
			continue
		end
		if var880 == protoModule.wireTypes.lengthDelimited then
			if var884 == 1 then
				local _ = nil
				local var887, var888 = protoModule.readBuffer(p26, var879)
				var879 = var888
				var878.universe_id = buffer.tostring(var887)
			elseif var884 == 2 then
				local _ = nil
				local var889, var890 = protoModule.readBuffer(p26, var879)
				var879 = var890
				var878.creator_key = buffer.tostring(var889)
			elseif var884 == 3 then
				local _ = nil
				local var891, var892 = protoModule.readBuffer(p26, var879)
				var879 = var892
				var891 = t.ExperienceDetailsFeedInputData_EntryMapEntry.decode(var891)
				var878.entry_map[var891.key or ""] = var891.value or t.FeedEntry.new()
			elseif var884 == 4 then
				local _ = nil
				local var893, var894 = protoModule.readBuffer(p26, var879)
				var879 = var894
				table.insert(var878.entry_order, buffer.tostring(var893))
			elseif var884 == 5 then
				local _ = nil
				local var895, var896 = protoModule.readBuffer(p26, var879)
				var879 = var896
				var895 = t.ExperienceDetailsFeedInputData_EntryOrderMapEntry.decode(var895)
				var878.entry_order_map[var895.key or ""] = var895.value or t.EntryOrder.new()
			else
				local _ = nil
				local var897, var898 = protoModule.readVarInt(p26, var879)
				var879 = var898 + var897
			end
		elseif var880 == protoModule.wireTypes.i32 then
			local _ = nil
			local var899, var900 = protoModule.readFixed32(p26, var879)
			local _ = var899
			var879 = var900
		elseif var880 == protoModule.wireTypes.i64 then
			local _ = nil
			local var901, var902 = protoModule.readFixed64(p26, var879)
			local _ = var901
			var879 = var902
		else
			error("Unsupported wire type: " .. var880)
		end
	end
	return var878
end

function t_14:jsonEncode() --[[ line: 7360 ]]
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

function t_14:jsonDecode() --[[ line: 7398 ]]
	-- upvalues: t_14 (ref), t (ref)
	local var907 = t_14.new()
	
	if self.universe_id ~= nil then
		var907.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var907.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var907.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var907.creator_key = self.creatorKey
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var907.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var907.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var907.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var907.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var907.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var907.entry_order_map = t_1
	end
	return var907
end

t_14.descriptor = {
	name = "ExperienceDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsFeedInputData"
}
t.ExperienceDetailsFeedInputData = t_14
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData)
local t_15 = {}
t_15.__index = t_15

function t_15.new(p27) --[[ line: 7488 ]]
	-- upvalues: t_15 (ref)
	return setmetatable({
		key = if p27 == nil or p27.key == nil then "" else p27.key,
		value = if p27 == nil or p27.value == nil then nil else p27.value
	}, t_15)
end

function t_15:encode() --[[ line: 7497 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var915 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var916, var917 = protoModule.writeTag(buff, var915, 1, protoModule.wireTypes.lengthDelimited)
		var916, var917 = protoModule.writeString(var916, var917, self.key)
		buff = var916
		var915 = var917
	end
	if self.value ~= nil then
		local var918 = self.value:encode()
		local var919, var920 = protoModule.writeTag(buff, var915, 2, protoModule.wireTypes.lengthDelimited)
		var919, var920 = protoModule.writeBuffer(var919, var920, var918, buffer.len(var918))
		buff = var919
		var915 = var920
	end
	local buff_1 = buffer.create(var915)
	buffer.copy(buff_1, 0, buff, 0, var915)
	
	return buff_1
end

function t_15.decode(p28) --[[ line: 7519 ]]
	-- upvalues: t_15 (ref), protoModule (ref), t (ref)
	local var922 = t_15.new()
	local var923 = 0
	while var923 < buffer.len(p28) do
		local _ = nil
		local var924 = nil
		local var925, var926, var927 = protoModule.readTag(p28, var923)
		local var928 = var925
		var924 = var926
		var923 = var927
		
		if var924 == protoModule.wireTypes.varint then
			local _ = nil
			local var929, var930 = protoModule.readVarInt(p28, var923)
			local _ = var929
			var923 = var930
			continue
		end
		if var924 == protoModule.wireTypes.lengthDelimited then
			if var928 == 1 then
				local _ = nil
				local var931, var932 = protoModule.readBuffer(p28, var923)
				var923 = var932
				var922.key = buffer.tostring(var931)
			elseif var928 == 2 then
				local _ = nil
				local var933, var934 = protoModule.readBuffer(p28, var923)
				var923 = var934
				var922.value = t.FeedEntry.decode(var933)
			else
				local _ = nil
				local var935, var936 = protoModule.readVarInt(p28, var923)
				var923 = var936 + var935
			end
		elseif var924 == protoModule.wireTypes.i32 then
			local _ = nil
			local var937, var938 = protoModule.readFixed32(p28, var923)
			local _ = var937
			var923 = var938
		elseif var924 == protoModule.wireTypes.i64 then
			local _ = nil
			local var939, var940 = protoModule.readFixed64(p28, var923)
			local _ = var939
			var923 = var940
		else
			error("Unsupported wire type: " .. var924)
		end
	end
	return var922
end

function t_15:jsonEncode() --[[ line: 7569 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_15:jsonDecode() --[[ line: 7585 ]]
	-- upvalues: t_15 (ref), t (ref)
	local var942 = t_15.new()
	
	if self.key ~= nil then
		var942.key = self.key
	end
	if self.value ~= nil then
		var942.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var942
end

t_15.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryMapEntry = t_15
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryMapEntry)
local t_16 = {}
t_16.__index = t_16

function t_16.new(p29) --[[ line: 7616 ]]
	-- upvalues: t_16 (ref)
	return setmetatable({
		key = if p29 == nil or p29.key == nil then "" else p29.key,
		value = if p29 == nil or p29.value == nil then nil else p29.value
	}, t_16)
end

function t_16:encode() --[[ line: 7628 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var944 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var945, var946 = protoModule.writeTag(buff, var944, 1, protoModule.wireTypes.lengthDelimited)
		var945, var946 = protoModule.writeString(var945, var946, self.key)
		buff = var945
		var944 = var946
	end
	if self.value ~= nil then
		local var947 = self.value:encode()
		local var948, var949 = protoModule.writeTag(buff, var944, 2, protoModule.wireTypes.lengthDelimited)
		var948, var949 = protoModule.writeBuffer(var948, var949, var947, buffer.len(var947))
		buff = var948
		var944 = var949
	end
	local buff_1 = buffer.create(var944)
	buffer.copy(buff_1, 0, buff, 0, var944)
	
	return buff_1
end

function t_16.decode(p30) --[[ line: 7650 ]]
	-- upvalues: t_16 (ref), protoModule (ref), t (ref)
	local var951 = t_16.new()
	local var952 = 0
	while var952 < buffer.len(p30) do
		local _ = nil
		local var953 = nil
		local var954, var955, var956 = protoModule.readTag(p30, var952)
		local var957 = var954
		var953 = var955
		var952 = var956
		
		if var953 == protoModule.wireTypes.varint then
			local _ = nil
			local var958, var959 = protoModule.readVarInt(p30, var952)
			local _ = var958
			var952 = var959
			continue
		end
		if var953 == protoModule.wireTypes.lengthDelimited then
			if var957 == 1 then
				local _ = nil
				local var960, var961 = protoModule.readBuffer(p30, var952)
				var952 = var961
				var951.key = buffer.tostring(var960)
			elseif var957 == 2 then
				local _ = nil
				local var962, var963 = protoModule.readBuffer(p30, var952)
				var952 = var963
				var951.value = t.EntryOrder.decode(var962)
			else
				local _ = nil
				local var964, var965 = protoModule.readVarInt(p30, var952)
				var952 = var965 + var964
			end
		elseif var953 == protoModule.wireTypes.i32 then
			local _ = nil
			local var966, var967 = protoModule.readFixed32(p30, var952)
			local _ = var966
			var952 = var967
		elseif var953 == protoModule.wireTypes.i64 then
			local _ = nil
			local var968, var969 = protoModule.readFixed64(p30, var952)
			local _ = var968
			var952 = var969
		else
			error("Unsupported wire type: " .. var953)
		end
	end
	return var951
end

function t_16:jsonEncode() --[[ line: 7700 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_16:jsonDecode() --[[ line: 7716 ]]
	-- upvalues: t_16 (ref), t (ref)
	local var971 = t_16.new()
	
	if self.key ~= nil then
		var971.key = self.key
	end
	if self.value ~= nil then
		var971.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var971
end

t_16.descriptor = {
	name = "ExperienceDetailsFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.ExperienceDetailsFeedInputData_EntryOrderMapEntry = t_16
typeRegistryModule.default:register(t.ExperienceDetailsFeedInputData_EntryOrderMapEntry)
local t_17 = {}
t_17.__index = t_17

function t_17.new(p31) --[[ line: 7747 ]]
	-- upvalues: t_17 (ref)
	return setmetatable({
		items = if p31 == nil or p31.items == nil then {} else p31.items
	}, t_17)
end

function t_17:encode() --[[ line: 7753 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var973 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var974, var975 = protoModule.writeTag(buff, var973, 1, protoModule.wireTypes.lengthDelimited)
			var974, var975 = protoModule.writeString(var974, var975, v)
			buff = var974
			var973 = var975
		end
	end
	local buff_1 = buffer.create(var973)
	buffer.copy(buff_1, 0, buff, 0, var973)
	
	return buff_1
end

function t_17.decode(p32) --[[ line: 7769 ]]
	-- upvalues: t_17 (ref), protoModule (ref)
	local var977 = t_17.new()
	local var978 = 0
	while var978 < buffer.len(p32) do
		local _ = nil
		local var979 = nil
		local var980, var981, var982 = protoModule.readTag(p32, var978)
		local var983 = var980
		var979 = var981
		var978 = var982
		
		if var979 == protoModule.wireTypes.varint then
			local _ = nil
			local var984, var985 = protoModule.readVarInt(p32, var978)
			local _ = var984
			var978 = var985
			continue
		end
		if var979 == protoModule.wireTypes.lengthDelimited then
			if var983 == 1 then
				local _ = nil
				local var986, var987 = protoModule.readBuffer(p32, var978)
				var978 = var987
				table.insert(var977.items, buffer.tostring(var986))
			else
				local _ = nil
				local var988, var989 = protoModule.readVarInt(p32, var978)
				var978 = var989 + var988
			end
		elseif var979 == protoModule.wireTypes.i32 then
			local _ = nil
			local var990, var991 = protoModule.readFixed32(p32, var978)
			local _ = var990
			var978 = var991
		elseif var979 == protoModule.wireTypes.i64 then
			local _ = nil
			local var992, var993 = protoModule.readFixed64(p32, var978)
			local _ = var992
			var978 = var993
		else
			error("Unsupported wire type: " .. var979)
		end
	end
	return var977
end

function t_17:jsonEncode() --[[ line: 7812 ]]
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

function t_17:jsonDecode() --[[ line: 7826 ]]
	-- upvalues: t_17 (ref)
	local var996 = t_17.new()
	
	if self.items ~= nil then
		local t = {}
		
		for i, v in self.items do
			table.insert(t, v)
		end
		var996.items = t
	end
	return var996
end

t_17.descriptor = {
	name = "EntryOrder",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrder"
}
t.EntryOrder = t_17
typeRegistryModule.default:register(t.EntryOrder)
local t_18 = {}
t_18.__index = t_18

function t_18.new(p33) --[[ line: 7855 ]]
	-- upvalues: t_18 (ref)
	return setmetatable({
		universe_id = if p33 == nil or p33.universe_id == nil then "" else p33.universe_id,
		user_owns_experience = if p33 == nil or p33.user_owns_experience == nil then false else p33.user_owns_experience
	}, t_18)
end

function t_18:encode() --[[ line: 7866 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var999 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1000, var1001 = protoModule.writeTag(buff, var999, 1, protoModule.wireTypes.lengthDelimited)
		var1000, var1001 = protoModule.writeString(var1000, var1001, self.universe_id)
		buff = var1000
		var999 = var1001
	end
	if self.user_owns_experience then
		local var1002, var1003 = protoModule.writeTag(buff, var999, 2, protoModule.wireTypes.varint)
		var1002, var1003 = protoModule.writeVarInt(var1002, var1003, if self.user_owns_experience then 1 else 0)
		buff = var1002
		var999 = var1003
	end
	local buff_1 = buffer.create(var999)
	buffer.copy(buff_1, 0, buff, 0, var999)
	
	return buff_1
end

function t_18.decode(p34) --[[ line: 7885 ]]
	-- upvalues: t_18 (ref), protoModule (ref)
	local var1005 = t_18.new()
	local var1006 = 0
	while var1006 < buffer.len(p34) do
		local _ = nil
		local var1007 = nil
		local var1008, var1009, var1010 = protoModule.readTag(p34, var1006)
		local var1011 = var1008
		var1007 = var1009
		var1006 = var1010
		
		if var1007 == protoModule.wireTypes.varint then
			if var1011 == 2 then
				local _ = nil
				local var1012, var1013 = protoModule.readVarInt(p34, var1006)
				var1006 = var1013
				var1005.user_owns_experience = var1012 ~= 0
			else
				local _ = nil
				local var1014, var1015 = protoModule.readVarInt(p34, var1006)
				local _ = var1014
				var1006 = var1015
			end
		end
		if var1007 == protoModule.wireTypes.lengthDelimited then
			if var1011 == 1 then
				local _ = nil
				local var1016, var1017 = protoModule.readBuffer(p34, var1006)
				var1006 = var1017
				var1005.universe_id = buffer.tostring(var1016)
			else
				local _ = nil
				local var1018, var1019 = protoModule.readVarInt(p34, var1006)
				var1006 = var1019 + var1018
			end
		elseif var1007 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1020, var1021 = protoModule.readFixed32(p34, var1006)
			local _ = var1020
			var1006 = var1021
		elseif var1007 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1022, var1023 = protoModule.readFixed64(p34, var1006)
			local _ = var1022
			var1006 = var1023
		else
			error("Unsupported wire type: " .. var1007)
		end
	end
	return var1005
end

function t_18:jsonEncode() --[[ line: 7933 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_18:jsonDecode() --[[ line: 7947 ]]
	-- upvalues: t_18 (ref)
	local var1025 = t_18.new()
	
	if self.universe_id ~= nil then
		var1025.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1025.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1025.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1025.user_owns_experience = self.userOwnsExperience
	end
	return var1025
end

t_18.descriptor = {
	name = "ExperienceDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsActionBarInputData"
}
t.ExperienceDetailsActionBarInputData = t_18
typeRegistryModule.default:register(t.ExperienceDetailsActionBarInputData)
local t_19 = {}
t_19.__index = t_19

function t_19.new(p35) --[[ line: 7985 ]]
	-- upvalues: t_19 (ref)
	return setmetatable({
		media_asset_id = if p35 == nil or p35.media_asset_id == nil then "" else p35.media_asset_id
	}, t_19)
end

function t_19:encode() --[[ line: 7993 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1027 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1028, var1029 = protoModule.writeTag(buff, var1027, 1, protoModule.wireTypes.lengthDelimited)
		var1028, var1029 = protoModule.writeString(var1028, var1029, self.media_asset_id)
		buff = var1028
		var1027 = var1029
	end
	local buff_1 = buffer.create(var1027)
	buffer.copy(buff_1, 0, buff, 0, var1027)
	
	return buff_1
end

function t_19.decode(p36) --[[ line: 8007 ]]
	-- upvalues: t_19 (ref), protoModule (ref)
	local var1031 = t_19.new()
	local var1032 = 0
	while var1032 < buffer.len(p36) do
		local _ = nil
		local var1033 = nil
		local var1034, var1035, var1036 = protoModule.readTag(p36, var1032)
		local var1037 = var1034
		var1033 = var1035
		var1032 = var1036
		
		if var1033 == protoModule.wireTypes.varint then
			local _ = nil
			local var1038, var1039 = protoModule.readVarInt(p36, var1032)
			local _ = var1038
			var1032 = var1039
			continue
		end
		if var1033 == protoModule.wireTypes.lengthDelimited then
			if var1037 == 1 then
				local _ = nil
				local var1040, var1041 = protoModule.readBuffer(p36, var1032)
				var1032 = var1041
				var1031.media_asset_id = buffer.tostring(var1040)
			else
				local _ = nil
				local var1042, var1043 = protoModule.readVarInt(p36, var1032)
				var1032 = var1043 + var1042
			end
		elseif var1033 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1044, var1045 = protoModule.readFixed32(p36, var1032)
			local _ = var1044
			var1032 = var1045
		elseif var1033 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1046, var1047 = protoModule.readFixed64(p36, var1032)
			local _ = var1046
			var1032 = var1047
		else
			error("Unsupported wire type: " .. var1033)
		end
	end
	return var1031
end

function t_19:jsonEncode() --[[ line: 8050 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_19:jsonDecode() --[[ line: 8060 ]]
	-- upvalues: t_19 (ref)
	local var1049 = t_19.new()
	
	if self.media_asset_id ~= nil then
		var1049.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1049.media_asset_id = self.mediaAssetId
	end
	return var1049
end

t_19.descriptor = {
	name = "ExperienceDetailsBannerImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsBannerImageInputData"
}
t.ExperienceDetailsBannerImageInputData = t_19
typeRegistryModule.default:register(t.ExperienceDetailsBannerImageInputData)
local t_20 = {}
t_20.__index = t_20

function t_20.new(p37) --[[ line: 8090 ]]
	-- upvalues: t_20 (ref)
	return setmetatable({
		universe_id = if p37 == nil or p37.universe_id == nil then "" else p37.universe_id
	}, t_20)
end

function t_20:encode() --[[ line: 8098 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1051 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1052, var1053 = protoModule.writeTag(buff, var1051, 1, protoModule.wireTypes.lengthDelimited)
		var1052, var1053 = protoModule.writeString(var1052, var1053, self.universe_id)
		buff = var1052
		var1051 = var1053
	end
	local buff_1 = buffer.create(var1051)
	buffer.copy(buff_1, 0, buff, 0, var1051)
	
	return buff_1
end

function t_20.decode(p38) --[[ line: 8112 ]]
	-- upvalues: t_20 (ref), protoModule (ref)
	local var1055 = t_20.new()
	local var1056 = 0
	while var1056 < buffer.len(p38) do
		local _ = nil
		local var1057 = nil
		local var1058, var1059, var1060 = protoModule.readTag(p38, var1056)
		local var1061 = var1058
		var1057 = var1059
		var1056 = var1060
		
		if var1057 == protoModule.wireTypes.varint then
			local _ = nil
			local var1062, var1063 = protoModule.readVarInt(p38, var1056)
			local _ = var1062
			var1056 = var1063
			continue
		end
		if var1057 == protoModule.wireTypes.lengthDelimited then
			if var1061 == 1 then
				local _ = nil
				local var1064, var1065 = protoModule.readBuffer(p38, var1056)
				var1056 = var1065
				var1055.universe_id = buffer.tostring(var1064)
			else
				local _ = nil
				local var1066, var1067 = protoModule.readVarInt(p38, var1056)
				var1056 = var1067 + var1066
			end
		elseif var1057 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1068, var1069 = protoModule.readFixed32(p38, var1056)
			local _ = var1068
			var1056 = var1069
		elseif var1057 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1070, var1071 = protoModule.readFixed64(p38, var1056)
			local _ = var1070
			var1056 = var1071
		else
			error("Unsupported wire type: " .. var1057)
		end
	end
	return var1055
end

function t_20:jsonEncode() --[[ line: 8155 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_20:jsonDecode() --[[ line: 8165 ]]
	-- upvalues: t_20 (ref)
	local var1073 = t_20.new()
	
	if self.universe_id ~= nil then
		var1073.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1073.universe_id = self.universeId
	end
	return var1073
end

t_20.descriptor = {
	name = "ExperienceDetailsStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDetailsStickyHeaderInputData"
}
t.ExperienceDetailsStickyHeaderInputData = t_20
typeRegistryModule.default:register(t.ExperienceDetailsStickyHeaderInputData)
local t_21 = {}
t_21.__index = t_21

function t_21.new(p39) --[[ line: 8195 ]]
	-- upvalues: t_21 (ref)
	return setmetatable({
		universe_id = if p39 == nil or p39.universe_id == nil then "" else p39.universe_id,
		creator_key = if p39 == nil or p39.creator_key == nil then "" else p39.creator_key
	}, t_21)
end

function t_21:encode() --[[ line: 8204 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1075 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1076, var1077 = protoModule.writeTag(buff, var1075, 1, protoModule.wireTypes.lengthDelimited)
		var1076, var1077 = protoModule.writeString(var1076, var1077, self.universe_id)
		buff = var1076
		var1075 = var1077
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1078, var1079 = protoModule.writeTag(buff, var1075, 2, protoModule.wireTypes.lengthDelimited)
		var1078, var1079 = protoModule.writeString(var1078, var1079, self.creator_key)
		buff = var1078
		var1075 = var1079
	end
	local buff_1 = buffer.create(var1075)
	buffer.copy(buff_1, 0, buff, 0, var1075)
	
	return buff_1
end

function t_21.decode(p40) --[[ line: 8223 ]]
	-- upvalues: t_21 (ref), protoModule (ref)
	local var1081 = t_21.new()
	local var1082 = 0
	while var1082 < buffer.len(p40) do
		local _ = nil
		local var1083 = nil
		local var1084, var1085, var1086 = protoModule.readTag(p40, var1082)
		local var1087 = var1084
		var1083 = var1085
		var1082 = var1086
		
		if var1083 == protoModule.wireTypes.varint then
			local _ = nil
			local var1088, var1089 = protoModule.readVarInt(p40, var1082)
			local _ = var1088
			var1082 = var1089
			continue
		end
		if var1083 == protoModule.wireTypes.lengthDelimited then
			if var1087 == 1 then
				local _ = nil
				local var1090, var1091 = protoModule.readBuffer(p40, var1082)
				var1082 = var1091
				var1081.universe_id = buffer.tostring(var1090)
			elseif var1087 == 2 then
				local _ = nil
				local var1092, var1093 = protoModule.readBuffer(p40, var1082)
				var1082 = var1093
				var1081.creator_key = buffer.tostring(var1092)
			else
				local _ = nil
				local var1094, var1095 = protoModule.readVarInt(p40, var1082)
				var1082 = var1095 + var1094
			end
		elseif var1083 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1096, var1097 = protoModule.readFixed32(p40, var1082)
			local _ = var1096
			var1082 = var1097
		elseif var1083 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1098, var1099 = protoModule.readFixed64(p40, var1082)
			local _ = var1098
			var1082 = var1099
		else
			error("Unsupported wire type: " .. var1083)
		end
	end
	return var1081
end

function t_21:jsonEncode() --[[ line: 8271 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		t.creatorKey = self.creator_key
	end
	return t
end

function t_21:jsonDecode() --[[ line: 8285 ]]
	-- upvalues: t_21 (ref)
	local var1101 = t_21.new()
	
	if self.universe_id ~= nil then
		var1101.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1101.universe_id = self.universeId
	end
	if self.creator_key ~= nil then
		var1101.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1101.creator_key = self.creatorKey
	end
	return var1101
end

t_21.descriptor = {
	name = "ExperienceAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceAttributionRowInputData"
}
t.ExperienceAttributionRowInputData = t_21
typeRegistryModule.default:register(t.ExperienceAttributionRowInputData)
local t_22 = {}
t_22.__index = t_22

function t_22.new(p41) --[[ line: 8323 ]]
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

function t_22:encode() --[[ line: 8345 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1103 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1104, var1105 = protoModule.writeTag(buff, var1103, 1, protoModule.wireTypes.lengthDelimited)
		var1104, var1105 = protoModule.writeString(var1104, var1105, self.universe_id)
		buff = var1104
		var1103 = var1105
	end
	if self.root_place_id ~= nil and self.root_place_id ~= "" then
		local var1106, var1107 = protoModule.writeTag(buff, var1103, 2, protoModule.wireTypes.lengthDelimited)
		var1106, var1107 = protoModule.writeString(var1106, var1107, self.root_place_id)
		buff = var1106
		var1103 = var1107
	end
	if self.connection_played_display_name ~= nil and self.connection_played_display_name ~= "" then
		local var1108, var1109 = protoModule.writeTag(buff, var1103, 3, protoModule.wireTypes.lengthDelimited)
		var1108, var1109 = protoModule.writeString(var1108, var1109, self.connection_played_display_name)
		buff = var1108
		var1103 = var1109
	end
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var1110, var1111 = protoModule.writeTag(buff, var1103, 4, protoModule.wireTypes.lengthDelimited)
		var1110, var1111 = protoModule.writeString(var1110, var1111, self.upsell_prompt)
		buff = var1110
		var1103 = var1111
	end
	if self.connection_played_users ~= nil and #self.connection_played_users > 0 then
		for i, v in self.connection_played_users do
			local var1112 = v:encode()
			local var1113, var1114 = protoModule.writeTag(buff, var1103, 5, protoModule.wireTypes.lengthDelimited)
			var1113, var1114 = protoModule.writeBuffer(var1113, var1114, var1112, buffer.len(var1112))
			buff = var1113
			var1103 = var1114
		end
	end
	if self.connection_played_num_others ~= nil and self.connection_played_num_others ~= 0 then
		local var1115, var1116 = protoModule.writeTag(buff, var1103, 6, protoModule.wireTypes.varint)
		var1115, var1116 = protoModule.writeVarInt(var1115, var1116, self.connection_played_num_others)
		buff = var1115
		var1103 = var1116
	end
	if self.connection_played_total_count ~= nil and self.connection_played_total_count ~= 0 then
		local var1117, var1118 = protoModule.writeTag(buff, var1103, 7, protoModule.wireTypes.varint)
		var1117, var1118 = protoModule.writeVarInt(var1117, var1118, self.connection_played_total_count)
		buff = var1117
		var1103 = var1118
	end
	local buff_1 = buffer.create(var1103)
	buffer.copy(buff_1, 0, buff, 0, var1103)
	
	return buff_1
end

function t_22.decode(p42) --[[ line: 8392 ]]
	-- upvalues: t_22 (ref), protoModule (ref), t (ref)
	local var1120 = t_22.new()
	local var1121 = 0
	while var1121 < buffer.len(p42) do
		local _ = nil
		local var1122 = nil
		local var1123, var1124, var1125 = protoModule.readTag(p42, var1121)
		local var1126 = var1123
		var1122 = var1124
		var1121 = var1125
		
		if var1122 == protoModule.wireTypes.varint then
			if var1126 == 6 then
				local _ = nil
				local var1127, var1128 = protoModule.readVarIntI32(p42, var1121)
				var1121 = var1128
				var1120.connection_played_num_others = var1127
			elseif var1126 == 7 then
				local _ = nil
				local var1129, var1130 = protoModule.readVarIntI32(p42, var1121)
				var1121 = var1130
				var1120.connection_played_total_count = var1129
			else
				local _ = nil
				local var1131, var1132 = protoModule.readVarInt(p42, var1121)
				local _ = var1131
				var1121 = var1132
			end
		end
		if var1122 == protoModule.wireTypes.lengthDelimited then
			if var1126 == 1 then
				local _ = nil
				local var1133, var1134 = protoModule.readBuffer(p42, var1121)
				var1121 = var1134
				var1120.universe_id = buffer.tostring(var1133)
			elseif var1126 == 2 then
				local _ = nil
				local var1135, var1136 = protoModule.readBuffer(p42, var1121)
				var1121 = var1136
				var1120.root_place_id = buffer.tostring(var1135)
			elseif var1126 == 3 then
				local _ = nil
				local var1137, var1138 = protoModule.readBuffer(p42, var1121)
				var1121 = var1138
				var1120.connection_played_display_name = buffer.tostring(var1137)
			elseif var1126 == 4 then
				local _ = nil
				local var1139, var1140 = protoModule.readBuffer(p42, var1121)
				var1121 = var1140
				var1120.upsell_prompt = buffer.tostring(var1139)
			elseif var1126 == 5 then
				local _ = nil
				local var1141, var1142 = protoModule.readBuffer(p42, var1121)
				var1121 = var1142
				table.insert(var1120.connection_played_users, t.ExperienceActionModuleInputData_ConnectionPlayedUser.decode(var1141))
			else
				local _ = nil
				local var1143, var1144 = protoModule.readVarInt(p42, var1121)
				var1121 = var1144 + var1143
			end
		elseif var1122 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1145, var1146 = protoModule.readFixed32(p42, var1121)
			local _ = var1145
			var1121 = var1146
		elseif var1122 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1147, var1148 = protoModule.readFixed64(p42, var1121)
			local _ = var1147
			var1121 = var1148
		else
			error("Unsupported wire type: " .. var1122)
		end
	end
	return var1120
end

function t_22:jsonEncode() --[[ line: 8468 ]]
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

function t_22:jsonDecode() --[[ line: 8506 ]]
	-- upvalues: t_22 (ref), t (ref)
	local var1151 = t_22.new()
	
	if self.universe_id ~= nil then
		var1151.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1151.universe_id = self.universeId
	end
	if self.root_place_id ~= nil then
		var1151.root_place_id = self.root_place_id
	end
	if self.rootPlaceId ~= nil then
		var1151.root_place_id = self.rootPlaceId
	end
	if self.connection_played_display_name ~= nil then
		var1151.connection_played_display_name = self.connection_played_display_name
	end
	if self.connectionPlayedDisplayName ~= nil then
		var1151.connection_played_display_name = self.connectionPlayedDisplayName
	end
	if self.upsell_prompt ~= nil then
		var1151.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var1151.upsell_prompt = self.upsellPrompt
	end
	if self.connection_played_users ~= nil then
		local t_1 = {}
		
		for i, v in self.connection_played_users do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1151.connection_played_users = t_1
	end
	if self.connectionPlayedUsers ~= nil then
		local t_1 = {}
		
		for i, v in self.connectionPlayedUsers do
			table.insert(t_1, t.ExperienceActionModuleInputData_ConnectionPlayedUser.jsonDecode(v))
		end
		var1151.connection_played_users = t_1
	end
	if self.connection_played_num_others ~= nil then
		var1151.connection_played_num_others = self.connection_played_num_others
	end
	if self.connectionPlayedNumOthers ~= nil then
		var1151.connection_played_num_others = self.connectionPlayedNumOthers
	end
	if self.connection_played_total_count ~= nil then
		var1151.connection_played_total_count = self.connection_played_total_count
	end
	if self.connectionPlayedTotalCount ~= nil then
		var1151.connection_played_total_count = self.connectionPlayedTotalCount
	end
	return var1151
end

t_22.descriptor = {
	name = "ExperienceActionModuleInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceActionModuleInputData"
}
t.ExperienceActionModuleInputData = t_22
typeRegistryModule.default:register(t.ExperienceActionModuleInputData)
local t_23 = {}
t_23.__index = t_23

function t_23.new(p43) --[[ line: 8593 ]]
	-- upvalues: t_23 (ref)
	return setmetatable({
		user_id = if p43 == nil or p43.user_id == nil then "" else p43.user_id
	}, t_23)
end

function t_23:encode() --[[ line: 8604 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1155 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var1156, var1157 = protoModule.writeTag(buff, var1155, 1, protoModule.wireTypes.lengthDelimited)
		var1156, var1157 = protoModule.writeString(var1156, var1157, self.user_id)
		buff = var1156
		var1155 = var1157
	end
	local buff_1 = buffer.create(var1155)
	buffer.copy(buff_1, 0, buff, 0, var1155)
	
	return buff_1
end

function t_23.decode(p44) --[[ line: 8620 ]]
	-- upvalues: t_23 (ref), protoModule (ref)
	local var1159 = t_23.new()
	local var1160 = 0
	while var1160 < buffer.len(p44) do
		local _ = nil
		local var1161 = nil
		local var1162, var1163, var1164 = protoModule.readTag(p44, var1160)
		local var1165 = var1162
		var1161 = var1163
		var1160 = var1164
		
		if var1161 == protoModule.wireTypes.varint then
			local _ = nil
			local var1166, var1167 = protoModule.readVarInt(p44, var1160)
			local _ = var1166
			var1160 = var1167
			continue
		end
		if var1161 == protoModule.wireTypes.lengthDelimited then
			if var1165 == 1 then
				local _ = nil
				local var1168, var1169 = protoModule.readBuffer(p44, var1160)
				var1160 = var1169
				var1159.user_id = buffer.tostring(var1168)
			else
				local _ = nil
				local var1170, var1171 = protoModule.readVarInt(p44, var1160)
				var1160 = var1171 + var1170
			end
		elseif var1161 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1172, var1173 = protoModule.readFixed32(p44, var1160)
			local _ = var1172
			var1160 = var1173
		elseif var1161 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1174, var1175 = protoModule.readFixed64(p44, var1160)
			local _ = var1174
			var1160 = var1175
		else
			error("Unsupported wire type: " .. var1161)
		end
	end
	return var1159
end

function t_23:jsonEncode() --[[ line: 8665 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_23:jsonDecode() --[[ line: 8677 ]]
	-- upvalues: t_23 (ref)
	local var1177 = t_23.new()
	
	if self.user_id ~= nil then
		var1177.user_id = self.user_id
	end
	if self.userId ~= nil then
		var1177.user_id = self.userId
	end
	return var1177
end

t_23.descriptor = {
	name = "ExperienceActionModuleInputData_ConnectionPlayedUser",
	fullName = "roblox.apppageplatform.shared.v1beta1.ConnectionPlayedUser"
}
t.ExperienceActionModuleInputData_ConnectionPlayedUser = t_23
typeRegistryModule.default:register(t.ExperienceActionModuleInputData_ConnectionPlayedUser)
local t_24 = {}
t_24.__index = t_24

function t_24.new(p45) --[[ line: 8708 ]]
	-- upvalues: t_24 (ref)
	return setmetatable({
		media_items = if p45 == nil or p45.media_items == nil then {} else p45.media_items,
		universe_id = if p45 == nil or p45.universe_id == nil then "" else p45.universe_id,
		place_id = if p45 == nil or p45.place_id == nil then "" else p45.place_id
	}, t_24)
end

function t_24:encode() --[[ line: 8718 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1179 = 0
	
	if self.media_items ~= nil and #self.media_items > 0 then
		for i, v in self.media_items do
			local var1180 = v:encode()
			local var1181, var1182 = protoModule.writeTag(buff, var1179, 1, protoModule.wireTypes.lengthDelimited)
			var1181, var1182 = protoModule.writeBuffer(var1181, var1182, var1180, buffer.len(var1180))
			buff = var1181
			var1179 = var1182
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1183, var1184 = protoModule.writeTag(buff, var1179, 2, protoModule.wireTypes.lengthDelimited)
		var1183, var1184 = protoModule.writeString(var1183, var1184, self.universe_id)
		buff = var1183
		var1179 = var1184
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1185, var1186 = protoModule.writeTag(buff, var1179, 3, protoModule.wireTypes.lengthDelimited)
		var1185, var1186 = protoModule.writeString(var1185, var1186, self.place_id)
		buff = var1185
		var1179 = var1186
	end
	local buff_1 = buffer.create(var1179)
	buffer.copy(buff_1, 0, buff, 0, var1179)
	
	return buff_1
end

function t_24.decode(p46) --[[ line: 8745 ]]
	-- upvalues: t_24 (ref), protoModule (ref), t (ref)
	local var1188 = t_24.new()
	local var1189 = 0
	while var1189 < buffer.len(p46) do
		local _ = nil
		local var1190 = nil
		local var1191, var1192, var1193 = protoModule.readTag(p46, var1189)
		local var1194 = var1191
		var1190 = var1192
		var1189 = var1193
		
		if var1190 == protoModule.wireTypes.varint then
			local _ = nil
			local var1195, var1196 = protoModule.readVarInt(p46, var1189)
			local _ = var1195
			var1189 = var1196
			continue
		end
		if var1190 == protoModule.wireTypes.lengthDelimited then
			if var1194 == 1 then
				local _ = nil
				local var1197, var1198 = protoModule.readBuffer(p46, var1189)
				var1189 = var1198
				table.insert(var1188.media_items, t.ExperienceMediaGalleryInputData_MediaItem.decode(var1197))
			elseif var1194 == 2 then
				local _ = nil
				local var1199, var1200 = protoModule.readBuffer(p46, var1189)
				var1189 = var1200
				var1188.universe_id = buffer.tostring(var1199)
			elseif var1194 == 3 then
				local _ = nil
				local var1201, var1202 = protoModule.readBuffer(p46, var1189)
				var1189 = var1202
				var1188.place_id = buffer.tostring(var1201)
			else
				local _ = nil
				local var1203, var1204 = protoModule.readVarInt(p46, var1189)
				var1189 = var1204 + var1203
			end
		elseif var1190 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1205, var1206 = protoModule.readFixed32(p46, var1189)
			local _ = var1205
			var1189 = var1206
		elseif var1190 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1207, var1208 = protoModule.readFixed64(p46, var1189)
			local _ = var1207
			var1189 = var1208
		else
			error("Unsupported wire type: " .. var1190)
		end
	end
	return var1188
end

function t_24:jsonEncode() --[[ line: 8798 ]]
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

function t_24:jsonDecode() --[[ line: 8820 ]]
	-- upvalues: t_24 (ref), t (ref)
	local var1211 = t_24.new()
	
	if self.media_items ~= nil then
		local t_1 = {}
		
		for i, v in self.media_items do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1211.media_items = t_1
	end
	if self.mediaItems ~= nil then
		local t_1 = {}
		
		for i, v in self.mediaItems do
			table.insert(t_1, t.ExperienceMediaGalleryInputData_MediaItem.jsonDecode(v))
		end
		var1211.media_items = t_1
	end
	if self.universe_id ~= nil then
		var1211.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1211.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1211.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1211.place_id = self.placeId
	end
	return var1211
end

t_24.descriptor = {
	name = "ExperienceMediaGalleryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceMediaGalleryInputData"
}
t.ExperienceMediaGalleryInputData = t_24
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData)
local t_25 = {}
t_25.__index = t_25

function t_25.new(p47) --[[ line: 8874 ]]
	-- upvalues: t_25 (ref)
	return setmetatable({
		media_asset_id = if p47 == nil or p47.media_asset_id == nil then "" else p47.media_asset_id
	}, t_25)
end

function t_25:encode() --[[ line: 8882 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1215 = 0
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		local var1216, var1217 = protoModule.writeTag(buff, var1215, 1, protoModule.wireTypes.lengthDelimited)
		var1216, var1217 = protoModule.writeString(var1216, var1217, self.media_asset_id)
		buff = var1216
		var1215 = var1217
	end
	local buff_1 = buffer.create(var1215)
	buffer.copy(buff_1, 0, buff, 0, var1215)
	
	return buff_1
end

function t_25.decode(p48) --[[ line: 8898 ]]
	-- upvalues: t_25 (ref), protoModule (ref)
	local var1219 = t_25.new()
	local var1220 = 0
	while var1220 < buffer.len(p48) do
		local _ = nil
		local var1221 = nil
		local var1222, var1223, var1224 = protoModule.readTag(p48, var1220)
		local var1225 = var1222
		var1221 = var1223
		var1220 = var1224
		
		if var1221 == protoModule.wireTypes.varint then
			local _ = nil
			local var1226, var1227 = protoModule.readVarInt(p48, var1220)
			local _ = var1226
			var1220 = var1227
			continue
		end
		if var1221 == protoModule.wireTypes.lengthDelimited then
			if var1225 == 1 then
				local _ = nil
				local var1228, var1229 = protoModule.readBuffer(p48, var1220)
				var1220 = var1229
				var1219.media_asset_id = buffer.tostring(var1228)
			else
				local _ = nil
				local var1230, var1231 = protoModule.readVarInt(p48, var1220)
				var1220 = var1231 + var1230
			end
		elseif var1221 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1232, var1233 = protoModule.readFixed32(p48, var1220)
			local _ = var1232
			var1220 = var1233
		elseif var1221 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1234, var1235 = protoModule.readFixed64(p48, var1220)
			local _ = var1234
			var1220 = var1235
		else
			error("Unsupported wire type: " .. var1221)
		end
	end
	return var1219
end

function t_25:jsonEncode() --[[ line: 8943 ]]
	local t = {}
	
	if self.media_asset_id ~= nil and self.media_asset_id ~= "" then
		t.mediaAssetId = self.media_asset_id
	end
	return t
end

function t_25:jsonDecode() --[[ line: 8955 ]]
	-- upvalues: t_25 (ref)
	local var1237 = t_25.new()
	
	if self.media_asset_id ~= nil then
		var1237.media_asset_id = self.media_asset_id
	end
	if self.mediaAssetId ~= nil then
		var1237.media_asset_id = self.mediaAssetId
	end
	return var1237
end

t_25.descriptor = {
	name = "ExperienceMediaGalleryInputData_MediaItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MediaItem"
}
t.ExperienceMediaGalleryInputData_MediaItem = t_25
typeRegistryModule.default:register(t.ExperienceMediaGalleryInputData_MediaItem)
local t_26 = {}
t_26.__index = t_26

function t_26.new(p49) --[[ line: 8985 ]]
	-- upvalues: t_26 (ref)
	return setmetatable({
		universe_id = if p49 == nil or p49.universe_id == nil then "" else p49.universe_id
	}, t_26)
end

function t_26:encode() --[[ line: 8993 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1239 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1240, var1241 = protoModule.writeTag(buff, var1239, 1, protoModule.wireTypes.lengthDelimited)
		var1240, var1241 = protoModule.writeString(var1240, var1241, self.universe_id)
		buff = var1240
		var1239 = var1241
	end
	local buff_1 = buffer.create(var1239)
	buffer.copy(buff_1, 0, buff, 0, var1239)
	
	return buff_1
end

function t_26.decode(p50) --[[ line: 9007 ]]
	-- upvalues: t_26 (ref), protoModule (ref)
	local var1243 = t_26.new()
	local var1244 = 0
	while var1244 < buffer.len(p50) do
		local _ = nil
		local var1245 = nil
		local var1246, var1247, var1248 = protoModule.readTag(p50, var1244)
		local var1249 = var1246
		var1245 = var1247
		var1244 = var1248
		
		if var1245 == protoModule.wireTypes.varint then
			local _ = nil
			local var1250, var1251 = protoModule.readVarInt(p50, var1244)
			local _ = var1250
			var1244 = var1251
			continue
		end
		if var1245 == protoModule.wireTypes.lengthDelimited then
			if var1249 == 1 then
				local _ = nil
				local var1252, var1253 = protoModule.readBuffer(p50, var1244)
				var1244 = var1253
				var1243.universe_id = buffer.tostring(var1252)
			else
				local _ = nil
				local var1254, var1255 = protoModule.readVarInt(p50, var1244)
				var1244 = var1255 + var1254
			end
		elseif var1245 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1256, var1257 = protoModule.readFixed32(p50, var1244)
			local _ = var1256
			var1244 = var1257
		elseif var1245 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1258, var1259 = protoModule.readFixed64(p50, var1244)
			local _ = var1258
			var1244 = var1259
		else
			error("Unsupported wire type: " .. var1245)
		end
	end
	return var1243
end

function t_26:jsonEncode() --[[ line: 9050 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_26:jsonDecode() --[[ line: 9060 ]]
	-- upvalues: t_26 (ref)
	local var1261 = t_26.new()
	
	if self.universe_id ~= nil then
		var1261.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1261.universe_id = self.universeId
	end
	return var1261
end

t_26.descriptor = {
	name = "ExperienceDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceDescriptionInputData"
}
t.ExperienceDescriptionInputData = t_26
typeRegistryModule.default:register(t.ExperienceDescriptionInputData)
local t_27 = {}
t_27.__index = t_27

function t_27.new(p51) --[[ line: 9088 ]]
	-- upvalues: t_27 (ref)
	return setmetatable({
		universe_id = if p51 == nil or p51.universe_id == nil then "" else p51.universe_id
	}, t_27)
end

function t_27:encode() --[[ line: 9096 ]]
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

function t_27.decode(p52) --[[ line: 9110 ]]
	-- upvalues: t_27 (ref), protoModule (ref)
	local var1267 = t_27.new()
	local var1268 = 0
	while var1268 < buffer.len(p52) do
		local _ = nil
		local var1269 = nil
		local var1270, var1271, var1272 = protoModule.readTag(p52, var1268)
		local var1273 = var1270
		var1269 = var1271
		var1268 = var1272
		
		if var1269 == protoModule.wireTypes.varint then
			local _ = nil
			local var1274, var1275 = protoModule.readVarInt(p52, var1268)
			local _ = var1274
			var1268 = var1275
			continue
		end
		if var1269 == protoModule.wireTypes.lengthDelimited then
			if var1273 == 1 then
				local _ = nil
				local var1276, var1277 = protoModule.readBuffer(p52, var1268)
				var1268 = var1277
				var1267.universe_id = buffer.tostring(var1276)
			else
				local _ = nil
				local var1278, var1279 = protoModule.readVarInt(p52, var1268)
				var1268 = var1279 + var1278
			end
		elseif var1269 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1280, var1281 = protoModule.readFixed32(p52, var1268)
			local _ = var1280
			var1268 = var1281
		elseif var1269 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1282, var1283 = protoModule.readFixed64(p52, var1268)
			local _ = var1282
			var1268 = var1283
		else
			error("Unsupported wire type: " .. var1269)
		end
	end
	return var1267
end

function t_27:jsonEncode() --[[ line: 9153 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_27:jsonDecode() --[[ line: 9163 ]]
	-- upvalues: t_27 (ref)
	local var1285 = t_27.new()
	
	if self.universe_id ~= nil then
		var1285.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1285.universe_id = self.universeId
	end
	return var1285
end

t_27.descriptor = {
	name = "ExperienceStatRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceStatRowInputData"
}
t.ExperienceStatRowInputData = t_27
typeRegistryModule.default:register(t.ExperienceStatRowInputData)
local t_28 = {}
t_28.__index = t_28

function t_28.new(p53) --[[ line: 9191 ]]
	-- upvalues: t_28 (ref)
	return setmetatable({
		universe_id = if p53 == nil or p53.universe_id == nil then "" else p53.universe_id,
		has_store_items = if p53 == nil or p53.has_store_items == nil then false else p53.has_store_items,
		has_badges = if p53 == nil or p53.has_badges == nil then false else p53.has_badges,
		has_game_passes = if p53 == nil or p53.has_game_passes == nil then false else p53.has_game_passes
	}, t_28)
end

function t_28:encode() --[[ line: 9202 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1287 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1288, var1289 = protoModule.writeTag(buff, var1287, 1, protoModule.wireTypes.lengthDelimited)
		var1288, var1289 = protoModule.writeString(var1288, var1289, self.universe_id)
		buff = var1288
		var1287 = var1289
	end
	if self.has_store_items then
		local var1290, var1291 = protoModule.writeTag(buff, var1287, 2, protoModule.wireTypes.varint)
		var1290, var1291 = protoModule.writeVarInt(var1290, var1291, if self.has_store_items then 1 else 0)
		buff = var1290
		var1287 = var1291
	end
	if self.has_badges then
		local var1292, var1293 = protoModule.writeTag(buff, var1287, 3, protoModule.wireTypes.varint)
		var1292, var1293 = protoModule.writeVarInt(var1292, var1293, if self.has_badges then 1 else 0)
		buff = var1292
		var1287 = var1293
	end
	if self.has_game_passes then
		local var1294, var1295 = protoModule.writeTag(buff, var1287, 4, protoModule.wireTypes.varint)
		var1294, var1295 = protoModule.writeVarInt(var1294, var1295, if self.has_game_passes then 1 else 0)
		buff = var1294
		var1287 = var1295
	end
	local buff_1 = buffer.create(var1287)
	buffer.copy(buff_1, 0, buff, 0, var1287)
	
	return buff_1
end

function t_28.decode(p54) --[[ line: 9231 ]]
	-- upvalues: t_28 (ref), protoModule (ref)
	local var1297 = t_28.new()
	local var1298 = 0
	while var1298 < buffer.len(p54) do
		local _ = nil
		local var1299 = nil
		local var1300, var1301, var1302 = protoModule.readTag(p54, var1298)
		local var1303 = var1300
		var1299 = var1301
		var1298 = var1302
		
		if var1299 == protoModule.wireTypes.varint then
			if var1303 == 2 then
				local _ = nil
				local var1304, var1305 = protoModule.readVarInt(p54, var1298)
				var1298 = var1305
				var1297.has_store_items = var1304 ~= 0
			elseif var1303 == 3 then
				local _ = nil
				local var1306, var1307 = protoModule.readVarInt(p54, var1298)
				var1298 = var1307
				var1297.has_badges = var1306 ~= 0
			elseif var1303 == 4 then
				local _ = nil
				local var1308, var1309 = protoModule.readVarInt(p54, var1298)
				var1298 = var1309
				var1297.has_game_passes = var1308 ~= 0
			else
				local _ = nil
				local var1310, var1311 = protoModule.readVarInt(p54, var1298)
				local _ = var1310
				var1298 = var1311
			end
		end
		if var1299 == protoModule.wireTypes.lengthDelimited then
			if var1303 == 1 then
				local _ = nil
				local var1312, var1313 = protoModule.readBuffer(p54, var1298)
				var1298 = var1313
				var1297.universe_id = buffer.tostring(var1312)
			else
				local _ = nil
				local var1314, var1315 = protoModule.readVarInt(p54, var1298)
				var1298 = var1315 + var1314
			end
		elseif var1299 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1316, var1317 = protoModule.readFixed32(p54, var1298)
			local _ = var1316
			var1298 = var1317
		elseif var1299 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1318, var1319 = protoModule.readFixed64(p54, var1298)
			local _ = var1318
			var1298 = var1319
		else
			error("Unsupported wire type: " .. var1299)
		end
	end
	return var1297
end

function t_28:jsonEncode() --[[ line: 9289 ]]
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

function t_28:jsonDecode() --[[ line: 9311 ]]
	-- upvalues: t_28 (ref)
	local var1321 = t_28.new()
	
	if self.universe_id ~= nil then
		var1321.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1321.universe_id = self.universeId
	end
	if self.has_store_items ~= nil then
		var1321.has_store_items = self.has_store_items
	end
	if self.hasStoreItems ~= nil then
		var1321.has_store_items = self.hasStoreItems
	end
	if self.has_badges ~= nil then
		var1321.has_badges = self.has_badges
	end
	if self.hasBadges ~= nil then
		var1321.has_badges = self.hasBadges
	end
	if self.has_game_passes ~= nil then
		var1321.has_game_passes = self.has_game_passes
	end
	if self.hasGamePasses ~= nil then
		var1321.has_game_passes = self.hasGamePasses
	end
	return var1321
end

t_28.descriptor = {
	name = "ExperienceInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceInfoTableInputData"
}
t.ExperienceInfoTableInputData = t_28
typeRegistryModule.default:register(t.ExperienceInfoTableInputData)
local t_29 = {}
t_29.__index = t_29

function t_29.new(p55) --[[ line: 9363 ]]
	-- upvalues: t_29 (ref)
	return setmetatable({
		universe_id = if p55 == nil or p55.universe_id == nil then "" else p55.universe_id
	}, t_29)
end

function t_29:encode() --[[ line: 9371 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1323 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1324, var1325 = protoModule.writeTag(buff, var1323, 1, protoModule.wireTypes.lengthDelimited)
		var1324, var1325 = protoModule.writeString(var1324, var1325, self.universe_id)
		buff = var1324
		var1323 = var1325
	end
	local buff_1 = buffer.create(var1323)
	buffer.copy(buff_1, 0, buff, 0, var1323)
	
	return buff_1
end

function t_29.decode(p56) --[[ line: 9385 ]]
	-- upvalues: t_29 (ref), protoModule (ref)
	local var1327 = t_29.new()
	local var1328 = 0
	while var1328 < buffer.len(p56) do
		local _ = nil
		local var1329 = nil
		local var1330, var1331, var1332 = protoModule.readTag(p56, var1328)
		local var1333 = var1330
		var1329 = var1331
		var1328 = var1332
		
		if var1329 == protoModule.wireTypes.varint then
			local _ = nil
			local var1334, var1335 = protoModule.readVarInt(p56, var1328)
			local _ = var1334
			var1328 = var1335
			continue
		end
		if var1329 == protoModule.wireTypes.lengthDelimited then
			if var1333 == 1 then
				local _ = nil
				local var1336, var1337 = protoModule.readBuffer(p56, var1328)
				var1328 = var1337
				var1327.universe_id = buffer.tostring(var1336)
			else
				local _ = nil
				local var1338, var1339 = protoModule.readVarInt(p56, var1328)
				var1328 = var1339 + var1338
			end
		elseif var1329 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1340, var1341 = protoModule.readFixed32(p56, var1328)
			local _ = var1340
			var1328 = var1341
		elseif var1329 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1342, var1343 = protoModule.readFixed64(p56, var1328)
			local _ = var1342
			var1328 = var1343
		else
			error("Unsupported wire type: " .. var1329)
		end
	end
	return var1327
end

function t_29:jsonEncode() --[[ line: 9428 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_29:jsonDecode() --[[ line: 9438 ]]
	-- upvalues: t_29 (ref)
	local var1345 = t_29.new()
	
	if self.universe_id ~= nil then
		var1345.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1345.universe_id = self.universeId
	end
	return var1345
end

t_29.descriptor = {
	name = "ExperienceContentRatingLabelInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceContentRatingLabelInputData"
}
t.ExperienceContentRatingLabelInputData = t_29
typeRegistryModule.default:register(t.ExperienceContentRatingLabelInputData)
local t_30 = {}
t_30.__index = t_30

function t_30.new(p57) --[[ line: 9468 ]]
	-- upvalues: t_30 (ref)
	return setmetatable({
		universe_id = if p57 == nil or p57.universe_id == nil then "" else p57.universe_id,
		user_owns_experience = if p57 == nil or p57.user_owns_experience == nil then false else p57.user_owns_experience
	}, t_30)
end

function t_30:encode() --[[ line: 9479 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1347 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1348, var1349 = protoModule.writeTag(buff, var1347, 1, protoModule.wireTypes.lengthDelimited)
		var1348, var1349 = protoModule.writeString(var1348, var1349, self.universe_id)
		buff = var1348
		var1347 = var1349
	end
	if self.user_owns_experience then
		local var1350, var1351 = protoModule.writeTag(buff, var1347, 2, protoModule.wireTypes.varint)
		var1350, var1351 = protoModule.writeVarInt(var1350, var1351, if self.user_owns_experience then 1 else 0)
		buff = var1350
		var1347 = var1351
	end
	local buff_1 = buffer.create(var1347)
	buffer.copy(buff_1, 0, buff, 0, var1347)
	
	return buff_1
end

function t_30.decode(p58) --[[ line: 9498 ]]
	-- upvalues: t_30 (ref), protoModule (ref)
	local var1353 = t_30.new()
	local var1354 = 0
	while var1354 < buffer.len(p58) do
		local _ = nil
		local var1355 = nil
		local var1356, var1357, var1358 = protoModule.readTag(p58, var1354)
		local var1359 = var1356
		var1355 = var1357
		var1354 = var1358
		
		if var1355 == protoModule.wireTypes.varint then
			if var1359 == 2 then
				local _ = nil
				local var1360, var1361 = protoModule.readVarInt(p58, var1354)
				var1354 = var1361
				var1353.user_owns_experience = var1360 ~= 0
			else
				local _ = nil
				local var1362, var1363 = protoModule.readVarInt(p58, var1354)
				local _ = var1362
				var1354 = var1363
			end
		end
		if var1355 == protoModule.wireTypes.lengthDelimited then
			if var1359 == 1 then
				local _ = nil
				local var1364, var1365 = protoModule.readBuffer(p58, var1354)
				var1354 = var1365
				var1353.universe_id = buffer.tostring(var1364)
			else
				local _ = nil
				local var1366, var1367 = protoModule.readVarInt(p58, var1354)
				var1354 = var1367 + var1366
			end
		elseif var1355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1368, var1369 = protoModule.readFixed32(p58, var1354)
			local _ = var1368
			var1354 = var1369
		elseif var1355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1370, var1371 = protoModule.readFixed64(p58, var1354)
			local _ = var1370
			var1354 = var1371
		else
			error("Unsupported wire type: " .. var1355)
		end
	end
	return var1353
end

function t_30:jsonEncode() --[[ line: 9546 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.user_owns_experience then
		t.userOwnsExperience = self.user_owns_experience
	end
	return t
end

function t_30:jsonDecode() --[[ line: 9560 ]]
	-- upvalues: t_30 (ref)
	local var1373 = t_30.new()
	
	if self.universe_id ~= nil then
		var1373.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1373.universe_id = self.universeId
	end
	if self.user_owns_experience ~= nil then
		var1373.user_owns_experience = self.user_owns_experience
	end
	if self.userOwnsExperience ~= nil then
		var1373.user_owns_experience = self.userOwnsExperience
	end
	return var1373
end

t_30.descriptor = {
	name = "ExperienceRefundPolicyInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceRefundPolicyInputData"
}
t.ExperienceRefundPolicyInputData = t_30
typeRegistryModule.default:register(t.ExperienceRefundPolicyInputData)
local t_31 = {}
t_31.__index = t_31

function t_31.new(p59) --[[ line: 9596 ]]
	-- upvalues: t_31 (ref)
	return setmetatable({
		universe_id = if p59 == nil or p59.universe_id == nil then "" else p59.universe_id,
		place_id = if p59 == nil or p59.place_id == nil then "" else p59.place_id
	}, t_31)
end

function t_31:encode() --[[ line: 9605 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1375 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1376, var1377 = protoModule.writeTag(buff, var1375, 1, protoModule.wireTypes.lengthDelimited)
		var1376, var1377 = protoModule.writeString(var1376, var1377, self.universe_id)
		buff = var1376
		var1375 = var1377
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		local var1378, var1379 = protoModule.writeTag(buff, var1375, 2, protoModule.wireTypes.lengthDelimited)
		var1378, var1379 = protoModule.writeString(var1378, var1379, self.place_id)
		buff = var1378
		var1375 = var1379
	end
	local buff_1 = buffer.create(var1375)
	buffer.copy(buff_1, 0, buff, 0, var1375)
	
	return buff_1
end

function t_31.decode(p60) --[[ line: 9624 ]]
	-- upvalues: t_31 (ref), protoModule (ref)
	local var1381 = t_31.new()
	local var1382 = 0
	while var1382 < buffer.len(p60) do
		local _ = nil
		local var1383 = nil
		local var1384, var1385, var1386 = protoModule.readTag(p60, var1382)
		local var1387 = var1384
		var1383 = var1385
		var1382 = var1386
		
		if var1383 == protoModule.wireTypes.varint then
			local _ = nil
			local var1388, var1389 = protoModule.readVarInt(p60, var1382)
			local _ = var1388
			var1382 = var1389
			continue
		end
		if var1383 == protoModule.wireTypes.lengthDelimited then
			if var1387 == 1 then
				local _ = nil
				local var1390, var1391 = protoModule.readBuffer(p60, var1382)
				var1382 = var1391
				var1381.universe_id = buffer.tostring(var1390)
			elseif var1387 == 2 then
				local _ = nil
				local var1392, var1393 = protoModule.readBuffer(p60, var1382)
				var1382 = var1393
				var1381.place_id = buffer.tostring(var1392)
			else
				local _ = nil
				local var1394, var1395 = protoModule.readVarInt(p60, var1382)
				var1382 = var1395 + var1394
			end
		elseif var1383 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1396, var1397 = protoModule.readFixed32(p60, var1382)
			local _ = var1396
			var1382 = var1397
		elseif var1383 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1398, var1399 = protoModule.readFixed64(p60, var1382)
			local _ = var1398
			var1382 = var1399
		else
			error("Unsupported wire type: " .. var1383)
		end
	end
	return var1381
end

function t_31:jsonEncode() --[[ line: 9672 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.place_id ~= nil and self.place_id ~= "" then
		t.placeId = self.place_id
	end
	return t
end

function t_31:jsonDecode() --[[ line: 9686 ]]
	-- upvalues: t_31 (ref)
	local var1401 = t_31.new()
	
	if self.universe_id ~= nil then
		var1401.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1401.universe_id = self.universeId
	end
	if self.place_id ~= nil then
		var1401.place_id = self.place_id
	end
	if self.placeId ~= nil then
		var1401.place_id = self.placeId
	end
	return var1401
end

t_31.descriptor = {
	name = "ExperiencePlayWithRewardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperiencePlayWithRewardInputData"
}
t.ExperiencePlayWithRewardInputData = t_31
typeRegistryModule.default:register(t.ExperiencePlayWithRewardInputData)
local t_32 = {}
t_32.__index = t_32

function t_32.new(p61) --[[ line: 9724 ]]
	-- upvalues: t_32 (ref)
	return setmetatable({
		community_id = if p61 == nil or p61.community_id == nil then "" else p61.community_id
	}, t_32)
end

function t_32:encode() --[[ line: 9732 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1403 = 0
	
	if self.community_id ~= nil and self.community_id ~= "" then
		local var1404, var1405 = protoModule.writeTag(buff, var1403, 1, protoModule.wireTypes.lengthDelimited)
		var1404, var1405 = protoModule.writeString(var1404, var1405, self.community_id)
		buff = var1404
		var1403 = var1405
	end
	local buff_1 = buffer.create(var1403)
	buffer.copy(buff_1, 0, buff, 0, var1403)
	
	return buff_1
end

function t_32.decode(p62) --[[ line: 9746 ]]
	-- upvalues: t_32 (ref), protoModule (ref)
	local var1407 = t_32.new()
	local var1408 = 0
	while var1408 < buffer.len(p62) do
		local _ = nil
		local var1409 = nil
		local var1410, var1411, var1412 = protoModule.readTag(p62, var1408)
		local var1413 = var1410
		var1409 = var1411
		var1408 = var1412
		
		if var1409 == protoModule.wireTypes.varint then
			local _ = nil
			local var1414, var1415 = protoModule.readVarInt(p62, var1408)
			local _ = var1414
			var1408 = var1415
			continue
		end
		if var1409 == protoModule.wireTypes.lengthDelimited then
			if var1413 == 1 then
				local _ = nil
				local var1416, var1417 = protoModule.readBuffer(p62, var1408)
				var1408 = var1417
				var1407.community_id = buffer.tostring(var1416)
			else
				local _ = nil
				local var1418, var1419 = protoModule.readVarInt(p62, var1408)
				var1408 = var1419 + var1418
			end
		elseif var1409 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1420, var1421 = protoModule.readFixed32(p62, var1408)
			local _ = var1420
			var1408 = var1421
		elseif var1409 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1422, var1423 = protoModule.readFixed64(p62, var1408)
			local _ = var1422
			var1408 = var1423
		else
			error("Unsupported wire type: " .. var1409)
		end
	end
	return var1407
end

function t_32:jsonEncode() --[[ line: 9789 ]]
	local t = {}
	
	if self.community_id ~= nil and self.community_id ~= "" then
		t.communityId = self.community_id
	end
	return t
end

function t_32:jsonDecode() --[[ line: 9799 ]]
	-- upvalues: t_32 (ref)
	local var1425 = t_32.new()
	
	if self.community_id ~= nil then
		var1425.community_id = self.community_id
	end
	if self.communityId ~= nil then
		var1425.community_id = self.communityId
	end
	return var1425
end

t_32.descriptor = {
	name = "CommunitySectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitySectionInputData"
}
t.CommunitySectionInputData = t_32
typeRegistryModule.default:register(t.CommunitySectionInputData)
local t_33 = {}
t_33.__index = t_33

function t_33.new(p63) --[[ line: 9827 ]]
	-- upvalues: t_33 (ref)
	return setmetatable({
		social_link_items = if p63 == nil or p63.social_link_items == nil then {} else p63.social_link_items
	}, t_33)
end

function t_33:encode() --[[ line: 9833 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1427 = 0
	
	if self.social_link_items ~= nil and #self.social_link_items > 0 then
		for i, v in self.social_link_items do
			local var1428 = v:encode()
			local var1429, var1430 = protoModule.writeTag(buff, var1427, 1, protoModule.wireTypes.lengthDelimited)
			var1429, var1430 = protoModule.writeBuffer(var1429, var1430, var1428, buffer.len(var1428))
			buff = var1429
			var1427 = var1430
		end
	end
	local buff_1 = buffer.create(var1427)
	buffer.copy(buff_1, 0, buff, 0, var1427)
	
	return buff_1
end

function t_33.decode(p64) --[[ line: 9850 ]]
	-- upvalues: t_33 (ref), protoModule (ref), t (ref)
	local var1432 = t_33.new()
	local var1433 = 0
	while var1433 < buffer.len(p64) do
		local _ = nil
		local var1434 = nil
		local var1435, var1436, var1437 = protoModule.readTag(p64, var1433)
		local var1438 = var1435
		var1434 = var1436
		var1433 = var1437
		
		if var1434 == protoModule.wireTypes.varint then
			local _ = nil
			local var1439, var1440 = protoModule.readVarInt(p64, var1433)
			local _ = var1439
			var1433 = var1440
			continue
		end
		if var1434 == protoModule.wireTypes.lengthDelimited then
			if var1438 == 1 then
				local _ = nil
				local var1441, var1442 = protoModule.readBuffer(p64, var1433)
				var1433 = var1442
				table.insert(var1432.social_link_items, t.SocialLinkRowInputData_SocialLinkItem.decode(var1441))
			else
				local _ = nil
				local var1443, var1444 = protoModule.readVarInt(p64, var1433)
				var1433 = var1444 + var1443
			end
		elseif var1434 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1445, var1446 = protoModule.readFixed32(p64, var1433)
			local _ = var1445
			var1433 = var1446
		elseif var1434 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1447, var1448 = protoModule.readFixed64(p64, var1433)
			local _ = var1447
			var1433 = var1448
		else
			error("Unsupported wire type: " .. var1434)
		end
	end
	return var1432
end

function t_33:jsonEncode() --[[ line: 9893 ]]
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

function t_33:jsonDecode() --[[ line: 9907 ]]
	-- upvalues: t_33 (ref), t (ref)
	local var1451 = t_33.new()
	
	if self.social_link_items ~= nil then
		local t_1 = {}
		
		for i, v in self.social_link_items do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1451.social_link_items = t_1
	end
	if self.socialLinkItems ~= nil then
		local t_1 = {}
		
		for i, v in self.socialLinkItems do
			table.insert(t_1, t.SocialLinkRowInputData_SocialLinkItem.jsonDecode(v))
		end
		var1451.social_link_items = t_1
	end
	return var1451
end

t_33.descriptor = {
	name = "SocialLinkRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkRowInputData"
}
t.SocialLinkRowInputData = t_33
typeRegistryModule.default:register(t.SocialLinkRowInputData)
local t_34 = {}
t_34.__index = t_34

function t_34.new(p65) --[[ line: 9945 ]]
	-- upvalues: t_34 (ref)
	return setmetatable({
		social_link_id = if p65 == nil or p65.social_link_id == nil then "" else p65.social_link_id
	}, t_34)
end

function t_34:encode() --[[ line: 9953 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1455 = 0
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		local var1456, var1457 = protoModule.writeTag(buff, var1455, 1, protoModule.wireTypes.lengthDelimited)
		var1456, var1457 = protoModule.writeString(var1456, var1457, self.social_link_id)
		buff = var1456
		var1455 = var1457
	end
	local buff_1 = buffer.create(var1455)
	buffer.copy(buff_1, 0, buff, 0, var1455)
	
	return buff_1
end

function t_34.decode(p66) --[[ line: 9967 ]]
	-- upvalues: t_34 (ref), protoModule (ref)
	local var1459 = t_34.new()
	local var1460 = 0
	while var1460 < buffer.len(p66) do
		local _ = nil
		local var1461 = nil
		local var1462, var1463, var1464 = protoModule.readTag(p66, var1460)
		local var1465 = var1462
		var1461 = var1463
		var1460 = var1464
		
		if var1461 == protoModule.wireTypes.varint then
			local _ = nil
			local var1466, var1467 = protoModule.readVarInt(p66, var1460)
			local _ = var1466
			var1460 = var1467
			continue
		end
		if var1461 == protoModule.wireTypes.lengthDelimited then
			if var1465 == 1 then
				local _ = nil
				local var1468, var1469 = protoModule.readBuffer(p66, var1460)
				var1460 = var1469
				var1459.social_link_id = buffer.tostring(var1468)
			else
				local _ = nil
				local var1470, var1471 = protoModule.readVarInt(p66, var1460)
				var1460 = var1471 + var1470
			end
		elseif var1461 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1472, var1473 = protoModule.readFixed32(p66, var1460)
			local _ = var1472
			var1460 = var1473
		elseif var1461 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1474, var1475 = protoModule.readFixed64(p66, var1460)
			local _ = var1474
			var1460 = var1475
		else
			error("Unsupported wire type: " .. var1461)
		end
	end
	return var1459
end

function t_34:jsonEncode() --[[ line: 10010 ]]
	local t = {}
	
	if self.social_link_id ~= nil and self.social_link_id ~= "" then
		t.socialLinkId = self.social_link_id
	end
	return t
end

function t_34:jsonDecode() --[[ line: 10020 ]]
	-- upvalues: t_34 (ref)
	local var1477 = t_34.new()
	
	if self.social_link_id ~= nil then
		var1477.social_link_id = self.social_link_id
	end
	if self.socialLinkId ~= nil then
		var1477.social_link_id = self.socialLinkId
	end
	return var1477
end

t_34.descriptor = {
	name = "SocialLinkRowInputData_SocialLinkItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SocialLinkItem"
}
t.SocialLinkRowInputData_SocialLinkItem = t_34
typeRegistryModule.default:register(t.SocialLinkRowInputData_SocialLinkItem)
local t_35 = {}
t_35.__index = t_35

function t_35.new(p67) --[[ line: 10050 ]]
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

function t_35:encode() --[[ line: 10073 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1479 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1480, var1481 = protoModule.writeTag(buff, var1479, 1, protoModule.wireTypes.lengthDelimited)
		var1480, var1481 = protoModule.writeString(var1480, var1481, self.title)
		buff = var1480
		var1479 = var1481
	end
	if self.universe_items ~= nil and #self.universe_items > 0 then
		for i, v in self.universe_items do
			local var1482 = v:encode()
			local var1483, var1484 = protoModule.writeTag(buff, var1479, 2, protoModule.wireTypes.lengthDelimited)
			var1483, var1484 = protoModule.writeBuffer(var1483, var1484, var1482, buffer.len(var1482))
			buff = var1483
			var1479 = var1484
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1485, var1486 = protoModule.writeTag(buff, var1479, 3, protoModule.wireTypes.lengthDelimited)
		var1485, var1486 = protoModule.writeString(var1485, var1486, self.next_page_token)
		buff = var1485
		var1479 = var1486
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1487, var1488 = protoModule.writeTag(buff, var1479, 4, protoModule.wireTypes.lengthDelimited)
		var1487, var1488 = protoModule.writeString(var1487, var1488, self.sort_id)
		buff = var1487
		var1479 = var1488
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1489, var1490 = protoModule.writeTag(buff, var1479, 5, protoModule.wireTypes.varint)
		var1489, var1490 = protoModule.writeVarInt(var1489, var1490, self.secondary_sort_id)
		buff = var1489
		var1479 = var1490
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var1491, var1492 = protoModule.writeTag(buff, var1479, 6, protoModule.wireTypes.varint)
		var1491, var1492 = protoModule.writeVarInt(var1491, var1492, self.max_visible_rows)
		buff = var1491
		var1479 = var1492
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1493, var1494 = protoModule.writeTag(buff, var1479, 7, protoModule.wireTypes.lengthDelimited)
		var1493, var1494 = protoModule.writeString(var1493, var1494, self.subtitle)
		buff = var1493
		var1479 = var1494
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1495, var1496 = protoModule.writeTag(buff, var1479, 8, protoModule.wireTypes.lengthDelimited)
		var1495, var1496 = protoModule.writeString(var1495, var1496, self.info_text)
		buff = var1495
		var1479 = var1496
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1497, var1498 = protoModule.writeTag(buff, var1479, 9, protoModule.wireTypes.lengthDelimited)
		var1497, var1498 = protoModule.writeString(var1497, var1498, self.subtitle_link_path)
		buff = var1497
		var1479 = var1498
	end
	if self.is_placeholder ~= nil then
		local var1499, var1500 = protoModule.writeTag(buff, var1479, 10, protoModule.wireTypes.varint)
		var1499, var1500 = protoModule.writeVarInt(var1499, var1500, if self.is_placeholder then 1 else 0)
		buff = var1499
		var1479 = var1500
	end
	if self.primary_sort_id ~= nil then
		local var1501, var1502 = protoModule.writeTag(buff, var1479, 11, protoModule.wireTypes.varint)
		var1501, var1502 = protoModule.writeVarInt(var1501, var1502, self.primary_sort_id)
		buff = var1501
		var1479 = var1502
	end
	if self.applied_filters ~= nil then
		local var1503, var1504 = protoModule.writeTag(buff, var1479, 12, protoModule.wireTypes.lengthDelimited)
		var1503, var1504 = protoModule.writeString(var1503, var1504, self.applied_filters)
		buff = var1503
		var1479 = var1504
	end
	if self.pool_id ~= nil then
		local var1505, var1506 = protoModule.writeTag(buff, var1479, 13, protoModule.wireTypes.lengthDelimited)
		var1505, var1506 = protoModule.writeString(var1505, var1506, self.pool_id)
		buff = var1505
		var1479 = var1506
	end
	if self.has_emphasized_tile then
		local var1507, var1508 = protoModule.writeTag(buff, var1479, 14, protoModule.wireTypes.varint)
		var1507, var1508 = protoModule.writeVarInt(var1507, var1508, if self.has_emphasized_tile then 1 else 0)
		buff = var1507
		var1479 = var1508
	end
	local buff_1 = buffer.create(var1479)
	buffer.copy(buff_1, 0, buff, 0, var1479)
	
	return buff_1
end

function t_35.decode(p68) --[[ line: 10155 ]]
	-- upvalues: t_35 (ref), protoModule (ref), t (ref)
	local var1510 = t_35.new()
	local var1511 = 0
	while var1511 < buffer.len(p68) do
		local _ = nil
		local var1512 = nil
		local var1513, var1514, var1515 = protoModule.readTag(p68, var1511)
		local var1516 = var1513
		var1512 = var1514
		var1511 = var1515
		
		if var1512 == protoModule.wireTypes.varint then
			if var1516 == 5 then
				local _ = nil
				local var1517, var1518 = protoModule.readVarIntI32(p68, var1511)
				var1511 = var1518
				var1510.secondary_sort_id = var1517
			elseif var1516 == 6 then
				local _ = nil
				local var1519, var1520 = protoModule.readVarIntI32(p68, var1511)
				var1511 = var1520
				var1510.max_visible_rows = var1519
			elseif var1516 == 10 then
				local _ = nil
				local var1521, var1522 = protoModule.readVarInt(p68, var1511)
				var1511 = var1522
				var1510.is_placeholder = var1521 ~= 0
			elseif var1516 == 11 then
				local _ = nil
				local var1523, var1524 = protoModule.readVarIntI32(p68, var1511)
				var1511 = var1524
				var1510.primary_sort_id = var1523
			elseif var1516 == 14 then
				local _ = nil
				local var1525, var1526 = protoModule.readVarInt(p68, var1511)
				var1511 = var1526
				var1510.has_emphasized_tile = var1525 ~= 0
			else
				local _ = nil
				local var1527, var1528 = protoModule.readVarInt(p68, var1511)
				local _ = var1527
				var1511 = var1528
			end
		end
		if var1512 == protoModule.wireTypes.lengthDelimited then
			if var1516 == 1 then
				local _ = nil
				local var1529, var1530 = protoModule.readBuffer(p68, var1511)
				var1511 = var1530
				var1510.title = buffer.tostring(var1529)
			elseif var1516 == 2 then
				local _ = nil
				local var1531, var1532 = protoModule.readBuffer(p68, var1511)
				var1511 = var1532
				table.insert(var1510.universe_items, t.ExperienceCarouselInputData_UniverseItem.decode(var1531))
			elseif var1516 == 3 then
				local _ = nil
				local var1533, var1534 = protoModule.readBuffer(p68, var1511)
				var1511 = var1534
				var1510.next_page_token = buffer.tostring(var1533)
			elseif var1516 == 4 then
				local _ = nil
				local var1535, var1536 = protoModule.readBuffer(p68, var1511)
				var1511 = var1536
				var1510.sort_id = buffer.tostring(var1535)
			elseif var1516 == 7 then
				local _ = nil
				local var1537, var1538 = protoModule.readBuffer(p68, var1511)
				var1511 = var1538
				var1510.subtitle = buffer.tostring(var1537)
			elseif var1516 == 8 then
				local _ = nil
				local var1539, var1540 = protoModule.readBuffer(p68, var1511)
				var1511 = var1540
				var1510.info_text = buffer.tostring(var1539)
			elseif var1516 == 9 then
				local _ = nil
				local var1541, var1542 = protoModule.readBuffer(p68, var1511)
				var1511 = var1542
				var1510.subtitle_link_path = buffer.tostring(var1541)
			elseif var1516 == 12 then
				local _ = nil
				local var1543, var1544 = protoModule.readBuffer(p68, var1511)
				var1511 = var1544
				var1510.applied_filters = buffer.tostring(var1543)
			elseif var1516 == 13 then
				local _ = nil
				local var1545, var1546 = protoModule.readBuffer(p68, var1511)
				var1511 = var1546
				var1510.pool_id = buffer.tostring(var1545)
			else
				local _ = nil
				local var1547, var1548 = protoModule.readVarInt(p68, var1511)
				var1511 = var1548 + var1547
			end
		elseif var1512 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1549, var1550 = protoModule.readFixed32(p68, var1511)
			local _ = var1549
			var1511 = var1550
		elseif var1512 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1551, var1552 = protoModule.readFixed64(p68, var1511)
			local _ = var1551
			var1511 = var1552
		else
			error("Unsupported wire type: " .. var1512)
		end
	end
	return var1510
end

function t_35:jsonEncode() --[[ line: 10263 ]]
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

function t_35:jsonDecode() --[[ line: 10329 ]]
	-- upvalues: t_35 (ref), t (ref)
	local var1555 = t_35.new()
	
	if self.title ~= nil then
		var1555.title = self.title
	end
	if self.universe_items ~= nil then
		local t_1 = {}
		
		for i, v in self.universe_items do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1555.universe_items = t_1
	end
	if self.universeItems ~= nil then
		local t_1 = {}
		
		for i, v in self.universeItems do
			table.insert(t_1, t.ExperienceCarouselInputData_UniverseItem.jsonDecode(v))
		end
		var1555.universe_items = t_1
	end
	if self.next_page_token ~= nil then
		var1555.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1555.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1555.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1555.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1555.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1555.secondary_sort_id = self.secondarySortId
	end
	if self.max_visible_rows ~= nil then
		var1555.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var1555.max_visible_rows = self.maxVisibleRows
	end
	if self.subtitle ~= nil then
		var1555.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1555.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1555.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1555.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1555.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1555.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1555.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1555.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1555.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1555.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1555.applied_filters = self.appliedFilters
	end
	if self.pool_id ~= nil then
		var1555.pool_id = self.pool_id
	end
	if self.poolId ~= nil then
		var1555.pool_id = self.poolId
	end
	if self.has_emphasized_tile ~= nil then
		var1555.has_emphasized_tile = self.has_emphasized_tile
	end
	if self.hasEmphasizedTile ~= nil then
		var1555.has_emphasized_tile = self.hasEmphasizedTile
	end
	return var1555
end

t_35.descriptor = {
	name = "ExperienceCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceCarouselInputData"
}
t.ExperienceCarouselInputData = t_35
typeRegistryModule.default:register(t.ExperienceCarouselInputData)
local t_36 = {}
t_36.__index = t_36

function t_36.new(p69) --[[ line: 10463 ]]
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

function t_36:encode() --[[ line: 10483 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1559 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1560, var1561 = protoModule.writeTag(buff, var1559, 1, protoModule.wireTypes.lengthDelimited)
		var1560, var1561 = protoModule.writeString(var1560, var1561, self.universe_id)
		buff = var1560
		var1559 = var1561
	end
	if self.is_sponsored then
		local var1562, var1563 = protoModule.writeTag(buff, var1559, 2, protoModule.wireTypes.varint)
		var1562, var1563 = protoModule.writeVarInt(var1562, var1563, if self.is_sponsored then 1 else 0)
		buff = var1562
		var1559 = var1563
	end
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var1564, var1565 = protoModule.writeTag(buff, var1559, 3, protoModule.wireTypes.lengthDelimited)
		var1564, var1565 = protoModule.writeString(var1564, var1565, self.roblox_component)
		buff = var1564
		var1559 = var1565
	end
	if self.native_ad_data ~= nil and self.native_ad_data ~= "" then
		local var1566, var1567 = protoModule.writeTag(buff, var1559, 4, protoModule.wireTypes.lengthDelimited)
		var1566, var1567 = protoModule.writeString(var1566, var1567, self.native_ad_data)
		buff = var1566
		var1559 = var1567
	end
	if self.is_content_locked then
		local var1568, var1569 = protoModule.writeTag(buff, var1559, 5, protoModule.wireTypes.varint)
		var1568, var1569 = protoModule.writeVarInt(var1568, var1569, if self.is_content_locked then 1 else 0)
		buff = var1568
		var1559 = var1569
	end
	if self.title ~= nil and self.title ~= "" then
		local var1570, var1571 = protoModule.writeTag(buff, var1559, 6, protoModule.wireTypes.lengthDelimited)
		var1570, var1571 = protoModule.writeString(var1570, var1571, self.title)
		buff = var1570
		var1559 = var1571
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1572, var1573 = protoModule.writeTag(buff, var1559, 7, protoModule.wireTypes.lengthDelimited)
		var1572, var1573 = protoModule.writeString(var1572, var1573, self.subtitle)
		buff = var1572
		var1559 = var1573
	end
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var1574, var1575 = protoModule.writeTag(buff, var1559, 8, protoModule.wireTypes.lengthDelimited)
		var1574, var1575 = protoModule.writeString(var1574, var1575, self.image_asset_id)
		buff = var1574
		var1559 = var1575
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var1576, var1577 = protoModule.writeTag(buff, var1559, 9, protoModule.wireTypes.lengthDelimited)
		var1576, var1577 = protoModule.writeString(var1576, var1577, self.video_asset_id)
		buff = var1576
		var1559 = var1577
	end
	if self.badge_text ~= nil and self.badge_text ~= "" then
		local var1578, var1579 = protoModule.writeTag(buff, var1559, 10, protoModule.wireTypes.lengthDelimited)
		var1578, var1579 = protoModule.writeString(var1578, var1579, self.badge_text)
		buff = var1578
		var1559 = var1579
	end
	if self.player_count ~= nil then
		local var1580, var1581 = protoModule.writeTag(buff, var1559, 11, protoModule.wireTypes.varint)
		var1580, var1581 = protoModule.writeVarInt(var1580, var1581, self.player_count)
		buff = var1580
		var1559 = var1581
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1582, var1583 = protoModule.writeTag(buff, var1559, 12, protoModule.wireTypes.lengthDelimited)
		var1582, var1583 = protoModule.writeString(var1582, var1583, self.creator_key)
		buff = var1582
		var1559 = var1583
	end
	if self.rank ~= nil then
		local var1584, var1585 = protoModule.writeTag(buff, var1559, 13, protoModule.wireTypes.varint)
		var1584, var1585 = protoModule.writeVarInt(var1584, var1585, self.rank)
		buff = var1584
		var1559 = var1585
	end
	local buff_1 = buffer.create(var1559)
	buffer.copy(buff_1, 0, buff, 0, var1559)
	
	return buff_1
end

function t_36.decode(p70) --[[ line: 10559 ]]
	-- upvalues: t_36 (ref), protoModule (ref)
	local var1587 = t_36.new()
	local var1588 = 0
	while var1588 < buffer.len(p70) do
		local _ = nil
		local var1589 = nil
		local var1590, var1591, var1592 = protoModule.readTag(p70, var1588)
		local var1593 = var1590
		var1589 = var1591
		var1588 = var1592
		
		if var1589 == protoModule.wireTypes.varint then
			if var1593 == 2 then
				local _ = nil
				local var1594, var1595 = protoModule.readVarInt(p70, var1588)
				var1588 = var1595
				var1587.is_sponsored = var1594 ~= 0
			elseif var1593 == 5 then
				local _ = nil
				local var1596, var1597 = protoModule.readVarInt(p70, var1588)
				var1588 = var1597
				var1587.is_content_locked = var1596 ~= 0
			elseif var1593 == 11 then
				local _ = nil
				local var1598, var1599 = protoModule.readVarIntI64(p70, var1588)
				var1588 = var1599
				var1587.player_count = var1598
			elseif var1593 == 13 then
				local _ = nil
				local var1600, var1601 = protoModule.readVarIntI32(p70, var1588)
				var1588 = var1601
				var1587.rank = var1600
			else
				local _ = nil
				local var1602, var1603 = protoModule.readVarInt(p70, var1588)
				local _ = var1602
				var1588 = var1603
			end
		end
		if var1589 == protoModule.wireTypes.lengthDelimited then
			if var1593 == 1 then
				local _ = nil
				local var1604, var1605 = protoModule.readBuffer(p70, var1588)
				var1588 = var1605
				var1587.universe_id = buffer.tostring(var1604)
			elseif var1593 == 3 then
				local _ = nil
				local var1606, var1607 = protoModule.readBuffer(p70, var1588)
				var1588 = var1607
				var1587.roblox_component = buffer.tostring(var1606)
			elseif var1593 == 4 then
				local _ = nil
				local var1608, var1609 = protoModule.readBuffer(p70, var1588)
				var1588 = var1609
				var1587.native_ad_data = buffer.tostring(var1608)
			elseif var1593 == 6 then
				local _ = nil
				local var1610, var1611 = protoModule.readBuffer(p70, var1588)
				var1588 = var1611
				var1587.title = buffer.tostring(var1610)
			elseif var1593 == 7 then
				local _ = nil
				local var1612, var1613 = protoModule.readBuffer(p70, var1588)
				var1588 = var1613
				var1587.subtitle = buffer.tostring(var1612)
			elseif var1593 == 8 then
				local _ = nil
				local var1614, var1615 = protoModule.readBuffer(p70, var1588)
				var1588 = var1615
				var1587.image_asset_id = buffer.tostring(var1614)
			elseif var1593 == 9 then
				local _ = nil
				local var1616, var1617 = protoModule.readBuffer(p70, var1588)
				var1588 = var1617
				var1587.video_asset_id = buffer.tostring(var1616)
			elseif var1593 == 10 then
				local _ = nil
				local var1618, var1619 = protoModule.readBuffer(p70, var1588)
				var1588 = var1619
				var1587.badge_text = buffer.tostring(var1618)
			elseif var1593 == 12 then
				local _ = nil
				local var1620, var1621 = protoModule.readBuffer(p70, var1588)
				var1588 = var1621
				var1587.creator_key = buffer.tostring(var1620)
			else
				local _ = nil
				local var1622, var1623 = protoModule.readVarInt(p70, var1588)
				var1588 = var1623 + var1622
			end
		elseif var1589 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1624, var1625 = protoModule.readFixed32(p70, var1588)
			local _ = var1624
			var1588 = var1625
		elseif var1589 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1626, var1627 = protoModule.readFixed64(p70, var1588)
			local _ = var1626
			var1588 = var1627
		else
			error("Unsupported wire type: " .. var1589)
		end
	end
	return var1587
end

function t_36:jsonEncode() --[[ line: 10664 ]]
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

function t_36:jsonDecode() --[[ line: 10724 ]]
	-- upvalues: t_36 (ref)
	local var1629 = t_36.new()
	
	if self.universe_id ~= nil then
		var1629.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1629.universe_id = self.universeId
	end
	if self.is_sponsored ~= nil then
		var1629.is_sponsored = self.is_sponsored
	end
	if self.isSponsored ~= nil then
		var1629.is_sponsored = self.isSponsored
	end
	if self.roblox_component ~= nil then
		var1629.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var1629.roblox_component = self.robloxComponent
	end
	if self.native_ad_data ~= nil then
		var1629.native_ad_data = self.native_ad_data
	end
	if self.nativeAdData ~= nil then
		var1629.native_ad_data = self.nativeAdData
	end
	if self.is_content_locked ~= nil then
		var1629.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var1629.is_content_locked = self.isContentLocked
	end
	if self.title ~= nil then
		var1629.title = self.title
	end
	if self.subtitle ~= nil then
		var1629.subtitle = self.subtitle
	end
	if self.image_asset_id ~= nil then
		var1629.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var1629.image_asset_id = self.imageAssetId
	end
	if self.video_asset_id ~= nil then
		var1629.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var1629.video_asset_id = self.videoAssetId
	end
	if self.badge_text ~= nil then
		var1629.badge_text = self.badge_text
	end
	if self.badgeText ~= nil then
		var1629.badge_text = self.badgeText
	end
	if self.player_count ~= nil then
		var1629.player_count = self.player_count
	end
	if self.playerCount ~= nil then
		var1629.player_count = self.playerCount
	end
	if self.creator_key ~= nil then
		var1629.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1629.creator_key = self.creatorKey
	end
	if self.rank ~= nil then
		var1629.rank = self.rank
	end
	return var1629
end

t_36.descriptor = {
	name = "ExperienceCarouselInputData_UniverseItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UniverseItem"
}
t.ExperienceCarouselInputData_UniverseItem = t_36
typeRegistryModule.default:register(t.ExperienceCarouselInputData_UniverseItem)
local t_37 = {}
t_37.__index = t_37

function t_37.new(p71) --[[ line: 10838 ]]
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

function t_37:encode() --[[ line: 10854 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1631 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1632, var1633 = protoModule.writeTag(buff, var1631, 1, protoModule.wireTypes.lengthDelimited)
		var1632, var1633 = protoModule.writeString(var1632, var1633, self.title)
		buff = var1632
		var1631 = var1633
	end
	if self.song_items ~= nil and #self.song_items > 0 then
		for i, v in self.song_items do
			local var1634 = v:encode()
			local var1635, var1636 = protoModule.writeTag(buff, var1631, 2, protoModule.wireTypes.lengthDelimited)
			var1635, var1636 = protoModule.writeBuffer(var1635, var1636, var1634, buffer.len(var1634))
			buff = var1635
			var1631 = var1636
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var1637, var1638 = protoModule.writeTag(buff, var1631, 3, protoModule.wireTypes.lengthDelimited)
		var1637, var1638 = protoModule.writeString(var1637, var1638, self.next_page_token)
		buff = var1637
		var1631 = var1638
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1639, var1640 = protoModule.writeTag(buff, var1631, 4, protoModule.wireTypes.lengthDelimited)
		var1639, var1640 = protoModule.writeString(var1639, var1640, self.sort_id)
		buff = var1639
		var1631 = var1640
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var1641, var1642 = protoModule.writeTag(buff, var1631, 5, protoModule.wireTypes.varint)
		var1641, var1642 = protoModule.writeVarInt(var1641, var1642, self.secondary_sort_id)
		buff = var1641
		var1631 = var1642
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1643, var1644 = protoModule.writeTag(buff, var1631, 6, protoModule.wireTypes.lengthDelimited)
		var1643, var1644 = protoModule.writeString(var1643, var1644, self.subtitle)
		buff = var1643
		var1631 = var1644
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1645, var1646 = protoModule.writeTag(buff, var1631, 7, protoModule.wireTypes.lengthDelimited)
		var1645, var1646 = protoModule.writeString(var1645, var1646, self.info_text)
		buff = var1645
		var1631 = var1646
	end
	if self.subtitle_link_path ~= nil and self.subtitle_link_path ~= "" then
		local var1647, var1648 = protoModule.writeTag(buff, var1631, 8, protoModule.wireTypes.lengthDelimited)
		var1647, var1648 = protoModule.writeString(var1647, var1648, self.subtitle_link_path)
		buff = var1647
		var1631 = var1648
	end
	if self.is_placeholder ~= nil then
		local var1649, var1650 = protoModule.writeTag(buff, var1631, 9, protoModule.wireTypes.varint)
		var1649, var1650 = protoModule.writeVarInt(var1649, var1650, if self.is_placeholder then 1 else 0)
		buff = var1649
		var1631 = var1650
	end
	if self.primary_sort_id ~= nil then
		local var1651, var1652 = protoModule.writeTag(buff, var1631, 10, protoModule.wireTypes.varint)
		var1651, var1652 = protoModule.writeVarInt(var1651, var1652, self.primary_sort_id)
		buff = var1651
		var1631 = var1652
	end
	if self.applied_filters ~= nil then
		local var1653, var1654 = protoModule.writeTag(buff, var1631, 11, protoModule.wireTypes.lengthDelimited)
		var1653, var1654 = protoModule.writeString(var1653, var1654, self.applied_filters)
		buff = var1653
		var1631 = var1654
	end
	local buff_1 = buffer.create(var1631)
	buffer.copy(buff_1, 0, buff, 0, var1631)
	
	return buff_1
end

function t_37.decode(p72) --[[ line: 10921 ]]
	-- upvalues: t_37 (ref), protoModule (ref), t (ref)
	local var1656 = t_37.new()
	local var1657 = 0
	while var1657 < buffer.len(p72) do
		local _ = nil
		local var1658 = nil
		local var1659, var1660, var1661 = protoModule.readTag(p72, var1657)
		local var1662 = var1659
		var1658 = var1660
		var1657 = var1661
		
		if var1658 == protoModule.wireTypes.varint then
			if var1662 == 5 then
				local _ = nil
				local var1663, var1664 = protoModule.readVarIntI32(p72, var1657)
				var1657 = var1664
				var1656.secondary_sort_id = var1663
			elseif var1662 == 9 then
				local _ = nil
				local var1665, var1666 = protoModule.readVarInt(p72, var1657)
				var1657 = var1666
				var1656.is_placeholder = var1665 ~= 0
			elseif var1662 == 10 then
				local _ = nil
				local var1667, var1668 = protoModule.readVarIntI32(p72, var1657)
				var1657 = var1668
				var1656.primary_sort_id = var1667
			else
				local _ = nil
				local var1669, var1670 = protoModule.readVarInt(p72, var1657)
				local _ = var1669
				var1657 = var1670
			end
		end
		if var1658 == protoModule.wireTypes.lengthDelimited then
			if var1662 == 1 then
				local _ = nil
				local var1671, var1672 = protoModule.readBuffer(p72, var1657)
				var1657 = var1672
				var1656.title = buffer.tostring(var1671)
			elseif var1662 == 2 then
				local _ = nil
				local var1673, var1674 = protoModule.readBuffer(p72, var1657)
				var1657 = var1674
				table.insert(var1656.song_items, t.SongCarouselInputData_SongItem.decode(var1673))
			elseif var1662 == 3 then
				local _ = nil
				local var1675, var1676 = protoModule.readBuffer(p72, var1657)
				var1657 = var1676
				var1656.next_page_token = buffer.tostring(var1675)
			elseif var1662 == 4 then
				local _ = nil
				local var1677, var1678 = protoModule.readBuffer(p72, var1657)
				var1657 = var1678
				var1656.sort_id = buffer.tostring(var1677)
			elseif var1662 == 6 then
				local _ = nil
				local var1679, var1680 = protoModule.readBuffer(p72, var1657)
				var1657 = var1680
				var1656.subtitle = buffer.tostring(var1679)
			elseif var1662 == 7 then
				local _ = nil
				local var1681, var1682 = protoModule.readBuffer(p72, var1657)
				var1657 = var1682
				var1656.info_text = buffer.tostring(var1681)
			elseif var1662 == 8 then
				local _ = nil
				local var1683, var1684 = protoModule.readBuffer(p72, var1657)
				var1657 = var1684
				var1656.subtitle_link_path = buffer.tostring(var1683)
			elseif var1662 == 11 then
				local _ = nil
				local var1685, var1686 = protoModule.readBuffer(p72, var1657)
				var1657 = var1686
				var1656.applied_filters = buffer.tostring(var1685)
			else
				local _ = nil
				local var1687, var1688 = protoModule.readVarInt(p72, var1657)
				var1657 = var1688 + var1687
			end
		elseif var1658 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1689, var1690 = protoModule.readFixed32(p72, var1657)
			local _ = var1689
			var1657 = var1690
		elseif var1658 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1691, var1692 = protoModule.readFixed64(p72, var1657)
			local _ = var1691
			var1657 = var1692
		else
			error("Unsupported wire type: " .. var1658)
		end
	end
	return var1656
end

function t_37:jsonEncode() --[[ line: 11014 ]]
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

function t_37:jsonDecode() --[[ line: 11068 ]]
	-- upvalues: t_37 (ref), t (ref)
	local var1695 = t_37.new()
	
	if self.title ~= nil then
		var1695.title = self.title
	end
	if self.song_items ~= nil then
		local t_1 = {}
		
		for i, v in self.song_items do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1695.song_items = t_1
	end
	if self.songItems ~= nil then
		local t_1 = {}
		
		for i, v in self.songItems do
			table.insert(t_1, t.SongCarouselInputData_SongItem.jsonDecode(v))
		end
		var1695.song_items = t_1
	end
	if self.next_page_token ~= nil then
		var1695.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var1695.next_page_token = self.nextPageToken
	end
	if self.sort_id ~= nil then
		var1695.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1695.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var1695.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var1695.secondary_sort_id = self.secondarySortId
	end
	if self.subtitle ~= nil then
		var1695.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1695.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1695.info_text = self.infoText
	end
	if self.subtitle_link_path ~= nil then
		var1695.subtitle_link_path = self.subtitle_link_path
	end
	if self.subtitleLinkPath ~= nil then
		var1695.subtitle_link_path = self.subtitleLinkPath
	end
	if self.is_placeholder ~= nil then
		var1695.is_placeholder = self.is_placeholder
	end
	if self.isPlaceholder ~= nil then
		var1695.is_placeholder = self.isPlaceholder
	end
	if self.primary_sort_id ~= nil then
		var1695.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var1695.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var1695.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var1695.applied_filters = self.appliedFilters
	end
	return var1695
end

t_37.descriptor = {
	name = "SongCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongCarouselInputData"
}
t.SongCarouselInputData = t_37
typeRegistryModule.default:register(t.SongCarouselInputData)
local t_38 = {}
t_38.__index = t_38

function t_38.new(p73) --[[ line: 11178 ]]
	-- upvalues: t_38 (ref)
	return setmetatable({
		song_id = if p73 == nil or p73.song_id == nil then "" else p73.song_id
	}, t_38)
end

function t_38:encode() --[[ line: 11186 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1699 = 0
	
	if self.song_id ~= nil and self.song_id ~= "" then
		local var1700, var1701 = protoModule.writeTag(buff, var1699, 1, protoModule.wireTypes.lengthDelimited)
		var1700, var1701 = protoModule.writeString(var1700, var1701, self.song_id)
		buff = var1700
		var1699 = var1701
	end
	local buff_1 = buffer.create(var1699)
	buffer.copy(buff_1, 0, buff, 0, var1699)
	
	return buff_1
end

function t_38.decode(p74) --[[ line: 11200 ]]
	-- upvalues: t_38 (ref), protoModule (ref)
	local var1703 = t_38.new()
	local var1704 = 0
	while var1704 < buffer.len(p74) do
		local _ = nil
		local var1705 = nil
		local var1706, var1707, var1708 = protoModule.readTag(p74, var1704)
		local var1709 = var1706
		var1705 = var1707
		var1704 = var1708
		
		if var1705 == protoModule.wireTypes.varint then
			local _ = nil
			local var1710, var1711 = protoModule.readVarInt(p74, var1704)
			local _ = var1710
			var1704 = var1711
			continue
		end
		if var1705 == protoModule.wireTypes.lengthDelimited then
			if var1709 == 1 then
				local _ = nil
				local var1712, var1713 = protoModule.readBuffer(p74, var1704)
				var1704 = var1713
				var1703.song_id = buffer.tostring(var1712)
			else
				local _ = nil
				local var1714, var1715 = protoModule.readVarInt(p74, var1704)
				var1704 = var1715 + var1714
			end
		elseif var1705 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1716, var1717 = protoModule.readFixed32(p74, var1704)
			local _ = var1716
			var1704 = var1717
		elseif var1705 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1718, var1719 = protoModule.readFixed64(p74, var1704)
			local _ = var1718
			var1704 = var1719
		else
			error("Unsupported wire type: " .. var1705)
		end
	end
	return var1703
end

function t_38:jsonEncode() --[[ line: 11243 ]]
	local t = {}
	
	if self.song_id ~= nil and self.song_id ~= "" then
		t.songId = self.song_id
	end
	return t
end

function t_38:jsonDecode() --[[ line: 11253 ]]
	-- upvalues: t_38 (ref)
	local var1721 = t_38.new()
	
	if self.song_id ~= nil then
		var1721.song_id = self.song_id
	end
	if self.songId ~= nil then
		var1721.song_id = self.songId
	end
	return var1721
end

t_38.descriptor = {
	name = "SongCarouselInputData_SongItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SongItem"
}
t.SongCarouselInputData_SongItem = t_38
typeRegistryModule.default:register(t.SongCarouselInputData_SongItem)
local t_39 = {}
t_39.__index = t_39

function t_39.new(p75) --[[ line: 11281 ]]
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

function t_39:encode() --[[ line: 11292 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1723 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var1724, var1725 = protoModule.writeTag(buff, var1723, 1, protoModule.wireTypes.lengthDelimited)
		var1724, var1725 = protoModule.writeString(var1724, var1725, self.title)
		buff = var1724
		var1723 = var1725
	end
	if self.event_items ~= nil and #self.event_items > 0 then
		for i, v in self.event_items do
			local var1726 = v:encode()
			local var1727, var1728 = protoModule.writeTag(buff, var1723, 2, protoModule.wireTypes.lengthDelimited)
			var1727, var1728 = protoModule.writeBuffer(var1727, var1728, var1726, buffer.len(var1726))
			buff = var1727
			var1723 = var1728
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1729, var1730 = protoModule.writeTag(buff, var1723, 3, protoModule.wireTypes.lengthDelimited)
		var1729, var1730 = protoModule.writeString(var1729, var1730, self.universe_id)
		buff = var1729
		var1723 = var1730
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var1731, var1732 = protoModule.writeTag(buff, var1723, 4, protoModule.wireTypes.lengthDelimited)
		var1731, var1732 = protoModule.writeString(var1731, var1732, self.sort_id)
		buff = var1731
		var1723 = var1732
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var1733, var1734 = protoModule.writeTag(buff, var1723, 5, protoModule.wireTypes.lengthDelimited)
		var1733, var1734 = protoModule.writeString(var1733, var1734, self.subtitle)
		buff = var1733
		var1723 = var1734
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var1735, var1736 = protoModule.writeTag(buff, var1723, 6, protoModule.wireTypes.lengthDelimited)
		var1735, var1736 = protoModule.writeString(var1735, var1736, self.info_text)
		buff = var1735
		var1723 = var1736
	end
	local buff_1 = buffer.create(var1723)
	buffer.copy(buff_1, 0, buff, 0, var1723)
	
	return buff_1
end

function t_39.decode(p76) --[[ line: 11334 ]]
	-- upvalues: t_39 (ref), protoModule (ref), t (ref)
	local var1738 = t_39.new()
	local var1739 = 0
	while var1739 < buffer.len(p76) do
		local _ = nil
		local var1740 = nil
		local var1741, var1742, var1743 = protoModule.readTag(p76, var1739)
		local var1744 = var1741
		var1740 = var1742
		var1739 = var1743
		
		if var1740 == protoModule.wireTypes.varint then
			local _ = nil
			local var1745, var1746 = protoModule.readVarInt(p76, var1739)
			local _ = var1745
			var1739 = var1746
			continue
		end
		if var1740 == protoModule.wireTypes.lengthDelimited then
			if var1744 == 1 then
				local _ = nil
				local var1747, var1748 = protoModule.readBuffer(p76, var1739)
				var1739 = var1748
				var1738.title = buffer.tostring(var1747)
			elseif var1744 == 2 then
				local _ = nil
				local var1749, var1750 = protoModule.readBuffer(p76, var1739)
				var1739 = var1750
				table.insert(var1738.event_items, t.EventsCarouselInputData_EventItem.decode(var1749))
			elseif var1744 == 3 then
				local _ = nil
				local var1751, var1752 = protoModule.readBuffer(p76, var1739)
				var1739 = var1752
				var1738.universe_id = buffer.tostring(var1751)
			elseif var1744 == 4 then
				local _ = nil
				local var1753, var1754 = protoModule.readBuffer(p76, var1739)
				var1739 = var1754
				var1738.sort_id = buffer.tostring(var1753)
			elseif var1744 == 5 then
				local _ = nil
				local var1755, var1756 = protoModule.readBuffer(p76, var1739)
				var1739 = var1756
				var1738.subtitle = buffer.tostring(var1755)
			elseif var1744 == 6 then
				local _ = nil
				local var1757, var1758 = protoModule.readBuffer(p76, var1739)
				var1739 = var1758
				var1738.info_text = buffer.tostring(var1757)
			else
				local _ = nil
				local var1759, var1760 = protoModule.readVarInt(p76, var1739)
				var1739 = var1760 + var1759
			end
		elseif var1740 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1761, var1762 = protoModule.readFixed32(p76, var1739)
			local _ = var1761
			var1739 = var1762
		elseif var1740 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1763, var1764 = protoModule.readFixed64(p76, var1739)
			local _ = var1763
			var1739 = var1764
		else
			error("Unsupported wire type: " .. var1740)
		end
	end
	return var1738
end

function t_39:jsonEncode() --[[ line: 11402 ]]
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

function t_39:jsonDecode() --[[ line: 11436 ]]
	-- upvalues: t_39 (ref), t (ref)
	local var1767 = t_39.new()
	
	if self.title ~= nil then
		var1767.title = self.title
	end
	if self.event_items ~= nil then
		local t_1 = {}
		
		for i, v in self.event_items do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1767.event_items = t_1
	end
	if self.eventItems ~= nil then
		local t_1 = {}
		
		for i, v in self.eventItems do
			table.insert(t_1, t.EventsCarouselInputData_EventItem.jsonDecode(v))
		end
		var1767.event_items = t_1
	end
	if self.universe_id ~= nil then
		var1767.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1767.universe_id = self.universeId
	end
	if self.sort_id ~= nil then
		var1767.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var1767.sort_id = self.sortId
	end
	if self.subtitle ~= nil then
		var1767.subtitle = self.subtitle
	end
	if self.info_text ~= nil then
		var1767.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var1767.info_text = self.infoText
	end
	return var1767
end

t_39.descriptor = {
	name = "EventsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventsCarouselInputData"
}
t.EventsCarouselInputData = t_39
typeRegistryModule.default:register(t.EventsCarouselInputData)
local t_40 = {}
t_40.__index = t_40

function t_40.new(p77) --[[ line: 11506 ]]
	-- upvalues: t_40 (ref)
	return setmetatable({
		event_id = if p77 == nil or p77.event_id == nil then "" else p77.event_id
	}, t_40)
end

function t_40:encode() --[[ line: 11514 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1771 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var1772, var1773 = protoModule.writeTag(buff, var1771, 1, protoModule.wireTypes.lengthDelimited)
		var1772, var1773 = protoModule.writeString(var1772, var1773, self.event_id)
		buff = var1772
		var1771 = var1773
	end
	local buff_1 = buffer.create(var1771)
	buffer.copy(buff_1, 0, buff, 0, var1771)
	
	return buff_1
end

function t_40.decode(p78) --[[ line: 11528 ]]
	-- upvalues: t_40 (ref), protoModule (ref)
	local var1775 = t_40.new()
	local var1776 = 0
	while var1776 < buffer.len(p78) do
		local _ = nil
		local var1777 = nil
		local var1778, var1779, var1780 = protoModule.readTag(p78, var1776)
		local var1781 = var1778
		var1777 = var1779
		var1776 = var1780
		
		if var1777 == protoModule.wireTypes.varint then
			local _ = nil
			local var1782, var1783 = protoModule.readVarInt(p78, var1776)
			local _ = var1782
			var1776 = var1783
			continue
		end
		if var1777 == protoModule.wireTypes.lengthDelimited then
			if var1781 == 1 then
				local _ = nil
				local var1784, var1785 = protoModule.readBuffer(p78, var1776)
				var1776 = var1785
				var1775.event_id = buffer.tostring(var1784)
			else
				local _ = nil
				local var1786, var1787 = protoModule.readVarInt(p78, var1776)
				var1776 = var1787 + var1786
			end
		elseif var1777 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1788, var1789 = protoModule.readFixed32(p78, var1776)
			local _ = var1788
			var1776 = var1789
		elseif var1777 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1790, var1791 = protoModule.readFixed64(p78, var1776)
			local _ = var1790
			var1776 = var1791
		else
			error("Unsupported wire type: " .. var1777)
		end
	end
	return var1775
end

function t_40:jsonEncode() --[[ line: 11571 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_40:jsonDecode() --[[ line: 11581 ]]
	-- upvalues: t_40 (ref)
	local var1793 = t_40.new()
	
	if self.event_id ~= nil then
		var1793.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var1793.event_id = self.eventId
	end
	return var1793
end

t_40.descriptor = {
	name = "EventsCarouselInputData_EventItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventItem"
}
t.EventsCarouselInputData_EventItem = t_40
typeRegistryModule.default:register(t.EventsCarouselInputData_EventItem)
local t_41 = {}
t_41.__index = t_41

function t_41.new(p79) --[[ line: 11611 ]]
	-- upvalues: t_41 (ref)
	return setmetatable({
		universe_id = if p79 == nil or p79.universe_id == nil then "" else p79.universe_id,
		entry_map = if p79 == nil or p79.entry_map == nil then {} else p79.entry_map,
		entry_order = if p79 == nil or p79.entry_order == nil then {} else p79.entry_order,
		creator_key = if p79 == nil or p79.creator_key == nil then "" else p79.creator_key
	}, t_41)
end

function t_41:encode() --[[ line: 11620 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1795 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var1796, var1797 = protoModule.writeTag(buff, var1795, 1, protoModule.wireTypes.lengthDelimited)
		var1796, var1797 = protoModule.writeString(var1796, var1797, self.universe_id)
		buff = var1796
		var1795 = var1797
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var1798, var1799 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var1798, var1799 = protoModule.writeString(var1798, var1799, i)
			local var1800 = v:encode()
			var1799, var1801 = protoModule.writeTag(var1798, var1799, 2, protoModule.wireTypes.lengthDelimited)
			var1799, var1801 = protoModule.writeBuffer(var1799, var1801, var1800, buffer.len(var1800))
			local var1802 = var1799
			local var1803 = var1801
			local var1804, var1805 = protoModule.writeTag(buff, var1795, 2, protoModule.wireTypes.lengthDelimited)
			var1804, var1805 = protoModule.writeBuffer(var1804, var1805, var1802, var1803)
			buff = var1804
			var1795 = var1805
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var1806, var1807 = protoModule.writeTag(buff, var1795, 3, protoModule.wireTypes.lengthDelimited)
			var1806, var1807 = protoModule.writeString(var1806, var1807, v)
			buff = var1806
			var1795 = var1807
		end
	end
	if self.creator_key ~= nil and self.creator_key ~= "" then
		local var1808, var1809 = protoModule.writeTag(buff, var1795, 4, protoModule.wireTypes.lengthDelimited)
		var1808, var1809 = protoModule.writeString(var1808, var1809, self.creator_key)
		buff = var1808
		var1795 = var1809
	end
	local buff_1 = buffer.create(var1795)
	buffer.copy(buff_1, 0, buff, 0, var1795)
	
	return buff_1
end

function t_41.decode(p80) --[[ line: 11660 ]]
	-- upvalues: t_41 (ref), protoModule (ref), t (ref)
	local var1811 = t_41.new()
	local var1812 = 0
	while var1812 < buffer.len(p80) do
		local _ = nil
		local var1813 = nil
		local var1814, var1815, var1816 = protoModule.readTag(p80, var1812)
		local var1817 = var1814
		var1813 = var1815
		var1812 = var1816
		
		if var1813 == protoModule.wireTypes.varint then
			local _ = nil
			local var1818, var1819 = protoModule.readVarInt(p80, var1812)
			local _ = var1818
			var1812 = var1819
			continue
		end
		if var1813 == protoModule.wireTypes.lengthDelimited then
			if var1817 == 1 then
				local _ = nil
				local var1820, var1821 = protoModule.readBuffer(p80, var1812)
				var1812 = var1821
				var1811.universe_id = buffer.tostring(var1820)
			elseif var1817 == 2 then
				local _ = nil
				local var1822, var1823 = protoModule.readBuffer(p80, var1812)
				var1812 = var1823
				var1822 = t.DevStoreFeedInputData_EntryMapEntry.decode(var1822)
				var1811.entry_map[var1822.key or ""] = var1822.value or t.FeedEntry.new()
			elseif var1817 == 3 then
				local _ = nil
				local var1824, var1825 = protoModule.readBuffer(p80, var1812)
				var1812 = var1825
				table.insert(var1811.entry_order, buffer.tostring(var1824))
			elseif var1817 == 4 then
				local _ = nil
				local var1826, var1827 = protoModule.readBuffer(p80, var1812)
				var1812 = var1827
				var1811.creator_key = buffer.tostring(var1826)
			else
				local _ = nil
				local var1828, var1829 = protoModule.readVarInt(p80, var1812)
				var1812 = var1829 + var1828
			end
		elseif var1813 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1830, var1831 = protoModule.readFixed32(p80, var1812)
			local _ = var1830
			var1812 = var1831
		elseif var1813 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1832, var1833 = protoModule.readFixed64(p80, var1812)
			local _ = var1832
			var1812 = var1833
		else
			error("Unsupported wire type: " .. var1813)
		end
	end
	return var1811
end

function t_41:jsonEncode() --[[ line: 11725 ]]
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

function t_41:jsonDecode() --[[ line: 11755 ]]
	-- upvalues: t_41 (ref), t (ref)
	local var1837 = t_41.new()
	
	if self.universe_id ~= nil then
		var1837.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var1837.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1837.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var1837.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var1837.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var1837.entry_order = t_1
	end
	if self.creator_key ~= nil then
		var1837.creator_key = self.creator_key
	end
	if self.creatorKey ~= nil then
		var1837.creator_key = self.creatorKey
	end
	return var1837
end

t_41.descriptor = {
	name = "DevStoreFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DevStoreFeedInputData"
}
t.DevStoreFeedInputData = t_41
typeRegistryModule.default:register(t.DevStoreFeedInputData)
local t_42 = {}
t_42.__index = t_42

function t_42.new(p81) --[[ line: 11827 ]]
	-- upvalues: t_42 (ref)
	return setmetatable({
		key = if p81 == nil or p81.key == nil then "" else p81.key,
		value = if p81 == nil or p81.value == nil then nil else p81.value
	}, t_42)
end

function t_42:encode() --[[ line: 11836 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1843 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var1844, var1845 = protoModule.writeTag(buff, var1843, 1, protoModule.wireTypes.lengthDelimited)
		var1844, var1845 = protoModule.writeString(var1844, var1845, self.key)
		buff = var1844
		var1843 = var1845
	end
	if self.value ~= nil then
		local var1846 = self.value:encode()
		local var1847, var1848 = protoModule.writeTag(buff, var1843, 2, protoModule.wireTypes.lengthDelimited)
		var1847, var1848 = protoModule.writeBuffer(var1847, var1848, var1846, buffer.len(var1846))
		buff = var1847
		var1843 = var1848
	end
	local buff_1 = buffer.create(var1843)
	buffer.copy(buff_1, 0, buff, 0, var1843)
	
	return buff_1
end

function t_42.decode(p82) --[[ line: 11856 ]]
	-- upvalues: t_42 (ref), protoModule (ref), t (ref)
	local var1850 = t_42.new()
	local var1851 = 0
	while var1851 < buffer.len(p82) do
		local _ = nil
		local var1852 = nil
		local var1853, var1854, var1855 = protoModule.readTag(p82, var1851)
		local var1856 = var1853
		var1852 = var1854
		var1851 = var1855
		
		if var1852 == protoModule.wireTypes.varint then
			local _ = nil
			local var1857, var1858 = protoModule.readVarInt(p82, var1851)
			local _ = var1857
			var1851 = var1858
			continue
		end
		if var1852 == protoModule.wireTypes.lengthDelimited then
			if var1856 == 1 then
				local _ = nil
				local var1859, var1860 = protoModule.readBuffer(p82, var1851)
				var1851 = var1860
				var1850.key = buffer.tostring(var1859)
			elseif var1856 == 2 then
				local _ = nil
				local var1861, var1862 = protoModule.readBuffer(p82, var1851)
				var1851 = var1862
				var1850.value = t.FeedEntry.decode(var1861)
			else
				local _ = nil
				local var1863, var1864 = protoModule.readVarInt(p82, var1851)
				var1851 = var1864 + var1863
			end
		elseif var1852 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1865, var1866 = protoModule.readFixed32(p82, var1851)
			local _ = var1865
			var1851 = var1866
		elseif var1852 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1867, var1868 = protoModule.readFixed64(p82, var1851)
			local _ = var1867
			var1851 = var1868
		else
			error("Unsupported wire type: " .. var1852)
		end
	end
	return var1850
end

function t_42:jsonEncode() --[[ line: 11904 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_42:jsonDecode() --[[ line: 11918 ]]
	-- upvalues: t_42 (ref), t (ref)
	local var1870 = t_42.new()
	
	if self.key ~= nil then
		var1870.key = self.key
	end
	if self.value ~= nil then
		var1870.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var1870
end

t_42.descriptor = {
	name = "DevStoreFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.DevStoreFeedInputData_EntryMapEntry = t_42
typeRegistryModule.default:register(t.DevStoreFeedInputData_EntryMapEntry)
local t_43 = {}
t_43.__index = t_43

function t_43.new(p83) --[[ line: 11948 ]]
	-- upvalues: t_43 (ref)
	return setmetatable({
		game_passes = if p83 == nil or p83.game_passes == nil then {} else p83.game_passes
	}, t_43)
end

function t_43:encode() --[[ line: 11956 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1872 = 0
	
	if self.game_passes ~= nil and #self.game_passes > 0 then
		for i, v in self.game_passes do
			local var1873 = v:encode()
			local var1874, var1875 = protoModule.writeTag(buff, var1872, 1, protoModule.wireTypes.lengthDelimited)
			var1874, var1875 = protoModule.writeBuffer(var1874, var1875, var1873, buffer.len(var1873))
			buff = var1874
			var1872 = var1875
		end
	end
	local buff_1 = buffer.create(var1872)
	buffer.copy(buff_1, 0, buff, 0, var1872)
	
	return buff_1
end

function t_43.decode(p84) --[[ line: 11973 ]]
	-- upvalues: t_43 (ref), protoModule (ref), t (ref)
	local var1877 = t_43.new()
	local var1878 = 0
	while var1878 < buffer.len(p84) do
		local _ = nil
		local var1879 = nil
		local var1880, var1881, var1882 = protoModule.readTag(p84, var1878)
		local var1883 = var1880
		var1879 = var1881
		var1878 = var1882
		
		if var1879 == protoModule.wireTypes.varint then
			local _ = nil
			local var1884, var1885 = protoModule.readVarInt(p84, var1878)
			local _ = var1884
			var1878 = var1885
			continue
		end
		if var1879 == protoModule.wireTypes.lengthDelimited then
			if var1883 == 1 then
				local _ = nil
				local var1886, var1887 = protoModule.readBuffer(p84, var1878)
				var1878 = var1887
				table.insert(var1877.game_passes, t.GamePassCollectionInputData_GamePassItem.decode(var1886))
			else
				local _ = nil
				local var1888, var1889 = protoModule.readVarInt(p84, var1878)
				var1878 = var1889 + var1888
			end
		elseif var1879 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1890, var1891 = protoModule.readFixed32(p84, var1878)
			local _ = var1890
			var1878 = var1891
		elseif var1879 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1892, var1893 = protoModule.readFixed64(p84, var1878)
			local _ = var1892
			var1878 = var1893
		else
			error("Unsupported wire type: " .. var1879)
		end
	end
	return var1877
end

function t_43:jsonEncode() --[[ line: 12016 ]]
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

function t_43:jsonDecode() --[[ line: 12030 ]]
	-- upvalues: t_43 (ref), t (ref)
	local var1896 = t_43.new()
	
	if self.game_passes ~= nil then
		local t_1 = {}
		
		for i, v in self.game_passes do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1896.game_passes = t_1
	end
	if self.gamePasses ~= nil then
		local t_1 = {}
		
		for i, v in self.gamePasses do
			table.insert(t_1, t.GamePassCollectionInputData_GamePassItem.jsonDecode(v))
		end
		var1896.game_passes = t_1
	end
	return var1896
end

t_43.descriptor = {
	name = "GamePassCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassCollectionInputData"
}
t.GamePassCollectionInputData = t_43
typeRegistryModule.default:register(t.GamePassCollectionInputData)
local t_44 = {}
t_44.__index = t_44

function t_44.new(p85) --[[ line: 12068 ]]
	-- upvalues: t_44 (ref)
	return setmetatable({
		game_pass_id = if p85 == nil or p85.game_pass_id == nil then "" else p85.game_pass_id
	}, t_44)
end

function t_44:encode() --[[ line: 12076 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1900 = 0
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		local var1901, var1902 = protoModule.writeTag(buff, var1900, 1, protoModule.wireTypes.lengthDelimited)
		var1901, var1902 = protoModule.writeString(var1901, var1902, self.game_pass_id)
		buff = var1901
		var1900 = var1902
	end
	local buff_1 = buffer.create(var1900)
	buffer.copy(buff_1, 0, buff, 0, var1900)
	
	return buff_1
end

function t_44.decode(p86) --[[ line: 12092 ]]
	-- upvalues: t_44 (ref), protoModule (ref)
	local var1904 = t_44.new()
	local var1905 = 0
	while var1905 < buffer.len(p86) do
		local _ = nil
		local var1906 = nil
		local var1907, var1908, var1909 = protoModule.readTag(p86, var1905)
		local var1910 = var1907
		var1906 = var1908
		var1905 = var1909
		
		if var1906 == protoModule.wireTypes.varint then
			local _ = nil
			local var1911, var1912 = protoModule.readVarInt(p86, var1905)
			local _ = var1911
			var1905 = var1912
			continue
		end
		if var1906 == protoModule.wireTypes.lengthDelimited then
			if var1910 == 1 then
				local _ = nil
				local var1913, var1914 = protoModule.readBuffer(p86, var1905)
				var1905 = var1914
				var1904.game_pass_id = buffer.tostring(var1913)
			else
				local _ = nil
				local var1915, var1916 = protoModule.readVarInt(p86, var1905)
				var1905 = var1916 + var1915
			end
		elseif var1906 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1917, var1918 = protoModule.readFixed32(p86, var1905)
			local _ = var1917
			var1905 = var1918
		elseif var1906 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1919, var1920 = protoModule.readFixed64(p86, var1905)
			local _ = var1919
			var1905 = var1920
		else
			error("Unsupported wire type: " .. var1906)
		end
	end
	return var1904
end

function t_44:jsonEncode() --[[ line: 12137 ]]
	local t = {}
	
	if self.game_pass_id ~= nil and self.game_pass_id ~= "" then
		t.gamePassId = self.game_pass_id
	end
	return t
end

function t_44:jsonDecode() --[[ line: 12149 ]]
	-- upvalues: t_44 (ref)
	local var1922 = t_44.new()
	
	if self.game_pass_id ~= nil then
		var1922.game_pass_id = self.game_pass_id
	end
	if self.gamePassId ~= nil then
		var1922.game_pass_id = self.gamePassId
	end
	return var1922
end

t_44.descriptor = {
	name = "GamePassCollectionInputData_GamePassItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.GamePassItem"
}
t.GamePassCollectionInputData_GamePassItem = t_44
typeRegistryModule.default:register(t.GamePassCollectionInputData_GamePassItem)
local t_45 = {}
t_45.__index = t_45

function t_45.new(p87) --[[ line: 12179 ]]
	-- upvalues: t_45 (ref)
	return setmetatable({
		developer_products = if p87 == nil or p87.developer_products == nil then {} else p87.developer_products
	}, t_45)
end

function t_45:encode() --[[ line: 12187 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1924 = 0
	
	if self.developer_products ~= nil and #self.developer_products > 0 then
		for i, v in self.developer_products do
			local var1925 = v:encode()
			local var1926, var1927 = protoModule.writeTag(buff, var1924, 1, protoModule.wireTypes.lengthDelimited)
			var1926, var1927 = protoModule.writeBuffer(var1926, var1927, var1925, buffer.len(var1925))
			buff = var1926
			var1924 = var1927
		end
	end
	local buff_1 = buffer.create(var1924)
	buffer.copy(buff_1, 0, buff, 0, var1924)
	
	return buff_1
end

function t_45.decode(p88) --[[ line: 12204 ]]
	-- upvalues: t_45 (ref), protoModule (ref), t (ref)
	local var1929 = t_45.new()
	local var1930 = 0
	while var1930 < buffer.len(p88) do
		local _ = nil
		local var1931 = nil
		local var1932, var1933, var1934 = protoModule.readTag(p88, var1930)
		local var1935 = var1932
		var1931 = var1933
		var1930 = var1934
		
		if var1931 == protoModule.wireTypes.varint then
			local _ = nil
			local var1936, var1937 = protoModule.readVarInt(p88, var1930)
			local _ = var1936
			var1930 = var1937
			continue
		end
		if var1931 == protoModule.wireTypes.lengthDelimited then
			if var1935 == 1 then
				local _ = nil
				local var1938, var1939 = protoModule.readBuffer(p88, var1930)
				var1930 = var1939
				table.insert(var1929.developer_products, t.DeveloperProductCollectionInputData_DeveloperProductItem.decode(var1938))
			else
				local _ = nil
				local var1940, var1941 = protoModule.readVarInt(p88, var1930)
				var1930 = var1941 + var1940
			end
		elseif var1931 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1942, var1943 = protoModule.readFixed32(p88, var1930)
			local _ = var1942
			var1930 = var1943
		elseif var1931 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1944, var1945 = protoModule.readFixed64(p88, var1930)
			local _ = var1944
			var1930 = var1945
		else
			error("Unsupported wire type: " .. var1931)
		end
	end
	return var1929
end

function t_45:jsonEncode() --[[ line: 12250 ]]
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

function t_45:jsonDecode() --[[ line: 12264 ]]
	-- upvalues: t_45 (ref), t (ref)
	local var1948 = t_45.new()
	
	if self.developer_products ~= nil then
		local t_1 = {}
		
		for i, v in self.developer_products do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1948.developer_products = t_1
	end
	if self.developerProducts ~= nil then
		local t_1 = {}
		
		for i, v in self.developerProducts do
			table.insert(t_1, t.DeveloperProductCollectionInputData_DeveloperProductItem.jsonDecode(v))
		end
		var1948.developer_products = t_1
	end
	return var1948
end

t_45.descriptor = {
	name = "DeveloperProductCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductCollectionInputData"
}
t.DeveloperProductCollectionInputData = t_45
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData)
local t_46 = {}
t_46.__index = t_46

function t_46.new(p89) --[[ line: 12311 ]]
	-- upvalues: t_46 (ref)
	return setmetatable({
		developer_product_id = if p89 == nil or p89.developer_product_id == nil then "" else p89.developer_product_id
	}, t_46)
end

function t_46:encode() --[[ line: 12324 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1952 = 0
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		local var1953, var1954 = protoModule.writeTag(buff, var1952, 1, protoModule.wireTypes.lengthDelimited)
		var1953, var1954 = protoModule.writeString(var1953, var1954, self.developer_product_id)
		buff = var1953
		var1952 = var1954
	end
	local buff_1 = buffer.create(var1952)
	buffer.copy(buff_1, 0, buff, 0, var1952)
	
	return buff_1
end

function t_46.decode(p90) --[[ line: 12340 ]]
	-- upvalues: t_46 (ref), protoModule (ref)
	local var1956 = t_46.new()
	local var1957 = 0
	while var1957 < buffer.len(p90) do
		local _ = nil
		local var1958 = nil
		local var1959, var1960, var1961 = protoModule.readTag(p90, var1957)
		local var1962 = var1959
		var1958 = var1960
		var1957 = var1961
		
		if var1958 == protoModule.wireTypes.varint then
			local _ = nil
			local var1963, var1964 = protoModule.readVarInt(p90, var1957)
			local _ = var1963
			var1957 = var1964
			continue
		end
		if var1958 == protoModule.wireTypes.lengthDelimited then
			if var1962 == 1 then
				local _ = nil
				local var1965, var1966 = protoModule.readBuffer(p90, var1957)
				var1957 = var1966
				var1956.developer_product_id = buffer.tostring(var1965)
			else
				local _ = nil
				local var1967, var1968 = protoModule.readVarInt(p90, var1957)
				var1957 = var1968 + var1967
			end
		elseif var1958 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1969, var1970 = protoModule.readFixed32(p90, var1957)
			local _ = var1969
			var1957 = var1970
		elseif var1958 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1971, var1972 = protoModule.readFixed64(p90, var1957)
			local _ = var1971
			var1957 = var1972
		else
			error("Unsupported wire type: " .. var1958)
		end
	end
	return var1956
end

function t_46:jsonEncode() --[[ line: 12385 ]]
	local t = {}
	
	if self.developer_product_id ~= nil and self.developer_product_id ~= "" then
		t.developerProductId = self.developer_product_id
	end
	return t
end

function t_46:jsonDecode() --[[ line: 12397 ]]
	-- upvalues: t_46 (ref)
	local var1974 = t_46.new()
	
	if self.developer_product_id ~= nil then
		var1974.developer_product_id = self.developer_product_id
	end
	if self.developerProductId ~= nil then
		var1974.developer_product_id = self.developerProductId
	end
	return var1974
end

t_46.descriptor = {
	name = "DeveloperProductCollectionInputData_DeveloperProductItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DeveloperProductItem"
}
t.DeveloperProductCollectionInputData_DeveloperProductItem = t_46
typeRegistryModule.default:register(t.DeveloperProductCollectionInputData_DeveloperProductItem)
local t_47 = {}
t_47.__index = t_47

function t_47.new(p91) --[[ line: 12428 ]]
	-- upvalues: t_47 (ref)
	return setmetatable({
		subscriptions = if p91 == nil or p91.subscriptions == nil then {} else p91.subscriptions
	}, t_47)
end

function t_47:encode() --[[ line: 12436 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var1976 = 0
	
	if self.subscriptions ~= nil and #self.subscriptions > 0 then
		for i, v in self.subscriptions do
			local var1977 = v:encode()
			local var1978, var1979 = protoModule.writeTag(buff, var1976, 1, protoModule.wireTypes.lengthDelimited)
			var1978, var1979 = protoModule.writeBuffer(var1978, var1979, var1977, buffer.len(var1977))
			buff = var1978
			var1976 = var1979
		end
	end
	local buff_1 = buffer.create(var1976)
	buffer.copy(buff_1, 0, buff, 0, var1976)
	
	return buff_1
end

function t_47.decode(p92) --[[ line: 12453 ]]
	-- upvalues: t_47 (ref), protoModule (ref), t (ref)
	local var1981 = t_47.new()
	local var1982 = 0
	while var1982 < buffer.len(p92) do
		local _ = nil
		local var1983 = nil
		local var1984, var1985, var1986 = protoModule.readTag(p92, var1982)
		local var1987 = var1984
		var1983 = var1985
		var1982 = var1986
		
		if var1983 == protoModule.wireTypes.varint then
			local _ = nil
			local var1988, var1989 = protoModule.readVarInt(p92, var1982)
			local _ = var1988
			var1982 = var1989
			continue
		end
		if var1983 == protoModule.wireTypes.lengthDelimited then
			if var1987 == 1 then
				local _ = nil
				local var1990, var1991 = protoModule.readBuffer(p92, var1982)
				var1982 = var1991
				table.insert(var1981.subscriptions, t.SubscriptionCollectionInputData_SubscriptionItem.decode(var1990))
			else
				local _ = nil
				local var1992, var1993 = protoModule.readVarInt(p92, var1982)
				var1982 = var1993 + var1992
			end
		elseif var1983 == protoModule.wireTypes.i32 then
			local _ = nil
			local var1994, var1995 = protoModule.readFixed32(p92, var1982)
			local _ = var1994
			var1982 = var1995
		elseif var1983 == protoModule.wireTypes.i64 then
			local _ = nil
			local var1996, var1997 = protoModule.readFixed64(p92, var1982)
			local _ = var1996
			var1982 = var1997
		else
			error("Unsupported wire type: " .. var1983)
		end
	end
	return var1981
end

function t_47:jsonEncode() --[[ line: 12499 ]]
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

function t_47:jsonDecode() --[[ line: 12513 ]]
	-- upvalues: t_47 (ref), t (ref)
	local var2000 = t_47.new()
	
	if self.subscriptions ~= nil then
		local t_1 = {}
		
		for i, v in self.subscriptions do
			table.insert(t_1, t.SubscriptionCollectionInputData_SubscriptionItem.jsonDecode(v))
		end
		var2000.subscriptions = t_1
	end
	return var2000
end

t_47.descriptor = {
	name = "SubscriptionCollectionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionCollectionInputData"
}
t.SubscriptionCollectionInputData = t_47
typeRegistryModule.default:register(t.SubscriptionCollectionInputData)
local t_48 = {}
t_48.__index = t_48

function t_48.new(p93) --[[ line: 12543 ]]
	-- upvalues: t_48 (ref)
	return setmetatable({
		subscription_id = if p93 == nil or p93.subscription_id == nil then "" else p93.subscription_id
	}, t_48)
end

function t_48:encode() --[[ line: 12554 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2003 = 0
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		local var2004, var2005 = protoModule.writeTag(buff, var2003, 1, protoModule.wireTypes.lengthDelimited)
		var2004, var2005 = protoModule.writeString(var2004, var2005, self.subscription_id)
		buff = var2004
		var2003 = var2005
	end
	local buff_1 = buffer.create(var2003)
	buffer.copy(buff_1, 0, buff, 0, var2003)
	
	return buff_1
end

function t_48.decode(p94) --[[ line: 12570 ]]
	-- upvalues: t_48 (ref), protoModule (ref)
	local var2007 = t_48.new()
	local var2008 = 0
	while var2008 < buffer.len(p94) do
		local _ = nil
		local var2009 = nil
		local var2010, var2011, var2012 = protoModule.readTag(p94, var2008)
		local var2013 = var2010
		var2009 = var2011
		var2008 = var2012
		
		if var2009 == protoModule.wireTypes.varint then
			local _ = nil
			local var2014, var2015 = protoModule.readVarInt(p94, var2008)
			local _ = var2014
			var2008 = var2015
			continue
		end
		if var2009 == protoModule.wireTypes.lengthDelimited then
			if var2013 == 1 then
				local _ = nil
				local var2016, var2017 = protoModule.readBuffer(p94, var2008)
				var2008 = var2017
				var2007.subscription_id = buffer.tostring(var2016)
			else
				local _ = nil
				local var2018, var2019 = protoModule.readVarInt(p94, var2008)
				var2008 = var2019 + var2018
			end
		elseif var2009 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2020, var2021 = protoModule.readFixed32(p94, var2008)
			local _ = var2020
			var2008 = var2021
		elseif var2009 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2022, var2023 = protoModule.readFixed64(p94, var2008)
			local _ = var2022
			var2008 = var2023
		else
			error("Unsupported wire type: " .. var2009)
		end
	end
	return var2007
end

function t_48:jsonEncode() --[[ line: 12615 ]]
	local t = {}
	
	if self.subscription_id ~= nil and self.subscription_id ~= "" then
		t.subscriptionId = self.subscription_id
	end
	return t
end

function t_48:jsonDecode() --[[ line: 12627 ]]
	-- upvalues: t_48 (ref)
	local var2025 = t_48.new()
	
	if self.subscription_id ~= nil then
		var2025.subscription_id = self.subscription_id
	end
	if self.subscriptionId ~= nil then
		var2025.subscription_id = self.subscriptionId
	end
	return var2025
end

t_48.descriptor = {
	name = "SubscriptionCollectionInputData_SubscriptionItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.SubscriptionItem"
}
t.SubscriptionCollectionInputData_SubscriptionItem = t_48
typeRegistryModule.default:register(t.SubscriptionCollectionInputData_SubscriptionItem)
local t_49 = {}
t_49.__index = t_49

function t_49.new(p95) --[[ line: 12658 ]]
	-- upvalues: t_49 (ref)
	return setmetatable({
		items = if p95 == nil or p95.items == nil then {} else p95.items,
		universe_id = if p95 == nil or p95.universe_id == nil then "" else p95.universe_id,
		section_title = if p95 == nil or p95.section_title == nil then "" else p95.section_title
	}, t_49)
end

function t_49:encode() --[[ line: 12668 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2027 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var2028 = v:encode()
			local var2029, var2030 = protoModule.writeTag(buff, var2027, 1, protoModule.wireTypes.lengthDelimited)
			var2029, var2030 = protoModule.writeBuffer(var2029, var2030, var2028, buffer.len(var2028))
			buff = var2029
			var2027 = var2030
		end
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2031, var2032 = protoModule.writeTag(buff, var2027, 2, protoModule.wireTypes.lengthDelimited)
		var2031, var2032 = protoModule.writeString(var2031, var2032, self.universe_id)
		buff = var2031
		var2027 = var2032
	end
	if self.section_title ~= nil and self.section_title ~= "" then
		local var2033, var2034 = protoModule.writeTag(buff, var2027, 3, protoModule.wireTypes.lengthDelimited)
		var2033, var2034 = protoModule.writeString(var2033, var2034, self.section_title)
		buff = var2033
		var2027 = var2034
	end
	local buff_1 = buffer.create(var2027)
	buffer.copy(buff_1, 0, buff, 0, var2027)
	
	return buff_1
end

function t_49.decode(p96) --[[ line: 12695 ]]
	-- upvalues: t_49 (ref), protoModule (ref), t (ref)
	local var2036 = t_49.new()
	local var2037 = 0
	while var2037 < buffer.len(p96) do
		local _ = nil
		local var2038 = nil
		local var2039, var2040, var2041 = protoModule.readTag(p96, var2037)
		local var2042 = var2039
		var2038 = var2040
		var2037 = var2041
		
		if var2038 == protoModule.wireTypes.varint then
			local _ = nil
			local var2043, var2044 = protoModule.readVarInt(p96, var2037)
			local _ = var2043
			var2037 = var2044
			continue
		end
		if var2038 == protoModule.wireTypes.lengthDelimited then
			if var2042 == 1 then
				local _ = nil
				local var2045, var2046 = protoModule.readBuffer(p96, var2037)
				var2037 = var2046
				table.insert(var2036.items, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.decode(var2045))
			elseif var2042 == 2 then
				local _ = nil
				local var2047, var2048 = protoModule.readBuffer(p96, var2037)
				var2037 = var2048
				var2036.universe_id = buffer.tostring(var2047)
			elseif var2042 == 3 then
				local _ = nil
				local var2049, var2050 = protoModule.readBuffer(p96, var2037)
				var2037 = var2050
				var2036.section_title = buffer.tostring(var2049)
			else
				local _ = nil
				local var2051, var2052 = protoModule.readVarInt(p96, var2037)
				var2037 = var2052 + var2051
			end
		elseif var2038 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2053, var2054 = protoModule.readFixed32(p96, var2037)
			local _ = var2053
			var2037 = var2054
		elseif var2038 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2055, var2056 = protoModule.readFixed64(p96, var2037)
			local _ = var2055
			var2037 = var2056
		else
			error("Unsupported wire type: " .. var2038)
		end
	end
	return var2036
end

function t_49:jsonEncode() --[[ line: 12751 ]]
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
	return t
end

function t_49:jsonDecode() --[[ line: 12773 ]]
	-- upvalues: t_49 (ref), t (ref)
	local var2059 = t_49.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem.jsonDecode(v))
		end
		var2059.items = t_1
	end
	if self.universe_id ~= nil then
		var2059.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2059.universe_id = self.universeId
	end
	if self.section_title ~= nil then
		var2059.section_title = self.section_title
	end
	if self.sectionTitle ~= nil then
		var2059.section_title = self.sectionTitle
	end
	return var2059
end

t_49.descriptor = {
	name = "DynamicStoreCategoryInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryInputData"
}
t.DynamicStoreCategoryInputData = t_49
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData)
local t_50 = {}
t_50.__index = t_50

function t_50.new(p97) --[[ line: 12822 ]]
	-- upvalues: t (ref), t_50 (ref)
	return setmetatable({
		item_id = if p97 == nil or p97.item_id == nil then "" else p97.item_id,
		identifier = if p97 == nil or p97.identifier == nil then assert(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0), "Enum has no 0 default") else p97.identifier
	}, t_50)
end

function t_50:encode() --[[ line: 12839 ]]
	-- upvalues: protoModule (ref), t (ref)
	local buff = buffer.create(0)
	local var2062 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var2063, var2064 = protoModule.writeTag(buff, var2062, 1, protoModule.wireTypes.lengthDelimited)
		var2063, var2064 = protoModule.writeString(var2063, var2064, self.item_id)
		buff = var2063
		var2062 = var2064
	end
	if self.identifier ~= nil and (self.identifier ~= nil and self.identifier ~= 0 or self.identifier ~= t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(0)) then
		local var2065, var2066 = protoModule.writeTag(buff, var2062, 2, protoModule.wireTypes.varint)
		var2065, var2066 = protoModule.writeVarInt(var2065, var2066, t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.toNumber(self.identifier))
		buff = var2065
		var2062 = var2066
	end
	local buff_1 = buffer.create(var2062)
	buffer.copy(buff_1, 0, buff, 0, var2062)
	
	return buff_1
end

function t_50.decode(p98) --[[ line: 12871 ]]
	-- upvalues: t_50 (ref), protoModule (ref), t (ref)
	local var2068 = t_50.new()
	local var2069 = 0
	while var2069 < buffer.len(p98) do
		local _ = nil
		local var2070 = nil
		local var2071, var2072, var2073 = protoModule.readTag(p98, var2069)
		local var2074 = var2071
		var2070 = var2072
		var2069 = var2073
		
		if var2070 == protoModule.wireTypes.varint then
			if var2074 == 2 then
				local _ = nil
				local var2075, var2076 = protoModule.readVarIntI32(p98, var2069)
				local var2077 = var2075
				var2069 = var2076
				var2068.identifier = t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(var2077) or var2077
			else
				local _ = nil
				local var2078, var2079 = protoModule.readVarInt(p98, var2069)
				local _ = var2078
				var2069 = var2079
			end
		end
		if var2070 == protoModule.wireTypes.lengthDelimited then
			if var2074 == 1 then
				local _ = nil
				local var2080, var2081 = protoModule.readBuffer(p98, var2069)
				var2069 = var2081
				var2068.item_id = buffer.tostring(var2080)
			else
				local _ = nil
				local var2082, var2083 = protoModule.readVarInt(p98, var2069)
				var2069 = var2083 + var2082
			end
		elseif var2070 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2084, var2085 = protoModule.readFixed32(p98, var2069)
			local _ = var2084
			var2069 = var2085
		elseif var2070 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2086, var2087 = protoModule.readFixed64(p98, var2069)
			local _ = var2086
			var2069 = var2087
		else
			error("Unsupported wire type: " .. var2070)
		end
	end
	return var2068
end

function t_50:jsonEncode() --[[ line: 12923 ]]
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

function t_50:jsonDecode() --[[ line: 12950 ]]
	-- upvalues: t_50 (ref), t (ref)
	local var2089 = t_50.new()
	
	if self.item_id ~= nil then
		var2089.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var2089.item_id = self.itemId
	end
	if self.identifier ~= nil then
		var2089.identifier = if typeof(self.identifier) == "number" then t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromNumber(self.identifier) or self.identifier else t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType.fromName(self.identifier) or self.identifier
	end
	return var2089
end

t_50.descriptor = {
	name = "DynamicStoreCategoryInputData_DynamicStoreCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.DynamicStoreCategoryItem"
}
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem = t_50
typeRegistryModule.default:register(t.DynamicStoreCategoryInputData_DynamicStoreCategoryItem)
t.DynamicStoreCategoryInputData_DynamicStoreCategoryItemType = {
	fromNumber = function(p99) --[[ line: 12989 ]]
		return if p99 == 0 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p99 == 1 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p99 == 2 then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" else nil
	end,
	toNumber = function(p100) --[[ line: 13001 ]]
		return if p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then 0 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then 1 elseif p100 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then 2 else p100
	end,
	fromName = function(p101) --[[ line: 13013 ]]
		return if p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_INVALID" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_GAME_PASS" elseif p101 == "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" then "DYNAMIC_STORE_CATEGORY_ITEM_TYPE_DEVELOPER_PRODUCT" else nil
	end
}
local t_51 = {}
t_51.__index = t_51

function t_51.new(p102) --[[ line: 13030 ]]
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

function t_51:encode() --[[ line: 13046 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2091 = 0
	
	if self.roblox_component ~= nil and self.roblox_component ~= "" then
		local var2092, var2093 = protoModule.writeTag(buff, var2091, 1, protoModule.wireTypes.lengthDelimited)
		var2092, var2093 = protoModule.writeString(var2092, var2093, self.roblox_component)
		buff = var2092
		var2091 = var2093
	end
	if self.identifier ~= nil and self.identifier ~= "" then
		local var2094, var2095 = protoModule.writeTag(buff, var2091, 2, protoModule.wireTypes.lengthDelimited)
		var2094, var2095 = protoModule.writeString(var2094, var2095, self.identifier)
		buff = var2094
		var2091 = var2095
	end
	if self.title ~= nil and self.title ~= "" then
		local var2096, var2097 = protoModule.writeTag(buff, var2091, 3, protoModule.wireTypes.lengthDelimited)
		var2096, var2097 = protoModule.writeString(var2096, var2097, self.title)
		buff = var2096
		var2091 = var2097
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2098, var2099 = protoModule.writeTag(buff, var2091, 4, protoModule.wireTypes.lengthDelimited)
		var2098, var2099 = protoModule.writeString(var2098, var2099, self.user_id)
		buff = var2098
		var2091 = var2099
	end
	if self.description ~= nil and self.description ~= "" then
		local var2100, var2101 = protoModule.writeTag(buff, var2091, 5, protoModule.wireTypes.lengthDelimited)
		var2100, var2101 = protoModule.writeString(var2100, var2101, self.description)
		buff = var2100
		var2091 = var2101
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2102, var2103 = protoModule.writeTag(buff, var2091, 6, protoModule.wireTypes.lengthDelimited)
		var2102, var2103 = protoModule.writeString(var2102, var2103, self.cta_text)
		buff = var2102
		var2091 = var2103
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2104, var2105 = protoModule.writeTag(buff, var2091, 7, protoModule.wireTypes.lengthDelimited)
		var2104, var2105 = protoModule.writeString(var2104, var2105, self.prompt_id)
		buff = var2104
		var2091 = var2105
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2106, var2107 = protoModule.writeTag(buff, var2091, 8, protoModule.wireTypes.lengthDelimited)
		var2106, var2107 = protoModule.writeString(var2106, var2107, self.prompt_type)
		buff = var2106
		var2091 = var2107
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2108, var2109 = protoModule.writeTag(buff, var2091, 9, protoModule.wireTypes.lengthDelimited)
		var2108, var2109 = protoModule.writeString(var2108, var2109, self.entity_id)
		buff = var2108
		var2091 = var2109
	end
	local buff_1 = buffer.create(var2091)
	buffer.copy(buff_1, 0, buff, 0, var2091)
	
	return buff_1
end

function t_51.decode(p103) --[[ line: 13100 ]]
	-- upvalues: t_51 (ref), protoModule (ref)
	local var2111 = t_51.new()
	local var2112 = 0
	while var2112 < buffer.len(p103) do
		local _ = nil
		local var2113 = nil
		local var2114, var2115, var2116 = protoModule.readTag(p103, var2112)
		local var2117 = var2114
		var2113 = var2115
		var2112 = var2116
		
		if var2113 == protoModule.wireTypes.varint then
			local _ = nil
			local var2118, var2119 = protoModule.readVarInt(p103, var2112)
			local _ = var2118
			var2112 = var2119
			continue
		end
		if var2113 == protoModule.wireTypes.lengthDelimited then
			if var2117 == 1 then
				local _ = nil
				local var2120, var2121 = protoModule.readBuffer(p103, var2112)
				var2112 = var2121
				var2111.roblox_component = buffer.tostring(var2120)
			elseif var2117 == 2 then
				local _ = nil
				local var2122, var2123 = protoModule.readBuffer(p103, var2112)
				var2112 = var2123
				var2111.identifier = buffer.tostring(var2122)
			elseif var2117 == 3 then
				local _ = nil
				local var2124, var2125 = protoModule.readBuffer(p103, var2112)
				var2112 = var2125
				var2111.title = buffer.tostring(var2124)
			elseif var2117 == 4 then
				local _ = nil
				local var2126, var2127 = protoModule.readBuffer(p103, var2112)
				var2112 = var2127
				var2111.user_id = buffer.tostring(var2126)
			elseif var2117 == 5 then
				local _ = nil
				local var2128, var2129 = protoModule.readBuffer(p103, var2112)
				var2112 = var2129
				var2111.description = buffer.tostring(var2128)
			elseif var2117 == 6 then
				local _ = nil
				local var2130, var2131 = protoModule.readBuffer(p103, var2112)
				var2112 = var2131
				var2111.cta_text = buffer.tostring(var2130)
			elseif var2117 == 7 then
				local _ = nil
				local var2132, var2133 = protoModule.readBuffer(p103, var2112)
				var2112 = var2133
				var2111.prompt_id = buffer.tostring(var2132)
			elseif var2117 == 8 then
				local _ = nil
				local var2134, var2135 = protoModule.readBuffer(p103, var2112)
				var2112 = var2135
				var2111.prompt_type = buffer.tostring(var2134)
			elseif var2117 == 9 then
				local _ = nil
				local var2136, var2137 = protoModule.readBuffer(p103, var2112)
				var2112 = var2137
				var2111.entity_id = buffer.tostring(var2136)
			else
				local _ = nil
				local var2138, var2139 = protoModule.readVarInt(p103, var2112)
				var2112 = var2139 + var2138
			end
		elseif var2113 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2140, var2141 = protoModule.readFixed32(p103, var2112)
			local _ = var2140
			var2112 = var2141
		elseif var2113 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2142, var2143 = protoModule.readFixed64(p103, var2112)
			local _ = var2142
			var2112 = var2143
		else
			error("Unsupported wire type: " .. var2113)
		end
	end
	return var2111
end

function t_51:jsonEncode() --[[ line: 13183 ]]
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

function t_51:jsonDecode() --[[ line: 13225 ]]
	-- upvalues: t_51 (ref)
	local var2145 = t_51.new()
	
	if self.roblox_component ~= nil then
		var2145.roblox_component = self.roblox_component
	end
	if self.robloxComponent ~= nil then
		var2145.roblox_component = self.robloxComponent
	end
	if self.identifier ~= nil then
		var2145.identifier = self.identifier
	end
	if self.title ~= nil then
		var2145.title = self.title
	end
	if self.user_id ~= nil then
		var2145.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2145.user_id = self.userId
	end
	if self.description ~= nil then
		var2145.description = self.description
	end
	if self.cta_text ~= nil then
		var2145.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2145.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2145.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2145.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2145.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2145.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2145.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2145.entity_id = self.entityId
	end
	return var2145
end

t_51.descriptor = {
	name = "CardContainerCardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerCardInputData"
}
t.CardContainerCardInputData = t_51
typeRegistryModule.default:register(t.CardContainerCardInputData)
local t_52 = {}
t_52.__index = t_52

function t_52.new(p104) --[[ line: 13305 ]]
	-- upvalues: t_52 (ref)
	return setmetatable({
		group_id = if p104 == nil or p104.group_id == nil then "" else p104.group_id,
		experience_id = if p104 == nil or p104.experience_id == nil then "" else p104.experience_id
	}, t_52)
end

function t_52:encode() --[[ line: 13314 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2147 = 0
	
	if self.group_id ~= nil and self.group_id ~= "" then
		local var2148, var2149 = protoModule.writeTag(buff, var2147, 1, protoModule.wireTypes.lengthDelimited)
		var2148, var2149 = protoModule.writeString(var2148, var2149, self.group_id)
		buff = var2148
		var2147 = var2149
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		local var2150, var2151 = protoModule.writeTag(buff, var2147, 2, protoModule.wireTypes.lengthDelimited)
		var2150, var2151 = protoModule.writeString(var2150, var2151, self.experience_id)
		buff = var2150
		var2147 = var2151
	end
	local buff_1 = buffer.create(var2147)
	buffer.copy(buff_1, 0, buff, 0, var2147)
	
	return buff_1
end

function t_52.decode(p105) --[[ line: 13333 ]]
	-- upvalues: t_52 (ref), protoModule (ref)
	local var2153 = t_52.new()
	local var2154 = 0
	while var2154 < buffer.len(p105) do
		local _ = nil
		local var2155 = nil
		local var2156, var2157, var2158 = protoModule.readTag(p105, var2154)
		local var2159 = var2156
		var2155 = var2157
		var2154 = var2158
		
		if var2155 == protoModule.wireTypes.varint then
			local _ = nil
			local var2160, var2161 = protoModule.readVarInt(p105, var2154)
			local _ = var2160
			var2154 = var2161
			continue
		end
		if var2155 == protoModule.wireTypes.lengthDelimited then
			if var2159 == 1 then
				local _ = nil
				local var2162, var2163 = protoModule.readBuffer(p105, var2154)
				var2154 = var2163
				var2153.group_id = buffer.tostring(var2162)
			elseif var2159 == 2 then
				local _ = nil
				local var2164, var2165 = protoModule.readBuffer(p105, var2154)
				var2154 = var2165
				var2153.experience_id = buffer.tostring(var2164)
			else
				local _ = nil
				local var2166, var2167 = protoModule.readVarInt(p105, var2154)
				var2154 = var2167 + var2166
			end
		elseif var2155 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2168, var2169 = protoModule.readFixed32(p105, var2154)
			local _ = var2168
			var2154 = var2169
		elseif var2155 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2170, var2171 = protoModule.readFixed64(p105, var2154)
			local _ = var2170
			var2154 = var2171
		else
			error("Unsupported wire type: " .. var2155)
		end
	end
	return var2153
end

function t_52:jsonEncode() --[[ line: 13381 ]]
	local t = {}
	
	if self.group_id ~= nil and self.group_id ~= "" then
		t.groupId = self.group_id
	end
	if self.experience_id ~= nil and self.experience_id ~= "" then
		t.experienceId = self.experience_id
	end
	return t
end

function t_52:jsonDecode() --[[ line: 13395 ]]
	-- upvalues: t_52 (ref)
	local var2173 = t_52.new()
	
	if self.group_id ~= nil then
		var2173.group_id = self.group_id
	end
	if self.groupId ~= nil then
		var2173.group_id = self.groupId
	end
	if self.experience_id ~= nil then
		var2173.experience_id = self.experience_id
	end
	if self.experienceId ~= nil then
		var2173.experience_id = self.experienceId
	end
	return var2173
end

t_52.descriptor = {
	name = "CommunitiesCardClientAttributes",
	fullName = "roblox.apppageplatform.shared.v1beta1.CommunitiesCardClientAttributes"
}
t.CommunitiesCardClientAttributes = t_52
typeRegistryModule.default:register(t.CommunitiesCardClientAttributes)
local t_53 = {}
t_53.__index = t_53

function t_53.new(p106) --[[ line: 13431 ]]
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

function t_53:encode() --[[ line: 13445 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2175 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2176, var2177 = protoModule.writeTag(buff, var2175, 1, protoModule.wireTypes.lengthDelimited)
		var2176, var2177 = protoModule.writeString(var2176, var2177, self.title)
		buff = var2176
		var2175 = var2177
	end
	if self.dismiss_text ~= nil and self.dismiss_text ~= "" then
		local var2178, var2179 = protoModule.writeTag(buff, var2175, 2, protoModule.wireTypes.lengthDelimited)
		var2178, var2179 = protoModule.writeString(var2178, var2179, self.dismiss_text)
		buff = var2178
		var2175 = var2179
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2180, var2181 = protoModule.writeTag(buff, var2175, 3, protoModule.wireTypes.lengthDelimited)
		var2180, var2181 = protoModule.writeString(var2180, var2181, self.user_id)
		buff = var2180
		var2175 = var2181
	end
	if self.cards ~= nil and #self.cards > 0 then
		for i, v in self.cards do
			local var2182 = v:encode()
			local var2183, var2184 = protoModule.writeTag(buff, var2175, 4, protoModule.wireTypes.lengthDelimited)
			var2183, var2184 = protoModule.writeBuffer(var2183, var2184, var2182, buffer.len(var2182))
			buff = var2183
			var2175 = var2184
		end
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2185, var2186 = protoModule.writeTag(buff, var2175, 5, protoModule.wireTypes.lengthDelimited)
		var2185, var2186 = protoModule.writeString(var2185, var2186, self.prompt_id)
		buff = var2185
		var2175 = var2186
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2187, var2188 = protoModule.writeTag(buff, var2175, 6, protoModule.wireTypes.lengthDelimited)
		var2187, var2188 = protoModule.writeString(var2187, var2188, self.prompt_type)
		buff = var2187
		var2175 = var2188
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2189, var2190 = protoModule.writeTag(buff, var2175, 7, protoModule.wireTypes.lengthDelimited)
		var2189, var2190 = protoModule.writeString(var2189, var2190, self.sort_id)
		buff = var2189
		var2175 = var2190
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var2191, var2192 = protoModule.writeTag(buff, var2175, 8, protoModule.wireTypes.lengthDelimited)
		var2191, var2192 = protoModule.writeString(var2191, var2192, self.feed_item_key)
		buff = var2191
		var2175 = var2192
	end
	if self.client_attributes ~= nil and self.client_attributes.type == "communities_client_attributes" then
		local var2193 = self.client_attributes.value:encode()
		local var2194, var2195 = protoModule.writeTag(buff, var2175, 9, protoModule.wireTypes.lengthDelimited)
		var2194, var2195 = protoModule.writeBuffer(var2194, var2195, var2193, buffer.len(var2193))
		buff = var2194
		var2175 = var2195
	end
	local buff_1 = buffer.create(var2175)
	buffer.copy(buff_1, 0, buff, 0, var2175)
	
	return buff_1
end

function t_53.decode(p107) --[[ line: 13505 ]]
	-- upvalues: t_53 (ref), protoModule (ref), t (ref)
	local var2197 = t_53.new()
	local var2198 = 0
	while var2198 < buffer.len(p107) do
		local _ = nil
		local var2199 = nil
		local var2200, var2201, var2202 = protoModule.readTag(p107, var2198)
		local var2203 = var2200
		var2199 = var2201
		var2198 = var2202
		
		if var2199 == protoModule.wireTypes.varint then
			local _ = nil
			local var2204, var2205 = protoModule.readVarInt(p107, var2198)
			local _ = var2204
			var2198 = var2205
			continue
		end
		if var2199 == protoModule.wireTypes.lengthDelimited then
			if var2203 == 1 then
				local _ = nil
				local var2206, var2207 = protoModule.readBuffer(p107, var2198)
				var2198 = var2207
				var2197.title = buffer.tostring(var2206)
			elseif var2203 == 2 then
				local _ = nil
				local var2208, var2209 = protoModule.readBuffer(p107, var2198)
				var2198 = var2209
				var2197.dismiss_text = buffer.tostring(var2208)
			elseif var2203 == 3 then
				local _ = nil
				local var2210, var2211 = protoModule.readBuffer(p107, var2198)
				var2198 = var2211
				var2197.user_id = buffer.tostring(var2210)
			elseif var2203 == 4 then
				local _ = nil
				local var2212, var2213 = protoModule.readBuffer(p107, var2198)
				var2198 = var2213
				table.insert(var2197.cards, t.CardContainerCardInputData.decode(var2212))
			elseif var2203 == 5 then
				local _ = nil
				local var2214, var2215 = protoModule.readBuffer(p107, var2198)
				var2198 = var2215
				var2197.prompt_id = buffer.tostring(var2214)
			elseif var2203 == 6 then
				local _ = nil
				local var2216, var2217 = protoModule.readBuffer(p107, var2198)
				var2198 = var2217
				var2197.prompt_type = buffer.tostring(var2216)
			elseif var2203 == 7 then
				local _ = nil
				local var2218, var2219 = protoModule.readBuffer(p107, var2198)
				var2198 = var2219
				var2197.sort_id = buffer.tostring(var2218)
			elseif var2203 == 8 then
				local _ = nil
				local var2220, var2221 = protoModule.readBuffer(p107, var2198)
				var2198 = var2221
				var2197.feed_item_key = buffer.tostring(var2220)
			elseif var2203 == 9 then
				local _ = nil
				local var2222, var2223 = protoModule.readBuffer(p107, var2198)
				var2198 = var2223
				var2197.client_attributes = {
					type = "communities_client_attributes",
					value = t.CommunitiesCardClientAttributes.decode(var2222)
				}
			else
				local _ = nil
				local var2224, var2225 = protoModule.readVarInt(p107, var2198)
				var2198 = var2225 + var2224
			end
		elseif var2199 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2226, var2227 = protoModule.readFixed32(p107, var2198)
			local _ = var2226
			var2198 = var2227
		elseif var2199 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2228, var2229 = protoModule.readFixed64(p107, var2198)
			local _ = var2228
			var2198 = var2229
		else
			error("Unsupported wire type: " .. var2199)
		end
	end
	return var2197
end

function t_53:jsonEncode() --[[ line: 13591 ]]
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

function t_53:jsonDecode() --[[ line: 13639 ]]
	-- upvalues: t_53 (ref), t (ref)
	local var2232 = t_53.new()
	
	if self.title ~= nil then
		var2232.title = self.title
	end
	if self.dismiss_text ~= nil then
		var2232.dismiss_text = self.dismiss_text
	end
	if self.dismissText ~= nil then
		var2232.dismiss_text = self.dismissText
	end
	if self.user_id ~= nil then
		var2232.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2232.user_id = self.userId
	end
	if self.cards ~= nil then
		local t_1 = {}
		
		for i, v in self.cards do
			table.insert(t_1, t.CardContainerCardInputData.jsonDecode(v))
		end
		var2232.cards = t_1
	end
	if self.prompt_id ~= nil then
		var2232.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2232.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2232.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2232.prompt_type = self.promptType
	end
	if self.sort_id ~= nil then
		var2232.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2232.sort_id = self.sortId
	end
	if self.feed_item_key ~= nil then
		var2232.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var2232.feed_item_key = self.feedItemKey
	end
	if self.communities_client_attributes ~= nil then
		var2232.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communities_client_attributes)
		}
	end
	if self.communitiesClientAttributes ~= nil then
		var2232.client_attributes = {
			type = "communities_client_attributes",
			value = t.CommunitiesCardClientAttributes.jsonDecode(self.communitiesClientAttributes)
		}
	end
	return var2232
end

t_53.descriptor = {
	name = "CardContainerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardContainerInputData"
}
t.CardContainerInputData = t_53
typeRegistryModule.default:register(t.CardContainerInputData)
local t_54 = {}
t_54.__index = t_54

function t_54.new(p108) --[[ line: 13734 ]]
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

function t_54:encode() --[[ line: 13746 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2235 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2236, var2237 = protoModule.writeTag(buff, var2235, 1, protoModule.wireTypes.lengthDelimited)
		var2236, var2237 = protoModule.writeString(var2236, var2237, self.title)
		buff = var2236
		var2235 = var2237
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2238, var2239 = protoModule.writeTag(buff, var2235, 2, protoModule.wireTypes.lengthDelimited)
		var2238, var2239 = protoModule.writeString(var2238, var2239, self.user_id)
		buff = var2238
		var2235 = var2239
	end
	if self.description ~= nil and self.description ~= "" then
		local var2240, var2241 = protoModule.writeTag(buff, var2235, 3, protoModule.wireTypes.lengthDelimited)
		var2240, var2241 = protoModule.writeString(var2240, var2241, self.description)
		buff = var2240
		var2235 = var2241
	end
	if self.cta_text ~= nil and self.cta_text ~= "" then
		local var2242, var2243 = protoModule.writeTag(buff, var2235, 4, protoModule.wireTypes.lengthDelimited)
		var2242, var2243 = protoModule.writeString(var2242, var2243, self.cta_text)
		buff = var2242
		var2235 = var2243
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2244, var2245 = protoModule.writeTag(buff, var2235, 5, protoModule.wireTypes.lengthDelimited)
		var2244, var2245 = protoModule.writeString(var2244, var2245, self.prompt_id)
		buff = var2244
		var2235 = var2245
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2246, var2247 = protoModule.writeTag(buff, var2235, 6, protoModule.wireTypes.lengthDelimited)
		var2246, var2247 = protoModule.writeString(var2246, var2247, self.prompt_type)
		buff = var2246
		var2235 = var2247
	end
	if self.entity_id ~= nil and self.entity_id ~= "" then
		local var2248, var2249 = protoModule.writeTag(buff, var2235, 7, protoModule.wireTypes.lengthDelimited)
		var2248, var2249 = protoModule.writeString(var2248, var2249, self.entity_id)
		buff = var2248
		var2235 = var2249
	end
	local buff_1 = buffer.create(var2235)
	buffer.copy(buff_1, 0, buff, 0, var2235)
	
	return buff_1
end

function t_54.decode(p109) --[[ line: 13790 ]]
	-- upvalues: t_54 (ref), protoModule (ref)
	local var2251 = t_54.new()
	local var2252 = 0
	while var2252 < buffer.len(p109) do
		local _ = nil
		local var2253 = nil
		local var2254, var2255, var2256 = protoModule.readTag(p109, var2252)
		local var2257 = var2254
		var2253 = var2255
		var2252 = var2256
		
		if var2253 == protoModule.wireTypes.varint then
			local _ = nil
			local var2258, var2259 = protoModule.readVarInt(p109, var2252)
			local _ = var2258
			var2252 = var2259
			continue
		end
		if var2253 == protoModule.wireTypes.lengthDelimited then
			if var2257 == 1 then
				local _ = nil
				local var2260, var2261 = protoModule.readBuffer(p109, var2252)
				var2252 = var2261
				var2251.title = buffer.tostring(var2260)
			elseif var2257 == 2 then
				local _ = nil
				local var2262, var2263 = protoModule.readBuffer(p109, var2252)
				var2252 = var2263
				var2251.user_id = buffer.tostring(var2262)
			elseif var2257 == 3 then
				local _ = nil
				local var2264, var2265 = protoModule.readBuffer(p109, var2252)
				var2252 = var2265
				var2251.description = buffer.tostring(var2264)
			elseif var2257 == 4 then
				local _ = nil
				local var2266, var2267 = protoModule.readBuffer(p109, var2252)
				var2252 = var2267
				var2251.cta_text = buffer.tostring(var2266)
			elseif var2257 == 5 then
				local _ = nil
				local var2268, var2269 = protoModule.readBuffer(p109, var2252)
				var2252 = var2269
				var2251.prompt_id = buffer.tostring(var2268)
			elseif var2257 == 6 then
				local _ = nil
				local var2270, var2271 = protoModule.readBuffer(p109, var2252)
				var2252 = var2271
				var2251.prompt_type = buffer.tostring(var2270)
			elseif var2257 == 7 then
				local _ = nil
				local var2272, var2273 = protoModule.readBuffer(p109, var2252)
				var2252 = var2273
				var2251.entity_id = buffer.tostring(var2272)
			else
				local _ = nil
				local var2274, var2275 = protoModule.readVarInt(p109, var2252)
				var2252 = var2275 + var2274
			end
		elseif var2253 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2276, var2277 = protoModule.readFixed32(p109, var2252)
			local _ = var2276
			var2252 = var2277
		elseif var2253 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2278, var2279 = protoModule.readFixed64(p109, var2252)
			local _ = var2278
			var2252 = var2279
		else
			error("Unsupported wire type: " .. var2253)
		end
	end
	return var2251
end

function t_54:jsonEncode() --[[ line: 13863 ]]
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

function t_54:jsonDecode() --[[ line: 13897 ]]
	-- upvalues: t_54 (ref)
	local var2281 = t_54.new()
	
	if self.title ~= nil then
		var2281.title = self.title
	end
	if self.user_id ~= nil then
		var2281.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2281.user_id = self.userId
	end
	if self.description ~= nil then
		var2281.description = self.description
	end
	if self.cta_text ~= nil then
		var2281.cta_text = self.cta_text
	end
	if self.ctaText ~= nil then
		var2281.cta_text = self.ctaText
	end
	if self.prompt_id ~= nil then
		var2281.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2281.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2281.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2281.prompt_type = self.promptType
	end
	if self.entity_id ~= nil then
		var2281.entity_id = self.entity_id
	end
	if self.entityId ~= nil then
		var2281.entity_id = self.entityId
	end
	return var2281
end

t_54.descriptor = {
	name = "CardInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CardInputData"
}
t.CardInputData = t_54
typeRegistryModule.default:register(t.CardInputData)
local t_55 = {}
t_55.__index = t_55

function t_55.new(p110) --[[ line: 13965 ]]
	-- upvalues: t_55 (ref)
	return setmetatable({
		prompt_id = if p110 == nil or p110.prompt_id == nil then "" else p110.prompt_id,
		prompt_type = if p110 == nil or p110.prompt_type == nil then "" else p110.prompt_type,
		user_id = if p110 == nil or p110.user_id == nil then "" else p110.user_id,
		audit_data = if p110 == nil or p110.audit_data == nil then "" else p110.audit_data
	}, t_55)
end

function t_55:encode() --[[ line: 13974 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2283 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2284, var2285 = protoModule.writeTag(buff, var2283, 1, protoModule.wireTypes.lengthDelimited)
		var2284, var2285 = protoModule.writeString(var2284, var2285, self.prompt_id)
		buff = var2284
		var2283 = var2285
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2286, var2287 = protoModule.writeTag(buff, var2283, 2, protoModule.wireTypes.lengthDelimited)
		var2286, var2287 = protoModule.writeString(var2286, var2287, self.prompt_type)
		buff = var2286
		var2283 = var2287
	end
	if self.user_id ~= nil and self.user_id ~= "" then
		local var2288, var2289 = protoModule.writeTag(buff, var2283, 3, protoModule.wireTypes.lengthDelimited)
		var2288, var2289 = protoModule.writeString(var2288, var2289, self.user_id)
		buff = var2288
		var2283 = var2289
	end
	if self.audit_data ~= nil and self.audit_data ~= "" then
		local var2290, var2291 = protoModule.writeTag(buff, var2283, 4, protoModule.wireTypes.lengthDelimited)
		var2290, var2291 = protoModule.writeString(var2290, var2291, self.audit_data)
		buff = var2290
		var2283 = var2291
	end
	local buff_1 = buffer.create(var2283)
	buffer.copy(buff_1, 0, buff, 0, var2283)
	
	return buff_1
end

function t_55.decode(p111) --[[ line: 14003 ]]
	-- upvalues: t_55 (ref), protoModule (ref)
	local var2293 = t_55.new()
	local var2294 = 0
	while var2294 < buffer.len(p111) do
		local _ = nil
		local var2295 = nil
		local var2296, var2297, var2298 = protoModule.readTag(p111, var2294)
		local var2299 = var2296
		var2295 = var2297
		var2294 = var2298
		
		if var2295 == protoModule.wireTypes.varint then
			local _ = nil
			local var2300, var2301 = protoModule.readVarInt(p111, var2294)
			local _ = var2300
			var2294 = var2301
			continue
		end
		if var2295 == protoModule.wireTypes.lengthDelimited then
			if var2299 == 1 then
				local _ = nil
				local var2302, var2303 = protoModule.readBuffer(p111, var2294)
				var2294 = var2303
				var2293.prompt_id = buffer.tostring(var2302)
			elseif var2299 == 2 then
				local _ = nil
				local var2304, var2305 = protoModule.readBuffer(p111, var2294)
				var2294 = var2305
				var2293.prompt_type = buffer.tostring(var2304)
			elseif var2299 == 3 then
				local _ = nil
				local var2306, var2307 = protoModule.readBuffer(p111, var2294)
				var2294 = var2307
				var2293.user_id = buffer.tostring(var2306)
			elseif var2299 == 4 then
				local _ = nil
				local var2308, var2309 = protoModule.readBuffer(p111, var2294)
				var2294 = var2309
				var2293.audit_data = buffer.tostring(var2308)
			else
				local _ = nil
				local var2310, var2311 = protoModule.readVarInt(p111, var2294)
				var2294 = var2311 + var2310
			end
		elseif var2295 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2312, var2313 = protoModule.readFixed32(p111, var2294)
			local _ = var2312
			var2294 = var2313
		elseif var2295 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2314, var2315 = protoModule.readFixed64(p111, var2294)
			local _ = var2314
			var2294 = var2315
		else
			error("Unsupported wire type: " .. var2295)
		end
	end
	return var2293
end

function t_55:jsonEncode() --[[ line: 14061 ]]
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

function t_55:jsonDecode() --[[ line: 14083 ]]
	-- upvalues: t_55 (ref)
	local var2317 = t_55.new()
	
	if self.prompt_id ~= nil then
		var2317.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2317.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2317.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2317.prompt_type = self.promptType
	end
	if self.user_id ~= nil then
		var2317.user_id = self.user_id
	end
	if self.userId ~= nil then
		var2317.user_id = self.userId
	end
	if self.audit_data ~= nil then
		var2317.audit_data = self.audit_data
	end
	if self.auditData ~= nil then
		var2317.audit_data = self.auditData
	end
	return var2317
end

t_55.descriptor = {
	name = "DialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.DialogInputData"
}
t.DialogInputData = t_55
typeRegistryModule.default:register(t.DialogInputData)
local t_56 = {}
t_56.__index = t_56

function t_56.new(p112) --[[ line: 14135 ]]
	-- upvalues: t_56 (ref)
	return setmetatable({
		sender_count = if p112 == nil or p112.sender_count == nil then 0 else p112.sender_count,
		total_robux_amount = if p112 == nil or p112.total_robux_amount == nil then 0 else p112.total_robux_amount
	}, t_56)
end

function t_56:encode() --[[ line: 14142 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2319 = 0
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		local var2320, var2321 = protoModule.writeTag(buff, var2319, 1, protoModule.wireTypes.varint)
		var2320, var2321 = protoModule.writeVarInt(var2320, var2321, self.sender_count)
		buff = var2320
		var2319 = var2321
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		local var2322, var2323 = protoModule.writeTag(buff, var2319, 2, protoModule.wireTypes.varint)
		var2322, var2323 = protoModule.writeVarInt(var2322, var2323, self.total_robux_amount)
		buff = var2322
		var2319 = var2323
	end
	local buff_1 = buffer.create(var2319)
	buffer.copy(buff_1, 0, buff, 0, var2319)
	
	return buff_1
end

function t_56.decode(p113) --[[ line: 14161 ]]
	-- upvalues: t_56 (ref), protoModule (ref)
	local var2325 = t_56.new()
	local var2326 = 0
	while var2326 < buffer.len(p113) do
		local _ = nil
		local _ = nil
		local var2327, var2328, var2329 = protoModule.readTag(p113, var2326)
		local var2330 = var2327
		local var2331 = var2328
		var2326 = var2329
		
		if var2331 == protoModule.wireTypes.varint then
			if var2330 == 1 then
				local _ = nil
				local var2332, var2333 = protoModule.readVarIntI32(p113, var2326)
				var2326 = var2333
				var2325.sender_count = var2332
			elseif var2330 == 2 then
				local _ = nil
				local var2334, var2335 = protoModule.readVarIntI64(p113, var2326)
				var2326 = var2335
				var2325.total_robux_amount = var2334
			else
				local _ = nil
				local var2336, var2337 = protoModule.readVarInt(p113, var2326)
				local _ = var2336
				var2326 = var2337
			end
		elseif var2331 == protoModule.wireTypes.lengthDelimited then
			local _ = nil
			local var2338, var2339 = protoModule.readVarInt(p113, var2326)
			var2326 = var2339 + var2338
		elseif var2331 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2340, var2341 = protoModule.readFixed32(p113, var2326)
			local _ = var2340
			var2326 = var2341
		elseif var2331 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2342, var2343 = protoModule.readFixed64(p113, var2326)
			local _ = var2342
			var2326 = var2343
		else
			error("Unsupported wire type: " .. var2331)
		end
	end
	return var2325
end

function t_56:jsonEncode() --[[ line: 14209 ]]
	local t = {}
	
	if self.sender_count ~= nil and self.sender_count ~= 0 then
		t.senderCount = self.sender_count
	end
	if self.total_robux_amount ~= nil and self.total_robux_amount ~= 0 then
		t.totalRobuxAmount = self.total_robux_amount
	end
	return t
end

function t_56:jsonDecode() --[[ line: 14223 ]]
	-- upvalues: t_56 (ref)
	local var2345 = t_56.new()
	
	if self.sender_count ~= nil then
		var2345.sender_count = self.sender_count
	end
	if self.senderCount ~= nil then
		var2345.sender_count = self.senderCount
	end
	if self.total_robux_amount ~= nil then
		var2345.total_robux_amount = self.total_robux_amount
	end
	if self.totalRobuxAmount ~= nil then
		var2345.total_robux_amount = self.totalRobuxAmount
	end
	return var2345
end

t_56.descriptor = {
	name = "IncomingTransferContent",
	fullName = "roblox.apppageplatform.shared.v1beta1.IncomingTransferContent"
}
t.IncomingTransferContent = t_56
typeRegistryModule.default:register(t.IncomingTransferContent)
local t_57 = {}
t_57.__index = t_57

function t_57.new(p114) --[[ line: 14259 ]]
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

function t_57:encode() --[[ line: 14272 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2347 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var2348, var2349 = protoModule.writeTag(buff, var2347, 1, protoModule.wireTypes.lengthDelimited)
		var2348, var2349 = protoModule.writeString(var2348, var2349, self.title)
		buff = var2348
		var2347 = var2349
	end
	if self.description ~= nil and self.description ~= "" then
		local var2350, var2351 = protoModule.writeTag(buff, var2347, 2, protoModule.wireTypes.lengthDelimited)
		var2350, var2351 = protoModule.writeString(var2350, var2351, self.description)
		buff = var2350
		var2347 = var2351
	end
	if self.primary_text ~= nil and self.primary_text ~= "" then
		local var2352, var2353 = protoModule.writeTag(buff, var2347, 3, protoModule.wireTypes.lengthDelimited)
		var2352, var2353 = protoModule.writeString(var2352, var2353, self.primary_text)
		buff = var2352
		var2347 = var2353
	end
	if self.secondary_text ~= nil and self.secondary_text ~= "" then
		local var2354, var2355 = protoModule.writeTag(buff, var2347, 4, protoModule.wireTypes.lengthDelimited)
		var2354, var2355 = protoModule.writeString(var2354, var2355, self.secondary_text)
		buff = var2354
		var2347 = var2355
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2356, var2357 = protoModule.writeTag(buff, var2347, 5, protoModule.wireTypes.lengthDelimited)
		var2356, var2357 = protoModule.writeString(var2356, var2357, self.prompt_id)
		buff = var2356
		var2347 = var2357
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2358, var2359 = protoModule.writeTag(buff, var2347, 6, protoModule.wireTypes.lengthDelimited)
		var2358, var2359 = protoModule.writeString(var2358, var2359, self.prompt_type)
		buff = var2358
		var2347 = var2359
	end
	if self.times_seen ~= nil and self.times_seen ~= 0 then
		local var2360, var2361 = protoModule.writeTag(buff, var2347, 7, protoModule.wireTypes.varint)
		var2360, var2361 = protoModule.writeVarInt(var2360, var2361, self.times_seen)
		buff = var2360
		var2347 = var2361
	end
	if self.content ~= nil and self.content.type == "incoming_transfer_content" then
		local var2362 = self.content.value:encode()
		local var2363, var2364 = protoModule.writeTag(buff, var2347, 8, protoModule.wireTypes.lengthDelimited)
		var2363, var2364 = protoModule.writeBuffer(var2363, var2364, var2362, buffer.len(var2362))
		buff = var2363
		var2347 = var2364
	end
	local buff_1 = buffer.create(var2347)
	buffer.copy(buff_1, 0, buff, 0, var2347)
	
	return buff_1
end

function t_57.decode(p115) --[[ line: 14324 ]]
	-- upvalues: t_57 (ref), protoModule (ref), t (ref)
	local var2366 = t_57.new()
	local var2367 = 0
	while var2367 < buffer.len(p115) do
		local _ = nil
		local var2368 = nil
		local var2369, var2370, var2371 = protoModule.readTag(p115, var2367)
		local var2372 = var2369
		var2368 = var2370
		var2367 = var2371
		
		if var2368 == protoModule.wireTypes.varint then
			if var2372 == 7 then
				local _ = nil
				local var2373, var2374 = protoModule.readVarIntI32(p115, var2367)
				var2367 = var2374
				var2366.times_seen = var2373
			else
				local _ = nil
				local var2375, var2376 = protoModule.readVarInt(p115, var2367)
				local _ = var2375
				var2367 = var2376
			end
		end
		if var2368 == protoModule.wireTypes.lengthDelimited then
			if var2372 == 1 then
				local _ = nil
				local var2377, var2378 = protoModule.readBuffer(p115, var2367)
				var2367 = var2378
				var2366.title = buffer.tostring(var2377)
			elseif var2372 == 2 then
				local _ = nil
				local var2379, var2380 = protoModule.readBuffer(p115, var2367)
				var2367 = var2380
				var2366.description = buffer.tostring(var2379)
			elseif var2372 == 3 then
				local _ = nil
				local var2381, var2382 = protoModule.readBuffer(p115, var2367)
				var2367 = var2382
				var2366.primary_text = buffer.tostring(var2381)
			elseif var2372 == 4 then
				local _ = nil
				local var2383, var2384 = protoModule.readBuffer(p115, var2367)
				var2367 = var2384
				var2366.secondary_text = buffer.tostring(var2383)
			elseif var2372 == 5 then
				local _ = nil
				local var2385, var2386 = protoModule.readBuffer(p115, var2367)
				var2367 = var2386
				var2366.prompt_id = buffer.tostring(var2385)
			elseif var2372 == 6 then
				local _ = nil
				local var2387, var2388 = protoModule.readBuffer(p115, var2367)
				var2367 = var2388
				var2366.prompt_type = buffer.tostring(var2387)
			elseif var2372 == 8 then
				local _ = nil
				local var2389, var2390 = protoModule.readBuffer(p115, var2367)
				var2367 = var2390
				var2366.content = {
					type = "incoming_transfer_content",
					value = t.IncomingTransferContent.decode(var2389)
				}
			else
				local _ = nil
				local var2391, var2392 = protoModule.readVarInt(p115, var2367)
				var2367 = var2392 + var2391
			end
		elseif var2368 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2393, var2394 = protoModule.readFixed32(p115, var2367)
			local _ = var2393
			var2367 = var2394
		elseif var2368 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2395, var2396 = protoModule.readFixed64(p115, var2367)
			local _ = var2395
			var2367 = var2396
		else
			error("Unsupported wire type: " .. var2368)
		end
	end
	return var2366
end

function t_57:jsonEncode() --[[ line: 14403 ]]
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

function t_57:jsonDecode() --[[ line: 14443 ]]
	-- upvalues: t_57 (ref), t (ref)
	local var2398 = t_57.new()
	
	if self.title ~= nil then
		var2398.title = self.title
	end
	if self.description ~= nil then
		var2398.description = self.description
	end
	if self.primary_text ~= nil then
		var2398.primary_text = self.primary_text
	end
	if self.primaryText ~= nil then
		var2398.primary_text = self.primaryText
	end
	if self.secondary_text ~= nil then
		var2398.secondary_text = self.secondary_text
	end
	if self.secondaryText ~= nil then
		var2398.secondary_text = self.secondaryText
	end
	if self.prompt_id ~= nil then
		var2398.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2398.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2398.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2398.prompt_type = self.promptType
	end
	if self.times_seen ~= nil then
		var2398.times_seen = self.times_seen
	end
	if self.timesSeen ~= nil then
		var2398.times_seen = self.timesSeen
	end
	if self.incoming_transfer_content ~= nil then
		var2398.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incoming_transfer_content)
		}
	end
	if self.incomingTransferContent ~= nil then
		var2398.content = {
			type = "incoming_transfer_content",
			value = t.IncomingTransferContent.jsonDecode(self.incomingTransferContent)
		}
	end
	return var2398
end

t_57.descriptor = {
	name = "BannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.BannerInputData"
}
t.BannerInputData = t_57
typeRegistryModule.default:register(t.BannerInputData)
local t_58 = {}
t_58.__index = t_58

function t_58.new(p116) --[[ line: 14525 ]]
	-- upvalues: t_58 (ref)
	return setmetatable({
		tooltip_text = if p116 == nil or p116.tooltip_text == nil then "" else p116.tooltip_text,
		prompt_id = if p116 == nil or p116.prompt_id == nil then "" else p116.prompt_id,
		prompt_type = if p116 == nil or p116.prompt_type == nil then "" else p116.prompt_type
	}, t_58)
end

function t_58:encode() --[[ line: 14533 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2400 = 0
	
	if self.tooltip_text ~= nil and self.tooltip_text ~= "" then
		local var2401, var2402 = protoModule.writeTag(buff, var2400, 1, protoModule.wireTypes.lengthDelimited)
		var2401, var2402 = protoModule.writeString(var2401, var2402, self.tooltip_text)
		buff = var2401
		var2400 = var2402
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2403, var2404 = protoModule.writeTag(buff, var2400, 2, protoModule.wireTypes.lengthDelimited)
		var2403, var2404 = protoModule.writeString(var2403, var2404, self.prompt_id)
		buff = var2403
		var2400 = var2404
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2405, var2406 = protoModule.writeTag(buff, var2400, 3, protoModule.wireTypes.lengthDelimited)
		var2405, var2406 = protoModule.writeString(var2405, var2406, self.prompt_type)
		buff = var2405
		var2400 = var2406
	end
	local buff_1 = buffer.create(var2400)
	buffer.copy(buff_1, 0, buff, 0, var2400)
	
	return buff_1
end

function t_58.decode(p117) --[[ line: 14557 ]]
	-- upvalues: t_58 (ref), protoModule (ref)
	local var2408 = t_58.new()
	local var2409 = 0
	while var2409 < buffer.len(p117) do
		local _ = nil
		local var2410 = nil
		local var2411, var2412, var2413 = protoModule.readTag(p117, var2409)
		local var2414 = var2411
		var2410 = var2412
		var2409 = var2413
		
		if var2410 == protoModule.wireTypes.varint then
			local _ = nil
			local var2415, var2416 = protoModule.readVarInt(p117, var2409)
			local _ = var2415
			var2409 = var2416
			continue
		end
		if var2410 == protoModule.wireTypes.lengthDelimited then
			if var2414 == 1 then
				local _ = nil
				local var2417, var2418 = protoModule.readBuffer(p117, var2409)
				var2409 = var2418
				var2408.tooltip_text = buffer.tostring(var2417)
			elseif var2414 == 2 then
				local _ = nil
				local var2419, var2420 = protoModule.readBuffer(p117, var2409)
				var2409 = var2420
				var2408.prompt_id = buffer.tostring(var2419)
			elseif var2414 == 3 then
				local _ = nil
				local var2421, var2422 = protoModule.readBuffer(p117, var2409)
				var2409 = var2422
				var2408.prompt_type = buffer.tostring(var2421)
			else
				local _ = nil
				local var2423, var2424 = protoModule.readVarInt(p117, var2409)
				var2409 = var2424 + var2423
			end
		elseif var2410 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2425, var2426 = protoModule.readFixed32(p117, var2409)
			local _ = var2425
			var2409 = var2426
		elseif var2410 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2427, var2428 = protoModule.readFixed64(p117, var2409)
			local _ = var2427
			var2409 = var2428
		else
			error("Unsupported wire type: " .. var2410)
		end
	end
	return var2408
end

function t_58:jsonEncode() --[[ line: 14610 ]]
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

function t_58:jsonDecode() --[[ line: 14628 ]]
	-- upvalues: t_58 (ref)
	local var2430 = t_58.new()
	
	if self.tooltip_text ~= nil then
		var2430.tooltip_text = self.tooltip_text
	end
	if self.tooltipText ~= nil then
		var2430.tooltip_text = self.tooltipText
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
	return var2430
end

t_58.descriptor = {
	name = "TooltipInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TooltipInputData"
}
t.TooltipInputData = t_58
typeRegistryModule.default:register(t.TooltipInputData)
local t_59 = {}
t_59.__index = t_59

function t_59.new(p118) --[[ line: 14672 ]]
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

function t_59:encode() --[[ line: 14683 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2432 = 0
	
	if self.media_id ~= nil and self.media_id ~= "" then
		local var2433, var2434 = protoModule.writeTag(buff, var2432, 1, protoModule.wireTypes.lengthDelimited)
		var2433, var2434 = protoModule.writeString(var2433, var2434, self.media_id)
		buff = var2433
		var2432 = var2434
	end
	if self.title ~= nil and self.title ~= "" then
		local var2435, var2436 = protoModule.writeTag(buff, var2432, 2, protoModule.wireTypes.lengthDelimited)
		var2435, var2436 = protoModule.writeString(var2435, var2436, self.title)
		buff = var2435
		var2432 = var2436
	end
	if self.description ~= nil and self.description ~= "" then
		local var2437, var2438 = protoModule.writeTag(buff, var2432, 3, protoModule.wireTypes.lengthDelimited)
		var2437, var2438 = protoModule.writeString(var2437, var2438, self.description)
		buff = var2437
		var2432 = var2438
	end
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2439, var2440 = protoModule.writeTag(buff, var2432, 4, protoModule.wireTypes.lengthDelimited)
		var2439, var2440 = protoModule.writeString(var2439, var2440, self.prompt_id)
		buff = var2439
		var2432 = var2440
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2441, var2442 = protoModule.writeTag(buff, var2432, 5, protoModule.wireTypes.lengthDelimited)
		var2441, var2442 = protoModule.writeString(var2441, var2442, self.prompt_type)
		buff = var2441
		var2432 = var2442
	end
	if self.anchor_tag ~= nil and self.anchor_tag ~= "" then
		local var2443, var2444 = protoModule.writeTag(buff, var2432, 6, protoModule.wireTypes.lengthDelimited)
		var2443, var2444 = protoModule.writeString(var2443, var2444, self.anchor_tag)
		buff = var2443
		var2432 = var2444
	end
	local buff_1 = buffer.create(var2432)
	buffer.copy(buff_1, 0, buff, 0, var2432)
	
	return buff_1
end

function t_59.decode(p119) --[[ line: 14722 ]]
	-- upvalues: t_59 (ref), protoModule (ref)
	local var2446 = t_59.new()
	local var2447 = 0
	while var2447 < buffer.len(p119) do
		local _ = nil
		local var2448 = nil
		local var2449, var2450, var2451 = protoModule.readTag(p119, var2447)
		local var2452 = var2449
		var2448 = var2450
		var2447 = var2451
		
		if var2448 == protoModule.wireTypes.varint then
			local _ = nil
			local var2453, var2454 = protoModule.readVarInt(p119, var2447)
			local _ = var2453
			var2447 = var2454
			continue
		end
		if var2448 == protoModule.wireTypes.lengthDelimited then
			if var2452 == 1 then
				local _ = nil
				local var2455, var2456 = protoModule.readBuffer(p119, var2447)
				var2447 = var2456
				var2446.media_id = buffer.tostring(var2455)
			elseif var2452 == 2 then
				local _ = nil
				local var2457, var2458 = protoModule.readBuffer(p119, var2447)
				var2447 = var2458
				var2446.title = buffer.tostring(var2457)
			elseif var2452 == 3 then
				local _ = nil
				local var2459, var2460 = protoModule.readBuffer(p119, var2447)
				var2447 = var2460
				var2446.description = buffer.tostring(var2459)
			elseif var2452 == 4 then
				local _ = nil
				local var2461, var2462 = protoModule.readBuffer(p119, var2447)
				var2447 = var2462
				var2446.prompt_id = buffer.tostring(var2461)
			elseif var2452 == 5 then
				local _ = nil
				local var2463, var2464 = protoModule.readBuffer(p119, var2447)
				var2447 = var2464
				var2446.prompt_type = buffer.tostring(var2463)
			elseif var2452 == 6 then
				local _ = nil
				local var2465, var2466 = protoModule.readBuffer(p119, var2447)
				var2447 = var2466
				var2446.anchor_tag = buffer.tostring(var2465)
			else
				local _ = nil
				local var2467, var2468 = protoModule.readVarInt(p119, var2447)
				var2447 = var2468 + var2467
			end
		elseif var2448 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2469, var2470 = protoModule.readFixed32(p119, var2447)
			local _ = var2469
			var2447 = var2470
		elseif var2448 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2471, var2472 = protoModule.readFixed64(p119, var2447)
			local _ = var2471
			var2447 = var2472
		else
			error("Unsupported wire type: " .. var2448)
		end
	end
	return var2446
end

function t_59:jsonEncode() --[[ line: 14790 ]]
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

function t_59:jsonDecode() --[[ line: 14820 ]]
	-- upvalues: t_59 (ref)
	local var2474 = t_59.new()
	
	if self.media_id ~= nil then
		var2474.media_id = self.media_id
	end
	if self.mediaId ~= nil then
		var2474.media_id = self.mediaId
	end
	if self.title ~= nil then
		var2474.title = self.title
	end
	if self.description ~= nil then
		var2474.description = self.description
	end
	if self.prompt_id ~= nil then
		var2474.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2474.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2474.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2474.prompt_type = self.promptType
	end
	if self.anchor_tag ~= nil then
		var2474.anchor_tag = self.anchor_tag
	end
	if self.anchorTag ~= nil then
		var2474.anchor_tag = self.anchorTag
	end
	return var2474
end

t_59.descriptor = {
	name = "CoachmarkInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CoachmarkInputData"
}
t.CoachmarkInputData = t_59
typeRegistryModule.default:register(t.CoachmarkInputData)
local t_60 = {}
t_60.__index = t_60

function t_60.new(p120) --[[ line: 14880 ]]
	-- upvalues: t_60 (ref)
	return setmetatable({
		prompt_id = if p120 == nil or p120.prompt_id == nil then "" else p120.prompt_id,
		prompt_type = if p120 == nil or p120.prompt_type == nil then "" else p120.prompt_type
	}, t_60)
end

function t_60:encode() --[[ line: 14887 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2476 = 0
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		local var2477, var2478 = protoModule.writeTag(buff, var2476, 1, protoModule.wireTypes.lengthDelimited)
		var2477, var2478 = protoModule.writeString(var2477, var2478, self.prompt_id)
		buff = var2477
		var2476 = var2478
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		local var2479, var2480 = protoModule.writeTag(buff, var2476, 2, protoModule.wireTypes.lengthDelimited)
		var2479, var2480 = protoModule.writeString(var2479, var2480, self.prompt_type)
		buff = var2479
		var2476 = var2480
	end
	local buff_1 = buffer.create(var2476)
	buffer.copy(buff_1, 0, buff, 0, var2476)
	
	return buff_1
end

function t_60.decode(p121) --[[ line: 14906 ]]
	-- upvalues: t_60 (ref), protoModule (ref)
	local var2482 = t_60.new()
	local var2483 = 0
	while var2483 < buffer.len(p121) do
		local _ = nil
		local var2484 = nil
		local var2485, var2486, var2487 = protoModule.readTag(p121, var2483)
		local var2488 = var2485
		var2484 = var2486
		var2483 = var2487
		
		if var2484 == protoModule.wireTypes.varint then
			local _ = nil
			local var2489, var2490 = protoModule.readVarInt(p121, var2483)
			local _ = var2489
			var2483 = var2490
			continue
		end
		if var2484 == protoModule.wireTypes.lengthDelimited then
			if var2488 == 1 then
				local _ = nil
				local var2491, var2492 = protoModule.readBuffer(p121, var2483)
				var2483 = var2492
				var2482.prompt_id = buffer.tostring(var2491)
			elseif var2488 == 2 then
				local _ = nil
				local var2493, var2494 = protoModule.readBuffer(p121, var2483)
				var2483 = var2494
				var2482.prompt_type = buffer.tostring(var2493)
			else
				local _ = nil
				local var2495, var2496 = protoModule.readVarInt(p121, var2483)
				var2483 = var2496 + var2495
			end
		elseif var2484 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2497, var2498 = protoModule.readFixed32(p121, var2483)
			local _ = var2497
			var2483 = var2498
		elseif var2484 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2499, var2500 = protoModule.readFixed64(p121, var2483)
			local _ = var2499
			var2483 = var2500
		else
			error("Unsupported wire type: " .. var2484)
		end
	end
	return var2482
end

function t_60:jsonEncode() --[[ line: 14954 ]]
	local t = {}
	
	if self.prompt_id ~= nil and self.prompt_id ~= "" then
		t.promptId = self.prompt_id
	end
	if self.prompt_type ~= nil and self.prompt_type ~= "" then
		t.promptType = self.prompt_type
	end
	return t
end

function t_60:jsonDecode() --[[ line: 14968 ]]
	-- upvalues: t_60 (ref)
	local var2502 = t_60.new()
	
	if self.prompt_id ~= nil then
		var2502.prompt_id = self.prompt_id
	end
	if self.promptId ~= nil then
		var2502.prompt_id = self.promptId
	end
	if self.prompt_type ~= nil then
		var2502.prompt_type = self.prompt_type
	end
	if self.promptType ~= nil then
		var2502.prompt_type = self.promptType
	end
	return var2502
end

t_60.descriptor = {
	name = "SystemBannerInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SystemBannerInputData"
}
t.SystemBannerInputData = t_60
typeRegistryModule.default:register(t.SystemBannerInputData)
local t_61 = {}
t_61.__index = t_61

function t_61.new(p122) --[[ line: 15004 ]]
	-- upvalues: t_61 (ref)
	return setmetatable({
		upsell_prompt = if p122 == nil or p122.upsell_prompt == nil then "" else p122.upsell_prompt
	}, t_61)
end

function t_61:encode() --[[ line: 15010 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2504 = 0
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		local var2505, var2506 = protoModule.writeTag(buff, var2504, 1, protoModule.wireTypes.lengthDelimited)
		var2505, var2506 = protoModule.writeString(var2505, var2506, self.upsell_prompt)
		buff = var2505
		var2504 = var2506
	end
	local buff_1 = buffer.create(var2504)
	buffer.copy(buff_1, 0, buff, 0, var2504)
	
	return buff_1
end

function t_61.decode(p123) --[[ line: 15024 ]]
	-- upvalues: t_61 (ref), protoModule (ref)
	local var2508 = t_61.new()
	local var2509 = 0
	while var2509 < buffer.len(p123) do
		local _ = nil
		local var2510 = nil
		local var2511, var2512, var2513 = protoModule.readTag(p123, var2509)
		local var2514 = var2511
		var2510 = var2512
		var2509 = var2513
		
		if var2510 == protoModule.wireTypes.varint then
			local _ = nil
			local var2515, var2516 = protoModule.readVarInt(p123, var2509)
			local _ = var2515
			var2509 = var2516
			continue
		end
		if var2510 == protoModule.wireTypes.lengthDelimited then
			if var2514 == 1 then
				local _ = nil
				local var2517, var2518 = protoModule.readBuffer(p123, var2509)
				var2509 = var2518
				var2508.upsell_prompt = buffer.tostring(var2517)
			else
				local _ = nil
				local var2519, var2520 = protoModule.readVarInt(p123, var2509)
				var2509 = var2520 + var2519
			end
		elseif var2510 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2521, var2522 = protoModule.readFixed32(p123, var2509)
			local _ = var2521
			var2509 = var2522
		elseif var2510 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2523, var2524 = protoModule.readFixed64(p123, var2509)
			local _ = var2523
			var2509 = var2524
		else
			error("Unsupported wire type: " .. var2510)
		end
	end
	return var2508
end

function t_61:jsonEncode() --[[ line: 15067 ]]
	local t = {}
	
	if self.upsell_prompt ~= nil and self.upsell_prompt ~= "" then
		t.upsellPrompt = self.upsell_prompt
	end
	return t
end

function t_61:jsonDecode() --[[ line: 15077 ]]
	-- upvalues: t_61 (ref)
	local var2526 = t_61.new()
	
	if self.upsell_prompt ~= nil then
		var2526.upsell_prompt = self.upsell_prompt
	end
	if self.upsellPrompt ~= nil then
		var2526.upsell_prompt = self.upsellPrompt
	end
	return var2526
end

t_61.descriptor = {
	name = "AgeCheckUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AgeCheckUpsellInputData"
}
t.AgeCheckUpsellInputData = t_61
typeRegistryModule.default:register(t.AgeCheckUpsellInputData)
local t_62 = {}
t_62.__index = t_62

function t_62.new(p124) --[[ line: 15105 ]]
	-- upvalues: t_62 (ref)
	return setmetatable({
		modal_variant = if p124 == nil or p124.modal_variant == nil then "" else p124.modal_variant,
		modal_sequence = if p124 == nil or p124.modal_sequence == nil then "" else p124.modal_sequence,
		conversation_id = if p124 == nil or p124.conversation_id == nil then "" else p124.conversation_id,
		friend_id = if p124 == nil or p124.friend_id == nil then "" else p124.friend_id
	}, t_62)
end

function t_62:encode() --[[ line: 15116 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2528 = 0
	
	if self.modal_variant ~= nil and self.modal_variant ~= "" then
		local var2529, var2530 = protoModule.writeTag(buff, var2528, 1, protoModule.wireTypes.lengthDelimited)
		var2529, var2530 = protoModule.writeString(var2529, var2530, self.modal_variant)
		buff = var2529
		var2528 = var2530
	end
	if self.modal_sequence ~= nil and self.modal_sequence ~= "" then
		local var2531, var2532 = protoModule.writeTag(buff, var2528, 2, protoModule.wireTypes.lengthDelimited)
		var2531, var2532 = protoModule.writeString(var2531, var2532, self.modal_sequence)
		buff = var2531
		var2528 = var2532
	end
	if self.conversation_id ~= nil and self.conversation_id ~= "" then
		local var2533, var2534 = protoModule.writeTag(buff, var2528, 3, protoModule.wireTypes.lengthDelimited)
		var2533, var2534 = protoModule.writeString(var2533, var2534, self.conversation_id)
		buff = var2533
		var2528 = var2534
	end
	if self.friend_id ~= nil and self.friend_id ~= "" then
		local var2535, var2536 = protoModule.writeTag(buff, var2528, 4, protoModule.wireTypes.lengthDelimited)
		var2535, var2536 = protoModule.writeString(var2535, var2536, self.friend_id)
		buff = var2535
		var2528 = var2536
	end
	local buff_1 = buffer.create(var2528)
	buffer.copy(buff_1, 0, buff, 0, var2528)
	
	return buff_1
end

function t_62.decode(p125) --[[ line: 15145 ]]
	-- upvalues: t_62 (ref), protoModule (ref)
	local var2538 = t_62.new()
	local var2539 = 0
	while var2539 < buffer.len(p125) do
		local _ = nil
		local var2540 = nil
		local var2541, var2542, var2543 = protoModule.readTag(p125, var2539)
		local var2544 = var2541
		var2540 = var2542
		var2539 = var2543
		
		if var2540 == protoModule.wireTypes.varint then
			local _ = nil
			local var2545, var2546 = protoModule.readVarInt(p125, var2539)
			local _ = var2545
			var2539 = var2546
			continue
		end
		if var2540 == protoModule.wireTypes.lengthDelimited then
			if var2544 == 1 then
				local _ = nil
				local var2547, var2548 = protoModule.readBuffer(p125, var2539)
				var2539 = var2548
				var2538.modal_variant = buffer.tostring(var2547)
			elseif var2544 == 2 then
				local _ = nil
				local var2549, var2550 = protoModule.readBuffer(p125, var2539)
				var2539 = var2550
				var2538.modal_sequence = buffer.tostring(var2549)
			elseif var2544 == 3 then
				local _ = nil
				local var2551, var2552 = protoModule.readBuffer(p125, var2539)
				var2539 = var2552
				var2538.conversation_id = buffer.tostring(var2551)
			elseif var2544 == 4 then
				local _ = nil
				local var2553, var2554 = protoModule.readBuffer(p125, var2539)
				var2539 = var2554
				var2538.friend_id = buffer.tostring(var2553)
			else
				local _ = nil
				local var2555, var2556 = protoModule.readVarInt(p125, var2539)
				var2539 = var2556 + var2555
			end
		elseif var2540 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2557, var2558 = protoModule.readFixed32(p125, var2539)
			local _ = var2557
			var2539 = var2558
		elseif var2540 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2559, var2560 = protoModule.readFixed64(p125, var2539)
			local _ = var2559
			var2539 = var2560
		else
			error("Unsupported wire type: " .. var2540)
		end
	end
	return var2538
end

function t_62:jsonEncode() --[[ line: 15203 ]]
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

function t_62:jsonDecode() --[[ line: 15225 ]]
	-- upvalues: t_62 (ref)
	local var2562 = t_62.new()
	
	if self.modal_variant ~= nil then
		var2562.modal_variant = self.modal_variant
	end
	if self.modalVariant ~= nil then
		var2562.modal_variant = self.modalVariant
	end
	if self.modal_sequence ~= nil then
		var2562.modal_sequence = self.modal_sequence
	end
	if self.modalSequence ~= nil then
		var2562.modal_sequence = self.modalSequence
	end
	if self.conversation_id ~= nil then
		var2562.conversation_id = self.conversation_id
	end
	if self.conversationId ~= nil then
		var2562.conversation_id = self.conversationId
	end
	if self.friend_id ~= nil then
		var2562.friend_id = self.friend_id
	end
	if self.friendId ~= nil then
		var2562.friend_id = self.friendId
	end
	return var2562
end

t_62.descriptor = {
	name = "PartyChatConversationUpsellInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PartyChatConversationUpsellInputData"
}
t.PartyChatConversationUpsellInputData = t_62
typeRegistryModule.default:register(t.PartyChatConversationUpsellInputData)
local t_63 = {}
t_63.__index = t_63

function t_63.new(p126) --[[ line: 15279 ]]
	-- upvalues: t_63 (ref)
	return setmetatable({
		event_id = if p126 == nil or p126.event_id == nil then "" else p126.event_id,
		universe_id = if p126 == nil or p126.universe_id == nil then "" else p126.universe_id,
		entry_map = if p126 == nil or p126.entry_map == nil then {} else p126.entry_map,
		entry_order = if p126 == nil or p126.entry_order == nil then {} else p126.entry_order
	}, t_63)
end

function t_63:encode() --[[ line: 15290 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2564 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2565, var2566 = protoModule.writeTag(buff, var2564, 1, protoModule.wireTypes.lengthDelimited)
		var2565, var2566 = protoModule.writeString(var2565, var2566, self.event_id)
		buff = var2565
		var2564 = var2566
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2567, var2568 = protoModule.writeTag(buff, var2564, 2, protoModule.wireTypes.lengthDelimited)
		var2567, var2568 = protoModule.writeString(var2567, var2568, self.universe_id)
		buff = var2567
		var2564 = var2568
	end
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2569, var2570 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2569, var2570 = protoModule.writeString(var2569, var2570, i)
			local var2571 = v:encode()
			var2570, var2572 = protoModule.writeTag(var2569, var2570, 2, protoModule.wireTypes.lengthDelimited)
			var2570, var2572 = protoModule.writeBuffer(var2570, var2572, var2571, buffer.len(var2571))
			local var2573 = var2570
			local var2574 = var2572
			local var2575, var2576 = protoModule.writeTag(buff, var2564, 3, protoModule.wireTypes.lengthDelimited)
			var2575, var2576 = protoModule.writeBuffer(var2575, var2576, var2573, var2574)
			buff = var2575
			var2564 = var2576
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2577, var2578 = protoModule.writeTag(buff, var2564, 4, protoModule.wireTypes.lengthDelimited)
			var2577, var2578 = protoModule.writeString(var2577, var2578, v)
			buff = var2577
			var2564 = var2578
		end
	end
	local buff_1 = buffer.create(var2564)
	buffer.copy(buff_1, 0, buff, 0, var2564)
	
	return buff_1
end

function t_63.decode(p127) --[[ line: 15330 ]]
	-- upvalues: t_63 (ref), protoModule (ref), t (ref)
	local var2580 = t_63.new()
	local var2581 = 0
	while var2581 < buffer.len(p127) do
		local _ = nil
		local var2582 = nil
		local var2583, var2584, var2585 = protoModule.readTag(p127, var2581)
		local var2586 = var2583
		var2582 = var2584
		var2581 = var2585
		
		if var2582 == protoModule.wireTypes.varint then
			local _ = nil
			local var2587, var2588 = protoModule.readVarInt(p127, var2581)
			local _ = var2587
			var2581 = var2588
			continue
		end
		if var2582 == protoModule.wireTypes.lengthDelimited then
			if var2586 == 1 then
				local _ = nil
				local var2589, var2590 = protoModule.readBuffer(p127, var2581)
				var2581 = var2590
				var2580.event_id = buffer.tostring(var2589)
			elseif var2586 == 2 then
				local _ = nil
				local var2591, var2592 = protoModule.readBuffer(p127, var2581)
				var2581 = var2592
				var2580.universe_id = buffer.tostring(var2591)
			elseif var2586 == 3 then
				local _ = nil
				local var2593, var2594 = protoModule.readBuffer(p127, var2581)
				var2581 = var2594
				var2593 = t.EventDetailsFeedInputData_EntryMapEntry.decode(var2593)
				var2580.entry_map[var2593.key or ""] = var2593.value or t.FeedEntry.new()
			elseif var2586 == 4 then
				local _ = nil
				local var2595, var2596 = protoModule.readBuffer(p127, var2581)
				var2581 = var2596
				table.insert(var2580.entry_order, buffer.tostring(var2595))
			else
				local _ = nil
				local var2597, var2598 = protoModule.readVarInt(p127, var2581)
				var2581 = var2598 + var2597
			end
		elseif var2582 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2599, var2600 = protoModule.readFixed32(p127, var2581)
			local _ = var2599
			var2581 = var2600
		elseif var2582 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2601, var2602 = protoModule.readFixed64(p127, var2581)
			local _ = var2601
			var2581 = var2602
		else
			error("Unsupported wire type: " .. var2582)
		end
	end
	return var2580
end

function t_63:jsonEncode() --[[ line: 15395 ]]
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

function t_63:jsonDecode() --[[ line: 15425 ]]
	-- upvalues: t_63 (ref), t (ref)
	local var2606 = t_63.new()
	
	if self.event_id ~= nil then
		var2606.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2606.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2606.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2606.universe_id = self.universeId
	end
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2606.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2606.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2606.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2606.entry_order = t_1
	end
	return var2606
end

t_63.descriptor = {
	name = "EventDetailsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsFeedInputData"
}
t.EventDetailsFeedInputData = t_63
typeRegistryModule.default:register(t.EventDetailsFeedInputData)
local t_64 = {}
t_64.__index = t_64

function t_64.new(p128) --[[ line: 15497 ]]
	-- upvalues: t_64 (ref)
	return setmetatable({
		key = if p128 == nil or p128.key == nil then "" else p128.key,
		value = if p128 == nil or p128.value == nil then nil else p128.value
	}, t_64)
end

function t_64:encode() --[[ line: 15506 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2612 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2613, var2614 = protoModule.writeTag(buff, var2612, 1, protoModule.wireTypes.lengthDelimited)
		var2613, var2614 = protoModule.writeString(var2613, var2614, self.key)
		buff = var2613
		var2612 = var2614
	end
	if self.value ~= nil then
		local var2615 = self.value:encode()
		local var2616, var2617 = protoModule.writeTag(buff, var2612, 2, protoModule.wireTypes.lengthDelimited)
		var2616, var2617 = protoModule.writeBuffer(var2616, var2617, var2615, buffer.len(var2615))
		buff = var2616
		var2612 = var2617
	end
	local buff_1 = buffer.create(var2612)
	buffer.copy(buff_1, 0, buff, 0, var2612)
	
	return buff_1
end

function t_64.decode(p129) --[[ line: 15526 ]]
	-- upvalues: t_64 (ref), protoModule (ref), t (ref)
	local var2619 = t_64.new()
	local var2620 = 0
	while var2620 < buffer.len(p129) do
		local _ = nil
		local var2621 = nil
		local var2622, var2623, var2624 = protoModule.readTag(p129, var2620)
		local var2625 = var2622
		var2621 = var2623
		var2620 = var2624
		
		if var2621 == protoModule.wireTypes.varint then
			local _ = nil
			local var2626, var2627 = protoModule.readVarInt(p129, var2620)
			local _ = var2626
			var2620 = var2627
			continue
		end
		if var2621 == protoModule.wireTypes.lengthDelimited then
			if var2625 == 1 then
				local _ = nil
				local var2628, var2629 = protoModule.readBuffer(p129, var2620)
				var2620 = var2629
				var2619.key = buffer.tostring(var2628)
			elseif var2625 == 2 then
				local _ = nil
				local var2630, var2631 = protoModule.readBuffer(p129, var2620)
				var2620 = var2631
				var2619.value = t.FeedEntry.decode(var2630)
			else
				local _ = nil
				local var2632, var2633 = protoModule.readVarInt(p129, var2620)
				var2620 = var2633 + var2632
			end
		elseif var2621 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2634, var2635 = protoModule.readFixed32(p129, var2620)
			local _ = var2634
			var2620 = var2635
		elseif var2621 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2636, var2637 = protoModule.readFixed64(p129, var2620)
			local _ = var2636
			var2620 = var2637
		else
			error("Unsupported wire type: " .. var2621)
		end
	end
	return var2619
end

function t_64:jsonEncode() --[[ line: 15574 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_64:jsonDecode() --[[ line: 15588 ]]
	-- upvalues: t_64 (ref), t (ref)
	local var2639 = t_64.new()
	
	if self.key ~= nil then
		var2639.key = self.key
	end
	if self.value ~= nil then
		var2639.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2639
end

t_64.descriptor = {
	name = "EventDetailsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.EventDetailsFeedInputData_EntryMapEntry = t_64
typeRegistryModule.default:register(t.EventDetailsFeedInputData_EntryMapEntry)
local t_65 = {}
t_65.__index = t_65

function t_65.new(p130) --[[ line: 15618 ]]
	-- upvalues: t_65 (ref)
	return setmetatable({
		event_id = if p130 == nil or p130.event_id == nil then "" else p130.event_id,
		universe_id = if p130 == nil or p130.universe_id == nil then "" else p130.universe_id
	}, t_65)
end

function t_65:encode() --[[ line: 15627 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2641 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2642, var2643 = protoModule.writeTag(buff, var2641, 1, protoModule.wireTypes.lengthDelimited)
		var2642, var2643 = protoModule.writeString(var2642, var2643, self.event_id)
		buff = var2642
		var2641 = var2643
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2644, var2645 = protoModule.writeTag(buff, var2641, 2, protoModule.wireTypes.lengthDelimited)
		var2644, var2645 = protoModule.writeString(var2644, var2645, self.universe_id)
		buff = var2644
		var2641 = var2645
	end
	local buff_1 = buffer.create(var2641)
	buffer.copy(buff_1, 0, buff, 0, var2641)
	
	return buff_1
end

function t_65.decode(p131) --[[ line: 15646 ]]
	-- upvalues: t_65 (ref), protoModule (ref)
	local var2647 = t_65.new()
	local var2648 = 0
	while var2648 < buffer.len(p131) do
		local _ = nil
		local var2649 = nil
		local var2650, var2651, var2652 = protoModule.readTag(p131, var2648)
		local var2653 = var2650
		var2649 = var2651
		var2648 = var2652
		
		if var2649 == protoModule.wireTypes.varint then
			local _ = nil
			local var2654, var2655 = protoModule.readVarInt(p131, var2648)
			local _ = var2654
			var2648 = var2655
			continue
		end
		if var2649 == protoModule.wireTypes.lengthDelimited then
			if var2653 == 1 then
				local _ = nil
				local var2656, var2657 = protoModule.readBuffer(p131, var2648)
				var2648 = var2657
				var2647.event_id = buffer.tostring(var2656)
			elseif var2653 == 2 then
				local _ = nil
				local var2658, var2659 = protoModule.readBuffer(p131, var2648)
				var2648 = var2659
				var2647.universe_id = buffer.tostring(var2658)
			else
				local _ = nil
				local var2660, var2661 = protoModule.readVarInt(p131, var2648)
				var2648 = var2661 + var2660
			end
		elseif var2649 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2662, var2663 = protoModule.readFixed32(p131, var2648)
			local _ = var2662
			var2648 = var2663
		elseif var2649 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2664, var2665 = protoModule.readFixed64(p131, var2648)
			local _ = var2664
			var2648 = var2665
		else
			error("Unsupported wire type: " .. var2649)
		end
	end
	return var2647
end

function t_65:jsonEncode() --[[ line: 15694 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_65:jsonDecode() --[[ line: 15708 ]]
	-- upvalues: t_65 (ref)
	local var2667 = t_65.new()
	
	if self.event_id ~= nil then
		var2667.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2667.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2667.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2667.universe_id = self.universeId
	end
	return var2667
end

t_65.descriptor = {
	name = "EventDetailsActionBarInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsActionBarInputData"
}
t.EventDetailsActionBarInputData = t_65
typeRegistryModule.default:register(t.EventDetailsActionBarInputData)
local t_66 = {}
t_66.__index = t_66

function t_66.new(p132) --[[ line: 15744 ]]
	-- upvalues: t_66 (ref)
	return setmetatable({
		event_id = if p132 == nil or p132.event_id == nil then "" else p132.event_id
	}, t_66)
end

function t_66:encode() --[[ line: 15752 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2669 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2670, var2671 = protoModule.writeTag(buff, var2669, 1, protoModule.wireTypes.lengthDelimited)
		var2670, var2671 = protoModule.writeString(var2670, var2671, self.event_id)
		buff = var2670
		var2669 = var2671
	end
	local buff_1 = buffer.create(var2669)
	buffer.copy(buff_1, 0, buff, 0, var2669)
	
	return buff_1
end

function t_66.decode(p133) --[[ line: 15766 ]]
	-- upvalues: t_66 (ref), protoModule (ref)
	local var2673 = t_66.new()
	local var2674 = 0
	while var2674 < buffer.len(p133) do
		local _ = nil
		local var2675 = nil
		local var2676, var2677, var2678 = protoModule.readTag(p133, var2674)
		local var2679 = var2676
		var2675 = var2677
		var2674 = var2678
		
		if var2675 == protoModule.wireTypes.varint then
			local _ = nil
			local var2680, var2681 = protoModule.readVarInt(p133, var2674)
			local _ = var2680
			var2674 = var2681
			continue
		end
		if var2675 == protoModule.wireTypes.lengthDelimited then
			if var2679 == 1 then
				local _ = nil
				local var2682, var2683 = protoModule.readBuffer(p133, var2674)
				var2674 = var2683
				var2673.event_id = buffer.tostring(var2682)
			else
				local _ = nil
				local var2684, var2685 = protoModule.readVarInt(p133, var2674)
				var2674 = var2685 + var2684
			end
		elseif var2675 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2686, var2687 = protoModule.readFixed32(p133, var2674)
			local _ = var2686
			var2674 = var2687
		elseif var2675 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2688, var2689 = protoModule.readFixed64(p133, var2674)
			local _ = var2688
			var2674 = var2689
		else
			error("Unsupported wire type: " .. var2675)
		end
	end
	return var2673
end

function t_66:jsonEncode() --[[ line: 15809 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_66:jsonDecode() --[[ line: 15819 ]]
	-- upvalues: t_66 (ref)
	local var2691 = t_66.new()
	
	if self.event_id ~= nil then
		var2691.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2691.event_id = self.eventId
	end
	return var2691
end

t_66.descriptor = {
	name = "EventDescriptionInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDescriptionInputData"
}
t.EventDescriptionInputData = t_66
typeRegistryModule.default:register(t.EventDescriptionInputData)
local t_67 = {}
t_67.__index = t_67

function t_67.new(p134) --[[ line: 15847 ]]
	-- upvalues: t_67 (ref)
	return setmetatable({
		event_id = if p134 == nil or p134.event_id == nil then "" else p134.event_id,
		universe_id = if p134 == nil or p134.universe_id == nil then "" else p134.universe_id
	}, t_67)
end

function t_67:encode() --[[ line: 15856 ]]
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

function t_67.decode(p135) --[[ line: 15875 ]]
	-- upvalues: t_67 (ref), protoModule (ref)
	local var2699 = t_67.new()
	local var2700 = 0
	while var2700 < buffer.len(p135) do
		local _ = nil
		local var2701 = nil
		local var2702, var2703, var2704 = protoModule.readTag(p135, var2700)
		local var2705 = var2702
		var2701 = var2703
		var2700 = var2704
		
		if var2701 == protoModule.wireTypes.varint then
			local _ = nil
			local var2706, var2707 = protoModule.readVarInt(p135, var2700)
			local _ = var2706
			var2700 = var2707
			continue
		end
		if var2701 == protoModule.wireTypes.lengthDelimited then
			if var2705 == 1 then
				local _ = nil
				local var2708, var2709 = protoModule.readBuffer(p135, var2700)
				var2700 = var2709
				var2699.event_id = buffer.tostring(var2708)
			elseif var2705 == 2 then
				local _ = nil
				local var2710, var2711 = protoModule.readBuffer(p135, var2700)
				var2700 = var2711
				var2699.universe_id = buffer.tostring(var2710)
			else
				local _ = nil
				local var2712, var2713 = protoModule.readVarInt(p135, var2700)
				var2700 = var2713 + var2712
			end
		elseif var2701 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2714, var2715 = protoModule.readFixed32(p135, var2700)
			local _ = var2714
			var2700 = var2715
		elseif var2701 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2716, var2717 = protoModule.readFixed64(p135, var2700)
			local _ = var2716
			var2700 = var2717
		else
			error("Unsupported wire type: " .. var2701)
		end
	end
	return var2699
end

function t_67:jsonEncode() --[[ line: 15923 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_67:jsonDecode() --[[ line: 15937 ]]
	-- upvalues: t_67 (ref)
	local var2719 = t_67.new()
	
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

t_67.descriptor = {
	name = "EventAttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventAttributionRowInputData"
}
t.EventAttributionRowInputData = t_67
typeRegistryModule.default:register(t.EventAttributionRowInputData)
local t_68 = {}
t_68.__index = t_68

function t_68.new(p136) --[[ line: 15973 ]]
	-- upvalues: t_68 (ref)
	return setmetatable({
		event_id = if p136 == nil or p136.event_id == nil then "" else p136.event_id
	}, t_68)
end

function t_68:encode() --[[ line: 15979 ]]
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

function t_68.decode(p137) --[[ line: 15993 ]]
	-- upvalues: t_68 (ref), protoModule (ref)
	local var2725 = t_68.new()
	local var2726 = 0
	while var2726 < buffer.len(p137) do
		local _ = nil
		local var2727 = nil
		local var2728, var2729, var2730 = protoModule.readTag(p137, var2726)
		local var2731 = var2728
		var2727 = var2729
		var2726 = var2730
		
		if var2727 == protoModule.wireTypes.varint then
			local _ = nil
			local var2732, var2733 = protoModule.readVarInt(p137, var2726)
			local _ = var2732
			var2726 = var2733
			continue
		end
		if var2727 == protoModule.wireTypes.lengthDelimited then
			if var2731 == 1 then
				local _ = nil
				local var2734, var2735 = protoModule.readBuffer(p137, var2726)
				var2726 = var2735
				var2725.event_id = buffer.tostring(var2734)
			else
				local _ = nil
				local var2736, var2737 = protoModule.readVarInt(p137, var2726)
				var2726 = var2737 + var2736
			end
		elseif var2727 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2738, var2739 = protoModule.readFixed32(p137, var2726)
			local _ = var2738
			var2726 = var2739
		elseif var2727 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2740, var2741 = protoModule.readFixed64(p137, var2726)
			local _ = var2740
			var2726 = var2741
		else
			error("Unsupported wire type: " .. var2727)
		end
	end
	return var2725
end

function t_68:jsonEncode() --[[ line: 16036 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_68:jsonDecode() --[[ line: 16046 ]]
	-- upvalues: t_68 (ref)
	local var2743 = t_68.new()
	
	if self.event_id ~= nil then
		var2743.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2743.event_id = self.eventId
	end
	return var2743
end

t_68.descriptor = {
	name = "EventInfoTableInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventInfoTableInputData"
}
t.EventInfoTableInputData = t_68
typeRegistryModule.default:register(t.EventInfoTableInputData)
local t_69 = {}
t_69.__index = t_69

function t_69.new(p138) --[[ line: 16074 ]]
	-- upvalues: t_69 (ref)
	return setmetatable({
		event_id = if p138 == nil or p138.event_id == nil then "" else p138.event_id
	}, t_69)
end

function t_69:encode() --[[ line: 16082 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2745 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2746, var2747 = protoModule.writeTag(buff, var2745, 1, protoModule.wireTypes.lengthDelimited)
		var2746, var2747 = protoModule.writeString(var2746, var2747, self.event_id)
		buff = var2746
		var2745 = var2747
	end
	local buff_1 = buffer.create(var2745)
	buffer.copy(buff_1, 0, buff, 0, var2745)
	
	return buff_1
end

function t_69.decode(p139) --[[ line: 16096 ]]
	-- upvalues: t_69 (ref), protoModule (ref)
	local var2749 = t_69.new()
	local var2750 = 0
	while var2750 < buffer.len(p139) do
		local _ = nil
		local var2751 = nil
		local var2752, var2753, var2754 = protoModule.readTag(p139, var2750)
		local var2755 = var2752
		var2751 = var2753
		var2750 = var2754
		
		if var2751 == protoModule.wireTypes.varint then
			local _ = nil
			local var2756, var2757 = protoModule.readVarInt(p139, var2750)
			local _ = var2756
			var2750 = var2757
			continue
		end
		if var2751 == protoModule.wireTypes.lengthDelimited then
			if var2755 == 1 then
				local _ = nil
				local var2758, var2759 = protoModule.readBuffer(p139, var2750)
				var2750 = var2759
				var2749.event_id = buffer.tostring(var2758)
			else
				local _ = nil
				local var2760, var2761 = protoModule.readVarInt(p139, var2750)
				var2750 = var2761 + var2760
			end
		elseif var2751 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2762, var2763 = protoModule.readFixed32(p139, var2750)
			local _ = var2762
			var2750 = var2763
		elseif var2751 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2764, var2765 = protoModule.readFixed64(p139, var2750)
			local _ = var2764
			var2750 = var2765
		else
			error("Unsupported wire type: " .. var2751)
		end
	end
	return var2749
end

function t_69:jsonEncode() --[[ line: 16139 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	return t
end

function t_69:jsonDecode() --[[ line: 16149 ]]
	-- upvalues: t_69 (ref)
	local var2767 = t_69.new()
	
	if self.event_id ~= nil then
		var2767.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2767.event_id = self.eventId
	end
	return var2767
end

t_69.descriptor = {
	name = "EventDetailsSheetFullBleedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventDetailsSheetFullBleedInputData"
}
t.EventDetailsSheetFullBleedInputData = t_69
typeRegistryModule.default:register(t.EventDetailsSheetFullBleedInputData)
local t_70 = {}
t_70.__index = t_70

function t_70.new(p140) --[[ line: 16179 ]]
	-- upvalues: t_70 (ref)
	return setmetatable({
		event_id = if p140 == nil or p140.event_id == nil then "" else p140.event_id,
		universe_id = if p140 == nil or p140.universe_id == nil then "" else p140.universe_id
	}, t_70)
end

function t_70:encode() --[[ line: 16188 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2769 = 0
	
	if self.event_id ~= nil and self.event_id ~= "" then
		local var2770, var2771 = protoModule.writeTag(buff, var2769, 1, protoModule.wireTypes.lengthDelimited)
		var2770, var2771 = protoModule.writeString(var2770, var2771, self.event_id)
		buff = var2770
		var2769 = var2771
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var2772, var2773 = protoModule.writeTag(buff, var2769, 2, protoModule.wireTypes.lengthDelimited)
		var2772, var2773 = protoModule.writeString(var2772, var2773, self.universe_id)
		buff = var2772
		var2769 = var2773
	end
	local buff_1 = buffer.create(var2769)
	buffer.copy(buff_1, 0, buff, 0, var2769)
	
	return buff_1
end

function t_70.decode(p141) --[[ line: 16207 ]]
	-- upvalues: t_70 (ref), protoModule (ref)
	local var2775 = t_70.new()
	local var2776 = 0
	while var2776 < buffer.len(p141) do
		local _ = nil
		local var2777 = nil
		local var2778, var2779, var2780 = protoModule.readTag(p141, var2776)
		local var2781 = var2778
		var2777 = var2779
		var2776 = var2780
		
		if var2777 == protoModule.wireTypes.varint then
			local _ = nil
			local var2782, var2783 = protoModule.readVarInt(p141, var2776)
			local _ = var2782
			var2776 = var2783
			continue
		end
		if var2777 == protoModule.wireTypes.lengthDelimited then
			if var2781 == 1 then
				local _ = nil
				local var2784, var2785 = protoModule.readBuffer(p141, var2776)
				var2776 = var2785
				var2775.event_id = buffer.tostring(var2784)
			elseif var2781 == 2 then
				local _ = nil
				local var2786, var2787 = protoModule.readBuffer(p141, var2776)
				var2776 = var2787
				var2775.universe_id = buffer.tostring(var2786)
			else
				local _ = nil
				local var2788, var2789 = protoModule.readVarInt(p141, var2776)
				var2776 = var2789 + var2788
			end
		elseif var2777 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2790, var2791 = protoModule.readFixed32(p141, var2776)
			local _ = var2790
			var2776 = var2791
		elseif var2777 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2792, var2793 = protoModule.readFixed64(p141, var2776)
			local _ = var2792
			var2776 = var2793
		else
			error("Unsupported wire type: " .. var2777)
		end
	end
	return var2775
end

function t_70:jsonEncode() --[[ line: 16255 ]]
	local t = {}
	
	if self.event_id ~= nil and self.event_id ~= "" then
		t.eventId = self.event_id
	end
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_70:jsonDecode() --[[ line: 16269 ]]
	-- upvalues: t_70 (ref)
	local var2795 = t_70.new()
	
	if self.event_id ~= nil then
		var2795.event_id = self.event_id
	end
	if self.eventId ~= nil then
		var2795.event_id = self.eventId
	end
	if self.universe_id ~= nil then
		var2795.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var2795.universe_id = self.universeId
	end
	return var2795
end

t_70.descriptor = {
	name = "EventNotificationsModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.EventNotificationsModalInputData"
}
t.EventNotificationsModalInputData = t_70
typeRegistryModule.default:register(t.EventNotificationsModalInputData)
local t_71 = {}
t_71.__index = t_71

function t_71.new(p142) --[[ line: 16307 ]]
	-- upvalues: t_71 (ref)
	return setmetatable({
		entry_map = if p142 == nil or p142.entry_map == nil then {} else p142.entry_map,
		entry_order = if p142 == nil or p142.entry_order == nil then {} else p142.entry_order,
		next_page_token = if p142 == nil or p142.next_page_token == nil then "" else p142.next_page_token,
		sticky_filter_pills = if p142 == nil or p142.sticky_filter_pills == nil then nil else p142.sticky_filter_pills,
		applied_filters = if p142 == nil or p142.applied_filters == nil then "" else p142.applied_filters
	}, t_71)
end

function t_71:encode() --[[ line: 16319 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2797 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var2798, var2799 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var2798, var2799 = protoModule.writeString(var2798, var2799, i)
			local var2800 = v:encode()
			var2799, var2801 = protoModule.writeTag(var2798, var2799, 2, protoModule.wireTypes.lengthDelimited)
			var2799, var2801 = protoModule.writeBuffer(var2799, var2801, var2800, buffer.len(var2800))
			local var2802 = var2799
			local var2803 = var2801
			local var2804, var2805 = protoModule.writeTag(buff, var2797, 1, protoModule.wireTypes.lengthDelimited)
			var2804, var2805 = protoModule.writeBuffer(var2804, var2805, var2802, var2803)
			buff = var2804
			var2797 = var2805
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var2806, var2807 = protoModule.writeTag(buff, var2797, 2, protoModule.wireTypes.lengthDelimited)
			var2806, var2807 = protoModule.writeString(var2806, var2807, v)
			buff = var2806
			var2797 = var2807
		end
	end
	if self.next_page_token ~= nil and self.next_page_token ~= "" then
		local var2808, var2809 = protoModule.writeTag(buff, var2797, 3, protoModule.wireTypes.lengthDelimited)
		var2808, var2809 = protoModule.writeString(var2808, var2809, self.next_page_token)
		buff = var2808
		var2797 = var2809
	end
	if self.sticky_filter_pills ~= nil then
		local var2810 = self.sticky_filter_pills:encode()
		local var2811, var2812 = protoModule.writeTag(buff, var2797, 4, protoModule.wireTypes.lengthDelimited)
		var2811, var2812 = protoModule.writeBuffer(var2811, var2812, var2810, buffer.len(var2810))
		buff = var2811
		var2797 = var2812
	end
	if self.applied_filters ~= nil and self.applied_filters ~= "" then
		local var2813, var2814 = protoModule.writeTag(buff, var2797, 5, protoModule.wireTypes.lengthDelimited)
		var2813, var2814 = protoModule.writeString(var2813, var2814, self.applied_filters)
		buff = var2813
		var2797 = var2814
	end
	local buff_1 = buffer.create(var2797)
	buffer.copy(buff_1, 0, buff, 0, var2797)
	
	return buff_1
end

function t_71.decode(p143) --[[ line: 16365 ]]
	-- upvalues: t_71 (ref), protoModule (ref), t (ref)
	local var2816 = t_71.new()
	local var2817 = 0
	while var2817 < buffer.len(p143) do
		local _ = nil
		local var2818 = nil
		local var2819, var2820, var2821 = protoModule.readTag(p143, var2817)
		local var2822 = var2819
		var2818 = var2820
		var2817 = var2821
		
		if var2818 == protoModule.wireTypes.varint then
			local _ = nil
			local var2823, var2824 = protoModule.readVarInt(p143, var2817)
			local _ = var2823
			var2817 = var2824
			continue
		end
		if var2818 == protoModule.wireTypes.lengthDelimited then
			if var2822 == 1 then
				local _ = nil
				local var2825, var2826 = protoModule.readBuffer(p143, var2817)
				var2817 = var2826
				var2825 = t.ChartsFeedInputData_EntryMapEntry.decode(var2825)
				var2816.entry_map[var2825.key or ""] = var2825.value or t.FeedEntry.new()
			elseif var2822 == 2 then
				local _ = nil
				local var2827, var2828 = protoModule.readBuffer(p143, var2817)
				var2817 = var2828
				table.insert(var2816.entry_order, buffer.tostring(var2827))
			elseif var2822 == 3 then
				local _ = nil
				local var2829, var2830 = protoModule.readBuffer(p143, var2817)
				var2817 = var2830
				var2816.next_page_token = buffer.tostring(var2829)
			elseif var2822 == 4 then
				local _ = nil
				local var2831, var2832 = protoModule.readBuffer(p143, var2817)
				var2817 = var2832
				var2816.sticky_filter_pills = t.FilterPillsInputData.decode(var2831)
			elseif var2822 == 5 then
				local _ = nil
				local var2833, var2834 = protoModule.readBuffer(p143, var2817)
				var2817 = var2834
				var2816.applied_filters = buffer.tostring(var2833)
			else
				local _ = nil
				local var2835, var2836 = protoModule.readVarInt(p143, var2817)
				var2817 = var2836 + var2835
			end
		elseif var2818 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2837, var2838 = protoModule.readFixed32(p143, var2817)
			local _ = var2837
			var2817 = var2838
		elseif var2818 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2839, var2840 = protoModule.readFixed64(p143, var2817)
			local _ = var2839
			var2817 = var2840
		else
			error("Unsupported wire type: " .. var2818)
		end
	end
	return var2816
end

function t_71:jsonEncode() --[[ line: 16435 ]]
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

function t_71:jsonDecode() --[[ line: 16469 ]]
	-- upvalues: t_71 (ref), t (ref)
	local var2844 = t_71.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2844.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var2844.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var2844.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var2844.entry_order = t_1
	end
	if self.next_page_token ~= nil then
		var2844.next_page_token = self.next_page_token
	end
	if self.nextPageToken ~= nil then
		var2844.next_page_token = self.nextPageToken
	end
	if self.sticky_filter_pills ~= nil then
		var2844.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.sticky_filter_pills)
	end
	if self.stickyFilterPills ~= nil then
		var2844.sticky_filter_pills = t.FilterPillsInputData.jsonDecode(self.stickyFilterPills)
	end
	if self.applied_filters ~= nil then
		var2844.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2844.applied_filters = self.appliedFilters
	end
	return var2844
end

t_71.descriptor = {
	name = "ChartsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsFeedInputData"
}
t.ChartsFeedInputData = t_71
typeRegistryModule.default:register(t.ChartsFeedInputData)
local t_72 = {}
t_72.__index = t_72

function t_72.new(p144) --[[ line: 16549 ]]
	-- upvalues: t_72 (ref)
	return setmetatable({
		key = if p144 == nil or p144.key == nil then "" else p144.key,
		value = if p144 == nil or p144.value == nil then nil else p144.value
	}, t_72)
end

function t_72:encode() --[[ line: 16558 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2850 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var2851, var2852 = protoModule.writeTag(buff, var2850, 1, protoModule.wireTypes.lengthDelimited)
		var2851, var2852 = protoModule.writeString(var2851, var2852, self.key)
		buff = var2851
		var2850 = var2852
	end
	if self.value ~= nil then
		local var2853 = self.value:encode()
		local var2854, var2855 = protoModule.writeTag(buff, var2850, 2, protoModule.wireTypes.lengthDelimited)
		var2854, var2855 = protoModule.writeBuffer(var2854, var2855, var2853, buffer.len(var2853))
		buff = var2854
		var2850 = var2855
	end
	local buff_1 = buffer.create(var2850)
	buffer.copy(buff_1, 0, buff, 0, var2850)
	
	return buff_1
end

function t_72.decode(p145) --[[ line: 16578 ]]
	-- upvalues: t_72 (ref), protoModule (ref), t (ref)
	local var2857 = t_72.new()
	local var2858 = 0
	while var2858 < buffer.len(p145) do
		local _ = nil
		local var2859 = nil
		local var2860, var2861, var2862 = protoModule.readTag(p145, var2858)
		local var2863 = var2860
		var2859 = var2861
		var2858 = var2862
		
		if var2859 == protoModule.wireTypes.varint then
			local _ = nil
			local var2864, var2865 = protoModule.readVarInt(p145, var2858)
			local _ = var2864
			var2858 = var2865
			continue
		end
		if var2859 == protoModule.wireTypes.lengthDelimited then
			if var2863 == 1 then
				local _ = nil
				local var2866, var2867 = protoModule.readBuffer(p145, var2858)
				var2858 = var2867
				var2857.key = buffer.tostring(var2866)
			elseif var2863 == 2 then
				local _ = nil
				local var2868, var2869 = protoModule.readBuffer(p145, var2858)
				var2858 = var2869
				var2857.value = t.FeedEntry.decode(var2868)
			else
				local _ = nil
				local var2870, var2871 = protoModule.readVarInt(p145, var2858)
				var2858 = var2871 + var2870
			end
		elseif var2859 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2872, var2873 = protoModule.readFixed32(p145, var2858)
			local _ = var2872
			var2858 = var2873
		elseif var2859 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2874, var2875 = protoModule.readFixed64(p145, var2858)
			local _ = var2874
			var2858 = var2875
		else
			error("Unsupported wire type: " .. var2859)
		end
	end
	return var2857
end

function t_72:jsonEncode() --[[ line: 16626 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_72:jsonDecode() --[[ line: 16640 ]]
	-- upvalues: t_72 (ref), t (ref)
	local var2877 = t_72.new()
	
	if self.key ~= nil then
		var2877.key = self.key
	end
	if self.value ~= nil then
		var2877.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var2877
end

t_72.descriptor = {
	name = "ChartsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.ChartsFeedInputData_EntryMapEntry = t_72
typeRegistryModule.default:register(t.ChartsFeedInputData_EntryMapEntry)
local t_73 = {}
t_73.__index = t_73

function t_73.new(p146) --[[ line: 16670 ]]
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

function t_73:encode() --[[ line: 16681 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2879 = 0
	
	if self.filter_groups ~= nil and #self.filter_groups > 0 then
		for i, v in self.filter_groups do
			local var2880 = v:encode()
			local var2881, var2882 = protoModule.writeTag(buff, var2879, 1, protoModule.wireTypes.lengthDelimited)
			var2881, var2882 = protoModule.writeBuffer(var2881, var2882, var2880, buffer.len(var2880))
			buff = var2881
			var2879 = var2882
		end
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var2883, var2884 = protoModule.writeTag(buff, var2879, 2, protoModule.wireTypes.lengthDelimited)
		var2883, var2884 = protoModule.writeString(var2883, var2884, self.sort_id)
		buff = var2883
		var2879 = var2884
	end
	if self.secondary_sort_id ~= nil and self.secondary_sort_id ~= 0 then
		local var2885, var2886 = protoModule.writeTag(buff, var2879, 3, protoModule.wireTypes.varint)
		var2885, var2886 = protoModule.writeVarInt(var2885, var2886, self.secondary_sort_id)
		buff = var2885
		var2879 = var2886
	end
	if self.title ~= nil and self.title ~= "" then
		local var2887, var2888 = protoModule.writeTag(buff, var2879, 4, protoModule.wireTypes.lengthDelimited)
		var2887, var2888 = protoModule.writeString(var2887, var2888, self.title)
		buff = var2887
		var2879 = var2888
	end
	if self.primary_sort_id ~= nil then
		local var2889, var2890 = protoModule.writeTag(buff, var2879, 5, protoModule.wireTypes.varint)
		var2889, var2890 = protoModule.writeVarInt(var2889, var2890, self.primary_sort_id)
		buff = var2889
		var2879 = var2890
	end
	if self.applied_filters ~= nil then
		local var2891, var2892 = protoModule.writeTag(buff, var2879, 6, protoModule.wireTypes.lengthDelimited)
		var2891, var2892 = protoModule.writeString(var2891, var2892, self.applied_filters)
		buff = var2891
		var2879 = var2892
	end
	local buff_1 = buffer.create(var2879)
	buffer.copy(buff_1, 0, buff, 0, var2879)
	
	return buff_1
end

function t_73.decode(p147) --[[ line: 16723 ]]
	-- upvalues: t_73 (ref), protoModule (ref), t (ref)
	local var2894 = t_73.new()
	local var2895 = 0
	while var2895 < buffer.len(p147) do
		local _ = nil
		local var2896 = nil
		local var2897, var2898, var2899 = protoModule.readTag(p147, var2895)
		local var2900 = var2897
		var2896 = var2898
		var2895 = var2899
		
		if var2896 == protoModule.wireTypes.varint then
			if var2900 == 3 then
				local _ = nil
				local var2901, var2902 = protoModule.readVarIntI32(p147, var2895)
				var2895 = var2902
				var2894.secondary_sort_id = var2901
			elseif var2900 == 5 then
				local _ = nil
				local var2903, var2904 = protoModule.readVarIntI32(p147, var2895)
				var2895 = var2904
				var2894.primary_sort_id = var2903
			else
				local _ = nil
				local var2905, var2906 = protoModule.readVarInt(p147, var2895)
				local _ = var2905
				var2895 = var2906
			end
		end
		if var2896 == protoModule.wireTypes.lengthDelimited then
			if var2900 == 1 then
				local _ = nil
				local var2907, var2908 = protoModule.readBuffer(p147, var2895)
				var2895 = var2908
				table.insert(var2894.filter_groups, t.FilterPillsInputData_FilterGroup.decode(var2907))
			elseif var2900 == 2 then
				local _ = nil
				local var2909, var2910 = protoModule.readBuffer(p147, var2895)
				var2895 = var2910
				var2894.sort_id = buffer.tostring(var2909)
			elseif var2900 == 4 then
				local _ = nil
				local var2911, var2912 = protoModule.readBuffer(p147, var2895)
				var2895 = var2912
				var2894.title = buffer.tostring(var2911)
			elseif var2900 == 6 then
				local _ = nil
				local var2913, var2914 = protoModule.readBuffer(p147, var2895)
				var2895 = var2914
				var2894.applied_filters = buffer.tostring(var2913)
			else
				local _ = nil
				local var2915, var2916 = protoModule.readVarInt(p147, var2895)
				var2895 = var2916 + var2915
			end
		elseif var2896 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2917, var2918 = protoModule.readFixed32(p147, var2895)
			local _ = var2917
			var2895 = var2918
		elseif var2896 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2919, var2920 = protoModule.readFixed64(p147, var2895)
			local _ = var2919
			var2895 = var2920
		else
			error("Unsupported wire type: " .. var2896)
		end
	end
	return var2894
end

function t_73:jsonEncode() --[[ line: 16791 ]]
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

function t_73:jsonDecode() --[[ line: 16825 ]]
	-- upvalues: t_73 (ref), t (ref)
	local var2923 = t_73.new()
	
	if self.filter_groups ~= nil then
		local t_1 = {}
		
		for i, v in self.filter_groups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2923.filter_groups = t_1
	end
	if self.filterGroups ~= nil then
		local t_1 = {}
		
		for i, v in self.filterGroups do
			table.insert(t_1, t.FilterPillsInputData_FilterGroup.jsonDecode(v))
		end
		var2923.filter_groups = t_1
	end
	if self.sort_id ~= nil then
		var2923.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var2923.sort_id = self.sortId
	end
	if self.secondary_sort_id ~= nil then
		var2923.secondary_sort_id = self.secondary_sort_id
	end
	if self.secondarySortId ~= nil then
		var2923.secondary_sort_id = self.secondarySortId
	end
	if self.title ~= nil then
		var2923.title = self.title
	end
	if self.primary_sort_id ~= nil then
		var2923.primary_sort_id = self.primary_sort_id
	end
	if self.primarySortId ~= nil then
		var2923.primary_sort_id = self.primarySortId
	end
	if self.applied_filters ~= nil then
		var2923.applied_filters = self.applied_filters
	end
	if self.appliedFilters ~= nil then
		var2923.applied_filters = self.appliedFilters
	end
	return var2923
end

t_73.descriptor = {
	name = "FilterPillsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterPillsInputData"
}
t.FilterPillsInputData = t_73
typeRegistryModule.default:register(t.FilterPillsInputData)
local t_74 = {}
t_74.__index = t_74

function t_74.new(p148) --[[ line: 16899 ]]
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

function t_74:encode() --[[ line: 16916 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2927 = 0
	
	if self.filter_id ~= nil and self.filter_id ~= "" then
		local var2928, var2929 = protoModule.writeTag(buff, var2927, 1, protoModule.wireTypes.lengthDelimited)
		var2928, var2929 = protoModule.writeString(var2928, var2929, self.filter_id)
		buff = var2928
		var2927 = var2929
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2930, var2931 = protoModule.writeTag(buff, var2927, 2, protoModule.wireTypes.lengthDelimited)
		var2930, var2931 = protoModule.writeString(var2930, var2931, self.display_name)
		buff = var2930
		var2927 = var2931
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var2932 = v:encode()
			local var2933, var2934 = protoModule.writeTag(buff, var2927, 3, protoModule.wireTypes.lengthDelimited)
			var2933, var2934 = protoModule.writeBuffer(var2933, var2934, var2932, buffer.len(var2932))
			buff = var2933
			var2927 = var2934
		end
	end
	if self.default_option_id ~= nil and self.default_option_id ~= "" then
		local var2935, var2936 = protoModule.writeTag(buff, var2927, 4, protoModule.wireTypes.lengthDelimited)
		var2935, var2936 = protoModule.writeString(var2935, var2936, self.default_option_id)
		buff = var2935
		var2927 = var2936
	end
	if self.selected_option_id ~= nil and self.selected_option_id ~= "" then
		local var2937, var2938 = protoModule.writeTag(buff, var2927, 5, protoModule.wireTypes.lengthDelimited)
		var2937, var2938 = protoModule.writeString(var2937, var2938, self.selected_option_id)
		buff = var2937
		var2927 = var2938
	end
	if self.filter_type ~= nil and self.filter_type ~= "" then
		local var2939, var2940 = protoModule.writeTag(buff, var2927, 6, protoModule.wireTypes.lengthDelimited)
		var2939, var2940 = protoModule.writeString(var2939, var2940, self.filter_type)
		buff = var2939
		var2927 = var2940
	end
	if self.inactive_option_ids ~= nil and #self.inactive_option_ids > 0 then
		for i, v in self.inactive_option_ids do
			local var2941, var2942 = protoModule.writeTag(buff, var2927, 7, protoModule.wireTypes.lengthDelimited)
			var2941, var2942 = protoModule.writeString(var2941, var2942, v)
			buff = var2941
			var2927 = var2942
		end
	end
	if self.info_text ~= nil and self.info_text ~= "" then
		local var2943, var2944 = protoModule.writeTag(buff, var2927, 8, protoModule.wireTypes.lengthDelimited)
		var2943, var2944 = protoModule.writeString(var2943, var2944, self.info_text)
		buff = var2943
		var2927 = var2944
	end
	local buff_1 = buffer.create(var2927)
	buffer.copy(buff_1, 0, buff, 0, var2927)
	
	return buff_1
end

function t_74.decode(p149) --[[ line: 16970 ]]
	-- upvalues: t_74 (ref), protoModule (ref), t (ref)
	local var2946 = t_74.new()
	local var2947 = 0
	while var2947 < buffer.len(p149) do
		local _ = nil
		local var2948 = nil
		local var2949, var2950, var2951 = protoModule.readTag(p149, var2947)
		local var2952 = var2949
		var2948 = var2950
		var2947 = var2951
		
		if var2948 == protoModule.wireTypes.varint then
			local _ = nil
			local var2953, var2954 = protoModule.readVarInt(p149, var2947)
			local _ = var2953
			var2947 = var2954
			continue
		end
		if var2948 == protoModule.wireTypes.lengthDelimited then
			if var2952 == 1 then
				local _ = nil
				local var2955, var2956 = protoModule.readBuffer(p149, var2947)
				var2947 = var2956
				var2946.filter_id = buffer.tostring(var2955)
			elseif var2952 == 2 then
				local _ = nil
				local var2957, var2958 = protoModule.readBuffer(p149, var2947)
				var2947 = var2958
				var2946.display_name = buffer.tostring(var2957)
			elseif var2952 == 3 then
				local _ = nil
				local var2959, var2960 = protoModule.readBuffer(p149, var2947)
				var2947 = var2960
				table.insert(var2946.options, t.FilterPillsInputData_FilterOption.decode(var2959))
			elseif var2952 == 4 then
				local _ = nil
				local var2961, var2962 = protoModule.readBuffer(p149, var2947)
				var2947 = var2962
				var2946.default_option_id = buffer.tostring(var2961)
			elseif var2952 == 5 then
				local _ = nil
				local var2963, var2964 = protoModule.readBuffer(p149, var2947)
				var2947 = var2964
				var2946.selected_option_id = buffer.tostring(var2963)
			elseif var2952 == 6 then
				local _ = nil
				local var2965, var2966 = protoModule.readBuffer(p149, var2947)
				var2947 = var2966
				var2946.filter_type = buffer.tostring(var2965)
			elseif var2952 == 7 then
				local _ = nil
				local var2967, var2968 = protoModule.readBuffer(p149, var2947)
				var2947 = var2968
				table.insert(var2946.inactive_option_ids, buffer.tostring(var2967))
			elseif var2952 == 8 then
				local _ = nil
				local var2969, var2970 = protoModule.readBuffer(p149, var2947)
				var2947 = var2970
				var2946.info_text = buffer.tostring(var2969)
			else
				local _ = nil
				local var2971, var2972 = protoModule.readVarInt(p149, var2947)
				var2947 = var2972 + var2971
			end
		elseif var2948 == protoModule.wireTypes.i32 then
			local _ = nil
			local var2973, var2974 = protoModule.readFixed32(p149, var2947)
			local _ = var2973
			var2947 = var2974
		elseif var2948 == protoModule.wireTypes.i64 then
			local _ = nil
			local var2975, var2976 = protoModule.readFixed64(p149, var2947)
			local _ = var2975
			var2947 = var2976
		else
			error("Unsupported wire type: " .. var2948)
		end
	end
	return var2946
end

function t_74:jsonEncode() --[[ line: 17048 ]]
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

function t_74:jsonDecode() --[[ line: 17094 ]]
	-- upvalues: t_74 (ref), t (ref)
	local var2980 = t_74.new()
	
	if self.filter_id ~= nil then
		var2980.filter_id = self.filter_id
	end
	if self.filterId ~= nil then
		var2980.filter_id = self.filterId
	end
	if self.display_name ~= nil then
		var2980.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var2980.display_name = self.displayName
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.FilterPillsInputData_FilterOption.jsonDecode(v))
		end
		var2980.options = t_1
	end
	if self.default_option_id ~= nil then
		var2980.default_option_id = self.default_option_id
	end
	if self.defaultOptionId ~= nil then
		var2980.default_option_id = self.defaultOptionId
	end
	if self.selected_option_id ~= nil then
		var2980.selected_option_id = self.selected_option_id
	end
	if self.selectedOptionId ~= nil then
		var2980.selected_option_id = self.selectedOptionId
	end
	if self.filter_type ~= nil then
		var2980.filter_type = self.filter_type
	end
	if self.filterType ~= nil then
		var2980.filter_type = self.filterType
	end
	if self.inactive_option_ids ~= nil then
		local t_1 = {}
		
		for i, v in self.inactive_option_ids do
			table.insert(t_1, v)
		end
		var2980.inactive_option_ids = t_1
	end
	if self.inactiveOptionIds ~= nil then
		local t_1 = {}
		
		for i, v in self.inactiveOptionIds do
			table.insert(t_1, v)
		end
		var2980.inactive_option_ids = t_1
	end
	if self.info_text ~= nil then
		var2980.info_text = self.info_text
	end
	if self.infoText ~= nil then
		var2980.info_text = self.infoText
	end
	return var2980
end

t_74.descriptor = {
	name = "FilterPillsInputData_FilterGroup",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterGroup"
}
t.FilterPillsInputData_FilterGroup = t_74
typeRegistryModule.default:register(t.FilterPillsInputData_FilterGroup)
local t_75 = {}
t_75.__index = t_75

function t_75.new(p150) --[[ line: 17191 ]]
	-- upvalues: t_75 (ref)
	return setmetatable({
		option_id = if p150 == nil or p150.option_id == nil then "" else p150.option_id,
		display_name = if p150 == nil or p150.display_name == nil then "" else p150.display_name,
		option_context_tag = if p150 == nil or p150.option_context_tag == nil then "" else p150.option_context_tag
	}, t_75)
end

function t_75:encode() --[[ line: 17201 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var2985 = 0
	
	if self.option_id ~= nil and self.option_id ~= "" then
		local var2986, var2987 = protoModule.writeTag(buff, var2985, 1, protoModule.wireTypes.lengthDelimited)
		var2986, var2987 = protoModule.writeString(var2986, var2987, self.option_id)
		buff = var2986
		var2985 = var2987
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var2988, var2989 = protoModule.writeTag(buff, var2985, 2, protoModule.wireTypes.lengthDelimited)
		var2988, var2989 = protoModule.writeString(var2988, var2989, self.display_name)
		buff = var2988
		var2985 = var2989
	end
	if self.option_context_tag ~= nil and self.option_context_tag ~= "" then
		local var2990, var2991 = protoModule.writeTag(buff, var2985, 3, protoModule.wireTypes.lengthDelimited)
		var2990, var2991 = protoModule.writeString(var2990, var2991, self.option_context_tag)
		buff = var2990
		var2985 = var2991
	end
	local buff_1 = buffer.create(var2985)
	buffer.copy(buff_1, 0, buff, 0, var2985)
	
	return buff_1
end

function t_75.decode(p151) --[[ line: 17225 ]]
	-- upvalues: t_75 (ref), protoModule (ref)
	local var2993 = t_75.new()
	local var2994 = 0
	while var2994 < buffer.len(p151) do
		local _ = nil
		local var2995 = nil
		local var2996, var2997, var2998 = protoModule.readTag(p151, var2994)
		local var2999 = var2996
		var2995 = var2997
		var2994 = var2998
		
		if var2995 == protoModule.wireTypes.varint then
			local _ = nil
			local var3000, var3001 = protoModule.readVarInt(p151, var2994)
			local _ = var3000
			var2994 = var3001
			continue
		end
		if var2995 == protoModule.wireTypes.lengthDelimited then
			if var2999 == 1 then
				local _ = nil
				local var3002, var3003 = protoModule.readBuffer(p151, var2994)
				var2994 = var3003
				var2993.option_id = buffer.tostring(var3002)
			elseif var2999 == 2 then
				local _ = nil
				local var3004, var3005 = protoModule.readBuffer(p151, var2994)
				var2994 = var3005
				var2993.display_name = buffer.tostring(var3004)
			elseif var2999 == 3 then
				local _ = nil
				local var3006, var3007 = protoModule.readBuffer(p151, var2994)
				var2994 = var3007
				var2993.option_context_tag = buffer.tostring(var3006)
			else
				local _ = nil
				local var3008, var3009 = protoModule.readVarInt(p151, var2994)
				var2994 = var3009 + var3008
			end
		elseif var2995 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3010, var3011 = protoModule.readFixed32(p151, var2994)
			local _ = var3010
			var2994 = var3011
		elseif var2995 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3012, var3013 = protoModule.readFixed64(p151, var2994)
			local _ = var3012
			var2994 = var3013
		else
			error("Unsupported wire type: " .. var2995)
		end
	end
	return var2993
end

function t_75:jsonEncode() --[[ line: 17278 ]]
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

function t_75:jsonDecode() --[[ line: 17296 ]]
	-- upvalues: t_75 (ref)
	local var3015 = t_75.new()
	
	if self.option_id ~= nil then
		var3015.option_id = self.option_id
	end
	if self.optionId ~= nil then
		var3015.option_id = self.optionId
	end
	if self.display_name ~= nil then
		var3015.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3015.display_name = self.displayName
	end
	if self.option_context_tag ~= nil then
		var3015.option_context_tag = self.option_context_tag
	end
	if self.optionContextTag ~= nil then
		var3015.option_context_tag = self.optionContextTag
	end
	return var3015
end

t_75.descriptor = {
	name = "FilterPillsInputData_FilterOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.FilterOption"
}
t.FilterPillsInputData_FilterOption = t_75
typeRegistryModule.default:register(t.FilterPillsInputData_FilterOption)
local t_76 = {}
t_76.__index = t_76

function t_76.new(p152) --[[ line: 17342 ]]
	-- upvalues: t_76 (ref)
	return setmetatable({
		sort_options = if p152 == nil or p152.sort_options == nil then {} else p152.sort_options,
		selected_sort_id = if p152 == nil or p152.selected_sort_id == nil then "" else p152.selected_sort_id
	}, t_76)
end

function t_76:encode() --[[ line: 17349 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3017 = 0
	
	if self.sort_options ~= nil and #self.sort_options > 0 then
		for i, v in self.sort_options do
			local var3018 = v:encode()
			local var3019, var3020 = protoModule.writeTag(buff, var3017, 1, protoModule.wireTypes.lengthDelimited)
			var3019, var3020 = protoModule.writeBuffer(var3019, var3020, var3018, buffer.len(var3018))
			buff = var3019
			var3017 = var3020
		end
	end
	if self.selected_sort_id ~= nil and self.selected_sort_id ~= "" then
		local var3021, var3022 = protoModule.writeTag(buff, var3017, 2, protoModule.wireTypes.lengthDelimited)
		var3021, var3022 = protoModule.writeString(var3021, var3022, self.selected_sort_id)
		buff = var3021
		var3017 = var3022
	end
	local buff_1 = buffer.create(var3017)
	buffer.copy(buff_1, 0, buff, 0, var3017)
	
	return buff_1
end

function t_76.decode(p153) --[[ line: 17371 ]]
	-- upvalues: t_76 (ref), protoModule (ref), t (ref)
	local var3024 = t_76.new()
	local var3025 = 0
	while var3025 < buffer.len(p153) do
		local _ = nil
		local var3026 = nil
		local var3027, var3028, var3029 = protoModule.readTag(p153, var3025)
		local var3030 = var3027
		var3026 = var3028
		var3025 = var3029
		
		if var3026 == protoModule.wireTypes.varint then
			local _ = nil
			local var3031, var3032 = protoModule.readVarInt(p153, var3025)
			local _ = var3031
			var3025 = var3032
			continue
		end
		if var3026 == protoModule.wireTypes.lengthDelimited then
			if var3030 == 1 then
				local _ = nil
				local var3033, var3034 = protoModule.readBuffer(p153, var3025)
				var3025 = var3034
				table.insert(var3024.sort_options, t.SortSelectorInputData_SortOption.decode(var3033))
			elseif var3030 == 2 then
				local _ = nil
				local var3035, var3036 = protoModule.readBuffer(p153, var3025)
				var3025 = var3036
				var3024.selected_sort_id = buffer.tostring(var3035)
			else
				local _ = nil
				local var3037, var3038 = protoModule.readVarInt(p153, var3025)
				var3025 = var3038 + var3037
			end
		elseif var3026 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3039, var3040 = protoModule.readFixed32(p153, var3025)
			local _ = var3039
			var3025 = var3040
		elseif var3026 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3041, var3042 = protoModule.readFixed64(p153, var3025)
			local _ = var3041
			var3025 = var3042
		else
			error("Unsupported wire type: " .. var3026)
		end
	end
	return var3024
end

function t_76:jsonEncode() --[[ line: 17419 ]]
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

function t_76:jsonDecode() --[[ line: 17437 ]]
	-- upvalues: t_76 (ref), t (ref)
	local var3045 = t_76.new()
	
	if self.sort_options ~= nil then
		local t_1 = {}
		
		for i, v in self.sort_options do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3045.sort_options = t_1
	end
	if self.sortOptions ~= nil then
		local t_1 = {}
		
		for i, v in self.sortOptions do
			table.insert(t_1, t.SortSelectorInputData_SortOption.jsonDecode(v))
		end
		var3045.sort_options = t_1
	end
	if self.selected_sort_id ~= nil then
		var3045.selected_sort_id = self.selected_sort_id
	end
	if self.selectedSortId ~= nil then
		var3045.selected_sort_id = self.selectedSortId
	end
	return var3045
end

t_76.descriptor = {
	name = "SortSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortSelectorInputData"
}
t.SortSelectorInputData = t_76
typeRegistryModule.default:register(t.SortSelectorInputData)
local t_77 = {}
t_77.__index = t_77

function t_77.new(p154) --[[ line: 17483 ]]
	-- upvalues: t_77 (ref)
	return setmetatable({
		sort_id = if p154 == nil or p154.sort_id == nil then "" else p154.sort_id,
		display_name = if p154 == nil or p154.display_name == nil then "" else p154.display_name,
		content_type = if p154 == nil or p154.content_type == nil then "" else p154.content_type
	}, t_77)
end

function t_77:encode() --[[ line: 17493 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3049 = 0
	
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var3050, var3051 = protoModule.writeTag(buff, var3049, 1, protoModule.wireTypes.lengthDelimited)
		var3050, var3051 = protoModule.writeString(var3050, var3051, self.sort_id)
		buff = var3050
		var3049 = var3051
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var3052, var3053 = protoModule.writeTag(buff, var3049, 2, protoModule.wireTypes.lengthDelimited)
		var3052, var3053 = protoModule.writeString(var3052, var3053, self.display_name)
		buff = var3052
		var3049 = var3053
	end
	if self.content_type ~= nil and self.content_type ~= "" then
		local var3054, var3055 = protoModule.writeTag(buff, var3049, 3, protoModule.wireTypes.lengthDelimited)
		var3054, var3055 = protoModule.writeString(var3054, var3055, self.content_type)
		buff = var3054
		var3049 = var3055
	end
	local buff_1 = buffer.create(var3049)
	buffer.copy(buff_1, 0, buff, 0, var3049)
	
	return buff_1
end

function t_77.decode(p155) --[[ line: 17517 ]]
	-- upvalues: t_77 (ref), protoModule (ref)
	local var3057 = t_77.new()
	local var3058 = 0
	while var3058 < buffer.len(p155) do
		local _ = nil
		local var3059 = nil
		local var3060, var3061, var3062 = protoModule.readTag(p155, var3058)
		local var3063 = var3060
		var3059 = var3061
		var3058 = var3062
		
		if var3059 == protoModule.wireTypes.varint then
			local _ = nil
			local var3064, var3065 = protoModule.readVarInt(p155, var3058)
			local _ = var3064
			var3058 = var3065
			continue
		end
		if var3059 == protoModule.wireTypes.lengthDelimited then
			if var3063 == 1 then
				local _ = nil
				local var3066, var3067 = protoModule.readBuffer(p155, var3058)
				var3058 = var3067
				var3057.sort_id = buffer.tostring(var3066)
			elseif var3063 == 2 then
				local _ = nil
				local var3068, var3069 = protoModule.readBuffer(p155, var3058)
				var3058 = var3069
				var3057.display_name = buffer.tostring(var3068)
			elseif var3063 == 3 then
				local _ = nil
				local var3070, var3071 = protoModule.readBuffer(p155, var3058)
				var3058 = var3071
				var3057.content_type = buffer.tostring(var3070)
			else
				local _ = nil
				local var3072, var3073 = protoModule.readVarInt(p155, var3058)
				var3058 = var3073 + var3072
			end
		elseif var3059 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3074, var3075 = protoModule.readFixed32(p155, var3058)
			local _ = var3074
			var3058 = var3075
		elseif var3059 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3076, var3077 = protoModule.readFixed64(p155, var3058)
			local _ = var3076
			var3058 = var3077
		else
			error("Unsupported wire type: " .. var3059)
		end
	end
	return var3057
end

function t_77:jsonEncode() --[[ line: 17570 ]]
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

function t_77:jsonDecode() --[[ line: 17588 ]]
	-- upvalues: t_77 (ref)
	local var3079 = t_77.new()
	
	if self.sort_id ~= nil then
		var3079.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var3079.sort_id = self.sortId
	end
	if self.display_name ~= nil then
		var3079.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var3079.display_name = self.displayName
	end
	if self.content_type ~= nil then
		var3079.content_type = self.content_type
	end
	if self.contentType ~= nil then
		var3079.content_type = self.contentType
	end
	return var3079
end

t_77.descriptor = {
	name = "SortSelectorInputData_SortOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SortOption"
}
t.SortSelectorInputData_SortOption = t_77
typeRegistryModule.default:register(t.SortSelectorInputData_SortOption)
local t_78 = {}
t_78.__index = t_78

function t_78.new(p156) --[[ line: 17634 ]]
	-- upvalues: t_78 (ref)
	return setmetatable({
		selected_option = if p156 == nil or p156.selected_option == nil then "" else p156.selected_option,
		options = if p156 == nil or p156.options == nil then {} else p156.options,
		experience_carousel = if p156 == nil or p156.experience_carousel == nil then nil else p156.experience_carousel
	}, t_78)
end

function t_78:encode() --[[ line: 17646 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3081 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var3082, var3083 = protoModule.writeTag(buff, var3081, 1, protoModule.wireTypes.lengthDelimited)
		var3082, var3083 = protoModule.writeString(var3082, var3083, self.selected_option)
		buff = var3082
		var3081 = var3083
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var3084 = v:encode()
			local var3085, var3086 = protoModule.writeTag(buff, var3081, 2, protoModule.wireTypes.lengthDelimited)
			var3085, var3086 = protoModule.writeBuffer(var3085, var3086, var3084, buffer.len(var3084))
			buff = var3085
			var3081 = var3086
		end
	end
	if self.experience_carousel ~= nil then
		local var3087 = self.experience_carousel:encode()
		local var3088, var3089 = protoModule.writeTag(buff, var3081, 3, protoModule.wireTypes.lengthDelimited)
		var3088, var3089 = protoModule.writeBuffer(var3088, var3089, var3087, buffer.len(var3087))
		buff = var3088
		var3081 = var3089
	end
	local buff_1 = buffer.create(var3081)
	buffer.copy(buff_1, 0, buff, 0, var3081)
	
	return buff_1
end

function t_78.decode(p157) --[[ line: 17674 ]]
	-- upvalues: t_78 (ref), protoModule (ref), t (ref)
	local var3091 = t_78.new()
	local var3092 = 0
	while var3092 < buffer.len(p157) do
		local _ = nil
		local var3093 = nil
		local var3094, var3095, var3096 = protoModule.readTag(p157, var3092)
		local var3097 = var3094
		var3093 = var3095
		var3092 = var3096
		
		if var3093 == protoModule.wireTypes.varint then
			local _ = nil
			local var3098, var3099 = protoModule.readVarInt(p157, var3092)
			local _ = var3098
			var3092 = var3099
			continue
		end
		if var3093 == protoModule.wireTypes.lengthDelimited then
			if var3097 == 1 then
				local _ = nil
				local var3100, var3101 = protoModule.readBuffer(p157, var3092)
				var3092 = var3101
				var3091.selected_option = buffer.tostring(var3100)
			elseif var3097 == 2 then
				local _ = nil
				local var3102, var3103 = protoModule.readBuffer(p157, var3092)
				var3092 = var3103
				table.insert(var3091.options, t.SelectorOption.decode(var3102))
			elseif var3097 == 3 then
				local _ = nil
				local var3104, var3105 = protoModule.readBuffer(p157, var3092)
				var3092 = var3105
				var3091.experience_carousel = t.ExperienceCarouselInputData.decode(var3104)
			else
				local _ = nil
				local var3106, var3107 = protoModule.readVarInt(p157, var3092)
				var3092 = var3107 + var3106
			end
		elseif var3093 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3108, var3109 = protoModule.readFixed32(p157, var3092)
			local _ = var3108
			var3092 = var3109
		elseif var3093 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3110, var3111 = protoModule.readFixed64(p157, var3092)
			local _ = var3110
			var3092 = var3111
		else
			error("Unsupported wire type: " .. var3093)
		end
	end
	return var3091
end

function t_78:jsonEncode() --[[ line: 17727 ]]
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

function t_78:jsonDecode() --[[ line: 17749 ]]
	-- upvalues: t_78 (ref), t (ref)
	local var3114 = t_78.new()
	
	if self.selected_option ~= nil then
		var3114.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var3114.selected_option = self.selectedOption
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var3114.options = t_1
	end
	if self.experience_carousel ~= nil then
		var3114.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var3114.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	return var3114
end

t_78.descriptor = {
	name = "ChartsGenreSelectorInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ChartsGenreSelectorInputData"
}
t.ChartsGenreSelectorInputData = t_78
typeRegistryModule.default:register(t.ChartsGenreSelectorInputData)
local t_79 = {}
t_79.__index = t_79

function t_79.new(p158) --[[ line: 17794 ]]
	-- upvalues: t_79 (ref)
	return setmetatable({
		id = if p158 == nil or p158.id == nil then "" else p158.id,
		preview_rows = if p158 == nil or p158.preview_rows == nil then 0 else p158.preview_rows,
		widget_style = if p158 == nil or p158.widget_style == nil then nil else p158.widget_style,
		see_all_button = if p158 == nil or p158.see_all_button == nil then false else p158.see_all_button,
		information_popover_text = if p158 == nil or p158.information_popover_text == nil then "" else p158.information_popover_text
	}, t_79)
end

function t_79:encode() --[[ line: 17808 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3117 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3118, var3119 = protoModule.writeTag(buff, var3117, 1, protoModule.wireTypes.lengthDelimited)
		var3118, var3119 = protoModule.writeString(var3118, var3119, self.id)
		buff = var3118
		var3117 = var3119
	end
	if self.preview_rows ~= nil and self.preview_rows ~= 0 then
		local var3120, var3121 = protoModule.writeTag(buff, var3117, 4, protoModule.wireTypes.varint)
		var3120, var3121 = protoModule.writeVarInt(var3120, var3121, self.preview_rows)
		buff = var3120
		var3117 = var3121
	end
	if self.widget_style ~= nil then
		local var3122 = self.widget_style:encode()
		local var3123, var3124 = protoModule.writeTag(buff, var3117, 3, protoModule.wireTypes.lengthDelimited)
		var3123, var3124 = protoModule.writeBuffer(var3123, var3124, var3122, buffer.len(var3122))
		buff = var3123
		var3117 = var3124
	end
	if self.see_all_button then
		local var3125, var3126 = protoModule.writeTag(buff, var3117, 5, protoModule.wireTypes.varint)
		var3125, var3126 = protoModule.writeVarInt(var3125, var3126, if self.see_all_button then 1 else 0)
		buff = var3125
		var3117 = var3126
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3127, var3128 = protoModule.writeTag(buff, var3117, 6, protoModule.wireTypes.lengthDelimited)
		var3127, var3128 = protoModule.writeString(var3127, var3128, self.information_popover_text)
		buff = var3127
		var3117 = var3128
	end
	local buff_1 = buffer.create(var3117)
	buffer.copy(buff_1, 0, buff, 0, var3117)
	
	return buff_1
end

function t_79.decode(p159) --[[ line: 17843 ]]
	-- upvalues: t_79 (ref), protoModule (ref), t (ref)
	local var3130 = t_79.new()
	local var3131 = 0
	while var3131 < buffer.len(p159) do
		local _ = nil
		local var3132 = nil
		local var3133, var3134, var3135 = protoModule.readTag(p159, var3131)
		local var3136 = var3133
		var3132 = var3134
		var3131 = var3135
		
		if var3132 == protoModule.wireTypes.varint then
			if var3136 == 4 then
				local _ = nil
				local var3137, var3138 = protoModule.readVarIntI64(p159, var3131)
				var3131 = var3138
				var3130.preview_rows = var3137
			elseif var3136 == 5 then
				local _ = nil
				local var3139, var3140 = protoModule.readVarInt(p159, var3131)
				var3131 = var3140
				var3130.see_all_button = var3139 ~= 0
			else
				local _ = nil
				local var3141, var3142 = protoModule.readVarInt(p159, var3131)
				local _ = var3141
				var3131 = var3142
			end
		end
		if var3132 == protoModule.wireTypes.lengthDelimited then
			if var3136 == 1 then
				local _ = nil
				local var3143, var3144 = protoModule.readBuffer(p159, var3131)
				var3131 = var3144
				var3130.id = buffer.tostring(var3143)
			elseif var3136 == 3 then
				local _ = nil
				local var3145, var3146 = protoModule.readBuffer(p159, var3131)
				var3131 = var3146
				var3130.widget_style = t.WidgetStyleData.decode(var3145)
			elseif var3136 == 6 then
				local _ = nil
				local var3147, var3148 = protoModule.readBuffer(p159, var3131)
				var3131 = var3148
				var3130.information_popover_text = buffer.tostring(var3147)
			else
				local _ = nil
				local var3149, var3150 = protoModule.readVarInt(p159, var3131)
				var3131 = var3150 + var3149
			end
		elseif var3132 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3151, var3152 = protoModule.readFixed32(p159, var3131)
			local _ = var3151
			var3131 = var3152
		elseif var3132 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3153, var3154 = protoModule.readFixed64(p159, var3131)
			local _ = var3153
			var3131 = var3154
		else
			error("Unsupported wire type: " .. var3132)
		end
	end
	return var3130
end

function t_79:jsonEncode() --[[ line: 17906 ]]
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

function t_79:jsonDecode() --[[ line: 17932 ]]
	-- upvalues: t_79 (ref), t (ref)
	local var3156 = t_79.new()
	
	if self.id ~= nil then
		var3156.id = self.id
	end
	if self.preview_rows ~= nil then
		var3156.preview_rows = self.preview_rows
	end
	if self.previewRows ~= nil then
		var3156.preview_rows = self.previewRows
	end
	if self.widget_style ~= nil then
		var3156.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3156.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3156.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3156.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3156.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3156.information_popover_text = self.informationPopoverText
	end
	return var3156
end

t_79.descriptor = {
	name = "UAMarketplaceCatalogItemGroupInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemGroupInputData"
}
t.UAMarketplaceCatalogItemGroupInputData = t_79
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemGroupInputData)
local t_80 = {}
t_80.__index = t_80

function t_80.new(p160) --[[ line: 17990 ]]
	-- upvalues: t_80 (ref)
	return setmetatable({
		id = if p160 == nil or p160.id == nil then "" else p160.id,
		num_items_to_show = if p160 == nil or p160.num_items_to_show == nil then 0 else p160.num_items_to_show,
		widget_style = if p160 == nil or p160.widget_style == nil then nil else p160.widget_style,
		see_all_button = if p160 == nil or p160.see_all_button == nil then false else p160.see_all_button,
		information_popover_text = if p160 == nil or p160.information_popover_text == nil then "" else p160.information_popover_text
	}, t_80)
end

function t_80:encode() --[[ line: 18004 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3158 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3159, var3160 = protoModule.writeTag(buff, var3158, 1, protoModule.wireTypes.lengthDelimited)
		var3159, var3160 = protoModule.writeString(var3159, var3160, self.id)
		buff = var3159
		var3158 = var3160
	end
	if self.num_items_to_show ~= nil and self.num_items_to_show ~= 0 then
		local var3161, var3162 = protoModule.writeTag(buff, var3158, 5, protoModule.wireTypes.varint)
		var3161, var3162 = protoModule.writeVarInt(var3161, var3162, self.num_items_to_show)
		buff = var3161
		var3158 = var3162
	end
	if self.widget_style ~= nil then
		local var3163 = self.widget_style:encode()
		local var3164, var3165 = protoModule.writeTag(buff, var3158, 3, protoModule.wireTypes.lengthDelimited)
		var3164, var3165 = protoModule.writeBuffer(var3164, var3165, var3163, buffer.len(var3163))
		buff = var3164
		var3158 = var3165
	end
	if self.see_all_button then
		local var3166, var3167 = protoModule.writeTag(buff, var3158, 6, protoModule.wireTypes.varint)
		var3166, var3167 = protoModule.writeVarInt(var3166, var3167, if self.see_all_button then 1 else 0)
		buff = var3166
		var3158 = var3167
	end
	if self.information_popover_text ~= nil and self.information_popover_text ~= "" then
		local var3168, var3169 = protoModule.writeTag(buff, var3158, 7, protoModule.wireTypes.lengthDelimited)
		var3168, var3169 = protoModule.writeString(var3168, var3169, self.information_popover_text)
		buff = var3168
		var3158 = var3169
	end
	local buff_1 = buffer.create(var3158)
	buffer.copy(buff_1, 0, buff, 0, var3158)
	
	return buff_1
end

function t_80.decode(p161) --[[ line: 18041 ]]
	-- upvalues: t_80 (ref), protoModule (ref), t (ref)
	local var3171 = t_80.new()
	local var3172 = 0
	while var3172 < buffer.len(p161) do
		local _ = nil
		local var3173 = nil
		local var3174, var3175, var3176 = protoModule.readTag(p161, var3172)
		local var3177 = var3174
		var3173 = var3175
		var3172 = var3176
		
		if var3173 == protoModule.wireTypes.varint then
			if var3177 == 5 then
				local _ = nil
				local var3178, var3179 = protoModule.readVarIntI64(p161, var3172)
				var3172 = var3179
				var3171.num_items_to_show = var3178
			elseif var3177 == 6 then
				local _ = nil
				local var3180, var3181 = protoModule.readVarInt(p161, var3172)
				var3172 = var3181
				var3171.see_all_button = var3180 ~= 0
			else
				local _ = nil
				local var3182, var3183 = protoModule.readVarInt(p161, var3172)
				local _ = var3182
				var3172 = var3183
			end
		end
		if var3173 == protoModule.wireTypes.lengthDelimited then
			if var3177 == 1 then
				local _ = nil
				local var3184, var3185 = protoModule.readBuffer(p161, var3172)
				var3172 = var3185
				var3171.id = buffer.tostring(var3184)
			elseif var3177 == 3 then
				local _ = nil
				local var3186, var3187 = protoModule.readBuffer(p161, var3172)
				var3172 = var3187
				var3171.widget_style = t.WidgetStyleData.decode(var3186)
			elseif var3177 == 7 then
				local _ = nil
				local var3188, var3189 = protoModule.readBuffer(p161, var3172)
				var3172 = var3189
				var3171.information_popover_text = buffer.tostring(var3188)
			else
				local _ = nil
				local var3190, var3191 = protoModule.readVarInt(p161, var3172)
				var3172 = var3191 + var3190
			end
		elseif var3173 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3192, var3193 = protoModule.readFixed32(p161, var3172)
			local _ = var3192
			var3172 = var3193
		elseif var3173 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3194, var3195 = protoModule.readFixed64(p161, var3172)
			local _ = var3194
			var3172 = var3195
		else
			error("Unsupported wire type: " .. var3173)
		end
	end
	return var3171
end

function t_80:jsonEncode() --[[ line: 18106 ]]
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

function t_80:jsonDecode() --[[ line: 18134 ]]
	-- upvalues: t_80 (ref), t (ref)
	local var3197 = t_80.new()
	
	if self.id ~= nil then
		var3197.id = self.id
	end
	if self.num_items_to_show ~= nil then
		var3197.num_items_to_show = self.num_items_to_show
	end
	if self.numItemsToShow ~= nil then
		var3197.num_items_to_show = self.numItemsToShow
	end
	if self.widget_style ~= nil then
		var3197.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3197.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	if self.see_all_button ~= nil then
		var3197.see_all_button = self.see_all_button
	end
	if self.seeAllButton ~= nil then
		var3197.see_all_button = self.seeAllButton
	end
	if self.information_popover_text ~= nil then
		var3197.information_popover_text = self.information_popover_text
	end
	if self.informationPopoverText ~= nil then
		var3197.information_popover_text = self.informationPopoverText
	end
	return var3197
end

t_80.descriptor = {
	name = "UAMarketplaceCatalogItemCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogItemCarouselInputData"
}
t.UAMarketplaceCatalogItemCarouselInputData = t_80
typeRegistryModule.default:register(t.UAMarketplaceCatalogItemCarouselInputData)
local t_81 = {}
t_81.__index = t_81

function t_81.new(p162) --[[ line: 18192 ]]
	-- upvalues: t_81 (ref)
	return setmetatable({
		background_layers = if p162 == nil or p162.background_layers == nil then {} else p162.background_layers
	}, t_81)
end

function t_81:encode() --[[ line: 18198 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3199 = 0
	
	if self.background_layers ~= nil and #self.background_layers > 0 then
		for i, v in self.background_layers do
			local var3200 = v:encode()
			local var3201, var3202 = protoModule.writeTag(buff, var3199, 1, protoModule.wireTypes.lengthDelimited)
			var3201, var3202 = protoModule.writeBuffer(var3201, var3202, var3200, buffer.len(var3200))
			buff = var3201
			var3199 = var3202
		end
	end
	local buff_1 = buffer.create(var3199)
	buffer.copy(buff_1, 0, buff, 0, var3199)
	
	return buff_1
end

function t_81.decode(p163) --[[ line: 18215 ]]
	-- upvalues: t_81 (ref), protoModule (ref), backgroundLayerModule (ref)
	local var3204 = t_81.new()
	local var3205 = 0
	while var3205 < buffer.len(p163) do
		local _ = nil
		local var3206 = nil
		local var3207, var3208, var3209 = protoModule.readTag(p163, var3205)
		local var3210 = var3207
		var3206 = var3208
		var3205 = var3209
		
		if var3206 == protoModule.wireTypes.varint then
			local _ = nil
			local var3211, var3212 = protoModule.readVarInt(p163, var3205)
			local _ = var3211
			var3205 = var3212
			continue
		end
		if var3206 == protoModule.wireTypes.lengthDelimited then
			if var3210 == 1 then
				local _ = nil
				local var3213, var3214 = protoModule.readBuffer(p163, var3205)
				var3205 = var3214
				table.insert(var3204.background_layers, backgroundLayerModule.BackgroundLayer.decode(var3213))
			else
				local _ = nil
				local var3215, var3216 = protoModule.readVarInt(p163, var3205)
				var3205 = var3216 + var3215
			end
		elseif var3206 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3217, var3218 = protoModule.readFixed32(p163, var3205)
			local _ = var3217
			var3205 = var3218
		elseif var3206 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3219, var3220 = protoModule.readFixed64(p163, var3205)
			local _ = var3219
			var3205 = var3220
		else
			error("Unsupported wire type: " .. var3206)
		end
	end
	return var3204
end

function t_81:jsonEncode() --[[ line: 18261 ]]
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

function t_81:jsonDecode() --[[ line: 18275 ]]
	-- upvalues: t_81 (ref), backgroundLayerModule (ref)
	local var3223 = t_81.new()
	
	if self.background_layers ~= nil then
		local t = {}
		
		for i, v in self.background_layers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3223.background_layers = t
	end
	if self.backgroundLayers ~= nil then
		local t = {}
		
		for i, v in self.backgroundLayers do
			table.insert(t, backgroundLayerModule.BackgroundLayer.jsonDecode(v))
		end
		var3223.background_layers = t
	end
	return var3223
end

t_81.descriptor = {
	name = "WidgetStyleData",
	fullName = "roblox.apppageplatform.shared.v1beta1.WidgetStyleData"
}
t.WidgetStyleData = t_81
typeRegistryModule.default:register(t.WidgetStyleData)
local t_82 = {}
t_82.__index = t_82

function t_82.new(p164) --[[ line: 18319 ]]
	-- upvalues: t_82 (ref)
	return setmetatable({
		id = if p164 == nil or p164.id == nil then "" else p164.id,
		available_until = if p164 == nil or p164.available_until == nil then "" else p164.available_until,
		widget_style = if p164 == nil or p164.widget_style == nil then nil else p164.widget_style
	}, t_82)
end

function t_82:encode() --[[ line: 18329 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3227 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3228, var3229 = protoModule.writeTag(buff, var3227, 1, protoModule.wireTypes.lengthDelimited)
		var3228, var3229 = protoModule.writeString(var3228, var3229, self.id)
		buff = var3228
		var3227 = var3229
	end
	if self.available_until ~= nil and self.available_until ~= "" then
		local var3230, var3231 = protoModule.writeTag(buff, var3227, 2, protoModule.wireTypes.lengthDelimited)
		var3230, var3231 = protoModule.writeString(var3230, var3231, self.available_until)
		buff = var3230
		var3227 = var3231
	end
	if self.widget_style ~= nil then
		local var3232 = self.widget_style:encode()
		local var3233, var3234 = protoModule.writeTag(buff, var3227, 3, protoModule.wireTypes.lengthDelimited)
		var3233, var3234 = protoModule.writeBuffer(var3233, var3234, var3232, buffer.len(var3232))
		buff = var3233
		var3227 = var3234
	end
	local buff_1 = buffer.create(var3227)
	buffer.copy(buff_1, 0, buff, 0, var3227)
	
	return buff_1
end

function t_82.decode(p165) --[[ line: 18354 ]]
	-- upvalues: t_82 (ref), protoModule (ref), t (ref)
	local var3236 = t_82.new()
	local var3237 = 0
	while var3237 < buffer.len(p165) do
		local _ = nil
		local var3238 = nil
		local var3239, var3240, var3241 = protoModule.readTag(p165, var3237)
		local var3242 = var3239
		var3238 = var3240
		var3237 = var3241
		
		if var3238 == protoModule.wireTypes.varint then
			local _ = nil
			local var3243, var3244 = protoModule.readVarInt(p165, var3237)
			local _ = var3243
			var3237 = var3244
			continue
		end
		if var3238 == protoModule.wireTypes.lengthDelimited then
			if var3242 == 1 then
				local _ = nil
				local var3245, var3246 = protoModule.readBuffer(p165, var3237)
				var3237 = var3246
				var3236.id = buffer.tostring(var3245)
			elseif var3242 == 2 then
				local _ = nil
				local var3247, var3248 = protoModule.readBuffer(p165, var3237)
				var3237 = var3248
				var3236.available_until = buffer.tostring(var3247)
			elseif var3242 == 3 then
				local _ = nil
				local var3249, var3250 = protoModule.readBuffer(p165, var3237)
				var3237 = var3250
				var3236.widget_style = t.WidgetStyleData.decode(var3249)
			else
				local _ = nil
				local var3251, var3252 = protoModule.readVarInt(p165, var3237)
				var3237 = var3252 + var3251
			end
		elseif var3238 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3253, var3254 = protoModule.readFixed32(p165, var3237)
			local _ = var3253
			var3237 = var3254
		elseif var3238 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3255, var3256 = protoModule.readFixed64(p165, var3237)
			local _ = var3255
			var3237 = var3256
		else
			error("Unsupported wire type: " .. var3238)
		end
	end
	return var3236
end

function t_82:jsonEncode() --[[ line: 18407 ]]
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

function t_82:jsonDecode() --[[ line: 18425 ]]
	-- upvalues: t_82 (ref), t (ref)
	local var3258 = t_82.new()
	
	if self.id ~= nil then
		var3258.id = self.id
	end
	if self.available_until ~= nil then
		var3258.available_until = self.available_until
	end
	if self.availableUntil ~= nil then
		var3258.available_until = self.availableUntil
	end
	if self.widget_style ~= nil then
		var3258.widget_style = t.WidgetStyleData.jsonDecode(self.widget_style)
	end
	if self.widgetStyle ~= nil then
		var3258.widget_style = t.WidgetStyleData.jsonDecode(self.widgetStyle)
	end
	return var3258
end

t_82.descriptor = {
	name = "UAMarketplaceCatalogHeroUnitInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogHeroUnitInputData"
}
t.UAMarketplaceCatalogHeroUnitInputData = t_82
typeRegistryModule.default:register(t.UAMarketplaceCatalogHeroUnitInputData)
local t_83 = {}
t_83.__index = t_83

function t_83.new(p166) --[[ line: 18467 ]]
	-- upvalues: t_83 (ref)
	return setmetatable({
		entry_map = if p166 == nil or p166.entry_map == nil then {} else p166.entry_map,
		entry_order = if p166 == nil or p166.entry_order == nil then {} else p166.entry_order
	}, t_83)
end

function t_83:encode() --[[ line: 18476 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3260 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3261, var3262 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3261, var3262 = protoModule.writeString(var3261, var3262, i)
			local var3263 = v:encode()
			var3262, var3264 = protoModule.writeTag(var3261, var3262, 2, protoModule.wireTypes.lengthDelimited)
			var3262, var3264 = protoModule.writeBuffer(var3262, var3264, var3263, buffer.len(var3263))
			local var3265 = var3262
			local var3266 = var3264
			local var3267, var3268 = protoModule.writeTag(buff, var3260, 1, protoModule.wireTypes.lengthDelimited)
			var3267, var3268 = protoModule.writeBuffer(var3267, var3268, var3265, var3266)
			buff = var3267
			var3260 = var3268
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3269, var3270 = protoModule.writeTag(buff, var3260, 2, protoModule.wireTypes.lengthDelimited)
			var3269, var3270 = protoModule.writeString(var3269, var3270, v)
			buff = var3269
			var3260 = var3270
		end
	end
	local buff_1 = buffer.create(var3260)
	buffer.copy(buff_1, 0, buff, 0, var3260)
	
	return buff_1
end

function t_83.decode(p167) --[[ line: 18506 ]]
	-- upvalues: t_83 (ref), protoModule (ref), t (ref)
	local var3272 = t_83.new()
	local var3273 = 0
	while var3273 < buffer.len(p167) do
		local _ = nil
		local var3274 = nil
		local var3275, var3276, var3277 = protoModule.readTag(p167, var3273)
		local var3278 = var3275
		var3274 = var3276
		var3273 = var3277
		
		if var3274 == protoModule.wireTypes.varint then
			local _ = nil
			local var3279, var3280 = protoModule.readVarInt(p167, var3273)
			local _ = var3279
			var3273 = var3280
			continue
		end
		if var3274 == protoModule.wireTypes.lengthDelimited then
			if var3278 == 1 then
				local _ = nil
				local var3281, var3282 = protoModule.readBuffer(p167, var3273)
				var3273 = var3282
				var3281 = t.UAMarketplaceCatalogFeedInputData_EntryMapEntry.decode(var3281)
				var3272.entry_map[var3281.key or ""] = var3281.value or t.FeedEntry.new()
			elseif var3278 == 2 then
				local _ = nil
				local var3283, var3284 = protoModule.readBuffer(p167, var3273)
				var3273 = var3284
				table.insert(var3272.entry_order, buffer.tostring(var3283))
			else
				local _ = nil
				local var3285, var3286 = protoModule.readVarInt(p167, var3273)
				var3273 = var3286 + var3285
			end
		elseif var3274 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3287, var3288 = protoModule.readFixed32(p167, var3273)
			local _ = var3287
			var3273 = var3288
		elseif var3274 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3289, var3290 = protoModule.readFixed64(p167, var3273)
			local _ = var3289
			var3273 = var3290
		else
			error("Unsupported wire type: " .. var3274)
		end
	end
	return var3272
end

function t_83:jsonEncode() --[[ line: 18561 ]]
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

function t_83:jsonDecode() --[[ line: 18583 ]]
	-- upvalues: t_83 (ref), t (ref)
	local var3294 = t_83.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3294.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3294.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3294.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3294.entry_order = t_1
	end
	return var3294
end

t_83.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogFeedInputData"
}
t.UAMarketplaceCatalogFeedInputData = t_83
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData)
local t_84 = {}
t_84.__index = t_84

function t_84.new(p168) --[[ line: 18641 ]]
	-- upvalues: t_84 (ref)
	return setmetatable({
		key = if p168 == nil or p168.key == nil then "" else p168.key,
		value = if p168 == nil or p168.value == nil then nil else p168.value
	}, t_84)
end

function t_84:encode() --[[ line: 18650 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3300 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3301, var3302 = protoModule.writeTag(buff, var3300, 1, protoModule.wireTypes.lengthDelimited)
		var3301, var3302 = protoModule.writeString(var3301, var3302, self.key)
		buff = var3301
		var3300 = var3302
	end
	if self.value ~= nil then
		local var3303 = self.value:encode()
		local var3304, var3305 = protoModule.writeTag(buff, var3300, 2, protoModule.wireTypes.lengthDelimited)
		var3304, var3305 = protoModule.writeBuffer(var3304, var3305, var3303, buffer.len(var3303))
		buff = var3304
		var3300 = var3305
	end
	local buff_1 = buffer.create(var3300)
	buffer.copy(buff_1, 0, buff, 0, var3300)
	
	return buff_1
end

function t_84.decode(p169) --[[ line: 18672 ]]
	-- upvalues: t_84 (ref), protoModule (ref), t (ref)
	local var3307 = t_84.new()
	local var3308 = 0
	while var3308 < buffer.len(p169) do
		local _ = nil
		local var3309 = nil
		local var3310, var3311, var3312 = protoModule.readTag(p169, var3308)
		local var3313 = var3310
		var3309 = var3311
		var3308 = var3312
		
		if var3309 == protoModule.wireTypes.varint then
			local _ = nil
			local var3314, var3315 = protoModule.readVarInt(p169, var3308)
			local _ = var3314
			var3308 = var3315
			continue
		end
		if var3309 == protoModule.wireTypes.lengthDelimited then
			if var3313 == 1 then
				local _ = nil
				local var3316, var3317 = protoModule.readBuffer(p169, var3308)
				var3308 = var3317
				var3307.key = buffer.tostring(var3316)
			elseif var3313 == 2 then
				local _ = nil
				local var3318, var3319 = protoModule.readBuffer(p169, var3308)
				var3308 = var3319
				var3307.value = t.FeedEntry.decode(var3318)
			else
				local _ = nil
				local var3320, var3321 = protoModule.readVarInt(p169, var3308)
				var3308 = var3321 + var3320
			end
		elseif var3309 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3322, var3323 = protoModule.readFixed32(p169, var3308)
			local _ = var3322
			var3308 = var3323
		elseif var3309 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3324, var3325 = protoModule.readFixed64(p169, var3308)
			local _ = var3324
			var3308 = var3325
		else
			error("Unsupported wire type: " .. var3309)
		end
	end
	return var3307
end

function t_84:jsonEncode() --[[ line: 18722 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_84:jsonDecode() --[[ line: 18738 ]]
	-- upvalues: t_84 (ref), t (ref)
	local var3327 = t_84.new()
	
	if self.key ~= nil then
		var3327.key = self.key
	end
	if self.value ~= nil then
		var3327.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3327
end

t_84.descriptor = {
	name = "UAMarketplaceCatalogFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.UAMarketplaceCatalogFeedInputData_EntryMapEntry = t_84
typeRegistryModule.default:register(t.UAMarketplaceCatalogFeedInputData_EntryMapEntry)
local t_85 = {}
t_85.__index = t_85

function t_85.new(p170) --[[ line: 18769 ]]
	-- upvalues: t_85 (ref)
	return setmetatable({
		marketplace_catalog_category_items = if p170 == nil or p170.marketplace_catalog_category_items == nil then {} else p170.marketplace_catalog_category_items,
		active_category_id = if p170 == nil or p170.active_category_id == nil then "" else p170.active_category_id,
		active_tooltip_idx = if p170 == nil or p170.active_tooltip_idx == nil then 0 else p170.active_tooltip_idx
	}, t_85)
end

function t_85:encode() --[[ line: 18782 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3329 = 0
	
	if self.marketplace_catalog_category_items ~= nil and #self.marketplace_catalog_category_items > 0 then
		for i, v in self.marketplace_catalog_category_items do
			local var3330 = v:encode()
			local var3331, var3332 = protoModule.writeTag(buff, var3329, 1, protoModule.wireTypes.lengthDelimited)
			var3331, var3332 = protoModule.writeBuffer(var3331, var3332, var3330, buffer.len(var3330))
			buff = var3331
			var3329 = var3332
		end
	end
	if self.active_category_id ~= nil and self.active_category_id ~= "" then
		local var3333, var3334 = protoModule.writeTag(buff, var3329, 2, protoModule.wireTypes.lengthDelimited)
		var3333, var3334 = protoModule.writeString(var3333, var3334, self.active_category_id)
		buff = var3333
		var3329 = var3334
	end
	if self.active_tooltip_idx ~= nil and self.active_tooltip_idx ~= 0 then
		local var3335, var3336 = protoModule.writeTag(buff, var3329, 3, protoModule.wireTypes.varint)
		var3335, var3336 = protoModule.writeVarInt(var3335, var3336, self.active_tooltip_idx)
		buff = var3335
		var3329 = var3336
	end
	local buff_1 = buffer.create(var3329)
	buffer.copy(buff_1, 0, buff, 0, var3329)
	
	return buff_1
end

function t_85.decode(p171) --[[ line: 18811 ]]
	-- upvalues: t_85 (ref), protoModule (ref), t (ref)
	local var3338 = t_85.new()
	local var3339 = 0
	while var3339 < buffer.len(p171) do
		local _ = nil
		local var3340 = nil
		local var3341, var3342, var3343 = protoModule.readTag(p171, var3339)
		local var3344 = var3341
		var3340 = var3342
		var3339 = var3343
		
		if var3340 == protoModule.wireTypes.varint then
			if var3344 == 3 then
				local _ = nil
				local var3345, var3346 = protoModule.readVarIntI64(p171, var3339)
				var3339 = var3346
				var3338.active_tooltip_idx = var3345
			else
				local _ = nil
				local var3347, var3348 = protoModule.readVarInt(p171, var3339)
				local _ = var3347
				var3339 = var3348
			end
		end
		if var3340 == protoModule.wireTypes.lengthDelimited then
			if var3344 == 1 then
				local _ = nil
				local var3349, var3350 = protoModule.readBuffer(p171, var3339)
				var3339 = var3350
				table.insert(var3338.marketplace_catalog_category_items, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.decode(var3349))
			elseif var3344 == 2 then
				local _ = nil
				local var3351, var3352 = protoModule.readBuffer(p171, var3339)
				var3339 = var3352
				var3338.active_category_id = buffer.tostring(var3351)
			else
				local _ = nil
				local var3353, var3354 = protoModule.readVarInt(p171, var3339)
				var3339 = var3354 + var3353
			end
		elseif var3340 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3355, var3356 = protoModule.readFixed32(p171, var3339)
			local _ = var3355
			var3339 = var3356
		elseif var3340 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3357, var3358 = protoModule.readFixed64(p171, var3339)
			local _ = var3357
			var3339 = var3358
		else
			error("Unsupported wire type: " .. var3340)
		end
	end
	return var3338
end

function t_85:jsonEncode() --[[ line: 18869 ]]
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

function t_85:jsonDecode() --[[ line: 18893 ]]
	-- upvalues: t_85 (ref), t (ref)
	local var3361 = t_85.new()
	
	if self.marketplace_catalog_category_items ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplace_catalog_category_items do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3361.marketplace_catalog_category_items = t_1
	end
	if self.marketplaceCatalogCategoryItems ~= nil then
		local t_1 = {}
		
		for i, v in self.marketplaceCatalogCategoryItems do
			table.insert(t_1, t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem.jsonDecode(v))
		end
		var3361.marketplace_catalog_category_items = t_1
	end
	if self.active_category_id ~= nil then
		var3361.active_category_id = self.active_category_id
	end
	if self.activeCategoryId ~= nil then
		var3361.active_category_id = self.activeCategoryId
	end
	if self.active_tooltip_idx ~= nil then
		var3361.active_tooltip_idx = self.active_tooltip_idx
	end
	if self.activeTooltipIdx ~= nil then
		var3361.active_tooltip_idx = self.activeTooltipIdx
	end
	return var3361
end

t_85.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UAMarketplaceCatalogCategoryMenuInputData"
}
t.UAMarketplaceCatalogCategoryMenuInputData = t_85
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData)
local t_86 = {}
t_86.__index = t_86

function t_86.new(p172) --[[ line: 18956 ]]
	-- upvalues: t_86 (ref)
	return setmetatable({
		marketplace_catalog_category_item_id = if p172 == nil or p172.marketplace_catalog_category_item_id == nil then "" else p172.marketplace_catalog_category_item_id
	}, t_86)
end

function t_86:encode() --[[ line: 18970 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3365 = 0
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		local var3366, var3367 = protoModule.writeTag(buff, var3365, 1, protoModule.wireTypes.lengthDelimited)
		var3366, var3367 = protoModule.writeString(var3366, var3367, self.marketplace_catalog_category_item_id)
		buff = var3366
		var3365 = var3367
	end
	local buff_1 = buffer.create(var3365)
	buffer.copy(buff_1, 0, buff, 0, var3365)
	
	return buff_1
end

function t_86.decode(p173) --[[ line: 18986 ]]
	-- upvalues: t_86 (ref), protoModule (ref)
	local var3369 = t_86.new()
	local var3370 = 0
	while var3370 < buffer.len(p173) do
		local _ = nil
		local var3371 = nil
		local var3372, var3373, var3374 = protoModule.readTag(p173, var3370)
		local var3375 = var3372
		var3371 = var3373
		var3370 = var3374
		
		if var3371 == protoModule.wireTypes.varint then
			local _ = nil
			local var3376, var3377 = protoModule.readVarInt(p173, var3370)
			local _ = var3376
			var3370 = var3377
			continue
		end
		if var3371 == protoModule.wireTypes.lengthDelimited then
			if var3375 == 1 then
				local _ = nil
				local var3378, var3379 = protoModule.readBuffer(p173, var3370)
				var3370 = var3379
				var3369.marketplace_catalog_category_item_id = buffer.tostring(var3378)
			else
				local _ = nil
				local var3380, var3381 = protoModule.readVarInt(p173, var3370)
				var3370 = var3381 + var3380
			end
		elseif var3371 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3382, var3383 = protoModule.readFixed32(p173, var3370)
			local _ = var3382
			var3370 = var3383
		elseif var3371 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3384, var3385 = protoModule.readFixed64(p173, var3370)
			local _ = var3384
			var3370 = var3385
		else
			error("Unsupported wire type: " .. var3371)
		end
	end
	return var3369
end

function t_86:jsonEncode() --[[ line: 19031 ]]
	local t = {}
	
	if self.marketplace_catalog_category_item_id ~= nil and self.marketplace_catalog_category_item_id ~= "" then
		t.marketplaceCatalogCategoryItemId = self.marketplace_catalog_category_item_id
	end
	return t
end

function t_86:jsonDecode() --[[ line: 19043 ]]
	-- upvalues: t_86 (ref)
	local var3387 = t_86.new()
	
	if self.marketplace_catalog_category_item_id ~= nil then
		var3387.marketplace_catalog_category_item_id = self.marketplace_catalog_category_item_id
	end
	if self.marketplaceCatalogCategoryItemId ~= nil then
		var3387.marketplace_catalog_category_item_id = self.marketplaceCatalogCategoryItemId
	end
	return var3387
end

t_86.descriptor = {
	name = "UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceCatalogCategoryItem"
}
t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem = t_86
typeRegistryModule.default:register(t.UAMarketplaceCatalogCategoryMenuInputData_MarketplaceCatalogCategoryItem)
local t_87 = {}
t_87.__index = t_87

function t_87.new(p174) --[[ line: 19076 ]]
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

function t_87:encode() --[[ line: 19098 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3389 = 0
	
	if self.hero_icon ~= nil then
		local var3390, var3391 = protoModule.writeTag(buff, var3389, 1, protoModule.wireTypes.lengthDelimited)
		var3390, var3391 = protoModule.writeString(var3390, var3391, self.hero_icon)
		buff = var3390
		var3389 = var3391
	end
	if self.body_dismiss_button_text ~= nil and self.body_dismiss_button_text ~= "" then
		local var3392, var3393 = protoModule.writeTag(buff, var3389, 2, protoModule.wireTypes.lengthDelimited)
		var3392, var3393 = protoModule.writeString(var3392, var3393, self.body_dismiss_button_text)
		buff = var3392
		var3389 = var3393
	end
	if self.body_title ~= nil and self.body_title ~= "" then
		local var3394, var3395 = protoModule.writeTag(buff, var3389, 3, protoModule.wireTypes.lengthDelimited)
		var3394, var3395 = protoModule.writeString(var3394, var3395, self.body_title)
		buff = var3394
		var3389 = var3395
	end
	if self.body_rich_text ~= nil and self.body_rich_text ~= "" then
		local var3396, var3397 = protoModule.writeTag(buff, var3389, 4, protoModule.wireTypes.lengthDelimited)
		var3396, var3397 = protoModule.writeString(var3396, var3397, self.body_rich_text)
		buff = var3396
		var3389 = var3397
	end
	if self.terms_link_text ~= nil then
		local var3398, var3399 = protoModule.writeTag(buff, var3389, 5, protoModule.wireTypes.lengthDelimited)
		var3398, var3399 = protoModule.writeString(var3398, var3399, self.terms_link_text)
		buff = var3398
		var3389 = var3399
	end
	if self.terms_title ~= nil then
		local var3400, var3401 = protoModule.writeTag(buff, var3389, 6, protoModule.wireTypes.lengthDelimited)
		var3400, var3401 = protoModule.writeString(var3400, var3401, self.terms_title)
		buff = var3400
		var3389 = var3401
	end
	if self.terms_body_rich_text ~= nil then
		local var3402, var3403 = protoModule.writeTag(buff, var3389, 7, protoModule.wireTypes.lengthDelimited)
		var3402, var3403 = protoModule.writeString(var3402, var3403, self.terms_body_rich_text)
		buff = var3402
		var3389 = var3403
	end
	if self.terms_dismiss_button_text ~= nil then
		local var3404, var3405 = protoModule.writeTag(buff, var3389, 8, protoModule.wireTypes.lengthDelimited)
		var3404, var3405 = protoModule.writeString(var3404, var3405, self.terms_dismiss_button_text)
		buff = var3404
		var3389 = var3405
	end
	if self.offer_id ~= nil and self.offer_id ~= "" then
		local var3406, var3407 = protoModule.writeTag(buff, var3389, 9, protoModule.wireTypes.lengthDelimited)
		var3406, var3407 = protoModule.writeString(var3406, var3407, self.offer_id)
		buff = var3406
		var3389 = var3407
	end
	local buff_1 = buffer.create(var3389)
	buffer.copy(buff_1, 0, buff, 0, var3389)
	
	return buff_1
end

function t_87.decode(p175) --[[ line: 19152 ]]
	-- upvalues: t_87 (ref), protoModule (ref)
	local var3409 = t_87.new()
	local var3410 = 0
	while var3410 < buffer.len(p175) do
		local _ = nil
		local var3411 = nil
		local var3412, var3413, var3414 = protoModule.readTag(p175, var3410)
		local var3415 = var3412
		var3411 = var3413
		var3410 = var3414
		
		if var3411 == protoModule.wireTypes.varint then
			local _ = nil
			local var3416, var3417 = protoModule.readVarInt(p175, var3410)
			local _ = var3416
			var3410 = var3417
			continue
		end
		if var3411 == protoModule.wireTypes.lengthDelimited then
			if var3415 == 1 then
				local _ = nil
				local var3418, var3419 = protoModule.readBuffer(p175, var3410)
				var3410 = var3419
				var3409.hero_icon = buffer.tostring(var3418)
			elseif var3415 == 2 then
				local _ = nil
				local var3420, var3421 = protoModule.readBuffer(p175, var3410)
				var3410 = var3421
				var3409.body_dismiss_button_text = buffer.tostring(var3420)
			elseif var3415 == 3 then
				local _ = nil
				local var3422, var3423 = protoModule.readBuffer(p175, var3410)
				var3410 = var3423
				var3409.body_title = buffer.tostring(var3422)
			elseif var3415 == 4 then
				local _ = nil
				local var3424, var3425 = protoModule.readBuffer(p175, var3410)
				var3410 = var3425
				var3409.body_rich_text = buffer.tostring(var3424)
			elseif var3415 == 5 then
				local _ = nil
				local var3426, var3427 = protoModule.readBuffer(p175, var3410)
				var3410 = var3427
				var3409.terms_link_text = buffer.tostring(var3426)
			elseif var3415 == 6 then
				local _ = nil
				local var3428, var3429 = protoModule.readBuffer(p175, var3410)
				var3410 = var3429
				var3409.terms_title = buffer.tostring(var3428)
			elseif var3415 == 7 then
				local _ = nil
				local var3430, var3431 = protoModule.readBuffer(p175, var3410)
				var3410 = var3431
				var3409.terms_body_rich_text = buffer.tostring(var3430)
			elseif var3415 == 8 then
				local _ = nil
				local var3432, var3433 = protoModule.readBuffer(p175, var3410)
				var3410 = var3433
				var3409.terms_dismiss_button_text = buffer.tostring(var3432)
			elseif var3415 == 9 then
				local _ = nil
				local var3434, var3435 = protoModule.readBuffer(p175, var3410)
				var3410 = var3435
				var3409.offer_id = buffer.tostring(var3434)
			else
				local _ = nil
				local var3436, var3437 = protoModule.readVarInt(p175, var3410)
				var3410 = var3437 + var3436
			end
		elseif var3411 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3438, var3439 = protoModule.readFixed32(p175, var3410)
			local _ = var3438
			var3410 = var3439
		elseif var3411 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3440, var3441 = protoModule.readFixed64(p175, var3410)
			local _ = var3440
			var3410 = var3441
		else
			error("Unsupported wire type: " .. var3411)
		end
	end
	return var3409
end

function t_87:jsonEncode() --[[ line: 19235 ]]
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

function t_87:jsonDecode() --[[ line: 19277 ]]
	-- upvalues: t_87 (ref)
	local var3443 = t_87.new()
	
	if self.hero_icon ~= nil then
		var3443.hero_icon = self.hero_icon
	end
	if self.heroIcon ~= nil then
		var3443.hero_icon = self.heroIcon
	end
	if self.body_dismiss_button_text ~= nil then
		var3443.body_dismiss_button_text = self.body_dismiss_button_text
	end
	if self.bodyDismissButtonText ~= nil then
		var3443.body_dismiss_button_text = self.bodyDismissButtonText
	end
	if self.body_title ~= nil then
		var3443.body_title = self.body_title
	end
	if self.bodyTitle ~= nil then
		var3443.body_title = self.bodyTitle
	end
	if self.body_rich_text ~= nil then
		var3443.body_rich_text = self.body_rich_text
	end
	if self.bodyRichText ~= nil then
		var3443.body_rich_text = self.bodyRichText
	end
	if self.terms_link_text ~= nil then
		var3443.terms_link_text = self.terms_link_text
	end
	if self.termsLinkText ~= nil then
		var3443.terms_link_text = self.termsLinkText
	end
	if self.terms_title ~= nil then
		var3443.terms_title = self.terms_title
	end
	if self.termsTitle ~= nil then
		var3443.terms_title = self.termsTitle
	end
	if self.terms_body_rich_text ~= nil then
		var3443.terms_body_rich_text = self.terms_body_rich_text
	end
	if self.termsBodyRichText ~= nil then
		var3443.terms_body_rich_text = self.termsBodyRichText
	end
	if self.terms_dismiss_button_text ~= nil then
		var3443.terms_dismiss_button_text = self.terms_dismiss_button_text
	end
	if self.termsDismissButtonText ~= nil then
		var3443.terms_dismiss_button_text = self.termsDismissButtonText
	end
	if self.offer_id ~= nil then
		var3443.offer_id = self.offer_id
	end
	if self.offerId ~= nil then
		var3443.offer_id = self.offerId
	end
	return var3443
end

t_87.descriptor = {
	name = "MarketplaceOfferModalInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MarketplaceOfferModalInputData"
}
t.MarketplaceOfferModalInputData = t_87
typeRegistryModule.default:register(t.MarketplaceOfferModalInputData)
local t_88 = {}
t_88.__index = t_88

function t_88.new(p176) --[[ line: 19369 ]]
	-- upvalues: t_88 (ref)
	return setmetatable({
		items = if p176 == nil or p176.items == nil then {} else p176.items,
		preview_columns = if p176 == nil or p176.preview_columns == nil then 0 else p176.preview_columns,
		impression_id = if p176 == nil or p176.impression_id == nil then "" else p176.impression_id
	}, t_88)
end

function t_88:encode() --[[ line: 19377 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3445 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3446 = v:encode()
			local var3447, var3448 = protoModule.writeTag(buff, var3445, 1, protoModule.wireTypes.lengthDelimited)
			var3447, var3448 = protoModule.writeBuffer(var3447, var3448, var3446, buffer.len(var3446))
			buff = var3447
			var3445 = var3448
		end
	end
	if self.preview_columns ~= nil and self.preview_columns ~= 0 then
		local var3449, var3450 = protoModule.writeTag(buff, var3445, 2, protoModule.wireTypes.varint)
		var3449, var3450 = protoModule.writeVarInt(var3449, var3450, self.preview_columns)
		buff = var3449
		var3445 = var3450
	end
	if self.impression_id ~= nil and self.impression_id ~= "" then
		local var3451, var3452 = protoModule.writeTag(buff, var3445, 3, protoModule.wireTypes.lengthDelimited)
		var3451, var3452 = protoModule.writeString(var3451, var3452, self.impression_id)
		buff = var3451
		var3445 = var3452
	end
	local buff_1 = buffer.create(var3445)
	buffer.copy(buff_1, 0, buff, 0, var3445)
	
	return buff_1
end

function t_88.decode(p177) --[[ line: 19404 ]]
	-- upvalues: t_88 (ref), protoModule (ref), t (ref)
	local var3454 = t_88.new()
	local var3455 = 0
	while var3455 < buffer.len(p177) do
		local _ = nil
		local var3456 = nil
		local var3457, var3458, var3459 = protoModule.readTag(p177, var3455)
		local var3460 = var3457
		var3456 = var3458
		var3455 = var3459
		
		if var3456 == protoModule.wireTypes.varint then
			if var3460 == 2 then
				local _ = nil
				local var3461, var3462 = protoModule.readVarIntI32(p177, var3455)
				var3455 = var3462
				var3454.preview_columns = var3461
			else
				local _ = nil
				local var3463, var3464 = protoModule.readVarInt(p177, var3455)
				local _ = var3463
				var3455 = var3464
			end
		end
		if var3456 == protoModule.wireTypes.lengthDelimited then
			if var3460 == 1 then
				local _ = nil
				local var3465, var3466 = protoModule.readBuffer(p177, var3455)
				var3455 = var3466
				table.insert(var3454.items, t.CatalogItemGridInputData_CatalogItem.decode(var3465))
			elseif var3460 == 3 then
				local _ = nil
				local var3467, var3468 = protoModule.readBuffer(p177, var3455)
				var3455 = var3468
				var3454.impression_id = buffer.tostring(var3467)
			else
				local _ = nil
				local var3469, var3470 = protoModule.readVarInt(p177, var3455)
				var3455 = var3470 + var3469
			end
		elseif var3456 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3471, var3472 = protoModule.readFixed32(p177, var3455)
			local _ = var3471
			var3455 = var3472
		elseif var3456 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3473, var3474 = protoModule.readFixed64(p177, var3455)
			local _ = var3473
			var3455 = var3474
		else
			error("Unsupported wire type: " .. var3456)
		end
	end
	return var3454
end

function t_88:jsonEncode() --[[ line: 19457 ]]
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

function t_88:jsonDecode() --[[ line: 19479 ]]
	-- upvalues: t_88 (ref), t (ref)
	local var3477 = t_88.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemGridInputData_CatalogItem.jsonDecode(v))
		end
		var3477.items = t_1
	end
	if self.preview_columns ~= nil then
		var3477.preview_columns = self.preview_columns
	end
	if self.previewColumns ~= nil then
		var3477.preview_columns = self.previewColumns
	end
	if self.impression_id ~= nil then
		var3477.impression_id = self.impression_id
	end
	if self.impressionId ~= nil then
		var3477.impression_id = self.impressionId
	end
	return var3477
end

t_88.descriptor = {
	name = "CatalogItemGridInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemGridInputData"
}
t.CatalogItemGridInputData = t_88
typeRegistryModule.default:register(t.CatalogItemGridInputData)
local t_89 = {}
t_89.__index = t_89

function t_89.new(p178) --[[ line: 19524 ]]
	-- upvalues: t_89 (ref)
	return setmetatable({
		id = if p178 == nil or p178.id == nil then "" else p178.id,
		type = if p178 == nil or p178.type == nil then "" else p178.type
	}, t_89)
end

function t_89:encode() --[[ line: 19533 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3480 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var3481, var3482 = protoModule.writeTag(buff, var3480, 1, protoModule.wireTypes.lengthDelimited)
		var3481, var3482 = protoModule.writeString(var3481, var3482, self.id)
		buff = var3481
		var3480 = var3482
	end
	if self.type ~= nil and self.type ~= "" then
		local var3483, var3484 = protoModule.writeTag(buff, var3480, 2, protoModule.wireTypes.lengthDelimited)
		var3483, var3484 = protoModule.writeString(var3483, var3484, self.type)
		buff = var3483
		var3480 = var3484
	end
	local buff_1 = buffer.create(var3480)
	buffer.copy(buff_1, 0, buff, 0, var3480)
	
	return buff_1
end

function t_89.decode(p179) --[[ line: 19552 ]]
	-- upvalues: t_89 (ref), protoModule (ref)
	local var3486 = t_89.new()
	local var3487 = 0
	while var3487 < buffer.len(p179) do
		local _ = nil
		local var3488 = nil
		local var3489, var3490, var3491 = protoModule.readTag(p179, var3487)
		local var3492 = var3489
		var3488 = var3490
		var3487 = var3491
		
		if var3488 == protoModule.wireTypes.varint then
			local _ = nil
			local var3493, var3494 = protoModule.readVarInt(p179, var3487)
			local _ = var3493
			var3487 = var3494
			continue
		end
		if var3488 == protoModule.wireTypes.lengthDelimited then
			if var3492 == 1 then
				local _ = nil
				local var3495, var3496 = protoModule.readBuffer(p179, var3487)
				var3487 = var3496
				var3486.id = buffer.tostring(var3495)
			elseif var3492 == 2 then
				local _ = nil
				local var3497, var3498 = protoModule.readBuffer(p179, var3487)
				var3487 = var3498
				var3486.type = buffer.tostring(var3497)
			else
				local _ = nil
				local var3499, var3500 = protoModule.readVarInt(p179, var3487)
				var3487 = var3500 + var3499
			end
		elseif var3488 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3501, var3502 = protoModule.readFixed32(p179, var3487)
			local _ = var3501
			var3487 = var3502
		elseif var3488 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3503, var3504 = protoModule.readFixed64(p179, var3487)
			local _ = var3503
			var3487 = var3504
		else
			error("Unsupported wire type: " .. var3488)
		end
	end
	return var3486
end

function t_89:jsonEncode() --[[ line: 19600 ]]
	local t = {}
	
	if self.id ~= nil and self.id ~= "" then
		t.id = self.id
	end
	if self.type ~= nil and self.type ~= "" then
		t.type = self.type
	end
	return t
end

function t_89:jsonDecode() --[[ line: 19614 ]]
	-- upvalues: t_89 (ref)
	local var3506 = t_89.new()
	
	if self.id ~= nil then
		var3506.id = self.id
	end
	if self.type ~= nil then
		var3506.type = self.type
	end
	return var3506
end

t_89.descriptor = {
	name = "CatalogItemGridInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemGridInputData_CatalogItem = t_89
typeRegistryModule.default:register(t.CatalogItemGridInputData_CatalogItem)
local t_90 = {}
t_90.__index = t_90

function t_90.new(p180) --[[ line: 19644 ]]
	-- upvalues: t_90 (ref)
	return setmetatable({
		entry_map = if p180 == nil or p180.entry_map == nil then {} else p180.entry_map,
		entry_order = if p180 == nil or p180.entry_order == nil then {} else p180.entry_order,
		content_pools = if p180 == nil or p180.content_pools == nil then {} else p180.content_pools,
		search_session_id = if p180 == nil or p180.search_session_id == nil then "" else p180.search_session_id
	}, t_90)
end

function t_90:encode() --[[ line: 19655 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3508 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var3509, var3510 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3509, var3510 = protoModule.writeString(var3509, var3510, i)
			local var3511 = v:encode()
			var3510, var3512 = protoModule.writeTag(var3509, var3510, 2, protoModule.wireTypes.lengthDelimited)
			var3510, var3512 = protoModule.writeBuffer(var3510, var3512, var3511, buffer.len(var3511))
			local var3513 = var3510
			local var3514 = var3512
			local var3515, var3516 = protoModule.writeTag(buff, var3508, 1, protoModule.wireTypes.lengthDelimited)
			var3515, var3516 = protoModule.writeBuffer(var3515, var3516, var3513, var3514)
			buff = var3515
			var3508 = var3516
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var3517, var3518 = protoModule.writeTag(buff, var3508, 2, protoModule.wireTypes.lengthDelimited)
			var3517, var3518 = protoModule.writeString(var3517, var3518, v)
			buff = var3517
			var3508 = var3518
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var3519, var3520 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var3519, var3520 = protoModule.writeString(var3519, var3520, i)
			local var3521 = v:encode()
			var3520, var3522 = protoModule.writeTag(var3519, var3520, 2, protoModule.wireTypes.lengthDelimited)
			var3520, var3522 = protoModule.writeBuffer(var3520, var3522, var3521, buffer.len(var3521))
			local var3523 = var3520
			local var3524 = var3522
			local var3525, var3526 = protoModule.writeTag(buff, var3508, 3, protoModule.wireTypes.lengthDelimited)
			var3525, var3526 = protoModule.writeBuffer(var3525, var3526, var3523, var3524)
			buff = var3525
			var3508 = var3526
		end
	end
	if self.search_session_id ~= nil and self.search_session_id ~= "" then
		local var3527, var3528 = protoModule.writeTag(buff, var3508, 4, protoModule.wireTypes.lengthDelimited)
		var3527, var3528 = protoModule.writeString(var3527, var3528, self.search_session_id)
		buff = var3527
		var3508 = var3528
	end
	local buff_1 = buffer.create(var3508)
	buffer.copy(buff_1, 0, buff, 0, var3508)
	
	return buff_1
end

function t_90.decode(p181) --[[ line: 19704 ]]
	-- upvalues: t_90 (ref), protoModule (ref), t (ref)
	local var3530 = t_90.new()
	local var3531 = 0
	while var3531 < buffer.len(p181) do
		local _ = nil
		local var3532 = nil
		local var3533, var3534, var3535 = protoModule.readTag(p181, var3531)
		local var3536 = var3533
		var3532 = var3534
		var3531 = var3535
		
		if var3532 == protoModule.wireTypes.varint then
			local _ = nil
			local var3537, var3538 = protoModule.readVarInt(p181, var3531)
			local _ = var3537
			var3531 = var3538
			continue
		end
		if var3532 == protoModule.wireTypes.lengthDelimited then
			if var3536 == 1 then
				local _ = nil
				local var3539, var3540 = protoModule.readBuffer(p181, var3531)
				var3531 = var3540
				var3539 = t.SearchResultsFeedInputData_EntryMapEntry.decode(var3539)
				var3530.entry_map[var3539.key or ""] = var3539.value or t.FeedEntry.new()
			elseif var3536 == 2 then
				local _ = nil
				local var3541, var3542 = protoModule.readBuffer(p181, var3531)
				var3531 = var3542
				table.insert(var3530.entry_order, buffer.tostring(var3541))
			elseif var3536 == 3 then
				local _ = nil
				local var3543, var3544 = protoModule.readBuffer(p181, var3531)
				var3531 = var3544
				var3543 = t.SearchResultsFeedInputData_ContentPoolsEntry.decode(var3543)
				var3530.content_pools[var3543.key or ""] = var3543.value or t.ContentPool.new()
			elseif var3536 == 4 then
				local _ = nil
				local var3545, var3546 = protoModule.readBuffer(p181, var3531)
				var3531 = var3546
				var3530.search_session_id = buffer.tostring(var3545)
			else
				local _ = nil
				local var3547, var3548 = protoModule.readVarInt(p181, var3531)
				var3531 = var3548 + var3547
			end
		elseif var3532 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3549, var3550 = protoModule.readFixed32(p181, var3531)
			local _ = var3549
			var3531 = var3550
		elseif var3532 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3551, var3552 = protoModule.readFixed64(p181, var3531)
			local _ = var3551
			var3531 = var3552
		else
			error("Unsupported wire type: " .. var3532)
		end
	end
	return var3530
end

function t_90:jsonEncode() --[[ line: 19776 ]]
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

function t_90:jsonDecode() --[[ line: 19810 ]]
	-- upvalues: t_90 (ref), t (ref)
	local var3557 = t_90.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3557.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var3557.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var3557.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var3557.entry_order = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3557.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var3557.content_pools = t_1
	end
	if self.search_session_id ~= nil then
		var3557.search_session_id = self.search_session_id
	end
	if self.searchSessionId ~= nil then
		var3557.search_session_id = self.searchSessionId
	end
	return var3557
end

t_90.descriptor = {
	name = "SearchResultsFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.SearchResultsFeedInputData"
}
t.SearchResultsFeedInputData = t_90
typeRegistryModule.default:register(t.SearchResultsFeedInputData)
local t_91 = {}
t_91.__index = t_91

function t_91.new(p182) --[[ line: 19892 ]]
	-- upvalues: t_91 (ref)
	return setmetatable({
		key = if p182 == nil or p182.key == nil then "" else p182.key,
		value = if p182 == nil or p182.value == nil then nil else p182.value
	}, t_91)
end

function t_91:encode() --[[ line: 19901 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3565 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3566, var3567 = protoModule.writeTag(buff, var3565, 1, protoModule.wireTypes.lengthDelimited)
		var3566, var3567 = protoModule.writeString(var3566, var3567, self.key)
		buff = var3566
		var3565 = var3567
	end
	if self.value ~= nil then
		local var3568 = self.value:encode()
		local var3569, var3570 = protoModule.writeTag(buff, var3565, 2, protoModule.wireTypes.lengthDelimited)
		var3569, var3570 = protoModule.writeBuffer(var3569, var3570, var3568, buffer.len(var3568))
		buff = var3569
		var3565 = var3570
	end
	local buff_1 = buffer.create(var3565)
	buffer.copy(buff_1, 0, buff, 0, var3565)
	
	return buff_1
end

function t_91.decode(p183) --[[ line: 19923 ]]
	-- upvalues: t_91 (ref), protoModule (ref), t (ref)
	local var3572 = t_91.new()
	local var3573 = 0
	while var3573 < buffer.len(p183) do
		local _ = nil
		local var3574 = nil
		local var3575, var3576, var3577 = protoModule.readTag(p183, var3573)
		local var3578 = var3575
		var3574 = var3576
		var3573 = var3577
		
		if var3574 == protoModule.wireTypes.varint then
			local _ = nil
			local var3579, var3580 = protoModule.readVarInt(p183, var3573)
			local _ = var3579
			var3573 = var3580
			continue
		end
		if var3574 == protoModule.wireTypes.lengthDelimited then
			if var3578 == 1 then
				local _ = nil
				local var3581, var3582 = protoModule.readBuffer(p183, var3573)
				var3573 = var3582
				var3572.key = buffer.tostring(var3581)
			elseif var3578 == 2 then
				local _ = nil
				local var3583, var3584 = protoModule.readBuffer(p183, var3573)
				var3573 = var3584
				var3572.value = t.FeedEntry.decode(var3583)
			else
				local _ = nil
				local var3585, var3586 = protoModule.readVarInt(p183, var3573)
				var3573 = var3586 + var3585
			end
		elseif var3574 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3587, var3588 = protoModule.readFixed32(p183, var3573)
			local _ = var3587
			var3573 = var3588
		elseif var3574 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3589, var3590 = protoModule.readFixed64(p183, var3573)
			local _ = var3589
			var3573 = var3590
		else
			error("Unsupported wire type: " .. var3574)
		end
	end
	return var3572
end

function t_91:jsonEncode() --[[ line: 19973 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_91:jsonDecode() --[[ line: 19989 ]]
	-- upvalues: t_91 (ref), t (ref)
	local var3592 = t_91.new()
	
	if self.key ~= nil then
		var3592.key = self.key
	end
	if self.value ~= nil then
		var3592.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var3592
end

t_91.descriptor = {
	name = "SearchResultsFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.SearchResultsFeedInputData_EntryMapEntry = t_91
typeRegistryModule.default:register(t.SearchResultsFeedInputData_EntryMapEntry)
local t_92 = {}
t_92.__index = t_92

function t_92.new(p184) --[[ line: 20019 ]]
	-- upvalues: t_92 (ref)
	return setmetatable({
		key = if p184 == nil or p184.key == nil then "" else p184.key,
		value = if p184 == nil or p184.value == nil then nil else p184.value
	}, t_92)
end

function t_92:encode() --[[ line: 20028 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3594 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var3595, var3596 = protoModule.writeTag(buff, var3594, 1, protoModule.wireTypes.lengthDelimited)
		var3595, var3596 = protoModule.writeString(var3595, var3596, self.key)
		buff = var3595
		var3594 = var3596
	end
	if self.value ~= nil then
		local var3597 = self.value:encode()
		local var3598, var3599 = protoModule.writeTag(buff, var3594, 2, protoModule.wireTypes.lengthDelimited)
		var3598, var3599 = protoModule.writeBuffer(var3598, var3599, var3597, buffer.len(var3597))
		buff = var3598
		var3594 = var3599
	end
	local buff_1 = buffer.create(var3594)
	buffer.copy(buff_1, 0, buff, 0, var3594)
	
	return buff_1
end

function t_92.decode(p185) --[[ line: 20050 ]]
	-- upvalues: t_92 (ref), protoModule (ref), t (ref)
	local var3601 = t_92.new()
	local var3602 = 0
	while var3602 < buffer.len(p185) do
		local _ = nil
		local var3603 = nil
		local var3604, var3605, var3606 = protoModule.readTag(p185, var3602)
		local var3607 = var3604
		var3603 = var3605
		var3602 = var3606
		
		if var3603 == protoModule.wireTypes.varint then
			local _ = nil
			local var3608, var3609 = protoModule.readVarInt(p185, var3602)
			local _ = var3608
			var3602 = var3609
			continue
		end
		if var3603 == protoModule.wireTypes.lengthDelimited then
			if var3607 == 1 then
				local _ = nil
				local var3610, var3611 = protoModule.readBuffer(p185, var3602)
				var3602 = var3611
				var3601.key = buffer.tostring(var3610)
			elseif var3607 == 2 then
				local _ = nil
				local var3612, var3613 = protoModule.readBuffer(p185, var3602)
				var3602 = var3613
				var3601.value = t.ContentPool.decode(var3612)
			else
				local _ = nil
				local var3614, var3615 = protoModule.readVarInt(p185, var3602)
				var3602 = var3615 + var3614
			end
		elseif var3603 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3616, var3617 = protoModule.readFixed32(p185, var3602)
			local _ = var3616
			var3602 = var3617
		elseif var3603 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3618, var3619 = protoModule.readFixed64(p185, var3602)
			local _ = var3618
			var3602 = var3619
		else
			error("Unsupported wire type: " .. var3603)
		end
	end
	return var3601
end

function t_92:jsonEncode() --[[ line: 20100 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_92:jsonDecode() --[[ line: 20116 ]]
	-- upvalues: t_92 (ref), t (ref)
	local var3621 = t_92.new()
	
	if self.key ~= nil then
		var3621.key = self.key
	end
	if self.value ~= nil then
		var3621.value = t.ContentPool.jsonDecode(self.value)
	end
	return var3621
end

t_92.descriptor = {
	name = "SearchResultsFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.SearchResultsFeedInputData_ContentPoolsEntry = t_92
typeRegistryModule.default:register(t.SearchResultsFeedInputData_ContentPoolsEntry)
local t_93 = {}
t_93.__index = t_93

function t_93.new(p186) --[[ line: 20146 ]]
	-- upvalues: t_93 (ref)
	return setmetatable({
		universe_id = if p186 == nil or p186.universe_id == nil then "" else p186.universe_id,
		is_content_locked = if p186 == nil or p186.is_content_locked == nil then false else p186.is_content_locked
	}, t_93)
end

function t_93:encode() --[[ line: 20155 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3623 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3624, var3625 = protoModule.writeTag(buff, var3623, 1, protoModule.wireTypes.lengthDelimited)
		var3624, var3625 = protoModule.writeString(var3624, var3625, self.universe_id)
		buff = var3624
		var3623 = var3625
	end
	if self.is_content_locked then
		local var3626, var3627 = protoModule.writeTag(buff, var3623, 2, protoModule.wireTypes.varint)
		var3626, var3627 = protoModule.writeVarInt(var3626, var3627, if self.is_content_locked then 1 else 0)
		buff = var3626
		var3623 = var3627
	end
	local buff_1 = buffer.create(var3623)
	buffer.copy(buff_1, 0, buff, 0, var3623)
	
	return buff_1
end

function t_93.decode(p187) --[[ line: 20174 ]]
	-- upvalues: t_93 (ref), protoModule (ref)
	local var3629 = t_93.new()
	local var3630 = 0
	while var3630 < buffer.len(p187) do
		local _ = nil
		local var3631 = nil
		local var3632, var3633, var3634 = protoModule.readTag(p187, var3630)
		local var3635 = var3632
		var3631 = var3633
		var3630 = var3634
		
		if var3631 == protoModule.wireTypes.varint then
			if var3635 == 2 then
				local _ = nil
				local var3636, var3637 = protoModule.readVarInt(p187, var3630)
				var3630 = var3637
				var3629.is_content_locked = var3636 ~= 0
			else
				local _ = nil
				local var3638, var3639 = protoModule.readVarInt(p187, var3630)
				local _ = var3638
				var3630 = var3639
			end
		end
		if var3631 == protoModule.wireTypes.lengthDelimited then
			if var3635 == 1 then
				local _ = nil
				local var3640, var3641 = protoModule.readBuffer(p187, var3630)
				var3630 = var3641
				var3629.universe_id = buffer.tostring(var3640)
			else
				local _ = nil
				local var3642, var3643 = protoModule.readVarInt(p187, var3630)
				var3630 = var3643 + var3642
			end
		elseif var3631 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3644, var3645 = protoModule.readFixed32(p187, var3630)
			local _ = var3644
			var3630 = var3645
		elseif var3631 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3646, var3647 = protoModule.readFixed64(p187, var3630)
			local _ = var3646
			var3630 = var3647
		else
			error("Unsupported wire type: " .. var3631)
		end
	end
	return var3629
end

function t_93:jsonEncode() --[[ line: 20222 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	if self.is_content_locked then
		t.isContentLocked = self.is_content_locked
	end
	return t
end

function t_93:jsonDecode() --[[ line: 20236 ]]
	-- upvalues: t_93 (ref)
	local var3649 = t_93.new()
	
	if self.universe_id ~= nil then
		var3649.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3649.universe_id = self.universeId
	end
	if self.is_content_locked ~= nil then
		var3649.is_content_locked = self.is_content_locked
	end
	if self.isContentLocked ~= nil then
		var3649.is_content_locked = self.isContentLocked
	end
	return var3649
end

t_93.descriptor = {
	name = "ExperienceEmphasisTileInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceEmphasisTileInputData"
}
t.ExperienceEmphasisTileInputData = t_93
typeRegistryModule.default:register(t.ExperienceEmphasisTileInputData)
local t_94 = {}
t_94.__index = t_94

function t_94.new(p188) --[[ line: 20272 ]]
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

function t_94:encode() --[[ line: 20286 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3651 = 0
	
	if self.overview_rich_text ~= nil and self.overview_rich_text ~= "" then
		local var3652, var3653 = protoModule.writeTag(buff, var3651, 1, protoModule.wireTypes.lengthDelimited)
		var3652, var3653 = protoModule.writeString(var3652, var3653, self.overview_rich_text)
		buff = var3652
		var3651 = var3653
	end
	if self.result_entry ~= nil then
		local var3654 = self.result_entry:encode()
		local var3655, var3656 = protoModule.writeTag(buff, var3651, 2, protoModule.wireTypes.lengthDelimited)
		var3655, var3656 = protoModule.writeBuffer(var3655, var3656, var3654, buffer.len(var3654))
		buff = var3655
		var3651 = var3656
	end
	if self.follow_up_queries ~= nil and #self.follow_up_queries > 0 then
		for i, v in self.follow_up_queries do
			local var3657, var3658 = protoModule.writeTag(buff, var3651, 3, protoModule.wireTypes.lengthDelimited)
			var3657, var3658 = protoModule.writeString(var3657, var3658, v)
			buff = var3657
			var3651 = var3658
		end
	end
	if self.show_loading then
		local var3659, var3660 = protoModule.writeTag(buff, var3651, 4, protoModule.wireTypes.varint)
		var3659, var3660 = protoModule.writeVarInt(var3659, var3660, if self.show_loading then 1 else 0)
		buff = var3659
		var3651 = var3660
	end
	if self.title ~= nil and self.title ~= "" then
		local var3661, var3662 = protoModule.writeTag(buff, var3651, 5, protoModule.wireTypes.lengthDelimited)
		var3661, var3662 = protoModule.writeString(var3661, var3662, self.title)
		buff = var3661
		var3651 = var3662
	end
	if self.search_query ~= nil and self.search_query ~= "" then
		local var3663, var3664 = protoModule.writeTag(buff, var3651, 6, protoModule.wireTypes.lengthDelimited)
		var3663, var3664 = protoModule.writeString(var3663, var3664, self.search_query)
		buff = var3663
		var3651 = var3664
	end
	if self.universe_ids ~= nil and self.universe_ids ~= "" then
		local var3665, var3666 = protoModule.writeTag(buff, var3651, 8, protoModule.wireTypes.lengthDelimited)
		var3665, var3666 = protoModule.writeString(var3665, var3666, self.universe_ids)
		buff = var3665
		var3651 = var3666
	end
	local buff_1 = buffer.create(var3651)
	buffer.copy(buff_1, 0, buff, 0, var3651)
	
	return buff_1
end

function t_94.decode(p189) --[[ line: 20333 ]]
	-- upvalues: t_94 (ref), protoModule (ref), t (ref)
	local var3668 = t_94.new()
	local var3669 = 0
	while var3669 < buffer.len(p189) do
		local _ = nil
		local var3670 = nil
		local var3671, var3672, var3673 = protoModule.readTag(p189, var3669)
		local var3674 = var3671
		var3670 = var3672
		var3669 = var3673
		
		if var3670 == protoModule.wireTypes.varint then
			if var3674 == 4 then
				local _ = nil
				local var3675, var3676 = protoModule.readVarInt(p189, var3669)
				var3669 = var3676
				var3668.show_loading = var3675 ~= 0
			else
				local _ = nil
				local var3677, var3678 = protoModule.readVarInt(p189, var3669)
				local _ = var3677
				var3669 = var3678
			end
		end
		if var3670 == protoModule.wireTypes.lengthDelimited then
			if var3674 == 1 then
				local _ = nil
				local var3679, var3680 = protoModule.readBuffer(p189, var3669)
				var3669 = var3680
				var3668.overview_rich_text = buffer.tostring(var3679)
			elseif var3674 == 2 then
				local _ = nil
				local var3681, var3682 = protoModule.readBuffer(p189, var3669)
				var3669 = var3682
				var3668.result_entry = t.FeedEntry.decode(var3681)
			elseif var3674 == 3 then
				local _ = nil
				local var3683, var3684 = protoModule.readBuffer(p189, var3669)
				var3669 = var3684
				table.insert(var3668.follow_up_queries, buffer.tostring(var3683))
			elseif var3674 == 5 then
				local _ = nil
				local var3685, var3686 = protoModule.readBuffer(p189, var3669)
				var3669 = var3686
				var3668.title = buffer.tostring(var3685)
			elseif var3674 == 6 then
				local _ = nil
				local var3687, var3688 = protoModule.readBuffer(p189, var3669)
				var3669 = var3688
				var3668.search_query = buffer.tostring(var3687)
			elseif var3674 == 8 then
				local _ = nil
				local var3689, var3690 = protoModule.readBuffer(p189, var3669)
				var3669 = var3690
				var3668.universe_ids = buffer.tostring(var3689)
			else
				local _ = nil
				local var3691, var3692 = protoModule.readVarInt(p189, var3669)
				var3669 = var3692 + var3691
			end
		elseif var3670 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3693, var3694 = protoModule.readFixed32(p189, var3669)
			local _ = var3693
			var3669 = var3694
		elseif var3670 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3695, var3696 = protoModule.readFixed64(p189, var3669)
			local _ = var3695
			var3669 = var3696
		else
			error("Unsupported wire type: " .. var3670)
		end
	end
	return var3668
end

function t_94:jsonEncode() --[[ line: 20406 ]]
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

function t_94:jsonDecode() --[[ line: 20444 ]]
	-- upvalues: t_94 (ref), t (ref)
	local var3699 = t_94.new()
	
	if self.overview_rich_text ~= nil then
		var3699.overview_rich_text = self.overview_rich_text
	end
	if self.overviewRichText ~= nil then
		var3699.overview_rich_text = self.overviewRichText
	end
	if self.result_entry ~= nil then
		var3699.result_entry = t.FeedEntry.jsonDecode(self.result_entry)
	end
	if self.resultEntry ~= nil then
		var3699.result_entry = t.FeedEntry.jsonDecode(self.resultEntry)
	end
	if self.follow_up_queries ~= nil then
		local t_1 = {}
		
		for i, v in self.follow_up_queries do
			table.insert(t_1, v)
		end
		var3699.follow_up_queries = t_1
	end
	if self.followUpQueries ~= nil then
		local t_1 = {}
		
		for i, v in self.followUpQueries do
			table.insert(t_1, v)
		end
		var3699.follow_up_queries = t_1
	end
	if self.show_loading ~= nil then
		var3699.show_loading = self.show_loading
	end
	if self.showLoading ~= nil then
		var3699.show_loading = self.showLoading
	end
	if self.title ~= nil then
		var3699.title = self.title
	end
	if self.search_query ~= nil then
		var3699.search_query = self.search_query
	end
	if self.searchQuery ~= nil then
		var3699.search_query = self.searchQuery
	end
	if self.universe_ids ~= nil then
		var3699.universe_ids = self.universe_ids
	end
	if self.universeIds ~= nil then
		var3699.universe_ids = self.universeIds
	end
	return var3699
end

t_94.descriptor = {
	name = "PowerSearchAIOverviewInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PowerSearchAIOverviewInputData"
}
t.PowerSearchAIOverviewInputData = t_94
typeRegistryModule.default:register(t.PowerSearchAIOverviewInputData)
local t_95 = {}
t_95.__index = t_95

function t_95.new(p190) --[[ line: 20526 ]]
	-- upvalues: t_95 (ref)
	return setmetatable({
		title = if p190 == nil or p190.title == nil then "" else p190.title,
		user_items = if p190 == nil or p190.user_items == nil then {} else p190.user_items,
		max_visible_rows = if p190 == nil or p190.max_visible_rows == nil then 0 else p190.max_visible_rows
	}, t_95)
end

function t_95:encode() --[[ line: 20534 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3703 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3704, var3705 = protoModule.writeTag(buff, var3703, 1, protoModule.wireTypes.lengthDelimited)
		var3704, var3705 = protoModule.writeString(var3704, var3705, self.title)
		buff = var3704
		var3703 = var3705
	end
	if self.user_items ~= nil and #self.user_items > 0 then
		for i, v in self.user_items do
			local var3706 = v:encode()
			local var3707, var3708 = protoModule.writeTag(buff, var3703, 2, protoModule.wireTypes.lengthDelimited)
			var3707, var3708 = protoModule.writeBuffer(var3707, var3708, var3706, buffer.len(var3706))
			buff = var3707
			var3703 = var3708
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3709, var3710 = protoModule.writeTag(buff, var3703, 3, protoModule.wireTypes.varint)
		var3709, var3710 = protoModule.writeVarInt(var3709, var3710, self.max_visible_rows)
		buff = var3709
		var3703 = var3710
	end
	local buff_1 = buffer.create(var3703)
	buffer.copy(buff_1, 0, buff, 0, var3703)
	
	return buff_1
end

function t_95.decode(p191) --[[ line: 20561 ]]
	-- upvalues: t_95 (ref), protoModule (ref), t (ref)
	local var3712 = t_95.new()
	local var3713 = 0
	while var3713 < buffer.len(p191) do
		local _ = nil
		local var3714 = nil
		local var3715, var3716, var3717 = protoModule.readTag(p191, var3713)
		local var3718 = var3715
		var3714 = var3716
		var3713 = var3717
		
		if var3714 == protoModule.wireTypes.varint then
			if var3718 == 3 then
				local _ = nil
				local var3719, var3720 = protoModule.readVarIntI32(p191, var3713)
				var3713 = var3720
				var3712.max_visible_rows = var3719
			else
				local _ = nil
				local var3721, var3722 = protoModule.readVarInt(p191, var3713)
				local _ = var3721
				var3713 = var3722
			end
		end
		if var3714 == protoModule.wireTypes.lengthDelimited then
			if var3718 == 1 then
				local _ = nil
				local var3723, var3724 = protoModule.readBuffer(p191, var3713)
				var3713 = var3724
				var3712.title = buffer.tostring(var3723)
			elseif var3718 == 2 then
				local _ = nil
				local var3725, var3726 = protoModule.readBuffer(p191, var3713)
				var3713 = var3726
				table.insert(var3712.user_items, t.UserListInputData_UserItem.decode(var3725))
			else
				local _ = nil
				local var3727, var3728 = protoModule.readVarInt(p191, var3713)
				var3713 = var3728 + var3727
			end
		elseif var3714 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3729, var3730 = protoModule.readFixed32(p191, var3713)
			local _ = var3729
			var3713 = var3730
		elseif var3714 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3731, var3732 = protoModule.readFixed64(p191, var3713)
			local _ = var3731
			var3713 = var3732
		else
			error("Unsupported wire type: " .. var3714)
		end
	end
	return var3712
end

function t_95:jsonEncode() --[[ line: 20614 ]]
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
	return t
end

function t_95:jsonDecode() --[[ line: 20636 ]]
	-- upvalues: t_95 (ref), t (ref)
	local var3735 = t_95.new()
	
	if self.title ~= nil then
		var3735.title = self.title
	end
	if self.user_items ~= nil then
		local t_1 = {}
		
		for i, v in self.user_items do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3735.user_items = t_1
	end
	if self.userItems ~= nil then
		local t_1 = {}
		
		for i, v in self.userItems do
			table.insert(t_1, t.UserListInputData_UserItem.jsonDecode(v))
		end
		var3735.user_items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3735.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3735.max_visible_rows = self.maxVisibleRows
	end
	return var3735
end

t_95.descriptor = {
	name = "UserListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserListInputData"
}
t.UserListInputData = t_95
typeRegistryModule.default:register(t.UserListInputData)
local t_96 = {}
t_96.__index = t_96

function t_96.new(p192) --[[ line: 20686 ]]
	-- upvalues: t_96 (ref)
	return setmetatable({
		user_id = if p192 == nil or p192.user_id == nil then "" else p192.user_id
	}, t_96)
end

function t_96:encode() --[[ line: 20694 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3739 = 0
	
	if self.user_id ~= nil and self.user_id ~= "" then
		local var3740, var3741 = protoModule.writeTag(buff, var3739, 1, protoModule.wireTypes.lengthDelimited)
		var3740, var3741 = protoModule.writeString(var3740, var3741, self.user_id)
		buff = var3740
		var3739 = var3741
	end
	local buff_1 = buffer.create(var3739)
	buffer.copy(buff_1, 0, buff, 0, var3739)
	
	return buff_1
end

function t_96.decode(p193) --[[ line: 20708 ]]
	-- upvalues: t_96 (ref), protoModule (ref)
	local var3743 = t_96.new()
	local var3744 = 0
	while var3744 < buffer.len(p193) do
		local _ = nil
		local var3745 = nil
		local var3746, var3747, var3748 = protoModule.readTag(p193, var3744)
		local var3749 = var3746
		var3745 = var3747
		var3744 = var3748
		
		if var3745 == protoModule.wireTypes.varint then
			local _ = nil
			local var3750, var3751 = protoModule.readVarInt(p193, var3744)
			local _ = var3750
			var3744 = var3751
			continue
		end
		if var3745 == protoModule.wireTypes.lengthDelimited then
			if var3749 == 1 then
				local _ = nil
				local var3752, var3753 = protoModule.readBuffer(p193, var3744)
				var3744 = var3753
				var3743.user_id = buffer.tostring(var3752)
			else
				local _ = nil
				local var3754, var3755 = protoModule.readVarInt(p193, var3744)
				var3744 = var3755 + var3754
			end
		elseif var3745 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3756, var3757 = protoModule.readFixed32(p193, var3744)
			local _ = var3756
			var3744 = var3757
		elseif var3745 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3758, var3759 = protoModule.readFixed64(p193, var3744)
			local _ = var3758
			var3744 = var3759
		else
			error("Unsupported wire type: " .. var3745)
		end
	end
	return var3743
end

function t_96:jsonEncode() --[[ line: 20751 ]]
	local t = {}
	
	if self.user_id ~= nil and self.user_id ~= "" then
		t.userId = self.user_id
	end
	return t
end

function t_96:jsonDecode() --[[ line: 20761 ]]
	-- upvalues: t_96 (ref)
	local var3761 = t_96.new()
	
	if self.user_id ~= nil then
		var3761.user_id = self.user_id
	end
	if self.userId ~= nil then
		var3761.user_id = self.userId
	end
	return var3761
end

t_96.descriptor = {
	name = "UserListInputData_UserItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.UserItem"
}
t.UserListInputData_UserItem = t_96
typeRegistryModule.default:register(t.UserListInputData_UserItem)
local t_97 = {}
t_97.__index = t_97

function t_97.new(p194) --[[ line: 20789 ]]
	-- upvalues: t_97 (ref)
	return setmetatable({
		title = if p194 == nil or p194.title == nil then "" else p194.title,
		items = if p194 == nil or p194.items == nil then {} else p194.items,
		max_visible_rows = if p194 == nil or p194.max_visible_rows == nil then 0 else p194.max_visible_rows
	}, t_97)
end

function t_97:encode() --[[ line: 20797 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3763 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3764, var3765 = protoModule.writeTag(buff, var3763, 1, protoModule.wireTypes.lengthDelimited)
		var3764, var3765 = protoModule.writeString(var3764, var3765, self.title)
		buff = var3764
		var3763 = var3765
	end
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var3766 = v:encode()
			local var3767, var3768 = protoModule.writeTag(buff, var3763, 2, protoModule.wireTypes.lengthDelimited)
			var3767, var3768 = protoModule.writeBuffer(var3767, var3768, var3766, buffer.len(var3766))
			buff = var3767
			var3763 = var3768
		end
	end
	if self.max_visible_rows ~= nil and self.max_visible_rows ~= 0 then
		local var3769, var3770 = protoModule.writeTag(buff, var3763, 3, protoModule.wireTypes.varint)
		var3769, var3770 = protoModule.writeVarInt(var3769, var3770, self.max_visible_rows)
		buff = var3769
		var3763 = var3770
	end
	local buff_1 = buffer.create(var3763)
	buffer.copy(buff_1, 0, buff, 0, var3763)
	
	return buff_1
end

function t_97.decode(p195) --[[ line: 20824 ]]
	-- upvalues: t_97 (ref), protoModule (ref), t (ref)
	local var3772 = t_97.new()
	local var3773 = 0
	while var3773 < buffer.len(p195) do
		local _ = nil
		local var3774 = nil
		local var3775, var3776, var3777 = protoModule.readTag(p195, var3773)
		local var3778 = var3775
		var3774 = var3776
		var3773 = var3777
		
		if var3774 == protoModule.wireTypes.varint then
			if var3778 == 3 then
				local _ = nil
				local var3779, var3780 = protoModule.readVarIntI32(p195, var3773)
				var3773 = var3780
				var3772.max_visible_rows = var3779
			else
				local _ = nil
				local var3781, var3782 = protoModule.readVarInt(p195, var3773)
				local _ = var3781
				var3773 = var3782
			end
		end
		if var3774 == protoModule.wireTypes.lengthDelimited then
			if var3778 == 1 then
				local _ = nil
				local var3783, var3784 = protoModule.readBuffer(p195, var3773)
				var3773 = var3784
				var3772.title = buffer.tostring(var3783)
			elseif var3778 == 2 then
				local _ = nil
				local var3785, var3786 = protoModule.readBuffer(p195, var3773)
				var3773 = var3786
				table.insert(var3772.items, t.CatalogItemListInputData_CatalogItem.decode(var3785))
			else
				local _ = nil
				local var3787, var3788 = protoModule.readVarInt(p195, var3773)
				var3773 = var3788 + var3787
			end
		elseif var3774 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3789, var3790 = protoModule.readFixed32(p195, var3773)
			local _ = var3789
			var3773 = var3790
		elseif var3774 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3791, var3792 = protoModule.readFixed64(p195, var3773)
			local _ = var3791
			var3773 = var3792
		else
			error("Unsupported wire type: " .. var3774)
		end
	end
	return var3772
end

function t_97:jsonEncode() --[[ line: 20877 ]]
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
	return t
end

function t_97:jsonDecode() --[[ line: 20899 ]]
	-- upvalues: t_97 (ref), t (ref)
	local var3795 = t_97.new()
	
	if self.title ~= nil then
		var3795.title = self.title
	end
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.CatalogItemListInputData_CatalogItem.jsonDecode(v))
		end
		var3795.items = t_1
	end
	if self.max_visible_rows ~= nil then
		var3795.max_visible_rows = self.max_visible_rows
	end
	if self.maxVisibleRows ~= nil then
		var3795.max_visible_rows = self.maxVisibleRows
	end
	return var3795
end

t_97.descriptor = {
	name = "CatalogItemListInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItemListInputData"
}
t.CatalogItemListInputData = t_97
typeRegistryModule.default:register(t.CatalogItemListInputData)
local t_98 = {}
t_98.__index = t_98

function t_98.new(p196) --[[ line: 20940 ]]
	-- upvalues: t_98 (ref)
	return setmetatable({
		item_id = if p196 == nil or p196.item_id == nil then "" else p196.item_id,
		item_type = if p196 == nil or p196.item_type == nil then "" else p196.item_type
	}, t_98)
end

function t_98:encode() --[[ line: 20949 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3798 = 0
	
	if self.item_id ~= nil and self.item_id ~= "" then
		local var3799, var3800 = protoModule.writeTag(buff, var3798, 1, protoModule.wireTypes.lengthDelimited)
		var3799, var3800 = protoModule.writeString(var3799, var3800, self.item_id)
		buff = var3799
		var3798 = var3800
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		local var3801, var3802 = protoModule.writeTag(buff, var3798, 2, protoModule.wireTypes.lengthDelimited)
		var3801, var3802 = protoModule.writeString(var3801, var3802, self.item_type)
		buff = var3801
		var3798 = var3802
	end
	local buff_1 = buffer.create(var3798)
	buffer.copy(buff_1, 0, buff, 0, var3798)
	
	return buff_1
end

function t_98.decode(p197) --[[ line: 20968 ]]
	-- upvalues: t_98 (ref), protoModule (ref)
	local var3804 = t_98.new()
	local var3805 = 0
	while var3805 < buffer.len(p197) do
		local _ = nil
		local var3806 = nil
		local var3807, var3808, var3809 = protoModule.readTag(p197, var3805)
		local var3810 = var3807
		var3806 = var3808
		var3805 = var3809
		
		if var3806 == protoModule.wireTypes.varint then
			local _ = nil
			local var3811, var3812 = protoModule.readVarInt(p197, var3805)
			local _ = var3811
			var3805 = var3812
			continue
		end
		if var3806 == protoModule.wireTypes.lengthDelimited then
			if var3810 == 1 then
				local _ = nil
				local var3813, var3814 = protoModule.readBuffer(p197, var3805)
				var3805 = var3814
				var3804.item_id = buffer.tostring(var3813)
			elseif var3810 == 2 then
				local _ = nil
				local var3815, var3816 = protoModule.readBuffer(p197, var3805)
				var3805 = var3816
				var3804.item_type = buffer.tostring(var3815)
			else
				local _ = nil
				local var3817, var3818 = protoModule.readVarInt(p197, var3805)
				var3805 = var3818 + var3817
			end
		elseif var3806 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3819, var3820 = protoModule.readFixed32(p197, var3805)
			local _ = var3819
			var3805 = var3820
		elseif var3806 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3821, var3822 = protoModule.readFixed64(p197, var3805)
			local _ = var3821
			var3805 = var3822
		else
			error("Unsupported wire type: " .. var3806)
		end
	end
	return var3804
end

function t_98:jsonEncode() --[[ line: 21016 ]]
	local t = {}
	
	if self.item_id ~= nil and self.item_id ~= "" then
		t.itemId = self.item_id
	end
	if self.item_type ~= nil and self.item_type ~= "" then
		t.itemType = self.item_type
	end
	return t
end

function t_98:jsonDecode() --[[ line: 21030 ]]
	-- upvalues: t_98 (ref)
	local var3824 = t_98.new()
	
	if self.item_id ~= nil then
		var3824.item_id = self.item_id
	end
	if self.itemId ~= nil then
		var3824.item_id = self.itemId
	end
	if self.item_type ~= nil then
		var3824.item_type = self.item_type
	end
	if self.itemType ~= nil then
		var3824.item_type = self.itemType
	end
	return var3824
end

t_98.descriptor = {
	name = "CatalogItemListInputData_CatalogItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.CatalogItem"
}
t.CatalogItemListInputData_CatalogItem = t_98
typeRegistryModule.default:register(t.CatalogItemListInputData_CatalogItem)
local t_99 = {}
t_99.__index = t_99

function t_99.new(p198) --[[ line: 21068 ]]
	-- upvalues: t_99 (ref)
	return setmetatable({
		universe_id = if p198 == nil or p198.universe_id == nil then "" else p198.universe_id
	}, t_99)
end

function t_99:encode() --[[ line: 21076 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3826 = 0
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		local var3827, var3828 = protoModule.writeTag(buff, var3826, 1, protoModule.wireTypes.lengthDelimited)
		var3827, var3828 = protoModule.writeString(var3827, var3828, self.universe_id)
		buff = var3827
		var3826 = var3828
	end
	local buff_1 = buffer.create(var3826)
	buffer.copy(buff_1, 0, buff, 0, var3826)
	
	return buff_1
end

function t_99.decode(p199) --[[ line: 21090 ]]
	-- upvalues: t_99 (ref), protoModule (ref)
	local var3830 = t_99.new()
	local var3831 = 0
	while var3831 < buffer.len(p199) do
		local _ = nil
		local var3832 = nil
		local var3833, var3834, var3835 = protoModule.readTag(p199, var3831)
		local var3836 = var3833
		var3832 = var3834
		var3831 = var3835
		
		if var3832 == protoModule.wireTypes.varint then
			local _ = nil
			local var3837, var3838 = protoModule.readVarInt(p199, var3831)
			local _ = var3837
			var3831 = var3838
			continue
		end
		if var3832 == protoModule.wireTypes.lengthDelimited then
			if var3836 == 1 then
				local _ = nil
				local var3839, var3840 = protoModule.readBuffer(p199, var3831)
				var3831 = var3840
				var3830.universe_id = buffer.tostring(var3839)
			else
				local _ = nil
				local var3841, var3842 = protoModule.readVarInt(p199, var3831)
				var3831 = var3842 + var3841
			end
		elseif var3832 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3843, var3844 = protoModule.readFixed32(p199, var3831)
			local _ = var3843
			var3831 = var3844
		elseif var3832 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3845, var3846 = protoModule.readFixed64(p199, var3831)
			local _ = var3845
			var3831 = var3846
		else
			error("Unsupported wire type: " .. var3832)
		end
	end
	return var3830
end

function t_99:jsonEncode() --[[ line: 21133 ]]
	local t = {}
	
	if self.universe_id ~= nil and self.universe_id ~= "" then
		t.universeId = self.universe_id
	end
	return t
end

function t_99:jsonDecode() --[[ line: 21143 ]]
	-- upvalues: t_99 (ref)
	local var3848 = t_99.new()
	
	if self.universe_id ~= nil then
		var3848.universe_id = self.universe_id
	end
	if self.universeId ~= nil then
		var3848.universe_id = self.universeId
	end
	return var3848
end

t_99.descriptor = {
	name = "ExperienceGuidelinesDialogInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ExperienceGuidelinesDialogInputData"
}
t.ExperienceGuidelinesDialogInputData = t_99
typeRegistryModule.default:register(t.ExperienceGuidelinesDialogInputData)
local t_100 = {}
t_100.__index = t_100

function t_100.new(p200) --[[ line: 21173 ]]
	-- upvalues: t_100 (ref)
	return setmetatable({
		title = if p200 == nil or p200.title == nil then "" else p200.title,
		subtitle = if p200 == nil or p200.subtitle == nil then "" else p200.subtitle,
		moment_items = if p200 == nil or p200.moment_items == nil then {} else p200.moment_items
	}, t_100)
end

function t_100:encode() --[[ line: 21181 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3850 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3851, var3852 = protoModule.writeTag(buff, var3850, 1, protoModule.wireTypes.lengthDelimited)
		var3851, var3852 = protoModule.writeString(var3851, var3852, self.title)
		buff = var3851
		var3850 = var3852
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3853, var3854 = protoModule.writeTag(buff, var3850, 2, protoModule.wireTypes.lengthDelimited)
		var3853, var3854 = protoModule.writeString(var3853, var3854, self.subtitle)
		buff = var3853
		var3850 = var3854
	end
	if self.moment_items ~= nil and #self.moment_items > 0 then
		for i, v in self.moment_items do
			local var3855 = v:encode()
			local var3856, var3857 = protoModule.writeTag(buff, var3850, 3, protoModule.wireTypes.lengthDelimited)
			var3856, var3857 = protoModule.writeBuffer(var3856, var3857, var3855, buffer.len(var3855))
			buff = var3856
			var3850 = var3857
		end
	end
	local buff_1 = buffer.create(var3850)
	buffer.copy(buff_1, 0, buff, 0, var3850)
	
	return buff_1
end

function t_100.decode(p201) --[[ line: 21208 ]]
	-- upvalues: t_100 (ref), protoModule (ref), t (ref)
	local var3859 = t_100.new()
	local var3860 = 0
	while var3860 < buffer.len(p201) do
		local _ = nil
		local var3861 = nil
		local var3862, var3863, var3864 = protoModule.readTag(p201, var3860)
		local var3865 = var3862
		var3861 = var3863
		var3860 = var3864
		
		if var3861 == protoModule.wireTypes.varint then
			local _ = nil
			local var3866, var3867 = protoModule.readVarInt(p201, var3860)
			local _ = var3866
			var3860 = var3867
			continue
		end
		if var3861 == protoModule.wireTypes.lengthDelimited then
			if var3865 == 1 then
				local _ = nil
				local var3868, var3869 = protoModule.readBuffer(p201, var3860)
				var3860 = var3869
				var3859.title = buffer.tostring(var3868)
			elseif var3865 == 2 then
				local _ = nil
				local var3870, var3871 = protoModule.readBuffer(p201, var3860)
				var3860 = var3871
				var3859.subtitle = buffer.tostring(var3870)
			elseif var3865 == 3 then
				local _ = nil
				local var3872, var3873 = protoModule.readBuffer(p201, var3860)
				var3860 = var3873
				table.insert(var3859.moment_items, t.MomentsCarouselInputData_MomentItem.decode(var3872))
			else
				local _ = nil
				local var3874, var3875 = protoModule.readVarInt(p201, var3860)
				var3860 = var3875 + var3874
			end
		elseif var3861 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3876, var3877 = protoModule.readFixed32(p201, var3860)
			local _ = var3876
			var3860 = var3877
		elseif var3861 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3878, var3879 = protoModule.readFixed64(p201, var3860)
			local _ = var3878
			var3860 = var3879
		else
			error("Unsupported wire type: " .. var3861)
		end
	end
	return var3859
end

function t_100:jsonEncode() --[[ line: 21261 ]]
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

function t_100:jsonDecode() --[[ line: 21283 ]]
	-- upvalues: t_100 (ref), t (ref)
	local var3882 = t_100.new()
	
	if self.title ~= nil then
		var3882.title = self.title
	end
	if self.subtitle ~= nil then
		var3882.subtitle = self.subtitle
	end
	if self.moment_items ~= nil then
		local t_1 = {}
		
		for i, v in self.moment_items do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3882.moment_items = t_1
	end
	if self.momentItems ~= nil then
		local t_1 = {}
		
		for i, v in self.momentItems do
			table.insert(t_1, t.MomentsCarouselInputData_MomentItem.jsonDecode(v))
		end
		var3882.moment_items = t_1
	end
	return var3882
end

t_100.descriptor = {
	name = "MomentsCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentsCarouselInputData"
}
t.MomentsCarouselInputData = t_100
typeRegistryModule.default:register(t.MomentsCarouselInputData)
local t_101 = {}
t_101.__index = t_101

function t_101.new(p202) --[[ line: 21329 ]]
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

function t_101:encode() --[[ line: 21344 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3886 = 0
	
	if self.moment_id ~= nil and self.moment_id ~= "" then
		local var3887, var3888 = protoModule.writeTag(buff, var3886, 1, protoModule.wireTypes.lengthDelimited)
		var3887, var3888 = protoModule.writeString(var3887, var3888, self.moment_id)
		buff = var3887
		var3886 = var3888
	end
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var3889, var3890 = protoModule.writeTag(buff, var3886, 2, protoModule.wireTypes.lengthDelimited)
		var3889, var3890 = protoModule.writeString(var3889, var3890, self.video_asset_id)
		buff = var3889
		var3886 = var3890
	end
	if self.target_universe_id ~= nil and self.target_universe_id ~= "" then
		local var3891, var3892 = protoModule.writeTag(buff, var3886, 3, protoModule.wireTypes.lengthDelimited)
		var3891, var3892 = protoModule.writeString(var3891, var3892, self.target_universe_id)
		buff = var3891
		var3886 = var3892
	end
	if self.target_place_id ~= nil and self.target_place_id ~= "" then
		local var3893, var3894 = protoModule.writeTag(buff, var3886, 4, protoModule.wireTypes.lengthDelimited)
		var3893, var3894 = protoModule.writeString(var3893, var3894, self.target_place_id)
		buff = var3893
		var3886 = var3894
	end
	if self.feed_item_id ~= nil and self.feed_item_id ~= "" then
		local var3895, var3896 = protoModule.writeTag(buff, var3886, 5, protoModule.wireTypes.lengthDelimited)
		var3895, var3896 = protoModule.writeString(var3895, var3896, self.feed_item_id)
		buff = var3895
		var3886 = var3896
	end
	if self.capture_universe_id ~= nil and self.capture_universe_id ~= "" then
		local var3897, var3898 = protoModule.writeTag(buff, var3886, 6, protoModule.wireTypes.lengthDelimited)
		var3897, var3898 = protoModule.writeString(var3897, var3898, self.capture_universe_id)
		buff = var3897
		var3886 = var3898
	end
	local buff_1 = buffer.create(var3886)
	buffer.copy(buff_1, 0, buff, 0, var3886)
	
	return buff_1
end

function t_101.decode(p203) --[[ line: 21383 ]]
	-- upvalues: t_101 (ref), protoModule (ref)
	local var3900 = t_101.new()
	local var3901 = 0
	while var3901 < buffer.len(p203) do
		local _ = nil
		local var3902 = nil
		local var3903, var3904, var3905 = protoModule.readTag(p203, var3901)
		local var3906 = var3903
		var3902 = var3904
		var3901 = var3905
		
		if var3902 == protoModule.wireTypes.varint then
			local _ = nil
			local var3907, var3908 = protoModule.readVarInt(p203, var3901)
			local _ = var3907
			var3901 = var3908
			continue
		end
		if var3902 == protoModule.wireTypes.lengthDelimited then
			if var3906 == 1 then
				local _ = nil
				local var3909, var3910 = protoModule.readBuffer(p203, var3901)
				var3901 = var3910
				var3900.moment_id = buffer.tostring(var3909)
			elseif var3906 == 2 then
				local _ = nil
				local var3911, var3912 = protoModule.readBuffer(p203, var3901)
				var3901 = var3912
				var3900.video_asset_id = buffer.tostring(var3911)
			elseif var3906 == 3 then
				local _ = nil
				local var3913, var3914 = protoModule.readBuffer(p203, var3901)
				var3901 = var3914
				var3900.target_universe_id = buffer.tostring(var3913)
			elseif var3906 == 4 then
				local _ = nil
				local var3915, var3916 = protoModule.readBuffer(p203, var3901)
				var3901 = var3916
				var3900.target_place_id = buffer.tostring(var3915)
			elseif var3906 == 5 then
				local _ = nil
				local var3917, var3918 = protoModule.readBuffer(p203, var3901)
				var3901 = var3918
				var3900.feed_item_id = buffer.tostring(var3917)
			elseif var3906 == 6 then
				local _ = nil
				local var3919, var3920 = protoModule.readBuffer(p203, var3901)
				var3901 = var3920
				var3900.capture_universe_id = buffer.tostring(var3919)
			else
				local _ = nil
				local var3921, var3922 = protoModule.readVarInt(p203, var3901)
				var3901 = var3922 + var3921
			end
		elseif var3902 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3923, var3924 = protoModule.readFixed32(p203, var3901)
			local _ = var3923
			var3901 = var3924
		elseif var3902 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3925, var3926 = protoModule.readFixed64(p203, var3901)
			local _ = var3925
			var3901 = var3926
		else
			error("Unsupported wire type: " .. var3902)
		end
	end
	return var3900
end

function t_101:jsonEncode() --[[ line: 21451 ]]
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

function t_101:jsonDecode() --[[ line: 21481 ]]
	-- upvalues: t_101 (ref)
	local var3928 = t_101.new()
	
	if self.moment_id ~= nil then
		var3928.moment_id = self.moment_id
	end
	if self.momentId ~= nil then
		var3928.moment_id = self.momentId
	end
	if self.video_asset_id ~= nil then
		var3928.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var3928.video_asset_id = self.videoAssetId
	end
	if self.target_universe_id ~= nil then
		var3928.target_universe_id = self.target_universe_id
	end
	if self.targetUniverseId ~= nil then
		var3928.target_universe_id = self.targetUniverseId
	end
	if self.target_place_id ~= nil then
		var3928.target_place_id = self.target_place_id
	end
	if self.targetPlaceId ~= nil then
		var3928.target_place_id = self.targetPlaceId
	end
	if self.feed_item_id ~= nil then
		var3928.feed_item_id = self.feed_item_id
	end
	if self.feedItemId ~= nil then
		var3928.feed_item_id = self.feedItemId
	end
	if self.capture_universe_id ~= nil then
		var3928.capture_universe_id = self.capture_universe_id
	end
	if self.captureUniverseId ~= nil then
		var3928.capture_universe_id = self.captureUniverseId
	end
	return var3928
end

t_101.descriptor = {
	name = "MomentsCarouselInputData_MomentItem",
	fullName = "roblox.apppageplatform.shared.v1beta1.MomentItem"
}
t.MomentsCarouselInputData_MomentItem = t_101
typeRegistryModule.default:register(t.MomentsCarouselInputData_MomentItem)
local t_102 = {}
t_102.__index = t_102

function t_102.new(p204) --[[ line: 21551 ]]
	-- upvalues: t_102 (ref)
	return setmetatable({
		title = if p204 == nil or p204.title == nil then "" else p204.title,
		subtitle = if p204 == nil or p204.subtitle == nil then "" else p204.subtitle
	}, t_102)
end

function t_102:encode() --[[ line: 21558 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3930 = 0
	
	if self.title ~= nil and self.title ~= "" then
		local var3931, var3932 = protoModule.writeTag(buff, var3930, 1, protoModule.wireTypes.lengthDelimited)
		var3931, var3932 = protoModule.writeString(var3931, var3932, self.title)
		buff = var3931
		var3930 = var3932
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		local var3933, var3934 = protoModule.writeTag(buff, var3930, 2, protoModule.wireTypes.lengthDelimited)
		var3933, var3934 = protoModule.writeString(var3933, var3934, self.subtitle)
		buff = var3933
		var3930 = var3934
	end
	local buff_1 = buffer.create(var3930)
	buffer.copy(buff_1, 0, buff, 0, var3930)
	
	return buff_1
end

function t_102.decode(p205) --[[ line: 21577 ]]
	-- upvalues: t_102 (ref), protoModule (ref)
	local var3936 = t_102.new()
	local var3937 = 0
	while var3937 < buffer.len(p205) do
		local _ = nil
		local var3938 = nil
		local var3939, var3940, var3941 = protoModule.readTag(p205, var3937)
		local var3942 = var3939
		var3938 = var3940
		var3937 = var3941
		
		if var3938 == protoModule.wireTypes.varint then
			local _ = nil
			local var3943, var3944 = protoModule.readVarInt(p205, var3937)
			local _ = var3943
			var3937 = var3944
			continue
		end
		if var3938 == protoModule.wireTypes.lengthDelimited then
			if var3942 == 1 then
				local _ = nil
				local var3945, var3946 = protoModule.readBuffer(p205, var3937)
				var3937 = var3946
				var3936.title = buffer.tostring(var3945)
			elseif var3942 == 2 then
				local _ = nil
				local var3947, var3948 = protoModule.readBuffer(p205, var3937)
				var3937 = var3948
				var3936.subtitle = buffer.tostring(var3947)
			else
				local _ = nil
				local var3949, var3950 = protoModule.readVarInt(p205, var3937)
				var3937 = var3950 + var3949
			end
		elseif var3938 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3951, var3952 = protoModule.readFixed32(p205, var3937)
			local _ = var3951
			var3937 = var3952
		elseif var3938 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3953, var3954 = protoModule.readFixed64(p205, var3937)
			local _ = var3953
			var3937 = var3954
		else
			error("Unsupported wire type: " .. var3938)
		end
	end
	return var3936
end

function t_102:jsonEncode() --[[ line: 21625 ]]
	local t = {}
	
	if self.title ~= nil and self.title ~= "" then
		t.title = self.title
	end
	if self.subtitle ~= nil and self.subtitle ~= "" then
		t.subtitle = self.subtitle
	end
	return t
end

function t_102:jsonDecode() --[[ line: 21639 ]]
	-- upvalues: t_102 (ref)
	local var3956 = t_102.new()
	
	if self.title ~= nil then
		var3956.title = self.title
	end
	if self.subtitle ~= nil then
		var3956.subtitle = self.subtitle
	end
	return var3956
end

t_102.descriptor = {
	name = "AttributionRowInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.AttributionRowInputData"
}
t.AttributionRowInputData = t_102
typeRegistryModule.default:register(t.AttributionRowInputData)
local t_103 = {}
t_103.__index = t_103

function t_103.new(p206) --[[ line: 21667 ]]
	-- upvalues: t_103 (ref)
	return setmetatable({
		primary_cta_button_text = if p206 == nil or p206.primary_cta_button_text == nil then "" else p206.primary_cta_button_text,
		secondary_cta_button_text = if p206 == nil or p206.secondary_cta_button_text == nil then "" else p206.secondary_cta_button_text
	}, t_103)
end

function t_103:encode() --[[ line: 21678 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3958 = 0
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		local var3959, var3960 = protoModule.writeTag(buff, var3958, 1, protoModule.wireTypes.lengthDelimited)
		var3959, var3960 = protoModule.writeString(var3959, var3960, self.primary_cta_button_text)
		buff = var3959
		var3958 = var3960
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		local var3961, var3962 = protoModule.writeTag(buff, var3958, 2, protoModule.wireTypes.lengthDelimited)
		var3961, var3962 = protoModule.writeString(var3961, var3962, self.secondary_cta_button_text)
		buff = var3961
		var3958 = var3962
	end
	local buff_1 = buffer.create(var3958)
	buffer.copy(buff_1, 0, buff, 0, var3958)
	
	return buff_1
end

function t_103.decode(p207) --[[ line: 21697 ]]
	-- upvalues: t_103 (ref), protoModule (ref)
	local var3964 = t_103.new()
	local var3965 = 0
	while var3965 < buffer.len(p207) do
		local _ = nil
		local var3966 = nil
		local var3967, var3968, var3969 = protoModule.readTag(p207, var3965)
		local var3970 = var3967
		var3966 = var3968
		var3965 = var3969
		
		if var3966 == protoModule.wireTypes.varint then
			local _ = nil
			local var3971, var3972 = protoModule.readVarInt(p207, var3965)
			local _ = var3971
			var3965 = var3972
			continue
		end
		if var3966 == protoModule.wireTypes.lengthDelimited then
			if var3970 == 1 then
				local _ = nil
				local var3973, var3974 = protoModule.readBuffer(p207, var3965)
				var3965 = var3974
				var3964.primary_cta_button_text = buffer.tostring(var3973)
			elseif var3970 == 2 then
				local _ = nil
				local var3975, var3976 = protoModule.readBuffer(p207, var3965)
				var3965 = var3976
				var3964.secondary_cta_button_text = buffer.tostring(var3975)
			else
				local _ = nil
				local var3977, var3978 = protoModule.readVarInt(p207, var3965)
				var3965 = var3978 + var3977
			end
		elseif var3966 == protoModule.wireTypes.i32 then
			local _ = nil
			local var3979, var3980 = protoModule.readFixed32(p207, var3965)
			local _ = var3979
			var3965 = var3980
		elseif var3966 == protoModule.wireTypes.i64 then
			local _ = nil
			local var3981, var3982 = protoModule.readFixed64(p207, var3965)
			local _ = var3981
			var3965 = var3982
		else
			error("Unsupported wire type: " .. var3966)
		end
	end
	return var3964
end

function t_103:jsonEncode() --[[ line: 21745 ]]
	local t = {}
	
	if self.primary_cta_button_text ~= nil and self.primary_cta_button_text ~= "" then
		t.primaryCtaButtonText = self.primary_cta_button_text
	end
	if self.secondary_cta_button_text ~= nil and self.secondary_cta_button_text ~= "" then
		t.secondaryCtaButtonText = self.secondary_cta_button_text
	end
	return t
end

function t_103:jsonDecode() --[[ line: 21759 ]]
	-- upvalues: t_103 (ref)
	local var3984 = t_103.new()
	
	if self.primary_cta_button_text ~= nil then
		var3984.primary_cta_button_text = self.primary_cta_button_text
	end
	if self.primaryCtaButtonText ~= nil then
		var3984.primary_cta_button_text = self.primaryCtaButtonText
	end
	if self.secondary_cta_button_text ~= nil then
		var3984.secondary_cta_button_text = self.secondary_cta_button_text
	end
	if self.secondaryCtaButtonText ~= nil then
		var3984.secondary_cta_button_text = self.secondaryCtaButtonText
	end
	return var3984
end

t_103.descriptor = {
	name = "CtaButtonsInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.CtaButtonsInputData"
}
t.CtaButtonsInputData = t_103
typeRegistryModule.default:register(t.CtaButtonsInputData)
local t_104 = {}
t_104.__index = t_104

function t_104.new(p208) --[[ line: 21795 ]]
	-- upvalues: t_104 (ref)
	return setmetatable({
		image_asset_id = if p208 == nil or p208.image_asset_id == nil then "" else p208.image_asset_id
	}, t_104)
end

function t_104:encode() --[[ line: 21801 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var3986 = 0
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		local var3987, var3988 = protoModule.writeTag(buff, var3986, 1, protoModule.wireTypes.lengthDelimited)
		var3987, var3988 = protoModule.writeString(var3987, var3988, self.image_asset_id)
		buff = var3987
		var3986 = var3988
	end
	local buff_1 = buffer.create(var3986)
	buffer.copy(buff_1, 0, buff, 0, var3986)
	
	return buff_1
end

function t_104.decode(p209) --[[ line: 21815 ]]
	-- upvalues: t_104 (ref), protoModule (ref)
	local var3990 = t_104.new()
	local var3991 = 0
	while var3991 < buffer.len(p209) do
		local _ = nil
		local var3992 = nil
		local var3993, var3994, var3995 = protoModule.readTag(p209, var3991)
		local var3996 = var3993
		var3992 = var3994
		var3991 = var3995
		
		if var3992 == protoModule.wireTypes.varint then
			local _ = nil
			local var3997, var3998 = protoModule.readVarInt(p209, var3991)
			local _ = var3997
			var3991 = var3998
			continue
		end
		if var3992 == protoModule.wireTypes.lengthDelimited then
			if var3996 == 1 then
				local _ = nil
				local var3999, var4000 = protoModule.readBuffer(p209, var3991)
				var3991 = var4000
				var3990.image_asset_id = buffer.tostring(var3999)
			else
				local _ = nil
				local var4001, var4002 = protoModule.readVarInt(p209, var3991)
				var3991 = var4002 + var4001
			end
		elseif var3992 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4003, var4004 = protoModule.readFixed32(p209, var3991)
			local _ = var4003
			var3991 = var4004
		elseif var3992 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4005, var4006 = protoModule.readFixed64(p209, var3991)
			local _ = var4005
			var3991 = var4006
		else
			error("Unsupported wire type: " .. var3992)
		end
	end
	return var3990
end

function t_104:jsonEncode() --[[ line: 21858 ]]
	local t = {}
	
	if self.image_asset_id ~= nil and self.image_asset_id ~= "" then
		t.imageAssetId = self.image_asset_id
	end
	return t
end

function t_104:jsonDecode() --[[ line: 21868 ]]
	-- upvalues: t_104 (ref)
	local var4008 = t_104.new()
	
	if self.image_asset_id ~= nil then
		var4008.image_asset_id = self.image_asset_id
	end
	if self.imageAssetId ~= nil then
		var4008.image_asset_id = self.imageAssetId
	end
	return var4008
end

t_104.descriptor = {
	name = "ImageInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.ImageInputData"
}
t.ImageInputData = t_104
typeRegistryModule.default:register(t.ImageInputData)
local t_105 = {}
t_105.__index = t_105

function t_105.new(p210) --[[ line: 21896 ]]
	-- upvalues: t_105 (ref)
	return setmetatable({
		video_asset_id = if p210 == nil or p210.video_asset_id == nil then "" else p210.video_asset_id
	}, t_105)
end

function t_105:encode() --[[ line: 21902 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4010 = 0
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		local var4011, var4012 = protoModule.writeTag(buff, var4010, 1, protoModule.wireTypes.lengthDelimited)
		var4011, var4012 = protoModule.writeString(var4011, var4012, self.video_asset_id)
		buff = var4011
		var4010 = var4012
	end
	local buff_1 = buffer.create(var4010)
	buffer.copy(buff_1, 0, buff, 0, var4010)
	
	return buff_1
end

function t_105.decode(p211) --[[ line: 21916 ]]
	-- upvalues: t_105 (ref), protoModule (ref)
	local var4014 = t_105.new()
	local var4015 = 0
	while var4015 < buffer.len(p211) do
		local _ = nil
		local var4016 = nil
		local var4017, var4018, var4019 = protoModule.readTag(p211, var4015)
		local var4020 = var4017
		var4016 = var4018
		var4015 = var4019
		
		if var4016 == protoModule.wireTypes.varint then
			local _ = nil
			local var4021, var4022 = protoModule.readVarInt(p211, var4015)
			local _ = var4021
			var4015 = var4022
			continue
		end
		if var4016 == protoModule.wireTypes.lengthDelimited then
			if var4020 == 1 then
				local _ = nil
				local var4023, var4024 = protoModule.readBuffer(p211, var4015)
				var4015 = var4024
				var4014.video_asset_id = buffer.tostring(var4023)
			else
				local _ = nil
				local var4025, var4026 = protoModule.readVarInt(p211, var4015)
				var4015 = var4026 + var4025
			end
		elseif var4016 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4027, var4028 = protoModule.readFixed32(p211, var4015)
			local _ = var4027
			var4015 = var4028
		elseif var4016 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4029, var4030 = protoModule.readFixed64(p211, var4015)
			local _ = var4029
			var4015 = var4030
		else
			error("Unsupported wire type: " .. var4016)
		end
	end
	return var4014
end

function t_105:jsonEncode() --[[ line: 21959 ]]
	local t = {}
	
	if self.video_asset_id ~= nil and self.video_asset_id ~= "" then
		t.videoAssetId = self.video_asset_id
	end
	return t
end

function t_105:jsonDecode() --[[ line: 21969 ]]
	-- upvalues: t_105 (ref)
	local var4032 = t_105.new()
	
	if self.video_asset_id ~= nil then
		var4032.video_asset_id = self.video_asset_id
	end
	if self.videoAssetId ~= nil then
		var4032.video_asset_id = self.videoAssetId
	end
	return var4032
end

t_105.descriptor = {
	name = "VideoInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VideoInputData"
}
t.VideoInputData = t_105
typeRegistryModule.default:register(t.VideoInputData)
local t_106 = {}
t_106.__index = t_106

function t_106.new(p212) --[[ line: 21997 ]]
	-- upvalues: t_106 (ref)
	return setmetatable({
		text = if p212 == nil or p212.text == nil then "" else p212.text,
		is_rendered_text = if p212 == nil or p212.is_rendered_text == nil then false else p212.is_rendered_text
	}, t_106)
end

function t_106:encode() --[[ line: 22004 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4034 = 0
	
	if self.text ~= nil and self.text ~= "" then
		local var4035, var4036 = protoModule.writeTag(buff, var4034, 1, protoModule.wireTypes.lengthDelimited)
		var4035, var4036 = protoModule.writeString(var4035, var4036, self.text)
		buff = var4035
		var4034 = var4036
	end
	if self.is_rendered_text then
		local var4037, var4038 = protoModule.writeTag(buff, var4034, 2, protoModule.wireTypes.varint)
		var4037, var4038 = protoModule.writeVarInt(var4037, var4038, if self.is_rendered_text then 1 else 0)
		buff = var4037
		var4034 = var4038
	end
	local buff_1 = buffer.create(var4034)
	buffer.copy(buff_1, 0, buff, 0, var4034)
	
	return buff_1
end

function t_106.decode(p213) --[[ line: 22023 ]]
	-- upvalues: t_106 (ref), protoModule (ref)
	local var4040 = t_106.new()
	local var4041 = 0
	while var4041 < buffer.len(p213) do
		local _ = nil
		local var4042 = nil
		local var4043, var4044, var4045 = protoModule.readTag(p213, var4041)
		local var4046 = var4043
		var4042 = var4044
		var4041 = var4045
		
		if var4042 == protoModule.wireTypes.varint then
			if var4046 == 2 then
				local _ = nil
				local var4047, var4048 = protoModule.readVarInt(p213, var4041)
				var4041 = var4048
				var4040.is_rendered_text = var4047 ~= 0
			else
				local _ = nil
				local var4049, var4050 = protoModule.readVarInt(p213, var4041)
				local _ = var4049
				var4041 = var4050
			end
		end
		if var4042 == protoModule.wireTypes.lengthDelimited then
			if var4046 == 1 then
				local _ = nil
				local var4051, var4052 = protoModule.readBuffer(p213, var4041)
				var4041 = var4052
				var4040.text = buffer.tostring(var4051)
			else
				local _ = nil
				local var4053, var4054 = protoModule.readVarInt(p213, var4041)
				var4041 = var4054 + var4053
			end
		elseif var4042 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4055, var4056 = protoModule.readFixed32(p213, var4041)
			local _ = var4055
			var4041 = var4056
		elseif var4042 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4057, var4058 = protoModule.readFixed64(p213, var4041)
			local _ = var4057
			var4041 = var4058
		else
			error("Unsupported wire type: " .. var4042)
		end
	end
	return var4040
end

function t_106:jsonEncode() --[[ line: 22071 ]]
	local t = {}
	
	if self.text ~= nil and self.text ~= "" then
		t.text = self.text
	end
	if self.is_rendered_text then
		t.isRenderedText = self.is_rendered_text
	end
	return t
end

function t_106:jsonDecode() --[[ line: 22085 ]]
	-- upvalues: t_106 (ref)
	local var4060 = t_106.new()
	
	if self.text ~= nil then
		var4060.text = self.text
	end
	if self.is_rendered_text ~= nil then
		var4060.is_rendered_text = self.is_rendered_text
	end
	if self.isRenderedText ~= nil then
		var4060.is_rendered_text = self.isRenderedText
	end
	return var4060
end

t_106.descriptor = {
	name = "TextInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.TextInputData"
}
t.TextInputData = t_106
typeRegistryModule.default:register(t.TextInputData)
local t_107 = {}
t_107.__index = t_107

function t_107.new(p214) --[[ line: 22117 ]]
	-- upvalues: t_107 (ref)
	return setmetatable({
		entry_map = if p214 == nil or p214.entry_map == nil then {} else p214.entry_map,
		entry_order = if p214 == nil or p214.entry_order == nil then {} else p214.entry_order,
		entry_order_map = if p214 == nil or p214.entry_order_map == nil then {} else p214.entry_order_map,
		content_pools = if p214 == nil or p214.content_pools == nil then {} else p214.content_pools
	}, t_107)
end

function t_107:encode() --[[ line: 22126 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4062 = 0
	
	if self.entry_map ~= nil and next(self.entry_map) ~= nil then
		for i, v in self.entry_map do
			local var4063, var4064 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4063, var4064 = protoModule.writeString(var4063, var4064, i)
			local var4065 = v:encode()
			var4064, var4066 = protoModule.writeTag(var4063, var4064, 2, protoModule.wireTypes.lengthDelimited)
			var4064, var4066 = protoModule.writeBuffer(var4064, var4066, var4065, buffer.len(var4065))
			local var4067 = var4064
			local var4068 = var4066
			local var4069, var4070 = protoModule.writeTag(buff, var4062, 1, protoModule.wireTypes.lengthDelimited)
			var4069, var4070 = protoModule.writeBuffer(var4069, var4070, var4067, var4068)
			buff = var4069
			var4062 = var4070
		end
	end
	if self.entry_order ~= nil and #self.entry_order > 0 then
		for i, v in self.entry_order do
			local var4071, var4072 = protoModule.writeTag(buff, var4062, 2, protoModule.wireTypes.lengthDelimited)
			var4071, var4072 = protoModule.writeString(var4071, var4072, v)
			buff = var4071
			var4062 = var4072
		end
	end
	if self.entry_order_map ~= nil and next(self.entry_order_map) ~= nil then
		for i, v in self.entry_order_map do
			local var4073, var4074 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4073, var4074 = protoModule.writeString(var4073, var4074, i)
			local var4075 = v:encode()
			var4074, var4076 = protoModule.writeTag(var4073, var4074, 2, protoModule.wireTypes.lengthDelimited)
			var4074, var4076 = protoModule.writeBuffer(var4074, var4076, var4075, buffer.len(var4075))
			local var4077 = var4074
			local var4078 = var4076
			local var4079, var4080 = protoModule.writeTag(buff, var4062, 3, protoModule.wireTypes.lengthDelimited)
			var4079, var4080 = protoModule.writeBuffer(var4079, var4080, var4077, var4078)
			buff = var4079
			var4062 = var4080
		end
	end
	if self.content_pools ~= nil and next(self.content_pools) ~= nil then
		for i, v in self.content_pools do
			local var4081, var4082 = protoModule.writeTag(buffer.create(0), 0, 1, protoModule.wireTypes.lengthDelimited)
			var4081, var4082 = protoModule.writeString(var4081, var4082, i)
			local var4083 = v:encode()
			var4082, var4084 = protoModule.writeTag(var4081, var4082, 2, protoModule.wireTypes.lengthDelimited)
			var4082, var4084 = protoModule.writeBuffer(var4082, var4084, var4083, buffer.len(var4083))
			local var4085 = var4082
			local var4086 = var4084
			local var4087, var4088 = protoModule.writeTag(buff, var4062, 4, protoModule.wireTypes.lengthDelimited)
			var4087, var4088 = protoModule.writeBuffer(var4087, var4088, var4085, var4086)
			buff = var4087
			var4062 = var4088
		end
	end
	local buff_1 = buffer.create(var4062)
	buffer.copy(buff_1, 0, buff, 0, var4062)
	
	return buff_1
end

function t_107.decode(p215) --[[ line: 22184 ]]
	-- upvalues: t_107 (ref), protoModule (ref), t (ref)
	local var4090 = t_107.new()
	local var4091 = 0
	while var4091 < buffer.len(p215) do
		local _ = nil
		local var4092 = nil
		local var4093, var4094, var4095 = protoModule.readTag(p215, var4091)
		local var4096 = var4093
		var4092 = var4094
		var4091 = var4095
		
		if var4092 == protoModule.wireTypes.varint then
			local _ = nil
			local var4097, var4098 = protoModule.readVarInt(p215, var4091)
			local _ = var4097
			var4091 = var4098
			continue
		end
		if var4092 == protoModule.wireTypes.lengthDelimited then
			if var4096 == 1 then
				local _ = nil
				local var4099, var4100 = protoModule.readBuffer(p215, var4091)
				var4091 = var4100
				var4099 = t.VerticalFeedInputData_EntryMapEntry.decode(var4099)
				var4090.entry_map[var4099.key or ""] = var4099.value or t.FeedEntry.new()
			elseif var4096 == 2 then
				local _ = nil
				local var4101, var4102 = protoModule.readBuffer(p215, var4091)
				var4091 = var4102
				table.insert(var4090.entry_order, buffer.tostring(var4101))
			elseif var4096 == 3 then
				local _ = nil
				local var4103, var4104 = protoModule.readBuffer(p215, var4091)
				var4091 = var4104
				var4103 = t.VerticalFeedInputData_EntryOrderMapEntry.decode(var4103)
				var4090.entry_order_map[var4103.key or ""] = var4103.value or t.EntryOrder.new()
			elseif var4096 == 4 then
				local _ = nil
				local var4105, var4106 = protoModule.readBuffer(p215, var4091)
				var4091 = var4106
				var4105 = t.VerticalFeedInputData_ContentPoolsEntry.decode(var4105)
				var4090.content_pools[var4105.key or ""] = var4105.value or t.ContentPool.new()
			else
				local _ = nil
				local var4107, var4108 = protoModule.readVarInt(p215, var4091)
				var4091 = var4108 + var4107
			end
		elseif var4092 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4109, var4110 = protoModule.readFixed32(p215, var4091)
			local _ = var4109
			var4091 = var4110
		elseif var4092 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4111, var4112 = protoModule.readFixed64(p215, var4091)
			local _ = var4111
			var4091 = var4112
		else
			error("Unsupported wire type: " .. var4092)
		end
	end
	return var4090
end

function t_107:jsonEncode() --[[ line: 22263 ]]
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

function t_107:jsonDecode() --[[ line: 22301 ]]
	-- upvalues: t_107 (ref), t (ref)
	local var4118 = t_107.new()
	
	if self.entry_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_map do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4118.entry_map = t_1
	end
	if self.entryMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryMap do
			t_1[i] = t.FeedEntry.jsonDecode(v)
		end
		var4118.entry_map = t_1
	end
	if self.entry_order ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order do
			table.insert(t_1, v)
		end
		var4118.entry_order = t_1
	end
	if self.entryOrder ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrder do
			table.insert(t_1, v)
		end
		var4118.entry_order = t_1
	end
	if self.entry_order_map ~= nil then
		local t_1 = {}
		
		for i, v in self.entry_order_map do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4118.entry_order_map = t_1
	end
	if self.entryOrderMap ~= nil then
		local t_1 = {}
		
		for i, v in self.entryOrderMap do
			t_1[i] = t.EntryOrder.jsonDecode(v)
		end
		var4118.entry_order_map = t_1
	end
	if self.content_pools ~= nil then
		local t_1 = {}
		
		for i, v in self.content_pools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4118.content_pools = t_1
	end
	if self.contentPools ~= nil then
		local t_1 = {}
		
		for i, v in self.contentPools do
			t_1[i] = t.ContentPool.jsonDecode(v)
		end
		var4118.content_pools = t_1
	end
	return var4118
end

t_107.descriptor = {
	name = "VerticalFeedInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.VerticalFeedInputData"
}
t.VerticalFeedInputData = t_107
typeRegistryModule.default:register(t.VerticalFeedInputData)
local t_108 = {}
t_108.__index = t_108

function t_108.new(p216) --[[ line: 22393 ]]
	-- upvalues: t_108 (ref)
	return setmetatable({
		key = if p216 == nil or p216.key == nil then "" else p216.key,
		value = if p216 == nil or p216.value == nil then nil else p216.value
	}, t_108)
end

function t_108:encode() --[[ line: 22402 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4128 = 0
	
	if self.key ~= nil and self.key ~= "" then
		local var4129, var4130 = protoModule.writeTag(buff, var4128, 1, protoModule.wireTypes.lengthDelimited)
		var4129, var4130 = protoModule.writeString(var4129, var4130, self.key)
		buff = var4129
		var4128 = var4130
	end
	if self.value ~= nil then
		local var4131 = self.value:encode()
		local var4132, var4133 = protoModule.writeTag(buff, var4128, 2, protoModule.wireTypes.lengthDelimited)
		var4132, var4133 = protoModule.writeBuffer(var4132, var4133, var4131, buffer.len(var4131))
		buff = var4132
		var4128 = var4133
	end
	local buff_1 = buffer.create(var4128)
	buffer.copy(buff_1, 0, buff, 0, var4128)
	
	return buff_1
end

function t_108.decode(p217) --[[ line: 22422 ]]
	-- upvalues: t_108 (ref), protoModule (ref), t (ref)
	local var4135 = t_108.new()
	local var4136 = 0
	while var4136 < buffer.len(p217) do
		local _ = nil
		local var4137 = nil
		local var4138, var4139, var4140 = protoModule.readTag(p217, var4136)
		local var4141 = var4138
		var4137 = var4139
		var4136 = var4140
		
		if var4137 == protoModule.wireTypes.varint then
			local _ = nil
			local var4142, var4143 = protoModule.readVarInt(p217, var4136)
			local _ = var4142
			var4136 = var4143
			continue
		end
		if var4137 == protoModule.wireTypes.lengthDelimited then
			if var4141 == 1 then
				local _ = nil
				local var4144, var4145 = protoModule.readBuffer(p217, var4136)
				var4136 = var4145
				var4135.key = buffer.tostring(var4144)
			elseif var4141 == 2 then
				local _ = nil
				local var4146, var4147 = protoModule.readBuffer(p217, var4136)
				var4136 = var4147
				var4135.value = t.FeedEntry.decode(var4146)
			else
				local _ = nil
				local var4148, var4149 = protoModule.readVarInt(p217, var4136)
				var4136 = var4149 + var4148
			end
		elseif var4137 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4150, var4151 = protoModule.readFixed32(p217, var4136)
			local _ = var4150
			var4136 = var4151
		elseif var4137 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4152, var4153 = protoModule.readFixed64(p217, var4136)
			local _ = var4152
			var4136 = var4153
		else
			error("Unsupported wire type: " .. var4137)
		end
	end
	return var4135
end

function t_108:jsonEncode() --[[ line: 22470 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_108:jsonDecode() --[[ line: 22484 ]]
	-- upvalues: t_108 (ref), t (ref)
	local var4155 = t_108.new()
	
	if self.key ~= nil then
		var4155.key = self.key
	end
	if self.value ~= nil then
		var4155.value = t.FeedEntry.jsonDecode(self.value)
	end
	return var4155
end

t_108.descriptor = {
	name = "VerticalFeedInputData_EntryMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryMapEntry"
}
t.VerticalFeedInputData_EntryMapEntry = t_108
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryMapEntry)
local t_109 = {}
t_109.__index = t_109

function t_109.new(p218) --[[ line: 22514 ]]
	-- upvalues: t_109 (ref)
	return setmetatable({
		key = if p218 == nil or p218.key == nil then "" else p218.key,
		value = if p218 == nil or p218.value == nil then nil else p218.value
	}, t_109)
end

function t_109:encode() --[[ line: 22523 ]]
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

function t_109.decode(p219) --[[ line: 22545 ]]
	-- upvalues: t_109 (ref), protoModule (ref), t (ref)
	local var4164 = t_109.new()
	local var4165 = 0
	while var4165 < buffer.len(p219) do
		local _ = nil
		local var4166 = nil
		local var4167, var4168, var4169 = protoModule.readTag(p219, var4165)
		local var4170 = var4167
		var4166 = var4168
		var4165 = var4169
		
		if var4166 == protoModule.wireTypes.varint then
			local _ = nil
			local var4171, var4172 = protoModule.readVarInt(p219, var4165)
			local _ = var4171
			var4165 = var4172
			continue
		end
		if var4166 == protoModule.wireTypes.lengthDelimited then
			if var4170 == 1 then
				local _ = nil
				local var4173, var4174 = protoModule.readBuffer(p219, var4165)
				var4165 = var4174
				var4164.key = buffer.tostring(var4173)
			elseif var4170 == 2 then
				local _ = nil
				local var4175, var4176 = protoModule.readBuffer(p219, var4165)
				var4165 = var4176
				var4164.value = t.EntryOrder.decode(var4175)
			else
				local _ = nil
				local var4177, var4178 = protoModule.readVarInt(p219, var4165)
				var4165 = var4178 + var4177
			end
		elseif var4166 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4179, var4180 = protoModule.readFixed32(p219, var4165)
			local _ = var4179
			var4165 = var4180
		elseif var4166 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4181, var4182 = protoModule.readFixed64(p219, var4165)
			local _ = var4181
			var4165 = var4182
		else
			error("Unsupported wire type: " .. var4166)
		end
	end
	return var4164
end

function t_109:jsonEncode() --[[ line: 22595 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_109:jsonDecode() --[[ line: 22611 ]]
	-- upvalues: t_109 (ref), t (ref)
	local var4184 = t_109.new()
	
	if self.key ~= nil then
		var4184.key = self.key
	end
	if self.value ~= nil then
		var4184.value = t.EntryOrder.jsonDecode(self.value)
	end
	return var4184
end

t_109.descriptor = {
	name = "VerticalFeedInputData_EntryOrderMapEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.EntryOrderMapEntry"
}
t.VerticalFeedInputData_EntryOrderMapEntry = t_109
typeRegistryModule.default:register(t.VerticalFeedInputData_EntryOrderMapEntry)
local t_110 = {}
t_110.__index = t_110

function t_110.new(p220) --[[ line: 22641 ]]
	-- upvalues: t_110 (ref)
	return setmetatable({
		key = if p220 == nil or p220.key == nil then "" else p220.key,
		value = if p220 == nil or p220.value == nil then nil else p220.value
	}, t_110)
end

function t_110:encode() --[[ line: 22650 ]]
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

function t_110.decode(p221) --[[ line: 22670 ]]
	-- upvalues: t_110 (ref), protoModule (ref), t (ref)
	local var4193 = t_110.new()
	local var4194 = 0
	while var4194 < buffer.len(p221) do
		local _ = nil
		local var4195 = nil
		local var4196, var4197, var4198 = protoModule.readTag(p221, var4194)
		local var4199 = var4196
		var4195 = var4197
		var4194 = var4198
		
		if var4195 == protoModule.wireTypes.varint then
			local _ = nil
			local var4200, var4201 = protoModule.readVarInt(p221, var4194)
			local _ = var4200
			var4194 = var4201
			continue
		end
		if var4195 == protoModule.wireTypes.lengthDelimited then
			if var4199 == 1 then
				local _ = nil
				local var4202, var4203 = protoModule.readBuffer(p221, var4194)
				var4194 = var4203
				var4193.key = buffer.tostring(var4202)
			elseif var4199 == 2 then
				local _ = nil
				local var4204, var4205 = protoModule.readBuffer(p221, var4194)
				var4194 = var4205
				var4193.value = t.ContentPool.decode(var4204)
			else
				local _ = nil
				local var4206, var4207 = protoModule.readVarInt(p221, var4194)
				var4194 = var4207 + var4206
			end
		elseif var4195 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4208, var4209 = protoModule.readFixed32(p221, var4194)
			local _ = var4208
			var4194 = var4209
		elseif var4195 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4210, var4211 = protoModule.readFixed64(p221, var4194)
			local _ = var4210
			var4194 = var4211
		else
			error("Unsupported wire type: " .. var4195)
		end
	end
	return var4193
end

function t_110:jsonEncode() --[[ line: 22718 ]]
	local t = {}
	
	if self.key ~= nil and self.key ~= "" then
		t.key = self.key
	end
	if self.value ~= nil then
		t.value = self.value:jsonEncode()
	end
	return t
end

function t_110:jsonDecode() --[[ line: 22732 ]]
	-- upvalues: t_110 (ref), t (ref)
	local var4213 = t_110.new()
	
	if self.key ~= nil then
		var4213.key = self.key
	end
	if self.value ~= nil then
		var4213.value = t.ContentPool.jsonDecode(self.value)
	end
	return var4213
end

t_110.descriptor = {
	name = "VerticalFeedInputData_ContentPoolsEntry",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPoolsEntry"
}
t.VerticalFeedInputData_ContentPoolsEntry = t_110
typeRegistryModule.default:register(t.VerticalFeedInputData_ContentPoolsEntry)
local t_111 = {}
t_111.__index = t_111

function t_111.new(p222) --[[ line: 22762 ]]
	-- upvalues: t_111 (ref)
	return setmetatable({
		foreground_header_entry = if p222 == nil or p222.foreground_header_entry == nil then nil else p222.foreground_header_entry,
		background_header_entry = if p222 == nil or p222.background_header_entry == nil then nil else p222.background_header_entry
	}, t_111)
end

function t_111:encode() --[[ line: 22773 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4215 = 0
	
	if self.foreground_header_entry ~= nil then
		local var4216 = self.foreground_header_entry:encode()
		local var4217, var4218 = protoModule.writeTag(buff, var4215, 1, protoModule.wireTypes.lengthDelimited)
		var4217, var4218 = protoModule.writeBuffer(var4217, var4218, var4216, buffer.len(var4216))
		buff = var4217
		var4215 = var4218
	end
	if self.background_header_entry ~= nil then
		local var4219 = self.background_header_entry:encode()
		local var4220, var4221 = protoModule.writeTag(buff, var4215, 2, protoModule.wireTypes.lengthDelimited)
		var4220, var4221 = protoModule.writeBuffer(var4220, var4221, var4219, buffer.len(var4219))
		buff = var4220
		var4215 = var4221
	end
	local buff_1 = buffer.create(var4215)
	buffer.copy(buff_1, 0, buff, 0, var4215)
	
	return buff_1
end

function t_111.decode(p223) --[[ line: 22794 ]]
	-- upvalues: t_111 (ref), protoModule (ref), t (ref)
	local var4223 = t_111.new()
	local var4224 = 0
	while var4224 < buffer.len(p223) do
		local _ = nil
		local var4225 = nil
		local var4226, var4227, var4228 = protoModule.readTag(p223, var4224)
		local var4229 = var4226
		var4225 = var4227
		var4224 = var4228
		
		if var4225 == protoModule.wireTypes.varint then
			local _ = nil
			local var4230, var4231 = protoModule.readVarInt(p223, var4224)
			local _ = var4230
			var4224 = var4231
			continue
		end
		if var4225 == protoModule.wireTypes.lengthDelimited then
			if var4229 == 1 then
				local _ = nil
				local var4232, var4233 = protoModule.readBuffer(p223, var4224)
				var4224 = var4233
				var4223.foreground_header_entry = t.ForegroundHeaderEntry.decode(var4232)
			elseif var4229 == 2 then
				local _ = nil
				local var4234, var4235 = protoModule.readBuffer(p223, var4224)
				var4224 = var4235
				var4223.background_header_entry = t.BackgroundHeaderEntry.decode(var4234)
			else
				local _ = nil
				local var4236, var4237 = protoModule.readVarInt(p223, var4224)
				var4224 = var4237 + var4236
			end
		elseif var4225 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4238, var4239 = protoModule.readFixed32(p223, var4224)
			local _ = var4238
			var4224 = var4239
		elseif var4225 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4240, var4241 = protoModule.readFixed64(p223, var4224)
			local _ = var4240
			var4224 = var4241
		else
			error("Unsupported wire type: " .. var4225)
		end
	end
	return var4223
end

function t_111:jsonEncode() --[[ line: 22842 ]]
	local t = {}
	
	if self.foreground_header_entry ~= nil then
		t.foregroundHeaderEntry = self.foreground_header_entry:jsonEncode()
	end
	if self.background_header_entry ~= nil then
		t.backgroundHeaderEntry = self.background_header_entry:jsonEncode()
	end
	return t
end

function t_111:jsonDecode() --[[ line: 22856 ]]
	-- upvalues: t_111 (ref), t (ref)
	local var4243 = t_111.new()
	
	if self.foreground_header_entry ~= nil then
		var4243.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foreground_header_entry)
	end
	if self.foregroundHeaderEntry ~= nil then
		var4243.foreground_header_entry = t.ForegroundHeaderEntry.jsonDecode(self.foregroundHeaderEntry)
	end
	if self.background_header_entry ~= nil then
		var4243.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.background_header_entry)
	end
	if self.backgroundHeaderEntry ~= nil then
		var4243.background_header_entry = t.BackgroundHeaderEntry.jsonDecode(self.backgroundHeaderEntry)
	end
	return var4243
end

t_111.descriptor = {
	name = "PageHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PageHeaderInputData"
}
t.PageHeaderInputData = t_111
typeRegistryModule.default:register(t.PageHeaderInputData)
local t_112 = {}
t_112.__index = t_112

function t_112.new(p224) --[[ line: 22892 ]]
	-- upvalues: t_112 (ref)
	return setmetatable({
		cta_button_text = if p224 == nil or p224.cta_button_text == nil then "" else p224.cta_button_text
	}, t_112)
end

function t_112:encode() --[[ line: 22900 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4245 = 0
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		local var4246, var4247 = protoModule.writeTag(buff, var4245, 1, protoModule.wireTypes.lengthDelimited)
		var4246, var4247 = protoModule.writeString(var4246, var4247, self.cta_button_text)
		buff = var4246
		var4245 = var4247
	end
	local buff_1 = buffer.create(var4245)
	buffer.copy(buff_1, 0, buff, 0, var4245)
	
	return buff_1
end

function t_112.decode(p225) --[[ line: 22914 ]]
	-- upvalues: t_112 (ref), protoModule (ref)
	local var4249 = t_112.new()
	local var4250 = 0
	while var4250 < buffer.len(p225) do
		local _ = nil
		local var4251 = nil
		local var4252, var4253, var4254 = protoModule.readTag(p225, var4250)
		local var4255 = var4252
		var4251 = var4253
		var4250 = var4254
		
		if var4251 == protoModule.wireTypes.varint then
			local _ = nil
			local var4256, var4257 = protoModule.readVarInt(p225, var4250)
			local _ = var4256
			var4250 = var4257
			continue
		end
		if var4251 == protoModule.wireTypes.lengthDelimited then
			if var4255 == 1 then
				local _ = nil
				local var4258, var4259 = protoModule.readBuffer(p225, var4250)
				var4250 = var4259
				var4249.cta_button_text = buffer.tostring(var4258)
			else
				local _ = nil
				local var4260, var4261 = protoModule.readVarInt(p225, var4250)
				var4250 = var4261 + var4260
			end
		elseif var4251 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4262, var4263 = protoModule.readFixed32(p225, var4250)
			local _ = var4262
			var4250 = var4263
		elseif var4251 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4264, var4265 = protoModule.readFixed64(p225, var4250)
			local _ = var4264
			var4250 = var4265
		else
			error("Unsupported wire type: " .. var4251)
		end
	end
	return var4249
end

function t_112:jsonEncode() --[[ line: 22957 ]]
	local t = {}
	
	if self.cta_button_text ~= nil and self.cta_button_text ~= "" then
		t.ctaButtonText = self.cta_button_text
	end
	return t
end

function t_112:jsonDecode() --[[ line: 22967 ]]
	-- upvalues: t_112 (ref)
	local var4267 = t_112.new()
	
	if self.cta_button_text ~= nil then
		var4267.cta_button_text = self.cta_button_text
	end
	if self.ctaButtonText ~= nil then
		var4267.cta_button_text = self.ctaButtonText
	end
	return var4267
end

t_112.descriptor = {
	name = "PreAuthLandingStickyHeaderInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.PreAuthLandingStickyHeaderInputData"
}
t.PreAuthLandingStickyHeaderInputData = t_112
typeRegistryModule.default:register(t.PreAuthLandingStickyHeaderInputData)
local t_113 = {}
t_113.__index = t_113

function t_113.new(p226) --[[ line: 22997 ]]
	-- upvalues: t_113 (ref)
	return setmetatable({
		selected_option = if p226 == nil or p226.selected_option == nil then "" else p226.selected_option,
		sort_id = if p226 == nil or p226.sort_id == nil then "" else p226.sort_id,
		options = if p226 == nil or p226.options == nil then {} else p226.options,
		experience_carousel = if p226 == nil or p226.experience_carousel == nil then nil else p226.experience_carousel,
		feed_item_key = if p226 == nil or p226.feed_item_key == nil then "" else p226.feed_item_key
	}, t_113)
end

function t_113:encode() --[[ line: 23011 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4269 = 0
	
	if self.selected_option ~= nil and self.selected_option ~= "" then
		local var4270, var4271 = protoModule.writeTag(buff, var4269, 1, protoModule.wireTypes.lengthDelimited)
		var4270, var4271 = protoModule.writeString(var4270, var4271, self.selected_option)
		buff = var4270
		var4269 = var4271
	end
	if self.sort_id ~= nil and self.sort_id ~= "" then
		local var4272, var4273 = protoModule.writeTag(buff, var4269, 2, protoModule.wireTypes.lengthDelimited)
		var4272, var4273 = protoModule.writeString(var4272, var4273, self.sort_id)
		buff = var4272
		var4269 = var4273
	end
	if self.options ~= nil and #self.options > 0 then
		for i, v in self.options do
			local var4274 = v:encode()
			local var4275, var4276 = protoModule.writeTag(buff, var4269, 3, protoModule.wireTypes.lengthDelimited)
			var4275, var4276 = protoModule.writeBuffer(var4275, var4276, var4274, buffer.len(var4274))
			buff = var4275
			var4269 = var4276
		end
	end
	if self.experience_carousel ~= nil then
		local var4277 = self.experience_carousel:encode()
		local var4278, var4279 = protoModule.writeTag(buff, var4269, 4, protoModule.wireTypes.lengthDelimited)
		var4278, var4279 = protoModule.writeBuffer(var4278, var4279, var4277, buffer.len(var4277))
		buff = var4278
		var4269 = var4279
	end
	if self.feed_item_key ~= nil and self.feed_item_key ~= "" then
		local var4280, var4281 = protoModule.writeTag(buff, var4269, 5, protoModule.wireTypes.lengthDelimited)
		var4280, var4281 = protoModule.writeString(var4280, var4281, self.feed_item_key)
		buff = var4280
		var4269 = var4281
	end
	local buff_1 = buffer.create(var4269)
	buffer.copy(buff_1, 0, buff, 0, var4269)
	
	return buff_1
end

function t_113.decode(p227) --[[ line: 23049 ]]
	-- upvalues: t_113 (ref), protoModule (ref), t (ref)
	local var4283 = t_113.new()
	local var4284 = 0
	while var4284 < buffer.len(p227) do
		local _ = nil
		local var4285 = nil
		local var4286, var4287, var4288 = protoModule.readTag(p227, var4284)
		local var4289 = var4286
		var4285 = var4287
		var4284 = var4288
		
		if var4285 == protoModule.wireTypes.varint then
			local _ = nil
			local var4290, var4291 = protoModule.readVarInt(p227, var4284)
			local _ = var4290
			var4284 = var4291
			continue
		end
		if var4285 == protoModule.wireTypes.lengthDelimited then
			if var4289 == 1 then
				local _ = nil
				local var4292, var4293 = protoModule.readBuffer(p227, var4284)
				var4284 = var4293
				var4283.selected_option = buffer.tostring(var4292)
			elseif var4289 == 2 then
				local _ = nil
				local var4294, var4295 = protoModule.readBuffer(p227, var4284)
				var4284 = var4295
				var4283.sort_id = buffer.tostring(var4294)
			elseif var4289 == 3 then
				local _ = nil
				local var4296, var4297 = protoModule.readBuffer(p227, var4284)
				var4284 = var4297
				table.insert(var4283.options, t.SelectorOption.decode(var4296))
			elseif var4289 == 4 then
				local _ = nil
				local var4298, var4299 = protoModule.readBuffer(p227, var4284)
				var4284 = var4299
				var4283.experience_carousel = t.ExperienceCarouselInputData.decode(var4298)
			elseif var4289 == 5 then
				local _ = nil
				local var4300, var4301 = protoModule.readBuffer(p227, var4284)
				var4284 = var4301
				var4283.feed_item_key = buffer.tostring(var4300)
			else
				local _ = nil
				local var4302, var4303 = protoModule.readVarInt(p227, var4284)
				var4284 = var4303 + var4302
			end
		elseif var4285 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4304, var4305 = protoModule.readFixed32(p227, var4284)
			local _ = var4304
			var4284 = var4305
		elseif var4285 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4306, var4307 = protoModule.readFixed64(p227, var4284)
			local _ = var4306
			var4284 = var4307
		else
			error("Unsupported wire type: " .. var4285)
		end
	end
	return var4283
end

function t_113:jsonEncode() --[[ line: 23112 ]]
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

function t_113:jsonDecode() --[[ line: 23142 ]]
	-- upvalues: t_113 (ref), t (ref)
	local var4310 = t_113.new()
	
	if self.selected_option ~= nil then
		var4310.selected_option = self.selected_option
	end
	if self.selectedOption ~= nil then
		var4310.selected_option = self.selectedOption
	end
	if self.sort_id ~= nil then
		var4310.sort_id = self.sort_id
	end
	if self.sortId ~= nil then
		var4310.sort_id = self.sortId
	end
	if self.options ~= nil then
		local t_1 = {}
		
		for i, v in self.options do
			table.insert(t_1, t.SelectorOption.jsonDecode(v))
		end
		var4310.options = t_1
	end
	if self.experience_carousel ~= nil then
		var4310.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experience_carousel)
	end
	if self.experienceCarousel ~= nil then
		var4310.experience_carousel = t.ExperienceCarouselInputData.jsonDecode(self.experienceCarousel)
	end
	if self.feed_item_key ~= nil then
		var4310.feed_item_key = self.feed_item_key
	end
	if self.feedItemKey ~= nil then
		var4310.feed_item_key = self.feedItemKey
	end
	return var4310
end

t_113.descriptor = {
	name = "OptionSelectorCarouselInputData",
	fullName = "roblox.apppageplatform.shared.v1beta1.OptionSelectorCarouselInputData"
}
t.OptionSelectorCarouselInputData = t_113
typeRegistryModule.default:register(t.OptionSelectorCarouselInputData)
local t_114 = {}
t_114.__index = t_114

function t_114.new(p228) --[[ line: 23203 ]]
	-- upvalues: t_114 (ref)
	return setmetatable({
		id = if p228 == nil or p228.id == nil then "" else p228.id,
		display_name = if p228 == nil or p228.display_name == nil then "" else p228.display_name,
		is_selected = if p228 == nil or p228.is_selected == nil then false else p228.is_selected
	}, t_114)
end

function t_114:encode() --[[ line: 23211 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4313 = 0
	
	if self.id ~= nil and self.id ~= "" then
		local var4314, var4315 = protoModule.writeTag(buff, var4313, 1, protoModule.wireTypes.lengthDelimited)
		var4314, var4315 = protoModule.writeString(var4314, var4315, self.id)
		buff = var4314
		var4313 = var4315
	end
	if self.display_name ~= nil and self.display_name ~= "" then
		local var4316, var4317 = protoModule.writeTag(buff, var4313, 2, protoModule.wireTypes.lengthDelimited)
		var4316, var4317 = protoModule.writeString(var4316, var4317, self.display_name)
		buff = var4316
		var4313 = var4317
	end
	if self.is_selected then
		local var4318, var4319 = protoModule.writeTag(buff, var4313, 3, protoModule.wireTypes.varint)
		var4318, var4319 = protoModule.writeVarInt(var4318, var4319, if self.is_selected then 1 else 0)
		buff = var4318
		var4313 = var4319
	end
	local buff_1 = buffer.create(var4313)
	buffer.copy(buff_1, 0, buff, 0, var4313)
	
	return buff_1
end

function t_114.decode(p229) --[[ line: 23235 ]]
	-- upvalues: t_114 (ref), protoModule (ref)
	local var4321 = t_114.new()
	local var4322 = 0
	while var4322 < buffer.len(p229) do
		local _ = nil
		local var4323 = nil
		local var4324, var4325, var4326 = protoModule.readTag(p229, var4322)
		local var4327 = var4324
		var4323 = var4325
		var4322 = var4326
		
		if var4323 == protoModule.wireTypes.varint then
			if var4327 == 3 then
				local _ = nil
				local var4328, var4329 = protoModule.readVarInt(p229, var4322)
				var4322 = var4329
				var4321.is_selected = var4328 ~= 0
			else
				local _ = nil
				local var4330, var4331 = protoModule.readVarInt(p229, var4322)
				local _ = var4330
				var4322 = var4331
			end
		end
		if var4323 == protoModule.wireTypes.lengthDelimited then
			if var4327 == 1 then
				local _ = nil
				local var4332, var4333 = protoModule.readBuffer(p229, var4322)
				var4322 = var4333
				var4321.id = buffer.tostring(var4332)
			elseif var4327 == 2 then
				local _ = nil
				local var4334, var4335 = protoModule.readBuffer(p229, var4322)
				var4322 = var4335
				var4321.display_name = buffer.tostring(var4334)
			else
				local _ = nil
				local var4336, var4337 = protoModule.readVarInt(p229, var4322)
				var4322 = var4337 + var4336
			end
		elseif var4323 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4338, var4339 = protoModule.readFixed32(p229, var4322)
			local _ = var4338
			var4322 = var4339
		elseif var4323 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4340, var4341 = protoModule.readFixed64(p229, var4322)
			local _ = var4340
			var4322 = var4341
		else
			error("Unsupported wire type: " .. var4323)
		end
	end
	return var4321
end

function t_114:jsonEncode() --[[ line: 23288 ]]
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

function t_114:jsonDecode() --[[ line: 23306 ]]
	-- upvalues: t_114 (ref)
	local var4343 = t_114.new()
	
	if self.id ~= nil then
		var4343.id = self.id
	end
	if self.display_name ~= nil then
		var4343.display_name = self.display_name
	end
	if self.displayName ~= nil then
		var4343.display_name = self.displayName
	end
	if self.is_selected ~= nil then
		var4343.is_selected = self.is_selected
	end
	if self.isSelected ~= nil then
		var4343.is_selected = self.isSelected
	end
	return var4343
end

t_114.descriptor = {
	name = "SelectorOption",
	fullName = "roblox.apppageplatform.shared.v1beta1.SelectorOption"
}
t.SelectorOption = t_114
typeRegistryModule.default:register(t.SelectorOption)
local t_115 = {}
t_115.__index = t_115

function t_115.new(p230) --[[ line: 23346 ]]
	-- upvalues: t_115 (ref)
	return setmetatable({
		layout = if p230 == nil or p230.layout == nil then nil else p230.layout,
		kind = if p230 == nil or p230.kind == nil then nil else p230.kind
	}, t_115)
end

function t_115:encode() --[[ line: 23353 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4345 = 0
	
	if self.layout ~= nil then
		local var4346 = self.layout:encode()
		local var4347, var4348 = protoModule.writeTag(buff, var4345, 1, protoModule.wireTypes.lengthDelimited)
		var4347, var4348 = protoModule.writeBuffer(var4347, var4348, var4346, buffer.len(var4346))
		buff = var4347
		var4345 = var4348
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		local var4349 = self.kind.value:encode()
		local var4350, var4351 = protoModule.writeTag(buff, var4345, 2, protoModule.wireTypes.lengthDelimited)
		var4350, var4351 = protoModule.writeBuffer(var4350, var4351, var4349, buffer.len(var4349))
		buff = var4350
		var4345 = var4351
	end
	local buff_1 = buffer.create(var4345)
	buffer.copy(buff_1, 0, buff, 0, var4345)
	
	return buff_1
end

function t_115.decode(p231) --[[ line: 23376 ]]
	-- upvalues: t_115 (ref), protoModule (ref), t (ref)
	local var4353 = t_115.new()
	local var4354 = 0
	while var4354 < buffer.len(p231) do
		local _ = nil
		local var4355 = nil
		local var4356, var4357, var4358 = protoModule.readTag(p231, var4354)
		local var4359 = var4356
		var4355 = var4357
		var4354 = var4358
		
		if var4355 == protoModule.wireTypes.varint then
			local _ = nil
			local var4360, var4361 = protoModule.readVarInt(p231, var4354)
			local _ = var4360
			var4354 = var4361
			continue
		end
		if var4355 == protoModule.wireTypes.lengthDelimited then
			if var4359 == 1 then
				local _ = nil
				local var4362, var4363 = protoModule.readBuffer(p231, var4354)
				var4354 = var4363
				var4353.layout = t.ItemLayout.decode(var4362)
			elseif var4359 == 2 then
				local _ = nil
				local var4364, var4365 = protoModule.readBuffer(p231, var4354)
				var4354 = var4365
				var4353.kind = {
					type = "universe",
					value = t.ExperienceCarouselInputData_UniverseItem.decode(var4364)
				}
			else
				local _ = nil
				local var4366, var4367 = protoModule.readVarInt(p231, var4354)
				var4354 = var4367 + var4366
			end
		elseif var4355 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4368, var4369 = protoModule.readFixed32(p231, var4354)
			local _ = var4368
			var4354 = var4369
		elseif var4355 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4370, var4371 = protoModule.readFixed64(p231, var4354)
			local _ = var4370
			var4354 = var4371
		else
			error("Unsupported wire type: " .. var4355)
		end
	end
	return var4353
end

function t_115:jsonEncode() --[[ line: 23425 ]]
	local t = {}
	
	if self.layout ~= nil then
		t.layout = self.layout:jsonEncode()
	end
	if self.kind ~= nil and self.kind.type == "universe" then
		t.universe = self.kind.value:jsonEncode()
	end
	return t
end

function t_115:jsonDecode() --[[ line: 23441 ]]
	-- upvalues: t_115 (ref), t (ref)
	local var4373 = t_115.new()
	
	if self.layout ~= nil then
		var4373.layout = t.ItemLayout.jsonDecode(self.layout)
	end
	if self.universe ~= nil then
		var4373.kind = {
			type = "universe",
			value = t.ExperienceCarouselInputData_UniverseItem.jsonDecode(self.universe)
		}
	end
	return var4373
end

t_115.descriptor = {
	name = "ItemWithLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemWithLayout"
}
t.ItemWithLayout = t_115
typeRegistryModule.default:register(t.ItemWithLayout)
local t_116 = {}
t_116.__index = t_116

function t_116.new(p232) --[[ line: 23472 ]]
	-- upvalues: t_116 (ref)
	return setmetatable({
		items = if p232 == nil or p232.items == nil then {} else p232.items,
		collection_item_size = if p232 == nil or p232.collection_item_size == nil then nil else p232.collection_item_size
	}, t_116)
end

function t_116:encode() --[[ line: 23481 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4375 = 0
	
	if self.items ~= nil and #self.items > 0 then
		for i, v in self.items do
			local var4376 = v:encode()
			local var4377, var4378 = protoModule.writeTag(buff, var4375, 1, protoModule.wireTypes.lengthDelimited)
			var4377, var4378 = protoModule.writeBuffer(var4377, var4378, var4376, buffer.len(var4376))
			buff = var4377
			var4375 = var4378
		end
	end
	if self.collection_item_size ~= nil then
		local var4379, var4380 = protoModule.writeTag(buff, var4375, 2, protoModule.wireTypes.lengthDelimited)
		var4379, var4380 = protoModule.writeString(var4379, var4380, self.collection_item_size)
		buff = var4379
		var4375 = var4380
	end
	local buff_1 = buffer.create(var4375)
	buffer.copy(buff_1, 0, buff, 0, var4375)
	
	return buff_1
end

function t_116.decode(p233) --[[ line: 23503 ]]
	-- upvalues: t_116 (ref), protoModule (ref), t (ref)
	local var4382 = t_116.new()
	local var4383 = 0
	while var4383 < buffer.len(p233) do
		local _ = nil
		local var4384 = nil
		local var4385, var4386, var4387 = protoModule.readTag(p233, var4383)
		local var4388 = var4385
		var4384 = var4386
		var4383 = var4387
		
		if var4384 == protoModule.wireTypes.varint then
			local _ = nil
			local var4389, var4390 = protoModule.readVarInt(p233, var4383)
			local _ = var4389
			var4383 = var4390
			continue
		end
		if var4384 == protoModule.wireTypes.lengthDelimited then
			if var4388 == 1 then
				local _ = nil
				local var4391, var4392 = protoModule.readBuffer(p233, var4383)
				var4383 = var4392
				table.insert(var4382.items, t.ItemWithLayout.decode(var4391))
			elseif var4388 == 2 then
				local _ = nil
				local var4393, var4394 = protoModule.readBuffer(p233, var4383)
				var4383 = var4394
				var4382.collection_item_size = buffer.tostring(var4393)
			else
				local _ = nil
				local var4395, var4396 = protoModule.readVarInt(p233, var4383)
				var4383 = var4396 + var4395
			end
		elseif var4384 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4397, var4398 = protoModule.readFixed32(p233, var4383)
			local _ = var4397
			var4383 = var4398
		elseif var4384 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4399, var4400 = protoModule.readFixed64(p233, var4383)
			local _ = var4399
			var4383 = var4400
		else
			error("Unsupported wire type: " .. var4384)
		end
	end
	return var4382
end

function t_116:jsonEncode() --[[ line: 23551 ]]
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

function t_116:jsonDecode() --[[ line: 23569 ]]
	-- upvalues: t_116 (ref), t (ref)
	local var4403 = t_116.new()
	
	if self.items ~= nil then
		local t_1 = {}
		
		for i, v in self.items do
			table.insert(t_1, t.ItemWithLayout.jsonDecode(v))
		end
		var4403.items = t_1
	end
	if self.collection_item_size ~= nil then
		var4403.collection_item_size = self.collection_item_size
	end
	if self.collectionItemSize ~= nil then
		var4403.collection_item_size = self.collectionItemSize
	end
	return var4403
end

t_116.descriptor = {
	name = "ContentPool",
	fullName = "roblox.apppageplatform.shared.v1beta1.ContentPool"
}
t.ContentPool = t_116
typeRegistryModule.default:register(t.ContentPool)
local t_117 = {}
t_117.__index = t_117

function t_117.new(p234) --[[ line: 23606 ]]
	-- upvalues: t_117 (ref)
	return setmetatable({
		col_span = if p234 == nil or p234.col_span == nil then 0 else p234.col_span,
		row_span = if p234 == nil or p234.row_span == nil then 0 else p234.row_span,
		alignment_type = if p234 == nil or p234.alignment_type == nil then "" else p234.alignment_type,
		min_row_padding = if p234 == nil or p234.min_row_padding == nil then 0 else p234.min_row_padding
	}, t_117)
end

function t_117:encode() --[[ line: 23615 ]]
	-- upvalues: protoModule (ref)
	local buff = buffer.create(0)
	local var4406 = 0
	
	if self.col_span ~= nil and self.col_span ~= 0 then
		local var4407, var4408 = protoModule.writeTag(buff, var4406, 1, protoModule.wireTypes.varint)
		var4407, var4408 = protoModule.writeVarInt(var4407, var4408, self.col_span)
		buff = var4407
		var4406 = var4408
	end
	if self.row_span ~= nil and self.row_span ~= 0 then
		local var4409, var4410 = protoModule.writeTag(buff, var4406, 2, protoModule.wireTypes.varint)
		var4409, var4410 = protoModule.writeVarInt(var4409, var4410, self.row_span)
		buff = var4409
		var4406 = var4410
	end
	if self.alignment_type ~= nil and self.alignment_type ~= "" then
		local var4411, var4412 = protoModule.writeTag(buff, var4406, 3, protoModule.wireTypes.lengthDelimited)
		var4411, var4412 = protoModule.writeString(var4411, var4412, self.alignment_type)
		buff = var4411
		var4406 = var4412
	end
	if self.min_row_padding ~= nil and self.min_row_padding ~= 0 then
		local var4413, var4414 = protoModule.writeTag(buff, var4406, 4, protoModule.wireTypes.varint)
		var4413, var4414 = protoModule.writeVarInt(var4413, var4414, self.min_row_padding)
		buff = var4413
		var4406 = var4414
	end
	local buff_1 = buffer.create(var4406)
	buffer.copy(buff_1, 0, buff, 0, var4406)
	
	return buff_1
end

function t_117.decode(p235) --[[ line: 23644 ]]
	-- upvalues: t_117 (ref), protoModule (ref)
	local var4416 = t_117.new()
	local var4417 = 0
	while var4417 < buffer.len(p235) do
		local _ = nil
		local var4418 = nil
		local var4419, var4420, var4421 = protoModule.readTag(p235, var4417)
		local var4422 = var4419
		var4418 = var4420
		var4417 = var4421
		
		if var4418 == protoModule.wireTypes.varint then
			if var4422 == 1 then
				local _ = nil
				local var4423, var4424 = protoModule.readVarIntI32(p235, var4417)
				var4417 = var4424
				var4416.col_span = var4423
			elseif var4422 == 2 then
				local _ = nil
				local var4425, var4426 = protoModule.readVarIntI32(p235, var4417)
				var4417 = var4426
				var4416.row_span = var4425
			elseif var4422 == 4 then
				local _ = nil
				local var4427, var4428 = protoModule.readVarIntI32(p235, var4417)
				var4417 = var4428
				var4416.min_row_padding = var4427
			else
				local _ = nil
				local var4429, var4430 = protoModule.readVarInt(p235, var4417)
				local _ = var4429
				var4417 = var4430
			end
		end
		if var4418 == protoModule.wireTypes.lengthDelimited then
			if var4422 == 3 then
				local _ = nil
				local var4431, var4432 = protoModule.readBuffer(p235, var4417)
				var4417 = var4432
				var4416.alignment_type = buffer.tostring(var4431)
			else
				local _ = nil
				local var4433, var4434 = protoModule.readVarInt(p235, var4417)
				var4417 = var4434 + var4433
			end
		elseif var4418 == protoModule.wireTypes.i32 then
			local _ = nil
			local var4435, var4436 = protoModule.readFixed32(p235, var4417)
			local _ = var4435
			var4417 = var4436
		elseif var4418 == protoModule.wireTypes.i64 then
			local _ = nil
			local var4437, var4438 = protoModule.readFixed64(p235, var4417)
			local _ = var4437
			var4417 = var4438
		else
			error("Unsupported wire type: " .. var4418)
		end
	end
	return var4416
end

function t_117:jsonEncode() --[[ line: 23702 ]]
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

function t_117:jsonDecode() --[[ line: 23724 ]]
	-- upvalues: t_117 (ref)
	local var4440 = t_117.new()
	
	if self.col_span ~= nil then
		var4440.col_span = self.col_span
	end
	if self.colSpan ~= nil then
		var4440.col_span = self.colSpan
	end
	if self.row_span ~= nil then
		var4440.row_span = self.row_span
	end
	if self.rowSpan ~= nil then
		var4440.row_span = self.rowSpan
	end
	if self.alignment_type ~= nil then
		var4440.alignment_type = self.alignment_type
	end
	if self.alignmentType ~= nil then
		var4440.alignment_type = self.alignmentType
	end
	if self.min_row_padding ~= nil then
		var4440.min_row_padding = self.min_row_padding
	end
	if self.minRowPadding ~= nil then
		var4440.min_row_padding = self.minRowPadding
	end
	return var4440
end

t_117.descriptor = {
	name = "ItemLayout",
	fullName = "roblox.apppageplatform.shared.v1beta1.ItemLayout"
}
t.ItemLayout = t_117
typeRegistryModule.default:register(t.ItemLayout)
t.PageEntryFormat = {
	fromNumber = function(p236) --[[ line: 23773 ]]
		return if p236 == 0 then "PAGE_ENTRY_FORMAT_INVALID" elseif p236 == 1 then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
	end,
	toNumber = function(p237) --[[ line: 23783 ]]
		return if p237 == "PAGE_ENTRY_FORMAT_INVALID" then 0 elseif p237 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then 1 else p237
	end,
	fromName = function(p238) --[[ line: 23793 ]]
		return if p238 == "PAGE_ENTRY_FORMAT_INVALID" then "PAGE_ENTRY_FORMAT_INVALID" elseif p238 == "PAGE_ENTRY_FORMAT_UNIVERSAL" then "PAGE_ENTRY_FORMAT_UNIVERSAL" else nil
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
	OptionSelectorCarouselInputData = t.OptionSelectorCarouselInputData,
	SelectorOption = t.SelectorOption,
	ItemWithLayout = t.ItemWithLayout,
	ContentPool = t.ContentPool,
	ItemLayout = t.ItemLayout,
	PageEntryFormat = t.PageEntryFormat
}